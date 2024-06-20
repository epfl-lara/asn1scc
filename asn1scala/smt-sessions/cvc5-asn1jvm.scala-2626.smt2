; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64828 () Bool)

(assert start!64828)

(declare-fun b!290959 () Bool)

(declare-fun e!207298 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17267 0))(
  ( (array!17268 (arr!8488 (Array (_ BitVec 32) (_ BitVec 8))) (size!7474 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12958 0))(
  ( (BitStream!12959 (buf!7540 array!17267) (currentByte!13965 (_ BitVec 32)) (currentBit!13960 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20213 0))(
  ( (Unit!20214) )
))
(declare-datatypes ((tuple3!1692 0))(
  ( (tuple3!1693 (_1!12688 Unit!20213) (_2!12688 BitStream!12958) (_3!1266 array!17267)) )
))
(declare-fun lt!422572 () tuple3!1692)

(assert (=> b!290959 (= e!207298 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7474 (_3!1266 lt!422572)))))))))

(declare-fun e!207300 () Bool)

(assert (=> b!290959 e!207300))

(declare-fun res!240365 () Bool)

(assert (=> b!290959 (=> (not res!240365) (not e!207300))))

(declare-fun lt!422569 () Bool)

(declare-fun lt!422570 () array!17267)

(declare-fun bitAt!0 (array!17267 (_ BitVec 64)) Bool)

(assert (=> b!290959 (= res!240365 (= (bitAt!0 lt!422570 from!505) lt!422569))))

(assert (=> b!290959 (= lt!422569 (bitAt!0 (_3!1266 lt!422572) from!505))))

(declare-fun lt!422577 () Unit!20213)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17267 array!17267 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20213)

(assert (=> b!290959 (= lt!422577 (arrayBitRangesEqImpliesEq!0 lt!422570 (_3!1266 lt!422572) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17267)

(declare-fun arrayBitRangesEq!0 (array!17267 array!17267 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290959 (arrayBitRangesEq!0 arr!273 (_3!1266 lt!422572) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422571 () Unit!20213)

(declare-fun arrayBitRangesEqTransitive!0 (array!17267 array!17267 array!17267 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20213)

(assert (=> b!290959 (= lt!422571 (arrayBitRangesEqTransitive!0 arr!273 lt!422570 (_3!1266 lt!422572) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290959 (arrayBitRangesEq!0 arr!273 lt!422570 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422573 () Unit!20213)

(declare-datatypes ((tuple2!22844 0))(
  ( (tuple2!22845 (_1!12689 Bool) (_2!12689 BitStream!12958)) )
))
(declare-fun lt!422576 () tuple2!22844)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17267 (_ BitVec 64) Bool) Unit!20213)

(assert (=> b!290959 (= lt!422573 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12689 lt!422576)))))

(declare-fun e!207295 () Bool)

(assert (=> b!290959 e!207295))

(declare-fun res!240367 () Bool)

(assert (=> b!290959 (=> (not res!240367) (not e!207295))))

(declare-fun thiss!1728 () BitStream!12958)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290959 (= res!240367 (= (bvsub (bvadd (bitIndex!0 (size!7474 (buf!7540 thiss!1728)) (currentByte!13965 thiss!1728) (currentBit!13960 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7474 (buf!7540 (_2!12688 lt!422572))) (currentByte!13965 (_2!12688 lt!422572)) (currentBit!13960 (_2!12688 lt!422572)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12958 (_ BitVec 64) array!17267 (_ BitVec 64) (_ BitVec 64)) tuple3!1692)

(assert (=> b!290959 (= lt!422572 (readBitsLoop!0 (_2!12689 lt!422576) nBits!523 lt!422570 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290959 (validate_offset_bits!1 ((_ sign_extend 32) (size!7474 (buf!7540 (_2!12689 lt!422576)))) ((_ sign_extend 32) (currentByte!13965 (_2!12689 lt!422576))) ((_ sign_extend 32) (currentBit!13960 (_2!12689 lt!422576))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422568 () Unit!20213)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12958 BitStream!12958 (_ BitVec 64) (_ BitVec 64)) Unit!20213)

(assert (=> b!290959 (= lt!422568 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12689 lt!422576) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422574 () (_ BitVec 32))

(declare-fun lt!422575 () (_ BitVec 32))

(assert (=> b!290959 (= lt!422570 (array!17268 (store (arr!8488 arr!273) lt!422575 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8488 arr!273) lt!422575)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422574)))) ((_ sign_extend 24) (ite (_1!12689 lt!422576) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422574) #b00000000))))) (size!7474 arr!273)))))

(assert (=> b!290959 (= lt!422574 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290959 (= lt!422575 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12958) tuple2!22844)

(assert (=> b!290959 (= lt!422576 (readBit!0 thiss!1728))))

(declare-fun b!290960 () Bool)

(assert (=> b!290960 (= e!207295 (and (= (buf!7540 thiss!1728) (buf!7540 (_2!12688 lt!422572))) (= (size!7474 arr!273) (size!7474 (_3!1266 lt!422572)))))))

(declare-fun b!290961 () Bool)

(assert (=> b!290961 (= e!207300 (= lt!422569 (_1!12689 lt!422576)))))

(declare-fun b!290962 () Bool)

(declare-fun e!207297 () Bool)

(declare-fun array_inv!7086 (array!17267) Bool)

(assert (=> b!290962 (= e!207297 (array_inv!7086 (buf!7540 thiss!1728)))))

(declare-fun b!290963 () Bool)

(declare-fun res!240368 () Bool)

(assert (=> b!290963 (=> (not res!240368) (not e!207298))))

(assert (=> b!290963 (= res!240368 (bvslt from!505 to!474))))

(declare-fun res!240366 () Bool)

(assert (=> start!64828 (=> (not res!240366) (not e!207298))))

(assert (=> start!64828 (= res!240366 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7474 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64828 e!207298))

(declare-fun inv!12 (BitStream!12958) Bool)

(assert (=> start!64828 (and (inv!12 thiss!1728) e!207297)))

(assert (=> start!64828 true))

(assert (=> start!64828 (array_inv!7086 arr!273)))

(declare-fun b!290964 () Bool)

(declare-fun res!240364 () Bool)

(assert (=> b!290964 (=> (not res!240364) (not e!207298))))

(assert (=> b!290964 (= res!240364 (validate_offset_bits!1 ((_ sign_extend 32) (size!7474 (buf!7540 thiss!1728))) ((_ sign_extend 32) (currentByte!13965 thiss!1728)) ((_ sign_extend 32) (currentBit!13960 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64828 res!240366) b!290964))

(assert (= (and b!290964 res!240364) b!290963))

(assert (= (and b!290963 res!240368) b!290959))

(assert (= (and b!290959 res!240367) b!290960))

(assert (= (and b!290959 res!240365) b!290961))

(assert (= start!64828 b!290962))

(declare-fun m!425515 () Bool)

(assert (=> b!290959 m!425515))

(declare-fun m!425517 () Bool)

(assert (=> b!290959 m!425517))

(declare-fun m!425519 () Bool)

(assert (=> b!290959 m!425519))

(declare-fun m!425521 () Bool)

(assert (=> b!290959 m!425521))

(declare-fun m!425523 () Bool)

(assert (=> b!290959 m!425523))

(declare-fun m!425525 () Bool)

(assert (=> b!290959 m!425525))

(declare-fun m!425527 () Bool)

(assert (=> b!290959 m!425527))

(declare-fun m!425529 () Bool)

(assert (=> b!290959 m!425529))

(declare-fun m!425531 () Bool)

(assert (=> b!290959 m!425531))

(declare-fun m!425533 () Bool)

(assert (=> b!290959 m!425533))

(declare-fun m!425535 () Bool)

(assert (=> b!290959 m!425535))

(declare-fun m!425537 () Bool)

(assert (=> b!290959 m!425537))

(declare-fun m!425539 () Bool)

(assert (=> b!290959 m!425539))

(declare-fun m!425541 () Bool)

(assert (=> b!290959 m!425541))

(declare-fun m!425543 () Bool)

(assert (=> b!290959 m!425543))

(declare-fun m!425545 () Bool)

(assert (=> b!290959 m!425545))

(declare-fun m!425547 () Bool)

(assert (=> b!290962 m!425547))

(declare-fun m!425549 () Bool)

(assert (=> start!64828 m!425549))

(declare-fun m!425551 () Bool)

(assert (=> start!64828 m!425551))

(declare-fun m!425553 () Bool)

(assert (=> b!290964 m!425553))

(push 1)

(assert (not start!64828))

(assert (not b!290964))

(assert (not b!290959))

(assert (not b!290962))

(check-sat)

(pop 1)

(push 1)

(check-sat)


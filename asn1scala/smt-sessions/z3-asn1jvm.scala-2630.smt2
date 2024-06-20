; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64932 () Bool)

(assert start!64932)

(declare-fun b!291422 () Bool)

(declare-fun e!207694 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291422 (= e!207694 (bvslt from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))))))

(declare-fun b!291423 () Bool)

(declare-fun res!240748 () Bool)

(declare-fun e!207699 () Bool)

(assert (=> b!291423 (=> (not res!240748) (not e!207699))))

(declare-datatypes ((array!17296 0))(
  ( (array!17297 (arr!8507 (Array (_ BitVec 32) (_ BitVec 8))) (size!7487 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12984 0))(
  ( (BitStream!12985 (buf!7553 array!17296) (currentByte!13987 (_ BitVec 32)) (currentBit!13982 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12984)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291423 (= res!240748 (validate_offset_bits!1 ((_ sign_extend 32) (size!7487 (buf!7553 thiss!1728))) ((_ sign_extend 32) (currentByte!13987 thiss!1728)) ((_ sign_extend 32) (currentBit!13982 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291424 () Bool)

(declare-fun res!240746 () Bool)

(assert (=> b!291424 (=> res!240746 e!207694)))

(declare-datatypes ((Unit!20251 0))(
  ( (Unit!20252) )
))
(declare-datatypes ((tuple3!1718 0))(
  ( (tuple3!1719 (_1!12730 Unit!20251) (_2!12730 BitStream!12984) (_3!1282 array!17296)) )
))
(declare-fun lt!423537 () tuple3!1718)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291424 (= res!240746 (not (invariant!0 (currentBit!13982 (_2!12730 lt!423537)) (currentByte!13987 (_2!12730 lt!423537)) (size!7487 (buf!7553 (_2!12730 lt!423537))))))))

(declare-fun e!207698 () Bool)

(declare-fun b!291426 () Bool)

(declare-fun arr!273 () array!17296)

(assert (=> b!291426 (= e!207698 (and (= (buf!7553 thiss!1728) (buf!7553 (_2!12730 lt!423537))) (= (size!7487 arr!273) (size!7487 (_3!1282 lt!423537)))))))

(declare-fun b!291427 () Bool)

(declare-fun e!207696 () Bool)

(declare-fun lt!423542 () Bool)

(declare-datatypes ((tuple2!22896 0))(
  ( (tuple2!22897 (_1!12731 Bool) (_2!12731 BitStream!12984)) )
))
(declare-fun lt!423539 () tuple2!22896)

(assert (=> b!291427 (= e!207696 (= lt!423542 (_1!12731 lt!423539)))))

(declare-fun b!291428 () Bool)

(assert (=> b!291428 (= e!207699 (not e!207694))))

(declare-fun res!240749 () Bool)

(assert (=> b!291428 (=> res!240749 e!207694)))

(declare-datatypes ((tuple2!22898 0))(
  ( (tuple2!22899 (_1!12732 BitStream!12984) (_2!12732 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12984) tuple2!22898)

(assert (=> b!291428 (= res!240749 (not (= lt!423542 (_2!12732 (readBitPure!0 thiss!1728)))))))

(assert (=> b!291428 e!207696))

(declare-fun res!240743 () Bool)

(assert (=> b!291428 (=> (not res!240743) (not e!207696))))

(declare-fun lt!423534 () array!17296)

(declare-fun bitAt!0 (array!17296 (_ BitVec 64)) Bool)

(assert (=> b!291428 (= res!240743 (= (bitAt!0 lt!423534 from!505) lt!423542))))

(assert (=> b!291428 (= lt!423542 (bitAt!0 (_3!1282 lt!423537) from!505))))

(declare-fun lt!423535 () Unit!20251)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17296 array!17296 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20251)

(assert (=> b!291428 (= lt!423535 (arrayBitRangesEqImpliesEq!0 lt!423534 (_3!1282 lt!423537) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17296 array!17296 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291428 (arrayBitRangesEq!0 arr!273 (_3!1282 lt!423537) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423536 () Unit!20251)

(declare-fun arrayBitRangesEqTransitive!0 (array!17296 array!17296 array!17296 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20251)

(assert (=> b!291428 (= lt!423536 (arrayBitRangesEqTransitive!0 arr!273 lt!423534 (_3!1282 lt!423537) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291428 (arrayBitRangesEq!0 arr!273 lt!423534 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423541 () Unit!20251)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17296 (_ BitVec 64) Bool) Unit!20251)

(assert (=> b!291428 (= lt!423541 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12731 lt!423539)))))

(assert (=> b!291428 e!207698))

(declare-fun res!240747 () Bool)

(assert (=> b!291428 (=> (not res!240747) (not e!207698))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291428 (= res!240747 (= (bvsub (bvadd (bitIndex!0 (size!7487 (buf!7553 thiss!1728)) (currentByte!13987 thiss!1728) (currentBit!13982 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7487 (buf!7553 (_2!12730 lt!423537))) (currentByte!13987 (_2!12730 lt!423537)) (currentBit!13982 (_2!12730 lt!423537)))))))

(declare-fun readBitsLoop!0 (BitStream!12984 (_ BitVec 64) array!17296 (_ BitVec 64) (_ BitVec 64)) tuple3!1718)

(assert (=> b!291428 (= lt!423537 (readBitsLoop!0 (_2!12731 lt!423539) nBits!523 lt!423534 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291428 (validate_offset_bits!1 ((_ sign_extend 32) (size!7487 (buf!7553 (_2!12731 lt!423539)))) ((_ sign_extend 32) (currentByte!13987 (_2!12731 lt!423539))) ((_ sign_extend 32) (currentBit!13982 (_2!12731 lt!423539))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423540 () Unit!20251)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12984 BitStream!12984 (_ BitVec 64) (_ BitVec 64)) Unit!20251)

(assert (=> b!291428 (= lt!423540 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12731 lt!423539) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423543 () (_ BitVec 32))

(declare-fun lt!423538 () (_ BitVec 32))

(assert (=> b!291428 (= lt!423534 (array!17297 (store (arr!8507 arr!273) lt!423543 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8507 arr!273) lt!423543)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423538)))) ((_ sign_extend 24) (ite (_1!12731 lt!423539) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423538) #b00000000))))) (size!7487 arr!273)))))

(assert (=> b!291428 (= lt!423538 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291428 (= lt!423543 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12984) tuple2!22896)

(assert (=> b!291428 (= lt!423539 (readBit!0 thiss!1728))))

(declare-fun b!291429 () Bool)

(declare-fun res!240744 () Bool)

(assert (=> b!291429 (=> (not res!240744) (not e!207699))))

(assert (=> b!291429 (= res!240744 (bvslt from!505 to!474))))

(declare-fun res!240745 () Bool)

(assert (=> start!64932 (=> (not res!240745) (not e!207699))))

(assert (=> start!64932 (= res!240745 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7487 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64932 e!207699))

(declare-fun e!207693 () Bool)

(declare-fun inv!12 (BitStream!12984) Bool)

(assert (=> start!64932 (and (inv!12 thiss!1728) e!207693)))

(assert (=> start!64932 true))

(declare-fun array_inv!7099 (array!17296) Bool)

(assert (=> start!64932 (array_inv!7099 arr!273)))

(declare-fun b!291425 () Bool)

(assert (=> b!291425 (= e!207693 (array_inv!7099 (buf!7553 thiss!1728)))))

(assert (= (and start!64932 res!240745) b!291423))

(assert (= (and b!291423 res!240748) b!291429))

(assert (= (and b!291429 res!240744) b!291428))

(assert (= (and b!291428 res!240747) b!291426))

(assert (= (and b!291428 res!240743) b!291427))

(assert (= (and b!291428 (not res!240749)) b!291424))

(assert (= (and b!291424 (not res!240746)) b!291422))

(assert (= start!64932 b!291425))

(declare-fun m!426441 () Bool)

(assert (=> b!291424 m!426441))

(declare-fun m!426443 () Bool)

(assert (=> b!291423 m!426443))

(declare-fun m!426445 () Bool)

(assert (=> b!291428 m!426445))

(declare-fun m!426447 () Bool)

(assert (=> b!291428 m!426447))

(declare-fun m!426449 () Bool)

(assert (=> b!291428 m!426449))

(declare-fun m!426451 () Bool)

(assert (=> b!291428 m!426451))

(declare-fun m!426453 () Bool)

(assert (=> b!291428 m!426453))

(declare-fun m!426455 () Bool)

(assert (=> b!291428 m!426455))

(declare-fun m!426457 () Bool)

(assert (=> b!291428 m!426457))

(declare-fun m!426459 () Bool)

(assert (=> b!291428 m!426459))

(declare-fun m!426461 () Bool)

(assert (=> b!291428 m!426461))

(declare-fun m!426463 () Bool)

(assert (=> b!291428 m!426463))

(declare-fun m!426465 () Bool)

(assert (=> b!291428 m!426465))

(declare-fun m!426467 () Bool)

(assert (=> b!291428 m!426467))

(declare-fun m!426469 () Bool)

(assert (=> b!291428 m!426469))

(declare-fun m!426471 () Bool)

(assert (=> b!291428 m!426471))

(declare-fun m!426473 () Bool)

(assert (=> b!291428 m!426473))

(declare-fun m!426475 () Bool)

(assert (=> b!291428 m!426475))

(declare-fun m!426477 () Bool)

(assert (=> b!291428 m!426477))

(declare-fun m!426479 () Bool)

(assert (=> start!64932 m!426479))

(declare-fun m!426481 () Bool)

(assert (=> start!64932 m!426481))

(declare-fun m!426483 () Bool)

(assert (=> b!291425 m!426483))

(check-sat (not b!291425) (not b!291428) (not start!64932) (not b!291424) (not b!291423))
(check-sat)

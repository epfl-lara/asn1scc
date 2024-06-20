; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65718 () Bool)

(assert start!65718)

(declare-fun b!294746 () Bool)

(declare-fun res!243377 () Bool)

(declare-fun e!210706 () Bool)

(assert (=> b!294746 (=> (not res!243377) (not e!210706))))

(declare-datatypes ((array!17650 0))(
  ( (array!17651 (arr!8687 (Array (_ BitVec 32) (_ BitVec 8))) (size!7649 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13302 0))(
  ( (BitStream!13303 (buf!7712 array!17650) (currentByte!14209 (_ BitVec 32)) (currentBit!14204 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13302)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294746 (= res!243377 (validate_offset_bits!1 ((_ sign_extend 32) (size!7649 (buf!7712 thiss!1728))) ((_ sign_extend 32) (currentByte!14209 thiss!1728)) ((_ sign_extend 32) (currentBit!14204 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294748 () Bool)

(declare-fun e!210707 () Bool)

(declare-fun array_inv!7261 (array!17650) Bool)

(assert (=> b!294748 (= e!210707 (array_inv!7261 (buf!7712 thiss!1728)))))

(declare-fun b!294749 () Bool)

(assert (=> b!294749 (= e!210706 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-fun arr!273 () array!17650)

(declare-datatypes ((Unit!20535 0))(
  ( (Unit!20536) )
))
(declare-datatypes ((tuple3!1814 0))(
  ( (tuple3!1815 (_1!12937 Unit!20535) (_2!12937 BitStream!13302) (_3!1345 array!17650)) )
))
(declare-fun lt!428236 () tuple3!1814)

(declare-fun arrayBitRangesEq!0 (array!17650 array!17650 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294749 (arrayBitRangesEq!0 arr!273 (_3!1345 lt!428236) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428231 () Unit!20535)

(declare-fun lt!428232 () array!17650)

(declare-fun arrayBitRangesEqTransitive!0 (array!17650 array!17650 array!17650 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20535)

(assert (=> b!294749 (= lt!428231 (arrayBitRangesEqTransitive!0 arr!273 lt!428232 (_3!1345 lt!428236) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294749 (arrayBitRangesEq!0 arr!273 lt!428232 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428234 () Unit!20535)

(declare-datatypes ((tuple2!23184 0))(
  ( (tuple2!23185 (_1!12938 Bool) (_2!12938 BitStream!13302)) )
))
(declare-fun lt!428237 () tuple2!23184)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17650 (_ BitVec 64) Bool) Unit!20535)

(assert (=> b!294749 (= lt!428234 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12938 lt!428237)))))

(declare-fun e!210705 () Bool)

(assert (=> b!294749 e!210705))

(declare-fun res!243376 () Bool)

(assert (=> b!294749 (=> (not res!243376) (not e!210705))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294749 (= res!243376 (= (bvsub (bvadd (bitIndex!0 (size!7649 (buf!7712 thiss!1728)) (currentByte!14209 thiss!1728) (currentBit!14204 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7649 (buf!7712 (_2!12937 lt!428236))) (currentByte!14209 (_2!12937 lt!428236)) (currentBit!14204 (_2!12937 lt!428236)))))))

(declare-fun readBitsLoop!0 (BitStream!13302 (_ BitVec 64) array!17650 (_ BitVec 64) (_ BitVec 64)) tuple3!1814)

(assert (=> b!294749 (= lt!428236 (readBitsLoop!0 (_2!12938 lt!428237) nBits!523 lt!428232 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294749 (validate_offset_bits!1 ((_ sign_extend 32) (size!7649 (buf!7712 (_2!12938 lt!428237)))) ((_ sign_extend 32) (currentByte!14209 (_2!12938 lt!428237))) ((_ sign_extend 32) (currentBit!14204 (_2!12938 lt!428237))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428233 () Unit!20535)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13302 BitStream!13302 (_ BitVec 64) (_ BitVec 64)) Unit!20535)

(assert (=> b!294749 (= lt!428233 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12938 lt!428237) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428238 () (_ BitVec 32))

(declare-fun lt!428235 () (_ BitVec 32))

(assert (=> b!294749 (= lt!428232 (array!17651 (store (arr!8687 arr!273) lt!428235 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8687 arr!273) lt!428235)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428238)))) ((_ sign_extend 24) (ite (_1!12938 lt!428237) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428238) #b00000000))))) (size!7649 arr!273)))))

(assert (=> b!294749 (= lt!428238 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294749 (= lt!428235 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13302) tuple2!23184)

(assert (=> b!294749 (= lt!428237 (readBit!0 thiss!1728))))

(declare-fun b!294750 () Bool)

(declare-fun res!243375 () Bool)

(assert (=> b!294750 (=> (not res!243375) (not e!210706))))

(assert (=> b!294750 (= res!243375 (bvslt from!505 to!474))))

(declare-fun b!294747 () Bool)

(assert (=> b!294747 (= e!210705 (and (= (buf!7712 thiss!1728) (buf!7712 (_2!12937 lt!428236))) (= (size!7649 arr!273) (size!7649 (_3!1345 lt!428236)))))))

(declare-fun res!243374 () Bool)

(assert (=> start!65718 (=> (not res!243374) (not e!210706))))

(assert (=> start!65718 (= res!243374 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7649 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65718 e!210706))

(declare-fun inv!12 (BitStream!13302) Bool)

(assert (=> start!65718 (and (inv!12 thiss!1728) e!210707)))

(assert (=> start!65718 true))

(assert (=> start!65718 (array_inv!7261 arr!273)))

(assert (= (and start!65718 res!243374) b!294746))

(assert (= (and b!294746 res!243377) b!294750))

(assert (= (and b!294750 res!243375) b!294749))

(assert (= (and b!294749 res!243376) b!294747))

(assert (= start!65718 b!294748))

(declare-fun m!431315 () Bool)

(assert (=> b!294746 m!431315))

(declare-fun m!431317 () Bool)

(assert (=> b!294748 m!431317))

(declare-fun m!431319 () Bool)

(assert (=> b!294749 m!431319))

(declare-fun m!431321 () Bool)

(assert (=> b!294749 m!431321))

(declare-fun m!431323 () Bool)

(assert (=> b!294749 m!431323))

(declare-fun m!431325 () Bool)

(assert (=> b!294749 m!431325))

(declare-fun m!431327 () Bool)

(assert (=> b!294749 m!431327))

(declare-fun m!431329 () Bool)

(assert (=> b!294749 m!431329))

(declare-fun m!431331 () Bool)

(assert (=> b!294749 m!431331))

(declare-fun m!431333 () Bool)

(assert (=> b!294749 m!431333))

(declare-fun m!431335 () Bool)

(assert (=> b!294749 m!431335))

(declare-fun m!431337 () Bool)

(assert (=> b!294749 m!431337))

(declare-fun m!431339 () Bool)

(assert (=> b!294749 m!431339))

(declare-fun m!431341 () Bool)

(assert (=> b!294749 m!431341))

(declare-fun m!431343 () Bool)

(assert (=> b!294749 m!431343))

(declare-fun m!431345 () Bool)

(assert (=> start!65718 m!431345))

(declare-fun m!431347 () Bool)

(assert (=> start!65718 m!431347))

(check-sat (not b!294746) (not b!294748) (not start!65718) (not b!294749))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64596 () Bool)

(assert start!64596)

(declare-datatypes ((array!17185 0))(
  ( (array!17186 (arr!8438 (Array (_ BitVec 32) (_ BitVec 8))) (size!7436 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12882 0))(
  ( (BitStream!12883 (buf!7502 array!17185) (currentByte!13909 (_ BitVec 32)) (currentBit!13904 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12882)

(declare-fun e!206371 () Bool)

(declare-datatypes ((Unit!20113 0))(
  ( (Unit!20114) )
))
(declare-datatypes ((tuple3!1616 0))(
  ( (tuple3!1617 (_1!12595 Unit!20113) (_2!12595 BitStream!12882) (_3!1222 array!17185)) )
))
(declare-fun lt!420440 () tuple3!1616)

(declare-fun b!289913 () Bool)

(declare-fun arr!273 () array!17185)

(assert (=> b!289913 (= e!206371 (and (= (buf!7502 thiss!1728) (buf!7502 (_2!12595 lt!420440))) (= (size!7436 arr!273) (size!7436 (_3!1222 lt!420440)))))))

(declare-fun res!239522 () Bool)

(declare-fun e!206373 () Bool)

(assert (=> start!64596 (=> (not res!239522) (not e!206373))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!64596 (= res!239522 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7436 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64596 e!206373))

(declare-fun e!206369 () Bool)

(declare-fun inv!12 (BitStream!12882) Bool)

(assert (=> start!64596 (and (inv!12 thiss!1728) e!206369)))

(assert (=> start!64596 true))

(declare-fun array_inv!7048 (array!17185) Bool)

(assert (=> start!64596 (array_inv!7048 arr!273)))

(declare-fun b!289914 () Bool)

(assert (=> b!289914 (= e!206369 (array_inv!7048 (buf!7502 thiss!1728)))))

(declare-fun b!289915 () Bool)

(declare-fun res!239524 () Bool)

(assert (=> b!289915 (=> (not res!239524) (not e!206373))))

(assert (=> b!289915 (= res!239524 (bvslt from!505 to!474))))

(declare-fun b!289916 () Bool)

(assert (=> b!289916 (= e!206373 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7436 arr!273))))))))

(declare-fun arrayBitRangesEq!0 (array!17185 array!17185 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289916 (arrayBitRangesEq!0 arr!273 (_3!1222 lt!420440) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420438 () array!17185)

(declare-fun lt!420444 () Unit!20113)

(declare-fun arrayBitRangesEqTransitive!0 (array!17185 array!17185 array!17185 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20113)

(assert (=> b!289916 (= lt!420444 (arrayBitRangesEqTransitive!0 arr!273 lt!420438 (_3!1222 lt!420440) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289916 (arrayBitRangesEq!0 arr!273 lt!420438 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420439 () Unit!20113)

(declare-datatypes ((tuple2!22746 0))(
  ( (tuple2!22747 (_1!12596 Bool) (_2!12596 BitStream!12882)) )
))
(declare-fun lt!420442 () tuple2!22746)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17185 (_ BitVec 64) Bool) Unit!20113)

(assert (=> b!289916 (= lt!420439 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12596 lt!420442)))))

(assert (=> b!289916 e!206371))

(declare-fun res!239525 () Bool)

(assert (=> b!289916 (=> (not res!239525) (not e!206371))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289916 (= res!239525 (= (bvsub (bvadd (bitIndex!0 (size!7436 (buf!7502 thiss!1728)) (currentByte!13909 thiss!1728) (currentBit!13904 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7436 (buf!7502 (_2!12595 lt!420440))) (currentByte!13909 (_2!12595 lt!420440)) (currentBit!13904 (_2!12595 lt!420440)))))))

(declare-fun readBitsLoop!0 (BitStream!12882 (_ BitVec 64) array!17185 (_ BitVec 64) (_ BitVec 64)) tuple3!1616)

(assert (=> b!289916 (= lt!420440 (readBitsLoop!0 (_2!12596 lt!420442) nBits!523 lt!420438 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289916 (validate_offset_bits!1 ((_ sign_extend 32) (size!7436 (buf!7502 (_2!12596 lt!420442)))) ((_ sign_extend 32) (currentByte!13909 (_2!12596 lt!420442))) ((_ sign_extend 32) (currentBit!13904 (_2!12596 lt!420442))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420437 () Unit!20113)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12882 BitStream!12882 (_ BitVec 64) (_ BitVec 64)) Unit!20113)

(assert (=> b!289916 (= lt!420437 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12596 lt!420442) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420441 () (_ BitVec 32))

(declare-fun lt!420443 () (_ BitVec 32))

(assert (=> b!289916 (= lt!420438 (array!17186 (store (arr!8438 arr!273) lt!420443 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8438 arr!273) lt!420443)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420441)))) ((_ sign_extend 24) (ite (_1!12596 lt!420442) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420441) #b00000000))))) (size!7436 arr!273)))))

(assert (=> b!289916 (= lt!420441 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289916 (= lt!420443 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12882) tuple2!22746)

(assert (=> b!289916 (= lt!420442 (readBit!0 thiss!1728))))

(declare-fun b!289917 () Bool)

(declare-fun res!239523 () Bool)

(assert (=> b!289917 (=> (not res!239523) (not e!206373))))

(assert (=> b!289917 (= res!239523 (validate_offset_bits!1 ((_ sign_extend 32) (size!7436 (buf!7502 thiss!1728))) ((_ sign_extend 32) (currentByte!13909 thiss!1728)) ((_ sign_extend 32) (currentBit!13904 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64596 res!239522) b!289917))

(assert (= (and b!289917 res!239523) b!289915))

(assert (= (and b!289915 res!239524) b!289916))

(assert (= (and b!289916 res!239525) b!289913))

(assert (= start!64596 b!289914))

(declare-fun m!423317 () Bool)

(assert (=> start!64596 m!423317))

(declare-fun m!423319 () Bool)

(assert (=> start!64596 m!423319))

(declare-fun m!423321 () Bool)

(assert (=> b!289914 m!423321))

(declare-fun m!423323 () Bool)

(assert (=> b!289916 m!423323))

(declare-fun m!423325 () Bool)

(assert (=> b!289916 m!423325))

(declare-fun m!423327 () Bool)

(assert (=> b!289916 m!423327))

(declare-fun m!423329 () Bool)

(assert (=> b!289916 m!423329))

(declare-fun m!423331 () Bool)

(assert (=> b!289916 m!423331))

(declare-fun m!423333 () Bool)

(assert (=> b!289916 m!423333))

(declare-fun m!423335 () Bool)

(assert (=> b!289916 m!423335))

(declare-fun m!423337 () Bool)

(assert (=> b!289916 m!423337))

(declare-fun m!423339 () Bool)

(assert (=> b!289916 m!423339))

(declare-fun m!423341 () Bool)

(assert (=> b!289916 m!423341))

(declare-fun m!423343 () Bool)

(assert (=> b!289916 m!423343))

(declare-fun m!423345 () Bool)

(assert (=> b!289916 m!423345))

(declare-fun m!423347 () Bool)

(assert (=> b!289916 m!423347))

(declare-fun m!423349 () Bool)

(assert (=> b!289917 m!423349))

(check-sat (not b!289917) (not start!64596) (not b!289916) (not b!289914))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64620 () Bool)

(assert start!64620)

(declare-fun res!239666 () Bool)

(declare-fun e!206550 () Bool)

(assert (=> start!64620 (=> (not res!239666) (not e!206550))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17209 0))(
  ( (array!17210 (arr!8450 (Array (_ BitVec 32) (_ BitVec 8))) (size!7448 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17209)

(assert (=> start!64620 (= res!239666 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7448 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64620 e!206550))

(declare-datatypes ((BitStream!12906 0))(
  ( (BitStream!12907 (buf!7514 array!17209) (currentByte!13921 (_ BitVec 32)) (currentBit!13916 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12906)

(declare-fun e!206552 () Bool)

(declare-fun inv!12 (BitStream!12906) Bool)

(assert (=> start!64620 (and (inv!12 thiss!1728) e!206552)))

(assert (=> start!64620 true))

(declare-fun array_inv!7060 (array!17209) Bool)

(assert (=> start!64620 (array_inv!7060 arr!273)))

(declare-fun b!290093 () Bool)

(declare-fun res!239669 () Bool)

(assert (=> b!290093 (=> (not res!239669) (not e!206550))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290093 (= res!239669 (validate_offset_bits!1 ((_ sign_extend 32) (size!7448 (buf!7514 thiss!1728))) ((_ sign_extend 32) (currentByte!13921 thiss!1728)) ((_ sign_extend 32) (currentBit!13916 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290094 () Bool)

(declare-fun res!239668 () Bool)

(assert (=> b!290094 (=> (not res!239668) (not e!206550))))

(assert (=> b!290094 (= res!239668 (bvslt from!505 to!474))))

(declare-fun b!290095 () Bool)

(assert (=> b!290095 (= e!206550 (not true))))

(declare-datatypes ((Unit!20137 0))(
  ( (Unit!20138) )
))
(declare-datatypes ((tuple3!1640 0))(
  ( (tuple3!1641 (_1!12619 Unit!20137) (_2!12619 BitStream!12906) (_3!1234 array!17209)) )
))
(declare-fun lt!420726 () tuple3!1640)

(declare-fun arrayBitRangesEq!0 (array!17209 array!17209 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290095 (arrayBitRangesEq!0 arr!273 (_3!1234 lt!420726) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420730 () array!17209)

(declare-fun lt!420727 () Unit!20137)

(declare-fun arrayBitRangesEqTransitive!0 (array!17209 array!17209 array!17209 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20137)

(assert (=> b!290095 (= lt!420727 (arrayBitRangesEqTransitive!0 arr!273 lt!420730 (_3!1234 lt!420726) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290095 (arrayBitRangesEq!0 arr!273 lt!420730 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22770 0))(
  ( (tuple2!22771 (_1!12620 Bool) (_2!12620 BitStream!12906)) )
))
(declare-fun lt!420732 () tuple2!22770)

(declare-fun lt!420728 () Unit!20137)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17209 (_ BitVec 64) Bool) Unit!20137)

(assert (=> b!290095 (= lt!420728 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12620 lt!420732)))))

(declare-fun e!206549 () Bool)

(assert (=> b!290095 e!206549))

(declare-fun res!239667 () Bool)

(assert (=> b!290095 (=> (not res!239667) (not e!206549))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290095 (= res!239667 (= (bvsub (bvadd (bitIndex!0 (size!7448 (buf!7514 thiss!1728)) (currentByte!13921 thiss!1728) (currentBit!13916 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7448 (buf!7514 (_2!12619 lt!420726))) (currentByte!13921 (_2!12619 lt!420726)) (currentBit!13916 (_2!12619 lt!420726)))))))

(declare-fun readBitsLoop!0 (BitStream!12906 (_ BitVec 64) array!17209 (_ BitVec 64) (_ BitVec 64)) tuple3!1640)

(assert (=> b!290095 (= lt!420726 (readBitsLoop!0 (_2!12620 lt!420732) nBits!523 lt!420730 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290095 (validate_offset_bits!1 ((_ sign_extend 32) (size!7448 (buf!7514 (_2!12620 lt!420732)))) ((_ sign_extend 32) (currentByte!13921 (_2!12620 lt!420732))) ((_ sign_extend 32) (currentBit!13916 (_2!12620 lt!420732))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420729 () Unit!20137)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12906 BitStream!12906 (_ BitVec 64) (_ BitVec 64)) Unit!20137)

(assert (=> b!290095 (= lt!420729 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12620 lt!420732) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420731 () (_ BitVec 32))

(declare-fun lt!420725 () (_ BitVec 32))

(assert (=> b!290095 (= lt!420730 (array!17210 (store (arr!8450 arr!273) lt!420731 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8450 arr!273) lt!420731)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420725)))) ((_ sign_extend 24) (ite (_1!12620 lt!420732) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420725) #b00000000))))) (size!7448 arr!273)))))

(assert (=> b!290095 (= lt!420725 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290095 (= lt!420731 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12906) tuple2!22770)

(assert (=> b!290095 (= lt!420732 (readBit!0 thiss!1728))))

(declare-fun b!290096 () Bool)

(assert (=> b!290096 (= e!206552 (array_inv!7060 (buf!7514 thiss!1728)))))

(declare-fun b!290097 () Bool)

(assert (=> b!290097 (= e!206549 (and (= (buf!7514 thiss!1728) (buf!7514 (_2!12619 lt!420726))) (= (size!7448 arr!273) (size!7448 (_3!1234 lt!420726)))))))

(assert (= (and start!64620 res!239666) b!290093))

(assert (= (and b!290093 res!239669) b!290094))

(assert (= (and b!290094 res!239668) b!290095))

(assert (= (and b!290095 res!239667) b!290097))

(assert (= start!64620 b!290096))

(declare-fun m!423725 () Bool)

(assert (=> start!64620 m!423725))

(declare-fun m!423727 () Bool)

(assert (=> start!64620 m!423727))

(declare-fun m!423729 () Bool)

(assert (=> b!290093 m!423729))

(declare-fun m!423731 () Bool)

(assert (=> b!290095 m!423731))

(declare-fun m!423733 () Bool)

(assert (=> b!290095 m!423733))

(declare-fun m!423735 () Bool)

(assert (=> b!290095 m!423735))

(declare-fun m!423737 () Bool)

(assert (=> b!290095 m!423737))

(declare-fun m!423739 () Bool)

(assert (=> b!290095 m!423739))

(declare-fun m!423741 () Bool)

(assert (=> b!290095 m!423741))

(declare-fun m!423743 () Bool)

(assert (=> b!290095 m!423743))

(declare-fun m!423745 () Bool)

(assert (=> b!290095 m!423745))

(declare-fun m!423747 () Bool)

(assert (=> b!290095 m!423747))

(declare-fun m!423749 () Bool)

(assert (=> b!290095 m!423749))

(declare-fun m!423751 () Bool)

(assert (=> b!290095 m!423751))

(declare-fun m!423753 () Bool)

(assert (=> b!290095 m!423753))

(declare-fun m!423755 () Bool)

(assert (=> b!290095 m!423755))

(declare-fun m!423757 () Bool)

(assert (=> b!290096 m!423757))

(check-sat (not b!290096) (not b!290095) (not start!64620) (not b!290093))

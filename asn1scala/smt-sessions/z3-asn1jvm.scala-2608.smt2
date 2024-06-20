; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64566 () Bool)

(assert start!64566)

(declare-fun b!289688 () Bool)

(declare-fun res!239343 () Bool)

(declare-fun e!206148 () Bool)

(assert (=> b!289688 (=> (not res!239343) (not e!206148))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289688 (= res!239343 (bvslt from!505 to!474))))

(declare-fun b!289689 () Bool)

(declare-fun e!206146 () Bool)

(declare-datatypes ((array!17155 0))(
  ( (array!17156 (arr!8423 (Array (_ BitVec 32) (_ BitVec 8))) (size!7421 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12852 0))(
  ( (BitStream!12853 (buf!7487 array!17155) (currentByte!13894 (_ BitVec 32)) (currentBit!13889 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12852)

(declare-fun array_inv!7033 (array!17155) Bool)

(assert (=> b!289689 (= e!206146 (array_inv!7033 (buf!7487 thiss!1728)))))

(declare-fun res!239344 () Bool)

(assert (=> start!64566 (=> (not res!239344) (not e!206148))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17155)

(assert (=> start!64566 (= res!239344 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7421 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64566 e!206148))

(declare-fun inv!12 (BitStream!12852) Bool)

(assert (=> start!64566 (and (inv!12 thiss!1728) e!206146)))

(assert (=> start!64566 true))

(assert (=> start!64566 (array_inv!7033 arr!273)))

(declare-fun b!289690 () Bool)

(assert (=> b!289690 (= e!206148 (not true))))

(declare-fun lt!420114 () array!17155)

(declare-fun arrayBitRangesEq!0 (array!17155 array!17155 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289690 (arrayBitRangesEq!0 arr!273 lt!420114 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20083 0))(
  ( (Unit!20084) )
))
(declare-fun lt!420109 () Unit!20083)

(declare-datatypes ((tuple2!22716 0))(
  ( (tuple2!22717 (_1!12565 Bool) (_2!12565 BitStream!12852)) )
))
(declare-fun lt!420113 () tuple2!22716)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17155 (_ BitVec 64) Bool) Unit!20083)

(assert (=> b!289690 (= lt!420109 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12565 lt!420113)))))

(declare-fun e!206144 () Bool)

(assert (=> b!289690 e!206144))

(declare-fun res!239342 () Bool)

(assert (=> b!289690 (=> (not res!239342) (not e!206144))))

(declare-datatypes ((tuple3!1586 0))(
  ( (tuple3!1587 (_1!12566 Unit!20083) (_2!12566 BitStream!12852) (_3!1207 array!17155)) )
))
(declare-fun lt!420110 () tuple3!1586)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289690 (= res!239342 (= (bvsub (bvadd (bitIndex!0 (size!7421 (buf!7487 thiss!1728)) (currentByte!13894 thiss!1728) (currentBit!13889 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7421 (buf!7487 (_2!12566 lt!420110))) (currentByte!13894 (_2!12566 lt!420110)) (currentBit!13889 (_2!12566 lt!420110)))))))

(declare-fun readBitsLoop!0 (BitStream!12852 (_ BitVec 64) array!17155 (_ BitVec 64) (_ BitVec 64)) tuple3!1586)

(assert (=> b!289690 (= lt!420110 (readBitsLoop!0 (_2!12565 lt!420113) nBits!523 lt!420114 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289690 (validate_offset_bits!1 ((_ sign_extend 32) (size!7421 (buf!7487 (_2!12565 lt!420113)))) ((_ sign_extend 32) (currentByte!13894 (_2!12565 lt!420113))) ((_ sign_extend 32) (currentBit!13889 (_2!12565 lt!420113))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420111 () Unit!20083)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12852 BitStream!12852 (_ BitVec 64) (_ BitVec 64)) Unit!20083)

(assert (=> b!289690 (= lt!420111 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12565 lt!420113) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420112 () (_ BitVec 32))

(declare-fun lt!420108 () (_ BitVec 32))

(assert (=> b!289690 (= lt!420114 (array!17156 (store (arr!8423 arr!273) lt!420112 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8423 arr!273) lt!420112)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420108)))) ((_ sign_extend 24) (ite (_1!12565 lt!420113) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420108) #b00000000))))) (size!7421 arr!273)))))

(assert (=> b!289690 (= lt!420108 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289690 (= lt!420112 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12852) tuple2!22716)

(assert (=> b!289690 (= lt!420113 (readBit!0 thiss!1728))))

(declare-fun b!289691 () Bool)

(assert (=> b!289691 (= e!206144 (and (= (buf!7487 thiss!1728) (buf!7487 (_2!12566 lt!420110))) (= (size!7421 arr!273) (size!7421 (_3!1207 lt!420110)))))))

(declare-fun b!289692 () Bool)

(declare-fun res!239345 () Bool)

(assert (=> b!289692 (=> (not res!239345) (not e!206148))))

(assert (=> b!289692 (= res!239345 (validate_offset_bits!1 ((_ sign_extend 32) (size!7421 (buf!7487 thiss!1728))) ((_ sign_extend 32) (currentByte!13894 thiss!1728)) ((_ sign_extend 32) (currentBit!13889 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64566 res!239344) b!289692))

(assert (= (and b!289692 res!239345) b!289688))

(assert (= (and b!289688 res!239343) b!289690))

(assert (= (and b!289690 res!239342) b!289691))

(assert (= start!64566 b!289689))

(declare-fun m!422851 () Bool)

(assert (=> b!289689 m!422851))

(declare-fun m!422853 () Bool)

(assert (=> start!64566 m!422853))

(declare-fun m!422855 () Bool)

(assert (=> start!64566 m!422855))

(declare-fun m!422857 () Bool)

(assert (=> b!289690 m!422857))

(declare-fun m!422859 () Bool)

(assert (=> b!289690 m!422859))

(declare-fun m!422861 () Bool)

(assert (=> b!289690 m!422861))

(declare-fun m!422863 () Bool)

(assert (=> b!289690 m!422863))

(declare-fun m!422865 () Bool)

(assert (=> b!289690 m!422865))

(declare-fun m!422867 () Bool)

(assert (=> b!289690 m!422867))

(declare-fun m!422869 () Bool)

(assert (=> b!289690 m!422869))

(declare-fun m!422871 () Bool)

(assert (=> b!289690 m!422871))

(declare-fun m!422873 () Bool)

(assert (=> b!289690 m!422873))

(declare-fun m!422875 () Bool)

(assert (=> b!289690 m!422875))

(declare-fun m!422877 () Bool)

(assert (=> b!289690 m!422877))

(declare-fun m!422879 () Bool)

(assert (=> b!289692 m!422879))

(check-sat (not b!289692) (not b!289690) (not b!289689) (not start!64566))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47848 () Bool)

(assert start!47848)

(declare-fun b!227720 () Bool)

(declare-fun res!191029 () Bool)

(declare-fun e!155923 () Bool)

(assert (=> b!227720 (=> (not res!191029) (not e!155923))))

(declare-datatypes ((array!11464 0))(
  ( (array!11465 (arr!6008 (Array (_ BitVec 32) (_ BitVec 8))) (size!5030 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9156 0))(
  ( (BitStream!9157 (buf!5571 array!11464) (currentByte!10415 (_ BitVec 32)) (currentBit!10410 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9156)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227720 (= res!191029 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5030 (buf!5571 thiss!1870))) ((_ sign_extend 32) (currentByte!10415 thiss!1870)) ((_ sign_extend 32) (currentBit!10410 thiss!1870)) (bvsub to!496 i!761)))))

(declare-datatypes ((Unit!17034 0))(
  ( (Unit!17035) )
))
(declare-datatypes ((tuple3!1442 0))(
  ( (tuple3!1443 (_1!10660 Unit!17034) (_2!10660 BitStream!9156) (_3!863 array!11464)) )
))
(declare-fun lt!364376 () tuple3!1442)

(declare-fun b!227721 () Bool)

(declare-fun lt!364368 () array!11464)

(declare-fun e!155919 () Bool)

(declare-fun arrayRangesEq!866 (array!11464 array!11464 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227721 (= e!155919 (arrayRangesEq!866 lt!364368 (_3!863 lt!364376) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!227722 () Bool)

(declare-fun e!155921 () Bool)

(declare-fun array_inv!4771 (array!11464) Bool)

(assert (=> b!227722 (= e!155921 (array_inv!4771 (buf!5571 thiss!1870)))))

(declare-fun b!227723 () Bool)

(assert (=> b!227723 (= e!155923 (not e!155919))))

(declare-fun res!191032 () Bool)

(assert (=> b!227723 (=> res!191032 e!155919)))

(declare-fun arr!308 () array!11464)

(assert (=> b!227723 (= res!191032 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5030 arr!308)) (bvsge i!761 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> b!227723 (arrayRangesEq!866 arr!308 (_3!863 lt!364376) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364374 () Unit!17034)

(declare-fun arrayRangesEqTransitive!289 (array!11464 array!11464 array!11464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17034)

(assert (=> b!227723 (= lt!364374 (arrayRangesEqTransitive!289 arr!308 lt!364368 (_3!863 lt!364376) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227723 (arrayRangesEq!866 arr!308 lt!364368 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19594 0))(
  ( (tuple2!19595 (_1!10661 (_ BitVec 8)) (_2!10661 BitStream!9156)) )
))
(declare-fun lt!364375 () tuple2!19594)

(declare-fun lt!364377 () Unit!17034)

(declare-fun arrayUpdatedAtPrefixLemma!425 (array!11464 (_ BitVec 32) (_ BitVec 8)) Unit!17034)

(assert (=> b!227723 (= lt!364377 (arrayUpdatedAtPrefixLemma!425 arr!308 i!761 (_1!10661 lt!364375)))))

(declare-fun lt!364371 () (_ BitVec 64))

(declare-fun lt!364373 () (_ BitVec 32))

(declare-fun lt!364369 () (_ BitVec 64))

(declare-fun lt!364370 () (_ BitVec 64))

(assert (=> b!227723 (and (= (bvadd lt!364371 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364373))) lt!364370) (= (bvadd lt!364369 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364370) (= (buf!5571 thiss!1870) (buf!5571 (_2!10660 lt!364376))) (= (size!5030 arr!308) (size!5030 (_3!863 lt!364376))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227723 (= lt!364370 (bitIndex!0 (size!5030 (buf!5571 (_2!10660 lt!364376))) (currentByte!10415 (_2!10660 lt!364376)) (currentBit!10410 (_2!10660 lt!364376))))))

(assert (=> b!227723 (= lt!364371 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364369))))

(assert (=> b!227723 (= lt!364371 (bitIndex!0 (size!5030 (buf!5571 (_2!10661 lt!364375))) (currentByte!10415 (_2!10661 lt!364375)) (currentBit!10410 (_2!10661 lt!364375))))))

(assert (=> b!227723 (= lt!364369 (bitIndex!0 (size!5030 (buf!5571 thiss!1870)) (currentByte!10415 thiss!1870) (currentBit!10410 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9156 array!11464 (_ BitVec 32) (_ BitVec 32)) tuple3!1442)

(assert (=> b!227723 (= lt!364376 (readByteArrayLoop!0 (_2!10661 lt!364375) lt!364368 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227723 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10661 lt!364375)))) ((_ sign_extend 32) (currentByte!10415 (_2!10661 lt!364375))) ((_ sign_extend 32) (currentBit!10410 (_2!10661 lt!364375))) lt!364373)))

(assert (=> b!227723 (= lt!364373 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364372 () Unit!17034)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9156 BitStream!9156 (_ BitVec 64) (_ BitVec 32)) Unit!17034)

(assert (=> b!227723 (= lt!364372 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10661 lt!364375) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227723 (= lt!364368 (array!11465 (store (arr!6008 arr!308) i!761 (_1!10661 lt!364375)) (size!5030 arr!308)))))

(declare-fun readByte!0 (BitStream!9156) tuple2!19594)

(assert (=> b!227723 (= lt!364375 (readByte!0 thiss!1870))))

(declare-fun b!227724 () Bool)

(declare-fun res!191030 () Bool)

(assert (=> b!227724 (=> (not res!191030) (not e!155923))))

(assert (=> b!227724 (= res!191030 (bvslt i!761 to!496))))

(declare-fun res!191031 () Bool)

(assert (=> start!47848 (=> (not res!191031) (not e!155923))))

(assert (=> start!47848 (= res!191031 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5030 arr!308))))))

(assert (=> start!47848 e!155923))

(assert (=> start!47848 true))

(assert (=> start!47848 (array_inv!4771 arr!308)))

(declare-fun inv!12 (BitStream!9156) Bool)

(assert (=> start!47848 (and (inv!12 thiss!1870) e!155921)))

(assert (= (and start!47848 res!191031) b!227720))

(assert (= (and b!227720 res!191029) b!227724))

(assert (= (and b!227724 res!191030) b!227723))

(assert (= (and b!227723 (not res!191032)) b!227721))

(assert (= start!47848 b!227722))

(declare-fun m!350495 () Bool)

(assert (=> b!227723 m!350495))

(declare-fun m!350497 () Bool)

(assert (=> b!227723 m!350497))

(declare-fun m!350499 () Bool)

(assert (=> b!227723 m!350499))

(declare-fun m!350501 () Bool)

(assert (=> b!227723 m!350501))

(declare-fun m!350503 () Bool)

(assert (=> b!227723 m!350503))

(declare-fun m!350505 () Bool)

(assert (=> b!227723 m!350505))

(declare-fun m!350507 () Bool)

(assert (=> b!227723 m!350507))

(declare-fun m!350509 () Bool)

(assert (=> b!227723 m!350509))

(declare-fun m!350511 () Bool)

(assert (=> b!227723 m!350511))

(declare-fun m!350513 () Bool)

(assert (=> b!227723 m!350513))

(declare-fun m!350515 () Bool)

(assert (=> b!227723 m!350515))

(declare-fun m!350517 () Bool)

(assert (=> b!227723 m!350517))

(declare-fun m!350519 () Bool)

(assert (=> b!227721 m!350519))

(declare-fun m!350521 () Bool)

(assert (=> b!227720 m!350521))

(declare-fun m!350523 () Bool)

(assert (=> b!227722 m!350523))

(declare-fun m!350525 () Bool)

(assert (=> start!47848 m!350525))

(declare-fun m!350527 () Bool)

(assert (=> start!47848 m!350527))

(check-sat (not b!227721) (not b!227720) (not start!47848) (not b!227723) (not b!227722))
(check-sat)
(get-model)

(declare-fun d!77227 () Bool)

(assert (=> d!77227 (= (array_inv!4771 (buf!5571 thiss!1870)) (bvsge (size!5030 (buf!5571 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!227722 d!77227))

(declare-fun d!77231 () Bool)

(assert (=> d!77231 (= (array_inv!4771 arr!308) (bvsge (size!5030 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47848 d!77231))

(declare-fun d!77233 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77233 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10410 thiss!1870) (currentByte!10415 thiss!1870) (size!5030 (buf!5571 thiss!1870))))))

(declare-fun bs!18891 () Bool)

(assert (= bs!18891 d!77233))

(declare-fun m!350563 () Bool)

(assert (=> bs!18891 m!350563))

(assert (=> start!47848 d!77233))

(declare-fun d!77237 () Bool)

(declare-fun res!191057 () Bool)

(declare-fun e!155951 () Bool)

(assert (=> d!77237 (=> res!191057 e!155951)))

(assert (=> d!77237 (= res!191057 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77237 (= (arrayRangesEq!866 lt!364368 (_3!863 lt!364376) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!155951)))

(declare-fun b!227752 () Bool)

(declare-fun e!155952 () Bool)

(assert (=> b!227752 (= e!155951 e!155952)))

(declare-fun res!191058 () Bool)

(assert (=> b!227752 (=> (not res!191058) (not e!155952))))

(assert (=> b!227752 (= res!191058 (= (select (arr!6008 lt!364368) #b00000000000000000000000000000000) (select (arr!6008 (_3!863 lt!364376)) #b00000000000000000000000000000000)))))

(declare-fun b!227753 () Bool)

(assert (=> b!227753 (= e!155952 (arrayRangesEq!866 lt!364368 (_3!863 lt!364376) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!77237 (not res!191057)) b!227752))

(assert (= (and b!227752 res!191058) b!227753))

(declare-fun m!350575 () Bool)

(assert (=> b!227752 m!350575))

(declare-fun m!350577 () Bool)

(assert (=> b!227752 m!350577))

(declare-fun m!350579 () Bool)

(assert (=> b!227753 m!350579))

(assert (=> b!227721 d!77237))

(declare-fun d!77243 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77243 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5030 (buf!5571 thiss!1870))) ((_ sign_extend 32) (currentByte!10415 thiss!1870)) ((_ sign_extend 32) (currentBit!10410 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5030 (buf!5571 thiss!1870))) ((_ sign_extend 32) (currentByte!10415 thiss!1870)) ((_ sign_extend 32) (currentBit!10410 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18892 () Bool)

(assert (= bs!18892 d!77243))

(declare-fun m!350581 () Bool)

(assert (=> bs!18892 m!350581))

(assert (=> b!227720 d!77243))

(declare-fun d!77245 () Bool)

(declare-fun e!155955 () Bool)

(assert (=> d!77245 e!155955))

(declare-fun res!191061 () Bool)

(assert (=> d!77245 (=> (not res!191061) (not e!155955))))

(assert (=> d!77245 (= res!191061 (and (or (let ((rhs!3974 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3974 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3974) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77246 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77246 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77246 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3973 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3973 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3973) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!364414 () Unit!17034)

(declare-fun choose!57 (BitStream!9156 BitStream!9156 (_ BitVec 64) (_ BitVec 32)) Unit!17034)

(assert (=> d!77245 (= lt!364414 (choose!57 thiss!1870 (_2!10661 lt!364375) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77245 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10661 lt!364375) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!364414)))

(declare-fun b!227756 () Bool)

(declare-fun lt!364416 () (_ BitVec 32))

(assert (=> b!227756 (= e!155955 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10661 lt!364375)))) ((_ sign_extend 32) (currentByte!10415 (_2!10661 lt!364375))) ((_ sign_extend 32) (currentBit!10410 (_2!10661 lt!364375))) (bvsub (bvsub to!496 i!761) lt!364416)))))

(assert (=> b!227756 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!364416 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!364416) #b10000000000000000000000000000000)))))

(declare-fun lt!364415 () (_ BitVec 64))

(assert (=> b!227756 (= lt!364416 ((_ extract 31 0) lt!364415))))

(assert (=> b!227756 (and (bvslt lt!364415 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!364415 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!227756 (= lt!364415 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77245 res!191061) b!227756))

(declare-fun m!350583 () Bool)

(assert (=> d!77245 m!350583))

(declare-fun m!350585 () Bool)

(assert (=> b!227756 m!350585))

(assert (=> b!227723 d!77245))

(declare-fun d!77248 () Bool)

(declare-fun res!191062 () Bool)

(declare-fun e!155956 () Bool)

(assert (=> d!77248 (=> res!191062 e!155956)))

(assert (=> d!77248 (= res!191062 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77248 (= (arrayRangesEq!866 arr!308 lt!364368 #b00000000000000000000000000000000 i!761) e!155956)))

(declare-fun b!227757 () Bool)

(declare-fun e!155957 () Bool)

(assert (=> b!227757 (= e!155956 e!155957)))

(declare-fun res!191063 () Bool)

(assert (=> b!227757 (=> (not res!191063) (not e!155957))))

(assert (=> b!227757 (= res!191063 (= (select (arr!6008 arr!308) #b00000000000000000000000000000000) (select (arr!6008 lt!364368) #b00000000000000000000000000000000)))))

(declare-fun b!227758 () Bool)

(assert (=> b!227758 (= e!155957 (arrayRangesEq!866 arr!308 lt!364368 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77248 (not res!191062)) b!227757))

(assert (= (and b!227757 res!191063) b!227758))

(declare-fun m!350587 () Bool)

(assert (=> b!227757 m!350587))

(assert (=> b!227757 m!350575))

(declare-fun m!350589 () Bool)

(assert (=> b!227758 m!350589))

(assert (=> b!227723 d!77248))

(declare-fun d!77250 () Bool)

(declare-fun lt!364433 () (_ BitVec 8))

(declare-fun lt!364437 () (_ BitVec 8))

(assert (=> d!77250 (= lt!364433 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6008 (buf!5571 thiss!1870)) (currentByte!10415 thiss!1870))) ((_ sign_extend 24) lt!364437))))))

(assert (=> d!77250 (= lt!364437 ((_ extract 7 0) (currentBit!10410 thiss!1870)))))

(declare-fun e!155971 () Bool)

(assert (=> d!77250 e!155971))

(declare-fun res!191078 () Bool)

(assert (=> d!77250 (=> (not res!191078) (not e!155971))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77250 (= res!191078 (validate_offset_bits!1 ((_ sign_extend 32) (size!5030 (buf!5571 thiss!1870))) ((_ sign_extend 32) (currentByte!10415 thiss!1870)) ((_ sign_extend 32) (currentBit!10410 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19598 0))(
  ( (tuple2!19599 (_1!10664 Unit!17034) (_2!10664 (_ BitVec 8))) )
))
(declare-fun Unit!17043 () Unit!17034)

(declare-fun Unit!17044 () Unit!17034)

(assert (=> d!77250 (= (readByte!0 thiss!1870) (tuple2!19595 (_2!10664 (ite (bvsgt ((_ sign_extend 24) lt!364437) #b00000000000000000000000000000000) (tuple2!19599 Unit!17043 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!364433) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6008 (buf!5571 thiss!1870)) (bvadd (currentByte!10415 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!364437)))))))) (tuple2!19599 Unit!17044 lt!364433))) (BitStream!9157 (buf!5571 thiss!1870) (bvadd (currentByte!10415 thiss!1870) #b00000000000000000000000000000001) (currentBit!10410 thiss!1870))))))

(declare-fun b!227771 () Bool)

(declare-fun e!155970 () Bool)

(assert (=> b!227771 (= e!155971 e!155970)))

(declare-fun res!191079 () Bool)

(assert (=> b!227771 (=> (not res!191079) (not e!155970))))

(declare-fun lt!364434 () tuple2!19594)

(assert (=> b!227771 (= res!191079 (= (buf!5571 (_2!10661 lt!364434)) (buf!5571 thiss!1870)))))

(declare-fun lt!364432 () (_ BitVec 8))

(declare-fun lt!364435 () (_ BitVec 8))

(declare-fun Unit!17046 () Unit!17034)

(declare-fun Unit!17047 () Unit!17034)

(assert (=> b!227771 (= lt!364434 (tuple2!19595 (_2!10664 (ite (bvsgt ((_ sign_extend 24) lt!364435) #b00000000000000000000000000000000) (tuple2!19599 Unit!17046 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!364432) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6008 (buf!5571 thiss!1870)) (bvadd (currentByte!10415 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!364435)))))))) (tuple2!19599 Unit!17047 lt!364432))) (BitStream!9157 (buf!5571 thiss!1870) (bvadd (currentByte!10415 thiss!1870) #b00000000000000000000000000000001) (currentBit!10410 thiss!1870))))))

(assert (=> b!227771 (= lt!364432 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6008 (buf!5571 thiss!1870)) (currentByte!10415 thiss!1870))) ((_ sign_extend 24) lt!364435))))))

(assert (=> b!227771 (= lt!364435 ((_ extract 7 0) (currentBit!10410 thiss!1870)))))

(declare-fun lt!364431 () (_ BitVec 64))

(declare-fun lt!364436 () (_ BitVec 64))

(declare-fun b!227772 () Bool)

(assert (=> b!227772 (= e!155970 (= (bitIndex!0 (size!5030 (buf!5571 (_2!10661 lt!364434))) (currentByte!10415 (_2!10661 lt!364434)) (currentBit!10410 (_2!10661 lt!364434))) (bvadd lt!364436 lt!364431)))))

(assert (=> b!227772 (or (not (= (bvand lt!364436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364431 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!364436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!364436 lt!364431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!227772 (= lt!364431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!227772 (= lt!364436 (bitIndex!0 (size!5030 (buf!5571 thiss!1870)) (currentByte!10415 thiss!1870) (currentBit!10410 thiss!1870)))))

(assert (= (and d!77250 res!191078) b!227771))

(assert (= (and b!227771 res!191079) b!227772))

(declare-fun m!350605 () Bool)

(assert (=> d!77250 m!350605))

(declare-fun m!350607 () Bool)

(assert (=> d!77250 m!350607))

(declare-fun m!350609 () Bool)

(assert (=> d!77250 m!350609))

(assert (=> b!227771 m!350609))

(assert (=> b!227771 m!350605))

(declare-fun m!350611 () Bool)

(assert (=> b!227772 m!350611))

(assert (=> b!227772 m!350509))

(assert (=> b!227723 d!77250))

(declare-fun d!77266 () Bool)

(assert (=> d!77266 (arrayRangesEq!866 arr!308 (_3!863 lt!364376) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364454 () Unit!17034)

(declare-fun choose!318 (array!11464 array!11464 array!11464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17034)

(assert (=> d!77266 (= lt!364454 (choose!318 arr!308 lt!364368 (_3!863 lt!364376) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77266 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77266 (= (arrayRangesEqTransitive!289 arr!308 lt!364368 (_3!863 lt!364376) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!364454)))

(declare-fun bs!18895 () Bool)

(assert (= bs!18895 d!77266))

(assert (=> bs!18895 m!350513))

(declare-fun m!350613 () Bool)

(assert (=> bs!18895 m!350613))

(assert (=> b!227723 d!77266))

(declare-fun d!77268 () Bool)

(declare-fun e!155980 () Bool)

(assert (=> d!77268 e!155980))

(declare-fun res!191091 () Bool)

(assert (=> d!77268 (=> (not res!191091) (not e!155980))))

(declare-fun lt!364477 () (_ BitVec 64))

(declare-fun lt!364479 () (_ BitVec 64))

(declare-fun lt!364475 () (_ BitVec 64))

(assert (=> d!77268 (= res!191091 (= lt!364475 (bvsub lt!364479 lt!364477)))))

(assert (=> d!77268 (or (= (bvand lt!364479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364479 lt!364477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77268 (= lt!364477 (remainingBits!0 ((_ sign_extend 32) (size!5030 (buf!5571 thiss!1870))) ((_ sign_extend 32) (currentByte!10415 thiss!1870)) ((_ sign_extend 32) (currentBit!10410 thiss!1870))))))

(declare-fun lt!364476 () (_ BitVec 64))

(declare-fun lt!364474 () (_ BitVec 64))

(assert (=> d!77268 (= lt!364479 (bvmul lt!364476 lt!364474))))

(assert (=> d!77268 (or (= lt!364476 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364474 (bvsdiv (bvmul lt!364476 lt!364474) lt!364476)))))

(assert (=> d!77268 (= lt!364474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77268 (= lt!364476 ((_ sign_extend 32) (size!5030 (buf!5571 thiss!1870))))))

(assert (=> d!77268 (= lt!364475 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10415 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10410 thiss!1870))))))

(assert (=> d!77268 (invariant!0 (currentBit!10410 thiss!1870) (currentByte!10415 thiss!1870) (size!5030 (buf!5571 thiss!1870)))))

(assert (=> d!77268 (= (bitIndex!0 (size!5030 (buf!5571 thiss!1870)) (currentByte!10415 thiss!1870) (currentBit!10410 thiss!1870)) lt!364475)))

(declare-fun b!227783 () Bool)

(declare-fun res!191090 () Bool)

(assert (=> b!227783 (=> (not res!191090) (not e!155980))))

(assert (=> b!227783 (= res!191090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364475))))

(declare-fun b!227784 () Bool)

(declare-fun lt!364478 () (_ BitVec 64))

(assert (=> b!227784 (= e!155980 (bvsle lt!364475 (bvmul lt!364478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227784 (or (= lt!364478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364478)))))

(assert (=> b!227784 (= lt!364478 ((_ sign_extend 32) (size!5030 (buf!5571 thiss!1870))))))

(assert (= (and d!77268 res!191091) b!227783))

(assert (= (and b!227783 res!191090) b!227784))

(assert (=> d!77268 m!350581))

(assert (=> d!77268 m!350563))

(assert (=> b!227723 d!77268))

(declare-fun d!77272 () Bool)

(declare-fun e!156019 () Bool)

(assert (=> d!77272 e!156019))

(declare-fun res!191136 () Bool)

(assert (=> d!77272 (=> res!191136 e!156019)))

(assert (=> d!77272 (= res!191136 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!364820 () Bool)

(declare-fun e!156017 () Bool)

(assert (=> d!77272 (= lt!364820 e!156017)))

(declare-fun res!191134 () Bool)

(assert (=> d!77272 (=> (not res!191134) (not e!156017))))

(declare-fun lt!364822 () tuple3!1442)

(declare-fun lt!364802 () (_ BitVec 64))

(declare-fun lt!364807 () (_ BitVec 64))

(assert (=> d!77272 (= res!191134 (= (bvadd lt!364802 lt!364807) (bitIndex!0 (size!5030 (buf!5571 (_2!10660 lt!364822))) (currentByte!10415 (_2!10660 lt!364822)) (currentBit!10410 (_2!10660 lt!364822)))))))

(assert (=> d!77272 (or (not (= (bvand lt!364802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364807 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!364802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!364802 lt!364807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!364808 () (_ BitVec 64))

(assert (=> d!77272 (= lt!364807 (bvmul lt!364808 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77272 (or (= lt!364808 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364808 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364808)))))

(assert (=> d!77272 (= lt!364808 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77272 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77272 (= lt!364802 (bitIndex!0 (size!5030 (buf!5571 (_2!10661 lt!364375))) (currentByte!10415 (_2!10661 lt!364375)) (currentBit!10410 (_2!10661 lt!364375))))))

(declare-fun e!156018 () tuple3!1442)

(assert (=> d!77272 (= lt!364822 e!156018)))

(declare-fun c!11220 () Bool)

(assert (=> d!77272 (= c!11220 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77272 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5030 lt!364368)))))

(assert (=> d!77272 (= (readByteArrayLoop!0 (_2!10661 lt!364375) lt!364368 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!364822)))

(declare-fun b!227840 () Bool)

(assert (=> b!227840 (= e!156017 (arrayRangesEq!866 lt!364368 (_3!863 lt!364822) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!227841 () Bool)

(declare-fun lt!364791 () Unit!17034)

(declare-fun lt!364805 () tuple3!1442)

(assert (=> b!227841 (= e!156018 (tuple3!1443 lt!364791 (_2!10660 lt!364805) (_3!863 lt!364805)))))

(declare-fun lt!364792 () tuple2!19594)

(assert (=> b!227841 (= lt!364792 (readByte!0 (_2!10661 lt!364375)))))

(declare-fun lt!364811 () array!11464)

(assert (=> b!227841 (= lt!364811 (array!11465 (store (arr!6008 lt!364368) (bvadd #b00000000000000000000000000000001 i!761) (_1!10661 lt!364792)) (size!5030 lt!364368)))))

(declare-fun lt!364796 () (_ BitVec 64))

(assert (=> b!227841 (= lt!364796 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!364819 () (_ BitVec 32))

(assert (=> b!227841 (= lt!364819 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!364824 () Unit!17034)

(assert (=> b!227841 (= lt!364824 (validateOffsetBytesFromBitIndexLemma!0 (_2!10661 lt!364375) (_2!10661 lt!364792) lt!364796 lt!364819))))

(assert (=> b!227841 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10661 lt!364792)))) ((_ sign_extend 32) (currentByte!10415 (_2!10661 lt!364792))) ((_ sign_extend 32) (currentBit!10410 (_2!10661 lt!364792))) (bvsub lt!364819 ((_ extract 31 0) (bvsdiv (bvadd lt!364796 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!364826 () Unit!17034)

(assert (=> b!227841 (= lt!364826 lt!364824)))

(assert (=> b!227841 (= lt!364805 (readByteArrayLoop!0 (_2!10661 lt!364792) lt!364811 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3871 () (_ BitVec 64))

(assert (=> b!227841 (= call!3871 (bvadd (bitIndex!0 (size!5030 (buf!5571 (_2!10661 lt!364375))) (currentByte!10415 (_2!10661 lt!364375)) (currentBit!10410 (_2!10661 lt!364375))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!364803 () Unit!17034)

(declare-fun Unit!17053 () Unit!17034)

(assert (=> b!227841 (= lt!364803 Unit!17053)))

(assert (=> b!227841 (= (bvadd call!3871 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5030 (buf!5571 (_2!10660 lt!364805))) (currentByte!10415 (_2!10660 lt!364805)) (currentBit!10410 (_2!10660 lt!364805))))))

(declare-fun lt!364815 () Unit!17034)

(declare-fun Unit!17054 () Unit!17034)

(assert (=> b!227841 (= lt!364815 Unit!17054)))

(assert (=> b!227841 (= (bvadd (bitIndex!0 (size!5030 (buf!5571 (_2!10661 lt!364375))) (currentByte!10415 (_2!10661 lt!364375)) (currentBit!10410 (_2!10661 lt!364375))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5030 (buf!5571 (_2!10660 lt!364805))) (currentByte!10415 (_2!10660 lt!364805)) (currentBit!10410 (_2!10660 lt!364805))))))

(declare-fun lt!364798 () Unit!17034)

(declare-fun Unit!17055 () Unit!17034)

(assert (=> b!227841 (= lt!364798 Unit!17055)))

(assert (=> b!227841 (and (= (buf!5571 (_2!10661 lt!364375)) (buf!5571 (_2!10660 lt!364805))) (= (size!5030 lt!364368) (size!5030 (_3!863 lt!364805))))))

(declare-fun lt!364812 () Unit!17034)

(declare-fun Unit!17056 () Unit!17034)

(assert (=> b!227841 (= lt!364812 Unit!17056)))

(declare-fun lt!364818 () Unit!17034)

(assert (=> b!227841 (= lt!364818 (arrayUpdatedAtPrefixLemma!425 lt!364368 (bvadd #b00000000000000000000000000000001 i!761) (_1!10661 lt!364792)))))

(declare-fun call!3872 () Bool)

(assert (=> b!227841 call!3872))

(declare-fun lt!364800 () Unit!17034)

(assert (=> b!227841 (= lt!364800 lt!364818)))

(declare-fun lt!364813 () (_ BitVec 32))

(assert (=> b!227841 (= lt!364813 #b00000000000000000000000000000000)))

(declare-fun lt!364794 () Unit!17034)

(assert (=> b!227841 (= lt!364794 (arrayRangesEqTransitive!289 lt!364368 lt!364811 (_3!863 lt!364805) lt!364813 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3873 () Bool)

(assert (=> b!227841 call!3873))

(declare-fun lt!364810 () Unit!17034)

(assert (=> b!227841 (= lt!364810 lt!364794)))

(assert (=> b!227841 (arrayRangesEq!866 lt!364368 (_3!863 lt!364805) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!364809 () Unit!17034)

(declare-fun Unit!17060 () Unit!17034)

(assert (=> b!227841 (= lt!364809 Unit!17060)))

(declare-fun lt!364814 () Unit!17034)

(declare-fun arrayRangesEqImpliesEq!122 (array!11464 array!11464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17034)

(assert (=> b!227841 (= lt!364814 (arrayRangesEqImpliesEq!122 lt!364811 (_3!863 lt!364805) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227841 (= (select (store (arr!6008 lt!364368) (bvadd #b00000000000000000000000000000001 i!761) (_1!10661 lt!364792)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6008 (_3!863 lt!364805)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!364821 () Unit!17034)

(assert (=> b!227841 (= lt!364821 lt!364814)))

(declare-fun lt!364825 () Bool)

(assert (=> b!227841 (= lt!364825 (= (select (arr!6008 (_3!863 lt!364805)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10661 lt!364792)))))

(declare-fun Unit!17062 () Unit!17034)

(assert (=> b!227841 (= lt!364791 Unit!17062)))

(assert (=> b!227841 lt!364825))

(declare-fun b!227842 () Bool)

(declare-datatypes ((tuple2!19606 0))(
  ( (tuple2!19607 (_1!10668 BitStream!9156) (_2!10668 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9156) tuple2!19606)

(assert (=> b!227842 (= e!156019 (= (select (arr!6008 (_3!863 lt!364822)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10668 (readBytePure!0 (_2!10661 lt!364375)))))))

(assert (=> b!227842 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5030 (_3!863 lt!364822))))))

(declare-fun bm!3868 () Bool)

(assert (=> bm!3868 (= call!3873 (arrayRangesEq!866 lt!364368 (ite c!11220 (_3!863 lt!364805) lt!364368) (ite c!11220 lt!364813 #b00000000000000000000000000000000) (ite c!11220 (bvadd #b00000000000000000000000000000001 i!761) (size!5030 lt!364368))))))

(declare-fun b!227843 () Bool)

(declare-fun res!191135 () Bool)

(assert (=> b!227843 (=> (not res!191135) (not e!156017))))

(assert (=> b!227843 (= res!191135 (and (= (buf!5571 (_2!10661 lt!364375)) (buf!5571 (_2!10660 lt!364822))) (= (size!5030 lt!364368) (size!5030 (_3!863 lt!364822)))))))

(declare-fun bm!3869 () Bool)

(assert (=> bm!3869 (= call!3871 (bitIndex!0 (ite c!11220 (size!5030 (buf!5571 (_2!10661 lt!364792))) (size!5030 (buf!5571 (_2!10661 lt!364375)))) (ite c!11220 (currentByte!10415 (_2!10661 lt!364792)) (currentByte!10415 (_2!10661 lt!364375))) (ite c!11220 (currentBit!10410 (_2!10661 lt!364792)) (currentBit!10410 (_2!10661 lt!364375)))))))

(declare-fun bm!3870 () Bool)

(declare-fun lt!364823 () (_ BitVec 32))

(declare-fun lt!364793 () array!11464)

(declare-fun lt!364806 () array!11464)

(declare-fun lt!364797 () (_ BitVec 32))

(assert (=> bm!3870 (= call!3872 (arrayRangesEq!866 (ite c!11220 lt!364368 lt!364793) (ite c!11220 (array!11465 (store (arr!6008 lt!364368) (bvadd #b00000000000000000000000000000001 i!761) (_1!10661 lt!364792)) (size!5030 lt!364368)) lt!364806) (ite c!11220 #b00000000000000000000000000000000 lt!364823) (ite c!11220 (bvadd #b00000000000000000000000000000001 i!761) lt!364797)))))

(declare-fun lt!364795 () Unit!17034)

(declare-fun b!227844 () Bool)

(assert (=> b!227844 (= e!156018 (tuple3!1443 lt!364795 (_2!10661 lt!364375) lt!364368))))

(assert (=> b!227844 (= call!3871 call!3871)))

(declare-fun lt!364801 () Unit!17034)

(declare-fun Unit!17063 () Unit!17034)

(assert (=> b!227844 (= lt!364801 Unit!17063)))

(declare-fun lt!364799 () Unit!17034)

(declare-fun arrayRangesEqReflexiveLemma!137 (array!11464) Unit!17034)

(assert (=> b!227844 (= lt!364799 (arrayRangesEqReflexiveLemma!137 lt!364368))))

(assert (=> b!227844 call!3873))

(declare-fun lt!364817 () Unit!17034)

(assert (=> b!227844 (= lt!364817 lt!364799)))

(assert (=> b!227844 (= lt!364793 lt!364368)))

(assert (=> b!227844 (= lt!364806 lt!364368)))

(declare-fun lt!364816 () (_ BitVec 32))

(assert (=> b!227844 (= lt!364816 #b00000000000000000000000000000000)))

(declare-fun lt!364804 () (_ BitVec 32))

(assert (=> b!227844 (= lt!364804 (size!5030 lt!364368))))

(assert (=> b!227844 (= lt!364823 #b00000000000000000000000000000000)))

(assert (=> b!227844 (= lt!364797 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!122 (array!11464 array!11464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17034)

(assert (=> b!227844 (= lt!364795 (arrayRangesEqSlicedLemma!122 lt!364793 lt!364806 lt!364816 lt!364804 lt!364823 lt!364797))))

(assert (=> b!227844 call!3872))

(assert (= (and d!77272 c!11220) b!227841))

(assert (= (and d!77272 (not c!11220)) b!227844))

(assert (= (or b!227841 b!227844) bm!3870))

(assert (= (or b!227841 b!227844) bm!3868))

(assert (= (or b!227841 b!227844) bm!3869))

(assert (= (and d!77272 res!191134) b!227843))

(assert (= (and b!227843 res!191135) b!227840))

(assert (= (and d!77272 (not res!191136)) b!227842))

(declare-fun m!350695 () Bool)

(assert (=> bm!3868 m!350695))

(declare-fun m!350697 () Bool)

(assert (=> d!77272 m!350697))

(assert (=> d!77272 m!350517))

(declare-fun m!350699 () Bool)

(assert (=> b!227841 m!350699))

(declare-fun m!350701 () Bool)

(assert (=> b!227841 m!350701))

(declare-fun m!350703 () Bool)

(assert (=> b!227841 m!350703))

(declare-fun m!350705 () Bool)

(assert (=> b!227841 m!350705))

(assert (=> b!227841 m!350517))

(declare-fun m!350707 () Bool)

(assert (=> b!227841 m!350707))

(declare-fun m!350709 () Bool)

(assert (=> b!227841 m!350709))

(declare-fun m!350711 () Bool)

(assert (=> b!227841 m!350711))

(declare-fun m!350713 () Bool)

(assert (=> b!227841 m!350713))

(declare-fun m!350715 () Bool)

(assert (=> b!227841 m!350715))

(declare-fun m!350717 () Bool)

(assert (=> b!227841 m!350717))

(declare-fun m!350719 () Bool)

(assert (=> b!227841 m!350719))

(declare-fun m!350721 () Bool)

(assert (=> b!227841 m!350721))

(assert (=> bm!3870 m!350717))

(declare-fun m!350723 () Bool)

(assert (=> bm!3870 m!350723))

(declare-fun m!350725 () Bool)

(assert (=> b!227842 m!350725))

(declare-fun m!350727 () Bool)

(assert (=> b!227842 m!350727))

(declare-fun m!350729 () Bool)

(assert (=> bm!3869 m!350729))

(declare-fun m!350731 () Bool)

(assert (=> b!227844 m!350731))

(declare-fun m!350733 () Bool)

(assert (=> b!227844 m!350733))

(declare-fun m!350735 () Bool)

(assert (=> b!227840 m!350735))

(assert (=> b!227723 d!77272))

(declare-fun d!77294 () Bool)

(declare-fun res!191137 () Bool)

(declare-fun e!156020 () Bool)

(assert (=> d!77294 (=> res!191137 e!156020)))

(assert (=> d!77294 (= res!191137 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77294 (= (arrayRangesEq!866 arr!308 (_3!863 lt!364376) #b00000000000000000000000000000000 i!761) e!156020)))

(declare-fun b!227845 () Bool)

(declare-fun e!156021 () Bool)

(assert (=> b!227845 (= e!156020 e!156021)))

(declare-fun res!191138 () Bool)

(assert (=> b!227845 (=> (not res!191138) (not e!156021))))

(assert (=> b!227845 (= res!191138 (= (select (arr!6008 arr!308) #b00000000000000000000000000000000) (select (arr!6008 (_3!863 lt!364376)) #b00000000000000000000000000000000)))))

(declare-fun b!227846 () Bool)

(assert (=> b!227846 (= e!156021 (arrayRangesEq!866 arr!308 (_3!863 lt!364376) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77294 (not res!191137)) b!227845))

(assert (= (and b!227845 res!191138) b!227846))

(assert (=> b!227845 m!350587))

(assert (=> b!227845 m!350577))

(declare-fun m!350737 () Bool)

(assert (=> b!227846 m!350737))

(assert (=> b!227723 d!77294))

(declare-fun d!77296 () Bool)

(declare-fun e!156031 () Bool)

(assert (=> d!77296 e!156031))

(declare-fun res!191150 () Bool)

(assert (=> d!77296 (=> (not res!191150) (not e!156031))))

(assert (=> d!77296 (= res!191150 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5030 arr!308))))))

(declare-fun lt!364857 () Unit!17034)

(declare-fun choose!321 (array!11464 (_ BitVec 32) (_ BitVec 8)) Unit!17034)

(assert (=> d!77296 (= lt!364857 (choose!321 arr!308 i!761 (_1!10661 lt!364375)))))

(assert (=> d!77296 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5030 arr!308)))))

(assert (=> d!77296 (= (arrayUpdatedAtPrefixLemma!425 arr!308 i!761 (_1!10661 lt!364375)) lt!364857)))

(declare-fun b!227858 () Bool)

(assert (=> b!227858 (= e!156031 (arrayRangesEq!866 arr!308 (array!11465 (store (arr!6008 arr!308) i!761 (_1!10661 lt!364375)) (size!5030 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77296 res!191150) b!227858))

(declare-fun m!350743 () Bool)

(assert (=> d!77296 m!350743))

(assert (=> b!227858 m!350501))

(declare-fun m!350745 () Bool)

(assert (=> b!227858 m!350745))

(assert (=> b!227723 d!77296))

(declare-fun d!77302 () Bool)

(declare-fun e!156033 () Bool)

(assert (=> d!77302 e!156033))

(declare-fun res!191154 () Bool)

(assert (=> d!77302 (=> (not res!191154) (not e!156033))))

(declare-fun lt!364869 () (_ BitVec 64))

(declare-fun lt!364865 () (_ BitVec 64))

(declare-fun lt!364867 () (_ BitVec 64))

(assert (=> d!77302 (= res!191154 (= lt!364865 (bvsub lt!364869 lt!364867)))))

(assert (=> d!77302 (or (= (bvand lt!364869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364869 lt!364867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77302 (= lt!364867 (remainingBits!0 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10660 lt!364376)))) ((_ sign_extend 32) (currentByte!10415 (_2!10660 lt!364376))) ((_ sign_extend 32) (currentBit!10410 (_2!10660 lt!364376)))))))

(declare-fun lt!364866 () (_ BitVec 64))

(declare-fun lt!364864 () (_ BitVec 64))

(assert (=> d!77302 (= lt!364869 (bvmul lt!364866 lt!364864))))

(assert (=> d!77302 (or (= lt!364866 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364864 (bvsdiv (bvmul lt!364866 lt!364864) lt!364866)))))

(assert (=> d!77302 (= lt!364864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77302 (= lt!364866 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10660 lt!364376)))))))

(assert (=> d!77302 (= lt!364865 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10415 (_2!10660 lt!364376))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10410 (_2!10660 lt!364376)))))))

(assert (=> d!77302 (invariant!0 (currentBit!10410 (_2!10660 lt!364376)) (currentByte!10415 (_2!10660 lt!364376)) (size!5030 (buf!5571 (_2!10660 lt!364376))))))

(assert (=> d!77302 (= (bitIndex!0 (size!5030 (buf!5571 (_2!10660 lt!364376))) (currentByte!10415 (_2!10660 lt!364376)) (currentBit!10410 (_2!10660 lt!364376))) lt!364865)))

(declare-fun b!227861 () Bool)

(declare-fun res!191153 () Bool)

(assert (=> b!227861 (=> (not res!191153) (not e!156033))))

(assert (=> b!227861 (= res!191153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364865))))

(declare-fun b!227862 () Bool)

(declare-fun lt!364868 () (_ BitVec 64))

(assert (=> b!227862 (= e!156033 (bvsle lt!364865 (bvmul lt!364868 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227862 (or (= lt!364868 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364868 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364868)))))

(assert (=> b!227862 (= lt!364868 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10660 lt!364376)))))))

(assert (= (and d!77302 res!191154) b!227861))

(assert (= (and b!227861 res!191153) b!227862))

(declare-fun m!350753 () Bool)

(assert (=> d!77302 m!350753))

(declare-fun m!350755 () Bool)

(assert (=> d!77302 m!350755))

(assert (=> b!227723 d!77302))

(declare-fun d!77310 () Bool)

(declare-fun e!156036 () Bool)

(assert (=> d!77310 e!156036))

(declare-fun res!191158 () Bool)

(assert (=> d!77310 (=> (not res!191158) (not e!156036))))

(declare-fun lt!364875 () (_ BitVec 64))

(declare-fun lt!364873 () (_ BitVec 64))

(declare-fun lt!364871 () (_ BitVec 64))

(assert (=> d!77310 (= res!191158 (= lt!364871 (bvsub lt!364875 lt!364873)))))

(assert (=> d!77310 (or (= (bvand lt!364875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364875 lt!364873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77310 (= lt!364873 (remainingBits!0 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10661 lt!364375)))) ((_ sign_extend 32) (currentByte!10415 (_2!10661 lt!364375))) ((_ sign_extend 32) (currentBit!10410 (_2!10661 lt!364375)))))))

(declare-fun lt!364872 () (_ BitVec 64))

(declare-fun lt!364870 () (_ BitVec 64))

(assert (=> d!77310 (= lt!364875 (bvmul lt!364872 lt!364870))))

(assert (=> d!77310 (or (= lt!364872 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364870 (bvsdiv (bvmul lt!364872 lt!364870) lt!364872)))))

(assert (=> d!77310 (= lt!364870 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77310 (= lt!364872 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10661 lt!364375)))))))

(assert (=> d!77310 (= lt!364871 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10415 (_2!10661 lt!364375))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10410 (_2!10661 lt!364375)))))))

(assert (=> d!77310 (invariant!0 (currentBit!10410 (_2!10661 lt!364375)) (currentByte!10415 (_2!10661 lt!364375)) (size!5030 (buf!5571 (_2!10661 lt!364375))))))

(assert (=> d!77310 (= (bitIndex!0 (size!5030 (buf!5571 (_2!10661 lt!364375))) (currentByte!10415 (_2!10661 lt!364375)) (currentBit!10410 (_2!10661 lt!364375))) lt!364871)))

(declare-fun b!227865 () Bool)

(declare-fun res!191157 () Bool)

(assert (=> b!227865 (=> (not res!191157) (not e!156036))))

(assert (=> b!227865 (= res!191157 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364871))))

(declare-fun b!227866 () Bool)

(declare-fun lt!364874 () (_ BitVec 64))

(assert (=> b!227866 (= e!156036 (bvsle lt!364871 (bvmul lt!364874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227866 (or (= lt!364874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364874)))))

(assert (=> b!227866 (= lt!364874 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10661 lt!364375)))))))

(assert (= (and d!77310 res!191158) b!227865))

(assert (= (and b!227865 res!191157) b!227866))

(declare-fun m!350757 () Bool)

(assert (=> d!77310 m!350757))

(declare-fun m!350759 () Bool)

(assert (=> d!77310 m!350759))

(assert (=> b!227723 d!77310))

(declare-fun d!77312 () Bool)

(assert (=> d!77312 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10661 lt!364375)))) ((_ sign_extend 32) (currentByte!10415 (_2!10661 lt!364375))) ((_ sign_extend 32) (currentBit!10410 (_2!10661 lt!364375))) lt!364373) (bvsle ((_ sign_extend 32) lt!364373) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5030 (buf!5571 (_2!10661 lt!364375)))) ((_ sign_extend 32) (currentByte!10415 (_2!10661 lt!364375))) ((_ sign_extend 32) (currentBit!10410 (_2!10661 lt!364375)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18899 () Bool)

(assert (= bs!18899 d!77312))

(assert (=> bs!18899 m!350757))

(assert (=> b!227723 d!77312))

(check-sat (not d!77266) (not b!227753) (not bm!3869) (not b!227758) (not b!227841) (not d!77268) (not b!227772) (not b!227846) (not d!77296) (not b!227844) (not b!227840) (not bm!3868) (not d!77302) (not b!227842) (not d!77310) (not b!227858) (not d!77312) (not bm!3870) (not b!227756) (not d!77233) (not d!77245) (not d!77250) (not d!77272) (not d!77243))

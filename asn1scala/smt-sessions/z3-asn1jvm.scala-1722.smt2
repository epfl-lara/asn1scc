; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47554 () Bool)

(assert start!47554)

(declare-fun res!190094 () Bool)

(declare-fun e!154886 () Bool)

(assert (=> start!47554 (=> (not res!190094) (not e!154886))))

(declare-datatypes ((array!11338 0))(
  ( (array!11339 (arr!5939 (Array (_ BitVec 32) (_ BitVec 8))) (size!4973 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11338)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47554 (= res!190094 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4973 arr!308))))))

(assert (=> start!47554 e!154886))

(assert (=> start!47554 true))

(declare-fun array_inv!4714 (array!11338) Bool)

(assert (=> start!47554 (array_inv!4714 arr!308)))

(declare-datatypes ((BitStream!9042 0))(
  ( (BitStream!9043 (buf!5514 array!11338) (currentByte!10334 (_ BitVec 32)) (currentBit!10329 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9042)

(declare-fun e!154888 () Bool)

(declare-fun inv!12 (BitStream!9042) Bool)

(assert (=> start!47554 (and (inv!12 thiss!1870) e!154888)))

(declare-fun b!226556 () Bool)

(declare-fun lt!360870 () (_ BitVec 64))

(declare-datatypes ((Unit!16790 0))(
  ( (Unit!16791) )
))
(declare-datatypes ((tuple3!1328 0))(
  ( (tuple3!1329 (_1!10522 Unit!16790) (_2!10522 BitStream!9042) (_3!806 array!11338)) )
))
(declare-fun lt!360868 () tuple3!1328)

(declare-fun lt!360866 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226556 (= e!154886 (not (= (bvadd lt!360870 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!360866))) (bitIndex!0 (size!4973 (buf!5514 (_2!10522 lt!360868))) (currentByte!10334 (_2!10522 lt!360868)) (currentBit!10329 (_2!10522 lt!360868))))))))

(declare-fun lt!360869 () (_ BitVec 64))

(assert (=> b!226556 (= lt!360870 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!360869))))

(declare-datatypes ((tuple2!19432 0))(
  ( (tuple2!19433 (_1!10523 (_ BitVec 8)) (_2!10523 BitStream!9042)) )
))
(declare-fun lt!360867 () tuple2!19432)

(assert (=> b!226556 (= lt!360870 (bitIndex!0 (size!4973 (buf!5514 (_2!10523 lt!360867))) (currentByte!10334 (_2!10523 lt!360867)) (currentBit!10329 (_2!10523 lt!360867))))))

(assert (=> b!226556 (= lt!360869 (bitIndex!0 (size!4973 (buf!5514 thiss!1870)) (currentByte!10334 thiss!1870) (currentBit!10329 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9042 array!11338 (_ BitVec 32) (_ BitVec 32)) tuple3!1328)

(assert (=> b!226556 (= lt!360868 (readByteArrayLoop!0 (_2!10523 lt!360867) (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226556 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10523 lt!360867)))) ((_ sign_extend 32) (currentByte!10334 (_2!10523 lt!360867))) ((_ sign_extend 32) (currentBit!10329 (_2!10523 lt!360867))) lt!360866)))

(assert (=> b!226556 (= lt!360866 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360865 () Unit!16790)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9042 BitStream!9042 (_ BitVec 64) (_ BitVec 32)) Unit!16790)

(assert (=> b!226556 (= lt!360865 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10523 lt!360867) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9042) tuple2!19432)

(assert (=> b!226556 (= lt!360867 (readByte!0 thiss!1870))))

(declare-fun b!226557 () Bool)

(assert (=> b!226557 (= e!154888 (array_inv!4714 (buf!5514 thiss!1870)))))

(declare-fun b!226554 () Bool)

(declare-fun res!190095 () Bool)

(assert (=> b!226554 (=> (not res!190095) (not e!154886))))

(assert (=> b!226554 (= res!190095 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4973 (buf!5514 thiss!1870))) ((_ sign_extend 32) (currentByte!10334 thiss!1870)) ((_ sign_extend 32) (currentBit!10329 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226555 () Bool)

(declare-fun res!190096 () Bool)

(assert (=> b!226555 (=> (not res!190096) (not e!154886))))

(assert (=> b!226555 (= res!190096 (bvslt i!761 to!496))))

(assert (= (and start!47554 res!190094) b!226554))

(assert (= (and b!226554 res!190095) b!226555))

(assert (= (and b!226555 res!190096) b!226556))

(assert (= start!47554 b!226557))

(declare-fun m!348061 () Bool)

(assert (=> start!47554 m!348061))

(declare-fun m!348063 () Bool)

(assert (=> start!47554 m!348063))

(declare-fun m!348065 () Bool)

(assert (=> b!226556 m!348065))

(declare-fun m!348067 () Bool)

(assert (=> b!226556 m!348067))

(declare-fun m!348069 () Bool)

(assert (=> b!226556 m!348069))

(declare-fun m!348071 () Bool)

(assert (=> b!226556 m!348071))

(declare-fun m!348073 () Bool)

(assert (=> b!226556 m!348073))

(declare-fun m!348075 () Bool)

(assert (=> b!226556 m!348075))

(declare-fun m!348077 () Bool)

(assert (=> b!226556 m!348077))

(declare-fun m!348079 () Bool)

(assert (=> b!226556 m!348079))

(declare-fun m!348081 () Bool)

(assert (=> b!226557 m!348081))

(declare-fun m!348083 () Bool)

(assert (=> b!226554 m!348083))

(check-sat (not start!47554) (not b!226554) (not b!226557) (not b!226556))
(check-sat)
(get-model)

(declare-fun d!76895 () Bool)

(assert (=> d!76895 (= (array_inv!4714 arr!308) (bvsge (size!4973 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47554 d!76895))

(declare-fun d!76897 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76897 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10329 thiss!1870) (currentByte!10334 thiss!1870) (size!4973 (buf!5514 thiss!1870))))))

(declare-fun bs!18798 () Bool)

(assert (= bs!18798 d!76897))

(declare-fun m!348109 () Bool)

(assert (=> bs!18798 m!348109))

(assert (=> start!47554 d!76897))

(declare-fun d!76899 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76899 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4973 (buf!5514 thiss!1870))) ((_ sign_extend 32) (currentByte!10334 thiss!1870)) ((_ sign_extend 32) (currentBit!10329 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4973 (buf!5514 thiss!1870))) ((_ sign_extend 32) (currentByte!10334 thiss!1870)) ((_ sign_extend 32) (currentBit!10329 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18799 () Bool)

(assert (= bs!18799 d!76899))

(declare-fun m!348111 () Bool)

(assert (=> bs!18799 m!348111))

(assert (=> b!226554 d!76899))

(declare-fun d!76901 () Bool)

(assert (=> d!76901 (= (array_inv!4714 (buf!5514 thiss!1870)) (bvsge (size!4973 (buf!5514 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226557 d!76901))

(declare-fun d!76903 () Bool)

(declare-fun lt!360951 () (_ BitVec 8))

(declare-fun lt!360948 () (_ BitVec 8))

(assert (=> d!76903 (= lt!360951 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5939 (buf!5514 thiss!1870)) (currentByte!10334 thiss!1870))) ((_ sign_extend 24) lt!360948))))))

(assert (=> d!76903 (= lt!360948 ((_ extract 7 0) (currentBit!10329 thiss!1870)))))

(declare-fun e!154912 () Bool)

(assert (=> d!76903 e!154912))

(declare-fun res!190125 () Bool)

(assert (=> d!76903 (=> (not res!190125) (not e!154912))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76903 (= res!190125 (validate_offset_bits!1 ((_ sign_extend 32) (size!4973 (buf!5514 thiss!1870))) ((_ sign_extend 32) (currentByte!10334 thiss!1870)) ((_ sign_extend 32) (currentBit!10329 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19436 0))(
  ( (tuple2!19437 (_1!10526 Unit!16790) (_2!10526 (_ BitVec 8))) )
))
(declare-fun Unit!16794 () Unit!16790)

(declare-fun Unit!16795 () Unit!16790)

(assert (=> d!76903 (= (readByte!0 thiss!1870) (tuple2!19433 (_2!10526 (ite (bvsgt ((_ sign_extend 24) lt!360948) #b00000000000000000000000000000000) (tuple2!19437 Unit!16794 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!360951) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5939 (buf!5514 thiss!1870)) (bvadd (currentByte!10334 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!360948)))))))) (tuple2!19437 Unit!16795 lt!360951))) (BitStream!9043 (buf!5514 thiss!1870) (bvadd (currentByte!10334 thiss!1870) #b00000000000000000000000000000001) (currentBit!10329 thiss!1870))))))

(declare-fun b!226588 () Bool)

(declare-fun e!154913 () Bool)

(assert (=> b!226588 (= e!154912 e!154913)))

(declare-fun res!190126 () Bool)

(assert (=> b!226588 (=> (not res!190126) (not e!154913))))

(declare-fun lt!360946 () tuple2!19432)

(assert (=> b!226588 (= res!190126 (= (buf!5514 (_2!10523 lt!360946)) (buf!5514 thiss!1870)))))

(declare-fun lt!360949 () (_ BitVec 8))

(declare-fun lt!360947 () (_ BitVec 8))

(declare-fun Unit!16796 () Unit!16790)

(declare-fun Unit!16797 () Unit!16790)

(assert (=> b!226588 (= lt!360946 (tuple2!19433 (_2!10526 (ite (bvsgt ((_ sign_extend 24) lt!360949) #b00000000000000000000000000000000) (tuple2!19437 Unit!16796 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!360947) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5939 (buf!5514 thiss!1870)) (bvadd (currentByte!10334 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!360949)))))))) (tuple2!19437 Unit!16797 lt!360947))) (BitStream!9043 (buf!5514 thiss!1870) (bvadd (currentByte!10334 thiss!1870) #b00000000000000000000000000000001) (currentBit!10329 thiss!1870))))))

(assert (=> b!226588 (= lt!360947 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5939 (buf!5514 thiss!1870)) (currentByte!10334 thiss!1870))) ((_ sign_extend 24) lt!360949))))))

(assert (=> b!226588 (= lt!360949 ((_ extract 7 0) (currentBit!10329 thiss!1870)))))

(declare-fun lt!360945 () (_ BitVec 64))

(declare-fun lt!360950 () (_ BitVec 64))

(declare-fun b!226589 () Bool)

(assert (=> b!226589 (= e!154913 (= (bitIndex!0 (size!4973 (buf!5514 (_2!10523 lt!360946))) (currentByte!10334 (_2!10523 lt!360946)) (currentBit!10329 (_2!10523 lt!360946))) (bvadd lt!360945 lt!360950)))))

(assert (=> b!226589 (or (not (= (bvand lt!360945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360950 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!360945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!360945 lt!360950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226589 (= lt!360950 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226589 (= lt!360945 (bitIndex!0 (size!4973 (buf!5514 thiss!1870)) (currentByte!10334 thiss!1870) (currentBit!10329 thiss!1870)))))

(assert (= (and d!76903 res!190125) b!226588))

(assert (= (and b!226588 res!190126) b!226589))

(declare-fun m!348125 () Bool)

(assert (=> d!76903 m!348125))

(declare-fun m!348127 () Bool)

(assert (=> d!76903 m!348127))

(declare-fun m!348129 () Bool)

(assert (=> d!76903 m!348129))

(assert (=> b!226588 m!348129))

(assert (=> b!226588 m!348125))

(declare-fun m!348131 () Bool)

(assert (=> b!226589 m!348131))

(assert (=> b!226589 m!348073))

(assert (=> b!226556 d!76903))

(declare-fun d!76915 () Bool)

(declare-fun e!154916 () Bool)

(assert (=> d!76915 e!154916))

(declare-fun res!190132 () Bool)

(assert (=> d!76915 (=> (not res!190132) (not e!154916))))

(declare-fun lt!360968 () (_ BitVec 64))

(declare-fun lt!360967 () (_ BitVec 64))

(declare-fun lt!360964 () (_ BitVec 64))

(assert (=> d!76915 (= res!190132 (= lt!360967 (bvsub lt!360968 lt!360964)))))

(assert (=> d!76915 (or (= (bvand lt!360968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360964 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360968 lt!360964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76915 (= lt!360964 (remainingBits!0 ((_ sign_extend 32) (size!4973 (buf!5514 thiss!1870))) ((_ sign_extend 32) (currentByte!10334 thiss!1870)) ((_ sign_extend 32) (currentBit!10329 thiss!1870))))))

(declare-fun lt!360965 () (_ BitVec 64))

(declare-fun lt!360969 () (_ BitVec 64))

(assert (=> d!76915 (= lt!360968 (bvmul lt!360965 lt!360969))))

(assert (=> d!76915 (or (= lt!360965 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360969 (bvsdiv (bvmul lt!360965 lt!360969) lt!360965)))))

(assert (=> d!76915 (= lt!360969 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76915 (= lt!360965 ((_ sign_extend 32) (size!4973 (buf!5514 thiss!1870))))))

(assert (=> d!76915 (= lt!360967 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10334 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10329 thiss!1870))))))

(assert (=> d!76915 (invariant!0 (currentBit!10329 thiss!1870) (currentByte!10334 thiss!1870) (size!4973 (buf!5514 thiss!1870)))))

(assert (=> d!76915 (= (bitIndex!0 (size!4973 (buf!5514 thiss!1870)) (currentByte!10334 thiss!1870) (currentBit!10329 thiss!1870)) lt!360967)))

(declare-fun b!226594 () Bool)

(declare-fun res!190131 () Bool)

(assert (=> b!226594 (=> (not res!190131) (not e!154916))))

(assert (=> b!226594 (= res!190131 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360967))))

(declare-fun b!226595 () Bool)

(declare-fun lt!360966 () (_ BitVec 64))

(assert (=> b!226595 (= e!154916 (bvsle lt!360967 (bvmul lt!360966 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226595 (or (= lt!360966 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360966 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360966)))))

(assert (=> b!226595 (= lt!360966 ((_ sign_extend 32) (size!4973 (buf!5514 thiss!1870))))))

(assert (= (and d!76915 res!190132) b!226594))

(assert (= (and b!226594 res!190131) b!226595))

(assert (=> d!76915 m!348111))

(assert (=> d!76915 m!348109))

(assert (=> b!226556 d!76915))

(declare-fun d!76917 () Bool)

(declare-fun e!154919 () Bool)

(assert (=> d!76917 e!154919))

(declare-fun res!190135 () Bool)

(assert (=> d!76917 (=> (not res!190135) (not e!154919))))

(assert (=> d!76917 (= res!190135 (and (or (let ((rhs!3894 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3894 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3894) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76918 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76918 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76918 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3893 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3893 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3893) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!360976 () Unit!16790)

(declare-fun choose!57 (BitStream!9042 BitStream!9042 (_ BitVec 64) (_ BitVec 32)) Unit!16790)

(assert (=> d!76917 (= lt!360976 (choose!57 thiss!1870 (_2!10523 lt!360867) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76917 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10523 lt!360867) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!360976)))

(declare-fun lt!360977 () (_ BitVec 32))

(declare-fun b!226598 () Bool)

(assert (=> b!226598 (= e!154919 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10523 lt!360867)))) ((_ sign_extend 32) (currentByte!10334 (_2!10523 lt!360867))) ((_ sign_extend 32) (currentBit!10329 (_2!10523 lt!360867))) (bvsub (bvsub to!496 i!761) lt!360977)))))

(assert (=> b!226598 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!360977 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!360977) #b10000000000000000000000000000000)))))

(declare-fun lt!360978 () (_ BitVec 64))

(assert (=> b!226598 (= lt!360977 ((_ extract 31 0) lt!360978))))

(assert (=> b!226598 (and (bvslt lt!360978 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!360978 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226598 (= lt!360978 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76917 res!190135) b!226598))

(declare-fun m!348133 () Bool)

(assert (=> d!76917 m!348133))

(declare-fun m!348135 () Bool)

(assert (=> b!226598 m!348135))

(assert (=> b!226556 d!76917))

(declare-fun d!76920 () Bool)

(declare-fun e!154920 () Bool)

(assert (=> d!76920 e!154920))

(declare-fun res!190137 () Bool)

(assert (=> d!76920 (=> (not res!190137) (not e!154920))))

(declare-fun lt!360982 () (_ BitVec 64))

(declare-fun lt!360979 () (_ BitVec 64))

(declare-fun lt!360983 () (_ BitVec 64))

(assert (=> d!76920 (= res!190137 (= lt!360982 (bvsub lt!360983 lt!360979)))))

(assert (=> d!76920 (or (= (bvand lt!360983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360979 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360983 lt!360979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76920 (= lt!360979 (remainingBits!0 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10523 lt!360867)))) ((_ sign_extend 32) (currentByte!10334 (_2!10523 lt!360867))) ((_ sign_extend 32) (currentBit!10329 (_2!10523 lt!360867)))))))

(declare-fun lt!360980 () (_ BitVec 64))

(declare-fun lt!360984 () (_ BitVec 64))

(assert (=> d!76920 (= lt!360983 (bvmul lt!360980 lt!360984))))

(assert (=> d!76920 (or (= lt!360980 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360984 (bvsdiv (bvmul lt!360980 lt!360984) lt!360980)))))

(assert (=> d!76920 (= lt!360984 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76920 (= lt!360980 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10523 lt!360867)))))))

(assert (=> d!76920 (= lt!360982 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10334 (_2!10523 lt!360867))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10329 (_2!10523 lt!360867)))))))

(assert (=> d!76920 (invariant!0 (currentBit!10329 (_2!10523 lt!360867)) (currentByte!10334 (_2!10523 lt!360867)) (size!4973 (buf!5514 (_2!10523 lt!360867))))))

(assert (=> d!76920 (= (bitIndex!0 (size!4973 (buf!5514 (_2!10523 lt!360867))) (currentByte!10334 (_2!10523 lt!360867)) (currentBit!10329 (_2!10523 lt!360867))) lt!360982)))

(declare-fun b!226599 () Bool)

(declare-fun res!190136 () Bool)

(assert (=> b!226599 (=> (not res!190136) (not e!154920))))

(assert (=> b!226599 (= res!190136 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360982))))

(declare-fun b!226600 () Bool)

(declare-fun lt!360981 () (_ BitVec 64))

(assert (=> b!226600 (= e!154920 (bvsle lt!360982 (bvmul lt!360981 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226600 (or (= lt!360981 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360981 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360981)))))

(assert (=> b!226600 (= lt!360981 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10523 lt!360867)))))))

(assert (= (and d!76920 res!190137) b!226599))

(assert (= (and b!226599 res!190136) b!226600))

(declare-fun m!348137 () Bool)

(assert (=> d!76920 m!348137))

(declare-fun m!348139 () Bool)

(assert (=> d!76920 m!348139))

(assert (=> b!226556 d!76920))

(declare-fun d!76922 () Bool)

(declare-fun e!154921 () Bool)

(assert (=> d!76922 e!154921))

(declare-fun res!190139 () Bool)

(assert (=> d!76922 (=> (not res!190139) (not e!154921))))

(declare-fun lt!360988 () (_ BitVec 64))

(declare-fun lt!360985 () (_ BitVec 64))

(declare-fun lt!360989 () (_ BitVec 64))

(assert (=> d!76922 (= res!190139 (= lt!360988 (bvsub lt!360989 lt!360985)))))

(assert (=> d!76922 (or (= (bvand lt!360989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360985 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360989 lt!360985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76922 (= lt!360985 (remainingBits!0 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10522 lt!360868)))) ((_ sign_extend 32) (currentByte!10334 (_2!10522 lt!360868))) ((_ sign_extend 32) (currentBit!10329 (_2!10522 lt!360868)))))))

(declare-fun lt!360986 () (_ BitVec 64))

(declare-fun lt!360990 () (_ BitVec 64))

(assert (=> d!76922 (= lt!360989 (bvmul lt!360986 lt!360990))))

(assert (=> d!76922 (or (= lt!360986 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360990 (bvsdiv (bvmul lt!360986 lt!360990) lt!360986)))))

(assert (=> d!76922 (= lt!360990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76922 (= lt!360986 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10522 lt!360868)))))))

(assert (=> d!76922 (= lt!360988 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10334 (_2!10522 lt!360868))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10329 (_2!10522 lt!360868)))))))

(assert (=> d!76922 (invariant!0 (currentBit!10329 (_2!10522 lt!360868)) (currentByte!10334 (_2!10522 lt!360868)) (size!4973 (buf!5514 (_2!10522 lt!360868))))))

(assert (=> d!76922 (= (bitIndex!0 (size!4973 (buf!5514 (_2!10522 lt!360868))) (currentByte!10334 (_2!10522 lt!360868)) (currentBit!10329 (_2!10522 lt!360868))) lt!360988)))

(declare-fun b!226601 () Bool)

(declare-fun res!190138 () Bool)

(assert (=> b!226601 (=> (not res!190138) (not e!154921))))

(assert (=> b!226601 (= res!190138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360988))))

(declare-fun b!226602 () Bool)

(declare-fun lt!360987 () (_ BitVec 64))

(assert (=> b!226602 (= e!154921 (bvsle lt!360988 (bvmul lt!360987 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226602 (or (= lt!360987 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360987 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360987)))))

(assert (=> b!226602 (= lt!360987 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10522 lt!360868)))))))

(assert (= (and d!76922 res!190139) b!226601))

(assert (= (and b!226601 res!190138) b!226602))

(declare-fun m!348141 () Bool)

(assert (=> d!76922 m!348141))

(declare-fun m!348143 () Bool)

(assert (=> d!76922 m!348143))

(assert (=> b!226556 d!76922))

(declare-fun d!76924 () Bool)

(assert (=> d!76924 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10523 lt!360867)))) ((_ sign_extend 32) (currentByte!10334 (_2!10523 lt!360867))) ((_ sign_extend 32) (currentBit!10329 (_2!10523 lt!360867))) lt!360866) (bvsle ((_ sign_extend 32) lt!360866) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10523 lt!360867)))) ((_ sign_extend 32) (currentByte!10334 (_2!10523 lt!360867))) ((_ sign_extend 32) (currentBit!10329 (_2!10523 lt!360867)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18800 () Bool)

(assert (= bs!18800 d!76924))

(assert (=> bs!18800 m!348137))

(assert (=> b!226556 d!76924))

(declare-fun b!226632 () Bool)

(declare-fun e!154941 () Bool)

(declare-fun lt!361185 () tuple3!1328)

(declare-datatypes ((tuple2!19438 0))(
  ( (tuple2!19439 (_1!10527 BitStream!9042) (_2!10527 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9042) tuple2!19438)

(assert (=> b!226632 (= e!154941 (= (select (arr!5939 (_3!806 lt!361185)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10527 (readBytePure!0 (_2!10523 lt!360867)))))))

(assert (=> b!226632 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4973 (_3!806 lt!361185))))))

(declare-fun lt!361187 () tuple2!19432)

(declare-fun c!11182 () Bool)

(declare-fun lt!361196 () array!11338)

(declare-fun lt!361195 () (_ BitVec 32))

(declare-fun lt!361205 () array!11338)

(declare-fun lt!361218 () (_ BitVec 32))

(declare-fun call!3765 () Bool)

(declare-fun bm!3760 () Bool)

(declare-fun arrayRangesEq!821 (array!11338 array!11338 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3760 (= call!3765 (arrayRangesEq!821 (ite c!11182 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)) lt!361205) (ite c!11182 (array!11339 (store (arr!5939 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10523 lt!361187)) (size!4973 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)))) lt!361196) (ite c!11182 #b00000000000000000000000000000000 lt!361195) (ite c!11182 (bvadd #b00000000000000000000000000000001 i!761) lt!361218)))))

(declare-fun b!226633 () Bool)

(declare-fun e!154943 () tuple3!1328)

(declare-fun lt!361220 () Unit!16790)

(declare-fun lt!361206 () tuple3!1328)

(assert (=> b!226633 (= e!154943 (tuple3!1329 lt!361220 (_2!10522 lt!361206) (_3!806 lt!361206)))))

(assert (=> b!226633 (= lt!361187 (readByte!0 (_2!10523 lt!360867)))))

(declare-fun lt!361197 () array!11338)

(assert (=> b!226633 (= lt!361197 (array!11339 (store (arr!5939 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10523 lt!361187)) (size!4973 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)))))))

(declare-fun lt!361190 () (_ BitVec 64))

(assert (=> b!226633 (= lt!361190 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!361213 () (_ BitVec 32))

(assert (=> b!226633 (= lt!361213 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361204 () Unit!16790)

(assert (=> b!226633 (= lt!361204 (validateOffsetBytesFromBitIndexLemma!0 (_2!10523 lt!360867) (_2!10523 lt!361187) lt!361190 lt!361213))))

(assert (=> b!226633 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4973 (buf!5514 (_2!10523 lt!361187)))) ((_ sign_extend 32) (currentByte!10334 (_2!10523 lt!361187))) ((_ sign_extend 32) (currentBit!10329 (_2!10523 lt!361187))) (bvsub lt!361213 ((_ extract 31 0) (bvsdiv (bvadd lt!361190 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!361215 () Unit!16790)

(assert (=> b!226633 (= lt!361215 lt!361204)))

(assert (=> b!226633 (= lt!361206 (readByteArrayLoop!0 (_2!10523 lt!361187) lt!361197 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3763 () (_ BitVec 64))

(assert (=> b!226633 (= (bitIndex!0 (size!4973 (buf!5514 (_2!10523 lt!361187))) (currentByte!10334 (_2!10523 lt!361187)) (currentBit!10329 (_2!10523 lt!361187))) (bvadd call!3763 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!361210 () Unit!16790)

(declare-fun Unit!16799 () Unit!16790)

(assert (=> b!226633 (= lt!361210 Unit!16799)))

(assert (=> b!226633 (= (bvadd (bitIndex!0 (size!4973 (buf!5514 (_2!10523 lt!361187))) (currentByte!10334 (_2!10523 lt!361187)) (currentBit!10329 (_2!10523 lt!361187))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4973 (buf!5514 (_2!10522 lt!361206))) (currentByte!10334 (_2!10522 lt!361206)) (currentBit!10329 (_2!10522 lt!361206))))))

(declare-fun lt!361209 () Unit!16790)

(declare-fun Unit!16800 () Unit!16790)

(assert (=> b!226633 (= lt!361209 Unit!16800)))

(assert (=> b!226633 (= (bvadd call!3763 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4973 (buf!5514 (_2!10522 lt!361206))) (currentByte!10334 (_2!10522 lt!361206)) (currentBit!10329 (_2!10522 lt!361206))))))

(declare-fun lt!361194 () Unit!16790)

(declare-fun Unit!16801 () Unit!16790)

(assert (=> b!226633 (= lt!361194 Unit!16801)))

(assert (=> b!226633 (and (= (buf!5514 (_2!10523 lt!360867)) (buf!5514 (_2!10522 lt!361206))) (= (size!4973 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))) (size!4973 (_3!806 lt!361206))))))

(declare-fun lt!361216 () Unit!16790)

(declare-fun Unit!16802 () Unit!16790)

(assert (=> b!226633 (= lt!361216 Unit!16802)))

(declare-fun lt!361186 () Unit!16790)

(declare-fun arrayUpdatedAtPrefixLemma!379 (array!11338 (_ BitVec 32) (_ BitVec 8)) Unit!16790)

(assert (=> b!226633 (= lt!361186 (arrayUpdatedAtPrefixLemma!379 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10523 lt!361187)))))

(assert (=> b!226633 call!3765))

(declare-fun lt!361203 () Unit!16790)

(assert (=> b!226633 (= lt!361203 lt!361186)))

(declare-fun lt!361217 () (_ BitVec 32))

(assert (=> b!226633 (= lt!361217 #b00000000000000000000000000000000)))

(declare-fun lt!361188 () Unit!16790)

(declare-fun arrayRangesEqTransitive!258 (array!11338 array!11338 array!11338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16790)

(assert (=> b!226633 (= lt!361188 (arrayRangesEqTransitive!258 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)) lt!361197 (_3!806 lt!361206) lt!361217 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226633 (arrayRangesEq!821 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)) (_3!806 lt!361206) lt!361217 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!361201 () Unit!16790)

(assert (=> b!226633 (= lt!361201 lt!361188)))

(declare-fun call!3764 () Bool)

(assert (=> b!226633 call!3764))

(declare-fun lt!361208 () Unit!16790)

(declare-fun Unit!16803 () Unit!16790)

(assert (=> b!226633 (= lt!361208 Unit!16803)))

(declare-fun lt!361192 () Unit!16790)

(declare-fun arrayRangesEqImpliesEq!109 (array!11338 array!11338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16790)

(assert (=> b!226633 (= lt!361192 (arrayRangesEqImpliesEq!109 lt!361197 (_3!806 lt!361206) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226633 (= (select (store (arr!5939 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10523 lt!361187)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5939 (_3!806 lt!361206)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361198 () Unit!16790)

(assert (=> b!226633 (= lt!361198 lt!361192)))

(declare-fun lt!361212 () Bool)

(assert (=> b!226633 (= lt!361212 (= (select (arr!5939 (_3!806 lt!361206)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10523 lt!361187)))))

(declare-fun Unit!16804 () Unit!16790)

(assert (=> b!226633 (= lt!361220 Unit!16804)))

(assert (=> b!226633 lt!361212))

(declare-fun d!76926 () Bool)

(assert (=> d!76926 e!154941))

(declare-fun res!190162 () Bool)

(assert (=> d!76926 (=> res!190162 e!154941)))

(assert (=> d!76926 (= res!190162 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!361200 () Bool)

(declare-fun e!154942 () Bool)

(assert (=> d!76926 (= lt!361200 e!154942)))

(declare-fun res!190160 () Bool)

(assert (=> d!76926 (=> (not res!190160) (not e!154942))))

(declare-fun lt!361214 () (_ BitVec 64))

(declare-fun lt!361199 () (_ BitVec 64))

(assert (=> d!76926 (= res!190160 (= (bvadd lt!361214 lt!361199) (bitIndex!0 (size!4973 (buf!5514 (_2!10522 lt!361185))) (currentByte!10334 (_2!10522 lt!361185)) (currentBit!10329 (_2!10522 lt!361185)))))))

(assert (=> d!76926 (or (not (= (bvand lt!361214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361199 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361214 lt!361199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!361202 () (_ BitVec 64))

(assert (=> d!76926 (= lt!361199 (bvmul lt!361202 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76926 (or (= lt!361202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361202)))))

(assert (=> d!76926 (= lt!361202 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76926 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76926 (= lt!361214 (bitIndex!0 (size!4973 (buf!5514 (_2!10523 lt!360867))) (currentByte!10334 (_2!10523 lt!360867)) (currentBit!10329 (_2!10523 lt!360867))))))

(assert (=> d!76926 (= lt!361185 e!154943)))

(assert (=> d!76926 (= c!11182 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76926 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4973 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)))))))

(assert (=> d!76926 (= (readByteArrayLoop!0 (_2!10523 lt!360867) (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!361185)))

(declare-fun bm!3761 () Bool)

(assert (=> bm!3761 (= call!3764 (arrayRangesEq!821 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)) (ite c!11182 (_3!806 lt!361206) (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))) #b00000000000000000000000000000000 (ite c!11182 (bvadd #b00000000000000000000000000000001 i!761) (size!4973 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))))))))

(declare-fun lt!361207 () Unit!16790)

(declare-fun b!226634 () Bool)

(assert (=> b!226634 (= e!154943 (tuple3!1329 lt!361207 (_2!10523 lt!360867) (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))))))

(assert (=> b!226634 (= call!3763 call!3763)))

(declare-fun lt!361189 () Unit!16790)

(declare-fun Unit!16807 () Unit!16790)

(assert (=> b!226634 (= lt!361189 Unit!16807)))

(declare-fun lt!361219 () Unit!16790)

(declare-fun arrayRangesEqReflexiveLemma!125 (array!11338) Unit!16790)

(assert (=> b!226634 (= lt!361219 (arrayRangesEqReflexiveLemma!125 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))))))

(assert (=> b!226634 call!3764))

(declare-fun lt!361211 () Unit!16790)

(assert (=> b!226634 (= lt!361211 lt!361219)))

(assert (=> b!226634 (= lt!361205 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)))))

(assert (=> b!226634 (= lt!361196 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)))))

(declare-fun lt!361193 () (_ BitVec 32))

(assert (=> b!226634 (= lt!361193 #b00000000000000000000000000000000)))

(declare-fun lt!361191 () (_ BitVec 32))

(assert (=> b!226634 (= lt!361191 (size!4973 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))))))

(assert (=> b!226634 (= lt!361195 #b00000000000000000000000000000000)))

(assert (=> b!226634 (= lt!361218 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!110 (array!11338 array!11338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16790)

(assert (=> b!226634 (= lt!361207 (arrayRangesEqSlicedLemma!110 lt!361205 lt!361196 lt!361193 lt!361191 lt!361195 lt!361218))))

(assert (=> b!226634 call!3765))

(declare-fun bm!3762 () Bool)

(assert (=> bm!3762 (= call!3763 (bitIndex!0 (size!4973 (buf!5514 (_2!10523 lt!360867))) (currentByte!10334 (_2!10523 lt!360867)) (currentBit!10329 (_2!10523 lt!360867))))))

(declare-fun b!226635 () Bool)

(assert (=> b!226635 (= e!154942 (arrayRangesEq!821 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308)) (_3!806 lt!361185) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!226636 () Bool)

(declare-fun res!190161 () Bool)

(assert (=> b!226636 (=> (not res!190161) (not e!154942))))

(assert (=> b!226636 (= res!190161 (and (= (buf!5514 (_2!10523 lt!360867)) (buf!5514 (_2!10522 lt!361185))) (= (size!4973 (array!11339 (store (arr!5939 arr!308) i!761 (_1!10523 lt!360867)) (size!4973 arr!308))) (size!4973 (_3!806 lt!361185)))))))

(assert (= (and d!76926 c!11182) b!226633))

(assert (= (and d!76926 (not c!11182)) b!226634))

(assert (= (or b!226633 b!226634) bm!3760))

(assert (= (or b!226633 b!226634) bm!3761))

(assert (= (or b!226633 b!226634) bm!3762))

(assert (= (and d!76926 res!190160) b!226636))

(assert (= (and b!226636 res!190161) b!226635))

(assert (= (and d!76926 (not res!190162)) b!226632))

(declare-fun m!348187 () Bool)

(assert (=> d!76926 m!348187))

(assert (=> d!76926 m!348077))

(assert (=> bm!3762 m!348077))

(declare-fun m!348189 () Bool)

(assert (=> b!226634 m!348189))

(declare-fun m!348193 () Bool)

(assert (=> b!226634 m!348193))

(declare-fun m!348199 () Bool)

(assert (=> bm!3761 m!348199))

(declare-fun m!348201 () Bool)

(assert (=> b!226632 m!348201))

(declare-fun m!348203 () Bool)

(assert (=> b!226632 m!348203))

(declare-fun m!348205 () Bool)

(assert (=> b!226633 m!348205))

(declare-fun m!348209 () Bool)

(assert (=> b!226633 m!348209))

(declare-fun m!348211 () Bool)

(assert (=> b!226633 m!348211))

(declare-fun m!348213 () Bool)

(assert (=> b!226633 m!348213))

(declare-fun m!348215 () Bool)

(assert (=> b!226633 m!348215))

(declare-fun m!348217 () Bool)

(assert (=> b!226633 m!348217))

(declare-fun m!348219 () Bool)

(assert (=> b!226633 m!348219))

(declare-fun m!348221 () Bool)

(assert (=> b!226633 m!348221))

(declare-fun m!348223 () Bool)

(assert (=> b!226633 m!348223))

(declare-fun m!348225 () Bool)

(assert (=> b!226633 m!348225))

(declare-fun m!348229 () Bool)

(assert (=> b!226633 m!348229))

(declare-fun m!348233 () Bool)

(assert (=> b!226633 m!348233))

(declare-fun m!348235 () Bool)

(assert (=> b!226633 m!348235))

(assert (=> bm!3760 m!348209))

(declare-fun m!348237 () Bool)

(assert (=> bm!3760 m!348237))

(declare-fun m!348239 () Bool)

(assert (=> b!226635 m!348239))

(assert (=> b!226556 d!76926))

(check-sat (not d!76897) (not b!226635) (not bm!3760) (not d!76915) (not b!226589) (not b!226598) (not bm!3762) (not bm!3761) (not b!226632) (not d!76920) (not b!226633) (not d!76903) (not d!76922) (not d!76926) (not d!76899) (not d!76924) (not b!226634) (not d!76917))
(check-sat)

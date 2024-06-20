; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10506 () Bool)

(assert start!10506)

(declare-fun b!52701 () Bool)

(declare-fun e!35088 () Bool)

(declare-datatypes ((array!2488 0))(
  ( (array!2489 (arr!1673 (Array (_ BitVec 32) (_ BitVec 8))) (size!1137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1966 0))(
  ( (BitStream!1967 (buf!1487 array!2488) (currentByte!3036 (_ BitVec 32)) (currentBit!3031 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3678 0))(
  ( (Unit!3679) )
))
(declare-datatypes ((tuple2!4792 0))(
  ( (tuple2!4793 (_1!2501 Unit!3678) (_2!2501 BitStream!1966)) )
))
(declare-fun lt!81696 () tuple2!4792)

(declare-fun lt!81697 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52701 (= e!35088 (bvsle (bitIndex!0 (size!1137 (buf!1487 (_2!2501 lt!81696))) (currentByte!3036 (_2!2501 lt!81696)) (currentBit!3031 (_2!2501 lt!81696))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!81697)))))

(declare-fun b!52702 () Bool)

(declare-fun res!44001 () Bool)

(declare-fun e!35089 () Bool)

(assert (=> b!52702 (=> (not res!44001) (not e!35089))))

(declare-fun thiss!1379 () BitStream!1966)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52702 (= res!44001 (validate_offset_bits!1 ((_ sign_extend 32) (size!1137 (buf!1487 thiss!1379))) ((_ sign_extend 32) (currentByte!3036 thiss!1379)) ((_ sign_extend 32) (currentBit!3031 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52703 () Bool)

(declare-fun e!35085 () Bool)

(assert (=> b!52703 (= e!35085 e!35088)))

(declare-fun res!44003 () Bool)

(assert (=> b!52703 (=> res!44003 e!35088)))

(assert (=> b!52703 (= res!44003 (not (= (size!1137 (buf!1487 thiss!1379)) (size!1137 (buf!1487 (_2!2501 lt!81696))))))))

(declare-fun srcBuffer!2 () array!2488)

(declare-fun appendBitFromByte!0 (BitStream!1966 (_ BitVec 8) (_ BitVec 32)) tuple2!4792)

(assert (=> b!52703 (= lt!81696 (appendBitFromByte!0 thiss!1379 (select (arr!1673 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!44002 () Bool)

(assert (=> start!10506 (=> (not res!44002) (not e!35089))))

(assert (=> start!10506 (= res!44002 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1137 srcBuffer!2))))))))

(assert (=> start!10506 e!35089))

(assert (=> start!10506 true))

(declare-fun array_inv!1042 (array!2488) Bool)

(assert (=> start!10506 (array_inv!1042 srcBuffer!2)))

(declare-fun e!35090 () Bool)

(declare-fun inv!12 (BitStream!1966) Bool)

(assert (=> start!10506 (and (inv!12 thiss!1379) e!35090)))

(declare-fun b!52704 () Bool)

(assert (=> b!52704 (= e!35090 (array_inv!1042 (buf!1487 thiss!1379)))))

(declare-fun b!52705 () Bool)

(assert (=> b!52705 (= e!35089 (not e!35085))))

(declare-fun res!44004 () Bool)

(assert (=> b!52705 (=> res!44004 e!35085)))

(assert (=> b!52705 (= res!44004 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1966 BitStream!1966) Bool)

(assert (=> b!52705 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81695 () Unit!3678)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1966) Unit!3678)

(assert (=> b!52705 (= lt!81695 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!52705 (= lt!81697 (bitIndex!0 (size!1137 (buf!1487 thiss!1379)) (currentByte!3036 thiss!1379) (currentBit!3031 thiss!1379)))))

(assert (= (and start!10506 res!44002) b!52702))

(assert (= (and b!52702 res!44001) b!52705))

(assert (= (and b!52705 (not res!44004)) b!52703))

(assert (= (and b!52703 (not res!44003)) b!52701))

(assert (= start!10506 b!52704))

(declare-fun m!83101 () Bool)

(assert (=> start!10506 m!83101))

(declare-fun m!83103 () Bool)

(assert (=> start!10506 m!83103))

(declare-fun m!83105 () Bool)

(assert (=> b!52701 m!83105))

(declare-fun m!83107 () Bool)

(assert (=> b!52703 m!83107))

(assert (=> b!52703 m!83107))

(declare-fun m!83109 () Bool)

(assert (=> b!52703 m!83109))

(declare-fun m!83111 () Bool)

(assert (=> b!52704 m!83111))

(declare-fun m!83113 () Bool)

(assert (=> b!52702 m!83113))

(declare-fun m!83115 () Bool)

(assert (=> b!52705 m!83115))

(declare-fun m!83117 () Bool)

(assert (=> b!52705 m!83117))

(declare-fun m!83119 () Bool)

(assert (=> b!52705 m!83119))

(push 1)

(assert (not b!52702))

(assert (not b!52701))

(assert (not b!52703))

(assert (not start!10506))

(assert (not b!52704))

(assert (not b!52705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16696 () Bool)

(declare-fun e!35129 () Bool)

(assert (=> d!16696 e!35129))

(declare-fun res!44033 () Bool)

(assert (=> d!16696 (=> (not res!44033) (not e!35129))))

(declare-fun lt!81732 () (_ BitVec 64))

(declare-fun lt!81728 () (_ BitVec 64))

(declare-fun lt!81730 () (_ BitVec 64))

(assert (=> d!16696 (= res!44033 (= lt!81732 (bvsub lt!81730 lt!81728)))))

(assert (=> d!16696 (or (= (bvand lt!81730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81728 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81730 lt!81728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16696 (= lt!81728 (remainingBits!0 ((_ sign_extend 32) (size!1137 (buf!1487 (_2!2501 lt!81696)))) ((_ sign_extend 32) (currentByte!3036 (_2!2501 lt!81696))) ((_ sign_extend 32) (currentBit!3031 (_2!2501 lt!81696)))))))

(declare-fun lt!81731 () (_ BitVec 64))

(declare-fun lt!81733 () (_ BitVec 64))

(assert (=> d!16696 (= lt!81730 (bvmul lt!81731 lt!81733))))

(assert (=> d!16696 (or (= lt!81731 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81733 (bvsdiv (bvmul lt!81731 lt!81733) lt!81731)))))

(assert (=> d!16696 (= lt!81733 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16696 (= lt!81731 ((_ sign_extend 32) (size!1137 (buf!1487 (_2!2501 lt!81696)))))))

(assert (=> d!16696 (= lt!81732 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3036 (_2!2501 lt!81696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3031 (_2!2501 lt!81696)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16696 (invariant!0 (currentBit!3031 (_2!2501 lt!81696)) (currentByte!3036 (_2!2501 lt!81696)) (size!1137 (buf!1487 (_2!2501 lt!81696))))))

(assert (=> d!16696 (= (bitIndex!0 (size!1137 (buf!1487 (_2!2501 lt!81696))) (currentByte!3036 (_2!2501 lt!81696)) (currentBit!3031 (_2!2501 lt!81696))) lt!81732)))

(declare-fun b!52740 () Bool)

(declare-fun res!44034 () Bool)

(assert (=> b!52740 (=> (not res!44034) (not e!35129))))

(assert (=> b!52740 (= res!44034 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81732))))

(declare-fun b!52741 () Bool)

(declare-fun lt!81729 () (_ BitVec 64))

(assert (=> b!52741 (= e!35129 (bvsle lt!81732 (bvmul lt!81729 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52741 (or (= lt!81729 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81729 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81729)))))

(assert (=> b!52741 (= lt!81729 ((_ sign_extend 32) (size!1137 (buf!1487 (_2!2501 lt!81696)))))))

(assert (= (and d!16696 res!44033) b!52740))

(assert (= (and b!52740 res!44034) b!52741))

(declare-fun m!83163 () Bool)

(assert (=> d!16696 m!83163))

(declare-fun m!83165 () Bool)

(assert (=> d!16696 m!83165))

(assert (=> b!52701 d!16696))

(declare-fun d!16698 () Bool)

(assert (=> d!16698 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1137 (buf!1487 thiss!1379))) ((_ sign_extend 32) (currentByte!3036 thiss!1379)) ((_ sign_extend 32) (currentBit!3031 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1137 (buf!1487 thiss!1379))) ((_ sign_extend 32) (currentByte!3036 thiss!1379)) ((_ sign_extend 32) (currentBit!3031 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4234 () Bool)

(assert (= bs!4234 d!16698))

(declare-fun m!83167 () Bool)

(assert (=> bs!4234 m!83167))

(assert (=> b!52702 d!16698))

(declare-fun d!16700 () Bool)

(declare-fun e!35163 () Bool)

(assert (=> d!16700 e!35163))

(declare-fun res!44097 () Bool)

(assert (=> d!16700 (=> (not res!44097) (not e!35163))))

(declare-fun lt!81832 () tuple2!4792)

(assert (=> d!16700 (= res!44097 (= (size!1137 (buf!1487 (_2!2501 lt!81832))) (size!1137 (buf!1487 thiss!1379))))))

(declare-fun lt!81821 () (_ BitVec 8))

(declare-fun lt!81822 () array!2488)

(assert (=> d!16700 (= lt!81821 (select (arr!1673 lt!81822) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16700 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1137 lt!81822)))))

(assert (=> d!16700 (= lt!81822 (array!2489 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!81828 () tuple2!4792)

(assert (=> d!16700 (= lt!81832 (tuple2!4793 (_1!2501 lt!81828) (_2!2501 lt!81828)))))

(declare-fun lt!81831 () tuple2!4792)

(assert (=> d!16700 (= lt!81828 lt!81831)))

(declare-fun e!35160 () Bool)

(assert (=> d!16700 e!35160))

(declare-fun res!44096 () Bool)

(assert (=> d!16700 (=> (not res!44096) (not e!35160))))

(assert (=> d!16700 (= res!44096 (= (size!1137 (buf!1487 thiss!1379)) (size!1137 (buf!1487 (_2!2501 lt!81831)))))))

(declare-fun lt!81826 () Bool)

(declare-fun appendBit!0 (BitStream!1966 Bool) tuple2!4792)

(assert (=> d!16700 (= lt!81831 (appendBit!0 thiss!1379 lt!81826))))

(assert (=> d!16700 (= lt!81826 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1673 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16700 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16700 (= (appendBitFromByte!0 thiss!1379 (select (arr!1673 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!81832)))

(declare-fun b!52801 () Bool)

(declare-fun e!35161 () Bool)

(declare-datatypes ((tuple2!4802 0))(
  ( (tuple2!4803 (_1!2506 BitStream!1966) (_2!2506 Bool)) )
))
(declare-fun lt!81829 () tuple2!4802)

(assert (=> b!52801 (= e!35161 (= (bitIndex!0 (size!1137 (buf!1487 (_1!2506 lt!81829))) (currentByte!3036 (_1!2506 lt!81829)) (currentBit!3031 (_1!2506 lt!81829))) (bitIndex!0 (size!1137 (buf!1487 (_2!2501 lt!81832))) (currentByte!3036 (_2!2501 lt!81832)) (currentBit!3031 (_2!2501 lt!81832)))))))

(declare-fun b!52802 () Bool)

(declare-fun res!44094 () Bool)

(assert (=> b!52802 (=> (not res!44094) (not e!35160))))

(assert (=> b!52802 (= res!44094 (isPrefixOf!0 thiss!1379 (_2!2501 lt!81831)))))

(declare-fun b!52803 () Bool)

(declare-fun res!44092 () Bool)

(assert (=> b!52803 (=> (not res!44092) (not e!35160))))

(assert (=> b!52803 (= res!44092 (= (bitIndex!0 (size!1137 (buf!1487 (_2!2501 lt!81831))) (currentByte!3036 (_2!2501 lt!81831)) (currentBit!3031 (_2!2501 lt!81831))) (bvadd (bitIndex!0 (size!1137 (buf!1487 thiss!1379)) (currentByte!3036 thiss!1379) (currentBit!3031 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!52804 () Bool)

(declare-fun res!44093 () Bool)

(assert (=> b!52804 (=> (not res!44093) (not e!35163))))

(assert (=> b!52804 (= res!44093 (isPrefixOf!0 thiss!1379 (_2!2501 lt!81832)))))

(declare-fun b!52805 () Bool)

(assert (=> b!52805 (= e!35163 e!35161)))

(declare-fun res!44095 () Bool)

(assert (=> b!52805 (=> (not res!44095) (not e!35161))))

(assert (=> b!52805 (= res!44095 (and (= (_2!2506 lt!81829) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1673 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!81821)) #b00000000000000000000000000000000))) (= (_1!2506 lt!81829) (_2!2501 lt!81832))))))

(declare-datatypes ((tuple2!4804 0))(
  ( (tuple2!4805 (_1!2507 array!2488) (_2!2507 BitStream!1966)) )
))
(declare-fun lt!81823 () tuple2!4804)

(declare-fun lt!81827 () BitStream!1966)

(declare-fun readBits!0 (BitStream!1966 (_ BitVec 64)) tuple2!4804)

(assert (=> b!52805 (= lt!81823 (readBits!0 lt!81827 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1966) tuple2!4802)

(assert (=> b!52805 (= lt!81829 (readBitPure!0 lt!81827))))

(declare-fun readerFrom!0 (BitStream!1966 (_ BitVec 32) (_ BitVec 32)) BitStream!1966)

(assert (=> b!52805 (= lt!81827 (readerFrom!0 (_2!2501 lt!81832) (currentBit!3031 thiss!1379) (currentByte!3036 thiss!1379)))))

(declare-fun b!52806 () Bool)

(declare-fun e!35162 () Bool)

(declare-fun lt!81824 () tuple2!4802)

(assert (=> b!52806 (= e!35162 (= (bitIndex!0 (size!1137 (buf!1487 (_1!2506 lt!81824))) (currentByte!3036 (_1!2506 lt!81824)) (currentBit!3031 (_1!2506 lt!81824))) (bitIndex!0 (size!1137 (buf!1487 (_2!2501 lt!81831))) (currentByte!3036 (_2!2501 lt!81831)) (currentBit!3031 (_2!2501 lt!81831)))))))

(declare-fun b!52807 () Bool)

(assert (=> b!52807 (= e!35160 e!35162)))

(declare-fun res!44099 () Bool)

(assert (=> b!52807 (=> (not res!44099) (not e!35162))))

(assert (=> b!52807 (= res!44099 (and (= (_2!2506 lt!81824) lt!81826) (= (_1!2506 lt!81824) (_2!2501 lt!81831))))))

(assert (=> b!52807 (= lt!81824 (readBitPure!0 (readerFrom!0 (_2!2501 lt!81831) (currentBit!3031 thiss!1379) (currentByte!3036 thiss!1379))))))

(declare-fun b!52808 () Bool)

(declare-fun res!44098 () Bool)

(assert (=> b!52808 (=> (not res!44098) (not e!35163))))

(declare-fun lt!81825 () (_ BitVec 64))

(declare-fun lt!81830 () (_ BitVec 64))

(assert (=> b!52808 (= res!44098 (= (bitIndex!0 (size!1137 (buf!1487 (_2!2501 lt!81832))) (currentByte!3036 (_2!2501 lt!81832)) (currentBit!3031 (_2!2501 lt!81832))) (bvadd lt!81825 lt!81830)))))

(assert (=> b!52808 (or (not (= (bvand lt!81825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81830 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!81825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!81825 lt!81830) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!52808 (= lt!81830 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!52808 (= lt!81825 (bitIndex!0 (size!1137 (buf!1487 thiss!1379)) (currentByte!3036 thiss!1379) (currentBit!3031 thiss!1379)))))

(assert (= (and d!16700 res!44096) b!52803))

(assert (= (and b!52803 res!44092) b!52802))

(assert (= (and b!52802 res!44094) b!52807))

(assert (= (and b!52807 res!44099) b!52806))

(assert (= (and d!16700 res!44097) b!52808))

(assert (= (and b!52808 res!44098) b!52804))

(assert (= (and b!52804 res!44093) b!52805))

(assert (= (and b!52805 res!44095) b!52801))

(declare-fun m!83207 () Bool)

(assert (=> b!52804 m!83207))

(declare-fun m!83209 () Bool)

(assert (=> b!52803 m!83209))

(assert (=> b!52803 m!83119))

(declare-fun m!83211 () Bool)

(assert (=> b!52802 m!83211))

(declare-fun m!83213 () Bool)

(assert (=> b!52807 m!83213))

(assert (=> b!52807 m!83213))

(declare-fun m!83215 () Bool)

(assert (=> b!52807 m!83215))

(declare-fun m!83217 () Bool)

(assert (=> b!52801 m!83217))

(declare-fun m!83219 () Bool)

(assert (=> b!52801 m!83219))

(declare-fun m!83221 () Bool)

(assert (=> b!52806 m!83221))

(assert (=> b!52806 m!83209))

(assert (=> b!52808 m!83219))

(assert (=> b!52808 m!83119))

(declare-fun m!83223 () Bool)

(assert (=> d!16700 m!83223))

(declare-fun m!83225 () Bool)

(assert (=> d!16700 m!83225))

(declare-fun m!83227 () Bool)

(assert (=> d!16700 m!83227))

(declare-fun m!83229 () Bool)

(assert (=> b!52805 m!83229))

(declare-fun m!83231 () Bool)

(assert (=> b!52805 m!83231))

(declare-fun m!83233 () Bool)

(assert (=> b!52805 m!83233))

(assert (=> b!52703 d!16700))

(declare-fun d!16718 () Bool)

(assert (=> d!16718 (= (array_inv!1042 (buf!1487 thiss!1379)) (bvsge (size!1137 (buf!1487 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52704 d!16718))

(declare-fun d!16720 () Bool)

(assert (=> d!16720 (= (array_inv!1042 srcBuffer!2) (bvsge (size!1137 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10506 d!16720))

(declare-fun d!16722 () Bool)

(assert (=> d!16722 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3031 thiss!1379) (currentByte!3036 thiss!1379) (size!1137 (buf!1487 thiss!1379))))))

(declare-fun bs!4238 () Bool)

(assert (= bs!4238 d!16722))

(declare-fun m!83235 () Bool)

(assert (=> bs!4238 m!83235))

(assert (=> start!10506 d!16722))

(declare-fun d!16724 () Bool)

(declare-fun res!44107 () Bool)

(declare-fun e!35168 () Bool)

(assert (=> d!16724 (=> (not res!44107) (not e!35168))))

(assert (=> d!16724 (= res!44107 (= (size!1137 (buf!1487 thiss!1379)) (size!1137 (buf!1487 thiss!1379))))))

(assert (=> d!16724 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35168)))

(declare-fun b!52815 () Bool)

(declare-fun res!44106 () Bool)

(assert (=> b!52815 (=> (not res!44106) (not e!35168))))

(assert (=> b!52815 (= res!44106 (bvsle (bitIndex!0 (size!1137 (buf!1487 thiss!1379)) (currentByte!3036 thiss!1379) (currentBit!3031 thiss!1379)) (bitIndex!0 (size!1137 (buf!1487 thiss!1379)) (currentByte!3036 thiss!1379) (currentBit!3031 thiss!1379))))))

(declare-fun b!52816 () Bool)

(declare-fun e!35169 () Bool)

(assert (=> b!52816 (= e!35168 e!35169)))

(declare-fun res!44108 () Bool)

(assert (=> b!52816 (=> res!44108 e!35169)))

(assert (=> b!52816 (= res!44108 (= (size!1137 (buf!1487 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52817 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2488 array!2488 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52817 (= e!35169 (arrayBitRangesEq!0 (buf!1487 thiss!1379) (buf!1487 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1137 (buf!1487 thiss!1379)) (currentByte!3036 thiss!1379) (currentBit!3031 thiss!1379))))))

(assert (= (and d!16724 res!44107) b!52815))

(assert (= (and b!52815 res!44106) b!52816))

(assert (= (and b!52816 (not res!44108)) b!52817))

(assert (=> b!52815 m!83119))

(assert (=> b!52815 m!83119))

(assert (=> b!52817 m!83119))

(assert (=> b!52817 m!83119))

(declare-fun m!83237 () Bool)

(assert (=> b!52817 m!83237))

(assert (=> b!52705 d!16724))

(declare-fun d!16726 () Bool)

(assert (=> d!16726 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81847 () Unit!3678)

(declare-fun choose!11 (BitStream!1966) Unit!3678)

(assert (=> d!16726 (= lt!81847 (choose!11 thiss!1379))))

(assert (=> d!16726 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!81847)))

(declare-fun bs!4240 () Bool)

(assert (= bs!4240 d!16726))

(assert (=> bs!4240 m!83115))

(declare-fun m!83239 () Bool)

(assert (=> bs!4240 m!83239))

(assert (=> b!52705 d!16726))

(declare-fun d!16728 () Bool)

(declare-fun e!35174 () Bool)

(assert (=> d!16728 e!35174))

(declare-fun res!44117 () Bool)

(assert (=> d!16728 (=> (not res!44117) (not e!35174))))

(declare-fun lt!81854 () (_ BitVec 64))

(declare-fun lt!81852 () (_ BitVec 64))

(declare-fun lt!81850 () (_ BitVec 64))

(assert (=> d!16728 (= res!44117 (= lt!81854 (bvsub lt!81852 lt!81850)))))

(assert (=> d!16728 (or (= (bvand lt!81852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81852 lt!81850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16728 (= lt!81850 (remainingBits!0 ((_ sign_extend 32) (size!1137 (buf!1487 thiss!1379))) ((_ sign_extend 32) (currentByte!3036 thiss!1379)) ((_ sign_extend 32) (currentBit!3031 thiss!1379))))))

(declare-fun lt!81853 () (_ BitVec 64))

(declare-fun lt!81855 () (_ BitVec 64))

(assert (=> d!16728 (= lt!81852 (bvmul lt!81853 lt!81855))))

(assert (=> d!16728 (or (= lt!81853 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81855 (bvsdiv (bvmul lt!81853 lt!81855) lt!81853)))))

(assert (=> d!16728 (= lt!81855 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16728 (= lt!81853 ((_ sign_extend 32) (size!1137 (buf!1487 thiss!1379))))))

(assert (=> d!16728 (= lt!81854 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3036 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3031 thiss!1379))))))

(assert (=> d!16728 (invariant!0 (currentBit!3031 thiss!1379) (currentByte!3036 thiss!1379) (size!1137 (buf!1487 thiss!1379)))))

(assert (=> d!16728 (= (bitIndex!0 (size!1137 (buf!1487 thiss!1379)) (currentByte!3036 thiss!1379) (currentBit!3031 thiss!1379)) lt!81854)))

(declare-fun b!52827 () Bool)

(declare-fun res!44118 () Bool)

(assert (=> b!52827 (=> (not res!44118) (not e!35174))))

(assert (=> b!52827 (= res!44118 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81854))))

(declare-fun b!52828 () Bool)

(declare-fun lt!81851 () (_ BitVec 64))

(assert (=> b!52828 (= e!35174 (bvsle lt!81854 (bvmul lt!81851 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52828 (or (= lt!81851 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81851 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81851)))))

(assert (=> b!52828 (= lt!81851 ((_ sign_extend 32) (size!1137 (buf!1487 thiss!1379))))))

(assert (= (and d!16728 res!44117) b!52827))

(assert (= (and b!52827 res!44118) b!52828))

(assert (=> d!16728 m!83167))

(assert (=> d!16728 m!83235))

(assert (=> b!52705 d!16728))

(push 1)

(assert (not b!52802))

(assert (not d!16726))

(assert (not b!52805))

(assert (not b!52804))

(assert (not b!52808))

(assert (not b!52815))

(assert (not d!16696))

(assert (not b!52817))

(assert (not b!52806))

(assert (not d!16698))

(assert (not b!52803))

(assert (not d!16700))

(assert (not b!52801))

(assert (not d!16722))

(assert (not d!16728))

(assert (not b!52807))

(check-sat)

(pop 1)

(push 1)

(check-sat)


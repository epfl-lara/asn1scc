; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16618 () Bool)

(assert start!16618)

(declare-fun b!82373 () Bool)

(declare-fun e!54418 () Bool)

(declare-fun e!54415 () Bool)

(assert (=> b!82373 (= e!54418 e!54415)))

(declare-fun res!67876 () Bool)

(assert (=> b!82373 (=> res!67876 e!54415)))

(declare-datatypes ((array!3712 0))(
  ( (array!3713 (arr!2335 (Array (_ BitVec 32) (_ BitVec 8))) (size!1698 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2958 0))(
  ( (BitStream!2959 (buf!2088 array!3712) (currentByte!4090 (_ BitVec 32)) (currentBit!4085 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2958)

(assert (=> b!82373 (= res!67876 (or (bvsgt ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4090 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4085 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4090 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4085 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!131015 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82373 (= (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))) ((_ sign_extend 32) (currentByte!4090 b2!98)) ((_ sign_extend 32) (currentBit!4085 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1698 (buf!2088 b2!98)))) lt!131015))))

(declare-datatypes ((Unit!5505 0))(
  ( (Unit!5506) )
))
(declare-fun lt!131016 () Unit!5505)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2958) Unit!5505)

(assert (=> b!82373 (= lt!131016 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82374 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82374 (= e!54415 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4085 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4090 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))))))))

(declare-fun b!82375 () Bool)

(declare-fun res!67873 () Bool)

(declare-fun e!54416 () Bool)

(assert (=> b!82375 (=> (not res!67873) (not e!54416))))

(declare-fun b1!98 () BitStream!2958)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82375 (= res!67873 (validate_offset_bits!1 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))) ((_ sign_extend 32) (currentByte!4090 b1!98)) ((_ sign_extend 32) (currentBit!4085 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!67872 () Bool)

(assert (=> start!16618 (=> (not res!67872) (not e!54416))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16618 (= res!67872 (and (= (size!1698 (buf!2088 b1!98)) (size!1698 (buf!2088 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16618 e!54416))

(declare-fun e!54414 () Bool)

(declare-fun inv!12 (BitStream!2958) Bool)

(assert (=> start!16618 (and (inv!12 b1!98) e!54414)))

(declare-fun e!54413 () Bool)

(assert (=> start!16618 (and (inv!12 b2!98) e!54413)))

(assert (=> start!16618 true))

(declare-fun b!82376 () Bool)

(declare-fun array_inv!1544 (array!3712) Bool)

(assert (=> b!82376 (= e!54413 (array_inv!1544 (buf!2088 b2!98)))))

(declare-fun b!82377 () Bool)

(declare-fun e!54419 () Bool)

(assert (=> b!82377 (= e!54416 e!54419)))

(declare-fun res!67874 () Bool)

(assert (=> b!82377 (=> (not res!67874) (not e!54419))))

(declare-fun lt!131012 () (_ BitVec 64))

(assert (=> b!82377 (= res!67874 (= (bvadd lt!131012 b1b2Diff!1) lt!131015))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82377 (= lt!131015 (bitIndex!0 (size!1698 (buf!2088 b2!98)) (currentByte!4090 b2!98) (currentBit!4085 b2!98)))))

(assert (=> b!82377 (= lt!131012 (bitIndex!0 (size!1698 (buf!2088 b1!98)) (currentByte!4090 b1!98) (currentBit!4085 b1!98)))))

(declare-fun b!82378 () Bool)

(assert (=> b!82378 (= e!54419 (not e!54418))))

(declare-fun res!67875 () Bool)

(assert (=> b!82378 (=> res!67875 e!54418)))

(declare-fun lt!131013 () (_ BitVec 64))

(assert (=> b!82378 (= res!67875 (bvsgt lt!131012 (bvsub lt!131013 b1ValidateOffsetBits!11)))))

(assert (=> b!82378 (= (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))) ((_ sign_extend 32) (currentByte!4090 b1!98)) ((_ sign_extend 32) (currentBit!4085 b1!98))) (bvsub lt!131013 lt!131012))))

(assert (=> b!82378 (= lt!131013 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98)))))))

(declare-fun lt!131014 () Unit!5505)

(assert (=> b!82378 (= lt!131014 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82379 () Bool)

(assert (=> b!82379 (= e!54414 (array_inv!1544 (buf!2088 b1!98)))))

(assert (= (and start!16618 res!67872) b!82375))

(assert (= (and b!82375 res!67873) b!82377))

(assert (= (and b!82377 res!67874) b!82378))

(assert (= (and b!82378 (not res!67875)) b!82373))

(assert (= (and b!82373 (not res!67876)) b!82374))

(assert (= start!16618 b!82379))

(assert (= start!16618 b!82376))

(declare-fun m!128823 () Bool)

(assert (=> b!82375 m!128823))

(declare-fun m!128825 () Bool)

(assert (=> b!82378 m!128825))

(declare-fun m!128827 () Bool)

(assert (=> b!82378 m!128827))

(declare-fun m!128829 () Bool)

(assert (=> b!82374 m!128829))

(declare-fun m!128831 () Bool)

(assert (=> b!82379 m!128831))

(declare-fun m!128833 () Bool)

(assert (=> b!82377 m!128833))

(declare-fun m!128835 () Bool)

(assert (=> b!82377 m!128835))

(declare-fun m!128837 () Bool)

(assert (=> start!16618 m!128837))

(declare-fun m!128839 () Bool)

(assert (=> start!16618 m!128839))

(declare-fun m!128841 () Bool)

(assert (=> b!82373 m!128841))

(declare-fun m!128843 () Bool)

(assert (=> b!82373 m!128843))

(declare-fun m!128845 () Bool)

(assert (=> b!82376 m!128845))

(check-sat (not b!82377) (not b!82376) (not start!16618) (not b!82374) (not b!82375) (not b!82378) (not b!82379) (not b!82373))
(check-sat)
(get-model)

(declare-fun d!26014 () Bool)

(assert (=> d!26014 (= (array_inv!1544 (buf!2088 b2!98)) (bvsge (size!1698 (buf!2088 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82376 d!26014))

(declare-fun d!26016 () Bool)

(assert (=> d!26016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))) ((_ sign_extend 32) (currentByte!4090 b1!98)) ((_ sign_extend 32) (currentBit!4085 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))) ((_ sign_extend 32) (currentByte!4090 b1!98)) ((_ sign_extend 32) (currentBit!4085 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6378 () Bool)

(assert (= bs!6378 d!26016))

(assert (=> bs!6378 m!128825))

(assert (=> b!82375 d!26016))

(declare-fun d!26018 () Bool)

(assert (=> d!26018 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4085 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4090 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4085 b2!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4085 b2!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4090 b2!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4090 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4085 b2!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4090 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1698 (buf!2088 b2!98)))))))))))

(assert (=> b!82374 d!26018))

(declare-fun d!26020 () Bool)

(assert (=> d!26020 (= (array_inv!1544 (buf!2088 b1!98)) (bvsge (size!1698 (buf!2088 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82379 d!26020))

(declare-fun d!26022 () Bool)

(assert (=> d!26022 (= (inv!12 b1!98) (invariant!0 (currentBit!4085 b1!98) (currentByte!4090 b1!98) (size!1698 (buf!2088 b1!98))))))

(declare-fun bs!6379 () Bool)

(assert (= bs!6379 d!26022))

(declare-fun m!128871 () Bool)

(assert (=> bs!6379 m!128871))

(assert (=> start!16618 d!26022))

(declare-fun d!26024 () Bool)

(assert (=> d!26024 (= (inv!12 b2!98) (invariant!0 (currentBit!4085 b2!98) (currentByte!4090 b2!98) (size!1698 (buf!2088 b2!98))))))

(declare-fun bs!6380 () Bool)

(assert (= bs!6380 d!26024))

(declare-fun m!128873 () Bool)

(assert (=> bs!6380 m!128873))

(assert (=> start!16618 d!26024))

(declare-fun d!26026 () Bool)

(assert (=> d!26026 (= (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))) ((_ sign_extend 32) (currentByte!4090 b2!98)) ((_ sign_extend 32) (currentBit!4085 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4090 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4085 b2!98)))))))

(assert (=> b!82373 d!26026))

(declare-fun d!26028 () Bool)

(declare-fun lt!131045 () (_ BitVec 64))

(declare-fun lt!131043 () (_ BitVec 64))

(assert (=> d!26028 (= (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))) ((_ sign_extend 32) (currentByte!4090 b2!98)) ((_ sign_extend 32) (currentBit!4085 b2!98))) (bvsub lt!131045 lt!131043))))

(assert (=> d!26028 (or (= (bvand lt!131045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131045 lt!131043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26028 (= lt!131043 (bitIndex!0 (size!1698 (buf!2088 b2!98)) (currentByte!4090 b2!98) (currentBit!4085 b2!98)))))

(declare-fun lt!131042 () (_ BitVec 64))

(declare-fun lt!131046 () (_ BitVec 64))

(assert (=> d!26028 (= lt!131045 (bvmul lt!131042 lt!131046))))

(assert (=> d!26028 (or (= lt!131042 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131046 (bvsdiv (bvmul lt!131042 lt!131046) lt!131042)))))

(assert (=> d!26028 (= lt!131046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26028 (= lt!131042 ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))))))

(declare-fun lt!131044 () Unit!5505)

(declare-fun choose!23 (BitStream!2958) Unit!5505)

(assert (=> d!26028 (= lt!131044 (choose!23 b2!98))))

(assert (=> d!26028 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131044)))

(declare-fun bs!6381 () Bool)

(assert (= bs!6381 d!26028))

(assert (=> bs!6381 m!128841))

(assert (=> bs!6381 m!128833))

(declare-fun m!128875 () Bool)

(assert (=> bs!6381 m!128875))

(assert (=> b!82373 d!26028))

(declare-fun d!26030 () Bool)

(assert (=> d!26030 (= (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))) ((_ sign_extend 32) (currentByte!4090 b1!98)) ((_ sign_extend 32) (currentBit!4085 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4090 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4085 b1!98)))))))

(assert (=> b!82378 d!26030))

(declare-fun d!26032 () Bool)

(declare-fun lt!131050 () (_ BitVec 64))

(declare-fun lt!131048 () (_ BitVec 64))

(assert (=> d!26032 (= (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))) ((_ sign_extend 32) (currentByte!4090 b1!98)) ((_ sign_extend 32) (currentBit!4085 b1!98))) (bvsub lt!131050 lt!131048))))

(assert (=> d!26032 (or (= (bvand lt!131050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131050 lt!131048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26032 (= lt!131048 (bitIndex!0 (size!1698 (buf!2088 b1!98)) (currentByte!4090 b1!98) (currentBit!4085 b1!98)))))

(declare-fun lt!131047 () (_ BitVec 64))

(declare-fun lt!131051 () (_ BitVec 64))

(assert (=> d!26032 (= lt!131050 (bvmul lt!131047 lt!131051))))

(assert (=> d!26032 (or (= lt!131047 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131051 (bvsdiv (bvmul lt!131047 lt!131051) lt!131047)))))

(assert (=> d!26032 (= lt!131051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26032 (= lt!131047 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))))))

(declare-fun lt!131049 () Unit!5505)

(assert (=> d!26032 (= lt!131049 (choose!23 b1!98))))

(assert (=> d!26032 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131049)))

(declare-fun bs!6382 () Bool)

(assert (= bs!6382 d!26032))

(assert (=> bs!6382 m!128825))

(assert (=> bs!6382 m!128835))

(declare-fun m!128877 () Bool)

(assert (=> bs!6382 m!128877))

(assert (=> b!82378 d!26032))

(declare-fun d!26034 () Bool)

(declare-fun e!54447 () Bool)

(assert (=> d!26034 e!54447))

(declare-fun res!67897 () Bool)

(assert (=> d!26034 (=> (not res!67897) (not e!54447))))

(declare-fun lt!131064 () (_ BitVec 64))

(declare-fun lt!131068 () (_ BitVec 64))

(declare-fun lt!131065 () (_ BitVec 64))

(assert (=> d!26034 (= res!67897 (= lt!131065 (bvsub lt!131064 lt!131068)))))

(assert (=> d!26034 (or (= (bvand lt!131064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131064 lt!131068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26034 (= lt!131068 (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))) ((_ sign_extend 32) (currentByte!4090 b2!98)) ((_ sign_extend 32) (currentBit!4085 b2!98))))))

(declare-fun lt!131067 () (_ BitVec 64))

(declare-fun lt!131066 () (_ BitVec 64))

(assert (=> d!26034 (= lt!131064 (bvmul lt!131067 lt!131066))))

(assert (=> d!26034 (or (= lt!131067 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131066 (bvsdiv (bvmul lt!131067 lt!131066) lt!131067)))))

(assert (=> d!26034 (= lt!131066 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26034 (= lt!131067 ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))))))

(assert (=> d!26034 (= lt!131065 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4090 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4085 b2!98))))))

(assert (=> d!26034 (invariant!0 (currentBit!4085 b2!98) (currentByte!4090 b2!98) (size!1698 (buf!2088 b2!98)))))

(assert (=> d!26034 (= (bitIndex!0 (size!1698 (buf!2088 b2!98)) (currentByte!4090 b2!98) (currentBit!4085 b2!98)) lt!131065)))

(declare-fun b!82406 () Bool)

(declare-fun res!67896 () Bool)

(assert (=> b!82406 (=> (not res!67896) (not e!54447))))

(assert (=> b!82406 (= res!67896 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131065))))

(declare-fun b!82407 () Bool)

(declare-fun lt!131069 () (_ BitVec 64))

(assert (=> b!82407 (= e!54447 (bvsle lt!131065 (bvmul lt!131069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82407 (or (= lt!131069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131069)))))

(assert (=> b!82407 (= lt!131069 ((_ sign_extend 32) (size!1698 (buf!2088 b2!98))))))

(assert (= (and d!26034 res!67897) b!82406))

(assert (= (and b!82406 res!67896) b!82407))

(assert (=> d!26034 m!128841))

(assert (=> d!26034 m!128873))

(assert (=> b!82377 d!26034))

(declare-fun d!26036 () Bool)

(declare-fun e!54448 () Bool)

(assert (=> d!26036 e!54448))

(declare-fun res!67899 () Bool)

(assert (=> d!26036 (=> (not res!67899) (not e!54448))))

(declare-fun lt!131074 () (_ BitVec 64))

(declare-fun lt!131070 () (_ BitVec 64))

(declare-fun lt!131071 () (_ BitVec 64))

(assert (=> d!26036 (= res!67899 (= lt!131071 (bvsub lt!131070 lt!131074)))))

(assert (=> d!26036 (or (= (bvand lt!131070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131070 lt!131074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26036 (= lt!131074 (remainingBits!0 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))) ((_ sign_extend 32) (currentByte!4090 b1!98)) ((_ sign_extend 32) (currentBit!4085 b1!98))))))

(declare-fun lt!131073 () (_ BitVec 64))

(declare-fun lt!131072 () (_ BitVec 64))

(assert (=> d!26036 (= lt!131070 (bvmul lt!131073 lt!131072))))

(assert (=> d!26036 (or (= lt!131073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131072 (bvsdiv (bvmul lt!131073 lt!131072) lt!131073)))))

(assert (=> d!26036 (= lt!131072 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26036 (= lt!131073 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))))))

(assert (=> d!26036 (= lt!131071 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4090 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4085 b1!98))))))

(assert (=> d!26036 (invariant!0 (currentBit!4085 b1!98) (currentByte!4090 b1!98) (size!1698 (buf!2088 b1!98)))))

(assert (=> d!26036 (= (bitIndex!0 (size!1698 (buf!2088 b1!98)) (currentByte!4090 b1!98) (currentBit!4085 b1!98)) lt!131071)))

(declare-fun b!82408 () Bool)

(declare-fun res!67898 () Bool)

(assert (=> b!82408 (=> (not res!67898) (not e!54448))))

(assert (=> b!82408 (= res!67898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131071))))

(declare-fun b!82409 () Bool)

(declare-fun lt!131075 () (_ BitVec 64))

(assert (=> b!82409 (= e!54448 (bvsle lt!131071 (bvmul lt!131075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82409 (or (= lt!131075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131075)))))

(assert (=> b!82409 (= lt!131075 ((_ sign_extend 32) (size!1698 (buf!2088 b1!98))))))

(assert (= (and d!26036 res!67899) b!82408))

(assert (= (and b!82408 res!67898) b!82409))

(assert (=> d!26036 m!128825))

(assert (=> d!26036 m!128871))

(assert (=> b!82377 d!26036))

(check-sat (not d!26032) (not d!26024) (not d!26022) (not d!26028) (not d!26034) (not d!26016) (not d!26036))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16666 () Bool)

(assert start!16666)

(declare-fun b!82458 () Bool)

(declare-fun e!54495 () Bool)

(declare-datatypes ((array!3721 0))(
  ( (array!3722 (arr!2338 (Array (_ BitVec 32) (_ BitVec 8))) (size!1701 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2964 0))(
  ( (BitStream!2965 (buf!2091 array!3721) (currentByte!4105 (_ BitVec 32)) (currentBit!4100 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2964)

(declare-fun array_inv!1547 (array!3721) Bool)

(assert (=> b!82458 (= e!54495 (array_inv!1547 (buf!2091 b2!98)))))

(declare-fun b!82459 () Bool)

(declare-fun e!54494 () Bool)

(declare-fun e!54496 () Bool)

(assert (=> b!82459 (= e!54494 (not e!54496))))

(declare-fun res!67937 () Bool)

(assert (=> b!82459 (=> res!67937 e!54496)))

(declare-fun lt!131192 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!131191 () (_ BitVec 64))

(assert (=> b!82459 (= res!67937 (bvsgt lt!131192 (bvsub lt!131191 b1ValidateOffsetBits!11)))))

(declare-fun b1!98 () BitStream!2964)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82459 (= (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))) ((_ sign_extend 32) (currentByte!4105 b1!98)) ((_ sign_extend 32) (currentBit!4100 b1!98))) (bvsub lt!131191 lt!131192))))

(assert (=> b!82459 (= lt!131191 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98)))))))

(declare-datatypes ((Unit!5511 0))(
  ( (Unit!5512) )
))
(declare-fun lt!131189 () Unit!5511)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2964) Unit!5511)

(assert (=> b!82459 (= lt!131189 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!67939 () Bool)

(declare-fun e!54493 () Bool)

(assert (=> start!16666 (=> (not res!67939) (not e!54493))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16666 (= res!67939 (and (= (size!1701 (buf!2091 b1!98)) (size!1701 (buf!2091 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16666 e!54493))

(declare-fun e!54492 () Bool)

(declare-fun inv!12 (BitStream!2964) Bool)

(assert (=> start!16666 (and (inv!12 b1!98) e!54492)))

(assert (=> start!16666 (and (inv!12 b2!98) e!54495)))

(assert (=> start!16666 true))

(declare-fun b!82460 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82460 (= e!54496 (invariant!0 (currentBit!4100 b1!98) (currentByte!4105 b1!98) (size!1701 (buf!2091 b1!98))))))

(declare-fun lt!131193 () (_ BitVec 64))

(assert (=> b!82460 (= (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b2!98))) ((_ sign_extend 32) (currentByte!4105 b2!98)) ((_ sign_extend 32) (currentBit!4100 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1701 (buf!2091 b2!98)))) lt!131193))))

(declare-fun lt!131190 () Unit!5511)

(assert (=> b!82460 (= lt!131190 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82461 () Bool)

(declare-fun res!67938 () Bool)

(assert (=> b!82461 (=> (not res!67938) (not e!54493))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82461 (= res!67938 (validate_offset_bits!1 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))) ((_ sign_extend 32) (currentByte!4105 b1!98)) ((_ sign_extend 32) (currentBit!4100 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82462 () Bool)

(assert (=> b!82462 (= e!54492 (array_inv!1547 (buf!2091 b1!98)))))

(declare-fun b!82463 () Bool)

(assert (=> b!82463 (= e!54493 e!54494)))

(declare-fun res!67936 () Bool)

(assert (=> b!82463 (=> (not res!67936) (not e!54494))))

(assert (=> b!82463 (= res!67936 (= (bvadd lt!131192 b1b2Diff!1) lt!131193))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82463 (= lt!131193 (bitIndex!0 (size!1701 (buf!2091 b2!98)) (currentByte!4105 b2!98) (currentBit!4100 b2!98)))))

(assert (=> b!82463 (= lt!131192 (bitIndex!0 (size!1701 (buf!2091 b1!98)) (currentByte!4105 b1!98) (currentBit!4100 b1!98)))))

(assert (= (and start!16666 res!67939) b!82461))

(assert (= (and b!82461 res!67938) b!82463))

(assert (= (and b!82463 res!67936) b!82459))

(assert (= (and b!82459 (not res!67937)) b!82460))

(assert (= start!16666 b!82462))

(assert (= start!16666 b!82458))

(declare-fun m!128919 () Bool)

(assert (=> start!16666 m!128919))

(declare-fun m!128921 () Bool)

(assert (=> start!16666 m!128921))

(declare-fun m!128923 () Bool)

(assert (=> b!82460 m!128923))

(declare-fun m!128925 () Bool)

(assert (=> b!82460 m!128925))

(declare-fun m!128927 () Bool)

(assert (=> b!82460 m!128927))

(declare-fun m!128929 () Bool)

(assert (=> b!82458 m!128929))

(declare-fun m!128931 () Bool)

(assert (=> b!82461 m!128931))

(declare-fun m!128933 () Bool)

(assert (=> b!82459 m!128933))

(declare-fun m!128935 () Bool)

(assert (=> b!82459 m!128935))

(declare-fun m!128937 () Bool)

(assert (=> b!82463 m!128937))

(declare-fun m!128939 () Bool)

(assert (=> b!82463 m!128939))

(declare-fun m!128941 () Bool)

(assert (=> b!82462 m!128941))

(check-sat (not start!16666) (not b!82460) (not b!82458) (not b!82461) (not b!82459) (not b!82462) (not b!82463))
(check-sat)
(get-model)

(declare-fun d!26088 () Bool)

(assert (=> d!26088 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))) ((_ sign_extend 32) (currentByte!4105 b1!98)) ((_ sign_extend 32) (currentBit!4100 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))) ((_ sign_extend 32) (currentByte!4105 b1!98)) ((_ sign_extend 32) (currentBit!4100 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6396 () Bool)

(assert (= bs!6396 d!26088))

(assert (=> bs!6396 m!128933))

(assert (=> b!82461 d!26088))

(declare-fun d!26090 () Bool)

(assert (=> d!26090 (= (inv!12 b1!98) (invariant!0 (currentBit!4100 b1!98) (currentByte!4105 b1!98) (size!1701 (buf!2091 b1!98))))))

(declare-fun bs!6397 () Bool)

(assert (= bs!6397 d!26090))

(assert (=> bs!6397 m!128923))

(assert (=> start!16666 d!26090))

(declare-fun d!26092 () Bool)

(assert (=> d!26092 (= (inv!12 b2!98) (invariant!0 (currentBit!4100 b2!98) (currentByte!4105 b2!98) (size!1701 (buf!2091 b2!98))))))

(declare-fun bs!6398 () Bool)

(assert (= bs!6398 d!26092))

(declare-fun m!128967 () Bool)

(assert (=> bs!6398 m!128967))

(assert (=> start!16666 d!26092))

(declare-fun d!26094 () Bool)

(assert (=> d!26094 (= (invariant!0 (currentBit!4100 b1!98) (currentByte!4105 b1!98) (size!1701 (buf!2091 b1!98))) (and (bvsge (currentBit!4100 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4100 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4105 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4105 b1!98) (size!1701 (buf!2091 b1!98))) (and (= (currentBit!4100 b1!98) #b00000000000000000000000000000000) (= (currentByte!4105 b1!98) (size!1701 (buf!2091 b1!98)))))))))

(assert (=> b!82460 d!26094))

(declare-fun d!26096 () Bool)

(assert (=> d!26096 (= (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b2!98))) ((_ sign_extend 32) (currentByte!4105 b2!98)) ((_ sign_extend 32) (currentBit!4100 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1701 (buf!2091 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4105 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4100 b2!98)))))))

(assert (=> b!82460 d!26096))

(declare-fun d!26098 () Bool)

(declare-fun lt!131222 () (_ BitVec 64))

(declare-fun lt!131223 () (_ BitVec 64))

(assert (=> d!26098 (= (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b2!98))) ((_ sign_extend 32) (currentByte!4105 b2!98)) ((_ sign_extend 32) (currentBit!4100 b2!98))) (bvsub lt!131222 lt!131223))))

(assert (=> d!26098 (or (= (bvand lt!131222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131223 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131222 lt!131223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26098 (= lt!131223 (bitIndex!0 (size!1701 (buf!2091 b2!98)) (currentByte!4105 b2!98) (currentBit!4100 b2!98)))))

(declare-fun lt!131220 () (_ BitVec 64))

(declare-fun lt!131219 () (_ BitVec 64))

(assert (=> d!26098 (= lt!131222 (bvmul lt!131220 lt!131219))))

(assert (=> d!26098 (or (= lt!131220 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131219 (bvsdiv (bvmul lt!131220 lt!131219) lt!131220)))))

(assert (=> d!26098 (= lt!131219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26098 (= lt!131220 ((_ sign_extend 32) (size!1701 (buf!2091 b2!98))))))

(declare-fun lt!131221 () Unit!5511)

(declare-fun choose!23 (BitStream!2964) Unit!5511)

(assert (=> d!26098 (= lt!131221 (choose!23 b2!98))))

(assert (=> d!26098 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131221)))

(declare-fun bs!6399 () Bool)

(assert (= bs!6399 d!26098))

(assert (=> bs!6399 m!128925))

(assert (=> bs!6399 m!128937))

(declare-fun m!128969 () Bool)

(assert (=> bs!6399 m!128969))

(assert (=> b!82460 d!26098))

(declare-fun d!26100 () Bool)

(assert (=> d!26100 (= (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))) ((_ sign_extend 32) (currentByte!4105 b1!98)) ((_ sign_extend 32) (currentBit!4100 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4105 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4100 b1!98)))))))

(assert (=> b!82459 d!26100))

(declare-fun d!26102 () Bool)

(declare-fun lt!131227 () (_ BitVec 64))

(declare-fun lt!131228 () (_ BitVec 64))

(assert (=> d!26102 (= (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))) ((_ sign_extend 32) (currentByte!4105 b1!98)) ((_ sign_extend 32) (currentBit!4100 b1!98))) (bvsub lt!131227 lt!131228))))

(assert (=> d!26102 (or (= (bvand lt!131227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131227 lt!131228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26102 (= lt!131228 (bitIndex!0 (size!1701 (buf!2091 b1!98)) (currentByte!4105 b1!98) (currentBit!4100 b1!98)))))

(declare-fun lt!131225 () (_ BitVec 64))

(declare-fun lt!131224 () (_ BitVec 64))

(assert (=> d!26102 (= lt!131227 (bvmul lt!131225 lt!131224))))

(assert (=> d!26102 (or (= lt!131225 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131224 (bvsdiv (bvmul lt!131225 lt!131224) lt!131225)))))

(assert (=> d!26102 (= lt!131224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26102 (= lt!131225 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))))))

(declare-fun lt!131226 () Unit!5511)

(assert (=> d!26102 (= lt!131226 (choose!23 b1!98))))

(assert (=> d!26102 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131226)))

(declare-fun bs!6400 () Bool)

(assert (= bs!6400 d!26102))

(assert (=> bs!6400 m!128933))

(assert (=> bs!6400 m!128939))

(declare-fun m!128971 () Bool)

(assert (=> bs!6400 m!128971))

(assert (=> b!82459 d!26102))

(declare-fun d!26104 () Bool)

(assert (=> d!26104 (= (array_inv!1547 (buf!2091 b2!98)) (bvsge (size!1701 (buf!2091 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82458 d!26104))

(declare-fun d!26106 () Bool)

(declare-fun e!54522 () Bool)

(assert (=> d!26106 e!54522))

(declare-fun res!67957 () Bool)

(assert (=> d!26106 (=> (not res!67957) (not e!54522))))

(declare-fun lt!131243 () (_ BitVec 64))

(declare-fun lt!131245 () (_ BitVec 64))

(declare-fun lt!131241 () (_ BitVec 64))

(assert (=> d!26106 (= res!67957 (= lt!131245 (bvsub lt!131241 lt!131243)))))

(assert (=> d!26106 (or (= (bvand lt!131241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131243 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131241 lt!131243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26106 (= lt!131243 (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b2!98))) ((_ sign_extend 32) (currentByte!4105 b2!98)) ((_ sign_extend 32) (currentBit!4100 b2!98))))))

(declare-fun lt!131246 () (_ BitVec 64))

(declare-fun lt!131244 () (_ BitVec 64))

(assert (=> d!26106 (= lt!131241 (bvmul lt!131246 lt!131244))))

(assert (=> d!26106 (or (= lt!131246 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131244 (bvsdiv (bvmul lt!131246 lt!131244) lt!131246)))))

(assert (=> d!26106 (= lt!131244 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26106 (= lt!131246 ((_ sign_extend 32) (size!1701 (buf!2091 b2!98))))))

(assert (=> d!26106 (= lt!131245 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4105 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4100 b2!98))))))

(assert (=> d!26106 (invariant!0 (currentBit!4100 b2!98) (currentByte!4105 b2!98) (size!1701 (buf!2091 b2!98)))))

(assert (=> d!26106 (= (bitIndex!0 (size!1701 (buf!2091 b2!98)) (currentByte!4105 b2!98) (currentBit!4100 b2!98)) lt!131245)))

(declare-fun b!82487 () Bool)

(declare-fun res!67956 () Bool)

(assert (=> b!82487 (=> (not res!67956) (not e!54522))))

(assert (=> b!82487 (= res!67956 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131245))))

(declare-fun b!82488 () Bool)

(declare-fun lt!131242 () (_ BitVec 64))

(assert (=> b!82488 (= e!54522 (bvsle lt!131245 (bvmul lt!131242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82488 (or (= lt!131242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131242)))))

(assert (=> b!82488 (= lt!131242 ((_ sign_extend 32) (size!1701 (buf!2091 b2!98))))))

(assert (= (and d!26106 res!67957) b!82487))

(assert (= (and b!82487 res!67956) b!82488))

(assert (=> d!26106 m!128925))

(assert (=> d!26106 m!128967))

(assert (=> b!82463 d!26106))

(declare-fun d!26108 () Bool)

(declare-fun e!54523 () Bool)

(assert (=> d!26108 e!54523))

(declare-fun res!67959 () Bool)

(assert (=> d!26108 (=> (not res!67959) (not e!54523))))

(declare-fun lt!131251 () (_ BitVec 64))

(declare-fun lt!131249 () (_ BitVec 64))

(declare-fun lt!131247 () (_ BitVec 64))

(assert (=> d!26108 (= res!67959 (= lt!131251 (bvsub lt!131247 lt!131249)))))

(assert (=> d!26108 (or (= (bvand lt!131247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131247 lt!131249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26108 (= lt!131249 (remainingBits!0 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))) ((_ sign_extend 32) (currentByte!4105 b1!98)) ((_ sign_extend 32) (currentBit!4100 b1!98))))))

(declare-fun lt!131252 () (_ BitVec 64))

(declare-fun lt!131250 () (_ BitVec 64))

(assert (=> d!26108 (= lt!131247 (bvmul lt!131252 lt!131250))))

(assert (=> d!26108 (or (= lt!131252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131250 (bvsdiv (bvmul lt!131252 lt!131250) lt!131252)))))

(assert (=> d!26108 (= lt!131250 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26108 (= lt!131252 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))))))

(assert (=> d!26108 (= lt!131251 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4105 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4100 b1!98))))))

(assert (=> d!26108 (invariant!0 (currentBit!4100 b1!98) (currentByte!4105 b1!98) (size!1701 (buf!2091 b1!98)))))

(assert (=> d!26108 (= (bitIndex!0 (size!1701 (buf!2091 b1!98)) (currentByte!4105 b1!98) (currentBit!4100 b1!98)) lt!131251)))

(declare-fun b!82489 () Bool)

(declare-fun res!67958 () Bool)

(assert (=> b!82489 (=> (not res!67958) (not e!54523))))

(assert (=> b!82489 (= res!67958 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131251))))

(declare-fun b!82490 () Bool)

(declare-fun lt!131248 () (_ BitVec 64))

(assert (=> b!82490 (= e!54523 (bvsle lt!131251 (bvmul lt!131248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82490 (or (= lt!131248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131248)))))

(assert (=> b!82490 (= lt!131248 ((_ sign_extend 32) (size!1701 (buf!2091 b1!98))))))

(assert (= (and d!26108 res!67959) b!82489))

(assert (= (and b!82489 res!67958) b!82490))

(assert (=> d!26108 m!128933))

(assert (=> d!26108 m!128923))

(assert (=> b!82463 d!26108))

(declare-fun d!26110 () Bool)

(assert (=> d!26110 (= (array_inv!1547 (buf!2091 b1!98)) (bvsge (size!1701 (buf!2091 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82462 d!26110))

(check-sat (not d!26106) (not d!26098) (not d!26108) (not d!26090) (not d!26092) (not d!26088) (not d!26102))

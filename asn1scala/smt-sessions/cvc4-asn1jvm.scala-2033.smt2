; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51904 () Bool)

(assert start!51904)

(declare-fun res!200067 () Bool)

(declare-fun e!166034 () Bool)

(assert (=> start!51904 (=> (not res!200067) (not e!166034))))

(declare-datatypes ((array!13045 0))(
  ( (array!13046 (arr!6702 (Array (_ BitVec 32) (_ BitVec 8))) (size!5715 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10352 0))(
  ( (BitStream!10353 (buf!6169 array!13045) (currentByte!11484 (_ BitVec 32)) (currentBit!11479 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10352)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51904 (= res!200067 (validate_offset_bits!1 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) ((_ sign_extend 32) (currentByte!11484 thiss!1948)) ((_ sign_extend 32) (currentBit!11479 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11484 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11479 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51904 e!166034))

(declare-fun e!166032 () Bool)

(declare-fun inv!12 (BitStream!10352) Bool)

(assert (=> start!51904 (and (inv!12 thiss!1948) e!166032)))

(declare-fun b!239620 () Bool)

(declare-datatypes ((Unit!17519 0))(
  ( (Unit!17520) )
))
(declare-datatypes ((tuple2!20248 0))(
  ( (tuple2!20249 (_1!11046 Unit!17519) (_2!11046 BitStream!10352)) )
))
(declare-fun lt!374217 () tuple2!20248)

(assert (=> b!239620 (= e!166034 (not (inv!12 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217))))))))

(declare-fun alignToByte!0 (BitStream!10352) tuple2!20248)

(assert (=> b!239620 (= lt!374217 (alignToByte!0 thiss!1948))))

(declare-fun b!239621 () Bool)

(declare-fun array_inv!5456 (array!13045) Bool)

(assert (=> b!239621 (= e!166032 (array_inv!5456 (buf!6169 thiss!1948)))))

(assert (= (and start!51904 res!200067) b!239620))

(assert (= start!51904 b!239621))

(declare-fun m!361887 () Bool)

(assert (=> start!51904 m!361887))

(declare-fun m!361889 () Bool)

(assert (=> start!51904 m!361889))

(declare-fun m!361891 () Bool)

(assert (=> b!239620 m!361891))

(declare-fun m!361893 () Bool)

(assert (=> b!239620 m!361893))

(declare-fun m!361895 () Bool)

(assert (=> b!239621 m!361895))

(push 1)

(assert (not b!239621))

(assert (not start!51904))

(assert (not b!239620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81002 () Bool)

(assert (=> d!81002 (= (array_inv!5456 (buf!6169 thiss!1948)) (bvsge (size!5715 (buf!6169 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239621 d!81002))

(declare-fun d!81006 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81006 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) ((_ sign_extend 32) (currentByte!11484 thiss!1948)) ((_ sign_extend 32) (currentBit!11479 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11484 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11479 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) ((_ sign_extend 32) (currentByte!11484 thiss!1948)) ((_ sign_extend 32) (currentBit!11479 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11484 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11479 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20411 () Bool)

(assert (= bs!20411 d!81006))

(declare-fun m!361911 () Bool)

(assert (=> bs!20411 m!361911))

(assert (=> start!51904 d!81006))

(declare-fun d!81012 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81012 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11479 thiss!1948) (currentByte!11484 thiss!1948) (size!5715 (buf!6169 thiss!1948))))))

(declare-fun bs!20412 () Bool)

(assert (= bs!20412 d!81012))

(declare-fun m!361913 () Bool)

(assert (=> bs!20412 m!361913))

(assert (=> start!51904 d!81012))

(declare-fun d!81014 () Bool)

(assert (=> d!81014 (= (inv!12 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) (invariant!0 (currentBit!11479 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) (currentByte!11484 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) (size!5715 (buf!6169 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))))))))

(declare-fun bs!20413 () Bool)

(assert (= bs!20413 d!81014))

(declare-fun m!361915 () Bool)

(assert (=> bs!20413 m!361915))

(assert (=> b!239620 d!81014))

(declare-fun d!81016 () Bool)

(declare-fun e!166051 () Bool)

(assert (=> d!81016 e!166051))

(declare-fun res!200084 () Bool)

(assert (=> d!81016 (=> (not res!200084) (not e!166051))))

(assert (=> d!81016 (= res!200084 (validate_offset_bits!1 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) ((_ sign_extend 32) (currentByte!11484 thiss!1948)) ((_ sign_extend 32) (currentBit!11479 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11479 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun Unit!17529 () Unit!17519)

(declare-fun Unit!17530 () Unit!17519)

(assert (=> d!81016 (= (alignToByte!0 thiss!1948) (ite (not (= (currentBit!11479 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20249 Unit!17529 (BitStream!10353 (buf!6169 thiss!1948) (bvadd (currentByte!11484 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20249 Unit!17530 thiss!1948)))))

(declare-fun b!239638 () Bool)

(declare-fun e!166052 () Bool)

(assert (=> b!239638 (= e!166051 e!166052)))

(declare-fun res!200085 () Bool)

(assert (=> b!239638 (=> (not res!200085) (not e!166052))))

(declare-fun lt!374244 () tuple2!20248)

(assert (=> b!239638 (= res!200085 (= (buf!6169 (_2!11046 lt!374244)) (buf!6169 thiss!1948)))))

(declare-fun Unit!17531 () Unit!17519)

(declare-fun Unit!17532 () Unit!17519)

(assert (=> b!239638 (= lt!374244 (ite (not (= (currentBit!11479 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20249 Unit!17531 (BitStream!10353 (buf!6169 thiss!1948) (bvadd (currentByte!11484 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20249 Unit!17532 thiss!1948)))))

(declare-fun lt!374242 () (_ BitVec 64))

(declare-fun lt!374243 () (_ BitVec 64))

(declare-fun b!239639 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239639 (= e!166052 (bvsle (bitIndex!0 (size!5715 (buf!6169 (_2!11046 lt!374244))) (currentByte!11484 (_2!11046 lt!374244)) (currentBit!11479 (_2!11046 lt!374244))) (bvadd lt!374242 lt!374243)))))

(assert (=> b!239639 (or (not (= (bvand lt!374242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374243 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!374242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!374242 lt!374243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239639 (= lt!374243 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!239639 (= lt!374242 (bitIndex!0 (size!5715 (buf!6169 thiss!1948)) (currentByte!11484 thiss!1948) (currentBit!11479 thiss!1948)))))

(assert (= (and d!81016 res!200084) b!239638))

(assert (= (and b!239638 res!200085) b!239639))

(declare-fun m!361927 () Bool)

(assert (=> d!81016 m!361927))

(declare-fun m!361929 () Bool)

(assert (=> b!239639 m!361929))

(declare-fun m!361931 () Bool)

(assert (=> b!239639 m!361931))

(assert (=> b!239620 d!81016))

(push 1)

(assert (not d!81012))

(assert (not d!81006))

(assert (not b!239639))

(assert (not d!81016))

(assert (not d!81014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81048 () Bool)

(assert (=> d!81048 (= (invariant!0 (currentBit!11479 thiss!1948) (currentByte!11484 thiss!1948) (size!5715 (buf!6169 thiss!1948))) (and (bvsge (currentBit!11479 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11479 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11484 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11484 thiss!1948) (size!5715 (buf!6169 thiss!1948))) (and (= (currentBit!11479 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11484 thiss!1948) (size!5715 (buf!6169 thiss!1948)))))))))

(assert (=> d!81012 d!81048))

(declare-fun d!81050 () Bool)

(assert (=> d!81050 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) ((_ sign_extend 32) (currentByte!11484 thiss!1948)) ((_ sign_extend 32) (currentBit!11479 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11479 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) ((_ sign_extend 32) (currentByte!11484 thiss!1948)) ((_ sign_extend 32) (currentBit!11479 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11479 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20418 () Bool)

(assert (= bs!20418 d!81050))

(assert (=> bs!20418 m!361911))

(assert (=> d!81016 d!81050))

(declare-fun d!81052 () Bool)

(declare-fun e!166063 () Bool)

(assert (=> d!81052 e!166063))

(declare-fun res!200107 () Bool)

(assert (=> d!81052 (=> (not res!200107) (not e!166063))))

(declare-fun lt!374305 () (_ BitVec 64))

(declare-fun lt!374307 () (_ BitVec 64))

(declare-fun lt!374310 () (_ BitVec 64))

(assert (=> d!81052 (= res!200107 (= lt!374305 (bvsub lt!374307 lt!374310)))))

(assert (=> d!81052 (or (= (bvand lt!374307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374310 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374307 lt!374310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81052 (= lt!374310 (remainingBits!0 ((_ sign_extend 32) (size!5715 (buf!6169 (_2!11046 lt!374244)))) ((_ sign_extend 32) (currentByte!11484 (_2!11046 lt!374244))) ((_ sign_extend 32) (currentBit!11479 (_2!11046 lt!374244)))))))

(declare-fun lt!374309 () (_ BitVec 64))

(declare-fun lt!374308 () (_ BitVec 64))

(assert (=> d!81052 (= lt!374307 (bvmul lt!374309 lt!374308))))

(assert (=> d!81052 (or (= lt!374309 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374308 (bvsdiv (bvmul lt!374309 lt!374308) lt!374309)))))

(assert (=> d!81052 (= lt!374308 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81052 (= lt!374309 ((_ sign_extend 32) (size!5715 (buf!6169 (_2!11046 lt!374244)))))))

(assert (=> d!81052 (= lt!374305 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11484 (_2!11046 lt!374244))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11479 (_2!11046 lt!374244)))))))

(assert (=> d!81052 (invariant!0 (currentBit!11479 (_2!11046 lt!374244)) (currentByte!11484 (_2!11046 lt!374244)) (size!5715 (buf!6169 (_2!11046 lt!374244))))))

(assert (=> d!81052 (= (bitIndex!0 (size!5715 (buf!6169 (_2!11046 lt!374244))) (currentByte!11484 (_2!11046 lt!374244)) (currentBit!11479 (_2!11046 lt!374244))) lt!374305)))

(declare-fun b!239660 () Bool)

(declare-fun res!200106 () Bool)

(assert (=> b!239660 (=> (not res!200106) (not e!166063))))

(assert (=> b!239660 (= res!200106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374305))))

(declare-fun b!239661 () Bool)

(declare-fun lt!374306 () (_ BitVec 64))

(assert (=> b!239661 (= e!166063 (bvsle lt!374305 (bvmul lt!374306 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239661 (or (= lt!374306 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374306 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374306)))))

(assert (=> b!239661 (= lt!374306 ((_ sign_extend 32) (size!5715 (buf!6169 (_2!11046 lt!374244)))))))

(assert (= (and d!81052 res!200107) b!239660))

(assert (= (and b!239660 res!200106) b!239661))

(declare-fun m!361941 () Bool)

(assert (=> d!81052 m!361941))

(declare-fun m!361943 () Bool)

(assert (=> d!81052 m!361943))

(assert (=> b!239639 d!81052))

(declare-fun d!81054 () Bool)

(declare-fun e!166064 () Bool)

(assert (=> d!81054 e!166064))

(declare-fun res!200109 () Bool)

(assert (=> d!81054 (=> (not res!200109) (not e!166064))))

(declare-fun lt!374316 () (_ BitVec 64))

(declare-fun lt!374311 () (_ BitVec 64))

(declare-fun lt!374313 () (_ BitVec 64))

(assert (=> d!81054 (= res!200109 (= lt!374311 (bvsub lt!374313 lt!374316)))))

(assert (=> d!81054 (or (= (bvand lt!374313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374313 lt!374316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81054 (= lt!374316 (remainingBits!0 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) ((_ sign_extend 32) (currentByte!11484 thiss!1948)) ((_ sign_extend 32) (currentBit!11479 thiss!1948))))))

(declare-fun lt!374315 () (_ BitVec 64))

(declare-fun lt!374314 () (_ BitVec 64))

(assert (=> d!81054 (= lt!374313 (bvmul lt!374315 lt!374314))))

(assert (=> d!81054 (or (= lt!374315 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374314 (bvsdiv (bvmul lt!374315 lt!374314) lt!374315)))))

(assert (=> d!81054 (= lt!374314 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81054 (= lt!374315 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))))))

(assert (=> d!81054 (= lt!374311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11484 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11479 thiss!1948))))))

(assert (=> d!81054 (invariant!0 (currentBit!11479 thiss!1948) (currentByte!11484 thiss!1948) (size!5715 (buf!6169 thiss!1948)))))

(assert (=> d!81054 (= (bitIndex!0 (size!5715 (buf!6169 thiss!1948)) (currentByte!11484 thiss!1948) (currentBit!11479 thiss!1948)) lt!374311)))

(declare-fun b!239662 () Bool)

(declare-fun res!200108 () Bool)

(assert (=> b!239662 (=> (not res!200108) (not e!166064))))

(assert (=> b!239662 (= res!200108 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374311))))

(declare-fun b!239663 () Bool)

(declare-fun lt!374312 () (_ BitVec 64))

(assert (=> b!239663 (= e!166064 (bvsle lt!374311 (bvmul lt!374312 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239663 (or (= lt!374312 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374312 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374312)))))

(assert (=> b!239663 (= lt!374312 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))))))

(assert (= (and d!81054 res!200109) b!239662))

(assert (= (and b!239662 res!200108) b!239663))

(assert (=> d!81054 m!361911))

(assert (=> d!81054 m!361913))

(assert (=> b!239639 d!81054))

(declare-fun d!81056 () Bool)

(assert (=> d!81056 (= (remainingBits!0 ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) ((_ sign_extend 32) (currentByte!11484 thiss!1948)) ((_ sign_extend 32) (currentBit!11479 thiss!1948))) (bvsub (bvmul ((_ sign_extend 32) (size!5715 (buf!6169 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11484 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11479 thiss!1948)))))))

(assert (=> d!81006 d!81056))

(declare-fun d!81058 () Bool)

(assert (=> d!81058 (= (invariant!0 (currentBit!11479 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) (currentByte!11484 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) (size!5715 (buf!6169 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))))) (and (bvsge (currentBit!11479 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) #b00000000000000000000000000000000) (bvslt (currentBit!11479 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) #b00000000000000000000000000001000) (bvsge (currentByte!11484 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!11484 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) (size!5715 (buf!6169 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))))) (and (= (currentBit!11479 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) #b00000000000000000000000000000000) (= (currentByte!11484 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217)))) (size!5715 (buf!6169 (BitStream!10353 (buf!6169 (_2!11046 lt!374217)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11484 (_2!11046 lt!374217))) #b00000000000000000000000000000100)) (currentBit!11479 (_2!11046 lt!374217))))))))))))

(assert (=> d!81014 d!81058))

(push 1)

(assert (not d!81050))

(assert (not d!81054))

(assert (not d!81052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


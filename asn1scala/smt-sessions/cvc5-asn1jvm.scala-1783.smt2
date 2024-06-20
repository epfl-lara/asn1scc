; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48702 () Bool)

(assert start!48702)

(declare-fun lt!368189 () (_ BitVec 64))

(declare-fun b!230582 () Bool)

(declare-datatypes ((array!11764 0))(
  ( (array!11765 (arr!6142 (Array (_ BitVec 32) (_ BitVec 8))) (size!5155 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9406 0))(
  ( (BitStream!9407 (buf!5696 array!11764) (currentByte!10679 (_ BitVec 32)) (currentBit!10674 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9406)

(declare-fun lt!368190 () (_ BitVec 64))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun e!158376 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9406)

(assert (=> b!230582 (= e!158376 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101)))) lt!368190) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368189 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10679 b2!99))) ((_ sign_extend 32) (currentBit!10674 b2!99)))) (not (= (bvsub lt!368189 bits!86) lt!368190))))))

(assert (=> b!230582 (= lt!368190 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10679 b1!101))) ((_ sign_extend 32) (currentBit!10674 b1!101))))))

(declare-fun b!230583 () Bool)

(declare-fun res!193263 () Bool)

(assert (=> b!230583 (=> (not res!193263) (not e!158376))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230583 (= res!193263 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))) ((_ sign_extend 32) (currentByte!10679 b1!101)) ((_ sign_extend 32) (currentBit!10674 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!193262 () Bool)

(declare-fun e!158379 () Bool)

(assert (=> start!48702 (=> (not res!193262) (not e!158379))))

(assert (=> start!48702 (= res!193262 (and (= (size!5155 (buf!5696 b1!101)) (size!5155 (buf!5696 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48702 e!158379))

(declare-fun e!158377 () Bool)

(declare-fun inv!12 (BitStream!9406) Bool)

(assert (=> start!48702 (and (inv!12 b1!101) e!158377)))

(declare-fun e!158381 () Bool)

(assert (=> start!48702 (and (inv!12 b2!99) e!158381)))

(assert (=> start!48702 true))

(declare-fun b!230584 () Bool)

(declare-fun res!193266 () Bool)

(assert (=> b!230584 (=> (not res!193266) (not e!158376))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230584 (= res!193266 (= lt!368189 (bvadd (bitIndex!0 (size!5155 (buf!5696 b1!101)) (currentByte!10679 b1!101) (currentBit!10674 b1!101)) bits!86)))))

(declare-fun b!230585 () Bool)

(declare-fun array_inv!4896 (array!11764) Bool)

(assert (=> b!230585 (= e!158381 (array_inv!4896 (buf!5696 b2!99)))))

(declare-fun b!230586 () Bool)

(declare-fun res!193265 () Bool)

(assert (=> b!230586 (=> (not res!193265) (not e!158376))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230586 (= res!193265 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))) ((_ sign_extend 32) (currentByte!10679 b1!101)) ((_ sign_extend 32) (currentBit!10674 b1!101)) bytes!19))))

(declare-fun b!230587 () Bool)

(assert (=> b!230587 (= e!158379 e!158376)))

(declare-fun res!193264 () Bool)

(assert (=> b!230587 (=> (not res!193264) (not e!158376))))

(assert (=> b!230587 (= res!193264 (and (bvsle bits!86 lt!368189) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230587 (= lt!368189 (bitIndex!0 (size!5155 (buf!5696 b2!99)) (currentByte!10679 b2!99) (currentBit!10674 b2!99)))))

(declare-fun b!230588 () Bool)

(assert (=> b!230588 (= e!158377 (array_inv!4896 (buf!5696 b1!101)))))

(assert (= (and start!48702 res!193262) b!230587))

(assert (= (and b!230587 res!193264) b!230586))

(assert (= (and b!230586 res!193265) b!230584))

(assert (= (and b!230584 res!193266) b!230583))

(assert (= (and b!230583 res!193263) b!230582))

(assert (= start!48702 b!230588))

(assert (= start!48702 b!230585))

(declare-fun m!353867 () Bool)

(assert (=> b!230583 m!353867))

(declare-fun m!353869 () Bool)

(assert (=> b!230584 m!353869))

(declare-fun m!353871 () Bool)

(assert (=> b!230585 m!353871))

(declare-fun m!353873 () Bool)

(assert (=> b!230588 m!353873))

(declare-fun m!353875 () Bool)

(assert (=> b!230587 m!353875))

(declare-fun m!353877 () Bool)

(assert (=> b!230586 m!353877))

(declare-fun m!353879 () Bool)

(assert (=> start!48702 m!353879))

(declare-fun m!353881 () Bool)

(assert (=> start!48702 m!353881))

(push 1)

(assert (not b!230586))

(assert (not b!230587))

(assert (not b!230588))

(assert (not b!230584))

(assert (not b!230583))

(assert (not b!230585))

(assert (not start!48702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78272 () Bool)

(declare-fun e!158424 () Bool)

(assert (=> d!78272 e!158424))

(declare-fun res!193309 () Bool)

(assert (=> d!78272 (=> (not res!193309) (not e!158424))))

(declare-fun lt!368240 () (_ BitVec 64))

(declare-fun lt!368241 () (_ BitVec 64))

(declare-fun lt!368242 () (_ BitVec 64))

(assert (=> d!78272 (= res!193309 (= lt!368241 (bvsub lt!368240 lt!368242)))))

(assert (=> d!78272 (or (= (bvand lt!368240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368242 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368240 lt!368242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78272 (= lt!368242 (remainingBits!0 ((_ sign_extend 32) (size!5155 (buf!5696 b2!99))) ((_ sign_extend 32) (currentByte!10679 b2!99)) ((_ sign_extend 32) (currentBit!10674 b2!99))))))

(declare-fun lt!368243 () (_ BitVec 64))

(declare-fun lt!368244 () (_ BitVec 64))

(assert (=> d!78272 (= lt!368240 (bvmul lt!368243 lt!368244))))

(assert (=> d!78272 (or (= lt!368243 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368244 (bvsdiv (bvmul lt!368243 lt!368244) lt!368243)))))

(assert (=> d!78272 (= lt!368244 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78272 (= lt!368243 ((_ sign_extend 32) (size!5155 (buf!5696 b2!99))))))

(assert (=> d!78272 (= lt!368241 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10679 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10674 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78272 (invariant!0 (currentBit!10674 b2!99) (currentByte!10679 b2!99) (size!5155 (buf!5696 b2!99)))))

(assert (=> d!78272 (= (bitIndex!0 (size!5155 (buf!5696 b2!99)) (currentByte!10679 b2!99) (currentBit!10674 b2!99)) lt!368241)))

(declare-fun b!230643 () Bool)

(declare-fun res!193310 () Bool)

(assert (=> b!230643 (=> (not res!193310) (not e!158424))))

(assert (=> b!230643 (= res!193310 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368241))))

(declare-fun b!230644 () Bool)

(declare-fun lt!368239 () (_ BitVec 64))

(assert (=> b!230644 (= e!158424 (bvsle lt!368241 (bvmul lt!368239 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230644 (or (= lt!368239 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368239 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368239)))))

(assert (=> b!230644 (= lt!368239 ((_ sign_extend 32) (size!5155 (buf!5696 b2!99))))))

(assert (= (and d!78272 res!193309) b!230643))

(assert (= (and b!230643 res!193310) b!230644))

(declare-fun m!353921 () Bool)

(assert (=> d!78272 m!353921))

(declare-fun m!353923 () Bool)

(assert (=> d!78272 m!353923))

(assert (=> b!230587 d!78272))

(declare-fun d!78274 () Bool)

(assert (=> d!78274 (= (inv!12 b1!101) (invariant!0 (currentBit!10674 b1!101) (currentByte!10679 b1!101) (size!5155 (buf!5696 b1!101))))))

(declare-fun bs!19183 () Bool)

(assert (= bs!19183 d!78274))

(declare-fun m!353925 () Bool)

(assert (=> bs!19183 m!353925))

(assert (=> start!48702 d!78274))

(declare-fun d!78278 () Bool)

(assert (=> d!78278 (= (inv!12 b2!99) (invariant!0 (currentBit!10674 b2!99) (currentByte!10679 b2!99) (size!5155 (buf!5696 b2!99))))))

(declare-fun bs!19184 () Bool)

(assert (= bs!19184 d!78278))

(assert (=> bs!19184 m!353923))

(assert (=> start!48702 d!78278))

(declare-fun d!78280 () Bool)

(assert (=> d!78280 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))) ((_ sign_extend 32) (currentByte!10679 b1!101)) ((_ sign_extend 32) (currentBit!10674 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))) ((_ sign_extend 32) (currentByte!10679 b1!101)) ((_ sign_extend 32) (currentBit!10674 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19188 () Bool)

(assert (= bs!19188 d!78280))

(assert (=> bs!19188 m!353867))

(assert (=> b!230586 d!78280))

(declare-fun d!78288 () Bool)

(assert (=> d!78288 (= (array_inv!4896 (buf!5696 b2!99)) (bvsge (size!5155 (buf!5696 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230585 d!78288))

(declare-fun d!78290 () Bool)

(declare-fun e!158425 () Bool)

(assert (=> d!78290 e!158425))

(declare-fun res!193311 () Bool)

(assert (=> d!78290 (=> (not res!193311) (not e!158425))))

(declare-fun lt!368246 () (_ BitVec 64))

(declare-fun lt!368247 () (_ BitVec 64))

(declare-fun lt!368248 () (_ BitVec 64))

(assert (=> d!78290 (= res!193311 (= lt!368247 (bvsub lt!368246 lt!368248)))))

(assert (=> d!78290 (or (= (bvand lt!368246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368248 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368246 lt!368248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78290 (= lt!368248 (remainingBits!0 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))) ((_ sign_extend 32) (currentByte!10679 b1!101)) ((_ sign_extend 32) (currentBit!10674 b1!101))))))

(declare-fun lt!368249 () (_ BitVec 64))

(declare-fun lt!368250 () (_ BitVec 64))

(assert (=> d!78290 (= lt!368246 (bvmul lt!368249 lt!368250))))

(assert (=> d!78290 (or (= lt!368249 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368250 (bvsdiv (bvmul lt!368249 lt!368250) lt!368249)))))

(assert (=> d!78290 (= lt!368250 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78290 (= lt!368249 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))))))

(assert (=> d!78290 (= lt!368247 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10679 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10674 b1!101))))))

(assert (=> d!78290 (invariant!0 (currentBit!10674 b1!101) (currentByte!10679 b1!101) (size!5155 (buf!5696 b1!101)))))

(assert (=> d!78290 (= (bitIndex!0 (size!5155 (buf!5696 b1!101)) (currentByte!10679 b1!101) (currentBit!10674 b1!101)) lt!368247)))

(declare-fun b!230645 () Bool)

(declare-fun res!193312 () Bool)

(assert (=> b!230645 (=> (not res!193312) (not e!158425))))

(assert (=> b!230645 (= res!193312 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368247))))

(declare-fun b!230646 () Bool)

(declare-fun lt!368245 () (_ BitVec 64))

(assert (=> b!230646 (= e!158425 (bvsle lt!368247 (bvmul lt!368245 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230646 (or (= lt!368245 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368245 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368245)))))

(assert (=> b!230646 (= lt!368245 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))))))

(assert (= (and d!78290 res!193311) b!230645))

(assert (= (and b!230645 res!193312) b!230646))

(assert (=> d!78290 m!353867))

(assert (=> d!78290 m!353925))

(assert (=> b!230584 d!78290))

(declare-fun d!78292 () Bool)

(assert (=> d!78292 (= (remainingBits!0 ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))) ((_ sign_extend 32) (currentByte!10679 b1!101)) ((_ sign_extend 32) (currentBit!10674 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5155 (buf!5696 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10679 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10674 b1!101)))))))

(assert (=> b!230583 d!78292))

(declare-fun d!78294 () Bool)

(assert (=> d!78294 (= (array_inv!4896 (buf!5696 b1!101)) (bvsge (size!5155 (buf!5696 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230588 d!78294))

(push 1)

(assert (not d!78274))

(assert (not d!78290))

(assert (not d!78278))

(assert (not d!78272))

(assert (not d!78280))

(check-sat)

(pop 1)

(push 1)

(check-sat)


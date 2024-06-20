; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73386 () Bool)

(assert start!73386)

(declare-fun res!267141 () Bool)

(declare-fun e!234759 () Bool)

(assert (=> start!73386 (=> (not res!267141) (not e!234759))))

(declare-fun lt!448010 () (_ BitVec 64))

(declare-datatypes ((array!21063 0))(
  ( (array!21064 (arr!10233 (Array (_ BitVec 32) (_ BitVec 8))) (size!9141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14444 0))(
  ( (BitStream!14445 (buf!8283 array!21063) (currentByte!15375 (_ BitVec 32)) (currentBit!15370 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14444)

(assert (=> start!73386 (= res!267141 (and (bvsgt lt!448010 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (currentBit!15370 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73386 (= lt!448010 (remainingBits!0 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) ((_ sign_extend 32) (currentByte!15375 thiss!877)) ((_ sign_extend 32) (currentBit!15370 thiss!877))))))

(assert (=> start!73386 e!234759))

(declare-fun e!234761 () Bool)

(declare-fun inv!12 (BitStream!14444) Bool)

(assert (=> start!73386 (and (inv!12 thiss!877) e!234761)))

(declare-fun b!325544 () Bool)

(declare-fun e!234760 () Bool)

(assert (=> b!325544 (= e!234759 e!234760)))

(declare-fun res!267142 () Bool)

(assert (=> b!325544 (=> res!267142 e!234760)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325544 (= res!267142 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9141 (buf!8283 thiss!877)) (currentByte!15375 thiss!877) (currentBit!15370 thiss!877))) (bitIndex!0 (size!9141 (buf!8283 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877)) #b00000000000000000000000000000000))))))

(declare-fun b!325545 () Bool)

(assert (=> b!325545 (= e!234760 (not (= (bvsub lt!448010 (remainingBits!0 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!325546 () Bool)

(declare-fun array_inv!8693 (array!21063) Bool)

(assert (=> b!325546 (= e!234761 (array_inv!8693 (buf!8283 thiss!877)))))

(assert (= (and start!73386 res!267141) b!325544))

(assert (= (and b!325544 (not res!267142)) b!325545))

(assert (= start!73386 b!325546))

(declare-fun m!463543 () Bool)

(assert (=> start!73386 m!463543))

(declare-fun m!463545 () Bool)

(assert (=> start!73386 m!463545))

(declare-fun m!463547 () Bool)

(assert (=> b!325544 m!463547))

(declare-fun m!463549 () Bool)

(assert (=> b!325544 m!463549))

(declare-fun m!463551 () Bool)

(assert (=> b!325545 m!463551))

(declare-fun m!463553 () Bool)

(assert (=> b!325546 m!463553))

(push 1)

(assert (not b!325545))

(assert (not b!325546))

(assert (not b!325544))

(assert (not start!73386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107354 () Bool)

(assert (=> d!107354 (= (remainingBits!0 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsub (bvmul ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325545 d!107354))

(declare-fun d!107360 () Bool)

(assert (=> d!107360 (= (array_inv!8693 (buf!8283 thiss!877)) (bvsge (size!9141 (buf!8283 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325546 d!107360))

(declare-fun d!107362 () Bool)

(declare-fun e!234773 () Bool)

(assert (=> d!107362 e!234773))

(declare-fun res!267164 () Bool)

(assert (=> d!107362 (=> (not res!267164) (not e!234773))))

(declare-fun lt!448076 () (_ BitVec 64))

(declare-fun lt!448074 () (_ BitVec 64))

(declare-fun lt!448075 () (_ BitVec 64))

(assert (=> d!107362 (= res!267164 (= lt!448074 (bvsub lt!448076 lt!448075)))))

(assert (=> d!107362 (or (= (bvand lt!448076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!448075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!448076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!448076 lt!448075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107362 (= lt!448075 (remainingBits!0 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) ((_ sign_extend 32) (currentByte!15375 thiss!877)) ((_ sign_extend 32) (currentBit!15370 thiss!877))))))

(declare-fun lt!448073 () (_ BitVec 64))

(declare-fun lt!448071 () (_ BitVec 64))

(assert (=> d!107362 (= lt!448076 (bvmul lt!448073 lt!448071))))

(assert (=> d!107362 (or (= lt!448073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!448071 (bvsdiv (bvmul lt!448073 lt!448071) lt!448073)))))

(assert (=> d!107362 (= lt!448071 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107362 (= lt!448073 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))))))

(assert (=> d!107362 (= lt!448074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15375 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15370 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107362 (invariant!0 (currentBit!15370 thiss!877) (currentByte!15375 thiss!877) (size!9141 (buf!8283 thiss!877)))))

(assert (=> d!107362 (= (bitIndex!0 (size!9141 (buf!8283 thiss!877)) (currentByte!15375 thiss!877) (currentBit!15370 thiss!877)) lt!448074)))

(declare-fun b!325567 () Bool)

(declare-fun res!267163 () Bool)

(assert (=> b!325567 (=> (not res!267163) (not e!234773))))

(assert (=> b!325567 (= res!267163 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448074))))

(declare-fun b!325568 () Bool)

(declare-fun lt!448072 () (_ BitVec 64))

(assert (=> b!325568 (= e!234773 (bvsle lt!448074 (bvmul lt!448072 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325568 (or (= lt!448072 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!448072 #b0000000000000000000000000000000000000000000000000000000000001000) lt!448072)))))

(assert (=> b!325568 (= lt!448072 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))))))

(assert (= (and d!107362 res!267164) b!325567))

(assert (= (and b!325567 res!267163) b!325568))

(assert (=> d!107362 m!463543))

(declare-fun m!463567 () Bool)

(assert (=> d!107362 m!463567))

(assert (=> b!325544 d!107362))

(declare-fun d!107364 () Bool)

(declare-fun e!234774 () Bool)

(assert (=> d!107364 e!234774))

(declare-fun res!267166 () Bool)

(assert (=> d!107364 (=> (not res!267166) (not e!234774))))

(declare-fun lt!448082 () (_ BitVec 64))

(declare-fun lt!448080 () (_ BitVec 64))

(declare-fun lt!448081 () (_ BitVec 64))

(assert (=> d!107364 (= res!267166 (= lt!448080 (bvsub lt!448082 lt!448081)))))

(assert (=> d!107364 (or (= (bvand lt!448082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!448081 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!448082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!448082 lt!448081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107364 (= lt!448081 (remainingBits!0 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!448079 () (_ BitVec 64))

(declare-fun lt!448077 () (_ BitVec 64))

(assert (=> d!107364 (= lt!448082 (bvmul lt!448079 lt!448077))))

(assert (=> d!107364 (or (= lt!448079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!448077 (bvsdiv (bvmul lt!448079 lt!448077) lt!448079)))))

(assert (=> d!107364 (= lt!448077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107364 (= lt!448079 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))))))

(assert (=> d!107364 (= lt!448080 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!107364 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877)) (size!9141 (buf!8283 thiss!877)))))

(assert (=> d!107364 (= (bitIndex!0 (size!9141 (buf!8283 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877)) #b00000000000000000000000000000000) lt!448080)))

(declare-fun b!325569 () Bool)

(declare-fun res!267165 () Bool)

(assert (=> b!325569 (=> (not res!267165) (not e!234774))))

(assert (=> b!325569 (= res!267165 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448080))))

(declare-fun b!325570 () Bool)

(declare-fun lt!448078 () (_ BitVec 64))

(assert (=> b!325570 (= e!234774 (bvsle lt!448080 (bvmul lt!448078 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325570 (or (= lt!448078 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!448078 #b0000000000000000000000000000000000000000000000000000000000001000) lt!448078)))))

(assert (=> b!325570 (= lt!448078 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))))))

(assert (= (and d!107364 res!267166) b!325569))

(assert (= (and b!325569 res!267165) b!325570))

(declare-fun m!463569 () Bool)

(assert (=> d!107364 m!463569))

(declare-fun m!463571 () Bool)

(assert (=> d!107364 m!463571))

(assert (=> b!325544 d!107364))

(declare-fun d!107366 () Bool)

(assert (=> d!107366 (= (remainingBits!0 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) ((_ sign_extend 32) (currentByte!15375 thiss!877)) ((_ sign_extend 32) (currentBit!15370 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15375 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15370 thiss!877)))))))

(assert (=> start!73386 d!107366))

(declare-fun d!107368 () Bool)

(assert (=> d!107368 (= (inv!12 thiss!877) (invariant!0 (currentBit!15370 thiss!877) (currentByte!15375 thiss!877) (size!9141 (buf!8283 thiss!877))))))

(declare-fun bs!28243 () Bool)

(assert (= bs!28243 d!107368))

(assert (=> bs!28243 m!463567))

(assert (=> start!73386 d!107368))

(push 1)

(assert (not d!107368))

(assert (not d!107362))

(assert (not d!107364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107376 () Bool)

(assert (=> d!107376 (= (invariant!0 (currentBit!15370 thiss!877) (currentByte!15375 thiss!877) (size!9141 (buf!8283 thiss!877))) (and (bvsge (currentBit!15370 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15370 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15375 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15375 thiss!877) (size!9141 (buf!8283 thiss!877))) (and (= (currentBit!15370 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15375 thiss!877) (size!9141 (buf!8283 thiss!877)))))))))

(assert (=> d!107368 d!107376))

(assert (=> d!107362 d!107366))

(assert (=> d!107362 d!107376))

(declare-fun d!107378 () Bool)

(assert (=> d!107378 (= (remainingBits!0 ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)) (bvsub (bvmul ((_ sign_extend 32) (size!9141 (buf!8283 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(assert (=> d!107364 d!107378))

(declare-fun d!107380 () Bool)

(assert (=> d!107380 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877)) (size!9141 (buf!8283 thiss!877))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877)) (size!9141 (buf!8283 thiss!877))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!15375 thiss!877)) (size!9141 (buf!8283 thiss!877)))))))))

(assert (=> d!107364 d!107380))

(push 1)

(check-sat)

(pop 1)


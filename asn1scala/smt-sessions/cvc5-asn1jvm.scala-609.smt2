; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17360 () Bool)

(assert start!17360)

(declare-fun lt!134033 () (_ BitVec 64))

(declare-fun lt!134032 () (_ BitVec 64))

(assert (=> start!17360 (= lt!134033 (bvand lt!134032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!134034 () (_ BitVec 64))

(declare-datatypes ((array!3933 0))(
  ( (array!3934 (arr!2421 (Array (_ BitVec 32) (_ BitVec 8))) (size!1784 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3130 0))(
  ( (BitStream!3131 (buf!2174 array!3933) (currentByte!4320 (_ BitVec 32)) (currentBit!4315 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3130)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> start!17360 (= lt!134034 (bitIndex!0 (size!1784 (buf!2174 b!169)) (currentByte!4320 b!169) (currentBit!4315 b!169)))))

(assert (=> start!17360 (= lt!134032 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1784 (buf!2174 b!169)))))))

(assert (=> start!17360 (and (not (= lt!134033 (bvand lt!134034 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!134033 (bvand (bvsub lt!134032 lt!134034) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!56117 () Bool)

(declare-fun inv!12 (BitStream!3130) Bool)

(assert (=> start!17360 (and (inv!12 b!169) e!56117)))

(declare-fun b!84025 () Bool)

(declare-fun array_inv!1630 (array!3933) Bool)

(assert (=> b!84025 (= e!56117 (array_inv!1630 (buf!2174 b!169)))))

(assert (= start!17360 b!84025))

(declare-fun m!130719 () Bool)

(assert (=> start!17360 m!130719))

(declare-fun m!130721 () Bool)

(assert (=> start!17360 m!130721))

(declare-fun m!130723 () Bool)

(assert (=> b!84025 m!130723))

(push 1)

(assert (not start!17360))

(assert (not b!84025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27022 () Bool)

(declare-fun e!56133 () Bool)

(assert (=> d!27022 e!56133))

(declare-fun res!69018 () Bool)

(assert (=> d!27022 (=> (not res!69018) (not e!56133))))

(declare-fun lt!134067 () (_ BitVec 64))

(declare-fun lt!134065 () (_ BitVec 64))

(declare-fun lt!134066 () (_ BitVec 64))

(assert (=> d!27022 (= res!69018 (= lt!134067 (bvsub lt!134065 lt!134066)))))

(assert (=> d!27022 (or (= (bvand lt!134065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134066 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134065 lt!134066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27022 (= lt!134066 (remainingBits!0 ((_ sign_extend 32) (size!1784 (buf!2174 b!169))) ((_ sign_extend 32) (currentByte!4320 b!169)) ((_ sign_extend 32) (currentBit!4315 b!169))))))

(declare-fun lt!134070 () (_ BitVec 64))

(declare-fun lt!134068 () (_ BitVec 64))

(assert (=> d!27022 (= lt!134065 (bvmul lt!134070 lt!134068))))

(assert (=> d!27022 (or (= lt!134070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134068 (bvsdiv (bvmul lt!134070 lt!134068) lt!134070)))))

(assert (=> d!27022 (= lt!134068 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27022 (= lt!134070 ((_ sign_extend 32) (size!1784 (buf!2174 b!169))))))

(assert (=> d!27022 (= lt!134067 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4320 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4315 b!169))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!27022 (invariant!0 (currentBit!4315 b!169) (currentByte!4320 b!169) (size!1784 (buf!2174 b!169)))))

(assert (=> d!27022 (= (bitIndex!0 (size!1784 (buf!2174 b!169)) (currentByte!4320 b!169) (currentBit!4315 b!169)) lt!134067)))

(declare-fun b!84036 () Bool)

(declare-fun res!69019 () Bool)

(assert (=> b!84036 (=> (not res!69019) (not e!56133))))

(assert (=> b!84036 (= res!69019 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134067))))

(declare-fun b!84037 () Bool)

(declare-fun lt!134069 () (_ BitVec 64))

(assert (=> b!84037 (= e!56133 (bvsle lt!134067 (bvmul lt!134069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84037 (or (= lt!134069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134069)))))

(assert (=> b!84037 (= lt!134069 ((_ sign_extend 32) (size!1784 (buf!2174 b!169))))))

(assert (= (and d!27022 res!69018) b!84036))

(assert (= (and b!84036 res!69019) b!84037))

(declare-fun m!130737 () Bool)

(assert (=> d!27022 m!130737))

(declare-fun m!130739 () Bool)

(assert (=> d!27022 m!130739))

(assert (=> start!17360 d!27022))

(declare-fun d!27032 () Bool)

(assert (=> d!27032 (= (inv!12 b!169) (invariant!0 (currentBit!4315 b!169) (currentByte!4320 b!169) (size!1784 (buf!2174 b!169))))))

(declare-fun bs!6676 () Bool)

(assert (= bs!6676 d!27032))

(assert (=> bs!6676 m!130739))

(assert (=> start!17360 d!27032))

(declare-fun d!27034 () Bool)

(assert (=> d!27034 (= (array_inv!1630 (buf!2174 b!169)) (bvsge (size!1784 (buf!2174 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84025 d!27034))

(push 1)

(assert (not d!27032))

(assert (not d!27022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


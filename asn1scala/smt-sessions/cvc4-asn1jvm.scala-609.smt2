; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17364 () Bool)

(assert start!17364)

(declare-fun lt!134051 () (_ BitVec 64))

(declare-fun lt!134052 () (_ BitVec 64))

(assert (=> start!17364 (= lt!134051 (bvand lt!134052 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!134050 () (_ BitVec 64))

(declare-datatypes ((array!3937 0))(
  ( (array!3938 (arr!2423 (Array (_ BitVec 32) (_ BitVec 8))) (size!1786 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3134 0))(
  ( (BitStream!3135 (buf!2176 array!3937) (currentByte!4322 (_ BitVec 32)) (currentBit!4317 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3134)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> start!17364 (= lt!134050 (bitIndex!0 (size!1786 (buf!2176 b!169)) (currentByte!4322 b!169) (currentBit!4317 b!169)))))

(assert (=> start!17364 (= lt!134052 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1786 (buf!2176 b!169)))))))

(assert (=> start!17364 (and (not (= lt!134051 (bvand lt!134050 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!134051 (bvand (bvsub lt!134052 lt!134050) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!56130 () Bool)

(declare-fun inv!12 (BitStream!3134) Bool)

(assert (=> start!17364 (and (inv!12 b!169) e!56130)))

(declare-fun b!84031 () Bool)

(declare-fun array_inv!1632 (array!3937) Bool)

(assert (=> b!84031 (= e!56130 (array_inv!1632 (buf!2176 b!169)))))

(assert (= start!17364 b!84031))

(declare-fun m!130731 () Bool)

(assert (=> start!17364 m!130731))

(declare-fun m!130733 () Bool)

(assert (=> start!17364 m!130733))

(declare-fun m!130735 () Bool)

(assert (=> b!84031 m!130735))

(push 1)

(assert (not b!84031))

(assert (not start!17364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27028 () Bool)

(assert (=> d!27028 (= (array_inv!1632 (buf!2176 b!169)) (bvsge (size!1786 (buf!2176 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84031 d!27028))

(declare-fun d!27030 () Bool)

(declare-fun e!56136 () Bool)

(assert (=> d!27030 e!56136))

(declare-fun res!69025 () Bool)

(assert (=> d!27030 (=> (not res!69025) (not e!56136))))

(declare-fun lt!134083 () (_ BitVec 64))

(declare-fun lt!134088 () (_ BitVec 64))

(declare-fun lt!134084 () (_ BitVec 64))

(assert (=> d!27030 (= res!69025 (= lt!134083 (bvsub lt!134084 lt!134088)))))

(assert (=> d!27030 (or (= (bvand lt!134084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134088 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134084 lt!134088) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27030 (= lt!134088 (remainingBits!0 ((_ sign_extend 32) (size!1786 (buf!2176 b!169))) ((_ sign_extend 32) (currentByte!4322 b!169)) ((_ sign_extend 32) (currentBit!4317 b!169))))))

(declare-fun lt!134087 () (_ BitVec 64))

(declare-fun lt!134086 () (_ BitVec 64))

(assert (=> d!27030 (= lt!134084 (bvmul lt!134087 lt!134086))))

(assert (=> d!27030 (or (= lt!134087 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134086 (bvsdiv (bvmul lt!134087 lt!134086) lt!134087)))))

(assert (=> d!27030 (= lt!134086 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27030 (= lt!134087 ((_ sign_extend 32) (size!1786 (buf!2176 b!169))))))

(assert (=> d!27030 (= lt!134083 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4322 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4317 b!169))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!27030 (invariant!0 (currentBit!4317 b!169) (currentByte!4322 b!169) (size!1786 (buf!2176 b!169)))))

(assert (=> d!27030 (= (bitIndex!0 (size!1786 (buf!2176 b!169)) (currentByte!4322 b!169) (currentBit!4317 b!169)) lt!134083)))

(declare-fun b!84042 () Bool)

(declare-fun res!69024 () Bool)

(assert (=> b!84042 (=> (not res!69024) (not e!56136))))

(assert (=> b!84042 (= res!69024 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134083))))

(declare-fun b!84043 () Bool)

(declare-fun lt!134085 () (_ BitVec 64))

(assert (=> b!84043 (= e!56136 (bvsle lt!134083 (bvmul lt!134085 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84043 (or (= lt!134085 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134085 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134085)))))

(assert (=> b!84043 (= lt!134085 ((_ sign_extend 32) (size!1786 (buf!2176 b!169))))))

(assert (= (and d!27030 res!69025) b!84042))

(assert (= (and b!84042 res!69024) b!84043))

(declare-fun m!130741 () Bool)

(assert (=> d!27030 m!130741))

(declare-fun m!130743 () Bool)

(assert (=> d!27030 m!130743))

(assert (=> start!17364 d!27030))

(declare-fun d!27036 () Bool)

(assert (=> d!27036 (= (inv!12 b!169) (invariant!0 (currentBit!4317 b!169) (currentByte!4322 b!169) (size!1786 (buf!2176 b!169))))))

(declare-fun bs!6677 () Bool)

(assert (= bs!6677 d!27036))

(assert (=> bs!6677 m!130743))

(assert (=> start!17364 d!27036))

(push 1)

(assert (not d!27036))

(assert (not d!27030))

(check-sat)

(pop 1)

(push 1)

(check-sat)


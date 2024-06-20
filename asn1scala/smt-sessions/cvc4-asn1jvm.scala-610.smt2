; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17388 () Bool)

(assert start!17388)

(declare-datatypes ((array!3946 0))(
  ( (array!3947 (arr!2426 (Array (_ BitVec 32) (_ BitVec 8))) (size!1789 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3140 0))(
  ( (BitStream!3141 (buf!2179 array!3946) (currentByte!4328 (_ BitVec 32)) (currentBit!4323 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3140)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> start!17388 (not (= (remainingBits!0 ((_ sign_extend 32) (size!1789 (buf!2179 b!169))) ((_ sign_extend 32) (currentByte!4328 b!169)) ((_ sign_extend 32) (currentBit!4323 b!169))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1789 (buf!2179 b!169)))) (bitIndex!0 (size!1789 (buf!2179 b!169)) (currentByte!4328 b!169) (currentBit!4323 b!169)))))))

(declare-fun e!56156 () Bool)

(declare-fun inv!12 (BitStream!3140) Bool)

(assert (=> start!17388 (and (inv!12 b!169) e!56156)))

(declare-fun b!84058 () Bool)

(declare-fun array_inv!1635 (array!3946) Bool)

(assert (=> b!84058 (= e!56156 (array_inv!1635 (buf!2179 b!169)))))

(assert (= start!17388 b!84058))

(declare-fun m!130765 () Bool)

(assert (=> start!17388 m!130765))

(declare-fun m!130767 () Bool)

(assert (=> start!17388 m!130767))

(declare-fun m!130769 () Bool)

(assert (=> start!17388 m!130769))

(declare-fun m!130771 () Bool)

(assert (=> b!84058 m!130771))

(push 1)

(assert (not start!17388))

(assert (not b!84058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27042 () Bool)

(assert (=> d!27042 (= (remainingBits!0 ((_ sign_extend 32) (size!1789 (buf!2179 b!169))) ((_ sign_extend 32) (currentByte!4328 b!169)) ((_ sign_extend 32) (currentBit!4323 b!169))) (bvsub (bvmul ((_ sign_extend 32) (size!1789 (buf!2179 b!169))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4328 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4323 b!169)))))))

(assert (=> start!17388 d!27042))

(declare-fun d!27044 () Bool)

(declare-fun e!56160 () Bool)

(assert (=> d!27044 e!56160))

(declare-fun res!69037 () Bool)

(assert (=> d!27044 (=> (not res!69037) (not e!56160))))

(declare-fun lt!134124 () (_ BitVec 64))

(declare-fun lt!134119 () (_ BitVec 64))

(declare-fun lt!134122 () (_ BitVec 64))

(assert (=> d!27044 (= res!69037 (= lt!134124 (bvsub lt!134122 lt!134119)))))

(assert (=> d!27044 (or (= (bvand lt!134122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134119 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134122 lt!134119) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27044 (= lt!134119 (remainingBits!0 ((_ sign_extend 32) (size!1789 (buf!2179 b!169))) ((_ sign_extend 32) (currentByte!4328 b!169)) ((_ sign_extend 32) (currentBit!4323 b!169))))))

(declare-fun lt!134121 () (_ BitVec 64))

(declare-fun lt!134120 () (_ BitVec 64))

(assert (=> d!27044 (= lt!134122 (bvmul lt!134121 lt!134120))))

(assert (=> d!27044 (or (= lt!134121 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134120 (bvsdiv (bvmul lt!134121 lt!134120) lt!134121)))))

(assert (=> d!27044 (= lt!134120 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27044 (= lt!134121 ((_ sign_extend 32) (size!1789 (buf!2179 b!169))))))

(assert (=> d!27044 (= lt!134124 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4328 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4323 b!169))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!27044 (invariant!0 (currentBit!4323 b!169) (currentByte!4328 b!169) (size!1789 (buf!2179 b!169)))))

(assert (=> d!27044 (= (bitIndex!0 (size!1789 (buf!2179 b!169)) (currentByte!4328 b!169) (currentBit!4323 b!169)) lt!134124)))

(declare-fun b!84063 () Bool)

(declare-fun res!69036 () Bool)

(assert (=> b!84063 (=> (not res!69036) (not e!56160))))

(assert (=> b!84063 (= res!69036 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134124))))

(declare-fun b!84064 () Bool)

(declare-fun lt!134123 () (_ BitVec 64))

(assert (=> b!84064 (= e!56160 (bvsle lt!134124 (bvmul lt!134123 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84064 (or (= lt!134123 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134123 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134123)))))

(assert (=> b!84064 (= lt!134123 ((_ sign_extend 32) (size!1789 (buf!2179 b!169))))))

(assert (= (and d!27044 res!69037) b!84063))

(assert (= (and b!84063 res!69036) b!84064))

(assert (=> d!27044 m!130765))

(declare-fun m!130773 () Bool)

(assert (=> d!27044 m!130773))

(assert (=> start!17388 d!27044))

(declare-fun d!27054 () Bool)

(assert (=> d!27054 (= (inv!12 b!169) (invariant!0 (currentBit!4323 b!169) (currentByte!4328 b!169) (size!1789 (buf!2179 b!169))))))

(declare-fun bs!6682 () Bool)

(assert (= bs!6682 d!27054))

(assert (=> bs!6682 m!130773))

(assert (=> start!17388 d!27054))

(declare-fun d!27058 () Bool)

(assert (=> d!27058 (= (array_inv!1635 (buf!2179 b!169)) (bvsge (size!1789 (buf!2179 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84058 d!27058))

(push 1)

(assert (not d!27054))

(assert (not d!27044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


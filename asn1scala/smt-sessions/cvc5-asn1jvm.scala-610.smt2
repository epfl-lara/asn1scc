; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17384 () Bool)

(assert start!17384)

(declare-datatypes ((array!3942 0))(
  ( (array!3943 (arr!2424 (Array (_ BitVec 32) (_ BitVec 8))) (size!1787 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3136 0))(
  ( (BitStream!3137 (buf!2177 array!3942) (currentByte!4326 (_ BitVec 32)) (currentBit!4321 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3136)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> start!17384 (not (= (remainingBits!0 ((_ sign_extend 32) (size!1787 (buf!2177 b!169))) ((_ sign_extend 32) (currentByte!4326 b!169)) ((_ sign_extend 32) (currentBit!4321 b!169))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1787 (buf!2177 b!169)))) (bitIndex!0 (size!1787 (buf!2177 b!169)) (currentByte!4326 b!169) (currentBit!4321 b!169)))))))

(declare-fun e!56144 () Bool)

(declare-fun inv!12 (BitStream!3136) Bool)

(assert (=> start!17384 (and (inv!12 b!169) e!56144)))

(declare-fun b!84052 () Bool)

(declare-fun array_inv!1633 (array!3942) Bool)

(assert (=> b!84052 (= e!56144 (array_inv!1633 (buf!2177 b!169)))))

(assert (= start!17384 b!84052))

(declare-fun m!130749 () Bool)

(assert (=> start!17384 m!130749))

(declare-fun m!130751 () Bool)

(assert (=> start!17384 m!130751))

(declare-fun m!130753 () Bool)

(assert (=> start!17384 m!130753))

(declare-fun m!130755 () Bool)

(assert (=> b!84052 m!130755))

(push 1)

(assert (not start!17384))

(assert (not b!84052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27046 () Bool)

(assert (=> d!27046 (= (remainingBits!0 ((_ sign_extend 32) (size!1787 (buf!2177 b!169))) ((_ sign_extend 32) (currentByte!4326 b!169)) ((_ sign_extend 32) (currentBit!4321 b!169))) (bvsub (bvmul ((_ sign_extend 32) (size!1787 (buf!2177 b!169))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4326 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4321 b!169)))))))

(assert (=> start!17384 d!27046))

(declare-fun d!27048 () Bool)

(declare-fun e!56163 () Bool)

(assert (=> d!27048 e!56163))

(declare-fun res!69042 () Bool)

(assert (=> d!27048 (=> (not res!69042) (not e!56163))))

(declare-fun lt!134141 () (_ BitVec 64))

(declare-fun lt!134142 () (_ BitVec 64))

(declare-fun lt!134140 () (_ BitVec 64))

(assert (=> d!27048 (= res!69042 (= lt!134142 (bvsub lt!134141 lt!134140)))))

(assert (=> d!27048 (or (= (bvand lt!134141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134141 lt!134140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27048 (= lt!134140 (remainingBits!0 ((_ sign_extend 32) (size!1787 (buf!2177 b!169))) ((_ sign_extend 32) (currentByte!4326 b!169)) ((_ sign_extend 32) (currentBit!4321 b!169))))))

(declare-fun lt!134139 () (_ BitVec 64))

(declare-fun lt!134138 () (_ BitVec 64))

(assert (=> d!27048 (= lt!134141 (bvmul lt!134139 lt!134138))))

(assert (=> d!27048 (or (= lt!134139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134138 (bvsdiv (bvmul lt!134139 lt!134138) lt!134139)))))

(assert (=> d!27048 (= lt!134138 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27048 (= lt!134139 ((_ sign_extend 32) (size!1787 (buf!2177 b!169))))))

(assert (=> d!27048 (= lt!134142 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4326 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4321 b!169))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!27048 (invariant!0 (currentBit!4321 b!169) (currentByte!4326 b!169) (size!1787 (buf!2177 b!169)))))

(assert (=> d!27048 (= (bitIndex!0 (size!1787 (buf!2177 b!169)) (currentByte!4326 b!169) (currentBit!4321 b!169)) lt!134142)))

(declare-fun b!84069 () Bool)

(declare-fun res!69043 () Bool)

(assert (=> b!84069 (=> (not res!69043) (not e!56163))))

(assert (=> b!84069 (= res!69043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134142))))

(declare-fun b!84070 () Bool)

(declare-fun lt!134137 () (_ BitVec 64))

(assert (=> b!84070 (= e!56163 (bvsle lt!134142 (bvmul lt!134137 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84070 (or (= lt!134137 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134137 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134137)))))

(assert (=> b!84070 (= lt!134137 ((_ sign_extend 32) (size!1787 (buf!2177 b!169))))))

(assert (= (and d!27048 res!69042) b!84069))

(assert (= (and b!84069 res!69043) b!84070))

(assert (=> d!27048 m!130749))

(declare-fun m!130775 () Bool)

(assert (=> d!27048 m!130775))

(assert (=> start!17384 d!27048))

(declare-fun d!27060 () Bool)

(assert (=> d!27060 (= (inv!12 b!169) (invariant!0 (currentBit!4321 b!169) (currentByte!4326 b!169) (size!1787 (buf!2177 b!169))))))

(declare-fun bs!6683 () Bool)

(assert (= bs!6683 d!27060))

(assert (=> bs!6683 m!130775))

(assert (=> start!17384 d!27060))

(declare-fun d!27062 () Bool)

(assert (=> d!27062 (= (array_inv!1633 (buf!2177 b!169)) (bvsge (size!1787 (buf!2177 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84052 d!27062))

(push 1)

(assert (not d!27060))

(assert (not d!27048))

(check-sat)

(pop 1)

(push 1)

(check-sat)


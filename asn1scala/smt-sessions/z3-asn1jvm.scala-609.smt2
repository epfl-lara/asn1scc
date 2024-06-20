; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17362 () Bool)

(assert start!17362)

(declare-fun lt!134042 () (_ BitVec 64))

(declare-fun lt!134041 () (_ BitVec 64))

(assert (=> start!17362 (= lt!134042 (bvand lt!134041 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!134043 () (_ BitVec 64))

(declare-datatypes ((array!3935 0))(
  ( (array!3936 (arr!2422 (Array (_ BitVec 32) (_ BitVec 8))) (size!1785 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3132 0))(
  ( (BitStream!3133 (buf!2175 array!3935) (currentByte!4321 (_ BitVec 32)) (currentBit!4316 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3132)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> start!17362 (= lt!134043 (bitIndex!0 (size!1785 (buf!2175 b!169)) (currentByte!4321 b!169) (currentBit!4316 b!169)))))

(assert (=> start!17362 (= lt!134041 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1785 (buf!2175 b!169)))))))

(assert (=> start!17362 (and (not (= lt!134042 (bvand lt!134043 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!134042 (bvand (bvsub lt!134041 lt!134043) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!56124 () Bool)

(declare-fun inv!12 (BitStream!3132) Bool)

(assert (=> start!17362 (and (inv!12 b!169) e!56124)))

(declare-fun b!84028 () Bool)

(declare-fun array_inv!1631 (array!3935) Bool)

(assert (=> b!84028 (= e!56124 (array_inv!1631 (buf!2175 b!169)))))

(assert (= start!17362 b!84028))

(declare-fun m!130725 () Bool)

(assert (=> start!17362 m!130725))

(declare-fun m!130727 () Bool)

(assert (=> start!17362 m!130727))

(declare-fun m!130729 () Bool)

(assert (=> b!84028 m!130729))

(check-sat (not b!84028) (not start!17362))
(check-sat)
(get-model)

(declare-fun d!27024 () Bool)

(assert (=> d!27024 (= (array_inv!1631 (buf!2175 b!169)) (bvsge (size!1785 (buf!2175 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84028 d!27024))

(declare-fun d!27026 () Bool)

(declare-fun e!56139 () Bool)

(assert (=> d!27026 e!56139))

(declare-fun res!69031 () Bool)

(assert (=> d!27026 (=> (not res!69031) (not e!56139))))

(declare-fun lt!134103 () (_ BitVec 64))

(declare-fun lt!134104 () (_ BitVec 64))

(declare-fun lt!134105 () (_ BitVec 64))

(assert (=> d!27026 (= res!69031 (= lt!134103 (bvsub lt!134105 lt!134104)))))

(assert (=> d!27026 (or (= (bvand lt!134105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134104 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134105 lt!134104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27026 (= lt!134104 (remainingBits!0 ((_ sign_extend 32) (size!1785 (buf!2175 b!169))) ((_ sign_extend 32) (currentByte!4321 b!169)) ((_ sign_extend 32) (currentBit!4316 b!169))))))

(declare-fun lt!134101 () (_ BitVec 64))

(declare-fun lt!134102 () (_ BitVec 64))

(assert (=> d!27026 (= lt!134105 (bvmul lt!134101 lt!134102))))

(assert (=> d!27026 (or (= lt!134101 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134102 (bvsdiv (bvmul lt!134101 lt!134102) lt!134101)))))

(assert (=> d!27026 (= lt!134102 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27026 (= lt!134101 ((_ sign_extend 32) (size!1785 (buf!2175 b!169))))))

(assert (=> d!27026 (= lt!134103 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4321 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4316 b!169))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!27026 (invariant!0 (currentBit!4316 b!169) (currentByte!4321 b!169) (size!1785 (buf!2175 b!169)))))

(assert (=> d!27026 (= (bitIndex!0 (size!1785 (buf!2175 b!169)) (currentByte!4321 b!169) (currentBit!4316 b!169)) lt!134103)))

(declare-fun b!84048 () Bool)

(declare-fun res!69030 () Bool)

(assert (=> b!84048 (=> (not res!69030) (not e!56139))))

(assert (=> b!84048 (= res!69030 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134103))))

(declare-fun b!84049 () Bool)

(declare-fun lt!134106 () (_ BitVec 64))

(assert (=> b!84049 (= e!56139 (bvsle lt!134103 (bvmul lt!134106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84049 (or (= lt!134106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134106)))))

(assert (=> b!84049 (= lt!134106 ((_ sign_extend 32) (size!1785 (buf!2175 b!169))))))

(assert (= (and d!27026 res!69031) b!84048))

(assert (= (and b!84048 res!69030) b!84049))

(declare-fun m!130745 () Bool)

(assert (=> d!27026 m!130745))

(declare-fun m!130747 () Bool)

(assert (=> d!27026 m!130747))

(assert (=> start!17362 d!27026))

(declare-fun d!27038 () Bool)

(assert (=> d!27038 (= (inv!12 b!169) (invariant!0 (currentBit!4316 b!169) (currentByte!4321 b!169) (size!1785 (buf!2175 b!169))))))

(declare-fun bs!6678 () Bool)

(assert (= bs!6678 d!27038))

(assert (=> bs!6678 m!130747))

(assert (=> start!17362 d!27038))

(check-sat (not d!27038) (not d!27026))

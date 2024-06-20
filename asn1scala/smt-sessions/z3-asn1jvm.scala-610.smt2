; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17386 () Bool)

(assert start!17386)

(declare-datatypes ((array!3944 0))(
  ( (array!3945 (arr!2425 (Array (_ BitVec 32) (_ BitVec 8))) (size!1788 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3138 0))(
  ( (BitStream!3139 (buf!2178 array!3944) (currentByte!4327 (_ BitVec 32)) (currentBit!4322 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3138)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> start!17386 (not (= (remainingBits!0 ((_ sign_extend 32) (size!1788 (buf!2178 b!169))) ((_ sign_extend 32) (currentByte!4327 b!169)) ((_ sign_extend 32) (currentBit!4322 b!169))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1788 (buf!2178 b!169)))) (bitIndex!0 (size!1788 (buf!2178 b!169)) (currentByte!4327 b!169) (currentBit!4322 b!169)))))))

(declare-fun e!56150 () Bool)

(declare-fun inv!12 (BitStream!3138) Bool)

(assert (=> start!17386 (and (inv!12 b!169) e!56150)))

(declare-fun b!84055 () Bool)

(declare-fun array_inv!1634 (array!3944) Bool)

(assert (=> b!84055 (= e!56150 (array_inv!1634 (buf!2178 b!169)))))

(assert (= start!17386 b!84055))

(declare-fun m!130757 () Bool)

(assert (=> start!17386 m!130757))

(declare-fun m!130759 () Bool)

(assert (=> start!17386 m!130759))

(declare-fun m!130761 () Bool)

(assert (=> start!17386 m!130761))

(declare-fun m!130763 () Bool)

(assert (=> b!84055 m!130763))

(check-sat (not b!84055) (not start!17386))
(check-sat)
(get-model)

(declare-fun d!27050 () Bool)

(assert (=> d!27050 (= (array_inv!1634 (buf!2178 b!169)) (bvsge (size!1788 (buf!2178 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84055 d!27050))

(declare-fun d!27052 () Bool)

(assert (=> d!27052 (= (remainingBits!0 ((_ sign_extend 32) (size!1788 (buf!2178 b!169))) ((_ sign_extend 32) (currentByte!4327 b!169)) ((_ sign_extend 32) (currentBit!4322 b!169))) (bvsub (bvmul ((_ sign_extend 32) (size!1788 (buf!2178 b!169))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4327 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4322 b!169)))))))

(assert (=> start!17386 d!27052))

(declare-fun d!27056 () Bool)

(declare-fun e!56166 () Bool)

(assert (=> d!27056 e!56166))

(declare-fun res!69049 () Bool)

(assert (=> d!27056 (=> (not res!69049) (not e!56166))))

(declare-fun lt!134157 () (_ BitVec 64))

(declare-fun lt!134158 () (_ BitVec 64))

(declare-fun lt!134155 () (_ BitVec 64))

(assert (=> d!27056 (= res!69049 (= lt!134157 (bvsub lt!134155 lt!134158)))))

(assert (=> d!27056 (or (= (bvand lt!134155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134158 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134155 lt!134158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27056 (= lt!134158 (remainingBits!0 ((_ sign_extend 32) (size!1788 (buf!2178 b!169))) ((_ sign_extend 32) (currentByte!4327 b!169)) ((_ sign_extend 32) (currentBit!4322 b!169))))))

(declare-fun lt!134160 () (_ BitVec 64))

(declare-fun lt!134159 () (_ BitVec 64))

(assert (=> d!27056 (= lt!134155 (bvmul lt!134160 lt!134159))))

(assert (=> d!27056 (or (= lt!134160 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134159 (bvsdiv (bvmul lt!134160 lt!134159) lt!134160)))))

(assert (=> d!27056 (= lt!134159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27056 (= lt!134160 ((_ sign_extend 32) (size!1788 (buf!2178 b!169))))))

(assert (=> d!27056 (= lt!134157 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4327 b!169)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4322 b!169))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!27056 (invariant!0 (currentBit!4322 b!169) (currentByte!4327 b!169) (size!1788 (buf!2178 b!169)))))

(assert (=> d!27056 (= (bitIndex!0 (size!1788 (buf!2178 b!169)) (currentByte!4327 b!169) (currentBit!4322 b!169)) lt!134157)))

(declare-fun b!84075 () Bool)

(declare-fun res!69048 () Bool)

(assert (=> b!84075 (=> (not res!69048) (not e!56166))))

(assert (=> b!84075 (= res!69048 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134157))))

(declare-fun b!84076 () Bool)

(declare-fun lt!134156 () (_ BitVec 64))

(assert (=> b!84076 (= e!56166 (bvsle lt!134157 (bvmul lt!134156 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84076 (or (= lt!134156 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134156 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134156)))))

(assert (=> b!84076 (= lt!134156 ((_ sign_extend 32) (size!1788 (buf!2178 b!169))))))

(assert (= (and d!27056 res!69049) b!84075))

(assert (= (and b!84075 res!69048) b!84076))

(assert (=> d!27056 m!130757))

(declare-fun m!130777 () Bool)

(assert (=> d!27056 m!130777))

(assert (=> start!17386 d!27056))

(declare-fun d!27064 () Bool)

(assert (=> d!27064 (= (inv!12 b!169) (invariant!0 (currentBit!4322 b!169) (currentByte!4327 b!169) (size!1788 (buf!2178 b!169))))))

(declare-fun bs!6684 () Bool)

(assert (= bs!6684 d!27064))

(assert (=> bs!6684 m!130777))

(assert (=> start!17386 d!27064))

(check-sat (not d!27064) (not d!27056))
(check-sat)

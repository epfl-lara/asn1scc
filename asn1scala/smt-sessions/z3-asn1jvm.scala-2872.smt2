; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68768 () Bool)

(assert start!68768)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18897 0))(
  ( (array!18898 (arr!9284 (Array (_ BitVec 32) (_ BitVec 8))) (size!8201 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13512 0))(
  ( (BitStream!13513 (buf!7817 array!18897) (currentByte!14380 (_ BitVec 32)) (currentBit!14375 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13512)

(assert (=> start!68768 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!8201 (buf!7817 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14380 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14375 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8201 (buf!7817 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14380 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14375 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!68768 true))

(declare-fun e!223111 () Bool)

(declare-fun inv!12 (BitStream!13512) Bool)

(assert (=> start!68768 (and (inv!12 bitStream!19) e!223111)))

(declare-fun b!310575 () Bool)

(declare-fun array_inv!7756 (array!18897) Bool)

(assert (=> b!310575 (= e!223111 (array_inv!7756 (buf!7817 bitStream!19)))))

(assert (= start!68768 b!310575))

(declare-fun m!448363 () Bool)

(assert (=> start!68768 m!448363))

(declare-fun m!448365 () Bool)

(assert (=> b!310575 m!448365))

(check-sat (not start!68768) (not b!310575))
(check-sat)
(get-model)

(declare-fun d!102778 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102778 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14375 bitStream!19) (currentByte!14380 bitStream!19) (size!8201 (buf!7817 bitStream!19))))))

(declare-fun bs!26594 () Bool)

(assert (= bs!26594 d!102778))

(declare-fun m!448371 () Bool)

(assert (=> bs!26594 m!448371))

(assert (=> start!68768 d!102778))

(declare-fun d!102780 () Bool)

(assert (=> d!102780 (= (array_inv!7756 (buf!7817 bitStream!19)) (bvsge (size!8201 (buf!7817 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310575 d!102780))

(check-sat (not d!102778))
(check-sat)
(get-model)

(declare-fun d!102786 () Bool)

(assert (=> d!102786 (= (invariant!0 (currentBit!14375 bitStream!19) (currentByte!14380 bitStream!19) (size!8201 (buf!7817 bitStream!19))) (and (bvsge (currentBit!14375 bitStream!19) #b00000000000000000000000000000000) (bvslt (currentBit!14375 bitStream!19) #b00000000000000000000000000001000) (bvsge (currentByte!14380 bitStream!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!14380 bitStream!19) (size!8201 (buf!7817 bitStream!19))) (and (= (currentBit!14375 bitStream!19) #b00000000000000000000000000000000) (= (currentByte!14380 bitStream!19) (size!8201 (buf!7817 bitStream!19)))))))))

(assert (=> d!102778 d!102786))

(check-sat)

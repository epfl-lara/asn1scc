; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68790 () Bool)

(assert start!68790)

(declare-fun res!254626 () Bool)

(declare-fun e!223134 () Bool)

(assert (=> start!68790 (=> (not res!254626) (not e!223134))))

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18906 0))(
  ( (array!18907 (arr!9287 (Array (_ BitVec 32) (_ BitVec 8))) (size!8204 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13518 0))(
  ( (BitStream!13519 (buf!7820 array!18906) (currentByte!14385 (_ BitVec 32)) (currentBit!14380 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13518)

(assert (=> start!68790 (= res!254626 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!8204 (buf!7820 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14385 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14380 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8204 (buf!7820 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14385 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14380 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!68790 e!223134))

(assert (=> start!68790 true))

(declare-fun e!223135 () Bool)

(declare-fun inv!12 (BitStream!13518) Bool)

(assert (=> start!68790 (and (inv!12 bitStream!19) e!223135)))

(declare-fun b!310589 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310589 (= e!223134 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14380 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14385 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (size!8204 (buf!7820 bitStream!19)))))))))

(declare-fun b!310590 () Bool)

(declare-fun array_inv!7759 (array!18906) Bool)

(assert (=> b!310590 (= e!223135 (array_inv!7759 (buf!7820 bitStream!19)))))

(assert (= (and start!68790 res!254626) b!310589))

(assert (= start!68790 b!310590))

(declare-fun m!448383 () Bool)

(assert (=> start!68790 m!448383))

(declare-fun m!448385 () Bool)

(assert (=> b!310589 m!448385))

(declare-fun m!448387 () Bool)

(assert (=> b!310590 m!448387))

(check-sat (not b!310589) (not b!310590) (not start!68790))
(check-sat)
(get-model)

(declare-fun d!102796 () Bool)

(assert (=> d!102796 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14380 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14385 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (size!8204 (buf!7820 bitStream!19))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14380 bitStream!19))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14380 bitStream!19))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14385 bitStream!19))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14385 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (size!8204 (buf!7820 bitStream!19))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14380 bitStream!19))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14385 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (size!8204 (buf!7820 bitStream!19)))))))))))

(assert (=> b!310589 d!102796))

(declare-fun d!102798 () Bool)

(assert (=> d!102798 (= (array_inv!7759 (buf!7820 bitStream!19)) (bvsge (size!8204 (buf!7820 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310590 d!102798))

(declare-fun d!102800 () Bool)

(assert (=> d!102800 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14380 bitStream!19) (currentByte!14385 bitStream!19) (size!8204 (buf!7820 bitStream!19))))))

(declare-fun bs!26600 () Bool)

(assert (= bs!26600 d!102800))

(declare-fun m!448395 () Bool)

(assert (=> bs!26600 m!448395))

(assert (=> start!68790 d!102800))

(check-sat (not d!102800))
(check-sat)

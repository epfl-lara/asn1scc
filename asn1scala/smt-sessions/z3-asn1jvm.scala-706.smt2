; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19878 () Bool)

(assert start!19878)

(declare-fun res!81257 () Bool)

(declare-fun e!64816 () Bool)

(assert (=> start!19878 (=> (not res!81257) (not e!64816))))

(declare-datatypes ((array!4643 0))(
  ( (array!4644 (arr!2713 (Array (_ BitVec 32) (_ BitVec 8))) (size!2120 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3714 0))(
  ( (BitStream!3715 (buf!2477 array!4643) (currentByte!4914 (_ BitVec 32)) (currentBit!4909 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3714)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!19878 (= res!81257 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2120 (buf!2477 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4914 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4909 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2120 (buf!2477 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4914 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4909 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19878 e!64816))

(assert (=> start!19878 true))

(declare-fun e!64817 () Bool)

(declare-fun inv!12 (BitStream!3714) Bool)

(assert (=> start!19878 (and (inv!12 thiss!1305) e!64817)))

(declare-fun b!99073 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99073 (= e!64816 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4909 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4914 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2120 (buf!2477 thiss!1305)))))))))

(declare-fun b!99074 () Bool)

(declare-fun array_inv!1922 (array!4643) Bool)

(assert (=> b!99074 (= e!64817 (array_inv!1922 (buf!2477 thiss!1305)))))

(assert (= (and start!19878 res!81257) b!99073))

(assert (= start!19878 b!99074))

(declare-fun m!144511 () Bool)

(assert (=> start!19878 m!144511))

(declare-fun m!144513 () Bool)

(assert (=> b!99073 m!144513))

(declare-fun m!144515 () Bool)

(assert (=> b!99074 m!144515))

(check-sat (not b!99074) (not start!19878) (not b!99073))
(check-sat)
(get-model)

(declare-fun d!31266 () Bool)

(assert (=> d!31266 (= (array_inv!1922 (buf!2477 thiss!1305)) (bvsge (size!2120 (buf!2477 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!99074 d!31266))

(declare-fun d!31268 () Bool)

(assert (=> d!31268 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4909 thiss!1305) (currentByte!4914 thiss!1305) (size!2120 (buf!2477 thiss!1305))))))

(declare-fun bs!7654 () Bool)

(assert (= bs!7654 d!31268))

(declare-fun m!144523 () Bool)

(assert (=> bs!7654 m!144523))

(assert (=> start!19878 d!31268))

(declare-fun d!31270 () Bool)

(assert (=> d!31270 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4909 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4914 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2120 (buf!2477 thiss!1305))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4909 thiss!1305))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4909 thiss!1305))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4914 thiss!1305))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4914 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2120 (buf!2477 thiss!1305))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4909 thiss!1305))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4914 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2120 (buf!2477 thiss!1305)))))))))))

(assert (=> b!99073 d!31270))

(check-sat (not d!31268))
(check-sat)

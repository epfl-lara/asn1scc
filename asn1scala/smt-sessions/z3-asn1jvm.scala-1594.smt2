; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45320 () Bool)

(assert start!45320)

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((array!10684 0))(
  ( (array!10685 (arr!5624 (Array (_ BitVec 32) (_ BitVec 8))) (size!4694 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8496 0))(
  ( (BitStream!8497 (buf!5241 array!10684) (currentByte!9840 (_ BitVec 32)) (currentBit!9835 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8496)

(assert (=> start!45320 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4694 (buf!5241 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9840 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9835 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4694 (buf!5241 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9840 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9835 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45320 true))

(declare-fun e!149363 () Bool)

(declare-fun inv!12 (BitStream!8496) Bool)

(assert (=> start!45320 (and (inv!12 bs!62) e!149363)))

(declare-fun b!219981 () Bool)

(declare-fun array_inv!4435 (array!10684) Bool)

(assert (=> b!219981 (= e!149363 (array_inv!4435 (buf!5241 bs!62)))))

(assert (= start!45320 b!219981))

(declare-fun m!338719 () Bool)

(assert (=> start!45320 m!338719))

(declare-fun m!338721 () Bool)

(assert (=> b!219981 m!338721))

(check-sat (not b!219981) (not start!45320))
(check-sat)
(get-model)

(declare-fun d!74025 () Bool)

(assert (=> d!74025 (= (array_inv!4435 (buf!5241 bs!62)) (bvsge (size!4694 (buf!5241 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!219981 d!74025))

(declare-fun d!74027 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74027 (= (inv!12 bs!62) (invariant!0 (currentBit!9835 bs!62) (currentByte!9840 bs!62) (size!4694 (buf!5241 bs!62))))))

(declare-fun bs!18087 () Bool)

(assert (= bs!18087 d!74027))

(declare-fun m!338727 () Bool)

(assert (=> bs!18087 m!338727))

(assert (=> start!45320 d!74027))

(check-sat (not d!74027))
(check-sat)
(get-model)

(declare-fun d!74029 () Bool)

(assert (=> d!74029 (= (invariant!0 (currentBit!9835 bs!62) (currentByte!9840 bs!62) (size!4694 (buf!5241 bs!62))) (and (bvsge (currentBit!9835 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9835 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9840 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9840 bs!62) (size!4694 (buf!5241 bs!62))) (and (= (currentBit!9835 bs!62) #b00000000000000000000000000000000) (= (currentByte!9840 bs!62) (size!4694 (buf!5241 bs!62)))))))))

(assert (=> d!74027 d!74029))

(check-sat)

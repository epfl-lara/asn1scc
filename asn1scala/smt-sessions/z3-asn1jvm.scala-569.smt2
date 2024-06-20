; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16276 () Bool)

(assert start!16276)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3621 0))(
  ( (array!3622 (arr!2302 (Array (_ BitVec 32) (_ BitVec 8))) (size!1665 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2892 0))(
  ( (BitStream!2893 (buf!2055 array!3621) (currentByte!3986 (_ BitVec 32)) (currentBit!3981 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2892)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2892)

(assert (=> start!16276 (and (= (size!1665 (buf!2055 b1!98)) (size!1665 (buf!2055 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (bvsle ((_ sign_extend 32) (size!1665 (buf!2055 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3986 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3981 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1665 (buf!2055 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3986 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3981 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!53757 () Bool)

(declare-fun inv!12 (BitStream!2892) Bool)

(assert (=> start!16276 (and (inv!12 b1!98) e!53757)))

(declare-fun e!53759 () Bool)

(assert (=> start!16276 (and (inv!12 b2!98) e!53759)))

(assert (=> start!16276 true))

(declare-fun b!81752 () Bool)

(declare-fun array_inv!1511 (array!3621) Bool)

(assert (=> b!81752 (= e!53757 (array_inv!1511 (buf!2055 b1!98)))))

(declare-fun b!81753 () Bool)

(assert (=> b!81753 (= e!53759 (array_inv!1511 (buf!2055 b2!98)))))

(assert (= start!16276 b!81752))

(assert (= start!16276 b!81753))

(declare-fun m!128117 () Bool)

(assert (=> start!16276 m!128117))

(declare-fun m!128119 () Bool)

(assert (=> start!16276 m!128119))

(declare-fun m!128121 () Bool)

(assert (=> b!81752 m!128121))

(declare-fun m!128123 () Bool)

(assert (=> b!81753 m!128123))

(check-sat (not b!81752) (not b!81753) (not start!16276))
(check-sat)
(get-model)

(declare-fun d!25566 () Bool)

(assert (=> d!25566 (= (array_inv!1511 (buf!2055 b1!98)) (bvsge (size!1665 (buf!2055 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81752 d!25566))

(declare-fun d!25568 () Bool)

(assert (=> d!25568 (= (array_inv!1511 (buf!2055 b2!98)) (bvsge (size!1665 (buf!2055 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81753 d!25568))

(declare-fun d!25570 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25570 (= (inv!12 b1!98) (invariant!0 (currentBit!3981 b1!98) (currentByte!3986 b1!98) (size!1665 (buf!2055 b1!98))))))

(declare-fun bs!6255 () Bool)

(assert (= bs!6255 d!25570))

(declare-fun m!128133 () Bool)

(assert (=> bs!6255 m!128133))

(assert (=> start!16276 d!25570))

(declare-fun d!25572 () Bool)

(assert (=> d!25572 (= (inv!12 b2!98) (invariant!0 (currentBit!3981 b2!98) (currentByte!3986 b2!98) (size!1665 (buf!2055 b2!98))))))

(declare-fun bs!6256 () Bool)

(assert (= bs!6256 d!25572))

(declare-fun m!128135 () Bool)

(assert (=> bs!6256 m!128135))

(assert (=> start!16276 d!25572))

(check-sat (not d!25570) (not d!25572))
(check-sat)
(get-model)

(declare-fun d!25574 () Bool)

(assert (=> d!25574 (= (invariant!0 (currentBit!3981 b1!98) (currentByte!3986 b1!98) (size!1665 (buf!2055 b1!98))) (and (bvsge (currentBit!3981 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!3981 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!3986 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!3986 b1!98) (size!1665 (buf!2055 b1!98))) (and (= (currentBit!3981 b1!98) #b00000000000000000000000000000000) (= (currentByte!3986 b1!98) (size!1665 (buf!2055 b1!98)))))))))

(assert (=> d!25570 d!25574))

(declare-fun d!25576 () Bool)

(assert (=> d!25576 (= (invariant!0 (currentBit!3981 b2!98) (currentByte!3986 b2!98) (size!1665 (buf!2055 b2!98))) (and (bvsge (currentBit!3981 b2!98) #b00000000000000000000000000000000) (bvslt (currentBit!3981 b2!98) #b00000000000000000000000000001000) (bvsge (currentByte!3986 b2!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!3986 b2!98) (size!1665 (buf!2055 b2!98))) (and (= (currentBit!3981 b2!98) #b00000000000000000000000000000000) (= (currentByte!3986 b2!98) (size!1665 (buf!2055 b2!98)))))))))

(assert (=> d!25572 d!25576))

(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16292 () Bool)

(assert start!16292)

(declare-fun res!67471 () Bool)

(declare-fun e!53798 () Bool)

(assert (=> start!16292 (=> (not res!67471) (not e!53798))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-datatypes ((array!3629 0))(
  ( (array!3630 (arr!2305 (Array (_ BitVec 32) (_ BitVec 8))) (size!1668 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2898 0))(
  ( (BitStream!2899 (buf!2058 array!3629) (currentByte!3990 (_ BitVec 32)) (currentBit!3985 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2898)

(declare-fun b2!98 () BitStream!2898)

(assert (=> start!16292 (= res!67471 (and (= (size!1668 (buf!2058 b1!98)) (size!1668 (buf!2058 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (bvsle ((_ sign_extend 32) (size!1668 (buf!2058 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3990 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3985 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1668 (buf!2058 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3990 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3985 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!16292 e!53798))

(declare-fun e!53800 () Bool)

(declare-fun inv!12 (BitStream!2898) Bool)

(assert (=> start!16292 (and (inv!12 b1!98) e!53800)))

(declare-fun e!53801 () Bool)

(assert (=> start!16292 (and (inv!12 b2!98) e!53801)))

(assert (=> start!16292 true))

(declare-fun b!81775 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81775 (= e!53798 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3985 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3990 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1668 (buf!2058 b1!98)))))))))

(declare-fun b!81776 () Bool)

(declare-fun array_inv!1514 (array!3629) Bool)

(assert (=> b!81776 (= e!53800 (array_inv!1514 (buf!2058 b1!98)))))

(declare-fun b!81777 () Bool)

(assert (=> b!81777 (= e!53801 (array_inv!1514 (buf!2058 b2!98)))))

(assert (= (and start!16292 res!67471) b!81775))

(assert (= start!16292 b!81776))

(assert (= start!16292 b!81777))

(declare-fun m!128147 () Bool)

(assert (=> start!16292 m!128147))

(declare-fun m!128149 () Bool)

(assert (=> start!16292 m!128149))

(declare-fun m!128151 () Bool)

(assert (=> b!81775 m!128151))

(declare-fun m!128153 () Bool)

(assert (=> b!81776 m!128153))

(declare-fun m!128155 () Bool)

(assert (=> b!81777 m!128155))

(check-sat (not start!16292) (not b!81777) (not b!81775) (not b!81776))
(check-sat)
(get-model)

(declare-fun d!25586 () Bool)

(assert (=> d!25586 (= (inv!12 b1!98) (invariant!0 (currentBit!3985 b1!98) (currentByte!3990 b1!98) (size!1668 (buf!2058 b1!98))))))

(declare-fun bs!6260 () Bool)

(assert (= bs!6260 d!25586))

(declare-fun m!128167 () Bool)

(assert (=> bs!6260 m!128167))

(assert (=> start!16292 d!25586))

(declare-fun d!25590 () Bool)

(assert (=> d!25590 (= (inv!12 b2!98) (invariant!0 (currentBit!3985 b2!98) (currentByte!3990 b2!98) (size!1668 (buf!2058 b2!98))))))

(declare-fun bs!6261 () Bool)

(assert (= bs!6261 d!25590))

(declare-fun m!128169 () Bool)

(assert (=> bs!6261 m!128169))

(assert (=> start!16292 d!25590))

(declare-fun d!25592 () Bool)

(assert (=> d!25592 (= (array_inv!1514 (buf!2058 b2!98)) (bvsge (size!1668 (buf!2058 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81777 d!25592))

(declare-fun d!25594 () Bool)

(assert (=> d!25594 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3985 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3990 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1668 (buf!2058 b1!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3985 b1!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3985 b1!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3990 b1!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3990 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1668 (buf!2058 b1!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3985 b1!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3990 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1668 (buf!2058 b1!98)))))))))))

(assert (=> b!81775 d!25594))

(declare-fun d!25604 () Bool)

(assert (=> d!25604 (= (array_inv!1514 (buf!2058 b1!98)) (bvsge (size!1668 (buf!2058 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81776 d!25604))

(check-sat (not d!25590) (not d!25586))
(check-sat)

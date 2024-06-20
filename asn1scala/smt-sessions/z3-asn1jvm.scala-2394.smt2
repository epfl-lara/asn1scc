; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61044 () Bool)

(assert start!61044)

(declare-datatypes ((array!15670 0))(
  ( (array!15671 (arr!7775 (Array (_ BitVec 32) (_ BitVec 8))) (size!6788 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12390 0))(
  ( (BitStream!12391 (buf!7256 array!15670) (currentByte!13414 (_ BitVec 32)) (currentBit!13409 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12390)

(declare-fun bs2!19 () BitStream!12390)

(assert (=> start!61044 (and (= (size!6788 (buf!7256 bs1!11)) (size!6788 (buf!7256 bs2!19))) (bvsle ((_ sign_extend 32) (size!6788 (buf!7256 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13414 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13409 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6788 (buf!7256 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13414 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13409 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!195046 () Bool)

(declare-fun inv!12 (BitStream!12390) Bool)

(assert (=> start!61044 (and (inv!12 bs1!11) e!195046)))

(declare-fun e!195048 () Bool)

(assert (=> start!61044 (and (inv!12 bs2!19) e!195048)))

(declare-fun b!275120 () Bool)

(declare-fun array_inv!6512 (array!15670) Bool)

(assert (=> b!275120 (= e!195046 (array_inv!6512 (buf!7256 bs1!11)))))

(declare-fun b!275121 () Bool)

(assert (=> b!275121 (= e!195048 (array_inv!6512 (buf!7256 bs2!19)))))

(assert (= start!61044 b!275120))

(assert (= start!61044 b!275121))

(declare-fun m!407677 () Bool)

(assert (=> start!61044 m!407677))

(declare-fun m!407679 () Bool)

(assert (=> start!61044 m!407679))

(declare-fun m!407681 () Bool)

(assert (=> b!275120 m!407681))

(declare-fun m!407683 () Bool)

(assert (=> b!275121 m!407683))

(check-sat (not start!61044) (not b!275121) (not b!275120))
(check-sat)
(get-model)

(declare-fun d!94568 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94568 (= (inv!12 bs1!11) (invariant!0 (currentBit!13409 bs1!11) (currentByte!13414 bs1!11) (size!6788 (buf!7256 bs1!11))))))

(declare-fun bs!23818 () Bool)

(assert (= bs!23818 d!94568))

(declare-fun m!407693 () Bool)

(assert (=> bs!23818 m!407693))

(assert (=> start!61044 d!94568))

(declare-fun d!94570 () Bool)

(assert (=> d!94570 (= (inv!12 bs2!19) (invariant!0 (currentBit!13409 bs2!19) (currentByte!13414 bs2!19) (size!6788 (buf!7256 bs2!19))))))

(declare-fun bs!23819 () Bool)

(assert (= bs!23819 d!94570))

(declare-fun m!407695 () Bool)

(assert (=> bs!23819 m!407695))

(assert (=> start!61044 d!94570))

(declare-fun d!94572 () Bool)

(assert (=> d!94572 (= (array_inv!6512 (buf!7256 bs2!19)) (bvsge (size!6788 (buf!7256 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275121 d!94572))

(declare-fun d!94576 () Bool)

(assert (=> d!94576 (= (array_inv!6512 (buf!7256 bs1!11)) (bvsge (size!6788 (buf!7256 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275120 d!94576))

(check-sat (not d!94568) (not d!94570))
(check-sat)
(get-model)

(declare-fun d!94592 () Bool)

(assert (=> d!94592 (= (invariant!0 (currentBit!13409 bs1!11) (currentByte!13414 bs1!11) (size!6788 (buf!7256 bs1!11))) (and (bvsge (currentBit!13409 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13409 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13414 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13414 bs1!11) (size!6788 (buf!7256 bs1!11))) (and (= (currentBit!13409 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13414 bs1!11) (size!6788 (buf!7256 bs1!11)))))))))

(assert (=> d!94568 d!94592))

(declare-fun d!94594 () Bool)

(assert (=> d!94594 (= (invariant!0 (currentBit!13409 bs2!19) (currentByte!13414 bs2!19) (size!6788 (buf!7256 bs2!19))) (and (bvsge (currentBit!13409 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13409 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13414 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13414 bs2!19) (size!6788 (buf!7256 bs2!19))) (and (= (currentBit!13409 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13414 bs2!19) (size!6788 (buf!7256 bs2!19)))))))))

(assert (=> d!94570 d!94594))

(check-sat)

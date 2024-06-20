; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61042 () Bool)

(assert start!61042)

(declare-datatypes ((array!15668 0))(
  ( (array!15669 (arr!7774 (Array (_ BitVec 32) (_ BitVec 8))) (size!6787 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12388 0))(
  ( (BitStream!12389 (buf!7255 array!15668) (currentByte!13413 (_ BitVec 32)) (currentBit!13408 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12388)

(declare-fun bs2!19 () BitStream!12388)

(assert (=> start!61042 (and (= (size!6787 (buf!7255 bs1!11)) (size!6787 (buf!7255 bs2!19))) (bvsle ((_ sign_extend 32) (size!6787 (buf!7255 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13413 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13408 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6787 (buf!7255 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13413 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13408 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!195034 () Bool)

(declare-fun inv!12 (BitStream!12388) Bool)

(assert (=> start!61042 (and (inv!12 bs1!11) e!195034)))

(declare-fun e!195036 () Bool)

(assert (=> start!61042 (and (inv!12 bs2!19) e!195036)))

(declare-fun b!275114 () Bool)

(declare-fun array_inv!6511 (array!15668) Bool)

(assert (=> b!275114 (= e!195034 (array_inv!6511 (buf!7255 bs1!11)))))

(declare-fun b!275115 () Bool)

(assert (=> b!275115 (= e!195036 (array_inv!6511 (buf!7255 bs2!19)))))

(assert (= start!61042 b!275114))

(assert (= start!61042 b!275115))

(declare-fun m!407669 () Bool)

(assert (=> start!61042 m!407669))

(declare-fun m!407671 () Bool)

(assert (=> start!61042 m!407671))

(declare-fun m!407673 () Bool)

(assert (=> b!275114 m!407673))

(declare-fun m!407675 () Bool)

(assert (=> b!275115 m!407675))

(push 1)

(assert (not b!275114))

(assert (not b!275115))

(assert (not start!61042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94574 () Bool)

(assert (=> d!94574 (= (array_inv!6511 (buf!7255 bs1!11)) (bvsge (size!6787 (buf!7255 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275114 d!94574))

(declare-fun d!94578 () Bool)

(assert (=> d!94578 (= (array_inv!6511 (buf!7255 bs2!19)) (bvsge (size!6787 (buf!7255 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275115 d!94578))

(declare-fun d!94580 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94580 (= (inv!12 bs1!11) (invariant!0 (currentBit!13408 bs1!11) (currentByte!13413 bs1!11) (size!6787 (buf!7255 bs1!11))))))

(declare-fun bs!23820 () Bool)

(assert (= bs!23820 d!94580))

(declare-fun m!407697 () Bool)

(assert (=> bs!23820 m!407697))

(assert (=> start!61042 d!94580))

(declare-fun d!94582 () Bool)

(assert (=> d!94582 (= (inv!12 bs2!19) (invariant!0 (currentBit!13408 bs2!19) (currentByte!13413 bs2!19) (size!6787 (buf!7255 bs2!19))))))

(declare-fun bs!23821 () Bool)

(assert (= bs!23821 d!94582))

(declare-fun m!407699 () Bool)

(assert (=> bs!23821 m!407699))

(assert (=> start!61042 d!94582))

(push 1)

(assert (not d!94580))

(assert (not d!94582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94596 () Bool)

(assert (=> d!94596 (= (invariant!0 (currentBit!13408 bs1!11) (currentByte!13413 bs1!11) (size!6787 (buf!7255 bs1!11))) (and (bvsge (currentBit!13408 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13408 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13413 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13413 bs1!11) (size!6787 (buf!7255 bs1!11))) (and (= (currentBit!13408 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13413 bs1!11) (size!6787 (buf!7255 bs1!11)))))))))

(assert (=> d!94580 d!94596))


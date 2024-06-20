; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61084 () Bool)

(assert start!61084)

(declare-fun b!275164 () Bool)

(declare-fun e!195117 () Bool)

(declare-datatypes ((array!15685 0))(
  ( (array!15686 (arr!7780 (Array (_ BitVec 32) (_ BitVec 8))) (size!6793 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12400 0))(
  ( (BitStream!12401 (buf!7261 array!15685) (currentByte!13423 (_ BitVec 32)) (currentBit!13418 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12400)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275164 (= e!195117 (not (invariant!0 (currentBit!13418 bs1!11) (currentByte!13423 bs1!11) (size!6793 (buf!7261 bs1!11)))))))

(declare-fun res!228817 () Bool)

(assert (=> start!61084 (=> (not res!228817) (not e!195117))))

(declare-fun bs2!19 () BitStream!12400)

(assert (=> start!61084 (= res!228817 (= (size!6793 (buf!7261 bs1!11)) (size!6793 (buf!7261 bs2!19))))))

(assert (=> start!61084 e!195117))

(declare-fun e!195120 () Bool)

(declare-fun inv!12 (BitStream!12400) Bool)

(assert (=> start!61084 (and (inv!12 bs1!11) e!195120)))

(declare-fun e!195119 () Bool)

(assert (=> start!61084 (and (inv!12 bs2!19) e!195119)))

(declare-fun b!275165 () Bool)

(declare-fun array_inv!6517 (array!15685) Bool)

(assert (=> b!275165 (= e!195120 (array_inv!6517 (buf!7261 bs1!11)))))

(declare-fun b!275163 () Bool)

(declare-fun res!228816 () Bool)

(assert (=> b!275163 (=> (not res!228816) (not e!195117))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275163 (= res!228816 (validate_offset_bit!0 ((_ sign_extend 32) (size!6793 (buf!7261 bs1!11))) ((_ sign_extend 32) (currentByte!13423 bs1!11)) ((_ sign_extend 32) (currentBit!13418 bs1!11))))))

(declare-fun b!275166 () Bool)

(assert (=> b!275166 (= e!195119 (array_inv!6517 (buf!7261 bs2!19)))))

(assert (= (and start!61084 res!228817) b!275163))

(assert (= (and b!275163 res!228816) b!275164))

(assert (= start!61084 b!275165))

(assert (= start!61084 b!275166))

(declare-fun m!407739 () Bool)

(assert (=> b!275164 m!407739))

(declare-fun m!407741 () Bool)

(assert (=> b!275166 m!407741))

(declare-fun m!407743 () Bool)

(assert (=> b!275163 m!407743))

(declare-fun m!407745 () Bool)

(assert (=> start!61084 m!407745))

(declare-fun m!407747 () Bool)

(assert (=> start!61084 m!407747))

(declare-fun m!407749 () Bool)

(assert (=> b!275165 m!407749))

(push 1)

(assert (not b!275166))

(assert (not start!61084))

(assert (not b!275164))

(assert (not b!275163))

(assert (not b!275165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94628 () Bool)

(assert (=> d!94628 (= (array_inv!6517 (buf!7261 bs2!19)) (bvsge (size!6793 (buf!7261 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275166 d!94628))

(declare-fun d!94630 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94630 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6793 (buf!7261 bs1!11))) ((_ sign_extend 32) (currentByte!13423 bs1!11)) ((_ sign_extend 32) (currentBit!13418 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6793 (buf!7261 bs1!11))) ((_ sign_extend 32) (currentByte!13423 bs1!11)) ((_ sign_extend 32) (currentBit!13418 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23833 () Bool)

(assert (= bs!23833 d!94630))

(declare-fun m!407777 () Bool)

(assert (=> bs!23833 m!407777))

(assert (=> b!275163 d!94630))

(declare-fun d!94638 () Bool)

(assert (=> d!94638 (= (invariant!0 (currentBit!13418 bs1!11) (currentByte!13423 bs1!11) (size!6793 (buf!7261 bs1!11))) (and (bvsge (currentBit!13418 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13418 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13423 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13423 bs1!11) (size!6793 (buf!7261 bs1!11))) (and (= (currentBit!13418 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13423 bs1!11) (size!6793 (buf!7261 bs1!11)))))))))

(assert (=> b!275164 d!94638))

(declare-fun d!94642 () Bool)

(assert (=> d!94642 (= (array_inv!6517 (buf!7261 bs1!11)) (bvsge (size!6793 (buf!7261 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275165 d!94642))

(declare-fun d!94644 () Bool)

(assert (=> d!94644 (= (inv!12 bs1!11) (invariant!0 (currentBit!13418 bs1!11) (currentByte!13423 bs1!11) (size!6793 (buf!7261 bs1!11))))))

(declare-fun bs!23836 () Bool)

(assert (= bs!23836 d!94644))

(assert (=> bs!23836 m!407739))

(assert (=> start!61084 d!94644))

(declare-fun d!94646 () Bool)

(assert (=> d!94646 (= (inv!12 bs2!19) (invariant!0 (currentBit!13418 bs2!19) (currentByte!13423 bs2!19) (size!6793 (buf!7261 bs2!19))))))

(declare-fun bs!23837 () Bool)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61046 () Bool)

(assert start!61046)

(declare-datatypes ((array!15672 0))(
  ( (array!15673 (arr!7776 (Array (_ BitVec 32) (_ BitVec 8))) (size!6789 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12392 0))(
  ( (BitStream!12393 (buf!7257 array!15672) (currentByte!13415 (_ BitVec 32)) (currentBit!13410 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12392)

(declare-fun bs2!19 () BitStream!12392)

(assert (=> start!61046 (and (= (size!6789 (buf!7257 bs1!11)) (size!6789 (buf!7257 bs2!19))) (bvsle ((_ sign_extend 32) (size!6789 (buf!7257 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13415 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13410 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6789 (buf!7257 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13415 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13410 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!195058 () Bool)

(declare-fun inv!12 (BitStream!12392) Bool)

(assert (=> start!61046 (and (inv!12 bs1!11) e!195058)))

(declare-fun e!195060 () Bool)

(assert (=> start!61046 (and (inv!12 bs2!19) e!195060)))

(declare-fun b!275126 () Bool)

(declare-fun array_inv!6513 (array!15672) Bool)

(assert (=> b!275126 (= e!195058 (array_inv!6513 (buf!7257 bs1!11)))))

(declare-fun b!275127 () Bool)

(assert (=> b!275127 (= e!195060 (array_inv!6513 (buf!7257 bs2!19)))))

(assert (= start!61046 b!275126))

(assert (= start!61046 b!275127))

(declare-fun m!407685 () Bool)

(assert (=> start!61046 m!407685))

(declare-fun m!407687 () Bool)

(assert (=> start!61046 m!407687))

(declare-fun m!407689 () Bool)

(assert (=> b!275126 m!407689))

(declare-fun m!407691 () Bool)

(assert (=> b!275127 m!407691))

(push 1)

(assert (not start!61046))

(assert (not b!275126))

(assert (not b!275127))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94584 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94584 (= (inv!12 bs1!11) (invariant!0 (currentBit!13410 bs1!11) (currentByte!13415 bs1!11) (size!6789 (buf!7257 bs1!11))))))

(declare-fun bs!23822 () Bool)

(assert (= bs!23822 d!94584))

(declare-fun m!407701 () Bool)

(assert (=> bs!23822 m!407701))

(assert (=> start!61046 d!94584))

(declare-fun d!94586 () Bool)

(assert (=> d!94586 (= (inv!12 bs2!19) (invariant!0 (currentBit!13410 bs2!19) (currentByte!13415 bs2!19) (size!6789 (buf!7257 bs2!19))))))

(declare-fun bs!23823 () Bool)

(assert (= bs!23823 d!94586))

(declare-fun m!407703 () Bool)

(assert (=> bs!23823 m!407703))

(assert (=> start!61046 d!94586))

(declare-fun d!94588 () Bool)

(assert (=> d!94588 (= (array_inv!6513 (buf!7257 bs1!11)) (bvsge (size!6789 (buf!7257 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275126 d!94588))

(declare-fun d!94590 () Bool)

(assert (=> d!94590 (= (array_inv!6513 (buf!7257 bs2!19)) (bvsge (size!6789 (buf!7257 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275127 d!94590))

(push 1)

(assert (not d!94586))

(assert (not d!94584))

(check-sat)

(pop 1)

(push 1)

(check-sat)


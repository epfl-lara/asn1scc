; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61086 () Bool)

(assert start!61086)

(declare-fun res!228822 () Bool)

(declare-fun e!195132 () Bool)

(assert (=> start!61086 (=> (not res!228822) (not e!195132))))

(declare-datatypes ((array!15687 0))(
  ( (array!15688 (arr!7781 (Array (_ BitVec 32) (_ BitVec 8))) (size!6794 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12402 0))(
  ( (BitStream!12403 (buf!7262 array!15687) (currentByte!13424 (_ BitVec 32)) (currentBit!13419 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12402)

(declare-fun bs2!19 () BitStream!12402)

(assert (=> start!61086 (= res!228822 (= (size!6794 (buf!7262 bs1!11)) (size!6794 (buf!7262 bs2!19))))))

(assert (=> start!61086 e!195132))

(declare-fun e!195135 () Bool)

(declare-fun inv!12 (BitStream!12402) Bool)

(assert (=> start!61086 (and (inv!12 bs1!11) e!195135)))

(declare-fun e!195134 () Bool)

(assert (=> start!61086 (and (inv!12 bs2!19) e!195134)))

(declare-fun b!275175 () Bool)

(declare-fun res!228823 () Bool)

(assert (=> b!275175 (=> (not res!228823) (not e!195132))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275175 (= res!228823 (validate_offset_bit!0 ((_ sign_extend 32) (size!6794 (buf!7262 bs1!11))) ((_ sign_extend 32) (currentByte!13424 bs1!11)) ((_ sign_extend 32) (currentBit!13419 bs1!11))))))

(declare-fun b!275176 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275176 (= e!195132 (not (invariant!0 (currentBit!13419 bs1!11) (currentByte!13424 bs1!11) (size!6794 (buf!7262 bs1!11)))))))

(declare-fun b!275178 () Bool)

(declare-fun array_inv!6518 (array!15687) Bool)

(assert (=> b!275178 (= e!195134 (array_inv!6518 (buf!7262 bs2!19)))))

(declare-fun b!275177 () Bool)

(assert (=> b!275177 (= e!195135 (array_inv!6518 (buf!7262 bs1!11)))))

(assert (= (and start!61086 res!228822) b!275175))

(assert (= (and b!275175 res!228823) b!275176))

(assert (= start!61086 b!275177))

(assert (= start!61086 b!275178))

(declare-fun m!407751 () Bool)

(assert (=> b!275175 m!407751))

(declare-fun m!407753 () Bool)

(assert (=> b!275177 m!407753))

(declare-fun m!407755 () Bool)

(assert (=> b!275178 m!407755))

(declare-fun m!407757 () Bool)

(assert (=> start!61086 m!407757))

(declare-fun m!407759 () Bool)

(assert (=> start!61086 m!407759))

(declare-fun m!407761 () Bool)

(assert (=> b!275176 m!407761))

(check-sat (not b!275175) (not start!61086) (not b!275176) (not b!275177) (not b!275178))
(check-sat)
(get-model)

(declare-fun d!94624 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94624 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6794 (buf!7262 bs1!11))) ((_ sign_extend 32) (currentByte!13424 bs1!11)) ((_ sign_extend 32) (currentBit!13419 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6794 (buf!7262 bs1!11))) ((_ sign_extend 32) (currentByte!13424 bs1!11)) ((_ sign_extend 32) (currentBit!13419 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23832 () Bool)

(assert (= bs!23832 d!94624))

(declare-fun m!407775 () Bool)

(assert (=> bs!23832 m!407775))

(assert (=> b!275175 d!94624))

(declare-fun d!94626 () Bool)

(assert (=> d!94626 (= (invariant!0 (currentBit!13419 bs1!11) (currentByte!13424 bs1!11) (size!6794 (buf!7262 bs1!11))) (and (bvsge (currentBit!13419 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13419 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13424 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13424 bs1!11) (size!6794 (buf!7262 bs1!11))) (and (= (currentBit!13419 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13424 bs1!11) (size!6794 (buf!7262 bs1!11)))))))))

(assert (=> b!275176 d!94626))

(declare-fun d!94632 () Bool)

(assert (=> d!94632 (= (array_inv!6518 (buf!7262 bs2!19)) (bvsge (size!6794 (buf!7262 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275178 d!94632))

(declare-fun d!94634 () Bool)

(assert (=> d!94634 (= (array_inv!6518 (buf!7262 bs1!11)) (bvsge (size!6794 (buf!7262 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275177 d!94634))

(declare-fun d!94636 () Bool)

(assert (=> d!94636 (= (inv!12 bs1!11) (invariant!0 (currentBit!13419 bs1!11) (currentByte!13424 bs1!11) (size!6794 (buf!7262 bs1!11))))))

(declare-fun bs!23834 () Bool)

(assert (= bs!23834 d!94636))

(assert (=> bs!23834 m!407761))

(assert (=> start!61086 d!94636))

(declare-fun d!94640 () Bool)

(assert (=> d!94640 (= (inv!12 bs2!19) (invariant!0 (currentBit!13419 bs2!19) (currentByte!13424 bs2!19) (size!6794 (buf!7262 bs2!19))))))

(declare-fun bs!23835 () Bool)

(assert (= bs!23835 d!94640))

(declare-fun m!407779 () Bool)

(assert (=> bs!23835 m!407779))

(assert (=> start!61086 d!94640))

(check-sat (not d!94636) (not d!94640) (not d!94624))
(check-sat)

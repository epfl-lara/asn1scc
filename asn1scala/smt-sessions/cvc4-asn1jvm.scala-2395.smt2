; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61068 () Bool)

(assert start!61068)

(declare-fun res!228811 () Bool)

(declare-fun e!195104 () Bool)

(assert (=> start!61068 (=> (not res!228811) (not e!195104))))

(declare-datatypes ((array!15681 0))(
  ( (array!15682 (arr!7779 (Array (_ BitVec 32) (_ BitVec 8))) (size!6792 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12398 0))(
  ( (BitStream!12399 (buf!7260 array!15681) (currentByte!13420 (_ BitVec 32)) (currentBit!13415 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12398)

(declare-fun bs2!19 () BitStream!12398)

(assert (=> start!61068 (= res!228811 (and (= (size!6792 (buf!7260 bs1!11)) (size!6792 (buf!7260 bs2!19))) (bvsle ((_ sign_extend 32) (size!6792 (buf!7260 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13420 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13415 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6792 (buf!7260 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13420 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13415 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!61068 e!195104))

(declare-fun e!195105 () Bool)

(declare-fun inv!12 (BitStream!12398) Bool)

(assert (=> start!61068 (and (inv!12 bs1!11) e!195105)))

(declare-fun e!195103 () Bool)

(assert (=> start!61068 (and (inv!12 bs2!19) e!195103)))

(declare-fun b!275152 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275152 (= e!195104 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13415 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13420 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (size!6792 (buf!7260 bs1!11)))))))))

(declare-fun b!275153 () Bool)

(declare-fun array_inv!6516 (array!15681) Bool)

(assert (=> b!275153 (= e!195105 (array_inv!6516 (buf!7260 bs1!11)))))

(declare-fun b!275154 () Bool)

(assert (=> b!275154 (= e!195103 (array_inv!6516 (buf!7260 bs2!19)))))

(assert (= (and start!61068 res!228811) b!275152))

(assert (= start!61068 b!275153))

(assert (= start!61068 b!275154))

(declare-fun m!407725 () Bool)

(assert (=> start!61068 m!407725))

(declare-fun m!407727 () Bool)

(assert (=> start!61068 m!407727))

(declare-fun m!407729 () Bool)

(assert (=> b!275152 m!407729))

(declare-fun m!407731 () Bool)

(assert (=> b!275153 m!407731))

(declare-fun m!407733 () Bool)

(assert (=> b!275154 m!407733))

(push 1)

(assert (not start!61068))

(assert (not b!275153))

(assert (not b!275154))

(assert (not b!275152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)


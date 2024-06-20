; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61730 () Bool)

(assert start!61730)

(declare-fun res!230065 () Bool)

(declare-fun e!196898 () Bool)

(assert (=> start!61730 (=> (not res!230065) (not e!196898))))

(declare-datatypes ((array!15857 0))(
  ( (array!15858 (arr!7860 (Array (_ BitVec 32) (_ BitVec 8))) (size!6864 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12542 0))(
  ( (BitStream!12543 (buf!7332 array!15857) (currentByte!13582 (_ BitVec 32)) (currentBit!13577 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12542)

(declare-fun b2!124 () BitStream!12542)

(assert (=> start!61730 (= res!230065 (= (size!6864 (buf!7332 thiss!872)) (size!6864 (buf!7332 b2!124))))))

(assert (=> start!61730 e!196898))

(declare-fun e!196894 () Bool)

(declare-fun inv!12 (BitStream!12542) Bool)

(assert (=> start!61730 (and (inv!12 thiss!872) e!196894)))

(declare-fun e!196895 () Bool)

(assert (=> start!61730 (and (inv!12 b2!124) e!196895)))

(declare-fun b!276964 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276964 (= e!196898 (not (invariant!0 (currentBit!13577 thiss!872) (currentByte!13582 thiss!872) (size!6864 (buf!7332 thiss!872)))))))

(declare-fun b!276965 () Bool)

(declare-fun array_inv!6588 (array!15857) Bool)

(assert (=> b!276965 (= e!196894 (array_inv!6588 (buf!7332 thiss!872)))))

(declare-fun b!276966 () Bool)

(assert (=> b!276966 (= e!196895 (array_inv!6588 (buf!7332 b2!124)))))

(assert (= (and start!61730 res!230065) b!276964))

(assert (= start!61730 b!276965))

(assert (= start!61730 b!276966))

(declare-fun m!410161 () Bool)

(assert (=> start!61730 m!410161))

(declare-fun m!410163 () Bool)

(assert (=> start!61730 m!410163))

(declare-fun m!410165 () Bool)

(assert (=> b!276964 m!410165))

(declare-fun m!410167 () Bool)

(assert (=> b!276965 m!410167))

(declare-fun m!410169 () Bool)

(assert (=> b!276966 m!410169))

(push 1)

(assert (not b!276965))

(assert (not b!276964))

(assert (not b!276966))

(assert (not start!61730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95512 () Bool)

(assert (=> d!95512 (= (array_inv!6588 (buf!7332 thiss!872)) (bvsge (size!6864 (buf!7332 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!276965 d!95512))

(declare-fun d!95514 () Bool)

(assert (=> d!95514 (= (invariant!0 (currentBit!13577 thiss!872) (currentByte!13582 thiss!872) (size!6864 (buf!7332 thiss!872))) (and (bvsge (currentBit!13577 thiss!872) #b00000000000000000000000000000000) (bvslt (currentBit!13577 thiss!872) #b00000000000000000000000000001000) (bvsge (currentByte!13582 thiss!872) #b00000000000000000000000000000000) (or (bvslt (currentByte!13582 thiss!872) (size!6864 (buf!7332 thiss!872))) (and (= (currentBit!13577 thiss!872) #b00000000000000000000000000000000) (= (currentByte!13582 thiss!872) (size!6864 (buf!7332 thiss!872)))))))))

(assert (=> b!276964 d!95514))

(declare-fun d!95516 () Bool)

(assert (=> d!95516 (= (array_inv!6588 (buf!7332 b2!124)) (bvsge (size!6864 (buf!7332 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!276966 d!95516))

(declare-fun d!95518 () Bool)

(assert (=> d!95518 (= (inv!12 thiss!872) (invariant!0 (currentBit!13577 thiss!872) (currentByte!13582 thiss!872) (size!6864 (buf!7332 thiss!872))))))

(declare-fun bs!24087 () Bool)

(assert (= bs!24087 d!95518))

(assert (=> bs!24087 m!410165))

(assert (=> start!61730 d!95518))

(declare-fun d!95522 () Bool)

(assert (=> d!95522 (= (inv!12 b2!124) (invariant!0 (currentBit!13577 b2!124) (currentByte!13582 b2!124) (size!6864 (buf!7332 b2!124))))))

(declare-fun bs!24088 () Bool)

(assert (= bs!24088 d!95522))

(declare-fun m!410171 () Bool)

(assert (=> bs!24088 m!410171))

(assert (=> start!61730 d!95522))

(push 1)

(assert (not d!95522))

(assert (not d!95518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


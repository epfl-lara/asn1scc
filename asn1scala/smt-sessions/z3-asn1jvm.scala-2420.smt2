; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61752 () Bool)

(assert start!61752)

(declare-fun res!230071 () Bool)

(declare-fun e!196926 () Bool)

(assert (=> start!61752 (=> (not res!230071) (not e!196926))))

(declare-datatypes ((array!15864 0))(
  ( (array!15865 (arr!7862 (Array (_ BitVec 32) (_ BitVec 8))) (size!6866 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12546 0))(
  ( (BitStream!12547 (buf!7334 array!15864) (currentByte!13587 (_ BitVec 32)) (currentBit!13582 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12546)

(declare-fun b2!124 () BitStream!12546)

(assert (=> start!61752 (= res!230071 (= (size!6866 (buf!7334 thiss!872)) (size!6866 (buf!7334 b2!124))))))

(assert (=> start!61752 e!196926))

(declare-fun e!196924 () Bool)

(declare-fun inv!12 (BitStream!12546) Bool)

(assert (=> start!61752 (and (inv!12 thiss!872) e!196924)))

(declare-fun e!196925 () Bool)

(assert (=> start!61752 (and (inv!12 b2!124) e!196925)))

(declare-fun b!276982 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276982 (= e!196926 (not (invariant!0 (currentBit!13582 b2!124) (currentByte!13587 b2!124) (size!6866 (buf!7334 b2!124)))))))

(declare-fun b!276983 () Bool)

(declare-fun array_inv!6590 (array!15864) Bool)

(assert (=> b!276983 (= e!196924 (array_inv!6590 (buf!7334 thiss!872)))))

(declare-fun b!276984 () Bool)

(assert (=> b!276984 (= e!196925 (array_inv!6590 (buf!7334 b2!124)))))

(assert (= (and start!61752 res!230071) b!276982))

(assert (= start!61752 b!276983))

(assert (= start!61752 b!276984))

(declare-fun m!410187 () Bool)

(assert (=> start!61752 m!410187))

(declare-fun m!410189 () Bool)

(assert (=> start!61752 m!410189))

(declare-fun m!410191 () Bool)

(assert (=> b!276982 m!410191))

(declare-fun m!410193 () Bool)

(assert (=> b!276983 m!410193))

(declare-fun m!410195 () Bool)

(assert (=> b!276984 m!410195))

(check-sat (not b!276984) (not start!61752) (not b!276983) (not b!276982))
(check-sat)
(get-model)

(declare-fun d!95550 () Bool)

(assert (=> d!95550 (= (array_inv!6590 (buf!7334 b2!124)) (bvsge (size!6866 (buf!7334 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!276984 d!95550))

(declare-fun d!95555 () Bool)

(assert (=> d!95555 (= (inv!12 thiss!872) (invariant!0 (currentBit!13582 thiss!872) (currentByte!13587 thiss!872) (size!6866 (buf!7334 thiss!872))))))

(declare-fun bs!24098 () Bool)

(assert (= bs!24098 d!95555))

(declare-fun m!410209 () Bool)

(assert (=> bs!24098 m!410209))

(assert (=> start!61752 d!95555))


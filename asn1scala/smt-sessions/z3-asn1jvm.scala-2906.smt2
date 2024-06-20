; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69558 () Bool)

(assert start!69558)

(declare-fun b!312628 () Bool)

(declare-fun e!224868 () Bool)

(declare-datatypes ((array!19158 0))(
  ( (array!19159 (arr!9386 (Array (_ BitVec 32) (_ BitVec 8))) (size!8306 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13716 0))(
  ( (BitStream!13717 (buf!7919 array!19158) (currentByte!14638 (_ BitVec 32)) (currentBit!14633 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13716)

(declare-fun array_inv!7858 (array!19158) Bool)

(assert (=> b!312628 (= e!224868 (array_inv!7858 (buf!7919 b1!97)))))

(declare-fun b!312629 () Bool)

(declare-fun res!256030 () Bool)

(declare-fun e!224870 () Bool)

(assert (=> b!312629 (=> (not res!256030) (not e!224870))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13716)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312629 (= res!256030 (bvsle (bitIndex!0 (size!8306 (buf!7919 b2!97)) (currentByte!14638 b2!97) (currentBit!14633 b2!97)) (bvadd (bitIndex!0 (size!8306 (buf!7919 b1!97)) (currentByte!14638 b1!97) (currentBit!14633 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!256031 () Bool)

(assert (=> start!69558 (=> (not res!256031) (not e!224870))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69558 (= res!256031 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8306 (buf!7919 b1!97)) (size!8306 (buf!7919 b2!97)))))))

(assert (=> start!69558 e!224870))

(assert (=> start!69558 true))

(declare-fun inv!12 (BitStream!13716) Bool)

(assert (=> start!69558 (and (inv!12 b1!97) e!224868)))

(declare-fun e!224869 () Bool)

(assert (=> start!69558 (and (inv!12 b2!97) e!224869)))

(declare-fun b!312630 () Bool)

(assert (=> b!312630 (= e!224870 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8306 (buf!7919 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14638 b1!97))) ((_ sign_extend 32) (currentBit!14633 b1!97)))) b1ValidateOffsetBits!10) (not (= ((_ sign_extend 32) (currentByte!14638 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14638 b2!97))) ((_ sign_extend 32) (currentByte!14638 b2!97)))))))))

(declare-fun b!312631 () Bool)

(declare-fun res!256029 () Bool)

(assert (=> b!312631 (=> (not res!256029) (not e!224870))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312631 (= res!256029 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8306 (buf!7919 b1!97))) ((_ sign_extend 32) (currentByte!14638 b1!97)) ((_ sign_extend 32) (currentBit!14633 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312632 () Bool)

(assert (=> b!312632 (= e!224869 (array_inv!7858 (buf!7919 b2!97)))))

(declare-fun b!312633 () Bool)

(declare-fun res!256028 () Bool)

(assert (=> b!312633 (=> (not res!256028) (not e!224870))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312633 (= res!256028 (validate_offset_bits!1 ((_ sign_extend 32) (size!8306 (buf!7919 b1!97))) ((_ sign_extend 32) (currentByte!14638 b1!97)) ((_ sign_extend 32) (currentBit!14633 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69558 res!256031) b!312633))

(assert (= (and b!312633 res!256028) b!312629))

(assert (= (and b!312629 res!256030) b!312631))

(assert (= (and b!312631 res!256029) b!312630))

(assert (= start!69558 b!312628))

(assert (= start!69558 b!312632))

(declare-fun m!450273 () Bool)

(assert (=> b!312629 m!450273))

(declare-fun m!450275 () Bool)

(assert (=> b!312629 m!450275))

(declare-fun m!450277 () Bool)

(assert (=> b!312631 m!450277))

(declare-fun m!450279 () Bool)

(assert (=> b!312628 m!450279))

(declare-fun m!450281 () Bool)

(assert (=> start!69558 m!450281))

(declare-fun m!450283 () Bool)

(assert (=> start!69558 m!450283))

(declare-fun m!450285 () Bool)

(assert (=> b!312632 m!450285))

(declare-fun m!450287 () Bool)

(assert (=> b!312633 m!450287))

(check-sat (not b!312633) (not b!312632) (not b!312631) (not b!312628) (not b!312629) (not start!69558))
(check-sat)

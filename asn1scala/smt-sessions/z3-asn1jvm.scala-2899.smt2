; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69462 () Bool)

(assert start!69462)

(declare-fun b!312208 () Bool)

(declare-fun e!224514 () Bool)

(declare-datatypes ((array!19110 0))(
  ( (array!19111 (arr!9365 (Array (_ BitVec 32) (_ BitVec 8))) (size!8285 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13674 0))(
  ( (BitStream!13675 (buf!7898 array!19110) (currentByte!14602 (_ BitVec 32)) (currentBit!14597 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13674)

(declare-fun array_inv!7837 (array!19110) Bool)

(assert (=> b!312208 (= e!224514 (array_inv!7837 (buf!7898 b1!97)))))

(declare-fun b!312209 () Bool)

(declare-fun res!255735 () Bool)

(declare-fun e!224518 () Bool)

(assert (=> b!312209 (=> (not res!255735) (not e!224518))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13674)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312209 (= res!255735 (bvsle (bitIndex!0 (size!8285 (buf!7898 b2!97)) (currentByte!14602 b2!97) (currentBit!14597 b2!97)) (bvadd (bitIndex!0 (size!8285 (buf!7898 b1!97)) (currentByte!14602 b1!97) (currentBit!14597 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312210 () Bool)

(declare-fun e!224516 () Bool)

(assert (=> b!312210 (= e!224516 (array_inv!7837 (buf!7898 b2!97)))))

(declare-fun res!255734 () Bool)

(assert (=> start!69462 (=> (not res!255734) (not e!224518))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69462 (= res!255734 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8285 (buf!7898 b1!97)) (size!8285 (buf!7898 b2!97)))))))

(assert (=> start!69462 e!224518))

(assert (=> start!69462 true))

(declare-fun inv!12 (BitStream!13674) Bool)

(assert (=> start!69462 (and (inv!12 b1!97) e!224514)))

(assert (=> start!69462 (and (inv!12 b2!97) e!224516)))

(declare-fun b!312211 () Bool)

(declare-fun res!255736 () Bool)

(assert (=> b!312211 (=> (not res!255736) (not e!224518))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312211 (= res!255736 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8285 (buf!7898 b1!97))) ((_ sign_extend 32) (currentByte!14602 b1!97)) ((_ sign_extend 32) (currentBit!14597 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun lt!441802 () (_ BitVec 64))

(declare-fun lt!441803 () (_ BitVec 64))

(declare-fun b!312212 () Bool)

(assert (=> b!312212 (= e!224518 (and (bvsge (bvsub lt!441802 lt!441803) b1ValidateOffsetBits!10) (let ((bdg!18612 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14602 b2!97))) ((_ sign_extend 32) (currentBit!14597 b2!97))))) (and (bvsle bdg!18612 (bvadd lt!441803 advancedAtMostBits!9)) (bvslt (bvsub lt!441802 bdg!18612) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))))

(assert (=> b!312212 (= lt!441803 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14602 b1!97))) ((_ sign_extend 32) (currentBit!14597 b1!97))))))

(assert (=> b!312212 (= lt!441802 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8285 (buf!7898 b1!97)))))))

(declare-fun b!312213 () Bool)

(declare-fun res!255737 () Bool)

(assert (=> b!312213 (=> (not res!255737) (not e!224518))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312213 (= res!255737 (validate_offset_bits!1 ((_ sign_extend 32) (size!8285 (buf!7898 b1!97))) ((_ sign_extend 32) (currentByte!14602 b1!97)) ((_ sign_extend 32) (currentBit!14597 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69462 res!255734) b!312213))

(assert (= (and b!312213 res!255737) b!312209))

(assert (= (and b!312209 res!255735) b!312211))

(assert (= (and b!312211 res!255736) b!312212))

(assert (= start!69462 b!312208))

(assert (= start!69462 b!312210))

(declare-fun m!449913 () Bool)

(assert (=> b!312211 m!449913))

(declare-fun m!449915 () Bool)

(assert (=> b!312208 m!449915))

(declare-fun m!449917 () Bool)

(assert (=> b!312213 m!449917))

(declare-fun m!449919 () Bool)

(assert (=> b!312210 m!449919))

(declare-fun m!449921 () Bool)

(assert (=> start!69462 m!449921))

(declare-fun m!449923 () Bool)

(assert (=> start!69462 m!449923))

(declare-fun m!449925 () Bool)

(assert (=> b!312209 m!449925))

(declare-fun m!449927 () Bool)

(assert (=> b!312209 m!449927))

(check-sat (not b!312210) (not b!312211) (not start!69462) (not b!312213) (not b!312209) (not b!312208))
(check-sat)

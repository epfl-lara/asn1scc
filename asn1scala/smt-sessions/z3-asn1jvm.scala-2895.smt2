; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69348 () Bool)

(assert start!69348)

(declare-fun b!311940 () Bool)

(declare-fun e!224300 () Bool)

(declare-datatypes ((array!19077 0))(
  ( (array!19078 (arr!9353 (Array (_ BitVec 32) (_ BitVec 8))) (size!8273 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13650 0))(
  ( (BitStream!13651 (buf!7886 array!19077) (currentByte!14563 (_ BitVec 32)) (currentBit!14558 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13650)

(declare-fun array_inv!7825 (array!19077) Bool)

(assert (=> b!311940 (= e!224300 (array_inv!7825 (buf!7886 b2!97)))))

(declare-fun b!311937 () Bool)

(declare-fun res!255535 () Bool)

(declare-fun e!224302 () Bool)

(assert (=> b!311937 (=> (not res!255535) (not e!224302))))

(declare-fun b1!97 () BitStream!13650)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311937 (= res!255535 (validate_offset_bits!1 ((_ sign_extend 32) (size!8273 (buf!7886 b1!97))) ((_ sign_extend 32) (currentByte!14563 b1!97)) ((_ sign_extend 32) (currentBit!14558 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311938 () Bool)

(assert (=> b!311938 (= e!224302 false)))

(declare-fun lt!441559 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311938 (= lt!441559 (bitIndex!0 (size!8273 (buf!7886 b2!97)) (currentByte!14563 b2!97) (currentBit!14558 b2!97)))))

(declare-fun lt!441560 () (_ BitVec 64))

(assert (=> b!311938 (= lt!441560 (bitIndex!0 (size!8273 (buf!7886 b1!97)) (currentByte!14563 b1!97) (currentBit!14558 b1!97)))))

(declare-fun b!311939 () Bool)

(declare-fun e!224299 () Bool)

(assert (=> b!311939 (= e!224299 (array_inv!7825 (buf!7886 b1!97)))))

(declare-fun res!255536 () Bool)

(assert (=> start!69348 (=> (not res!255536) (not e!224302))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69348 (= res!255536 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8273 (buf!7886 b1!97)) (size!8273 (buf!7886 b2!97)))))))

(assert (=> start!69348 e!224302))

(assert (=> start!69348 true))

(declare-fun inv!12 (BitStream!13650) Bool)

(assert (=> start!69348 (and (inv!12 b1!97) e!224299)))

(assert (=> start!69348 (and (inv!12 b2!97) e!224300)))

(assert (= (and start!69348 res!255536) b!311937))

(assert (= (and b!311937 res!255535) b!311938))

(assert (= start!69348 b!311939))

(assert (= start!69348 b!311940))

(declare-fun m!449671 () Bool)

(assert (=> b!311937 m!449671))

(declare-fun m!449673 () Bool)

(assert (=> start!69348 m!449673))

(declare-fun m!449675 () Bool)

(assert (=> start!69348 m!449675))

(declare-fun m!449677 () Bool)

(assert (=> b!311938 m!449677))

(declare-fun m!449679 () Bool)

(assert (=> b!311938 m!449679))

(declare-fun m!449681 () Bool)

(assert (=> b!311939 m!449681))

(declare-fun m!449683 () Bool)

(assert (=> b!311940 m!449683))

(check-sat (not b!311937) (not b!311939) (not b!311940) (not b!311938) (not start!69348))

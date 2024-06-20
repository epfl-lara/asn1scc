; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69464 () Bool)

(assert start!69464)

(declare-fun b!312226 () Bool)

(declare-fun res!255749 () Bool)

(declare-fun e!224531 () Bool)

(assert (=> b!312226 (=> (not res!255749) (not e!224531))))

(declare-datatypes ((array!19112 0))(
  ( (array!19113 (arr!9366 (Array (_ BitVec 32) (_ BitVec 8))) (size!8286 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13676 0))(
  ( (BitStream!13677 (buf!7899 array!19112) (currentByte!14603 (_ BitVec 32)) (currentBit!14598 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13676)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312226 (= res!255749 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8286 (buf!7899 b1!97))) ((_ sign_extend 32) (currentByte!14603 b1!97)) ((_ sign_extend 32) (currentBit!14598 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!255746 () Bool)

(assert (=> start!69464 (=> (not res!255746) (not e!224531))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13676)

(assert (=> start!69464 (= res!255746 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8286 (buf!7899 b1!97)) (size!8286 (buf!7899 b2!97)))))))

(assert (=> start!69464 e!224531))

(assert (=> start!69464 true))

(declare-fun e!224530 () Bool)

(declare-fun inv!12 (BitStream!13676) Bool)

(assert (=> start!69464 (and (inv!12 b1!97) e!224530)))

(declare-fun e!224529 () Bool)

(assert (=> start!69464 (and (inv!12 b2!97) e!224529)))

(declare-fun b!312227 () Bool)

(declare-fun array_inv!7838 (array!19112) Bool)

(assert (=> b!312227 (= e!224530 (array_inv!7838 (buf!7899 b1!97)))))

(declare-fun lt!441809 () (_ BitVec 64))

(declare-fun b!312228 () Bool)

(declare-fun lt!441808 () (_ BitVec 64))

(assert (=> b!312228 (= e!224531 (and (bvsge (bvsub lt!441809 lt!441808) b1ValidateOffsetBits!10) (let ((bdg!18612 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14603 b2!97))) ((_ sign_extend 32) (currentBit!14598 b2!97))))) (and (bvsle bdg!18612 (bvadd lt!441808 advancedAtMostBits!9)) (bvslt (bvsub lt!441809 bdg!18612) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))))

(assert (=> b!312228 (= lt!441808 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14603 b1!97))) ((_ sign_extend 32) (currentBit!14598 b1!97))))))

(assert (=> b!312228 (= lt!441809 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8286 (buf!7899 b1!97)))))))

(declare-fun b!312229 () Bool)

(declare-fun res!255747 () Bool)

(assert (=> b!312229 (=> (not res!255747) (not e!224531))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312229 (= res!255747 (bvsle (bitIndex!0 (size!8286 (buf!7899 b2!97)) (currentByte!14603 b2!97) (currentBit!14598 b2!97)) (bvadd (bitIndex!0 (size!8286 (buf!7899 b1!97)) (currentByte!14603 b1!97) (currentBit!14598 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312230 () Bool)

(assert (=> b!312230 (= e!224529 (array_inv!7838 (buf!7899 b2!97)))))

(declare-fun b!312231 () Bool)

(declare-fun res!255748 () Bool)

(assert (=> b!312231 (=> (not res!255748) (not e!224531))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312231 (= res!255748 (validate_offset_bits!1 ((_ sign_extend 32) (size!8286 (buf!7899 b1!97))) ((_ sign_extend 32) (currentByte!14603 b1!97)) ((_ sign_extend 32) (currentBit!14598 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69464 res!255746) b!312231))

(assert (= (and b!312231 res!255748) b!312229))

(assert (= (and b!312229 res!255747) b!312226))

(assert (= (and b!312226 res!255749) b!312228))

(assert (= start!69464 b!312227))

(assert (= start!69464 b!312230))

(declare-fun m!449929 () Bool)

(assert (=> b!312227 m!449929))

(declare-fun m!449931 () Bool)

(assert (=> b!312231 m!449931))

(declare-fun m!449933 () Bool)

(assert (=> b!312229 m!449933))

(declare-fun m!449935 () Bool)

(assert (=> b!312229 m!449935))

(declare-fun m!449937 () Bool)

(assert (=> start!69464 m!449937))

(declare-fun m!449939 () Bool)

(assert (=> start!69464 m!449939))

(declare-fun m!449941 () Bool)

(assert (=> b!312230 m!449941))

(declare-fun m!449943 () Bool)

(assert (=> b!312226 m!449943))

(push 1)

(assert (not b!312231))

(assert (not b!312226))

(assert (not b!312230))

(assert (not b!312227))

(assert (not start!69464))

(assert (not b!312229))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69594 () Bool)

(assert start!69594)

(declare-fun b!312952 () Bool)

(declare-fun res!256246 () Bool)

(declare-fun e!225140 () Bool)

(assert (=> b!312952 (=> (not res!256246) (not e!225140))))

(declare-datatypes ((array!19194 0))(
  ( (array!19195 (arr!9404 (Array (_ BitVec 32) (_ BitVec 8))) (size!8324 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13752 0))(
  ( (BitStream!13753 (buf!7937 array!19194) (currentByte!14656 (_ BitVec 32)) (currentBit!14651 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13752)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312952 (= res!256246 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8324 (buf!7937 b1!97))) ((_ sign_extend 32) (currentByte!14656 b1!97)) ((_ sign_extend 32) (currentBit!14651 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312953 () Bool)

(declare-fun res!256247 () Bool)

(assert (=> b!312953 (=> (not res!256247) (not e!225140))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13752)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312953 (= res!256247 (bvsle (bitIndex!0 (size!8324 (buf!7937 b2!97)) (currentByte!14656 b2!97) (currentBit!14651 b2!97)) (bvadd (bitIndex!0 (size!8324 (buf!7937 b1!97)) (currentByte!14656 b1!97) (currentBit!14651 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!256244 () Bool)

(assert (=> start!69594 (=> (not res!256244) (not e!225140))))

(assert (=> start!69594 (= res!256244 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8324 (buf!7937 b1!97)) (size!8324 (buf!7937 b2!97)))))))

(assert (=> start!69594 e!225140))

(assert (=> start!69594 true))

(declare-fun e!225142 () Bool)

(declare-fun inv!12 (BitStream!13752) Bool)

(assert (=> start!69594 (and (inv!12 b1!97) e!225142)))

(declare-fun e!225141 () Bool)

(assert (=> start!69594 (and (inv!12 b2!97) e!225141)))

(declare-fun b!312954 () Bool)

(declare-fun array_inv!7876 (array!19194) Bool)

(assert (=> b!312954 (= e!225141 (array_inv!7876 (buf!7937 b2!97)))))

(declare-fun b!312955 () Bool)

(declare-fun lt!442085 () (_ BitVec 64))

(assert (=> b!312955 (= e!225140 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8324 (buf!7937 b1!97)))) lt!442085) b1ValidateOffsetBits!10) (let ((bdg!18634 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14656 b2!97))))) (and (bvsle (bvadd bdg!18634 ((_ sign_extend 32) (currentBit!14651 b2!97))) (bvadd lt!442085 advancedAtMostBits!9)) (not (= ((_ sign_extend 32) (currentByte!14656 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18634 ((_ sign_extend 32) (currentByte!14656 b2!97)))))))))))

(assert (=> b!312955 (= lt!442085 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14656 b1!97))) ((_ sign_extend 32) (currentBit!14651 b1!97))))))

(declare-fun b!312956 () Bool)

(declare-fun res!256245 () Bool)

(assert (=> b!312956 (=> (not res!256245) (not e!225140))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312956 (= res!256245 (validate_offset_bits!1 ((_ sign_extend 32) (size!8324 (buf!7937 b1!97))) ((_ sign_extend 32) (currentByte!14656 b1!97)) ((_ sign_extend 32) (currentBit!14651 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312957 () Bool)

(assert (=> b!312957 (= e!225142 (array_inv!7876 (buf!7937 b1!97)))))

(assert (= (and start!69594 res!256244) b!312956))

(assert (= (and b!312956 res!256245) b!312953))

(assert (= (and b!312953 res!256247) b!312952))

(assert (= (and b!312952 res!256246) b!312955))

(assert (= start!69594 b!312957))

(assert (= start!69594 b!312954))

(declare-fun m!450561 () Bool)

(assert (=> b!312957 m!450561))

(declare-fun m!450563 () Bool)

(assert (=> b!312952 m!450563))

(declare-fun m!450565 () Bool)

(assert (=> b!312954 m!450565))

(declare-fun m!450567 () Bool)

(assert (=> start!69594 m!450567))

(declare-fun m!450569 () Bool)

(assert (=> start!69594 m!450569))

(declare-fun m!450571 () Bool)

(assert (=> b!312953 m!450571))

(declare-fun m!450573 () Bool)

(assert (=> b!312953 m!450573))

(declare-fun m!450575 () Bool)

(assert (=> b!312956 m!450575))

(check-sat (not b!312957) (not b!312954) (not start!69594) (not b!312953) (not b!312952) (not b!312956))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69460 () Bool)

(assert start!69460)

(declare-fun res!255722 () Bool)

(declare-fun e!224503 () Bool)

(assert (=> start!69460 (=> (not res!255722) (not e!224503))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19108 0))(
  ( (array!19109 (arr!9364 (Array (_ BitVec 32) (_ BitVec 8))) (size!8284 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13672 0))(
  ( (BitStream!13673 (buf!7897 array!19108) (currentByte!14601 (_ BitVec 32)) (currentBit!14596 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13672)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13672)

(assert (=> start!69460 (= res!255722 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8284 (buf!7897 b1!97)) (size!8284 (buf!7897 b2!97)))))))

(assert (=> start!69460 e!224503))

(assert (=> start!69460 true))

(declare-fun e!224500 () Bool)

(declare-fun inv!12 (BitStream!13672) Bool)

(assert (=> start!69460 (and (inv!12 b1!97) e!224500)))

(declare-fun e!224499 () Bool)

(assert (=> start!69460 (and (inv!12 b2!97) e!224499)))

(declare-fun b!312190 () Bool)

(declare-fun res!255725 () Bool)

(assert (=> b!312190 (=> (not res!255725) (not e!224503))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312190 (= res!255725 (validate_offset_bits!1 ((_ sign_extend 32) (size!8284 (buf!7897 b1!97))) ((_ sign_extend 32) (currentByte!14601 b1!97)) ((_ sign_extend 32) (currentBit!14596 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312191 () Bool)

(declare-fun lt!441797 () (_ BitVec 64))

(declare-fun lt!441796 () (_ BitVec 64))

(assert (=> b!312191 (= e!224503 (and (bvsge (bvsub lt!441797 lt!441796) b1ValidateOffsetBits!10) (let ((bdg!18612 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14601 b2!97))) ((_ sign_extend 32) (currentBit!14596 b2!97))))) (and (bvsle bdg!18612 (bvadd lt!441796 advancedAtMostBits!9)) (bvslt (bvsub lt!441797 bdg!18612) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))))

(assert (=> b!312191 (= lt!441796 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14601 b1!97))) ((_ sign_extend 32) (currentBit!14596 b1!97))))))

(assert (=> b!312191 (= lt!441797 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8284 (buf!7897 b1!97)))))))

(declare-fun b!312192 () Bool)

(declare-fun array_inv!7836 (array!19108) Bool)

(assert (=> b!312192 (= e!224499 (array_inv!7836 (buf!7897 b2!97)))))

(declare-fun b!312193 () Bool)

(declare-fun res!255723 () Bool)

(assert (=> b!312193 (=> (not res!255723) (not e!224503))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312193 (= res!255723 (bvsle (bitIndex!0 (size!8284 (buf!7897 b2!97)) (currentByte!14601 b2!97) (currentBit!14596 b2!97)) (bvadd (bitIndex!0 (size!8284 (buf!7897 b1!97)) (currentByte!14601 b1!97) (currentBit!14596 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312194 () Bool)

(assert (=> b!312194 (= e!224500 (array_inv!7836 (buf!7897 b1!97)))))

(declare-fun b!312195 () Bool)

(declare-fun res!255724 () Bool)

(assert (=> b!312195 (=> (not res!255724) (not e!224503))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312195 (= res!255724 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8284 (buf!7897 b1!97))) ((_ sign_extend 32) (currentByte!14601 b1!97)) ((_ sign_extend 32) (currentBit!14596 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69460 res!255722) b!312190))

(assert (= (and b!312190 res!255725) b!312193))

(assert (= (and b!312193 res!255723) b!312195))

(assert (= (and b!312195 res!255724) b!312191))

(assert (= start!69460 b!312194))

(assert (= start!69460 b!312192))

(declare-fun m!449897 () Bool)

(assert (=> b!312190 m!449897))

(declare-fun m!449899 () Bool)

(assert (=> b!312192 m!449899))

(declare-fun m!449901 () Bool)

(assert (=> b!312194 m!449901))

(declare-fun m!449903 () Bool)

(assert (=> b!312193 m!449903))

(declare-fun m!449905 () Bool)

(assert (=> b!312193 m!449905))

(declare-fun m!449907 () Bool)

(assert (=> start!69460 m!449907))

(declare-fun m!449909 () Bool)

(assert (=> start!69460 m!449909))

(declare-fun m!449911 () Bool)

(assert (=> b!312195 m!449911))

(push 1)

(assert (not b!312193))

(assert (not b!312192))

(assert (not b!312195))

(assert (not b!312190))

(assert (not b!312194))

(assert (not start!69460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


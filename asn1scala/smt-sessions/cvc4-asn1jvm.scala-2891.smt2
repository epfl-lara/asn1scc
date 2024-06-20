; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69230 () Bool)

(assert start!69230)

(declare-fun b!311587 () Bool)

(declare-fun e!224044 () Bool)

(declare-datatypes ((array!19046 0))(
  ( (array!19047 (arr!9342 (Array (_ BitVec 32) (_ BitVec 8))) (size!8262 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13628 0))(
  ( (BitStream!13629 (buf!7875 array!19046) (currentByte!14521 (_ BitVec 32)) (currentBit!14516 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13628)

(declare-fun array_inv!7814 (array!19046) Bool)

(assert (=> b!311587 (= e!224044 (array_inv!7814 (buf!7875 b1!97)))))

(declare-fun b!311588 () Bool)

(declare-fun e!224046 () Bool)

(declare-fun b2!97 () BitStream!13628)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311588 (= e!224046 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14516 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14521 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8262 (buf!7875 b2!97)))))))))

(declare-fun b!311589 () Bool)

(declare-fun res!255252 () Bool)

(declare-fun e!224042 () Bool)

(assert (=> b!311589 (=> (not res!255252) (not e!224042))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311589 (= res!255252 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8262 (buf!7875 b1!97))) ((_ sign_extend 32) (currentByte!14521 b1!97)) ((_ sign_extend 32) (currentBit!14516 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!255254 () Bool)

(assert (=> start!69230 (=> (not res!255254) (not e!224042))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69230 (= res!255254 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8262 (buf!7875 b1!97)) (size!8262 (buf!7875 b2!97)))))))

(assert (=> start!69230 e!224042))

(assert (=> start!69230 true))

(declare-fun inv!12 (BitStream!13628) Bool)

(assert (=> start!69230 (and (inv!12 b1!97) e!224044)))

(declare-fun e!224048 () Bool)

(assert (=> start!69230 (and (inv!12 b2!97) e!224048)))

(declare-fun b!311590 () Bool)

(assert (=> b!311590 (= e!224048 (array_inv!7814 (buf!7875 b2!97)))))

(declare-fun b!311591 () Bool)

(declare-fun e!224045 () Bool)

(assert (=> b!311591 (= e!224042 e!224045)))

(declare-fun res!255253 () Bool)

(assert (=> b!311591 (=> (not res!255253) (not e!224045))))

(declare-fun lt!441256 () (_ BitVec 64))

(declare-fun lt!441255 () (_ BitVec 64))

(assert (=> b!311591 (= res!255253 (bvsge (bvsub lt!441256 lt!441255) b1ValidateOffsetBits!10))))

(assert (=> b!311591 (= lt!441255 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14521 b1!97))) ((_ sign_extend 32) (currentBit!14516 b1!97))))))

(assert (=> b!311591 (= lt!441256 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8262 (buf!7875 b1!97)))))))

(declare-fun b!311592 () Bool)

(declare-fun res!255256 () Bool)

(assert (=> b!311592 (=> (not res!255256) (not e!224042))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311592 (= res!255256 (bvsle (bitIndex!0 (size!8262 (buf!7875 b2!97)) (currentByte!14521 b2!97) (currentBit!14516 b2!97)) (bvadd (bitIndex!0 (size!8262 (buf!7875 b1!97)) (currentByte!14521 b1!97) (currentBit!14516 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311593 () Bool)

(assert (=> b!311593 (= e!224045 e!224046)))

(declare-fun res!255251 () Bool)

(assert (=> b!311593 (=> (not res!255251) (not e!224046))))

(declare-fun lt!441257 () (_ BitVec 64))

(assert (=> b!311593 (= res!255251 (and (bvsle lt!441257 (bvadd lt!441255 advancedAtMostBits!9)) (bvsge (bvsub lt!441256 lt!441257) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsle ((_ sign_extend 32) (size!8262 (buf!7875 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14521 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14516 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8262 (buf!7875 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14521 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14516 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!311593 (= lt!441257 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14521 b2!97))) ((_ sign_extend 32) (currentBit!14516 b2!97))))))

(declare-fun b!311594 () Bool)

(declare-fun res!255255 () Bool)

(assert (=> b!311594 (=> (not res!255255) (not e!224042))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311594 (= res!255255 (validate_offset_bits!1 ((_ sign_extend 32) (size!8262 (buf!7875 b1!97))) ((_ sign_extend 32) (currentByte!14521 b1!97)) ((_ sign_extend 32) (currentBit!14516 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69230 res!255254) b!311594))

(assert (= (and b!311594 res!255255) b!311592))

(assert (= (and b!311592 res!255256) b!311589))

(assert (= (and b!311589 res!255252) b!311591))

(assert (= (and b!311591 res!255253) b!311593))

(assert (= (and b!311593 res!255251) b!311588))

(assert (= start!69230 b!311587))

(assert (= start!69230 b!311590))

(declare-fun m!449435 () Bool)

(assert (=> b!311589 m!449435))

(declare-fun m!449437 () Bool)

(assert (=> b!311588 m!449437))

(declare-fun m!449439 () Bool)

(assert (=> start!69230 m!449439))

(declare-fun m!449441 () Bool)

(assert (=> start!69230 m!449441))

(declare-fun m!449443 () Bool)

(assert (=> b!311594 m!449443))

(declare-fun m!449445 () Bool)

(assert (=> b!311587 m!449445))

(declare-fun m!449447 () Bool)

(assert (=> b!311592 m!449447))

(declare-fun m!449449 () Bool)

(assert (=> b!311592 m!449449))

(declare-fun m!449451 () Bool)

(assert (=> b!311590 m!449451))

(push 1)

(assert (not b!311590))

(assert (not b!311592))

(assert (not b!311594))

(assert (not start!69230))

(assert (not b!311589))

(assert (not b!311587))

(assert (not b!311588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)


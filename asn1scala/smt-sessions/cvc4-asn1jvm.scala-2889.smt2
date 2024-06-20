; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69186 () Bool)

(assert start!69186)

(declare-fun b!311439 () Bool)

(declare-fun res!255141 () Bool)

(declare-fun e!223926 () Bool)

(assert (=> b!311439 (=> (not res!255141) (not e!223926))))

(declare-datatypes ((array!19031 0))(
  ( (array!19032 (arr!9336 (Array (_ BitVec 32) (_ BitVec 8))) (size!8256 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13616 0))(
  ( (BitStream!13617 (buf!7869 array!19031) (currentByte!14505 (_ BitVec 32)) (currentBit!14500 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13616)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311439 (= res!255141 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8256 (buf!7869 b1!97))) ((_ sign_extend 32) (currentByte!14505 b1!97)) ((_ sign_extend 32) (currentBit!14500 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!255140 () Bool)

(assert (=> start!69186 (=> (not res!255140) (not e!223926))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13616)

(assert (=> start!69186 (= res!255140 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8256 (buf!7869 b1!97)) (size!8256 (buf!7869 b2!97)))))))

(assert (=> start!69186 e!223926))

(assert (=> start!69186 true))

(declare-fun e!223927 () Bool)

(declare-fun inv!12 (BitStream!13616) Bool)

(assert (=> start!69186 (and (inv!12 b1!97) e!223927)))

(declare-fun e!223925 () Bool)

(assert (=> start!69186 (and (inv!12 b2!97) e!223925)))

(declare-fun b!311440 () Bool)

(declare-fun array_inv!7808 (array!19031) Bool)

(assert (=> b!311440 (= e!223927 (array_inv!7808 (buf!7869 b1!97)))))

(declare-fun b!311441 () Bool)

(declare-fun res!255142 () Bool)

(assert (=> b!311441 (=> (not res!255142) (not e!223926))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311441 (= res!255142 (validate_offset_bits!1 ((_ sign_extend 32) (size!8256 (buf!7869 b1!97))) ((_ sign_extend 32) (currentByte!14505 b1!97)) ((_ sign_extend 32) (currentBit!14500 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311442 () Bool)

(declare-fun res!255139 () Bool)

(assert (=> b!311442 (=> (not res!255139) (not e!223926))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311442 (= res!255139 (bvsle (bitIndex!0 (size!8256 (buf!7869 b2!97)) (currentByte!14505 b2!97) (currentBit!14500 b2!97)) (bvadd (bitIndex!0 (size!8256 (buf!7869 b1!97)) (currentByte!14505 b1!97) (currentBit!14500 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311443 () Bool)

(assert (=> b!311443 (= e!223925 (array_inv!7808 (buf!7869 b2!97)))))

(declare-fun lt!441139 () (_ BitVec 64))

(declare-fun b!311444 () Bool)

(declare-fun lt!441140 () (_ BitVec 64))

(assert (=> b!311444 (= e!223926 (and (bvsge (bvsub lt!441139 lt!441140) b1ValidateOffsetBits!10) (let ((bdg!18591 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14505 b2!97))) ((_ sign_extend 32) (currentBit!14500 b2!97))))) (and (bvsle bdg!18591 (bvadd lt!441140 advancedAtMostBits!9)) (bvsge (bvsub lt!441139 bdg!18591) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (or (bvsgt ((_ sign_extend 32) (size!8256 (buf!7869 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14505 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14500 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111))))))))

(assert (=> b!311444 (= lt!441140 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14505 b1!97))) ((_ sign_extend 32) (currentBit!14500 b1!97))))))

(assert (=> b!311444 (= lt!441139 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8256 (buf!7869 b1!97)))))))

(assert (= (and start!69186 res!255140) b!311441))

(assert (= (and b!311441 res!255142) b!311442))

(assert (= (and b!311442 res!255139) b!311439))

(assert (= (and b!311439 res!255141) b!311444))

(assert (= start!69186 b!311440))

(assert (= start!69186 b!311443))

(declare-fun m!449317 () Bool)

(assert (=> b!311440 m!449317))

(declare-fun m!449319 () Bool)

(assert (=> start!69186 m!449319))

(declare-fun m!449321 () Bool)

(assert (=> start!69186 m!449321))

(declare-fun m!449323 () Bool)

(assert (=> b!311442 m!449323))

(declare-fun m!449325 () Bool)

(assert (=> b!311442 m!449325))

(declare-fun m!449327 () Bool)

(assert (=> b!311443 m!449327))

(declare-fun m!449329 () Bool)

(assert (=> b!311439 m!449329))

(declare-fun m!449331 () Bool)

(assert (=> b!311441 m!449331))

(push 1)

(assert (not b!311442))

(assert (not start!69186))

(assert (not b!311443))

(assert (not b!311441))

(assert (not b!311440))

(assert (not b!311439))

(check-sat)

(pop 1)

(push 1)

(check-sat)


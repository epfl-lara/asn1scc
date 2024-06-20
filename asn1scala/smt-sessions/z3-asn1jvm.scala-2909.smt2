; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69576 () Bool)

(assert start!69576)

(declare-fun b!312790 () Bool)

(declare-fun res!256136 () Bool)

(declare-fun e!225006 () Bool)

(assert (=> b!312790 (=> (not res!256136) (not e!225006))))

(declare-datatypes ((array!19176 0))(
  ( (array!19177 (arr!9395 (Array (_ BitVec 32) (_ BitVec 8))) (size!8315 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13734 0))(
  ( (BitStream!13735 (buf!7928 array!19176) (currentByte!14647 (_ BitVec 32)) (currentBit!14642 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13734)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312790 (= res!256136 (validate_offset_bits!1 ((_ sign_extend 32) (size!8315 (buf!7928 b1!97))) ((_ sign_extend 32) (currentByte!14647 b1!97)) ((_ sign_extend 32) (currentBit!14642 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!256138 () Bool)

(assert (=> start!69576 (=> (not res!256138) (not e!225006))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13734)

(assert (=> start!69576 (= res!256138 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8315 (buf!7928 b1!97)) (size!8315 (buf!7928 b2!97)))))))

(assert (=> start!69576 e!225006))

(assert (=> start!69576 true))

(declare-fun e!225005 () Bool)

(declare-fun inv!12 (BitStream!13734) Bool)

(assert (=> start!69576 (and (inv!12 b1!97) e!225005)))

(declare-fun e!225003 () Bool)

(assert (=> start!69576 (and (inv!12 b2!97) e!225003)))

(declare-fun b!312791 () Bool)

(declare-fun array_inv!7867 (array!19176) Bool)

(assert (=> b!312791 (= e!225005 (array_inv!7867 (buf!7928 b1!97)))))

(declare-fun b!312792 () Bool)

(declare-fun res!256137 () Bool)

(assert (=> b!312792 (=> (not res!256137) (not e!225006))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312792 (= res!256137 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8315 (buf!7928 b1!97))) ((_ sign_extend 32) (currentByte!14647 b1!97)) ((_ sign_extend 32) (currentBit!14642 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312793 () Bool)

(assert (=> b!312793 (= e!225003 (array_inv!7867 (buf!7928 b2!97)))))

(declare-fun b!312794 () Bool)

(declare-fun res!256139 () Bool)

(assert (=> b!312794 (=> (not res!256139) (not e!225006))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312794 (= res!256139 (bvsle (bitIndex!0 (size!8315 (buf!7928 b2!97)) (currentByte!14647 b2!97) (currentBit!14642 b2!97)) (bvadd (bitIndex!0 (size!8315 (buf!7928 b1!97)) (currentByte!14647 b1!97) (currentBit!14642 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312795 () Bool)

(declare-fun lt!442045 () (_ BitVec 64))

(declare-fun lt!442046 () (_ BitVec 64))

(assert (=> b!312795 (= e!225006 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8315 (buf!7928 b1!97)))) lt!442046) b1ValidateOffsetBits!10) (let ((bdg!18628 (bvand lt!442045 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18628 (bvand ((_ sign_extend 32) (currentBit!14642 b1!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18628 (bvand lt!442046 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!312795 (= lt!442046 (bvadd lt!442045 ((_ sign_extend 32) (currentBit!14642 b1!97))))))

(assert (=> b!312795 (= lt!442045 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14647 b1!97))))))

(assert (= (and start!69576 res!256138) b!312790))

(assert (= (and b!312790 res!256136) b!312794))

(assert (= (and b!312794 res!256139) b!312792))

(assert (= (and b!312792 res!256137) b!312795))

(assert (= start!69576 b!312791))

(assert (= start!69576 b!312793))

(declare-fun m!450417 () Bool)

(assert (=> b!312794 m!450417))

(declare-fun m!450419 () Bool)

(assert (=> b!312794 m!450419))

(declare-fun m!450421 () Bool)

(assert (=> b!312791 m!450421))

(declare-fun m!450423 () Bool)

(assert (=> b!312792 m!450423))

(declare-fun m!450425 () Bool)

(assert (=> start!69576 m!450425))

(declare-fun m!450427 () Bool)

(assert (=> start!69576 m!450427))

(declare-fun m!450429 () Bool)

(assert (=> b!312790 m!450429))

(declare-fun m!450431 () Bool)

(assert (=> b!312793 m!450431))

(check-sat (not b!312793) (not b!312792) (not b!312790) (not start!69576) (not b!312794) (not b!312791))
(check-sat)

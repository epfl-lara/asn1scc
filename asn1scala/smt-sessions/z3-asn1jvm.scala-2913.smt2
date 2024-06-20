; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69600 () Bool)

(assert start!69600)

(declare-fun b!313006 () Bool)

(declare-fun e!225186 () Bool)

(declare-datatypes ((array!19200 0))(
  ( (array!19201 (arr!9407 (Array (_ BitVec 32) (_ BitVec 8))) (size!8327 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13758 0))(
  ( (BitStream!13759 (buf!7940 array!19200) (currentByte!14659 (_ BitVec 32)) (currentBit!14654 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13758)

(declare-fun array_inv!7879 (array!19200) Bool)

(assert (=> b!313006 (= e!225186 (array_inv!7879 (buf!7940 b1!97)))))

(declare-fun b!313007 () Bool)

(declare-fun e!225184 () Bool)

(declare-fun b2!97 () BitStream!13758)

(assert (=> b!313007 (= e!225184 (array_inv!7879 (buf!7940 b2!97)))))

(declare-fun b!313008 () Bool)

(declare-fun res!256283 () Bool)

(declare-fun e!225183 () Bool)

(assert (=> b!313008 (=> (not res!256283) (not e!225183))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313008 (= res!256283 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8327 (buf!7940 b1!97))) ((_ sign_extend 32) (currentByte!14659 b1!97)) ((_ sign_extend 32) (currentBit!14654 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313009 () Bool)

(declare-fun res!256282 () Bool)

(assert (=> b!313009 (=> (not res!256282) (not e!225183))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313009 (= res!256282 (validate_offset_bits!1 ((_ sign_extend 32) (size!8327 (buf!7940 b1!97))) ((_ sign_extend 32) (currentByte!14659 b1!97)) ((_ sign_extend 32) (currentBit!14654 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313010 () Bool)

(declare-fun res!256281 () Bool)

(assert (=> b!313010 (=> (not res!256281) (not e!225183))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313010 (= res!256281 (bvsle (bitIndex!0 (size!8327 (buf!7940 b2!97)) (currentByte!14659 b2!97) (currentBit!14654 b2!97)) (bvadd (bitIndex!0 (size!8327 (buf!7940 b1!97)) (currentByte!14659 b1!97) (currentBit!14654 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313011 () Bool)

(declare-fun lt!442094 () (_ BitVec 64))

(assert (=> b!313011 (= e!225183 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8327 (buf!7940 b1!97)))) lt!442094) b1ValidateOffsetBits!10) (let ((bdg!18636 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14659 b2!97))))) (let ((bdg!18637 (bvadd bdg!18636 ((_ sign_extend 32) (currentBit!14654 b2!97))))) (and (bvsle bdg!18637 (bvadd lt!442094 advancedAtMostBits!9)) (let ((bdg!18638 (bvand bdg!18636 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18638 (bvand ((_ sign_extend 32) (currentBit!14654 b2!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18638 (bvand bdg!18637 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!313011 (= lt!442094 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14659 b1!97))) ((_ sign_extend 32) (currentBit!14654 b1!97))))))

(declare-fun res!256280 () Bool)

(assert (=> start!69600 (=> (not res!256280) (not e!225183))))

(assert (=> start!69600 (= res!256280 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8327 (buf!7940 b1!97)) (size!8327 (buf!7940 b2!97)))))))

(assert (=> start!69600 e!225183))

(assert (=> start!69600 true))

(declare-fun inv!12 (BitStream!13758) Bool)

(assert (=> start!69600 (and (inv!12 b1!97) e!225186)))

(assert (=> start!69600 (and (inv!12 b2!97) e!225184)))

(assert (= (and start!69600 res!256280) b!313009))

(assert (= (and b!313009 res!256282) b!313010))

(assert (= (and b!313010 res!256281) b!313008))

(assert (= (and b!313008 res!256283) b!313011))

(assert (= start!69600 b!313006))

(assert (= start!69600 b!313007))

(declare-fun m!450609 () Bool)

(assert (=> b!313009 m!450609))

(declare-fun m!450611 () Bool)

(assert (=> b!313007 m!450611))

(declare-fun m!450613 () Bool)

(assert (=> b!313006 m!450613))

(declare-fun m!450615 () Bool)

(assert (=> start!69600 m!450615))

(declare-fun m!450617 () Bool)

(assert (=> start!69600 m!450617))

(declare-fun m!450619 () Bool)

(assert (=> b!313008 m!450619))

(declare-fun m!450621 () Bool)

(assert (=> b!313010 m!450621))

(declare-fun m!450623 () Bool)

(assert (=> b!313010 m!450623))

(check-sat (not b!313009) (not b!313010) (not start!69600) (not b!313008) (not b!313006) (not b!313007))
(check-sat)

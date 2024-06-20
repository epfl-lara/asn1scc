; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69582 () Bool)

(assert start!69582)

(declare-fun b!312844 () Bool)

(declare-fun e!225051 () Bool)

(declare-datatypes ((array!19182 0))(
  ( (array!19183 (arr!9398 (Array (_ BitVec 32) (_ BitVec 8))) (size!8318 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13740 0))(
  ( (BitStream!13741 (buf!7931 array!19182) (currentByte!14650 (_ BitVec 32)) (currentBit!14645 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13740)

(declare-fun array_inv!7870 (array!19182) Bool)

(assert (=> b!312844 (= e!225051 (array_inv!7870 (buf!7931 b2!97)))))

(declare-fun res!256175 () Bool)

(declare-fun e!225049 () Bool)

(assert (=> start!69582 (=> (not res!256175) (not e!225049))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1!97 () BitStream!13740)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69582 (= res!256175 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8318 (buf!7931 b1!97)) (size!8318 (buf!7931 b2!97)))))))

(assert (=> start!69582 e!225049))

(assert (=> start!69582 true))

(declare-fun e!225050 () Bool)

(declare-fun inv!12 (BitStream!13740) Bool)

(assert (=> start!69582 (and (inv!12 b1!97) e!225050)))

(assert (=> start!69582 (and (inv!12 b2!97) e!225051)))

(declare-fun b!312845 () Bool)

(declare-fun res!256174 () Bool)

(assert (=> b!312845 (=> (not res!256174) (not e!225049))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312845 (= res!256174 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8318 (buf!7931 b1!97))) ((_ sign_extend 32) (currentByte!14650 b1!97)) ((_ sign_extend 32) (currentBit!14645 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312846 () Bool)

(declare-fun res!256173 () Bool)

(assert (=> b!312846 (=> (not res!256173) (not e!225049))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312846 (= res!256173 (validate_offset_bits!1 ((_ sign_extend 32) (size!8318 (buf!7931 b1!97))) ((_ sign_extend 32) (currentByte!14650 b1!97)) ((_ sign_extend 32) (currentBit!14645 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312847 () Bool)

(assert (=> b!312847 (= e!225050 (array_inv!7870 (buf!7931 b1!97)))))

(declare-fun b!312848 () Bool)

(declare-fun res!256172 () Bool)

(assert (=> b!312848 (=> (not res!256172) (not e!225049))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312848 (= res!256172 (bvsle (bitIndex!0 (size!8318 (buf!7931 b2!97)) (currentByte!14650 b2!97) (currentBit!14645 b2!97)) (bvadd (bitIndex!0 (size!8318 (buf!7931 b1!97)) (currentByte!14650 b1!97) (currentBit!14645 b1!97)) advancedAtMostBits!9)))))

(declare-fun lt!442058 () (_ BitVec 64))

(declare-fun b!312849 () Bool)

(assert (=> b!312849 (= e!225049 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8318 (buf!7931 b1!97)))) lt!442058) b1ValidateOffsetBits!10) (let ((bdg!18630 (bvand lt!442058 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18630 (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18630 (bvand (bvadd lt!442058 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!312849 (= lt!442058 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14650 b1!97))) ((_ sign_extend 32) (currentBit!14645 b1!97))))))

(assert (= (and start!69582 res!256175) b!312846))

(assert (= (and b!312846 res!256173) b!312848))

(assert (= (and b!312848 res!256172) b!312845))

(assert (= (and b!312845 res!256174) b!312849))

(assert (= start!69582 b!312847))

(assert (= start!69582 b!312844))

(declare-fun m!450465 () Bool)

(assert (=> b!312848 m!450465))

(declare-fun m!450467 () Bool)

(assert (=> b!312848 m!450467))

(declare-fun m!450469 () Bool)

(assert (=> b!312846 m!450469))

(declare-fun m!450471 () Bool)

(assert (=> b!312844 m!450471))

(declare-fun m!450473 () Bool)

(assert (=> b!312847 m!450473))

(declare-fun m!450475 () Bool)

(assert (=> b!312845 m!450475))

(declare-fun m!450477 () Bool)

(assert (=> start!69582 m!450477))

(declare-fun m!450479 () Bool)

(assert (=> start!69582 m!450479))

(check-sat (not b!312847) (not b!312848) (not b!312846) (not b!312844) (not start!69582) (not b!312845))
(check-sat)

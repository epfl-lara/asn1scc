; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69584 () Bool)

(assert start!69584)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!442061 () (_ BitVec 64))

(declare-datatypes ((array!19184 0))(
  ( (array!19185 (arr!9399 (Array (_ BitVec 32) (_ BitVec 8))) (size!8319 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13742 0))(
  ( (BitStream!13743 (buf!7932 array!19184) (currentByte!14651 (_ BitVec 32)) (currentBit!14646 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13742)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun e!225063 () Bool)

(declare-fun b!312862 () Bool)

(assert (=> b!312862 (= e!225063 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8319 (buf!7932 b1!97)))) lt!442061) b1ValidateOffsetBits!10) (let ((bdg!18630 (bvand lt!442061 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18630 (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18630 (bvand (bvadd lt!442061 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!312862 (= lt!442061 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14651 b1!97))) ((_ sign_extend 32) (currentBit!14646 b1!97))))))

(declare-fun b!312863 () Bool)

(declare-fun res!256184 () Bool)

(assert (=> b!312863 (=> (not res!256184) (not e!225063))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312863 (= res!256184 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8319 (buf!7932 b1!97))) ((_ sign_extend 32) (currentByte!14651 b1!97)) ((_ sign_extend 32) (currentBit!14646 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312864 () Bool)

(declare-fun e!225065 () Bool)

(declare-fun array_inv!7871 (array!19184) Bool)

(assert (=> b!312864 (= e!225065 (array_inv!7871 (buf!7932 b1!97)))))

(declare-fun b!312865 () Bool)

(declare-fun e!225066 () Bool)

(declare-fun b2!97 () BitStream!13742)

(assert (=> b!312865 (= e!225066 (array_inv!7871 (buf!7932 b2!97)))))

(declare-fun b!312866 () Bool)

(declare-fun res!256187 () Bool)

(assert (=> b!312866 (=> (not res!256187) (not e!225063))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312866 (= res!256187 (validate_offset_bits!1 ((_ sign_extend 32) (size!8319 (buf!7932 b1!97))) ((_ sign_extend 32) (currentByte!14651 b1!97)) ((_ sign_extend 32) (currentBit!14646 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312867 () Bool)

(declare-fun res!256185 () Bool)

(assert (=> b!312867 (=> (not res!256185) (not e!225063))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312867 (= res!256185 (bvsle (bitIndex!0 (size!8319 (buf!7932 b2!97)) (currentByte!14651 b2!97) (currentBit!14646 b2!97)) (bvadd (bitIndex!0 (size!8319 (buf!7932 b1!97)) (currentByte!14651 b1!97) (currentBit!14646 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!256186 () Bool)

(assert (=> start!69584 (=> (not res!256186) (not e!225063))))

(assert (=> start!69584 (= res!256186 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8319 (buf!7932 b1!97)) (size!8319 (buf!7932 b2!97)))))))

(assert (=> start!69584 e!225063))

(assert (=> start!69584 true))

(declare-fun inv!12 (BitStream!13742) Bool)

(assert (=> start!69584 (and (inv!12 b1!97) e!225065)))

(assert (=> start!69584 (and (inv!12 b2!97) e!225066)))

(assert (= (and start!69584 res!256186) b!312866))

(assert (= (and b!312866 res!256187) b!312867))

(assert (= (and b!312867 res!256185) b!312863))

(assert (= (and b!312863 res!256184) b!312862))

(assert (= start!69584 b!312864))

(assert (= start!69584 b!312865))

(declare-fun m!450481 () Bool)

(assert (=> b!312864 m!450481))

(declare-fun m!450483 () Bool)

(assert (=> start!69584 m!450483))

(declare-fun m!450485 () Bool)

(assert (=> start!69584 m!450485))

(declare-fun m!450487 () Bool)

(assert (=> b!312866 m!450487))

(declare-fun m!450489 () Bool)

(assert (=> b!312865 m!450489))

(declare-fun m!450491 () Bool)

(assert (=> b!312867 m!450491))

(declare-fun m!450493 () Bool)

(assert (=> b!312867 m!450493))

(declare-fun m!450495 () Bool)

(assert (=> b!312863 m!450495))

(push 1)

(assert (not b!312863))

(assert (not b!312864))

(assert (not start!69584))

(assert (not b!312865))

(assert (not b!312866))

(assert (not b!312867))

(check-sat)

(pop 1)

(push 1)

(check-sat)


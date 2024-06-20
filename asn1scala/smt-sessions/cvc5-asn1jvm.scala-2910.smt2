; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69580 () Bool)

(assert start!69580)

(declare-fun b!312826 () Bool)

(declare-fun e!225036 () Bool)

(declare-datatypes ((array!19180 0))(
  ( (array!19181 (arr!9397 (Array (_ BitVec 32) (_ BitVec 8))) (size!8317 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13738 0))(
  ( (BitStream!13739 (buf!7930 array!19180) (currentByte!14649 (_ BitVec 32)) (currentBit!14644 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13738)

(declare-fun array_inv!7869 (array!19180) Bool)

(assert (=> b!312826 (= e!225036 (array_inv!7869 (buf!7930 b2!97)))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1!97 () BitStream!13738)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b!312827 () Bool)

(declare-fun e!225033 () Bool)

(declare-fun lt!442055 () (_ BitVec 64))

(assert (=> b!312827 (= e!225033 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8317 (buf!7930 b1!97)))) lt!442055) b1ValidateOffsetBits!10) (let ((bdg!18630 (bvand lt!442055 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18630 (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18630 (bvand (bvadd lt!442055 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!312827 (= lt!442055 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14649 b1!97))) ((_ sign_extend 32) (currentBit!14644 b1!97))))))

(declare-fun b!312828 () Bool)

(declare-fun res!256160 () Bool)

(assert (=> b!312828 (=> (not res!256160) (not e!225033))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312828 (= res!256160 (validate_offset_bits!1 ((_ sign_extend 32) (size!8317 (buf!7930 b1!97))) ((_ sign_extend 32) (currentByte!14649 b1!97)) ((_ sign_extend 32) (currentBit!14644 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312829 () Bool)

(declare-fun res!256163 () Bool)

(assert (=> b!312829 (=> (not res!256163) (not e!225033))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312829 (= res!256163 (bvsle (bitIndex!0 (size!8317 (buf!7930 b2!97)) (currentByte!14649 b2!97) (currentBit!14644 b2!97)) (bvadd (bitIndex!0 (size!8317 (buf!7930 b1!97)) (currentByte!14649 b1!97) (currentBit!14644 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312830 () Bool)

(declare-fun e!225034 () Bool)

(assert (=> b!312830 (= e!225034 (array_inv!7869 (buf!7930 b1!97)))))

(declare-fun res!256161 () Bool)

(assert (=> start!69580 (=> (not res!256161) (not e!225033))))

(assert (=> start!69580 (= res!256161 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8317 (buf!7930 b1!97)) (size!8317 (buf!7930 b2!97)))))))

(assert (=> start!69580 e!225033))

(assert (=> start!69580 true))

(declare-fun inv!12 (BitStream!13738) Bool)

(assert (=> start!69580 (and (inv!12 b1!97) e!225034)))

(assert (=> start!69580 (and (inv!12 b2!97) e!225036)))

(declare-fun b!312831 () Bool)

(declare-fun res!256162 () Bool)

(assert (=> b!312831 (=> (not res!256162) (not e!225033))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312831 (= res!256162 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8317 (buf!7930 b1!97))) ((_ sign_extend 32) (currentByte!14649 b1!97)) ((_ sign_extend 32) (currentBit!14644 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69580 res!256161) b!312828))

(assert (= (and b!312828 res!256160) b!312829))

(assert (= (and b!312829 res!256163) b!312831))

(assert (= (and b!312831 res!256162) b!312827))

(assert (= start!69580 b!312830))

(assert (= start!69580 b!312826))

(declare-fun m!450449 () Bool)

(assert (=> b!312830 m!450449))

(declare-fun m!450451 () Bool)

(assert (=> b!312829 m!450451))

(declare-fun m!450453 () Bool)

(assert (=> b!312829 m!450453))

(declare-fun m!450455 () Bool)

(assert (=> start!69580 m!450455))

(declare-fun m!450457 () Bool)

(assert (=> start!69580 m!450457))

(declare-fun m!450459 () Bool)

(assert (=> b!312831 m!450459))

(declare-fun m!450461 () Bool)

(assert (=> b!312826 m!450461))

(declare-fun m!450463 () Bool)

(assert (=> b!312828 m!450463))

(push 1)

(assert (not b!312828))

(assert (not b!312830))

(assert (not b!312826))

(assert (not b!312831))

(assert (not b!312829))

(assert (not start!69580))

(check-sat)

(pop 1)

(push 1)

(check-sat)


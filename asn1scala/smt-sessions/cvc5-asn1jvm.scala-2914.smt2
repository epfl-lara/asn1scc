; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69604 () Bool)

(assert start!69604)

(declare-fun res!256305 () Bool)

(declare-fun e!225213 () Bool)

(assert (=> start!69604 (=> (not res!256305) (not e!225213))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19204 0))(
  ( (array!19205 (arr!9409 (Array (_ BitVec 32) (_ BitVec 8))) (size!8329 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13762 0))(
  ( (BitStream!13763 (buf!7942 array!19204) (currentByte!14661 (_ BitVec 32)) (currentBit!14656 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13762)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13762)

(assert (=> start!69604 (= res!256305 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8329 (buf!7942 b1!97)) (size!8329 (buf!7942 b2!97)))))))

(assert (=> start!69604 e!225213))

(assert (=> start!69604 true))

(declare-fun e!225217 () Bool)

(declare-fun inv!12 (BitStream!13762) Bool)

(assert (=> start!69604 (and (inv!12 b1!97) e!225217)))

(declare-fun e!225214 () Bool)

(assert (=> start!69604 (and (inv!12 b2!97) e!225214)))

(declare-fun b!313042 () Bool)

(declare-fun array_inv!7881 (array!19204) Bool)

(assert (=> b!313042 (= e!225217 (array_inv!7881 (buf!7942 b1!97)))))

(declare-fun b!313043 () Bool)

(declare-fun res!256306 () Bool)

(assert (=> b!313043 (=> (not res!256306) (not e!225213))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313043 (= res!256306 (validate_offset_bits!1 ((_ sign_extend 32) (size!8329 (buf!7942 b1!97))) ((_ sign_extend 32) (currentByte!14661 b1!97)) ((_ sign_extend 32) (currentBit!14656 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313044 () Bool)

(declare-fun res!256307 () Bool)

(assert (=> b!313044 (=> (not res!256307) (not e!225213))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313044 (= res!256307 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8329 (buf!7942 b1!97))) ((_ sign_extend 32) (currentByte!14661 b1!97)) ((_ sign_extend 32) (currentBit!14656 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313045 () Bool)

(assert (=> b!313045 (= e!225214 (array_inv!7881 (buf!7942 b2!97)))))

(declare-fun b!313046 () Bool)

(declare-fun res!256304 () Bool)

(assert (=> b!313046 (=> (not res!256304) (not e!225213))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313046 (= res!256304 (bvsle (bitIndex!0 (size!8329 (buf!7942 b2!97)) (currentByte!14661 b2!97) (currentBit!14656 b2!97)) (bvadd (bitIndex!0 (size!8329 (buf!7942 b1!97)) (currentByte!14661 b1!97) (currentBit!14656 b1!97)) advancedAtMostBits!9)))))

(declare-fun lt!442102 () (_ BitVec 64))

(declare-fun lt!442103 () (_ BitVec 64))

(declare-fun b!313047 () Bool)

(assert (=> b!313047 (= e!225213 (and (bvsge (bvsub lt!442103 lt!442102) b1ValidateOffsetBits!10) (let ((bdg!18641 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14661 b2!97))) ((_ sign_extend 32) (currentBit!14656 b2!97))))) (and (bvsle bdg!18641 (bvadd lt!442102 advancedAtMostBits!9)) (let ((bdg!18642 (bvand lt!442103 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!18642 (bvand bdg!18641 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!18642 (bvand (bvsub lt!442103 bdg!18641) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!313047 (= lt!442102 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14661 b1!97))) ((_ sign_extend 32) (currentBit!14656 b1!97))))))

(assert (=> b!313047 (= lt!442103 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8329 (buf!7942 b1!97)))))))

(assert (= (and start!69604 res!256305) b!313043))

(assert (= (and b!313043 res!256306) b!313046))

(assert (= (and b!313046 res!256304) b!313044))

(assert (= (and b!313044 res!256307) b!313047))

(assert (= start!69604 b!313042))

(assert (= start!69604 b!313045))

(declare-fun m!450641 () Bool)

(assert (=> b!313042 m!450641))

(declare-fun m!450643 () Bool)

(assert (=> b!313043 m!450643))

(declare-fun m!450645 () Bool)

(assert (=> start!69604 m!450645))

(declare-fun m!450647 () Bool)

(assert (=> start!69604 m!450647))

(declare-fun m!450649 () Bool)

(assert (=> b!313046 m!450649))

(declare-fun m!450651 () Bool)

(assert (=> b!313046 m!450651))

(declare-fun m!450653 () Bool)

(assert (=> b!313044 m!450653))

(declare-fun m!450655 () Bool)

(assert (=> b!313045 m!450655))

(push 1)

(assert (not b!313043))

(assert (not start!69604))

(assert (not b!313042))

(assert (not b!313046))

(assert (not b!313044))

(assert (not b!313045))

(check-sat)

(pop 1)

(push 1)

(check-sat)


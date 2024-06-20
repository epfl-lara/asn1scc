; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69592 () Bool)

(assert start!69592)

(declare-fun b!312934 () Bool)

(declare-fun res!256233 () Bool)

(declare-fun e!225125 () Bool)

(assert (=> b!312934 (=> (not res!256233) (not e!225125))))

(declare-datatypes ((array!19192 0))(
  ( (array!19193 (arr!9403 (Array (_ BitVec 32) (_ BitVec 8))) (size!8323 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13750 0))(
  ( (BitStream!13751 (buf!7936 array!19192) (currentByte!14655 (_ BitVec 32)) (currentBit!14650 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13750)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312934 (= res!256233 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8323 (buf!7936 b1!97))) ((_ sign_extend 32) (currentByte!14655 b1!97)) ((_ sign_extend 32) (currentBit!14650 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312935 () Bool)

(declare-fun e!225126 () Bool)

(declare-fun array_inv!7875 (array!19192) Bool)

(assert (=> b!312935 (= e!225126 (array_inv!7875 (buf!7936 b1!97)))))

(declare-fun res!256232 () Bool)

(assert (=> start!69592 (=> (not res!256232) (not e!225125))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13750)

(assert (=> start!69592 (= res!256232 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8323 (buf!7936 b1!97)) (size!8323 (buf!7936 b2!97)))))))

(assert (=> start!69592 e!225125))

(assert (=> start!69592 true))

(declare-fun inv!12 (BitStream!13750) Bool)

(assert (=> start!69592 (and (inv!12 b1!97) e!225126)))

(declare-fun e!225123 () Bool)

(assert (=> start!69592 (and (inv!12 b2!97) e!225123)))

(declare-fun b!312936 () Bool)

(declare-fun lt!442082 () (_ BitVec 64))

(assert (=> b!312936 (= e!225125 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8323 (buf!7936 b1!97)))) lt!442082) b1ValidateOffsetBits!10) (let ((bdg!18634 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14655 b2!97))))) (and (bvsle (bvadd bdg!18634 ((_ sign_extend 32) (currentBit!14650 b2!97))) (bvadd lt!442082 advancedAtMostBits!9)) (not (= ((_ sign_extend 32) (currentByte!14655 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18634 ((_ sign_extend 32) (currentByte!14655 b2!97)))))))))))

(assert (=> b!312936 (= lt!442082 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14655 b1!97))) ((_ sign_extend 32) (currentBit!14650 b1!97))))))

(declare-fun b!312937 () Bool)

(declare-fun res!256234 () Bool)

(assert (=> b!312937 (=> (not res!256234) (not e!225125))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312937 (= res!256234 (validate_offset_bits!1 ((_ sign_extend 32) (size!8323 (buf!7936 b1!97))) ((_ sign_extend 32) (currentByte!14655 b1!97)) ((_ sign_extend 32) (currentBit!14650 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312938 () Bool)

(declare-fun res!256235 () Bool)

(assert (=> b!312938 (=> (not res!256235) (not e!225125))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312938 (= res!256235 (bvsle (bitIndex!0 (size!8323 (buf!7936 b2!97)) (currentByte!14655 b2!97) (currentBit!14650 b2!97)) (bvadd (bitIndex!0 (size!8323 (buf!7936 b1!97)) (currentByte!14655 b1!97) (currentBit!14650 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312939 () Bool)

(assert (=> b!312939 (= e!225123 (array_inv!7875 (buf!7936 b2!97)))))

(assert (= (and start!69592 res!256232) b!312937))

(assert (= (and b!312937 res!256234) b!312938))

(assert (= (and b!312938 res!256235) b!312934))

(assert (= (and b!312934 res!256233) b!312936))

(assert (= start!69592 b!312935))

(assert (= start!69592 b!312939))

(declare-fun m!450545 () Bool)

(assert (=> b!312938 m!450545))

(declare-fun m!450547 () Bool)

(assert (=> b!312938 m!450547))

(declare-fun m!450549 () Bool)

(assert (=> b!312937 m!450549))

(declare-fun m!450551 () Bool)

(assert (=> start!69592 m!450551))

(declare-fun m!450553 () Bool)

(assert (=> start!69592 m!450553))

(declare-fun m!450555 () Bool)

(assert (=> b!312939 m!450555))

(declare-fun m!450557 () Bool)

(assert (=> b!312934 m!450557))

(declare-fun m!450559 () Bool)

(assert (=> b!312935 m!450559))

(push 1)

(assert (not b!312935))

(assert (not b!312937))

(assert (not b!312938))

(assert (not b!312939))

(assert (not b!312934))

(assert (not start!69592))

(check-sat)

(pop 1)

(push 1)

(check-sat)


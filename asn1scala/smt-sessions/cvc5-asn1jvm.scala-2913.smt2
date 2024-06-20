; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69598 () Bool)

(assert start!69598)

(declare-fun b!312988 () Bool)

(declare-fun e!225168 () Bool)

(declare-datatypes ((array!19198 0))(
  ( (array!19199 (arr!9406 (Array (_ BitVec 32) (_ BitVec 8))) (size!8326 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13756 0))(
  ( (BitStream!13757 (buf!7939 array!19198) (currentByte!14658 (_ BitVec 32)) (currentBit!14653 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13756)

(declare-fun array_inv!7878 (array!19198) Bool)

(assert (=> b!312988 (= e!225168 (array_inv!7878 (buf!7939 b1!97)))))

(declare-fun b!312989 () Bool)

(declare-fun res!256271 () Bool)

(declare-fun e!225172 () Bool)

(assert (=> b!312989 (=> (not res!256271) (not e!225172))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312989 (= res!256271 (validate_offset_bits!1 ((_ sign_extend 32) (size!8326 (buf!7939 b1!97))) ((_ sign_extend 32) (currentByte!14658 b1!97)) ((_ sign_extend 32) (currentBit!14653 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312990 () Bool)

(declare-fun res!256268 () Bool)

(assert (=> b!312990 (=> (not res!256268) (not e!225172))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13756)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312990 (= res!256268 (bvsle (bitIndex!0 (size!8326 (buf!7939 b2!97)) (currentByte!14658 b2!97) (currentBit!14653 b2!97)) (bvadd (bitIndex!0 (size!8326 (buf!7939 b1!97)) (currentByte!14658 b1!97) (currentBit!14653 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!256269 () Bool)

(assert (=> start!69598 (=> (not res!256269) (not e!225172))))

(assert (=> start!69598 (= res!256269 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8326 (buf!7939 b1!97)) (size!8326 (buf!7939 b2!97)))))))

(assert (=> start!69598 e!225172))

(assert (=> start!69598 true))

(declare-fun inv!12 (BitStream!13756) Bool)

(assert (=> start!69598 (and (inv!12 b1!97) e!225168)))

(declare-fun e!225171 () Bool)

(assert (=> start!69598 (and (inv!12 b2!97) e!225171)))

(declare-fun b!312991 () Bool)

(declare-fun res!256270 () Bool)

(assert (=> b!312991 (=> (not res!256270) (not e!225172))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312991 (= res!256270 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8326 (buf!7939 b1!97))) ((_ sign_extend 32) (currentByte!14658 b1!97)) ((_ sign_extend 32) (currentBit!14653 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312992 () Bool)

(assert (=> b!312992 (= e!225171 (array_inv!7878 (buf!7939 b2!97)))))

(declare-fun lt!442091 () (_ BitVec 64))

(declare-fun b!312993 () Bool)

(assert (=> b!312993 (= e!225172 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8326 (buf!7939 b1!97)))) lt!442091) b1ValidateOffsetBits!10) (let ((bdg!18636 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14658 b2!97))))) (let ((bdg!18637 (bvadd bdg!18636 ((_ sign_extend 32) (currentBit!14653 b2!97))))) (and (bvsle bdg!18637 (bvadd lt!442091 advancedAtMostBits!9)) (let ((bdg!18638 (bvand bdg!18636 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18638 (bvand ((_ sign_extend 32) (currentBit!14653 b2!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18638 (bvand bdg!18637 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!312993 (= lt!442091 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14658 b1!97))) ((_ sign_extend 32) (currentBit!14653 b1!97))))))

(assert (= (and start!69598 res!256269) b!312989))

(assert (= (and b!312989 res!256271) b!312990))

(assert (= (and b!312990 res!256268) b!312991))

(assert (= (and b!312991 res!256270) b!312993))

(assert (= start!69598 b!312988))

(assert (= start!69598 b!312992))

(declare-fun m!450593 () Bool)

(assert (=> b!312989 m!450593))

(declare-fun m!450595 () Bool)

(assert (=> b!312991 m!450595))

(declare-fun m!450597 () Bool)

(assert (=> b!312992 m!450597))

(declare-fun m!450599 () Bool)

(assert (=> b!312988 m!450599))

(declare-fun m!450601 () Bool)

(assert (=> b!312990 m!450601))

(declare-fun m!450603 () Bool)

(assert (=> b!312990 m!450603))

(declare-fun m!450605 () Bool)

(assert (=> start!69598 m!450605))

(declare-fun m!450607 () Bool)

(assert (=> start!69598 m!450607))

(push 1)

(assert (not b!312992))

(assert (not b!312990))

(assert (not b!312988))

(assert (not b!312989))

(assert (not start!69598))

(assert (not b!312991))

(check-sat)

(pop 1)

(push 1)

(check-sat)


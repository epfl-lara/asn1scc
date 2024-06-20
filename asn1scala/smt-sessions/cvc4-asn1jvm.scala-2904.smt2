; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69548 () Bool)

(assert start!69548)

(declare-fun b!312538 () Bool)

(declare-fun res!255968 () Bool)

(declare-fun e!224796 () Bool)

(assert (=> b!312538 (=> (not res!255968) (not e!224796))))

(declare-datatypes ((array!19148 0))(
  ( (array!19149 (arr!9381 (Array (_ BitVec 32) (_ BitVec 8))) (size!8301 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13706 0))(
  ( (BitStream!13707 (buf!7914 array!19148) (currentByte!14633 (_ BitVec 32)) (currentBit!14628 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13706)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312538 (= res!255968 (validate_offset_bits!1 ((_ sign_extend 32) (size!8301 (buf!7914 b1!97))) ((_ sign_extend 32) (currentByte!14633 b1!97)) ((_ sign_extend 32) (currentBit!14628 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312539 () Bool)

(declare-fun res!255969 () Bool)

(assert (=> b!312539 (=> (not res!255969) (not e!224796))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312539 (= res!255969 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8301 (buf!7914 b1!97))) ((_ sign_extend 32) (currentByte!14633 b1!97)) ((_ sign_extend 32) (currentBit!14628 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun lt!441998 () (_ BitVec 64))

(declare-fun lt!441997 () (_ BitVec 64))

(declare-fun b!312540 () Bool)

(assert (=> b!312540 (= e!224796 (and (= lt!441998 (bvand ((_ sign_extend 32) (currentBit!14628 b1!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!441998 (bvand (bvadd lt!441997 ((_ sign_extend 32) (currentBit!14628 b1!97))) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312540 (= lt!441998 (bvand lt!441997 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312540 (= lt!441997 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14633 b1!97))))))

(declare-fun res!255971 () Bool)

(assert (=> start!69548 (=> (not res!255971) (not e!224796))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13706)

(assert (=> start!69548 (= res!255971 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8301 (buf!7914 b1!97)) (size!8301 (buf!7914 b2!97)))))))

(assert (=> start!69548 e!224796))

(assert (=> start!69548 true))

(declare-fun e!224795 () Bool)

(declare-fun inv!12 (BitStream!13706) Bool)

(assert (=> start!69548 (and (inv!12 b1!97) e!224795)))

(declare-fun e!224793 () Bool)

(assert (=> start!69548 (and (inv!12 b2!97) e!224793)))

(declare-fun b!312541 () Bool)

(declare-fun res!255970 () Bool)

(assert (=> b!312541 (=> (not res!255970) (not e!224796))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312541 (= res!255970 (bvsle (bitIndex!0 (size!8301 (buf!7914 b2!97)) (currentByte!14633 b2!97) (currentBit!14628 b2!97)) (bvadd (bitIndex!0 (size!8301 (buf!7914 b1!97)) (currentByte!14633 b1!97) (currentBit!14628 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312542 () Bool)

(declare-fun array_inv!7853 (array!19148) Bool)

(assert (=> b!312542 (= e!224793 (array_inv!7853 (buf!7914 b2!97)))))

(declare-fun b!312543 () Bool)

(assert (=> b!312543 (= e!224795 (array_inv!7853 (buf!7914 b1!97)))))

(assert (= (and start!69548 res!255971) b!312538))

(assert (= (and b!312538 res!255968) b!312541))

(assert (= (and b!312541 res!255970) b!312539))

(assert (= (and b!312539 res!255969) b!312540))

(assert (= start!69548 b!312543))

(assert (= start!69548 b!312542))

(declare-fun m!450193 () Bool)

(assert (=> b!312539 m!450193))

(declare-fun m!450195 () Bool)

(assert (=> b!312542 m!450195))

(declare-fun m!450197 () Bool)

(assert (=> b!312541 m!450197))

(declare-fun m!450199 () Bool)

(assert (=> b!312541 m!450199))

(declare-fun m!450201 () Bool)

(assert (=> b!312543 m!450201))

(declare-fun m!450203 () Bool)

(assert (=> start!69548 m!450203))

(declare-fun m!450205 () Bool)

(assert (=> start!69548 m!450205))

(declare-fun m!450207 () Bool)

(assert (=> b!312538 m!450207))

(push 1)

(assert (not b!312543))

(assert (not start!69548))

(assert (not b!312538))

(assert (not b!312541))

(assert (not b!312542))

(assert (not b!312539))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69578 () Bool)

(assert start!69578)

(declare-fun b!312808 () Bool)

(declare-fun e!225020 () Bool)

(declare-datatypes ((array!19178 0))(
  ( (array!19179 (arr!9396 (Array (_ BitVec 32) (_ BitVec 8))) (size!8316 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13736 0))(
  ( (BitStream!13737 (buf!7929 array!19178) (currentByte!14648 (_ BitVec 32)) (currentBit!14643 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13736)

(declare-fun array_inv!7868 (array!19178) Bool)

(assert (=> b!312808 (= e!225020 (array_inv!7868 (buf!7929 b2!97)))))

(declare-fun b!312809 () Bool)

(declare-fun res!256149 () Bool)

(declare-fun e!225021 () Bool)

(assert (=> b!312809 (=> (not res!256149) (not e!225021))))

(declare-fun b1!97 () BitStream!13736)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312809 (= res!256149 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8316 (buf!7929 b1!97))) ((_ sign_extend 32) (currentByte!14648 b1!97)) ((_ sign_extend 32) (currentBit!14643 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!256150 () Bool)

(assert (=> start!69578 (=> (not res!256150) (not e!225021))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69578 (= res!256150 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8316 (buf!7929 b1!97)) (size!8316 (buf!7929 b2!97)))))))

(assert (=> start!69578 e!225021))

(assert (=> start!69578 true))

(declare-fun e!225018 () Bool)

(declare-fun inv!12 (BitStream!13736) Bool)

(assert (=> start!69578 (and (inv!12 b1!97) e!225018)))

(assert (=> start!69578 (and (inv!12 b2!97) e!225020)))

(declare-fun b!312810 () Bool)

(declare-fun res!256148 () Bool)

(assert (=> b!312810 (=> (not res!256148) (not e!225021))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312810 (= res!256148 (validate_offset_bits!1 ((_ sign_extend 32) (size!8316 (buf!7929 b1!97))) ((_ sign_extend 32) (currentByte!14648 b1!97)) ((_ sign_extend 32) (currentBit!14643 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312811 () Bool)

(declare-fun res!256151 () Bool)

(assert (=> b!312811 (=> (not res!256151) (not e!225021))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312811 (= res!256151 (bvsle (bitIndex!0 (size!8316 (buf!7929 b2!97)) (currentByte!14648 b2!97) (currentBit!14643 b2!97)) (bvadd (bitIndex!0 (size!8316 (buf!7929 b1!97)) (currentByte!14648 b1!97) (currentBit!14643 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312812 () Bool)

(assert (=> b!312812 (= e!225018 (array_inv!7868 (buf!7929 b1!97)))))

(declare-fun lt!442052 () (_ BitVec 64))

(declare-fun b!312813 () Bool)

(declare-fun lt!442051 () (_ BitVec 64))

(assert (=> b!312813 (= e!225021 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8316 (buf!7929 b1!97)))) lt!442051) b1ValidateOffsetBits!10) (let ((bdg!18628 (bvand lt!442052 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18628 (bvand ((_ sign_extend 32) (currentBit!14643 b1!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18628 (bvand lt!442051 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!312813 (= lt!442051 (bvadd lt!442052 ((_ sign_extend 32) (currentBit!14643 b1!97))))))

(assert (=> b!312813 (= lt!442052 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14648 b1!97))))))

(assert (= (and start!69578 res!256150) b!312810))

(assert (= (and b!312810 res!256148) b!312811))

(assert (= (and b!312811 res!256151) b!312809))

(assert (= (and b!312809 res!256149) b!312813))

(assert (= start!69578 b!312812))

(assert (= start!69578 b!312808))

(declare-fun m!450433 () Bool)

(assert (=> start!69578 m!450433))

(declare-fun m!450435 () Bool)

(assert (=> start!69578 m!450435))

(declare-fun m!450437 () Bool)

(assert (=> b!312809 m!450437))

(declare-fun m!450439 () Bool)

(assert (=> b!312812 m!450439))

(declare-fun m!450441 () Bool)

(assert (=> b!312811 m!450441))

(declare-fun m!450443 () Bool)

(assert (=> b!312811 m!450443))

(declare-fun m!450445 () Bool)

(assert (=> b!312810 m!450445))

(declare-fun m!450447 () Bool)

(assert (=> b!312808 m!450447))

(push 1)

(assert (not b!312810))

(assert (not start!69578))

(assert (not b!312811))

(assert (not b!312809))

(assert (not b!312808))

(assert (not b!312812))

(check-sat)

(pop 1)

(push 1)

(check-sat)


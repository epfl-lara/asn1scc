; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69574 () Bool)

(assert start!69574)

(declare-fun b!312772 () Bool)

(declare-fun res!256125 () Bool)

(declare-fun e!224992 () Bool)

(assert (=> b!312772 (=> (not res!256125) (not e!224992))))

(declare-datatypes ((array!19174 0))(
  ( (array!19175 (arr!9394 (Array (_ BitVec 32) (_ BitVec 8))) (size!8314 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13732 0))(
  ( (BitStream!13733 (buf!7927 array!19174) (currentByte!14646 (_ BitVec 32)) (currentBit!14641 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13732)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312772 (= res!256125 (validate_offset_bits!1 ((_ sign_extend 32) (size!8314 (buf!7927 b1!97))) ((_ sign_extend 32) (currentByte!14646 b1!97)) ((_ sign_extend 32) (currentBit!14641 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!256126 () Bool)

(assert (=> start!69574 (=> (not res!256126) (not e!224992))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13732)

(assert (=> start!69574 (= res!256126 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8314 (buf!7927 b1!97)) (size!8314 (buf!7927 b2!97)))))))

(assert (=> start!69574 e!224992))

(assert (=> start!69574 true))

(declare-fun e!224990 () Bool)

(declare-fun inv!12 (BitStream!13732) Bool)

(assert (=> start!69574 (and (inv!12 b1!97) e!224990)))

(declare-fun e!224988 () Bool)

(assert (=> start!69574 (and (inv!12 b2!97) e!224988)))

(declare-fun b!312773 () Bool)

(declare-fun res!256127 () Bool)

(assert (=> b!312773 (=> (not res!256127) (not e!224992))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312773 (= res!256127 (bvsle (bitIndex!0 (size!8314 (buf!7927 b2!97)) (currentByte!14646 b2!97) (currentBit!14641 b2!97)) (bvadd (bitIndex!0 (size!8314 (buf!7927 b1!97)) (currentByte!14646 b1!97) (currentBit!14641 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312774 () Bool)

(declare-fun res!256124 () Bool)

(assert (=> b!312774 (=> (not res!256124) (not e!224992))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312774 (= res!256124 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8314 (buf!7927 b1!97))) ((_ sign_extend 32) (currentByte!14646 b1!97)) ((_ sign_extend 32) (currentBit!14641 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312775 () Bool)

(declare-fun array_inv!7866 (array!19174) Bool)

(assert (=> b!312775 (= e!224990 (array_inv!7866 (buf!7927 b1!97)))))

(declare-fun b!312776 () Bool)

(assert (=> b!312776 (= e!224988 (array_inv!7866 (buf!7927 b2!97)))))

(declare-fun b!312777 () Bool)

(declare-fun lt!442040 () (_ BitVec 64))

(declare-fun lt!442039 () (_ BitVec 64))

(assert (=> b!312777 (= e!224992 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8314 (buf!7927 b1!97)))) lt!442039) b1ValidateOffsetBits!10) (let ((bdg!18628 (bvand lt!442040 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18628 (bvand ((_ sign_extend 32) (currentBit!14641 b1!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18628 (bvand lt!442039 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!312777 (= lt!442039 (bvadd lt!442040 ((_ sign_extend 32) (currentBit!14641 b1!97))))))

(assert (=> b!312777 (= lt!442040 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14646 b1!97))))))

(assert (= (and start!69574 res!256126) b!312772))

(assert (= (and b!312772 res!256125) b!312773))

(assert (= (and b!312773 res!256127) b!312774))

(assert (= (and b!312774 res!256124) b!312777))

(assert (= start!69574 b!312775))

(assert (= start!69574 b!312776))

(declare-fun m!450401 () Bool)

(assert (=> b!312776 m!450401))

(declare-fun m!450403 () Bool)

(assert (=> start!69574 m!450403))

(declare-fun m!450405 () Bool)

(assert (=> start!69574 m!450405))

(declare-fun m!450407 () Bool)

(assert (=> b!312775 m!450407))

(declare-fun m!450409 () Bool)

(assert (=> b!312773 m!450409))

(declare-fun m!450411 () Bool)

(assert (=> b!312773 m!450411))

(declare-fun m!450413 () Bool)

(assert (=> b!312772 m!450413))

(declare-fun m!450415 () Bool)

(assert (=> b!312774 m!450415))

(push 1)

(assert (not b!312776))

(assert (not b!312773))

(assert (not b!312772))

(assert (not b!312774))

(assert (not b!312775))

(assert (not start!69574))

(check-sat)

(pop 1)

(push 1)

(check-sat)


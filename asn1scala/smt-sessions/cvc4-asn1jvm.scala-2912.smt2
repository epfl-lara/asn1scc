; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69596 () Bool)

(assert start!69596)

(declare-fun b!312970 () Bool)

(declare-fun e!225157 () Bool)

(declare-datatypes ((array!19196 0))(
  ( (array!19197 (arr!9405 (Array (_ BitVec 32) (_ BitVec 8))) (size!8325 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13754 0))(
  ( (BitStream!13755 (buf!7938 array!19196) (currentByte!14657 (_ BitVec 32)) (currentBit!14652 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13754)

(declare-fun array_inv!7877 (array!19196) Bool)

(assert (=> b!312970 (= e!225157 (array_inv!7877 (buf!7938 b2!97)))))

(declare-fun b!312971 () Bool)

(declare-fun res!256256 () Bool)

(declare-fun e!225156 () Bool)

(assert (=> b!312971 (=> (not res!256256) (not e!225156))))

(declare-fun b1!97 () BitStream!13754)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312971 (= res!256256 (validate_offset_bits!1 ((_ sign_extend 32) (size!8325 (buf!7938 b1!97))) ((_ sign_extend 32) (currentByte!14657 b1!97)) ((_ sign_extend 32) (currentBit!14652 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!256258 () Bool)

(assert (=> start!69596 (=> (not res!256258) (not e!225156))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69596 (= res!256258 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8325 (buf!7938 b1!97)) (size!8325 (buf!7938 b2!97)))))))

(assert (=> start!69596 e!225156))

(assert (=> start!69596 true))

(declare-fun e!225154 () Bool)

(declare-fun inv!12 (BitStream!13754) Bool)

(assert (=> start!69596 (and (inv!12 b1!97) e!225154)))

(assert (=> start!69596 (and (inv!12 b2!97) e!225157)))

(declare-fun lt!442088 () (_ BitVec 64))

(declare-fun b!312972 () Bool)

(assert (=> b!312972 (= e!225156 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8325 (buf!7938 b1!97)))) lt!442088) b1ValidateOffsetBits!10) (let ((bdg!18634 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14657 b2!97))))) (and (bvsle (bvadd bdg!18634 ((_ sign_extend 32) (currentBit!14652 b2!97))) (bvadd lt!442088 advancedAtMostBits!9)) (not (= ((_ sign_extend 32) (currentByte!14657 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18634 ((_ sign_extend 32) (currentByte!14657 b2!97)))))))))))

(assert (=> b!312972 (= lt!442088 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14657 b1!97))) ((_ sign_extend 32) (currentBit!14652 b1!97))))))

(declare-fun b!312973 () Bool)

(declare-fun res!256259 () Bool)

(assert (=> b!312973 (=> (not res!256259) (not e!225156))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312973 (= res!256259 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8325 (buf!7938 b1!97))) ((_ sign_extend 32) (currentByte!14657 b1!97)) ((_ sign_extend 32) (currentBit!14652 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312974 () Bool)

(assert (=> b!312974 (= e!225154 (array_inv!7877 (buf!7938 b1!97)))))

(declare-fun b!312975 () Bool)

(declare-fun res!256257 () Bool)

(assert (=> b!312975 (=> (not res!256257) (not e!225156))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312975 (= res!256257 (bvsle (bitIndex!0 (size!8325 (buf!7938 b2!97)) (currentByte!14657 b2!97) (currentBit!14652 b2!97)) (bvadd (bitIndex!0 (size!8325 (buf!7938 b1!97)) (currentByte!14657 b1!97) (currentBit!14652 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69596 res!256258) b!312971))

(assert (= (and b!312971 res!256256) b!312975))

(assert (= (and b!312975 res!256257) b!312973))

(assert (= (and b!312973 res!256259) b!312972))

(assert (= start!69596 b!312974))

(assert (= start!69596 b!312970))

(declare-fun m!450577 () Bool)

(assert (=> b!312973 m!450577))

(declare-fun m!450579 () Bool)

(assert (=> b!312971 m!450579))

(declare-fun m!450581 () Bool)

(assert (=> b!312974 m!450581))

(declare-fun m!450583 () Bool)

(assert (=> start!69596 m!450583))

(declare-fun m!450585 () Bool)

(assert (=> start!69596 m!450585))

(declare-fun m!450587 () Bool)

(assert (=> b!312970 m!450587))

(declare-fun m!450589 () Bool)

(assert (=> b!312975 m!450589))

(declare-fun m!450591 () Bool)

(assert (=> b!312975 m!450591))

(push 1)

(assert (not start!69596))

(assert (not b!312970))

(assert (not b!312971))

(assert (not b!312975))

(assert (not b!312974))

(assert (not b!312973))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


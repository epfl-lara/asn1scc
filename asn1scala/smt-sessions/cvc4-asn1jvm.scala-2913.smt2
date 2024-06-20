; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69602 () Bool)

(assert start!69602)

(declare-fun b!313024 () Bool)

(declare-fun res!256295 () Bool)

(declare-fun e!225199 () Bool)

(assert (=> b!313024 (=> (not res!256295) (not e!225199))))

(declare-datatypes ((array!19202 0))(
  ( (array!19203 (arr!9408 (Array (_ BitVec 32) (_ BitVec 8))) (size!8328 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13760 0))(
  ( (BitStream!13761 (buf!7941 array!19202) (currentByte!14660 (_ BitVec 32)) (currentBit!14655 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13760)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313024 (= res!256295 (validate_offset_bits!1 ((_ sign_extend 32) (size!8328 (buf!7941 b1!97))) ((_ sign_extend 32) (currentByte!14660 b1!97)) ((_ sign_extend 32) (currentBit!14655 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313025 () Bool)

(declare-fun res!256292 () Bool)

(assert (=> b!313025 (=> (not res!256292) (not e!225199))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13760)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313025 (= res!256292 (bvsle (bitIndex!0 (size!8328 (buf!7941 b2!97)) (currentByte!14660 b2!97) (currentBit!14655 b2!97)) (bvadd (bitIndex!0 (size!8328 (buf!7941 b1!97)) (currentByte!14660 b1!97) (currentBit!14655 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313026 () Bool)

(declare-fun e!225201 () Bool)

(declare-fun array_inv!7880 (array!19202) Bool)

(assert (=> b!313026 (= e!225201 (array_inv!7880 (buf!7941 b2!97)))))

(declare-fun res!256293 () Bool)

(assert (=> start!69602 (=> (not res!256293) (not e!225199))))

(assert (=> start!69602 (= res!256293 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8328 (buf!7941 b1!97)) (size!8328 (buf!7941 b2!97)))))))

(assert (=> start!69602 e!225199))

(assert (=> start!69602 true))

(declare-fun e!225198 () Bool)

(declare-fun inv!12 (BitStream!13760) Bool)

(assert (=> start!69602 (and (inv!12 b1!97) e!225198)))

(assert (=> start!69602 (and (inv!12 b2!97) e!225201)))

(declare-fun b!313027 () Bool)

(assert (=> b!313027 (= e!225198 (array_inv!7880 (buf!7941 b1!97)))))

(declare-fun b!313028 () Bool)

(declare-fun res!256294 () Bool)

(assert (=> b!313028 (=> (not res!256294) (not e!225199))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313028 (= res!256294 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8328 (buf!7941 b1!97))) ((_ sign_extend 32) (currentByte!14660 b1!97)) ((_ sign_extend 32) (currentBit!14655 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313029 () Bool)

(declare-fun lt!442097 () (_ BitVec 64))

(assert (=> b!313029 (= e!225199 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8328 (buf!7941 b1!97)))) lt!442097) b1ValidateOffsetBits!10) (let ((bdg!18636 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14660 b2!97))))) (let ((bdg!18637 (bvadd bdg!18636 ((_ sign_extend 32) (currentBit!14655 b2!97))))) (and (bvsle bdg!18637 (bvadd lt!442097 advancedAtMostBits!9)) (let ((bdg!18638 (bvand bdg!18636 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18638 (bvand ((_ sign_extend 32) (currentBit!14655 b2!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18638 (bvand bdg!18637 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!313029 (= lt!442097 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14660 b1!97))) ((_ sign_extend 32) (currentBit!14655 b1!97))))))

(assert (= (and start!69602 res!256293) b!313024))

(assert (= (and b!313024 res!256295) b!313025))

(assert (= (and b!313025 res!256292) b!313028))

(assert (= (and b!313028 res!256294) b!313029))

(assert (= start!69602 b!313027))

(assert (= start!69602 b!313026))

(declare-fun m!450625 () Bool)

(assert (=> start!69602 m!450625))

(declare-fun m!450627 () Bool)

(assert (=> start!69602 m!450627))

(declare-fun m!450629 () Bool)

(assert (=> b!313028 m!450629))

(declare-fun m!450631 () Bool)

(assert (=> b!313027 m!450631))

(declare-fun m!450633 () Bool)

(assert (=> b!313025 m!450633))

(declare-fun m!450635 () Bool)

(assert (=> b!313025 m!450635))

(declare-fun m!450637 () Bool)

(assert (=> b!313026 m!450637))

(declare-fun m!450639 () Bool)

(assert (=> b!313024 m!450639))

(push 1)

(assert (not b!313028))

(assert (not b!313025))

(assert (not start!69602))

(assert (not b!313024))

(assert (not b!313027))

(assert (not b!313026))

(check-sat)

(pop 1)

(push 1)

(check-sat)


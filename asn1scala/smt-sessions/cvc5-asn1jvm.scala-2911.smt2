; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69586 () Bool)

(assert start!69586)

(declare-fun b!312880 () Bool)

(declare-fun e!225082 () Bool)

(declare-datatypes ((array!19186 0))(
  ( (array!19187 (arr!9400 (Array (_ BitVec 32) (_ BitVec 8))) (size!8320 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13744 0))(
  ( (BitStream!13745 (buf!7933 array!19186) (currentByte!14652 (_ BitVec 32)) (currentBit!14647 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13744)

(declare-fun array_inv!7872 (array!19186) Bool)

(assert (=> b!312880 (= e!225082 (array_inv!7872 (buf!7933 b1!97)))))

(declare-fun b!312881 () Bool)

(declare-fun res!256199 () Bool)

(declare-fun e!225080 () Bool)

(assert (=> b!312881 (=> (not res!256199) (not e!225080))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13744)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312881 (= res!256199 (bvsle (bitIndex!0 (size!8320 (buf!7933 b2!97)) (currentByte!14652 b2!97) (currentBit!14647 b2!97)) (bvadd (bitIndex!0 (size!8320 (buf!7933 b1!97)) (currentByte!14652 b1!97) (currentBit!14647 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312882 () Bool)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun lt!442067 () (_ BitVec 64))

(declare-fun lt!442066 () (_ BitVec 64))

(assert (=> b!312882 (= e!225080 (and (bvsge (bvsub lt!442066 lt!442067) b1ValidateOffsetBits!10) (bvsle (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14652 b2!97))) ((_ sign_extend 32) (currentBit!14647 b2!97))) (bvadd lt!442067 advancedAtMostBits!9)) (not (= ((_ sign_extend 32) (size!8320 (buf!7933 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!442066 ((_ sign_extend 32) (size!8320 (buf!7933 b1!97))))))))))

(assert (=> b!312882 (= lt!442067 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14652 b1!97))) ((_ sign_extend 32) (currentBit!14647 b1!97))))))

(assert (=> b!312882 (= lt!442066 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8320 (buf!7933 b1!97)))))))

(declare-fun b!312883 () Bool)

(declare-fun e!225079 () Bool)

(assert (=> b!312883 (= e!225079 (array_inv!7872 (buf!7933 b2!97)))))

(declare-fun res!256198 () Bool)

(assert (=> start!69586 (=> (not res!256198) (not e!225080))))

(assert (=> start!69586 (= res!256198 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8320 (buf!7933 b1!97)) (size!8320 (buf!7933 b2!97)))))))

(assert (=> start!69586 e!225080))

(assert (=> start!69586 true))

(declare-fun inv!12 (BitStream!13744) Bool)

(assert (=> start!69586 (and (inv!12 b1!97) e!225082)))

(assert (=> start!69586 (and (inv!12 b2!97) e!225079)))

(declare-fun b!312884 () Bool)

(declare-fun res!256197 () Bool)

(assert (=> b!312884 (=> (not res!256197) (not e!225080))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312884 (= res!256197 (validate_offset_bits!1 ((_ sign_extend 32) (size!8320 (buf!7933 b1!97))) ((_ sign_extend 32) (currentByte!14652 b1!97)) ((_ sign_extend 32) (currentBit!14647 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312885 () Bool)

(declare-fun res!256196 () Bool)

(assert (=> b!312885 (=> (not res!256196) (not e!225080))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312885 (= res!256196 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8320 (buf!7933 b1!97))) ((_ sign_extend 32) (currentByte!14652 b1!97)) ((_ sign_extend 32) (currentBit!14647 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69586 res!256198) b!312884))

(assert (= (and b!312884 res!256197) b!312881))

(assert (= (and b!312881 res!256199) b!312885))

(assert (= (and b!312885 res!256196) b!312882))

(assert (= start!69586 b!312880))

(assert (= start!69586 b!312883))

(declare-fun m!450497 () Bool)

(assert (=> start!69586 m!450497))

(declare-fun m!450499 () Bool)

(assert (=> start!69586 m!450499))

(declare-fun m!450501 () Bool)

(assert (=> b!312885 m!450501))

(declare-fun m!450503 () Bool)

(assert (=> b!312884 m!450503))

(declare-fun m!450505 () Bool)

(assert (=> b!312883 m!450505))

(declare-fun m!450507 () Bool)

(assert (=> b!312880 m!450507))

(declare-fun m!450509 () Bool)

(assert (=> b!312881 m!450509))

(declare-fun m!450511 () Bool)

(assert (=> b!312881 m!450511))

(push 1)

(assert (not b!312883))

(assert (not b!312884))

(assert (not b!312880))

(assert (not b!312885))

(assert (not start!69586))

(assert (not b!312881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


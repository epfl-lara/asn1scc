; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69538 () Bool)

(assert start!69538)

(declare-fun b!312448 () Bool)

(declare-fun e!224722 () Bool)

(declare-datatypes ((array!19138 0))(
  ( (array!19139 (arr!9376 (Array (_ BitVec 32) (_ BitVec 8))) (size!8296 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13696 0))(
  ( (BitStream!13697 (buf!7909 array!19138) (currentByte!14628 (_ BitVec 32)) (currentBit!14623 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13696)

(declare-fun array_inv!7848 (array!19138) Bool)

(assert (=> b!312448 (= e!224722 (array_inv!7848 (buf!7909 b2!97)))))

(declare-fun res!255908 () Bool)

(declare-fun e!224720 () Bool)

(assert (=> start!69538 (=> (not res!255908) (not e!224720))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1!97 () BitStream!13696)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69538 (= res!255908 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8296 (buf!7909 b1!97)) (size!8296 (buf!7909 b2!97)))))))

(assert (=> start!69538 e!224720))

(assert (=> start!69538 true))

(declare-fun e!224721 () Bool)

(declare-fun inv!12 (BitStream!13696) Bool)

(assert (=> start!69538 (and (inv!12 b1!97) e!224721)))

(assert (=> start!69538 (and (inv!12 b2!97) e!224722)))

(declare-fun b!312449 () Bool)

(declare-fun res!255910 () Bool)

(assert (=> b!312449 (=> (not res!255910) (not e!224720))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312449 (= res!255910 (validate_offset_bits!1 ((_ sign_extend 32) (size!8296 (buf!7909 b1!97))) ((_ sign_extend 32) (currentByte!14628 b1!97)) ((_ sign_extend 32) (currentBit!14623 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312450 () Bool)

(declare-fun res!255911 () Bool)

(assert (=> b!312450 (=> (not res!255911) (not e!224720))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312450 (= res!255911 (bvsle (bitIndex!0 (size!8296 (buf!7909 b2!97)) (currentByte!14628 b2!97) (currentBit!14623 b2!97)) (bvadd (bitIndex!0 (size!8296 (buf!7909 b1!97)) (currentByte!14628 b1!97) (currentBit!14623 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312451 () Bool)

(declare-fun res!255909 () Bool)

(assert (=> b!312451 (=> (not res!255909) (not e!224720))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312451 (= res!255909 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8296 (buf!7909 b1!97))) ((_ sign_extend 32) (currentByte!14628 b1!97)) ((_ sign_extend 32) (currentBit!14623 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312452 () Bool)

(assert (=> b!312452 (= e!224720 (and (not (= ((_ sign_extend 32) (currentByte!14628 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14628 b1!97))) ((_ sign_extend 32) (currentByte!14628 b1!97)))))))))

(declare-fun b!312453 () Bool)

(assert (=> b!312453 (= e!224721 (array_inv!7848 (buf!7909 b1!97)))))

(assert (= (and start!69538 res!255908) b!312449))

(assert (= (and b!312449 res!255910) b!312450))

(assert (= (and b!312450 res!255911) b!312451))

(assert (= (and b!312451 res!255909) b!312452))

(assert (= start!69538 b!312453))

(assert (= start!69538 b!312448))

(declare-fun m!450113 () Bool)

(assert (=> b!312450 m!450113))

(declare-fun m!450115 () Bool)

(assert (=> b!312450 m!450115))

(declare-fun m!450117 () Bool)

(assert (=> b!312451 m!450117))

(declare-fun m!450119 () Bool)

(assert (=> b!312449 m!450119))

(declare-fun m!450121 () Bool)

(assert (=> b!312453 m!450121))

(declare-fun m!450123 () Bool)

(assert (=> b!312448 m!450123))

(declare-fun m!450125 () Bool)

(assert (=> start!69538 m!450125))

(declare-fun m!450127 () Bool)

(assert (=> start!69538 m!450127))

(push 1)

(assert (not b!312449))

(assert (not start!69538))

(assert (not b!312448))

(assert (not b!312450))

(assert (not b!312451))

(assert (not b!312453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


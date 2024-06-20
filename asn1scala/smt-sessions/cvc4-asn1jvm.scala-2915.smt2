; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69614 () Bool)

(assert start!69614)

(declare-fun b!313132 () Bool)

(declare-fun res!256367 () Bool)

(declare-fun e!225288 () Bool)

(assert (=> b!313132 (=> (not res!256367) (not e!225288))))

(declare-datatypes ((array!19214 0))(
  ( (array!19215 (arr!9414 (Array (_ BitVec 32) (_ BitVec 8))) (size!8334 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13772 0))(
  ( (BitStream!13773 (buf!7947 array!19214) (currentByte!14666 (_ BitVec 32)) (currentBit!14661 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13772)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313132 (= res!256367 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8334 (buf!7947 b1!97))) ((_ sign_extend 32) (currentByte!14666 b1!97)) ((_ sign_extend 32) (currentBit!14661 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313133 () Bool)

(declare-fun e!225290 () Bool)

(declare-fun b2!97 () BitStream!13772)

(declare-fun array_inv!7886 (array!19214) Bool)

(assert (=> b!313133 (= e!225290 (array_inv!7886 (buf!7947 b2!97)))))

(declare-fun b!313135 () Bool)

(declare-fun res!256366 () Bool)

(assert (=> b!313135 (=> (not res!256366) (not e!225288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313135 (= res!256366 (validate_offset_bits!1 ((_ sign_extend 32) (size!8334 (buf!7947 b1!97))) ((_ sign_extend 32) (currentByte!14666 b1!97)) ((_ sign_extend 32) (currentBit!14661 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313136 () Bool)

(declare-fun res!256364 () Bool)

(assert (=> b!313136 (=> (not res!256364) (not e!225288))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313136 (= res!256364 (bvsle (bitIndex!0 (size!8334 (buf!7947 b2!97)) (currentByte!14666 b2!97) (currentBit!14661 b2!97)) (bvadd (bitIndex!0 (size!8334 (buf!7947 b1!97)) (currentByte!14666 b1!97) (currentBit!14661 b1!97)) advancedAtMostBits!9)))))

(declare-fun lt!442124 () (_ BitVec 64))

(declare-fun b!313137 () Bool)

(assert (=> b!313137 (= e!225288 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8334 (buf!7947 b1!97)))) lt!442124) b1ValidateOffsetBits!10) (bvsle (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14666 b2!97))) ((_ sign_extend 32) (currentBit!14661 b2!97))) (bvadd lt!442124 advancedAtMostBits!9)) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!313137 (= lt!442124 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14666 b1!97))) ((_ sign_extend 32) (currentBit!14661 b1!97))))))

(declare-fun res!256365 () Bool)

(assert (=> start!69614 (=> (not res!256365) (not e!225288))))

(assert (=> start!69614 (= res!256365 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8334 (buf!7947 b1!97)) (size!8334 (buf!7947 b2!97)))))))

(assert (=> start!69614 e!225288))

(assert (=> start!69614 true))

(declare-fun e!225291 () Bool)

(declare-fun inv!12 (BitStream!13772) Bool)

(assert (=> start!69614 (and (inv!12 b1!97) e!225291)))

(assert (=> start!69614 (and (inv!12 b2!97) e!225290)))

(declare-fun b!313134 () Bool)

(assert (=> b!313134 (= e!225291 (array_inv!7886 (buf!7947 b1!97)))))

(assert (= (and start!69614 res!256365) b!313135))

(assert (= (and b!313135 res!256366) b!313136))

(assert (= (and b!313136 res!256364) b!313132))

(assert (= (and b!313132 res!256367) b!313137))

(assert (= start!69614 b!313134))

(assert (= start!69614 b!313133))

(declare-fun m!450721 () Bool)

(assert (=> b!313136 m!450721))

(declare-fun m!450723 () Bool)

(assert (=> b!313136 m!450723))

(declare-fun m!450725 () Bool)

(assert (=> b!313132 m!450725))

(declare-fun m!450727 () Bool)

(assert (=> start!69614 m!450727))

(declare-fun m!450729 () Bool)

(assert (=> start!69614 m!450729))

(declare-fun m!450731 () Bool)

(assert (=> b!313135 m!450731))

(declare-fun m!450733 () Bool)

(assert (=> b!313134 m!450733))

(declare-fun m!450735 () Bool)

(assert (=> b!313133 m!450735))

(push 1)

(assert (not b!313132))

(assert (not b!313133))

(assert (not b!313134))

(assert (not b!313136))

(assert (not b!313135))

(assert (not start!69614))

(check-sat)

(pop 1)

(push 1)

(check-sat)


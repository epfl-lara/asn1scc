; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69562 () Bool)

(assert start!69562)

(declare-fun b!312664 () Bool)

(declare-fun res!256054 () Bool)

(declare-fun e!224900 () Bool)

(assert (=> b!312664 (=> (not res!256054) (not e!224900))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19162 0))(
  ( (array!19163 (arr!9388 (Array (_ BitVec 32) (_ BitVec 8))) (size!8308 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13720 0))(
  ( (BitStream!13721 (buf!7921 array!19162) (currentByte!14640 (_ BitVec 32)) (currentBit!14635 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13720)

(declare-fun b2!97 () BitStream!13720)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312664 (= res!256054 (bvsle (bitIndex!0 (size!8308 (buf!7921 b2!97)) (currentByte!14640 b2!97) (currentBit!14635 b2!97)) (bvadd (bitIndex!0 (size!8308 (buf!7921 b1!97)) (currentByte!14640 b1!97) (currentBit!14635 b1!97)) advancedAtMostBits!9)))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b!312665 () Bool)

(assert (=> b!312665 (= e!224900 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8308 (buf!7921 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14640 b1!97))) ((_ sign_extend 32) (currentBit!14635 b1!97)))) b1ValidateOffsetBits!10) (let ((bdg!18623 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14640 b2!97))))) (let ((bdg!18624 (bvand bdg!18623 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18624 (bvand ((_ sign_extend 32) (currentBit!14635 b2!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18624 (bvand (bvadd bdg!18623 ((_ sign_extend 32) (currentBit!14635 b2!97))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!312666 () Bool)

(declare-fun e!224902 () Bool)

(declare-fun array_inv!7860 (array!19162) Bool)

(assert (=> b!312666 (= e!224902 (array_inv!7860 (buf!7921 b1!97)))))

(declare-fun res!256055 () Bool)

(assert (=> start!69562 (=> (not res!256055) (not e!224900))))

(assert (=> start!69562 (= res!256055 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8308 (buf!7921 b1!97)) (size!8308 (buf!7921 b2!97)))))))

(assert (=> start!69562 e!224900))

(assert (=> start!69562 true))

(declare-fun inv!12 (BitStream!13720) Bool)

(assert (=> start!69562 (and (inv!12 b1!97) e!224902)))

(declare-fun e!224901 () Bool)

(assert (=> start!69562 (and (inv!12 b2!97) e!224901)))

(declare-fun b!312667 () Bool)

(assert (=> b!312667 (= e!224901 (array_inv!7860 (buf!7921 b2!97)))))

(declare-fun b!312668 () Bool)

(declare-fun res!256053 () Bool)

(assert (=> b!312668 (=> (not res!256053) (not e!224900))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312668 (= res!256053 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8308 (buf!7921 b1!97))) ((_ sign_extend 32) (currentByte!14640 b1!97)) ((_ sign_extend 32) (currentBit!14635 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312669 () Bool)

(declare-fun res!256052 () Bool)

(assert (=> b!312669 (=> (not res!256052) (not e!224900))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312669 (= res!256052 (validate_offset_bits!1 ((_ sign_extend 32) (size!8308 (buf!7921 b1!97))) ((_ sign_extend 32) (currentByte!14640 b1!97)) ((_ sign_extend 32) (currentBit!14635 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69562 res!256055) b!312669))

(assert (= (and b!312669 res!256052) b!312664))

(assert (= (and b!312664 res!256054) b!312668))

(assert (= (and b!312668 res!256053) b!312665))

(assert (= start!69562 b!312666))

(assert (= start!69562 b!312667))

(declare-fun m!450305 () Bool)

(assert (=> b!312669 m!450305))

(declare-fun m!450307 () Bool)

(assert (=> b!312664 m!450307))

(declare-fun m!450309 () Bool)

(assert (=> b!312664 m!450309))

(declare-fun m!450311 () Bool)

(assert (=> b!312668 m!450311))

(declare-fun m!450313 () Bool)

(assert (=> b!312667 m!450313))

(declare-fun m!450315 () Bool)

(assert (=> start!69562 m!450315))

(declare-fun m!450317 () Bool)

(assert (=> start!69562 m!450317))

(declare-fun m!450319 () Bool)

(assert (=> b!312666 m!450319))

(push 1)

(assert (not b!312669))

(assert (not b!312668))

(assert (not b!312667))

(assert (not start!69562))

(assert (not b!312666))

(assert (not b!312664))

(check-sat)

(pop 1)

(push 1)

(check-sat)


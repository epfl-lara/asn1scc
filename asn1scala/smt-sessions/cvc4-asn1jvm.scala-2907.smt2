; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69566 () Bool)

(assert start!69566)

(declare-fun b!312700 () Bool)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-datatypes ((array!19166 0))(
  ( (array!19167 (arr!9390 (Array (_ BitVec 32) (_ BitVec 8))) (size!8310 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13724 0))(
  ( (BitStream!13725 (buf!7923 array!19166) (currentByte!14642 (_ BitVec 32)) (currentBit!14637 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13724)

(declare-fun b1!97 () BitStream!13724)

(declare-fun e!224928 () Bool)

(assert (=> b!312700 (= e!224928 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8310 (buf!7923 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14642 b1!97))) ((_ sign_extend 32) (currentBit!14637 b1!97)))) b1ValidateOffsetBits!10) (let ((bdg!18623 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14642 b2!97))))) (let ((bdg!18624 (bvand bdg!18623 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18624 (bvand ((_ sign_extend 32) (currentBit!14637 b2!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18624 (bvand (bvadd bdg!18623 ((_ sign_extend 32) (currentBit!14637 b2!97))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!312701 () Bool)

(declare-fun e!224930 () Bool)

(declare-fun array_inv!7862 (array!19166) Bool)

(assert (=> b!312701 (= e!224930 (array_inv!7862 (buf!7923 b1!97)))))

(declare-fun res!256076 () Bool)

(assert (=> start!69566 (=> (not res!256076) (not e!224928))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69566 (= res!256076 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8310 (buf!7923 b1!97)) (size!8310 (buf!7923 b2!97)))))))

(assert (=> start!69566 e!224928))

(assert (=> start!69566 true))

(declare-fun inv!12 (BitStream!13724) Bool)

(assert (=> start!69566 (and (inv!12 b1!97) e!224930)))

(declare-fun e!224931 () Bool)

(assert (=> start!69566 (and (inv!12 b2!97) e!224931)))

(declare-fun b!312702 () Bool)

(declare-fun res!256079 () Bool)

(assert (=> b!312702 (=> (not res!256079) (not e!224928))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312702 (= res!256079 (validate_offset_bits!1 ((_ sign_extend 32) (size!8310 (buf!7923 b1!97))) ((_ sign_extend 32) (currentByte!14642 b1!97)) ((_ sign_extend 32) (currentBit!14637 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312703 () Bool)

(assert (=> b!312703 (= e!224931 (array_inv!7862 (buf!7923 b2!97)))))

(declare-fun b!312704 () Bool)

(declare-fun res!256077 () Bool)

(assert (=> b!312704 (=> (not res!256077) (not e!224928))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312704 (= res!256077 (bvsle (bitIndex!0 (size!8310 (buf!7923 b2!97)) (currentByte!14642 b2!97) (currentBit!14637 b2!97)) (bvadd (bitIndex!0 (size!8310 (buf!7923 b1!97)) (currentByte!14642 b1!97) (currentBit!14637 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312705 () Bool)

(declare-fun res!256078 () Bool)

(assert (=> b!312705 (=> (not res!256078) (not e!224928))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312705 (= res!256078 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8310 (buf!7923 b1!97))) ((_ sign_extend 32) (currentByte!14642 b1!97)) ((_ sign_extend 32) (currentBit!14637 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69566 res!256076) b!312702))

(assert (= (and b!312702 res!256079) b!312704))

(assert (= (and b!312704 res!256077) b!312705))

(assert (= (and b!312705 res!256078) b!312700))

(assert (= start!69566 b!312701))

(assert (= start!69566 b!312703))

(declare-fun m!450337 () Bool)

(assert (=> b!312701 m!450337))

(declare-fun m!450339 () Bool)

(assert (=> start!69566 m!450339))

(declare-fun m!450341 () Bool)

(assert (=> start!69566 m!450341))

(declare-fun m!450343 () Bool)

(assert (=> b!312702 m!450343))

(declare-fun m!450345 () Bool)

(assert (=> b!312705 m!450345))

(declare-fun m!450347 () Bool)

(assert (=> b!312703 m!450347))

(declare-fun m!450349 () Bool)

(assert (=> b!312704 m!450349))

(declare-fun m!450351 () Bool)

(assert (=> b!312704 m!450351))

(push 1)

(assert (not b!312702))

(assert (not b!312703))

(assert (not b!312705))

(assert (not b!312704))

(assert (not start!69566))

(assert (not b!312701))

(check-sat)

(pop 1)

(push 1)

(check-sat)


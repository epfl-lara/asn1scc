; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69532 () Bool)

(assert start!69532)

(declare-fun b!312394 () Bool)

(declare-fun res!255872 () Bool)

(declare-fun e!224673 () Bool)

(assert (=> b!312394 (=> (not res!255872) (not e!224673))))

(declare-datatypes ((array!19132 0))(
  ( (array!19133 (arr!9373 (Array (_ BitVec 32) (_ BitVec 8))) (size!8293 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13690 0))(
  ( (BitStream!13691 (buf!7906 array!19132) (currentByte!14625 (_ BitVec 32)) (currentBit!14620 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13690)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312394 (= res!255872 (validate_offset_bits!1 ((_ sign_extend 32) (size!8293 (buf!7906 b1!97))) ((_ sign_extend 32) (currentByte!14625 b1!97)) ((_ sign_extend 32) (currentBit!14620 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312395 () Bool)

(declare-fun e!224676 () Bool)

(declare-fun b2!97 () BitStream!13690)

(declare-fun array_inv!7845 (array!19132) Bool)

(assert (=> b!312395 (= e!224676 (array_inv!7845 (buf!7906 b2!97)))))

(declare-fun b!312396 () Bool)

(declare-fun res!255874 () Bool)

(assert (=> b!312396 (=> (not res!255874) (not e!224673))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312396 (= res!255874 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8293 (buf!7906 b1!97))) ((_ sign_extend 32) (currentByte!14625 b1!97)) ((_ sign_extend 32) (currentBit!14620 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!255873 () Bool)

(assert (=> start!69532 (=> (not res!255873) (not e!224673))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69532 (= res!255873 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8293 (buf!7906 b1!97)) (size!8293 (buf!7906 b2!97)))))))

(assert (=> start!69532 e!224673))

(assert (=> start!69532 true))

(declare-fun e!224675 () Bool)

(declare-fun inv!12 (BitStream!13690) Bool)

(assert (=> start!69532 (and (inv!12 b1!97) e!224675)))

(assert (=> start!69532 (and (inv!12 b2!97) e!224676)))

(declare-fun b!312397 () Bool)

(declare-fun res!255875 () Bool)

(assert (=> b!312397 (=> (not res!255875) (not e!224673))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312397 (= res!255875 (bvsle (bitIndex!0 (size!8293 (buf!7906 b2!97)) (currentByte!14625 b2!97) (currentBit!14620 b2!97)) (bvadd (bitIndex!0 (size!8293 (buf!7906 b1!97)) (currentByte!14625 b1!97) (currentBit!14620 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312398 () Bool)

(assert (=> b!312398 (= e!224673 (and (not (= ((_ sign_extend 32) (size!8293 (buf!7906 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8293 (buf!7906 b1!97)))) ((_ sign_extend 32) (size!8293 (buf!7906 b1!97))))))))))

(declare-fun b!312399 () Bool)

(assert (=> b!312399 (= e!224675 (array_inv!7845 (buf!7906 b1!97)))))

(assert (= (and start!69532 res!255873) b!312394))

(assert (= (and b!312394 res!255872) b!312397))

(assert (= (and b!312397 res!255875) b!312396))

(assert (= (and b!312396 res!255874) b!312398))

(assert (= start!69532 b!312399))

(assert (= start!69532 b!312395))

(declare-fun m!450065 () Bool)

(assert (=> b!312394 m!450065))

(declare-fun m!450067 () Bool)

(assert (=> b!312396 m!450067))

(declare-fun m!450069 () Bool)

(assert (=> b!312397 m!450069))

(declare-fun m!450071 () Bool)

(assert (=> b!312397 m!450071))

(declare-fun m!450073 () Bool)

(assert (=> start!69532 m!450073))

(declare-fun m!450075 () Bool)

(assert (=> start!69532 m!450075))

(declare-fun m!450077 () Bool)

(assert (=> b!312399 m!450077))

(declare-fun m!450079 () Bool)

(assert (=> b!312395 m!450079))

(push 1)

(assert (not b!312395))

(assert (not b!312397))

(assert (not b!312399))

(assert (not b!312394))

(assert (not start!69532))

(assert (not b!312396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


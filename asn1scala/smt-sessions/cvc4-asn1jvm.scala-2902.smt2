; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69536 () Bool)

(assert start!69536)

(declare-fun res!255897 () Bool)

(declare-fun e!224703 () Bool)

(assert (=> start!69536 (=> (not res!255897) (not e!224703))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19136 0))(
  ( (array!19137 (arr!9375 (Array (_ BitVec 32) (_ BitVec 8))) (size!8295 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13694 0))(
  ( (BitStream!13695 (buf!7908 array!19136) (currentByte!14627 (_ BitVec 32)) (currentBit!14622 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13694)

(declare-fun b2!97 () BitStream!13694)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69536 (= res!255897 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8295 (buf!7908 b1!97)) (size!8295 (buf!7908 b2!97)))))))

(assert (=> start!69536 e!224703))

(assert (=> start!69536 true))

(declare-fun e!224706 () Bool)

(declare-fun inv!12 (BitStream!13694) Bool)

(assert (=> start!69536 (and (inv!12 b1!97) e!224706)))

(declare-fun e!224707 () Bool)

(assert (=> start!69536 (and (inv!12 b2!97) e!224707)))

(declare-fun b!312430 () Bool)

(declare-fun array_inv!7847 (array!19136) Bool)

(assert (=> b!312430 (= e!224707 (array_inv!7847 (buf!7908 b2!97)))))

(declare-fun b!312431 () Bool)

(declare-fun res!255898 () Bool)

(assert (=> b!312431 (=> (not res!255898) (not e!224703))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312431 (= res!255898 (bvsle (bitIndex!0 (size!8295 (buf!7908 b2!97)) (currentByte!14627 b2!97) (currentBit!14622 b2!97)) (bvadd (bitIndex!0 (size!8295 (buf!7908 b1!97)) (currentByte!14627 b1!97) (currentBit!14622 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312432 () Bool)

(assert (=> b!312432 (= e!224703 (and (not (= ((_ sign_extend 32) (size!8295 (buf!7908 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8295 (buf!7908 b1!97)))) ((_ sign_extend 32) (size!8295 (buf!7908 b1!97))))))))))

(declare-fun b!312433 () Bool)

(declare-fun res!255899 () Bool)

(assert (=> b!312433 (=> (not res!255899) (not e!224703))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312433 (= res!255899 (validate_offset_bits!1 ((_ sign_extend 32) (size!8295 (buf!7908 b1!97))) ((_ sign_extend 32) (currentByte!14627 b1!97)) ((_ sign_extend 32) (currentBit!14622 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312434 () Bool)

(assert (=> b!312434 (= e!224706 (array_inv!7847 (buf!7908 b1!97)))))

(declare-fun b!312435 () Bool)

(declare-fun res!255896 () Bool)

(assert (=> b!312435 (=> (not res!255896) (not e!224703))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312435 (= res!255896 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8295 (buf!7908 b1!97))) ((_ sign_extend 32) (currentByte!14627 b1!97)) ((_ sign_extend 32) (currentBit!14622 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69536 res!255897) b!312433))

(assert (= (and b!312433 res!255899) b!312431))

(assert (= (and b!312431 res!255898) b!312435))

(assert (= (and b!312435 res!255896) b!312432))

(assert (= start!69536 b!312434))

(assert (= start!69536 b!312430))

(declare-fun m!450097 () Bool)

(assert (=> b!312434 m!450097))

(declare-fun m!450099 () Bool)

(assert (=> b!312433 m!450099))

(declare-fun m!450101 () Bool)

(assert (=> start!69536 m!450101))

(declare-fun m!450103 () Bool)

(assert (=> start!69536 m!450103))

(declare-fun m!450105 () Bool)

(assert (=> b!312435 m!450105))

(declare-fun m!450107 () Bool)

(assert (=> b!312430 m!450107))

(declare-fun m!450109 () Bool)

(assert (=> b!312431 m!450109))

(declare-fun m!450111 () Bool)

(assert (=> b!312431 m!450111))

(push 1)

(assert (not b!312433))

(assert (not b!312435))

(assert (not start!69536))

(assert (not b!312431))

(assert (not b!312430))

(assert (not b!312434))

(check-sat)

(pop 1)

(push 1)

(check-sat)


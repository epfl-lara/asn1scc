; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69540 () Bool)

(assert start!69540)

(declare-fun b!312466 () Bool)

(declare-fun res!255921 () Bool)

(declare-fun e!224733 () Bool)

(assert (=> b!312466 (=> (not res!255921) (not e!224733))))

(declare-datatypes ((array!19140 0))(
  ( (array!19141 (arr!9377 (Array (_ BitVec 32) (_ BitVec 8))) (size!8297 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13698 0))(
  ( (BitStream!13699 (buf!7910 array!19140) (currentByte!14629 (_ BitVec 32)) (currentBit!14624 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13698)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312466 (= res!255921 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8297 (buf!7910 b1!97))) ((_ sign_extend 32) (currentByte!14629 b1!97)) ((_ sign_extend 32) (currentBit!14624 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312467 () Bool)

(declare-fun res!255923 () Bool)

(assert (=> b!312467 (=> (not res!255923) (not e!224733))))

(declare-fun b2!97 () BitStream!13698)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312467 (= res!255923 (bvsle (bitIndex!0 (size!8297 (buf!7910 b2!97)) (currentByte!14629 b2!97) (currentBit!14624 b2!97)) (bvadd (bitIndex!0 (size!8297 (buf!7910 b1!97)) (currentByte!14629 b1!97) (currentBit!14624 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312468 () Bool)

(assert (=> b!312468 (= e!224733 (and (not (= ((_ sign_extend 32) (currentByte!14629 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14629 b1!97))) ((_ sign_extend 32) (currentByte!14629 b1!97)))))))))

(declare-fun b!312469 () Bool)

(declare-fun res!255922 () Bool)

(assert (=> b!312469 (=> (not res!255922) (not e!224733))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312469 (= res!255922 (validate_offset_bits!1 ((_ sign_extend 32) (size!8297 (buf!7910 b1!97))) ((_ sign_extend 32) (currentByte!14629 b1!97)) ((_ sign_extend 32) (currentBit!14624 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312470 () Bool)

(declare-fun e!224735 () Bool)

(declare-fun array_inv!7849 (array!19140) Bool)

(assert (=> b!312470 (= e!224735 (array_inv!7849 (buf!7910 b1!97)))))

(declare-fun res!255920 () Bool)

(assert (=> start!69540 (=> (not res!255920) (not e!224733))))

(assert (=> start!69540 (= res!255920 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8297 (buf!7910 b1!97)) (size!8297 (buf!7910 b2!97)))))))

(assert (=> start!69540 e!224733))

(assert (=> start!69540 true))

(declare-fun inv!12 (BitStream!13698) Bool)

(assert (=> start!69540 (and (inv!12 b1!97) e!224735)))

(declare-fun e!224736 () Bool)

(assert (=> start!69540 (and (inv!12 b2!97) e!224736)))

(declare-fun b!312471 () Bool)

(assert (=> b!312471 (= e!224736 (array_inv!7849 (buf!7910 b2!97)))))

(assert (= (and start!69540 res!255920) b!312469))

(assert (= (and b!312469 res!255922) b!312467))

(assert (= (and b!312467 res!255923) b!312466))

(assert (= (and b!312466 res!255921) b!312468))

(assert (= start!69540 b!312470))

(assert (= start!69540 b!312471))

(declare-fun m!450129 () Bool)

(assert (=> b!312466 m!450129))

(declare-fun m!450131 () Bool)

(assert (=> b!312469 m!450131))

(declare-fun m!450133 () Bool)

(assert (=> b!312470 m!450133))

(declare-fun m!450135 () Bool)

(assert (=> b!312467 m!450135))

(declare-fun m!450137 () Bool)

(assert (=> b!312467 m!450137))

(declare-fun m!450139 () Bool)

(assert (=> start!69540 m!450139))

(declare-fun m!450141 () Bool)

(assert (=> start!69540 m!450141))

(declare-fun m!450143 () Bool)

(assert (=> b!312471 m!450143))

(check-sat (not b!312471) (not start!69540) (not b!312466) (not b!312469) (not b!312470) (not b!312467))
(check-sat)

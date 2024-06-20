; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69534 () Bool)

(assert start!69534)

(declare-fun res!255884 () Bool)

(declare-fun e!224691 () Bool)

(assert (=> start!69534 (=> (not res!255884) (not e!224691))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19134 0))(
  ( (array!19135 (arr!9374 (Array (_ BitVec 32) (_ BitVec 8))) (size!8294 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13692 0))(
  ( (BitStream!13693 (buf!7907 array!19134) (currentByte!14626 (_ BitVec 32)) (currentBit!14621 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13692)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13692)

(assert (=> start!69534 (= res!255884 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8294 (buf!7907 b1!97)) (size!8294 (buf!7907 b2!97)))))))

(assert (=> start!69534 e!224691))

(assert (=> start!69534 true))

(declare-fun e!224688 () Bool)

(declare-fun inv!12 (BitStream!13692) Bool)

(assert (=> start!69534 (and (inv!12 b1!97) e!224688)))

(declare-fun e!224689 () Bool)

(assert (=> start!69534 (and (inv!12 b2!97) e!224689)))

(declare-fun b!312412 () Bool)

(declare-fun res!255887 () Bool)

(assert (=> b!312412 (=> (not res!255887) (not e!224691))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312412 (= res!255887 (validate_offset_bits!1 ((_ sign_extend 32) (size!8294 (buf!7907 b1!97))) ((_ sign_extend 32) (currentByte!14626 b1!97)) ((_ sign_extend 32) (currentBit!14621 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312413 () Bool)

(assert (=> b!312413 (= e!224691 (and (not (= ((_ sign_extend 32) (size!8294 (buf!7907 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8294 (buf!7907 b1!97)))) ((_ sign_extend 32) (size!8294 (buf!7907 b1!97))))))))))

(declare-fun b!312414 () Bool)

(declare-fun res!255885 () Bool)

(assert (=> b!312414 (=> (not res!255885) (not e!224691))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312414 (= res!255885 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8294 (buf!7907 b1!97))) ((_ sign_extend 32) (currentByte!14626 b1!97)) ((_ sign_extend 32) (currentBit!14621 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312415 () Bool)

(declare-fun res!255886 () Bool)

(assert (=> b!312415 (=> (not res!255886) (not e!224691))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312415 (= res!255886 (bvsle (bitIndex!0 (size!8294 (buf!7907 b2!97)) (currentByte!14626 b2!97) (currentBit!14621 b2!97)) (bvadd (bitIndex!0 (size!8294 (buf!7907 b1!97)) (currentByte!14626 b1!97) (currentBit!14621 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312416 () Bool)

(declare-fun array_inv!7846 (array!19134) Bool)

(assert (=> b!312416 (= e!224688 (array_inv!7846 (buf!7907 b1!97)))))

(declare-fun b!312417 () Bool)

(assert (=> b!312417 (= e!224689 (array_inv!7846 (buf!7907 b2!97)))))

(assert (= (and start!69534 res!255884) b!312412))

(assert (= (and b!312412 res!255887) b!312415))

(assert (= (and b!312415 res!255886) b!312414))

(assert (= (and b!312414 res!255885) b!312413))

(assert (= start!69534 b!312416))

(assert (= start!69534 b!312417))

(declare-fun m!450081 () Bool)

(assert (=> b!312414 m!450081))

(declare-fun m!450083 () Bool)

(assert (=> b!312415 m!450083))

(declare-fun m!450085 () Bool)

(assert (=> b!312415 m!450085))

(declare-fun m!450087 () Bool)

(assert (=> b!312412 m!450087))

(declare-fun m!450089 () Bool)

(assert (=> start!69534 m!450089))

(declare-fun m!450091 () Bool)

(assert (=> start!69534 m!450091))

(declare-fun m!450093 () Bool)

(assert (=> b!312417 m!450093))

(declare-fun m!450095 () Bool)

(assert (=> b!312416 m!450095))

(check-sat (not start!69534) (not b!312417) (not b!312415) (not b!312412) (not b!312414) (not b!312416))
(check-sat)

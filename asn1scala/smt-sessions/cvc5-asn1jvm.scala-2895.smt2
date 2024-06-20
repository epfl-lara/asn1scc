; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69346 () Bool)

(assert start!69346)

(declare-fun b!311926 () Bool)

(declare-fun e!224286 () Bool)

(assert (=> b!311926 (= e!224286 false)))

(declare-fun lt!441554 () (_ BitVec 64))

(declare-datatypes ((array!19075 0))(
  ( (array!19076 (arr!9352 (Array (_ BitVec 32) (_ BitVec 8))) (size!8272 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13648 0))(
  ( (BitStream!13649 (buf!7885 array!19075) (currentByte!14562 (_ BitVec 32)) (currentBit!14557 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13648)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311926 (= lt!441554 (bitIndex!0 (size!8272 (buf!7885 b2!97)) (currentByte!14562 b2!97) (currentBit!14557 b2!97)))))

(declare-fun lt!441553 () (_ BitVec 64))

(declare-fun b1!97 () BitStream!13648)

(assert (=> b!311926 (= lt!441553 (bitIndex!0 (size!8272 (buf!7885 b1!97)) (currentByte!14562 b1!97) (currentBit!14557 b1!97)))))

(declare-fun b!311925 () Bool)

(declare-fun res!255530 () Bool)

(assert (=> b!311925 (=> (not res!255530) (not e!224286))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311925 (= res!255530 (validate_offset_bits!1 ((_ sign_extend 32) (size!8272 (buf!7885 b1!97))) ((_ sign_extend 32) (currentByte!14562 b1!97)) ((_ sign_extend 32) (currentBit!14557 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255529 () Bool)

(assert (=> start!69346 (=> (not res!255529) (not e!224286))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69346 (= res!255529 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8272 (buf!7885 b1!97)) (size!8272 (buf!7885 b2!97)))))))

(assert (=> start!69346 e!224286))

(assert (=> start!69346 true))

(declare-fun e!224283 () Bool)

(declare-fun inv!12 (BitStream!13648) Bool)

(assert (=> start!69346 (and (inv!12 b1!97) e!224283)))

(declare-fun e!224287 () Bool)

(assert (=> start!69346 (and (inv!12 b2!97) e!224287)))

(declare-fun b!311928 () Bool)

(declare-fun array_inv!7824 (array!19075) Bool)

(assert (=> b!311928 (= e!224287 (array_inv!7824 (buf!7885 b2!97)))))

(declare-fun b!311927 () Bool)

(assert (=> b!311927 (= e!224283 (array_inv!7824 (buf!7885 b1!97)))))

(assert (= (and start!69346 res!255529) b!311925))

(assert (= (and b!311925 res!255530) b!311926))

(assert (= start!69346 b!311927))

(assert (= start!69346 b!311928))

(declare-fun m!449657 () Bool)

(assert (=> start!69346 m!449657))

(declare-fun m!449659 () Bool)

(assert (=> start!69346 m!449659))

(declare-fun m!449661 () Bool)

(assert (=> b!311925 m!449661))

(declare-fun m!449663 () Bool)

(assert (=> b!311928 m!449663))

(declare-fun m!449665 () Bool)

(assert (=> b!311926 m!449665))

(declare-fun m!449667 () Bool)

(assert (=> b!311926 m!449667))

(declare-fun m!449669 () Bool)

(assert (=> b!311927 m!449669))

(push 1)

(assert (not start!69346))

(assert (not b!311928))

(assert (not b!311926))

(assert (not b!311925))

(assert (not b!311927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69350 () Bool)

(assert start!69350)

(declare-fun b!311952 () Bool)

(declare-fun e!224315 () Bool)

(declare-datatypes ((array!19079 0))(
  ( (array!19080 (arr!9354 (Array (_ BitVec 32) (_ BitVec 8))) (size!8274 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13652 0))(
  ( (BitStream!13653 (buf!7887 array!19079) (currentByte!14564 (_ BitVec 32)) (currentBit!14559 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13652)

(declare-fun array_inv!7826 (array!19079) Bool)

(assert (=> b!311952 (= e!224315 (array_inv!7826 (buf!7887 b2!97)))))

(declare-fun b!311950 () Bool)

(declare-fun e!224317 () Bool)

(assert (=> b!311950 (= e!224317 false)))

(declare-fun lt!441565 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311950 (= lt!441565 (bitIndex!0 (size!8274 (buf!7887 b2!97)) (currentByte!14564 b2!97) (currentBit!14559 b2!97)))))

(declare-fun lt!441566 () (_ BitVec 64))

(declare-fun b1!97 () BitStream!13652)

(assert (=> b!311950 (= lt!441566 (bitIndex!0 (size!8274 (buf!7887 b1!97)) (currentByte!14564 b1!97) (currentBit!14559 b1!97)))))

(declare-fun res!255541 () Bool)

(assert (=> start!69350 (=> (not res!255541) (not e!224317))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69350 (= res!255541 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8274 (buf!7887 b1!97)) (size!8274 (buf!7887 b2!97)))))))

(assert (=> start!69350 e!224317))

(assert (=> start!69350 true))

(declare-fun e!224316 () Bool)

(declare-fun inv!12 (BitStream!13652) Bool)

(assert (=> start!69350 (and (inv!12 b1!97) e!224316)))

(assert (=> start!69350 (and (inv!12 b2!97) e!224315)))

(declare-fun b!311951 () Bool)

(assert (=> b!311951 (= e!224316 (array_inv!7826 (buf!7887 b1!97)))))

(declare-fun b!311949 () Bool)

(declare-fun res!255542 () Bool)

(assert (=> b!311949 (=> (not res!255542) (not e!224317))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311949 (= res!255542 (validate_offset_bits!1 ((_ sign_extend 32) (size!8274 (buf!7887 b1!97))) ((_ sign_extend 32) (currentByte!14564 b1!97)) ((_ sign_extend 32) (currentBit!14559 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69350 res!255541) b!311949))

(assert (= (and b!311949 res!255542) b!311950))

(assert (= start!69350 b!311951))

(assert (= start!69350 b!311952))

(declare-fun m!449685 () Bool)

(assert (=> b!311951 m!449685))

(declare-fun m!449687 () Bool)

(assert (=> b!311949 m!449687))

(declare-fun m!449689 () Bool)

(assert (=> b!311950 m!449689))

(declare-fun m!449691 () Bool)

(assert (=> b!311950 m!449691))

(declare-fun m!449693 () Bool)

(assert (=> b!311952 m!449693))

(declare-fun m!449695 () Bool)

(assert (=> start!69350 m!449695))

(declare-fun m!449697 () Bool)

(assert (=> start!69350 m!449697))

(push 1)

(assert (not b!311949))

(assert (not start!69350))

(assert (not b!311952))

(assert (not b!311951))

(assert (not b!311950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


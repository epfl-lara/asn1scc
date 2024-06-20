; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69000 () Bool)

(assert start!69000)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18960 0))(
  ( (array!18961 (arr!9309 (Array (_ BitVec 32) (_ BitVec 8))) (size!8229 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13562 0))(
  ( (BitStream!13563 (buf!7842 array!18960) (currentByte!14445 (_ BitVec 32)) (currentBit!14440 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13562)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13562)

(assert (=> start!69000 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8229 (buf!7842 b1!97)) (size!8229 (buf!7842 b2!97))) (or (bvsgt ((_ sign_extend 32) (size!8229 (buf!7842 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14445 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14440 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!69000 true))

(declare-fun e!223505 () Bool)

(declare-fun inv!12 (BitStream!13562) Bool)

(assert (=> start!69000 (and (inv!12 b1!97) e!223505)))

(declare-fun e!223507 () Bool)

(assert (=> start!69000 (and (inv!12 b2!97) e!223507)))

(declare-fun b!311044 () Bool)

(declare-fun array_inv!7781 (array!18960) Bool)

(assert (=> b!311044 (= e!223505 (array_inv!7781 (buf!7842 b1!97)))))

(declare-fun b!311045 () Bool)

(assert (=> b!311045 (= e!223507 (array_inv!7781 (buf!7842 b2!97)))))

(assert (= start!69000 b!311044))

(assert (= start!69000 b!311045))

(declare-fun m!448899 () Bool)

(assert (=> start!69000 m!448899))

(declare-fun m!448901 () Bool)

(assert (=> start!69000 m!448901))

(declare-fun m!448903 () Bool)

(assert (=> b!311044 m!448903))

(declare-fun m!448905 () Bool)

(assert (=> b!311045 m!448905))

(push 1)

(assert (not b!311044))

(assert (not b!311045))

(assert (not start!69000))

(check-sat)

(pop 1)

(push 1)

(check-sat)


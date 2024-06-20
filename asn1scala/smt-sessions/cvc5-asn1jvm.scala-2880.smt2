; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68996 () Bool)

(assert start!68996)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18956 0))(
  ( (array!18957 (arr!9307 (Array (_ BitVec 32) (_ BitVec 8))) (size!8227 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13558 0))(
  ( (BitStream!13559 (buf!7840 array!18956) (currentByte!14443 (_ BitVec 32)) (currentBit!14438 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13558)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13558)

(assert (=> start!68996 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8227 (buf!7840 b1!97)) (size!8227 (buf!7840 b2!97))) (or (bvsgt ((_ sign_extend 32) (size!8227 (buf!7840 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14443 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14438 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!68996 true))

(declare-fun e!223481 () Bool)

(declare-fun inv!12 (BitStream!13558) Bool)

(assert (=> start!68996 (and (inv!12 b1!97) e!223481)))

(declare-fun e!223483 () Bool)

(assert (=> start!68996 (and (inv!12 b2!97) e!223483)))

(declare-fun b!311032 () Bool)

(declare-fun array_inv!7779 (array!18956) Bool)

(assert (=> b!311032 (= e!223481 (array_inv!7779 (buf!7840 b1!97)))))

(declare-fun b!311033 () Bool)

(assert (=> b!311033 (= e!223483 (array_inv!7779 (buf!7840 b2!97)))))

(assert (= start!68996 b!311032))

(assert (= start!68996 b!311033))

(declare-fun m!448883 () Bool)

(assert (=> start!68996 m!448883))

(declare-fun m!448885 () Bool)

(assert (=> start!68996 m!448885))

(declare-fun m!448887 () Bool)

(assert (=> b!311032 m!448887))

(declare-fun m!448889 () Bool)

(assert (=> b!311033 m!448889))

(push 1)

(assert (not b!311033))

(assert (not start!68996))

(assert (not b!311032))

(check-sat)

(pop 1)

(push 1)

(check-sat)


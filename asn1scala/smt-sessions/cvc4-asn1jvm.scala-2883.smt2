; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69046 () Bool)

(assert start!69046)

(declare-fun b!311123 () Bool)

(declare-fun res!254932 () Bool)

(declare-fun e!223632 () Bool)

(assert (=> b!311123 (=> (not res!254932) (not e!223632))))

(declare-datatypes ((array!18983 0))(
  ( (array!18984 (arr!9318 (Array (_ BitVec 32) (_ BitVec 8))) (size!8238 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13580 0))(
  ( (BitStream!13581 (buf!7851 array!18983) (currentByte!14458 (_ BitVec 32)) (currentBit!14453 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13580)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311123 (= res!254932 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14453 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14458 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8238 (buf!7851 b1!97))))))))

(declare-fun b!311126 () Bool)

(declare-fun e!223631 () Bool)

(declare-fun b2!97 () BitStream!13580)

(declare-fun array_inv!7790 (array!18983) Bool)

(assert (=> b!311126 (= e!223631 (array_inv!7790 (buf!7851 b2!97)))))

(declare-fun b!311124 () Bool)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> b!311124 (= e!223632 (bvslt b1ValidateOffsetBits!10 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!254931 () Bool)

(assert (=> start!69046 (=> (not res!254931) (not e!223632))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69046 (= res!254931 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8238 (buf!7851 b1!97)) (size!8238 (buf!7851 b2!97))) (bvsle ((_ sign_extend 32) (size!8238 (buf!7851 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14458 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14453 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8238 (buf!7851 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14458 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14453 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69046 e!223632))

(assert (=> start!69046 true))

(declare-fun e!223633 () Bool)

(declare-fun inv!12 (BitStream!13580) Bool)

(assert (=> start!69046 (and (inv!12 b1!97) e!223633)))

(assert (=> start!69046 (and (inv!12 b2!97) e!223631)))

(declare-fun b!311125 () Bool)

(assert (=> b!311125 (= e!223633 (array_inv!7790 (buf!7851 b1!97)))))

(assert (= (and start!69046 res!254931) b!311123))

(assert (= (and b!311123 res!254932) b!311124))

(assert (= start!69046 b!311125))

(assert (= start!69046 b!311126))

(declare-fun m!449001 () Bool)

(assert (=> b!311123 m!449001))

(declare-fun m!449003 () Bool)

(assert (=> b!311126 m!449003))

(declare-fun m!449005 () Bool)

(assert (=> start!69046 m!449005))

(declare-fun m!449007 () Bool)

(assert (=> start!69046 m!449007))

(declare-fun m!449009 () Bool)

(assert (=> b!311125 m!449009))

(push 1)

(assert (not b!311126))

(assert (not start!69046))

(assert (not b!311125))

(assert (not b!311123))

(check-sat)

(pop 1)

(push 1)

(check-sat)


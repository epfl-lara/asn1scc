; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69076 () Bool)

(assert start!69076)

(declare-fun b!311174 () Bool)

(declare-fun e!223691 () Bool)

(declare-datatypes ((array!18994 0))(
  ( (array!18995 (arr!9322 (Array (_ BitVec 32) (_ BitVec 8))) (size!8242 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13588 0))(
  ( (BitStream!13589 (buf!7855 array!18994) (currentByte!14468 (_ BitVec 32)) (currentBit!14463 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13588)

(declare-fun array_inv!7794 (array!18994) Bool)

(assert (=> b!311174 (= e!223691 (array_inv!7794 (buf!7855 b2!97)))))

(declare-fun b!311173 () Bool)

(declare-fun e!223690 () Bool)

(declare-fun b1!97 () BitStream!13588)

(assert (=> b!311173 (= e!223690 (array_inv!7794 (buf!7855 b1!97)))))

(declare-fun b!311171 () Bool)

(declare-fun res!254955 () Bool)

(declare-fun e!223692 () Bool)

(assert (=> b!311171 (=> (not res!254955) (not e!223692))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311171 (= res!254955 (validate_offset_bits!1 ((_ sign_extend 32) (size!8242 (buf!7855 b1!97))) ((_ sign_extend 32) (currentByte!14468 b1!97)) ((_ sign_extend 32) (currentBit!14463 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!254956 () Bool)

(assert (=> start!69076 (=> (not res!254956) (not e!223692))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69076 (= res!254956 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8242 (buf!7855 b1!97)) (size!8242 (buf!7855 b2!97)))))))

(assert (=> start!69076 e!223692))

(assert (=> start!69076 true))

(declare-fun inv!12 (BitStream!13588) Bool)

(assert (=> start!69076 (and (inv!12 b1!97) e!223690)))

(assert (=> start!69076 (and (inv!12 b2!97) e!223691)))

(declare-fun b!311172 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311172 (= e!223692 (not (invariant!0 (currentBit!14463 b1!97) (currentByte!14468 b1!97) (size!8242 (buf!7855 b1!97)))))))

(assert (= (and start!69076 res!254956) b!311171))

(assert (= (and b!311171 res!254955) b!311172))

(assert (= start!69076 b!311173))

(assert (= start!69076 b!311174))

(declare-fun m!449057 () Bool)

(assert (=> start!69076 m!449057))

(declare-fun m!449059 () Bool)

(assert (=> start!69076 m!449059))

(declare-fun m!449061 () Bool)

(assert (=> b!311174 m!449061))

(declare-fun m!449063 () Bool)

(assert (=> b!311171 m!449063))

(declare-fun m!449065 () Bool)

(assert (=> b!311173 m!449065))

(declare-fun m!449067 () Bool)

(assert (=> b!311172 m!449067))

(push 1)

(assert (not b!311171))

(assert (not b!311172))

(assert (not b!311173))

(assert (not b!311174))

(assert (not start!69076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103166 () Bool)

(assert (=> d!103166 (= (array_inv!7794 (buf!7855 b2!97)) (bvsge (size!8242 (buf!7855 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311174 d!103166))

(declare-fun d!103170 () Bool)

(assert (=> d!103170 (= (array_inv!7794 (buf!7855 b1!97)) (bvsge (size!8242 (buf!7855 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311173 d!103170))

(declare-fun d!103172 () Bool)


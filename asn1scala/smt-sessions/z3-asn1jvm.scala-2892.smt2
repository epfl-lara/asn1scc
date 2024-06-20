; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69262 () Bool)

(assert start!69262)

(declare-fun b!311662 () Bool)

(declare-fun res!255314 () Bool)

(declare-fun e!224095 () Bool)

(assert (=> b!311662 (=> (not res!255314) (not e!224095))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19053 0))(
  ( (array!19054 (arr!9344 (Array (_ BitVec 32) (_ BitVec 8))) (size!8264 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13632 0))(
  ( (BitStream!13633 (buf!7877 array!19053) (currentByte!14532 (_ BitVec 32)) (currentBit!14527 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13632)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311662 (= res!255314 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8264 (buf!7877 b2!97))) ((_ sign_extend 32) (currentByte!14532 b2!97)) ((_ sign_extend 32) (currentBit!14527 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun res!255315 () Bool)

(declare-fun e!224098 () Bool)

(assert (=> start!69262 (=> (not res!255315) (not e!224098))))

(declare-fun b1!97 () BitStream!13632)

(assert (=> start!69262 (= res!255315 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8264 (buf!7877 b1!97)) (size!8264 (buf!7877 b2!97)))))))

(assert (=> start!69262 e!224098))

(assert (=> start!69262 true))

(declare-fun e!224099 () Bool)

(declare-fun inv!12 (BitStream!13632) Bool)

(assert (=> start!69262 (and (inv!12 b1!97) e!224099)))

(declare-fun e!224100 () Bool)

(assert (=> start!69262 (and (inv!12 b2!97) e!224100)))

(declare-fun b!311663 () Bool)

(declare-fun array_inv!7816 (array!19053) Bool)

(assert (=> b!311663 (= e!224099 (array_inv!7816 (buf!7877 b1!97)))))

(declare-fun b!311664 () Bool)

(assert (=> b!311664 (= e!224095 (or (bvsgt ((_ sign_extend 32) (size!8264 (buf!7877 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14532 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14527 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!311665 () Bool)

(assert (=> b!311665 (= e!224100 (array_inv!7816 (buf!7877 b2!97)))))

(declare-fun b!311666 () Bool)

(declare-fun e!224097 () Bool)

(assert (=> b!311666 (= e!224098 e!224097)))

(declare-fun res!255318 () Bool)

(assert (=> b!311666 (=> (not res!255318) (not e!224097))))

(declare-fun lt!441339 () (_ BitVec 64))

(declare-fun lt!441341 () (_ BitVec 64))

(assert (=> b!311666 (= res!255318 (bvsge (bvsub lt!441339 lt!441341) b1ValidateOffsetBits!10))))

(assert (=> b!311666 (= lt!441341 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14532 b1!97))) ((_ sign_extend 32) (currentBit!14527 b1!97))))))

(assert (=> b!311666 (= lt!441339 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8264 (buf!7877 b1!97)))))))

(declare-fun b!311667 () Bool)

(assert (=> b!311667 (= e!224097 e!224095)))

(declare-fun res!255319 () Bool)

(assert (=> b!311667 (=> (not res!255319) (not e!224095))))

(declare-fun lt!441340 () (_ BitVec 64))

(assert (=> b!311667 (= res!255319 (and (bvsle lt!441340 (bvadd lt!441341 advancedAtMostBits!9)) (bvsge (bvsub lt!441339 lt!441340) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!311667 (= lt!441340 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14532 b2!97))) ((_ sign_extend 32) (currentBit!14527 b2!97))))))

(declare-fun b!311668 () Bool)

(declare-fun res!255320 () Bool)

(assert (=> b!311668 (=> (not res!255320) (not e!224098))))

(assert (=> b!311668 (= res!255320 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8264 (buf!7877 b1!97))) ((_ sign_extend 32) (currentByte!14532 b1!97)) ((_ sign_extend 32) (currentBit!14527 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311669 () Bool)

(declare-fun res!255317 () Bool)

(assert (=> b!311669 (=> (not res!255317) (not e!224098))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311669 (= res!255317 (validate_offset_bits!1 ((_ sign_extend 32) (size!8264 (buf!7877 b1!97))) ((_ sign_extend 32) (currentByte!14532 b1!97)) ((_ sign_extend 32) (currentBit!14527 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311670 () Bool)

(declare-fun res!255316 () Bool)

(assert (=> b!311670 (=> (not res!255316) (not e!224098))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311670 (= res!255316 (bvsle (bitIndex!0 (size!8264 (buf!7877 b2!97)) (currentByte!14532 b2!97) (currentBit!14527 b2!97)) (bvadd (bitIndex!0 (size!8264 (buf!7877 b1!97)) (currentByte!14532 b1!97) (currentBit!14527 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69262 res!255315) b!311669))

(assert (= (and b!311669 res!255317) b!311670))

(assert (= (and b!311670 res!255316) b!311668))

(assert (= (and b!311668 res!255320) b!311666))

(assert (= (and b!311666 res!255318) b!311667))

(assert (= (and b!311667 res!255319) b!311662))

(assert (= (and b!311662 res!255314) b!311664))

(assert (= start!69262 b!311663))

(assert (= start!69262 b!311665))

(declare-fun m!449483 () Bool)

(assert (=> b!311663 m!449483))

(declare-fun m!449485 () Bool)

(assert (=> b!311668 m!449485))

(declare-fun m!449487 () Bool)

(assert (=> b!311662 m!449487))

(declare-fun m!449489 () Bool)

(assert (=> b!311669 m!449489))

(declare-fun m!449491 () Bool)

(assert (=> b!311665 m!449491))

(declare-fun m!449493 () Bool)

(assert (=> start!69262 m!449493))

(declare-fun m!449495 () Bool)

(assert (=> start!69262 m!449495))

(declare-fun m!449497 () Bool)

(assert (=> b!311670 m!449497))

(declare-fun m!449499 () Bool)

(assert (=> b!311670 m!449499))

(check-sat (not b!311668) (not b!311669) (not b!311665) (not b!311662) (not b!311670) (not start!69262) (not b!311663))
(check-sat)

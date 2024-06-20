; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69260 () Bool)

(assert start!69260)

(declare-fun b!311635 () Bool)

(declare-fun e!224080 () Bool)

(declare-datatypes ((array!19051 0))(
  ( (array!19052 (arr!9343 (Array (_ BitVec 32) (_ BitVec 8))) (size!8263 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13630 0))(
  ( (BitStream!13631 (buf!7876 array!19051) (currentByte!14531 (_ BitVec 32)) (currentBit!14526 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13630)

(declare-fun array_inv!7815 (array!19051) Bool)

(assert (=> b!311635 (= e!224080 (array_inv!7815 (buf!7876 b1!97)))))

(declare-fun b!311636 () Bool)

(declare-fun res!255298 () Bool)

(declare-fun e!224074 () Bool)

(assert (=> b!311636 (=> (not res!255298) (not e!224074))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311636 (= res!255298 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8263 (buf!7876 b1!97))) ((_ sign_extend 32) (currentByte!14531 b1!97)) ((_ sign_extend 32) (currentBit!14526 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311637 () Bool)

(declare-fun e!224079 () Bool)

(assert (=> b!311637 (= e!224074 e!224079)))

(declare-fun res!255293 () Bool)

(assert (=> b!311637 (=> (not res!255293) (not e!224079))))

(declare-fun lt!441331 () (_ BitVec 64))

(declare-fun lt!441330 () (_ BitVec 64))

(assert (=> b!311637 (= res!255293 (bvsge (bvsub lt!441331 lt!441330) b1ValidateOffsetBits!10))))

(assert (=> b!311637 (= lt!441330 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14531 b1!97))) ((_ sign_extend 32) (currentBit!14526 b1!97))))))

(assert (=> b!311637 (= lt!441331 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8263 (buf!7876 b1!97)))))))

(declare-fun b!311638 () Bool)

(declare-fun res!255297 () Bool)

(assert (=> b!311638 (=> (not res!255297) (not e!224074))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311638 (= res!255297 (validate_offset_bits!1 ((_ sign_extend 32) (size!8263 (buf!7876 b1!97))) ((_ sign_extend 32) (currentByte!14531 b1!97)) ((_ sign_extend 32) (currentBit!14526 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311639 () Bool)

(declare-fun e!224075 () Bool)

(declare-fun b2!97 () BitStream!13630)

(assert (=> b!311639 (= e!224075 (array_inv!7815 (buf!7876 b2!97)))))

(declare-fun b!311640 () Bool)

(declare-fun e!224077 () Bool)

(assert (=> b!311640 (= e!224077 (or (bvsgt ((_ sign_extend 32) (size!8263 (buf!7876 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14531 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14526 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!255299 () Bool)

(assert (=> start!69260 (=> (not res!255299) (not e!224074))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69260 (= res!255299 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8263 (buf!7876 b1!97)) (size!8263 (buf!7876 b2!97)))))))

(assert (=> start!69260 e!224074))

(assert (=> start!69260 true))

(declare-fun inv!12 (BitStream!13630) Bool)

(assert (=> start!69260 (and (inv!12 b1!97) e!224080)))

(assert (=> start!69260 (and (inv!12 b2!97) e!224075)))

(declare-fun b!311641 () Bool)

(assert (=> b!311641 (= e!224079 e!224077)))

(declare-fun res!255296 () Bool)

(assert (=> b!311641 (=> (not res!255296) (not e!224077))))

(declare-fun lt!441332 () (_ BitVec 64))

(assert (=> b!311641 (= res!255296 (and (bvsle lt!441332 (bvadd lt!441330 advancedAtMostBits!9)) (bvsge (bvsub lt!441331 lt!441332) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!311641 (= lt!441332 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14531 b2!97))) ((_ sign_extend 32) (currentBit!14526 b2!97))))))

(declare-fun b!311642 () Bool)

(declare-fun res!255295 () Bool)

(assert (=> b!311642 (=> (not res!255295) (not e!224077))))

(assert (=> b!311642 (= res!255295 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8263 (buf!7876 b2!97))) ((_ sign_extend 32) (currentByte!14531 b2!97)) ((_ sign_extend 32) (currentBit!14526 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!311643 () Bool)

(declare-fun res!255294 () Bool)

(assert (=> b!311643 (=> (not res!255294) (not e!224074))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311643 (= res!255294 (bvsle (bitIndex!0 (size!8263 (buf!7876 b2!97)) (currentByte!14531 b2!97) (currentBit!14526 b2!97)) (bvadd (bitIndex!0 (size!8263 (buf!7876 b1!97)) (currentByte!14531 b1!97) (currentBit!14526 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69260 res!255299) b!311638))

(assert (= (and b!311638 res!255297) b!311643))

(assert (= (and b!311643 res!255294) b!311636))

(assert (= (and b!311636 res!255298) b!311637))

(assert (= (and b!311637 res!255293) b!311641))

(assert (= (and b!311641 res!255296) b!311642))

(assert (= (and b!311642 res!255295) b!311640))

(assert (= start!69260 b!311635))

(assert (= start!69260 b!311639))

(declare-fun m!449465 () Bool)

(assert (=> b!311638 m!449465))

(declare-fun m!449467 () Bool)

(assert (=> start!69260 m!449467))

(declare-fun m!449469 () Bool)

(assert (=> start!69260 m!449469))

(declare-fun m!449471 () Bool)

(assert (=> b!311639 m!449471))

(declare-fun m!449473 () Bool)

(assert (=> b!311635 m!449473))

(declare-fun m!449475 () Bool)

(assert (=> b!311636 m!449475))

(declare-fun m!449477 () Bool)

(assert (=> b!311643 m!449477))

(declare-fun m!449479 () Bool)

(assert (=> b!311643 m!449479))

(declare-fun m!449481 () Bool)

(assert (=> b!311642 m!449481))

(push 1)

(assert (not b!311643))

(assert (not b!311638))

(assert (not b!311642))

(assert (not start!69260))

(assert (not b!311639))

(assert (not b!311635))

(assert (not b!311636))

(check-sat)

(pop 1)

(push 1)

(check-sat)


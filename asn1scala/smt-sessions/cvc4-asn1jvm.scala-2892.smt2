; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69264 () Bool)

(assert start!69264)

(declare-fun b!311689 () Bool)

(declare-fun res!255336 () Bool)

(declare-fun e!224119 () Bool)

(assert (=> b!311689 (=> (not res!255336) (not e!224119))))

(declare-datatypes ((array!19055 0))(
  ( (array!19056 (arr!9345 (Array (_ BitVec 32) (_ BitVec 8))) (size!8265 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13634 0))(
  ( (BitStream!13635 (buf!7878 array!19055) (currentByte!14533 (_ BitVec 32)) (currentBit!14528 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13634)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311689 (= res!255336 (validate_offset_bits!1 ((_ sign_extend 32) (size!8265 (buf!7878 b1!97))) ((_ sign_extend 32) (currentByte!14533 b1!97)) ((_ sign_extend 32) (currentBit!14528 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255335 () Bool)

(assert (=> start!69264 (=> (not res!255335) (not e!224119))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13634)

(assert (=> start!69264 (= res!255335 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8265 (buf!7878 b1!97)) (size!8265 (buf!7878 b2!97)))))))

(assert (=> start!69264 e!224119))

(assert (=> start!69264 true))

(declare-fun e!224117 () Bool)

(declare-fun inv!12 (BitStream!13634) Bool)

(assert (=> start!69264 (and (inv!12 b1!97) e!224117)))

(declare-fun e!224122 () Bool)

(assert (=> start!69264 (and (inv!12 b2!97) e!224122)))

(declare-fun b!311690 () Bool)

(declare-fun e!224118 () Bool)

(assert (=> b!311690 (= e!224118 (or (bvsgt ((_ sign_extend 32) (size!8265 (buf!7878 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14533 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14528 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!311691 () Bool)

(declare-fun array_inv!7817 (array!19055) Bool)

(assert (=> b!311691 (= e!224117 (array_inv!7817 (buf!7878 b1!97)))))

(declare-fun b!311692 () Bool)

(declare-fun res!255339 () Bool)

(assert (=> b!311692 (=> (not res!255339) (not e!224119))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311692 (= res!255339 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8265 (buf!7878 b1!97))) ((_ sign_extend 32) (currentByte!14533 b1!97)) ((_ sign_extend 32) (currentBit!14528 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311693 () Bool)

(declare-fun e!224116 () Bool)

(assert (=> b!311693 (= e!224119 e!224116)))

(declare-fun res!255338 () Bool)

(assert (=> b!311693 (=> (not res!255338) (not e!224116))))

(declare-fun lt!441349 () (_ BitVec 64))

(declare-fun lt!441350 () (_ BitVec 64))

(assert (=> b!311693 (= res!255338 (bvsge (bvsub lt!441349 lt!441350) b1ValidateOffsetBits!10))))

(assert (=> b!311693 (= lt!441350 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14533 b1!97))) ((_ sign_extend 32) (currentBit!14528 b1!97))))))

(assert (=> b!311693 (= lt!441349 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8265 (buf!7878 b1!97)))))))

(declare-fun b!311694 () Bool)

(declare-fun res!255340 () Bool)

(assert (=> b!311694 (=> (not res!255340) (not e!224118))))

(assert (=> b!311694 (= res!255340 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8265 (buf!7878 b2!97))) ((_ sign_extend 32) (currentByte!14533 b2!97)) ((_ sign_extend 32) (currentBit!14528 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!311695 () Bool)

(assert (=> b!311695 (= e!224116 e!224118)))

(declare-fun res!255341 () Bool)

(assert (=> b!311695 (=> (not res!255341) (not e!224118))))

(declare-fun lt!441348 () (_ BitVec 64))

(assert (=> b!311695 (= res!255341 (and (bvsle lt!441348 (bvadd lt!441350 advancedAtMostBits!9)) (bvsge (bvsub lt!441349 lt!441348) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!311695 (= lt!441348 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14533 b2!97))) ((_ sign_extend 32) (currentBit!14528 b2!97))))))

(declare-fun b!311696 () Bool)

(assert (=> b!311696 (= e!224122 (array_inv!7817 (buf!7878 b2!97)))))

(declare-fun b!311697 () Bool)

(declare-fun res!255337 () Bool)

(assert (=> b!311697 (=> (not res!255337) (not e!224119))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311697 (= res!255337 (bvsle (bitIndex!0 (size!8265 (buf!7878 b2!97)) (currentByte!14533 b2!97) (currentBit!14528 b2!97)) (bvadd (bitIndex!0 (size!8265 (buf!7878 b1!97)) (currentByte!14533 b1!97) (currentBit!14528 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69264 res!255335) b!311689))

(assert (= (and b!311689 res!255336) b!311697))

(assert (= (and b!311697 res!255337) b!311692))

(assert (= (and b!311692 res!255339) b!311693))

(assert (= (and b!311693 res!255338) b!311695))

(assert (= (and b!311695 res!255341) b!311694))

(assert (= (and b!311694 res!255340) b!311690))

(assert (= start!69264 b!311691))

(assert (= start!69264 b!311696))

(declare-fun m!449501 () Bool)

(assert (=> b!311694 m!449501))

(declare-fun m!449503 () Bool)

(assert (=> b!311691 m!449503))

(declare-fun m!449505 () Bool)

(assert (=> b!311697 m!449505))

(declare-fun m!449507 () Bool)

(assert (=> b!311697 m!449507))

(declare-fun m!449509 () Bool)

(assert (=> b!311696 m!449509))

(declare-fun m!449511 () Bool)

(assert (=> start!69264 m!449511))

(declare-fun m!449513 () Bool)

(assert (=> start!69264 m!449513))

(declare-fun m!449515 () Bool)

(assert (=> b!311692 m!449515))

(declare-fun m!449517 () Bool)

(assert (=> b!311689 m!449517))

(push 1)

(assert (not b!311689))

(assert (not b!311697))

(assert (not start!69264))

(assert (not b!311692))

(assert (not b!311696))

(assert (not b!311691))

(assert (not b!311694))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69002 () Bool)

(assert start!69002)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18962 0))(
  ( (array!18963 (arr!9310 (Array (_ BitVec 32) (_ BitVec 8))) (size!8230 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13564 0))(
  ( (BitStream!13565 (buf!7843 array!18962) (currentByte!14446 (_ BitVec 32)) (currentBit!14441 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13564)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13564)

(assert (=> start!69002 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8230 (buf!7843 b1!97)) (size!8230 (buf!7843 b2!97))) (bvsle ((_ sign_extend 32) (size!8230 (buf!7843 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14446 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14441 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8230 (buf!7843 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14446 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14441 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69002 true))

(declare-fun e!223517 () Bool)

(declare-fun inv!12 (BitStream!13564) Bool)

(assert (=> start!69002 (and (inv!12 b1!97) e!223517)))

(declare-fun e!223519 () Bool)

(assert (=> start!69002 (and (inv!12 b2!97) e!223519)))

(declare-fun b!311050 () Bool)

(declare-fun array_inv!7782 (array!18962) Bool)

(assert (=> b!311050 (= e!223517 (array_inv!7782 (buf!7843 b1!97)))))

(declare-fun b!311051 () Bool)

(assert (=> b!311051 (= e!223519 (array_inv!7782 (buf!7843 b2!97)))))

(assert (= start!69002 b!311050))

(assert (= start!69002 b!311051))

(declare-fun m!448907 () Bool)

(assert (=> start!69002 m!448907))

(declare-fun m!448909 () Bool)

(assert (=> start!69002 m!448909))

(declare-fun m!448911 () Bool)

(assert (=> b!311050 m!448911))

(declare-fun m!448913 () Bool)

(assert (=> b!311051 m!448913))

(push 1)

(assert (not b!311050))

(assert (not b!311051))

(assert (not start!69002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103074 () Bool)

(assert (=> d!103074 (= (array_inv!7782 (buf!7843 b1!97)) (bvsge (size!8230 (buf!7843 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311050 d!103074))

(declare-fun d!103076 () Bool)

(assert (=> d!103076 (= (array_inv!7782 (buf!7843 b2!97)) (bvsge (size!8230 (buf!7843 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311051 d!103076))

(declare-fun d!103078 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103078 (= (inv!12 b1!97) (invariant!0 (currentBit!14441 b1!97) (currentByte!14446 b1!97) (size!8230 (buf!7843 b1!97))))))

(declare-fun bs!26669 () Bool)

(assert (= bs!26669 d!103078))

(declare-fun m!448935 () Bool)

(assert (=> bs!26669 m!448935))

(assert (=> start!69002 d!103078))

(declare-fun d!103080 () Bool)

(assert (=> d!103080 (= (inv!12 b2!97) (invariant!0 (currentBit!14441 b2!97) (currentByte!14446 b2!97) (size!8230 (buf!7843 b2!97))))))

(declare-fun bs!26670 () Bool)

(assert (= bs!26670 d!103080))

(declare-fun m!448937 () Bool)

(assert (=> bs!26670 m!448937))

(assert (=> start!69002 d!103080))

(push 1)

(assert (not d!103078))

(assert (not d!103080))

(check-sat)

(pop 1)

(push 1)

(check-sat)


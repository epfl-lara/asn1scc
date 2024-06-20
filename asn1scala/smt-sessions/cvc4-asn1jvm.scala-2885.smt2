; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69080 () Bool)

(assert start!69080)

(declare-fun b!311196 () Bool)

(declare-fun e!223722 () Bool)

(declare-datatypes ((array!18998 0))(
  ( (array!18999 (arr!9324 (Array (_ BitVec 32) (_ BitVec 8))) (size!8244 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13592 0))(
  ( (BitStream!13593 (buf!7857 array!18998) (currentByte!14470 (_ BitVec 32)) (currentBit!14465 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13592)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311196 (= e!223722 (not (invariant!0 (currentBit!14465 b1!97) (currentByte!14470 b1!97) (size!8244 (buf!7857 b1!97)))))))

(declare-fun b!311195 () Bool)

(declare-fun res!254967 () Bool)

(assert (=> b!311195 (=> (not res!254967) (not e!223722))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311195 (= res!254967 (validate_offset_bits!1 ((_ sign_extend 32) (size!8244 (buf!7857 b1!97))) ((_ sign_extend 32) (currentByte!14470 b1!97)) ((_ sign_extend 32) (currentBit!14465 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311198 () Bool)

(declare-fun e!223723 () Bool)

(declare-fun b2!97 () BitStream!13592)

(declare-fun array_inv!7796 (array!18998) Bool)

(assert (=> b!311198 (= e!223723 (array_inv!7796 (buf!7857 b2!97)))))

(declare-fun res!254968 () Bool)

(assert (=> start!69080 (=> (not res!254968) (not e!223722))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69080 (= res!254968 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8244 (buf!7857 b1!97)) (size!8244 (buf!7857 b2!97)))))))

(assert (=> start!69080 e!223722))

(assert (=> start!69080 true))

(declare-fun e!223720 () Bool)

(declare-fun inv!12 (BitStream!13592) Bool)

(assert (=> start!69080 (and (inv!12 b1!97) e!223720)))

(assert (=> start!69080 (and (inv!12 b2!97) e!223723)))

(declare-fun b!311197 () Bool)

(assert (=> b!311197 (= e!223720 (array_inv!7796 (buf!7857 b1!97)))))

(assert (= (and start!69080 res!254968) b!311195))

(assert (= (and b!311195 res!254967) b!311196))

(assert (= start!69080 b!311197))

(assert (= start!69080 b!311198))

(declare-fun m!449081 () Bool)

(assert (=> start!69080 m!449081))

(declare-fun m!449083 () Bool)

(assert (=> start!69080 m!449083))

(declare-fun m!449085 () Bool)

(assert (=> b!311195 m!449085))

(declare-fun m!449087 () Bool)

(assert (=> b!311197 m!449087))

(declare-fun m!449089 () Bool)

(assert (=> b!311198 m!449089))

(declare-fun m!449091 () Bool)

(assert (=> b!311196 m!449091))

(push 1)

(assert (not b!311196))

(assert (not b!311197))

(assert (not b!311195))

(assert (not b!311198))

(assert (not start!69080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103168 () Bool)

(assert (=> d!103168 (= (array_inv!7796 (buf!7857 b1!97)) (bvsge (size!8244 (buf!7857 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311197 d!103168))

(declare-fun d!103174 () Bool)

(assert (=> d!103174 (= (inv!12 b1!97) (invariant!0 (currentBit!14465 b1!97) (currentByte!14470 b1!97) (size!8244 (buf!7857 b1!97))))))

(declare-fun bs!26699 () Bool)

(assert (= bs!26699 d!103174))

(assert (=> bs!26699 m!449091))

(assert (=> start!69080 d!103174))

(declare-fun d!103176 () Bool)

(assert (=> d!103176 (= (inv!12 b2!97) (invariant!0 (currentBit!14465 b2!97) (currentByte!14470 b2!97) (size!8244 (buf!7857 b2!97))))))

(declare-fun bs!26700 () Bool)

(assert (= bs!26700 d!103176))

(declare-fun m!449097 () Bool)

(assert (=> bs!26700 m!449097))


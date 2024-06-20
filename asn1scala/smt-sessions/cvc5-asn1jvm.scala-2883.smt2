; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69042 () Bool)

(assert start!69042)

(declare-fun res!254920 () Bool)

(declare-fun e!223601 () Bool)

(assert (=> start!69042 (=> (not res!254920) (not e!223601))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18979 0))(
  ( (array!18980 (arr!9316 (Array (_ BitVec 32) (_ BitVec 8))) (size!8236 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13576 0))(
  ( (BitStream!13577 (buf!7849 array!18979) (currentByte!14456 (_ BitVec 32)) (currentBit!14451 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13576)

(declare-fun b2!97 () BitStream!13576)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69042 (= res!254920 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8236 (buf!7849 b1!97)) (size!8236 (buf!7849 b2!97))) (bvsle ((_ sign_extend 32) (size!8236 (buf!7849 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14456 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14451 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8236 (buf!7849 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14456 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14451 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69042 e!223601))

(assert (=> start!69042 true))

(declare-fun e!223603 () Bool)

(declare-fun inv!12 (BitStream!13576) Bool)

(assert (=> start!69042 (and (inv!12 b1!97) e!223603)))

(declare-fun e!223600 () Bool)

(assert (=> start!69042 (and (inv!12 b2!97) e!223600)))

(declare-fun b!311099 () Bool)

(declare-fun res!254919 () Bool)

(assert (=> b!311099 (=> (not res!254919) (not e!223601))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311099 (= res!254919 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14451 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14456 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8236 (buf!7849 b1!97))))))))

(declare-fun b!311101 () Bool)

(declare-fun array_inv!7788 (array!18979) Bool)

(assert (=> b!311101 (= e!223603 (array_inv!7788 (buf!7849 b1!97)))))

(declare-fun b!311100 () Bool)

(assert (=> b!311100 (= e!223601 (bvslt b1ValidateOffsetBits!10 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!311102 () Bool)

(assert (=> b!311102 (= e!223600 (array_inv!7788 (buf!7849 b2!97)))))

(assert (= (and start!69042 res!254920) b!311099))

(assert (= (and b!311099 res!254919) b!311100))

(assert (= start!69042 b!311101))

(assert (= start!69042 b!311102))

(declare-fun m!448981 () Bool)

(assert (=> start!69042 m!448981))

(declare-fun m!448983 () Bool)

(assert (=> start!69042 m!448983))

(declare-fun m!448985 () Bool)

(assert (=> b!311099 m!448985))

(declare-fun m!448987 () Bool)

(assert (=> b!311101 m!448987))

(declare-fun m!448989 () Bool)

(assert (=> b!311102 m!448989))

(push 1)

(assert (not start!69042))

(assert (not b!311101))

(assert (not b!311099))

(assert (not b!311102))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69022 () Bool)

(assert start!69022)

(declare-fun res!254914 () Bool)

(declare-fun e!223589 () Bool)

(assert (=> start!69022 (=> (not res!254914) (not e!223589))))

(declare-datatypes ((array!18974 0))(
  ( (array!18975 (arr!9315 (Array (_ BitVec 32) (_ BitVec 8))) (size!8235 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13574 0))(
  ( (BitStream!13575 (buf!7848 array!18974) (currentByte!14452 (_ BitVec 32)) (currentBit!14447 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13574)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13574)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69022 (= res!254914 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8235 (buf!7848 b1!97)) (size!8235 (buf!7848 b2!97))) (bvsle ((_ sign_extend 32) (size!8235 (buf!7848 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14452 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14447 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8235 (buf!7848 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14452 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14447 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69022 e!223589))

(assert (=> start!69022 true))

(declare-fun e!223585 () Bool)

(declare-fun inv!12 (BitStream!13574) Bool)

(assert (=> start!69022 (and (inv!12 b1!97) e!223585)))

(declare-fun e!223586 () Bool)

(assert (=> start!69022 (and (inv!12 b2!97) e!223586)))

(declare-fun b!311088 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311088 (= e!223589 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14447 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14452 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8235 (buf!7848 b1!97)))))))))

(declare-fun b!311089 () Bool)

(declare-fun array_inv!7787 (array!18974) Bool)

(assert (=> b!311089 (= e!223585 (array_inv!7787 (buf!7848 b1!97)))))

(declare-fun b!311090 () Bool)

(assert (=> b!311090 (= e!223586 (array_inv!7787 (buf!7848 b2!97)))))

(assert (= (and start!69022 res!254914) b!311088))

(assert (= start!69022 b!311089))

(assert (= start!69022 b!311090))

(declare-fun m!448959 () Bool)

(assert (=> start!69022 m!448959))

(declare-fun m!448961 () Bool)

(assert (=> start!69022 m!448961))

(declare-fun m!448963 () Bool)

(assert (=> b!311088 m!448963))

(declare-fun m!448965 () Bool)

(assert (=> b!311089 m!448965))

(declare-fun m!448967 () Bool)

(assert (=> b!311090 m!448967))

(push 1)

(assert (not b!311090))

(assert (not start!69022))

(assert (not b!311089))

(assert (not b!311088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103108 () Bool)

(assert (=> d!103108 (= (array_inv!7787 (buf!7848 b2!97)) (bvsge (size!8235 (buf!7848 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311090 d!103108))

(declare-fun d!103110 () Bool)

(assert (=> d!103110 (= (inv!12 b1!97) (invariant!0 (currentBit!14447 b1!97) (currentByte!14452 b1!97) (size!8235 (buf!7848 b1!97))))))

(declare-fun bs!26678 () Bool)

(assert (= bs!26678 d!103110))

(declare-fun m!448977 () Bool)

(assert (=> bs!26678 m!448977))

(assert (=> start!69022 d!103110))

(declare-fun d!103112 () Bool)

(assert (=> d!103112 (= (inv!12 b2!97) (invariant!0 (currentBit!14447 b2!97) (currentByte!14452 b2!97) (size!8235 (buf!7848 b2!97))))))

(declare-fun bs!26679 () Bool)

(assert (= bs!26679 d!103112))

(declare-fun m!448979 () Bool)

(assert (=> bs!26679 m!448979))

(assert (=> start!69022 d!103112))

(declare-fun d!103114 () Bool)

(assert (=> d!103114 (= (array_inv!7787 (buf!7848 b1!97)) (bvsge (size!8235 (buf!7848 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311089 d!103114))

(declare-fun d!103116 () Bool)


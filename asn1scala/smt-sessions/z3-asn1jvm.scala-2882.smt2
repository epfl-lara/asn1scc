; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69020 () Bool)

(assert start!69020)

(declare-fun res!254911 () Bool)

(declare-fun e!223572 () Bool)

(assert (=> start!69020 (=> (not res!254911) (not e!223572))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18972 0))(
  ( (array!18973 (arr!9314 (Array (_ BitVec 32) (_ BitVec 8))) (size!8234 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13572 0))(
  ( (BitStream!13573 (buf!7847 array!18972) (currentByte!14451 (_ BitVec 32)) (currentBit!14446 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13572)

(declare-fun b2!97 () BitStream!13572)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69020 (= res!254911 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8234 (buf!7847 b1!97)) (size!8234 (buf!7847 b2!97))) (bvsle ((_ sign_extend 32) (size!8234 (buf!7847 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14451 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14446 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8234 (buf!7847 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14451 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14446 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69020 e!223572))

(assert (=> start!69020 true))

(declare-fun e!223573 () Bool)

(declare-fun inv!12 (BitStream!13572) Bool)

(assert (=> start!69020 (and (inv!12 b1!97) e!223573)))

(declare-fun e!223574 () Bool)

(assert (=> start!69020 (and (inv!12 b2!97) e!223574)))

(declare-fun b!311079 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311079 (= e!223572 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14446 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14451 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8234 (buf!7847 b1!97)))))))))

(declare-fun b!311080 () Bool)

(declare-fun array_inv!7786 (array!18972) Bool)

(assert (=> b!311080 (= e!223573 (array_inv!7786 (buf!7847 b1!97)))))

(declare-fun b!311081 () Bool)

(assert (=> b!311081 (= e!223574 (array_inv!7786 (buf!7847 b2!97)))))

(assert (= (and start!69020 res!254911) b!311079))

(assert (= start!69020 b!311080))

(assert (= start!69020 b!311081))

(declare-fun m!448949 () Bool)

(assert (=> start!69020 m!448949))

(declare-fun m!448951 () Bool)

(assert (=> start!69020 m!448951))

(declare-fun m!448953 () Bool)

(assert (=> b!311079 m!448953))

(declare-fun m!448955 () Bool)

(assert (=> b!311080 m!448955))

(declare-fun m!448957 () Bool)

(assert (=> b!311081 m!448957))

(check-sat (not b!311081) (not start!69020) (not b!311080) (not b!311079))
(check-sat)
(get-model)

(declare-fun d!103088 () Bool)

(assert (=> d!103088 (= (array_inv!7786 (buf!7847 b2!97)) (bvsge (size!8234 (buf!7847 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311081 d!103088))

(declare-fun d!103090 () Bool)

(assert (=> d!103090 (= (inv!12 b1!97) (invariant!0 (currentBit!14446 b1!97) (currentByte!14451 b1!97) (size!8234 (buf!7847 b1!97))))))

(declare-fun bs!26674 () Bool)

(assert (= bs!26674 d!103090))

(declare-fun m!448969 () Bool)

(assert (=> bs!26674 m!448969))

(assert (=> start!69020 d!103090))

(declare-fun d!103092 () Bool)

(assert (=> d!103092 (= (inv!12 b2!97) (invariant!0 (currentBit!14446 b2!97) (currentByte!14451 b2!97) (size!8234 (buf!7847 b2!97))))))

(declare-fun bs!26675 () Bool)

(assert (= bs!26675 d!103092))

(declare-fun m!448971 () Bool)

(assert (=> bs!26675 m!448971))

(assert (=> start!69020 d!103092))

(declare-fun d!103094 () Bool)

(assert (=> d!103094 (= (array_inv!7786 (buf!7847 b1!97)) (bvsge (size!8234 (buf!7847 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311080 d!103094))

(declare-fun d!103096 () Bool)

(assert (=> d!103096 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14446 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14451 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8234 (buf!7847 b1!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14446 b1!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14446 b1!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14451 b1!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14451 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8234 (buf!7847 b1!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14446 b1!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14451 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8234 (buf!7847 b1!97)))))))))))

(assert (=> b!311079 d!103096))

(check-sat (not d!103090) (not d!103092))
(check-sat)

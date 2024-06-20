; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69018 () Bool)

(assert start!69018)

(declare-fun res!254908 () Bool)

(declare-fun e!223557 () Bool)

(assert (=> start!69018 (=> (not res!254908) (not e!223557))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18970 0))(
  ( (array!18971 (arr!9313 (Array (_ BitVec 32) (_ BitVec 8))) (size!8233 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13570 0))(
  ( (BitStream!13571 (buf!7846 array!18970) (currentByte!14450 (_ BitVec 32)) (currentBit!14445 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13570)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13570)

(assert (=> start!69018 (= res!254908 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8233 (buf!7846 b1!97)) (size!8233 (buf!7846 b2!97))) (bvsle ((_ sign_extend 32) (size!8233 (buf!7846 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14450 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14445 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8233 (buf!7846 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14450 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14445 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69018 e!223557))

(assert (=> start!69018 true))

(declare-fun e!223558 () Bool)

(declare-fun inv!12 (BitStream!13570) Bool)

(assert (=> start!69018 (and (inv!12 b1!97) e!223558)))

(declare-fun e!223555 () Bool)

(assert (=> start!69018 (and (inv!12 b2!97) e!223555)))

(declare-fun b!311070 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311070 (= e!223557 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14445 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14450 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8233 (buf!7846 b1!97)))))))))

(declare-fun b!311071 () Bool)

(declare-fun array_inv!7785 (array!18970) Bool)

(assert (=> b!311071 (= e!223558 (array_inv!7785 (buf!7846 b1!97)))))

(declare-fun b!311072 () Bool)

(assert (=> b!311072 (= e!223555 (array_inv!7785 (buf!7846 b2!97)))))

(assert (= (and start!69018 res!254908) b!311070))

(assert (= start!69018 b!311071))

(assert (= start!69018 b!311072))

(declare-fun m!448939 () Bool)

(assert (=> start!69018 m!448939))

(declare-fun m!448941 () Bool)

(assert (=> start!69018 m!448941))

(declare-fun m!448943 () Bool)

(assert (=> b!311070 m!448943))

(declare-fun m!448945 () Bool)

(assert (=> b!311071 m!448945))

(declare-fun m!448947 () Bool)

(assert (=> b!311072 m!448947))

(push 1)

(assert (not b!311072))

(assert (not start!69018))

(assert (not b!311071))

(assert (not b!311070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103098 () Bool)

(assert (=> d!103098 (= (array_inv!7785 (buf!7846 b2!97)) (bvsge (size!8233 (buf!7846 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311072 d!103098))

(declare-fun d!103100 () Bool)

(assert (=> d!103100 (= (inv!12 b1!97) (invariant!0 (currentBit!14445 b1!97) (currentByte!14450 b1!97) (size!8233 (buf!7846 b1!97))))))

(declare-fun bs!26676 () Bool)

(assert (= bs!26676 d!103100))

(declare-fun m!448973 () Bool)

(assert (=> bs!26676 m!448973))

(assert (=> start!69018 d!103100))

(declare-fun d!103102 () Bool)

(assert (=> d!103102 (= (inv!12 b2!97) (invariant!0 (currentBit!14445 b2!97) (currentByte!14450 b2!97) (size!8233 (buf!7846 b2!97))))))

(declare-fun bs!26677 () Bool)

(assert (= bs!26677 d!103102))

(declare-fun m!448975 () Bool)

(assert (=> bs!26677 m!448975))

(assert (=> start!69018 d!103102))

(declare-fun d!103104 () Bool)

(assert (=> d!103104 (= (array_inv!7785 (buf!7846 b1!97)) (bvsge (size!8233 (buf!7846 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311071 d!103104))

(declare-fun d!103106 () Bool)

(assert (=> d!103106 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14445 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14450 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8233 (buf!7846 b1!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14445 b1!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14445 b1!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14450 b1!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14450 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8233 (buf!7846 b1!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14445 b1!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14450 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8233 (buf!7846 b1!97)))))))))))

(assert (=> b!311070 d!103106))

(push 1)

(assert (not d!103100))

(assert (not d!103102))

(check-sat)


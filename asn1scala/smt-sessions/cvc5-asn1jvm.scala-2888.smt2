; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69146 () Bool)

(assert start!69146)

(declare-fun b!311325 () Bool)

(declare-fun res!255056 () Bool)

(declare-fun e!223837 () Bool)

(assert (=> b!311325 (=> (not res!255056) (not e!223837))))

(declare-datatypes ((array!19018 0))(
  ( (array!19019 (arr!9331 (Array (_ BitVec 32) (_ BitVec 8))) (size!8251 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13606 0))(
  ( (BitStream!13607 (buf!7864 array!19018) (currentByte!14491 (_ BitVec 32)) (currentBit!14486 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13606)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311325 (= res!255056 (validate_offset_bits!1 ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))) ((_ sign_extend 32) (currentByte!14491 b1!97)) ((_ sign_extend 32) (currentBit!14486 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311326 () Bool)

(declare-fun res!255058 () Bool)

(assert (=> b!311326 (=> (not res!255058) (not e!223837))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13606)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311326 (= res!255058 (bvsle (bitIndex!0 (size!8251 (buf!7864 b2!97)) (currentByte!14491 b2!97) (currentBit!14486 b2!97)) (bvadd (bitIndex!0 (size!8251 (buf!7864 b1!97)) (currentByte!14491 b1!97) (currentBit!14486 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311327 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311327 (= e!223837 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14486 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14491 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8251 (buf!7864 b1!97)))))))))

(declare-fun res!255055 () Bool)

(assert (=> start!69146 (=> (not res!255055) (not e!223837))))

(assert (=> start!69146 (= res!255055 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8251 (buf!7864 b1!97)) (size!8251 (buf!7864 b2!97)))))))

(assert (=> start!69146 e!223837))

(assert (=> start!69146 true))

(declare-fun e!223840 () Bool)

(declare-fun inv!12 (BitStream!13606) Bool)

(assert (=> start!69146 (and (inv!12 b1!97) e!223840)))

(declare-fun e!223838 () Bool)

(assert (=> start!69146 (and (inv!12 b2!97) e!223838)))

(declare-fun b!311328 () Bool)

(declare-fun array_inv!7803 (array!19018) Bool)

(assert (=> b!311328 (= e!223838 (array_inv!7803 (buf!7864 b2!97)))))

(declare-fun b!311329 () Bool)

(assert (=> b!311329 (= e!223840 (array_inv!7803 (buf!7864 b1!97)))))

(declare-fun b!311330 () Bool)

(declare-fun res!255057 () Bool)

(assert (=> b!311330 (=> (not res!255057) (not e!223837))))

(assert (=> b!311330 (= res!255057 (and (bvsle ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14491 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14486 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14491 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14486 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!69146 res!255055) b!311325))

(assert (= (and b!311325 res!255056) b!311326))

(assert (= (and b!311326 res!255058) b!311330))

(assert (= (and b!311330 res!255057) b!311327))

(assert (= start!69146 b!311329))

(assert (= start!69146 b!311328))

(declare-fun m!449213 () Bool)

(assert (=> b!311325 m!449213))

(declare-fun m!449215 () Bool)

(assert (=> start!69146 m!449215))

(declare-fun m!449217 () Bool)

(assert (=> start!69146 m!449217))

(declare-fun m!449219 () Bool)

(assert (=> b!311329 m!449219))

(declare-fun m!449221 () Bool)

(assert (=> b!311326 m!449221))

(declare-fun m!449223 () Bool)

(assert (=> b!311326 m!449223))

(declare-fun m!449225 () Bool)

(assert (=> b!311328 m!449225))

(declare-fun m!449227 () Bool)

(assert (=> b!311327 m!449227))

(push 1)

(assert (not start!69146))

(assert (not b!311329))

(assert (not b!311326))

(assert (not b!311327))

(assert (not b!311328))

(assert (not b!311325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103250 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103250 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))) ((_ sign_extend 32) (currentByte!14491 b1!97)) ((_ sign_extend 32) (currentBit!14486 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))) ((_ sign_extend 32) (currentByte!14491 b1!97)) ((_ sign_extend 32) (currentBit!14486 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26723 () Bool)

(assert (= bs!26723 d!103250))

(declare-fun m!449261 () Bool)

(assert (=> bs!26723 m!449261))

(assert (=> b!311325 d!103250))

(declare-fun d!103252 () Bool)

(assert (=> d!103252 (= (array_inv!7803 (buf!7864 b1!97)) (bvsge (size!8251 (buf!7864 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311329 d!103252))

(declare-fun d!103254 () Bool)

(assert (=> d!103254 (= (inv!12 b1!97) (invariant!0 (currentBit!14486 b1!97) (currentByte!14491 b1!97) (size!8251 (buf!7864 b1!97))))))

(declare-fun bs!26724 () Bool)

(assert (= bs!26724 d!103254))

(declare-fun m!449263 () Bool)

(assert (=> bs!26724 m!449263))

(assert (=> start!69146 d!103254))

(declare-fun d!103256 () Bool)

(assert (=> d!103256 (= (inv!12 b2!97) (invariant!0 (currentBit!14486 b2!97) (currentByte!14491 b2!97) (size!8251 (buf!7864 b2!97))))))

(declare-fun bs!26725 () Bool)

(assert (= bs!26725 d!103256))

(declare-fun m!449265 () Bool)

(assert (=> bs!26725 m!449265))

(assert (=> start!69146 d!103256))

(declare-fun d!103258 () Bool)

(assert (=> d!103258 (= (array_inv!7803 (buf!7864 b2!97)) (bvsge (size!8251 (buf!7864 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311328 d!103258))

(declare-fun d!103262 () Bool)

(declare-fun e!223876 () Bool)

(assert (=> d!103262 e!223876))

(declare-fun res!255093 () Bool)

(assert (=> d!103262 (=> (not res!255093) (not e!223876))))

(declare-fun lt!441082 () (_ BitVec 64))

(declare-fun lt!441086 () (_ BitVec 64))

(declare-fun lt!441075 () (_ BitVec 64))

(assert (=> d!103262 (= res!255093 (= lt!441086 (bvsub lt!441075 lt!441082)))))

(assert (=> d!103262 (or (= (bvand lt!441075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441082 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441075 lt!441082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103262 (= lt!441082 (remainingBits!0 ((_ sign_extend 32) (size!8251 (buf!7864 b2!97))) ((_ sign_extend 32) (currentByte!14491 b2!97)) ((_ sign_extend 32) (currentBit!14486 b2!97))))))

(declare-fun lt!441084 () (_ BitVec 64))

(declare-fun lt!441077 () (_ BitVec 64))

(assert (=> d!103262 (= lt!441075 (bvmul lt!441084 lt!441077))))

(assert (=> d!103262 (or (= lt!441084 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441077 (bvsdiv (bvmul lt!441084 lt!441077) lt!441084)))))

(assert (=> d!103262 (= lt!441077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103262 (= lt!441084 ((_ sign_extend 32) (size!8251 (buf!7864 b2!97))))))

(assert (=> d!103262 (= lt!441086 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14491 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14486 b2!97))))))

(assert (=> d!103262 (invariant!0 (currentBit!14486 b2!97) (currentByte!14491 b2!97) (size!8251 (buf!7864 b2!97)))))

(assert (=> d!103262 (= (bitIndex!0 (size!8251 (buf!7864 b2!97)) (currentByte!14491 b2!97) (currentBit!14486 b2!97)) lt!441086)))

(declare-fun b!311375 () Bool)

(declare-fun res!255092 () Bool)

(assert (=> b!311375 (=> (not res!255092) (not e!223876))))

(assert (=> b!311375 (= res!255092 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441086))))

(declare-fun b!311377 () Bool)

(declare-fun lt!441079 () (_ BitVec 64))

(assert (=> b!311377 (= e!223876 (bvsle lt!441086 (bvmul lt!441079 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311377 (or (= lt!441079 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441079 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441079)))))

(assert (=> b!311377 (= lt!441079 ((_ sign_extend 32) (size!8251 (buf!7864 b2!97))))))

(assert (= (and d!103262 res!255093) b!311375))

(assert (= (and b!311375 res!255092) b!311377))

(declare-fun m!449269 () Bool)

(assert (=> d!103262 m!449269))

(assert (=> d!103262 m!449265))

(assert (=> b!311326 d!103262))

(declare-fun d!103266 () Bool)

(declare-fun e!223879 () Bool)

(assert (=> d!103266 e!223879))

(declare-fun res!255097 () Bool)

(assert (=> d!103266 (=> (not res!255097) (not e!223879))))

(declare-fun lt!441089 () (_ BitVec 64))

(declare-fun lt!441098 () (_ BitVec 64))

(declare-fun lt!441096 () (_ BitVec 64))

(assert (=> d!103266 (= res!255097 (= lt!441098 (bvsub lt!441089 lt!441096)))))

(assert (=> d!103266 (or (= (bvand lt!441089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441096 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441089 lt!441096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103266 (= lt!441096 (remainingBits!0 ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))) ((_ sign_extend 32) (currentByte!14491 b1!97)) ((_ sign_extend 32) (currentBit!14486 b1!97))))))

(declare-fun lt!441097 () (_ BitVec 64))

(declare-fun lt!441091 () (_ BitVec 64))

(assert (=> d!103266 (= lt!441089 (bvmul lt!441097 lt!441091))))

(assert (=> d!103266 (or (= lt!441097 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441091 (bvsdiv (bvmul lt!441097 lt!441091) lt!441097)))))

(assert (=> d!103266 (= lt!441091 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103266 (= lt!441097 ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))))))

(assert (=> d!103266 (= lt!441098 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14491 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14486 b1!97))))))

(assert (=> d!103266 (invariant!0 (currentBit!14486 b1!97) (currentByte!14491 b1!97) (size!8251 (buf!7864 b1!97)))))

(assert (=> d!103266 (= (bitIndex!0 (size!8251 (buf!7864 b1!97)) (currentByte!14491 b1!97) (currentBit!14486 b1!97)) lt!441098)))

(declare-fun b!311381 () Bool)

(declare-fun res!255096 () Bool)

(assert (=> b!311381 (=> (not res!255096) (not e!223879))))

(assert (=> b!311381 (= res!255096 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441098))))

(declare-fun b!311382 () Bool)

(declare-fun lt!441094 () (_ BitVec 64))

(assert (=> b!311382 (= e!223879 (bvsle lt!441098 (bvmul lt!441094 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311382 (or (= lt!441094 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441094 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441094)))))

(assert (=> b!311382 (= lt!441094 ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))))))

(assert (= (and d!103266 res!255097) b!311381))

(assert (= (and b!311381 res!255096) b!311382))

(assert (=> d!103266 m!449261))

(assert (=> d!103266 m!449263))

(assert (=> b!311326 d!103266))

(declare-fun d!103268 () Bool)

(assert (=> d!103268 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14486 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14491 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14486 b1!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14486 b1!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14491 b1!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14491 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8251 (buf!7864 b1!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14486 b1!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14491 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8251 (buf!7864 b1!97)))))))))))

(assert (=> b!311327 d!103268))

(push 1)

(assert (not d!103256))

(assert (not d!103262))

(assert (not d!103254))

(assert (not d!103250))

(assert (not d!103266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


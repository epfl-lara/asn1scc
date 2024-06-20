; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37598 () Bool)

(assert start!37598)

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(declare-datatypes ((array!9027 0))(
  ( (array!9028 (arr!4927 (Array (_ BitVec 32) (_ BitVec 8))) (size!3997 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7132 0))(
  ( (BitStream!7133 (buf!4440 array!9027) (currentByte!8424 (_ BitVec 32)) (currentBit!8419 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7132)

(assert (=> start!37598 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!3997 (buf!4440 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8424 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8419 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3997 (buf!4440 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8424 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8419 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37598 true))

(declare-fun e!119085 () Bool)

(declare-fun inv!12 (BitStream!7132) Bool)

(assert (=> start!37598 (and (inv!12 bs!64) e!119085)))

(declare-fun b!170712 () Bool)

(declare-fun array_inv!3738 (array!9027) Bool)

(assert (=> b!170712 (= e!119085 (array_inv!3738 (buf!4440 bs!64)))))

(assert (= start!37598 b!170712))

(declare-fun m!269867 () Bool)

(assert (=> start!37598 m!269867))

(declare-fun m!269869 () Bool)

(assert (=> b!170712 m!269869))

(push 1)

(assert (not start!37598))

(assert (not b!170712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60301 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60301 (= (inv!12 bs!64) (invariant!0 (currentBit!8419 bs!64) (currentByte!8424 bs!64) (size!3997 (buf!4440 bs!64))))))

(declare-fun bs!14992 () Bool)

(assert (= bs!14992 d!60301))

(declare-fun m!269881 () Bool)

(assert (=> bs!14992 m!269881))

(assert (=> start!37598 d!60301))

(declare-fun d!60303 () Bool)

(assert (=> d!60303 (= (array_inv!3738 (buf!4440 bs!64)) (bvsge (size!3997 (buf!4440 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170712 d!60303))

(push 1)

(assert (not d!60301))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60311 () Bool)

(assert (=> d!60311 (= (invariant!0 (currentBit!8419 bs!64) (currentByte!8424 bs!64) (size!3997 (buf!4440 bs!64))) (and (bvsge (currentBit!8419 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8419 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8424 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8424 bs!64) (size!3997 (buf!4440 bs!64))) (and (= (currentBit!8419 bs!64) #b00000000000000000000000000000000) (= (currentByte!8424 bs!64) (size!3997 (buf!4440 bs!64)))))))))

(assert (=> d!60301 d!60311))

(push 1)

(check-sat)


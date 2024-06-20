; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37600 () Bool)

(assert start!37600)

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(declare-datatypes ((array!9029 0))(
  ( (array!9030 (arr!4928 (Array (_ BitVec 32) (_ BitVec 8))) (size!3998 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7134 0))(
  ( (BitStream!7135 (buf!4441 array!9029) (currentByte!8425 (_ BitVec 32)) (currentBit!8420 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7134)

(assert (=> start!37600 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!3998 (buf!4441 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8425 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8420 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3998 (buf!4441 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8425 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8420 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37600 true))

(declare-fun e!119091 () Bool)

(declare-fun inv!12 (BitStream!7134) Bool)

(assert (=> start!37600 (and (inv!12 bs!64) e!119091)))

(declare-fun b!170715 () Bool)

(declare-fun array_inv!3739 (array!9029) Bool)

(assert (=> b!170715 (= e!119091 (array_inv!3739 (buf!4441 bs!64)))))

(assert (= start!37600 b!170715))

(declare-fun m!269871 () Bool)

(assert (=> start!37600 m!269871))

(declare-fun m!269873 () Bool)

(assert (=> b!170715 m!269873))

(check-sat (not b!170715) (not start!37600))
(check-sat)
(get-model)

(declare-fun d!60297 () Bool)

(assert (=> d!60297 (= (array_inv!3739 (buf!4441 bs!64)) (bvsge (size!3998 (buf!4441 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170715 d!60297))

(declare-fun d!60299 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60299 (= (inv!12 bs!64) (invariant!0 (currentBit!8420 bs!64) (currentByte!8425 bs!64) (size!3998 (buf!4441 bs!64))))))

(declare-fun bs!14991 () Bool)

(assert (= bs!14991 d!60299))

(declare-fun m!269879 () Bool)

(assert (=> bs!14991 m!269879))

(assert (=> start!37600 d!60299))

(check-sat (not d!60299))
(check-sat)
(get-model)

(declare-fun d!60309 () Bool)

(assert (=> d!60309 (= (invariant!0 (currentBit!8420 bs!64) (currentByte!8425 bs!64) (size!3998 (buf!4441 bs!64))) (and (bvsge (currentBit!8420 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8420 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8425 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8425 bs!64) (size!3998 (buf!4441 bs!64))) (and (= (currentBit!8420 bs!64) #b00000000000000000000000000000000) (= (currentByte!8425 bs!64) (size!3998 (buf!4441 bs!64)))))))))

(assert (=> d!60299 d!60309))

(check-sat)

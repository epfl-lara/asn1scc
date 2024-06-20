; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37602 () Bool)

(assert start!37602)

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(declare-datatypes ((array!9031 0))(
  ( (array!9032 (arr!4929 (Array (_ BitVec 32) (_ BitVec 8))) (size!3999 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7136 0))(
  ( (BitStream!7137 (buf!4442 array!9031) (currentByte!8426 (_ BitVec 32)) (currentBit!8421 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7136)

(assert (=> start!37602 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!3999 (buf!4442 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8426 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8421 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3999 (buf!4442 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8426 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8421 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37602 true))

(declare-fun e!119097 () Bool)

(declare-fun inv!12 (BitStream!7136) Bool)

(assert (=> start!37602 (and (inv!12 bs!64) e!119097)))

(declare-fun b!170718 () Bool)

(declare-fun array_inv!3740 (array!9031) Bool)

(assert (=> b!170718 (= e!119097 (array_inv!3740 (buf!4442 bs!64)))))

(assert (= start!37602 b!170718))

(declare-fun m!269875 () Bool)

(assert (=> start!37602 m!269875))

(declare-fun m!269877 () Bool)

(assert (=> b!170718 m!269877))

(push 1)

(assert (not start!37602))

(assert (not b!170718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60305 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60305 (= (inv!12 bs!64) (invariant!0 (currentBit!8421 bs!64) (currentByte!8426 bs!64) (size!3999 (buf!4442 bs!64))))))

(declare-fun bs!14993 () Bool)

(assert (= bs!14993 d!60305))

(declare-fun m!269883 () Bool)

(assert (=> bs!14993 m!269883))

(assert (=> start!37602 d!60305))

(declare-fun d!60307 () Bool)

(assert (=> d!60307 (= (array_inv!3740 (buf!4442 bs!64)) (bvsge (size!3999 (buf!4442 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170718 d!60307))

(push 1)

(assert (not d!60305))

(check-sat)

(pop 1)

(push 1)

(check-sat)


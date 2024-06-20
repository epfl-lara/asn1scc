; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37654 () Bool)

(assert start!37654)

(declare-fun res!141756 () Bool)

(declare-fun e!119233 () Bool)

(assert (=> start!37654 (=> (not res!141756) (not e!119233))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37654 (= res!141756 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37654 e!119233))

(assert (=> start!37654 true))

(declare-datatypes ((array!9065 0))(
  ( (array!9066 (arr!4944 (Array (_ BitVec 32) (_ BitVec 8))) (size!4014 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7166 0))(
  ( (BitStream!7167 (buf!4457 array!9065) (currentByte!8444 (_ BitVec 32)) (currentBit!8439 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7166)

(declare-fun e!119231 () Bool)

(declare-fun inv!12 (BitStream!7166) Bool)

(assert (=> start!37654 (and (inv!12 bs!64) e!119231)))

(declare-fun b!170842 () Bool)

(declare-fun res!141755 () Bool)

(assert (=> b!170842 (=> (not res!141755) (not e!119233))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170842 (= res!141755 (validate_offset_bits!1 ((_ sign_extend 32) (size!4014 (buf!4457 bs!64))) ((_ sign_extend 32) (currentByte!8444 bs!64)) ((_ sign_extend 32) (currentBit!8439 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170843 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170843 (= e!119233 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4014 (buf!4457 bs!64))) ((_ sign_extend 32) (currentByte!8444 bs!64)) ((_ sign_extend 32) (currentBit!8439 bs!64)))))))

(declare-datatypes ((tuple2!14664 0))(
  ( (tuple2!14665 (_1!7965 BitStream!7166) (_2!7965 Bool)) )
))
(declare-fun lt!263354 () tuple2!14664)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7166 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14664)

(assert (=> b!170843 (= lt!263354 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!170844 () Bool)

(declare-fun array_inv!3755 (array!9065) Bool)

(assert (=> b!170844 (= e!119231 (array_inv!3755 (buf!4457 bs!64)))))

(assert (= (and start!37654 res!141756) b!170842))

(assert (= (and b!170842 res!141755) b!170843))

(assert (= start!37654 b!170844))

(declare-fun m!269979 () Bool)

(assert (=> start!37654 m!269979))

(declare-fun m!269981 () Bool)

(assert (=> b!170842 m!269981))

(declare-fun m!269983 () Bool)

(assert (=> b!170843 m!269983))

(declare-fun m!269985 () Bool)

(assert (=> b!170843 m!269985))

(declare-fun m!269987 () Bool)

(assert (=> b!170844 m!269987))

(push 1)

(assert (not start!37654))

(assert (not b!170844))

(assert (not b!170842))

(assert (not b!170843))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60337 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60337 (= (inv!12 bs!64) (invariant!0 (currentBit!8439 bs!64) (currentByte!8444 bs!64) (size!4014 (buf!4457 bs!64))))))

(declare-fun bs!15015 () Bool)

(assert (= bs!15015 d!60337))

(declare-fun m!269997 () Bool)

(assert (=> bs!15015 m!269997))

(assert (=> start!37654 d!60337))

(declare-fun d!60345 () Bool)

(assert (=> d!60345 (= (array_inv!3755 (buf!4457 bs!64)) (bvsge (size!4014 (buf!4457 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170844 d!60345))

(declare-fun d!60347 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60347 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4014 (buf!4457 bs!64))) ((_ sign_extend 32) (currentByte!8444 bs!64)) ((_ sign_extend 32) (currentBit!8439 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4014 (buf!4457 bs!64))) ((_ sign_extend 32) (currentByte!8444 bs!64)) ((_ sign_extend 32) (currentBit!8439 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15016 () Bool)

(assert (= bs!15016 d!60347))

(declare-fun m!269999 () Bool)

(assert (=> bs!15016 m!269999))

(assert (=> b!170842 d!60347))

(declare-fun d!60349 () Bool)

(assert (=> d!60349 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4014 (buf!4457 bs!64))) ((_ sign_extend 32) (currentByte!8444 bs!64)) ((_ sign_extend 32) (currentBit!8439 bs!64))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4014 (buf!4457 bs!64))) ((_ sign_extend 32) (currentByte!8444 bs!64)) ((_ sign_extend 32) (currentBit!8439 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15017 () Bool)

(assert (= bs!15017 d!60349))

(assert (=> bs!15017 m!269999))

(assert (=> b!170843 d!60349))

(declare-datatypes ((tuple2!14670 0))(
  ( (tuple2!14671 (_1!7968 Bool) (_2!7968 BitStream!7166)) )
))
(declare-fun lt!263363 () tuple2!14670)

(declare-fun d!60351 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!7166 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14670)

(assert (=> d!60351 (= lt!263363 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60351 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14665 (_2!7968 lt!263363) (_1!7968 lt!263363)))))

(declare-fun bs!15020 () Bool)

(assert (= bs!15020 d!60351))

(declare-fun m!270005 () Bool)

(assert (=> bs!15020 m!270005))

(assert (=> b!170843 d!60351))

(push 1)

(assert (not d!60337))

(assert (not d!60351))

(assert (not d!60347))

(assert (not d!60349))

(check-sat)

(pop 1)

(push 1)

(check-sat)


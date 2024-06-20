; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39368 () Bool)

(assert start!39368)

(declare-fun b!177062 () Bool)

(declare-fun res!146751 () Bool)

(declare-fun e!123396 () Bool)

(assert (=> b!177062 (=> res!146751 e!123396)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!177062 (= res!146751 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!177063 () Bool)

(declare-fun e!123398 () Bool)

(declare-fun e!123395 () Bool)

(assert (=> b!177063 (= e!123398 e!123395)))

(declare-fun res!146746 () Bool)

(assert (=> b!177063 (=> (not res!146746) (not e!123395))))

(declare-datatypes ((array!9560 0))(
  ( (array!9561 (arr!5146 (Array (_ BitVec 32) (_ BitVec 8))) (size!4216 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7540 0))(
  ( (BitStream!7541 (buf!4659 array!9560) (currentByte!8830 (_ BitVec 32)) (currentBit!8825 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12746 0))(
  ( (Unit!12747) )
))
(declare-datatypes ((tuple2!15254 0))(
  ( (tuple2!15255 (_1!8272 Unit!12746) (_2!8272 BitStream!7540)) )
))
(declare-fun lt!272186 () tuple2!15254)

(declare-datatypes ((tuple2!15256 0))(
  ( (tuple2!15257 (_1!8273 BitStream!7540) (_2!8273 Bool)) )
))
(declare-fun lt!272188 () tuple2!15256)

(declare-fun lt!272187 () Bool)

(assert (=> b!177063 (= res!146746 (and (= (_2!8273 lt!272188) lt!272187) (= (_1!8273 lt!272188) (_2!8272 lt!272186))))))

(declare-fun thiss!1204 () BitStream!7540)

(declare-fun readBitPure!0 (BitStream!7540) tuple2!15256)

(declare-fun readerFrom!0 (BitStream!7540 (_ BitVec 32) (_ BitVec 32)) BitStream!7540)

(assert (=> b!177063 (= lt!272188 (readBitPure!0 (readerFrom!0 (_2!8272 lt!272186) (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204))))))

(declare-fun b!177064 () Bool)

(declare-fun lt!272185 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177064 (= e!123395 (= (bitIndex!0 (size!4216 (buf!4659 (_1!8273 lt!272188))) (currentByte!8830 (_1!8273 lt!272188)) (currentBit!8825 (_1!8273 lt!272188))) lt!272185))))

(declare-fun b!177065 () Bool)

(declare-fun res!146747 () Bool)

(declare-fun e!123399 () Bool)

(assert (=> b!177065 (=> (not res!146747) (not e!123399))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177065 (= res!146747 (invariant!0 (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204) (size!4216 (buf!4659 thiss!1204))))))

(declare-fun b!177066 () Bool)

(declare-fun res!146748 () Bool)

(assert (=> b!177066 (=> (not res!146748) (not e!123398))))

(declare-fun isPrefixOf!0 (BitStream!7540 BitStream!7540) Bool)

(assert (=> b!177066 (= res!146748 (isPrefixOf!0 thiss!1204 (_2!8272 lt!272186)))))

(declare-fun b!177067 () Bool)

(declare-fun res!146745 () Bool)

(assert (=> b!177067 (=> (not res!146745) (not e!123399))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177067 (= res!146745 (validate_offset_bits!1 ((_ sign_extend 32) (size!4216 (buf!4659 thiss!1204))) ((_ sign_extend 32) (currentByte!8830 thiss!1204)) ((_ sign_extend 32) (currentBit!8825 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177068 () Bool)

(declare-fun res!146749 () Bool)

(assert (=> b!177068 (=> (not res!146749) (not e!123399))))

(assert (=> b!177068 (= res!146749 (not (= i!590 nBits!348)))))

(declare-fun b!177069 () Bool)

(assert (=> b!177069 (= e!123399 (not e!123396))))

(declare-fun res!146743 () Bool)

(assert (=> b!177069 (=> res!146743 e!123396)))

(assert (=> b!177069 (= res!146743 (not (= (bitIndex!0 (size!4216 (buf!4659 (_2!8272 lt!272186))) (currentByte!8830 (_2!8272 lt!272186)) (currentBit!8825 (_2!8272 lt!272186))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4216 (buf!4659 thiss!1204)) (currentByte!8830 thiss!1204) (currentBit!8825 thiss!1204))))))))

(declare-fun e!123394 () Bool)

(assert (=> b!177069 e!123394))

(declare-fun res!146742 () Bool)

(assert (=> b!177069 (=> (not res!146742) (not e!123394))))

(assert (=> b!177069 (= res!146742 (= (size!4216 (buf!4659 thiss!1204)) (size!4216 (buf!4659 (_2!8272 lt!272186)))))))

(declare-fun appendBit!0 (BitStream!7540 Bool) tuple2!15254)

(assert (=> b!177069 (= lt!272186 (appendBit!0 thiss!1204 lt!272187))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177069 (= lt!272187 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177070 () Bool)

(assert (=> b!177070 (= e!123396 (validate_offset_bits!1 ((_ sign_extend 32) (size!4216 (buf!4659 (_2!8272 lt!272186)))) ((_ sign_extend 32) (currentByte!8830 (_2!8272 lt!272186))) ((_ sign_extend 32) (currentBit!8825 (_2!8272 lt!272186))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!177072 () Bool)

(assert (=> b!177072 (= e!123394 e!123398)))

(declare-fun res!146750 () Bool)

(assert (=> b!177072 (=> (not res!146750) (not e!123398))))

(declare-fun lt!272189 () (_ BitVec 64))

(assert (=> b!177072 (= res!146750 (= lt!272185 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272189)))))

(assert (=> b!177072 (= lt!272185 (bitIndex!0 (size!4216 (buf!4659 (_2!8272 lt!272186))) (currentByte!8830 (_2!8272 lt!272186)) (currentBit!8825 (_2!8272 lt!272186))))))

(assert (=> b!177072 (= lt!272189 (bitIndex!0 (size!4216 (buf!4659 thiss!1204)) (currentByte!8830 thiss!1204) (currentBit!8825 thiss!1204)))))

(declare-fun b!177071 () Bool)

(declare-fun e!123397 () Bool)

(declare-fun array_inv!3957 (array!9560) Bool)

(assert (=> b!177071 (= e!123397 (array_inv!3957 (buf!4659 thiss!1204)))))

(declare-fun res!146744 () Bool)

(assert (=> start!39368 (=> (not res!146744) (not e!123399))))

(assert (=> start!39368 (= res!146744 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39368 e!123399))

(assert (=> start!39368 true))

(declare-fun inv!12 (BitStream!7540) Bool)

(assert (=> start!39368 (and (inv!12 thiss!1204) e!123397)))

(assert (= (and start!39368 res!146744) b!177067))

(assert (= (and b!177067 res!146745) b!177065))

(assert (= (and b!177065 res!146747) b!177068))

(assert (= (and b!177068 res!146749) b!177069))

(assert (= (and b!177069 res!146742) b!177072))

(assert (= (and b!177072 res!146750) b!177066))

(assert (= (and b!177066 res!146748) b!177063))

(assert (= (and b!177063 res!146746) b!177064))

(assert (= (and b!177069 (not res!146743)) b!177062))

(assert (= (and b!177062 (not res!146751)) b!177070))

(assert (= start!39368 b!177071))

(declare-fun m!277039 () Bool)

(assert (=> b!177072 m!277039))

(declare-fun m!277041 () Bool)

(assert (=> b!177072 m!277041))

(declare-fun m!277043 () Bool)

(assert (=> start!39368 m!277043))

(assert (=> b!177069 m!277039))

(assert (=> b!177069 m!277041))

(declare-fun m!277045 () Bool)

(assert (=> b!177069 m!277045))

(declare-fun m!277047 () Bool)

(assert (=> b!177063 m!277047))

(assert (=> b!177063 m!277047))

(declare-fun m!277049 () Bool)

(assert (=> b!177063 m!277049))

(declare-fun m!277051 () Bool)

(assert (=> b!177065 m!277051))

(declare-fun m!277053 () Bool)

(assert (=> b!177071 m!277053))

(declare-fun m!277055 () Bool)

(assert (=> b!177070 m!277055))

(declare-fun m!277057 () Bool)

(assert (=> b!177064 m!277057))

(declare-fun m!277059 () Bool)

(assert (=> b!177067 m!277059))

(declare-fun m!277061 () Bool)

(assert (=> b!177066 m!277061))

(push 1)

(assert (not b!177066))

(assert (not b!177063))

(assert (not start!39368))

(assert (not b!177065))

(assert (not b!177070))

(assert (not b!177069))

(assert (not b!177064))

(assert (not b!177067))

(assert (not b!177071))

(assert (not b!177072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62371 () Bool)

(declare-datatypes ((tuple2!15266 0))(
  ( (tuple2!15267 (_1!8278 Bool) (_2!8278 BitStream!7540)) )
))
(declare-fun lt!272246 () tuple2!15266)

(declare-fun readBit!0 (BitStream!7540) tuple2!15266)

(assert (=> d!62371 (= lt!272246 (readBit!0 (readerFrom!0 (_2!8272 lt!272186) (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204))))))

(assert (=> d!62371 (= (readBitPure!0 (readerFrom!0 (_2!8272 lt!272186) (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204))) (tuple2!15257 (_2!8278 lt!272246) (_1!8278 lt!272246)))))

(declare-fun bs!15556 () Bool)

(assert (= bs!15556 d!62371))

(assert (=> bs!15556 m!277047))

(declare-fun m!277117 () Bool)

(assert (=> bs!15556 m!277117))

(assert (=> b!177063 d!62371))

(declare-fun d!62375 () Bool)

(declare-fun e!123455 () Bool)

(assert (=> d!62375 e!123455))

(declare-fun res!146832 () Bool)

(assert (=> d!62375 (=> (not res!146832) (not e!123455))))

(assert (=> d!62375 (= res!146832 (invariant!0 (currentBit!8825 (_2!8272 lt!272186)) (currentByte!8830 (_2!8272 lt!272186)) (size!4216 (buf!4659 (_2!8272 lt!272186)))))))

(assert (=> d!62375 (= (readerFrom!0 (_2!8272 lt!272186) (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204)) (BitStream!7541 (buf!4659 (_2!8272 lt!272186)) (currentByte!8830 thiss!1204) (currentBit!8825 thiss!1204)))))

(declare-fun b!177158 () Bool)

(assert (=> b!177158 (= e!123455 (invariant!0 (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204) (size!4216 (buf!4659 (_2!8272 lt!272186)))))))

(assert (= (and d!62375 res!146832) b!177158))

(declare-fun m!277121 () Bool)

(assert (=> d!62375 m!277121))

(declare-fun m!277123 () Bool)

(assert (=> b!177158 m!277123))

(assert (=> b!177063 d!62375))

(declare-fun d!62381 () Bool)

(declare-fun e!123461 () Bool)

(assert (=> d!62381 e!123461))

(declare-fun res!146842 () Bool)

(assert (=> d!62381 (=> (not res!146842) (not e!123461))))

(declare-fun lt!272267 () (_ BitVec 64))

(declare-fun lt!272263 () (_ BitVec 64))

(declare-fun lt!272264 () (_ BitVec 64))

(assert (=> d!62381 (= res!146842 (= lt!272263 (bvsub lt!272264 lt!272267)))))

(assert (=> d!62381 (or (= (bvand lt!272264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272264 lt!272267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62381 (= lt!272267 (remainingBits!0 ((_ sign_extend 32) (size!4216 (buf!4659 (_1!8273 lt!272188)))) ((_ sign_extend 32) (currentByte!8830 (_1!8273 lt!272188))) ((_ sign_extend 32) (currentBit!8825 (_1!8273 lt!272188)))))))

(declare-fun lt!272262 () (_ BitVec 64))

(declare-fun lt!272265 () (_ BitVec 64))

(assert (=> d!62381 (= lt!272264 (bvmul lt!272262 lt!272265))))

(assert (=> d!62381 (or (= lt!272262 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272265 (bvsdiv (bvmul lt!272262 lt!272265) lt!272262)))))

(assert (=> d!62381 (= lt!272265 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62381 (= lt!272262 ((_ sign_extend 32) (size!4216 (buf!4659 (_1!8273 lt!272188)))))))

(assert (=> d!62381 (= lt!272263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8830 (_1!8273 lt!272188))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8825 (_1!8273 lt!272188)))))))

(assert (=> d!62381 (invariant!0 (currentBit!8825 (_1!8273 lt!272188)) (currentByte!8830 (_1!8273 lt!272188)) (size!4216 (buf!4659 (_1!8273 lt!272188))))))

(assert (=> d!62381 (= (bitIndex!0 (size!4216 (buf!4659 (_1!8273 lt!272188))) (currentByte!8830 (_1!8273 lt!272188)) (currentBit!8825 (_1!8273 lt!272188))) lt!272263)))

(declare-fun b!177166 () Bool)

(declare-fun res!146841 () Bool)

(assert (=> b!177166 (=> (not res!146841) (not e!123461))))

(assert (=> b!177166 (= res!146841 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272263))))

(declare-fun b!177167 () Bool)

(declare-fun lt!272266 () (_ BitVec 64))

(assert (=> b!177167 (= e!123461 (bvsle lt!272263 (bvmul lt!272266 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177167 (or (= lt!272266 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272266 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272266)))))

(assert (=> b!177167 (= lt!272266 ((_ sign_extend 32) (size!4216 (buf!4659 (_1!8273 lt!272188)))))))

(assert (= (and d!62381 res!146842) b!177166))

(assert (= (and b!177166 res!146841) b!177167))

(declare-fun m!277129 () Bool)

(assert (=> d!62381 m!277129))

(declare-fun m!277131 () Bool)

(assert (=> d!62381 m!277131))

(assert (=> b!177064 d!62381))

(declare-fun d!62389 () Bool)

(declare-fun e!123462 () Bool)

(assert (=> d!62389 e!123462))

(declare-fun res!146844 () Bool)

(assert (=> d!62389 (=> (not res!146844) (not e!123462))))

(declare-fun lt!272273 () (_ BitVec 64))

(declare-fun lt!272270 () (_ BitVec 64))

(declare-fun lt!272269 () (_ BitVec 64))

(assert (=> d!62389 (= res!146844 (= lt!272269 (bvsub lt!272270 lt!272273)))))

(assert (=> d!62389 (or (= (bvand lt!272270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272270 lt!272273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62389 (= lt!272273 (remainingBits!0 ((_ sign_extend 32) (size!4216 (buf!4659 (_2!8272 lt!272186)))) ((_ sign_extend 32) (currentByte!8830 (_2!8272 lt!272186))) ((_ sign_extend 32) (currentBit!8825 (_2!8272 lt!272186)))))))

(declare-fun lt!272268 () (_ BitVec 64))

(declare-fun lt!272271 () (_ BitVec 64))

(assert (=> d!62389 (= lt!272270 (bvmul lt!272268 lt!272271))))

(assert (=> d!62389 (or (= lt!272268 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272271 (bvsdiv (bvmul lt!272268 lt!272271) lt!272268)))))

(assert (=> d!62389 (= lt!272271 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62389 (= lt!272268 ((_ sign_extend 32) (size!4216 (buf!4659 (_2!8272 lt!272186)))))))

(assert (=> d!62389 (= lt!272269 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8830 (_2!8272 lt!272186))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8825 (_2!8272 lt!272186)))))))

(assert (=> d!62389 (invariant!0 (currentBit!8825 (_2!8272 lt!272186)) (currentByte!8830 (_2!8272 lt!272186)) (size!4216 (buf!4659 (_2!8272 lt!272186))))))

(assert (=> d!62389 (= (bitIndex!0 (size!4216 (buf!4659 (_2!8272 lt!272186))) (currentByte!8830 (_2!8272 lt!272186)) (currentBit!8825 (_2!8272 lt!272186))) lt!272269)))

(declare-fun b!177168 () Bool)

(declare-fun res!146843 () Bool)

(assert (=> b!177168 (=> (not res!146843) (not e!123462))))

(assert (=> b!177168 (= res!146843 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272269))))

(declare-fun b!177169 () Bool)

(declare-fun lt!272272 () (_ BitVec 64))

(assert (=> b!177169 (= e!123462 (bvsle lt!272269 (bvmul lt!272272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177169 (or (= lt!272272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272272)))))

(assert (=> b!177169 (= lt!272272 ((_ sign_extend 32) (size!4216 (buf!4659 (_2!8272 lt!272186)))))))

(assert (= (and d!62389 res!146844) b!177168))

(assert (= (and b!177168 res!146843) b!177169))

(declare-fun m!277133 () Bool)

(assert (=> d!62389 m!277133))

(assert (=> d!62389 m!277121))

(assert (=> b!177069 d!62389))

(declare-fun d!62391 () Bool)

(declare-fun e!123463 () Bool)

(assert (=> d!62391 e!123463))

(declare-fun res!146846 () Bool)

(assert (=> d!62391 (=> (not res!146846) (not e!123463))))

(declare-fun lt!272276 () (_ BitVec 64))

(declare-fun lt!272275 () (_ BitVec 64))

(declare-fun lt!272279 () (_ BitVec 64))

(assert (=> d!62391 (= res!146846 (= lt!272275 (bvsub lt!272276 lt!272279)))))

(assert (=> d!62391 (or (= (bvand lt!272276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272279 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272276 lt!272279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62391 (= lt!272279 (remainingBits!0 ((_ sign_extend 32) (size!4216 (buf!4659 thiss!1204))) ((_ sign_extend 32) (currentByte!8830 thiss!1204)) ((_ sign_extend 32) (currentBit!8825 thiss!1204))))))

(declare-fun lt!272274 () (_ BitVec 64))

(declare-fun lt!272277 () (_ BitVec 64))

(assert (=> d!62391 (= lt!272276 (bvmul lt!272274 lt!272277))))

(assert (=> d!62391 (or (= lt!272274 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272277 (bvsdiv (bvmul lt!272274 lt!272277) lt!272274)))))

(assert (=> d!62391 (= lt!272277 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62391 (= lt!272274 ((_ sign_extend 32) (size!4216 (buf!4659 thiss!1204))))))

(assert (=> d!62391 (= lt!272275 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8830 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8825 thiss!1204))))))

(assert (=> d!62391 (invariant!0 (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204) (size!4216 (buf!4659 thiss!1204)))))

(assert (=> d!62391 (= (bitIndex!0 (size!4216 (buf!4659 thiss!1204)) (currentByte!8830 thiss!1204) (currentBit!8825 thiss!1204)) lt!272275)))

(declare-fun b!177170 () Bool)

(declare-fun res!146845 () Bool)

(assert (=> b!177170 (=> (not res!146845) (not e!123463))))

(assert (=> b!177170 (= res!146845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272275))))

(declare-fun b!177171 () Bool)

(declare-fun lt!272278 () (_ BitVec 64))

(assert (=> b!177171 (= e!123463 (bvsle lt!272275 (bvmul lt!272278 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177171 (or (= lt!272278 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272278 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272278)))))

(assert (=> b!177171 (= lt!272278 ((_ sign_extend 32) (size!4216 (buf!4659 thiss!1204))))))

(assert (= (and d!62391 res!146846) b!177170))

(assert (= (and b!177170 res!146845) b!177171))

(declare-fun m!277135 () Bool)

(assert (=> d!62391 m!277135))

(assert (=> d!62391 m!277051))

(assert (=> b!177069 d!62391))

(declare-fun b!177183 () Bool)

(declare-fun e!123469 () Bool)

(declare-fun e!123468 () Bool)

(assert (=> b!177183 (= e!123469 e!123468)))

(declare-fun res!146858 () Bool)

(assert (=> b!177183 (=> (not res!146858) (not e!123468))))

(declare-fun lt!272289 () tuple2!15256)

(declare-fun lt!272290 () tuple2!15254)

(assert (=> b!177183 (= res!146858 (and (= (_2!8273 lt!272289) lt!272187) (= (_1!8273 lt!272289) (_2!8272 lt!272290))))))

(assert (=> b!177183 (= lt!272289 (readBitPure!0 (readerFrom!0 (_2!8272 lt!272290) (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204))))))

(declare-fun b!177184 () Bool)

(assert (=> b!177184 (= e!123468 (= (bitIndex!0 (size!4216 (buf!4659 (_1!8273 lt!272289))) (currentByte!8830 (_1!8273 lt!272289)) (currentBit!8825 (_1!8273 lt!272289))) (bitIndex!0 (size!4216 (buf!4659 (_2!8272 lt!272290))) (currentByte!8830 (_2!8272 lt!272290)) (currentBit!8825 (_2!8272 lt!272290)))))))

(declare-fun b!177181 () Bool)

(declare-fun res!146855 () Bool)

(assert (=> b!177181 (=> (not res!146855) (not e!123469))))

(declare-fun lt!272288 () (_ BitVec 64))

(declare-fun lt!272291 () (_ BitVec 64))

(assert (=> b!177181 (= res!146855 (= (bitIndex!0 (size!4216 (buf!4659 (_2!8272 lt!272290))) (currentByte!8830 (_2!8272 lt!272290)) (currentBit!8825 (_2!8272 lt!272290))) (bvadd lt!272288 lt!272291)))))

(assert (=> b!177181 (or (not (= (bvand lt!272288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272291 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!272288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!272288 lt!272291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177181 (= lt!272291 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!177181 (= lt!272288 (bitIndex!0 (size!4216 (buf!4659 thiss!1204)) (currentByte!8830 thiss!1204) (currentBit!8825 thiss!1204)))))

(declare-fun b!177182 () Bool)

(declare-fun res!146856 () Bool)

(assert (=> b!177182 (=> (not res!146856) (not e!123469))))

(assert (=> b!177182 (= res!146856 (isPrefixOf!0 thiss!1204 (_2!8272 lt!272290)))))

(declare-fun d!62393 () Bool)

(assert (=> d!62393 e!123469))

(declare-fun res!146857 () Bool)

(assert (=> d!62393 (=> (not res!146857) (not e!123469))))

(assert (=> d!62393 (= res!146857 (= (size!4216 (buf!4659 thiss!1204)) (size!4216 (buf!4659 (_2!8272 lt!272290)))))))

(declare-fun choose!16 (BitStream!7540 Bool) tuple2!15254)

(assert (=> d!62393 (= lt!272290 (choose!16 thiss!1204 lt!272187))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62393 (validate_offset_bit!0 ((_ sign_extend 32) (size!4216 (buf!4659 thiss!1204))) ((_ sign_extend 32) (currentByte!8830 thiss!1204)) ((_ sign_extend 32) (currentBit!8825 thiss!1204)))))

(assert (=> d!62393 (= (appendBit!0 thiss!1204 lt!272187) lt!272290)))

(assert (= (and d!62393 res!146857) b!177181))

(assert (= (and b!177181 res!146855) b!177182))

(assert (= (and b!177182 res!146856) b!177183))

(assert (= (and b!177183 res!146858) b!177184))

(declare-fun m!277137 () Bool)

(assert (=> b!177181 m!277137))

(assert (=> b!177181 m!277041))

(declare-fun m!277139 () Bool)

(assert (=> d!62393 m!277139))

(declare-fun m!277141 () Bool)

(assert (=> d!62393 m!277141))

(declare-fun m!277143 () Bool)

(assert (=> b!177184 m!277143))

(assert (=> b!177184 m!277137))

(declare-fun m!277145 () Bool)

(assert (=> b!177183 m!277145))

(assert (=> b!177183 m!277145))

(declare-fun m!277147 () Bool)

(assert (=> b!177183 m!277147))

(declare-fun m!277149 () Bool)

(assert (=> b!177182 m!277149))

(assert (=> b!177069 d!62393))

(declare-fun d!62395 () Bool)

(assert (=> d!62395 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204) (size!4216 (buf!4659 thiss!1204))))))

(declare-fun bs!15558 () Bool)

(assert (= bs!15558 d!62395))

(assert (=> bs!15558 m!277051))

(assert (=> start!39368 d!62395))

(declare-fun d!62399 () Bool)

(assert (=> d!62399 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4216 (buf!4659 thiss!1204))) ((_ sign_extend 32) (currentByte!8830 thiss!1204)) ((_ sign_extend 32) (currentBit!8825 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4216 (buf!4659 thiss!1204))) ((_ sign_extend 32) (currentByte!8830 thiss!1204)) ((_ sign_extend 32) (currentBit!8825 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15560 () Bool)

(assert (= bs!15560 d!62399))

(assert (=> bs!15560 m!277135))

(assert (=> b!177067 d!62399))

(declare-fun d!62402 () Bool)

(declare-fun res!146880 () Bool)

(declare-fun e!123481 () Bool)

(assert (=> d!62402 (=> (not res!146880) (not e!123481))))

(assert (=> d!62402 (= res!146880 (= (size!4216 (buf!4659 thiss!1204)) (size!4216 (buf!4659 (_2!8272 lt!272186)))))))

(assert (=> d!62402 (= (isPrefixOf!0 thiss!1204 (_2!8272 lt!272186)) e!123481)))

(declare-fun b!177204 () Bool)

(declare-fun res!146879 () Bool)

(assert (=> b!177204 (=> (not res!146879) (not e!123481))))

(assert (=> b!177204 (= res!146879 (bvsle (bitIndex!0 (size!4216 (buf!4659 thiss!1204)) (currentByte!8830 thiss!1204) (currentBit!8825 thiss!1204)) (bitIndex!0 (size!4216 (buf!4659 (_2!8272 lt!272186))) (currentByte!8830 (_2!8272 lt!272186)) (currentBit!8825 (_2!8272 lt!272186)))))))

(declare-fun b!177205 () Bool)

(declare-fun e!123480 () Bool)

(assert (=> b!177205 (= e!123481 e!123480)))

(declare-fun res!146878 () Bool)

(assert (=> b!177205 (=> res!146878 e!123480)))

(assert (=> b!177205 (= res!146878 (= (size!4216 (buf!4659 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177206 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9560 array!9560 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177206 (= e!123480 (arrayBitRangesEq!0 (buf!4659 thiss!1204) (buf!4659 (_2!8272 lt!272186)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4216 (buf!4659 thiss!1204)) (currentByte!8830 thiss!1204) (currentBit!8825 thiss!1204))))))

(assert (= (and d!62402 res!146880) b!177204))

(assert (= (and b!177204 res!146879) b!177205))

(assert (= (and b!177205 (not res!146878)) b!177206))

(assert (=> b!177204 m!277041))

(assert (=> b!177204 m!277039))

(assert (=> b!177206 m!277041))

(assert (=> b!177206 m!277041))

(declare-fun m!277155 () Bool)

(assert (=> b!177206 m!277155))

(assert (=> b!177066 d!62402))

(declare-fun d!62407 () Bool)

(assert (=> d!62407 (= (array_inv!3957 (buf!4659 thiss!1204)) (bvsge (size!4216 (buf!4659 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177071 d!62407))

(assert (=> b!177072 d!62389))

(assert (=> b!177072 d!62391))

(declare-fun d!62411 () Bool)

(assert (=> d!62411 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4216 (buf!4659 (_2!8272 lt!272186)))) ((_ sign_extend 32) (currentByte!8830 (_2!8272 lt!272186))) ((_ sign_extend 32) (currentBit!8825 (_2!8272 lt!272186))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4216 (buf!4659 (_2!8272 lt!272186)))) ((_ sign_extend 32) (currentByte!8830 (_2!8272 lt!272186))) ((_ sign_extend 32) (currentBit!8825 (_2!8272 lt!272186)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15562 () Bool)

(assert (= bs!15562 d!62411))

(assert (=> bs!15562 m!277133))

(assert (=> b!177070 d!62411))

(declare-fun d!62415 () Bool)

(assert (=> d!62415 (= (invariant!0 (currentBit!8825 thiss!1204) (currentByte!8830 thiss!1204) (size!4216 (buf!4659 thiss!1204))) (and (bvsge (currentBit!8825 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8825 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8830 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8830 thiss!1204) (size!4216 (buf!4659 thiss!1204))) (and (= (currentBit!8825 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8830 thiss!1204) (size!4216 (buf!4659 thiss!1204)))))))))

(assert (=> b!177065 d!62415))

(push 1)

(assert (not d!62375))

(assert (not d!62395))

(assert (not d!62393))

(assert (not d!62411))

(assert (not b!177183))

(assert (not b!177206))

(assert (not b!177158))

(assert (not d!62381))

(assert (not d!62389))

(assert (not d!62391))

(assert (not b!177204))

(assert (not d!62399))

(assert (not b!177184))

(assert (not b!177181))

(assert (not d!62371))

(assert (not b!177182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


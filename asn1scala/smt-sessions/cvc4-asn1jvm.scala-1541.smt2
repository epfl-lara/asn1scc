; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43120 () Bool)

(assert start!43120)

(declare-fun b!203307 () Bool)

(declare-fun e!139329 () Bool)

(declare-fun e!139334 () Bool)

(assert (=> b!203307 (= e!139329 e!139334)))

(declare-fun res!170317 () Bool)

(assert (=> b!203307 (=> (not res!170317) (not e!139334))))

(declare-datatypes ((array!10311 0))(
  ( (array!10312 (arr!5466 (Array (_ BitVec 32) (_ BitVec 8))) (size!4536 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8180 0))(
  ( (BitStream!8181 (buf!5041 array!10311) (currentByte!9499 (_ BitVec 32)) (currentBit!9494 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17398 0))(
  ( (tuple2!17399 (_1!9351 BitStream!8180) (_2!9351 Bool)) )
))
(declare-fun lt!317168 () tuple2!17398)

(declare-datatypes ((Unit!14464 0))(
  ( (Unit!14465) )
))
(declare-datatypes ((tuple2!17400 0))(
  ( (tuple2!17401 (_1!9352 Unit!14464) (_2!9352 BitStream!8180)) )
))
(declare-fun lt!317173 () tuple2!17400)

(declare-fun lt!317176 () Bool)

(assert (=> b!203307 (= res!170317 (and (= (_2!9351 lt!317168) lt!317176) (= (_1!9351 lt!317168) (_2!9352 lt!317173))))))

(declare-fun thiss!1204 () BitStream!8180)

(declare-fun readBitPure!0 (BitStream!8180) tuple2!17398)

(declare-fun readerFrom!0 (BitStream!8180 (_ BitVec 32) (_ BitVec 32)) BitStream!8180)

(assert (=> b!203307 (= lt!317168 (readBitPure!0 (readerFrom!0 (_2!9352 lt!317173) (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204))))))

(declare-fun b!203308 () Bool)

(declare-fun lt!317169 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203308 (= e!139334 (= (bitIndex!0 (size!4536 (buf!5041 (_1!9351 lt!317168))) (currentByte!9499 (_1!9351 lt!317168)) (currentBit!9494 (_1!9351 lt!317168))) lt!317169))))

(declare-fun b!203309 () Bool)

(declare-fun e!139331 () Bool)

(assert (=> b!203309 (= e!139331 e!139329)))

(declare-fun res!170313 () Bool)

(assert (=> b!203309 (=> (not res!170313) (not e!139329))))

(declare-fun lt!317172 () (_ BitVec 64))

(assert (=> b!203309 (= res!170313 (= lt!317169 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317172)))))

(assert (=> b!203309 (= lt!317169 (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))))))

(assert (=> b!203309 (= lt!317172 (bitIndex!0 (size!4536 (buf!5041 thiss!1204)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204)))))

(declare-fun b!203310 () Bool)

(declare-fun res!170318 () Bool)

(declare-fun e!139335 () Bool)

(assert (=> b!203310 (=> (not res!170318) (not e!139335))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!203310 (= res!170318 (invariant!0 (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204) (size!4536 (buf!5041 thiss!1204))))))

(declare-fun b!203312 () Bool)

(declare-fun e!139332 () Bool)

(declare-fun array_inv!4277 (array!10311) Bool)

(assert (=> b!203312 (= e!139332 (array_inv!4277 (buf!5041 thiss!1204)))))

(declare-fun res!170321 () Bool)

(assert (=> start!43120 (=> (not res!170321) (not e!139335))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43120 (= res!170321 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43120 e!139335))

(assert (=> start!43120 true))

(declare-fun inv!12 (BitStream!8180) Bool)

(assert (=> start!43120 (and (inv!12 thiss!1204) e!139332)))

(declare-fun b!203311 () Bool)

(declare-fun res!170320 () Bool)

(assert (=> b!203311 (=> (not res!170320) (not e!139335))))

(assert (=> b!203311 (= res!170320 (not (= i!590 nBits!348)))))

(declare-fun b!203313 () Bool)

(declare-fun res!170316 () Bool)

(assert (=> b!203313 (=> (not res!170316) (not e!139335))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203313 (= res!170316 (validate_offset_bits!1 ((_ sign_extend 32) (size!4536 (buf!5041 thiss!1204))) ((_ sign_extend 32) (currentByte!9499 thiss!1204)) ((_ sign_extend 32) (currentBit!9494 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!203314 () Bool)

(declare-fun e!139330 () Bool)

(declare-fun lt!317174 () (_ BitVec 64))

(declare-fun lt!317171 () (_ BitVec 64))

(assert (=> b!203314 (= e!139330 (or (= lt!317174 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317174 (bvand (bvsub lt!317171 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!203314 (= lt!317174 (bvand lt!317171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!317175 () (_ BitVec 64))

(assert (=> b!203314 (= lt!317171 (bvsub (bvadd lt!317175 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))

(declare-fun lt!317177 () tuple2!17400)

(declare-fun isPrefixOf!0 (BitStream!8180 BitStream!8180) Bool)

(assert (=> b!203314 (isPrefixOf!0 thiss!1204 (_2!9352 lt!317177))))

(declare-fun lt!317170 () Unit!14464)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8180 BitStream!8180 BitStream!8180) Unit!14464)

(assert (=> b!203314 (= lt!317170 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9352 lt!317173) (_2!9352 lt!317177)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8180 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17400)

(assert (=> b!203314 (= lt!317177 (appendBitsLSBFirstLoopTR!0 (_2!9352 lt!317173) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!203315 () Bool)

(assert (=> b!203315 (= e!139335 (not e!139330))))

(declare-fun res!170315 () Bool)

(assert (=> b!203315 (=> res!170315 e!139330)))

(declare-fun lt!317167 () (_ BitVec 64))

(assert (=> b!203315 (= res!170315 (not (= lt!317175 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317167))))))

(assert (=> b!203315 (= lt!317175 (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))))))

(assert (=> b!203315 (= lt!317167 (bitIndex!0 (size!4536 (buf!5041 thiss!1204)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204)))))

(assert (=> b!203315 e!139331))

(declare-fun res!170319 () Bool)

(assert (=> b!203315 (=> (not res!170319) (not e!139331))))

(assert (=> b!203315 (= res!170319 (= (size!4536 (buf!5041 thiss!1204)) (size!4536 (buf!5041 (_2!9352 lt!317173)))))))

(declare-fun appendBit!0 (BitStream!8180 Bool) tuple2!17400)

(assert (=> b!203315 (= lt!317173 (appendBit!0 thiss!1204 lt!317176))))

(assert (=> b!203315 (= lt!317176 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!203316 () Bool)

(declare-fun res!170314 () Bool)

(assert (=> b!203316 (=> (not res!170314) (not e!139329))))

(assert (=> b!203316 (= res!170314 (isPrefixOf!0 thiss!1204 (_2!9352 lt!317173)))))

(assert (= (and start!43120 res!170321) b!203313))

(assert (= (and b!203313 res!170316) b!203310))

(assert (= (and b!203310 res!170318) b!203311))

(assert (= (and b!203311 res!170320) b!203315))

(assert (= (and b!203315 res!170319) b!203309))

(assert (= (and b!203309 res!170313) b!203316))

(assert (= (and b!203316 res!170314) b!203307))

(assert (= (and b!203307 res!170317) b!203308))

(assert (= (and b!203315 (not res!170315)) b!203314))

(assert (= start!43120 b!203312))

(declare-fun m!314105 () Bool)

(assert (=> b!203315 m!314105))

(declare-fun m!314107 () Bool)

(assert (=> b!203315 m!314107))

(declare-fun m!314109 () Bool)

(assert (=> b!203315 m!314109))

(assert (=> b!203309 m!314105))

(assert (=> b!203309 m!314107))

(declare-fun m!314111 () Bool)

(assert (=> b!203314 m!314111))

(declare-fun m!314113 () Bool)

(assert (=> b!203314 m!314113))

(declare-fun m!314115 () Bool)

(assert (=> b!203314 m!314115))

(declare-fun m!314117 () Bool)

(assert (=> b!203313 m!314117))

(declare-fun m!314119 () Bool)

(assert (=> b!203308 m!314119))

(declare-fun m!314121 () Bool)

(assert (=> b!203307 m!314121))

(assert (=> b!203307 m!314121))

(declare-fun m!314123 () Bool)

(assert (=> b!203307 m!314123))

(declare-fun m!314125 () Bool)

(assert (=> b!203310 m!314125))

(declare-fun m!314127 () Bool)

(assert (=> b!203312 m!314127))

(declare-fun m!314129 () Bool)

(assert (=> b!203316 m!314129))

(declare-fun m!314131 () Bool)

(assert (=> start!43120 m!314131))

(push 1)

(assert (not b!203312))

(assert (not b!203316))

(assert (not b!203314))

(assert (not b!203310))

(assert (not b!203307))

(assert (not start!43120))

(assert (not b!203315))

(assert (not b!203308))

(assert (not b!203309))

(assert (not b!203313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69485 () Bool)

(assert (=> d!69485 (= (array_inv!4277 (buf!5041 thiss!1204)) (bvsge (size!4536 (buf!5041 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!203312 d!69485))

(declare-fun d!69489 () Bool)

(assert (=> d!69489 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204) (size!4536 (buf!5041 thiss!1204))))))

(declare-fun bs!17126 () Bool)

(assert (= bs!17126 d!69489))

(assert (=> bs!17126 m!314125))

(assert (=> start!43120 d!69489))

(declare-fun d!69491 () Bool)

(declare-fun e!139368 () Bool)

(assert (=> d!69491 e!139368))

(declare-fun res!170375 () Bool)

(assert (=> d!69491 (=> (not res!170375) (not e!139368))))

(declare-fun lt!317241 () (_ BitVec 64))

(declare-fun lt!317243 () (_ BitVec 64))

(declare-fun lt!317240 () (_ BitVec 64))

(assert (=> d!69491 (= res!170375 (= lt!317241 (bvsub lt!317240 lt!317243)))))

(assert (=> d!69491 (or (= (bvand lt!317240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317243 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317240 lt!317243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69491 (= lt!317243 (remainingBits!0 ((_ sign_extend 32) (size!4536 (buf!5041 (_1!9351 lt!317168)))) ((_ sign_extend 32) (currentByte!9499 (_1!9351 lt!317168))) ((_ sign_extend 32) (currentBit!9494 (_1!9351 lt!317168)))))))

(declare-fun lt!317242 () (_ BitVec 64))

(declare-fun lt!317238 () (_ BitVec 64))

(assert (=> d!69491 (= lt!317240 (bvmul lt!317242 lt!317238))))

(assert (=> d!69491 (or (= lt!317242 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317238 (bvsdiv (bvmul lt!317242 lt!317238) lt!317242)))))

(assert (=> d!69491 (= lt!317238 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69491 (= lt!317242 ((_ sign_extend 32) (size!4536 (buf!5041 (_1!9351 lt!317168)))))))

(assert (=> d!69491 (= lt!317241 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9499 (_1!9351 lt!317168))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9494 (_1!9351 lt!317168)))))))

(assert (=> d!69491 (invariant!0 (currentBit!9494 (_1!9351 lt!317168)) (currentByte!9499 (_1!9351 lt!317168)) (size!4536 (buf!5041 (_1!9351 lt!317168))))))

(assert (=> d!69491 (= (bitIndex!0 (size!4536 (buf!5041 (_1!9351 lt!317168))) (currentByte!9499 (_1!9351 lt!317168)) (currentBit!9494 (_1!9351 lt!317168))) lt!317241)))

(declare-fun b!203369 () Bool)

(declare-fun res!170376 () Bool)

(assert (=> b!203369 (=> (not res!170376) (not e!139368))))

(assert (=> b!203369 (= res!170376 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317241))))

(declare-fun b!203370 () Bool)

(declare-fun lt!317239 () (_ BitVec 64))

(assert (=> b!203370 (= e!139368 (bvsle lt!317241 (bvmul lt!317239 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203370 (or (= lt!317239 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317239 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317239)))))

(assert (=> b!203370 (= lt!317239 ((_ sign_extend 32) (size!4536 (buf!5041 (_1!9351 lt!317168)))))))

(assert (= (and d!69491 res!170375) b!203369))

(assert (= (and b!203369 res!170376) b!203370))

(declare-fun m!314177 () Bool)

(assert (=> d!69491 m!314177))

(declare-fun m!314179 () Bool)

(assert (=> d!69491 m!314179))

(assert (=> b!203308 d!69491))

(declare-fun d!69503 () Bool)

(assert (=> d!69503 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4536 (buf!5041 thiss!1204))) ((_ sign_extend 32) (currentByte!9499 thiss!1204)) ((_ sign_extend 32) (currentBit!9494 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4536 (buf!5041 thiss!1204))) ((_ sign_extend 32) (currentByte!9499 thiss!1204)) ((_ sign_extend 32) (currentBit!9494 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17130 () Bool)

(assert (= bs!17130 d!69503))

(declare-fun m!314181 () Bool)

(assert (=> bs!17130 m!314181))

(assert (=> b!203313 d!69503))

(declare-fun d!69505 () Bool)

(declare-datatypes ((tuple2!17414 0))(
  ( (tuple2!17415 (_1!9359 Bool) (_2!9359 BitStream!8180)) )
))
(declare-fun lt!317246 () tuple2!17414)

(declare-fun readBit!0 (BitStream!8180) tuple2!17414)

(assert (=> d!69505 (= lt!317246 (readBit!0 (readerFrom!0 (_2!9352 lt!317173) (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204))))))

(assert (=> d!69505 (= (readBitPure!0 (readerFrom!0 (_2!9352 lt!317173) (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204))) (tuple2!17399 (_2!9359 lt!317246) (_1!9359 lt!317246)))))

(declare-fun bs!17131 () Bool)

(assert (= bs!17131 d!69505))

(assert (=> bs!17131 m!314121))

(declare-fun m!314183 () Bool)

(assert (=> bs!17131 m!314183))

(assert (=> b!203307 d!69505))

(declare-fun d!69507 () Bool)

(declare-fun e!139371 () Bool)

(assert (=> d!69507 e!139371))

(declare-fun res!170380 () Bool)

(assert (=> d!69507 (=> (not res!170380) (not e!139371))))

(assert (=> d!69507 (= res!170380 (invariant!0 (currentBit!9494 (_2!9352 lt!317173)) (currentByte!9499 (_2!9352 lt!317173)) (size!4536 (buf!5041 (_2!9352 lt!317173)))))))

(assert (=> d!69507 (= (readerFrom!0 (_2!9352 lt!317173) (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204)) (BitStream!8181 (buf!5041 (_2!9352 lt!317173)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204)))))

(declare-fun b!203373 () Bool)

(assert (=> b!203373 (= e!139371 (invariant!0 (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204) (size!4536 (buf!5041 (_2!9352 lt!317173)))))))

(assert (= (and d!69507 res!170380) b!203373))

(declare-fun m!314185 () Bool)

(assert (=> d!69507 m!314185))

(declare-fun m!314187 () Bool)

(assert (=> b!203373 m!314187))

(assert (=> b!203307 d!69507))

(declare-fun d!69509 () Bool)

(declare-fun e!139372 () Bool)

(assert (=> d!69509 e!139372))

(declare-fun res!170381 () Bool)

(assert (=> d!69509 (=> (not res!170381) (not e!139372))))

(declare-fun lt!317249 () (_ BitVec 64))

(declare-fun lt!317252 () (_ BitVec 64))

(declare-fun lt!317250 () (_ BitVec 64))

(assert (=> d!69509 (= res!170381 (= lt!317250 (bvsub lt!317249 lt!317252)))))

(assert (=> d!69509 (or (= (bvand lt!317249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317252 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317249 lt!317252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69509 (= lt!317252 (remainingBits!0 ((_ sign_extend 32) (size!4536 (buf!5041 (_2!9352 lt!317173)))) ((_ sign_extend 32) (currentByte!9499 (_2!9352 lt!317173))) ((_ sign_extend 32) (currentBit!9494 (_2!9352 lt!317173)))))))

(declare-fun lt!317251 () (_ BitVec 64))

(declare-fun lt!317247 () (_ BitVec 64))

(assert (=> d!69509 (= lt!317249 (bvmul lt!317251 lt!317247))))

(assert (=> d!69509 (or (= lt!317251 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317247 (bvsdiv (bvmul lt!317251 lt!317247) lt!317251)))))

(assert (=> d!69509 (= lt!317247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69509 (= lt!317251 ((_ sign_extend 32) (size!4536 (buf!5041 (_2!9352 lt!317173)))))))

(assert (=> d!69509 (= lt!317250 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9499 (_2!9352 lt!317173))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9494 (_2!9352 lt!317173)))))))

(assert (=> d!69509 (invariant!0 (currentBit!9494 (_2!9352 lt!317173)) (currentByte!9499 (_2!9352 lt!317173)) (size!4536 (buf!5041 (_2!9352 lt!317173))))))

(assert (=> d!69509 (= (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))) lt!317250)))

(declare-fun b!203374 () Bool)

(declare-fun res!170382 () Bool)

(assert (=> b!203374 (=> (not res!170382) (not e!139372))))

(assert (=> b!203374 (= res!170382 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317250))))

(declare-fun b!203375 () Bool)

(declare-fun lt!317248 () (_ BitVec 64))

(assert (=> b!203375 (= e!139372 (bvsle lt!317250 (bvmul lt!317248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203375 (or (= lt!317248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317248)))))

(assert (=> b!203375 (= lt!317248 ((_ sign_extend 32) (size!4536 (buf!5041 (_2!9352 lt!317173)))))))

(assert (= (and d!69509 res!170381) b!203374))

(assert (= (and b!203374 res!170382) b!203375))

(declare-fun m!314189 () Bool)

(assert (=> d!69509 m!314189))

(assert (=> d!69509 m!314185))

(assert (=> b!203309 d!69509))

(declare-fun d!69511 () Bool)

(declare-fun e!139373 () Bool)

(assert (=> d!69511 e!139373))

(declare-fun res!170383 () Bool)

(assert (=> d!69511 (=> (not res!170383) (not e!139373))))

(declare-fun lt!317255 () (_ BitVec 64))

(declare-fun lt!317258 () (_ BitVec 64))

(declare-fun lt!317256 () (_ BitVec 64))

(assert (=> d!69511 (= res!170383 (= lt!317256 (bvsub lt!317255 lt!317258)))))

(assert (=> d!69511 (or (= (bvand lt!317255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317258 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317255 lt!317258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69511 (= lt!317258 (remainingBits!0 ((_ sign_extend 32) (size!4536 (buf!5041 thiss!1204))) ((_ sign_extend 32) (currentByte!9499 thiss!1204)) ((_ sign_extend 32) (currentBit!9494 thiss!1204))))))

(declare-fun lt!317257 () (_ BitVec 64))

(declare-fun lt!317253 () (_ BitVec 64))

(assert (=> d!69511 (= lt!317255 (bvmul lt!317257 lt!317253))))

(assert (=> d!69511 (or (= lt!317257 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317253 (bvsdiv (bvmul lt!317257 lt!317253) lt!317257)))))

(assert (=> d!69511 (= lt!317253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69511 (= lt!317257 ((_ sign_extend 32) (size!4536 (buf!5041 thiss!1204))))))

(assert (=> d!69511 (= lt!317256 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9499 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9494 thiss!1204))))))

(assert (=> d!69511 (invariant!0 (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204) (size!4536 (buf!5041 thiss!1204)))))

(assert (=> d!69511 (= (bitIndex!0 (size!4536 (buf!5041 thiss!1204)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204)) lt!317256)))

(declare-fun b!203376 () Bool)

(declare-fun res!170384 () Bool)

(assert (=> b!203376 (=> (not res!170384) (not e!139373))))

(assert (=> b!203376 (= res!170384 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317256))))

(declare-fun b!203377 () Bool)

(declare-fun lt!317254 () (_ BitVec 64))

(assert (=> b!203377 (= e!139373 (bvsle lt!317256 (bvmul lt!317254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203377 (or (= lt!317254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317254)))))

(assert (=> b!203377 (= lt!317254 ((_ sign_extend 32) (size!4536 (buf!5041 thiss!1204))))))

(assert (= (and d!69511 res!170383) b!203376))

(assert (= (and b!203376 res!170384) b!203377))

(assert (=> d!69511 m!314181))

(assert (=> d!69511 m!314125))

(assert (=> b!203309 d!69511))

(declare-fun d!69513 () Bool)

(declare-fun res!170392 () Bool)

(declare-fun e!139379 () Bool)

(assert (=> d!69513 (=> (not res!170392) (not e!139379))))

(assert (=> d!69513 (= res!170392 (= (size!4536 (buf!5041 thiss!1204)) (size!4536 (buf!5041 (_2!9352 lt!317177)))))))

(assert (=> d!69513 (= (isPrefixOf!0 thiss!1204 (_2!9352 lt!317177)) e!139379)))

(declare-fun b!203384 () Bool)

(declare-fun res!170391 () Bool)

(assert (=> b!203384 (=> (not res!170391) (not e!139379))))

(assert (=> b!203384 (= res!170391 (bvsle (bitIndex!0 (size!4536 (buf!5041 thiss!1204)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204)) (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317177))) (currentByte!9499 (_2!9352 lt!317177)) (currentBit!9494 (_2!9352 lt!317177)))))))

(declare-fun b!203385 () Bool)

(declare-fun e!139378 () Bool)

(assert (=> b!203385 (= e!139379 e!139378)))

(declare-fun res!170393 () Bool)

(assert (=> b!203385 (=> res!170393 e!139378)))

(assert (=> b!203385 (= res!170393 (= (size!4536 (buf!5041 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203386 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10311 array!10311 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203386 (= e!139378 (arrayBitRangesEq!0 (buf!5041 thiss!1204) (buf!5041 (_2!9352 lt!317177)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4536 (buf!5041 thiss!1204)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204))))))

(assert (= (and d!69513 res!170392) b!203384))

(assert (= (and b!203384 res!170391) b!203385))

(assert (= (and b!203385 (not res!170393)) b!203386))

(assert (=> b!203384 m!314107))

(declare-fun m!314191 () Bool)

(assert (=> b!203384 m!314191))

(assert (=> b!203386 m!314107))

(assert (=> b!203386 m!314107))

(declare-fun m!314193 () Bool)

(assert (=> b!203386 m!314193))

(assert (=> b!203314 d!69513))

(declare-fun d!69515 () Bool)

(assert (=> d!69515 (isPrefixOf!0 thiss!1204 (_2!9352 lt!317177))))

(declare-fun lt!317261 () Unit!14464)

(declare-fun choose!30 (BitStream!8180 BitStream!8180 BitStream!8180) Unit!14464)

(assert (=> d!69515 (= lt!317261 (choose!30 thiss!1204 (_2!9352 lt!317173) (_2!9352 lt!317177)))))

(assert (=> d!69515 (isPrefixOf!0 thiss!1204 (_2!9352 lt!317173))))

(assert (=> d!69515 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9352 lt!317173) (_2!9352 lt!317177)) lt!317261)))

(declare-fun bs!17132 () Bool)

(assert (= bs!17132 d!69515))

(assert (=> bs!17132 m!314111))

(declare-fun m!314195 () Bool)

(assert (=> bs!17132 m!314195))

(assert (=> bs!17132 m!314129))

(assert (=> b!203314 d!69515))

(declare-fun d!69517 () Bool)

(declare-fun e!139474 () Bool)

(assert (=> d!69517 e!139474))

(declare-fun res!170524 () Bool)

(assert (=> d!69517 (=> (not res!170524) (not e!139474))))

(declare-fun lt!317804 () tuple2!17400)

(assert (=> d!69517 (= res!170524 (invariant!0 (currentBit!9494 (_2!9352 lt!317804)) (currentByte!9499 (_2!9352 lt!317804)) (size!4536 (buf!5041 (_2!9352 lt!317804)))))))

(declare-fun e!139468 () tuple2!17400)

(assert (=> d!69517 (= lt!317804 e!139468)))

(declare-fun c!10097 () Bool)

(assert (=> d!69517 (= c!10097 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69517 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69517 (= (appendBitsLSBFirstLoopTR!0 (_2!9352 lt!317173) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!317804)))

(declare-fun b!203543 () Bool)

(declare-fun res!170518 () Bool)

(declare-fun call!3216 () Bool)

(assert (=> b!203543 (= res!170518 call!3216)))

(declare-fun e!139470 () Bool)

(assert (=> b!203543 (=> (not res!170518) (not e!139470))))

(declare-fun b!203544 () Bool)

(declare-fun lt!317803 () tuple2!17400)

(assert (=> b!203544 (= e!139468 (tuple2!17401 (_1!9352 lt!317803) (_2!9352 lt!317803)))))

(declare-fun lt!317771 () Bool)

(assert (=> b!203544 (= lt!317771 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!317775 () tuple2!17400)

(assert (=> b!203544 (= lt!317775 (appendBit!0 (_2!9352 lt!317173) lt!317771))))

(declare-fun res!170517 () Bool)

(assert (=> b!203544 (= res!170517 (= (size!4536 (buf!5041 (_2!9352 lt!317173))) (size!4536 (buf!5041 (_2!9352 lt!317775)))))))

(assert (=> b!203544 (=> (not res!170517) (not e!139470))))

(assert (=> b!203544 e!139470))

(declare-fun lt!317802 () tuple2!17400)

(assert (=> b!203544 (= lt!317802 lt!317775)))

(assert (=> b!203544 (= lt!317803 (appendBitsLSBFirstLoopTR!0 (_2!9352 lt!317802) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!317812 () Unit!14464)

(assert (=> b!203544 (= lt!317812 (lemmaIsPrefixTransitive!0 (_2!9352 lt!317173) (_2!9352 lt!317802) (_2!9352 lt!317803)))))

(assert (=> b!203544 (isPrefixOf!0 (_2!9352 lt!317173) (_2!9352 lt!317803))))

(declare-fun lt!317787 () Unit!14464)

(assert (=> b!203544 (= lt!317787 lt!317812)))

(assert (=> b!203544 (invariant!0 (currentBit!9494 (_2!9352 lt!317173)) (currentByte!9499 (_2!9352 lt!317173)) (size!4536 (buf!5041 (_2!9352 lt!317802))))))

(declare-fun lt!317813 () BitStream!8180)

(assert (=> b!203544 (= lt!317813 (BitStream!8181 (buf!5041 (_2!9352 lt!317802)) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))))))

(assert (=> b!203544 (invariant!0 (currentBit!9494 lt!317813) (currentByte!9499 lt!317813) (size!4536 (buf!5041 (_2!9352 lt!317803))))))

(declare-fun lt!317798 () BitStream!8180)

(assert (=> b!203544 (= lt!317798 (BitStream!8181 (buf!5041 (_2!9352 lt!317803)) (currentByte!9499 lt!317813) (currentBit!9494 lt!317813)))))

(declare-fun lt!317805 () tuple2!17398)

(assert (=> b!203544 (= lt!317805 (readBitPure!0 lt!317813))))

(declare-fun lt!317773 () tuple2!17398)

(assert (=> b!203544 (= lt!317773 (readBitPure!0 lt!317798))))

(declare-fun lt!317811 () Unit!14464)

(declare-fun readBitPrefixLemma!0 (BitStream!8180 BitStream!8180) Unit!14464)

(assert (=> b!203544 (= lt!317811 (readBitPrefixLemma!0 lt!317813 (_2!9352 lt!317803)))))

(declare-fun res!170521 () Bool)

(assert (=> b!203544 (= res!170521 (= (bitIndex!0 (size!4536 (buf!5041 (_1!9351 lt!317805))) (currentByte!9499 (_1!9351 lt!317805)) (currentBit!9494 (_1!9351 lt!317805))) (bitIndex!0 (size!4536 (buf!5041 (_1!9351 lt!317773))) (currentByte!9499 (_1!9351 lt!317773)) (currentBit!9494 (_1!9351 lt!317773)))))))

(declare-fun e!139472 () Bool)

(assert (=> b!203544 (=> (not res!170521) (not e!139472))))

(assert (=> b!203544 e!139472))

(declare-fun lt!317761 () Unit!14464)

(assert (=> b!203544 (= lt!317761 lt!317811)))

(declare-datatypes ((tuple2!17416 0))(
  ( (tuple2!17417 (_1!9360 BitStream!8180) (_2!9360 BitStream!8180)) )
))
(declare-fun lt!317800 () tuple2!17416)

(declare-fun reader!0 (BitStream!8180 BitStream!8180) tuple2!17416)

(assert (=> b!203544 (= lt!317800 (reader!0 (_2!9352 lt!317173) (_2!9352 lt!317803)))))

(declare-fun lt!317789 () tuple2!17416)

(assert (=> b!203544 (= lt!317789 (reader!0 (_2!9352 lt!317802) (_2!9352 lt!317803)))))

(declare-fun lt!317766 () tuple2!17398)

(assert (=> b!203544 (= lt!317766 (readBitPure!0 (_1!9360 lt!317800)))))

(assert (=> b!203544 (= (_2!9351 lt!317766) lt!317771)))

(declare-fun lt!317797 () Unit!14464)

(declare-fun Unit!14488 () Unit!14464)

(assert (=> b!203544 (= lt!317797 Unit!14488)))

(declare-fun lt!317780 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203544 (= lt!317780 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317763 () (_ BitVec 64))

(assert (=> b!203544 (= lt!317763 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317772 () Unit!14464)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8180 array!10311 (_ BitVec 64)) Unit!14464)

(assert (=> b!203544 (= lt!317772 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9352 lt!317173) (buf!5041 (_2!9352 lt!317803)) lt!317763))))

(assert (=> b!203544 (validate_offset_bits!1 ((_ sign_extend 32) (size!4536 (buf!5041 (_2!9352 lt!317803)))) ((_ sign_extend 32) (currentByte!9499 (_2!9352 lt!317173))) ((_ sign_extend 32) (currentBit!9494 (_2!9352 lt!317173))) lt!317763)))

(declare-fun lt!317810 () Unit!14464)

(assert (=> b!203544 (= lt!317810 lt!317772)))

(declare-datatypes ((tuple2!17418 0))(
  ( (tuple2!17419 (_1!9361 BitStream!8180) (_2!9361 (_ BitVec 64))) )
))
(declare-fun lt!317778 () tuple2!17418)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17418)

(assert (=> b!203544 (= lt!317778 (readNBitsLSBFirstsLoopPure!0 (_1!9360 lt!317800) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317780))))

(declare-fun lt!317758 () (_ BitVec 64))

(assert (=> b!203544 (= lt!317758 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!317784 () Unit!14464)

(assert (=> b!203544 (= lt!317784 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9352 lt!317802) (buf!5041 (_2!9352 lt!317803)) lt!317758))))

(assert (=> b!203544 (validate_offset_bits!1 ((_ sign_extend 32) (size!4536 (buf!5041 (_2!9352 lt!317803)))) ((_ sign_extend 32) (currentByte!9499 (_2!9352 lt!317802))) ((_ sign_extend 32) (currentBit!9494 (_2!9352 lt!317802))) lt!317758)))

(declare-fun lt!317767 () Unit!14464)

(assert (=> b!203544 (= lt!317767 lt!317784)))

(declare-fun lt!317786 () tuple2!17418)

(assert (=> b!203544 (= lt!317786 (readNBitsLSBFirstsLoopPure!0 (_1!9360 lt!317789) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!317780 (ite (_2!9351 lt!317766) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!317801 () tuple2!17418)

(assert (=> b!203544 (= lt!317801 (readNBitsLSBFirstsLoopPure!0 (_1!9360 lt!317800) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317780))))

(declare-fun c!10096 () Bool)

(assert (=> b!203544 (= c!10096 (_2!9351 (readBitPure!0 (_1!9360 lt!317800))))))

(declare-fun e!139469 () (_ BitVec 64))

(declare-fun lt!317792 () tuple2!17418)

(declare-fun withMovedBitIndex!0 (BitStream!8180 (_ BitVec 64)) BitStream!8180)

(assert (=> b!203544 (= lt!317792 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9360 lt!317800) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!317780 e!139469)))))

(declare-fun lt!317769 () Unit!14464)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14464)

(assert (=> b!203544 (= lt!317769 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9360 lt!317800) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317780))))

(assert (=> b!203544 (and (= (_2!9361 lt!317801) (_2!9361 lt!317792)) (= (_1!9361 lt!317801) (_1!9361 lt!317792)))))

(declare-fun lt!317764 () Unit!14464)

(assert (=> b!203544 (= lt!317764 lt!317769)))

(assert (=> b!203544 (= (_1!9360 lt!317800) (withMovedBitIndex!0 (_2!9360 lt!317800) (bvsub (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))) (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317803))) (currentByte!9499 (_2!9352 lt!317803)) (currentBit!9494 (_2!9352 lt!317803))))))))

(declare-fun lt!317807 () Unit!14464)

(declare-fun Unit!14489 () Unit!14464)

(assert (=> b!203544 (= lt!317807 Unit!14489)))

(assert (=> b!203544 (= (_1!9360 lt!317789) (withMovedBitIndex!0 (_2!9360 lt!317789) (bvsub (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317802))) (currentByte!9499 (_2!9352 lt!317802)) (currentBit!9494 (_2!9352 lt!317802))) (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317803))) (currentByte!9499 (_2!9352 lt!317803)) (currentBit!9494 (_2!9352 lt!317803))))))))

(declare-fun lt!317794 () Unit!14464)

(declare-fun Unit!14490 () Unit!14464)

(assert (=> b!203544 (= lt!317794 Unit!14490)))

(assert (=> b!203544 (= (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))) (bvsub (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317802))) (currentByte!9499 (_2!9352 lt!317802)) (currentBit!9494 (_2!9352 lt!317802))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!317799 () Unit!14464)

(declare-fun Unit!14491 () Unit!14464)

(assert (=> b!203544 (= lt!317799 Unit!14491)))

(assert (=> b!203544 (= (_2!9361 lt!317778) (_2!9361 lt!317786))))

(declare-fun lt!317768 () Unit!14464)

(declare-fun Unit!14492 () Unit!14464)

(assert (=> b!203544 (= lt!317768 Unit!14492)))

(assert (=> b!203544 (invariant!0 (currentBit!9494 (_2!9352 lt!317803)) (currentByte!9499 (_2!9352 lt!317803)) (size!4536 (buf!5041 (_2!9352 lt!317803))))))

(declare-fun lt!317776 () Unit!14464)

(declare-fun Unit!14493 () Unit!14464)

(assert (=> b!203544 (= lt!317776 Unit!14493)))

(assert (=> b!203544 (= (size!4536 (buf!5041 (_2!9352 lt!317173))) (size!4536 (buf!5041 (_2!9352 lt!317803))))))

(declare-fun lt!317806 () Unit!14464)

(declare-fun Unit!14494 () Unit!14464)

(assert (=> b!203544 (= lt!317806 Unit!14494)))

(assert (=> b!203544 (= (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317803))) (currentByte!9499 (_2!9352 lt!317803)) (currentBit!9494 (_2!9352 lt!317803))) (bvsub (bvadd (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317774 () Unit!14464)

(declare-fun Unit!14495 () Unit!14464)

(assert (=> b!203544 (= lt!317774 Unit!14495)))

(declare-fun lt!317795 () Unit!14464)

(declare-fun Unit!14496 () Unit!14464)

(assert (=> b!203544 (= lt!317795 Unit!14496)))

(declare-fun lt!317782 () tuple2!17416)

(assert (=> b!203544 (= lt!317782 (reader!0 (_2!9352 lt!317173) (_2!9352 lt!317803)))))

(declare-fun lt!317781 () (_ BitVec 64))

(assert (=> b!203544 (= lt!317781 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317791 () Unit!14464)

(assert (=> b!203544 (= lt!317791 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9352 lt!317173) (buf!5041 (_2!9352 lt!317803)) lt!317781))))

(assert (=> b!203544 (validate_offset_bits!1 ((_ sign_extend 32) (size!4536 (buf!5041 (_2!9352 lt!317803)))) ((_ sign_extend 32) (currentByte!9499 (_2!9352 lt!317173))) ((_ sign_extend 32) (currentBit!9494 (_2!9352 lt!317173))) lt!317781)))

(declare-fun lt!317779 () Unit!14464)

(assert (=> b!203544 (= lt!317779 lt!317791)))

(declare-fun lt!317788 () tuple2!17418)

(assert (=> b!203544 (= lt!317788 (readNBitsLSBFirstsLoopPure!0 (_1!9360 lt!317782) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170527 () Bool)

(assert (=> b!203544 (= res!170527 (= (_2!9361 lt!317788) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139466 () Bool)

(assert (=> b!203544 (=> (not res!170527) (not e!139466))))

(assert (=> b!203544 e!139466))

(declare-fun lt!317790 () Unit!14464)

(declare-fun Unit!14497 () Unit!14464)

(assert (=> b!203544 (= lt!317790 Unit!14497)))

(declare-fun b!203545 () Bool)

(declare-fun lt!317762 () tuple2!17398)

(assert (=> b!203545 (= lt!317762 (readBitPure!0 (readerFrom!0 (_2!9352 lt!317775) (currentBit!9494 (_2!9352 lt!317173)) (currentByte!9499 (_2!9352 lt!317173)))))))

(declare-fun res!170519 () Bool)

(assert (=> b!203545 (= res!170519 (and (= (_2!9351 lt!317762) lt!317771) (= (_1!9351 lt!317762) (_2!9352 lt!317775))))))

(declare-fun e!139471 () Bool)

(assert (=> b!203545 (=> (not res!170519) (not e!139471))))

(assert (=> b!203545 (= e!139470 e!139471)))

(declare-fun b!203546 () Bool)

(assert (=> b!203546 (= e!139466 (= (_1!9361 lt!317788) (_2!9360 lt!317782)))))

(declare-fun b!203547 () Bool)

(declare-fun res!170526 () Bool)

(assert (=> b!203547 (=> (not res!170526) (not e!139474))))

(assert (=> b!203547 (= res!170526 (isPrefixOf!0 (_2!9352 lt!317173) (_2!9352 lt!317804)))))

(declare-fun b!203548 () Bool)

(assert (=> b!203548 (= e!139469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!203549 () Bool)

(assert (=> b!203549 (= e!139471 (= (bitIndex!0 (size!4536 (buf!5041 (_1!9351 lt!317762))) (currentByte!9499 (_1!9351 lt!317762)) (currentBit!9494 (_1!9351 lt!317762))) (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317775))) (currentByte!9499 (_2!9352 lt!317775)) (currentBit!9494 (_2!9352 lt!317775)))))))

(declare-fun b!203550 () Bool)

(assert (=> b!203550 (= e!139469 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!203551 () Bool)

(declare-fun res!170528 () Bool)

(assert (=> b!203551 (= res!170528 (= (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317775))) (currentByte!9499 (_2!9352 lt!317775)) (currentBit!9494 (_2!9352 lt!317775))) (bvadd (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!203551 (=> (not res!170528) (not e!139470))))

(declare-fun b!203552 () Bool)

(declare-fun e!139473 () Bool)

(assert (=> b!203552 (= e!139474 e!139473)))

(declare-fun res!170520 () Bool)

(assert (=> b!203552 (=> (not res!170520) (not e!139473))))

(declare-fun lt!317796 () tuple2!17418)

(assert (=> b!203552 (= res!170520 (= (_2!9361 lt!317796) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!317783 () tuple2!17416)

(assert (=> b!203552 (= lt!317796 (readNBitsLSBFirstsLoopPure!0 (_1!9360 lt!317783) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!317809 () Unit!14464)

(declare-fun lt!317759 () Unit!14464)

(assert (=> b!203552 (= lt!317809 lt!317759)))

(declare-fun lt!317765 () (_ BitVec 64))

(assert (=> b!203552 (validate_offset_bits!1 ((_ sign_extend 32) (size!4536 (buf!5041 (_2!9352 lt!317804)))) ((_ sign_extend 32) (currentByte!9499 (_2!9352 lt!317173))) ((_ sign_extend 32) (currentBit!9494 (_2!9352 lt!317173))) lt!317765)))

(assert (=> b!203552 (= lt!317759 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9352 lt!317173) (buf!5041 (_2!9352 lt!317804)) lt!317765))))

(declare-fun e!139467 () Bool)

(assert (=> b!203552 e!139467))

(declare-fun res!170523 () Bool)

(assert (=> b!203552 (=> (not res!170523) (not e!139467))))

(assert (=> b!203552 (= res!170523 (and (= (size!4536 (buf!5041 (_2!9352 lt!317173))) (size!4536 (buf!5041 (_2!9352 lt!317804)))) (bvsge lt!317765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203552 (= lt!317765 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203552 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!203552 (= lt!317783 (reader!0 (_2!9352 lt!317173) (_2!9352 lt!317804)))))

(declare-fun b!203553 () Bool)

(assert (=> b!203553 (= e!139472 (= (_2!9351 lt!317805) (_2!9351 lt!317773)))))

(declare-fun bm!3213 () Bool)

(assert (=> bm!3213 (= call!3216 (isPrefixOf!0 (_2!9352 lt!317173) (ite c!10097 (_2!9352 lt!317173) (_2!9352 lt!317775))))))

(declare-fun b!203554 () Bool)

(declare-fun res!170522 () Bool)

(assert (=> b!203554 (=> (not res!170522) (not e!139474))))

(declare-fun lt!317793 () (_ BitVec 64))

(declare-fun lt!317760 () (_ BitVec 64))

(assert (=> b!203554 (= res!170522 (= (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317804))) (currentByte!9499 (_2!9352 lt!317804)) (currentBit!9494 (_2!9352 lt!317804))) (bvsub lt!317760 lt!317793)))))

(assert (=> b!203554 (or (= (bvand lt!317760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317760 lt!317793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203554 (= lt!317793 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!317777 () (_ BitVec 64))

(declare-fun lt!317808 () (_ BitVec 64))

(assert (=> b!203554 (= lt!317760 (bvadd lt!317777 lt!317808))))

(assert (=> b!203554 (or (not (= (bvand lt!317777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317808 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!317777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!317777 lt!317808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203554 (= lt!317808 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203554 (= lt!317777 (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173))))))

(declare-fun b!203555 () Bool)

(declare-fun res!170525 () Bool)

(assert (=> b!203555 (=> (not res!170525) (not e!139474))))

(assert (=> b!203555 (= res!170525 (= (size!4536 (buf!5041 (_2!9352 lt!317173))) (size!4536 (buf!5041 (_2!9352 lt!317804)))))))

(declare-fun b!203556 () Bool)

(declare-fun Unit!14498 () Unit!14464)

(assert (=> b!203556 (= e!139468 (tuple2!17401 Unit!14498 (_2!9352 lt!317173)))))

(declare-fun lt!317785 () Unit!14464)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8180) Unit!14464)

(assert (=> b!203556 (= lt!317785 (lemmaIsPrefixRefl!0 (_2!9352 lt!317173)))))

(assert (=> b!203556 call!3216))

(declare-fun lt!317770 () Unit!14464)

(assert (=> b!203556 (= lt!317770 lt!317785)))

(declare-fun b!203557 () Bool)

(assert (=> b!203557 (= e!139473 (= (_1!9361 lt!317796) (_2!9360 lt!317783)))))

(declare-fun b!203558 () Bool)

(assert (=> b!203558 (= e!139467 (validate_offset_bits!1 ((_ sign_extend 32) (size!4536 (buf!5041 (_2!9352 lt!317173)))) ((_ sign_extend 32) (currentByte!9499 (_2!9352 lt!317173))) ((_ sign_extend 32) (currentBit!9494 (_2!9352 lt!317173))) lt!317765))))

(assert (= (and d!69517 c!10097) b!203556))

(assert (= (and d!69517 (not c!10097)) b!203544))

(assert (= (and b!203544 res!170517) b!203551))

(assert (= (and b!203551 res!170528) b!203543))

(assert (= (and b!203543 res!170518) b!203545))

(assert (= (and b!203545 res!170519) b!203549))

(assert (= (and b!203544 res!170521) b!203553))

(assert (= (and b!203544 c!10096) b!203550))

(assert (= (and b!203544 (not c!10096)) b!203548))

(assert (= (and b!203544 res!170527) b!203546))

(assert (= (or b!203556 b!203543) bm!3213))

(assert (= (and d!69517 res!170524) b!203555))

(assert (= (and b!203555 res!170525) b!203554))

(assert (= (and b!203554 res!170522) b!203547))

(assert (= (and b!203547 res!170526) b!203552))

(assert (= (and b!203552 res!170523) b!203558))

(assert (= (and b!203552 res!170520) b!203557))

(declare-fun m!314413 () Bool)

(assert (=> b!203552 m!314413))

(declare-fun m!314415 () Bool)

(assert (=> b!203552 m!314415))

(declare-fun m!314417 () Bool)

(assert (=> b!203552 m!314417))

(declare-fun m!314419 () Bool)

(assert (=> b!203552 m!314419))

(declare-fun m!314421 () Bool)

(assert (=> b!203552 m!314421))

(declare-fun m!314423 () Bool)

(assert (=> b!203552 m!314423))

(declare-fun m!314425 () Bool)

(assert (=> b!203547 m!314425))

(declare-fun m!314427 () Bool)

(assert (=> b!203545 m!314427))

(assert (=> b!203545 m!314427))

(declare-fun m!314429 () Bool)

(assert (=> b!203545 m!314429))

(declare-fun m!314431 () Bool)

(assert (=> d!69517 m!314431))

(declare-fun m!314433 () Bool)

(assert (=> b!203551 m!314433))

(assert (=> b!203551 m!314105))

(declare-fun m!314435 () Bool)

(assert (=> bm!3213 m!314435))

(declare-fun m!314437 () Bool)

(assert (=> b!203558 m!314437))

(declare-fun m!314439 () Bool)

(assert (=> b!203556 m!314439))

(declare-fun m!314441 () Bool)

(assert (=> b!203549 m!314441))

(assert (=> b!203549 m!314433))

(declare-fun m!314443 () Bool)

(assert (=> b!203554 m!314443))

(assert (=> b!203554 m!314105))

(declare-fun m!314445 () Bool)

(assert (=> b!203544 m!314445))

(declare-fun m!314447 () Bool)

(assert (=> b!203544 m!314447))

(assert (=> b!203544 m!314413))

(declare-fun m!314449 () Bool)

(assert (=> b!203544 m!314449))

(declare-fun m!314451 () Bool)

(assert (=> b!203544 m!314451))

(declare-fun m!314453 () Bool)

(assert (=> b!203544 m!314453))

(declare-fun m!314455 () Bool)

(assert (=> b!203544 m!314455))

(declare-fun m!314457 () Bool)

(assert (=> b!203544 m!314457))

(declare-fun m!314459 () Bool)

(assert (=> b!203544 m!314459))

(declare-fun m!314461 () Bool)

(assert (=> b!203544 m!314461))

(declare-fun m!314463 () Bool)

(assert (=> b!203544 m!314463))

(declare-fun m!314465 () Bool)

(assert (=> b!203544 m!314465))

(declare-fun m!314467 () Bool)

(assert (=> b!203544 m!314467))

(declare-fun m!314469 () Bool)

(assert (=> b!203544 m!314469))

(declare-fun m!314471 () Bool)

(assert (=> b!203544 m!314471))

(declare-fun m!314473 () Bool)

(assert (=> b!203544 m!314473))

(assert (=> b!203544 m!314447))

(declare-fun m!314475 () Bool)

(assert (=> b!203544 m!314475))

(declare-fun m!314477 () Bool)

(assert (=> b!203544 m!314477))

(declare-fun m!314479 () Bool)

(assert (=> b!203544 m!314479))

(declare-fun m!314481 () Bool)

(assert (=> b!203544 m!314481))

(declare-fun m!314483 () Bool)

(assert (=> b!203544 m!314483))

(declare-fun m!314485 () Bool)

(assert (=> b!203544 m!314485))

(declare-fun m!314487 () Bool)

(assert (=> b!203544 m!314487))

(declare-fun m!314489 () Bool)

(assert (=> b!203544 m!314489))

(assert (=> b!203544 m!314417))

(declare-fun m!314491 () Bool)

(assert (=> b!203544 m!314491))

(declare-fun m!314493 () Bool)

(assert (=> b!203544 m!314493))

(assert (=> b!203544 m!314105))

(declare-fun m!314495 () Bool)

(assert (=> b!203544 m!314495))

(declare-fun m!314497 () Bool)

(assert (=> b!203544 m!314497))

(declare-fun m!314499 () Bool)

(assert (=> b!203544 m!314499))

(declare-fun m!314501 () Bool)

(assert (=> b!203544 m!314501))

(declare-fun m!314503 () Bool)

(assert (=> b!203544 m!314503))

(declare-fun m!314505 () Bool)

(assert (=> b!203544 m!314505))

(assert (=> b!203314 d!69517))

(declare-fun d!69539 () Bool)

(declare-fun res!170530 () Bool)

(declare-fun e!139476 () Bool)

(assert (=> d!69539 (=> (not res!170530) (not e!139476))))

(assert (=> d!69539 (= res!170530 (= (size!4536 (buf!5041 thiss!1204)) (size!4536 (buf!5041 (_2!9352 lt!317173)))))))

(assert (=> d!69539 (= (isPrefixOf!0 thiss!1204 (_2!9352 lt!317173)) e!139476)))

(declare-fun b!203559 () Bool)

(declare-fun res!170529 () Bool)

(assert (=> b!203559 (=> (not res!170529) (not e!139476))))

(assert (=> b!203559 (= res!170529 (bvsle (bitIndex!0 (size!4536 (buf!5041 thiss!1204)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204)) (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317173))) (currentByte!9499 (_2!9352 lt!317173)) (currentBit!9494 (_2!9352 lt!317173)))))))

(declare-fun b!203560 () Bool)

(declare-fun e!139475 () Bool)

(assert (=> b!203560 (= e!139476 e!139475)))

(declare-fun res!170531 () Bool)

(assert (=> b!203560 (=> res!170531 e!139475)))

(assert (=> b!203560 (= res!170531 (= (size!4536 (buf!5041 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203561 () Bool)

(assert (=> b!203561 (= e!139475 (arrayBitRangesEq!0 (buf!5041 thiss!1204) (buf!5041 (_2!9352 lt!317173)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4536 (buf!5041 thiss!1204)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204))))))

(assert (= (and d!69539 res!170530) b!203559))

(assert (= (and b!203559 res!170529) b!203560))

(assert (= (and b!203560 (not res!170531)) b!203561))

(assert (=> b!203559 m!314107))

(assert (=> b!203559 m!314105))

(assert (=> b!203561 m!314107))

(assert (=> b!203561 m!314107))

(declare-fun m!314507 () Bool)

(assert (=> b!203561 m!314507))

(assert (=> b!203316 d!69539))

(declare-fun d!69541 () Bool)

(assert (=> d!69541 (= (invariant!0 (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204) (size!4536 (buf!5041 thiss!1204))) (and (bvsge (currentBit!9494 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9494 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9499 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9499 thiss!1204) (size!4536 (buf!5041 thiss!1204))) (and (= (currentBit!9494 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9499 thiss!1204) (size!4536 (buf!5041 thiss!1204)))))))))

(assert (=> b!203310 d!69541))

(assert (=> b!203315 d!69509))

(assert (=> b!203315 d!69511))

(declare-fun b!203572 () Bool)

(declare-fun res!170540 () Bool)

(declare-fun e!139482 () Bool)

(assert (=> b!203572 (=> (not res!170540) (not e!139482))))

(declare-fun lt!317822 () tuple2!17400)

(assert (=> b!203572 (= res!170540 (isPrefixOf!0 thiss!1204 (_2!9352 lt!317822)))))

(declare-fun b!203574 () Bool)

(declare-fun e!139481 () Bool)

(declare-fun lt!317824 () tuple2!17398)

(assert (=> b!203574 (= e!139481 (= (bitIndex!0 (size!4536 (buf!5041 (_1!9351 lt!317824))) (currentByte!9499 (_1!9351 lt!317824)) (currentBit!9494 (_1!9351 lt!317824))) (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317822))) (currentByte!9499 (_2!9352 lt!317822)) (currentBit!9494 (_2!9352 lt!317822)))))))

(declare-fun b!203571 () Bool)

(declare-fun res!170542 () Bool)

(assert (=> b!203571 (=> (not res!170542) (not e!139482))))

(declare-fun lt!317825 () (_ BitVec 64))

(declare-fun lt!317823 () (_ BitVec 64))

(assert (=> b!203571 (= res!170542 (= (bitIndex!0 (size!4536 (buf!5041 (_2!9352 lt!317822))) (currentByte!9499 (_2!9352 lt!317822)) (currentBit!9494 (_2!9352 lt!317822))) (bvadd lt!317825 lt!317823)))))

(assert (=> b!203571 (or (not (= (bvand lt!317825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317823 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!317825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!317825 lt!317823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203571 (= lt!317823 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203571 (= lt!317825 (bitIndex!0 (size!4536 (buf!5041 thiss!1204)) (currentByte!9499 thiss!1204) (currentBit!9494 thiss!1204)))))

(declare-fun b!203573 () Bool)

(assert (=> b!203573 (= e!139482 e!139481)))

(declare-fun res!170541 () Bool)

(assert (=> b!203573 (=> (not res!170541) (not e!139481))))

(assert (=> b!203573 (= res!170541 (and (= (_2!9351 lt!317824) lt!317176) (= (_1!9351 lt!317824) (_2!9352 lt!317822))))))

(assert (=> b!203573 (= lt!317824 (readBitPure!0 (readerFrom!0 (_2!9352 lt!317822) (currentBit!9494 thiss!1204) (currentByte!9499 thiss!1204))))))

(declare-fun d!69543 () Bool)

(assert (=> d!69543 e!139482))

(declare-fun res!170543 () Bool)

(assert (=> d!69543 (=> (not res!170543) (not e!139482))))

(assert (=> d!69543 (= res!170543 (= (size!4536 (buf!5041 thiss!1204)) (size!4536 (buf!5041 (_2!9352 lt!317822)))))))

(declare-fun choose!16 (BitStream!8180 Bool) tuple2!17400)

(assert (=> d!69543 (= lt!317822 (choose!16 thiss!1204 lt!317176))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69543 (validate_offset_bit!0 ((_ sign_extend 32) (size!4536 (buf!5041 thiss!1204))) ((_ sign_extend 32) (currentByte!9499 thiss!1204)) ((_ sign_extend 32) (currentBit!9494 thiss!1204)))))

(assert (=> d!69543 (= (appendBit!0 thiss!1204 lt!317176) lt!317822)))

(assert (= (and d!69543 res!170543) b!203571))

(assert (= (and b!203571 res!170542) b!203572))

(assert (= (and b!203572 res!170540) b!203573))

(assert (= (and b!203573 res!170541) b!203574))

(declare-fun m!314509 () Bool)

(assert (=> b!203573 m!314509))

(assert (=> b!203573 m!314509))

(declare-fun m!314511 () Bool)

(assert (=> b!203573 m!314511))

(declare-fun m!314513 () Bool)

(assert (=> b!203572 m!314513))

(declare-fun m!314515 () Bool)

(assert (=> b!203571 m!314515))

(assert (=> b!203571 m!314107))

(declare-fun m!314517 () Bool)

(assert (=> d!69543 m!314517))

(declare-fun m!314519 () Bool)

(assert (=> d!69543 m!314519))

(declare-fun m!314521 () Bool)

(assert (=> b!203574 m!314521))

(assert (=> b!203574 m!314515))

(assert (=> b!203315 d!69543))

(push 1)

(assert (not d!69491))

(assert (not b!203386))

(assert (not b!203373))

(assert (not b!203551))

(assert (not bm!3213))

(assert (not d!69503))

(assert (not b!203545))

(assert (not b!203384))

(assert (not d!69507))

(assert (not b!203547))

(assert (not d!69517))

(assert (not d!69543))

(assert (not d!69511))

(assert (not b!203574))

(assert (not b!203549))

(assert (not d!69489))

(assert (not b!203559))

(assert (not b!203556))

(assert (not b!203554))

(assert (not b!203571))

(assert (not d!69515))

(assert (not b!203561))

(assert (not b!203572))

(assert (not b!203558))

(assert (not d!69509))

(assert (not b!203544))

(assert (not d!69505))

(assert (not b!203552))

(assert (not b!203573))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43118 () Bool)

(assert start!43118)

(declare-fun b!203277 () Bool)

(declare-fun e!139311 () Bool)

(declare-fun e!139313 () Bool)

(assert (=> b!203277 (= e!139311 e!139313)))

(declare-fun res!170293 () Bool)

(assert (=> b!203277 (=> (not res!170293) (not e!139313))))

(declare-datatypes ((array!10309 0))(
  ( (array!10310 (arr!5465 (Array (_ BitVec 32) (_ BitVec 8))) (size!4535 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8178 0))(
  ( (BitStream!8179 (buf!5040 array!10309) (currentByte!9498 (_ BitVec 32)) (currentBit!9493 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17394 0))(
  ( (tuple2!17395 (_1!9349 BitStream!8178) (_2!9349 Bool)) )
))
(declare-fun lt!317140 () tuple2!17394)

(declare-fun lt!317143 () Bool)

(declare-datatypes ((Unit!14462 0))(
  ( (Unit!14463) )
))
(declare-datatypes ((tuple2!17396 0))(
  ( (tuple2!17397 (_1!9350 Unit!14462) (_2!9350 BitStream!8178)) )
))
(declare-fun lt!317144 () tuple2!17396)

(assert (=> b!203277 (= res!170293 (and (= (_2!9349 lt!317140) lt!317143) (= (_1!9349 lt!317140) (_2!9350 lt!317144))))))

(declare-fun thiss!1204 () BitStream!8178)

(declare-fun readBitPure!0 (BitStream!8178) tuple2!17394)

(declare-fun readerFrom!0 (BitStream!8178 (_ BitVec 32) (_ BitVec 32)) BitStream!8178)

(assert (=> b!203277 (= lt!317140 (readBitPure!0 (readerFrom!0 (_2!9350 lt!317144) (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204))))))

(declare-fun b!203278 () Bool)

(declare-fun e!139310 () Bool)

(declare-fun array_inv!4276 (array!10309) Bool)

(assert (=> b!203278 (= e!139310 (array_inv!4276 (buf!5040 thiss!1204)))))

(declare-fun b!203279 () Bool)

(declare-fun e!139312 () Bool)

(declare-fun lt!317142 () (_ BitVec 64))

(declare-fun lt!317134 () (_ BitVec 64))

(assert (=> b!203279 (= e!139312 (or (= lt!317142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317142 (bvand (bvsub lt!317134 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!203279 (= lt!317142 (bvand lt!317134 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!317138 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!203279 (= lt!317134 (bvsub (bvadd lt!317138 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))

(declare-fun lt!317141 () tuple2!17396)

(declare-fun isPrefixOf!0 (BitStream!8178 BitStream!8178) Bool)

(assert (=> b!203279 (isPrefixOf!0 thiss!1204 (_2!9350 lt!317141))))

(declare-fun lt!317135 () Unit!14462)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8178 BitStream!8178 BitStream!8178) Unit!14462)

(assert (=> b!203279 (= lt!317135 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9350 lt!317144) (_2!9350 lt!317141)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8178 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17396)

(assert (=> b!203279 (= lt!317141 (appendBitsLSBFirstLoopTR!0 (_2!9350 lt!317144) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!203280 () Bool)

(declare-fun e!139314 () Bool)

(assert (=> b!203280 (= e!139314 e!139311)))

(declare-fun res!170294 () Bool)

(assert (=> b!203280 (=> (not res!170294) (not e!139311))))

(declare-fun lt!317136 () (_ BitVec 64))

(declare-fun lt!317139 () (_ BitVec 64))

(assert (=> b!203280 (= res!170294 (= lt!317136 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317139)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203280 (= lt!317136 (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))))))

(assert (=> b!203280 (= lt!317139 (bitIndex!0 (size!4535 (buf!5040 thiss!1204)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204)))))

(declare-fun res!170292 () Bool)

(declare-fun e!139308 () Bool)

(assert (=> start!43118 (=> (not res!170292) (not e!139308))))

(assert (=> start!43118 (= res!170292 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43118 e!139308))

(assert (=> start!43118 true))

(declare-fun inv!12 (BitStream!8178) Bool)

(assert (=> start!43118 (and (inv!12 thiss!1204) e!139310)))

(declare-fun b!203281 () Bool)

(assert (=> b!203281 (= e!139313 (= (bitIndex!0 (size!4535 (buf!5040 (_1!9349 lt!317140))) (currentByte!9498 (_1!9349 lt!317140)) (currentBit!9493 (_1!9349 lt!317140))) lt!317136))))

(declare-fun b!203282 () Bool)

(declare-fun res!170286 () Bool)

(assert (=> b!203282 (=> (not res!170286) (not e!139308))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!203282 (= res!170286 (invariant!0 (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204) (size!4535 (buf!5040 thiss!1204))))))

(declare-fun b!203283 () Bool)

(declare-fun res!170288 () Bool)

(assert (=> b!203283 (=> (not res!170288) (not e!139308))))

(assert (=> b!203283 (= res!170288 (not (= i!590 nBits!348)))))

(declare-fun b!203284 () Bool)

(assert (=> b!203284 (= e!139308 (not e!139312))))

(declare-fun res!170291 () Bool)

(assert (=> b!203284 (=> res!170291 e!139312)))

(declare-fun lt!317137 () (_ BitVec 64))

(assert (=> b!203284 (= res!170291 (not (= lt!317138 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317137))))))

(assert (=> b!203284 (= lt!317138 (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))))))

(assert (=> b!203284 (= lt!317137 (bitIndex!0 (size!4535 (buf!5040 thiss!1204)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204)))))

(assert (=> b!203284 e!139314))

(declare-fun res!170287 () Bool)

(assert (=> b!203284 (=> (not res!170287) (not e!139314))))

(assert (=> b!203284 (= res!170287 (= (size!4535 (buf!5040 thiss!1204)) (size!4535 (buf!5040 (_2!9350 lt!317144)))))))

(declare-fun appendBit!0 (BitStream!8178 Bool) tuple2!17396)

(assert (=> b!203284 (= lt!317144 (appendBit!0 thiss!1204 lt!317143))))

(assert (=> b!203284 (= lt!317143 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!203285 () Bool)

(declare-fun res!170290 () Bool)

(assert (=> b!203285 (=> (not res!170290) (not e!139308))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203285 (= res!170290 (validate_offset_bits!1 ((_ sign_extend 32) (size!4535 (buf!5040 thiss!1204))) ((_ sign_extend 32) (currentByte!9498 thiss!1204)) ((_ sign_extend 32) (currentBit!9493 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!203286 () Bool)

(declare-fun res!170289 () Bool)

(assert (=> b!203286 (=> (not res!170289) (not e!139311))))

(assert (=> b!203286 (= res!170289 (isPrefixOf!0 thiss!1204 (_2!9350 lt!317144)))))

(assert (= (and start!43118 res!170292) b!203285))

(assert (= (and b!203285 res!170290) b!203282))

(assert (= (and b!203282 res!170286) b!203283))

(assert (= (and b!203283 res!170288) b!203284))

(assert (= (and b!203284 res!170287) b!203280))

(assert (= (and b!203280 res!170294) b!203286))

(assert (= (and b!203286 res!170289) b!203277))

(assert (= (and b!203277 res!170293) b!203281))

(assert (= (and b!203284 (not res!170291)) b!203279))

(assert (= start!43118 b!203278))

(declare-fun m!314077 () Bool)

(assert (=> b!203282 m!314077))

(declare-fun m!314079 () Bool)

(assert (=> b!203277 m!314079))

(assert (=> b!203277 m!314079))

(declare-fun m!314081 () Bool)

(assert (=> b!203277 m!314081))

(declare-fun m!314083 () Bool)

(assert (=> b!203280 m!314083))

(declare-fun m!314085 () Bool)

(assert (=> b!203280 m!314085))

(declare-fun m!314087 () Bool)

(assert (=> b!203281 m!314087))

(assert (=> b!203284 m!314083))

(assert (=> b!203284 m!314085))

(declare-fun m!314089 () Bool)

(assert (=> b!203284 m!314089))

(declare-fun m!314091 () Bool)

(assert (=> b!203286 m!314091))

(declare-fun m!314093 () Bool)

(assert (=> b!203278 m!314093))

(declare-fun m!314095 () Bool)

(assert (=> b!203285 m!314095))

(declare-fun m!314097 () Bool)

(assert (=> b!203279 m!314097))

(declare-fun m!314099 () Bool)

(assert (=> b!203279 m!314099))

(declare-fun m!314101 () Bool)

(assert (=> b!203279 m!314101))

(declare-fun m!314103 () Bool)

(assert (=> start!43118 m!314103))

(check-sat (not b!203280) (not start!43118) (not b!203278) (not b!203285) (not b!203284) (not b!203281) (not b!203286) (not b!203277) (not b!203282) (not b!203279))
(check-sat)
(get-model)

(declare-fun d!69461 () Bool)

(declare-datatypes ((tuple2!17402 0))(
  ( (tuple2!17403 (_1!9353 Bool) (_2!9353 BitStream!8178)) )
))
(declare-fun lt!317180 () tuple2!17402)

(declare-fun readBit!0 (BitStream!8178) tuple2!17402)

(assert (=> d!69461 (= lt!317180 (readBit!0 (readerFrom!0 (_2!9350 lt!317144) (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204))))))

(assert (=> d!69461 (= (readBitPure!0 (readerFrom!0 (_2!9350 lt!317144) (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204))) (tuple2!17395 (_2!9353 lt!317180) (_1!9353 lt!317180)))))

(declare-fun bs!17124 () Bool)

(assert (= bs!17124 d!69461))

(assert (=> bs!17124 m!314079))

(declare-fun m!314133 () Bool)

(assert (=> bs!17124 m!314133))

(assert (=> b!203277 d!69461))

(declare-fun d!69463 () Bool)

(declare-fun e!139338 () Bool)

(assert (=> d!69463 e!139338))

(declare-fun res!170325 () Bool)

(assert (=> d!69463 (=> (not res!170325) (not e!139338))))

(assert (=> d!69463 (= res!170325 (invariant!0 (currentBit!9493 (_2!9350 lt!317144)) (currentByte!9498 (_2!9350 lt!317144)) (size!4535 (buf!5040 (_2!9350 lt!317144)))))))

(assert (=> d!69463 (= (readerFrom!0 (_2!9350 lt!317144) (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204)) (BitStream!8179 (buf!5040 (_2!9350 lt!317144)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204)))))

(declare-fun b!203319 () Bool)

(assert (=> b!203319 (= e!139338 (invariant!0 (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204) (size!4535 (buf!5040 (_2!9350 lt!317144)))))))

(assert (= (and d!69463 res!170325) b!203319))

(declare-fun m!314135 () Bool)

(assert (=> d!69463 m!314135))

(declare-fun m!314137 () Bool)

(assert (=> b!203319 m!314137))

(assert (=> b!203277 d!69463))

(declare-fun d!69465 () Bool)

(assert (=> d!69465 (= (invariant!0 (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204) (size!4535 (buf!5040 thiss!1204))) (and (bvsge (currentBit!9493 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9493 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9498 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9498 thiss!1204) (size!4535 (buf!5040 thiss!1204))) (and (= (currentBit!9493 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9498 thiss!1204) (size!4535 (buf!5040 thiss!1204)))))))))

(assert (=> b!203282 d!69465))

(declare-fun d!69467 () Bool)

(declare-fun res!170333 () Bool)

(declare-fun e!139343 () Bool)

(assert (=> d!69467 (=> (not res!170333) (not e!139343))))

(assert (=> d!69467 (= res!170333 (= (size!4535 (buf!5040 thiss!1204)) (size!4535 (buf!5040 (_2!9350 lt!317141)))))))

(assert (=> d!69467 (= (isPrefixOf!0 thiss!1204 (_2!9350 lt!317141)) e!139343)))

(declare-fun b!203326 () Bool)

(declare-fun res!170334 () Bool)

(assert (=> b!203326 (=> (not res!170334) (not e!139343))))

(assert (=> b!203326 (= res!170334 (bvsle (bitIndex!0 (size!4535 (buf!5040 thiss!1204)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204)) (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317141))) (currentByte!9498 (_2!9350 lt!317141)) (currentBit!9493 (_2!9350 lt!317141)))))))

(declare-fun b!203327 () Bool)

(declare-fun e!139344 () Bool)

(assert (=> b!203327 (= e!139343 e!139344)))

(declare-fun res!170332 () Bool)

(assert (=> b!203327 (=> res!170332 e!139344)))

(assert (=> b!203327 (= res!170332 (= (size!4535 (buf!5040 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203328 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10309 array!10309 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203328 (= e!139344 (arrayBitRangesEq!0 (buf!5040 thiss!1204) (buf!5040 (_2!9350 lt!317141)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4535 (buf!5040 thiss!1204)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204))))))

(assert (= (and d!69467 res!170333) b!203326))

(assert (= (and b!203326 res!170334) b!203327))

(assert (= (and b!203327 (not res!170332)) b!203328))

(assert (=> b!203326 m!314085))

(declare-fun m!314139 () Bool)

(assert (=> b!203326 m!314139))

(assert (=> b!203328 m!314085))

(assert (=> b!203328 m!314085))

(declare-fun m!314141 () Bool)

(assert (=> b!203328 m!314141))

(assert (=> b!203279 d!69467))

(declare-fun d!69469 () Bool)

(assert (=> d!69469 (isPrefixOf!0 thiss!1204 (_2!9350 lt!317141))))

(declare-fun lt!317183 () Unit!14462)

(declare-fun choose!30 (BitStream!8178 BitStream!8178 BitStream!8178) Unit!14462)

(assert (=> d!69469 (= lt!317183 (choose!30 thiss!1204 (_2!9350 lt!317144) (_2!9350 lt!317141)))))

(assert (=> d!69469 (isPrefixOf!0 thiss!1204 (_2!9350 lt!317144))))

(assert (=> d!69469 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9350 lt!317144) (_2!9350 lt!317141)) lt!317183)))

(declare-fun bs!17125 () Bool)

(assert (= bs!17125 d!69469))

(assert (=> bs!17125 m!314097))

(declare-fun m!314143 () Bool)

(assert (=> bs!17125 m!314143))

(assert (=> bs!17125 m!314091))

(assert (=> b!203279 d!69469))

(declare-fun b!203433 () Bool)

(declare-fun e!139412 () Bool)

(declare-fun lt!317434 () tuple2!17394)

(declare-fun lt!317429 () tuple2!17394)

(assert (=> b!203433 (= e!139412 (= (_2!9349 lt!317434) (_2!9349 lt!317429)))))

(declare-fun b!203434 () Bool)

(declare-fun e!139410 () tuple2!17396)

(declare-fun Unit!14466 () Unit!14462)

(assert (=> b!203434 (= e!139410 (tuple2!17397 Unit!14466 (_2!9350 lt!317144)))))

(declare-fun lt!317452 () Unit!14462)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8178) Unit!14462)

(assert (=> b!203434 (= lt!317452 (lemmaIsPrefixRefl!0 (_2!9350 lt!317144)))))

(declare-fun call!3210 () Bool)

(assert (=> b!203434 call!3210))

(declare-fun lt!317430 () Unit!14462)

(assert (=> b!203434 (= lt!317430 lt!317452)))

(declare-fun b!203435 () Bool)

(declare-fun e!139406 () Bool)

(declare-datatypes ((tuple2!17404 0))(
  ( (tuple2!17405 (_1!9354 BitStream!8178) (_2!9354 (_ BitVec 64))) )
))
(declare-fun lt!317465 () tuple2!17404)

(declare-datatypes ((tuple2!17406 0))(
  ( (tuple2!17407 (_1!9355 BitStream!8178) (_2!9355 BitStream!8178)) )
))
(declare-fun lt!317466 () tuple2!17406)

(assert (=> b!203435 (= e!139406 (= (_1!9354 lt!317465) (_2!9355 lt!317466)))))

(declare-fun b!203436 () Bool)

(declare-fun res!170437 () Bool)

(declare-fun lt!317468 () tuple2!17396)

(assert (=> b!203436 (= res!170437 (isPrefixOf!0 (_2!9350 lt!317144) (_2!9350 lt!317468)))))

(declare-fun e!139408 () Bool)

(assert (=> b!203436 (=> (not res!170437) (not e!139408))))

(declare-fun b!203437 () Bool)

(declare-fun res!170438 () Bool)

(declare-fun e!139407 () Bool)

(assert (=> b!203437 (=> (not res!170438) (not e!139407))))

(declare-fun lt!317446 () tuple2!17396)

(declare-fun lt!317416 () (_ BitVec 64))

(declare-fun lt!317435 () (_ BitVec 64))

(assert (=> b!203437 (= res!170438 (= (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317446))) (currentByte!9498 (_2!9350 lt!317446)) (currentBit!9493 (_2!9350 lt!317446))) (bvsub lt!317435 lt!317416)))))

(assert (=> b!203437 (or (= (bvand lt!317435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317435 lt!317416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203437 (= lt!317416 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!317441 () (_ BitVec 64))

(declare-fun lt!317421 () (_ BitVec 64))

(assert (=> b!203437 (= lt!317435 (bvadd lt!317441 lt!317421))))

(assert (=> b!203437 (or (not (= (bvand lt!317441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317421 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!317441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!317441 lt!317421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203437 (= lt!317421 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203437 (= lt!317441 (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))))))

(declare-fun b!203438 () Bool)

(declare-fun lt!317460 () tuple2!17394)

(assert (=> b!203438 (= lt!317460 (readBitPure!0 (readerFrom!0 (_2!9350 lt!317468) (currentBit!9493 (_2!9350 lt!317144)) (currentByte!9498 (_2!9350 lt!317144)))))))

(declare-fun lt!317463 () Bool)

(declare-fun res!170439 () Bool)

(assert (=> b!203438 (= res!170439 (and (= (_2!9349 lt!317460) lt!317463) (= (_1!9349 lt!317460) (_2!9350 lt!317468))))))

(declare-fun e!139411 () Bool)

(assert (=> b!203438 (=> (not res!170439) (not e!139411))))

(assert (=> b!203438 (= e!139408 e!139411)))

(declare-fun c!10087 () Bool)

(declare-fun lt!317447 () tuple2!17396)

(declare-fun bm!3207 () Bool)

(assert (=> bm!3207 (= call!3210 (isPrefixOf!0 (_2!9350 lt!317144) (ite c!10087 (_2!9350 lt!317144) (_2!9350 lt!317447))))))

(declare-fun b!203439 () Bool)

(assert (=> b!203439 (= e!139411 (= (bitIndex!0 (size!4535 (buf!5040 (_1!9349 lt!317460))) (currentByte!9498 (_1!9349 lt!317460)) (currentBit!9493 (_1!9349 lt!317460))) (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317468))) (currentByte!9498 (_2!9350 lt!317468)) (currentBit!9493 (_2!9350 lt!317468)))))))

(declare-fun b!203440 () Bool)

(declare-fun res!170431 () Bool)

(assert (=> b!203440 (=> (not res!170431) (not e!139407))))

(assert (=> b!203440 (= res!170431 (isPrefixOf!0 (_2!9350 lt!317144) (_2!9350 lt!317446)))))

(declare-fun b!203441 () Bool)

(declare-fun e!139409 () Bool)

(declare-fun lt!317426 () (_ BitVec 64))

(assert (=> b!203441 (= e!139409 (validate_offset_bits!1 ((_ sign_extend 32) (size!4535 (buf!5040 (_2!9350 lt!317144)))) ((_ sign_extend 32) (currentByte!9498 (_2!9350 lt!317144))) ((_ sign_extend 32) (currentBit!9493 (_2!9350 lt!317144))) lt!317426))))

(declare-fun b!203442 () Bool)

(declare-fun e!139414 () (_ BitVec 64))

(assert (=> b!203442 (= e!139414 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!203443 () Bool)

(assert (=> b!203443 (= e!139410 (tuple2!17397 (_1!9350 lt!317447) (_2!9350 lt!317447)))))

(assert (=> b!203443 (= lt!317463 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203443 (= lt!317468 (appendBit!0 (_2!9350 lt!317144) lt!317463))))

(declare-fun res!170432 () Bool)

(assert (=> b!203443 (= res!170432 (= (size!4535 (buf!5040 (_2!9350 lt!317144))) (size!4535 (buf!5040 (_2!9350 lt!317468)))))))

(assert (=> b!203443 (=> (not res!170432) (not e!139408))))

(assert (=> b!203443 e!139408))

(declare-fun lt!317422 () tuple2!17396)

(assert (=> b!203443 (= lt!317422 lt!317468)))

(assert (=> b!203443 (= lt!317447 (appendBitsLSBFirstLoopTR!0 (_2!9350 lt!317422) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!317444 () Unit!14462)

(assert (=> b!203443 (= lt!317444 (lemmaIsPrefixTransitive!0 (_2!9350 lt!317144) (_2!9350 lt!317422) (_2!9350 lt!317447)))))

(assert (=> b!203443 call!3210))

(declare-fun lt!317439 () Unit!14462)

(assert (=> b!203443 (= lt!317439 lt!317444)))

(assert (=> b!203443 (invariant!0 (currentBit!9493 (_2!9350 lt!317144)) (currentByte!9498 (_2!9350 lt!317144)) (size!4535 (buf!5040 (_2!9350 lt!317422))))))

(declare-fun lt!317462 () BitStream!8178)

(assert (=> b!203443 (= lt!317462 (BitStream!8179 (buf!5040 (_2!9350 lt!317422)) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))))))

(assert (=> b!203443 (invariant!0 (currentBit!9493 lt!317462) (currentByte!9498 lt!317462) (size!4535 (buf!5040 (_2!9350 lt!317447))))))

(declare-fun lt!317438 () BitStream!8178)

(assert (=> b!203443 (= lt!317438 (BitStream!8179 (buf!5040 (_2!9350 lt!317447)) (currentByte!9498 lt!317462) (currentBit!9493 lt!317462)))))

(assert (=> b!203443 (= lt!317434 (readBitPure!0 lt!317462))))

(assert (=> b!203443 (= lt!317429 (readBitPure!0 lt!317438))))

(declare-fun lt!317461 () Unit!14462)

(declare-fun readBitPrefixLemma!0 (BitStream!8178 BitStream!8178) Unit!14462)

(assert (=> b!203443 (= lt!317461 (readBitPrefixLemma!0 lt!317462 (_2!9350 lt!317447)))))

(declare-fun res!170434 () Bool)

(assert (=> b!203443 (= res!170434 (= (bitIndex!0 (size!4535 (buf!5040 (_1!9349 lt!317434))) (currentByte!9498 (_1!9349 lt!317434)) (currentBit!9493 (_1!9349 lt!317434))) (bitIndex!0 (size!4535 (buf!5040 (_1!9349 lt!317429))) (currentByte!9498 (_1!9349 lt!317429)) (currentBit!9493 (_1!9349 lt!317429)))))))

(assert (=> b!203443 (=> (not res!170434) (not e!139412))))

(assert (=> b!203443 e!139412))

(declare-fun lt!317418 () Unit!14462)

(assert (=> b!203443 (= lt!317418 lt!317461)))

(declare-fun lt!317420 () tuple2!17406)

(declare-fun reader!0 (BitStream!8178 BitStream!8178) tuple2!17406)

(assert (=> b!203443 (= lt!317420 (reader!0 (_2!9350 lt!317144) (_2!9350 lt!317447)))))

(declare-fun lt!317443 () tuple2!17406)

(assert (=> b!203443 (= lt!317443 (reader!0 (_2!9350 lt!317422) (_2!9350 lt!317447)))))

(declare-fun lt!317433 () tuple2!17394)

(assert (=> b!203443 (= lt!317433 (readBitPure!0 (_1!9355 lt!317420)))))

(assert (=> b!203443 (= (_2!9349 lt!317433) lt!317463)))

(declare-fun lt!317437 () Unit!14462)

(declare-fun Unit!14467 () Unit!14462)

(assert (=> b!203443 (= lt!317437 Unit!14467)))

(declare-fun lt!317428 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203443 (= lt!317428 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317442 () (_ BitVec 64))

(assert (=> b!203443 (= lt!317442 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317454 () Unit!14462)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8178 array!10309 (_ BitVec 64)) Unit!14462)

(assert (=> b!203443 (= lt!317454 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9350 lt!317144) (buf!5040 (_2!9350 lt!317447)) lt!317442))))

(assert (=> b!203443 (validate_offset_bits!1 ((_ sign_extend 32) (size!4535 (buf!5040 (_2!9350 lt!317447)))) ((_ sign_extend 32) (currentByte!9498 (_2!9350 lt!317144))) ((_ sign_extend 32) (currentBit!9493 (_2!9350 lt!317144))) lt!317442)))

(declare-fun lt!317431 () Unit!14462)

(assert (=> b!203443 (= lt!317431 lt!317454)))

(declare-fun lt!317470 () tuple2!17404)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17404)

(assert (=> b!203443 (= lt!317470 (readNBitsLSBFirstsLoopPure!0 (_1!9355 lt!317420) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317428))))

(declare-fun lt!317448 () (_ BitVec 64))

(assert (=> b!203443 (= lt!317448 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!317455 () Unit!14462)

(assert (=> b!203443 (= lt!317455 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9350 lt!317422) (buf!5040 (_2!9350 lt!317447)) lt!317448))))

(assert (=> b!203443 (validate_offset_bits!1 ((_ sign_extend 32) (size!4535 (buf!5040 (_2!9350 lt!317447)))) ((_ sign_extend 32) (currentByte!9498 (_2!9350 lt!317422))) ((_ sign_extend 32) (currentBit!9493 (_2!9350 lt!317422))) lt!317448)))

(declare-fun lt!317457 () Unit!14462)

(assert (=> b!203443 (= lt!317457 lt!317455)))

(declare-fun lt!317436 () tuple2!17404)

(assert (=> b!203443 (= lt!317436 (readNBitsLSBFirstsLoopPure!0 (_1!9355 lt!317443) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!317428 (ite (_2!9349 lt!317433) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!317456 () tuple2!17404)

(assert (=> b!203443 (= lt!317456 (readNBitsLSBFirstsLoopPure!0 (_1!9355 lt!317420) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317428))))

(declare-fun c!10086 () Bool)

(assert (=> b!203443 (= c!10086 (_2!9349 (readBitPure!0 (_1!9355 lt!317420))))))

(declare-fun lt!317467 () tuple2!17404)

(declare-fun withMovedBitIndex!0 (BitStream!8178 (_ BitVec 64)) BitStream!8178)

(assert (=> b!203443 (= lt!317467 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9355 lt!317420) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!317428 e!139414)))))

(declare-fun lt!317449 () Unit!14462)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14462)

(assert (=> b!203443 (= lt!317449 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9355 lt!317420) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317428))))

(assert (=> b!203443 (and (= (_2!9354 lt!317456) (_2!9354 lt!317467)) (= (_1!9354 lt!317456) (_1!9354 lt!317467)))))

(declare-fun lt!317459 () Unit!14462)

(assert (=> b!203443 (= lt!317459 lt!317449)))

(assert (=> b!203443 (= (_1!9355 lt!317420) (withMovedBitIndex!0 (_2!9355 lt!317420) (bvsub (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))) (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317447))) (currentByte!9498 (_2!9350 lt!317447)) (currentBit!9493 (_2!9350 lt!317447))))))))

(declare-fun lt!317419 () Unit!14462)

(declare-fun Unit!14469 () Unit!14462)

(assert (=> b!203443 (= lt!317419 Unit!14469)))

(assert (=> b!203443 (= (_1!9355 lt!317443) (withMovedBitIndex!0 (_2!9355 lt!317443) (bvsub (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317422))) (currentByte!9498 (_2!9350 lt!317422)) (currentBit!9493 (_2!9350 lt!317422))) (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317447))) (currentByte!9498 (_2!9350 lt!317447)) (currentBit!9493 (_2!9350 lt!317447))))))))

(declare-fun lt!317417 () Unit!14462)

(declare-fun Unit!14470 () Unit!14462)

(assert (=> b!203443 (= lt!317417 Unit!14470)))

(assert (=> b!203443 (= (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))) (bvsub (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317422))) (currentByte!9498 (_2!9350 lt!317422)) (currentBit!9493 (_2!9350 lt!317422))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!317451 () Unit!14462)

(declare-fun Unit!14471 () Unit!14462)

(assert (=> b!203443 (= lt!317451 Unit!14471)))

(assert (=> b!203443 (= (_2!9354 lt!317470) (_2!9354 lt!317436))))

(declare-fun lt!317424 () Unit!14462)

(declare-fun Unit!14472 () Unit!14462)

(assert (=> b!203443 (= lt!317424 Unit!14472)))

(assert (=> b!203443 (invariant!0 (currentBit!9493 (_2!9350 lt!317447)) (currentByte!9498 (_2!9350 lt!317447)) (size!4535 (buf!5040 (_2!9350 lt!317447))))))

(declare-fun lt!317453 () Unit!14462)

(declare-fun Unit!14473 () Unit!14462)

(assert (=> b!203443 (= lt!317453 Unit!14473)))

(assert (=> b!203443 (= (size!4535 (buf!5040 (_2!9350 lt!317144))) (size!4535 (buf!5040 (_2!9350 lt!317447))))))

(declare-fun lt!317427 () Unit!14462)

(declare-fun Unit!14474 () Unit!14462)

(assert (=> b!203443 (= lt!317427 Unit!14474)))

(assert (=> b!203443 (= (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317447))) (currentByte!9498 (_2!9350 lt!317447)) (currentBit!9493 (_2!9350 lt!317447))) (bvsub (bvadd (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317471 () Unit!14462)

(declare-fun Unit!14475 () Unit!14462)

(assert (=> b!203443 (= lt!317471 Unit!14475)))

(declare-fun lt!317469 () Unit!14462)

(declare-fun Unit!14476 () Unit!14462)

(assert (=> b!203443 (= lt!317469 Unit!14476)))

(assert (=> b!203443 (= lt!317466 (reader!0 (_2!9350 lt!317144) (_2!9350 lt!317447)))))

(declare-fun lt!317432 () (_ BitVec 64))

(assert (=> b!203443 (= lt!317432 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317440 () Unit!14462)

(assert (=> b!203443 (= lt!317440 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9350 lt!317144) (buf!5040 (_2!9350 lt!317447)) lt!317432))))

(assert (=> b!203443 (validate_offset_bits!1 ((_ sign_extend 32) (size!4535 (buf!5040 (_2!9350 lt!317447)))) ((_ sign_extend 32) (currentByte!9498 (_2!9350 lt!317144))) ((_ sign_extend 32) (currentBit!9493 (_2!9350 lt!317144))) lt!317432)))

(declare-fun lt!317458 () Unit!14462)

(assert (=> b!203443 (= lt!317458 lt!317440)))

(assert (=> b!203443 (= lt!317465 (readNBitsLSBFirstsLoopPure!0 (_1!9355 lt!317466) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170433 () Bool)

(assert (=> b!203443 (= res!170433 (= (_2!9354 lt!317465) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!203443 (=> (not res!170433) (not e!139406))))

(assert (=> b!203443 e!139406))

(declare-fun lt!317464 () Unit!14462)

(declare-fun Unit!14477 () Unit!14462)

(assert (=> b!203443 (= lt!317464 Unit!14477)))

(declare-fun b!203444 () Bool)

(declare-fun e!139413 () Bool)

(declare-fun lt!317445 () tuple2!17404)

(declare-fun lt!317423 () tuple2!17406)

(assert (=> b!203444 (= e!139413 (= (_1!9354 lt!317445) (_2!9355 lt!317423)))))

(declare-fun b!203445 () Bool)

(assert (=> b!203445 (= e!139407 e!139413)))

(declare-fun res!170430 () Bool)

(assert (=> b!203445 (=> (not res!170430) (not e!139413))))

(assert (=> b!203445 (= res!170430 (= (_2!9354 lt!317445) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!203445 (= lt!317445 (readNBitsLSBFirstsLoopPure!0 (_1!9355 lt!317423) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!317425 () Unit!14462)

(declare-fun lt!317450 () Unit!14462)

(assert (=> b!203445 (= lt!317425 lt!317450)))

(assert (=> b!203445 (validate_offset_bits!1 ((_ sign_extend 32) (size!4535 (buf!5040 (_2!9350 lt!317446)))) ((_ sign_extend 32) (currentByte!9498 (_2!9350 lt!317144))) ((_ sign_extend 32) (currentBit!9493 (_2!9350 lt!317144))) lt!317426)))

(assert (=> b!203445 (= lt!317450 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9350 lt!317144) (buf!5040 (_2!9350 lt!317446)) lt!317426))))

(assert (=> b!203445 e!139409))

(declare-fun res!170435 () Bool)

(assert (=> b!203445 (=> (not res!170435) (not e!139409))))

(assert (=> b!203445 (= res!170435 (and (= (size!4535 (buf!5040 (_2!9350 lt!317144))) (size!4535 (buf!5040 (_2!9350 lt!317446)))) (bvsge lt!317426 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203445 (= lt!317426 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203445 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!203445 (= lt!317423 (reader!0 (_2!9350 lt!317144) (_2!9350 lt!317446)))))

(declare-fun b!203446 () Bool)

(assert (=> b!203446 (= e!139414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!69471 () Bool)

(assert (=> d!69471 e!139407))

(declare-fun res!170428 () Bool)

(assert (=> d!69471 (=> (not res!170428) (not e!139407))))

(assert (=> d!69471 (= res!170428 (invariant!0 (currentBit!9493 (_2!9350 lt!317446)) (currentByte!9498 (_2!9350 lt!317446)) (size!4535 (buf!5040 (_2!9350 lt!317446)))))))

(assert (=> d!69471 (= lt!317446 e!139410)))

(assert (=> d!69471 (= c!10087 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69471 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69471 (= (appendBitsLSBFirstLoopTR!0 (_2!9350 lt!317144) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!317446)))

(declare-fun b!203447 () Bool)

(declare-fun res!170429 () Bool)

(assert (=> b!203447 (=> (not res!170429) (not e!139407))))

(assert (=> b!203447 (= res!170429 (= (size!4535 (buf!5040 (_2!9350 lt!317144))) (size!4535 (buf!5040 (_2!9350 lt!317446)))))))

(declare-fun b!203448 () Bool)

(declare-fun res!170436 () Bool)

(assert (=> b!203448 (= res!170436 (= (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317468))) (currentByte!9498 (_2!9350 lt!317468)) (currentBit!9493 (_2!9350 lt!317468))) (bvadd (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!203448 (=> (not res!170436) (not e!139408))))

(assert (= (and d!69471 c!10087) b!203434))

(assert (= (and d!69471 (not c!10087)) b!203443))

(assert (= (and b!203443 res!170432) b!203448))

(assert (= (and b!203448 res!170436) b!203436))

(assert (= (and b!203436 res!170437) b!203438))

(assert (= (and b!203438 res!170439) b!203439))

(assert (= (and b!203443 res!170434) b!203433))

(assert (= (and b!203443 c!10086) b!203442))

(assert (= (and b!203443 (not c!10086)) b!203446))

(assert (= (and b!203443 res!170433) b!203435))

(assert (= (or b!203434 b!203443) bm!3207))

(assert (= (and d!69471 res!170428) b!203447))

(assert (= (and b!203447 res!170429) b!203437))

(assert (= (and b!203437 res!170438) b!203440))

(assert (= (and b!203440 res!170431) b!203445))

(assert (= (and b!203445 res!170435) b!203441))

(assert (= (and b!203445 res!170430) b!203444))

(declare-fun m!314197 () Bool)

(assert (=> b!203443 m!314197))

(declare-fun m!314199 () Bool)

(assert (=> b!203443 m!314199))

(declare-fun m!314201 () Bool)

(assert (=> b!203443 m!314201))

(declare-fun m!314203 () Bool)

(assert (=> b!203443 m!314203))

(declare-fun m!314205 () Bool)

(assert (=> b!203443 m!314205))

(declare-fun m!314207 () Bool)

(assert (=> b!203443 m!314207))

(declare-fun m!314209 () Bool)

(assert (=> b!203443 m!314209))

(declare-fun m!314211 () Bool)

(assert (=> b!203443 m!314211))

(declare-fun m!314213 () Bool)

(assert (=> b!203443 m!314213))

(declare-fun m!314215 () Bool)

(assert (=> b!203443 m!314215))

(declare-fun m!314217 () Bool)

(assert (=> b!203443 m!314217))

(declare-fun m!314219 () Bool)

(assert (=> b!203443 m!314219))

(assert (=> b!203443 m!314083))

(declare-fun m!314221 () Bool)

(assert (=> b!203443 m!314221))

(declare-fun m!314223 () Bool)

(assert (=> b!203443 m!314223))

(declare-fun m!314225 () Bool)

(assert (=> b!203443 m!314225))

(declare-fun m!314227 () Bool)

(assert (=> b!203443 m!314227))

(declare-fun m!314229 () Bool)

(assert (=> b!203443 m!314229))

(declare-fun m!314231 () Bool)

(assert (=> b!203443 m!314231))

(declare-fun m!314233 () Bool)

(assert (=> b!203443 m!314233))

(declare-fun m!314235 () Bool)

(assert (=> b!203443 m!314235))

(declare-fun m!314237 () Bool)

(assert (=> b!203443 m!314237))

(declare-fun m!314239 () Bool)

(assert (=> b!203443 m!314239))

(assert (=> b!203443 m!314219))

(declare-fun m!314241 () Bool)

(assert (=> b!203443 m!314241))

(declare-fun m!314243 () Bool)

(assert (=> b!203443 m!314243))

(declare-fun m!314245 () Bool)

(assert (=> b!203443 m!314245))

(declare-fun m!314247 () Bool)

(assert (=> b!203443 m!314247))

(declare-fun m!314249 () Bool)

(assert (=> b!203443 m!314249))

(declare-fun m!314251 () Bool)

(assert (=> b!203443 m!314251))

(declare-fun m!314253 () Bool)

(assert (=> b!203443 m!314253))

(declare-fun m!314255 () Bool)

(assert (=> b!203443 m!314255))

(declare-fun m!314257 () Bool)

(assert (=> b!203443 m!314257))

(declare-fun m!314259 () Bool)

(assert (=> b!203443 m!314259))

(declare-fun m!314261 () Bool)

(assert (=> b!203436 m!314261))

(declare-fun m!314263 () Bool)

(assert (=> b!203440 m!314263))

(declare-fun m!314265 () Bool)

(assert (=> b!203441 m!314265))

(declare-fun m!314267 () Bool)

(assert (=> b!203434 m!314267))

(declare-fun m!314269 () Bool)

(assert (=> b!203439 m!314269))

(declare-fun m!314271 () Bool)

(assert (=> b!203439 m!314271))

(declare-fun m!314273 () Bool)

(assert (=> bm!3207 m!314273))

(assert (=> b!203448 m!314271))

(assert (=> b!203448 m!314083))

(declare-fun m!314275 () Bool)

(assert (=> b!203438 m!314275))

(assert (=> b!203438 m!314275))

(declare-fun m!314277 () Bool)

(assert (=> b!203438 m!314277))

(declare-fun m!314279 () Bool)

(assert (=> d!69471 m!314279))

(declare-fun m!314281 () Bool)

(assert (=> b!203437 m!314281))

(assert (=> b!203437 m!314083))

(assert (=> b!203445 m!314235))

(declare-fun m!314283 () Bool)

(assert (=> b!203445 m!314283))

(assert (=> b!203445 m!314211))

(declare-fun m!314285 () Bool)

(assert (=> b!203445 m!314285))

(declare-fun m!314287 () Bool)

(assert (=> b!203445 m!314287))

(declare-fun m!314289 () Bool)

(assert (=> b!203445 m!314289))

(assert (=> b!203279 d!69471))

(declare-fun d!69519 () Bool)

(declare-fun e!139427 () Bool)

(assert (=> d!69519 e!139427))

(declare-fun res!170459 () Bool)

(assert (=> d!69519 (=> (not res!170459) (not e!139427))))

(declare-fun lt!317556 () (_ BitVec 64))

(declare-fun lt!317557 () (_ BitVec 64))

(declare-fun lt!317554 () (_ BitVec 64))

(assert (=> d!69519 (= res!170459 (= lt!317554 (bvsub lt!317557 lt!317556)))))

(assert (=> d!69519 (or (= (bvand lt!317557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317557 lt!317556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69519 (= lt!317556 (remainingBits!0 ((_ sign_extend 32) (size!4535 (buf!5040 (_2!9350 lt!317144)))) ((_ sign_extend 32) (currentByte!9498 (_2!9350 lt!317144))) ((_ sign_extend 32) (currentBit!9493 (_2!9350 lt!317144)))))))

(declare-fun lt!317555 () (_ BitVec 64))

(declare-fun lt!317558 () (_ BitVec 64))

(assert (=> d!69519 (= lt!317557 (bvmul lt!317555 lt!317558))))

(assert (=> d!69519 (or (= lt!317555 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317558 (bvsdiv (bvmul lt!317555 lt!317558) lt!317555)))))

(assert (=> d!69519 (= lt!317558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69519 (= lt!317555 ((_ sign_extend 32) (size!4535 (buf!5040 (_2!9350 lt!317144)))))))

(assert (=> d!69519 (= lt!317554 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9498 (_2!9350 lt!317144))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9493 (_2!9350 lt!317144)))))))

(assert (=> d!69519 (invariant!0 (currentBit!9493 (_2!9350 lt!317144)) (currentByte!9498 (_2!9350 lt!317144)) (size!4535 (buf!5040 (_2!9350 lt!317144))))))

(assert (=> d!69519 (= (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144))) lt!317554)))

(declare-fun b!203471 () Bool)

(declare-fun res!170458 () Bool)

(assert (=> b!203471 (=> (not res!170458) (not e!139427))))

(assert (=> b!203471 (= res!170458 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317554))))

(declare-fun b!203472 () Bool)

(declare-fun lt!317559 () (_ BitVec 64))

(assert (=> b!203472 (= e!139427 (bvsle lt!317554 (bvmul lt!317559 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203472 (or (= lt!317559 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317559 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317559)))))

(assert (=> b!203472 (= lt!317559 ((_ sign_extend 32) (size!4535 (buf!5040 (_2!9350 lt!317144)))))))

(assert (= (and d!69519 res!170459) b!203471))

(assert (= (and b!203471 res!170458) b!203472))

(declare-fun m!314291 () Bool)

(assert (=> d!69519 m!314291))

(assert (=> d!69519 m!314135))

(assert (=> b!203284 d!69519))

(declare-fun d!69521 () Bool)

(declare-fun e!139428 () Bool)

(assert (=> d!69521 e!139428))

(declare-fun res!170461 () Bool)

(assert (=> d!69521 (=> (not res!170461) (not e!139428))))

(declare-fun lt!317563 () (_ BitVec 64))

(declare-fun lt!317562 () (_ BitVec 64))

(declare-fun lt!317560 () (_ BitVec 64))

(assert (=> d!69521 (= res!170461 (= lt!317560 (bvsub lt!317563 lt!317562)))))

(assert (=> d!69521 (or (= (bvand lt!317563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317562 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317563 lt!317562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69521 (= lt!317562 (remainingBits!0 ((_ sign_extend 32) (size!4535 (buf!5040 thiss!1204))) ((_ sign_extend 32) (currentByte!9498 thiss!1204)) ((_ sign_extend 32) (currentBit!9493 thiss!1204))))))

(declare-fun lt!317561 () (_ BitVec 64))

(declare-fun lt!317564 () (_ BitVec 64))

(assert (=> d!69521 (= lt!317563 (bvmul lt!317561 lt!317564))))

(assert (=> d!69521 (or (= lt!317561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317564 (bvsdiv (bvmul lt!317561 lt!317564) lt!317561)))))

(assert (=> d!69521 (= lt!317564 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69521 (= lt!317561 ((_ sign_extend 32) (size!4535 (buf!5040 thiss!1204))))))

(assert (=> d!69521 (= lt!317560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9498 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9493 thiss!1204))))))

(assert (=> d!69521 (invariant!0 (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204) (size!4535 (buf!5040 thiss!1204)))))

(assert (=> d!69521 (= (bitIndex!0 (size!4535 (buf!5040 thiss!1204)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204)) lt!317560)))

(declare-fun b!203473 () Bool)

(declare-fun res!170460 () Bool)

(assert (=> b!203473 (=> (not res!170460) (not e!139428))))

(assert (=> b!203473 (= res!170460 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317560))))

(declare-fun b!203474 () Bool)

(declare-fun lt!317565 () (_ BitVec 64))

(assert (=> b!203474 (= e!139428 (bvsle lt!317560 (bvmul lt!317565 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203474 (or (= lt!317565 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317565 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317565)))))

(assert (=> b!203474 (= lt!317565 ((_ sign_extend 32) (size!4535 (buf!5040 thiss!1204))))))

(assert (= (and d!69521 res!170461) b!203473))

(assert (= (and b!203473 res!170460) b!203474))

(declare-fun m!314293 () Bool)

(assert (=> d!69521 m!314293))

(assert (=> d!69521 m!314077))

(assert (=> b!203284 d!69521))

(declare-fun b!203504 () Bool)

(declare-fun e!139443 () Bool)

(declare-fun e!139444 () Bool)

(assert (=> b!203504 (= e!139443 e!139444)))

(declare-fun res!170485 () Bool)

(assert (=> b!203504 (=> (not res!170485) (not e!139444))))

(declare-fun lt!317639 () tuple2!17396)

(declare-fun lt!317636 () tuple2!17394)

(assert (=> b!203504 (= res!170485 (and (= (_2!9349 lt!317636) lt!317143) (= (_1!9349 lt!317636) (_2!9350 lt!317639))))))

(assert (=> b!203504 (= lt!317636 (readBitPure!0 (readerFrom!0 (_2!9350 lt!317639) (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204))))))

(declare-fun d!69523 () Bool)

(assert (=> d!69523 e!139443))

(declare-fun res!170484 () Bool)

(assert (=> d!69523 (=> (not res!170484) (not e!139443))))

(assert (=> d!69523 (= res!170484 (= (size!4535 (buf!5040 thiss!1204)) (size!4535 (buf!5040 (_2!9350 lt!317639)))))))

(declare-fun choose!16 (BitStream!8178 Bool) tuple2!17396)

(assert (=> d!69523 (= lt!317639 (choose!16 thiss!1204 lt!317143))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69523 (validate_offset_bit!0 ((_ sign_extend 32) (size!4535 (buf!5040 thiss!1204))) ((_ sign_extend 32) (currentByte!9498 thiss!1204)) ((_ sign_extend 32) (currentBit!9493 thiss!1204)))))

(assert (=> d!69523 (= (appendBit!0 thiss!1204 lt!317143) lt!317639)))

(declare-fun b!203503 () Bool)

(declare-fun res!170486 () Bool)

(assert (=> b!203503 (=> (not res!170486) (not e!139443))))

(assert (=> b!203503 (= res!170486 (isPrefixOf!0 thiss!1204 (_2!9350 lt!317639)))))

(declare-fun b!203505 () Bool)

(assert (=> b!203505 (= e!139444 (= (bitIndex!0 (size!4535 (buf!5040 (_1!9349 lt!317636))) (currentByte!9498 (_1!9349 lt!317636)) (currentBit!9493 (_1!9349 lt!317636))) (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317639))) (currentByte!9498 (_2!9350 lt!317639)) (currentBit!9493 (_2!9350 lt!317639)))))))

(declare-fun b!203502 () Bool)

(declare-fun res!170487 () Bool)

(assert (=> b!203502 (=> (not res!170487) (not e!139443))))

(declare-fun lt!317637 () (_ BitVec 64))

(declare-fun lt!317638 () (_ BitVec 64))

(assert (=> b!203502 (= res!170487 (= (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317639))) (currentByte!9498 (_2!9350 lt!317639)) (currentBit!9493 (_2!9350 lt!317639))) (bvadd lt!317638 lt!317637)))))

(assert (=> b!203502 (or (not (= (bvand lt!317638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317637 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!317638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!317638 lt!317637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203502 (= lt!317637 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203502 (= lt!317638 (bitIndex!0 (size!4535 (buf!5040 thiss!1204)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204)))))

(assert (= (and d!69523 res!170484) b!203502))

(assert (= (and b!203502 res!170487) b!203503))

(assert (= (and b!203503 res!170486) b!203504))

(assert (= (and b!203504 res!170485) b!203505))

(declare-fun m!314393 () Bool)

(assert (=> b!203504 m!314393))

(assert (=> b!203504 m!314393))

(declare-fun m!314395 () Bool)

(assert (=> b!203504 m!314395))

(declare-fun m!314397 () Bool)

(assert (=> b!203505 m!314397))

(declare-fun m!314399 () Bool)

(assert (=> b!203505 m!314399))

(declare-fun m!314401 () Bool)

(assert (=> d!69523 m!314401))

(declare-fun m!314403 () Bool)

(assert (=> d!69523 m!314403))

(declare-fun m!314405 () Bool)

(assert (=> b!203503 m!314405))

(assert (=> b!203502 m!314399))

(assert (=> b!203502 m!314085))

(assert (=> b!203284 d!69523))

(declare-fun d!69529 () Bool)

(assert (=> d!69529 (= (array_inv!4276 (buf!5040 thiss!1204)) (bvsge (size!4535 (buf!5040 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!203278 d!69529))

(assert (=> b!203280 d!69519))

(assert (=> b!203280 d!69521))

(declare-fun d!69531 () Bool)

(assert (=> d!69531 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4535 (buf!5040 thiss!1204))) ((_ sign_extend 32) (currentByte!9498 thiss!1204)) ((_ sign_extend 32) (currentBit!9493 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4535 (buf!5040 thiss!1204))) ((_ sign_extend 32) (currentByte!9498 thiss!1204)) ((_ sign_extend 32) (currentBit!9493 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17134 () Bool)

(assert (= bs!17134 d!69531))

(assert (=> bs!17134 m!314293))

(assert (=> b!203285 d!69531))

(declare-fun d!69533 () Bool)

(assert (=> d!69533 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9493 thiss!1204) (currentByte!9498 thiss!1204) (size!4535 (buf!5040 thiss!1204))))))

(declare-fun bs!17135 () Bool)

(assert (= bs!17135 d!69533))

(assert (=> bs!17135 m!314077))

(assert (=> start!43118 d!69533))

(declare-fun d!69535 () Bool)

(declare-fun e!139445 () Bool)

(assert (=> d!69535 e!139445))

(declare-fun res!170489 () Bool)

(assert (=> d!69535 (=> (not res!170489) (not e!139445))))

(declare-fun lt!317642 () (_ BitVec 64))

(declare-fun lt!317643 () (_ BitVec 64))

(declare-fun lt!317640 () (_ BitVec 64))

(assert (=> d!69535 (= res!170489 (= lt!317640 (bvsub lt!317643 lt!317642)))))

(assert (=> d!69535 (or (= (bvand lt!317643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317642 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317643 lt!317642) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69535 (= lt!317642 (remainingBits!0 ((_ sign_extend 32) (size!4535 (buf!5040 (_1!9349 lt!317140)))) ((_ sign_extend 32) (currentByte!9498 (_1!9349 lt!317140))) ((_ sign_extend 32) (currentBit!9493 (_1!9349 lt!317140)))))))

(declare-fun lt!317641 () (_ BitVec 64))

(declare-fun lt!317644 () (_ BitVec 64))

(assert (=> d!69535 (= lt!317643 (bvmul lt!317641 lt!317644))))

(assert (=> d!69535 (or (= lt!317641 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317644 (bvsdiv (bvmul lt!317641 lt!317644) lt!317641)))))

(assert (=> d!69535 (= lt!317644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69535 (= lt!317641 ((_ sign_extend 32) (size!4535 (buf!5040 (_1!9349 lt!317140)))))))

(assert (=> d!69535 (= lt!317640 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9498 (_1!9349 lt!317140))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9493 (_1!9349 lt!317140)))))))

(assert (=> d!69535 (invariant!0 (currentBit!9493 (_1!9349 lt!317140)) (currentByte!9498 (_1!9349 lt!317140)) (size!4535 (buf!5040 (_1!9349 lt!317140))))))

(assert (=> d!69535 (= (bitIndex!0 (size!4535 (buf!5040 (_1!9349 lt!317140))) (currentByte!9498 (_1!9349 lt!317140)) (currentBit!9493 (_1!9349 lt!317140))) lt!317640)))

(declare-fun b!203506 () Bool)

(declare-fun res!170488 () Bool)

(assert (=> b!203506 (=> (not res!170488) (not e!139445))))

(assert (=> b!203506 (= res!170488 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317640))))

(declare-fun b!203507 () Bool)

(declare-fun lt!317645 () (_ BitVec 64))

(assert (=> b!203507 (= e!139445 (bvsle lt!317640 (bvmul lt!317645 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203507 (or (= lt!317645 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317645 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317645)))))

(assert (=> b!203507 (= lt!317645 ((_ sign_extend 32) (size!4535 (buf!5040 (_1!9349 lt!317140)))))))

(assert (= (and d!69535 res!170489) b!203506))

(assert (= (and b!203506 res!170488) b!203507))

(declare-fun m!314407 () Bool)

(assert (=> d!69535 m!314407))

(declare-fun m!314409 () Bool)

(assert (=> d!69535 m!314409))

(assert (=> b!203281 d!69535))

(declare-fun d!69537 () Bool)

(declare-fun res!170491 () Bool)

(declare-fun e!139446 () Bool)

(assert (=> d!69537 (=> (not res!170491) (not e!139446))))

(assert (=> d!69537 (= res!170491 (= (size!4535 (buf!5040 thiss!1204)) (size!4535 (buf!5040 (_2!9350 lt!317144)))))))

(assert (=> d!69537 (= (isPrefixOf!0 thiss!1204 (_2!9350 lt!317144)) e!139446)))

(declare-fun b!203508 () Bool)

(declare-fun res!170492 () Bool)

(assert (=> b!203508 (=> (not res!170492) (not e!139446))))

(assert (=> b!203508 (= res!170492 (bvsle (bitIndex!0 (size!4535 (buf!5040 thiss!1204)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204)) (bitIndex!0 (size!4535 (buf!5040 (_2!9350 lt!317144))) (currentByte!9498 (_2!9350 lt!317144)) (currentBit!9493 (_2!9350 lt!317144)))))))

(declare-fun b!203509 () Bool)

(declare-fun e!139447 () Bool)

(assert (=> b!203509 (= e!139446 e!139447)))

(declare-fun res!170490 () Bool)

(assert (=> b!203509 (=> res!170490 e!139447)))

(assert (=> b!203509 (= res!170490 (= (size!4535 (buf!5040 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203510 () Bool)

(assert (=> b!203510 (= e!139447 (arrayBitRangesEq!0 (buf!5040 thiss!1204) (buf!5040 (_2!9350 lt!317144)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4535 (buf!5040 thiss!1204)) (currentByte!9498 thiss!1204) (currentBit!9493 thiss!1204))))))

(assert (= (and d!69537 res!170491) b!203508))

(assert (= (and b!203508 res!170492) b!203509))

(assert (= (and b!203509 (not res!170490)) b!203510))

(assert (=> b!203508 m!314085))

(assert (=> b!203508 m!314083))

(assert (=> b!203510 m!314085))

(assert (=> b!203510 m!314085))

(declare-fun m!314411 () Bool)

(assert (=> b!203510 m!314411))

(assert (=> b!203286 d!69537))

(check-sat (not b!203443) (not d!69469) (not b!203439) (not b!203326) (not b!203508) (not d!69535) (not d!69521) (not b!203437) (not b!203448) (not d!69519) (not d!69523) (not b!203503) (not b!203328) (not d!69471) (not b!203510) (not d!69531) (not d!69533) (not b!203436) (not b!203438) (not d!69463) (not b!203440) (not b!203504) (not b!203445) (not b!203441) (not b!203319) (not b!203502) (not bm!3207) (not b!203434) (not d!69461) (not b!203505))
(check-sat)

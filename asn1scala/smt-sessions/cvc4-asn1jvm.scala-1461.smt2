; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40182 () Bool)

(assert start!40182)

(declare-fun b!183389 () Bool)

(declare-fun e!127172 () Bool)

(declare-fun e!127163 () Bool)

(assert (=> b!183389 (= e!127172 e!127163)))

(declare-fun res!152452 () Bool)

(assert (=> b!183389 (=> (not res!152452) (not e!127163))))

(declare-datatypes ((array!9750 0))(
  ( (array!9751 (arr!5229 (Array (_ BitVec 32) (_ BitVec 8))) (size!4299 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7706 0))(
  ( (BitStream!7707 (buf!4754 array!9750) (currentByte!8988 (_ BitVec 32)) (currentBit!8983 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13173 0))(
  ( (Unit!13174) )
))
(declare-datatypes ((tuple2!15828 0))(
  ( (tuple2!15829 (_1!8559 Unit!13173) (_2!8559 BitStream!7706)) )
))
(declare-fun lt!282322 () tuple2!15828)

(declare-datatypes ((tuple2!15830 0))(
  ( (tuple2!15831 (_1!8560 BitStream!7706) (_2!8560 Bool)) )
))
(declare-fun lt!282312 () tuple2!15830)

(declare-fun lt!282319 () Bool)

(assert (=> b!183389 (= res!152452 (and (= (_2!8560 lt!282312) lt!282319) (= (_1!8560 lt!282312) (_2!8559 lt!282322))))))

(declare-fun thiss!1204 () BitStream!7706)

(declare-fun readBitPure!0 (BitStream!7706) tuple2!15830)

(declare-fun readerFrom!0 (BitStream!7706 (_ BitVec 32) (_ BitVec 32)) BitStream!7706)

(assert (=> b!183389 (= lt!282312 (readBitPure!0 (readerFrom!0 (_2!8559 lt!282322) (currentBit!8983 thiss!1204) (currentByte!8988 thiss!1204))))))

(declare-fun b!183390 () Bool)

(declare-fun e!127171 () Bool)

(declare-fun e!127166 () Bool)

(assert (=> b!183390 (= e!127171 (not e!127166))))

(declare-fun res!152449 () Bool)

(assert (=> b!183390 (=> res!152449 e!127166)))

(declare-fun lt!282326 () (_ BitVec 64))

(declare-fun lt!282310 () (_ BitVec 64))

(assert (=> b!183390 (= res!152449 (not (= lt!282326 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282310))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183390 (= lt!282326 (bitIndex!0 (size!4299 (buf!4754 (_2!8559 lt!282322))) (currentByte!8988 (_2!8559 lt!282322)) (currentBit!8983 (_2!8559 lt!282322))))))

(assert (=> b!183390 (= lt!282310 (bitIndex!0 (size!4299 (buf!4754 thiss!1204)) (currentByte!8988 thiss!1204) (currentBit!8983 thiss!1204)))))

(declare-fun e!127168 () Bool)

(assert (=> b!183390 e!127168))

(declare-fun res!152464 () Bool)

(assert (=> b!183390 (=> (not res!152464) (not e!127168))))

(assert (=> b!183390 (= res!152464 (= (size!4299 (buf!4754 thiss!1204)) (size!4299 (buf!4754 (_2!8559 lt!282322)))))))

(declare-fun appendBit!0 (BitStream!7706 Bool) tuple2!15828)

(assert (=> b!183390 (= lt!282322 (appendBit!0 thiss!1204 lt!282319))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!282318 () (_ BitVec 64))

(assert (=> b!183390 (= lt!282319 (not (= (bvand v!189 lt!282318) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!183390 (= lt!282318 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183391 () Bool)

(declare-fun res!152460 () Bool)

(declare-fun e!127165 () Bool)

(assert (=> b!183391 (=> res!152460 e!127165)))

(declare-fun lt!282330 () tuple2!15828)

(declare-fun isPrefixOf!0 (BitStream!7706 BitStream!7706) Bool)

(assert (=> b!183391 (= res!152460 (not (isPrefixOf!0 (_2!8559 lt!282322) (_2!8559 lt!282330))))))

(declare-fun b!183392 () Bool)

(declare-fun res!152454 () Bool)

(assert (=> b!183392 (=> res!152454 e!127165)))

(assert (=> b!183392 (= res!152454 (not (isPrefixOf!0 thiss!1204 (_2!8559 lt!282322))))))

(declare-fun b!183393 () Bool)

(declare-fun res!152450 () Bool)

(declare-fun e!127164 () Bool)

(assert (=> b!183393 (=> res!152450 e!127164)))

(declare-datatypes ((tuple2!15832 0))(
  ( (tuple2!15833 (_1!8561 BitStream!7706) (_2!8561 BitStream!7706)) )
))
(declare-fun lt!282328 () tuple2!15832)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183393 (= res!152450 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4299 (buf!4754 (_1!8561 lt!282328)))) ((_ sign_extend 32) (currentByte!8988 (_1!8561 lt!282328))) ((_ sign_extend 32) (currentBit!8983 (_1!8561 lt!282328))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))))

(declare-fun b!183394 () Bool)

(declare-fun e!127173 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183394 (= e!127173 (invariant!0 (currentBit!8983 thiss!1204) (currentByte!8988 thiss!1204) (size!4299 (buf!4754 (_2!8559 lt!282330)))))))

(declare-fun b!183396 () Bool)

(assert (=> b!183396 (= e!127166 e!127165)))

(declare-fun res!152455 () Bool)

(assert (=> b!183396 (=> res!152455 e!127165)))

(declare-fun lt!282313 () (_ BitVec 64))

(assert (=> b!183396 (= res!152455 (not (= lt!282313 (bvsub (bvsub (bvadd lt!282326 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183396 (= lt!282313 (bitIndex!0 (size!4299 (buf!4754 (_2!8559 lt!282330))) (currentByte!8988 (_2!8559 lt!282330)) (currentBit!8983 (_2!8559 lt!282330))))))

(assert (=> b!183396 (isPrefixOf!0 thiss!1204 (_2!8559 lt!282330))))

(declare-fun lt!282323 () Unit!13173)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7706 BitStream!7706 BitStream!7706) Unit!13173)

(assert (=> b!183396 (= lt!282323 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8559 lt!282322) (_2!8559 lt!282330)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7706 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15828)

(assert (=> b!183396 (= lt!282330 (appendBitsLSBFirstLoopTR!0 (_2!8559 lt!282322) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183397 () Bool)

(declare-fun e!127170 () Bool)

(assert (=> b!183397 (= e!127170 e!127171)))

(declare-fun res!152463 () Bool)

(assert (=> b!183397 (=> (not res!152463) (not e!127171))))

(declare-fun lt!282314 () (_ BitVec 64))

(assert (=> b!183397 (= res!152463 (validate_offset_bits!1 ((_ sign_extend 32) (size!4299 (buf!4754 thiss!1204))) ((_ sign_extend 32) (currentByte!8988 thiss!1204)) ((_ sign_extend 32) (currentBit!8983 thiss!1204)) lt!282314))))

(assert (=> b!183397 (= lt!282314 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183398 () Bool)

(declare-fun res!152465 () Bool)

(assert (=> b!183398 (=> (not res!152465) (not e!127171))))

(assert (=> b!183398 (= res!152465 (invariant!0 (currentBit!8983 thiss!1204) (currentByte!8988 thiss!1204) (size!4299 (buf!4754 thiss!1204))))))

(declare-fun b!183399 () Bool)

(assert (=> b!183399 (= e!127168 e!127172)))

(declare-fun res!152451 () Bool)

(assert (=> b!183399 (=> (not res!152451) (not e!127172))))

(declare-fun lt!282311 () (_ BitVec 64))

(declare-fun lt!282316 () (_ BitVec 64))

(assert (=> b!183399 (= res!152451 (= lt!282311 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282316)))))

(assert (=> b!183399 (= lt!282311 (bitIndex!0 (size!4299 (buf!4754 (_2!8559 lt!282322))) (currentByte!8988 (_2!8559 lt!282322)) (currentBit!8983 (_2!8559 lt!282322))))))

(assert (=> b!183399 (= lt!282316 (bitIndex!0 (size!4299 (buf!4754 thiss!1204)) (currentByte!8988 thiss!1204) (currentBit!8983 thiss!1204)))))

(declare-fun b!183400 () Bool)

(declare-fun res!152461 () Bool)

(assert (=> b!183400 (=> (not res!152461) (not e!127172))))

(assert (=> b!183400 (= res!152461 (isPrefixOf!0 thiss!1204 (_2!8559 lt!282322)))))

(declare-fun b!183401 () Bool)

(assert (=> b!183401 (= e!127165 e!127164)))

(declare-fun res!152456 () Bool)

(assert (=> b!183401 (=> res!152456 e!127164)))

(assert (=> b!183401 (= res!152456 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!282309 () (_ BitVec 64))

(assert (=> b!183401 (validate_offset_bits!1 ((_ sign_extend 32) (size!4299 (buf!4754 (_2!8559 lt!282330)))) ((_ sign_extend 32) (currentByte!8988 (_2!8559 lt!282322))) ((_ sign_extend 32) (currentBit!8983 (_2!8559 lt!282322))) lt!282309)))

(declare-fun lt!282327 () Unit!13173)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7706 array!9750 (_ BitVec 64)) Unit!13173)

(assert (=> b!183401 (= lt!282327 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8559 lt!282322) (buf!4754 (_2!8559 lt!282330)) lt!282309))))

(assert (=> b!183401 (= lt!282309 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!282325 () (_ BitVec 64))

(declare-fun lt!282331 () tuple2!15830)

(declare-fun lt!282332 () (_ BitVec 64))

(assert (=> b!183401 (= lt!282325 (bvor lt!282332 (ite (_2!8560 lt!282331) lt!282318 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!15834 0))(
  ( (tuple2!15835 (_1!8562 BitStream!7706) (_2!8562 (_ BitVec 64))) )
))
(declare-fun lt!282329 () tuple2!15834)

(declare-fun lt!282321 () tuple2!15832)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15834)

(assert (=> b!183401 (= lt!282329 (readNBitsLSBFirstsLoopPure!0 (_1!8561 lt!282321) nBits!348 i!590 lt!282332))))

(assert (=> b!183401 (validate_offset_bits!1 ((_ sign_extend 32) (size!4299 (buf!4754 (_2!8559 lt!282330)))) ((_ sign_extend 32) (currentByte!8988 thiss!1204)) ((_ sign_extend 32) (currentBit!8983 thiss!1204)) lt!282314)))

(declare-fun lt!282315 () Unit!13173)

(assert (=> b!183401 (= lt!282315 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4754 (_2!8559 lt!282330)) lt!282314))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183401 (= lt!282332 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!183401 (= (_2!8560 lt!282331) lt!282319)))

(assert (=> b!183401 (= lt!282331 (readBitPure!0 (_1!8561 lt!282321)))))

(declare-fun reader!0 (BitStream!7706 BitStream!7706) tuple2!15832)

(assert (=> b!183401 (= lt!282328 (reader!0 (_2!8559 lt!282322) (_2!8559 lt!282330)))))

(assert (=> b!183401 (= lt!282321 (reader!0 thiss!1204 (_2!8559 lt!282330)))))

(declare-fun e!127169 () Bool)

(assert (=> b!183401 e!127169))

(declare-fun res!152448 () Bool)

(assert (=> b!183401 (=> (not res!152448) (not e!127169))))

(declare-fun lt!282320 () tuple2!15830)

(declare-fun lt!282317 () tuple2!15830)

(assert (=> b!183401 (= res!152448 (= (bitIndex!0 (size!4299 (buf!4754 (_1!8560 lt!282320))) (currentByte!8988 (_1!8560 lt!282320)) (currentBit!8983 (_1!8560 lt!282320))) (bitIndex!0 (size!4299 (buf!4754 (_1!8560 lt!282317))) (currentByte!8988 (_1!8560 lt!282317)) (currentBit!8983 (_1!8560 lt!282317)))))))

(declare-fun lt!282308 () Unit!13173)

(declare-fun lt!282324 () BitStream!7706)

(declare-fun readBitPrefixLemma!0 (BitStream!7706 BitStream!7706) Unit!13173)

(assert (=> b!183401 (= lt!282308 (readBitPrefixLemma!0 lt!282324 (_2!8559 lt!282330)))))

(assert (=> b!183401 (= lt!282317 (readBitPure!0 (BitStream!7707 (buf!4754 (_2!8559 lt!282330)) (currentByte!8988 thiss!1204) (currentBit!8983 thiss!1204))))))

(assert (=> b!183401 (= lt!282320 (readBitPure!0 lt!282324))))

(assert (=> b!183401 e!127173))

(declare-fun res!152458 () Bool)

(assert (=> b!183401 (=> (not res!152458) (not e!127173))))

(assert (=> b!183401 (= res!152458 (invariant!0 (currentBit!8983 thiss!1204) (currentByte!8988 thiss!1204) (size!4299 (buf!4754 (_2!8559 lt!282322)))))))

(assert (=> b!183401 (= lt!282324 (BitStream!7707 (buf!4754 (_2!8559 lt!282322)) (currentByte!8988 thiss!1204) (currentBit!8983 thiss!1204)))))

(declare-fun b!183402 () Bool)

(declare-fun res!152462 () Bool)

(assert (=> b!183402 (=> res!152462 e!127165)))

(assert (=> b!183402 (= res!152462 (or (not (= (size!4299 (buf!4754 (_2!8559 lt!282330))) (size!4299 (buf!4754 thiss!1204)))) (not (= lt!282313 (bvsub (bvadd lt!282310 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183403 () Bool)

(declare-fun e!127174 () Bool)

(declare-fun array_inv!4040 (array!9750) Bool)

(assert (=> b!183403 (= e!127174 (array_inv!4040 (buf!4754 thiss!1204)))))

(declare-fun b!183404 () Bool)

(assert (=> b!183404 (= e!127164 (= (bvand lt!282325 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282325))))

(declare-fun b!183405 () Bool)

(declare-fun res!152466 () Bool)

(assert (=> b!183405 (=> res!152466 e!127165)))

(assert (=> b!183405 (= res!152466 (not (invariant!0 (currentBit!8983 (_2!8559 lt!282330)) (currentByte!8988 (_2!8559 lt!282330)) (size!4299 (buf!4754 (_2!8559 lt!282330))))))))

(declare-fun b!183406 () Bool)

(assert (=> b!183406 (= e!127163 (= (bitIndex!0 (size!4299 (buf!4754 (_1!8560 lt!282312))) (currentByte!8988 (_1!8560 lt!282312)) (currentBit!8983 (_1!8560 lt!282312))) lt!282311))))

(declare-fun b!183407 () Bool)

(declare-fun res!152453 () Bool)

(assert (=> b!183407 (=> res!152453 e!127164)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183407 (= res!152453 (not (= (bvand lt!282325 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183408 () Bool)

(assert (=> b!183408 (= e!127169 (= (_2!8560 lt!282320) (_2!8560 lt!282317)))))

(declare-fun b!183395 () Bool)

(declare-fun res!152459 () Bool)

(assert (=> b!183395 (=> (not res!152459) (not e!127171))))

(assert (=> b!183395 (= res!152459 (not (= i!590 nBits!348)))))

(declare-fun res!152457 () Bool)

(assert (=> start!40182 (=> (not res!152457) (not e!127170))))

(assert (=> start!40182 (= res!152457 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40182 e!127170))

(assert (=> start!40182 true))

(declare-fun inv!12 (BitStream!7706) Bool)

(assert (=> start!40182 (and (inv!12 thiss!1204) e!127174)))

(assert (= (and start!40182 res!152457) b!183397))

(assert (= (and b!183397 res!152463) b!183398))

(assert (= (and b!183398 res!152465) b!183395))

(assert (= (and b!183395 res!152459) b!183390))

(assert (= (and b!183390 res!152464) b!183399))

(assert (= (and b!183399 res!152451) b!183400))

(assert (= (and b!183400 res!152461) b!183389))

(assert (= (and b!183389 res!152452) b!183406))

(assert (= (and b!183390 (not res!152449)) b!183396))

(assert (= (and b!183396 (not res!152455)) b!183405))

(assert (= (and b!183405 (not res!152466)) b!183402))

(assert (= (and b!183402 (not res!152462)) b!183391))

(assert (= (and b!183391 (not res!152460)) b!183392))

(assert (= (and b!183392 (not res!152454)) b!183401))

(assert (= (and b!183401 res!152458) b!183394))

(assert (= (and b!183401 res!152448) b!183408))

(assert (= (and b!183401 (not res!152456)) b!183393))

(assert (= (and b!183393 (not res!152450)) b!183407))

(assert (= (and b!183407 (not res!152453)) b!183404))

(assert (= start!40182 b!183403))

(declare-fun m!285303 () Bool)

(assert (=> b!183399 m!285303))

(declare-fun m!285305 () Bool)

(assert (=> b!183399 m!285305))

(declare-fun m!285307 () Bool)

(assert (=> b!183401 m!285307))

(declare-fun m!285309 () Bool)

(assert (=> b!183401 m!285309))

(declare-fun m!285311 () Bool)

(assert (=> b!183401 m!285311))

(declare-fun m!285313 () Bool)

(assert (=> b!183401 m!285313))

(declare-fun m!285315 () Bool)

(assert (=> b!183401 m!285315))

(declare-fun m!285317 () Bool)

(assert (=> b!183401 m!285317))

(declare-fun m!285319 () Bool)

(assert (=> b!183401 m!285319))

(declare-fun m!285321 () Bool)

(assert (=> b!183401 m!285321))

(declare-fun m!285323 () Bool)

(assert (=> b!183401 m!285323))

(declare-fun m!285325 () Bool)

(assert (=> b!183401 m!285325))

(declare-fun m!285327 () Bool)

(assert (=> b!183401 m!285327))

(declare-fun m!285329 () Bool)

(assert (=> b!183401 m!285329))

(declare-fun m!285331 () Bool)

(assert (=> b!183401 m!285331))

(declare-fun m!285333 () Bool)

(assert (=> b!183401 m!285333))

(declare-fun m!285335 () Bool)

(assert (=> b!183401 m!285335))

(declare-fun m!285337 () Bool)

(assert (=> b!183394 m!285337))

(assert (=> b!183390 m!285303))

(assert (=> b!183390 m!285305))

(declare-fun m!285339 () Bool)

(assert (=> b!183390 m!285339))

(declare-fun m!285341 () Bool)

(assert (=> b!183405 m!285341))

(declare-fun m!285343 () Bool)

(assert (=> b!183392 m!285343))

(declare-fun m!285345 () Bool)

(assert (=> b!183406 m!285345))

(assert (=> b!183400 m!285343))

(declare-fun m!285347 () Bool)

(assert (=> start!40182 m!285347))

(declare-fun m!285349 () Bool)

(assert (=> b!183407 m!285349))

(declare-fun m!285351 () Bool)

(assert (=> b!183396 m!285351))

(declare-fun m!285353 () Bool)

(assert (=> b!183396 m!285353))

(declare-fun m!285355 () Bool)

(assert (=> b!183396 m!285355))

(declare-fun m!285357 () Bool)

(assert (=> b!183396 m!285357))

(declare-fun m!285359 () Bool)

(assert (=> b!183389 m!285359))

(assert (=> b!183389 m!285359))

(declare-fun m!285361 () Bool)

(assert (=> b!183389 m!285361))

(declare-fun m!285363 () Bool)

(assert (=> b!183403 m!285363))

(declare-fun m!285365 () Bool)

(assert (=> b!183397 m!285365))

(declare-fun m!285367 () Bool)

(assert (=> b!183391 m!285367))

(declare-fun m!285369 () Bool)

(assert (=> b!183393 m!285369))

(declare-fun m!285371 () Bool)

(assert (=> b!183398 m!285371))

(push 1)

(assert (not start!40182))

(assert (not b!183396))

(assert (not b!183391))

(assert (not b!183389))

(assert (not b!183399))

(assert (not b!183403))

(assert (not b!183397))

(assert (not b!183398))

(assert (not b!183400))

(assert (not b!183390))

(assert (not b!183406))

(assert (not b!183393))

(assert (not b!183405))

(assert (not b!183401))

(assert (not b!183394))

(assert (not b!183392))

(assert (not b!183407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


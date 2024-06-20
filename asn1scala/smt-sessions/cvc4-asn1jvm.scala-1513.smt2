; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41922 () Bool)

(assert start!41922)

(declare-fun b!197494 () Bool)

(declare-fun res!165318 () Bool)

(declare-fun e!135631 () Bool)

(assert (=> b!197494 (=> res!165318 e!135631)))

(declare-fun lt!307374 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10107 0))(
  ( (array!10108 (arr!5385 (Array (_ BitVec 32) (_ BitVec 8))) (size!4455 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8018 0))(
  ( (BitStream!8019 (buf!4941 array!10107) (currentByte!9279 (_ BitVec 32)) (currentBit!9274 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8018)

(declare-datatypes ((Unit!13975 0))(
  ( (Unit!13976) )
))
(declare-datatypes ((tuple2!17088 0))(
  ( (tuple2!17089 (_1!9189 Unit!13975) (_2!9189 BitStream!8018)) )
))
(declare-fun lt!307379 () tuple2!17088)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!307367 () (_ BitVec 64))

(assert (=> b!197494 (= res!165318 (or (not (= (size!4455 (buf!4941 (_2!9189 lt!307379))) (size!4455 (buf!4941 thiss!1204)))) (not (= lt!307367 (bvsub (bvadd lt!307374 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!165319 () Bool)

(declare-fun e!135635 () Bool)

(assert (=> start!41922 (=> (not res!165319) (not e!135635))))

(assert (=> start!41922 (= res!165319 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41922 e!135635))

(assert (=> start!41922 true))

(declare-fun e!135640 () Bool)

(declare-fun inv!12 (BitStream!8018) Bool)

(assert (=> start!41922 (and (inv!12 thiss!1204) e!135640)))

(declare-fun b!197495 () Bool)

(declare-fun e!135641 () Bool)

(declare-fun e!135632 () Bool)

(assert (=> b!197495 (= e!135641 (not e!135632))))

(declare-fun res!165310 () Bool)

(assert (=> b!197495 (=> res!165310 e!135632)))

(declare-fun lt!307365 () (_ BitVec 64))

(assert (=> b!197495 (= res!165310 (not (= lt!307365 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307374))))))

(declare-fun lt!307359 () tuple2!17088)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197495 (= lt!307365 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> b!197495 (= lt!307374 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(declare-fun e!135637 () Bool)

(assert (=> b!197495 e!135637))

(declare-fun res!165317 () Bool)

(assert (=> b!197495 (=> (not res!165317) (not e!135637))))

(assert (=> b!197495 (= res!165317 (= (size!4455 (buf!4941 thiss!1204)) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(declare-fun lt!307360 () Bool)

(declare-fun appendBit!0 (BitStream!8018 Bool) tuple2!17088)

(assert (=> b!197495 (= lt!307359 (appendBit!0 thiss!1204 lt!307360))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!307361 () (_ BitVec 64))

(assert (=> b!197495 (= lt!307360 (not (= (bvand v!189 lt!307361) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197495 (= lt!307361 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!197496 () Bool)

(declare-fun e!135634 () Bool)

(declare-datatypes ((tuple2!17090 0))(
  ( (tuple2!17091 (_1!9190 BitStream!8018) (_2!9190 Bool)) )
))
(declare-fun lt!307372 () tuple2!17090)

(declare-fun lt!307370 () (_ BitVec 64))

(assert (=> b!197496 (= e!135634 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!307372))) (currentByte!9279 (_1!9190 lt!307372)) (currentBit!9274 (_1!9190 lt!307372))) lt!307370))))

(declare-fun b!197497 () Bool)

(declare-fun res!165311 () Bool)

(assert (=> b!197497 (=> res!165311 e!135631)))

(declare-fun isPrefixOf!0 (BitStream!8018 BitStream!8018) Bool)

(assert (=> b!197497 (= res!165311 (not (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!307379))))))

(declare-fun b!197498 () Bool)

(declare-fun res!165321 () Bool)

(assert (=> b!197498 (=> (not res!165321) (not e!135641))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!197498 (= res!165321 (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 thiss!1204))))))

(declare-fun b!197499 () Bool)

(declare-fun e!135636 () Bool)

(assert (=> b!197499 (= e!135636 e!135634)))

(declare-fun res!165308 () Bool)

(assert (=> b!197499 (=> (not res!165308) (not e!135634))))

(assert (=> b!197499 (= res!165308 (and (= (_2!9190 lt!307372) lt!307360) (= (_1!9190 lt!307372) (_2!9189 lt!307359))))))

(declare-fun readBitPure!0 (BitStream!8018) tuple2!17090)

(declare-fun readerFrom!0 (BitStream!8018 (_ BitVec 32) (_ BitVec 32)) BitStream!8018)

(assert (=> b!197499 (= lt!307372 (readBitPure!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))))

(declare-fun b!197500 () Bool)

(assert (=> b!197500 (= e!135637 e!135636)))

(declare-fun res!165314 () Bool)

(assert (=> b!197500 (=> (not res!165314) (not e!135636))))

(declare-fun lt!307368 () (_ BitVec 64))

(assert (=> b!197500 (= res!165314 (= lt!307370 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307368)))))

(assert (=> b!197500 (= lt!307370 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> b!197500 (= lt!307368 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(declare-fun b!197501 () Bool)

(declare-fun res!165309 () Bool)

(assert (=> b!197501 (=> res!165309 e!135631)))

(assert (=> b!197501 (= res!165309 (not (isPrefixOf!0 thiss!1204 (_2!9189 lt!307359))))))

(declare-fun b!197502 () Bool)

(declare-fun array_inv!4196 (array!10107) Bool)

(assert (=> b!197502 (= e!135640 (array_inv!4196 (buf!4941 thiss!1204)))))

(declare-fun b!197503 () Bool)

(declare-fun e!135633 () Bool)

(assert (=> b!197503 (= e!135633 (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(declare-fun lt!307362 () (_ BitVec 64))

(declare-fun b!197504 () Bool)

(declare-datatypes ((tuple2!17092 0))(
  ( (tuple2!17093 (_1!9191 BitStream!8018) (_2!9191 BitStream!8018)) )
))
(declare-fun lt!307375 () tuple2!17092)

(declare-fun lt!307371 () tuple2!17090)

(declare-datatypes ((tuple2!17094 0))(
  ( (tuple2!17095 (_1!9192 BitStream!8018) (_2!9192 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17094)

(assert (=> b!197504 (= e!135631 (= (_1!9192 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!307375) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307362 (ite (_2!9190 lt!307371) lt!307361 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9191 lt!307375)))))

(declare-fun lt!307366 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197504 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!307366)))

(declare-fun lt!307363 () Unit!13975)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8018 array!10107 (_ BitVec 64)) Unit!13975)

(assert (=> b!197504 (= lt!307363 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!307379)) lt!307366))))

(assert (=> b!197504 (= lt!307366 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!307381 () tuple2!17094)

(declare-fun lt!307378 () tuple2!17092)

(assert (=> b!197504 (= lt!307381 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!307378) nBits!348 i!590 lt!307362))))

(declare-fun lt!307364 () (_ BitVec 64))

(assert (=> b!197504 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204)) lt!307364)))

(declare-fun lt!307369 () Unit!13975)

(assert (=> b!197504 (= lt!307369 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4941 (_2!9189 lt!307379)) lt!307364))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197504 (= lt!307362 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!197504 (= (_2!9190 lt!307371) lt!307360)))

(assert (=> b!197504 (= lt!307371 (readBitPure!0 (_1!9191 lt!307378)))))

(declare-fun reader!0 (BitStream!8018 BitStream!8018) tuple2!17092)

(assert (=> b!197504 (= lt!307375 (reader!0 (_2!9189 lt!307359) (_2!9189 lt!307379)))))

(assert (=> b!197504 (= lt!307378 (reader!0 thiss!1204 (_2!9189 lt!307379)))))

(declare-fun e!135639 () Bool)

(assert (=> b!197504 e!135639))

(declare-fun res!165320 () Bool)

(assert (=> b!197504 (=> (not res!165320) (not e!135639))))

(declare-fun lt!307358 () tuple2!17090)

(declare-fun lt!307373 () tuple2!17090)

(assert (=> b!197504 (= res!165320 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!307358))) (currentByte!9279 (_1!9190 lt!307358)) (currentBit!9274 (_1!9190 lt!307358))) (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!307373))) (currentByte!9279 (_1!9190 lt!307373)) (currentBit!9274 (_1!9190 lt!307373)))))))

(declare-fun lt!307380 () Unit!13975)

(declare-fun lt!307376 () BitStream!8018)

(declare-fun readBitPrefixLemma!0 (BitStream!8018 BitStream!8018) Unit!13975)

(assert (=> b!197504 (= lt!307380 (readBitPrefixLemma!0 lt!307376 (_2!9189 lt!307379)))))

(assert (=> b!197504 (= lt!307373 (readBitPure!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (=> b!197504 (= lt!307358 (readBitPure!0 lt!307376))))

(assert (=> b!197504 e!135633))

(declare-fun res!165313 () Bool)

(assert (=> b!197504 (=> (not res!165313) (not e!135633))))

(assert (=> b!197504 (= res!165313 (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(assert (=> b!197504 (= lt!307376 (BitStream!8019 (buf!4941 (_2!9189 lt!307359)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(declare-fun b!197505 () Bool)

(assert (=> b!197505 (= e!135632 e!135631)))

(declare-fun res!165315 () Bool)

(assert (=> b!197505 (=> res!165315 e!135631)))

(assert (=> b!197505 (= res!165315 (not (= lt!307367 (bvsub (bvsub (bvadd lt!307365 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!197505 (= lt!307367 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379))))))

(assert (=> b!197505 (isPrefixOf!0 thiss!1204 (_2!9189 lt!307379))))

(declare-fun lt!307377 () Unit!13975)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8018 BitStream!8018 BitStream!8018) Unit!13975)

(assert (=> b!197505 (= lt!307377 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9189 lt!307359) (_2!9189 lt!307379)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8018 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17088)

(assert (=> b!197505 (= lt!307379 (appendBitsLSBFirstLoopTR!0 (_2!9189 lt!307359) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!197506 () Bool)

(assert (=> b!197506 (= e!135639 (= (_2!9190 lt!307358) (_2!9190 lt!307373)))))

(declare-fun b!197507 () Bool)

(assert (=> b!197507 (= e!135635 e!135641)))

(declare-fun res!165312 () Bool)

(assert (=> b!197507 (=> (not res!165312) (not e!135641))))

(assert (=> b!197507 (= res!165312 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204)) lt!307364))))

(assert (=> b!197507 (= lt!307364 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!197508 () Bool)

(declare-fun res!165307 () Bool)

(assert (=> b!197508 (=> (not res!165307) (not e!135641))))

(assert (=> b!197508 (= res!165307 (not (= i!590 nBits!348)))))

(declare-fun b!197509 () Bool)

(declare-fun res!165316 () Bool)

(assert (=> b!197509 (=> (not res!165316) (not e!135636))))

(assert (=> b!197509 (= res!165316 (isPrefixOf!0 thiss!1204 (_2!9189 lt!307359)))))

(declare-fun b!197510 () Bool)

(declare-fun res!165306 () Bool)

(assert (=> b!197510 (=> res!165306 e!135631)))

(assert (=> b!197510 (= res!165306 (not (invariant!0 (currentBit!9274 (_2!9189 lt!307379)) (currentByte!9279 (_2!9189 lt!307379)) (size!4455 (buf!4941 (_2!9189 lt!307379))))))))

(assert (= (and start!41922 res!165319) b!197507))

(assert (= (and b!197507 res!165312) b!197498))

(assert (= (and b!197498 res!165321) b!197508))

(assert (= (and b!197508 res!165307) b!197495))

(assert (= (and b!197495 res!165317) b!197500))

(assert (= (and b!197500 res!165314) b!197509))

(assert (= (and b!197509 res!165316) b!197499))

(assert (= (and b!197499 res!165308) b!197496))

(assert (= (and b!197495 (not res!165310)) b!197505))

(assert (= (and b!197505 (not res!165315)) b!197510))

(assert (= (and b!197510 (not res!165306)) b!197494))

(assert (= (and b!197494 (not res!165318)) b!197497))

(assert (= (and b!197497 (not res!165311)) b!197501))

(assert (= (and b!197501 (not res!165309)) b!197504))

(assert (= (and b!197504 res!165313) b!197503))

(assert (= (and b!197504 res!165320) b!197506))

(assert (= start!41922 b!197502))

(declare-fun m!305115 () Bool)

(assert (=> b!197495 m!305115))

(declare-fun m!305117 () Bool)

(assert (=> b!197495 m!305117))

(declare-fun m!305119 () Bool)

(assert (=> b!197495 m!305119))

(declare-fun m!305121 () Bool)

(assert (=> b!197505 m!305121))

(declare-fun m!305123 () Bool)

(assert (=> b!197505 m!305123))

(declare-fun m!305125 () Bool)

(assert (=> b!197505 m!305125))

(declare-fun m!305127 () Bool)

(assert (=> b!197505 m!305127))

(declare-fun m!305129 () Bool)

(assert (=> b!197502 m!305129))

(declare-fun m!305131 () Bool)

(assert (=> b!197503 m!305131))

(declare-fun m!305133 () Bool)

(assert (=> b!197509 m!305133))

(declare-fun m!305135 () Bool)

(assert (=> b!197510 m!305135))

(declare-fun m!305137 () Bool)

(assert (=> start!41922 m!305137))

(assert (=> b!197501 m!305133))

(declare-fun m!305139 () Bool)

(assert (=> b!197504 m!305139))

(declare-fun m!305141 () Bool)

(assert (=> b!197504 m!305141))

(declare-fun m!305143 () Bool)

(assert (=> b!197504 m!305143))

(declare-fun m!305145 () Bool)

(assert (=> b!197504 m!305145))

(declare-fun m!305147 () Bool)

(assert (=> b!197504 m!305147))

(declare-fun m!305149 () Bool)

(assert (=> b!197504 m!305149))

(declare-fun m!305151 () Bool)

(assert (=> b!197504 m!305151))

(declare-fun m!305153 () Bool)

(assert (=> b!197504 m!305153))

(declare-fun m!305155 () Bool)

(assert (=> b!197504 m!305155))

(declare-fun m!305157 () Bool)

(assert (=> b!197504 m!305157))

(declare-fun m!305159 () Bool)

(assert (=> b!197504 m!305159))

(declare-fun m!305161 () Bool)

(assert (=> b!197504 m!305161))

(declare-fun m!305163 () Bool)

(assert (=> b!197504 m!305163))

(declare-fun m!305165 () Bool)

(assert (=> b!197504 m!305165))

(declare-fun m!305167 () Bool)

(assert (=> b!197504 m!305167))

(declare-fun m!305169 () Bool)

(assert (=> b!197504 m!305169))

(assert (=> b!197500 m!305115))

(assert (=> b!197500 m!305117))

(declare-fun m!305171 () Bool)

(assert (=> b!197496 m!305171))

(declare-fun m!305173 () Bool)

(assert (=> b!197499 m!305173))

(assert (=> b!197499 m!305173))

(declare-fun m!305175 () Bool)

(assert (=> b!197499 m!305175))

(declare-fun m!305177 () Bool)

(assert (=> b!197497 m!305177))

(declare-fun m!305179 () Bool)

(assert (=> b!197498 m!305179))

(declare-fun m!305181 () Bool)

(assert (=> b!197507 m!305181))

(push 1)

(assert (not b!197503))

(assert (not b!197505))

(assert (not b!197509))

(assert (not start!41922))

(assert (not b!197500))

(assert (not b!197504))

(assert (not b!197502))

(assert (not b!197510))

(assert (not b!197497))

(assert (not b!197501))

(assert (not b!197498))

(assert (not b!197495))

(assert (not b!197507))

(assert (not b!197499))

(assert (not b!197496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66665 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66665 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204)) lt!307364) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204))) lt!307364))))

(declare-fun bs!16549 () Bool)

(assert (= bs!16549 d!66665))

(declare-fun m!305195 () Bool)

(assert (=> bs!16549 m!305195))

(assert (=> b!197507 d!66665))

(declare-fun d!66667 () Bool)

(declare-fun e!135668 () Bool)

(assert (=> d!66667 e!135668))

(declare-fun res!165367 () Bool)

(assert (=> d!66667 (=> (not res!165367) (not e!135668))))

(declare-fun lt!307443 () (_ BitVec 64))

(declare-fun lt!307441 () (_ BitVec 64))

(declare-fun lt!307442 () (_ BitVec 64))

(assert (=> d!66667 (= res!165367 (= lt!307441 (bvsub lt!307442 lt!307443)))))

(assert (=> d!66667 (or (= (bvand lt!307442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307442 lt!307443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66667 (= lt!307443 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307372)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307372))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307372)))))))

(declare-fun lt!307444 () (_ BitVec 64))

(declare-fun lt!307440 () (_ BitVec 64))

(assert (=> d!66667 (= lt!307442 (bvmul lt!307444 lt!307440))))

(assert (=> d!66667 (or (= lt!307444 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307440 (bvsdiv (bvmul lt!307444 lt!307440) lt!307444)))))

(assert (=> d!66667 (= lt!307440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66667 (= lt!307444 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307372)))))))

(assert (=> d!66667 (= lt!307441 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307372))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307372)))))))

(assert (=> d!66667 (invariant!0 (currentBit!9274 (_1!9190 lt!307372)) (currentByte!9279 (_1!9190 lt!307372)) (size!4455 (buf!4941 (_1!9190 lt!307372))))))

(assert (=> d!66667 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!307372))) (currentByte!9279 (_1!9190 lt!307372)) (currentBit!9274 (_1!9190 lt!307372))) lt!307441)))

(declare-fun b!197556 () Bool)

(declare-fun res!165368 () Bool)

(assert (=> b!197556 (=> (not res!165368) (not e!135668))))

(assert (=> b!197556 (= res!165368 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307441))))

(declare-fun b!197557 () Bool)

(declare-fun lt!307439 () (_ BitVec 64))

(assert (=> b!197557 (= e!135668 (bvsle lt!307441 (bvmul lt!307439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197557 (or (= lt!307439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307439)))))

(assert (=> b!197557 (= lt!307439 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307372)))))))

(assert (= (and d!66667 res!165367) b!197556))

(assert (= (and b!197556 res!165368) b!197557))

(declare-fun m!305215 () Bool)

(assert (=> d!66667 m!305215))

(declare-fun m!305217 () Bool)

(assert (=> d!66667 m!305217))

(assert (=> b!197496 d!66667))

(declare-fun d!66677 () Bool)

(declare-fun e!135669 () Bool)

(assert (=> d!66677 e!135669))

(declare-fun res!165369 () Bool)

(assert (=> d!66677 (=> (not res!165369) (not e!135669))))

(declare-fun lt!307451 () (_ BitVec 64))

(declare-fun lt!307450 () (_ BitVec 64))

(declare-fun lt!307449 () (_ BitVec 64))

(assert (=> d!66677 (= res!165369 (= lt!307449 (bvsub lt!307450 lt!307451)))))

(assert (=> d!66677 (or (= (bvand lt!307450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307450 lt!307451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66677 (= lt!307451 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))))))

(declare-fun lt!307452 () (_ BitVec 64))

(declare-fun lt!307448 () (_ BitVec 64))

(assert (=> d!66677 (= lt!307450 (bvmul lt!307452 lt!307448))))

(assert (=> d!66677 (or (= lt!307452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307448 (bvsdiv (bvmul lt!307452 lt!307448) lt!307452)))))

(assert (=> d!66677 (= lt!307448 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66677 (= lt!307452 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(assert (=> d!66677 (= lt!307449 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (=> d!66677 (invariant!0 (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!307359))))))

(assert (=> d!66677 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) lt!307449)))

(declare-fun b!197558 () Bool)

(declare-fun res!165370 () Bool)

(assert (=> b!197558 (=> (not res!165370) (not e!135669))))

(assert (=> b!197558 (= res!165370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307449))))

(declare-fun b!197559 () Bool)

(declare-fun lt!307447 () (_ BitVec 64))

(assert (=> b!197559 (= e!135669 (bvsle lt!307449 (bvmul lt!307447 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197559 (or (= lt!307447 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307447 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307447)))))

(assert (=> b!197559 (= lt!307447 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(assert (= (and d!66677 res!165369) b!197558))

(assert (= (and b!197558 res!165370) b!197559))

(declare-fun m!305221 () Bool)

(assert (=> d!66677 m!305221))

(declare-fun m!305223 () Bool)

(assert (=> d!66677 m!305223))

(assert (=> b!197495 d!66677))

(declare-fun d!66681 () Bool)

(declare-fun e!135670 () Bool)

(assert (=> d!66681 e!135670))

(declare-fun res!165371 () Bool)

(assert (=> d!66681 (=> (not res!165371) (not e!135670))))

(declare-fun lt!307456 () (_ BitVec 64))

(declare-fun lt!307457 () (_ BitVec 64))

(declare-fun lt!307458 () (_ BitVec 64))

(assert (=> d!66681 (= res!165371 (= lt!307456 (bvsub lt!307457 lt!307458)))))

(assert (=> d!66681 (or (= (bvand lt!307457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307457 lt!307458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66681 (= lt!307458 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204))))))

(declare-fun lt!307459 () (_ BitVec 64))

(declare-fun lt!307455 () (_ BitVec 64))

(assert (=> d!66681 (= lt!307457 (bvmul lt!307459 lt!307455))))

(assert (=> d!66681 (or (= lt!307459 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307455 (bvsdiv (bvmul lt!307459 lt!307455) lt!307459)))))

(assert (=> d!66681 (= lt!307455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66681 (= lt!307459 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))))))

(assert (=> d!66681 (= lt!307456 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 thiss!1204))))))

(assert (=> d!66681 (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 thiss!1204)))))

(assert (=> d!66681 (= (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)) lt!307456)))

(declare-fun b!197560 () Bool)

(declare-fun res!165372 () Bool)

(assert (=> b!197560 (=> (not res!165372) (not e!135670))))

(assert (=> b!197560 (= res!165372 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307456))))

(declare-fun b!197561 () Bool)

(declare-fun lt!307454 () (_ BitVec 64))

(assert (=> b!197561 (= e!135670 (bvsle lt!307456 (bvmul lt!307454 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197561 (or (= lt!307454 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307454 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307454)))))

(assert (=> b!197561 (= lt!307454 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))))))

(assert (= (and d!66681 res!165371) b!197560))

(assert (= (and b!197560 res!165372) b!197561))

(assert (=> d!66681 m!305195))

(assert (=> d!66681 m!305179))

(assert (=> b!197495 d!66681))

(declare-fun b!197572 () Bool)

(declare-fun res!165382 () Bool)

(declare-fun e!135675 () Bool)

(assert (=> b!197572 (=> (not res!165382) (not e!135675))))

(declare-fun lt!307471 () tuple2!17088)

(assert (=> b!197572 (= res!165382 (isPrefixOf!0 thiss!1204 (_2!9189 lt!307471)))))

(declare-fun b!197571 () Bool)

(declare-fun res!165383 () Bool)

(assert (=> b!197571 (=> (not res!165383) (not e!135675))))

(declare-fun lt!307470 () (_ BitVec 64))

(declare-fun lt!307469 () (_ BitVec 64))

(assert (=> b!197571 (= res!165383 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307471))) (currentByte!9279 (_2!9189 lt!307471)) (currentBit!9274 (_2!9189 lt!307471))) (bvadd lt!307470 lt!307469)))))

(assert (=> b!197571 (or (not (= (bvand lt!307470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307469 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!307470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!307470 lt!307469) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197571 (= lt!307469 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197571 (= lt!307470 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(declare-fun b!197573 () Bool)

(declare-fun e!135676 () Bool)

(assert (=> b!197573 (= e!135675 e!135676)))

(declare-fun res!165381 () Bool)

(assert (=> b!197573 (=> (not res!165381) (not e!135676))))

(declare-fun lt!307468 () tuple2!17090)

(assert (=> b!197573 (= res!165381 (and (= (_2!9190 lt!307468) lt!307360) (= (_1!9190 lt!307468) (_2!9189 lt!307471))))))

(assert (=> b!197573 (= lt!307468 (readBitPure!0 (readerFrom!0 (_2!9189 lt!307471) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))))

(declare-fun b!197574 () Bool)

(assert (=> b!197574 (= e!135676 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!307468))) (currentByte!9279 (_1!9190 lt!307468)) (currentBit!9274 (_1!9190 lt!307468))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307471))) (currentByte!9279 (_2!9189 lt!307471)) (currentBit!9274 (_2!9189 lt!307471)))))))

(declare-fun d!66683 () Bool)

(assert (=> d!66683 e!135675))

(declare-fun res!165384 () Bool)

(assert (=> d!66683 (=> (not res!165384) (not e!135675))))

(assert (=> d!66683 (= res!165384 (= (size!4455 (buf!4941 thiss!1204)) (size!4455 (buf!4941 (_2!9189 lt!307471)))))))

(declare-fun choose!16 (BitStream!8018 Bool) tuple2!17088)

(assert (=> d!66683 (= lt!307471 (choose!16 thiss!1204 lt!307360))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66683 (validate_offset_bit!0 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204)))))

(assert (=> d!66683 (= (appendBit!0 thiss!1204 lt!307360) lt!307471)))

(assert (= (and d!66683 res!165384) b!197571))

(assert (= (and b!197571 res!165383) b!197572))

(assert (= (and b!197572 res!165382) b!197573))

(assert (= (and b!197573 res!165381) b!197574))

(declare-fun m!305225 () Bool)

(assert (=> b!197571 m!305225))

(assert (=> b!197571 m!305117))

(declare-fun m!305227 () Bool)

(assert (=> b!197572 m!305227))

(declare-fun m!305229 () Bool)

(assert (=> b!197573 m!305229))

(assert (=> b!197573 m!305229))

(declare-fun m!305231 () Bool)

(assert (=> b!197573 m!305231))

(declare-fun m!305233 () Bool)

(assert (=> b!197574 m!305233))

(assert (=> b!197574 m!305225))

(declare-fun m!305235 () Bool)

(assert (=> d!66683 m!305235))

(declare-fun m!305237 () Bool)

(assert (=> d!66683 m!305237))

(assert (=> b!197495 d!66683))

(declare-fun d!66685 () Bool)

(declare-fun e!135677 () Bool)

(assert (=> d!66685 e!135677))

(declare-fun res!165385 () Bool)

(assert (=> d!66685 (=> (not res!165385) (not e!135677))))

(declare-fun lt!307474 () (_ BitVec 64))

(declare-fun lt!307476 () (_ BitVec 64))

(declare-fun lt!307475 () (_ BitVec 64))

(assert (=> d!66685 (= res!165385 (= lt!307474 (bvsub lt!307475 lt!307476)))))

(assert (=> d!66685 (or (= (bvand lt!307475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307475 lt!307476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66685 (= lt!307476 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307379))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307379)))))))

(declare-fun lt!307477 () (_ BitVec 64))

(declare-fun lt!307473 () (_ BitVec 64))

(assert (=> d!66685 (= lt!307475 (bvmul lt!307477 lt!307473))))

(assert (=> d!66685 (or (= lt!307477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307473 (bvsdiv (bvmul lt!307477 lt!307473) lt!307477)))))

(assert (=> d!66685 (= lt!307473 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66685 (= lt!307477 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (=> d!66685 (= lt!307474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307379))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307379)))))))

(assert (=> d!66685 (invariant!0 (currentBit!9274 (_2!9189 lt!307379)) (currentByte!9279 (_2!9189 lt!307379)) (size!4455 (buf!4941 (_2!9189 lt!307379))))))

(assert (=> d!66685 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379))) lt!307474)))

(declare-fun b!197575 () Bool)

(declare-fun res!165386 () Bool)

(assert (=> b!197575 (=> (not res!165386) (not e!135677))))

(assert (=> b!197575 (= res!165386 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307474))))

(declare-fun b!197576 () Bool)

(declare-fun lt!307472 () (_ BitVec 64))

(assert (=> b!197576 (= e!135677 (bvsle lt!307474 (bvmul lt!307472 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197576 (or (= lt!307472 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307472 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307472)))))

(assert (=> b!197576 (= lt!307472 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (= (and d!66685 res!165385) b!197575))

(assert (= (and b!197575 res!165386) b!197576))

(declare-fun m!305239 () Bool)

(assert (=> d!66685 m!305239))

(assert (=> d!66685 m!305135))

(assert (=> b!197505 d!66685))

(declare-fun d!66687 () Bool)

(declare-fun res!165393 () Bool)

(declare-fun e!135683 () Bool)

(assert (=> d!66687 (=> (not res!165393) (not e!135683))))

(assert (=> d!66687 (= res!165393 (= (size!4455 (buf!4941 thiss!1204)) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (=> d!66687 (= (isPrefixOf!0 thiss!1204 (_2!9189 lt!307379)) e!135683)))

(declare-fun b!197583 () Bool)

(declare-fun res!165394 () Bool)

(assert (=> b!197583 (=> (not res!165394) (not e!135683))))

(assert (=> b!197583 (= res!165394 (bvsle (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379)))))))

(declare-fun b!197584 () Bool)

(declare-fun e!135682 () Bool)

(assert (=> b!197584 (= e!135683 e!135682)))

(declare-fun res!165395 () Bool)

(assert (=> b!197584 (=> res!165395 e!135682)))

(assert (=> b!197584 (= res!165395 (= (size!4455 (buf!4941 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197585 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10107 array!10107 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197585 (= e!135682 (arrayBitRangesEq!0 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (= (and d!66687 res!165393) b!197583))

(assert (= (and b!197583 res!165394) b!197584))

(assert (= (and b!197584 (not res!165395)) b!197585))

(assert (=> b!197583 m!305117))

(assert (=> b!197583 m!305121))

(assert (=> b!197585 m!305117))

(assert (=> b!197585 m!305117))

(declare-fun m!305241 () Bool)

(assert (=> b!197585 m!305241))

(assert (=> b!197505 d!66687))

(declare-fun d!66689 () Bool)

(assert (=> d!66689 (isPrefixOf!0 thiss!1204 (_2!9189 lt!307379))))

(declare-fun lt!307480 () Unit!13975)

(declare-fun choose!30 (BitStream!8018 BitStream!8018 BitStream!8018) Unit!13975)

(assert (=> d!66689 (= lt!307480 (choose!30 thiss!1204 (_2!9189 lt!307359) (_2!9189 lt!307379)))))

(assert (=> d!66689 (isPrefixOf!0 thiss!1204 (_2!9189 lt!307359))))

(assert (=> d!66689 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9189 lt!307359) (_2!9189 lt!307379)) lt!307480)))

(declare-fun bs!16551 () Bool)

(assert (= bs!16551 d!66689))

(assert (=> bs!16551 m!305123))

(declare-fun m!305243 () Bool)

(assert (=> bs!16551 m!305243))

(assert (=> bs!16551 m!305133))

(assert (=> b!197505 d!66689))

(declare-fun b!197759 () Bool)

(declare-fun res!165532 () Bool)

(declare-fun e!135782 () Bool)

(assert (=> b!197759 (=> (not res!165532) (not e!135782))))

(declare-fun lt!308062 () (_ BitVec 64))

(declare-fun lt!308080 () (_ BitVec 64))

(declare-fun lt!308084 () tuple2!17088)

(assert (=> b!197759 (= res!165532 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308084))) (currentByte!9279 (_2!9189 lt!308084)) (currentBit!9274 (_2!9189 lt!308084))) (bvsub lt!308080 lt!308062)))))

(assert (=> b!197759 (or (= (bvand lt!308080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308062 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308080 lt!308062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197759 (= lt!308062 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!308069 () (_ BitVec 64))

(declare-fun lt!308099 () (_ BitVec 64))

(assert (=> b!197759 (= lt!308080 (bvadd lt!308069 lt!308099))))

(assert (=> b!197759 (or (not (= (bvand lt!308069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308099 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308069 lt!308099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197759 (= lt!308099 ((_ sign_extend 32) nBits!348))))

(assert (=> b!197759 (= lt!308069 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(declare-fun b!197760 () Bool)

(declare-fun res!165543 () Bool)

(declare-fun lt!308091 () tuple2!17088)

(assert (=> b!197760 (= res!165543 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308091))) (currentByte!9279 (_2!9189 lt!308091)) (currentBit!9274 (_2!9189 lt!308091))) (bvadd (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!135779 () Bool)

(assert (=> b!197760 (=> (not res!165543) (not e!135779))))

(declare-fun b!197761 () Bool)

(declare-fun e!135783 () tuple2!17088)

(declare-fun Unit!13990 () Unit!13975)

(assert (=> b!197761 (= e!135783 (tuple2!17089 Unit!13990 (_2!9189 lt!307359)))))

(declare-fun lt!308101 () Unit!13975)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8018) Unit!13975)

(assert (=> b!197761 (= lt!308101 (lemmaIsPrefixRefl!0 (_2!9189 lt!307359)))))

(declare-fun call!3107 () Bool)

(assert (=> b!197761 call!3107))

(declare-fun lt!308070 () Unit!13975)

(assert (=> b!197761 (= lt!308070 lt!308101)))

(declare-fun b!197762 () Bool)

(declare-fun e!135777 () Bool)

(declare-fun lt!308073 () tuple2!17094)

(declare-fun lt!308058 () tuple2!17092)

(assert (=> b!197762 (= e!135777 (= (_1!9192 lt!308073) (_2!9191 lt!308058)))))

(declare-fun b!197763 () Bool)

(declare-fun lt!308097 () tuple2!17090)

(assert (=> b!197763 (= lt!308097 (readBitPure!0 (readerFrom!0 (_2!9189 lt!308091) (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)))))))

(declare-fun res!165536 () Bool)

(declare-fun lt!308100 () Bool)

(assert (=> b!197763 (= res!165536 (and (= (_2!9190 lt!308097) lt!308100) (= (_1!9190 lt!308097) (_2!9189 lt!308091))))))

(declare-fun e!135784 () Bool)

(assert (=> b!197763 (=> (not res!165536) (not e!135784))))

(assert (=> b!197763 (= e!135779 e!135784)))

(declare-fun b!197764 () Bool)

(declare-fun e!135780 () (_ BitVec 64))

(assert (=> b!197764 (= e!135780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun c!9831 () Bool)

(declare-fun bm!3104 () Bool)

(assert (=> bm!3104 (= call!3107 (isPrefixOf!0 (_2!9189 lt!307359) (ite c!9831 (_2!9189 lt!307359) (_2!9189 lt!308091))))))

(declare-fun b!197766 () Bool)

(declare-fun res!165537 () Bool)

(assert (=> b!197766 (=> (not res!165537) (not e!135782))))

(assert (=> b!197766 (= res!165537 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!308084)))))))

(declare-fun b!197767 () Bool)

(declare-fun res!165541 () Bool)

(assert (=> b!197767 (=> (not res!165541) (not e!135782))))

(assert (=> b!197767 (= res!165541 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308084)))))

(declare-fun b!197768 () Bool)

(declare-fun e!135778 () Bool)

(declare-fun lt!308065 () (_ BitVec 64))

(assert (=> b!197768 (= e!135778 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308065))))

(declare-fun b!197765 () Bool)

(declare-fun e!135776 () Bool)

(assert (=> b!197765 (= e!135782 e!135776)))

(declare-fun res!165539 () Bool)

(assert (=> b!197765 (=> (not res!165539) (not e!135776))))

(declare-fun lt!308052 () tuple2!17094)

(assert (=> b!197765 (= res!165539 (= (_2!9192 lt!308052) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!308103 () tuple2!17092)

(assert (=> b!197765 (= lt!308052 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308103) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!308094 () Unit!13975)

(declare-fun lt!308066 () Unit!13975)

(assert (=> b!197765 (= lt!308094 lt!308066)))

(assert (=> b!197765 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308084)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308065)))

(assert (=> b!197765 (= lt!308066 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308084)) lt!308065))))

(assert (=> b!197765 e!135778))

(declare-fun res!165533 () Bool)

(assert (=> b!197765 (=> (not res!165533) (not e!135778))))

(assert (=> b!197765 (= res!165533 (and (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!308084)))) (bvsge lt!308065 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197765 (= lt!308065 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!197765 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!197765 (= lt!308103 (reader!0 (_2!9189 lt!307359) (_2!9189 lt!308084)))))

(declare-fun d!66691 () Bool)

(assert (=> d!66691 e!135782))

(declare-fun res!165534 () Bool)

(assert (=> d!66691 (=> (not res!165534) (not e!135782))))

(assert (=> d!66691 (= res!165534 (invariant!0 (currentBit!9274 (_2!9189 lt!308084)) (currentByte!9279 (_2!9189 lt!308084)) (size!4455 (buf!4941 (_2!9189 lt!308084)))))))

(assert (=> d!66691 (= lt!308084 e!135783)))

(assert (=> d!66691 (= c!9831 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66691 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66691 (= (appendBitsLSBFirstLoopTR!0 (_2!9189 lt!307359) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!308084)))

(declare-fun b!197769 () Bool)

(assert (=> b!197769 (= e!135776 (= (_1!9192 lt!308052) (_2!9191 lt!308103)))))

(declare-fun b!197770 () Bool)

(declare-fun lt!308063 () tuple2!17088)

(assert (=> b!197770 (= e!135783 (tuple2!17089 (_1!9189 lt!308063) (_2!9189 lt!308063)))))

(assert (=> b!197770 (= lt!308100 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197770 (= lt!308091 (appendBit!0 (_2!9189 lt!307359) lt!308100))))

(declare-fun res!165535 () Bool)

(assert (=> b!197770 (= res!165535 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!308091)))))))

(assert (=> b!197770 (=> (not res!165535) (not e!135779))))

(assert (=> b!197770 e!135779))

(declare-fun lt!308093 () tuple2!17088)

(assert (=> b!197770 (= lt!308093 lt!308091)))

(assert (=> b!197770 (= lt!308063 (appendBitsLSBFirstLoopTR!0 (_2!9189 lt!308093) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!308086 () Unit!13975)

(assert (=> b!197770 (= lt!308086 (lemmaIsPrefixTransitive!0 (_2!9189 lt!307359) (_2!9189 lt!308093) (_2!9189 lt!308063)))))

(assert (=> b!197770 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308063))))

(declare-fun lt!308083 () Unit!13975)

(assert (=> b!197770 (= lt!308083 lt!308086)))

(assert (=> b!197770 (invariant!0 (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!308093))))))

(declare-fun lt!308076 () BitStream!8018)

(assert (=> b!197770 (= lt!308076 (BitStream!8019 (buf!4941 (_2!9189 lt!308093)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> b!197770 (invariant!0 (currentBit!9274 lt!308076) (currentByte!9279 lt!308076) (size!4455 (buf!4941 (_2!9189 lt!308063))))))

(declare-fun lt!308095 () BitStream!8018)

(assert (=> b!197770 (= lt!308095 (BitStream!8019 (buf!4941 (_2!9189 lt!308063)) (currentByte!9279 lt!308076) (currentBit!9274 lt!308076)))))

(declare-fun lt!308081 () tuple2!17090)

(assert (=> b!197770 (= lt!308081 (readBitPure!0 lt!308076))))

(declare-fun lt!308061 () tuple2!17090)

(assert (=> b!197770 (= lt!308061 (readBitPure!0 lt!308095))))

(declare-fun lt!308055 () Unit!13975)

(assert (=> b!197770 (= lt!308055 (readBitPrefixLemma!0 lt!308076 (_2!9189 lt!308063)))))

(declare-fun res!165540 () Bool)

(assert (=> b!197770 (= res!165540 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308081))) (currentByte!9279 (_1!9190 lt!308081)) (currentBit!9274 (_1!9190 lt!308081))) (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308061))) (currentByte!9279 (_1!9190 lt!308061)) (currentBit!9274 (_1!9190 lt!308061)))))))

(declare-fun e!135781 () Bool)

(assert (=> b!197770 (=> (not res!165540) (not e!135781))))

(assert (=> b!197770 e!135781))

(declare-fun lt!308096 () Unit!13975)

(assert (=> b!197770 (= lt!308096 lt!308055)))

(declare-fun lt!308075 () tuple2!17092)

(assert (=> b!197770 (= lt!308075 (reader!0 (_2!9189 lt!307359) (_2!9189 lt!308063)))))

(declare-fun lt!308088 () tuple2!17092)

(assert (=> b!197770 (= lt!308088 (reader!0 (_2!9189 lt!308093) (_2!9189 lt!308063)))))

(declare-fun lt!308090 () tuple2!17090)

(assert (=> b!197770 (= lt!308090 (readBitPure!0 (_1!9191 lt!308075)))))

(assert (=> b!197770 (= (_2!9190 lt!308090) lt!308100)))

(declare-fun lt!308071 () Unit!13975)

(declare-fun Unit!13992 () Unit!13975)

(assert (=> b!197770 (= lt!308071 Unit!13992)))

(declare-fun lt!308060 () (_ BitVec 64))

(assert (=> b!197770 (= lt!308060 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308056 () (_ BitVec 64))

(assert (=> b!197770 (= lt!308056 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308105 () Unit!13975)

(assert (=> b!197770 (= lt!308105 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308063)) lt!308056))))

(assert (=> b!197770 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308056)))

(declare-fun lt!308104 () Unit!13975)

(assert (=> b!197770 (= lt!308104 lt!308105)))

(declare-fun lt!308102 () tuple2!17094)

(assert (=> b!197770 (= lt!308102 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308075) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308060))))

(declare-fun lt!308074 () (_ BitVec 64))

(assert (=> b!197770 (= lt!308074 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!308078 () Unit!13975)

(assert (=> b!197770 (= lt!308078 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!308093) (buf!4941 (_2!9189 lt!308063)) lt!308074))))

(assert (=> b!197770 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093))) lt!308074)))

(declare-fun lt!308082 () Unit!13975)

(assert (=> b!197770 (= lt!308082 lt!308078)))

(declare-fun lt!308067 () tuple2!17094)

(assert (=> b!197770 (= lt!308067 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308088) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308060 (ite (_2!9190 lt!308090) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!308051 () tuple2!17094)

(assert (=> b!197770 (= lt!308051 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308075) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308060))))

(declare-fun c!9830 () Bool)

(assert (=> b!197770 (= c!9830 (_2!9190 (readBitPure!0 (_1!9191 lt!308075))))))

(declare-fun lt!308085 () tuple2!17094)

(declare-fun withMovedBitIndex!0 (BitStream!8018 (_ BitVec 64)) BitStream!8018)

(assert (=> b!197770 (= lt!308085 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9191 lt!308075) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308060 e!135780)))))

(declare-fun lt!308072 () Unit!13975)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13975)

(assert (=> b!197770 (= lt!308072 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9191 lt!308075) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308060))))

(assert (=> b!197770 (and (= (_2!9192 lt!308051) (_2!9192 lt!308085)) (= (_1!9192 lt!308051) (_1!9192 lt!308085)))))

(declare-fun lt!308054 () Unit!13975)

(assert (=> b!197770 (= lt!308054 lt!308072)))

(assert (=> b!197770 (= (_1!9191 lt!308075) (withMovedBitIndex!0 (_2!9191 lt!308075) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))))))

(declare-fun lt!308087 () Unit!13975)

(declare-fun Unit!13993 () Unit!13975)

(assert (=> b!197770 (= lt!308087 Unit!13993)))

(assert (=> b!197770 (= (_1!9191 lt!308088) (withMovedBitIndex!0 (_2!9191 lt!308088) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))))))

(declare-fun lt!308098 () Unit!13975)

(declare-fun Unit!13994 () Unit!13975)

(assert (=> b!197770 (= lt!308098 Unit!13994)))

(assert (=> b!197770 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!308050 () Unit!13975)

(declare-fun Unit!13995 () Unit!13975)

(assert (=> b!197770 (= lt!308050 Unit!13995)))

(assert (=> b!197770 (= (_2!9192 lt!308102) (_2!9192 lt!308067))))

(declare-fun lt!308057 () Unit!13975)

(declare-fun Unit!13996 () Unit!13975)

(assert (=> b!197770 (= lt!308057 Unit!13996)))

(assert (=> b!197770 (invariant!0 (currentBit!9274 (_2!9189 lt!308063)) (currentByte!9279 (_2!9189 lt!308063)) (size!4455 (buf!4941 (_2!9189 lt!308063))))))

(declare-fun lt!308053 () Unit!13975)

(declare-fun Unit!13997 () Unit!13975)

(assert (=> b!197770 (= lt!308053 Unit!13997)))

(assert (=> b!197770 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!308063))))))

(declare-fun lt!308059 () Unit!13975)

(declare-fun Unit!13998 () Unit!13975)

(assert (=> b!197770 (= lt!308059 Unit!13998)))

(assert (=> b!197770 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))) (bvsub (bvadd (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308092 () Unit!13975)

(declare-fun Unit!13999 () Unit!13975)

(assert (=> b!197770 (= lt!308092 Unit!13999)))

(declare-fun lt!308064 () Unit!13975)

(declare-fun Unit!14000 () Unit!13975)

(assert (=> b!197770 (= lt!308064 Unit!14000)))

(assert (=> b!197770 (= lt!308058 (reader!0 (_2!9189 lt!307359) (_2!9189 lt!308063)))))

(declare-fun lt!308089 () (_ BitVec 64))

(assert (=> b!197770 (= lt!308089 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308077 () Unit!13975)

(assert (=> b!197770 (= lt!308077 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308063)) lt!308089))))

(assert (=> b!197770 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308089)))

(declare-fun lt!308079 () Unit!13975)

(assert (=> b!197770 (= lt!308079 lt!308077)))

(assert (=> b!197770 (= lt!308073 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308058) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!165538 () Bool)

(assert (=> b!197770 (= res!165538 (= (_2!9192 lt!308073) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!197770 (=> (not res!165538) (not e!135777))))

(assert (=> b!197770 e!135777))

(declare-fun lt!308068 () Unit!13975)

(declare-fun Unit!14002 () Unit!13975)

(assert (=> b!197770 (= lt!308068 Unit!14002)))

(declare-fun b!197771 () Bool)

(assert (=> b!197771 (= e!135781 (= (_2!9190 lt!308081) (_2!9190 lt!308061)))))

(declare-fun b!197772 () Bool)

(declare-fun res!165542 () Bool)

(assert (=> b!197772 (= res!165542 call!3107)))

(assert (=> b!197772 (=> (not res!165542) (not e!135779))))

(declare-fun b!197773 () Bool)

(assert (=> b!197773 (= e!135784 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308097))) (currentByte!9279 (_1!9190 lt!308097)) (currentBit!9274 (_1!9190 lt!308097))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308091))) (currentByte!9279 (_2!9189 lt!308091)) (currentBit!9274 (_2!9189 lt!308091)))))))

(declare-fun b!197774 () Bool)

(assert (=> b!197774 (= e!135780 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (= (and d!66691 c!9831) b!197761))

(assert (= (and d!66691 (not c!9831)) b!197770))

(assert (= (and b!197770 res!165535) b!197760))

(assert (= (and b!197760 res!165543) b!197772))

(assert (= (and b!197772 res!165542) b!197763))

(assert (= (and b!197763 res!165536) b!197773))

(assert (= (and b!197770 res!165540) b!197771))

(assert (= (and b!197770 c!9830) b!197774))

(assert (= (and b!197770 (not c!9830)) b!197764))

(assert (= (and b!197770 res!165538) b!197762))

(assert (= (or b!197761 b!197772) bm!3104))

(assert (= (and d!66691 res!165534) b!197766))

(assert (= (and b!197766 res!165537) b!197759))

(assert (= (and b!197759 res!165532) b!197767))

(assert (= (and b!197767 res!165541) b!197765))

(assert (= (and b!197765 res!165533) b!197768))

(assert (= (and b!197765 res!165539) b!197769))

(declare-fun m!305557 () Bool)

(assert (=> b!197767 m!305557))

(declare-fun m!305559 () Bool)

(assert (=> bm!3104 m!305559))

(declare-fun m!305561 () Bool)

(assert (=> b!197761 m!305561))

(declare-fun m!305563 () Bool)

(assert (=> b!197770 m!305563))

(declare-fun m!305565 () Bool)

(assert (=> b!197770 m!305565))

(declare-fun m!305567 () Bool)

(assert (=> b!197770 m!305567))

(declare-fun m!305569 () Bool)

(assert (=> b!197770 m!305569))

(declare-fun m!305571 () Bool)

(assert (=> b!197770 m!305571))

(declare-fun m!305573 () Bool)

(assert (=> b!197770 m!305573))

(declare-fun m!305575 () Bool)

(assert (=> b!197770 m!305575))

(declare-fun m!305577 () Bool)

(assert (=> b!197770 m!305577))

(declare-fun m!305579 () Bool)

(assert (=> b!197770 m!305579))

(declare-fun m!305581 () Bool)

(assert (=> b!197770 m!305581))

(declare-fun m!305583 () Bool)

(assert (=> b!197770 m!305583))

(declare-fun m!305585 () Bool)

(assert (=> b!197770 m!305585))

(declare-fun m!305587 () Bool)

(assert (=> b!197770 m!305587))

(declare-fun m!305589 () Bool)

(assert (=> b!197770 m!305589))

(declare-fun m!305591 () Bool)

(assert (=> b!197770 m!305591))

(declare-fun m!305593 () Bool)

(assert (=> b!197770 m!305593))

(declare-fun m!305595 () Bool)

(assert (=> b!197770 m!305595))

(declare-fun m!305597 () Bool)

(assert (=> b!197770 m!305597))

(declare-fun m!305599 () Bool)

(assert (=> b!197770 m!305599))

(declare-fun m!305601 () Bool)

(assert (=> b!197770 m!305601))

(declare-fun m!305603 () Bool)

(assert (=> b!197770 m!305603))

(declare-fun m!305605 () Bool)

(assert (=> b!197770 m!305605))

(declare-fun m!305607 () Bool)

(assert (=> b!197770 m!305607))

(declare-fun m!305609 () Bool)

(assert (=> b!197770 m!305609))

(declare-fun m!305611 () Bool)

(assert (=> b!197770 m!305611))

(declare-fun m!305613 () Bool)

(assert (=> b!197770 m!305613))

(assert (=> b!197770 m!305569))

(declare-fun m!305615 () Bool)

(assert (=> b!197770 m!305615))

(declare-fun m!305617 () Bool)

(assert (=> b!197770 m!305617))

(declare-fun m!305619 () Bool)

(assert (=> b!197770 m!305619))

(declare-fun m!305621 () Bool)

(assert (=> b!197770 m!305621))

(declare-fun m!305623 () Bool)

(assert (=> b!197770 m!305623))

(declare-fun m!305625 () Bool)

(assert (=> b!197770 m!305625))

(assert (=> b!197770 m!305115))

(declare-fun m!305627 () Bool)

(assert (=> b!197770 m!305627))

(declare-fun m!305629 () Bool)

(assert (=> b!197759 m!305629))

(assert (=> b!197759 m!305115))

(declare-fun m!305631 () Bool)

(assert (=> b!197773 m!305631))

(declare-fun m!305633 () Bool)

(assert (=> b!197773 m!305633))

(declare-fun m!305635 () Bool)

(assert (=> b!197768 m!305635))

(declare-fun m!305637 () Bool)

(assert (=> b!197765 m!305637))

(assert (=> b!197765 m!305591))

(assert (=> b!197765 m!305597))

(declare-fun m!305639 () Bool)

(assert (=> b!197765 m!305639))

(declare-fun m!305641 () Bool)

(assert (=> b!197765 m!305641))

(declare-fun m!305643 () Bool)

(assert (=> b!197765 m!305643))

(declare-fun m!305645 () Bool)

(assert (=> d!66691 m!305645))

(assert (=> b!197760 m!305633))

(assert (=> b!197760 m!305115))

(declare-fun m!305647 () Bool)

(assert (=> b!197763 m!305647))

(assert (=> b!197763 m!305647))

(declare-fun m!305649 () Bool)

(assert (=> b!197763 m!305649))

(assert (=> b!197505 d!66691))

(declare-fun b!197785 () Bool)

(declare-fun res!165550 () Bool)

(declare-fun e!135790 () Bool)

(assert (=> b!197785 (=> (not res!165550) (not e!135790))))

(declare-fun lt!308157 () tuple2!17092)

(assert (=> b!197785 (= res!165550 (isPrefixOf!0 (_1!9191 lt!308157) thiss!1204))))

(declare-fun d!66797 () Bool)

(assert (=> d!66797 e!135790))

(declare-fun res!165552 () Bool)

(assert (=> d!66797 (=> (not res!165552) (not e!135790))))

(assert (=> d!66797 (= res!165552 (isPrefixOf!0 (_1!9191 lt!308157) (_2!9191 lt!308157)))))

(declare-fun lt!308161 () BitStream!8018)

(assert (=> d!66797 (= lt!308157 (tuple2!17093 lt!308161 (_2!9189 lt!307379)))))

(declare-fun lt!308165 () Unit!13975)

(declare-fun lt!308147 () Unit!13975)

(assert (=> d!66797 (= lt!308165 lt!308147)))

(assert (=> d!66797 (isPrefixOf!0 lt!308161 (_2!9189 lt!307379))))

(assert (=> d!66797 (= lt!308147 (lemmaIsPrefixTransitive!0 lt!308161 (_2!9189 lt!307379) (_2!9189 lt!307379)))))

(declare-fun lt!308156 () Unit!13975)

(declare-fun lt!308153 () Unit!13975)

(assert (=> d!66797 (= lt!308156 lt!308153)))

(assert (=> d!66797 (isPrefixOf!0 lt!308161 (_2!9189 lt!307379))))

(assert (=> d!66797 (= lt!308153 (lemmaIsPrefixTransitive!0 lt!308161 thiss!1204 (_2!9189 lt!307379)))))

(declare-fun lt!308159 () Unit!13975)

(declare-fun e!135789 () Unit!13975)

(assert (=> d!66797 (= lt!308159 e!135789)))

(declare-fun c!9834 () Bool)

(assert (=> d!66797 (= c!9834 (not (= (size!4455 (buf!4941 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!308152 () Unit!13975)

(declare-fun lt!308150 () Unit!13975)

(assert (=> d!66797 (= lt!308152 lt!308150)))

(assert (=> d!66797 (isPrefixOf!0 (_2!9189 lt!307379) (_2!9189 lt!307379))))

(assert (=> d!66797 (= lt!308150 (lemmaIsPrefixRefl!0 (_2!9189 lt!307379)))))

(declare-fun lt!308146 () Unit!13975)

(declare-fun lt!308162 () Unit!13975)

(assert (=> d!66797 (= lt!308146 lt!308162)))

(assert (=> d!66797 (= lt!308162 (lemmaIsPrefixRefl!0 (_2!9189 lt!307379)))))

(declare-fun lt!308154 () Unit!13975)

(declare-fun lt!308148 () Unit!13975)

(assert (=> d!66797 (= lt!308154 lt!308148)))

(assert (=> d!66797 (isPrefixOf!0 lt!308161 lt!308161)))

(assert (=> d!66797 (= lt!308148 (lemmaIsPrefixRefl!0 lt!308161))))

(declare-fun lt!308163 () Unit!13975)

(declare-fun lt!308164 () Unit!13975)

(assert (=> d!66797 (= lt!308163 lt!308164)))

(assert (=> d!66797 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!66797 (= lt!308164 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!66797 (= lt!308161 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(assert (=> d!66797 (isPrefixOf!0 thiss!1204 (_2!9189 lt!307379))))

(assert (=> d!66797 (= (reader!0 thiss!1204 (_2!9189 lt!307379)) lt!308157)))

(declare-fun b!197786 () Bool)

(declare-fun Unit!14005 () Unit!13975)

(assert (=> b!197786 (= e!135789 Unit!14005)))

(declare-fun lt!308155 () (_ BitVec 64))

(declare-fun lt!308158 () (_ BitVec 64))

(declare-fun b!197787 () Bool)

(assert (=> b!197787 (= e!135790 (= (_1!9191 lt!308157) (withMovedBitIndex!0 (_2!9191 lt!308157) (bvsub lt!308155 lt!308158))))))

(assert (=> b!197787 (or (= (bvand lt!308155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308158 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308155 lt!308158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197787 (= lt!308158 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379))))))

(assert (=> b!197787 (= lt!308155 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(declare-fun b!197788 () Bool)

(declare-fun lt!308149 () Unit!13975)

(assert (=> b!197788 (= e!135789 lt!308149)))

(declare-fun lt!308151 () (_ BitVec 64))

(assert (=> b!197788 (= lt!308151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!308160 () (_ BitVec 64))

(assert (=> b!197788 (= lt!308160 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10107 array!10107 (_ BitVec 64) (_ BitVec 64)) Unit!13975)

(assert (=> b!197788 (= lt!308149 (arrayBitRangesEqSymmetric!0 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307379)) lt!308151 lt!308160))))

(assert (=> b!197788 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307379)) (buf!4941 thiss!1204) lt!308151 lt!308160)))

(declare-fun b!197789 () Bool)

(declare-fun res!165551 () Bool)

(assert (=> b!197789 (=> (not res!165551) (not e!135790))))

(assert (=> b!197789 (= res!165551 (isPrefixOf!0 (_2!9191 lt!308157) (_2!9189 lt!307379)))))

(assert (= (and d!66797 c!9834) b!197788))

(assert (= (and d!66797 (not c!9834)) b!197786))

(assert (= (and d!66797 res!165552) b!197785))

(assert (= (and b!197785 res!165550) b!197789))

(assert (= (and b!197789 res!165551) b!197787))

(declare-fun m!305651 () Bool)

(assert (=> d!66797 m!305651))

(declare-fun m!305653 () Bool)

(assert (=> d!66797 m!305653))

(declare-fun m!305655 () Bool)

(assert (=> d!66797 m!305655))

(declare-fun m!305657 () Bool)

(assert (=> d!66797 m!305657))

(declare-fun m!305659 () Bool)

(assert (=> d!66797 m!305659))

(declare-fun m!305661 () Bool)

(assert (=> d!66797 m!305661))

(declare-fun m!305663 () Bool)

(assert (=> d!66797 m!305663))

(declare-fun m!305665 () Bool)

(assert (=> d!66797 m!305665))

(declare-fun m!305667 () Bool)

(assert (=> d!66797 m!305667))

(declare-fun m!305669 () Bool)

(assert (=> d!66797 m!305669))

(assert (=> d!66797 m!305123))

(assert (=> b!197788 m!305117))

(declare-fun m!305671 () Bool)

(assert (=> b!197788 m!305671))

(declare-fun m!305673 () Bool)

(assert (=> b!197788 m!305673))

(declare-fun m!305675 () Bool)

(assert (=> b!197789 m!305675))

(declare-fun m!305677 () Bool)

(assert (=> b!197787 m!305677))

(assert (=> b!197787 m!305121))

(assert (=> b!197787 m!305117))

(declare-fun m!305679 () Bool)

(assert (=> b!197785 m!305679))

(assert (=> b!197504 d!66797))

(declare-fun d!66799 () Bool)

(assert (=> d!66799 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!197504 d!66799))

(declare-fun d!66801 () Bool)

(assert (=> d!66801 (= (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307359)))) (and (bvsge (currentBit!9274 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9274 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9279 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307359)))) (and (= (currentBit!9274 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307359))))))))))

(assert (=> b!197504 d!66801))

(declare-fun d!66803 () Bool)

(declare-datatypes ((tuple2!17104 0))(
  ( (tuple2!17105 (_1!9197 Bool) (_2!9197 BitStream!8018)) )
))
(declare-fun lt!308168 () tuple2!17104)

(declare-fun readBit!0 (BitStream!8018) tuple2!17104)

(assert (=> d!66803 (= lt!308168 (readBit!0 (_1!9191 lt!307378)))))

(assert (=> d!66803 (= (readBitPure!0 (_1!9191 lt!307378)) (tuple2!17091 (_2!9197 lt!308168) (_1!9197 lt!308168)))))

(declare-fun bs!16575 () Bool)

(assert (= bs!16575 d!66803))

(declare-fun m!305681 () Bool)

(assert (=> bs!16575 m!305681))

(assert (=> b!197504 d!66803))

(declare-fun d!66805 () Bool)

(assert (=> d!66805 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!307366) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))) lt!307366))))

(declare-fun bs!16576 () Bool)

(assert (= bs!16576 d!66805))

(declare-fun m!305683 () Bool)

(assert (=> bs!16576 m!305683))

(assert (=> b!197504 d!66805))

(declare-fun b!197790 () Bool)

(declare-fun res!165553 () Bool)

(declare-fun e!135792 () Bool)

(assert (=> b!197790 (=> (not res!165553) (not e!135792))))

(declare-fun lt!308180 () tuple2!17092)

(assert (=> b!197790 (= res!165553 (isPrefixOf!0 (_1!9191 lt!308180) (_2!9189 lt!307359)))))

(declare-fun d!66807 () Bool)

(assert (=> d!66807 e!135792))

(declare-fun res!165555 () Bool)

(assert (=> d!66807 (=> (not res!165555) (not e!135792))))

(assert (=> d!66807 (= res!165555 (isPrefixOf!0 (_1!9191 lt!308180) (_2!9191 lt!308180)))))

(declare-fun lt!308184 () BitStream!8018)

(assert (=> d!66807 (= lt!308180 (tuple2!17093 lt!308184 (_2!9189 lt!307379)))))

(declare-fun lt!308188 () Unit!13975)

(declare-fun lt!308170 () Unit!13975)

(assert (=> d!66807 (= lt!308188 lt!308170)))

(assert (=> d!66807 (isPrefixOf!0 lt!308184 (_2!9189 lt!307379))))

(assert (=> d!66807 (= lt!308170 (lemmaIsPrefixTransitive!0 lt!308184 (_2!9189 lt!307379) (_2!9189 lt!307379)))))

(declare-fun lt!308179 () Unit!13975)

(declare-fun lt!308176 () Unit!13975)

(assert (=> d!66807 (= lt!308179 lt!308176)))

(assert (=> d!66807 (isPrefixOf!0 lt!308184 (_2!9189 lt!307379))))

(assert (=> d!66807 (= lt!308176 (lemmaIsPrefixTransitive!0 lt!308184 (_2!9189 lt!307359) (_2!9189 lt!307379)))))

(declare-fun lt!308182 () Unit!13975)

(declare-fun e!135791 () Unit!13975)

(assert (=> d!66807 (= lt!308182 e!135791)))

(declare-fun c!9835 () Bool)

(assert (=> d!66807 (= c!9835 (not (= (size!4455 (buf!4941 (_2!9189 lt!307359))) #b00000000000000000000000000000000)))))

(declare-fun lt!308175 () Unit!13975)

(declare-fun lt!308173 () Unit!13975)

(assert (=> d!66807 (= lt!308175 lt!308173)))

(assert (=> d!66807 (isPrefixOf!0 (_2!9189 lt!307379) (_2!9189 lt!307379))))

(assert (=> d!66807 (= lt!308173 (lemmaIsPrefixRefl!0 (_2!9189 lt!307379)))))

(declare-fun lt!308169 () Unit!13975)

(declare-fun lt!308185 () Unit!13975)

(assert (=> d!66807 (= lt!308169 lt!308185)))

(assert (=> d!66807 (= lt!308185 (lemmaIsPrefixRefl!0 (_2!9189 lt!307379)))))

(declare-fun lt!308177 () Unit!13975)

(declare-fun lt!308171 () Unit!13975)

(assert (=> d!66807 (= lt!308177 lt!308171)))

(assert (=> d!66807 (isPrefixOf!0 lt!308184 lt!308184)))

(assert (=> d!66807 (= lt!308171 (lemmaIsPrefixRefl!0 lt!308184))))

(declare-fun lt!308186 () Unit!13975)

(declare-fun lt!308187 () Unit!13975)

(assert (=> d!66807 (= lt!308186 lt!308187)))

(assert (=> d!66807 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!307359))))

(assert (=> d!66807 (= lt!308187 (lemmaIsPrefixRefl!0 (_2!9189 lt!307359)))))

(assert (=> d!66807 (= lt!308184 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> d!66807 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!307379))))

(assert (=> d!66807 (= (reader!0 (_2!9189 lt!307359) (_2!9189 lt!307379)) lt!308180)))

(declare-fun b!197791 () Bool)

(declare-fun Unit!14015 () Unit!13975)

(assert (=> b!197791 (= e!135791 Unit!14015)))

(declare-fun b!197792 () Bool)

(declare-fun lt!308181 () (_ BitVec 64))

(declare-fun lt!308178 () (_ BitVec 64))

(assert (=> b!197792 (= e!135792 (= (_1!9191 lt!308180) (withMovedBitIndex!0 (_2!9191 lt!308180) (bvsub lt!308178 lt!308181))))))

(assert (=> b!197792 (or (= (bvand lt!308178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308178 lt!308181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197792 (= lt!308181 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379))))))

(assert (=> b!197792 (= lt!308178 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(declare-fun b!197793 () Bool)

(declare-fun lt!308172 () Unit!13975)

(assert (=> b!197793 (= e!135791 lt!308172)))

(declare-fun lt!308174 () (_ BitVec 64))

(assert (=> b!197793 (= lt!308174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!308183 () (_ BitVec 64))

(assert (=> b!197793 (= lt!308183 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> b!197793 (= lt!308172 (arrayBitRangesEqSymmetric!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!307379)) lt!308174 lt!308183))))

(assert (=> b!197793 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307379)) (buf!4941 (_2!9189 lt!307359)) lt!308174 lt!308183)))

(declare-fun b!197794 () Bool)

(declare-fun res!165554 () Bool)

(assert (=> b!197794 (=> (not res!165554) (not e!135792))))

(assert (=> b!197794 (= res!165554 (isPrefixOf!0 (_2!9191 lt!308180) (_2!9189 lt!307379)))))

(assert (= (and d!66807 c!9835) b!197793))

(assert (= (and d!66807 (not c!9835)) b!197791))

(assert (= (and d!66807 res!165555) b!197790))

(assert (= (and b!197790 res!165553) b!197794))

(assert (= (and b!197794 res!165554) b!197792))

(declare-fun m!305685 () Bool)

(assert (=> d!66807 m!305685))

(declare-fun m!305687 () Bool)

(assert (=> d!66807 m!305687))

(assert (=> d!66807 m!305655))

(assert (=> d!66807 m!305657))

(declare-fun m!305689 () Bool)

(assert (=> d!66807 m!305689))

(declare-fun m!305691 () Bool)

(assert (=> d!66807 m!305691))

(assert (=> d!66807 m!305561))

(declare-fun m!305693 () Bool)

(assert (=> d!66807 m!305693))

(declare-fun m!305695 () Bool)

(assert (=> d!66807 m!305695))

(declare-fun m!305697 () Bool)

(assert (=> d!66807 m!305697))

(assert (=> d!66807 m!305177))

(assert (=> b!197793 m!305115))

(declare-fun m!305699 () Bool)

(assert (=> b!197793 m!305699))

(declare-fun m!305701 () Bool)

(assert (=> b!197793 m!305701))

(declare-fun m!305703 () Bool)

(assert (=> b!197794 m!305703))

(declare-fun m!305705 () Bool)

(assert (=> b!197792 m!305705))

(assert (=> b!197792 m!305121))

(assert (=> b!197792 m!305115))

(declare-fun m!305707 () Bool)

(assert (=> b!197790 m!305707))

(assert (=> b!197504 d!66807))

(declare-fun d!66809 () Bool)

(declare-fun e!135795 () Bool)

(assert (=> d!66809 e!135795))

(declare-fun res!165558 () Bool)

(assert (=> d!66809 (=> (not res!165558) (not e!135795))))

(declare-fun lt!308200 () tuple2!17090)

(declare-fun lt!308197 () tuple2!17090)

(assert (=> d!66809 (= res!165558 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308200))) (currentByte!9279 (_1!9190 lt!308200)) (currentBit!9274 (_1!9190 lt!308200))) (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308197))) (currentByte!9279 (_1!9190 lt!308197)) (currentBit!9274 (_1!9190 lt!308197)))))))

(declare-fun lt!308199 () Unit!13975)

(declare-fun lt!308198 () BitStream!8018)

(declare-fun choose!50 (BitStream!8018 BitStream!8018 BitStream!8018 tuple2!17090 tuple2!17090 BitStream!8018 Bool tuple2!17090 tuple2!17090 BitStream!8018 Bool) Unit!13975)

(assert (=> d!66809 (= lt!308199 (choose!50 lt!307376 (_2!9189 lt!307379) lt!308198 lt!308200 (tuple2!17091 (_1!9190 lt!308200) (_2!9190 lt!308200)) (_1!9190 lt!308200) (_2!9190 lt!308200) lt!308197 (tuple2!17091 (_1!9190 lt!308197) (_2!9190 lt!308197)) (_1!9190 lt!308197) (_2!9190 lt!308197)))))

(assert (=> d!66809 (= lt!308197 (readBitPure!0 lt!308198))))

(assert (=> d!66809 (= lt!308200 (readBitPure!0 lt!307376))))

(assert (=> d!66809 (= lt!308198 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 lt!307376) (currentBit!9274 lt!307376)))))

(assert (=> d!66809 (invariant!0 (currentBit!9274 lt!307376) (currentByte!9279 lt!307376) (size!4455 (buf!4941 (_2!9189 lt!307379))))))

(assert (=> d!66809 (= (readBitPrefixLemma!0 lt!307376 (_2!9189 lt!307379)) lt!308199)))

(declare-fun b!197797 () Bool)

(assert (=> b!197797 (= e!135795 (= (_2!9190 lt!308200) (_2!9190 lt!308197)))))

(assert (= (and d!66809 res!165558) b!197797))

(declare-fun m!305709 () Bool)

(assert (=> d!66809 m!305709))

(declare-fun m!305711 () Bool)

(assert (=> d!66809 m!305711))

(declare-fun m!305713 () Bool)

(assert (=> d!66809 m!305713))

(assert (=> d!66809 m!305141))

(declare-fun m!305715 () Bool)

(assert (=> d!66809 m!305715))

(declare-fun m!305717 () Bool)

(assert (=> d!66809 m!305717))

(assert (=> b!197504 d!66809))

(declare-fun d!66811 () Bool)

(declare-fun lt!308201 () tuple2!17104)

(assert (=> d!66811 (= lt!308201 (readBit!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (=> d!66811 (= (readBitPure!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))) (tuple2!17091 (_2!9197 lt!308201) (_1!9197 lt!308201)))))

(declare-fun bs!16577 () Bool)

(assert (= bs!16577 d!66811))

(declare-fun m!305719 () Bool)

(assert (=> bs!16577 m!305719))

(assert (=> b!197504 d!66811))

(declare-datatypes ((tuple2!17106 0))(
  ( (tuple2!17107 (_1!9198 (_ BitVec 64)) (_2!9198 BitStream!8018)) )
))
(declare-fun lt!308204 () tuple2!17106)

(declare-fun d!66813 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17106)

(assert (=> d!66813 (= lt!308204 (readNBitsLSBFirstsLoop!0 (_1!9191 lt!307375) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307362 (ite (_2!9190 lt!307371) lt!307361 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!66813 (= (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!307375) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307362 (ite (_2!9190 lt!307371) lt!307361 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17095 (_2!9198 lt!308204) (_1!9198 lt!308204)))))

(declare-fun bs!16578 () Bool)

(assert (= bs!16578 d!66813))

(declare-fun m!305721 () Bool)

(assert (=> bs!16578 m!305721))

(assert (=> b!197504 d!66813))

(declare-fun d!66815 () Bool)

(declare-fun lt!308205 () tuple2!17104)

(assert (=> d!66815 (= lt!308205 (readBit!0 lt!307376))))

(assert (=> d!66815 (= (readBitPure!0 lt!307376) (tuple2!17091 (_2!9197 lt!308205) (_1!9197 lt!308205)))))

(declare-fun bs!16579 () Bool)

(assert (= bs!16579 d!66815))

(declare-fun m!305723 () Bool)

(assert (=> bs!16579 m!305723))

(assert (=> b!197504 d!66815))

(declare-fun d!66817 () Bool)

(assert (=> d!66817 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!307366)))

(declare-fun lt!308208 () Unit!13975)

(declare-fun choose!9 (BitStream!8018 array!10107 (_ BitVec 64) BitStream!8018) Unit!13975)

(assert (=> d!66817 (= lt!308208 (choose!9 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!307379)) lt!307366 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (=> d!66817 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!307379)) lt!307366) lt!308208)))

(declare-fun bs!16580 () Bool)

(assert (= bs!16580 d!66817))

(assert (=> bs!16580 m!305147))

(declare-fun m!305725 () Bool)

(assert (=> bs!16580 m!305725))

(assert (=> b!197504 d!66817))

(declare-fun d!66819 () Bool)

(declare-fun e!135796 () Bool)

(assert (=> d!66819 e!135796))

(declare-fun res!165559 () Bool)

(assert (=> d!66819 (=> (not res!165559) (not e!135796))))

(declare-fun lt!308213 () (_ BitVec 64))

(declare-fun lt!308212 () (_ BitVec 64))

(declare-fun lt!308211 () (_ BitVec 64))

(assert (=> d!66819 (= res!165559 (= lt!308211 (bvsub lt!308212 lt!308213)))))

(assert (=> d!66819 (or (= (bvand lt!308212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308213 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308212 lt!308213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66819 (= lt!308213 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307373)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307373))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307373)))))))

(declare-fun lt!308214 () (_ BitVec 64))

(declare-fun lt!308210 () (_ BitVec 64))

(assert (=> d!66819 (= lt!308212 (bvmul lt!308214 lt!308210))))

(assert (=> d!66819 (or (= lt!308214 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308210 (bvsdiv (bvmul lt!308214 lt!308210) lt!308214)))))

(assert (=> d!66819 (= lt!308210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66819 (= lt!308214 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307373)))))))

(assert (=> d!66819 (= lt!308211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307373))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307373)))))))

(assert (=> d!66819 (invariant!0 (currentBit!9274 (_1!9190 lt!307373)) (currentByte!9279 (_1!9190 lt!307373)) (size!4455 (buf!4941 (_1!9190 lt!307373))))))

(assert (=> d!66819 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!307373))) (currentByte!9279 (_1!9190 lt!307373)) (currentBit!9274 (_1!9190 lt!307373))) lt!308211)))

(declare-fun b!197798 () Bool)

(declare-fun res!165560 () Bool)

(assert (=> b!197798 (=> (not res!165560) (not e!135796))))

(assert (=> b!197798 (= res!165560 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308211))))

(declare-fun b!197799 () Bool)

(declare-fun lt!308209 () (_ BitVec 64))

(assert (=> b!197799 (= e!135796 (bvsle lt!308211 (bvmul lt!308209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197799 (or (= lt!308209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308209)))))

(assert (=> b!197799 (= lt!308209 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307373)))))))

(assert (= (and d!66819 res!165559) b!197798))

(assert (= (and b!197798 res!165560) b!197799))

(declare-fun m!305727 () Bool)

(assert (=> d!66819 m!305727))

(declare-fun m!305729 () Bool)

(assert (=> d!66819 m!305729))

(assert (=> b!197504 d!66819))

(declare-fun lt!308215 () tuple2!17106)

(declare-fun d!66821 () Bool)

(assert (=> d!66821 (= lt!308215 (readNBitsLSBFirstsLoop!0 (_1!9191 lt!307378) nBits!348 i!590 lt!307362))))

(assert (=> d!66821 (= (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!307378) nBits!348 i!590 lt!307362) (tuple2!17095 (_2!9198 lt!308215) (_1!9198 lt!308215)))))

(declare-fun bs!16581 () Bool)

(assert (= bs!16581 d!66821))

(declare-fun m!305731 () Bool)

(assert (=> bs!16581 m!305731))

(assert (=> b!197504 d!66821))

(declare-fun d!66823 () Bool)

(assert (=> d!66823 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204)) lt!307364) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204))) lt!307364))))

(declare-fun bs!16582 () Bool)

(assert (= bs!16582 d!66823))

(declare-fun m!305733 () Bool)

(assert (=> bs!16582 m!305733))

(assert (=> b!197504 d!66823))

(declare-fun d!66825 () Bool)

(declare-fun e!135797 () Bool)

(assert (=> d!66825 e!135797))

(declare-fun res!165561 () Bool)

(assert (=> d!66825 (=> (not res!165561) (not e!135797))))

(declare-fun lt!308218 () (_ BitVec 64))

(declare-fun lt!308219 () (_ BitVec 64))

(declare-fun lt!308220 () (_ BitVec 64))

(assert (=> d!66825 (= res!165561 (= lt!308218 (bvsub lt!308219 lt!308220)))))

(assert (=> d!66825 (or (= (bvand lt!308219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308219 lt!308220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66825 (= lt!308220 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307358)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307358))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307358)))))))

(declare-fun lt!308221 () (_ BitVec 64))

(declare-fun lt!308217 () (_ BitVec 64))

(assert (=> d!66825 (= lt!308219 (bvmul lt!308221 lt!308217))))

(assert (=> d!66825 (or (= lt!308221 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308217 (bvsdiv (bvmul lt!308221 lt!308217) lt!308221)))))

(assert (=> d!66825 (= lt!308217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66825 (= lt!308221 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307358)))))))

(assert (=> d!66825 (= lt!308218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307358))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307358)))))))

(assert (=> d!66825 (invariant!0 (currentBit!9274 (_1!9190 lt!307358)) (currentByte!9279 (_1!9190 lt!307358)) (size!4455 (buf!4941 (_1!9190 lt!307358))))))

(assert (=> d!66825 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!307358))) (currentByte!9279 (_1!9190 lt!307358)) (currentBit!9274 (_1!9190 lt!307358))) lt!308218)))

(declare-fun b!197800 () Bool)

(declare-fun res!165562 () Bool)

(assert (=> b!197800 (=> (not res!165562) (not e!135797))))

(assert (=> b!197800 (= res!165562 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308218))))

(declare-fun b!197801 () Bool)

(declare-fun lt!308216 () (_ BitVec 64))

(assert (=> b!197801 (= e!135797 (bvsle lt!308218 (bvmul lt!308216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197801 (or (= lt!308216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308216)))))

(assert (=> b!197801 (= lt!308216 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307358)))))))

(assert (= (and d!66825 res!165561) b!197800))

(assert (= (and b!197800 res!165562) b!197801))

(declare-fun m!305735 () Bool)

(assert (=> d!66825 m!305735))

(declare-fun m!305737 () Bool)

(assert (=> d!66825 m!305737))

(assert (=> b!197504 d!66825))

(declare-fun d!66827 () Bool)

(assert (=> d!66827 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204)) lt!307364)))

(declare-fun lt!308222 () Unit!13975)

(assert (=> d!66827 (= lt!308222 (choose!9 thiss!1204 (buf!4941 (_2!9189 lt!307379)) lt!307364 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (=> d!66827 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4941 (_2!9189 lt!307379)) lt!307364) lt!308222)))

(declare-fun bs!16583 () Bool)

(assert (= bs!16583 d!66827))

(assert (=> bs!16583 m!305139))

(declare-fun m!305739 () Bool)

(assert (=> bs!16583 m!305739))

(assert (=> b!197504 d!66827))

(declare-fun d!66829 () Bool)

(assert (=> d!66829 (= (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307379)))) (and (bvsge (currentBit!9274 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9274 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9279 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307379)))) (and (= (currentBit!9274 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307379))))))))))

(assert (=> b!197503 d!66829))

(declare-fun d!66831 () Bool)

(assert (=> d!66831 (= (array_inv!4196 (buf!4941 thiss!1204)) (bvsge (size!4455 (buf!4941 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!197502 d!66831))

(declare-fun d!66833 () Bool)

(declare-fun res!165563 () Bool)

(declare-fun e!135799 () Bool)

(assert (=> d!66833 (=> (not res!165563) (not e!135799))))

(assert (=> d!66833 (= res!165563 (= (size!4455 (buf!4941 thiss!1204)) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(assert (=> d!66833 (= (isPrefixOf!0 thiss!1204 (_2!9189 lt!307359)) e!135799)))

(declare-fun b!197802 () Bool)

(declare-fun res!165564 () Bool)

(assert (=> b!197802 (=> (not res!165564) (not e!135799))))

(assert (=> b!197802 (= res!165564 (bvsle (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(declare-fun b!197803 () Bool)

(declare-fun e!135798 () Bool)

(assert (=> b!197803 (= e!135799 e!135798)))

(declare-fun res!165565 () Bool)

(assert (=> b!197803 (=> res!165565 e!135798)))

(assert (=> b!197803 (= res!165565 (= (size!4455 (buf!4941 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197804 () Bool)

(assert (=> b!197804 (= e!135798 (arrayBitRangesEq!0 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307359)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (= (and d!66833 res!165563) b!197802))

(assert (= (and b!197802 res!165564) b!197803))

(assert (= (and b!197803 (not res!165565)) b!197804))

(assert (=> b!197802 m!305117))

(assert (=> b!197802 m!305115))

(assert (=> b!197804 m!305117))

(assert (=> b!197804 m!305117))

(declare-fun m!305741 () Bool)

(assert (=> b!197804 m!305741))

(assert (=> b!197501 d!66833))

(assert (=> b!197500 d!66677))

(assert (=> b!197500 d!66681))

(declare-fun d!66835 () Bool)

(declare-fun lt!308223 () tuple2!17104)

(assert (=> d!66835 (= lt!308223 (readBit!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))))

(assert (=> d!66835 (= (readBitPure!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))) (tuple2!17091 (_2!9197 lt!308223) (_1!9197 lt!308223)))))

(declare-fun bs!16584 () Bool)

(assert (= bs!16584 d!66835))

(assert (=> bs!16584 m!305173))

(declare-fun m!305743 () Bool)

(assert (=> bs!16584 m!305743))

(assert (=> b!197499 d!66835))

(declare-fun d!66837 () Bool)

(declare-fun e!135804 () Bool)

(assert (=> d!66837 e!135804))

(declare-fun res!165569 () Bool)

(assert (=> d!66837 (=> (not res!165569) (not e!135804))))

(assert (=> d!66837 (= res!165569 (invariant!0 (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(assert (=> d!66837 (= (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)) (BitStream!8019 (buf!4941 (_2!9189 lt!307359)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(declare-fun b!197811 () Bool)

(assert (=> b!197811 (= e!135804 (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(assert (= (and d!66837 res!165569) b!197811))

(assert (=> d!66837 m!305223))

(assert (=> b!197811 m!305159))

(assert (=> b!197499 d!66837))

(declare-fun d!66839 () Bool)

(assert (=> d!66839 (= (invariant!0 (currentBit!9274 (_2!9189 lt!307379)) (currentByte!9279 (_2!9189 lt!307379)) (size!4455 (buf!4941 (_2!9189 lt!307379)))) (and (bvsge (currentBit!9274 (_2!9189 lt!307379)) #b00000000000000000000000000000000) (bvslt (currentBit!9274 (_2!9189 lt!307379)) #b00000000000000000000000000001000) (bvsge (currentByte!9279 (_2!9189 lt!307379)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 (_2!9189 lt!307379)) (size!4455 (buf!4941 (_2!9189 lt!307379)))) (and (= (currentBit!9274 (_2!9189 lt!307379)) #b00000000000000000000000000000000) (= (currentByte!9279 (_2!9189 lt!307379)) (size!4455 (buf!4941 (_2!9189 lt!307379))))))))))

(assert (=> b!197510 d!66839))

(assert (=> b!197509 d!66833))

(declare-fun d!66841 () Bool)

(assert (=> d!66841 (= (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 thiss!1204))) (and (bvsge (currentBit!9274 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9274 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9279 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 thiss!1204) (size!4455 (buf!4941 thiss!1204))) (and (= (currentBit!9274 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9279 thiss!1204) (size!4455 (buf!4941 thiss!1204)))))))))

(assert (=> b!197498 d!66841))

(declare-fun d!66843 () Bool)

(assert (=> d!66843 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 thiss!1204))))))

(declare-fun bs!16585 () Bool)

(assert (= bs!16585 d!66843))

(assert (=> bs!16585 m!305179))

(assert (=> start!41922 d!66843))

(declare-fun d!66845 () Bool)

(declare-fun res!165578 () Bool)

(declare-fun e!135810 () Bool)

(assert (=> d!66845 (=> (not res!165578) (not e!135810))))

(assert (=> d!66845 (= res!165578 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (=> d!66845 (= (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!307379)) e!135810)))

(declare-fun b!197820 () Bool)

(declare-fun res!165579 () Bool)

(assert (=> b!197820 (=> (not res!165579) (not e!135810))))

(assert (=> b!197820 (= res!165579 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379)))))))

(declare-fun b!197821 () Bool)

(declare-fun e!135809 () Bool)

(assert (=> b!197821 (= e!135810 e!135809)))

(declare-fun res!165580 () Bool)

(assert (=> b!197821 (=> res!165580 e!135809)))

(assert (=> b!197821 (= res!165580 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) #b00000000000000000000000000000000))))

(declare-fun b!197822 () Bool)

(assert (=> b!197822 (= e!135809 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (= (and d!66845 res!165578) b!197820))

(assert (= (and b!197820 res!165579) b!197821))

(assert (= (and b!197821 (not res!165580)) b!197822))

(assert (=> b!197820 m!305115))

(assert (=> b!197820 m!305121))

(assert (=> b!197822 m!305115))

(assert (=> b!197822 m!305115))

(declare-fun m!305745 () Bool)

(assert (=> b!197822 m!305745))

(assert (=> b!197497 d!66845))

(push 1)

(assert (not d!66683))

(assert (not b!197788))

(assert (not b!197765))

(assert (not d!66677))

(assert (not b!197761))

(assert (not b!197787))

(assert (not d!66681))

(assert (not b!197820))

(assert (not b!197790))

(assert (not b!197789))

(assert (not b!197811))

(assert (not d!66685))

(assert (not d!66825))

(assert (not b!197793))

(assert (not b!197585))

(assert (not d!66837))

(assert (not b!197794))

(assert (not d!66807))

(assert (not d!66809))

(assert (not d!66811))

(assert (not b!197767))

(assert (not d!66689))

(assert (not b!197770))

(assert (not b!197822))

(assert (not d!66665))

(assert (not b!197571))

(assert (not b!197573))

(assert (not d!66821))

(assert (not b!197804))

(assert (not d!66815))

(assert (not d!66817))

(assert (not d!66803))

(assert (not d!66823))

(assert (not b!197785))

(assert (not d!66813))

(assert (not d!66805))

(assert (not d!66797))

(assert (not d!66843))

(assert (not d!66827))

(assert (not b!197763))

(assert (not d!66819))

(assert (not b!197572))

(assert (not bm!3104))

(assert (not d!66667))

(assert (not b!197773))

(assert (not d!66691))

(assert (not b!197574))

(assert (not b!197802))

(assert (not b!197759))

(assert (not b!197768))

(assert (not b!197583))

(assert (not d!66835))

(assert (not b!197792))

(assert (not b!197760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67075 () Bool)

(declare-fun e!135990 () Bool)

(assert (=> d!67075 e!135990))

(declare-fun res!165802 () Bool)

(assert (=> d!67075 (=> (not res!165802) (not e!135990))))

(declare-fun lt!308750 () (_ BitVec 64))

(declare-fun lt!308749 () BitStream!8018)

(assert (=> d!67075 (= res!165802 (= (bvadd lt!308750 (bvsub lt!308155 lt!308158)) (bitIndex!0 (size!4455 (buf!4941 lt!308749)) (currentByte!9279 lt!308749) (currentBit!9274 lt!308749))))))

(assert (=> d!67075 (or (not (= (bvand lt!308750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308155 lt!308158) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308750 (bvsub lt!308155 lt!308158)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67075 (= lt!308750 (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308157))) (currentByte!9279 (_2!9191 lt!308157)) (currentBit!9274 (_2!9191 lt!308157))))))

(declare-fun moveBitIndex!0 (BitStream!8018 (_ BitVec 64)) tuple2!17088)

(assert (=> d!67075 (= lt!308749 (_2!9189 (moveBitIndex!0 (_2!9191 lt!308157) (bvsub lt!308155 lt!308158))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8018 (_ BitVec 64)) Bool)

(assert (=> d!67075 (moveBitIndexPrecond!0 (_2!9191 lt!308157) (bvsub lt!308155 lt!308158))))

(assert (=> d!67075 (= (withMovedBitIndex!0 (_2!9191 lt!308157) (bvsub lt!308155 lt!308158)) lt!308749)))

(declare-fun b!198087 () Bool)

(assert (=> b!198087 (= e!135990 (= (size!4455 (buf!4941 (_2!9191 lt!308157))) (size!4455 (buf!4941 lt!308749))))))

(assert (= (and d!67075 res!165802) b!198087))

(declare-fun m!306395 () Bool)

(assert (=> d!67075 m!306395))

(declare-fun m!306397 () Bool)

(assert (=> d!67075 m!306397))

(declare-fun m!306399 () Bool)

(assert (=> d!67075 m!306399))

(declare-fun m!306401 () Bool)

(assert (=> d!67075 m!306401))

(assert (=> b!197787 d!67075))

(assert (=> b!197787 d!66685))

(assert (=> b!197787 d!66681))

(declare-fun d!67077 () Bool)

(assert (=> d!67077 (isPrefixOf!0 lt!308184 lt!308184)))

(declare-fun lt!308753 () Unit!13975)

(declare-fun choose!11 (BitStream!8018) Unit!13975)

(assert (=> d!67077 (= lt!308753 (choose!11 lt!308184))))

(assert (=> d!67077 (= (lemmaIsPrefixRefl!0 lt!308184) lt!308753)))

(declare-fun bs!16627 () Bool)

(assert (= bs!16627 d!67077))

(assert (=> bs!16627 m!305685))

(declare-fun m!306403 () Bool)

(assert (=> bs!16627 m!306403))

(assert (=> d!66807 d!67077))

(declare-fun d!67079 () Bool)

(assert (=> d!67079 (isPrefixOf!0 lt!308184 (_2!9189 lt!307379))))

(declare-fun lt!308754 () Unit!13975)

(assert (=> d!67079 (= lt!308754 (choose!30 lt!308184 (_2!9189 lt!307359) (_2!9189 lt!307379)))))

(assert (=> d!67079 (isPrefixOf!0 lt!308184 (_2!9189 lt!307359))))

(assert (=> d!67079 (= (lemmaIsPrefixTransitive!0 lt!308184 (_2!9189 lt!307359) (_2!9189 lt!307379)) lt!308754)))

(declare-fun bs!16628 () Bool)

(assert (= bs!16628 d!67079))

(assert (=> bs!16628 m!305691))

(declare-fun m!306405 () Bool)

(assert (=> bs!16628 m!306405))

(declare-fun m!306407 () Bool)

(assert (=> bs!16628 m!306407))

(assert (=> d!66807 d!67079))

(declare-fun d!67081 () Bool)

(declare-fun res!165803 () Bool)

(declare-fun e!135992 () Bool)

(assert (=> d!67081 (=> (not res!165803) (not e!135992))))

(assert (=> d!67081 (= res!165803 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(assert (=> d!67081 (= (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!307359)) e!135992)))

(declare-fun b!198088 () Bool)

(declare-fun res!165804 () Bool)

(assert (=> b!198088 (=> (not res!165804) (not e!135992))))

(assert (=> b!198088 (= res!165804 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(declare-fun b!198089 () Bool)

(declare-fun e!135991 () Bool)

(assert (=> b!198089 (= e!135992 e!135991)))

(declare-fun res!165805 () Bool)

(assert (=> b!198089 (=> res!165805 e!135991)))

(assert (=> b!198089 (= res!165805 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) #b00000000000000000000000000000000))))

(declare-fun b!198090 () Bool)

(assert (=> b!198090 (= e!135991 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!307359)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (= (and d!67081 res!165803) b!198088))

(assert (= (and b!198088 res!165804) b!198089))

(assert (= (and b!198089 (not res!165805)) b!198090))

(assert (=> b!198088 m!305115))

(assert (=> b!198088 m!305115))

(assert (=> b!198090 m!305115))

(assert (=> b!198090 m!305115))

(declare-fun m!306409 () Bool)

(assert (=> b!198090 m!306409))

(assert (=> d!66807 d!67081))

(declare-fun d!67083 () Bool)

(assert (=> d!67083 (isPrefixOf!0 lt!308184 (_2!9189 lt!307379))))

(declare-fun lt!308755 () Unit!13975)

(assert (=> d!67083 (= lt!308755 (choose!30 lt!308184 (_2!9189 lt!307379) (_2!9189 lt!307379)))))

(assert (=> d!67083 (isPrefixOf!0 lt!308184 (_2!9189 lt!307379))))

(assert (=> d!67083 (= (lemmaIsPrefixTransitive!0 lt!308184 (_2!9189 lt!307379) (_2!9189 lt!307379)) lt!308755)))

(declare-fun bs!16629 () Bool)

(assert (= bs!16629 d!67083))

(assert (=> bs!16629 m!305691))

(declare-fun m!306411 () Bool)

(assert (=> bs!16629 m!306411))

(assert (=> bs!16629 m!305691))

(assert (=> d!66807 d!67083))

(declare-fun d!67085 () Bool)

(declare-fun res!165806 () Bool)

(declare-fun e!135994 () Bool)

(assert (=> d!67085 (=> (not res!165806) (not e!135994))))

(assert (=> d!67085 (= res!165806 (= (size!4455 (buf!4941 lt!308184)) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (=> d!67085 (= (isPrefixOf!0 lt!308184 (_2!9189 lt!307379)) e!135994)))

(declare-fun b!198091 () Bool)

(declare-fun res!165807 () Bool)

(assert (=> b!198091 (=> (not res!165807) (not e!135994))))

(assert (=> b!198091 (= res!165807 (bvsle (bitIndex!0 (size!4455 (buf!4941 lt!308184)) (currentByte!9279 lt!308184) (currentBit!9274 lt!308184)) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379)))))))

(declare-fun b!198092 () Bool)

(declare-fun e!135993 () Bool)

(assert (=> b!198092 (= e!135994 e!135993)))

(declare-fun res!165808 () Bool)

(assert (=> b!198092 (=> res!165808 e!135993)))

(assert (=> b!198092 (= res!165808 (= (size!4455 (buf!4941 lt!308184)) #b00000000000000000000000000000000))))

(declare-fun b!198093 () Bool)

(assert (=> b!198093 (= e!135993 (arrayBitRangesEq!0 (buf!4941 lt!308184) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 lt!308184)) (currentByte!9279 lt!308184) (currentBit!9274 lt!308184))))))

(assert (= (and d!67085 res!165806) b!198091))

(assert (= (and b!198091 res!165807) b!198092))

(assert (= (and b!198092 (not res!165808)) b!198093))

(declare-fun m!306413 () Bool)

(assert (=> b!198091 m!306413))

(assert (=> b!198091 m!305121))

(assert (=> b!198093 m!306413))

(assert (=> b!198093 m!306413))

(declare-fun m!306415 () Bool)

(assert (=> b!198093 m!306415))

(assert (=> d!66807 d!67085))

(declare-fun d!67087 () Bool)

(declare-fun res!165809 () Bool)

(declare-fun e!135996 () Bool)

(assert (=> d!67087 (=> (not res!165809) (not e!135996))))

(assert (=> d!67087 (= res!165809 (= (size!4455 (buf!4941 (_1!9191 lt!308180))) (size!4455 (buf!4941 (_2!9191 lt!308180)))))))

(assert (=> d!67087 (= (isPrefixOf!0 (_1!9191 lt!308180) (_2!9191 lt!308180)) e!135996)))

(declare-fun b!198094 () Bool)

(declare-fun res!165810 () Bool)

(assert (=> b!198094 (=> (not res!165810) (not e!135996))))

(assert (=> b!198094 (= res!165810 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308180))) (currentByte!9279 (_1!9191 lt!308180)) (currentBit!9274 (_1!9191 lt!308180))) (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308180))) (currentByte!9279 (_2!9191 lt!308180)) (currentBit!9274 (_2!9191 lt!308180)))))))

(declare-fun b!198095 () Bool)

(declare-fun e!135995 () Bool)

(assert (=> b!198095 (= e!135996 e!135995)))

(declare-fun res!165811 () Bool)

(assert (=> b!198095 (=> res!165811 e!135995)))

(assert (=> b!198095 (= res!165811 (= (size!4455 (buf!4941 (_1!9191 lt!308180))) #b00000000000000000000000000000000))))

(declare-fun b!198096 () Bool)

(assert (=> b!198096 (= e!135995 (arrayBitRangesEq!0 (buf!4941 (_1!9191 lt!308180)) (buf!4941 (_2!9191 lt!308180)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308180))) (currentByte!9279 (_1!9191 lt!308180)) (currentBit!9274 (_1!9191 lt!308180)))))))

(assert (= (and d!67087 res!165809) b!198094))

(assert (= (and b!198094 res!165810) b!198095))

(assert (= (and b!198095 (not res!165811)) b!198096))

(declare-fun m!306417 () Bool)

(assert (=> b!198094 m!306417))

(declare-fun m!306419 () Bool)

(assert (=> b!198094 m!306419))

(assert (=> b!198096 m!306417))

(assert (=> b!198096 m!306417))

(declare-fun m!306421 () Bool)

(assert (=> b!198096 m!306421))

(assert (=> d!66807 d!67087))

(declare-fun d!67089 () Bool)

(assert (=> d!67089 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!307359))))

(declare-fun lt!308756 () Unit!13975)

(assert (=> d!67089 (= lt!308756 (choose!11 (_2!9189 lt!307359)))))

(assert (=> d!67089 (= (lemmaIsPrefixRefl!0 (_2!9189 lt!307359)) lt!308756)))

(declare-fun bs!16630 () Bool)

(assert (= bs!16630 d!67089))

(assert (=> bs!16630 m!305689))

(declare-fun m!306423 () Bool)

(assert (=> bs!16630 m!306423))

(assert (=> d!66807 d!67089))

(declare-fun d!67091 () Bool)

(declare-fun res!165812 () Bool)

(declare-fun e!135998 () Bool)

(assert (=> d!67091 (=> (not res!165812) (not e!135998))))

(assert (=> d!67091 (= res!165812 (= (size!4455 (buf!4941 lt!308184)) (size!4455 (buf!4941 lt!308184))))))

(assert (=> d!67091 (= (isPrefixOf!0 lt!308184 lt!308184) e!135998)))

(declare-fun b!198097 () Bool)

(declare-fun res!165813 () Bool)

(assert (=> b!198097 (=> (not res!165813) (not e!135998))))

(assert (=> b!198097 (= res!165813 (bvsle (bitIndex!0 (size!4455 (buf!4941 lt!308184)) (currentByte!9279 lt!308184) (currentBit!9274 lt!308184)) (bitIndex!0 (size!4455 (buf!4941 lt!308184)) (currentByte!9279 lt!308184) (currentBit!9274 lt!308184))))))

(declare-fun b!198098 () Bool)

(declare-fun e!135997 () Bool)

(assert (=> b!198098 (= e!135998 e!135997)))

(declare-fun res!165814 () Bool)

(assert (=> b!198098 (=> res!165814 e!135997)))

(assert (=> b!198098 (= res!165814 (= (size!4455 (buf!4941 lt!308184)) #b00000000000000000000000000000000))))

(declare-fun b!198099 () Bool)

(assert (=> b!198099 (= e!135997 (arrayBitRangesEq!0 (buf!4941 lt!308184) (buf!4941 lt!308184) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 lt!308184)) (currentByte!9279 lt!308184) (currentBit!9274 lt!308184))))))

(assert (= (and d!67091 res!165812) b!198097))

(assert (= (and b!198097 res!165813) b!198098))

(assert (= (and b!198098 (not res!165814)) b!198099))

(assert (=> b!198097 m!306413))

(assert (=> b!198097 m!306413))

(assert (=> b!198099 m!306413))

(assert (=> b!198099 m!306413))

(declare-fun m!306425 () Bool)

(assert (=> b!198099 m!306425))

(assert (=> d!66807 d!67091))

(assert (=> d!66807 d!66845))

(declare-fun d!67093 () Bool)

(declare-fun res!165815 () Bool)

(declare-fun e!136000 () Bool)

(assert (=> d!67093 (=> (not res!165815) (not e!136000))))

(assert (=> d!67093 (= res!165815 (= (size!4455 (buf!4941 (_2!9189 lt!307379))) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (=> d!67093 (= (isPrefixOf!0 (_2!9189 lt!307379) (_2!9189 lt!307379)) e!136000)))

(declare-fun b!198100 () Bool)

(declare-fun res!165816 () Bool)

(assert (=> b!198100 (=> (not res!165816) (not e!136000))))

(assert (=> b!198100 (= res!165816 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379)))))))

(declare-fun b!198101 () Bool)

(declare-fun e!135999 () Bool)

(assert (=> b!198101 (= e!136000 e!135999)))

(declare-fun res!165817 () Bool)

(assert (=> b!198101 (=> res!165817 e!135999)))

(assert (=> b!198101 (= res!165817 (= (size!4455 (buf!4941 (_2!9189 lt!307379))) #b00000000000000000000000000000000))))

(declare-fun b!198102 () Bool)

(assert (=> b!198102 (= e!135999 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307379)) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379)))))))

(assert (= (and d!67093 res!165815) b!198100))

(assert (= (and b!198100 res!165816) b!198101))

(assert (= (and b!198101 (not res!165817)) b!198102))

(assert (=> b!198100 m!305121))

(assert (=> b!198100 m!305121))

(assert (=> b!198102 m!305121))

(assert (=> b!198102 m!305121))

(declare-fun m!306427 () Bool)

(assert (=> b!198102 m!306427))

(assert (=> d!66807 d!67093))

(declare-fun d!67095 () Bool)

(assert (=> d!67095 (isPrefixOf!0 (_2!9189 lt!307379) (_2!9189 lt!307379))))

(declare-fun lt!308757 () Unit!13975)

(assert (=> d!67095 (= lt!308757 (choose!11 (_2!9189 lt!307379)))))

(assert (=> d!67095 (= (lemmaIsPrefixRefl!0 (_2!9189 lt!307379)) lt!308757)))

(declare-fun bs!16631 () Bool)

(assert (= bs!16631 d!67095))

(assert (=> bs!16631 m!305655))

(declare-fun m!306429 () Bool)

(assert (=> bs!16631 m!306429))

(assert (=> d!66807 d!67095))

(declare-fun d!67097 () Bool)

(declare-fun e!136001 () Bool)

(assert (=> d!67097 e!136001))

(declare-fun res!165818 () Bool)

(assert (=> d!67097 (=> (not res!165818) (not e!136001))))

(declare-fun lt!308760 () (_ BitVec 64))

(declare-fun lt!308761 () (_ BitVec 64))

(declare-fun lt!308762 () (_ BitVec 64))

(assert (=> d!67097 (= res!165818 (= lt!308760 (bvsub lt!308761 lt!308762)))))

(assert (=> d!67097 (or (= (bvand lt!308761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308761 lt!308762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67097 (= lt!308762 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308091)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308091))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308091)))))))

(declare-fun lt!308763 () (_ BitVec 64))

(declare-fun lt!308759 () (_ BitVec 64))

(assert (=> d!67097 (= lt!308761 (bvmul lt!308763 lt!308759))))

(assert (=> d!67097 (or (= lt!308763 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308759 (bvsdiv (bvmul lt!308763 lt!308759) lt!308763)))))

(assert (=> d!67097 (= lt!308759 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67097 (= lt!308763 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308091)))))))

(assert (=> d!67097 (= lt!308760 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308091))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308091)))))))

(assert (=> d!67097 (invariant!0 (currentBit!9274 (_2!9189 lt!308091)) (currentByte!9279 (_2!9189 lt!308091)) (size!4455 (buf!4941 (_2!9189 lt!308091))))))

(assert (=> d!67097 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308091))) (currentByte!9279 (_2!9189 lt!308091)) (currentBit!9274 (_2!9189 lt!308091))) lt!308760)))

(declare-fun b!198103 () Bool)

(declare-fun res!165819 () Bool)

(assert (=> b!198103 (=> (not res!165819) (not e!136001))))

(assert (=> b!198103 (= res!165819 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308760))))

(declare-fun b!198104 () Bool)

(declare-fun lt!308758 () (_ BitVec 64))

(assert (=> b!198104 (= e!136001 (bvsle lt!308760 (bvmul lt!308758 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198104 (or (= lt!308758 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308758 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308758)))))

(assert (=> b!198104 (= lt!308758 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308091)))))))

(assert (= (and d!67097 res!165818) b!198103))

(assert (= (and b!198103 res!165819) b!198104))

(declare-fun m!306431 () Bool)

(assert (=> d!67097 m!306431))

(declare-fun m!306433 () Bool)

(assert (=> d!67097 m!306433))

(assert (=> b!197760 d!67097))

(assert (=> b!197760 d!66677))

(declare-fun b!198119 () Bool)

(declare-fun res!165830 () Bool)

(declare-fun e!136010 () Bool)

(assert (=> b!198119 (=> (not res!165830) (not e!136010))))

(declare-fun lt!308780 () tuple2!17106)

(assert (=> b!198119 (= res!165830 (= (bvand (_1!9198 lt!308780) (onesLSBLong!0 nBits!348)) (_1!9198 lt!308780)))))

(declare-fun b!198120 () Bool)

(declare-fun res!165834 () Bool)

(assert (=> b!198120 (=> (not res!165834) (not e!136010))))

(assert (=> b!198120 (= res!165834 (= (bvand (_1!9198 lt!308780) (onesLSBLong!0 i!590)) (bvand lt!307362 (onesLSBLong!0 i!590))))))

(declare-fun b!198121 () Bool)

(declare-fun e!136008 () tuple2!17106)

(assert (=> b!198121 (= e!136008 (tuple2!17107 lt!307362 (_1!9191 lt!307378)))))

(declare-fun b!198122 () Bool)

(declare-fun lt!308778 () tuple2!17106)

(assert (=> b!198122 (= e!136008 (tuple2!17107 (_1!9198 lt!308778) (_2!9198 lt!308778)))))

(declare-fun lt!308777 () tuple2!17104)

(assert (=> b!198122 (= lt!308777 (readBit!0 (_1!9191 lt!307378)))))

(assert (=> b!198122 (= lt!308778 (readNBitsLSBFirstsLoop!0 (_2!9197 lt!308777) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!307362 (ite (_1!9197 lt!308777) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!198123 () Bool)

(declare-fun lt!308779 () (_ BitVec 64))

(declare-fun e!136009 () Bool)

(assert (=> b!198123 (= e!136009 (= (= (bvand (bvlshr (_1!9198 lt!308780) lt!308779) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9190 (readBitPure!0 (_1!9191 lt!307378)))))))

(assert (=> b!198123 (and (bvsge lt!308779 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!308779 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!198123 (= lt!308779 ((_ sign_extend 32) i!590))))

(declare-fun b!198124 () Bool)

(declare-fun res!165833 () Bool)

(assert (=> b!198124 (=> (not res!165833) (not e!136010))))

(declare-fun lt!308781 () (_ BitVec 64))

(declare-fun lt!308776 () (_ BitVec 64))

(assert (=> b!198124 (= res!165833 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9198 lt!308780))) (currentByte!9279 (_2!9198 lt!308780)) (currentBit!9274 (_2!9198 lt!308780))) (bvadd lt!308776 lt!308781)))))

(assert (=> b!198124 (or (not (= (bvand lt!308776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308781 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308776 lt!308781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198124 (= lt!308781 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!198124 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!198124 (= lt!308776 (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!307378))) (currentByte!9279 (_1!9191 lt!307378)) (currentBit!9274 (_1!9191 lt!307378))))))

(declare-fun b!198125 () Bool)

(assert (=> b!198125 (= e!136010 e!136009)))

(declare-fun res!165832 () Bool)

(assert (=> b!198125 (=> res!165832 e!136009)))

(assert (=> b!198125 (= res!165832 (not (bvslt i!590 nBits!348)))))

(declare-fun d!67099 () Bool)

(assert (=> d!67099 e!136010))

(declare-fun res!165831 () Bool)

(assert (=> d!67099 (=> (not res!165831) (not e!136010))))

(assert (=> d!67099 (= res!165831 (= (buf!4941 (_2!9198 lt!308780)) (buf!4941 (_1!9191 lt!307378))))))

(assert (=> d!67099 (= lt!308780 e!136008)))

(declare-fun c!9860 () Bool)

(assert (=> d!67099 (= c!9860 (= nBits!348 i!590))))

(assert (=> d!67099 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67099 (= (readNBitsLSBFirstsLoop!0 (_1!9191 lt!307378) nBits!348 i!590 lt!307362) lt!308780)))

(assert (= (and d!67099 c!9860) b!198121))

(assert (= (and d!67099 (not c!9860)) b!198122))

(assert (= (and d!67099 res!165831) b!198124))

(assert (= (and b!198124 res!165833) b!198120))

(assert (= (and b!198120 res!165834) b!198119))

(assert (= (and b!198119 res!165830) b!198125))

(assert (= (and b!198125 (not res!165832)) b!198123))

(assert (=> b!198120 m!305149))

(declare-fun m!306435 () Bool)

(assert (=> b!198124 m!306435))

(declare-fun m!306437 () Bool)

(assert (=> b!198124 m!306437))

(assert (=> b!198123 m!305157))

(assert (=> b!198122 m!305681))

(declare-fun m!306439 () Bool)

(assert (=> b!198122 m!306439))

(assert (=> b!198119 m!305591))

(assert (=> d!66821 d!67099))

(declare-fun d!67101 () Bool)

(declare-fun res!165835 () Bool)

(declare-fun e!136012 () Bool)

(assert (=> d!67101 (=> (not res!165835) (not e!136012))))

(assert (=> d!67101 (= res!165835 (= (size!4455 (buf!4941 (_1!9191 lt!308157))) (size!4455 (buf!4941 thiss!1204))))))

(assert (=> d!67101 (= (isPrefixOf!0 (_1!9191 lt!308157) thiss!1204) e!136012)))

(declare-fun b!198126 () Bool)

(declare-fun res!165836 () Bool)

(assert (=> b!198126 (=> (not res!165836) (not e!136012))))

(assert (=> b!198126 (= res!165836 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308157))) (currentByte!9279 (_1!9191 lt!308157)) (currentBit!9274 (_1!9191 lt!308157))) (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(declare-fun b!198127 () Bool)

(declare-fun e!136011 () Bool)

(assert (=> b!198127 (= e!136012 e!136011)))

(declare-fun res!165837 () Bool)

(assert (=> b!198127 (=> res!165837 e!136011)))

(assert (=> b!198127 (= res!165837 (= (size!4455 (buf!4941 (_1!9191 lt!308157))) #b00000000000000000000000000000000))))

(declare-fun b!198128 () Bool)

(assert (=> b!198128 (= e!136011 (arrayBitRangesEq!0 (buf!4941 (_1!9191 lt!308157)) (buf!4941 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308157))) (currentByte!9279 (_1!9191 lt!308157)) (currentBit!9274 (_1!9191 lt!308157)))))))

(assert (= (and d!67101 res!165835) b!198126))

(assert (= (and b!198126 res!165836) b!198127))

(assert (= (and b!198127 (not res!165837)) b!198128))

(declare-fun m!306441 () Bool)

(assert (=> b!198126 m!306441))

(assert (=> b!198126 m!305117))

(assert (=> b!198128 m!306441))

(assert (=> b!198128 m!306441))

(declare-fun m!306443 () Bool)

(assert (=> b!198128 m!306443))

(assert (=> b!197785 d!67101))

(declare-fun d!67103 () Bool)

(declare-fun lt!308782 () tuple2!17104)

(assert (=> d!67103 (= lt!308782 (readBit!0 (readerFrom!0 (_2!9189 lt!307471) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))))

(assert (=> d!67103 (= (readBitPure!0 (readerFrom!0 (_2!9189 lt!307471) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))) (tuple2!17091 (_2!9197 lt!308782) (_1!9197 lt!308782)))))

(declare-fun bs!16632 () Bool)

(assert (= bs!16632 d!67103))

(assert (=> bs!16632 m!305229))

(declare-fun m!306445 () Bool)

(assert (=> bs!16632 m!306445))

(assert (=> b!197573 d!67103))

(declare-fun d!67105 () Bool)

(declare-fun e!136013 () Bool)

(assert (=> d!67105 e!136013))

(declare-fun res!165838 () Bool)

(assert (=> d!67105 (=> (not res!165838) (not e!136013))))

(assert (=> d!67105 (= res!165838 (invariant!0 (currentBit!9274 (_2!9189 lt!307471)) (currentByte!9279 (_2!9189 lt!307471)) (size!4455 (buf!4941 (_2!9189 lt!307471)))))))

(assert (=> d!67105 (= (readerFrom!0 (_2!9189 lt!307471) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)) (BitStream!8019 (buf!4941 (_2!9189 lt!307471)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))

(declare-fun b!198129 () Bool)

(assert (=> b!198129 (= e!136013 (invariant!0 (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204) (size!4455 (buf!4941 (_2!9189 lt!307471)))))))

(assert (= (and d!67105 res!165838) b!198129))

(declare-fun m!306447 () Bool)

(assert (=> d!67105 m!306447))

(declare-fun m!306449 () Bool)

(assert (=> b!198129 m!306449))

(assert (=> b!197573 d!67105))

(declare-fun d!67107 () Bool)

(assert (=> d!67107 (= (invariant!0 (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!307359)))) (and (bvsge (currentBit!9274 (_2!9189 lt!307359)) #b00000000000000000000000000000000) (bvslt (currentBit!9274 (_2!9189 lt!307359)) #b00000000000000000000000000001000) (bvsge (currentByte!9279 (_2!9189 lt!307359)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!307359)))) (and (= (currentBit!9274 (_2!9189 lt!307359)) #b00000000000000000000000000000000) (= (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!307359))))))))))

(assert (=> d!66837 d!67107))

(assert (=> d!66809 d!66815))

(declare-fun d!67109 () Bool)

(declare-fun e!136014 () Bool)

(assert (=> d!67109 e!136014))

(declare-fun res!165839 () Bool)

(assert (=> d!67109 (=> (not res!165839) (not e!136014))))

(declare-fun lt!308787 () (_ BitVec 64))

(declare-fun lt!308785 () (_ BitVec 64))

(declare-fun lt!308786 () (_ BitVec 64))

(assert (=> d!67109 (= res!165839 (= lt!308785 (bvsub lt!308786 lt!308787)))))

(assert (=> d!67109 (or (= (bvand lt!308786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308786 lt!308787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67109 (= lt!308787 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308200)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308200))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308200)))))))

(declare-fun lt!308788 () (_ BitVec 64))

(declare-fun lt!308784 () (_ BitVec 64))

(assert (=> d!67109 (= lt!308786 (bvmul lt!308788 lt!308784))))

(assert (=> d!67109 (or (= lt!308788 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308784 (bvsdiv (bvmul lt!308788 lt!308784) lt!308788)))))

(assert (=> d!67109 (= lt!308784 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67109 (= lt!308788 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308200)))))))

(assert (=> d!67109 (= lt!308785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308200))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308200)))))))

(assert (=> d!67109 (invariant!0 (currentBit!9274 (_1!9190 lt!308200)) (currentByte!9279 (_1!9190 lt!308200)) (size!4455 (buf!4941 (_1!9190 lt!308200))))))

(assert (=> d!67109 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308200))) (currentByte!9279 (_1!9190 lt!308200)) (currentBit!9274 (_1!9190 lt!308200))) lt!308785)))

(declare-fun b!198130 () Bool)

(declare-fun res!165840 () Bool)

(assert (=> b!198130 (=> (not res!165840) (not e!136014))))

(assert (=> b!198130 (= res!165840 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308785))))

(declare-fun b!198131 () Bool)

(declare-fun lt!308783 () (_ BitVec 64))

(assert (=> b!198131 (= e!136014 (bvsle lt!308785 (bvmul lt!308783 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198131 (or (= lt!308783 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308783 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308783)))))

(assert (=> b!198131 (= lt!308783 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308200)))))))

(assert (= (and d!67109 res!165839) b!198130))

(assert (= (and b!198130 res!165840) b!198131))

(declare-fun m!306451 () Bool)

(assert (=> d!67109 m!306451))

(declare-fun m!306453 () Bool)

(assert (=> d!67109 m!306453))

(assert (=> d!66809 d!67109))

(declare-fun d!67111 () Bool)

(declare-fun e!136017 () Bool)

(assert (=> d!67111 e!136017))

(declare-fun res!165843 () Bool)

(assert (=> d!67111 (=> (not res!165843) (not e!136017))))

(declare-fun lt!308797 () tuple2!17090)

(declare-fun lt!308796 () tuple2!17090)

(assert (=> d!67111 (= res!165843 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308797))) (currentByte!9279 (_1!9190 lt!308797)) (currentBit!9274 (_1!9190 lt!308797))) (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308796))) (currentByte!9279 (_1!9190 lt!308796)) (currentBit!9274 (_1!9190 lt!308796)))))))

(declare-fun lt!308795 () BitStream!8018)

(assert (=> d!67111 (= lt!308796 (readBitPure!0 lt!308795))))

(assert (=> d!67111 (= lt!308797 (readBitPure!0 lt!307376))))

(assert (=> d!67111 (= lt!308795 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 lt!307376) (currentBit!9274 lt!307376)))))

(assert (=> d!67111 (invariant!0 (currentBit!9274 lt!307376) (currentByte!9279 lt!307376) (size!4455 (buf!4941 (_2!9189 lt!307379))))))

(assert (=> d!67111 true))

(declare-fun _$9!72 () Unit!13975)

(assert (=> d!67111 (= (choose!50 lt!307376 (_2!9189 lt!307379) lt!308198 lt!308200 (tuple2!17091 (_1!9190 lt!308200) (_2!9190 lt!308200)) (_1!9190 lt!308200) (_2!9190 lt!308200) lt!308197 (tuple2!17091 (_1!9190 lt!308197) (_2!9190 lt!308197)) (_1!9190 lt!308197) (_2!9190 lt!308197)) _$9!72)))

(declare-fun b!198134 () Bool)

(assert (=> b!198134 (= e!136017 (= (_2!9190 lt!308797) (_2!9190 lt!308796)))))

(assert (= (and d!67111 res!165843) b!198134))

(declare-fun m!306455 () Bool)

(assert (=> d!67111 m!306455))

(assert (=> d!67111 m!305711))

(assert (=> d!67111 m!305141))

(declare-fun m!306457 () Bool)

(assert (=> d!67111 m!306457))

(declare-fun m!306459 () Bool)

(assert (=> d!67111 m!306459))

(assert (=> d!66809 d!67111))

(declare-fun d!67113 () Bool)

(declare-fun lt!308798 () tuple2!17104)

(assert (=> d!67113 (= lt!308798 (readBit!0 lt!308198))))

(assert (=> d!67113 (= (readBitPure!0 lt!308198) (tuple2!17091 (_2!9197 lt!308798) (_1!9197 lt!308798)))))

(declare-fun bs!16633 () Bool)

(assert (= bs!16633 d!67113))

(declare-fun m!306461 () Bool)

(assert (=> bs!16633 m!306461))

(assert (=> d!66809 d!67113))

(declare-fun d!67115 () Bool)

(declare-fun e!136018 () Bool)

(assert (=> d!67115 e!136018))

(declare-fun res!165844 () Bool)

(assert (=> d!67115 (=> (not res!165844) (not e!136018))))

(declare-fun lt!308802 () (_ BitVec 64))

(declare-fun lt!308803 () (_ BitVec 64))

(declare-fun lt!308801 () (_ BitVec 64))

(assert (=> d!67115 (= res!165844 (= lt!308801 (bvsub lt!308802 lt!308803)))))

(assert (=> d!67115 (or (= (bvand lt!308802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308803 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308802 lt!308803) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67115 (= lt!308803 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308197)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308197))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308197)))))))

(declare-fun lt!308804 () (_ BitVec 64))

(declare-fun lt!308800 () (_ BitVec 64))

(assert (=> d!67115 (= lt!308802 (bvmul lt!308804 lt!308800))))

(assert (=> d!67115 (or (= lt!308804 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308800 (bvsdiv (bvmul lt!308804 lt!308800) lt!308804)))))

(assert (=> d!67115 (= lt!308800 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67115 (= lt!308804 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308197)))))))

(assert (=> d!67115 (= lt!308801 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308197))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308197)))))))

(assert (=> d!67115 (invariant!0 (currentBit!9274 (_1!9190 lt!308197)) (currentByte!9279 (_1!9190 lt!308197)) (size!4455 (buf!4941 (_1!9190 lt!308197))))))

(assert (=> d!67115 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308197))) (currentByte!9279 (_1!9190 lt!308197)) (currentBit!9274 (_1!9190 lt!308197))) lt!308801)))

(declare-fun b!198135 () Bool)

(declare-fun res!165845 () Bool)

(assert (=> b!198135 (=> (not res!165845) (not e!136018))))

(assert (=> b!198135 (= res!165845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308801))))

(declare-fun b!198136 () Bool)

(declare-fun lt!308799 () (_ BitVec 64))

(assert (=> b!198136 (= e!136018 (bvsle lt!308801 (bvmul lt!308799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198136 (or (= lt!308799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308799)))))

(assert (=> b!198136 (= lt!308799 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308197)))))))

(assert (= (and d!67115 res!165844) b!198135))

(assert (= (and b!198135 res!165845) b!198136))

(declare-fun m!306463 () Bool)

(assert (=> d!67115 m!306463))

(declare-fun m!306465 () Bool)

(assert (=> d!67115 m!306465))

(assert (=> d!66809 d!67115))

(declare-fun d!67117 () Bool)

(assert (=> d!67117 (= (invariant!0 (currentBit!9274 lt!307376) (currentByte!9279 lt!307376) (size!4455 (buf!4941 (_2!9189 lt!307379)))) (and (bvsge (currentBit!9274 lt!307376) #b00000000000000000000000000000000) (bvslt (currentBit!9274 lt!307376) #b00000000000000000000000000001000) (bvsge (currentByte!9279 lt!307376) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 lt!307376) (size!4455 (buf!4941 (_2!9189 lt!307379)))) (and (= (currentBit!9274 lt!307376) #b00000000000000000000000000000000) (= (currentByte!9279 lt!307376) (size!4455 (buf!4941 (_2!9189 lt!307379))))))))))

(assert (=> d!66809 d!67117))

(declare-fun b!198137 () Bool)

(declare-fun res!165846 () Bool)

(declare-fun e!136021 () Bool)

(assert (=> b!198137 (=> (not res!165846) (not e!136021))))

(declare-fun lt!308809 () tuple2!17106)

(assert (=> b!198137 (= res!165846 (= (bvand (_1!9198 lt!308809) (onesLSBLong!0 nBits!348)) (_1!9198 lt!308809)))))

(declare-fun b!198138 () Bool)

(declare-fun res!165850 () Bool)

(assert (=> b!198138 (=> (not res!165850) (not e!136021))))

(assert (=> b!198138 (= res!165850 (= (bvand (_1!9198 lt!308809) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand (bvor lt!307362 (ite (_2!9190 lt!307371) lt!307361 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!198139 () Bool)

(declare-fun e!136019 () tuple2!17106)

(assert (=> b!198139 (= e!136019 (tuple2!17107 (bvor lt!307362 (ite (_2!9190 lt!307371) lt!307361 #b0000000000000000000000000000000000000000000000000000000000000000)) (_1!9191 lt!307375)))))

(declare-fun b!198140 () Bool)

(declare-fun lt!308807 () tuple2!17106)

(assert (=> b!198140 (= e!136019 (tuple2!17107 (_1!9198 lt!308807) (_2!9198 lt!308807)))))

(declare-fun lt!308806 () tuple2!17104)

(assert (=> b!198140 (= lt!308806 (readBit!0 (_1!9191 lt!307375)))))

(assert (=> b!198140 (= lt!308807 (readNBitsLSBFirstsLoop!0 (_2!9197 lt!308806) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor (bvor lt!307362 (ite (_2!9190 lt!307371) lt!307361 #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!9197 lt!308806) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!136020 () Bool)

(declare-fun b!198141 () Bool)

(declare-fun lt!308808 () (_ BitVec 64))

(assert (=> b!198141 (= e!136020 (= (= (bvand (bvlshr (_1!9198 lt!308809) lt!308808) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9190 (readBitPure!0 (_1!9191 lt!307375)))))))

(assert (=> b!198141 (and (bvsge lt!308808 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!308808 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!198141 (= lt!308808 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!198142 () Bool)

(declare-fun res!165849 () Bool)

(assert (=> b!198142 (=> (not res!165849) (not e!136021))))

(declare-fun lt!308805 () (_ BitVec 64))

(declare-fun lt!308810 () (_ BitVec 64))

(assert (=> b!198142 (= res!165849 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9198 lt!308809))) (currentByte!9279 (_2!9198 lt!308809)) (currentBit!9274 (_2!9198 lt!308809))) (bvadd lt!308805 lt!308810)))))

(assert (=> b!198142 (or (not (= (bvand lt!308805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308810 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308805 lt!308810) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198142 (= lt!308810 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!198142 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!198142 (= lt!308805 (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!307375))) (currentByte!9279 (_1!9191 lt!307375)) (currentBit!9274 (_1!9191 lt!307375))))))

(declare-fun b!198143 () Bool)

(assert (=> b!198143 (= e!136021 e!136020)))

(declare-fun res!165848 () Bool)

(assert (=> b!198143 (=> res!165848 e!136020)))

(assert (=> b!198143 (= res!165848 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun d!67119 () Bool)

(assert (=> d!67119 e!136021))

(declare-fun res!165847 () Bool)

(assert (=> d!67119 (=> (not res!165847) (not e!136021))))

(assert (=> d!67119 (= res!165847 (= (buf!4941 (_2!9198 lt!308809)) (buf!4941 (_1!9191 lt!307375))))))

(assert (=> d!67119 (= lt!308809 e!136019)))

(declare-fun c!9861 () Bool)

(assert (=> d!67119 (= c!9861 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!67119 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67119 (= (readNBitsLSBFirstsLoop!0 (_1!9191 lt!307375) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307362 (ite (_2!9190 lt!307371) lt!307361 #b0000000000000000000000000000000000000000000000000000000000000000))) lt!308809)))

(assert (= (and d!67119 c!9861) b!198139))

(assert (= (and d!67119 (not c!9861)) b!198140))

(assert (= (and d!67119 res!165847) b!198142))

(assert (= (and b!198142 res!165849) b!198138))

(assert (= (and b!198138 res!165850) b!198137))

(assert (= (and b!198137 res!165846) b!198143))

(assert (= (and b!198143 (not res!165848)) b!198141))

(assert (=> b!198138 m!305597))

(declare-fun m!306467 () Bool)

(assert (=> b!198142 m!306467))

(declare-fun m!306469 () Bool)

(assert (=> b!198142 m!306469))

(declare-fun m!306471 () Bool)

(assert (=> b!198141 m!306471))

(declare-fun m!306473 () Bool)

(assert (=> b!198140 m!306473))

(declare-fun m!306475 () Bool)

(assert (=> b!198140 m!306475))

(assert (=> b!198137 m!305591))

(assert (=> d!66813 d!67119))

(declare-fun d!67121 () Bool)

(declare-fun e!136022 () Bool)

(assert (=> d!67121 e!136022))

(declare-fun res!165851 () Bool)

(assert (=> d!67121 (=> (not res!165851) (not e!136022))))

(declare-fun lt!308813 () (_ BitVec 64))

(declare-fun lt!308814 () (_ BitVec 64))

(declare-fun lt!308815 () (_ BitVec 64))

(assert (=> d!67121 (= res!165851 (= lt!308813 (bvsub lt!308814 lt!308815)))))

(assert (=> d!67121 (or (= (bvand lt!308814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308814 lt!308815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67121 (= lt!308815 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307471)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307471))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307471)))))))

(declare-fun lt!308816 () (_ BitVec 64))

(declare-fun lt!308812 () (_ BitVec 64))

(assert (=> d!67121 (= lt!308814 (bvmul lt!308816 lt!308812))))

(assert (=> d!67121 (or (= lt!308816 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308812 (bvsdiv (bvmul lt!308816 lt!308812) lt!308816)))))

(assert (=> d!67121 (= lt!308812 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67121 (= lt!308816 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307471)))))))

(assert (=> d!67121 (= lt!308813 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307471))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307471)))))))

(assert (=> d!67121 (invariant!0 (currentBit!9274 (_2!9189 lt!307471)) (currentByte!9279 (_2!9189 lt!307471)) (size!4455 (buf!4941 (_2!9189 lt!307471))))))

(assert (=> d!67121 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307471))) (currentByte!9279 (_2!9189 lt!307471)) (currentBit!9274 (_2!9189 lt!307471))) lt!308813)))

(declare-fun b!198144 () Bool)

(declare-fun res!165852 () Bool)

(assert (=> b!198144 (=> (not res!165852) (not e!136022))))

(assert (=> b!198144 (= res!165852 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308813))))

(declare-fun b!198145 () Bool)

(declare-fun lt!308811 () (_ BitVec 64))

(assert (=> b!198145 (= e!136022 (bvsle lt!308813 (bvmul lt!308811 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198145 (or (= lt!308811 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308811 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308811)))))

(assert (=> b!198145 (= lt!308811 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307471)))))))

(assert (= (and d!67121 res!165851) b!198144))

(assert (= (and b!198144 res!165852) b!198145))

(declare-fun m!306477 () Bool)

(assert (=> d!67121 m!306477))

(assert (=> d!67121 m!306447))

(assert (=> b!197571 d!67121))

(assert (=> b!197571 d!66681))

(declare-fun d!67123 () Bool)

(assert (=> d!67123 (= (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307379))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307379)))) (bvsub (bvmul ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307379))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307379))))))))

(assert (=> d!66685 d!67123))

(assert (=> d!66685 d!66839))

(declare-fun d!67125 () Bool)

(assert (=> d!67125 (= (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 thiss!1204)))))))

(assert (=> d!66665 d!67125))

(declare-fun d!67127 () Bool)

(assert (=> d!67127 (= (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307358)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307358))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307358)))) (bvsub (bvmul ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307358)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307358))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307358))))))))

(assert (=> d!66825 d!67127))

(declare-fun d!67129 () Bool)

(assert (=> d!67129 (= (invariant!0 (currentBit!9274 (_1!9190 lt!307358)) (currentByte!9279 (_1!9190 lt!307358)) (size!4455 (buf!4941 (_1!9190 lt!307358)))) (and (bvsge (currentBit!9274 (_1!9190 lt!307358)) #b00000000000000000000000000000000) (bvslt (currentBit!9274 (_1!9190 lt!307358)) #b00000000000000000000000000001000) (bvsge (currentByte!9279 (_1!9190 lt!307358)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 (_1!9190 lt!307358)) (size!4455 (buf!4941 (_1!9190 lt!307358)))) (and (= (currentBit!9274 (_1!9190 lt!307358)) #b00000000000000000000000000000000) (= (currentByte!9279 (_1!9190 lt!307358)) (size!4455 (buf!4941 (_1!9190 lt!307358))))))))))

(assert (=> d!66825 d!67129))

(declare-fun d!67131 () Bool)

(declare-fun e!136023 () Bool)

(assert (=> d!67131 e!136023))

(declare-fun res!165853 () Bool)

(assert (=> d!67131 (=> (not res!165853) (not e!136023))))

(declare-fun lt!308820 () tuple2!17090)

(declare-fun lt!308817 () tuple2!17090)

(assert (=> d!67131 (= res!165853 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308820))) (currentByte!9279 (_1!9190 lt!308820)) (currentBit!9274 (_1!9190 lt!308820))) (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308817))) (currentByte!9279 (_1!9190 lt!308817)) (currentBit!9274 (_1!9190 lt!308817)))))))

(declare-fun lt!308819 () Unit!13975)

(declare-fun lt!308818 () BitStream!8018)

(assert (=> d!67131 (= lt!308819 (choose!50 lt!308076 (_2!9189 lt!308063) lt!308818 lt!308820 (tuple2!17091 (_1!9190 lt!308820) (_2!9190 lt!308820)) (_1!9190 lt!308820) (_2!9190 lt!308820) lt!308817 (tuple2!17091 (_1!9190 lt!308817) (_2!9190 lt!308817)) (_1!9190 lt!308817) (_2!9190 lt!308817)))))

(assert (=> d!67131 (= lt!308817 (readBitPure!0 lt!308818))))

(assert (=> d!67131 (= lt!308820 (readBitPure!0 lt!308076))))

(assert (=> d!67131 (= lt!308818 (BitStream!8019 (buf!4941 (_2!9189 lt!308063)) (currentByte!9279 lt!308076) (currentBit!9274 lt!308076)))))

(assert (=> d!67131 (invariant!0 (currentBit!9274 lt!308076) (currentByte!9279 lt!308076) (size!4455 (buf!4941 (_2!9189 lt!308063))))))

(assert (=> d!67131 (= (readBitPrefixLemma!0 lt!308076 (_2!9189 lt!308063)) lt!308819)))

(declare-fun b!198146 () Bool)

(assert (=> b!198146 (= e!136023 (= (_2!9190 lt!308820) (_2!9190 lt!308817)))))

(assert (= (and d!67131 res!165853) b!198146))

(declare-fun m!306479 () Bool)

(assert (=> d!67131 m!306479))

(assert (=> d!67131 m!305615))

(declare-fun m!306481 () Bool)

(assert (=> d!67131 m!306481))

(assert (=> d!67131 m!305619))

(declare-fun m!306483 () Bool)

(assert (=> d!67131 m!306483))

(declare-fun m!306485 () Bool)

(assert (=> d!67131 m!306485))

(assert (=> b!197770 d!67131))

(declare-fun d!67133 () Bool)

(declare-fun lt!308821 () tuple2!17106)

(assert (=> d!67133 (= lt!308821 (readNBitsLSBFirstsLoop!0 (_1!9191 lt!308088) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308060 (ite (_2!9190 lt!308090) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!67133 (= (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308088) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308060 (ite (_2!9190 lt!308090) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17095 (_2!9198 lt!308821) (_1!9198 lt!308821)))))

(declare-fun bs!16634 () Bool)

(assert (= bs!16634 d!67133))

(declare-fun m!306487 () Bool)

(assert (=> bs!16634 m!306487))

(assert (=> b!197770 d!67133))

(declare-fun d!67135 () Bool)

(assert (=> d!67135 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!197770 d!67135))

(declare-fun d!67137 () Bool)

(declare-fun e!136024 () Bool)

(assert (=> d!67137 e!136024))

(declare-fun res!165854 () Bool)

(assert (=> d!67137 (=> (not res!165854) (not e!136024))))

(declare-fun lt!308825 () (_ BitVec 64))

(declare-fun lt!308824 () (_ BitVec 64))

(declare-fun lt!308826 () (_ BitVec 64))

(assert (=> d!67137 (= res!165854 (= lt!308824 (bvsub lt!308825 lt!308826)))))

(assert (=> d!67137 (or (= (bvand lt!308825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308826 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308825 lt!308826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67137 (= lt!308826 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308081)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308081))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308081)))))))

(declare-fun lt!308827 () (_ BitVec 64))

(declare-fun lt!308823 () (_ BitVec 64))

(assert (=> d!67137 (= lt!308825 (bvmul lt!308827 lt!308823))))

(assert (=> d!67137 (or (= lt!308827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308823 (bvsdiv (bvmul lt!308827 lt!308823) lt!308827)))))

(assert (=> d!67137 (= lt!308823 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67137 (= lt!308827 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308081)))))))

(assert (=> d!67137 (= lt!308824 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308081))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308081)))))))

(assert (=> d!67137 (invariant!0 (currentBit!9274 (_1!9190 lt!308081)) (currentByte!9279 (_1!9190 lt!308081)) (size!4455 (buf!4941 (_1!9190 lt!308081))))))

(assert (=> d!67137 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308081))) (currentByte!9279 (_1!9190 lt!308081)) (currentBit!9274 (_1!9190 lt!308081))) lt!308824)))

(declare-fun b!198147 () Bool)

(declare-fun res!165855 () Bool)

(assert (=> b!198147 (=> (not res!165855) (not e!136024))))

(assert (=> b!198147 (= res!165855 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308824))))

(declare-fun b!198148 () Bool)

(declare-fun lt!308822 () (_ BitVec 64))

(assert (=> b!198148 (= e!136024 (bvsle lt!308824 (bvmul lt!308822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198148 (or (= lt!308822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308822)))))

(assert (=> b!198148 (= lt!308822 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308081)))))))

(assert (= (and d!67137 res!165854) b!198147))

(assert (= (and b!198147 res!165855) b!198148))

(declare-fun m!306489 () Bool)

(assert (=> d!67137 m!306489))

(declare-fun m!306491 () Bool)

(assert (=> d!67137 m!306491))

(assert (=> b!197770 d!67137))

(declare-fun lt!308828 () tuple2!17106)

(declare-fun d!67139 () Bool)

(assert (=> d!67139 (= lt!308828 (readNBitsLSBFirstsLoop!0 (_1!9191 lt!308058) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!67139 (= (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308058) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17095 (_2!9198 lt!308828) (_1!9198 lt!308828)))))

(declare-fun bs!16635 () Bool)

(assert (= bs!16635 d!67139))

(declare-fun m!306493 () Bool)

(assert (=> bs!16635 m!306493))

(assert (=> b!197770 d!67139))

(declare-fun d!67141 () Bool)

(assert (=> d!67141 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308089) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))) lt!308089))))

(declare-fun bs!16636 () Bool)

(assert (= bs!16636 d!67141))

(declare-fun m!306495 () Bool)

(assert (=> bs!16636 m!306495))

(assert (=> b!197770 d!67141))

(declare-fun b!198149 () Bool)

(declare-fun res!165856 () Bool)

(declare-fun e!136026 () Bool)

(assert (=> b!198149 (=> (not res!165856) (not e!136026))))

(declare-fun lt!308840 () tuple2!17092)

(assert (=> b!198149 (= res!165856 (isPrefixOf!0 (_1!9191 lt!308840) (_2!9189 lt!307359)))))

(declare-fun d!67143 () Bool)

(assert (=> d!67143 e!136026))

(declare-fun res!165858 () Bool)

(assert (=> d!67143 (=> (not res!165858) (not e!136026))))

(assert (=> d!67143 (= res!165858 (isPrefixOf!0 (_1!9191 lt!308840) (_2!9191 lt!308840)))))

(declare-fun lt!308844 () BitStream!8018)

(assert (=> d!67143 (= lt!308840 (tuple2!17093 lt!308844 (_2!9189 lt!308063)))))

(declare-fun lt!308848 () Unit!13975)

(declare-fun lt!308830 () Unit!13975)

(assert (=> d!67143 (= lt!308848 lt!308830)))

(assert (=> d!67143 (isPrefixOf!0 lt!308844 (_2!9189 lt!308063))))

(assert (=> d!67143 (= lt!308830 (lemmaIsPrefixTransitive!0 lt!308844 (_2!9189 lt!308063) (_2!9189 lt!308063)))))

(declare-fun lt!308839 () Unit!13975)

(declare-fun lt!308836 () Unit!13975)

(assert (=> d!67143 (= lt!308839 lt!308836)))

(assert (=> d!67143 (isPrefixOf!0 lt!308844 (_2!9189 lt!308063))))

(assert (=> d!67143 (= lt!308836 (lemmaIsPrefixTransitive!0 lt!308844 (_2!9189 lt!307359) (_2!9189 lt!308063)))))

(declare-fun lt!308842 () Unit!13975)

(declare-fun e!136025 () Unit!13975)

(assert (=> d!67143 (= lt!308842 e!136025)))

(declare-fun c!9862 () Bool)

(assert (=> d!67143 (= c!9862 (not (= (size!4455 (buf!4941 (_2!9189 lt!307359))) #b00000000000000000000000000000000)))))

(declare-fun lt!308835 () Unit!13975)

(declare-fun lt!308833 () Unit!13975)

(assert (=> d!67143 (= lt!308835 lt!308833)))

(assert (=> d!67143 (isPrefixOf!0 (_2!9189 lt!308063) (_2!9189 lt!308063))))

(assert (=> d!67143 (= lt!308833 (lemmaIsPrefixRefl!0 (_2!9189 lt!308063)))))

(declare-fun lt!308829 () Unit!13975)

(declare-fun lt!308845 () Unit!13975)

(assert (=> d!67143 (= lt!308829 lt!308845)))

(assert (=> d!67143 (= lt!308845 (lemmaIsPrefixRefl!0 (_2!9189 lt!308063)))))

(declare-fun lt!308837 () Unit!13975)

(declare-fun lt!308831 () Unit!13975)

(assert (=> d!67143 (= lt!308837 lt!308831)))

(assert (=> d!67143 (isPrefixOf!0 lt!308844 lt!308844)))

(assert (=> d!67143 (= lt!308831 (lemmaIsPrefixRefl!0 lt!308844))))

(declare-fun lt!308846 () Unit!13975)

(declare-fun lt!308847 () Unit!13975)

(assert (=> d!67143 (= lt!308846 lt!308847)))

(assert (=> d!67143 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!307359))))

(assert (=> d!67143 (= lt!308847 (lemmaIsPrefixRefl!0 (_2!9189 lt!307359)))))

(assert (=> d!67143 (= lt!308844 (BitStream!8019 (buf!4941 (_2!9189 lt!308063)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> d!67143 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308063))))

(assert (=> d!67143 (= (reader!0 (_2!9189 lt!307359) (_2!9189 lt!308063)) lt!308840)))

(declare-fun b!198150 () Bool)

(declare-fun Unit!14030 () Unit!13975)

(assert (=> b!198150 (= e!136025 Unit!14030)))

(declare-fun b!198151 () Bool)

(declare-fun lt!308838 () (_ BitVec 64))

(declare-fun lt!308841 () (_ BitVec 64))

(assert (=> b!198151 (= e!136026 (= (_1!9191 lt!308840) (withMovedBitIndex!0 (_2!9191 lt!308840) (bvsub lt!308838 lt!308841))))))

(assert (=> b!198151 (or (= (bvand lt!308838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308838 lt!308841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198151 (= lt!308841 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))))

(assert (=> b!198151 (= lt!308838 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(declare-fun b!198152 () Bool)

(declare-fun lt!308832 () Unit!13975)

(assert (=> b!198152 (= e!136025 lt!308832)))

(declare-fun lt!308834 () (_ BitVec 64))

(assert (=> b!198152 (= lt!308834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!308843 () (_ BitVec 64))

(assert (=> b!198152 (= lt!308843 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> b!198152 (= lt!308832 (arrayBitRangesEqSymmetric!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!308063)) lt!308834 lt!308843))))

(assert (=> b!198152 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!308063)) (buf!4941 (_2!9189 lt!307359)) lt!308834 lt!308843)))

(declare-fun b!198153 () Bool)

(declare-fun res!165857 () Bool)

(assert (=> b!198153 (=> (not res!165857) (not e!136026))))

(assert (=> b!198153 (= res!165857 (isPrefixOf!0 (_2!9191 lt!308840) (_2!9189 lt!308063)))))

(assert (= (and d!67143 c!9862) b!198152))

(assert (= (and d!67143 (not c!9862)) b!198150))

(assert (= (and d!67143 res!165858) b!198149))

(assert (= (and b!198149 res!165856) b!198153))

(assert (= (and b!198153 res!165857) b!198151))

(declare-fun m!306497 () Bool)

(assert (=> d!67143 m!306497))

(declare-fun m!306499 () Bool)

(assert (=> d!67143 m!306499))

(declare-fun m!306501 () Bool)

(assert (=> d!67143 m!306501))

(declare-fun m!306503 () Bool)

(assert (=> d!67143 m!306503))

(assert (=> d!67143 m!305689))

(declare-fun m!306505 () Bool)

(assert (=> d!67143 m!306505))

(assert (=> d!67143 m!305561))

(declare-fun m!306507 () Bool)

(assert (=> d!67143 m!306507))

(declare-fun m!306509 () Bool)

(assert (=> d!67143 m!306509))

(declare-fun m!306511 () Bool)

(assert (=> d!67143 m!306511))

(assert (=> d!67143 m!305623))

(assert (=> b!198152 m!305115))

(declare-fun m!306513 () Bool)

(assert (=> b!198152 m!306513))

(declare-fun m!306515 () Bool)

(assert (=> b!198152 m!306515))

(declare-fun m!306517 () Bool)

(assert (=> b!198153 m!306517))

(declare-fun m!306519 () Bool)

(assert (=> b!198151 m!306519))

(assert (=> b!198151 m!305627))

(assert (=> b!198151 m!305115))

(declare-fun m!306521 () Bool)

(assert (=> b!198149 m!306521))

(assert (=> b!197770 d!67143))

(declare-fun d!67145 () Bool)

(assert (=> d!67145 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308056) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))) lt!308056))))

(declare-fun bs!16637 () Bool)

(assert (= bs!16637 d!67145))

(assert (=> bs!16637 m!306495))

(assert (=> b!197770 d!67145))

(declare-fun b!198155 () Bool)

(declare-fun res!165860 () Bool)

(declare-fun e!136027 () Bool)

(assert (=> b!198155 (=> (not res!165860) (not e!136027))))

(declare-fun lt!308852 () tuple2!17088)

(assert (=> b!198155 (= res!165860 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308852)))))

(declare-fun b!198154 () Bool)

(declare-fun res!165861 () Bool)

(assert (=> b!198154 (=> (not res!165861) (not e!136027))))

(declare-fun lt!308851 () (_ BitVec 64))

(declare-fun lt!308850 () (_ BitVec 64))

(assert (=> b!198154 (= res!165861 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308852))) (currentByte!9279 (_2!9189 lt!308852)) (currentBit!9274 (_2!9189 lt!308852))) (bvadd lt!308851 lt!308850)))))

(assert (=> b!198154 (or (not (= (bvand lt!308851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308850 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308851 lt!308850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198154 (= lt!308850 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198154 (= lt!308851 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(declare-fun b!198156 () Bool)

(declare-fun e!136028 () Bool)

(assert (=> b!198156 (= e!136027 e!136028)))

(declare-fun res!165859 () Bool)

(assert (=> b!198156 (=> (not res!165859) (not e!136028))))

(declare-fun lt!308849 () tuple2!17090)

(assert (=> b!198156 (= res!165859 (and (= (_2!9190 lt!308849) lt!308100) (= (_1!9190 lt!308849) (_2!9189 lt!308852))))))

(assert (=> b!198156 (= lt!308849 (readBitPure!0 (readerFrom!0 (_2!9189 lt!308852) (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)))))))

(declare-fun b!198157 () Bool)

(assert (=> b!198157 (= e!136028 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308849))) (currentByte!9279 (_1!9190 lt!308849)) (currentBit!9274 (_1!9190 lt!308849))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308852))) (currentByte!9279 (_2!9189 lt!308852)) (currentBit!9274 (_2!9189 lt!308852)))))))

(declare-fun d!67147 () Bool)

(assert (=> d!67147 e!136027))

(declare-fun res!165862 () Bool)

(assert (=> d!67147 (=> (not res!165862) (not e!136027))))

(assert (=> d!67147 (= res!165862 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!308852)))))))

(assert (=> d!67147 (= lt!308852 (choose!16 (_2!9189 lt!307359) lt!308100))))

(assert (=> d!67147 (validate_offset_bit!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> d!67147 (= (appendBit!0 (_2!9189 lt!307359) lt!308100) lt!308852)))

(assert (= (and d!67147 res!165862) b!198154))

(assert (= (and b!198154 res!165861) b!198155))

(assert (= (and b!198155 res!165860) b!198156))

(assert (= (and b!198156 res!165859) b!198157))

(declare-fun m!306523 () Bool)

(assert (=> b!198154 m!306523))

(assert (=> b!198154 m!305115))

(declare-fun m!306525 () Bool)

(assert (=> b!198155 m!306525))

(declare-fun m!306527 () Bool)

(assert (=> b!198156 m!306527))

(assert (=> b!198156 m!306527))

(declare-fun m!306529 () Bool)

(assert (=> b!198156 m!306529))

(declare-fun m!306531 () Bool)

(assert (=> b!198157 m!306531))

(assert (=> b!198157 m!306523))

(declare-fun m!306533 () Bool)

(assert (=> d!67147 m!306533))

(declare-fun m!306535 () Bool)

(assert (=> d!67147 m!306535))

(assert (=> b!197770 d!67147))

(declare-fun lt!308853 () tuple2!17106)

(declare-fun d!67149 () Bool)

(assert (=> d!67149 (= lt!308853 (readNBitsLSBFirstsLoop!0 (_1!9191 lt!308075) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308060))))

(assert (=> d!67149 (= (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308075) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308060) (tuple2!17095 (_2!9198 lt!308853) (_1!9198 lt!308853)))))

(declare-fun bs!16638 () Bool)

(assert (= bs!16638 d!67149))

(declare-fun m!306537 () Bool)

(assert (=> bs!16638 m!306537))

(assert (=> b!197770 d!67149))

(declare-fun d!67151 () Bool)

(declare-fun res!165863 () Bool)

(declare-fun e!136030 () Bool)

(assert (=> d!67151 (=> (not res!165863) (not e!136030))))

(assert (=> d!67151 (= res!165863 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!308063)))))))

(assert (=> d!67151 (= (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308063)) e!136030)))

(declare-fun b!198158 () Bool)

(declare-fun res!165864 () Bool)

(assert (=> b!198158 (=> (not res!165864) (not e!136030))))

(assert (=> b!198158 (= res!165864 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063)))))))

(declare-fun b!198159 () Bool)

(declare-fun e!136029 () Bool)

(assert (=> b!198159 (= e!136030 e!136029)))

(declare-fun res!165865 () Bool)

(assert (=> b!198159 (=> res!165865 e!136029)))

(assert (=> b!198159 (= res!165865 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) #b00000000000000000000000000000000))))

(declare-fun b!198160 () Bool)

(assert (=> b!198160 (= e!136029 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!308063)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (= (and d!67151 res!165863) b!198158))

(assert (= (and b!198158 res!165864) b!198159))

(assert (= (and b!198159 (not res!165865)) b!198160))

(assert (=> b!198158 m!305115))

(assert (=> b!198158 m!305627))

(assert (=> b!198160 m!305115))

(assert (=> b!198160 m!305115))

(declare-fun m!306539 () Bool)

(assert (=> b!198160 m!306539))

(assert (=> b!197770 d!67151))

(declare-fun d!67153 () Bool)

(assert (=> d!67153 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308056)))

(declare-fun lt!308854 () Unit!13975)

(assert (=> d!67153 (= lt!308854 (choose!9 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308063)) lt!308056 (BitStream!8019 (buf!4941 (_2!9189 lt!308063)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (=> d!67153 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308063)) lt!308056) lt!308854)))

(declare-fun bs!16639 () Bool)

(assert (= bs!16639 d!67153))

(assert (=> bs!16639 m!305583))

(declare-fun m!306541 () Bool)

(assert (=> bs!16639 m!306541))

(assert (=> b!197770 d!67153))

(declare-fun d!67155 () Bool)

(declare-fun e!136031 () Bool)

(assert (=> d!67155 e!136031))

(declare-fun res!165866 () Bool)

(assert (=> d!67155 (=> (not res!165866) (not e!136031))))

(declare-fun lt!308855 () BitStream!8018)

(declare-fun lt!308856 () (_ BitVec 64))

(assert (=> d!67155 (= res!165866 (= (bvadd lt!308856 (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))) (bitIndex!0 (size!4455 (buf!4941 lt!308855)) (currentByte!9279 lt!308855) (currentBit!9274 lt!308855))))))

(assert (=> d!67155 (or (not (= (bvand lt!308856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308856 (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67155 (= lt!308856 (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308088))) (currentByte!9279 (_2!9191 lt!308088)) (currentBit!9274 (_2!9191 lt!308088))))))

(assert (=> d!67155 (= lt!308855 (_2!9189 (moveBitIndex!0 (_2!9191 lt!308088) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063)))))))))

(assert (=> d!67155 (moveBitIndexPrecond!0 (_2!9191 lt!308088) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063)))))))

(assert (=> d!67155 (= (withMovedBitIndex!0 (_2!9191 lt!308088) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))) lt!308855)))

(declare-fun b!198161 () Bool)

(assert (=> b!198161 (= e!136031 (= (size!4455 (buf!4941 (_2!9191 lt!308088))) (size!4455 (buf!4941 lt!308855))))))

(assert (= (and d!67155 res!165866) b!198161))

(declare-fun m!306543 () Bool)

(assert (=> d!67155 m!306543))

(declare-fun m!306545 () Bool)

(assert (=> d!67155 m!306545))

(declare-fun m!306547 () Bool)

(assert (=> d!67155 m!306547))

(declare-fun m!306549 () Bool)

(assert (=> d!67155 m!306549))

(assert (=> b!197770 d!67155))

(declare-fun d!67157 () Bool)

(declare-fun lt!308857 () tuple2!17104)

(assert (=> d!67157 (= lt!308857 (readBit!0 (_1!9191 lt!308075)))))

(assert (=> d!67157 (= (readBitPure!0 (_1!9191 lt!308075)) (tuple2!17091 (_2!9197 lt!308857) (_1!9197 lt!308857)))))

(declare-fun bs!16640 () Bool)

(assert (= bs!16640 d!67157))

(declare-fun m!306551 () Bool)

(assert (=> bs!16640 m!306551))

(assert (=> b!197770 d!67157))

(declare-fun d!67159 () Bool)

(declare-fun e!136032 () Bool)

(assert (=> d!67159 e!136032))

(declare-fun res!165867 () Bool)

(assert (=> d!67159 (=> (not res!165867) (not e!136032))))

(declare-fun lt!308861 () (_ BitVec 64))

(declare-fun lt!308860 () (_ BitVec 64))

(declare-fun lt!308862 () (_ BitVec 64))

(assert (=> d!67159 (= res!165867 (= lt!308860 (bvsub lt!308861 lt!308862)))))

(assert (=> d!67159 (or (= (bvand lt!308861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308861 lt!308862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67159 (= lt!308862 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308061)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308061))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308061)))))))

(declare-fun lt!308863 () (_ BitVec 64))

(declare-fun lt!308859 () (_ BitVec 64))

(assert (=> d!67159 (= lt!308861 (bvmul lt!308863 lt!308859))))

(assert (=> d!67159 (or (= lt!308863 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308859 (bvsdiv (bvmul lt!308863 lt!308859) lt!308863)))))

(assert (=> d!67159 (= lt!308859 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67159 (= lt!308863 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308061)))))))

(assert (=> d!67159 (= lt!308860 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308061))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308061)))))))

(assert (=> d!67159 (invariant!0 (currentBit!9274 (_1!9190 lt!308061)) (currentByte!9279 (_1!9190 lt!308061)) (size!4455 (buf!4941 (_1!9190 lt!308061))))))

(assert (=> d!67159 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308061))) (currentByte!9279 (_1!9190 lt!308061)) (currentBit!9274 (_1!9190 lt!308061))) lt!308860)))

(declare-fun b!198162 () Bool)

(declare-fun res!165868 () Bool)

(assert (=> b!198162 (=> (not res!165868) (not e!136032))))

(assert (=> b!198162 (= res!165868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308860))))

(declare-fun b!198163 () Bool)

(declare-fun lt!308858 () (_ BitVec 64))

(assert (=> b!198163 (= e!136032 (bvsle lt!308860 (bvmul lt!308858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198163 (or (= lt!308858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308858)))))

(assert (=> b!198163 (= lt!308858 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308061)))))))

(assert (= (and d!67159 res!165867) b!198162))

(assert (= (and b!198162 res!165868) b!198163))

(declare-fun m!306553 () Bool)

(assert (=> d!67159 m!306553))

(declare-fun m!306555 () Bool)

(assert (=> d!67159 m!306555))

(assert (=> b!197770 d!67159))

(declare-fun d!67161 () Bool)

(assert (=> d!67161 (= (invariant!0 (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!308093)))) (and (bvsge (currentBit!9274 (_2!9189 lt!307359)) #b00000000000000000000000000000000) (bvslt (currentBit!9274 (_2!9189 lt!307359)) #b00000000000000000000000000001000) (bvsge (currentByte!9279 (_2!9189 lt!307359)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!308093)))) (and (= (currentBit!9274 (_2!9189 lt!307359)) #b00000000000000000000000000000000) (= (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!308093))))))))))

(assert (=> b!197770 d!67161))

(assert (=> b!197770 d!66677))

(declare-fun d!67163 () Bool)

(assert (=> d!67163 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308089)))

(declare-fun lt!308864 () Unit!13975)

(assert (=> d!67163 (= lt!308864 (choose!9 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308063)) lt!308089 (BitStream!8019 (buf!4941 (_2!9189 lt!308063)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (=> d!67163 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308063)) lt!308089) lt!308864)))

(declare-fun bs!16641 () Bool)

(assert (= bs!16641 d!67163))

(assert (=> bs!16641 m!305599))

(declare-fun m!306557 () Bool)

(assert (=> bs!16641 m!306557))

(assert (=> b!197770 d!67163))

(declare-fun d!67165 () Bool)

(assert (=> d!67165 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308063))))

(declare-fun lt!308865 () Unit!13975)

(assert (=> d!67165 (= lt!308865 (choose!30 (_2!9189 lt!307359) (_2!9189 lt!308093) (_2!9189 lt!308063)))))

(assert (=> d!67165 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308093))))

(assert (=> d!67165 (= (lemmaIsPrefixTransitive!0 (_2!9189 lt!307359) (_2!9189 lt!308093) (_2!9189 lt!308063)) lt!308865)))

(declare-fun bs!16642 () Bool)

(assert (= bs!16642 d!67165))

(assert (=> bs!16642 m!305623))

(declare-fun m!306559 () Bool)

(assert (=> bs!16642 m!306559))

(declare-fun m!306561 () Bool)

(assert (=> bs!16642 m!306561))

(assert (=> b!197770 d!67165))

(declare-fun d!67167 () Bool)

(declare-fun e!136033 () Bool)

(assert (=> d!67167 e!136033))

(declare-fun res!165869 () Bool)

(assert (=> d!67167 (=> (not res!165869) (not e!136033))))

(declare-fun lt!308868 () (_ BitVec 64))

(declare-fun lt!308870 () (_ BitVec 64))

(declare-fun lt!308869 () (_ BitVec 64))

(assert (=> d!67167 (= res!165869 (= lt!308868 (bvsub lt!308869 lt!308870)))))

(assert (=> d!67167 (or (= (bvand lt!308869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308870 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308869 lt!308870) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67167 (= lt!308870 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308063))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308063)))))))

(declare-fun lt!308871 () (_ BitVec 64))

(declare-fun lt!308867 () (_ BitVec 64))

(assert (=> d!67167 (= lt!308869 (bvmul lt!308871 lt!308867))))

(assert (=> d!67167 (or (= lt!308871 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308867 (bvsdiv (bvmul lt!308871 lt!308867) lt!308871)))))

(assert (=> d!67167 (= lt!308867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67167 (= lt!308871 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))))))

(assert (=> d!67167 (= lt!308868 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308063))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308063)))))))

(assert (=> d!67167 (invariant!0 (currentBit!9274 (_2!9189 lt!308063)) (currentByte!9279 (_2!9189 lt!308063)) (size!4455 (buf!4941 (_2!9189 lt!308063))))))

(assert (=> d!67167 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))) lt!308868)))

(declare-fun b!198164 () Bool)

(declare-fun res!165870 () Bool)

(assert (=> b!198164 (=> (not res!165870) (not e!136033))))

(assert (=> b!198164 (= res!165870 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308868))))

(declare-fun b!198165 () Bool)

(declare-fun lt!308866 () (_ BitVec 64))

(assert (=> b!198165 (= e!136033 (bvsle lt!308868 (bvmul lt!308866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198165 (or (= lt!308866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308866)))))

(assert (=> b!198165 (= lt!308866 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))))))

(assert (= (and d!67167 res!165869) b!198164))

(assert (= (and b!198164 res!165870) b!198165))

(declare-fun m!306563 () Bool)

(assert (=> d!67167 m!306563))

(assert (=> d!67167 m!305611))

(assert (=> b!197770 d!67167))

(declare-fun b!198166 () Bool)

(declare-fun res!165871 () Bool)

(declare-fun e!136035 () Bool)

(assert (=> b!198166 (=> (not res!165871) (not e!136035))))

(declare-fun lt!308883 () tuple2!17092)

(assert (=> b!198166 (= res!165871 (isPrefixOf!0 (_1!9191 lt!308883) (_2!9189 lt!308093)))))

(declare-fun d!67169 () Bool)

(assert (=> d!67169 e!136035))

(declare-fun res!165873 () Bool)

(assert (=> d!67169 (=> (not res!165873) (not e!136035))))

(assert (=> d!67169 (= res!165873 (isPrefixOf!0 (_1!9191 lt!308883) (_2!9191 lt!308883)))))

(declare-fun lt!308887 () BitStream!8018)

(assert (=> d!67169 (= lt!308883 (tuple2!17093 lt!308887 (_2!9189 lt!308063)))))

(declare-fun lt!308891 () Unit!13975)

(declare-fun lt!308873 () Unit!13975)

(assert (=> d!67169 (= lt!308891 lt!308873)))

(assert (=> d!67169 (isPrefixOf!0 lt!308887 (_2!9189 lt!308063))))

(assert (=> d!67169 (= lt!308873 (lemmaIsPrefixTransitive!0 lt!308887 (_2!9189 lt!308063) (_2!9189 lt!308063)))))

(declare-fun lt!308882 () Unit!13975)

(declare-fun lt!308879 () Unit!13975)

(assert (=> d!67169 (= lt!308882 lt!308879)))

(assert (=> d!67169 (isPrefixOf!0 lt!308887 (_2!9189 lt!308063))))

(assert (=> d!67169 (= lt!308879 (lemmaIsPrefixTransitive!0 lt!308887 (_2!9189 lt!308093) (_2!9189 lt!308063)))))

(declare-fun lt!308885 () Unit!13975)

(declare-fun e!136034 () Unit!13975)

(assert (=> d!67169 (= lt!308885 e!136034)))

(declare-fun c!9863 () Bool)

(assert (=> d!67169 (= c!9863 (not (= (size!4455 (buf!4941 (_2!9189 lt!308093))) #b00000000000000000000000000000000)))))

(declare-fun lt!308878 () Unit!13975)

(declare-fun lt!308876 () Unit!13975)

(assert (=> d!67169 (= lt!308878 lt!308876)))

(assert (=> d!67169 (isPrefixOf!0 (_2!9189 lt!308063) (_2!9189 lt!308063))))

(assert (=> d!67169 (= lt!308876 (lemmaIsPrefixRefl!0 (_2!9189 lt!308063)))))

(declare-fun lt!308872 () Unit!13975)

(declare-fun lt!308888 () Unit!13975)

(assert (=> d!67169 (= lt!308872 lt!308888)))

(assert (=> d!67169 (= lt!308888 (lemmaIsPrefixRefl!0 (_2!9189 lt!308063)))))

(declare-fun lt!308880 () Unit!13975)

(declare-fun lt!308874 () Unit!13975)

(assert (=> d!67169 (= lt!308880 lt!308874)))

(assert (=> d!67169 (isPrefixOf!0 lt!308887 lt!308887)))

(assert (=> d!67169 (= lt!308874 (lemmaIsPrefixRefl!0 lt!308887))))

(declare-fun lt!308889 () Unit!13975)

(declare-fun lt!308890 () Unit!13975)

(assert (=> d!67169 (= lt!308889 lt!308890)))

(assert (=> d!67169 (isPrefixOf!0 (_2!9189 lt!308093) (_2!9189 lt!308093))))

(assert (=> d!67169 (= lt!308890 (lemmaIsPrefixRefl!0 (_2!9189 lt!308093)))))

(assert (=> d!67169 (= lt!308887 (BitStream!8019 (buf!4941 (_2!9189 lt!308063)) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))))))

(assert (=> d!67169 (isPrefixOf!0 (_2!9189 lt!308093) (_2!9189 lt!308063))))

(assert (=> d!67169 (= (reader!0 (_2!9189 lt!308093) (_2!9189 lt!308063)) lt!308883)))

(declare-fun b!198167 () Bool)

(declare-fun Unit!14031 () Unit!13975)

(assert (=> b!198167 (= e!136034 Unit!14031)))

(declare-fun lt!308881 () (_ BitVec 64))

(declare-fun b!198168 () Bool)

(declare-fun lt!308884 () (_ BitVec 64))

(assert (=> b!198168 (= e!136035 (= (_1!9191 lt!308883) (withMovedBitIndex!0 (_2!9191 lt!308883) (bvsub lt!308881 lt!308884))))))

(assert (=> b!198168 (or (= (bvand lt!308881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308884 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308881 lt!308884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198168 (= lt!308884 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))))

(assert (=> b!198168 (= lt!308881 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))))))

(declare-fun b!198169 () Bool)

(declare-fun lt!308875 () Unit!13975)

(assert (=> b!198169 (= e!136034 lt!308875)))

(declare-fun lt!308877 () (_ BitVec 64))

(assert (=> b!198169 (= lt!308877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!308886 () (_ BitVec 64))

(assert (=> b!198169 (= lt!308886 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))))))

(assert (=> b!198169 (= lt!308875 (arrayBitRangesEqSymmetric!0 (buf!4941 (_2!9189 lt!308093)) (buf!4941 (_2!9189 lt!308063)) lt!308877 lt!308886))))

(assert (=> b!198169 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!308063)) (buf!4941 (_2!9189 lt!308093)) lt!308877 lt!308886)))

(declare-fun b!198170 () Bool)

(declare-fun res!165872 () Bool)

(assert (=> b!198170 (=> (not res!165872) (not e!136035))))

(assert (=> b!198170 (= res!165872 (isPrefixOf!0 (_2!9191 lt!308883) (_2!9189 lt!308063)))))

(assert (= (and d!67169 c!9863) b!198169))

(assert (= (and d!67169 (not c!9863)) b!198167))

(assert (= (and d!67169 res!165873) b!198166))

(assert (= (and b!198166 res!165871) b!198170))

(assert (= (and b!198170 res!165872) b!198168))

(declare-fun m!306565 () Bool)

(assert (=> d!67169 m!306565))

(declare-fun m!306567 () Bool)

(assert (=> d!67169 m!306567))

(assert (=> d!67169 m!306501))

(assert (=> d!67169 m!306503))

(declare-fun m!306569 () Bool)

(assert (=> d!67169 m!306569))

(declare-fun m!306571 () Bool)

(assert (=> d!67169 m!306571))

(declare-fun m!306573 () Bool)

(assert (=> d!67169 m!306573))

(declare-fun m!306575 () Bool)

(assert (=> d!67169 m!306575))

(declare-fun m!306577 () Bool)

(assert (=> d!67169 m!306577))

(declare-fun m!306579 () Bool)

(assert (=> d!67169 m!306579))

(declare-fun m!306581 () Bool)

(assert (=> d!67169 m!306581))

(assert (=> b!198169 m!305579))

(declare-fun m!306583 () Bool)

(assert (=> b!198169 m!306583))

(declare-fun m!306585 () Bool)

(assert (=> b!198169 m!306585))

(declare-fun m!306587 () Bool)

(assert (=> b!198170 m!306587))

(declare-fun m!306589 () Bool)

(assert (=> b!198168 m!306589))

(assert (=> b!198168 m!305627))

(assert (=> b!198168 m!305579))

(declare-fun m!306591 () Bool)

(assert (=> b!198166 m!306591))

(assert (=> b!197770 d!67169))

(declare-fun d!67171 () Bool)

(assert (=> d!67171 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093))) lt!308074) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093)))) lt!308074))))

(declare-fun bs!16643 () Bool)

(assert (= bs!16643 d!67171))

(declare-fun m!306593 () Bool)

(assert (=> bs!16643 m!306593))

(assert (=> b!197770 d!67171))

(declare-fun d!67173 () Bool)

(declare-fun lt!308892 () tuple2!17104)

(assert (=> d!67173 (= lt!308892 (readBit!0 lt!308076))))

(assert (=> d!67173 (= (readBitPure!0 lt!308076) (tuple2!17091 (_2!9197 lt!308892) (_1!9197 lt!308892)))))

(declare-fun bs!16644 () Bool)

(assert (= bs!16644 d!67173))

(declare-fun m!306595 () Bool)

(assert (=> bs!16644 m!306595))

(assert (=> b!197770 d!67173))

(declare-fun d!67175 () Bool)

(declare-fun e!136036 () Bool)

(assert (=> d!67175 e!136036))

(declare-fun res!165874 () Bool)

(assert (=> d!67175 (=> (not res!165874) (not e!136036))))

(declare-fun lt!308894 () (_ BitVec 64))

(declare-fun lt!308893 () BitStream!8018)

(assert (=> d!67175 (= res!165874 (= (bvadd lt!308894 (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))) (bitIndex!0 (size!4455 (buf!4941 lt!308893)) (currentByte!9279 lt!308893) (currentBit!9274 lt!308893))))))

(assert (=> d!67175 (or (not (= (bvand lt!308894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308894 (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67175 (= lt!308894 (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308075))) (currentByte!9279 (_2!9191 lt!308075)) (currentBit!9274 (_2!9191 lt!308075))))))

(assert (=> d!67175 (= lt!308893 (_2!9189 (moveBitIndex!0 (_2!9191 lt!308075) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063)))))))))

(assert (=> d!67175 (moveBitIndexPrecond!0 (_2!9191 lt!308075) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063)))))))

(assert (=> d!67175 (= (withMovedBitIndex!0 (_2!9191 lt!308075) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308063))) (currentByte!9279 (_2!9189 lt!308063)) (currentBit!9274 (_2!9189 lt!308063))))) lt!308893)))

(declare-fun b!198171 () Bool)

(assert (=> b!198171 (= e!136036 (= (size!4455 (buf!4941 (_2!9191 lt!308075))) (size!4455 (buf!4941 lt!308893))))))

(assert (= (and d!67175 res!165874) b!198171))

(declare-fun m!306597 () Bool)

(assert (=> d!67175 m!306597))

(declare-fun m!306599 () Bool)

(assert (=> d!67175 m!306599))

(declare-fun m!306601 () Bool)

(assert (=> d!67175 m!306601))

(declare-fun m!306603 () Bool)

(assert (=> d!67175 m!306603))

(assert (=> b!197770 d!67175))

(declare-fun b!198172 () Bool)

(declare-fun res!165875 () Bool)

(declare-fun e!136043 () Bool)

(assert (=> b!198172 (=> (not res!165875) (not e!136043))))

(declare-fun lt!308925 () (_ BitVec 64))

(declare-fun lt!308929 () tuple2!17088)

(declare-fun lt!308907 () (_ BitVec 64))

(assert (=> b!198172 (= res!165875 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308929))) (currentByte!9279 (_2!9189 lt!308929)) (currentBit!9274 (_2!9189 lt!308929))) (bvsub lt!308925 lt!308907)))))

(assert (=> b!198172 (or (= (bvand lt!308925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308907 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308925 lt!308907) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198172 (= lt!308907 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!308914 () (_ BitVec 64))

(declare-fun lt!308944 () (_ BitVec 64))

(assert (=> b!198172 (= lt!308925 (bvadd lt!308914 lt!308944))))

(assert (=> b!198172 (or (not (= (bvand lt!308914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308944 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308914 lt!308944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198172 (= lt!308944 ((_ sign_extend 32) nBits!348))))

(assert (=> b!198172 (= lt!308914 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))))))

(declare-fun b!198173 () Bool)

(declare-fun res!165886 () Bool)

(declare-fun lt!308936 () tuple2!17088)

(assert (=> b!198173 (= res!165886 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308936))) (currentByte!9279 (_2!9189 lt!308936)) (currentBit!9274 (_2!9189 lt!308936))) (bvadd (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!136040 () Bool)

(assert (=> b!198173 (=> (not res!165886) (not e!136040))))

(declare-fun b!198174 () Bool)

(declare-fun e!136044 () tuple2!17088)

(declare-fun Unit!14032 () Unit!13975)

(assert (=> b!198174 (= e!136044 (tuple2!17089 Unit!14032 (_2!9189 lt!308093)))))

(declare-fun lt!308946 () Unit!13975)

(assert (=> b!198174 (= lt!308946 (lemmaIsPrefixRefl!0 (_2!9189 lt!308093)))))

(declare-fun call!3119 () Bool)

(assert (=> b!198174 call!3119))

(declare-fun lt!308915 () Unit!13975)

(assert (=> b!198174 (= lt!308915 lt!308946)))

(declare-fun b!198175 () Bool)

(declare-fun e!136038 () Bool)

(declare-fun lt!308918 () tuple2!17094)

(declare-fun lt!308903 () tuple2!17092)

(assert (=> b!198175 (= e!136038 (= (_1!9192 lt!308918) (_2!9191 lt!308903)))))

(declare-fun b!198176 () Bool)

(declare-fun lt!308942 () tuple2!17090)

(assert (=> b!198176 (= lt!308942 (readBitPure!0 (readerFrom!0 (_2!9189 lt!308936) (currentBit!9274 (_2!9189 lt!308093)) (currentByte!9279 (_2!9189 lt!308093)))))))

(declare-fun res!165879 () Bool)

(declare-fun lt!308945 () Bool)

(assert (=> b!198176 (= res!165879 (and (= (_2!9190 lt!308942) lt!308945) (= (_1!9190 lt!308942) (_2!9189 lt!308936))))))

(declare-fun e!136045 () Bool)

(assert (=> b!198176 (=> (not res!165879) (not e!136045))))

(assert (=> b!198176 (= e!136040 e!136045)))

(declare-fun b!198177 () Bool)

(declare-fun e!136041 () (_ BitVec 64))

(assert (=> b!198177 (= e!136041 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun c!9865 () Bool)

(declare-fun bm!3116 () Bool)

(assert (=> bm!3116 (= call!3119 (isPrefixOf!0 (_2!9189 lt!308093) (ite c!9865 (_2!9189 lt!308093) (_2!9189 lt!308936))))))

(declare-fun b!198179 () Bool)

(declare-fun res!165880 () Bool)

(assert (=> b!198179 (=> (not res!165880) (not e!136043))))

(assert (=> b!198179 (= res!165880 (= (size!4455 (buf!4941 (_2!9189 lt!308093))) (size!4455 (buf!4941 (_2!9189 lt!308929)))))))

(declare-fun b!198180 () Bool)

(declare-fun res!165884 () Bool)

(assert (=> b!198180 (=> (not res!165884) (not e!136043))))

(assert (=> b!198180 (= res!165884 (isPrefixOf!0 (_2!9189 lt!308093) (_2!9189 lt!308929)))))

(declare-fun b!198181 () Bool)

(declare-fun e!136039 () Bool)

(declare-fun lt!308910 () (_ BitVec 64))

(assert (=> b!198181 (= e!136039 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308093)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093))) lt!308910))))

(declare-fun b!198178 () Bool)

(declare-fun e!136037 () Bool)

(assert (=> b!198178 (= e!136043 e!136037)))

(declare-fun res!165882 () Bool)

(assert (=> b!198178 (=> (not res!165882) (not e!136037))))

(declare-fun lt!308897 () tuple2!17094)

(assert (=> b!198178 (= res!165882 (= (_2!9192 lt!308897) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!308948 () tuple2!17092)

(assert (=> b!198178 (= lt!308897 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308948) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!308939 () Unit!13975)

(declare-fun lt!308911 () Unit!13975)

(assert (=> b!198178 (= lt!308939 lt!308911)))

(assert (=> b!198178 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308929)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093))) lt!308910)))

(assert (=> b!198178 (= lt!308911 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!308093) (buf!4941 (_2!9189 lt!308929)) lt!308910))))

(assert (=> b!198178 e!136039))

(declare-fun res!165876 () Bool)

(assert (=> b!198178 (=> (not res!165876) (not e!136039))))

(assert (=> b!198178 (= res!165876 (and (= (size!4455 (buf!4941 (_2!9189 lt!308093))) (size!4455 (buf!4941 (_2!9189 lt!308929)))) (bvsge lt!308910 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198178 (= lt!308910 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!198178 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!198178 (= lt!308948 (reader!0 (_2!9189 lt!308093) (_2!9189 lt!308929)))))

(declare-fun d!67177 () Bool)

(assert (=> d!67177 e!136043))

(declare-fun res!165877 () Bool)

(assert (=> d!67177 (=> (not res!165877) (not e!136043))))

(assert (=> d!67177 (= res!165877 (invariant!0 (currentBit!9274 (_2!9189 lt!308929)) (currentByte!9279 (_2!9189 lt!308929)) (size!4455 (buf!4941 (_2!9189 lt!308929)))))))

(assert (=> d!67177 (= lt!308929 e!136044)))

(assert (=> d!67177 (= c!9865 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!67177 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67177 (= (appendBitsLSBFirstLoopTR!0 (_2!9189 lt!308093) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!308929)))

(declare-fun b!198182 () Bool)

(assert (=> b!198182 (= e!136037 (= (_1!9192 lt!308897) (_2!9191 lt!308948)))))

(declare-fun b!198183 () Bool)

(declare-fun lt!308908 () tuple2!17088)

(assert (=> b!198183 (= e!136044 (tuple2!17089 (_1!9189 lt!308908) (_2!9189 lt!308908)))))

(assert (=> b!198183 (= lt!308945 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198183 (= lt!308936 (appendBit!0 (_2!9189 lt!308093) lt!308945))))

(declare-fun res!165878 () Bool)

(assert (=> b!198183 (= res!165878 (= (size!4455 (buf!4941 (_2!9189 lt!308093))) (size!4455 (buf!4941 (_2!9189 lt!308936)))))))

(assert (=> b!198183 (=> (not res!165878) (not e!136040))))

(assert (=> b!198183 e!136040))

(declare-fun lt!308938 () tuple2!17088)

(assert (=> b!198183 (= lt!308938 lt!308936)))

(assert (=> b!198183 (= lt!308908 (appendBitsLSBFirstLoopTR!0 (_2!9189 lt!308938) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!308931 () Unit!13975)

(assert (=> b!198183 (= lt!308931 (lemmaIsPrefixTransitive!0 (_2!9189 lt!308093) (_2!9189 lt!308938) (_2!9189 lt!308908)))))

(assert (=> b!198183 (isPrefixOf!0 (_2!9189 lt!308093) (_2!9189 lt!308908))))

(declare-fun lt!308928 () Unit!13975)

(assert (=> b!198183 (= lt!308928 lt!308931)))

(assert (=> b!198183 (invariant!0 (currentBit!9274 (_2!9189 lt!308093)) (currentByte!9279 (_2!9189 lt!308093)) (size!4455 (buf!4941 (_2!9189 lt!308938))))))

(declare-fun lt!308921 () BitStream!8018)

(assert (=> b!198183 (= lt!308921 (BitStream!8019 (buf!4941 (_2!9189 lt!308938)) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))))))

(assert (=> b!198183 (invariant!0 (currentBit!9274 lt!308921) (currentByte!9279 lt!308921) (size!4455 (buf!4941 (_2!9189 lt!308908))))))

(declare-fun lt!308940 () BitStream!8018)

(assert (=> b!198183 (= lt!308940 (BitStream!8019 (buf!4941 (_2!9189 lt!308908)) (currentByte!9279 lt!308921) (currentBit!9274 lt!308921)))))

(declare-fun lt!308926 () tuple2!17090)

(assert (=> b!198183 (= lt!308926 (readBitPure!0 lt!308921))))

(declare-fun lt!308906 () tuple2!17090)

(assert (=> b!198183 (= lt!308906 (readBitPure!0 lt!308940))))

(declare-fun lt!308900 () Unit!13975)

(assert (=> b!198183 (= lt!308900 (readBitPrefixLemma!0 lt!308921 (_2!9189 lt!308908)))))

(declare-fun res!165883 () Bool)

(assert (=> b!198183 (= res!165883 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308926))) (currentByte!9279 (_1!9190 lt!308926)) (currentBit!9274 (_1!9190 lt!308926))) (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308906))) (currentByte!9279 (_1!9190 lt!308906)) (currentBit!9274 (_1!9190 lt!308906)))))))

(declare-fun e!136042 () Bool)

(assert (=> b!198183 (=> (not res!165883) (not e!136042))))

(assert (=> b!198183 e!136042))

(declare-fun lt!308941 () Unit!13975)

(assert (=> b!198183 (= lt!308941 lt!308900)))

(declare-fun lt!308920 () tuple2!17092)

(assert (=> b!198183 (= lt!308920 (reader!0 (_2!9189 lt!308093) (_2!9189 lt!308908)))))

(declare-fun lt!308933 () tuple2!17092)

(assert (=> b!198183 (= lt!308933 (reader!0 (_2!9189 lt!308938) (_2!9189 lt!308908)))))

(declare-fun lt!308935 () tuple2!17090)

(assert (=> b!198183 (= lt!308935 (readBitPure!0 (_1!9191 lt!308920)))))

(assert (=> b!198183 (= (_2!9190 lt!308935) lt!308945)))

(declare-fun lt!308916 () Unit!13975)

(declare-fun Unit!14033 () Unit!13975)

(assert (=> b!198183 (= lt!308916 Unit!14033)))

(declare-fun lt!308905 () (_ BitVec 64))

(assert (=> b!198183 (= lt!308905 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!308901 () (_ BitVec 64))

(assert (=> b!198183 (= lt!308901 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!308950 () Unit!13975)

(assert (=> b!198183 (= lt!308950 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!308093) (buf!4941 (_2!9189 lt!308908)) lt!308901))))

(assert (=> b!198183 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308908)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093))) lt!308901)))

(declare-fun lt!308949 () Unit!13975)

(assert (=> b!198183 (= lt!308949 lt!308950)))

(declare-fun lt!308947 () tuple2!17094)

(assert (=> b!198183 (= lt!308947 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308920) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!308905))))

(declare-fun lt!308919 () (_ BitVec 64))

(assert (=> b!198183 (= lt!308919 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!308923 () Unit!13975)

(assert (=> b!198183 (= lt!308923 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!308938) (buf!4941 (_2!9189 lt!308908)) lt!308919))))

(assert (=> b!198183 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308908)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308938))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308938))) lt!308919)))

(declare-fun lt!308927 () Unit!13975)

(assert (=> b!198183 (= lt!308927 lt!308923)))

(declare-fun lt!308912 () tuple2!17094)

(assert (=> b!198183 (= lt!308912 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308933) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!308905 (ite (_2!9190 lt!308935) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!308896 () tuple2!17094)

(assert (=> b!198183 (= lt!308896 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308920) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!308905))))

(declare-fun c!9864 () Bool)

(assert (=> b!198183 (= c!9864 (_2!9190 (readBitPure!0 (_1!9191 lt!308920))))))

(declare-fun lt!308930 () tuple2!17094)

(assert (=> b!198183 (= lt!308930 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9191 lt!308920) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!308905 e!136041)))))

(declare-fun lt!308917 () Unit!13975)

(assert (=> b!198183 (= lt!308917 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9191 lt!308920) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!308905))))

(assert (=> b!198183 (and (= (_2!9192 lt!308896) (_2!9192 lt!308930)) (= (_1!9192 lt!308896) (_1!9192 lt!308930)))))

(declare-fun lt!308899 () Unit!13975)

(assert (=> b!198183 (= lt!308899 lt!308917)))

(assert (=> b!198183 (= (_1!9191 lt!308920) (withMovedBitIndex!0 (_2!9191 lt!308920) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308908))) (currentByte!9279 (_2!9189 lt!308908)) (currentBit!9274 (_2!9189 lt!308908))))))))

(declare-fun lt!308932 () Unit!13975)

(declare-fun Unit!14034 () Unit!13975)

(assert (=> b!198183 (= lt!308932 Unit!14034)))

(assert (=> b!198183 (= (_1!9191 lt!308933) (withMovedBitIndex!0 (_2!9191 lt!308933) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308938))) (currentByte!9279 (_2!9189 lt!308938)) (currentBit!9274 (_2!9189 lt!308938))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308908))) (currentByte!9279 (_2!9189 lt!308908)) (currentBit!9274 (_2!9189 lt!308908))))))))

(declare-fun lt!308943 () Unit!13975)

(declare-fun Unit!14035 () Unit!13975)

(assert (=> b!198183 (= lt!308943 Unit!14035)))

(assert (=> b!198183 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) (bvsub (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308938))) (currentByte!9279 (_2!9189 lt!308938)) (currentBit!9274 (_2!9189 lt!308938))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!308895 () Unit!13975)

(declare-fun Unit!14036 () Unit!13975)

(assert (=> b!198183 (= lt!308895 Unit!14036)))

(assert (=> b!198183 (= (_2!9192 lt!308947) (_2!9192 lt!308912))))

(declare-fun lt!308902 () Unit!13975)

(declare-fun Unit!14037 () Unit!13975)

(assert (=> b!198183 (= lt!308902 Unit!14037)))

(assert (=> b!198183 (invariant!0 (currentBit!9274 (_2!9189 lt!308908)) (currentByte!9279 (_2!9189 lt!308908)) (size!4455 (buf!4941 (_2!9189 lt!308908))))))

(declare-fun lt!308898 () Unit!13975)

(declare-fun Unit!14038 () Unit!13975)

(assert (=> b!198183 (= lt!308898 Unit!14038)))

(assert (=> b!198183 (= (size!4455 (buf!4941 (_2!9189 lt!308093))) (size!4455 (buf!4941 (_2!9189 lt!308908))))))

(declare-fun lt!308904 () Unit!13975)

(declare-fun Unit!14039 () Unit!13975)

(assert (=> b!198183 (= lt!308904 Unit!14039)))

(assert (=> b!198183 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308908))) (currentByte!9279 (_2!9189 lt!308908)) (currentBit!9274 (_2!9189 lt!308908))) (bvsub (bvadd (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!308937 () Unit!13975)

(declare-fun Unit!14040 () Unit!13975)

(assert (=> b!198183 (= lt!308937 Unit!14040)))

(declare-fun lt!308909 () Unit!13975)

(declare-fun Unit!14041 () Unit!13975)

(assert (=> b!198183 (= lt!308909 Unit!14041)))

(assert (=> b!198183 (= lt!308903 (reader!0 (_2!9189 lt!308093) (_2!9189 lt!308908)))))

(declare-fun lt!308934 () (_ BitVec 64))

(assert (=> b!198183 (= lt!308934 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!308922 () Unit!13975)

(assert (=> b!198183 (= lt!308922 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!308093) (buf!4941 (_2!9189 lt!308908)) lt!308934))))

(assert (=> b!198183 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308908)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093))) lt!308934)))

(declare-fun lt!308924 () Unit!13975)

(assert (=> b!198183 (= lt!308924 lt!308922)))

(assert (=> b!198183 (= lt!308918 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308903) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!165881 () Bool)

(assert (=> b!198183 (= res!165881 (= (_2!9192 lt!308918) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!198183 (=> (not res!165881) (not e!136038))))

(assert (=> b!198183 e!136038))

(declare-fun lt!308913 () Unit!13975)

(declare-fun Unit!14042 () Unit!13975)

(assert (=> b!198183 (= lt!308913 Unit!14042)))

(declare-fun b!198184 () Bool)

(assert (=> b!198184 (= e!136042 (= (_2!9190 lt!308926) (_2!9190 lt!308906)))))

(declare-fun b!198185 () Bool)

(declare-fun res!165885 () Bool)

(assert (=> b!198185 (= res!165885 call!3119)))

(assert (=> b!198185 (=> (not res!165885) (not e!136040))))

(declare-fun b!198186 () Bool)

(assert (=> b!198186 (= e!136045 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308942))) (currentByte!9279 (_1!9190 lt!308942)) (currentBit!9274 (_1!9190 lt!308942))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308936))) (currentByte!9279 (_2!9189 lt!308936)) (currentBit!9274 (_2!9189 lt!308936)))))))

(declare-fun b!198187 () Bool)

(assert (=> b!198187 (= e!136041 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (= (and d!67177 c!9865) b!198174))

(assert (= (and d!67177 (not c!9865)) b!198183))

(assert (= (and b!198183 res!165878) b!198173))

(assert (= (and b!198173 res!165886) b!198185))

(assert (= (and b!198185 res!165885) b!198176))

(assert (= (and b!198176 res!165879) b!198186))

(assert (= (and b!198183 res!165883) b!198184))

(assert (= (and b!198183 c!9864) b!198187))

(assert (= (and b!198183 (not c!9864)) b!198177))

(assert (= (and b!198183 res!165881) b!198175))

(assert (= (or b!198174 b!198185) bm!3116))

(assert (= (and d!67177 res!165877) b!198179))

(assert (= (and b!198179 res!165880) b!198172))

(assert (= (and b!198172 res!165875) b!198180))

(assert (= (and b!198180 res!165884) b!198178))

(assert (= (and b!198178 res!165876) b!198181))

(assert (= (and b!198178 res!165882) b!198182))

(declare-fun m!306605 () Bool)

(assert (=> b!198180 m!306605))

(declare-fun m!306607 () Bool)

(assert (=> bm!3116 m!306607))

(assert (=> b!198174 m!306573))

(declare-fun m!306609 () Bool)

(assert (=> b!198183 m!306609))

(declare-fun m!306611 () Bool)

(assert (=> b!198183 m!306611))

(declare-fun m!306613 () Bool)

(assert (=> b!198183 m!306613))

(declare-fun m!306615 () Bool)

(assert (=> b!198183 m!306615))

(declare-fun m!306617 () Bool)

(assert (=> b!198183 m!306617))

(declare-fun m!306619 () Bool)

(assert (=> b!198183 m!306619))

(declare-fun m!306621 () Bool)

(assert (=> b!198183 m!306621))

(declare-fun m!306623 () Bool)

(assert (=> b!198183 m!306623))

(declare-fun m!306625 () Bool)

(assert (=> b!198183 m!306625))

(declare-fun m!306627 () Bool)

(assert (=> b!198183 m!306627))

(declare-fun m!306629 () Bool)

(assert (=> b!198183 m!306629))

(declare-fun m!306631 () Bool)

(assert (=> b!198183 m!306631))

(declare-fun m!306633 () Bool)

(assert (=> b!198183 m!306633))

(declare-fun m!306635 () Bool)

(assert (=> b!198183 m!306635))

(assert (=> b!198183 m!305591))

(declare-fun m!306637 () Bool)

(assert (=> b!198183 m!306637))

(declare-fun m!306639 () Bool)

(assert (=> b!198183 m!306639))

(declare-fun m!306641 () Bool)

(assert (=> b!198183 m!306641))

(declare-fun m!306643 () Bool)

(assert (=> b!198183 m!306643))

(declare-fun m!306645 () Bool)

(assert (=> b!198183 m!306645))

(declare-fun m!306647 () Bool)

(assert (=> b!198183 m!306647))

(declare-fun m!306649 () Bool)

(assert (=> b!198183 m!306649))

(declare-fun m!306651 () Bool)

(assert (=> b!198183 m!306651))

(declare-fun m!306653 () Bool)

(assert (=> b!198183 m!306653))

(declare-fun m!306655 () Bool)

(assert (=> b!198183 m!306655))

(declare-fun m!306657 () Bool)

(assert (=> b!198183 m!306657))

(assert (=> b!198183 m!306615))

(declare-fun m!306659 () Bool)

(assert (=> b!198183 m!306659))

(declare-fun m!306661 () Bool)

(assert (=> b!198183 m!306661))

(declare-fun m!306663 () Bool)

(assert (=> b!198183 m!306663))

(declare-fun m!306665 () Bool)

(assert (=> b!198183 m!306665))

(declare-fun m!306667 () Bool)

(assert (=> b!198183 m!306667))

(declare-fun m!306669 () Bool)

(assert (=> b!198183 m!306669))

(assert (=> b!198183 m!305579))

(declare-fun m!306671 () Bool)

(assert (=> b!198183 m!306671))

(declare-fun m!306673 () Bool)

(assert (=> b!198172 m!306673))

(assert (=> b!198172 m!305579))

(declare-fun m!306675 () Bool)

(assert (=> b!198186 m!306675))

(declare-fun m!306677 () Bool)

(assert (=> b!198186 m!306677))

(declare-fun m!306679 () Bool)

(assert (=> b!198181 m!306679))

(declare-fun m!306681 () Bool)

(assert (=> b!198178 m!306681))

(assert (=> b!198178 m!305591))

(assert (=> b!198178 m!306641))

(declare-fun m!306683 () Bool)

(assert (=> b!198178 m!306683))

(declare-fun m!306685 () Bool)

(assert (=> b!198178 m!306685))

(declare-fun m!306687 () Bool)

(assert (=> b!198178 m!306687))

(declare-fun m!306689 () Bool)

(assert (=> d!67177 m!306689))

(assert (=> b!198173 m!306677))

(assert (=> b!198173 m!305579))

(declare-fun m!306691 () Bool)

(assert (=> b!198176 m!306691))

(assert (=> b!198176 m!306691))

(declare-fun m!306693 () Bool)

(assert (=> b!198176 m!306693))

(assert (=> b!197770 d!67177))

(declare-fun d!67179 () Bool)

(declare-fun lt!308951 () tuple2!17104)

(assert (=> d!67179 (= lt!308951 (readBit!0 lt!308095))))

(assert (=> d!67179 (= (readBitPure!0 lt!308095) (tuple2!17091 (_2!9197 lt!308951) (_1!9197 lt!308951)))))

(declare-fun bs!16645 () Bool)

(assert (= bs!16645 d!67179))

(declare-fun m!306695 () Bool)

(assert (=> bs!16645 m!306695))

(assert (=> b!197770 d!67179))

(declare-fun lt!308952 () tuple2!17106)

(declare-fun d!67181 () Bool)

(assert (=> d!67181 (= lt!308952 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9191 lt!308075) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308060 e!135780)))))

(assert (=> d!67181 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9191 lt!308075) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308060 e!135780)) (tuple2!17095 (_2!9198 lt!308952) (_1!9198 lt!308952)))))

(declare-fun bs!16646 () Bool)

(assert (= bs!16646 d!67181))

(assert (=> bs!16646 m!305569))

(declare-fun m!306697 () Bool)

(assert (=> bs!16646 m!306697))

(assert (=> b!197770 d!67181))

(declare-fun d!67183 () Bool)

(assert (=> d!67183 (= (invariant!0 (currentBit!9274 lt!308076) (currentByte!9279 lt!308076) (size!4455 (buf!4941 (_2!9189 lt!308063)))) (and (bvsge (currentBit!9274 lt!308076) #b00000000000000000000000000000000) (bvslt (currentBit!9274 lt!308076) #b00000000000000000000000000001000) (bvsge (currentByte!9279 lt!308076) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 lt!308076) (size!4455 (buf!4941 (_2!9189 lt!308063)))) (and (= (currentBit!9274 lt!308076) #b00000000000000000000000000000000) (= (currentByte!9279 lt!308076) (size!4455 (buf!4941 (_2!9189 lt!308063))))))))))

(assert (=> b!197770 d!67183))

(declare-fun d!67185 () Bool)

(assert (=> d!67185 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308063)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093))) lt!308074)))

(declare-fun lt!308953 () Unit!13975)

(assert (=> d!67185 (= lt!308953 (choose!9 (_2!9189 lt!308093) (buf!4941 (_2!9189 lt!308063)) lt!308074 (BitStream!8019 (buf!4941 (_2!9189 lt!308063)) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093)))))))

(assert (=> d!67185 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!308093) (buf!4941 (_2!9189 lt!308063)) lt!308074) lt!308953)))

(declare-fun bs!16647 () Bool)

(assert (= bs!16647 d!67185))

(assert (=> bs!16647 m!305581))

(declare-fun m!306699 () Bool)

(assert (=> bs!16647 m!306699))

(assert (=> b!197770 d!67185))

(declare-fun d!67187 () Bool)

(assert (=> d!67187 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!197770 d!67187))

(declare-fun d!67189 () Bool)

(assert (=> d!67189 (= (invariant!0 (currentBit!9274 (_2!9189 lt!308063)) (currentByte!9279 (_2!9189 lt!308063)) (size!4455 (buf!4941 (_2!9189 lt!308063)))) (and (bvsge (currentBit!9274 (_2!9189 lt!308063)) #b00000000000000000000000000000000) (bvslt (currentBit!9274 (_2!9189 lt!308063)) #b00000000000000000000000000001000) (bvsge (currentByte!9279 (_2!9189 lt!308063)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 (_2!9189 lt!308063)) (size!4455 (buf!4941 (_2!9189 lt!308063)))) (and (= (currentBit!9274 (_2!9189 lt!308063)) #b00000000000000000000000000000000) (= (currentByte!9279 (_2!9189 lt!308063)) (size!4455 (buf!4941 (_2!9189 lt!308063))))))))))

(assert (=> b!197770 d!67189))

(declare-fun d!67191 () Bool)

(declare-fun e!136046 () Bool)

(assert (=> d!67191 e!136046))

(declare-fun res!165887 () Bool)

(assert (=> d!67191 (=> (not res!165887) (not e!136046))))

(declare-fun lt!308956 () (_ BitVec 64))

(declare-fun lt!308958 () (_ BitVec 64))

(declare-fun lt!308957 () (_ BitVec 64))

(assert (=> d!67191 (= res!165887 (= lt!308956 (bvsub lt!308957 lt!308958)))))

(assert (=> d!67191 (or (= (bvand lt!308957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308957 lt!308958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67191 (= lt!308958 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308093)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093)))))))

(declare-fun lt!308959 () (_ BitVec 64))

(declare-fun lt!308955 () (_ BitVec 64))

(assert (=> d!67191 (= lt!308957 (bvmul lt!308959 lt!308955))))

(assert (=> d!67191 (or (= lt!308959 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308955 (bvsdiv (bvmul lt!308959 lt!308955) lt!308959)))))

(assert (=> d!67191 (= lt!308955 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67191 (= lt!308959 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308093)))))))

(assert (=> d!67191 (= lt!308956 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308093))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308093)))))))

(assert (=> d!67191 (invariant!0 (currentBit!9274 (_2!9189 lt!308093)) (currentByte!9279 (_2!9189 lt!308093)) (size!4455 (buf!4941 (_2!9189 lt!308093))))))

(assert (=> d!67191 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308093))) (currentByte!9279 (_2!9189 lt!308093)) (currentBit!9274 (_2!9189 lt!308093))) lt!308956)))

(declare-fun b!198188 () Bool)

(declare-fun res!165888 () Bool)

(assert (=> b!198188 (=> (not res!165888) (not e!136046))))

(assert (=> b!198188 (= res!165888 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308956))))

(declare-fun b!198189 () Bool)

(declare-fun lt!308954 () (_ BitVec 64))

(assert (=> b!198189 (= e!136046 (bvsle lt!308956 (bvmul lt!308954 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198189 (or (= lt!308954 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308954 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308954)))))

(assert (=> b!198189 (= lt!308954 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308093)))))))

(assert (= (and d!67191 res!165887) b!198188))

(assert (= (and b!198188 res!165888) b!198189))

(declare-fun m!306701 () Bool)

(assert (=> d!67191 m!306701))

(declare-fun m!306703 () Bool)

(assert (=> d!67191 m!306703))

(assert (=> b!197770 d!67191))

(declare-fun d!67193 () Bool)

(declare-fun e!136047 () Bool)

(assert (=> d!67193 e!136047))

(declare-fun res!165889 () Bool)

(assert (=> d!67193 (=> (not res!165889) (not e!136047))))

(declare-fun lt!308961 () (_ BitVec 64))

(declare-fun lt!308960 () BitStream!8018)

(assert (=> d!67193 (= res!165889 (= (bvadd lt!308961 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4455 (buf!4941 lt!308960)) (currentByte!9279 lt!308960) (currentBit!9274 lt!308960))))))

(assert (=> d!67193 (or (not (= (bvand lt!308961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308961 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67193 (= lt!308961 (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308075))) (currentByte!9279 (_1!9191 lt!308075)) (currentBit!9274 (_1!9191 lt!308075))))))

(assert (=> d!67193 (= lt!308960 (_2!9189 (moveBitIndex!0 (_1!9191 lt!308075) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!67193 (moveBitIndexPrecond!0 (_1!9191 lt!308075) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!67193 (= (withMovedBitIndex!0 (_1!9191 lt!308075) #b0000000000000000000000000000000000000000000000000000000000000001) lt!308960)))

(declare-fun b!198190 () Bool)

(assert (=> b!198190 (= e!136047 (= (size!4455 (buf!4941 (_1!9191 lt!308075))) (size!4455 (buf!4941 lt!308960))))))

(assert (= (and d!67193 res!165889) b!198190))

(declare-fun m!306705 () Bool)

(assert (=> d!67193 m!306705))

(declare-fun m!306707 () Bool)

(assert (=> d!67193 m!306707))

(declare-fun m!306709 () Bool)

(assert (=> d!67193 m!306709))

(declare-fun m!306711 () Bool)

(assert (=> d!67193 m!306711))

(assert (=> b!197770 d!67193))

(declare-fun d!67195 () Bool)

(declare-fun lt!308977 () tuple2!17094)

(declare-fun lt!308978 () tuple2!17094)

(assert (=> d!67195 (and (= (_2!9192 lt!308977) (_2!9192 lt!308978)) (= (_1!9192 lt!308977) (_1!9192 lt!308978)))))

(declare-fun lt!308976 () BitStream!8018)

(declare-fun lt!308979 () (_ BitVec 64))

(declare-fun lt!308975 () Bool)

(declare-fun lt!308974 () Unit!13975)

(declare-fun choose!56 (BitStream!8018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17094 tuple2!17094 BitStream!8018 (_ BitVec 64) Bool BitStream!8018 (_ BitVec 64) tuple2!17094 tuple2!17094 BitStream!8018 (_ BitVec 64)) Unit!13975)

(assert (=> d!67195 (= lt!308974 (choose!56 (_1!9191 lt!308075) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308060 lt!308977 (tuple2!17095 (_1!9192 lt!308977) (_2!9192 lt!308977)) (_1!9192 lt!308977) (_2!9192 lt!308977) lt!308975 lt!308976 lt!308979 lt!308978 (tuple2!17095 (_1!9192 lt!308978) (_2!9192 lt!308978)) (_1!9192 lt!308978) (_2!9192 lt!308978)))))

(assert (=> d!67195 (= lt!308978 (readNBitsLSBFirstsLoopPure!0 lt!308976 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!308979))))

(assert (=> d!67195 (= lt!308979 (bvor lt!308060 (ite lt!308975 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67195 (= lt!308976 (withMovedBitIndex!0 (_1!9191 lt!308075) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!67195 (= lt!308975 (_2!9190 (readBitPure!0 (_1!9191 lt!308075))))))

(assert (=> d!67195 (= lt!308977 (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308075) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308060))))

(assert (=> d!67195 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9191 lt!308075) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308060) lt!308974)))

(declare-fun bs!16649 () Bool)

(assert (= bs!16649 d!67195))

(declare-fun m!306713 () Bool)

(assert (=> bs!16649 m!306713))

(assert (=> bs!16649 m!305593))

(assert (=> bs!16649 m!305589))

(declare-fun m!306715 () Bool)

(assert (=> bs!16649 m!306715))

(assert (=> bs!16649 m!305569))

(assert (=> b!197770 d!67195))

(declare-fun d!67197 () Bool)

(declare-fun e!136054 () Bool)

(assert (=> d!67197 e!136054))

(declare-fun res!165892 () Bool)

(assert (=> d!67197 (=> (not res!165892) (not e!136054))))

(declare-fun increaseBitIndex!0 (BitStream!8018) tuple2!17088)

(assert (=> d!67197 (= res!165892 (= (buf!4941 (_2!9189 (increaseBitIndex!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))) (buf!4941 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))))

(declare-fun lt!308996 () Bool)

(assert (=> d!67197 (= lt!308996 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))) (currentByte!9279 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308999 () tuple2!17104)

(assert (=> d!67197 (= lt!308999 (tuple2!17105 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))) (currentByte!9279 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9189 (increaseBitIndex!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))))))

(assert (=> d!67197 (validate_offset_bit!0 ((_ sign_extend 32) (size!4455 (buf!4941 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))) ((_ sign_extend 32) (currentByte!9279 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))) ((_ sign_extend 32) (currentBit!9274 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))))

(assert (=> d!67197 (= (readBit!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))) lt!308999)))

(declare-fun lt!308998 () (_ BitVec 64))

(declare-fun lt!309000 () (_ BitVec 64))

(declare-fun b!198193 () Bool)

(assert (=> b!198193 (= e!136054 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 (increaseBitIndex!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))) (currentByte!9279 (_2!9189 (increaseBitIndex!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))) (currentBit!9274 (_2!9189 (increaseBitIndex!0 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))) (bvadd lt!308998 lt!309000)))))

(assert (=> b!198193 (or (not (= (bvand lt!308998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309000 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308998 lt!309000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198193 (= lt!309000 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198193 (= lt!308998 (bitIndex!0 (size!4455 (buf!4941 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))) (currentByte!9279 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))) (currentBit!9274 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))))

(declare-fun lt!308995 () Bool)

(assert (=> b!198193 (= lt!308995 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))) (currentByte!9279 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308994 () Bool)

(assert (=> b!198193 (= lt!308994 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))) (currentByte!9279 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308997 () Bool)

(assert (=> b!198193 (= lt!308997 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))) (currentByte!9279 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (readerFrom!0 (_2!9189 lt!307359) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67197 res!165892) b!198193))

(assert (=> d!67197 m!305173))

(declare-fun m!306717 () Bool)

(assert (=> d!67197 m!306717))

(declare-fun m!306719 () Bool)

(assert (=> d!67197 m!306719))

(declare-fun m!306721 () Bool)

(assert (=> d!67197 m!306721))

(declare-fun m!306723 () Bool)

(assert (=> d!67197 m!306723))

(assert (=> b!198193 m!306719))

(assert (=> b!198193 m!306721))

(assert (=> b!198193 m!305173))

(assert (=> b!198193 m!306717))

(declare-fun m!306725 () Bool)

(assert (=> b!198193 m!306725))

(declare-fun m!306727 () Bool)

(assert (=> b!198193 m!306727))

(assert (=> d!66835 d!67197))

(declare-fun d!67199 () Bool)

(assert (=> d!67199 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308065) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))) lt!308065))))

(declare-fun bs!16650 () Bool)

(assert (= bs!16650 d!67199))

(assert (=> bs!16650 m!305221))

(assert (=> b!197768 d!67199))

(assert (=> b!197793 d!66677))

(declare-fun d!67201 () Bool)

(assert (=> d!67201 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307379)) (buf!4941 (_2!9189 lt!307359)) lt!308174 lt!308183)))

(declare-fun lt!309003 () Unit!13975)

(declare-fun choose!8 (array!10107 array!10107 (_ BitVec 64) (_ BitVec 64)) Unit!13975)

(assert (=> d!67201 (= lt!309003 (choose!8 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!307379)) lt!308174 lt!308183))))

(assert (=> d!67201 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308174) (bvsle lt!308174 lt!308183))))

(assert (=> d!67201 (= (arrayBitRangesEqSymmetric!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!307379)) lt!308174 lt!308183) lt!309003)))

(declare-fun bs!16651 () Bool)

(assert (= bs!16651 d!67201))

(assert (=> bs!16651 m!305701))

(declare-fun m!306729 () Bool)

(assert (=> bs!16651 m!306729))

(assert (=> b!197793 d!67201))

(declare-fun d!67203 () Bool)

(declare-fun res!165903 () Bool)

(declare-fun e!136071 () Bool)

(assert (=> d!67203 (=> res!165903 e!136071)))

(assert (=> d!67203 (= res!165903 (bvsge lt!308174 lt!308183))))

(assert (=> d!67203 (= (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307379)) (buf!4941 (_2!9189 lt!307359)) lt!308174 lt!308183) e!136071)))

(declare-datatypes ((tuple4!260 0))(
  ( (tuple4!261 (_1!9200 (_ BitVec 32)) (_2!9200 (_ BitVec 32)) (_3!646 (_ BitVec 32)) (_4!130 (_ BitVec 32))) )
))
(declare-fun lt!309012 () tuple4!260)

(declare-fun e!136069 () Bool)

(declare-fun b!198208 () Bool)

(declare-fun arrayRangesEq!692 (array!10107 array!10107 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!198208 (= e!136069 (arrayRangesEq!692 (buf!4941 (_2!9189 lt!307379)) (buf!4941 (_2!9189 lt!307359)) (_1!9200 lt!309012) (_2!9200 lt!309012)))))

(declare-fun b!198209 () Bool)

(declare-fun e!136067 () Bool)

(declare-fun e!136070 () Bool)

(assert (=> b!198209 (= e!136067 e!136070)))

(declare-fun res!165907 () Bool)

(declare-fun lt!309011 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!198209 (= res!165907 (byteRangesEq!0 (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_3!646 lt!309012)) (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_3!646 lt!309012)) lt!309011 #b00000000000000000000000000001000))))

(assert (=> b!198209 (=> (not res!165907) (not e!136070))))

(declare-fun bm!3119 () Bool)

(declare-fun c!9868 () Bool)

(declare-fun lt!309010 () (_ BitVec 32))

(declare-fun call!3122 () Bool)

(assert (=> bm!3119 (= call!3122 (byteRangesEq!0 (ite c!9868 (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_3!646 lt!309012)) (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_4!130 lt!309012))) (ite c!9868 (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_3!646 lt!309012)) (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_4!130 lt!309012))) (ite c!9868 lt!309011 #b00000000000000000000000000000000) lt!309010))))

(declare-fun b!198210 () Bool)

(declare-fun e!136072 () Bool)

(assert (=> b!198210 (= e!136072 e!136067)))

(assert (=> b!198210 (= c!9868 (= (_3!646 lt!309012) (_4!130 lt!309012)))))

(declare-fun b!198211 () Bool)

(assert (=> b!198211 (= e!136071 e!136072)))

(declare-fun res!165906 () Bool)

(assert (=> b!198211 (=> (not res!165906) (not e!136072))))

(assert (=> b!198211 (= res!165906 e!136069)))

(declare-fun res!165904 () Bool)

(assert (=> b!198211 (=> res!165904 e!136069)))

(assert (=> b!198211 (= res!165904 (bvsge (_1!9200 lt!309012) (_2!9200 lt!309012)))))

(assert (=> b!198211 (= lt!309010 ((_ extract 31 0) (bvsrem lt!308183 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198211 (= lt!309011 ((_ extract 31 0) (bvsrem lt!308174 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!260)

(assert (=> b!198211 (= lt!309012 (arrayBitIndices!0 lt!308174 lt!308183))))

(declare-fun b!198212 () Bool)

(assert (=> b!198212 (= e!136067 call!3122)))

(declare-fun b!198213 () Bool)

(declare-fun e!136068 () Bool)

(assert (=> b!198213 (= e!136068 call!3122)))

(declare-fun b!198214 () Bool)

(declare-fun res!165905 () Bool)

(assert (=> b!198214 (= res!165905 (= lt!309010 #b00000000000000000000000000000000))))

(assert (=> b!198214 (=> res!165905 e!136068)))

(assert (=> b!198214 (= e!136070 e!136068)))

(assert (= (and d!67203 (not res!165903)) b!198211))

(assert (= (and b!198211 (not res!165904)) b!198208))

(assert (= (and b!198211 res!165906) b!198210))

(assert (= (and b!198210 c!9868) b!198212))

(assert (= (and b!198210 (not c!9868)) b!198209))

(assert (= (and b!198209 res!165907) b!198214))

(assert (= (and b!198214 (not res!165905)) b!198213))

(assert (= (or b!198212 b!198213) bm!3119))

(declare-fun m!306731 () Bool)

(assert (=> b!198208 m!306731))

(declare-fun m!306733 () Bool)

(assert (=> b!198209 m!306733))

(declare-fun m!306735 () Bool)

(assert (=> b!198209 m!306735))

(assert (=> b!198209 m!306733))

(assert (=> b!198209 m!306735))

(declare-fun m!306737 () Bool)

(assert (=> b!198209 m!306737))

(declare-fun m!306739 () Bool)

(assert (=> bm!3119 m!306739))

(assert (=> bm!3119 m!306733))

(declare-fun m!306741 () Bool)

(assert (=> bm!3119 m!306741))

(assert (=> bm!3119 m!306735))

(declare-fun m!306743 () Bool)

(assert (=> bm!3119 m!306743))

(declare-fun m!306745 () Bool)

(assert (=> b!198211 m!306745))

(assert (=> b!197793 d!67203))

(assert (=> d!66827 d!66823))

(declare-fun d!67205 () Bool)

(assert (=> d!67205 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204)) lt!307364)))

(assert (=> d!67205 true))

(declare-fun _$6!367 () Unit!13975)

(assert (=> d!67205 (= (choose!9 thiss!1204 (buf!4941 (_2!9189 lt!307379)) lt!307364 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))) _$6!367)))

(declare-fun bs!16652 () Bool)

(assert (= bs!16652 d!67205))

(assert (=> bs!16652 m!305139))

(assert (=> d!66827 d!67205))

(declare-fun d!67207 () Bool)

(declare-fun res!165908 () Bool)

(declare-fun e!136077 () Bool)

(assert (=> d!67207 (=> res!165908 e!136077)))

(assert (=> d!67207 (= res!165908 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (=> d!67207 (= (arrayBitRangesEq!0 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307359)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))) e!136077)))

(declare-fun lt!309015 () tuple4!260)

(declare-fun e!136075 () Bool)

(declare-fun b!198215 () Bool)

(assert (=> b!198215 (= e!136075 (arrayRangesEq!692 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307359)) (_1!9200 lt!309015) (_2!9200 lt!309015)))))

(declare-fun b!198216 () Bool)

(declare-fun e!136073 () Bool)

(declare-fun e!136076 () Bool)

(assert (=> b!198216 (= e!136073 e!136076)))

(declare-fun res!165912 () Bool)

(declare-fun lt!309014 () (_ BitVec 32))

(assert (=> b!198216 (= res!165912 (byteRangesEq!0 (select (arr!5385 (buf!4941 thiss!1204)) (_3!646 lt!309015)) (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_3!646 lt!309015)) lt!309014 #b00000000000000000000000000001000))))

(assert (=> b!198216 (=> (not res!165912) (not e!136076))))

(declare-fun call!3123 () Bool)

(declare-fun lt!309013 () (_ BitVec 32))

(declare-fun c!9869 () Bool)

(declare-fun bm!3120 () Bool)

(assert (=> bm!3120 (= call!3123 (byteRangesEq!0 (ite c!9869 (select (arr!5385 (buf!4941 thiss!1204)) (_3!646 lt!309015)) (select (arr!5385 (buf!4941 thiss!1204)) (_4!130 lt!309015))) (ite c!9869 (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_3!646 lt!309015)) (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_4!130 lt!309015))) (ite c!9869 lt!309014 #b00000000000000000000000000000000) lt!309013))))

(declare-fun b!198217 () Bool)

(declare-fun e!136078 () Bool)

(assert (=> b!198217 (= e!136078 e!136073)))

(assert (=> b!198217 (= c!9869 (= (_3!646 lt!309015) (_4!130 lt!309015)))))

(declare-fun b!198218 () Bool)

(assert (=> b!198218 (= e!136077 e!136078)))

(declare-fun res!165911 () Bool)

(assert (=> b!198218 (=> (not res!165911) (not e!136078))))

(assert (=> b!198218 (= res!165911 e!136075)))

(declare-fun res!165909 () Bool)

(assert (=> b!198218 (=> res!165909 e!136075)))

(assert (=> b!198218 (= res!165909 (bvsge (_1!9200 lt!309015) (_2!9200 lt!309015)))))

(assert (=> b!198218 (= lt!309013 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198218 (= lt!309014 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198218 (= lt!309015 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(declare-fun b!198219 () Bool)

(assert (=> b!198219 (= e!136073 call!3123)))

(declare-fun b!198220 () Bool)

(declare-fun e!136074 () Bool)

(assert (=> b!198220 (= e!136074 call!3123)))

(declare-fun b!198221 () Bool)

(declare-fun res!165910 () Bool)

(assert (=> b!198221 (= res!165910 (= lt!309013 #b00000000000000000000000000000000))))

(assert (=> b!198221 (=> res!165910 e!136074)))

(assert (=> b!198221 (= e!136076 e!136074)))

(assert (= (and d!67207 (not res!165908)) b!198218))

(assert (= (and b!198218 (not res!165909)) b!198215))

(assert (= (and b!198218 res!165911) b!198217))

(assert (= (and b!198217 c!9869) b!198219))

(assert (= (and b!198217 (not c!9869)) b!198216))

(assert (= (and b!198216 res!165912) b!198221))

(assert (= (and b!198221 (not res!165910)) b!198220))

(assert (= (or b!198219 b!198220) bm!3120))

(declare-fun m!306747 () Bool)

(assert (=> b!198215 m!306747))

(declare-fun m!306749 () Bool)

(assert (=> b!198216 m!306749))

(declare-fun m!306751 () Bool)

(assert (=> b!198216 m!306751))

(assert (=> b!198216 m!306749))

(assert (=> b!198216 m!306751))

(declare-fun m!306753 () Bool)

(assert (=> b!198216 m!306753))

(declare-fun m!306755 () Bool)

(assert (=> bm!3120 m!306755))

(assert (=> bm!3120 m!306749))

(declare-fun m!306757 () Bool)

(assert (=> bm!3120 m!306757))

(assert (=> bm!3120 m!306751))

(declare-fun m!306759 () Bool)

(assert (=> bm!3120 m!306759))

(assert (=> b!198218 m!305117))

(declare-fun m!306761 () Bool)

(assert (=> b!198218 m!306761))

(assert (=> b!197804 d!67207))

(assert (=> b!197804 d!66681))

(assert (=> b!197802 d!66681))

(assert (=> b!197802 d!66677))

(declare-fun d!67209 () Bool)

(assert (=> d!67209 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!309016 () Unit!13975)

(assert (=> d!67209 (= lt!309016 (choose!11 thiss!1204))))

(assert (=> d!67209 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!309016)))

(declare-fun bs!16653 () Bool)

(assert (= bs!16653 d!67209))

(assert (=> bs!16653 m!305659))

(declare-fun m!306763 () Bool)

(assert (=> bs!16653 m!306763))

(assert (=> d!66797 d!67209))

(declare-fun d!67211 () Bool)

(assert (=> d!67211 (isPrefixOf!0 lt!308161 (_2!9189 lt!307379))))

(declare-fun lt!309017 () Unit!13975)

(assert (=> d!67211 (= lt!309017 (choose!30 lt!308161 (_2!9189 lt!307379) (_2!9189 lt!307379)))))

(assert (=> d!67211 (isPrefixOf!0 lt!308161 (_2!9189 lt!307379))))

(assert (=> d!67211 (= (lemmaIsPrefixTransitive!0 lt!308161 (_2!9189 lt!307379) (_2!9189 lt!307379)) lt!309017)))

(declare-fun bs!16654 () Bool)

(assert (= bs!16654 d!67211))

(assert (=> bs!16654 m!305661))

(declare-fun m!306765 () Bool)

(assert (=> bs!16654 m!306765))

(assert (=> bs!16654 m!305661))

(assert (=> d!66797 d!67211))

(declare-fun d!67213 () Bool)

(declare-fun res!165913 () Bool)

(declare-fun e!136080 () Bool)

(assert (=> d!67213 (=> (not res!165913) (not e!136080))))

(assert (=> d!67213 (= res!165913 (= (size!4455 (buf!4941 thiss!1204)) (size!4455 (buf!4941 thiss!1204))))))

(assert (=> d!67213 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!136080)))

(declare-fun b!198222 () Bool)

(declare-fun res!165914 () Bool)

(assert (=> b!198222 (=> (not res!165914) (not e!136080))))

(assert (=> b!198222 (= res!165914 (bvsle (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)) (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(declare-fun b!198223 () Bool)

(declare-fun e!136079 () Bool)

(assert (=> b!198223 (= e!136080 e!136079)))

(declare-fun res!165915 () Bool)

(assert (=> b!198223 (=> res!165915 e!136079)))

(assert (=> b!198223 (= res!165915 (= (size!4455 (buf!4941 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198224 () Bool)

(assert (=> b!198224 (= e!136079 (arrayBitRangesEq!0 (buf!4941 thiss!1204) (buf!4941 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (= (and d!67213 res!165913) b!198222))

(assert (= (and b!198222 res!165914) b!198223))

(assert (= (and b!198223 (not res!165915)) b!198224))

(assert (=> b!198222 m!305117))

(assert (=> b!198222 m!305117))

(assert (=> b!198224 m!305117))

(assert (=> b!198224 m!305117))

(declare-fun m!306767 () Bool)

(assert (=> b!198224 m!306767))

(assert (=> d!66797 d!67213))

(declare-fun d!67215 () Bool)

(assert (=> d!67215 (isPrefixOf!0 lt!308161 lt!308161)))

(declare-fun lt!309018 () Unit!13975)

(assert (=> d!67215 (= lt!309018 (choose!11 lt!308161))))

(assert (=> d!67215 (= (lemmaIsPrefixRefl!0 lt!308161) lt!309018)))

(declare-fun bs!16655 () Bool)

(assert (= bs!16655 d!67215))

(assert (=> bs!16655 m!305651))

(declare-fun m!306769 () Bool)

(assert (=> bs!16655 m!306769))

(assert (=> d!66797 d!67215))

(declare-fun d!67217 () Bool)

(assert (=> d!67217 (isPrefixOf!0 lt!308161 (_2!9189 lt!307379))))

(declare-fun lt!309019 () Unit!13975)

(assert (=> d!67217 (= lt!309019 (choose!30 lt!308161 thiss!1204 (_2!9189 lt!307379)))))

(assert (=> d!67217 (isPrefixOf!0 lt!308161 thiss!1204)))

(assert (=> d!67217 (= (lemmaIsPrefixTransitive!0 lt!308161 thiss!1204 (_2!9189 lt!307379)) lt!309019)))

(declare-fun bs!16656 () Bool)

(assert (= bs!16656 d!67217))

(assert (=> bs!16656 m!305661))

(declare-fun m!306771 () Bool)

(assert (=> bs!16656 m!306771))

(declare-fun m!306773 () Bool)

(assert (=> bs!16656 m!306773))

(assert (=> d!66797 d!67217))

(declare-fun d!67219 () Bool)

(declare-fun res!165916 () Bool)

(declare-fun e!136082 () Bool)

(assert (=> d!67219 (=> (not res!165916) (not e!136082))))

(assert (=> d!67219 (= res!165916 (= (size!4455 (buf!4941 lt!308161)) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (=> d!67219 (= (isPrefixOf!0 lt!308161 (_2!9189 lt!307379)) e!136082)))

(declare-fun b!198225 () Bool)

(declare-fun res!165917 () Bool)

(assert (=> b!198225 (=> (not res!165917) (not e!136082))))

(assert (=> b!198225 (= res!165917 (bvsle (bitIndex!0 (size!4455 (buf!4941 lt!308161)) (currentByte!9279 lt!308161) (currentBit!9274 lt!308161)) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379)))))))

(declare-fun b!198226 () Bool)

(declare-fun e!136081 () Bool)

(assert (=> b!198226 (= e!136082 e!136081)))

(declare-fun res!165918 () Bool)

(assert (=> b!198226 (=> res!165918 e!136081)))

(assert (=> b!198226 (= res!165918 (= (size!4455 (buf!4941 lt!308161)) #b00000000000000000000000000000000))))

(declare-fun b!198227 () Bool)

(assert (=> b!198227 (= e!136081 (arrayBitRangesEq!0 (buf!4941 lt!308161) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 lt!308161)) (currentByte!9279 lt!308161) (currentBit!9274 lt!308161))))))

(assert (= (and d!67219 res!165916) b!198225))

(assert (= (and b!198225 res!165917) b!198226))

(assert (= (and b!198226 (not res!165918)) b!198227))

(declare-fun m!306775 () Bool)

(assert (=> b!198225 m!306775))

(assert (=> b!198225 m!305121))

(assert (=> b!198227 m!306775))

(assert (=> b!198227 m!306775))

(declare-fun m!306777 () Bool)

(assert (=> b!198227 m!306777))

(assert (=> d!66797 d!67219))

(assert (=> d!66797 d!66687))

(declare-fun d!67221 () Bool)

(declare-fun res!165919 () Bool)

(declare-fun e!136084 () Bool)

(assert (=> d!67221 (=> (not res!165919) (not e!136084))))

(assert (=> d!67221 (= res!165919 (= (size!4455 (buf!4941 lt!308161)) (size!4455 (buf!4941 lt!308161))))))

(assert (=> d!67221 (= (isPrefixOf!0 lt!308161 lt!308161) e!136084)))

(declare-fun b!198228 () Bool)

(declare-fun res!165920 () Bool)

(assert (=> b!198228 (=> (not res!165920) (not e!136084))))

(assert (=> b!198228 (= res!165920 (bvsle (bitIndex!0 (size!4455 (buf!4941 lt!308161)) (currentByte!9279 lt!308161) (currentBit!9274 lt!308161)) (bitIndex!0 (size!4455 (buf!4941 lt!308161)) (currentByte!9279 lt!308161) (currentBit!9274 lt!308161))))))

(declare-fun b!198229 () Bool)

(declare-fun e!136083 () Bool)

(assert (=> b!198229 (= e!136084 e!136083)))

(declare-fun res!165921 () Bool)

(assert (=> b!198229 (=> res!165921 e!136083)))

(assert (=> b!198229 (= res!165921 (= (size!4455 (buf!4941 lt!308161)) #b00000000000000000000000000000000))))

(declare-fun b!198230 () Bool)

(assert (=> b!198230 (= e!136083 (arrayBitRangesEq!0 (buf!4941 lt!308161) (buf!4941 lt!308161) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 lt!308161)) (currentByte!9279 lt!308161) (currentBit!9274 lt!308161))))))

(assert (= (and d!67221 res!165919) b!198228))

(assert (= (and b!198228 res!165920) b!198229))

(assert (= (and b!198229 (not res!165921)) b!198230))

(assert (=> b!198228 m!306775))

(assert (=> b!198228 m!306775))

(assert (=> b!198230 m!306775))

(assert (=> b!198230 m!306775))

(declare-fun m!306779 () Bool)

(assert (=> b!198230 m!306779))

(assert (=> d!66797 d!67221))

(declare-fun d!67223 () Bool)

(declare-fun res!165922 () Bool)

(declare-fun e!136086 () Bool)

(assert (=> d!67223 (=> (not res!165922) (not e!136086))))

(assert (=> d!67223 (= res!165922 (= (size!4455 (buf!4941 (_1!9191 lt!308157))) (size!4455 (buf!4941 (_2!9191 lt!308157)))))))

(assert (=> d!67223 (= (isPrefixOf!0 (_1!9191 lt!308157) (_2!9191 lt!308157)) e!136086)))

(declare-fun b!198231 () Bool)

(declare-fun res!165923 () Bool)

(assert (=> b!198231 (=> (not res!165923) (not e!136086))))

(assert (=> b!198231 (= res!165923 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308157))) (currentByte!9279 (_1!9191 lt!308157)) (currentBit!9274 (_1!9191 lt!308157))) (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308157))) (currentByte!9279 (_2!9191 lt!308157)) (currentBit!9274 (_2!9191 lt!308157)))))))

(declare-fun b!198232 () Bool)

(declare-fun e!136085 () Bool)

(assert (=> b!198232 (= e!136086 e!136085)))

(declare-fun res!165924 () Bool)

(assert (=> b!198232 (=> res!165924 e!136085)))

(assert (=> b!198232 (= res!165924 (= (size!4455 (buf!4941 (_1!9191 lt!308157))) #b00000000000000000000000000000000))))

(declare-fun b!198233 () Bool)

(assert (=> b!198233 (= e!136085 (arrayBitRangesEq!0 (buf!4941 (_1!9191 lt!308157)) (buf!4941 (_2!9191 lt!308157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308157))) (currentByte!9279 (_1!9191 lt!308157)) (currentBit!9274 (_1!9191 lt!308157)))))))

(assert (= (and d!67223 res!165922) b!198231))

(assert (= (and b!198231 res!165923) b!198232))

(assert (= (and b!198232 (not res!165924)) b!198233))

(assert (=> b!198231 m!306441))

(assert (=> b!198231 m!306397))

(assert (=> b!198233 m!306441))

(assert (=> b!198233 m!306441))

(declare-fun m!306781 () Bool)

(assert (=> b!198233 m!306781))

(assert (=> d!66797 d!67223))

(assert (=> d!66797 d!67093))

(assert (=> d!66797 d!67095))

(declare-fun d!67225 () Bool)

(declare-fun res!165925 () Bool)

(declare-fun e!136088 () Bool)

(assert (=> d!67225 (=> (not res!165925) (not e!136088))))

(assert (=> d!67225 (= res!165925 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (ite c!9831 (_2!9189 lt!307359) (_2!9189 lt!308091))))))))

(assert (=> d!67225 (= (isPrefixOf!0 (_2!9189 lt!307359) (ite c!9831 (_2!9189 lt!307359) (_2!9189 lt!308091))) e!136088)))

(declare-fun b!198234 () Bool)

(declare-fun res!165926 () Bool)

(assert (=> b!198234 (=> (not res!165926) (not e!136088))))

(assert (=> b!198234 (= res!165926 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (ite c!9831 (_2!9189 lt!307359) (_2!9189 lt!308091)))) (currentByte!9279 (ite c!9831 (_2!9189 lt!307359) (_2!9189 lt!308091))) (currentBit!9274 (ite c!9831 (_2!9189 lt!307359) (_2!9189 lt!308091))))))))

(declare-fun b!198235 () Bool)

(declare-fun e!136087 () Bool)

(assert (=> b!198235 (= e!136088 e!136087)))

(declare-fun res!165927 () Bool)

(assert (=> b!198235 (=> res!165927 e!136087)))

(assert (=> b!198235 (= res!165927 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) #b00000000000000000000000000000000))))

(declare-fun b!198236 () Bool)

(assert (=> b!198236 (= e!136087 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (ite c!9831 (_2!9189 lt!307359) (_2!9189 lt!308091))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (= (and d!67225 res!165925) b!198234))

(assert (= (and b!198234 res!165926) b!198235))

(assert (= (and b!198235 (not res!165927)) b!198236))

(assert (=> b!198234 m!305115))

(declare-fun m!306783 () Bool)

(assert (=> b!198234 m!306783))

(assert (=> b!198236 m!305115))

(assert (=> b!198236 m!305115))

(declare-fun m!306785 () Bool)

(assert (=> b!198236 m!306785))

(assert (=> bm!3104 d!67225))

(declare-fun d!67227 () Bool)

(declare-fun lt!309020 () tuple2!17104)

(assert (=> d!67227 (= lt!309020 (readBit!0 (readerFrom!0 (_2!9189 lt!308091) (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)))))))

(assert (=> d!67227 (= (readBitPure!0 (readerFrom!0 (_2!9189 lt!308091) (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)))) (tuple2!17091 (_2!9197 lt!309020) (_1!9197 lt!309020)))))

(declare-fun bs!16657 () Bool)

(assert (= bs!16657 d!67227))

(assert (=> bs!16657 m!305647))

(declare-fun m!306787 () Bool)

(assert (=> bs!16657 m!306787))

(assert (=> b!197763 d!67227))

(declare-fun d!67229 () Bool)

(declare-fun e!136089 () Bool)

(assert (=> d!67229 e!136089))

(declare-fun res!165928 () Bool)

(assert (=> d!67229 (=> (not res!165928) (not e!136089))))

(assert (=> d!67229 (= res!165928 (invariant!0 (currentBit!9274 (_2!9189 lt!308091)) (currentByte!9279 (_2!9189 lt!308091)) (size!4455 (buf!4941 (_2!9189 lt!308091)))))))

(assert (=> d!67229 (= (readerFrom!0 (_2!9189 lt!308091) (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359))) (BitStream!8019 (buf!4941 (_2!9189 lt!308091)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(declare-fun b!198237 () Bool)

(assert (=> b!198237 (= e!136089 (invariant!0 (currentBit!9274 (_2!9189 lt!307359)) (currentByte!9279 (_2!9189 lt!307359)) (size!4455 (buf!4941 (_2!9189 lt!308091)))))))

(assert (= (and d!67229 res!165928) b!198237))

(assert (=> d!67229 m!306433))

(declare-fun m!306789 () Bool)

(assert (=> b!198237 m!306789))

(assert (=> b!197763 d!67229))

(declare-fun d!67231 () Bool)

(assert (=> d!67231 (= (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307372)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307372))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307372)))) (bvsub (bvmul ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307372)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307372))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307372))))))))

(assert (=> d!66667 d!67231))

(declare-fun d!67233 () Bool)

(assert (=> d!67233 (= (invariant!0 (currentBit!9274 (_1!9190 lt!307372)) (currentByte!9279 (_1!9190 lt!307372)) (size!4455 (buf!4941 (_1!9190 lt!307372)))) (and (bvsge (currentBit!9274 (_1!9190 lt!307372)) #b00000000000000000000000000000000) (bvslt (currentBit!9274 (_1!9190 lt!307372)) #b00000000000000000000000000001000) (bvsge (currentByte!9279 (_1!9190 lt!307372)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 (_1!9190 lt!307372)) (size!4455 (buf!4941 (_1!9190 lt!307372)))) (and (= (currentBit!9274 (_1!9190 lt!307372)) #b00000000000000000000000000000000) (= (currentByte!9279 (_1!9190 lt!307372)) (size!4455 (buf!4941 (_1!9190 lt!307372))))))))))

(assert (=> d!66667 d!67233))

(assert (=> b!197761 d!67089))

(assert (=> d!66843 d!66841))

(assert (=> b!197788 d!66681))

(declare-fun d!67235 () Bool)

(assert (=> d!67235 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307379)) (buf!4941 thiss!1204) lt!308151 lt!308160)))

(declare-fun lt!309021 () Unit!13975)

(assert (=> d!67235 (= lt!309021 (choose!8 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307379)) lt!308151 lt!308160))))

(assert (=> d!67235 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308151) (bvsle lt!308151 lt!308160))))

(assert (=> d!67235 (= (arrayBitRangesEqSymmetric!0 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307379)) lt!308151 lt!308160) lt!309021)))

(declare-fun bs!16658 () Bool)

(assert (= bs!16658 d!67235))

(assert (=> bs!16658 m!305673))

(declare-fun m!306791 () Bool)

(assert (=> bs!16658 m!306791))

(assert (=> b!197788 d!67235))

(declare-fun d!67237 () Bool)

(declare-fun res!165929 () Bool)

(declare-fun e!136094 () Bool)

(assert (=> d!67237 (=> res!165929 e!136094)))

(assert (=> d!67237 (= res!165929 (bvsge lt!308151 lt!308160))))

(assert (=> d!67237 (= (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307379)) (buf!4941 thiss!1204) lt!308151 lt!308160) e!136094)))

(declare-fun e!136092 () Bool)

(declare-fun b!198238 () Bool)

(declare-fun lt!309024 () tuple4!260)

(assert (=> b!198238 (= e!136092 (arrayRangesEq!692 (buf!4941 (_2!9189 lt!307379)) (buf!4941 thiss!1204) (_1!9200 lt!309024) (_2!9200 lt!309024)))))

(declare-fun b!198239 () Bool)

(declare-fun e!136090 () Bool)

(declare-fun e!136093 () Bool)

(assert (=> b!198239 (= e!136090 e!136093)))

(declare-fun res!165933 () Bool)

(declare-fun lt!309023 () (_ BitVec 32))

(assert (=> b!198239 (= res!165933 (byteRangesEq!0 (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_3!646 lt!309024)) (select (arr!5385 (buf!4941 thiss!1204)) (_3!646 lt!309024)) lt!309023 #b00000000000000000000000000001000))))

(assert (=> b!198239 (=> (not res!165933) (not e!136093))))

(declare-fun bm!3121 () Bool)

(declare-fun call!3124 () Bool)

(declare-fun lt!309022 () (_ BitVec 32))

(declare-fun c!9870 () Bool)

(assert (=> bm!3121 (= call!3124 (byteRangesEq!0 (ite c!9870 (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_3!646 lt!309024)) (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_4!130 lt!309024))) (ite c!9870 (select (arr!5385 (buf!4941 thiss!1204)) (_3!646 lt!309024)) (select (arr!5385 (buf!4941 thiss!1204)) (_4!130 lt!309024))) (ite c!9870 lt!309023 #b00000000000000000000000000000000) lt!309022))))

(declare-fun b!198240 () Bool)

(declare-fun e!136095 () Bool)

(assert (=> b!198240 (= e!136095 e!136090)))

(assert (=> b!198240 (= c!9870 (= (_3!646 lt!309024) (_4!130 lt!309024)))))

(declare-fun b!198241 () Bool)

(assert (=> b!198241 (= e!136094 e!136095)))

(declare-fun res!165932 () Bool)

(assert (=> b!198241 (=> (not res!165932) (not e!136095))))

(assert (=> b!198241 (= res!165932 e!136092)))

(declare-fun res!165930 () Bool)

(assert (=> b!198241 (=> res!165930 e!136092)))

(assert (=> b!198241 (= res!165930 (bvsge (_1!9200 lt!309024) (_2!9200 lt!309024)))))

(assert (=> b!198241 (= lt!309022 ((_ extract 31 0) (bvsrem lt!308160 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198241 (= lt!309023 ((_ extract 31 0) (bvsrem lt!308151 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198241 (= lt!309024 (arrayBitIndices!0 lt!308151 lt!308160))))

(declare-fun b!198242 () Bool)

(assert (=> b!198242 (= e!136090 call!3124)))

(declare-fun b!198243 () Bool)

(declare-fun e!136091 () Bool)

(assert (=> b!198243 (= e!136091 call!3124)))

(declare-fun b!198244 () Bool)

(declare-fun res!165931 () Bool)

(assert (=> b!198244 (= res!165931 (= lt!309022 #b00000000000000000000000000000000))))

(assert (=> b!198244 (=> res!165931 e!136091)))

(assert (=> b!198244 (= e!136093 e!136091)))

(assert (= (and d!67237 (not res!165929)) b!198241))

(assert (= (and b!198241 (not res!165930)) b!198238))

(assert (= (and b!198241 res!165932) b!198240))

(assert (= (and b!198240 c!9870) b!198242))

(assert (= (and b!198240 (not c!9870)) b!198239))

(assert (= (and b!198239 res!165933) b!198244))

(assert (= (and b!198244 (not res!165931)) b!198243))

(assert (= (or b!198242 b!198243) bm!3121))

(declare-fun m!306793 () Bool)

(assert (=> b!198238 m!306793))

(declare-fun m!306795 () Bool)

(assert (=> b!198239 m!306795))

(declare-fun m!306797 () Bool)

(assert (=> b!198239 m!306797))

(assert (=> b!198239 m!306795))

(assert (=> b!198239 m!306797))

(declare-fun m!306799 () Bool)

(assert (=> b!198239 m!306799))

(declare-fun m!306801 () Bool)

(assert (=> bm!3121 m!306801))

(assert (=> bm!3121 m!306795))

(declare-fun m!306803 () Bool)

(assert (=> bm!3121 m!306803))

(assert (=> bm!3121 m!306797))

(declare-fun m!306805 () Bool)

(assert (=> bm!3121 m!306805))

(declare-fun m!306807 () Bool)

(assert (=> b!198241 m!306807))

(assert (=> b!197788 d!67237))

(assert (=> d!66681 d!67125))

(assert (=> d!66681 d!66841))

(declare-fun d!67239 () Bool)

(declare-fun e!136096 () Bool)

(assert (=> d!67239 e!136096))

(declare-fun res!165934 () Bool)

(assert (=> d!67239 (=> (not res!165934) (not e!136096))))

(declare-fun lt!309029 () (_ BitVec 64))

(declare-fun lt!309027 () (_ BitVec 64))

(declare-fun lt!309028 () (_ BitVec 64))

(assert (=> d!67239 (= res!165934 (= lt!309027 (bvsub lt!309028 lt!309029)))))

(assert (=> d!67239 (or (= (bvand lt!309028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309029 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309028 lt!309029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67239 (= lt!309029 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308084)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308084))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308084)))))))

(declare-fun lt!309030 () (_ BitVec 64))

(declare-fun lt!309026 () (_ BitVec 64))

(assert (=> d!67239 (= lt!309028 (bvmul lt!309030 lt!309026))))

(assert (=> d!67239 (or (= lt!309030 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309026 (bvsdiv (bvmul lt!309030 lt!309026) lt!309030)))))

(assert (=> d!67239 (= lt!309026 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67239 (= lt!309030 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308084)))))))

(assert (=> d!67239 (= lt!309027 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!308084))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!308084)))))))

(assert (=> d!67239 (invariant!0 (currentBit!9274 (_2!9189 lt!308084)) (currentByte!9279 (_2!9189 lt!308084)) (size!4455 (buf!4941 (_2!9189 lt!308084))))))

(assert (=> d!67239 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308084))) (currentByte!9279 (_2!9189 lt!308084)) (currentBit!9274 (_2!9189 lt!308084))) lt!309027)))

(declare-fun b!198245 () Bool)

(declare-fun res!165935 () Bool)

(assert (=> b!198245 (=> (not res!165935) (not e!136096))))

(assert (=> b!198245 (= res!165935 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309027))))

(declare-fun b!198246 () Bool)

(declare-fun lt!309025 () (_ BitVec 64))

(assert (=> b!198246 (= e!136096 (bvsle lt!309027 (bvmul lt!309025 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198246 (or (= lt!309025 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309025 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309025)))))

(assert (=> b!198246 (= lt!309025 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308084)))))))

(assert (= (and d!67239 res!165934) b!198245))

(assert (= (and b!198245 res!165935) b!198246))

(declare-fun m!306809 () Bool)

(assert (=> d!67239 m!306809))

(assert (=> d!67239 m!305645))

(assert (=> b!197759 d!67239))

(assert (=> b!197759 d!66677))

(declare-fun d!67241 () Bool)

(assert (=> d!67241 (= (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))) (bvsub (bvmul ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307359)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))))))))

(assert (=> d!66677 d!67241))

(assert (=> d!66677 d!67107))

(declare-fun d!67243 () Bool)

(declare-fun e!136097 () Bool)

(assert (=> d!67243 e!136097))

(declare-fun res!165936 () Bool)

(assert (=> d!67243 (=> (not res!165936) (not e!136097))))

(declare-fun lt!309035 () (_ BitVec 64))

(declare-fun lt!309033 () (_ BitVec 64))

(declare-fun lt!309034 () (_ BitVec 64))

(assert (=> d!67243 (= res!165936 (= lt!309033 (bvsub lt!309034 lt!309035)))))

(assert (=> d!67243 (or (= (bvand lt!309034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309035 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309034 lt!309035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67243 (= lt!309035 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307468)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307468))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307468)))))))

(declare-fun lt!309036 () (_ BitVec 64))

(declare-fun lt!309032 () (_ BitVec 64))

(assert (=> d!67243 (= lt!309034 (bvmul lt!309036 lt!309032))))

(assert (=> d!67243 (or (= lt!309036 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309032 (bvsdiv (bvmul lt!309036 lt!309032) lt!309036)))))

(assert (=> d!67243 (= lt!309032 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67243 (= lt!309036 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307468)))))))

(assert (=> d!67243 (= lt!309033 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307468))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307468)))))))

(assert (=> d!67243 (invariant!0 (currentBit!9274 (_1!9190 lt!307468)) (currentByte!9279 (_1!9190 lt!307468)) (size!4455 (buf!4941 (_1!9190 lt!307468))))))

(assert (=> d!67243 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!307468))) (currentByte!9279 (_1!9190 lt!307468)) (currentBit!9274 (_1!9190 lt!307468))) lt!309033)))

(declare-fun b!198247 () Bool)

(declare-fun res!165937 () Bool)

(assert (=> b!198247 (=> (not res!165937) (not e!136097))))

(assert (=> b!198247 (= res!165937 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309033))))

(declare-fun b!198248 () Bool)

(declare-fun lt!309031 () (_ BitVec 64))

(assert (=> b!198248 (= e!136097 (bvsle lt!309033 (bvmul lt!309031 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198248 (or (= lt!309031 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309031 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309031)))))

(assert (=> b!198248 (= lt!309031 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307468)))))))

(assert (= (and d!67243 res!165936) b!198247))

(assert (= (and b!198247 res!165937) b!198248))

(declare-fun m!306811 () Bool)

(assert (=> d!67243 m!306811))

(declare-fun m!306813 () Bool)

(assert (=> d!67243 m!306813))

(assert (=> b!197574 d!67243))

(assert (=> b!197574 d!67121))

(declare-fun d!67245 () Bool)

(assert (=> d!67245 (= (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))) (bvsub (bvmul ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))))))))

(assert (=> d!66805 d!67245))

(assert (=> d!66689 d!66687))

(declare-fun d!67247 () Bool)

(assert (=> d!67247 (isPrefixOf!0 thiss!1204 (_2!9189 lt!307379))))

(assert (=> d!67247 true))

(declare-fun _$15!291 () Unit!13975)

(assert (=> d!67247 (= (choose!30 thiss!1204 (_2!9189 lt!307359) (_2!9189 lt!307379)) _$15!291)))

(declare-fun bs!16659 () Bool)

(assert (= bs!16659 d!67247))

(assert (=> bs!16659 m!305123))

(assert (=> d!66689 d!67247))

(assert (=> d!66689 d!66833))

(assert (=> d!66817 d!66805))

(declare-fun d!67249 () Bool)

(assert (=> d!67249 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!307366)))

(assert (=> d!67249 true))

(declare-fun _$6!368 () Unit!13975)

(assert (=> d!67249 (= (choose!9 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!307379)) lt!307366 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))) _$6!368)))

(declare-fun bs!16660 () Bool)

(assert (= bs!16660 d!67249))

(assert (=> bs!16660 m!305147))

(assert (=> d!66817 d!67249))

(assert (=> b!197820 d!66677))

(assert (=> b!197820 d!66685))

(declare-fun d!67251 () Bool)

(declare-fun res!165938 () Bool)

(declare-fun e!136099 () Bool)

(assert (=> d!67251 (=> (not res!165938) (not e!136099))))

(assert (=> d!67251 (= res!165938 (= (size!4455 (buf!4941 thiss!1204)) (size!4455 (buf!4941 (_2!9189 lt!307471)))))))

(assert (=> d!67251 (= (isPrefixOf!0 thiss!1204 (_2!9189 lt!307471)) e!136099)))

(declare-fun b!198249 () Bool)

(declare-fun res!165939 () Bool)

(assert (=> b!198249 (=> (not res!165939) (not e!136099))))

(assert (=> b!198249 (= res!165939 (bvsle (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307471))) (currentByte!9279 (_2!9189 lt!307471)) (currentBit!9274 (_2!9189 lt!307471)))))))

(declare-fun b!198250 () Bool)

(declare-fun e!136098 () Bool)

(assert (=> b!198250 (= e!136099 e!136098)))

(declare-fun res!165940 () Bool)

(assert (=> b!198250 (=> res!165940 e!136098)))

(assert (=> b!198250 (= res!165940 (= (size!4455 (buf!4941 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198251 () Bool)

(assert (=> b!198251 (= e!136098 (arrayBitRangesEq!0 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307471)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (= (and d!67251 res!165938) b!198249))

(assert (= (and b!198249 res!165939) b!198250))

(assert (= (and b!198250 (not res!165940)) b!198251))

(assert (=> b!198249 m!305117))

(assert (=> b!198249 m!305225))

(assert (=> b!198251 m!305117))

(assert (=> b!198251 m!305117))

(declare-fun m!306815 () Bool)

(assert (=> b!198251 m!306815))

(assert (=> b!197572 d!67251))

(declare-fun d!67253 () Bool)

(declare-fun res!165941 () Bool)

(declare-fun e!136104 () Bool)

(assert (=> d!67253 (=> res!165941 e!136104)))

(assert (=> d!67253 (= res!165941 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (=> d!67253 (= (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))) e!136104)))

(declare-fun lt!309039 () tuple4!260)

(declare-fun b!198252 () Bool)

(declare-fun e!136102 () Bool)

(assert (=> b!198252 (= e!136102 (arrayRangesEq!692 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!307379)) (_1!9200 lt!309039) (_2!9200 lt!309039)))))

(declare-fun b!198253 () Bool)

(declare-fun e!136100 () Bool)

(declare-fun e!136103 () Bool)

(assert (=> b!198253 (= e!136100 e!136103)))

(declare-fun lt!309038 () (_ BitVec 32))

(declare-fun res!165945 () Bool)

(assert (=> b!198253 (= res!165945 (byteRangesEq!0 (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_3!646 lt!309039)) (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_3!646 lt!309039)) lt!309038 #b00000000000000000000000000001000))))

(assert (=> b!198253 (=> (not res!165945) (not e!136103))))

(declare-fun call!3125 () Bool)

(declare-fun lt!309037 () (_ BitVec 32))

(declare-fun c!9871 () Bool)

(declare-fun bm!3122 () Bool)

(assert (=> bm!3122 (= call!3125 (byteRangesEq!0 (ite c!9871 (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_3!646 lt!309039)) (select (arr!5385 (buf!4941 (_2!9189 lt!307359))) (_4!130 lt!309039))) (ite c!9871 (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_3!646 lt!309039)) (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_4!130 lt!309039))) (ite c!9871 lt!309038 #b00000000000000000000000000000000) lt!309037))))

(declare-fun b!198254 () Bool)

(declare-fun e!136105 () Bool)

(assert (=> b!198254 (= e!136105 e!136100)))

(assert (=> b!198254 (= c!9871 (= (_3!646 lt!309039) (_4!130 lt!309039)))))

(declare-fun b!198255 () Bool)

(assert (=> b!198255 (= e!136104 e!136105)))

(declare-fun res!165944 () Bool)

(assert (=> b!198255 (=> (not res!165944) (not e!136105))))

(assert (=> b!198255 (= res!165944 e!136102)))

(declare-fun res!165942 () Bool)

(assert (=> b!198255 (=> res!165942 e!136102)))

(assert (=> b!198255 (= res!165942 (bvsge (_1!9200 lt!309039) (_2!9200 lt!309039)))))

(assert (=> b!198255 (= lt!309037 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198255 (= lt!309038 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198255 (= lt!309039 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(declare-fun b!198256 () Bool)

(assert (=> b!198256 (= e!136100 call!3125)))

(declare-fun b!198257 () Bool)

(declare-fun e!136101 () Bool)

(assert (=> b!198257 (= e!136101 call!3125)))

(declare-fun b!198258 () Bool)

(declare-fun res!165943 () Bool)

(assert (=> b!198258 (= res!165943 (= lt!309037 #b00000000000000000000000000000000))))

(assert (=> b!198258 (=> res!165943 e!136101)))

(assert (=> b!198258 (= e!136103 e!136101)))

(assert (= (and d!67253 (not res!165941)) b!198255))

(assert (= (and b!198255 (not res!165942)) b!198252))

(assert (= (and b!198255 res!165944) b!198254))

(assert (= (and b!198254 c!9871) b!198256))

(assert (= (and b!198254 (not c!9871)) b!198253))

(assert (= (and b!198253 res!165945) b!198258))

(assert (= (and b!198258 (not res!165943)) b!198257))

(assert (= (or b!198256 b!198257) bm!3122))

(declare-fun m!306817 () Bool)

(assert (=> b!198252 m!306817))

(declare-fun m!306819 () Bool)

(assert (=> b!198253 m!306819))

(declare-fun m!306821 () Bool)

(assert (=> b!198253 m!306821))

(assert (=> b!198253 m!306819))

(assert (=> b!198253 m!306821))

(declare-fun m!306823 () Bool)

(assert (=> b!198253 m!306823))

(declare-fun m!306825 () Bool)

(assert (=> bm!3122 m!306825))

(assert (=> bm!3122 m!306819))

(declare-fun m!306827 () Bool)

(assert (=> bm!3122 m!306827))

(assert (=> bm!3122 m!306821))

(declare-fun m!306829 () Bool)

(assert (=> bm!3122 m!306829))

(assert (=> b!198255 m!305115))

(declare-fun m!306831 () Bool)

(assert (=> b!198255 m!306831))

(assert (=> b!197822 d!67253))

(assert (=> b!197822 d!66677))

(declare-fun b!198270 () Bool)

(declare-fun e!136115 () Bool)

(declare-fun lt!309042 () tuple2!17090)

(declare-fun _$19!156 () tuple2!17088)

(assert (=> b!198270 (= e!136115 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!309042))) (currentByte!9279 (_1!9190 lt!309042)) (currentBit!9274 (_1!9190 lt!309042))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 _$19!156))) (currentByte!9279 (_2!9189 _$19!156)) (currentBit!9274 (_2!9189 _$19!156)))))))

(declare-fun b!198271 () Bool)

(declare-fun e!136117 () Bool)

(assert (=> b!198271 (= e!136117 (array_inv!4196 (buf!4941 (_2!9189 _$19!156))))))

(declare-fun b!198272 () Bool)

(declare-fun res!165955 () Bool)

(declare-fun e!136116 () Bool)

(assert (=> b!198272 (=> (not res!165955) (not e!136116))))

(assert (=> b!198272 (= res!165955 (isPrefixOf!0 thiss!1204 (_2!9189 _$19!156)))))

(declare-fun b!198273 () Bool)

(assert (=> b!198273 (= e!136116 e!136115)))

(declare-fun res!165956 () Bool)

(assert (=> b!198273 (=> (not res!165956) (not e!136115))))

(assert (=> b!198273 (= res!165956 (and (= (_2!9190 lt!309042) lt!307360) (= (_1!9190 lt!309042) (_2!9189 _$19!156))))))

(assert (=> b!198273 (= lt!309042 (readBitPure!0 (readerFrom!0 (_2!9189 _$19!156) (currentBit!9274 thiss!1204) (currentByte!9279 thiss!1204))))))

(declare-fun d!67255 () Bool)

(assert (=> d!67255 e!136116))

(declare-fun res!165957 () Bool)

(assert (=> d!67255 (=> (not res!165957) (not e!136116))))

(assert (=> d!67255 (= res!165957 (= (size!4455 (buf!4941 thiss!1204)) (size!4455 (buf!4941 (_2!9189 _$19!156)))))))

(assert (=> d!67255 (and (inv!12 (_2!9189 _$19!156)) e!136117)))

(assert (=> d!67255 (= (choose!16 thiss!1204 lt!307360) _$19!156)))

(declare-fun b!198274 () Bool)

(declare-fun res!165954 () Bool)

(assert (=> b!198274 (=> (not res!165954) (not e!136116))))

(assert (=> b!198274 (= res!165954 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 _$19!156))) (currentByte!9279 (_2!9189 _$19!156)) (currentBit!9274 (_2!9189 _$19!156))) (bvadd (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!67255 b!198271))

(assert (= (and d!67255 res!165957) b!198274))

(assert (= (and b!198274 res!165954) b!198272))

(assert (= (and b!198272 res!165955) b!198273))

(assert (= (and b!198273 res!165956) b!198270))

(declare-fun m!306833 () Bool)

(assert (=> b!198271 m!306833))

(declare-fun m!306835 () Bool)

(assert (=> b!198274 m!306835))

(assert (=> b!198274 m!305117))

(declare-fun m!306837 () Bool)

(assert (=> b!198272 m!306837))

(declare-fun m!306839 () Bool)

(assert (=> b!198270 m!306839))

(assert (=> b!198270 m!306835))

(declare-fun m!306841 () Bool)

(assert (=> d!67255 m!306841))

(declare-fun m!306843 () Bool)

(assert (=> b!198273 m!306843))

(assert (=> b!198273 m!306843))

(declare-fun m!306845 () Bool)

(assert (=> b!198273 m!306845))

(assert (=> d!66683 d!67255))

(declare-fun d!67257 () Bool)

(assert (=> d!67257 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 thiss!1204))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!16661 () Bool)

(assert (= bs!16661 d!67257))

(assert (=> bs!16661 m!305195))

(assert (=> d!66683 d!67257))

(declare-fun d!67259 () Bool)

(declare-fun e!136118 () Bool)

(assert (=> d!67259 e!136118))

(declare-fun res!165958 () Bool)

(assert (=> d!67259 (=> (not res!165958) (not e!136118))))

(declare-fun lt!309047 () (_ BitVec 64))

(declare-fun lt!309045 () (_ BitVec 64))

(declare-fun lt!309046 () (_ BitVec 64))

(assert (=> d!67259 (= res!165958 (= lt!309045 (bvsub lt!309046 lt!309047)))))

(assert (=> d!67259 (or (= (bvand lt!309046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309047 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309046 lt!309047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67259 (= lt!309047 (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308097)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308097))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308097)))))))

(declare-fun lt!309048 () (_ BitVec 64))

(declare-fun lt!309044 () (_ BitVec 64))

(assert (=> d!67259 (= lt!309046 (bvmul lt!309048 lt!309044))))

(assert (=> d!67259 (or (= lt!309048 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309044 (bvsdiv (bvmul lt!309048 lt!309044) lt!309048)))))

(assert (=> d!67259 (= lt!309044 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67259 (= lt!309048 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308097)))))))

(assert (=> d!67259 (= lt!309045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!308097))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!308097)))))))

(assert (=> d!67259 (invariant!0 (currentBit!9274 (_1!9190 lt!308097)) (currentByte!9279 (_1!9190 lt!308097)) (size!4455 (buf!4941 (_1!9190 lt!308097))))))

(assert (=> d!67259 (= (bitIndex!0 (size!4455 (buf!4941 (_1!9190 lt!308097))) (currentByte!9279 (_1!9190 lt!308097)) (currentBit!9274 (_1!9190 lt!308097))) lt!309045)))

(declare-fun b!198275 () Bool)

(declare-fun res!165959 () Bool)

(assert (=> b!198275 (=> (not res!165959) (not e!136118))))

(assert (=> b!198275 (= res!165959 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309045))))

(declare-fun b!198276 () Bool)

(declare-fun lt!309043 () (_ BitVec 64))

(assert (=> b!198276 (= e!136118 (bvsle lt!309045 (bvmul lt!309043 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198276 (or (= lt!309043 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309043 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309043)))))

(assert (=> b!198276 (= lt!309043 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!308097)))))))

(assert (= (and d!67259 res!165958) b!198275))

(assert (= (and b!198275 res!165959) b!198276))

(declare-fun m!306847 () Bool)

(assert (=> d!67259 m!306847))

(declare-fun m!306849 () Bool)

(assert (=> d!67259 m!306849))

(assert (=> b!197773 d!67259))

(assert (=> b!197773 d!67097))

(declare-fun d!67261 () Bool)

(declare-fun res!165960 () Bool)

(declare-fun e!136123 () Bool)

(assert (=> d!67261 (=> res!165960 e!136123)))

(assert (=> d!67261 (= res!165960 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(assert (=> d!67261 (= (arrayBitRangesEq!0 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))) e!136123)))

(declare-fun lt!309051 () tuple4!260)

(declare-fun b!198277 () Bool)

(declare-fun e!136121 () Bool)

(assert (=> b!198277 (= e!136121 (arrayRangesEq!692 (buf!4941 thiss!1204) (buf!4941 (_2!9189 lt!307379)) (_1!9200 lt!309051) (_2!9200 lt!309051)))))

(declare-fun b!198278 () Bool)

(declare-fun e!136119 () Bool)

(declare-fun e!136122 () Bool)

(assert (=> b!198278 (= e!136119 e!136122)))

(declare-fun lt!309050 () (_ BitVec 32))

(declare-fun res!165964 () Bool)

(assert (=> b!198278 (= res!165964 (byteRangesEq!0 (select (arr!5385 (buf!4941 thiss!1204)) (_3!646 lt!309051)) (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_3!646 lt!309051)) lt!309050 #b00000000000000000000000000001000))))

(assert (=> b!198278 (=> (not res!165964) (not e!136122))))

(declare-fun lt!309049 () (_ BitVec 32))

(declare-fun call!3126 () Bool)

(declare-fun bm!3123 () Bool)

(declare-fun c!9872 () Bool)

(assert (=> bm!3123 (= call!3126 (byteRangesEq!0 (ite c!9872 (select (arr!5385 (buf!4941 thiss!1204)) (_3!646 lt!309051)) (select (arr!5385 (buf!4941 thiss!1204)) (_4!130 lt!309051))) (ite c!9872 (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_3!646 lt!309051)) (select (arr!5385 (buf!4941 (_2!9189 lt!307379))) (_4!130 lt!309051))) (ite c!9872 lt!309050 #b00000000000000000000000000000000) lt!309049))))

(declare-fun b!198279 () Bool)

(declare-fun e!136124 () Bool)

(assert (=> b!198279 (= e!136124 e!136119)))

(assert (=> b!198279 (= c!9872 (= (_3!646 lt!309051) (_4!130 lt!309051)))))

(declare-fun b!198280 () Bool)

(assert (=> b!198280 (= e!136123 e!136124)))

(declare-fun res!165963 () Bool)

(assert (=> b!198280 (=> (not res!165963) (not e!136124))))

(assert (=> b!198280 (= res!165963 e!136121)))

(declare-fun res!165961 () Bool)

(assert (=> b!198280 (=> res!165961 e!136121)))

(assert (=> b!198280 (= res!165961 (bvsge (_1!9200 lt!309051) (_2!9200 lt!309051)))))

(assert (=> b!198280 (= lt!309049 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198280 (= lt!309050 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198280 (= lt!309051 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 thiss!1204)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))

(declare-fun b!198281 () Bool)

(assert (=> b!198281 (= e!136119 call!3126)))

(declare-fun b!198282 () Bool)

(declare-fun e!136120 () Bool)

(assert (=> b!198282 (= e!136120 call!3126)))

(declare-fun b!198283 () Bool)

(declare-fun res!165962 () Bool)

(assert (=> b!198283 (= res!165962 (= lt!309049 #b00000000000000000000000000000000))))

(assert (=> b!198283 (=> res!165962 e!136120)))

(assert (=> b!198283 (= e!136122 e!136120)))

(assert (= (and d!67261 (not res!165960)) b!198280))

(assert (= (and b!198280 (not res!165961)) b!198277))

(assert (= (and b!198280 res!165963) b!198279))

(assert (= (and b!198279 c!9872) b!198281))

(assert (= (and b!198279 (not c!9872)) b!198278))

(assert (= (and b!198278 res!165964) b!198283))

(assert (= (and b!198283 (not res!165962)) b!198282))

(assert (= (or b!198281 b!198282) bm!3123))

(declare-fun m!306851 () Bool)

(assert (=> b!198277 m!306851))

(declare-fun m!306853 () Bool)

(assert (=> b!198278 m!306853))

(declare-fun m!306855 () Bool)

(assert (=> b!198278 m!306855))

(assert (=> b!198278 m!306853))

(assert (=> b!198278 m!306855))

(declare-fun m!306857 () Bool)

(assert (=> b!198278 m!306857))

(declare-fun m!306859 () Bool)

(assert (=> bm!3123 m!306859))

(assert (=> bm!3123 m!306853))

(declare-fun m!306861 () Bool)

(assert (=> bm!3123 m!306861))

(assert (=> bm!3123 m!306855))

(declare-fun m!306863 () Bool)

(assert (=> bm!3123 m!306863))

(assert (=> b!198280 m!305117))

(assert (=> b!198280 m!306761))

(assert (=> b!197585 d!67261))

(assert (=> b!197585 d!66681))

(assert (=> b!197811 d!66801))

(declare-fun d!67263 () Bool)

(declare-fun e!136125 () Bool)

(assert (=> d!67263 e!136125))

(declare-fun res!165965 () Bool)

(assert (=> d!67263 (=> (not res!165965) (not e!136125))))

(assert (=> d!67263 (= res!165965 (= (buf!4941 (_2!9189 (increaseBitIndex!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))) (buf!4941 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))))

(declare-fun lt!309054 () Bool)

(assert (=> d!67263 (= lt!309054 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))) (currentByte!9279 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309057 () tuple2!17104)

(assert (=> d!67263 (= lt!309057 (tuple2!17105 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))) (currentByte!9279 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9189 (increaseBitIndex!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))))))

(assert (=> d!67263 (validate_offset_bit!0 ((_ sign_extend 32) (size!4455 (buf!4941 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))) ((_ sign_extend 32) (currentByte!9279 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))) ((_ sign_extend 32) (currentBit!9274 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))))

(assert (=> d!67263 (= (readBit!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))) lt!309057)))

(declare-fun lt!309058 () (_ BitVec 64))

(declare-fun b!198284 () Bool)

(declare-fun lt!309056 () (_ BitVec 64))

(assert (=> b!198284 (= e!136125 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 (increaseBitIndex!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))) (currentByte!9279 (_2!9189 (increaseBitIndex!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))) (currentBit!9274 (_2!9189 (increaseBitIndex!0 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))) (bvadd lt!309056 lt!309058)))))

(assert (=> b!198284 (or (not (= (bvand lt!309056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309058 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309056 lt!309058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198284 (= lt!309058 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198284 (= lt!309056 (bitIndex!0 (size!4455 (buf!4941 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))) (currentByte!9279 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))) (currentBit!9274 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))))

(declare-fun lt!309053 () Bool)

(assert (=> b!198284 (= lt!309053 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))) (currentByte!9279 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309052 () Bool)

(assert (=> b!198284 (= lt!309052 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))) (currentByte!9279 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309055 () Bool)

(assert (=> b!198284 (= lt!309055 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))) (currentByte!9279 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (BitStream!8019 (buf!4941 (_2!9189 lt!307379)) (currentByte!9279 thiss!1204) (currentBit!9274 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67263 res!165965) b!198284))

(declare-fun m!306865 () Bool)

(assert (=> d!67263 m!306865))

(declare-fun m!306867 () Bool)

(assert (=> d!67263 m!306867))

(declare-fun m!306869 () Bool)

(assert (=> d!67263 m!306869))

(declare-fun m!306871 () Bool)

(assert (=> d!67263 m!306871))

(assert (=> b!198284 m!306867))

(assert (=> b!198284 m!306869))

(assert (=> b!198284 m!306865))

(declare-fun m!306873 () Bool)

(assert (=> b!198284 m!306873))

(declare-fun m!306875 () Bool)

(assert (=> b!198284 m!306875))

(assert (=> d!66811 d!67263))

(assert (=> b!197583 d!66681))

(assert (=> b!197583 d!66685))

(declare-fun d!67265 () Bool)

(declare-fun e!136126 () Bool)

(assert (=> d!67265 e!136126))

(declare-fun res!165966 () Bool)

(assert (=> d!67265 (=> (not res!165966) (not e!136126))))

(assert (=> d!67265 (= res!165966 (= (buf!4941 (_2!9189 (increaseBitIndex!0 lt!307376))) (buf!4941 lt!307376)))))

(declare-fun lt!309061 () Bool)

(assert (=> d!67265 (= lt!309061 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 lt!307376)) (currentByte!9279 lt!307376))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 lt!307376)))) #b00000000000000000000000000000000)))))

(declare-fun lt!309064 () tuple2!17104)

(assert (=> d!67265 (= lt!309064 (tuple2!17105 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 lt!307376)) (currentByte!9279 lt!307376))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 lt!307376)))) #b00000000000000000000000000000000)) (_2!9189 (increaseBitIndex!0 lt!307376))))))

(assert (=> d!67265 (validate_offset_bit!0 ((_ sign_extend 32) (size!4455 (buf!4941 lt!307376))) ((_ sign_extend 32) (currentByte!9279 lt!307376)) ((_ sign_extend 32) (currentBit!9274 lt!307376)))))

(assert (=> d!67265 (= (readBit!0 lt!307376) lt!309064)))

(declare-fun b!198285 () Bool)

(declare-fun lt!309065 () (_ BitVec 64))

(declare-fun lt!309063 () (_ BitVec 64))

(assert (=> b!198285 (= e!136126 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 (increaseBitIndex!0 lt!307376)))) (currentByte!9279 (_2!9189 (increaseBitIndex!0 lt!307376))) (currentBit!9274 (_2!9189 (increaseBitIndex!0 lt!307376)))) (bvadd lt!309063 lt!309065)))))

(assert (=> b!198285 (or (not (= (bvand lt!309063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309065 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309063 lt!309065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198285 (= lt!309065 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198285 (= lt!309063 (bitIndex!0 (size!4455 (buf!4941 lt!307376)) (currentByte!9279 lt!307376) (currentBit!9274 lt!307376)))))

(declare-fun lt!309060 () Bool)

(assert (=> b!198285 (= lt!309060 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 lt!307376)) (currentByte!9279 lt!307376))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 lt!307376)))) #b00000000000000000000000000000000)))))

(declare-fun lt!309059 () Bool)

(assert (=> b!198285 (= lt!309059 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 lt!307376)) (currentByte!9279 lt!307376))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 lt!307376)))) #b00000000000000000000000000000000)))))

(declare-fun lt!309062 () Bool)

(assert (=> b!198285 (= lt!309062 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 lt!307376)) (currentByte!9279 lt!307376))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 lt!307376)))) #b00000000000000000000000000000000)))))

(assert (= (and d!67265 res!165966) b!198285))

(declare-fun m!306877 () Bool)

(assert (=> d!67265 m!306877))

(declare-fun m!306879 () Bool)

(assert (=> d!67265 m!306879))

(declare-fun m!306881 () Bool)

(assert (=> d!67265 m!306881))

(declare-fun m!306883 () Bool)

(assert (=> d!67265 m!306883))

(assert (=> b!198285 m!306879))

(assert (=> b!198285 m!306881))

(assert (=> b!198285 m!306877))

(declare-fun m!306885 () Bool)

(assert (=> b!198285 m!306885))

(declare-fun m!306887 () Bool)

(assert (=> b!198285 m!306887))

(assert (=> d!66815 d!67265))

(declare-fun d!67267 () Bool)

(assert (=> d!67267 (= (invariant!0 (currentBit!9274 (_2!9189 lt!308084)) (currentByte!9279 (_2!9189 lt!308084)) (size!4455 (buf!4941 (_2!9189 lt!308084)))) (and (bvsge (currentBit!9274 (_2!9189 lt!308084)) #b00000000000000000000000000000000) (bvslt (currentBit!9274 (_2!9189 lt!308084)) #b00000000000000000000000000001000) (bvsge (currentByte!9279 (_2!9189 lt!308084)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 (_2!9189 lt!308084)) (size!4455 (buf!4941 (_2!9189 lt!308084)))) (and (= (currentBit!9274 (_2!9189 lt!308084)) #b00000000000000000000000000000000) (= (currentByte!9279 (_2!9189 lt!308084)) (size!4455 (buf!4941 (_2!9189 lt!308084))))))))))

(assert (=> d!66691 d!67267))

(declare-fun d!67269 () Bool)

(declare-fun res!165967 () Bool)

(declare-fun e!136128 () Bool)

(assert (=> d!67269 (=> (not res!165967) (not e!136128))))

(assert (=> d!67269 (= res!165967 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) (size!4455 (buf!4941 (_2!9189 lt!308084)))))))

(assert (=> d!67269 (= (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308084)) e!136128)))

(declare-fun b!198286 () Bool)

(declare-fun res!165968 () Bool)

(assert (=> b!198286 (=> (not res!165968) (not e!136128))))

(assert (=> b!198286 (= res!165968 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308084))) (currentByte!9279 (_2!9189 lt!308084)) (currentBit!9274 (_2!9189 lt!308084)))))))

(declare-fun b!198287 () Bool)

(declare-fun e!136127 () Bool)

(assert (=> b!198287 (= e!136128 e!136127)))

(declare-fun res!165969 () Bool)

(assert (=> b!198287 (=> res!165969 e!136127)))

(assert (=> b!198287 (= res!165969 (= (size!4455 (buf!4941 (_2!9189 lt!307359))) #b00000000000000000000000000000000))))

(declare-fun b!198288 () Bool)

(assert (=> b!198288 (= e!136127 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!308084)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (= (and d!67269 res!165967) b!198286))

(assert (= (and b!198286 res!165968) b!198287))

(assert (= (and b!198287 (not res!165969)) b!198288))

(assert (=> b!198286 m!305115))

(assert (=> b!198286 m!305629))

(assert (=> b!198288 m!305115))

(assert (=> b!198288 m!305115))

(declare-fun m!306889 () Bool)

(assert (=> b!198288 m!306889))

(assert (=> b!197767 d!67269))

(declare-fun d!67271 () Bool)

(declare-fun res!165970 () Bool)

(declare-fun e!136130 () Bool)

(assert (=> d!67271 (=> (not res!165970) (not e!136130))))

(assert (=> d!67271 (= res!165970 (= (size!4455 (buf!4941 (_2!9191 lt!308180))) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (=> d!67271 (= (isPrefixOf!0 (_2!9191 lt!308180) (_2!9189 lt!307379)) e!136130)))

(declare-fun b!198289 () Bool)

(declare-fun res!165971 () Bool)

(assert (=> b!198289 (=> (not res!165971) (not e!136130))))

(assert (=> b!198289 (= res!165971 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308180))) (currentByte!9279 (_2!9191 lt!308180)) (currentBit!9274 (_2!9191 lt!308180))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379)))))))

(declare-fun b!198290 () Bool)

(declare-fun e!136129 () Bool)

(assert (=> b!198290 (= e!136130 e!136129)))

(declare-fun res!165972 () Bool)

(assert (=> b!198290 (=> res!165972 e!136129)))

(assert (=> b!198290 (= res!165972 (= (size!4455 (buf!4941 (_2!9191 lt!308180))) #b00000000000000000000000000000000))))

(declare-fun b!198291 () Bool)

(assert (=> b!198291 (= e!136129 (arrayBitRangesEq!0 (buf!4941 (_2!9191 lt!308180)) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308180))) (currentByte!9279 (_2!9191 lt!308180)) (currentBit!9274 (_2!9191 lt!308180)))))))

(assert (= (and d!67271 res!165970) b!198289))

(assert (= (and b!198289 res!165971) b!198290))

(assert (= (and b!198290 (not res!165972)) b!198291))

(assert (=> b!198289 m!306419))

(assert (=> b!198289 m!305121))

(assert (=> b!198291 m!306419))

(assert (=> b!198291 m!306419))

(declare-fun m!306891 () Bool)

(assert (=> b!198291 m!306891))

(assert (=> b!197794 d!67271))

(declare-fun d!67273 () Bool)

(assert (=> d!67273 (= (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307373)))) ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307373))) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307373)))) (bvsub (bvmul ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9190 lt!307373)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 (_1!9190 lt!307373))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 (_1!9190 lt!307373))))))))

(assert (=> d!66819 d!67273))

(declare-fun d!67275 () Bool)

(assert (=> d!67275 (= (invariant!0 (currentBit!9274 (_1!9190 lt!307373)) (currentByte!9279 (_1!9190 lt!307373)) (size!4455 (buf!4941 (_1!9190 lt!307373)))) (and (bvsge (currentBit!9274 (_1!9190 lt!307373)) #b00000000000000000000000000000000) (bvslt (currentBit!9274 (_1!9190 lt!307373)) #b00000000000000000000000000001000) (bvsge (currentByte!9279 (_1!9190 lt!307373)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9279 (_1!9190 lt!307373)) (size!4455 (buf!4941 (_1!9190 lt!307373)))) (and (= (currentBit!9274 (_1!9190 lt!307373)) #b00000000000000000000000000000000) (= (currentByte!9279 (_1!9190 lt!307373)) (size!4455 (buf!4941 (_1!9190 lt!307373))))))))))

(assert (=> d!66819 d!67275))

(declare-fun d!67277 () Bool)

(declare-fun res!165973 () Bool)

(declare-fun e!136132 () Bool)

(assert (=> d!67277 (=> (not res!165973) (not e!136132))))

(assert (=> d!67277 (= res!165973 (= (size!4455 (buf!4941 (_1!9191 lt!308180))) (size!4455 (buf!4941 (_2!9189 lt!307359)))))))

(assert (=> d!67277 (= (isPrefixOf!0 (_1!9191 lt!308180) (_2!9189 lt!307359)) e!136132)))

(declare-fun b!198292 () Bool)

(declare-fun res!165974 () Bool)

(assert (=> b!198292 (=> (not res!165974) (not e!136132))))

(assert (=> b!198292 (= res!165974 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308180))) (currentByte!9279 (_1!9191 lt!308180)) (currentBit!9274 (_1!9191 lt!308180))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(declare-fun b!198293 () Bool)

(declare-fun e!136131 () Bool)

(assert (=> b!198293 (= e!136132 e!136131)))

(declare-fun res!165975 () Bool)

(assert (=> b!198293 (=> res!165975 e!136131)))

(assert (=> b!198293 (= res!165975 (= (size!4455 (buf!4941 (_1!9191 lt!308180))) #b00000000000000000000000000000000))))

(declare-fun b!198294 () Bool)

(assert (=> b!198294 (= e!136131 (arrayBitRangesEq!0 (buf!4941 (_1!9191 lt!308180)) (buf!4941 (_2!9189 lt!307359)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!308180))) (currentByte!9279 (_1!9191 lt!308180)) (currentBit!9274 (_1!9191 lt!308180)))))))

(assert (= (and d!67277 res!165973) b!198292))

(assert (= (and b!198292 res!165974) b!198293))

(assert (= (and b!198293 (not res!165975)) b!198294))

(assert (=> b!198292 m!306417))

(assert (=> b!198292 m!305115))

(assert (=> b!198294 m!306417))

(assert (=> b!198294 m!306417))

(declare-fun m!306893 () Bool)

(assert (=> b!198294 m!306893))

(assert (=> b!197790 d!67277))

(declare-fun d!67279 () Bool)

(assert (=> d!67279 (= (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) ((_ sign_extend 32) (currentByte!9279 thiss!1204)) ((_ sign_extend 32) (currentBit!9274 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!307379)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9279 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9274 thiss!1204)))))))

(assert (=> d!66823 d!67279))

(declare-fun d!67281 () Bool)

(declare-fun e!136133 () Bool)

(assert (=> d!67281 e!136133))

(declare-fun res!165976 () Bool)

(assert (=> d!67281 (=> (not res!165976) (not e!136133))))

(declare-fun lt!309066 () BitStream!8018)

(declare-fun lt!309067 () (_ BitVec 64))

(assert (=> d!67281 (= res!165976 (= (bvadd lt!309067 (bvsub lt!308178 lt!308181)) (bitIndex!0 (size!4455 (buf!4941 lt!309066)) (currentByte!9279 lt!309066) (currentBit!9274 lt!309066))))))

(assert (=> d!67281 (or (not (= (bvand lt!309067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308178 lt!308181) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309067 (bvsub lt!308178 lt!308181)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67281 (= lt!309067 (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308180))) (currentByte!9279 (_2!9191 lt!308180)) (currentBit!9274 (_2!9191 lt!308180))))))

(assert (=> d!67281 (= lt!309066 (_2!9189 (moveBitIndex!0 (_2!9191 lt!308180) (bvsub lt!308178 lt!308181))))))

(assert (=> d!67281 (moveBitIndexPrecond!0 (_2!9191 lt!308180) (bvsub lt!308178 lt!308181))))

(assert (=> d!67281 (= (withMovedBitIndex!0 (_2!9191 lt!308180) (bvsub lt!308178 lt!308181)) lt!309066)))

(declare-fun b!198295 () Bool)

(assert (=> b!198295 (= e!136133 (= (size!4455 (buf!4941 (_2!9191 lt!308180))) (size!4455 (buf!4941 lt!309066))))))

(assert (= (and d!67281 res!165976) b!198295))

(declare-fun m!306895 () Bool)

(assert (=> d!67281 m!306895))

(assert (=> d!67281 m!306419))

(declare-fun m!306897 () Bool)

(assert (=> d!67281 m!306897))

(declare-fun m!306899 () Bool)

(assert (=> d!67281 m!306899))

(assert (=> b!197792 d!67281))

(assert (=> b!197792 d!66685))

(assert (=> b!197792 d!66677))

(declare-fun b!198296 () Bool)

(declare-fun res!165977 () Bool)

(declare-fun e!136135 () Bool)

(assert (=> b!198296 (=> (not res!165977) (not e!136135))))

(declare-fun lt!309079 () tuple2!17092)

(assert (=> b!198296 (= res!165977 (isPrefixOf!0 (_1!9191 lt!309079) (_2!9189 lt!307359)))))

(declare-fun d!67283 () Bool)

(assert (=> d!67283 e!136135))

(declare-fun res!165979 () Bool)

(assert (=> d!67283 (=> (not res!165979) (not e!136135))))

(assert (=> d!67283 (= res!165979 (isPrefixOf!0 (_1!9191 lt!309079) (_2!9191 lt!309079)))))

(declare-fun lt!309083 () BitStream!8018)

(assert (=> d!67283 (= lt!309079 (tuple2!17093 lt!309083 (_2!9189 lt!308084)))))

(declare-fun lt!309087 () Unit!13975)

(declare-fun lt!309069 () Unit!13975)

(assert (=> d!67283 (= lt!309087 lt!309069)))

(assert (=> d!67283 (isPrefixOf!0 lt!309083 (_2!9189 lt!308084))))

(assert (=> d!67283 (= lt!309069 (lemmaIsPrefixTransitive!0 lt!309083 (_2!9189 lt!308084) (_2!9189 lt!308084)))))

(declare-fun lt!309078 () Unit!13975)

(declare-fun lt!309075 () Unit!13975)

(assert (=> d!67283 (= lt!309078 lt!309075)))

(assert (=> d!67283 (isPrefixOf!0 lt!309083 (_2!9189 lt!308084))))

(assert (=> d!67283 (= lt!309075 (lemmaIsPrefixTransitive!0 lt!309083 (_2!9189 lt!307359) (_2!9189 lt!308084)))))

(declare-fun lt!309081 () Unit!13975)

(declare-fun e!136134 () Unit!13975)

(assert (=> d!67283 (= lt!309081 e!136134)))

(declare-fun c!9873 () Bool)

(assert (=> d!67283 (= c!9873 (not (= (size!4455 (buf!4941 (_2!9189 lt!307359))) #b00000000000000000000000000000000)))))

(declare-fun lt!309074 () Unit!13975)

(declare-fun lt!309072 () Unit!13975)

(assert (=> d!67283 (= lt!309074 lt!309072)))

(assert (=> d!67283 (isPrefixOf!0 (_2!9189 lt!308084) (_2!9189 lt!308084))))

(assert (=> d!67283 (= lt!309072 (lemmaIsPrefixRefl!0 (_2!9189 lt!308084)))))

(declare-fun lt!309068 () Unit!13975)

(declare-fun lt!309084 () Unit!13975)

(assert (=> d!67283 (= lt!309068 lt!309084)))

(assert (=> d!67283 (= lt!309084 (lemmaIsPrefixRefl!0 (_2!9189 lt!308084)))))

(declare-fun lt!309076 () Unit!13975)

(declare-fun lt!309070 () Unit!13975)

(assert (=> d!67283 (= lt!309076 lt!309070)))

(assert (=> d!67283 (isPrefixOf!0 lt!309083 lt!309083)))

(assert (=> d!67283 (= lt!309070 (lemmaIsPrefixRefl!0 lt!309083))))

(declare-fun lt!309085 () Unit!13975)

(declare-fun lt!309086 () Unit!13975)

(assert (=> d!67283 (= lt!309085 lt!309086)))

(assert (=> d!67283 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!307359))))

(assert (=> d!67283 (= lt!309086 (lemmaIsPrefixRefl!0 (_2!9189 lt!307359)))))

(assert (=> d!67283 (= lt!309083 (BitStream!8019 (buf!4941 (_2!9189 lt!308084)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> d!67283 (isPrefixOf!0 (_2!9189 lt!307359) (_2!9189 lt!308084))))

(assert (=> d!67283 (= (reader!0 (_2!9189 lt!307359) (_2!9189 lt!308084)) lt!309079)))

(declare-fun b!198297 () Bool)

(declare-fun Unit!14043 () Unit!13975)

(assert (=> b!198297 (= e!136134 Unit!14043)))

(declare-fun lt!309077 () (_ BitVec 64))

(declare-fun b!198298 () Bool)

(declare-fun lt!309080 () (_ BitVec 64))

(assert (=> b!198298 (= e!136135 (= (_1!9191 lt!309079) (withMovedBitIndex!0 (_2!9191 lt!309079) (bvsub lt!309077 lt!309080))))))

(assert (=> b!198298 (or (= (bvand lt!309077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309080 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309077 lt!309080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198298 (= lt!309080 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!308084))) (currentByte!9279 (_2!9189 lt!308084)) (currentBit!9274 (_2!9189 lt!308084))))))

(assert (=> b!198298 (= lt!309077 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(declare-fun b!198299 () Bool)

(declare-fun lt!309071 () Unit!13975)

(assert (=> b!198299 (= e!136134 lt!309071)))

(declare-fun lt!309073 () (_ BitVec 64))

(assert (=> b!198299 (= lt!309073 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!309082 () (_ BitVec 64))

(assert (=> b!198299 (= lt!309082 (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307359))) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359))))))

(assert (=> b!198299 (= lt!309071 (arrayBitRangesEqSymmetric!0 (buf!4941 (_2!9189 lt!307359)) (buf!4941 (_2!9189 lt!308084)) lt!309073 lt!309082))))

(assert (=> b!198299 (arrayBitRangesEq!0 (buf!4941 (_2!9189 lt!308084)) (buf!4941 (_2!9189 lt!307359)) lt!309073 lt!309082)))

(declare-fun b!198300 () Bool)

(declare-fun res!165978 () Bool)

(assert (=> b!198300 (=> (not res!165978) (not e!136135))))

(assert (=> b!198300 (= res!165978 (isPrefixOf!0 (_2!9191 lt!309079) (_2!9189 lt!308084)))))

(assert (= (and d!67283 c!9873) b!198299))

(assert (= (and d!67283 (not c!9873)) b!198297))

(assert (= (and d!67283 res!165979) b!198296))

(assert (= (and b!198296 res!165977) b!198300))

(assert (= (and b!198300 res!165978) b!198298))

(declare-fun m!306901 () Bool)

(assert (=> d!67283 m!306901))

(declare-fun m!306903 () Bool)

(assert (=> d!67283 m!306903))

(declare-fun m!306905 () Bool)

(assert (=> d!67283 m!306905))

(declare-fun m!306907 () Bool)

(assert (=> d!67283 m!306907))

(assert (=> d!67283 m!305689))

(declare-fun m!306909 () Bool)

(assert (=> d!67283 m!306909))

(assert (=> d!67283 m!305561))

(declare-fun m!306911 () Bool)

(assert (=> d!67283 m!306911))

(declare-fun m!306913 () Bool)

(assert (=> d!67283 m!306913))

(declare-fun m!306915 () Bool)

(assert (=> d!67283 m!306915))

(assert (=> d!67283 m!305557))

(assert (=> b!198299 m!305115))

(declare-fun m!306917 () Bool)

(assert (=> b!198299 m!306917))

(declare-fun m!306919 () Bool)

(assert (=> b!198299 m!306919))

(declare-fun m!306921 () Bool)

(assert (=> b!198300 m!306921))

(declare-fun m!306923 () Bool)

(assert (=> b!198298 m!306923))

(assert (=> b!198298 m!305629))

(assert (=> b!198298 m!305115))

(declare-fun m!306925 () Bool)

(assert (=> b!198296 m!306925))

(assert (=> b!197765 d!67283))

(assert (=> b!197765 d!67135))

(declare-fun d!67285 () Bool)

(declare-fun lt!309088 () tuple2!17106)

(assert (=> d!67285 (= lt!309088 (readNBitsLSBFirstsLoop!0 (_1!9191 lt!308103) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!67285 (= (readNBitsLSBFirstsLoopPure!0 (_1!9191 lt!308103) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17095 (_2!9198 lt!309088) (_1!9198 lt!309088)))))

(declare-fun bs!16662 () Bool)

(assert (= bs!16662 d!67285))

(declare-fun m!306927 () Bool)

(assert (=> bs!16662 m!306927))

(assert (=> b!197765 d!67285))

(assert (=> b!197765 d!67187))

(declare-fun d!67287 () Bool)

(assert (=> d!67287 (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308084)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308065)))

(declare-fun lt!309089 () Unit!13975)

(assert (=> d!67287 (= lt!309089 (choose!9 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308084)) lt!308065 (BitStream!8019 (buf!4941 (_2!9189 lt!308084)) (currentByte!9279 (_2!9189 lt!307359)) (currentBit!9274 (_2!9189 lt!307359)))))))

(assert (=> d!67287 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9189 lt!307359) (buf!4941 (_2!9189 lt!308084)) lt!308065) lt!309089)))

(declare-fun bs!16663 () Bool)

(assert (= bs!16663 d!67287))

(assert (=> bs!16663 m!305643))

(declare-fun m!306929 () Bool)

(assert (=> bs!16663 m!306929))

(assert (=> b!197765 d!67287))

(declare-fun d!67289 () Bool)

(assert (=> d!67289 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308084)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359))) lt!308065) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_2!9189 lt!308084)))) ((_ sign_extend 32) (currentByte!9279 (_2!9189 lt!307359))) ((_ sign_extend 32) (currentBit!9274 (_2!9189 lt!307359)))) lt!308065))))

(declare-fun bs!16664 () Bool)

(assert (= bs!16664 d!67289))

(declare-fun m!306931 () Bool)

(assert (=> bs!16664 m!306931))

(assert (=> b!197765 d!67289))

(declare-fun d!67291 () Bool)

(declare-fun res!165980 () Bool)

(declare-fun e!136137 () Bool)

(assert (=> d!67291 (=> (not res!165980) (not e!136137))))

(assert (=> d!67291 (= res!165980 (= (size!4455 (buf!4941 (_2!9191 lt!308157))) (size!4455 (buf!4941 (_2!9189 lt!307379)))))))

(assert (=> d!67291 (= (isPrefixOf!0 (_2!9191 lt!308157) (_2!9189 lt!307379)) e!136137)))

(declare-fun b!198301 () Bool)

(declare-fun res!165981 () Bool)

(assert (=> b!198301 (=> (not res!165981) (not e!136137))))

(assert (=> b!198301 (= res!165981 (bvsle (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308157))) (currentByte!9279 (_2!9191 lt!308157)) (currentBit!9274 (_2!9191 lt!308157))) (bitIndex!0 (size!4455 (buf!4941 (_2!9189 lt!307379))) (currentByte!9279 (_2!9189 lt!307379)) (currentBit!9274 (_2!9189 lt!307379)))))))

(declare-fun b!198302 () Bool)

(declare-fun e!136136 () Bool)

(assert (=> b!198302 (= e!136137 e!136136)))

(declare-fun res!165982 () Bool)

(assert (=> b!198302 (=> res!165982 e!136136)))

(assert (=> b!198302 (= res!165982 (= (size!4455 (buf!4941 (_2!9191 lt!308157))) #b00000000000000000000000000000000))))

(declare-fun b!198303 () Bool)

(assert (=> b!198303 (= e!136136 (arrayBitRangesEq!0 (buf!4941 (_2!9191 lt!308157)) (buf!4941 (_2!9189 lt!307379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4455 (buf!4941 (_2!9191 lt!308157))) (currentByte!9279 (_2!9191 lt!308157)) (currentBit!9274 (_2!9191 lt!308157)))))))

(assert (= (and d!67291 res!165980) b!198301))

(assert (= (and b!198301 res!165981) b!198302))

(assert (= (and b!198302 (not res!165982)) b!198303))

(assert (=> b!198301 m!306397))

(assert (=> b!198301 m!305121))

(assert (=> b!198303 m!306397))

(assert (=> b!198303 m!306397))

(declare-fun m!306933 () Bool)

(assert (=> b!198303 m!306933))

(assert (=> b!197789 d!67291))

(declare-fun d!67293 () Bool)

(declare-fun e!136138 () Bool)

(assert (=> d!67293 e!136138))

(declare-fun res!165983 () Bool)

(assert (=> d!67293 (=> (not res!165983) (not e!136138))))

(assert (=> d!67293 (= res!165983 (= (buf!4941 (_2!9189 (increaseBitIndex!0 (_1!9191 lt!307378)))) (buf!4941 (_1!9191 lt!307378))))))

(declare-fun lt!309092 () Bool)

(assert (=> d!67293 (= lt!309092 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (_1!9191 lt!307378))) (currentByte!9279 (_1!9191 lt!307378)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (_1!9191 lt!307378))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309095 () tuple2!17104)

(assert (=> d!67293 (= lt!309095 (tuple2!17105 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (_1!9191 lt!307378))) (currentByte!9279 (_1!9191 lt!307378)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (_1!9191 lt!307378))))) #b00000000000000000000000000000000)) (_2!9189 (increaseBitIndex!0 (_1!9191 lt!307378)))))))

(assert (=> d!67293 (validate_offset_bit!0 ((_ sign_extend 32) (size!4455 (buf!4941 (_1!9191 lt!307378)))) ((_ sign_extend 32) (currentByte!9279 (_1!9191 lt!307378))) ((_ sign_extend 32) (currentBit!9274 (_1!9191 lt!307378))))))

(assert (=> d!67293 (= (readBit!0 (_1!9191 lt!307378)) lt!309095)))

(declare-fun b!198304 () Bool)

(declare-fun lt!309094 () (_ BitVec 64))

(declare-fun lt!309096 () (_ BitVec 64))

(assert (=> b!198304 (= e!136138 (= (bitIndex!0 (size!4455 (buf!4941 (_2!9189 (increaseBitIndex!0 (_1!9191 lt!307378))))) (currentByte!9279 (_2!9189 (increaseBitIndex!0 (_1!9191 lt!307378)))) (currentBit!9274 (_2!9189 (increaseBitIndex!0 (_1!9191 lt!307378))))) (bvadd lt!309094 lt!309096)))))

(assert (=> b!198304 (or (not (= (bvand lt!309094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309096 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309094 lt!309096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198304 (= lt!309096 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198304 (= lt!309094 (bitIndex!0 (size!4455 (buf!4941 (_1!9191 lt!307378))) (currentByte!9279 (_1!9191 lt!307378)) (currentBit!9274 (_1!9191 lt!307378))))))

(declare-fun lt!309091 () Bool)

(assert (=> b!198304 (= lt!309091 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (_1!9191 lt!307378))) (currentByte!9279 (_1!9191 lt!307378)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (_1!9191 lt!307378))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309090 () Bool)

(assert (=> b!198304 (= lt!309090 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (_1!9191 lt!307378))) (currentByte!9279 (_1!9191 lt!307378)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (_1!9191 lt!307378))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309093 () Bool)

(assert (=> b!198304 (= lt!309093 (not (= (bvand ((_ sign_extend 24) (select (arr!5385 (buf!4941 (_1!9191 lt!307378))) (currentByte!9279 (_1!9191 lt!307378)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9274 (_1!9191 lt!307378))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67293 res!165983) b!198304))

(declare-fun m!306935 () Bool)

(assert (=> d!67293 m!306935))

(declare-fun m!306937 () Bool)

(assert (=> d!67293 m!306937))

(declare-fun m!306939 () Bool)

(assert (=> d!67293 m!306939))

(declare-fun m!306941 () Bool)

(assert (=> d!67293 m!306941))

(assert (=> b!198304 m!306937))

(assert (=> b!198304 m!306939))

(assert (=> b!198304 m!306935))

(assert (=> b!198304 m!306437))

(declare-fun m!306943 () Bool)

(assert (=> b!198304 m!306943))

(assert (=> d!66803 d!67293))

(push 1)

(assert (not b!198234))

(assert (not b!198097))

(assert (not b!198291))

(assert (not bm!3116))

(assert (not b!198249))

(assert (not d!67115))

(assert (not d!67097))

(assert (not d!67131))

(assert (not b!198215))

(assert (not b!198180))

(assert (not d!67179))

(assert (not d!67181))

(assert (not b!198294))

(assert (not d!67163))

(assert (not b!198128))

(assert (not b!198160))

(assert (not b!198151))

(assert (not b!198231))

(assert (not d!67293))

(assert (not b!198090))

(assert (not d!67205))

(assert (not b!198142))

(assert (not b!198120))

(assert (not b!198124))

(assert (not b!198255))

(assert (not b!198155))

(assert (not b!198129))

(assert (not d!67137))

(assert (not b!198299))

(assert (not b!198173))

(assert (not b!198288))

(assert (not d!67149))

(assert (not b!198304))

(assert (not bm!3123))

(assert (not b!198119))

(assert (not d!67255))

(assert (not b!198284))

(assert (not b!198277))

(assert (not d!67287))

(assert (not b!198093))

(assert (not d!67165))

(assert (not b!198237))

(assert (not b!198126))

(assert (not d!67289))

(assert (not b!198225))

(assert (not b!198270))

(assert (not b!198153))

(assert (not d!67141))

(assert (not d!67157))

(assert (not bm!3120))

(assert (not b!198251))

(assert (not d!67285))

(assert (not b!198156))

(assert (not d!67201))

(assert (not d!67257))

(assert (not bm!3121))

(assert (not d!67175))

(assert (not d!67109))

(assert (not b!198292))

(assert (not b!198273))

(assert (not b!198149))

(assert (not b!198208))

(assert (not b!198252))

(assert (not b!198096))

(assert (not d!67083))

(assert (not b!198236))

(assert (not b!198094))

(assert (not d!67193))

(assert (not d!67167))

(assert (not d!67229))

(assert (not d!67153))

(assert (not b!198241))

(assert (not d!67265))

(assert (not d!67247))

(assert (not d!67185))

(assert (not b!198280))

(assert (not b!198178))

(assert (not b!198271))

(assert (not d!67215))

(assert (not b!198166))

(assert (not b!198253))

(assert (not d!67077))

(assert (not b!198170))

(assert (not b!198141))

(assert (not b!198233))

(assert (not b!198274))

(assert (not b!198123))

(assert (not b!198186))

(assert (not d!67139))

(assert (not d!67089))

(assert (not b!198181))

(assert (not d!67159))

(assert (not b!198285))

(assert (not b!198168))

(assert (not d!67209))

(assert (not d!67283))

(assert (not b!198272))

(assert (not d!67195))

(assert (not b!198137))

(assert (not d!67155))

(assert (not b!198152))

(assert (not d!67111))

(assert (not d!67199))

(assert (not b!198176))

(assert (not d!67075))

(assert (not d!67197))

(assert (not d!67239))

(assert (not d!67095))

(assert (not d!67173))

(assert (not b!198298))

(assert (not b!198216))

(assert (not b!198183))

(assert (not d!67145))

(assert (not d!67171))

(assert (not d!67259))

(assert (not b!198174))

(assert (not d!67191))

(assert (not b!198230))

(assert (not b!198224))

(assert (not b!198227))

(assert (not d!67143))

(assert (not d!67249))

(assert (not b!198100))

(assert (not b!198154))

(assert (not b!198278))

(assert (not d!67211))

(assert (not d!67263))

(assert (not d!67103))

(assert (not b!198140))

(assert (not b!198301))

(assert (not b!198099))

(assert (not b!198209))

(assert (not b!198157))

(assert (not d!67243))

(assert (not d!67281))

(assert (not d!67177))

(assert (not b!198172))

(assert (not b!198300))

(assert (not bm!3122))

(assert (not b!198091))

(assert (not d!67217))

(assert (not d!67227))

(assert (not b!198088))

(assert (not b!198158))

(assert (not d!67121))

(assert (not d!67079))

(assert (not b!198296))

(assert (not bm!3119))

(assert (not b!198228))

(assert (not b!198169))

(assert (not b!198286))

(assert (not b!198211))

(assert (not b!198218))

(assert (not b!198239))

(assert (not d!67105))

(assert (not d!67169))

(assert (not d!67235))

(assert (not b!198122))

(assert (not b!198222))

(assert (not d!67133))

(assert (not b!198238))

(assert (not d!67113))

(assert (not b!198289))

(assert (not b!198138))

(assert (not b!198303))

(assert (not b!198193))

(assert (not b!198102))

(assert (not d!67147))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


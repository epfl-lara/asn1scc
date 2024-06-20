; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39440 () Bool)

(assert start!39440)

(declare-fun b!177462 () Bool)

(declare-fun e!123663 () Bool)

(declare-fun e!123661 () Bool)

(assert (=> b!177462 (= e!123663 (not e!123661))))

(declare-fun res!147121 () Bool)

(assert (=> b!177462 (=> res!147121 e!123661)))

(declare-datatypes ((array!9581 0))(
  ( (array!9582 (arr!5155 (Array (_ BitVec 32) (_ BitVec 8))) (size!4225 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7558 0))(
  ( (BitStream!7559 (buf!4668 array!9581) (currentByte!8848 (_ BitVec 32)) (currentBit!8843 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12764 0))(
  ( (Unit!12765) )
))
(declare-datatypes ((tuple2!15296 0))(
  ( (tuple2!15297 (_1!8293 Unit!12764) (_2!8293 BitStream!7558)) )
))
(declare-fun lt!272495 () tuple2!15296)

(declare-fun thiss!1204 () BitStream!7558)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177462 (= res!147121 (not (= (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4225 (buf!4668 thiss!1204)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204))))))))

(declare-fun e!123664 () Bool)

(assert (=> b!177462 e!123664))

(declare-fun res!147119 () Bool)

(assert (=> b!177462 (=> (not res!147119) (not e!123664))))

(assert (=> b!177462 (= res!147119 (= (size!4225 (buf!4668 thiss!1204)) (size!4225 (buf!4668 (_2!8293 lt!272495)))))))

(declare-fun lt!272496 () Bool)

(declare-fun appendBit!0 (BitStream!7558 Bool) tuple2!15296)

(assert (=> b!177462 (= lt!272495 (appendBit!0 thiss!1204 lt!272496))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!177462 (= lt!272496 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177463 () Bool)

(declare-fun e!123665 () Bool)

(declare-datatypes ((tuple2!15298 0))(
  ( (tuple2!15299 (_1!8294 BitStream!7558) (_2!8294 Bool)) )
))
(declare-fun lt!272501 () tuple2!15298)

(declare-fun lt!272499 () (_ BitVec 64))

(assert (=> b!177463 (= e!123665 (= (bitIndex!0 (size!4225 (buf!4668 (_1!8294 lt!272501))) (currentByte!8848 (_1!8294 lt!272501)) (currentBit!8843 (_1!8294 lt!272501))) lt!272499))))

(declare-fun b!177464 () Bool)

(declare-fun e!123666 () Bool)

(assert (=> b!177464 (= e!123664 e!123666)))

(declare-fun res!147122 () Bool)

(assert (=> b!177464 (=> (not res!147122) (not e!123666))))

(declare-fun lt!272500 () (_ BitVec 64))

(assert (=> b!177464 (= res!147122 (= lt!272499 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272500)))))

(assert (=> b!177464 (= lt!272499 (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))))))

(assert (=> b!177464 (= lt!272500 (bitIndex!0 (size!4225 (buf!4668 thiss!1204)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204)))))

(declare-fun b!177465 () Bool)

(assert (=> b!177465 (= e!123666 e!123665)))

(declare-fun res!147123 () Bool)

(assert (=> b!177465 (=> (not res!147123) (not e!123665))))

(assert (=> b!177465 (= res!147123 (and (= (_2!8294 lt!272501) lt!272496) (= (_1!8294 lt!272501) (_2!8293 lt!272495))))))

(declare-fun readBitPure!0 (BitStream!7558) tuple2!15298)

(declare-fun readerFrom!0 (BitStream!7558 (_ BitVec 32) (_ BitVec 32)) BitStream!7558)

(assert (=> b!177465 (= lt!272501 (readBitPure!0 (readerFrom!0 (_2!8293 lt!272495) (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204))))))

(declare-fun b!177466 () Bool)

(declare-fun res!147115 () Bool)

(assert (=> b!177466 (=> (not res!147115) (not e!123666))))

(declare-fun isPrefixOf!0 (BitStream!7558 BitStream!7558) Bool)

(assert (=> b!177466 (= res!147115 (isPrefixOf!0 thiss!1204 (_2!8293 lt!272495)))))

(declare-fun res!147118 () Bool)

(assert (=> start!39440 (=> (not res!147118) (not e!123663))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> start!39440 (= res!147118 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39440 e!123663))

(assert (=> start!39440 true))

(declare-fun e!123667 () Bool)

(declare-fun inv!12 (BitStream!7558) Bool)

(assert (=> start!39440 (and (inv!12 thiss!1204) e!123667)))

(declare-fun b!177467 () Bool)

(declare-fun res!147116 () Bool)

(assert (=> b!177467 (=> (not res!147116) (not e!123663))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177467 (= res!147116 (invariant!0 (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204) (size!4225 (buf!4668 thiss!1204))))))

(declare-fun b!177468 () Bool)

(declare-fun lt!272498 () tuple2!15296)

(assert (=> b!177468 (= e!123661 (invariant!0 (currentBit!8843 (_2!8293 lt!272498)) (currentByte!8848 (_2!8293 lt!272498)) (size!4225 (buf!4668 (_2!8293 lt!272498)))))))

(assert (=> b!177468 (isPrefixOf!0 thiss!1204 (_2!8293 lt!272498))))

(declare-fun lt!272497 () Unit!12764)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7558 BitStream!7558 BitStream!7558) Unit!12764)

(assert (=> b!177468 (= lt!272497 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8293 lt!272495) (_2!8293 lt!272498)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7558 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15296)

(assert (=> b!177468 (= lt!272498 (appendBitsLSBFirstLoopTR!0 (_2!8293 lt!272495) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177469 () Bool)

(declare-fun res!147117 () Bool)

(assert (=> b!177469 (=> (not res!147117) (not e!123663))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177469 (= res!147117 (validate_offset_bits!1 ((_ sign_extend 32) (size!4225 (buf!4668 thiss!1204))) ((_ sign_extend 32) (currentByte!8848 thiss!1204)) ((_ sign_extend 32) (currentBit!8843 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177470 () Bool)

(declare-fun array_inv!3966 (array!9581) Bool)

(assert (=> b!177470 (= e!123667 (array_inv!3966 (buf!4668 thiss!1204)))))

(declare-fun b!177471 () Bool)

(declare-fun res!147120 () Bool)

(assert (=> b!177471 (=> (not res!147120) (not e!123663))))

(assert (=> b!177471 (= res!147120 (not (= i!590 nBits!348)))))

(assert (= (and start!39440 res!147118) b!177469))

(assert (= (and b!177469 res!147117) b!177467))

(assert (= (and b!177467 res!147116) b!177471))

(assert (= (and b!177471 res!147120) b!177462))

(assert (= (and b!177462 res!147119) b!177464))

(assert (= (and b!177464 res!147122) b!177466))

(assert (= (and b!177466 res!147115) b!177465))

(assert (= (and b!177465 res!147123) b!177463))

(assert (= (and b!177462 (not res!147121)) b!177468))

(assert (= start!39440 b!177470))

(declare-fun m!277357 () Bool)

(assert (=> b!177470 m!277357))

(declare-fun m!277359 () Bool)

(assert (=> b!177468 m!277359))

(declare-fun m!277361 () Bool)

(assert (=> b!177468 m!277361))

(declare-fun m!277363 () Bool)

(assert (=> b!177468 m!277363))

(declare-fun m!277365 () Bool)

(assert (=> b!177468 m!277365))

(declare-fun m!277367 () Bool)

(assert (=> start!39440 m!277367))

(declare-fun m!277369 () Bool)

(assert (=> b!177469 m!277369))

(declare-fun m!277371 () Bool)

(assert (=> b!177463 m!277371))

(declare-fun m!277373 () Bool)

(assert (=> b!177467 m!277373))

(declare-fun m!277375 () Bool)

(assert (=> b!177464 m!277375))

(declare-fun m!277377 () Bool)

(assert (=> b!177464 m!277377))

(declare-fun m!277379 () Bool)

(assert (=> b!177465 m!277379))

(assert (=> b!177465 m!277379))

(declare-fun m!277381 () Bool)

(assert (=> b!177465 m!277381))

(assert (=> b!177462 m!277375))

(assert (=> b!177462 m!277377))

(declare-fun m!277383 () Bool)

(assert (=> b!177462 m!277383))

(declare-fun m!277385 () Bool)

(assert (=> b!177466 m!277385))

(push 1)

(assert (not b!177464))

(assert (not b!177467))

(assert (not b!177462))

(assert (not b!177470))

(assert (not start!39440))

(assert (not b!177466))

(assert (not b!177465))

(assert (not b!177469))

(assert (not b!177468))

(assert (not b!177463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62455 () Bool)

(declare-datatypes ((tuple2!15310 0))(
  ( (tuple2!15311 (_1!8300 Bool) (_2!8300 BitStream!7558)) )
))
(declare-fun lt!272570 () tuple2!15310)

(declare-fun readBit!0 (BitStream!7558) tuple2!15310)

(assert (=> d!62455 (= lt!272570 (readBit!0 (readerFrom!0 (_2!8293 lt!272495) (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204))))))

(assert (=> d!62455 (= (readBitPure!0 (readerFrom!0 (_2!8293 lt!272495) (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204))) (tuple2!15299 (_2!8300 lt!272570) (_1!8300 lt!272570)))))

(declare-fun bs!15577 () Bool)

(assert (= bs!15577 d!62455))

(assert (=> bs!15577 m!277379))

(declare-fun m!277455 () Bool)

(assert (=> bs!15577 m!277455))

(assert (=> b!177465 d!62455))

(declare-fun d!62457 () Bool)

(declare-fun e!123726 () Bool)

(assert (=> d!62457 e!123726))

(declare-fun res!147206 () Bool)

(assert (=> d!62457 (=> (not res!147206) (not e!123726))))

(assert (=> d!62457 (= res!147206 (invariant!0 (currentBit!8843 (_2!8293 lt!272495)) (currentByte!8848 (_2!8293 lt!272495)) (size!4225 (buf!4668 (_2!8293 lt!272495)))))))

(assert (=> d!62457 (= (readerFrom!0 (_2!8293 lt!272495) (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204)) (BitStream!7559 (buf!4668 (_2!8293 lt!272495)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204)))))

(declare-fun b!177560 () Bool)

(assert (=> b!177560 (= e!123726 (invariant!0 (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204) (size!4225 (buf!4668 (_2!8293 lt!272495)))))))

(assert (= (and d!62457 res!147206) b!177560))

(declare-fun m!277457 () Bool)

(assert (=> d!62457 m!277457))

(declare-fun m!277459 () Bool)

(assert (=> b!177560 m!277459))

(assert (=> b!177465 d!62457))

(declare-fun d!62459 () Bool)

(assert (=> d!62459 (= (array_inv!3966 (buf!4668 thiss!1204)) (bvsge (size!4225 (buf!4668 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177470 d!62459))

(declare-fun d!62461 () Bool)

(assert (=> d!62461 (= (invariant!0 (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204) (size!4225 (buf!4668 thiss!1204))) (and (bvsge (currentBit!8843 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8843 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8848 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8848 thiss!1204) (size!4225 (buf!4668 thiss!1204))) (and (= (currentBit!8843 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8848 thiss!1204) (size!4225 (buf!4668 thiss!1204)))))))))

(assert (=> b!177467 d!62461))

(declare-fun d!62463 () Bool)

(declare-fun res!147222 () Bool)

(declare-fun e!123736 () Bool)

(assert (=> d!62463 (=> (not res!147222) (not e!123736))))

(assert (=> d!62463 (= res!147222 (= (size!4225 (buf!4668 thiss!1204)) (size!4225 (buf!4668 (_2!8293 lt!272495)))))))

(assert (=> d!62463 (= (isPrefixOf!0 thiss!1204 (_2!8293 lt!272495)) e!123736)))

(declare-fun b!177574 () Bool)

(declare-fun res!147221 () Bool)

(assert (=> b!177574 (=> (not res!147221) (not e!123736))))

(assert (=> b!177574 (= res!147221 (bvsle (bitIndex!0 (size!4225 (buf!4668 thiss!1204)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204)) (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495)))))))

(declare-fun b!177575 () Bool)

(declare-fun e!123735 () Bool)

(assert (=> b!177575 (= e!123736 e!123735)))

(declare-fun res!147220 () Bool)

(assert (=> b!177575 (=> res!147220 e!123735)))

(assert (=> b!177575 (= res!147220 (= (size!4225 (buf!4668 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177576 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9581 array!9581 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177576 (= e!123735 (arrayBitRangesEq!0 (buf!4668 thiss!1204) (buf!4668 (_2!8293 lt!272495)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4225 (buf!4668 thiss!1204)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204))))))

(assert (= (and d!62463 res!147222) b!177574))

(assert (= (and b!177574 res!147221) b!177575))

(assert (= (and b!177575 (not res!147220)) b!177576))

(assert (=> b!177574 m!277377))

(assert (=> b!177574 m!277375))

(assert (=> b!177576 m!277377))

(assert (=> b!177576 m!277377))

(declare-fun m!277481 () Bool)

(assert (=> b!177576 m!277481))

(assert (=> b!177466 d!62463))

(declare-fun d!62477 () Bool)

(declare-fun e!123742 () Bool)

(assert (=> d!62477 e!123742))

(declare-fun res!147233 () Bool)

(assert (=> d!62477 (=> (not res!147233) (not e!123742))))

(declare-fun lt!272619 () (_ BitVec 64))

(declare-fun lt!272618 () (_ BitVec 64))

(declare-fun lt!272617 () (_ BitVec 64))

(assert (=> d!62477 (= res!147233 (= lt!272619 (bvsub lt!272618 lt!272617)))))

(assert (=> d!62477 (or (= (bvand lt!272618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272617 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272618 lt!272617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62477 (= lt!272617 (remainingBits!0 ((_ sign_extend 32) (size!4225 (buf!4668 (_1!8294 lt!272501)))) ((_ sign_extend 32) (currentByte!8848 (_1!8294 lt!272501))) ((_ sign_extend 32) (currentBit!8843 (_1!8294 lt!272501)))))))

(declare-fun lt!272616 () (_ BitVec 64))

(declare-fun lt!272621 () (_ BitVec 64))

(assert (=> d!62477 (= lt!272618 (bvmul lt!272616 lt!272621))))

(assert (=> d!62477 (or (= lt!272616 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272621 (bvsdiv (bvmul lt!272616 lt!272621) lt!272616)))))

(assert (=> d!62477 (= lt!272621 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62477 (= lt!272616 ((_ sign_extend 32) (size!4225 (buf!4668 (_1!8294 lt!272501)))))))

(assert (=> d!62477 (= lt!272619 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8848 (_1!8294 lt!272501))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8843 (_1!8294 lt!272501)))))))

(assert (=> d!62477 (invariant!0 (currentBit!8843 (_1!8294 lt!272501)) (currentByte!8848 (_1!8294 lt!272501)) (size!4225 (buf!4668 (_1!8294 lt!272501))))))

(assert (=> d!62477 (= (bitIndex!0 (size!4225 (buf!4668 (_1!8294 lt!272501))) (currentByte!8848 (_1!8294 lt!272501)) (currentBit!8843 (_1!8294 lt!272501))) lt!272619)))

(declare-fun b!177587 () Bool)

(declare-fun res!147234 () Bool)

(assert (=> b!177587 (=> (not res!147234) (not e!123742))))

(assert (=> b!177587 (= res!147234 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272619))))

(declare-fun b!177588 () Bool)

(declare-fun lt!272620 () (_ BitVec 64))

(assert (=> b!177588 (= e!123742 (bvsle lt!272619 (bvmul lt!272620 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177588 (or (= lt!272620 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272620 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272620)))))

(assert (=> b!177588 (= lt!272620 ((_ sign_extend 32) (size!4225 (buf!4668 (_1!8294 lt!272501)))))))

(assert (= (and d!62477 res!147233) b!177587))

(assert (= (and b!177587 res!147234) b!177588))

(declare-fun m!277487 () Bool)

(assert (=> d!62477 m!277487))

(declare-fun m!277489 () Bool)

(assert (=> d!62477 m!277489))

(assert (=> b!177463 d!62477))

(declare-fun d!62481 () Bool)

(assert (=> d!62481 (= (invariant!0 (currentBit!8843 (_2!8293 lt!272498)) (currentByte!8848 (_2!8293 lt!272498)) (size!4225 (buf!4668 (_2!8293 lt!272498)))) (and (bvsge (currentBit!8843 (_2!8293 lt!272498)) #b00000000000000000000000000000000) (bvslt (currentBit!8843 (_2!8293 lt!272498)) #b00000000000000000000000000001000) (bvsge (currentByte!8848 (_2!8293 lt!272498)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8848 (_2!8293 lt!272498)) (size!4225 (buf!4668 (_2!8293 lt!272498)))) (and (= (currentBit!8843 (_2!8293 lt!272498)) #b00000000000000000000000000000000) (= (currentByte!8848 (_2!8293 lt!272498)) (size!4225 (buf!4668 (_2!8293 lt!272498))))))))))

(assert (=> b!177468 d!62481))

(declare-fun d!62483 () Bool)

(declare-fun res!147237 () Bool)

(declare-fun e!123744 () Bool)

(assert (=> d!62483 (=> (not res!147237) (not e!123744))))

(assert (=> d!62483 (= res!147237 (= (size!4225 (buf!4668 thiss!1204)) (size!4225 (buf!4668 (_2!8293 lt!272498)))))))

(assert (=> d!62483 (= (isPrefixOf!0 thiss!1204 (_2!8293 lt!272498)) e!123744)))

(declare-fun b!177589 () Bool)

(declare-fun res!147236 () Bool)

(assert (=> b!177589 (=> (not res!147236) (not e!123744))))

(assert (=> b!177589 (= res!147236 (bvsle (bitIndex!0 (size!4225 (buf!4668 thiss!1204)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204)) (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272498))) (currentByte!8848 (_2!8293 lt!272498)) (currentBit!8843 (_2!8293 lt!272498)))))))

(declare-fun b!177590 () Bool)

(declare-fun e!123743 () Bool)

(assert (=> b!177590 (= e!123744 e!123743)))

(declare-fun res!147235 () Bool)

(assert (=> b!177590 (=> res!147235 e!123743)))

(assert (=> b!177590 (= res!147235 (= (size!4225 (buf!4668 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177591 () Bool)

(assert (=> b!177591 (= e!123743 (arrayBitRangesEq!0 (buf!4668 thiss!1204) (buf!4668 (_2!8293 lt!272498)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4225 (buf!4668 thiss!1204)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204))))))

(assert (= (and d!62483 res!147237) b!177589))

(assert (= (and b!177589 res!147236) b!177590))

(assert (= (and b!177590 (not res!147235)) b!177591))

(assert (=> b!177589 m!277377))

(declare-fun m!277491 () Bool)

(assert (=> b!177589 m!277491))

(assert (=> b!177591 m!277377))

(assert (=> b!177591 m!277377))

(declare-fun m!277493 () Bool)

(assert (=> b!177591 m!277493))

(assert (=> b!177468 d!62483))

(declare-fun d!62487 () Bool)

(assert (=> d!62487 (isPrefixOf!0 thiss!1204 (_2!8293 lt!272498))))

(declare-fun lt!272627 () Unit!12764)

(declare-fun choose!30 (BitStream!7558 BitStream!7558 BitStream!7558) Unit!12764)

(assert (=> d!62487 (= lt!272627 (choose!30 thiss!1204 (_2!8293 lt!272495) (_2!8293 lt!272498)))))

(assert (=> d!62487 (isPrefixOf!0 thiss!1204 (_2!8293 lt!272495))))

(assert (=> d!62487 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8293 lt!272495) (_2!8293 lt!272498)) lt!272627)))

(declare-fun bs!15580 () Bool)

(assert (= bs!15580 d!62487))

(assert (=> bs!15580 m!277361))

(declare-fun m!277497 () Bool)

(assert (=> bs!15580 m!277497))

(assert (=> bs!15580 m!277385))

(assert (=> b!177468 d!62487))

(declare-fun b!177691 () Bool)

(declare-fun e!123808 () (_ BitVec 64))

(assert (=> b!177691 (= e!123808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!177692 () Bool)

(declare-fun e!123807 () tuple2!15296)

(declare-fun Unit!12770 () Unit!12764)

(assert (=> b!177692 (= e!123807 (tuple2!15297 Unit!12770 (_2!8293 lt!272495)))))

(declare-fun lt!272971 () Unit!12764)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7558) Unit!12764)

(assert (=> b!177692 (= lt!272971 (lemmaIsPrefixRefl!0 (_2!8293 lt!272495)))))

(declare-fun call!2915 () Bool)

(assert (=> b!177692 call!2915))

(declare-fun lt!272960 () Unit!12764)

(assert (=> b!177692 (= lt!272960 lt!272971)))

(declare-fun b!177693 () Bool)

(declare-fun e!123809 () Bool)

(declare-fun e!123804 () Bool)

(assert (=> b!177693 (= e!123809 e!123804)))

(declare-fun res!147328 () Bool)

(assert (=> b!177693 (=> (not res!147328) (not e!123804))))

(declare-datatypes ((tuple2!15312 0))(
  ( (tuple2!15313 (_1!8301 BitStream!7558) (_2!8301 (_ BitVec 64))) )
))
(declare-fun lt!272977 () tuple2!15312)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177693 (= res!147328 (= (_2!8301 lt!272977) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!15314 0))(
  ( (tuple2!15315 (_1!8302 BitStream!7558) (_2!8302 BitStream!7558)) )
))
(declare-fun lt!272976 () tuple2!15314)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15312)

(assert (=> b!177693 (= lt!272977 (readNBitsLSBFirstsLoopPure!0 (_1!8302 lt!272976) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!272943 () Unit!12764)

(declare-fun lt!272930 () Unit!12764)

(assert (=> b!177693 (= lt!272943 lt!272930)))

(declare-fun lt!272954 () tuple2!15296)

(declare-fun lt!272959 () (_ BitVec 64))

(assert (=> b!177693 (validate_offset_bits!1 ((_ sign_extend 32) (size!4225 (buf!4668 (_2!8293 lt!272954)))) ((_ sign_extend 32) (currentByte!8848 (_2!8293 lt!272495))) ((_ sign_extend 32) (currentBit!8843 (_2!8293 lt!272495))) lt!272959)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7558 array!9581 (_ BitVec 64)) Unit!12764)

(assert (=> b!177693 (= lt!272930 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8293 lt!272495) (buf!4668 (_2!8293 lt!272954)) lt!272959))))

(declare-fun e!123810 () Bool)

(assert (=> b!177693 e!123810))

(declare-fun res!147329 () Bool)

(assert (=> b!177693 (=> (not res!147329) (not e!123810))))

(assert (=> b!177693 (= res!147329 (and (= (size!4225 (buf!4668 (_2!8293 lt!272495))) (size!4225 (buf!4668 (_2!8293 lt!272954)))) (bvsge lt!272959 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177693 (= lt!272959 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!177693 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7558 BitStream!7558) tuple2!15314)

(assert (=> b!177693 (= lt!272976 (reader!0 (_2!8293 lt!272495) (_2!8293 lt!272954)))))

(declare-fun b!177694 () Bool)

(declare-fun res!147320 () Bool)

(assert (=> b!177694 (= res!147320 call!2915)))

(declare-fun e!123806 () Bool)

(assert (=> b!177694 (=> (not res!147320) (not e!123806))))

(declare-fun b!177695 () Bool)

(declare-fun res!147321 () Bool)

(assert (=> b!177695 (=> (not res!147321) (not e!123809))))

(declare-fun lt!272928 () (_ BitVec 64))

(declare-fun lt!272931 () (_ BitVec 64))

(assert (=> b!177695 (= res!147321 (= (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272954))) (currentByte!8848 (_2!8293 lt!272954)) (currentBit!8843 (_2!8293 lt!272954))) (bvsub lt!272931 lt!272928)))))

(assert (=> b!177695 (or (= (bvand lt!272931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272928 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272931 lt!272928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177695 (= lt!272928 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!272940 () (_ BitVec 64))

(declare-fun lt!272944 () (_ BitVec 64))

(assert (=> b!177695 (= lt!272931 (bvadd lt!272940 lt!272944))))

(assert (=> b!177695 (or (not (= (bvand lt!272940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272944 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!272940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!272940 lt!272944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177695 (= lt!272944 ((_ sign_extend 32) nBits!348))))

(assert (=> b!177695 (= lt!272940 (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))))))

(declare-fun lt!272965 () tuple2!15296)

(declare-fun bm!2912 () Bool)

(declare-fun c!9252 () Bool)

(assert (=> bm!2912 (= call!2915 (isPrefixOf!0 (_2!8293 lt!272495) (ite c!9252 (_2!8293 lt!272495) (_2!8293 lt!272965))))))

(declare-fun b!177696 () Bool)

(assert (=> b!177696 (= e!123810 (validate_offset_bits!1 ((_ sign_extend 32) (size!4225 (buf!4668 (_2!8293 lt!272495)))) ((_ sign_extend 32) (currentByte!8848 (_2!8293 lt!272495))) ((_ sign_extend 32) (currentBit!8843 (_2!8293 lt!272495))) lt!272959))))

(declare-fun b!177697 () Bool)

(declare-fun res!147327 () Bool)

(assert (=> b!177697 (=> (not res!147327) (not e!123809))))

(assert (=> b!177697 (= res!147327 (= (size!4225 (buf!4668 (_2!8293 lt!272495))) (size!4225 (buf!4668 (_2!8293 lt!272954)))))))

(declare-fun b!177698 () Bool)

(declare-fun lt!272958 () tuple2!15296)

(assert (=> b!177698 (= e!123807 (tuple2!15297 (_1!8293 lt!272958) (_2!8293 lt!272958)))))

(declare-fun lt!272972 () Bool)

(assert (=> b!177698 (= lt!272972 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177698 (= lt!272965 (appendBit!0 (_2!8293 lt!272495) lt!272972))))

(declare-fun res!147324 () Bool)

(assert (=> b!177698 (= res!147324 (= (size!4225 (buf!4668 (_2!8293 lt!272495))) (size!4225 (buf!4668 (_2!8293 lt!272965)))))))

(assert (=> b!177698 (=> (not res!147324) (not e!123806))))

(assert (=> b!177698 e!123806))

(declare-fun lt!272929 () tuple2!15296)

(assert (=> b!177698 (= lt!272929 lt!272965)))

(assert (=> b!177698 (= lt!272958 (appendBitsLSBFirstLoopTR!0 (_2!8293 lt!272929) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!272970 () Unit!12764)

(assert (=> b!177698 (= lt!272970 (lemmaIsPrefixTransitive!0 (_2!8293 lt!272495) (_2!8293 lt!272929) (_2!8293 lt!272958)))))

(assert (=> b!177698 (isPrefixOf!0 (_2!8293 lt!272495) (_2!8293 lt!272958))))

(declare-fun lt!272955 () Unit!12764)

(assert (=> b!177698 (= lt!272955 lt!272970)))

(assert (=> b!177698 (invariant!0 (currentBit!8843 (_2!8293 lt!272495)) (currentByte!8848 (_2!8293 lt!272495)) (size!4225 (buf!4668 (_2!8293 lt!272929))))))

(declare-fun lt!272927 () BitStream!7558)

(assert (=> b!177698 (= lt!272927 (BitStream!7559 (buf!4668 (_2!8293 lt!272929)) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))))))

(assert (=> b!177698 (invariant!0 (currentBit!8843 lt!272927) (currentByte!8848 lt!272927) (size!4225 (buf!4668 (_2!8293 lt!272958))))))

(declare-fun lt!272924 () BitStream!7558)

(assert (=> b!177698 (= lt!272924 (BitStream!7559 (buf!4668 (_2!8293 lt!272958)) (currentByte!8848 lt!272927) (currentBit!8843 lt!272927)))))

(declare-fun lt!272968 () tuple2!15298)

(assert (=> b!177698 (= lt!272968 (readBitPure!0 lt!272927))))

(declare-fun lt!272932 () tuple2!15298)

(assert (=> b!177698 (= lt!272932 (readBitPure!0 lt!272924))))

(declare-fun lt!272953 () Unit!12764)

(declare-fun readBitPrefixLemma!0 (BitStream!7558 BitStream!7558) Unit!12764)

(assert (=> b!177698 (= lt!272953 (readBitPrefixLemma!0 lt!272927 (_2!8293 lt!272958)))))

(declare-fun res!147326 () Bool)

(assert (=> b!177698 (= res!147326 (= (bitIndex!0 (size!4225 (buf!4668 (_1!8294 lt!272968))) (currentByte!8848 (_1!8294 lt!272968)) (currentBit!8843 (_1!8294 lt!272968))) (bitIndex!0 (size!4225 (buf!4668 (_1!8294 lt!272932))) (currentByte!8848 (_1!8294 lt!272932)) (currentBit!8843 (_1!8294 lt!272932)))))))

(declare-fun e!123805 () Bool)

(assert (=> b!177698 (=> (not res!147326) (not e!123805))))

(assert (=> b!177698 e!123805))

(declare-fun lt!272963 () Unit!12764)

(assert (=> b!177698 (= lt!272963 lt!272953)))

(declare-fun lt!272962 () tuple2!15314)

(assert (=> b!177698 (= lt!272962 (reader!0 (_2!8293 lt!272495) (_2!8293 lt!272958)))))

(declare-fun lt!272923 () tuple2!15314)

(assert (=> b!177698 (= lt!272923 (reader!0 (_2!8293 lt!272929) (_2!8293 lt!272958)))))

(declare-fun lt!272937 () tuple2!15298)

(assert (=> b!177698 (= lt!272937 (readBitPure!0 (_1!8302 lt!272962)))))

(assert (=> b!177698 (= (_2!8294 lt!272937) lt!272972)))

(declare-fun lt!272936 () Unit!12764)

(declare-fun Unit!12772 () Unit!12764)

(assert (=> b!177698 (= lt!272936 Unit!12772)))

(declare-fun lt!272949 () (_ BitVec 64))

(assert (=> b!177698 (= lt!272949 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!272964 () (_ BitVec 64))

(assert (=> b!177698 (= lt!272964 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!272978 () Unit!12764)

(assert (=> b!177698 (= lt!272978 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8293 lt!272495) (buf!4668 (_2!8293 lt!272958)) lt!272964))))

(assert (=> b!177698 (validate_offset_bits!1 ((_ sign_extend 32) (size!4225 (buf!4668 (_2!8293 lt!272958)))) ((_ sign_extend 32) (currentByte!8848 (_2!8293 lt!272495))) ((_ sign_extend 32) (currentBit!8843 (_2!8293 lt!272495))) lt!272964)))

(declare-fun lt!272966 () Unit!12764)

(assert (=> b!177698 (= lt!272966 lt!272978)))

(declare-fun lt!272961 () tuple2!15312)

(assert (=> b!177698 (= lt!272961 (readNBitsLSBFirstsLoopPure!0 (_1!8302 lt!272962) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!272949))))

(declare-fun lt!272926 () (_ BitVec 64))

(assert (=> b!177698 (= lt!272926 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!272975 () Unit!12764)

(assert (=> b!177698 (= lt!272975 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8293 lt!272929) (buf!4668 (_2!8293 lt!272958)) lt!272926))))

(assert (=> b!177698 (validate_offset_bits!1 ((_ sign_extend 32) (size!4225 (buf!4668 (_2!8293 lt!272958)))) ((_ sign_extend 32) (currentByte!8848 (_2!8293 lt!272929))) ((_ sign_extend 32) (currentBit!8843 (_2!8293 lt!272929))) lt!272926)))

(declare-fun lt!272948 () Unit!12764)

(assert (=> b!177698 (= lt!272948 lt!272975)))

(declare-fun lt!272967 () tuple2!15312)

(assert (=> b!177698 (= lt!272967 (readNBitsLSBFirstsLoopPure!0 (_1!8302 lt!272923) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!272949 (ite (_2!8294 lt!272937) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!272973 () tuple2!15312)

(assert (=> b!177698 (= lt!272973 (readNBitsLSBFirstsLoopPure!0 (_1!8302 lt!272962) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!272949))))

(declare-fun c!9251 () Bool)

(assert (=> b!177698 (= c!9251 (_2!8294 (readBitPure!0 (_1!8302 lt!272962))))))

(declare-fun lt!272941 () tuple2!15312)

(declare-fun withMovedBitIndex!0 (BitStream!7558 (_ BitVec 64)) BitStream!7558)

(assert (=> b!177698 (= lt!272941 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8302 lt!272962) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!272949 e!123808)))))

(declare-fun lt!272939 () Unit!12764)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12764)

(assert (=> b!177698 (= lt!272939 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8302 lt!272962) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!272949))))

(assert (=> b!177698 (and (= (_2!8301 lt!272973) (_2!8301 lt!272941)) (= (_1!8301 lt!272973) (_1!8301 lt!272941)))))

(declare-fun lt!272933 () Unit!12764)

(assert (=> b!177698 (= lt!272933 lt!272939)))

(assert (=> b!177698 (= (_1!8302 lt!272962) (withMovedBitIndex!0 (_2!8302 lt!272962) (bvsub (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))) (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272958))) (currentByte!8848 (_2!8293 lt!272958)) (currentBit!8843 (_2!8293 lt!272958))))))))

(declare-fun lt!272951 () Unit!12764)

(declare-fun Unit!12775 () Unit!12764)

(assert (=> b!177698 (= lt!272951 Unit!12775)))

(assert (=> b!177698 (= (_1!8302 lt!272923) (withMovedBitIndex!0 (_2!8302 lt!272923) (bvsub (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272929))) (currentByte!8848 (_2!8293 lt!272929)) (currentBit!8843 (_2!8293 lt!272929))) (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272958))) (currentByte!8848 (_2!8293 lt!272958)) (currentBit!8843 (_2!8293 lt!272958))))))))

(declare-fun lt!272946 () Unit!12764)

(declare-fun Unit!12776 () Unit!12764)

(assert (=> b!177698 (= lt!272946 Unit!12776)))

(assert (=> b!177698 (= (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))) (bvsub (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272929))) (currentByte!8848 (_2!8293 lt!272929)) (currentBit!8843 (_2!8293 lt!272929))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!272934 () Unit!12764)

(declare-fun Unit!12777 () Unit!12764)

(assert (=> b!177698 (= lt!272934 Unit!12777)))

(assert (=> b!177698 (= (_2!8301 lt!272961) (_2!8301 lt!272967))))

(declare-fun lt!272974 () Unit!12764)

(declare-fun Unit!12778 () Unit!12764)

(assert (=> b!177698 (= lt!272974 Unit!12778)))

(assert (=> b!177698 (invariant!0 (currentBit!8843 (_2!8293 lt!272958)) (currentByte!8848 (_2!8293 lt!272958)) (size!4225 (buf!4668 (_2!8293 lt!272958))))))

(declare-fun lt!272935 () Unit!12764)

(declare-fun Unit!12779 () Unit!12764)

(assert (=> b!177698 (= lt!272935 Unit!12779)))

(assert (=> b!177698 (= (size!4225 (buf!4668 (_2!8293 lt!272495))) (size!4225 (buf!4668 (_2!8293 lt!272958))))))

(declare-fun lt!272925 () Unit!12764)

(declare-fun Unit!12780 () Unit!12764)

(assert (=> b!177698 (= lt!272925 Unit!12780)))

(assert (=> b!177698 (= (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272958))) (currentByte!8848 (_2!8293 lt!272958)) (currentBit!8843 (_2!8293 lt!272958))) (bvsub (bvadd (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!272938 () Unit!12764)

(declare-fun Unit!12781 () Unit!12764)

(assert (=> b!177698 (= lt!272938 Unit!12781)))

(declare-fun lt!272950 () Unit!12764)

(declare-fun Unit!12782 () Unit!12764)

(assert (=> b!177698 (= lt!272950 Unit!12782)))

(declare-fun lt!272942 () tuple2!15314)

(assert (=> b!177698 (= lt!272942 (reader!0 (_2!8293 lt!272495) (_2!8293 lt!272958)))))

(declare-fun lt!272969 () (_ BitVec 64))

(assert (=> b!177698 (= lt!272969 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!272952 () Unit!12764)

(assert (=> b!177698 (= lt!272952 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8293 lt!272495) (buf!4668 (_2!8293 lt!272958)) lt!272969))))

(assert (=> b!177698 (validate_offset_bits!1 ((_ sign_extend 32) (size!4225 (buf!4668 (_2!8293 lt!272958)))) ((_ sign_extend 32) (currentByte!8848 (_2!8293 lt!272495))) ((_ sign_extend 32) (currentBit!8843 (_2!8293 lt!272495))) lt!272969)))

(declare-fun lt!272957 () Unit!12764)

(assert (=> b!177698 (= lt!272957 lt!272952)))

(declare-fun lt!272956 () tuple2!15312)

(assert (=> b!177698 (= lt!272956 (readNBitsLSBFirstsLoopPure!0 (_1!8302 lt!272942) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!147323 () Bool)

(assert (=> b!177698 (= res!147323 (= (_2!8301 lt!272956) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!123803 () Bool)

(assert (=> b!177698 (=> (not res!147323) (not e!123803))))

(assert (=> b!177698 e!123803))

(declare-fun lt!272945 () Unit!12764)

(declare-fun Unit!12783 () Unit!12764)

(assert (=> b!177698 (= lt!272945 Unit!12783)))

(declare-fun b!177699 () Bool)

(declare-fun res!147322 () Bool)

(assert (=> b!177699 (=> (not res!147322) (not e!123809))))

(assert (=> b!177699 (= res!147322 (isPrefixOf!0 (_2!8293 lt!272495) (_2!8293 lt!272954)))))

(declare-fun b!177700 () Bool)

(assert (=> b!177700 (= e!123808 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!177701 () Bool)

(assert (=> b!177701 (= e!123803 (= (_1!8301 lt!272956) (_2!8302 lt!272942)))))

(declare-fun b!177702 () Bool)

(declare-fun e!123811 () Bool)

(declare-fun lt!272947 () tuple2!15298)

(assert (=> b!177702 (= e!123811 (= (bitIndex!0 (size!4225 (buf!4668 (_1!8294 lt!272947))) (currentByte!8848 (_1!8294 lt!272947)) (currentBit!8843 (_1!8294 lt!272947))) (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272965))) (currentByte!8848 (_2!8293 lt!272965)) (currentBit!8843 (_2!8293 lt!272965)))))))

(declare-fun d!62491 () Bool)

(assert (=> d!62491 e!123809))

(declare-fun res!147325 () Bool)

(assert (=> d!62491 (=> (not res!147325) (not e!123809))))

(assert (=> d!62491 (= res!147325 (invariant!0 (currentBit!8843 (_2!8293 lt!272954)) (currentByte!8848 (_2!8293 lt!272954)) (size!4225 (buf!4668 (_2!8293 lt!272954)))))))

(assert (=> d!62491 (= lt!272954 e!123807)))

(assert (=> d!62491 (= c!9252 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62491 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62491 (= (appendBitsLSBFirstLoopTR!0 (_2!8293 lt!272495) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!272954)))

(declare-fun b!177703 () Bool)

(assert (=> b!177703 (= e!123804 (= (_1!8301 lt!272977) (_2!8302 lt!272976)))))

(declare-fun b!177704 () Bool)

(declare-fun res!147318 () Bool)

(assert (=> b!177704 (= res!147318 (= (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272965))) (currentByte!8848 (_2!8293 lt!272965)) (currentBit!8843 (_2!8293 lt!272965))) (bvadd (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!177704 (=> (not res!147318) (not e!123806))))

(declare-fun b!177705 () Bool)

(assert (=> b!177705 (= lt!272947 (readBitPure!0 (readerFrom!0 (_2!8293 lt!272965) (currentBit!8843 (_2!8293 lt!272495)) (currentByte!8848 (_2!8293 lt!272495)))))))

(declare-fun res!147319 () Bool)

(assert (=> b!177705 (= res!147319 (and (= (_2!8294 lt!272947) lt!272972) (= (_1!8294 lt!272947) (_2!8293 lt!272965))))))

(assert (=> b!177705 (=> (not res!147319) (not e!123811))))

(assert (=> b!177705 (= e!123806 e!123811)))

(declare-fun b!177706 () Bool)

(assert (=> b!177706 (= e!123805 (= (_2!8294 lt!272968) (_2!8294 lt!272932)))))

(assert (= (and d!62491 c!9252) b!177692))

(assert (= (and d!62491 (not c!9252)) b!177698))

(assert (= (and b!177698 res!147324) b!177704))

(assert (= (and b!177704 res!147318) b!177694))

(assert (= (and b!177694 res!147320) b!177705))

(assert (= (and b!177705 res!147319) b!177702))

(assert (= (and b!177698 res!147326) b!177706))

(assert (= (and b!177698 c!9251) b!177700))

(assert (= (and b!177698 (not c!9251)) b!177691))

(assert (= (and b!177698 res!147323) b!177701))

(assert (= (or b!177692 b!177694) bm!2912))

(assert (= (and d!62491 res!147325) b!177697))

(assert (= (and b!177697 res!147327) b!177695))

(assert (= (and b!177695 res!147321) b!177699))

(assert (= (and b!177699 res!147322) b!177693))

(assert (= (and b!177693 res!147329) b!177696))

(assert (= (and b!177693 res!147328) b!177703))

(declare-fun m!277609 () Bool)

(assert (=> b!177695 m!277609))

(assert (=> b!177695 m!277375))

(declare-fun m!277611 () Bool)

(assert (=> b!177705 m!277611))

(assert (=> b!177705 m!277611))

(declare-fun m!277613 () Bool)

(assert (=> b!177705 m!277613))

(declare-fun m!277615 () Bool)

(assert (=> bm!2912 m!277615))

(declare-fun m!277617 () Bool)

(assert (=> b!177704 m!277617))

(assert (=> b!177704 m!277375))

(declare-fun m!277619 () Bool)

(assert (=> b!177702 m!277619))

(assert (=> b!177702 m!277617))

(declare-fun m!277621 () Bool)

(assert (=> b!177696 m!277621))

(declare-fun m!277623 () Bool)

(assert (=> b!177698 m!277623))

(declare-fun m!277625 () Bool)

(assert (=> b!177698 m!277625))

(declare-fun m!277627 () Bool)

(assert (=> b!177698 m!277627))

(declare-fun m!277629 () Bool)

(assert (=> b!177698 m!277629))

(declare-fun m!277631 () Bool)

(assert (=> b!177698 m!277631))

(declare-fun m!277633 () Bool)

(assert (=> b!177698 m!277633))

(declare-fun m!277635 () Bool)

(assert (=> b!177698 m!277635))

(declare-fun m!277637 () Bool)

(assert (=> b!177698 m!277637))

(declare-fun m!277639 () Bool)

(assert (=> b!177698 m!277639))

(declare-fun m!277641 () Bool)

(assert (=> b!177698 m!277641))

(declare-fun m!277643 () Bool)

(assert (=> b!177698 m!277643))

(assert (=> b!177698 m!277629))

(declare-fun m!277645 () Bool)

(assert (=> b!177698 m!277645))

(declare-fun m!277647 () Bool)

(assert (=> b!177698 m!277647))

(declare-fun m!277649 () Bool)

(assert (=> b!177698 m!277649))

(declare-fun m!277651 () Bool)

(assert (=> b!177698 m!277651))

(declare-fun m!277653 () Bool)

(assert (=> b!177698 m!277653))

(declare-fun m!277655 () Bool)

(assert (=> b!177698 m!277655))

(declare-fun m!277657 () Bool)

(assert (=> b!177698 m!277657))

(declare-fun m!277659 () Bool)

(assert (=> b!177698 m!277659))

(declare-fun m!277661 () Bool)

(assert (=> b!177698 m!277661))

(declare-fun m!277663 () Bool)

(assert (=> b!177698 m!277663))

(declare-fun m!277665 () Bool)

(assert (=> b!177698 m!277665))

(assert (=> b!177698 m!277375))

(declare-fun m!277667 () Bool)

(assert (=> b!177698 m!277667))

(declare-fun m!277669 () Bool)

(assert (=> b!177698 m!277669))

(declare-fun m!277671 () Bool)

(assert (=> b!177698 m!277671))

(declare-fun m!277673 () Bool)

(assert (=> b!177698 m!277673))

(declare-fun m!277675 () Bool)

(assert (=> b!177698 m!277675))

(declare-fun m!277677 () Bool)

(assert (=> b!177698 m!277677))

(declare-fun m!277679 () Bool)

(assert (=> b!177698 m!277679))

(declare-fun m!277681 () Bool)

(assert (=> b!177698 m!277681))

(declare-fun m!277683 () Bool)

(assert (=> b!177698 m!277683))

(declare-fun m!277685 () Bool)

(assert (=> b!177698 m!277685))

(declare-fun m!277687 () Bool)

(assert (=> b!177698 m!277687))

(declare-fun m!277689 () Bool)

(assert (=> b!177692 m!277689))

(assert (=> b!177693 m!277653))

(declare-fun m!277691 () Bool)

(assert (=> b!177693 m!277691))

(declare-fun m!277693 () Bool)

(assert (=> b!177693 m!277693))

(assert (=> b!177693 m!277681))

(declare-fun m!277695 () Bool)

(assert (=> b!177693 m!277695))

(declare-fun m!277697 () Bool)

(assert (=> b!177693 m!277697))

(declare-fun m!277699 () Bool)

(assert (=> b!177699 m!277699))

(declare-fun m!277701 () Bool)

(assert (=> d!62491 m!277701))

(assert (=> b!177468 d!62491))

(declare-fun d!62513 () Bool)

(assert (=> d!62513 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204) (size!4225 (buf!4668 thiss!1204))))))

(declare-fun bs!15584 () Bool)

(assert (= bs!15584 d!62513))

(assert (=> bs!15584 m!277373))

(assert (=> start!39440 d!62513))

(declare-fun d!62515 () Bool)

(declare-fun e!123820 () Bool)

(assert (=> d!62515 e!123820))

(declare-fun res!147340 () Bool)

(assert (=> d!62515 (=> (not res!147340) (not e!123820))))

(declare-fun lt!273014 () (_ BitVec 64))

(declare-fun lt!273016 () (_ BitVec 64))

(declare-fun lt!273015 () (_ BitVec 64))

(assert (=> d!62515 (= res!147340 (= lt!273016 (bvsub lt!273015 lt!273014)))))

(assert (=> d!62515 (or (= (bvand lt!273015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273015 lt!273014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62515 (= lt!273014 (remainingBits!0 ((_ sign_extend 32) (size!4225 (buf!4668 (_2!8293 lt!272495)))) ((_ sign_extend 32) (currentByte!8848 (_2!8293 lt!272495))) ((_ sign_extend 32) (currentBit!8843 (_2!8293 lt!272495)))))))

(declare-fun lt!273013 () (_ BitVec 64))

(declare-fun lt!273018 () (_ BitVec 64))

(assert (=> d!62515 (= lt!273015 (bvmul lt!273013 lt!273018))))

(assert (=> d!62515 (or (= lt!273013 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273018 (bvsdiv (bvmul lt!273013 lt!273018) lt!273013)))))

(assert (=> d!62515 (= lt!273018 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62515 (= lt!273013 ((_ sign_extend 32) (size!4225 (buf!4668 (_2!8293 lt!272495)))))))

(assert (=> d!62515 (= lt!273016 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8848 (_2!8293 lt!272495))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8843 (_2!8293 lt!272495)))))))

(assert (=> d!62515 (invariant!0 (currentBit!8843 (_2!8293 lt!272495)) (currentByte!8848 (_2!8293 lt!272495)) (size!4225 (buf!4668 (_2!8293 lt!272495))))))

(assert (=> d!62515 (= (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!272495))) (currentByte!8848 (_2!8293 lt!272495)) (currentBit!8843 (_2!8293 lt!272495))) lt!273016)))

(declare-fun b!177721 () Bool)

(declare-fun res!147341 () Bool)

(assert (=> b!177721 (=> (not res!147341) (not e!123820))))

(assert (=> b!177721 (= res!147341 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273016))))

(declare-fun b!177722 () Bool)

(declare-fun lt!273017 () (_ BitVec 64))

(assert (=> b!177722 (= e!123820 (bvsle lt!273016 (bvmul lt!273017 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177722 (or (= lt!273017 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273017 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273017)))))

(assert (=> b!177722 (= lt!273017 ((_ sign_extend 32) (size!4225 (buf!4668 (_2!8293 lt!272495)))))))

(assert (= (and d!62515 res!147340) b!177721))

(assert (= (and b!177721 res!147341) b!177722))

(declare-fun m!277703 () Bool)

(assert (=> d!62515 m!277703))

(assert (=> d!62515 m!277457))

(assert (=> b!177462 d!62515))

(declare-fun d!62517 () Bool)

(declare-fun e!123821 () Bool)

(assert (=> d!62517 e!123821))

(declare-fun res!147342 () Bool)

(assert (=> d!62517 (=> (not res!147342) (not e!123821))))

(declare-fun lt!273026 () (_ BitVec 64))

(declare-fun lt!273025 () (_ BitVec 64))

(declare-fun lt!273024 () (_ BitVec 64))

(assert (=> d!62517 (= res!147342 (= lt!273026 (bvsub lt!273025 lt!273024)))))

(assert (=> d!62517 (or (= (bvand lt!273025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273024 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273025 lt!273024) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62517 (= lt!273024 (remainingBits!0 ((_ sign_extend 32) (size!4225 (buf!4668 thiss!1204))) ((_ sign_extend 32) (currentByte!8848 thiss!1204)) ((_ sign_extend 32) (currentBit!8843 thiss!1204))))))

(declare-fun lt!273023 () (_ BitVec 64))

(declare-fun lt!273028 () (_ BitVec 64))

(assert (=> d!62517 (= lt!273025 (bvmul lt!273023 lt!273028))))

(assert (=> d!62517 (or (= lt!273023 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273028 (bvsdiv (bvmul lt!273023 lt!273028) lt!273023)))))

(assert (=> d!62517 (= lt!273028 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62517 (= lt!273023 ((_ sign_extend 32) (size!4225 (buf!4668 thiss!1204))))))

(assert (=> d!62517 (= lt!273026 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8848 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8843 thiss!1204))))))

(assert (=> d!62517 (invariant!0 (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204) (size!4225 (buf!4668 thiss!1204)))))

(assert (=> d!62517 (= (bitIndex!0 (size!4225 (buf!4668 thiss!1204)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204)) lt!273026)))

(declare-fun b!177723 () Bool)

(declare-fun res!147343 () Bool)

(assert (=> b!177723 (=> (not res!147343) (not e!123821))))

(assert (=> b!177723 (= res!147343 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273026))))

(declare-fun b!177724 () Bool)

(declare-fun lt!273027 () (_ BitVec 64))

(assert (=> b!177724 (= e!123821 (bvsle lt!273026 (bvmul lt!273027 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177724 (or (= lt!273027 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273027 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273027)))))

(assert (=> b!177724 (= lt!273027 ((_ sign_extend 32) (size!4225 (buf!4668 thiss!1204))))))

(assert (= (and d!62517 res!147342) b!177723))

(assert (= (and b!177723 res!147343) b!177724))

(declare-fun m!277705 () Bool)

(assert (=> d!62517 m!277705))

(assert (=> d!62517 m!277373))

(assert (=> b!177462 d!62517))

(declare-fun d!62519 () Bool)

(declare-fun e!123842 () Bool)

(assert (=> d!62519 e!123842))

(declare-fun res!147378 () Bool)

(assert (=> d!62519 (=> (not res!147378) (not e!123842))))

(declare-fun lt!273126 () tuple2!15296)

(assert (=> d!62519 (= res!147378 (= (size!4225 (buf!4668 thiss!1204)) (size!4225 (buf!4668 (_2!8293 lt!273126)))))))

(declare-fun choose!16 (BitStream!7558 Bool) tuple2!15296)

(assert (=> d!62519 (= lt!273126 (choose!16 thiss!1204 lt!272496))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62519 (validate_offset_bit!0 ((_ sign_extend 32) (size!4225 (buf!4668 thiss!1204))) ((_ sign_extend 32) (currentByte!8848 thiss!1204)) ((_ sign_extend 32) (currentBit!8843 thiss!1204)))))

(assert (=> d!62519 (= (appendBit!0 thiss!1204 lt!272496) lt!273126)))

(declare-fun b!177766 () Bool)

(declare-fun res!147380 () Bool)

(assert (=> b!177766 (=> (not res!147380) (not e!123842))))

(assert (=> b!177766 (= res!147380 (isPrefixOf!0 thiss!1204 (_2!8293 lt!273126)))))

(declare-fun b!177767 () Bool)

(declare-fun e!123843 () Bool)

(assert (=> b!177767 (= e!123842 e!123843)))

(declare-fun res!147381 () Bool)

(assert (=> b!177767 (=> (not res!147381) (not e!123843))))

(declare-fun lt!273124 () tuple2!15298)

(assert (=> b!177767 (= res!147381 (and (= (_2!8294 lt!273124) lt!272496) (= (_1!8294 lt!273124) (_2!8293 lt!273126))))))

(assert (=> b!177767 (= lt!273124 (readBitPure!0 (readerFrom!0 (_2!8293 lt!273126) (currentBit!8843 thiss!1204) (currentByte!8848 thiss!1204))))))

(declare-fun b!177768 () Bool)

(assert (=> b!177768 (= e!123843 (= (bitIndex!0 (size!4225 (buf!4668 (_1!8294 lt!273124))) (currentByte!8848 (_1!8294 lt!273124)) (currentBit!8843 (_1!8294 lt!273124))) (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!273126))) (currentByte!8848 (_2!8293 lt!273126)) (currentBit!8843 (_2!8293 lt!273126)))))))

(declare-fun b!177765 () Bool)

(declare-fun res!147379 () Bool)

(assert (=> b!177765 (=> (not res!147379) (not e!123842))))

(declare-fun lt!273125 () (_ BitVec 64))

(declare-fun lt!273123 () (_ BitVec 64))

(assert (=> b!177765 (= res!147379 (= (bitIndex!0 (size!4225 (buf!4668 (_2!8293 lt!273126))) (currentByte!8848 (_2!8293 lt!273126)) (currentBit!8843 (_2!8293 lt!273126))) (bvadd lt!273123 lt!273125)))))

(assert (=> b!177765 (or (not (= (bvand lt!273123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273125 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273123 lt!273125) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177765 (= lt!273125 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!177765 (= lt!273123 (bitIndex!0 (size!4225 (buf!4668 thiss!1204)) (currentByte!8848 thiss!1204) (currentBit!8843 thiss!1204)))))

(assert (= (and d!62519 res!147378) b!177765))

(assert (= (and b!177765 res!147379) b!177766))

(assert (= (and b!177766 res!147380) b!177767))

(assert (= (and b!177767 res!147381) b!177768))

(declare-fun m!277721 () Bool)

(assert (=> b!177766 m!277721))

(declare-fun m!277723 () Bool)

(assert (=> b!177767 m!277723))

(assert (=> b!177767 m!277723))

(declare-fun m!277725 () Bool)

(assert (=> b!177767 m!277725))

(declare-fun m!277727 () Bool)

(assert (=> b!177765 m!277727))

(assert (=> b!177765 m!277377))

(declare-fun m!277729 () Bool)

(assert (=> d!62519 m!277729))

(declare-fun m!277731 () Bool)

(assert (=> d!62519 m!277731))

(declare-fun m!277733 () Bool)

(assert (=> b!177768 m!277733))

(assert (=> b!177768 m!277727))

(assert (=> b!177462 d!62519))

(assert (=> b!177464 d!62515))

(assert (=> b!177464 d!62517))

(declare-fun d!62521 () Bool)

(assert (=> d!62521 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4225 (buf!4668 thiss!1204))) ((_ sign_extend 32) (currentByte!8848 thiss!1204)) ((_ sign_extend 32) (currentBit!8843 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4225 (buf!4668 thiss!1204))) ((_ sign_extend 32) (currentByte!8848 thiss!1204)) ((_ sign_extend 32) (currentBit!8843 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15585 () Bool)

(assert (= bs!15585 d!62521))

(assert (=> bs!15585 m!277705))

(assert (=> b!177469 d!62521))

(push 1)

(assert (not d!62513))

(assert (not b!177704))

(assert (not d!62515))

(assert (not b!177698))

(assert (not b!177574))

(assert (not b!177766))

(assert (not d!62487))

(assert (not b!177589))

(assert (not b!177695))

(assert (not b!177768))

(assert (not d!62491))

(assert (not b!177560))

(assert (not d!62521))

(assert (not b!177591))

(assert (not b!177702))

(assert (not b!177705))

(assert (not b!177767))

(assert (not b!177765))

(assert (not b!177576))

(assert (not d!62519))

(assert (not d!62455))

(assert (not d!62457))

(assert (not b!177699))

(assert (not b!177693))

(assert (not b!177692))

(assert (not b!177696))

(assert (not bm!2912))

(assert (not d!62477))

(assert (not d!62517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


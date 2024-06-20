; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18386 () Bool)

(assert start!18386)

(declare-fun b!91330 () Bool)

(declare-fun e!60059 () Bool)

(declare-fun e!60052 () Bool)

(assert (=> b!91330 (= e!60059 e!60052)))

(declare-fun res!75387 () Bool)

(assert (=> b!91330 (=> (not res!75387) (not e!60052))))

(declare-fun lt!137711 () (_ BitVec 64))

(declare-fun lt!137714 () (_ BitVec 64))

(assert (=> b!91330 (= res!75387 (= lt!137711 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137714)))))

(declare-datatypes ((array!4270 0))(
  ( (array!4271 (arr!2561 (Array (_ BitVec 32) (_ BitVec 8))) (size!1924 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3410 0))(
  ( (BitStream!3411 (buf!2314 array!4270) (currentByte!4604 (_ BitVec 32)) (currentBit!4599 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5840 0))(
  ( (Unit!5841) )
))
(declare-datatypes ((tuple2!7596 0))(
  ( (tuple2!7597 (_1!4043 Unit!5840) (_2!4043 BitStream!3410)) )
))
(declare-fun lt!137715 () tuple2!7596)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91330 (= lt!137711 (bitIndex!0 (size!1924 (buf!2314 (_2!4043 lt!137715))) (currentByte!4604 (_2!4043 lt!137715)) (currentBit!4599 (_2!4043 lt!137715))))))

(declare-fun b!91331 () Bool)

(declare-fun res!75392 () Bool)

(declare-fun e!60054 () Bool)

(assert (=> b!91331 (=> (not res!75392) (not e!60054))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!91331 (= res!75392 (bvslt i!576 nBits!336))))

(declare-fun b!91332 () Bool)

(declare-fun e!60050 () Bool)

(declare-fun e!60058 () Bool)

(assert (=> b!91332 (= e!60050 e!60058)))

(declare-fun res!75388 () Bool)

(assert (=> b!91332 (=> (not res!75388) (not e!60058))))

(declare-fun thiss!1151 () BitStream!3410)

(assert (=> b!91332 (= res!75388 (and (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (= (size!1924 (buf!2314 (_2!4043 lt!137715))) (size!1924 (buf!2314 thiss!1151)))))))

(declare-fun res!75391 () Bool)

(declare-fun e!60057 () Bool)

(assert (=> start!18386 (=> (not res!75391) (not e!60057))))

(assert (=> start!18386 (= res!75391 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18386 e!60057))

(declare-fun thiss!1152 () BitStream!3410)

(declare-fun e!60060 () Bool)

(declare-fun inv!12 (BitStream!3410) Bool)

(assert (=> start!18386 (and (inv!12 thiss!1152) e!60060)))

(declare-fun e!60051 () Bool)

(assert (=> start!18386 (and (inv!12 thiss!1151) e!60051)))

(assert (=> start!18386 true))

(declare-fun b!91333 () Bool)

(declare-fun res!75390 () Bool)

(assert (=> b!91333 (=> (not res!75390) (not e!60054))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91333 (= res!75390 (validate_offset_bits!1 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1152))) ((_ sign_extend 32) (currentByte!4604 thiss!1152)) ((_ sign_extend 32) (currentBit!4599 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91334 () Bool)

(declare-fun array_inv!1770 (array!4270) Bool)

(assert (=> b!91334 (= e!60060 (array_inv!1770 (buf!2314 thiss!1152)))))

(declare-fun b!91335 () Bool)

(declare-fun res!75393 () Bool)

(assert (=> b!91335 (=> (not res!75393) (not e!60057))))

(assert (=> b!91335 (= res!75393 (and (bvsle i!576 nBits!336) (= (size!1924 (buf!2314 thiss!1152)) (size!1924 (buf!2314 thiss!1151)))))))

(declare-fun b!91336 () Bool)

(declare-fun res!75402 () Bool)

(assert (=> b!91336 (=> (not res!75402) (not e!60057))))

(assert (=> b!91336 (= res!75402 (validate_offset_bits!1 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1151))) ((_ sign_extend 32) (currentByte!4604 thiss!1151)) ((_ sign_extend 32) (currentBit!4599 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91337 () Bool)

(declare-fun res!75395 () Bool)

(assert (=> b!91337 (=> (not res!75395) (not e!60057))))

(assert (=> b!91337 (= res!75395 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91338 () Bool)

(declare-fun res!75401 () Bool)

(assert (=> b!91338 (=> (not res!75401) (not e!60058))))

(declare-fun lt!137713 () (_ BitVec 64))

(assert (=> b!91338 (= res!75401 (= (bitIndex!0 (size!1924 (buf!2314 (_2!4043 lt!137715))) (currentByte!4604 (_2!4043 lt!137715)) (currentBit!4599 (_2!4043 lt!137715))) (bvadd lt!137713 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!91339 () Bool)

(declare-fun res!75396 () Bool)

(assert (=> b!91339 (=> (not res!75396) (not e!60057))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91339 (= res!75396 (invariant!0 (currentBit!4599 thiss!1151) (currentByte!4604 thiss!1151) (size!1924 (buf!2314 thiss!1151))))))

(declare-fun b!91340 () Bool)

(declare-fun res!75403 () Bool)

(assert (=> b!91340 (=> (not res!75403) (not e!60052))))

(declare-fun isPrefixOf!0 (BitStream!3410 BitStream!3410) Bool)

(assert (=> b!91340 (= res!75403 (isPrefixOf!0 thiss!1152 (_2!4043 lt!137715)))))

(declare-fun b!91341 () Bool)

(assert (=> b!91341 (= e!60057 e!60054)))

(declare-fun res!75398 () Bool)

(assert (=> b!91341 (=> (not res!75398) (not e!60054))))

(assert (=> b!91341 (= res!75398 (= lt!137714 (bvadd lt!137713 ((_ sign_extend 32) i!576))))))

(assert (=> b!91341 (= lt!137714 (bitIndex!0 (size!1924 (buf!2314 thiss!1152)) (currentByte!4604 thiss!1152) (currentBit!4599 thiss!1152)))))

(assert (=> b!91341 (= lt!137713 (bitIndex!0 (size!1924 (buf!2314 thiss!1151)) (currentByte!4604 thiss!1151) (currentBit!4599 thiss!1151)))))

(declare-fun b!91342 () Bool)

(assert (=> b!91342 (= e!60051 (array_inv!1770 (buf!2314 thiss!1151)))))

(declare-fun b!91343 () Bool)

(declare-fun res!75397 () Bool)

(assert (=> b!91343 (=> res!75397 e!60050)))

(assert (=> b!91343 (= res!75397 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!91344 () Bool)

(assert (=> b!91344 (= e!60058 (validate_offset_bits!1 ((_ sign_extend 32) (size!1924 (buf!2314 (_2!4043 lt!137715)))) ((_ sign_extend 32) (currentByte!4604 (_2!4043 lt!137715))) ((_ sign_extend 32) (currentBit!4599 (_2!4043 lt!137715))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!91345 () Bool)

(declare-fun e!60055 () Bool)

(assert (=> b!91345 (= e!60052 e!60055)))

(declare-fun res!75400 () Bool)

(assert (=> b!91345 (=> (not res!75400) (not e!60055))))

(declare-fun lt!137712 () Bool)

(declare-datatypes ((tuple2!7598 0))(
  ( (tuple2!7599 (_1!4044 BitStream!3410) (_2!4044 Bool)) )
))
(declare-fun lt!137710 () tuple2!7598)

(assert (=> b!91345 (= res!75400 (and (= (_2!4044 lt!137710) lt!137712) (= (_1!4044 lt!137710) (_2!4043 lt!137715))))))

(declare-fun readBitPure!0 (BitStream!3410) tuple2!7598)

(declare-fun readerFrom!0 (BitStream!3410 (_ BitVec 32) (_ BitVec 32)) BitStream!3410)

(assert (=> b!91345 (= lt!137710 (readBitPure!0 (readerFrom!0 (_2!4043 lt!137715) (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152))))))

(declare-fun b!91346 () Bool)

(assert (=> b!91346 (= e!60054 (not e!60050))))

(declare-fun res!75399 () Bool)

(assert (=> b!91346 (=> res!75399 e!60050)))

(assert (=> b!91346 (= res!75399 (not (invariant!0 (currentBit!4599 (_2!4043 lt!137715)) (currentByte!4604 (_2!4043 lt!137715)) (size!1924 (buf!2314 (_2!4043 lt!137715))))))))

(assert (=> b!91346 e!60059))

(declare-fun res!75389 () Bool)

(assert (=> b!91346 (=> (not res!75389) (not e!60059))))

(assert (=> b!91346 (= res!75389 (= (size!1924 (buf!2314 thiss!1152)) (size!1924 (buf!2314 (_2!4043 lt!137715)))))))

(declare-fun appendBit!0 (BitStream!3410 Bool) tuple2!7596)

(assert (=> b!91346 (= lt!137715 (appendBit!0 thiss!1152 lt!137712))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!91346 (= lt!137712 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91347 () Bool)

(assert (=> b!91347 (= e!60055 (= (bitIndex!0 (size!1924 (buf!2314 (_1!4044 lt!137710))) (currentByte!4604 (_1!4044 lt!137710)) (currentBit!4599 (_1!4044 lt!137710))) lt!137711))))

(declare-fun b!91348 () Bool)

(declare-fun res!75394 () Bool)

(assert (=> b!91348 (=> (not res!75394) (not e!60057))))

(assert (=> b!91348 (= res!75394 (invariant!0 (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152) (size!1924 (buf!2314 thiss!1152))))))

(assert (= (and start!18386 res!75391) b!91336))

(assert (= (and b!91336 res!75402) b!91339))

(assert (= (and b!91339 res!75396) b!91337))

(assert (= (and b!91337 res!75395) b!91348))

(assert (= (and b!91348 res!75394) b!91335))

(assert (= (and b!91335 res!75393) b!91341))

(assert (= (and b!91341 res!75398) b!91333))

(assert (= (and b!91333 res!75390) b!91331))

(assert (= (and b!91331 res!75392) b!91346))

(assert (= (and b!91346 res!75389) b!91330))

(assert (= (and b!91330 res!75387) b!91340))

(assert (= (and b!91340 res!75403) b!91345))

(assert (= (and b!91345 res!75400) b!91347))

(assert (= (and b!91346 (not res!75399)) b!91343))

(assert (= (and b!91343 (not res!75397)) b!91332))

(assert (= (and b!91332 res!75388) b!91338))

(assert (= (and b!91338 res!75401) b!91344))

(assert (= start!18386 b!91334))

(assert (= start!18386 b!91342))

(declare-fun m!135503 () Bool)

(assert (=> b!91336 m!135503))

(declare-fun m!135505 () Bool)

(assert (=> b!91339 m!135505))

(declare-fun m!135507 () Bool)

(assert (=> b!91330 m!135507))

(declare-fun m!135509 () Bool)

(assert (=> b!91348 m!135509))

(declare-fun m!135511 () Bool)

(assert (=> b!91334 m!135511))

(declare-fun m!135513 () Bool)

(assert (=> b!91333 m!135513))

(declare-fun m!135515 () Bool)

(assert (=> b!91344 m!135515))

(declare-fun m!135517 () Bool)

(assert (=> b!91346 m!135517))

(declare-fun m!135519 () Bool)

(assert (=> b!91346 m!135519))

(declare-fun m!135521 () Bool)

(assert (=> start!18386 m!135521))

(declare-fun m!135523 () Bool)

(assert (=> start!18386 m!135523))

(declare-fun m!135525 () Bool)

(assert (=> b!91347 m!135525))

(declare-fun m!135527 () Bool)

(assert (=> b!91340 m!135527))

(declare-fun m!135529 () Bool)

(assert (=> b!91341 m!135529))

(declare-fun m!135531 () Bool)

(assert (=> b!91341 m!135531))

(declare-fun m!135533 () Bool)

(assert (=> b!91342 m!135533))

(assert (=> b!91338 m!135507))

(declare-fun m!135535 () Bool)

(assert (=> b!91345 m!135535))

(assert (=> b!91345 m!135535))

(declare-fun m!135537 () Bool)

(assert (=> b!91345 m!135537))

(push 1)

(assert (not b!91339))

(assert (not b!91342))

(assert (not b!91334))

(assert (not b!91345))

(assert (not b!91346))

(assert (not b!91336))

(assert (not start!18386))

(assert (not b!91347))

(assert (not b!91341))

(assert (not b!91330))

(assert (not b!91348))

(assert (not b!91338))

(assert (not b!91333))

(assert (not b!91340))

(assert (not b!91344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28370 () Bool)

(assert (=> d!28370 (= (invariant!0 (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152) (size!1924 (buf!2314 thiss!1152))) (and (bvsge (currentBit!4599 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4599 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4604 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4604 thiss!1152) (size!1924 (buf!2314 thiss!1152))) (and (= (currentBit!4599 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4604 thiss!1152) (size!1924 (buf!2314 thiss!1152)))))))))

(assert (=> b!91348 d!28370))

(declare-fun d!28372 () Bool)

(assert (=> d!28372 (= (invariant!0 (currentBit!4599 thiss!1151) (currentByte!4604 thiss!1151) (size!1924 (buf!2314 thiss!1151))) (and (bvsge (currentBit!4599 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4599 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4604 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4604 thiss!1151) (size!1924 (buf!2314 thiss!1151))) (and (= (currentBit!4599 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4604 thiss!1151) (size!1924 (buf!2314 thiss!1151)))))))))

(assert (=> b!91339 d!28372))

(declare-fun d!28374 () Bool)

(assert (=> d!28374 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152) (size!1924 (buf!2314 thiss!1152))))))

(declare-fun bs!7007 () Bool)

(assert (= bs!7007 d!28374))

(assert (=> bs!7007 m!135509))

(assert (=> start!18386 d!28374))

(declare-fun d!28376 () Bool)

(assert (=> d!28376 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4599 thiss!1151) (currentByte!4604 thiss!1151) (size!1924 (buf!2314 thiss!1151))))))

(declare-fun bs!7008 () Bool)

(assert (= bs!7008 d!28376))

(assert (=> bs!7008 m!135505))

(assert (=> start!18386 d!28376))

(declare-fun d!28378 () Bool)

(declare-fun e!60063 () Bool)

(assert (=> d!28378 e!60063))

(declare-fun res!75409 () Bool)

(assert (=> d!28378 (=> (not res!75409) (not e!60063))))

(declare-fun lt!137732 () (_ BitVec 64))

(declare-fun lt!137728 () (_ BitVec 64))

(declare-fun lt!137730 () (_ BitVec 64))

(assert (=> d!28378 (= res!75409 (= lt!137730 (bvsub lt!137728 lt!137732)))))

(assert (=> d!28378 (or (= (bvand lt!137728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137732 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137728 lt!137732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28378 (= lt!137732 (remainingBits!0 ((_ sign_extend 32) (size!1924 (buf!2314 (_2!4043 lt!137715)))) ((_ sign_extend 32) (currentByte!4604 (_2!4043 lt!137715))) ((_ sign_extend 32) (currentBit!4599 (_2!4043 lt!137715)))))))

(declare-fun lt!137733 () (_ BitVec 64))

(declare-fun lt!137731 () (_ BitVec 64))

(assert (=> d!28378 (= lt!137728 (bvmul lt!137733 lt!137731))))

(assert (=> d!28378 (or (= lt!137733 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137731 (bvsdiv (bvmul lt!137733 lt!137731) lt!137733)))))

(assert (=> d!28378 (= lt!137731 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28378 (= lt!137733 ((_ sign_extend 32) (size!1924 (buf!2314 (_2!4043 lt!137715)))))))

(assert (=> d!28378 (= lt!137730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4604 (_2!4043 lt!137715))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4599 (_2!4043 lt!137715)))))))

(assert (=> d!28378 (invariant!0 (currentBit!4599 (_2!4043 lt!137715)) (currentByte!4604 (_2!4043 lt!137715)) (size!1924 (buf!2314 (_2!4043 lt!137715))))))

(assert (=> d!28378 (= (bitIndex!0 (size!1924 (buf!2314 (_2!4043 lt!137715))) (currentByte!4604 (_2!4043 lt!137715)) (currentBit!4599 (_2!4043 lt!137715))) lt!137730)))

(declare-fun b!91353 () Bool)

(declare-fun res!75408 () Bool)

(assert (=> b!91353 (=> (not res!75408) (not e!60063))))

(assert (=> b!91353 (= res!75408 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137730))))

(declare-fun b!91354 () Bool)

(declare-fun lt!137729 () (_ BitVec 64))

(assert (=> b!91354 (= e!60063 (bvsle lt!137730 (bvmul lt!137729 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91354 (or (= lt!137729 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137729 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137729)))))

(assert (=> b!91354 (= lt!137729 ((_ sign_extend 32) (size!1924 (buf!2314 (_2!4043 lt!137715)))))))

(assert (= (and d!28378 res!75409) b!91353))

(assert (= (and b!91353 res!75408) b!91354))

(declare-fun m!135539 () Bool)

(assert (=> d!28378 m!135539))

(assert (=> d!28378 m!135517))

(assert (=> b!91338 d!28378))

(declare-fun d!28384 () Bool)

(declare-fun res!75416 () Bool)

(declare-fun e!60068 () Bool)

(assert (=> d!28384 (=> (not res!75416) (not e!60068))))

(assert (=> d!28384 (= res!75416 (= (size!1924 (buf!2314 thiss!1152)) (size!1924 (buf!2314 (_2!4043 lt!137715)))))))

(assert (=> d!28384 (= (isPrefixOf!0 thiss!1152 (_2!4043 lt!137715)) e!60068)))

(declare-fun b!91361 () Bool)

(declare-fun res!75417 () Bool)

(assert (=> b!91361 (=> (not res!75417) (not e!60068))))

(assert (=> b!91361 (= res!75417 (bvsle (bitIndex!0 (size!1924 (buf!2314 thiss!1152)) (currentByte!4604 thiss!1152) (currentBit!4599 thiss!1152)) (bitIndex!0 (size!1924 (buf!2314 (_2!4043 lt!137715))) (currentByte!4604 (_2!4043 lt!137715)) (currentBit!4599 (_2!4043 lt!137715)))))))

(declare-fun b!91362 () Bool)

(declare-fun e!60069 () Bool)

(assert (=> b!91362 (= e!60068 e!60069)))

(declare-fun res!75418 () Bool)

(assert (=> b!91362 (=> res!75418 e!60069)))

(assert (=> b!91362 (= res!75418 (= (size!1924 (buf!2314 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!91363 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4270 array!4270 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91363 (= e!60069 (arrayBitRangesEq!0 (buf!2314 thiss!1152) (buf!2314 (_2!4043 lt!137715)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1924 (buf!2314 thiss!1152)) (currentByte!4604 thiss!1152) (currentBit!4599 thiss!1152))))))

(assert (= (and d!28384 res!75416) b!91361))

(assert (= (and b!91361 res!75417) b!91362))

(assert (= (and b!91362 (not res!75418)) b!91363))

(assert (=> b!91361 m!135529))

(assert (=> b!91361 m!135507))

(assert (=> b!91363 m!135529))

(assert (=> b!91363 m!135529))

(declare-fun m!135541 () Bool)

(assert (=> b!91363 m!135541))

(assert (=> b!91340 d!28384))

(declare-fun d!28386 () Bool)

(declare-fun e!60070 () Bool)

(assert (=> d!28386 e!60070))

(declare-fun res!75420 () Bool)

(assert (=> d!28386 (=> (not res!75420) (not e!60070))))

(declare-fun lt!137736 () (_ BitVec 64))

(declare-fun lt!137738 () (_ BitVec 64))

(declare-fun lt!137734 () (_ BitVec 64))

(assert (=> d!28386 (= res!75420 (= lt!137736 (bvsub lt!137734 lt!137738)))))

(assert (=> d!28386 (or (= (bvand lt!137734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137738 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137734 lt!137738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28386 (= lt!137738 (remainingBits!0 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1152))) ((_ sign_extend 32) (currentByte!4604 thiss!1152)) ((_ sign_extend 32) (currentBit!4599 thiss!1152))))))

(declare-fun lt!137739 () (_ BitVec 64))

(declare-fun lt!137737 () (_ BitVec 64))

(assert (=> d!28386 (= lt!137734 (bvmul lt!137739 lt!137737))))

(assert (=> d!28386 (or (= lt!137739 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137737 (bvsdiv (bvmul lt!137739 lt!137737) lt!137739)))))

(assert (=> d!28386 (= lt!137737 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28386 (= lt!137739 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1152))))))

(assert (=> d!28386 (= lt!137736 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4604 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4599 thiss!1152))))))

(assert (=> d!28386 (invariant!0 (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152) (size!1924 (buf!2314 thiss!1152)))))

(assert (=> d!28386 (= (bitIndex!0 (size!1924 (buf!2314 thiss!1152)) (currentByte!4604 thiss!1152) (currentBit!4599 thiss!1152)) lt!137736)))

(declare-fun b!91364 () Bool)

(declare-fun res!75419 () Bool)

(assert (=> b!91364 (=> (not res!75419) (not e!60070))))

(assert (=> b!91364 (= res!75419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137736))))

(declare-fun b!91365 () Bool)

(declare-fun lt!137735 () (_ BitVec 64))

(assert (=> b!91365 (= e!60070 (bvsle lt!137736 (bvmul lt!137735 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91365 (or (= lt!137735 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137735 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137735)))))

(assert (=> b!91365 (= lt!137735 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1152))))))

(assert (= (and d!28386 res!75420) b!91364))

(assert (= (and b!91364 res!75419) b!91365))

(declare-fun m!135543 () Bool)

(assert (=> d!28386 m!135543))

(assert (=> d!28386 m!135509))

(assert (=> b!91341 d!28386))

(declare-fun d!28388 () Bool)

(declare-fun e!60071 () Bool)

(assert (=> d!28388 e!60071))

(declare-fun res!75422 () Bool)

(assert (=> d!28388 (=> (not res!75422) (not e!60071))))

(declare-fun lt!137742 () (_ BitVec 64))

(declare-fun lt!137744 () (_ BitVec 64))

(declare-fun lt!137740 () (_ BitVec 64))

(assert (=> d!28388 (= res!75422 (= lt!137742 (bvsub lt!137740 lt!137744)))))

(assert (=> d!28388 (or (= (bvand lt!137740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137744 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137740 lt!137744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28388 (= lt!137744 (remainingBits!0 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1151))) ((_ sign_extend 32) (currentByte!4604 thiss!1151)) ((_ sign_extend 32) (currentBit!4599 thiss!1151))))))

(declare-fun lt!137745 () (_ BitVec 64))

(declare-fun lt!137743 () (_ BitVec 64))

(assert (=> d!28388 (= lt!137740 (bvmul lt!137745 lt!137743))))

(assert (=> d!28388 (or (= lt!137745 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137743 (bvsdiv (bvmul lt!137745 lt!137743) lt!137745)))))

(assert (=> d!28388 (= lt!137743 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28388 (= lt!137745 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1151))))))

(assert (=> d!28388 (= lt!137742 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4604 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4599 thiss!1151))))))

(assert (=> d!28388 (invariant!0 (currentBit!4599 thiss!1151) (currentByte!4604 thiss!1151) (size!1924 (buf!2314 thiss!1151)))))

(assert (=> d!28388 (= (bitIndex!0 (size!1924 (buf!2314 thiss!1151)) (currentByte!4604 thiss!1151) (currentBit!4599 thiss!1151)) lt!137742)))

(declare-fun b!91366 () Bool)

(declare-fun res!75421 () Bool)

(assert (=> b!91366 (=> (not res!75421) (not e!60071))))

(assert (=> b!91366 (= res!75421 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137742))))

(declare-fun b!91367 () Bool)

(declare-fun lt!137741 () (_ BitVec 64))

(assert (=> b!91367 (= e!60071 (bvsle lt!137742 (bvmul lt!137741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91367 (or (= lt!137741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137741)))))

(assert (=> b!91367 (= lt!137741 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1151))))))

(assert (= (and d!28388 res!75422) b!91366))

(assert (= (and b!91366 res!75421) b!91367))

(declare-fun m!135545 () Bool)

(assert (=> d!28388 m!135545))

(assert (=> d!28388 m!135505))

(assert (=> b!91341 d!28388))

(assert (=> b!91330 d!28378))

(declare-fun d!28390 () Bool)

(assert (=> d!28390 (= (array_inv!1770 (buf!2314 thiss!1151)) (bvsge (size!1924 (buf!2314 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!91342 d!28390))

(declare-fun d!28392 () Bool)

(assert (=> d!28392 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1924 (buf!2314 (_2!4043 lt!137715)))) ((_ sign_extend 32) (currentByte!4604 (_2!4043 lt!137715))) ((_ sign_extend 32) (currentBit!4599 (_2!4043 lt!137715))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1924 (buf!2314 (_2!4043 lt!137715)))) ((_ sign_extend 32) (currentByte!4604 (_2!4043 lt!137715))) ((_ sign_extend 32) (currentBit!4599 (_2!4043 lt!137715)))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun bs!7009 () Bool)

(assert (= bs!7009 d!28392))

(assert (=> bs!7009 m!135539))

(assert (=> b!91344 d!28392))

(declare-fun d!28394 () Bool)

(assert (=> d!28394 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1152))) ((_ sign_extend 32) (currentByte!4604 thiss!1152)) ((_ sign_extend 32) (currentBit!4599 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1152))) ((_ sign_extend 32) (currentByte!4604 thiss!1152)) ((_ sign_extend 32) (currentBit!4599 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!7010 () Bool)

(assert (= bs!7010 d!28394))

(assert (=> bs!7010 m!135543))

(assert (=> b!91333 d!28394))

(declare-fun d!28396 () Bool)

(declare-datatypes ((tuple2!7604 0))(
  ( (tuple2!7605 (_1!4047 Bool) (_2!4047 BitStream!3410)) )
))
(declare-fun lt!137750 () tuple2!7604)

(declare-fun readBit!0 (BitStream!3410) tuple2!7604)

(assert (=> d!28396 (= lt!137750 (readBit!0 (readerFrom!0 (_2!4043 lt!137715) (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152))))))

(assert (=> d!28396 (= (readBitPure!0 (readerFrom!0 (_2!4043 lt!137715) (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152))) (tuple2!7599 (_2!4047 lt!137750) (_1!4047 lt!137750)))))

(declare-fun bs!7011 () Bool)

(assert (= bs!7011 d!28396))

(assert (=> bs!7011 m!135535))

(declare-fun m!135547 () Bool)

(assert (=> bs!7011 m!135547))

(assert (=> b!91345 d!28396))

(declare-fun d!28398 () Bool)

(declare-fun e!60078 () Bool)

(assert (=> d!28398 e!60078))

(declare-fun res!75434 () Bool)

(assert (=> d!28398 (=> (not res!75434) (not e!60078))))

(assert (=> d!28398 (= res!75434 (invariant!0 (currentBit!4599 (_2!4043 lt!137715)) (currentByte!4604 (_2!4043 lt!137715)) (size!1924 (buf!2314 (_2!4043 lt!137715)))))))

(assert (=> d!28398 (= (readerFrom!0 (_2!4043 lt!137715) (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152)) (BitStream!3411 (buf!2314 (_2!4043 lt!137715)) (currentByte!4604 thiss!1152) (currentBit!4599 thiss!1152)))))

(declare-fun b!91379 () Bool)

(assert (=> b!91379 (= e!60078 (invariant!0 (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152) (size!1924 (buf!2314 (_2!4043 lt!137715)))))))

(assert (= (and d!28398 res!75434) b!91379))

(assert (=> d!28398 m!135517))

(declare-fun m!135549 () Bool)

(assert (=> b!91379 m!135549))

(assert (=> b!91345 d!28398))

(declare-fun d!28400 () Bool)

(assert (=> d!28400 (= (array_inv!1770 (buf!2314 thiss!1152)) (bvsge (size!1924 (buf!2314 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!91334 d!28400))

(declare-fun d!28402 () Bool)

(declare-fun e!60079 () Bool)

(assert (=> d!28402 e!60079))

(declare-fun res!75436 () Bool)

(assert (=> d!28402 (=> (not res!75436) (not e!60079))))

(declare-fun lt!137759 () (_ BitVec 64))

(declare-fun lt!137761 () (_ BitVec 64))

(declare-fun lt!137757 () (_ BitVec 64))

(assert (=> d!28402 (= res!75436 (= lt!137759 (bvsub lt!137757 lt!137761)))))

(assert (=> d!28402 (or (= (bvand lt!137757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137761 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137757 lt!137761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28402 (= lt!137761 (remainingBits!0 ((_ sign_extend 32) (size!1924 (buf!2314 (_1!4044 lt!137710)))) ((_ sign_extend 32) (currentByte!4604 (_1!4044 lt!137710))) ((_ sign_extend 32) (currentBit!4599 (_1!4044 lt!137710)))))))

(declare-fun lt!137762 () (_ BitVec 64))

(declare-fun lt!137760 () (_ BitVec 64))

(assert (=> d!28402 (= lt!137757 (bvmul lt!137762 lt!137760))))

(assert (=> d!28402 (or (= lt!137762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137760 (bvsdiv (bvmul lt!137762 lt!137760) lt!137762)))))

(assert (=> d!28402 (= lt!137760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28402 (= lt!137762 ((_ sign_extend 32) (size!1924 (buf!2314 (_1!4044 lt!137710)))))))

(assert (=> d!28402 (= lt!137759 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4604 (_1!4044 lt!137710))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4599 (_1!4044 lt!137710)))))))

(assert (=> d!28402 (invariant!0 (currentBit!4599 (_1!4044 lt!137710)) (currentByte!4604 (_1!4044 lt!137710)) (size!1924 (buf!2314 (_1!4044 lt!137710))))))

(assert (=> d!28402 (= (bitIndex!0 (size!1924 (buf!2314 (_1!4044 lt!137710))) (currentByte!4604 (_1!4044 lt!137710)) (currentBit!4599 (_1!4044 lt!137710))) lt!137759)))

(declare-fun b!91380 () Bool)

(declare-fun res!75435 () Bool)

(assert (=> b!91380 (=> (not res!75435) (not e!60079))))

(assert (=> b!91380 (= res!75435 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137759))))

(declare-fun b!91381 () Bool)

(declare-fun lt!137758 () (_ BitVec 64))

(assert (=> b!91381 (= e!60079 (bvsle lt!137759 (bvmul lt!137758 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91381 (or (= lt!137758 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137758 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137758)))))

(assert (=> b!91381 (= lt!137758 ((_ sign_extend 32) (size!1924 (buf!2314 (_1!4044 lt!137710)))))))

(assert (= (and d!28402 res!75436) b!91380))

(assert (= (and b!91380 res!75435) b!91381))

(declare-fun m!135551 () Bool)

(assert (=> d!28402 m!135551))

(declare-fun m!135553 () Bool)

(assert (=> d!28402 m!135553))

(assert (=> b!91347 d!28402))

(declare-fun d!28404 () Bool)

(assert (=> d!28404 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1151))) ((_ sign_extend 32) (currentByte!4604 thiss!1151)) ((_ sign_extend 32) (currentBit!4599 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1151))) ((_ sign_extend 32) (currentByte!4604 thiss!1151)) ((_ sign_extend 32) (currentBit!4599 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!7012 () Bool)

(assert (= bs!7012 d!28404))

(assert (=> bs!7012 m!135545))

(assert (=> b!91336 d!28404))

(declare-fun d!28406 () Bool)

(assert (=> d!28406 (= (invariant!0 (currentBit!4599 (_2!4043 lt!137715)) (currentByte!4604 (_2!4043 lt!137715)) (size!1924 (buf!2314 (_2!4043 lt!137715)))) (and (bvsge (currentBit!4599 (_2!4043 lt!137715)) #b00000000000000000000000000000000) (bvslt (currentBit!4599 (_2!4043 lt!137715)) #b00000000000000000000000000001000) (bvsge (currentByte!4604 (_2!4043 lt!137715)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4604 (_2!4043 lt!137715)) (size!1924 (buf!2314 (_2!4043 lt!137715)))) (and (= (currentBit!4599 (_2!4043 lt!137715)) #b00000000000000000000000000000000) (= (currentByte!4604 (_2!4043 lt!137715)) (size!1924 (buf!2314 (_2!4043 lt!137715))))))))))

(assert (=> b!91346 d!28406))

(declare-fun b!91409 () Bool)

(declare-fun e!60096 () Bool)

(declare-fun e!60095 () Bool)

(assert (=> b!91409 (= e!60096 e!60095)))

(declare-fun res!75465 () Bool)

(assert (=> b!91409 (=> (not res!75465) (not e!60095))))

(declare-fun lt!137800 () tuple2!7598)

(declare-fun lt!137801 () tuple2!7596)

(assert (=> b!91409 (= res!75465 (and (= (_2!4044 lt!137800) lt!137712) (= (_1!4044 lt!137800) (_2!4043 lt!137801))))))

(assert (=> b!91409 (= lt!137800 (readBitPure!0 (readerFrom!0 (_2!4043 lt!137801) (currentBit!4599 thiss!1152) (currentByte!4604 thiss!1152))))))

(declare-fun d!28408 () Bool)

(assert (=> d!28408 e!60096))

(declare-fun res!75464 () Bool)

(assert (=> d!28408 (=> (not res!75464) (not e!60096))))

(assert (=> d!28408 (= res!75464 (= (size!1924 (buf!2314 thiss!1152)) (size!1924 (buf!2314 (_2!4043 lt!137801)))))))

(declare-fun choose!16 (BitStream!3410 Bool) tuple2!7596)

(assert (=> d!28408 (= lt!137801 (choose!16 thiss!1152 lt!137712))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28408 (validate_offset_bit!0 ((_ sign_extend 32) (size!1924 (buf!2314 thiss!1152))) ((_ sign_extend 32) (currentByte!4604 thiss!1152)) ((_ sign_extend 32) (currentBit!4599 thiss!1152)))))

(assert (=> d!28408 (= (appendBit!0 thiss!1152 lt!137712) lt!137801)))

(declare-fun b!91407 () Bool)

(declare-fun res!75463 () Bool)

(assert (=> b!91407 (=> (not res!75463) (not e!60096))))

(declare-fun lt!137802 () (_ BitVec 64))

(declare-fun lt!137799 () (_ BitVec 64))

(assert (=> b!91407 (= res!75463 (= (bitIndex!0 (size!1924 (buf!2314 (_2!4043 lt!137801))) (currentByte!4604 (_2!4043 lt!137801)) (currentBit!4599 (_2!4043 lt!137801))) (bvadd lt!137799 lt!137802)))))

(assert (=> b!91407 (or (not (= (bvand lt!137799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137802 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137799 lt!137802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91407 (= lt!137802 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!91407 (= lt!137799 (bitIndex!0 (size!1924 (buf!2314 thiss!1152)) (currentByte!4604 thiss!1152) (currentBit!4599 thiss!1152)))))

(declare-fun b!91410 () Bool)

(assert (=> b!91410 (= e!60095 (= (bitIndex!0 (size!1924 (buf!2314 (_1!4044 lt!137800))) (currentByte!4604 (_1!4044 lt!137800)) (currentBit!4599 (_1!4044 lt!137800))) (bitIndex!0 (size!1924 (buf!2314 (_2!4043 lt!137801))) (currentByte!4604 (_2!4043 lt!137801)) (currentBit!4599 (_2!4043 lt!137801)))))))

(declare-fun b!91408 () Bool)

(declare-fun res!75466 () Bool)

(assert (=> b!91408 (=> (not res!75466) (not e!60096))))

(assert (=> b!91408 (= res!75466 (isPrefixOf!0 thiss!1152 (_2!4043 lt!137801)))))

(assert (= (and d!28408 res!75464) b!91407))

(assert (= (and b!91407 res!75463) b!91408))

(assert (= (and b!91408 res!75466) b!91409))

(assert (= (and b!91409 res!75465) b!91410))

(declare-fun m!135583 () Bool)

(assert (=> d!28408 m!135583))

(declare-fun m!135585 () Bool)

(assert (=> d!28408 m!135585))

(declare-fun m!135587 () Bool)

(assert (=> b!91407 m!135587))

(assert (=> b!91407 m!135529))

(declare-fun m!135589 () Bool)

(assert (=> b!91409 m!135589))

(assert (=> b!91409 m!135589))

(declare-fun m!135591 () Bool)

(assert (=> b!91409 m!135591))

(declare-fun m!135593 () Bool)

(assert (=> b!91410 m!135593))

(assert (=> b!91410 m!135587))

(declare-fun m!135595 () Bool)

(assert (=> b!91408 m!135595))

(assert (=> b!91346 d!28408))

(push 1)

(assert (not b!91379))

(assert (not b!91408))

(assert (not d!28392))

(assert (not d!28378))

(assert (not b!91363))

(assert (not b!91361))

(assert (not b!91410))

(assert (not d!28376))

(assert (not b!91409))

(assert (not d!28398))

(assert (not d!28404))

(assert (not d!28408))

(assert (not d!28394))

(assert (not d!28402))

(assert (not d!28374))

(assert (not d!28396))

(assert (not d!28386))

(assert (not b!91407))

(assert (not d!28388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


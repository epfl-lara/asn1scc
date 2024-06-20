; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!894 () Bool)

(assert start!894)

(declare-fun b!3300 () Bool)

(declare-fun res!4879 () Bool)

(declare-fun e!2236 () Bool)

(assert (=> b!3300 (=> (not res!4879) (not e!2236))))

(declare-datatypes ((array!283 0))(
  ( (array!284 (arr!504 (Array (_ BitVec 32) (_ BitVec 8))) (size!117 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!212 0))(
  ( (BitStream!213 (buf!432 array!283) (currentByte!1399 (_ BitVec 32)) (currentBit!1394 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!212)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3300 (= res!4879 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 thiss!1486))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) nBits!460))))

(declare-fun b!3302 () Bool)

(declare-fun res!4875 () Bool)

(declare-fun e!2233 () Bool)

(assert (=> b!3302 (=> (not res!4875) (not e!2233))))

(declare-datatypes ((Unit!236 0))(
  ( (Unit!237) )
))
(declare-datatypes ((tuple2!334 0))(
  ( (tuple2!335 (_1!177 Unit!236) (_2!177 BitStream!212)) )
))
(declare-fun lt!3499 () tuple2!334)

(declare-fun isPrefixOf!0 (BitStream!212 BitStream!212) Bool)

(assert (=> b!3302 (= res!4875 (isPrefixOf!0 thiss!1486 (_2!177 lt!3499)))))

(declare-fun b!3303 () Bool)

(declare-datatypes ((tuple2!336 0))(
  ( (tuple2!337 (_1!178 BitStream!212) (_2!178 BitStream!212)) )
))
(declare-fun lt!3500 () tuple2!336)

(assert (=> b!3303 (= e!2233 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_1!178 lt!3500)))) ((_ sign_extend 32) (currentByte!1399 (_1!178 lt!3500))) ((_ sign_extend 32) (currentBit!1394 (_1!178 lt!3500))) nBits!460)))))

(declare-datatypes ((tuple2!338 0))(
  ( (tuple2!339 (_1!179 array!283) (_2!179 BitStream!212)) )
))
(declare-fun lt!3498 () tuple2!338)

(declare-fun readBits!0 (BitStream!212 (_ BitVec 64)) tuple2!338)

(assert (=> b!3303 (= lt!3498 (readBits!0 (_1!178 lt!3500) nBits!460))))

(assert (=> b!3303 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!3499)))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) nBits!460)))

(declare-fun lt!3497 () Unit!236)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!212 array!283 (_ BitVec 64)) Unit!236)

(assert (=> b!3303 (= lt!3497 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!432 (_2!177 lt!3499)) nBits!460))))

(declare-fun reader!0 (BitStream!212 BitStream!212) tuple2!336)

(assert (=> b!3303 (= lt!3500 (reader!0 thiss!1486 (_2!177 lt!3499)))))

(declare-fun b!3304 () Bool)

(assert (=> b!3304 (= e!2236 e!2233)))

(declare-fun res!4874 () Bool)

(assert (=> b!3304 (=> (not res!4874) (not e!2233))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3304 (= res!4874 (invariant!0 (currentBit!1394 (_2!177 lt!3499)) (currentByte!1399 (_2!177 lt!3499)) (size!117 (buf!432 (_2!177 lt!3499)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!283)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!212 array!283 (_ BitVec 64) (_ BitVec 64)) tuple2!334)

(assert (=> b!3304 (= lt!3499 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3305 () Bool)

(declare-fun e!2237 () Bool)

(declare-fun array_inv!112 (array!283) Bool)

(assert (=> b!3305 (= e!2237 (array_inv!112 (buf!432 thiss!1486)))))

(declare-fun b!3306 () Bool)

(declare-fun res!4877 () Bool)

(assert (=> b!3306 (=> (not res!4877) (not e!2233))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3306 (= res!4877 (= (bitIndex!0 (size!117 (buf!432 (_2!177 lt!3499))) (currentByte!1399 (_2!177 lt!3499)) (currentBit!1394 (_2!177 lt!3499))) (bvadd (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)) nBits!460)))))

(declare-fun res!4878 () Bool)

(assert (=> start!894 (=> (not res!4878) (not e!2236))))

(assert (=> start!894 (= res!4878 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!117 srcBuffer!6))))))))

(assert (=> start!894 e!2236))

(assert (=> start!894 true))

(assert (=> start!894 (array_inv!112 srcBuffer!6)))

(declare-fun inv!12 (BitStream!212) Bool)

(assert (=> start!894 (and (inv!12 thiss!1486) e!2237)))

(declare-fun b!3301 () Bool)

(declare-fun res!4876 () Bool)

(assert (=> b!3301 (=> (not res!4876) (not e!2233))))

(assert (=> b!3301 (= res!4876 (= (size!117 (buf!432 thiss!1486)) (size!117 (buf!432 (_2!177 lt!3499)))))))

(assert (= (and start!894 res!4878) b!3300))

(assert (= (and b!3300 res!4879) b!3304))

(assert (= (and b!3304 res!4874) b!3301))

(assert (= (and b!3301 res!4876) b!3306))

(assert (= (and b!3306 res!4877) b!3302))

(assert (= (and b!3302 res!4875) b!3303))

(assert (= start!894 b!3305))

(declare-fun m!3479 () Bool)

(assert (=> b!3304 m!3479))

(declare-fun m!3481 () Bool)

(assert (=> b!3304 m!3481))

(declare-fun m!3483 () Bool)

(assert (=> b!3302 m!3483))

(declare-fun m!3485 () Bool)

(assert (=> b!3305 m!3485))

(declare-fun m!3487 () Bool)

(assert (=> start!894 m!3487))

(declare-fun m!3489 () Bool)

(assert (=> start!894 m!3489))

(declare-fun m!3491 () Bool)

(assert (=> b!3303 m!3491))

(declare-fun m!3493 () Bool)

(assert (=> b!3303 m!3493))

(declare-fun m!3495 () Bool)

(assert (=> b!3303 m!3495))

(declare-fun m!3497 () Bool)

(assert (=> b!3303 m!3497))

(declare-fun m!3499 () Bool)

(assert (=> b!3303 m!3499))

(declare-fun m!3501 () Bool)

(assert (=> b!3306 m!3501))

(declare-fun m!3503 () Bool)

(assert (=> b!3306 m!3503))

(declare-fun m!3505 () Bool)

(assert (=> b!3300 m!3505))

(push 1)

(assert (not start!894))

(assert (not b!3306))

(assert (not b!3305))

(assert (not b!3302))

(assert (not b!3303))

(assert (not b!3300))

(assert (not b!3304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!3317 () Bool)

(declare-fun e!2242 () Unit!236)

(declare-fun lt!3542 () Unit!236)

(assert (=> b!3317 (= e!2242 lt!3542)))

(declare-fun lt!3557 () (_ BitVec 64))

(assert (=> b!3317 (= lt!3557 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!3541 () (_ BitVec 64))

(assert (=> b!3317 (= lt!3541 (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!283 array!283 (_ BitVec 64) (_ BitVec 64)) Unit!236)

(assert (=> b!3317 (= lt!3542 (arrayBitRangesEqSymmetric!0 (buf!432 thiss!1486) (buf!432 (_2!177 lt!3499)) lt!3557 lt!3541))))

(declare-fun arrayBitRangesEq!0 (array!283 array!283 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3317 (arrayBitRangesEq!0 (buf!432 (_2!177 lt!3499)) (buf!432 thiss!1486) lt!3557 lt!3541)))

(declare-fun b!3319 () Bool)

(declare-fun res!4887 () Bool)

(declare-fun e!2243 () Bool)

(assert (=> b!3319 (=> (not res!4887) (not e!2243))))

(declare-fun lt!3555 () tuple2!336)

(assert (=> b!3319 (= res!4887 (isPrefixOf!0 (_1!178 lt!3555) thiss!1486))))

(declare-fun b!3320 () Bool)

(declare-fun Unit!253 () Unit!236)

(assert (=> b!3320 (= e!2242 Unit!253)))

(declare-fun lt!3546 () (_ BitVec 64))

(declare-fun b!3321 () Bool)

(declare-fun lt!3553 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!212 (_ BitVec 64)) BitStream!212)

(assert (=> b!3321 (= e!2243 (= (_1!178 lt!3555) (withMovedBitIndex!0 (_2!178 lt!3555) (bvsub lt!3553 lt!3546))))))

(assert (=> b!3321 (or (= (bvand lt!3553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3553 lt!3546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3321 (= lt!3546 (bitIndex!0 (size!117 (buf!432 (_2!177 lt!3499))) (currentByte!1399 (_2!177 lt!3499)) (currentBit!1394 (_2!177 lt!3499))))))

(assert (=> b!3321 (= lt!3553 (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)))))

(declare-fun d!1578 () Bool)

(assert (=> d!1578 e!2243))

(declare-fun res!4886 () Bool)

(assert (=> d!1578 (=> (not res!4886) (not e!2243))))

(assert (=> d!1578 (= res!4886 (isPrefixOf!0 (_1!178 lt!3555) (_2!178 lt!3555)))))

(declare-fun lt!3560 () BitStream!212)

(assert (=> d!1578 (= lt!3555 (tuple2!337 lt!3560 (_2!177 lt!3499)))))

(declare-fun lt!3548 () Unit!236)

(declare-fun lt!3551 () Unit!236)

(assert (=> d!1578 (= lt!3548 lt!3551)))

(assert (=> d!1578 (isPrefixOf!0 lt!3560 (_2!177 lt!3499))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!212 BitStream!212 BitStream!212) Unit!236)

(assert (=> d!1578 (= lt!3551 (lemmaIsPrefixTransitive!0 lt!3560 (_2!177 lt!3499) (_2!177 lt!3499)))))

(declare-fun lt!3543 () Unit!236)

(declare-fun lt!3552 () Unit!236)

(assert (=> d!1578 (= lt!3543 lt!3552)))

(assert (=> d!1578 (isPrefixOf!0 lt!3560 (_2!177 lt!3499))))

(assert (=> d!1578 (= lt!3552 (lemmaIsPrefixTransitive!0 lt!3560 thiss!1486 (_2!177 lt!3499)))))

(declare-fun lt!3550 () Unit!236)

(assert (=> d!1578 (= lt!3550 e!2242)))

(declare-fun c!137 () Bool)

(assert (=> d!1578 (= c!137 (not (= (size!117 (buf!432 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!3554 () Unit!236)

(declare-fun lt!3558 () Unit!236)

(assert (=> d!1578 (= lt!3554 lt!3558)))

(assert (=> d!1578 (isPrefixOf!0 (_2!177 lt!3499) (_2!177 lt!3499))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!212) Unit!236)

(assert (=> d!1578 (= lt!3558 (lemmaIsPrefixRefl!0 (_2!177 lt!3499)))))

(declare-fun lt!3544 () Unit!236)

(declare-fun lt!3547 () Unit!236)

(assert (=> d!1578 (= lt!3544 lt!3547)))

(assert (=> d!1578 (= lt!3547 (lemmaIsPrefixRefl!0 (_2!177 lt!3499)))))

(declare-fun lt!3556 () Unit!236)

(declare-fun lt!3559 () Unit!236)

(assert (=> d!1578 (= lt!3556 lt!3559)))

(assert (=> d!1578 (isPrefixOf!0 lt!3560 lt!3560)))

(assert (=> d!1578 (= lt!3559 (lemmaIsPrefixRefl!0 lt!3560))))

(declare-fun lt!3549 () Unit!236)

(declare-fun lt!3545 () Unit!236)

(assert (=> d!1578 (= lt!3549 lt!3545)))

(assert (=> d!1578 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1578 (= lt!3545 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1578 (= lt!3560 (BitStream!213 (buf!432 (_2!177 lt!3499)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)))))

(assert (=> d!1578 (isPrefixOf!0 thiss!1486 (_2!177 lt!3499))))

(assert (=> d!1578 (= (reader!0 thiss!1486 (_2!177 lt!3499)) lt!3555)))

(declare-fun b!3318 () Bool)

(declare-fun res!4888 () Bool)

(assert (=> b!3318 (=> (not res!4888) (not e!2243))))

(assert (=> b!3318 (= res!4888 (isPrefixOf!0 (_2!178 lt!3555) (_2!177 lt!3499)))))

(assert (= (and d!1578 c!137) b!3317))

(assert (= (and d!1578 (not c!137)) b!3320))

(assert (= (and d!1578 res!4886) b!3319))

(assert (= (and b!3319 res!4887) b!3318))

(assert (= (and b!3318 res!4888) b!3321))

(declare-fun m!3509 () Bool)

(assert (=> b!3319 m!3509))

(declare-fun m!3511 () Bool)

(assert (=> b!3318 m!3511))

(declare-fun m!3513 () Bool)

(assert (=> d!1578 m!3513))

(declare-fun m!3515 () Bool)

(assert (=> d!1578 m!3515))

(declare-fun m!3517 () Bool)

(assert (=> d!1578 m!3517))

(declare-fun m!3519 () Bool)

(assert (=> d!1578 m!3519))

(declare-fun m!3521 () Bool)

(assert (=> d!1578 m!3521))

(declare-fun m!3523 () Bool)

(assert (=> d!1578 m!3523))

(assert (=> d!1578 m!3483))

(declare-fun m!3525 () Bool)

(assert (=> d!1578 m!3525))

(declare-fun m!3527 () Bool)

(assert (=> d!1578 m!3527))

(declare-fun m!3529 () Bool)

(assert (=> d!1578 m!3529))

(declare-fun m!3531 () Bool)

(assert (=> d!1578 m!3531))

(assert (=> b!3317 m!3503))

(declare-fun m!3533 () Bool)

(assert (=> b!3317 m!3533))

(declare-fun m!3535 () Bool)

(assert (=> b!3317 m!3535))

(declare-fun m!3537 () Bool)

(assert (=> b!3321 m!3537))

(assert (=> b!3321 m!3501))

(assert (=> b!3321 m!3503))

(assert (=> b!3303 d!1578))

(declare-fun d!1580 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1580 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!3499)))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!3499)))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486))) nBits!460))))

(declare-fun bs!591 () Bool)

(assert (= bs!591 d!1580))

(declare-fun m!3539 () Bool)

(assert (=> bs!591 m!3539))

(assert (=> b!3303 d!1580))

(declare-fun d!1582 () Bool)

(assert (=> d!1582 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!3499)))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) nBits!460)))

(declare-fun lt!3563 () Unit!236)

(declare-fun choose!9 (BitStream!212 array!283 (_ BitVec 64) BitStream!212) Unit!236)

(assert (=> d!1582 (= lt!3563 (choose!9 thiss!1486 (buf!432 (_2!177 lt!3499)) nBits!460 (BitStream!213 (buf!432 (_2!177 lt!3499)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486))))))

(assert (=> d!1582 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!432 (_2!177 lt!3499)) nBits!460) lt!3563)))

(declare-fun bs!592 () Bool)

(assert (= bs!592 d!1582))

(assert (=> bs!592 m!3491))

(declare-fun m!3541 () Bool)

(assert (=> bs!592 m!3541))

(assert (=> b!3303 d!1582))

(declare-fun d!1584 () Bool)

(assert (=> d!1584 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_1!178 lt!3500)))) ((_ sign_extend 32) (currentByte!1399 (_1!178 lt!3500))) ((_ sign_extend 32) (currentBit!1394 (_1!178 lt!3500))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!117 (buf!432 (_1!178 lt!3500)))) ((_ sign_extend 32) (currentByte!1399 (_1!178 lt!3500))) ((_ sign_extend 32) (currentBit!1394 (_1!178 lt!3500)))) nBits!460))))

(declare-fun bs!593 () Bool)

(assert (= bs!593 d!1584))

(declare-fun m!3543 () Bool)

(assert (=> bs!593 m!3543))

(assert (=> b!3303 d!1584))

(declare-fun b!3332 () Bool)

(declare-fun res!4903 () Bool)

(declare-fun e!2246 () Bool)

(assert (=> b!3332 (=> (not res!4903) (not e!2246))))

(declare-fun lt!3583 () tuple2!338)

(declare-fun lt!3588 () (_ BitVec 64))

(assert (=> b!3332 (= res!4903 (= (size!117 (_1!179 lt!3583)) ((_ extract 31 0) lt!3588)))))

(assert (=> b!3332 (and (bvslt lt!3588 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!3588 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!3587 () (_ BitVec 64))

(declare-fun lt!3584 () (_ BitVec 64))

(assert (=> b!3332 (= lt!3588 (bvsdiv lt!3587 lt!3584))))

(assert (=> b!3332 (and (not (= lt!3584 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!3587 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!3584 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3332 (= lt!3584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!3582 () (_ BitVec 64))

(declare-fun lt!3589 () (_ BitVec 64))

(assert (=> b!3332 (= lt!3587 (bvsub lt!3582 lt!3589))))

(assert (=> b!3332 (or (= (bvand lt!3582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3582 lt!3589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3332 (= lt!3589 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3590 () (_ BitVec 64))

(assert (=> b!3332 (= lt!3582 (bvadd nBits!460 lt!3590))))

(assert (=> b!3332 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3590 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!3590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3332 (= lt!3590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!3333 () Bool)

(declare-fun res!4901 () Bool)

(assert (=> b!3333 (=> (not res!4901) (not e!2246))))

(assert (=> b!3333 (= res!4901 (bvsle (currentByte!1399 (_1!178 lt!3500)) (currentByte!1399 (_2!179 lt!3583))))))

(declare-fun d!1586 () Bool)

(assert (=> d!1586 e!2246))

(declare-fun res!4902 () Bool)

(assert (=> d!1586 (=> (not res!4902) (not e!2246))))

(assert (=> d!1586 (= res!4902 (= (buf!432 (_2!179 lt!3583)) (buf!432 (_1!178 lt!3500))))))

(declare-datatypes ((tuple3!24 0))(
  ( (tuple3!25 (_1!182 Unit!236) (_2!182 BitStream!212) (_3!12 array!283)) )
))
(declare-fun lt!3585 () tuple3!24)

(assert (=> d!1586 (= lt!3583 (tuple2!339 (_3!12 lt!3585) (_2!182 lt!3585)))))

(declare-fun readBitsLoop!0 (BitStream!212 (_ BitVec 64) array!283 (_ BitVec 64) (_ BitVec 64)) tuple3!24)

(assert (=> d!1586 (= lt!3585 (readBitsLoop!0 (_1!178 lt!3500) nBits!460 (array!284 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1586 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1586 (= (readBits!0 (_1!178 lt!3500) nBits!460) lt!3583)))

(declare-fun b!3334 () Bool)

(declare-fun res!4899 () Bool)

(assert (=> b!3334 (=> (not res!4899) (not e!2246))))

(assert (=> b!3334 (= res!4899 (invariant!0 (currentBit!1394 (_2!179 lt!3583)) (currentByte!1399 (_2!179 lt!3583)) (size!117 (buf!432 (_2!179 lt!3583)))))))

(declare-fun b!3335 () Bool)

(declare-datatypes ((List!17 0))(
  ( (Nil!14) (Cons!13 (h!132 Bool) (t!767 List!17)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!212 array!283 (_ BitVec 64) (_ BitVec 64)) List!17)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!212 BitStream!212 (_ BitVec 64)) List!17)

(assert (=> b!3335 (= e!2246 (= (byteArrayBitContentToList!0 (_2!179 lt!3583) (_1!179 lt!3583) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!179 lt!3583) (_1!178 lt!3500) nBits!460)))))

(declare-fun b!3336 () Bool)

(declare-fun res!4900 () Bool)

(assert (=> b!3336 (=> (not res!4900) (not e!2246))))

(declare-fun lt!3586 () (_ BitVec 64))

(assert (=> b!3336 (= res!4900 (= (bvadd lt!3586 nBits!460) (bitIndex!0 (size!117 (buf!432 (_2!179 lt!3583))) (currentByte!1399 (_2!179 lt!3583)) (currentBit!1394 (_2!179 lt!3583)))))))

(assert (=> b!3336 (or (not (= (bvand lt!3586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3586 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3336 (= lt!3586 (bitIndex!0 (size!117 (buf!432 (_1!178 lt!3500))) (currentByte!1399 (_1!178 lt!3500)) (currentBit!1394 (_1!178 lt!3500))))))

(assert (= (and d!1586 res!4902) b!3336))

(assert (= (and b!3336 res!4900) b!3334))

(assert (= (and b!3334 res!4899) b!3332))

(assert (= (and b!3332 res!4903) b!3333))

(assert (= (and b!3333 res!4901) b!3335))

(declare-fun m!3545 () Bool)

(assert (=> d!1586 m!3545))

(declare-fun m!3547 () Bool)

(assert (=> b!3334 m!3547))

(declare-fun m!3549 () Bool)

(assert (=> b!3335 m!3549))

(declare-fun m!3551 () Bool)

(assert (=> b!3335 m!3551))

(declare-fun m!3553 () Bool)

(assert (=> b!3336 m!3553))

(declare-fun m!3555 () Bool)

(assert (=> b!3336 m!3555))

(assert (=> b!3303 d!1586))

(declare-fun d!1588 () Bool)

(declare-fun res!4911 () Bool)

(declare-fun e!2251 () Bool)

(assert (=> d!1588 (=> (not res!4911) (not e!2251))))

(assert (=> d!1588 (= res!4911 (= (size!117 (buf!432 thiss!1486)) (size!117 (buf!432 (_2!177 lt!3499)))))))

(assert (=> d!1588 (= (isPrefixOf!0 thiss!1486 (_2!177 lt!3499)) e!2251)))

(declare-fun b!3343 () Bool)

(declare-fun res!4910 () Bool)

(assert (=> b!3343 (=> (not res!4910) (not e!2251))))

(assert (=> b!3343 (= res!4910 (bvsle (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)) (bitIndex!0 (size!117 (buf!432 (_2!177 lt!3499))) (currentByte!1399 (_2!177 lt!3499)) (currentBit!1394 (_2!177 lt!3499)))))))

(declare-fun b!3344 () Bool)

(declare-fun e!2252 () Bool)

(assert (=> b!3344 (= e!2251 e!2252)))

(declare-fun res!4912 () Bool)

(assert (=> b!3344 (=> res!4912 e!2252)))

(assert (=> b!3344 (= res!4912 (= (size!117 (buf!432 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!3345 () Bool)

(assert (=> b!3345 (= e!2252 (arrayBitRangesEq!0 (buf!432 thiss!1486) (buf!432 (_2!177 lt!3499)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486))))))

(assert (= (and d!1588 res!4911) b!3343))

(assert (= (and b!3343 res!4910) b!3344))

(assert (= (and b!3344 (not res!4912)) b!3345))

(assert (=> b!3343 m!3503))

(assert (=> b!3343 m!3501))

(assert (=> b!3345 m!3503))

(assert (=> b!3345 m!3503))

(declare-fun m!3557 () Bool)

(assert (=> b!3345 m!3557))

(assert (=> b!3302 d!1588))

(declare-fun d!1590 () Bool)

(declare-fun e!2255 () Bool)

(assert (=> d!1590 e!2255))

(declare-fun res!4918 () Bool)

(assert (=> d!1590 (=> (not res!4918) (not e!2255))))

(declare-fun lt!3604 () (_ BitVec 64))

(declare-fun lt!3603 () (_ BitVec 64))

(declare-fun lt!3605 () (_ BitVec 64))

(assert (=> d!1590 (= res!4918 (= lt!3605 (bvsub lt!3603 lt!3604)))))

(assert (=> d!1590 (or (= (bvand lt!3603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3604 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3603 lt!3604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1590 (= lt!3604 (remainingBits!0 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!3499)))) ((_ sign_extend 32) (currentByte!1399 (_2!177 lt!3499))) ((_ sign_extend 32) (currentBit!1394 (_2!177 lt!3499)))))))

(declare-fun lt!3608 () (_ BitVec 64))

(declare-fun lt!3606 () (_ BitVec 64))

(assert (=> d!1590 (= lt!3603 (bvmul lt!3608 lt!3606))))

(assert (=> d!1590 (or (= lt!3608 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!3606 (bvsdiv (bvmul lt!3608 lt!3606) lt!3608)))))

(assert (=> d!1590 (= lt!3606 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1590 (= lt!3608 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!3499)))))))

(assert (=> d!1590 (= lt!3605 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1399 (_2!177 lt!3499))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1394 (_2!177 lt!3499)))))))

(assert (=> d!1590 (invariant!0 (currentBit!1394 (_2!177 lt!3499)) (currentByte!1399 (_2!177 lt!3499)) (size!117 (buf!432 (_2!177 lt!3499))))))

(assert (=> d!1590 (= (bitIndex!0 (size!117 (buf!432 (_2!177 lt!3499))) (currentByte!1399 (_2!177 lt!3499)) (currentBit!1394 (_2!177 lt!3499))) lt!3605)))

(declare-fun b!3350 () Bool)

(declare-fun res!4917 () Bool)

(assert (=> b!3350 (=> (not res!4917) (not e!2255))))

(assert (=> b!3350 (= res!4917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!3605))))

(declare-fun b!3351 () Bool)

(declare-fun lt!3607 () (_ BitVec 64))

(assert (=> b!3351 (= e!2255 (bvsle lt!3605 (bvmul lt!3607 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3351 (or (= lt!3607 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!3607 #b0000000000000000000000000000000000000000000000000000000000001000) lt!3607)))))

(assert (=> b!3351 (= lt!3607 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!3499)))))))

(assert (= (and d!1590 res!4918) b!3350))

(assert (= (and b!3350 res!4917) b!3351))

(declare-fun m!3559 () Bool)

(assert (=> d!1590 m!3559))

(assert (=> d!1590 m!3479))

(assert (=> b!3306 d!1590))

(declare-fun d!1592 () Bool)

(declare-fun e!2256 () Bool)

(assert (=> d!1592 e!2256))

(declare-fun res!4920 () Bool)

(assert (=> d!1592 (=> (not res!4920) (not e!2256))))

(declare-fun lt!3611 () (_ BitVec 64))

(declare-fun lt!3609 () (_ BitVec 64))

(declare-fun lt!3610 () (_ BitVec 64))

(assert (=> d!1592 (= res!4920 (= lt!3611 (bvsub lt!3609 lt!3610)))))

(assert (=> d!1592 (or (= (bvand lt!3609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3609 lt!3610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1592 (= lt!3610 (remainingBits!0 ((_ sign_extend 32) (size!117 (buf!432 thiss!1486))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486))))))

(declare-fun lt!3614 () (_ BitVec 64))

(declare-fun lt!3612 () (_ BitVec 64))

(assert (=> d!1592 (= lt!3609 (bvmul lt!3614 lt!3612))))

(assert (=> d!1592 (or (= lt!3614 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!3612 (bvsdiv (bvmul lt!3614 lt!3612) lt!3614)))))

(assert (=> d!1592 (= lt!3612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1592 (= lt!3614 ((_ sign_extend 32) (size!117 (buf!432 thiss!1486))))))

(assert (=> d!1592 (= lt!3611 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1399 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1394 thiss!1486))))))

(assert (=> d!1592 (invariant!0 (currentBit!1394 thiss!1486) (currentByte!1399 thiss!1486) (size!117 (buf!432 thiss!1486)))))

(assert (=> d!1592 (= (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)) lt!3611)))

(declare-fun b!3352 () Bool)

(declare-fun res!4919 () Bool)

(assert (=> b!3352 (=> (not res!4919) (not e!2256))))

(assert (=> b!3352 (= res!4919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!3611))))

(declare-fun b!3353 () Bool)

(declare-fun lt!3613 () (_ BitVec 64))

(assert (=> b!3353 (= e!2256 (bvsle lt!3611 (bvmul lt!3613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3353 (or (= lt!3613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!3613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!3613)))))

(assert (=> b!3353 (= lt!3613 ((_ sign_extend 32) (size!117 (buf!432 thiss!1486))))))

(assert (= (and d!1592 res!4920) b!3352))

(assert (= (and b!3352 res!4919) b!3353))

(declare-fun m!3561 () Bool)

(assert (=> d!1592 m!3561))

(declare-fun m!3563 () Bool)

(assert (=> d!1592 m!3563))

(assert (=> b!3306 d!1592))

(declare-fun d!1594 () Bool)

(assert (=> d!1594 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 thiss!1486))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!117 (buf!432 thiss!1486))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486))) nBits!460))))

(declare-fun bs!594 () Bool)

(assert (= bs!594 d!1594))

(assert (=> bs!594 m!3561))

(assert (=> b!3300 d!1594))

(declare-fun d!1596 () Bool)

(assert (=> d!1596 (= (array_inv!112 (buf!432 thiss!1486)) (bvsge (size!117 (buf!432 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!3305 d!1596))

(declare-fun d!1598 () Bool)

(assert (=> d!1598 (= (invariant!0 (currentBit!1394 (_2!177 lt!3499)) (currentByte!1399 (_2!177 lt!3499)) (size!117 (buf!432 (_2!177 lt!3499)))) (and (bvsge (currentBit!1394 (_2!177 lt!3499)) #b00000000000000000000000000000000) (bvslt (currentBit!1394 (_2!177 lt!3499)) #b00000000000000000000000000001000) (bvsge (currentByte!1399 (_2!177 lt!3499)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1399 (_2!177 lt!3499)) (size!117 (buf!432 (_2!177 lt!3499)))) (and (= (currentBit!1394 (_2!177 lt!3499)) #b00000000000000000000000000000000) (= (currentByte!1399 (_2!177 lt!3499)) (size!117 (buf!432 (_2!177 lt!3499))))))))))

(assert (=> b!3304 d!1598))

(declare-fun b!3512 () Bool)

(declare-fun res!5054 () Bool)

(declare-fun e!2319 () Bool)

(assert (=> b!3512 (=> (not res!5054) (not e!2319))))

(declare-fun lt!4207 () tuple2!334)

(assert (=> b!3512 (= res!5054 (= (size!117 (buf!432 (_2!177 lt!4207))) (size!117 (buf!432 thiss!1486))))))

(declare-fun b!3513 () Bool)

(declare-fun lt!4211 () tuple2!336)

(assert (=> b!3513 (= e!2319 (= (bitStreamReadBitsIntoList!0 (_2!177 lt!4207) (_1!178 lt!4211) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!177 lt!4207) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3513 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3513 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!4222 () Unit!236)

(declare-fun lt!4205 () Unit!236)

(assert (=> b!3513 (= lt!4222 lt!4205)))

(declare-fun lt!4232 () (_ BitVec 64))

(assert (=> b!3513 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!4207)))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) lt!4232)))

(assert (=> b!3513 (= lt!4205 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!432 (_2!177 lt!4207)) lt!4232))))

(declare-fun e!2320 () Bool)

(assert (=> b!3513 e!2320))

(declare-fun res!5056 () Bool)

(assert (=> b!3513 (=> (not res!5056) (not e!2320))))

(assert (=> b!3513 (= res!5056 (and (= (size!117 (buf!432 thiss!1486)) (size!117 (buf!432 (_2!177 lt!4207)))) (bvsge lt!4232 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3513 (= lt!4232 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3513 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3513 (= lt!4211 (reader!0 thiss!1486 (_2!177 lt!4207)))))

(declare-fun c!152 () Bool)

(declare-fun lt!4204 () tuple2!334)

(declare-fun call!38 () tuple2!336)

(declare-fun bm!35 () Bool)

(assert (=> bm!35 (= call!38 (reader!0 thiss!1486 (ite c!152 (_2!177 lt!4204) thiss!1486)))))

(declare-fun b!3514 () Bool)

(declare-fun res!5051 () Bool)

(assert (=> b!3514 (=> (not res!5051) (not e!2319))))

(assert (=> b!3514 (= res!5051 (invariant!0 (currentBit!1394 (_2!177 lt!4207)) (currentByte!1399 (_2!177 lt!4207)) (size!117 (buf!432 (_2!177 lt!4207)))))))

(declare-fun b!3515 () Bool)

(declare-fun res!5055 () Bool)

(assert (=> b!3515 (=> (not res!5055) (not e!2319))))

(assert (=> b!3515 (= res!5055 (= (size!117 (buf!432 thiss!1486)) (size!117 (buf!432 (_2!177 lt!4207)))))))

(declare-fun b!3516 () Bool)

(declare-fun res!5053 () Bool)

(assert (=> b!3516 (=> (not res!5053) (not e!2319))))

(assert (=> b!3516 (= res!5053 (isPrefixOf!0 thiss!1486 (_2!177 lt!4207)))))

(declare-fun b!3517 () Bool)

(declare-fun e!2321 () tuple2!334)

(declare-fun Unit!255 () Unit!236)

(assert (=> b!3517 (= e!2321 (tuple2!335 Unit!255 thiss!1486))))

(assert (=> b!3517 (= (size!117 (buf!432 thiss!1486)) (size!117 (buf!432 thiss!1486)))))

(declare-fun lt!4213 () Unit!236)

(declare-fun Unit!256 () Unit!236)

(assert (=> b!3517 (= lt!4213 Unit!256)))

(declare-fun checkByteArrayBitContent!0 (BitStream!212 array!283 array!283 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3517 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!179 (readBits!0 (_1!178 call!38) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun d!1600 () Bool)

(assert (=> d!1600 e!2319))

(declare-fun res!5052 () Bool)

(assert (=> d!1600 (=> (not res!5052) (not e!2319))))

(declare-fun lt!4221 () (_ BitVec 64))

(assert (=> d!1600 (= res!5052 (= (bitIndex!0 (size!117 (buf!432 (_2!177 lt!4207))) (currentByte!1399 (_2!177 lt!4207)) (currentBit!1394 (_2!177 lt!4207))) (bvsub lt!4221 from!367)))))

(assert (=> d!1600 (or (= (bvand lt!4221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4221 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!4229 () (_ BitVec 64))

(assert (=> d!1600 (= lt!4221 (bvadd lt!4229 from!367 nBits!460))))

(assert (=> d!1600 (or (not (= (bvand lt!4229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!4229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!4229 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1600 (= lt!4229 (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)))))

(assert (=> d!1600 (= lt!4207 e!2321)))

(assert (=> d!1600 (= c!152 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!4215 () Unit!236)

(declare-fun lt!4201 () Unit!236)

(assert (=> d!1600 (= lt!4215 lt!4201)))

(assert (=> d!1600 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1600 (= lt!4201 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!4233 () (_ BitVec 64))

(assert (=> d!1600 (= lt!4233 (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)))))

(assert (=> d!1600 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1600 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!4207)))

(declare-fun b!3518 () Bool)

(declare-fun lt!4218 () tuple2!334)

(declare-fun Unit!257 () Unit!236)

(assert (=> b!3518 (= e!2321 (tuple2!335 Unit!257 (_2!177 lt!4218)))))

(declare-fun appendBitFromByte!0 (BitStream!212 (_ BitVec 8) (_ BitVec 32)) tuple2!334)

(assert (=> b!3518 (= lt!4204 (appendBitFromByte!0 thiss!1486 (select (arr!504 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!4225 () (_ BitVec 64))

(assert (=> b!3518 (= lt!4225 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!4220 () (_ BitVec 64))

(assert (=> b!3518 (= lt!4220 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!4197 () Unit!236)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!212 BitStream!212 (_ BitVec 64) (_ BitVec 64)) Unit!236)

(assert (=> b!3518 (= lt!4197 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!177 lt!4204) lt!4225 lt!4220))))

(assert (=> b!3518 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!4204)))) ((_ sign_extend 32) (currentByte!1399 (_2!177 lt!4204))) ((_ sign_extend 32) (currentBit!1394 (_2!177 lt!4204))) (bvsub lt!4225 lt!4220))))

(declare-fun lt!4234 () Unit!236)

(assert (=> b!3518 (= lt!4234 lt!4197)))

(declare-fun lt!4238 () tuple2!336)

(assert (=> b!3518 (= lt!4238 call!38)))

(declare-fun lt!4210 () (_ BitVec 64))

(assert (=> b!3518 (= lt!4210 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!4202 () Unit!236)

(assert (=> b!3518 (= lt!4202 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!432 (_2!177 lt!4204)) lt!4210))))

(assert (=> b!3518 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!4204)))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) lt!4210)))

(declare-fun lt!4196 () Unit!236)

(assert (=> b!3518 (= lt!4196 lt!4202)))

(declare-fun head!16 (List!17) Bool)

(assert (=> b!3518 (= (head!16 (byteArrayBitContentToList!0 (_2!177 lt!4204) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!16 (bitStreamReadBitsIntoList!0 (_2!177 lt!4204) (_1!178 lt!4238) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!4227 () Unit!236)

(declare-fun Unit!258 () Unit!236)

(assert (=> b!3518 (= lt!4227 Unit!258)))

(assert (=> b!3518 (= lt!4218 (appendBitsMSBFirstLoop!0 (_2!177 lt!4204) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!4228 () Unit!236)

(assert (=> b!3518 (= lt!4228 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!177 lt!4204) (_2!177 lt!4218)))))

(assert (=> b!3518 (isPrefixOf!0 thiss!1486 (_2!177 lt!4218))))

(declare-fun lt!4237 () Unit!236)

(assert (=> b!3518 (= lt!4237 lt!4228)))

(assert (=> b!3518 (= (size!117 (buf!432 (_2!177 lt!4218))) (size!117 (buf!432 thiss!1486)))))

(declare-fun lt!4214 () Unit!236)

(declare-fun Unit!259 () Unit!236)

(assert (=> b!3518 (= lt!4214 Unit!259)))

(assert (=> b!3518 (= (bitIndex!0 (size!117 (buf!432 (_2!177 lt!4218))) (currentByte!1399 (_2!177 lt!4218)) (currentBit!1394 (_2!177 lt!4218))) (bvsub (bvadd (bitIndex!0 (size!117 (buf!432 thiss!1486)) (currentByte!1399 thiss!1486) (currentBit!1394 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!4195 () Unit!236)

(declare-fun Unit!260 () Unit!236)

(assert (=> b!3518 (= lt!4195 Unit!260)))

(assert (=> b!3518 (= (bitIndex!0 (size!117 (buf!432 (_2!177 lt!4218))) (currentByte!1399 (_2!177 lt!4218)) (currentBit!1394 (_2!177 lt!4218))) (bvsub (bvsub (bvadd (bitIndex!0 (size!117 (buf!432 (_2!177 lt!4204))) (currentByte!1399 (_2!177 lt!4204)) (currentBit!1394 (_2!177 lt!4204))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!4200 () Unit!236)

(declare-fun Unit!261 () Unit!236)

(assert (=> b!3518 (= lt!4200 Unit!261)))

(declare-fun lt!4203 () tuple2!336)

(assert (=> b!3518 (= lt!4203 (reader!0 thiss!1486 (_2!177 lt!4218)))))

(declare-fun lt!4199 () (_ BitVec 64))

(assert (=> b!3518 (= lt!4199 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!4230 () Unit!236)

(assert (=> b!3518 (= lt!4230 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!432 (_2!177 lt!4218)) lt!4199))))

(assert (=> b!3518 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!4218)))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) lt!4199)))

(declare-fun lt!4223 () Unit!236)

(assert (=> b!3518 (= lt!4223 lt!4230)))

(declare-fun lt!4219 () tuple2!336)

(assert (=> b!3518 (= lt!4219 (reader!0 (_2!177 lt!4204) (_2!177 lt!4218)))))

(declare-fun lt!4231 () (_ BitVec 64))

(assert (=> b!3518 (= lt!4231 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!4236 () Unit!236)

(assert (=> b!3518 (= lt!4236 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!177 lt!4204) (buf!432 (_2!177 lt!4218)) lt!4231))))

(assert (=> b!3518 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 (_2!177 lt!4218)))) ((_ sign_extend 32) (currentByte!1399 (_2!177 lt!4204))) ((_ sign_extend 32) (currentBit!1394 (_2!177 lt!4204))) lt!4231)))

(declare-fun lt!4226 () Unit!236)

(assert (=> b!3518 (= lt!4226 lt!4236)))

(declare-fun lt!4224 () List!17)

(assert (=> b!3518 (= lt!4224 (byteArrayBitContentToList!0 (_2!177 lt!4218) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!4235 () List!17)

(assert (=> b!3518 (= lt!4235 (byteArrayBitContentToList!0 (_2!177 lt!4218) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!4212 () List!17)

(assert (=> b!3518 (= lt!4212 (bitStreamReadBitsIntoList!0 (_2!177 lt!4218) (_1!178 lt!4203) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!4216 () List!17)

(assert (=> b!3518 (= lt!4216 (bitStreamReadBitsIntoList!0 (_2!177 lt!4218) (_1!178 lt!4219) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!4206 () (_ BitVec 64))

(assert (=> b!3518 (= lt!4206 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!4198 () Unit!236)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!212 BitStream!212 BitStream!212 BitStream!212 (_ BitVec 64) List!17) Unit!236)

(assert (=> b!3518 (= lt!4198 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!177 lt!4218) (_2!177 lt!4218) (_1!178 lt!4203) (_1!178 lt!4219) lt!4206 lt!4212))))

(declare-fun tail!24 (List!17) List!17)

(assert (=> b!3518 (= (bitStreamReadBitsIntoList!0 (_2!177 lt!4218) (_1!178 lt!4219) (bvsub lt!4206 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!24 lt!4212))))

(declare-fun lt!4217 () Unit!236)

(assert (=> b!3518 (= lt!4217 lt!4198)))

(declare-fun lt!4209 () Unit!236)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!283 array!283 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!236)

(assert (=> b!3518 (= lt!4209 (arrayBitRangesEqImpliesEq!0 (buf!432 (_2!177 lt!4204)) (buf!432 (_2!177 lt!4218)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!4233 (bitIndex!0 (size!117 (buf!432 (_2!177 lt!4204))) (currentByte!1399 (_2!177 lt!4204)) (currentBit!1394 (_2!177 lt!4204)))))))

(declare-fun bitAt!0 (array!283 (_ BitVec 64)) Bool)

(assert (=> b!3518 (= (bitAt!0 (buf!432 (_2!177 lt!4204)) lt!4233) (bitAt!0 (buf!432 (_2!177 lt!4218)) lt!4233))))

(declare-fun lt!4208 () Unit!236)

(assert (=> b!3518 (= lt!4208 lt!4209)))

(declare-fun b!3519 () Bool)

(assert (=> b!3519 (= e!2320 (validate_offset_bits!1 ((_ sign_extend 32) (size!117 (buf!432 thiss!1486))) ((_ sign_extend 32) (currentByte!1399 thiss!1486)) ((_ sign_extend 32) (currentBit!1394 thiss!1486)) lt!4232))))

(assert (= (and d!1600 c!152) b!3518))

(assert (= (and d!1600 (not c!152)) b!3517))

(assert (= (or b!3518 b!3517) bm!35))

(assert (= (and d!1600 res!5052) b!3514))

(assert (= (and b!3514 res!5051) b!3515))

(assert (= (and b!3515 res!5055) b!3516))

(assert (= (and b!3516 res!5053) b!3512))

(assert (= (and b!3512 res!5054) b!3513))

(assert (= (and b!3513 res!5056) b!3519))

(declare-fun m!3847 () Bool)

(assert (=> b!3518 m!3847))

(declare-fun m!3849 () Bool)

(assert (=> b!3518 m!3849))

(declare-fun m!3851 () Bool)

(assert (=> b!3518 m!3851))

(declare-fun m!3853 () Bool)

(assert (=> b!3518 m!3853))

(declare-fun m!3855 () Bool)

(assert (=> b!3518 m!3855))

(declare-fun m!3857 () Bool)

(assert (=> b!3518 m!3857))

(declare-fun m!3859 () Bool)

(assert (=> b!3518 m!3859))

(declare-fun m!3861 () Bool)

(assert (=> b!3518 m!3861))

(declare-fun m!3863 () Bool)

(assert (=> b!3518 m!3863))

(declare-fun m!3865 () Bool)

(assert (=> b!3518 m!3865))

(assert (=> b!3518 m!3503))

(declare-fun m!3867 () Bool)

(assert (=> b!3518 m!3867))

(declare-fun m!3869 () Bool)

(assert (=> b!3518 m!3869))

(declare-fun m!3871 () Bool)

(assert (=> b!3518 m!3871))

(declare-fun m!3873 () Bool)

(assert (=> b!3518 m!3873))

(declare-fun m!3875 () Bool)

(assert (=> b!3518 m!3875))

(declare-fun m!3877 () Bool)

(assert (=> b!3518 m!3877))

(assert (=> b!3518 m!3857))

(declare-fun m!3879 () Bool)

(assert (=> b!3518 m!3879))

(declare-fun m!3881 () Bool)

(assert (=> b!3518 m!3881))

(declare-fun m!3883 () Bool)

(assert (=> b!3518 m!3883))

(declare-fun m!3885 () Bool)

(assert (=> b!3518 m!3885))

(assert (=> b!3518 m!3881))

(declare-fun m!3887 () Bool)

(assert (=> b!3518 m!3887))

(declare-fun m!3889 () Bool)

(assert (=> b!3518 m!3889))

(declare-fun m!3891 () Bool)

(assert (=> b!3518 m!3891))

(declare-fun m!3893 () Bool)

(assert (=> b!3518 m!3893))

(declare-fun m!3895 () Bool)

(assert (=> b!3518 m!3895))

(declare-fun m!3897 () Bool)

(assert (=> b!3518 m!3897))

(assert (=> b!3518 m!3853))

(declare-fun m!3899 () Bool)

(assert (=> b!3518 m!3899))

(declare-fun m!3901 () Bool)

(assert (=> b!3518 m!3901))

(assert (=> b!3518 m!3895))

(declare-fun m!3903 () Bool)

(assert (=> b!3518 m!3903))

(declare-fun m!3905 () Bool)

(assert (=> b!3518 m!3905))

(declare-fun m!3907 () Bool)

(assert (=> b!3518 m!3907))

(declare-fun m!3909 () Bool)

(assert (=> b!3519 m!3909))

(declare-fun m!3911 () Bool)

(assert (=> b!3514 m!3911))

(declare-fun m!3913 () Bool)

(assert (=> b!3516 m!3913))

(declare-fun m!3915 () Bool)

(assert (=> d!1600 m!3915))

(assert (=> d!1600 m!3503))

(assert (=> d!1600 m!3517))

(assert (=> d!1600 m!3521))

(declare-fun m!3917 () Bool)

(assert (=> bm!35 m!3917))

(declare-fun m!3919 () Bool)

(assert (=> b!3517 m!3919))

(declare-fun m!3921 () Bool)

(assert (=> b!3517 m!3921))

(declare-fun m!3923 () Bool)

(assert (=> b!3513 m!3923))

(declare-fun m!3925 () Bool)

(assert (=> b!3513 m!3925))

(declare-fun m!3927 () Bool)

(assert (=> b!3513 m!3927))

(declare-fun m!3929 () Bool)

(assert (=> b!3513 m!3929))

(declare-fun m!3931 () Bool)

(assert (=> b!3513 m!3931))

(assert (=> b!3304 d!1600))

(declare-fun d!1648 () Bool)

(assert (=> d!1648 (= (array_inv!112 srcBuffer!6) (bvsge (size!117 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!894 d!1648))

(declare-fun d!1650 () Bool)

(assert (=> d!1650 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1394 thiss!1486) (currentByte!1399 thiss!1486) (size!117 (buf!432 thiss!1486))))))

(declare-fun bs!604 () Bool)

(assert (= bs!604 d!1650))

(assert (=> bs!604 m!3563))

(assert (=> start!894 d!1650))

(push 1)

(assert (not d!1580))

(assert (not d!1590))

(assert (not b!3345))

(assert (not b!3517))

(assert (not b!3335))

(assert (not b!3317))

(assert (not b!3516))

(assert (not b!3514))

(assert (not d!1582))

(assert (not d!1586))

(assert (not b!3336))

(assert (not b!3518))

(assert (not b!3334))

(assert (not b!3318))

(assert (not d!1592))

(assert (not d!1650))

(assert (not b!3343))

(assert (not b!3321))

(assert (not d!1600))

(assert (not d!1578))

(assert (not b!3319))

(assert (not d!1584))

(assert (not b!3513))

(assert (not b!3519))

(assert (not d!1594))

(assert (not bm!35))

(check-sat)

(pop 1)

(push 1)

(check-sat)


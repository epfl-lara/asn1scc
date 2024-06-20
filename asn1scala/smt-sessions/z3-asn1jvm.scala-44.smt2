; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!892 () Bool)

(assert start!892)

(declare-fun res!4861 () Bool)

(declare-fun e!2219 () Bool)

(assert (=> start!892 (=> (not res!4861) (not e!2219))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!281 0))(
  ( (array!282 (arr!503 (Array (_ BitVec 32) (_ BitVec 8))) (size!116 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!281)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!892 (= res!4861 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!116 srcBuffer!6))))))))

(assert (=> start!892 e!2219))

(assert (=> start!892 true))

(declare-fun array_inv!111 (array!281) Bool)

(assert (=> start!892 (array_inv!111 srcBuffer!6)))

(declare-datatypes ((BitStream!210 0))(
  ( (BitStream!211 (buf!431 array!281) (currentByte!1398 (_ BitVec 32)) (currentBit!1393 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!210)

(declare-fun e!2220 () Bool)

(declare-fun inv!12 (BitStream!210) Bool)

(assert (=> start!892 (and (inv!12 thiss!1486) e!2220)))

(declare-fun b!3279 () Bool)

(declare-fun res!4860 () Bool)

(assert (=> b!3279 (=> (not res!4860) (not e!2219))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3279 (= res!4860 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 thiss!1486))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) nBits!460))))

(declare-fun b!3280 () Bool)

(declare-fun res!4857 () Bool)

(declare-fun e!2222 () Bool)

(assert (=> b!3280 (=> (not res!4857) (not e!2222))))

(declare-datatypes ((Unit!234 0))(
  ( (Unit!235) )
))
(declare-datatypes ((tuple2!328 0))(
  ( (tuple2!329 (_1!174 Unit!234) (_2!174 BitStream!210)) )
))
(declare-fun lt!3488 () tuple2!328)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3280 (= res!4857 (= (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3488))) (currentByte!1398 (_2!174 lt!3488)) (currentBit!1393 (_2!174 lt!3488))) (bvadd (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)) nBits!460)))))

(declare-fun b!3281 () Bool)

(declare-datatypes ((tuple2!330 0))(
  ( (tuple2!331 (_1!175 BitStream!210) (_2!175 BitStream!210)) )
))
(declare-fun lt!3485 () tuple2!330)

(assert (=> b!3281 (= e!2222 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_1!175 lt!3485)))) ((_ sign_extend 32) (currentByte!1398 (_1!175 lt!3485))) ((_ sign_extend 32) (currentBit!1393 (_1!175 lt!3485))) nBits!460)))))

(declare-datatypes ((tuple2!332 0))(
  ( (tuple2!333 (_1!176 array!281) (_2!176 BitStream!210)) )
))
(declare-fun lt!3487 () tuple2!332)

(declare-fun readBits!0 (BitStream!210 (_ BitVec 64)) tuple2!332)

(assert (=> b!3281 (= lt!3487 (readBits!0 (_1!175 lt!3485) nBits!460))))

(assert (=> b!3281 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3488)))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) nBits!460)))

(declare-fun lt!3486 () Unit!234)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!210 array!281 (_ BitVec 64)) Unit!234)

(assert (=> b!3281 (= lt!3486 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!431 (_2!174 lt!3488)) nBits!460))))

(declare-fun reader!0 (BitStream!210 BitStream!210) tuple2!330)

(assert (=> b!3281 (= lt!3485 (reader!0 thiss!1486 (_2!174 lt!3488)))))

(declare-fun b!3282 () Bool)

(declare-fun res!4856 () Bool)

(assert (=> b!3282 (=> (not res!4856) (not e!2222))))

(assert (=> b!3282 (= res!4856 (= (size!116 (buf!431 thiss!1486)) (size!116 (buf!431 (_2!174 lt!3488)))))))

(declare-fun b!3283 () Bool)

(declare-fun res!4859 () Bool)

(assert (=> b!3283 (=> (not res!4859) (not e!2222))))

(declare-fun isPrefixOf!0 (BitStream!210 BitStream!210) Bool)

(assert (=> b!3283 (= res!4859 (isPrefixOf!0 thiss!1486 (_2!174 lt!3488)))))

(declare-fun b!3284 () Bool)

(assert (=> b!3284 (= e!2219 e!2222)))

(declare-fun res!4858 () Bool)

(assert (=> b!3284 (=> (not res!4858) (not e!2222))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3284 (= res!4858 (invariant!0 (currentBit!1393 (_2!174 lt!3488)) (currentByte!1398 (_2!174 lt!3488)) (size!116 (buf!431 (_2!174 lt!3488)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!210 array!281 (_ BitVec 64) (_ BitVec 64)) tuple2!328)

(assert (=> b!3284 (= lt!3488 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3285 () Bool)

(assert (=> b!3285 (= e!2220 (array_inv!111 (buf!431 thiss!1486)))))

(assert (= (and start!892 res!4861) b!3279))

(assert (= (and b!3279 res!4860) b!3284))

(assert (= (and b!3284 res!4858) b!3282))

(assert (= (and b!3282 res!4856) b!3280))

(assert (= (and b!3280 res!4857) b!3283))

(assert (= (and b!3283 res!4859) b!3281))

(assert (= start!892 b!3285))

(declare-fun m!3451 () Bool)

(assert (=> b!3283 m!3451))

(declare-fun m!3453 () Bool)

(assert (=> b!3284 m!3453))

(declare-fun m!3455 () Bool)

(assert (=> b!3284 m!3455))

(declare-fun m!3457 () Bool)

(assert (=> b!3279 m!3457))

(declare-fun m!3459 () Bool)

(assert (=> start!892 m!3459))

(declare-fun m!3461 () Bool)

(assert (=> start!892 m!3461))

(declare-fun m!3463 () Bool)

(assert (=> b!3281 m!3463))

(declare-fun m!3465 () Bool)

(assert (=> b!3281 m!3465))

(declare-fun m!3467 () Bool)

(assert (=> b!3281 m!3467))

(declare-fun m!3469 () Bool)

(assert (=> b!3281 m!3469))

(declare-fun m!3471 () Bool)

(assert (=> b!3281 m!3471))

(declare-fun m!3473 () Bool)

(assert (=> b!3285 m!3473))

(declare-fun m!3475 () Bool)

(assert (=> b!3280 m!3475))

(declare-fun m!3477 () Bool)

(assert (=> b!3280 m!3477))

(check-sat (not b!3283) (not b!3281) (not start!892) (not b!3285) (not b!3284) (not b!3280) (not b!3279))
(check-sat)
(get-model)

(declare-fun d!1568 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1568 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 thiss!1486))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!116 (buf!431 thiss!1486))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486))) nBits!460))))

(declare-fun bs!590 () Bool)

(assert (= bs!590 d!1568))

(declare-fun m!3507 () Bool)

(assert (=> bs!590 m!3507))

(assert (=> b!3279 d!1568))

(declare-fun d!1570 () Bool)

(assert (=> d!1570 (= (invariant!0 (currentBit!1393 (_2!174 lt!3488)) (currentByte!1398 (_2!174 lt!3488)) (size!116 (buf!431 (_2!174 lt!3488)))) (and (bvsge (currentBit!1393 (_2!174 lt!3488)) #b00000000000000000000000000000000) (bvslt (currentBit!1393 (_2!174 lt!3488)) #b00000000000000000000000000001000) (bvsge (currentByte!1398 (_2!174 lt!3488)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1398 (_2!174 lt!3488)) (size!116 (buf!431 (_2!174 lt!3488)))) (and (= (currentBit!1393 (_2!174 lt!3488)) #b00000000000000000000000000000000) (= (currentByte!1398 (_2!174 lt!3488)) (size!116 (buf!431 (_2!174 lt!3488))))))))))

(assert (=> b!3284 d!1570))

(declare-fun b!3374 () Bool)

(declare-fun res!4933 () Bool)

(declare-fun e!2266 () Bool)

(assert (=> b!3374 (=> (not res!4933) (not e!2266))))

(declare-fun lt!3797 () tuple2!328)

(assert (=> b!3374 (= res!4933 (= (size!116 (buf!431 thiss!1486)) (size!116 (buf!431 (_2!174 lt!3797)))))))

(declare-fun d!1572 () Bool)

(assert (=> d!1572 e!2266))

(declare-fun res!4936 () Bool)

(assert (=> d!1572 (=> (not res!4936) (not e!2266))))

(declare-fun lt!3778 () (_ BitVec 64))

(assert (=> d!1572 (= res!4936 (= (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3797))) (currentByte!1398 (_2!174 lt!3797)) (currentBit!1393 (_2!174 lt!3797))) (bvsub lt!3778 from!367)))))

(assert (=> d!1572 (or (= (bvand lt!3778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3778 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3772 () (_ BitVec 64))

(assert (=> d!1572 (= lt!3778 (bvadd lt!3772 from!367 nBits!460))))

(assert (=> d!1572 (or (not (= (bvand lt!3772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3772 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1572 (= lt!3772 (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)))))

(declare-fun e!2267 () tuple2!328)

(assert (=> d!1572 (= lt!3797 e!2267)))

(declare-fun c!142 () Bool)

(assert (=> d!1572 (= c!142 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!3764 () Unit!234)

(declare-fun lt!3787 () Unit!234)

(assert (=> d!1572 (= lt!3764 lt!3787)))

(assert (=> d!1572 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!210) Unit!234)

(assert (=> d!1572 (= lt!3787 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!3791 () (_ BitVec 64))

(assert (=> d!1572 (= lt!3791 (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)))))

(assert (=> d!1572 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1572 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!3797)))

(declare-fun b!3375 () Bool)

(declare-fun e!2265 () Bool)

(declare-fun lt!3774 () (_ BitVec 64))

(assert (=> b!3375 (= e!2265 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 thiss!1486))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) lt!3774))))

(declare-fun b!3376 () Bool)

(declare-fun lt!3777 () tuple2!328)

(declare-fun Unit!238 () Unit!234)

(assert (=> b!3376 (= e!2267 (tuple2!329 Unit!238 (_2!174 lt!3777)))))

(declare-fun lt!3783 () tuple2!328)

(declare-fun appendBitFromByte!0 (BitStream!210 (_ BitVec 8) (_ BitVec 32)) tuple2!328)

(assert (=> b!3376 (= lt!3783 (appendBitFromByte!0 thiss!1486 (select (arr!503 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!3781 () (_ BitVec 64))

(assert (=> b!3376 (= lt!3781 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3782 () (_ BitVec 64))

(assert (=> b!3376 (= lt!3782 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3759 () Unit!234)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!210 BitStream!210 (_ BitVec 64) (_ BitVec 64)) Unit!234)

(assert (=> b!3376 (= lt!3759 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!174 lt!3783) lt!3781 lt!3782))))

(assert (=> b!3376 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3783)))) ((_ sign_extend 32) (currentByte!1398 (_2!174 lt!3783))) ((_ sign_extend 32) (currentBit!1393 (_2!174 lt!3783))) (bvsub lt!3781 lt!3782))))

(declare-fun lt!3760 () Unit!234)

(assert (=> b!3376 (= lt!3760 lt!3759)))

(declare-fun lt!3775 () tuple2!330)

(assert (=> b!3376 (= lt!3775 (reader!0 thiss!1486 (_2!174 lt!3783)))))

(declare-fun lt!3793 () (_ BitVec 64))

(assert (=> b!3376 (= lt!3793 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3800 () Unit!234)

(assert (=> b!3376 (= lt!3800 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!431 (_2!174 lt!3783)) lt!3793))))

(assert (=> b!3376 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3783)))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) lt!3793)))

(declare-fun lt!3795 () Unit!234)

(assert (=> b!3376 (= lt!3795 lt!3800)))

(declare-datatypes ((List!15 0))(
  ( (Nil!12) (Cons!11 (h!130 Bool) (t!765 List!15)) )
))
(declare-fun head!14 (List!15) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!210 array!281 (_ BitVec 64) (_ BitVec 64)) List!15)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!210 BitStream!210 (_ BitVec 64)) List!15)

(assert (=> b!3376 (= (head!14 (byteArrayBitContentToList!0 (_2!174 lt!3783) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!14 (bitStreamReadBitsIntoList!0 (_2!174 lt!3783) (_1!175 lt!3775) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3801 () Unit!234)

(declare-fun Unit!239 () Unit!234)

(assert (=> b!3376 (= lt!3801 Unit!239)))

(assert (=> b!3376 (= lt!3777 (appendBitsMSBFirstLoop!0 (_2!174 lt!3783) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!3771 () Unit!234)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!210 BitStream!210 BitStream!210) Unit!234)

(assert (=> b!3376 (= lt!3771 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!174 lt!3783) (_2!174 lt!3777)))))

(assert (=> b!3376 (isPrefixOf!0 thiss!1486 (_2!174 lt!3777))))

(declare-fun lt!3765 () Unit!234)

(assert (=> b!3376 (= lt!3765 lt!3771)))

(assert (=> b!3376 (= (size!116 (buf!431 (_2!174 lt!3777))) (size!116 (buf!431 thiss!1486)))))

(declare-fun lt!3768 () Unit!234)

(declare-fun Unit!240 () Unit!234)

(assert (=> b!3376 (= lt!3768 Unit!240)))

(assert (=> b!3376 (= (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3777))) (currentByte!1398 (_2!174 lt!3777)) (currentBit!1393 (_2!174 lt!3777))) (bvsub (bvadd (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!3784 () Unit!234)

(declare-fun Unit!241 () Unit!234)

(assert (=> b!3376 (= lt!3784 Unit!241)))

(assert (=> b!3376 (= (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3777))) (currentByte!1398 (_2!174 lt!3777)) (currentBit!1393 (_2!174 lt!3777))) (bvsub (bvsub (bvadd (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3783))) (currentByte!1398 (_2!174 lt!3783)) (currentBit!1393 (_2!174 lt!3783))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3792 () Unit!234)

(declare-fun Unit!242 () Unit!234)

(assert (=> b!3376 (= lt!3792 Unit!242)))

(declare-fun lt!3798 () tuple2!330)

(declare-fun call!32 () tuple2!330)

(assert (=> b!3376 (= lt!3798 call!32)))

(declare-fun lt!3780 () (_ BitVec 64))

(assert (=> b!3376 (= lt!3780 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3763 () Unit!234)

(assert (=> b!3376 (= lt!3763 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!431 (_2!174 lt!3777)) lt!3780))))

(assert (=> b!3376 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3777)))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) lt!3780)))

(declare-fun lt!3769 () Unit!234)

(assert (=> b!3376 (= lt!3769 lt!3763)))

(declare-fun lt!3790 () tuple2!330)

(assert (=> b!3376 (= lt!3790 (reader!0 (_2!174 lt!3783) (_2!174 lt!3777)))))

(declare-fun lt!3789 () (_ BitVec 64))

(assert (=> b!3376 (= lt!3789 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3802 () Unit!234)

(assert (=> b!3376 (= lt!3802 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!174 lt!3783) (buf!431 (_2!174 lt!3777)) lt!3789))))

(assert (=> b!3376 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3777)))) ((_ sign_extend 32) (currentByte!1398 (_2!174 lt!3783))) ((_ sign_extend 32) (currentBit!1393 (_2!174 lt!3783))) lt!3789)))

(declare-fun lt!3788 () Unit!234)

(assert (=> b!3376 (= lt!3788 lt!3802)))

(declare-fun lt!3786 () List!15)

(assert (=> b!3376 (= lt!3786 (byteArrayBitContentToList!0 (_2!174 lt!3777) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3776 () List!15)

(assert (=> b!3376 (= lt!3776 (byteArrayBitContentToList!0 (_2!174 lt!3777) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3773 () List!15)

(assert (=> b!3376 (= lt!3773 (bitStreamReadBitsIntoList!0 (_2!174 lt!3777) (_1!175 lt!3798) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3779 () List!15)

(assert (=> b!3376 (= lt!3779 (bitStreamReadBitsIntoList!0 (_2!174 lt!3777) (_1!175 lt!3790) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3794 () (_ BitVec 64))

(assert (=> b!3376 (= lt!3794 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3767 () Unit!234)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!210 BitStream!210 BitStream!210 BitStream!210 (_ BitVec 64) List!15) Unit!234)

(assert (=> b!3376 (= lt!3767 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!174 lt!3777) (_2!174 lt!3777) (_1!175 lt!3798) (_1!175 lt!3790) lt!3794 lt!3773))))

(declare-fun tail!22 (List!15) List!15)

(assert (=> b!3376 (= (bitStreamReadBitsIntoList!0 (_2!174 lt!3777) (_1!175 lt!3790) (bvsub lt!3794 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!22 lt!3773))))

(declare-fun lt!3758 () Unit!234)

(assert (=> b!3376 (= lt!3758 lt!3767)))

(declare-fun lt!3785 () Unit!234)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!281 array!281 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!234)

(assert (=> b!3376 (= lt!3785 (arrayBitRangesEqImpliesEq!0 (buf!431 (_2!174 lt!3783)) (buf!431 (_2!174 lt!3777)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!3791 (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3783))) (currentByte!1398 (_2!174 lt!3783)) (currentBit!1393 (_2!174 lt!3783)))))))

(declare-fun bitAt!0 (array!281 (_ BitVec 64)) Bool)

(assert (=> b!3376 (= (bitAt!0 (buf!431 (_2!174 lt!3783)) lt!3791) (bitAt!0 (buf!431 (_2!174 lt!3777)) lt!3791))))

(declare-fun lt!3766 () Unit!234)

(assert (=> b!3376 (= lt!3766 lt!3785)))

(declare-fun b!3377 () Bool)

(declare-fun Unit!243 () Unit!234)

(assert (=> b!3377 (= e!2267 (tuple2!329 Unit!243 thiss!1486))))

(assert (=> b!3377 (= (size!116 (buf!431 thiss!1486)) (size!116 (buf!431 thiss!1486)))))

(declare-fun lt!3799 () Unit!234)

(declare-fun Unit!244 () Unit!234)

(assert (=> b!3377 (= lt!3799 Unit!244)))

(declare-fun checkByteArrayBitContent!0 (BitStream!210 array!281 array!281 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3377 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!176 (readBits!0 (_1!175 call!32) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!3378 () Bool)

(declare-fun res!4938 () Bool)

(assert (=> b!3378 (=> (not res!4938) (not e!2266))))

(assert (=> b!3378 (= res!4938 (invariant!0 (currentBit!1393 (_2!174 lt!3797)) (currentByte!1398 (_2!174 lt!3797)) (size!116 (buf!431 (_2!174 lt!3797)))))))

(declare-fun b!3379 () Bool)

(declare-fun res!4937 () Bool)

(assert (=> b!3379 (=> (not res!4937) (not e!2266))))

(assert (=> b!3379 (= res!4937 (= (size!116 (buf!431 (_2!174 lt!3797))) (size!116 (buf!431 thiss!1486))))))

(declare-fun lt!3796 () tuple2!330)

(declare-fun b!3380 () Bool)

(assert (=> b!3380 (= e!2266 (= (bitStreamReadBitsIntoList!0 (_2!174 lt!3797) (_1!175 lt!3796) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!174 lt!3797) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3380 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3380 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3770 () Unit!234)

(declare-fun lt!3757 () Unit!234)

(assert (=> b!3380 (= lt!3770 lt!3757)))

(assert (=> b!3380 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3797)))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) lt!3774)))

(assert (=> b!3380 (= lt!3757 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!431 (_2!174 lt!3797)) lt!3774))))

(assert (=> b!3380 e!2265))

(declare-fun res!4935 () Bool)

(assert (=> b!3380 (=> (not res!4935) (not e!2265))))

(assert (=> b!3380 (= res!4935 (and (= (size!116 (buf!431 thiss!1486)) (size!116 (buf!431 (_2!174 lt!3797)))) (bvsge lt!3774 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3380 (= lt!3774 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3380 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3380 (= lt!3796 (reader!0 thiss!1486 (_2!174 lt!3797)))))

(declare-fun bm!29 () Bool)

(assert (=> bm!29 (= call!32 (reader!0 thiss!1486 (ite c!142 (_2!174 lt!3777) thiss!1486)))))

(declare-fun b!3381 () Bool)

(declare-fun res!4934 () Bool)

(assert (=> b!3381 (=> (not res!4934) (not e!2266))))

(assert (=> b!3381 (= res!4934 (isPrefixOf!0 thiss!1486 (_2!174 lt!3797)))))

(assert (= (and d!1572 c!142) b!3376))

(assert (= (and d!1572 (not c!142)) b!3377))

(assert (= (or b!3376 b!3377) bm!29))

(assert (= (and d!1572 res!4936) b!3378))

(assert (= (and b!3378 res!4938) b!3374))

(assert (= (and b!3374 res!4933) b!3381))

(assert (= (and b!3381 res!4934) b!3379))

(assert (= (and b!3379 res!4937) b!3380))

(assert (= (and b!3380 res!4935) b!3375))

(declare-fun m!3565 () Bool)

(assert (=> b!3375 m!3565))

(declare-fun m!3567 () Bool)

(assert (=> b!3378 m!3567))

(declare-fun m!3569 () Bool)

(assert (=> b!3381 m!3569))

(declare-fun m!3571 () Bool)

(assert (=> b!3377 m!3571))

(declare-fun m!3573 () Bool)

(assert (=> b!3377 m!3573))

(declare-fun m!3575 () Bool)

(assert (=> b!3380 m!3575))

(declare-fun m!3577 () Bool)

(assert (=> b!3380 m!3577))

(declare-fun m!3579 () Bool)

(assert (=> b!3380 m!3579))

(declare-fun m!3581 () Bool)

(assert (=> b!3380 m!3581))

(declare-fun m!3583 () Bool)

(assert (=> b!3380 m!3583))

(declare-fun m!3585 () Bool)

(assert (=> bm!29 m!3585))

(declare-fun m!3587 () Bool)

(assert (=> d!1572 m!3587))

(assert (=> d!1572 m!3477))

(declare-fun m!3589 () Bool)

(assert (=> d!1572 m!3589))

(declare-fun m!3591 () Bool)

(assert (=> d!1572 m!3591))

(declare-fun m!3593 () Bool)

(assert (=> b!3376 m!3593))

(declare-fun m!3595 () Bool)

(assert (=> b!3376 m!3595))

(declare-fun m!3597 () Bool)

(assert (=> b!3376 m!3597))

(declare-fun m!3599 () Bool)

(assert (=> b!3376 m!3599))

(declare-fun m!3601 () Bool)

(assert (=> b!3376 m!3601))

(declare-fun m!3603 () Bool)

(assert (=> b!3376 m!3603))

(assert (=> b!3376 m!3599))

(declare-fun m!3605 () Bool)

(assert (=> b!3376 m!3605))

(declare-fun m!3607 () Bool)

(assert (=> b!3376 m!3607))

(declare-fun m!3609 () Bool)

(assert (=> b!3376 m!3609))

(declare-fun m!3611 () Bool)

(assert (=> b!3376 m!3611))

(declare-fun m!3613 () Bool)

(assert (=> b!3376 m!3613))

(declare-fun m!3615 () Bool)

(assert (=> b!3376 m!3615))

(declare-fun m!3617 () Bool)

(assert (=> b!3376 m!3617))

(declare-fun m!3619 () Bool)

(assert (=> b!3376 m!3619))

(declare-fun m!3621 () Bool)

(assert (=> b!3376 m!3621))

(declare-fun m!3623 () Bool)

(assert (=> b!3376 m!3623))

(assert (=> b!3376 m!3477))

(declare-fun m!3625 () Bool)

(assert (=> b!3376 m!3625))

(declare-fun m!3627 () Bool)

(assert (=> b!3376 m!3627))

(declare-fun m!3629 () Bool)

(assert (=> b!3376 m!3629))

(assert (=> b!3376 m!3625))

(declare-fun m!3631 () Bool)

(assert (=> b!3376 m!3631))

(declare-fun m!3633 () Bool)

(assert (=> b!3376 m!3633))

(declare-fun m!3635 () Bool)

(assert (=> b!3376 m!3635))

(declare-fun m!3637 () Bool)

(assert (=> b!3376 m!3637))

(declare-fun m!3639 () Bool)

(assert (=> b!3376 m!3639))

(assert (=> b!3376 m!3635))

(declare-fun m!3641 () Bool)

(assert (=> b!3376 m!3641))

(declare-fun m!3643 () Bool)

(assert (=> b!3376 m!3643))

(assert (=> b!3376 m!3593))

(declare-fun m!3645 () Bool)

(assert (=> b!3376 m!3645))

(declare-fun m!3647 () Bool)

(assert (=> b!3376 m!3647))

(declare-fun m!3649 () Bool)

(assert (=> b!3376 m!3649))

(declare-fun m!3651 () Bool)

(assert (=> b!3376 m!3651))

(declare-fun m!3653 () Bool)

(assert (=> b!3376 m!3653))

(assert (=> b!3284 d!1572))

(declare-fun d!1602 () Bool)

(assert (=> d!1602 (= (array_inv!111 srcBuffer!6) (bvsge (size!116 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!892 d!1602))

(declare-fun d!1604 () Bool)

(assert (=> d!1604 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1393 thiss!1486) (currentByte!1398 thiss!1486) (size!116 (buf!431 thiss!1486))))))

(declare-fun bs!595 () Bool)

(assert (= bs!595 d!1604))

(declare-fun m!3655 () Bool)

(assert (=> bs!595 m!3655))

(assert (=> start!892 d!1604))

(declare-fun d!1606 () Bool)

(declare-fun res!4958 () Bool)

(declare-fun e!2277 () Bool)

(assert (=> d!1606 (=> (not res!4958) (not e!2277))))

(assert (=> d!1606 (= res!4958 (= (size!116 (buf!431 thiss!1486)) (size!116 (buf!431 (_2!174 lt!3488)))))))

(assert (=> d!1606 (= (isPrefixOf!0 thiss!1486 (_2!174 lt!3488)) e!2277)))

(declare-fun b!3400 () Bool)

(declare-fun res!4957 () Bool)

(assert (=> b!3400 (=> (not res!4957) (not e!2277))))

(assert (=> b!3400 (= res!4957 (bvsle (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)) (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3488))) (currentByte!1398 (_2!174 lt!3488)) (currentBit!1393 (_2!174 lt!3488)))))))

(declare-fun b!3401 () Bool)

(declare-fun e!2276 () Bool)

(assert (=> b!3401 (= e!2277 e!2276)))

(declare-fun res!4959 () Bool)

(assert (=> b!3401 (=> res!4959 e!2276)))

(assert (=> b!3401 (= res!4959 (= (size!116 (buf!431 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!3402 () Bool)

(declare-fun arrayBitRangesEq!0 (array!281 array!281 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3402 (= e!2276 (arrayBitRangesEq!0 (buf!431 thiss!1486) (buf!431 (_2!174 lt!3488)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486))))))

(assert (= (and d!1606 res!4958) b!3400))

(assert (= (and b!3400 res!4957) b!3401))

(assert (= (and b!3401 (not res!4959)) b!3402))

(assert (=> b!3400 m!3477))

(assert (=> b!3400 m!3475))

(assert (=> b!3402 m!3477))

(assert (=> b!3402 m!3477))

(declare-fun m!3657 () Bool)

(assert (=> b!3402 m!3657))

(assert (=> b!3283 d!1606))

(declare-fun d!1608 () Bool)

(assert (=> d!1608 (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3488)))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) nBits!460)))

(declare-fun lt!3837 () Unit!234)

(declare-fun choose!9 (BitStream!210 array!281 (_ BitVec 64) BitStream!210) Unit!234)

(assert (=> d!1608 (= lt!3837 (choose!9 thiss!1486 (buf!431 (_2!174 lt!3488)) nBits!460 (BitStream!211 (buf!431 (_2!174 lt!3488)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486))))))

(assert (=> d!1608 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!431 (_2!174 lt!3488)) nBits!460) lt!3837)))

(declare-fun bs!596 () Bool)

(assert (= bs!596 d!1608))

(assert (=> bs!596 m!3463))

(declare-fun m!3659 () Bool)

(assert (=> bs!596 m!3659))

(assert (=> b!3281 d!1608))

(declare-fun lt!3922 () tuple2!330)

(declare-fun lt!3941 () (_ BitVec 64))

(declare-fun e!2286 () Bool)

(declare-fun b!3421 () Bool)

(declare-fun lt!3936 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!210 (_ BitVec 64)) BitStream!210)

(assert (=> b!3421 (= e!2286 (= (_1!175 lt!3922) (withMovedBitIndex!0 (_2!175 lt!3922) (bvsub lt!3936 lt!3941))))))

(assert (=> b!3421 (or (= (bvand lt!3936 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3936 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3936 lt!3941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3421 (= lt!3941 (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3488))) (currentByte!1398 (_2!174 lt!3488)) (currentBit!1393 (_2!174 lt!3488))))))

(assert (=> b!3421 (= lt!3936 (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)))))

(declare-fun b!3422 () Bool)

(declare-fun e!2285 () Unit!234)

(declare-fun Unit!251 () Unit!234)

(assert (=> b!3422 (= e!2285 Unit!251)))

(declare-fun b!3423 () Bool)

(declare-fun res!4973 () Bool)

(assert (=> b!3423 (=> (not res!4973) (not e!2286))))

(assert (=> b!3423 (= res!4973 (isPrefixOf!0 (_2!175 lt!3922) (_2!174 lt!3488)))))

(declare-fun d!1610 () Bool)

(assert (=> d!1610 e!2286))

(declare-fun res!4972 () Bool)

(assert (=> d!1610 (=> (not res!4972) (not e!2286))))

(assert (=> d!1610 (= res!4972 (isPrefixOf!0 (_1!175 lt!3922) (_2!175 lt!3922)))))

(declare-fun lt!3926 () BitStream!210)

(assert (=> d!1610 (= lt!3922 (tuple2!331 lt!3926 (_2!174 lt!3488)))))

(declare-fun lt!3923 () Unit!234)

(declare-fun lt!3932 () Unit!234)

(assert (=> d!1610 (= lt!3923 lt!3932)))

(assert (=> d!1610 (isPrefixOf!0 lt!3926 (_2!174 lt!3488))))

(assert (=> d!1610 (= lt!3932 (lemmaIsPrefixTransitive!0 lt!3926 (_2!174 lt!3488) (_2!174 lt!3488)))))

(declare-fun lt!3924 () Unit!234)

(declare-fun lt!3935 () Unit!234)

(assert (=> d!1610 (= lt!3924 lt!3935)))

(assert (=> d!1610 (isPrefixOf!0 lt!3926 (_2!174 lt!3488))))

(assert (=> d!1610 (= lt!3935 (lemmaIsPrefixTransitive!0 lt!3926 thiss!1486 (_2!174 lt!3488)))))

(declare-fun lt!3927 () Unit!234)

(assert (=> d!1610 (= lt!3927 e!2285)))

(declare-fun c!146 () Bool)

(assert (=> d!1610 (= c!146 (not (= (size!116 (buf!431 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!3925 () Unit!234)

(declare-fun lt!3933 () Unit!234)

(assert (=> d!1610 (= lt!3925 lt!3933)))

(assert (=> d!1610 (isPrefixOf!0 (_2!174 lt!3488) (_2!174 lt!3488))))

(assert (=> d!1610 (= lt!3933 (lemmaIsPrefixRefl!0 (_2!174 lt!3488)))))

(declare-fun lt!3939 () Unit!234)

(declare-fun lt!3930 () Unit!234)

(assert (=> d!1610 (= lt!3939 lt!3930)))

(assert (=> d!1610 (= lt!3930 (lemmaIsPrefixRefl!0 (_2!174 lt!3488)))))

(declare-fun lt!3928 () Unit!234)

(declare-fun lt!3929 () Unit!234)

(assert (=> d!1610 (= lt!3928 lt!3929)))

(assert (=> d!1610 (isPrefixOf!0 lt!3926 lt!3926)))

(assert (=> d!1610 (= lt!3929 (lemmaIsPrefixRefl!0 lt!3926))))

(declare-fun lt!3940 () Unit!234)

(declare-fun lt!3934 () Unit!234)

(assert (=> d!1610 (= lt!3940 lt!3934)))

(assert (=> d!1610 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1610 (= lt!3934 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1610 (= lt!3926 (BitStream!211 (buf!431 (_2!174 lt!3488)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)))))

(assert (=> d!1610 (isPrefixOf!0 thiss!1486 (_2!174 lt!3488))))

(assert (=> d!1610 (= (reader!0 thiss!1486 (_2!174 lt!3488)) lt!3922)))

(declare-fun b!3424 () Bool)

(declare-fun lt!3937 () Unit!234)

(assert (=> b!3424 (= e!2285 lt!3937)))

(declare-fun lt!3931 () (_ BitVec 64))

(assert (=> b!3424 (= lt!3931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!3938 () (_ BitVec 64))

(assert (=> b!3424 (= lt!3938 (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!281 array!281 (_ BitVec 64) (_ BitVec 64)) Unit!234)

(assert (=> b!3424 (= lt!3937 (arrayBitRangesEqSymmetric!0 (buf!431 thiss!1486) (buf!431 (_2!174 lt!3488)) lt!3931 lt!3938))))

(assert (=> b!3424 (arrayBitRangesEq!0 (buf!431 (_2!174 lt!3488)) (buf!431 thiss!1486) lt!3931 lt!3938)))

(declare-fun b!3425 () Bool)

(declare-fun res!4974 () Bool)

(assert (=> b!3425 (=> (not res!4974) (not e!2286))))

(assert (=> b!3425 (= res!4974 (isPrefixOf!0 (_1!175 lt!3922) thiss!1486))))

(assert (= (and d!1610 c!146) b!3424))

(assert (= (and d!1610 (not c!146)) b!3422))

(assert (= (and d!1610 res!4972) b!3425))

(assert (= (and b!3425 res!4974) b!3423))

(assert (= (and b!3423 res!4973) b!3421))

(declare-fun m!3751 () Bool)

(assert (=> b!3425 m!3751))

(declare-fun m!3753 () Bool)

(assert (=> b!3423 m!3753))

(declare-fun m!3755 () Bool)

(assert (=> b!3421 m!3755))

(assert (=> b!3421 m!3475))

(assert (=> b!3421 m!3477))

(declare-fun m!3757 () Bool)

(assert (=> d!1610 m!3757))

(declare-fun m!3759 () Bool)

(assert (=> d!1610 m!3759))

(declare-fun m!3761 () Bool)

(assert (=> d!1610 m!3761))

(declare-fun m!3763 () Bool)

(assert (=> d!1610 m!3763))

(assert (=> d!1610 m!3591))

(assert (=> d!1610 m!3589))

(assert (=> d!1610 m!3451))

(declare-fun m!3765 () Bool)

(assert (=> d!1610 m!3765))

(declare-fun m!3767 () Bool)

(assert (=> d!1610 m!3767))

(declare-fun m!3769 () Bool)

(assert (=> d!1610 m!3769))

(declare-fun m!3771 () Bool)

(assert (=> d!1610 m!3771))

(assert (=> b!3424 m!3477))

(declare-fun m!3773 () Bool)

(assert (=> b!3424 m!3773))

(declare-fun m!3775 () Bool)

(assert (=> b!3424 m!3775))

(assert (=> b!3281 d!1610))

(declare-fun d!1616 () Bool)

(assert (=> d!1616 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_1!175 lt!3485)))) ((_ sign_extend 32) (currentByte!1398 (_1!175 lt!3485))) ((_ sign_extend 32) (currentBit!1393 (_1!175 lt!3485))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!116 (buf!431 (_1!175 lt!3485)))) ((_ sign_extend 32) (currentByte!1398 (_1!175 lt!3485))) ((_ sign_extend 32) (currentBit!1393 (_1!175 lt!3485)))) nBits!460))))

(declare-fun bs!597 () Bool)

(assert (= bs!597 d!1616))

(declare-fun m!3777 () Bool)

(assert (=> bs!597 m!3777))

(assert (=> b!3281 d!1616))

(declare-fun b!3451 () Bool)

(declare-fun res!5000 () Bool)

(declare-fun e!2292 () Bool)

(assert (=> b!3451 (=> (not res!5000) (not e!2292))))

(declare-fun lt!3995 () tuple2!332)

(assert (=> b!3451 (= res!5000 (bvsle (currentByte!1398 (_1!175 lt!3485)) (currentByte!1398 (_2!176 lt!3995))))))

(declare-fun b!3452 () Bool)

(declare-fun res!5003 () Bool)

(assert (=> b!3452 (=> (not res!5003) (not e!2292))))

(declare-fun lt!3992 () (_ BitVec 64))

(assert (=> b!3452 (= res!5003 (= (size!116 (_1!176 lt!3995)) ((_ extract 31 0) lt!3992)))))

(assert (=> b!3452 (and (bvslt lt!3992 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!3992 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!3994 () (_ BitVec 64))

(declare-fun lt!3989 () (_ BitVec 64))

(assert (=> b!3452 (= lt!3992 (bvsdiv lt!3994 lt!3989))))

(assert (=> b!3452 (and (not (= lt!3989 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!3994 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!3989 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3452 (= lt!3989 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!3988 () (_ BitVec 64))

(declare-fun lt!3987 () (_ BitVec 64))

(assert (=> b!3452 (= lt!3994 (bvsub lt!3988 lt!3987))))

(assert (=> b!3452 (or (= (bvand lt!3988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3987 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3988 lt!3987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3452 (= lt!3987 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3993 () (_ BitVec 64))

(assert (=> b!3452 (= lt!3988 (bvadd nBits!460 lt!3993))))

(assert (=> b!3452 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3993 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!3993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3452 (= lt!3993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!3453 () Bool)

(assert (=> b!3453 (= e!2292 (= (byteArrayBitContentToList!0 (_2!176 lt!3995) (_1!176 lt!3995) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!176 lt!3995) (_1!175 lt!3485) nBits!460)))))

(declare-fun d!1618 () Bool)

(assert (=> d!1618 e!2292))

(declare-fun res!5004 () Bool)

(assert (=> d!1618 (=> (not res!5004) (not e!2292))))

(assert (=> d!1618 (= res!5004 (= (buf!431 (_2!176 lt!3995)) (buf!431 (_1!175 lt!3485))))))

(declare-datatypes ((tuple3!20 0))(
  ( (tuple3!21 (_1!180 Unit!234) (_2!180 BitStream!210) (_3!10 array!281)) )
))
(declare-fun lt!3990 () tuple3!20)

(assert (=> d!1618 (= lt!3995 (tuple2!333 (_3!10 lt!3990) (_2!180 lt!3990)))))

(declare-fun readBitsLoop!0 (BitStream!210 (_ BitVec 64) array!281 (_ BitVec 64) (_ BitVec 64)) tuple3!20)

(assert (=> d!1618 (= lt!3990 (readBitsLoop!0 (_1!175 lt!3485) nBits!460 (array!282 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1618 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1618 (= (readBits!0 (_1!175 lt!3485) nBits!460) lt!3995)))

(declare-fun b!3454 () Bool)

(declare-fun res!5002 () Bool)

(assert (=> b!3454 (=> (not res!5002) (not e!2292))))

(assert (=> b!3454 (= res!5002 (invariant!0 (currentBit!1393 (_2!176 lt!3995)) (currentByte!1398 (_2!176 lt!3995)) (size!116 (buf!431 (_2!176 lt!3995)))))))

(declare-fun b!3455 () Bool)

(declare-fun res!5001 () Bool)

(assert (=> b!3455 (=> (not res!5001) (not e!2292))))

(declare-fun lt!3991 () (_ BitVec 64))

(assert (=> b!3455 (= res!5001 (= (bvadd lt!3991 nBits!460) (bitIndex!0 (size!116 (buf!431 (_2!176 lt!3995))) (currentByte!1398 (_2!176 lt!3995)) (currentBit!1393 (_2!176 lt!3995)))))))

(assert (=> b!3455 (or (not (= (bvand lt!3991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3991 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3455 (= lt!3991 (bitIndex!0 (size!116 (buf!431 (_1!175 lt!3485))) (currentByte!1398 (_1!175 lt!3485)) (currentBit!1393 (_1!175 lt!3485))))))

(assert (= (and d!1618 res!5004) b!3455))

(assert (= (and b!3455 res!5001) b!3454))

(assert (= (and b!3454 res!5002) b!3452))

(assert (= (and b!3452 res!5003) b!3451))

(assert (= (and b!3451 res!5000) b!3453))

(declare-fun m!3795 () Bool)

(assert (=> b!3453 m!3795))

(declare-fun m!3797 () Bool)

(assert (=> b!3453 m!3797))

(declare-fun m!3799 () Bool)

(assert (=> d!1618 m!3799))

(declare-fun m!3801 () Bool)

(assert (=> b!3454 m!3801))

(declare-fun m!3803 () Bool)

(assert (=> b!3455 m!3803))

(declare-fun m!3805 () Bool)

(assert (=> b!3455 m!3805))

(assert (=> b!3281 d!1618))

(declare-fun d!1626 () Bool)

(assert (=> d!1626 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3488)))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3488)))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486))) nBits!460))))

(declare-fun bs!600 () Bool)

(assert (= bs!600 d!1626))

(declare-fun m!3807 () Bool)

(assert (=> bs!600 m!3807))

(assert (=> b!3281 d!1626))

(declare-fun d!1628 () Bool)

(declare-fun e!2299 () Bool)

(assert (=> d!1628 e!2299))

(declare-fun res!5016 () Bool)

(assert (=> d!1628 (=> (not res!5016) (not e!2299))))

(declare-fun lt!4053 () (_ BitVec 64))

(declare-fun lt!4048 () (_ BitVec 64))

(declare-fun lt!4051 () (_ BitVec 64))

(assert (=> d!1628 (= res!5016 (= lt!4053 (bvsub lt!4051 lt!4048)))))

(assert (=> d!1628 (or (= (bvand lt!4051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4051 lt!4048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1628 (= lt!4048 (remainingBits!0 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3488)))) ((_ sign_extend 32) (currentByte!1398 (_2!174 lt!3488))) ((_ sign_extend 32) (currentBit!1393 (_2!174 lt!3488)))))))

(declare-fun lt!4050 () (_ BitVec 64))

(declare-fun lt!4052 () (_ BitVec 64))

(assert (=> d!1628 (= lt!4051 (bvmul lt!4050 lt!4052))))

(assert (=> d!1628 (or (= lt!4050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!4052 (bvsdiv (bvmul lt!4050 lt!4052) lt!4050)))))

(assert (=> d!1628 (= lt!4052 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1628 (= lt!4050 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3488)))))))

(assert (=> d!1628 (= lt!4053 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1398 (_2!174 lt!3488))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1393 (_2!174 lt!3488)))))))

(assert (=> d!1628 (invariant!0 (currentBit!1393 (_2!174 lt!3488)) (currentByte!1398 (_2!174 lt!3488)) (size!116 (buf!431 (_2!174 lt!3488))))))

(assert (=> d!1628 (= (bitIndex!0 (size!116 (buf!431 (_2!174 lt!3488))) (currentByte!1398 (_2!174 lt!3488)) (currentBit!1393 (_2!174 lt!3488))) lt!4053)))

(declare-fun b!3470 () Bool)

(declare-fun res!5015 () Bool)

(assert (=> b!3470 (=> (not res!5015) (not e!2299))))

(assert (=> b!3470 (= res!5015 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!4053))))

(declare-fun b!3471 () Bool)

(declare-fun lt!4049 () (_ BitVec 64))

(assert (=> b!3471 (= e!2299 (bvsle lt!4053 (bvmul lt!4049 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3471 (or (= lt!4049 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!4049 #b0000000000000000000000000000000000000000000000000000000000001000) lt!4049)))))

(assert (=> b!3471 (= lt!4049 ((_ sign_extend 32) (size!116 (buf!431 (_2!174 lt!3488)))))))

(assert (= (and d!1628 res!5016) b!3470))

(assert (= (and b!3470 res!5015) b!3471))

(declare-fun m!3809 () Bool)

(assert (=> d!1628 m!3809))

(assert (=> d!1628 m!3453))

(assert (=> b!3280 d!1628))

(declare-fun d!1630 () Bool)

(declare-fun e!2300 () Bool)

(assert (=> d!1630 e!2300))

(declare-fun res!5018 () Bool)

(assert (=> d!1630 (=> (not res!5018) (not e!2300))))

(declare-fun lt!4059 () (_ BitVec 64))

(declare-fun lt!4054 () (_ BitVec 64))

(declare-fun lt!4057 () (_ BitVec 64))

(assert (=> d!1630 (= res!5018 (= lt!4059 (bvsub lt!4057 lt!4054)))))

(assert (=> d!1630 (or (= (bvand lt!4057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4054 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4057 lt!4054) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1630 (= lt!4054 (remainingBits!0 ((_ sign_extend 32) (size!116 (buf!431 thiss!1486))) ((_ sign_extend 32) (currentByte!1398 thiss!1486)) ((_ sign_extend 32) (currentBit!1393 thiss!1486))))))

(declare-fun lt!4056 () (_ BitVec 64))

(declare-fun lt!4058 () (_ BitVec 64))

(assert (=> d!1630 (= lt!4057 (bvmul lt!4056 lt!4058))))

(assert (=> d!1630 (or (= lt!4056 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!4058 (bvsdiv (bvmul lt!4056 lt!4058) lt!4056)))))

(assert (=> d!1630 (= lt!4058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1630 (= lt!4056 ((_ sign_extend 32) (size!116 (buf!431 thiss!1486))))))

(assert (=> d!1630 (= lt!4059 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1398 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1393 thiss!1486))))))

(assert (=> d!1630 (invariant!0 (currentBit!1393 thiss!1486) (currentByte!1398 thiss!1486) (size!116 (buf!431 thiss!1486)))))

(assert (=> d!1630 (= (bitIndex!0 (size!116 (buf!431 thiss!1486)) (currentByte!1398 thiss!1486) (currentBit!1393 thiss!1486)) lt!4059)))

(declare-fun b!3472 () Bool)

(declare-fun res!5017 () Bool)

(assert (=> b!3472 (=> (not res!5017) (not e!2300))))

(assert (=> b!3472 (= res!5017 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!4059))))

(declare-fun b!3473 () Bool)

(declare-fun lt!4055 () (_ BitVec 64))

(assert (=> b!3473 (= e!2300 (bvsle lt!4059 (bvmul lt!4055 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3473 (or (= lt!4055 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!4055 #b0000000000000000000000000000000000000000000000000000000000001000) lt!4055)))))

(assert (=> b!3473 (= lt!4055 ((_ sign_extend 32) (size!116 (buf!431 thiss!1486))))))

(assert (= (and d!1630 res!5018) b!3472))

(assert (= (and b!3472 res!5017) b!3473))

(assert (=> d!1630 m!3507))

(assert (=> d!1630 m!3655))

(assert (=> b!3280 d!1630))

(declare-fun d!1632 () Bool)

(assert (=> d!1632 (= (array_inv!111 (buf!431 thiss!1486)) (bvsge (size!116 (buf!431 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!3285 d!1632))

(check-sat (not b!3377) (not b!3380) (not d!1568) (not d!1616) (not b!3425) (not d!1610) (not b!3376) (not b!3381) (not b!3424) (not b!3375) (not d!1618) (not d!1628) (not b!3453) (not d!1626) (not d!1604) (not d!1572) (not d!1608) (not b!3455) (not b!3454) (not b!3400) (not d!1630) (not b!3378) (not b!3423) (not b!3421) (not b!3402) (not bm!29))
(check-sat)

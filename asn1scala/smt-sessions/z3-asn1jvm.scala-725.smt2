; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20238 () Bool)

(assert start!20238)

(declare-fun res!83466 () Bool)

(declare-fun e!66424 () Bool)

(assert (=> start!20238 (=> (not res!83466) (not e!66424))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20238 (= res!83466 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20238 e!66424))

(assert (=> start!20238 true))

(declare-datatypes ((array!4769 0))(
  ( (array!4770 (arr!2770 (Array (_ BitVec 32) (_ BitVec 8))) (size!2177 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3828 0))(
  ( (BitStream!3829 (buf!2534 array!4769) (currentByte!5001 (_ BitVec 32)) (currentBit!4996 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3828)

(declare-fun e!66422 () Bool)

(declare-fun inv!12 (BitStream!3828) Bool)

(assert (=> start!20238 (and (inv!12 thiss!1305) e!66422)))

(declare-fun b!101565 () Bool)

(declare-fun e!66429 () Bool)

(declare-datatypes ((tuple2!8242 0))(
  ( (tuple2!8243 (_1!4376 BitStream!3828) (_2!4376 Bool)) )
))
(declare-fun lt!147375 () tuple2!8242)

(declare-fun lt!147374 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101565 (= e!66429 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147375))) (currentByte!5001 (_1!4376 lt!147375)) (currentBit!4996 (_1!4376 lt!147375))) lt!147374))))

(declare-fun b!101566 () Bool)

(declare-fun e!66428 () Bool)

(assert (=> b!101566 (= e!66424 e!66428)))

(declare-fun res!83465 () Bool)

(assert (=> b!101566 (=> (not res!83465) (not e!66428))))

(declare-fun lt!147370 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101566 (= res!83465 (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 thiss!1305))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305)) lt!147370))))

(assert (=> b!101566 (= lt!147370 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!101567 () Bool)

(declare-fun res!83472 () Bool)

(declare-fun e!66421 () Bool)

(assert (=> b!101567 (=> (not res!83472) (not e!66421))))

(declare-datatypes ((Unit!6226 0))(
  ( (Unit!6227) )
))
(declare-datatypes ((tuple2!8244 0))(
  ( (tuple2!8245 (_1!4377 Unit!6226) (_2!4377 BitStream!3828)) )
))
(declare-fun lt!147368 () tuple2!8244)

(declare-fun isPrefixOf!0 (BitStream!3828 BitStream!3828) Bool)

(assert (=> b!101567 (= res!83472 (isPrefixOf!0 thiss!1305 (_2!4377 lt!147368)))))

(declare-fun b!101568 () Bool)

(assert (=> b!101568 (= e!66421 e!66429)))

(declare-fun res!83469 () Bool)

(assert (=> b!101568 (=> (not res!83469) (not e!66429))))

(declare-fun lt!147371 () Bool)

(assert (=> b!101568 (= res!83469 (and (= (_2!4376 lt!147375) lt!147371) (= (_1!4376 lt!147375) (_2!4377 lt!147368))))))

(declare-fun readBitPure!0 (BitStream!3828) tuple2!8242)

(declare-fun readerFrom!0 (BitStream!3828 (_ BitVec 32) (_ BitVec 32)) BitStream!3828)

(assert (=> b!101568 (= lt!147375 (readBitPure!0 (readerFrom!0 (_2!4377 lt!147368) (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305))))))

(declare-fun b!101569 () Bool)

(declare-fun e!66426 () Bool)

(declare-fun lt!147381 () tuple2!8242)

(declare-fun lt!147373 () tuple2!8242)

(assert (=> b!101569 (= e!66426 (= (_2!4376 lt!147381) (_2!4376 lt!147373)))))

(declare-fun b!101570 () Bool)

(declare-fun res!83471 () Bool)

(assert (=> b!101570 (=> (not res!83471) (not e!66428))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101570 (= res!83471 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101571 () Bool)

(declare-fun res!83474 () Bool)

(assert (=> b!101571 (=> (not res!83474) (not e!66428))))

(assert (=> b!101571 (= res!83474 (bvslt i!615 nBits!396))))

(declare-fun b!101572 () Bool)

(declare-fun res!83467 () Bool)

(declare-fun e!66423 () Bool)

(assert (=> b!101572 (=> (not res!83467) (not e!66423))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101572 (= res!83467 (invariant!0 (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147368)))))))

(declare-fun b!101573 () Bool)

(declare-fun lt!147376 () tuple2!8244)

(assert (=> b!101573 (= e!66423 (invariant!0 (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147376)))))))

(declare-fun b!101574 () Bool)

(declare-datatypes ((tuple2!8246 0))(
  ( (tuple2!8247 (_1!4378 BitStream!3828) (_2!4378 BitStream!3828)) )
))
(declare-fun lt!147382 () tuple2!8246)

(assert (=> b!101574 (= e!66428 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4378 lt!147382)))) ((_ sign_extend 32) (currentByte!5001 (_1!4378 lt!147382))) ((_ sign_extend 32) (currentBit!4996 (_1!4378 lt!147382))) lt!147370)))))

(assert (=> b!101574 (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147376)))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305)) lt!147370)))

(declare-fun lt!147372 () Unit!6226)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3828 array!4769 (_ BitVec 64)) Unit!6226)

(assert (=> b!101574 (= lt!147372 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2534 (_2!4377 lt!147376)) lt!147370))))

(assert (=> b!101574 (= (_2!4376 (readBitPure!0 (_1!4378 lt!147382))) lt!147371)))

(declare-fun lt!147378 () tuple2!8246)

(declare-fun reader!0 (BitStream!3828 BitStream!3828) tuple2!8246)

(assert (=> b!101574 (= lt!147378 (reader!0 (_2!4377 lt!147368) (_2!4377 lt!147376)))))

(assert (=> b!101574 (= lt!147382 (reader!0 thiss!1305 (_2!4377 lt!147376)))))

(assert (=> b!101574 e!66426))

(declare-fun res!83473 () Bool)

(assert (=> b!101574 (=> (not res!83473) (not e!66426))))

(assert (=> b!101574 (= res!83473 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147381))) (currentByte!5001 (_1!4376 lt!147381)) (currentBit!4996 (_1!4376 lt!147381))) (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147373))) (currentByte!5001 (_1!4376 lt!147373)) (currentBit!4996 (_1!4376 lt!147373)))))))

(declare-fun lt!147369 () Unit!6226)

(declare-fun lt!147380 () BitStream!3828)

(declare-fun readBitPrefixLemma!0 (BitStream!3828 BitStream!3828) Unit!6226)

(assert (=> b!101574 (= lt!147369 (readBitPrefixLemma!0 lt!147380 (_2!4377 lt!147376)))))

(assert (=> b!101574 (= lt!147373 (readBitPure!0 (BitStream!3829 (buf!2534 (_2!4377 lt!147376)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305))))))

(assert (=> b!101574 (= lt!147381 (readBitPure!0 lt!147380))))

(assert (=> b!101574 (= lt!147380 (BitStream!3829 (buf!2534 (_2!4377 lt!147368)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)))))

(assert (=> b!101574 e!66423))

(declare-fun res!83464 () Bool)

(assert (=> b!101574 (=> (not res!83464) (not e!66423))))

(assert (=> b!101574 (= res!83464 (isPrefixOf!0 thiss!1305 (_2!4377 lt!147376)))))

(declare-fun lt!147379 () Unit!6226)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3828 BitStream!3828 BitStream!3828) Unit!6226)

(assert (=> b!101574 (= lt!147379 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4377 lt!147368) (_2!4377 lt!147376)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3828 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8244)

(assert (=> b!101574 (= lt!147376 (appendNLeastSignificantBitsLoop!0 (_2!4377 lt!147368) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66425 () Bool)

(assert (=> b!101574 e!66425))

(declare-fun res!83470 () Bool)

(assert (=> b!101574 (=> (not res!83470) (not e!66425))))

(assert (=> b!101574 (= res!83470 (= (size!2177 (buf!2534 thiss!1305)) (size!2177 (buf!2534 (_2!4377 lt!147368)))))))

(declare-fun appendBit!0 (BitStream!3828 Bool) tuple2!8244)

(assert (=> b!101574 (= lt!147368 (appendBit!0 thiss!1305 lt!147371))))

(assert (=> b!101574 (= lt!147371 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101575 () Bool)

(assert (=> b!101575 (= e!66425 e!66421)))

(declare-fun res!83468 () Bool)

(assert (=> b!101575 (=> (not res!83468) (not e!66421))))

(declare-fun lt!147377 () (_ BitVec 64))

(assert (=> b!101575 (= res!83468 (= lt!147374 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147377)))))

(assert (=> b!101575 (= lt!147374 (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))))))

(assert (=> b!101575 (= lt!147377 (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)))))

(declare-fun b!101576 () Bool)

(declare-fun array_inv!1979 (array!4769) Bool)

(assert (=> b!101576 (= e!66422 (array_inv!1979 (buf!2534 thiss!1305)))))

(assert (= (and start!20238 res!83466) b!101566))

(assert (= (and b!101566 res!83465) b!101570))

(assert (= (and b!101570 res!83471) b!101571))

(assert (= (and b!101571 res!83474) b!101574))

(assert (= (and b!101574 res!83470) b!101575))

(assert (= (and b!101575 res!83468) b!101567))

(assert (= (and b!101567 res!83472) b!101568))

(assert (= (and b!101568 res!83469) b!101565))

(assert (= (and b!101574 res!83464) b!101572))

(assert (= (and b!101572 res!83467) b!101573))

(assert (= (and b!101574 res!83473) b!101569))

(assert (= start!20238 b!101576))

(declare-fun m!147709 () Bool)

(assert (=> b!101573 m!147709))

(declare-fun m!147711 () Bool)

(assert (=> start!20238 m!147711))

(declare-fun m!147713 () Bool)

(assert (=> b!101570 m!147713))

(declare-fun m!147715 () Bool)

(assert (=> b!101576 m!147715))

(declare-fun m!147717 () Bool)

(assert (=> b!101568 m!147717))

(assert (=> b!101568 m!147717))

(declare-fun m!147719 () Bool)

(assert (=> b!101568 m!147719))

(declare-fun m!147721 () Bool)

(assert (=> b!101565 m!147721))

(declare-fun m!147723 () Bool)

(assert (=> b!101574 m!147723))

(declare-fun m!147725 () Bool)

(assert (=> b!101574 m!147725))

(declare-fun m!147727 () Bool)

(assert (=> b!101574 m!147727))

(declare-fun m!147729 () Bool)

(assert (=> b!101574 m!147729))

(declare-fun m!147731 () Bool)

(assert (=> b!101574 m!147731))

(declare-fun m!147733 () Bool)

(assert (=> b!101574 m!147733))

(declare-fun m!147735 () Bool)

(assert (=> b!101574 m!147735))

(declare-fun m!147737 () Bool)

(assert (=> b!101574 m!147737))

(declare-fun m!147739 () Bool)

(assert (=> b!101574 m!147739))

(declare-fun m!147741 () Bool)

(assert (=> b!101574 m!147741))

(declare-fun m!147743 () Bool)

(assert (=> b!101574 m!147743))

(declare-fun m!147745 () Bool)

(assert (=> b!101574 m!147745))

(declare-fun m!147747 () Bool)

(assert (=> b!101574 m!147747))

(declare-fun m!147749 () Bool)

(assert (=> b!101574 m!147749))

(declare-fun m!147751 () Bool)

(assert (=> b!101574 m!147751))

(declare-fun m!147753 () Bool)

(assert (=> b!101572 m!147753))

(declare-fun m!147755 () Bool)

(assert (=> b!101566 m!147755))

(declare-fun m!147757 () Bool)

(assert (=> b!101567 m!147757))

(declare-fun m!147759 () Bool)

(assert (=> b!101575 m!147759))

(declare-fun m!147761 () Bool)

(assert (=> b!101575 m!147761))

(check-sat (not b!101566) (not b!101570) (not b!101574) (not start!20238) (not b!101568) (not b!101573) (not b!101575) (not b!101565) (not b!101576) (not b!101567) (not b!101572))
(check-sat)
(get-model)

(declare-fun d!31676 () Bool)

(declare-fun res!83516 () Bool)

(declare-fun e!66461 () Bool)

(assert (=> d!31676 (=> (not res!83516) (not e!66461))))

(assert (=> d!31676 (= res!83516 (= (size!2177 (buf!2534 thiss!1305)) (size!2177 (buf!2534 (_2!4377 lt!147376)))))))

(assert (=> d!31676 (= (isPrefixOf!0 thiss!1305 (_2!4377 lt!147376)) e!66461)))

(declare-fun b!101619 () Bool)

(declare-fun res!83514 () Bool)

(assert (=> b!101619 (=> (not res!83514) (not e!66461))))

(assert (=> b!101619 (= res!83514 (bvsle (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)) (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147376))) (currentByte!5001 (_2!4377 lt!147376)) (currentBit!4996 (_2!4377 lt!147376)))))))

(declare-fun b!101620 () Bool)

(declare-fun e!66462 () Bool)

(assert (=> b!101620 (= e!66461 e!66462)))

(declare-fun res!83515 () Bool)

(assert (=> b!101620 (=> res!83515 e!66462)))

(assert (=> b!101620 (= res!83515 (= (size!2177 (buf!2534 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!101621 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4769 array!4769 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101621 (= e!66462 (arrayBitRangesEq!0 (buf!2534 thiss!1305) (buf!2534 (_2!4377 lt!147376)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305))))))

(assert (= (and d!31676 res!83516) b!101619))

(assert (= (and b!101619 res!83514) b!101620))

(assert (= (and b!101620 (not res!83515)) b!101621))

(assert (=> b!101619 m!147761))

(declare-fun m!147817 () Bool)

(assert (=> b!101619 m!147817))

(assert (=> b!101621 m!147761))

(assert (=> b!101621 m!147761))

(declare-fun m!147819 () Bool)

(assert (=> b!101621 m!147819))

(assert (=> b!101574 d!31676))

(declare-fun d!31678 () Bool)

(declare-fun e!66465 () Bool)

(assert (=> d!31678 e!66465))

(declare-fun res!83522 () Bool)

(assert (=> d!31678 (=> (not res!83522) (not e!66465))))

(declare-fun lt!147441 () (_ BitVec 64))

(declare-fun lt!147443 () (_ BitVec 64))

(declare-fun lt!147445 () (_ BitVec 64))

(assert (=> d!31678 (= res!83522 (= lt!147445 (bvsub lt!147441 lt!147443)))))

(assert (=> d!31678 (or (= (bvand lt!147441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147441 lt!147443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31678 (= lt!147443 (remainingBits!0 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147381)))) ((_ sign_extend 32) (currentByte!5001 (_1!4376 lt!147381))) ((_ sign_extend 32) (currentBit!4996 (_1!4376 lt!147381)))))))

(declare-fun lt!147440 () (_ BitVec 64))

(declare-fun lt!147442 () (_ BitVec 64))

(assert (=> d!31678 (= lt!147441 (bvmul lt!147440 lt!147442))))

(assert (=> d!31678 (or (= lt!147440 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147442 (bvsdiv (bvmul lt!147440 lt!147442) lt!147440)))))

(assert (=> d!31678 (= lt!147442 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31678 (= lt!147440 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147381)))))))

(assert (=> d!31678 (= lt!147445 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5001 (_1!4376 lt!147381))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4996 (_1!4376 lt!147381)))))))

(assert (=> d!31678 (invariant!0 (currentBit!4996 (_1!4376 lt!147381)) (currentByte!5001 (_1!4376 lt!147381)) (size!2177 (buf!2534 (_1!4376 lt!147381))))))

(assert (=> d!31678 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147381))) (currentByte!5001 (_1!4376 lt!147381)) (currentBit!4996 (_1!4376 lt!147381))) lt!147445)))

(declare-fun b!101626 () Bool)

(declare-fun res!83521 () Bool)

(assert (=> b!101626 (=> (not res!83521) (not e!66465))))

(assert (=> b!101626 (= res!83521 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147445))))

(declare-fun b!101627 () Bool)

(declare-fun lt!147444 () (_ BitVec 64))

(assert (=> b!101627 (= e!66465 (bvsle lt!147445 (bvmul lt!147444 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101627 (or (= lt!147444 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147444 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147444)))))

(assert (=> b!101627 (= lt!147444 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147381)))))))

(assert (= (and d!31678 res!83522) b!101626))

(assert (= (and b!101626 res!83521) b!101627))

(declare-fun m!147821 () Bool)

(assert (=> d!31678 m!147821))

(declare-fun m!147823 () Bool)

(assert (=> d!31678 m!147823))

(assert (=> b!101574 d!31678))

(declare-fun d!31680 () Bool)

(assert (=> d!31680 (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147376)))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305)) lt!147370)))

(declare-fun lt!147448 () Unit!6226)

(declare-fun choose!9 (BitStream!3828 array!4769 (_ BitVec 64) BitStream!3828) Unit!6226)

(assert (=> d!31680 (= lt!147448 (choose!9 thiss!1305 (buf!2534 (_2!4377 lt!147376)) lt!147370 (BitStream!3829 (buf!2534 (_2!4377 lt!147376)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305))))))

(assert (=> d!31680 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2534 (_2!4377 lt!147376)) lt!147370) lt!147448)))

(declare-fun bs!7765 () Bool)

(assert (= bs!7765 d!31680))

(assert (=> bs!7765 m!147733))

(declare-fun m!147825 () Bool)

(assert (=> bs!7765 m!147825))

(assert (=> b!101574 d!31680))

(declare-fun b!101639 () Bool)

(declare-fun e!66470 () Bool)

(declare-fun e!66471 () Bool)

(assert (=> b!101639 (= e!66470 e!66471)))

(declare-fun res!83531 () Bool)

(assert (=> b!101639 (=> (not res!83531) (not e!66471))))

(declare-fun lt!147457 () tuple2!8244)

(declare-fun lt!147459 () tuple2!8242)

(assert (=> b!101639 (= res!83531 (and (= (_2!4376 lt!147459) lt!147371) (= (_1!4376 lt!147459) (_2!4377 lt!147457))))))

(assert (=> b!101639 (= lt!147459 (readBitPure!0 (readerFrom!0 (_2!4377 lt!147457) (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305))))))

(declare-fun b!101637 () Bool)

(declare-fun res!83534 () Bool)

(assert (=> b!101637 (=> (not res!83534) (not e!66470))))

(declare-fun lt!147458 () (_ BitVec 64))

(declare-fun lt!147460 () (_ BitVec 64))

(assert (=> b!101637 (= res!83534 (= (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147457))) (currentByte!5001 (_2!4377 lt!147457)) (currentBit!4996 (_2!4377 lt!147457))) (bvadd lt!147460 lt!147458)))))

(assert (=> b!101637 (or (not (= (bvand lt!147460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147458 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!147460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!147460 lt!147458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101637 (= lt!147458 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!101637 (= lt!147460 (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)))))

(declare-fun b!101638 () Bool)

(declare-fun res!83532 () Bool)

(assert (=> b!101638 (=> (not res!83532) (not e!66470))))

(assert (=> b!101638 (= res!83532 (isPrefixOf!0 thiss!1305 (_2!4377 lt!147457)))))

(declare-fun b!101640 () Bool)

(assert (=> b!101640 (= e!66471 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147459))) (currentByte!5001 (_1!4376 lt!147459)) (currentBit!4996 (_1!4376 lt!147459))) (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147457))) (currentByte!5001 (_2!4377 lt!147457)) (currentBit!4996 (_2!4377 lt!147457)))))))

(declare-fun d!31682 () Bool)

(assert (=> d!31682 e!66470))

(declare-fun res!83533 () Bool)

(assert (=> d!31682 (=> (not res!83533) (not e!66470))))

(assert (=> d!31682 (= res!83533 (= (size!2177 (buf!2534 thiss!1305)) (size!2177 (buf!2534 (_2!4377 lt!147457)))))))

(declare-fun choose!16 (BitStream!3828 Bool) tuple2!8244)

(assert (=> d!31682 (= lt!147457 (choose!16 thiss!1305 lt!147371))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31682 (validate_offset_bit!0 ((_ sign_extend 32) (size!2177 (buf!2534 thiss!1305))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305)))))

(assert (=> d!31682 (= (appendBit!0 thiss!1305 lt!147371) lt!147457)))

(assert (= (and d!31682 res!83533) b!101637))

(assert (= (and b!101637 res!83534) b!101638))

(assert (= (and b!101638 res!83532) b!101639))

(assert (= (and b!101639 res!83531) b!101640))

(declare-fun m!147827 () Bool)

(assert (=> d!31682 m!147827))

(declare-fun m!147829 () Bool)

(assert (=> d!31682 m!147829))

(declare-fun m!147831 () Bool)

(assert (=> b!101640 m!147831))

(declare-fun m!147833 () Bool)

(assert (=> b!101640 m!147833))

(assert (=> b!101637 m!147833))

(assert (=> b!101637 m!147761))

(declare-fun m!147835 () Bool)

(assert (=> b!101638 m!147835))

(declare-fun m!147837 () Bool)

(assert (=> b!101639 m!147837))

(assert (=> b!101639 m!147837))

(declare-fun m!147839 () Bool)

(assert (=> b!101639 m!147839))

(assert (=> b!101574 d!31682))

(declare-fun d!31684 () Bool)

(assert (=> d!31684 (isPrefixOf!0 thiss!1305 (_2!4377 lt!147376))))

(declare-fun lt!147463 () Unit!6226)

(declare-fun choose!30 (BitStream!3828 BitStream!3828 BitStream!3828) Unit!6226)

(assert (=> d!31684 (= lt!147463 (choose!30 thiss!1305 (_2!4377 lt!147368) (_2!4377 lt!147376)))))

(assert (=> d!31684 (isPrefixOf!0 thiss!1305 (_2!4377 lt!147368))))

(assert (=> d!31684 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4377 lt!147368) (_2!4377 lt!147376)) lt!147463)))

(declare-fun bs!7766 () Bool)

(assert (= bs!7766 d!31684))

(assert (=> bs!7766 m!147727))

(declare-fun m!147841 () Bool)

(assert (=> bs!7766 m!147841))

(assert (=> bs!7766 m!147757))

(assert (=> b!101574 d!31684))

(declare-fun d!31686 () Bool)

(declare-fun e!66472 () Bool)

(assert (=> d!31686 e!66472))

(declare-fun res!83536 () Bool)

(assert (=> d!31686 (=> (not res!83536) (not e!66472))))

(declare-fun lt!147465 () (_ BitVec 64))

(declare-fun lt!147469 () (_ BitVec 64))

(declare-fun lt!147467 () (_ BitVec 64))

(assert (=> d!31686 (= res!83536 (= lt!147469 (bvsub lt!147465 lt!147467)))))

(assert (=> d!31686 (or (= (bvand lt!147465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147465 lt!147467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31686 (= lt!147467 (remainingBits!0 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147373)))) ((_ sign_extend 32) (currentByte!5001 (_1!4376 lt!147373))) ((_ sign_extend 32) (currentBit!4996 (_1!4376 lt!147373)))))))

(declare-fun lt!147464 () (_ BitVec 64))

(declare-fun lt!147466 () (_ BitVec 64))

(assert (=> d!31686 (= lt!147465 (bvmul lt!147464 lt!147466))))

(assert (=> d!31686 (or (= lt!147464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147466 (bvsdiv (bvmul lt!147464 lt!147466) lt!147464)))))

(assert (=> d!31686 (= lt!147466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31686 (= lt!147464 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147373)))))))

(assert (=> d!31686 (= lt!147469 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5001 (_1!4376 lt!147373))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4996 (_1!4376 lt!147373)))))))

(assert (=> d!31686 (invariant!0 (currentBit!4996 (_1!4376 lt!147373)) (currentByte!5001 (_1!4376 lt!147373)) (size!2177 (buf!2534 (_1!4376 lt!147373))))))

(assert (=> d!31686 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147373))) (currentByte!5001 (_1!4376 lt!147373)) (currentBit!4996 (_1!4376 lt!147373))) lt!147469)))

(declare-fun b!101641 () Bool)

(declare-fun res!83535 () Bool)

(assert (=> b!101641 (=> (not res!83535) (not e!66472))))

(assert (=> b!101641 (= res!83535 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147469))))

(declare-fun b!101642 () Bool)

(declare-fun lt!147468 () (_ BitVec 64))

(assert (=> b!101642 (= e!66472 (bvsle lt!147469 (bvmul lt!147468 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101642 (or (= lt!147468 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147468 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147468)))))

(assert (=> b!101642 (= lt!147468 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147373)))))))

(assert (= (and d!31686 res!83536) b!101641))

(assert (= (and b!101641 res!83535) b!101642))

(declare-fun m!147843 () Bool)

(assert (=> d!31686 m!147843))

(declare-fun m!147845 () Bool)

(assert (=> d!31686 m!147845))

(assert (=> b!101574 d!31686))

(declare-fun b!101731 () Bool)

(declare-fun e!66525 () (_ BitVec 64))

(assert (=> b!101731 (= e!66525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!101732 () Bool)

(declare-fun res!83613 () Bool)

(declare-fun e!66526 () Bool)

(assert (=> b!101732 (=> (not res!83613) (not e!66526))))

(declare-fun lt!147701 () (_ BitVec 64))

(declare-fun lt!147684 () tuple2!8244)

(declare-fun lt!147683 () (_ BitVec 64))

(assert (=> b!101732 (= res!83613 (= (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147684))) (currentByte!5001 (_2!4377 lt!147684)) (currentBit!4996 (_2!4377 lt!147684))) (bvadd lt!147701 lt!147683)))))

(assert (=> b!101732 (or (not (= (bvand lt!147701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147683 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!147701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!147701 lt!147683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101732 (= lt!147683 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!101732 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101732 (= lt!147701 (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))))))

(declare-fun b!101733 () Bool)

(declare-fun e!66524 () tuple2!8244)

(declare-fun lt!147713 () tuple2!8244)

(declare-fun Unit!6230 () Unit!6226)

(assert (=> b!101733 (= e!66524 (tuple2!8245 Unit!6230 (_2!4377 lt!147713)))))

(declare-fun lt!147695 () Bool)

(assert (=> b!101733 (= lt!147695 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!147708 () tuple2!8244)

(assert (=> b!101733 (= lt!147708 (appendBit!0 (_2!4377 lt!147368) lt!147695))))

(declare-fun res!83620 () Bool)

(assert (=> b!101733 (= res!83620 (= (size!2177 (buf!2534 (_2!4377 lt!147368))) (size!2177 (buf!2534 (_2!4377 lt!147708)))))))

(declare-fun e!66522 () Bool)

(assert (=> b!101733 (=> (not res!83620) (not e!66522))))

(assert (=> b!101733 e!66522))

(declare-fun lt!147702 () tuple2!8244)

(assert (=> b!101733 (= lt!147702 lt!147708)))

(assert (=> b!101733 (= lt!147713 (appendNLeastSignificantBitsLoop!0 (_2!4377 lt!147702) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!147704 () Unit!6226)

(assert (=> b!101733 (= lt!147704 (lemmaIsPrefixTransitive!0 (_2!4377 lt!147368) (_2!4377 lt!147702) (_2!4377 lt!147713)))))

(declare-fun call!1267 () Bool)

(assert (=> b!101733 call!1267))

(declare-fun lt!147688 () Unit!6226)

(assert (=> b!101733 (= lt!147688 lt!147704)))

(assert (=> b!101733 (invariant!0 (currentBit!4996 (_2!4377 lt!147368)) (currentByte!5001 (_2!4377 lt!147368)) (size!2177 (buf!2534 (_2!4377 lt!147702))))))

(declare-fun lt!147707 () BitStream!3828)

(assert (=> b!101733 (= lt!147707 (BitStream!3829 (buf!2534 (_2!4377 lt!147702)) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))))))

(assert (=> b!101733 (invariant!0 (currentBit!4996 lt!147707) (currentByte!5001 lt!147707) (size!2177 (buf!2534 (_2!4377 lt!147713))))))

(declare-fun lt!147720 () BitStream!3828)

(assert (=> b!101733 (= lt!147720 (BitStream!3829 (buf!2534 (_2!4377 lt!147713)) (currentByte!5001 lt!147707) (currentBit!4996 lt!147707)))))

(declare-fun lt!147709 () tuple2!8242)

(assert (=> b!101733 (= lt!147709 (readBitPure!0 lt!147707))))

(declare-fun lt!147681 () tuple2!8242)

(assert (=> b!101733 (= lt!147681 (readBitPure!0 lt!147720))))

(declare-fun lt!147719 () Unit!6226)

(assert (=> b!101733 (= lt!147719 (readBitPrefixLemma!0 lt!147707 (_2!4377 lt!147713)))))

(declare-fun res!83618 () Bool)

(assert (=> b!101733 (= res!83618 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147709))) (currentByte!5001 (_1!4376 lt!147709)) (currentBit!4996 (_1!4376 lt!147709))) (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147681))) (currentByte!5001 (_1!4376 lt!147681)) (currentBit!4996 (_1!4376 lt!147681)))))))

(declare-fun e!66523 () Bool)

(assert (=> b!101733 (=> (not res!83618) (not e!66523))))

(assert (=> b!101733 e!66523))

(declare-fun lt!147677 () Unit!6226)

(assert (=> b!101733 (= lt!147677 lt!147719)))

(declare-fun lt!147678 () tuple2!8246)

(assert (=> b!101733 (= lt!147678 (reader!0 (_2!4377 lt!147368) (_2!4377 lt!147713)))))

(declare-fun lt!147710 () tuple2!8246)

(assert (=> b!101733 (= lt!147710 (reader!0 (_2!4377 lt!147702) (_2!4377 lt!147713)))))

(declare-fun lt!147692 () tuple2!8242)

(assert (=> b!101733 (= lt!147692 (readBitPure!0 (_1!4378 lt!147678)))))

(assert (=> b!101733 (= (_2!4376 lt!147692) lt!147695)))

(declare-fun lt!147698 () Unit!6226)

(declare-fun Unit!6231 () Unit!6226)

(assert (=> b!101733 (= lt!147698 Unit!6231)))

(declare-fun lt!147700 () (_ BitVec 64))

(assert (=> b!101733 (= lt!147700 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!147691 () (_ BitVec 64))

(assert (=> b!101733 (= lt!147691 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!147706 () Unit!6226)

(assert (=> b!101733 (= lt!147706 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4377 lt!147368) (buf!2534 (_2!4377 lt!147713)) lt!147691))))

(assert (=> b!101733 (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147713)))) ((_ sign_extend 32) (currentByte!5001 (_2!4377 lt!147368))) ((_ sign_extend 32) (currentBit!4996 (_2!4377 lt!147368))) lt!147691)))

(declare-fun lt!147680 () Unit!6226)

(assert (=> b!101733 (= lt!147680 lt!147706)))

(declare-datatypes ((tuple2!8254 0))(
  ( (tuple2!8255 (_1!4382 BitStream!3828) (_2!4382 (_ BitVec 64))) )
))
(declare-fun lt!147718 () tuple2!8254)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8254)

(assert (=> b!101733 (= lt!147718 (readNLeastSignificantBitsLoopPure!0 (_1!4378 lt!147678) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!147700))))

(declare-fun lt!147717 () (_ BitVec 64))

(assert (=> b!101733 (= lt!147717 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!147690 () Unit!6226)

(assert (=> b!101733 (= lt!147690 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4377 lt!147702) (buf!2534 (_2!4377 lt!147713)) lt!147717))))

(assert (=> b!101733 (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147713)))) ((_ sign_extend 32) (currentByte!5001 (_2!4377 lt!147702))) ((_ sign_extend 32) (currentBit!4996 (_2!4377 lt!147702))) lt!147717)))

(declare-fun lt!147714 () Unit!6226)

(assert (=> b!101733 (= lt!147714 lt!147690)))

(declare-fun lt!147721 () tuple2!8254)

(assert (=> b!101733 (= lt!147721 (readNLeastSignificantBitsLoopPure!0 (_1!4378 lt!147710) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!147700 (ite (_2!4376 lt!147692) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!147686 () tuple2!8254)

(assert (=> b!101733 (= lt!147686 (readNLeastSignificantBitsLoopPure!0 (_1!4378 lt!147678) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!147700))))

(declare-fun c!6334 () Bool)

(assert (=> b!101733 (= c!6334 (_2!4376 (readBitPure!0 (_1!4378 lt!147678))))))

(declare-fun lt!147699 () tuple2!8254)

(declare-fun withMovedBitIndex!0 (BitStream!3828 (_ BitVec 64)) BitStream!3828)

(assert (=> b!101733 (= lt!147699 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4378 lt!147678) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!147700 e!66525)))))

(declare-fun lt!147705 () Unit!6226)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6226)

(assert (=> b!101733 (= lt!147705 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4378 lt!147678) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!147700))))

(assert (=> b!101733 (and (= (_2!4382 lt!147686) (_2!4382 lt!147699)) (= (_1!4382 lt!147686) (_1!4382 lt!147699)))))

(declare-fun lt!147694 () Unit!6226)

(assert (=> b!101733 (= lt!147694 lt!147705)))

(assert (=> b!101733 (= (_1!4378 lt!147678) (withMovedBitIndex!0 (_2!4378 lt!147678) (bvsub (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))) (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147713))) (currentByte!5001 (_2!4377 lt!147713)) (currentBit!4996 (_2!4377 lt!147713))))))))

(declare-fun lt!147712 () Unit!6226)

(declare-fun Unit!6232 () Unit!6226)

(assert (=> b!101733 (= lt!147712 Unit!6232)))

(assert (=> b!101733 (= (_1!4378 lt!147710) (withMovedBitIndex!0 (_2!4378 lt!147710) (bvsub (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147702))) (currentByte!5001 (_2!4377 lt!147702)) (currentBit!4996 (_2!4377 lt!147702))) (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147713))) (currentByte!5001 (_2!4377 lt!147713)) (currentBit!4996 (_2!4377 lt!147713))))))))

(declare-fun lt!147693 () Unit!6226)

(declare-fun Unit!6233 () Unit!6226)

(assert (=> b!101733 (= lt!147693 Unit!6233)))

(assert (=> b!101733 (= (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))) (bvsub (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147702))) (currentByte!5001 (_2!4377 lt!147702)) (currentBit!4996 (_2!4377 lt!147702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!147703 () Unit!6226)

(declare-fun Unit!6234 () Unit!6226)

(assert (=> b!101733 (= lt!147703 Unit!6234)))

(assert (=> b!101733 (= (_2!4382 lt!147718) (_2!4382 lt!147721))))

(declare-fun lt!147685 () Unit!6226)

(declare-fun Unit!6235 () Unit!6226)

(assert (=> b!101733 (= lt!147685 Unit!6235)))

(assert (=> b!101733 (= (_1!4382 lt!147718) (_2!4378 lt!147678))))

(declare-fun b!101734 () Bool)

(declare-fun e!66527 () Bool)

(declare-fun lt!147689 () (_ BitVec 64))

(assert (=> b!101734 (= e!66527 (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147368)))) ((_ sign_extend 32) (currentByte!5001 (_2!4377 lt!147368))) ((_ sign_extend 32) (currentBit!4996 (_2!4377 lt!147368))) lt!147689))))

(declare-fun b!101735 () Bool)

(declare-fun lt!147687 () tuple2!8242)

(assert (=> b!101735 (= lt!147687 (readBitPure!0 (readerFrom!0 (_2!4377 lt!147708) (currentBit!4996 (_2!4377 lt!147368)) (currentByte!5001 (_2!4377 lt!147368)))))))

(declare-fun res!83619 () Bool)

(assert (=> b!101735 (= res!83619 (and (= (_2!4376 lt!147687) lt!147695) (= (_1!4376 lt!147687) (_2!4377 lt!147708))))))

(declare-fun e!66528 () Bool)

(assert (=> b!101735 (=> (not res!83619) (not e!66528))))

(assert (=> b!101735 (= e!66522 e!66528)))

(declare-fun b!101736 () Bool)

(declare-fun res!83612 () Bool)

(assert (=> b!101736 (= res!83612 (isPrefixOf!0 (_2!4377 lt!147368) (_2!4377 lt!147708)))))

(assert (=> b!101736 (=> (not res!83612) (not e!66522))))

(declare-fun b!101737 () Bool)

(assert (=> b!101737 (= e!66523 (= (_2!4376 lt!147709) (_2!4376 lt!147681)))))

(declare-fun lt!147697 () BitStream!3828)

(declare-fun bm!1264 () Bool)

(declare-fun c!6335 () Bool)

(assert (=> bm!1264 (= call!1267 (isPrefixOf!0 (ite c!6335 (_2!4377 lt!147368) lt!147697) (ite c!6335 (_2!4377 lt!147713) lt!147697)))))

(declare-fun b!101738 () Bool)

(declare-fun res!83615 () Bool)

(assert (=> b!101738 (= res!83615 (= (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147708))) (currentByte!5001 (_2!4377 lt!147708)) (currentBit!4996 (_2!4377 lt!147708))) (bvadd (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!101738 (=> (not res!83615) (not e!66522))))

(declare-fun d!31688 () Bool)

(assert (=> d!31688 e!66526))

(declare-fun res!83617 () Bool)

(assert (=> d!31688 (=> (not res!83617) (not e!66526))))

(assert (=> d!31688 (= res!83617 (= (size!2177 (buf!2534 (_2!4377 lt!147368))) (size!2177 (buf!2534 (_2!4377 lt!147684)))))))

(assert (=> d!31688 (= lt!147684 e!66524)))

(assert (=> d!31688 (= c!6335 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31688 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31688 (= (appendNLeastSignificantBitsLoop!0 (_2!4377 lt!147368) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!147684)))

(declare-fun b!101739 () Bool)

(declare-fun res!83614 () Bool)

(assert (=> b!101739 (=> (not res!83614) (not e!66526))))

(assert (=> b!101739 (= res!83614 (isPrefixOf!0 (_2!4377 lt!147368) (_2!4377 lt!147684)))))

(declare-fun b!101740 () Bool)

(assert (=> b!101740 (= e!66525 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!101741 () Bool)

(declare-fun lt!147696 () Unit!6226)

(assert (=> b!101741 (= e!66524 (tuple2!8245 lt!147696 (_2!4377 lt!147368)))))

(assert (=> b!101741 (= lt!147697 (_2!4377 lt!147368))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3828) Unit!6226)

(assert (=> b!101741 (= lt!147696 (lemmaIsPrefixRefl!0 lt!147697))))

(assert (=> b!101741 call!1267))

(declare-fun lt!147715 () tuple2!8246)

(declare-fun b!101742 () Bool)

(declare-fun lt!147679 () tuple2!8254)

(assert (=> b!101742 (= e!66526 (and (= (_2!4382 lt!147679) v!199) (= (_1!4382 lt!147679) (_2!4378 lt!147715))))))

(declare-fun lt!147711 () (_ BitVec 64))

(assert (=> b!101742 (= lt!147679 (readNLeastSignificantBitsLoopPure!0 (_1!4378 lt!147715) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!147711))))

(declare-fun lt!147716 () Unit!6226)

(declare-fun lt!147682 () Unit!6226)

(assert (=> b!101742 (= lt!147716 lt!147682)))

(assert (=> b!101742 (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147684)))) ((_ sign_extend 32) (currentByte!5001 (_2!4377 lt!147368))) ((_ sign_extend 32) (currentBit!4996 (_2!4377 lt!147368))) lt!147689)))

(assert (=> b!101742 (= lt!147682 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4377 lt!147368) (buf!2534 (_2!4377 lt!147684)) lt!147689))))

(assert (=> b!101742 e!66527))

(declare-fun res!83616 () Bool)

(assert (=> b!101742 (=> (not res!83616) (not e!66527))))

(assert (=> b!101742 (= res!83616 (and (= (size!2177 (buf!2534 (_2!4377 lt!147368))) (size!2177 (buf!2534 (_2!4377 lt!147684)))) (bvsge lt!147689 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101742 (= lt!147689 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!101742 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101742 (= lt!147711 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!101742 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101742 (= lt!147715 (reader!0 (_2!4377 lt!147368) (_2!4377 lt!147684)))))

(declare-fun b!101743 () Bool)

(assert (=> b!101743 (= e!66528 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147687))) (currentByte!5001 (_1!4376 lt!147687)) (currentBit!4996 (_1!4376 lt!147687))) (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147708))) (currentByte!5001 (_2!4377 lt!147708)) (currentBit!4996 (_2!4377 lt!147708)))))))

(assert (= (and d!31688 c!6335) b!101733))

(assert (= (and d!31688 (not c!6335)) b!101741))

(assert (= (and b!101733 res!83620) b!101738))

(assert (= (and b!101738 res!83615) b!101736))

(assert (= (and b!101736 res!83612) b!101735))

(assert (= (and b!101735 res!83619) b!101743))

(assert (= (and b!101733 res!83618) b!101737))

(assert (= (and b!101733 c!6334) b!101740))

(assert (= (and b!101733 (not c!6334)) b!101731))

(assert (= (or b!101733 b!101741) bm!1264))

(assert (= (and d!31688 res!83617) b!101732))

(assert (= (and b!101732 res!83613) b!101739))

(assert (= (and b!101739 res!83614) b!101742))

(assert (= (and b!101742 res!83616) b!101734))

(declare-fun m!147927 () Bool)

(assert (=> b!101738 m!147927))

(assert (=> b!101738 m!147759))

(declare-fun m!147929 () Bool)

(assert (=> b!101743 m!147929))

(assert (=> b!101743 m!147927))

(declare-fun m!147931 () Bool)

(assert (=> b!101741 m!147931))

(declare-fun m!147933 () Bool)

(assert (=> b!101732 m!147933))

(assert (=> b!101732 m!147759))

(declare-fun m!147935 () Bool)

(assert (=> b!101742 m!147935))

(declare-fun m!147937 () Bool)

(assert (=> b!101742 m!147937))

(declare-fun m!147939 () Bool)

(assert (=> b!101742 m!147939))

(declare-fun m!147941 () Bool)

(assert (=> b!101742 m!147941))

(declare-fun m!147943 () Bool)

(assert (=> b!101742 m!147943))

(declare-fun m!147945 () Bool)

(assert (=> bm!1264 m!147945))

(declare-fun m!147947 () Bool)

(assert (=> b!101739 m!147947))

(declare-fun m!147949 () Bool)

(assert (=> b!101734 m!147949))

(declare-fun m!147951 () Bool)

(assert (=> b!101736 m!147951))

(declare-fun m!147953 () Bool)

(assert (=> b!101733 m!147953))

(declare-fun m!147955 () Bool)

(assert (=> b!101733 m!147955))

(declare-fun m!147957 () Bool)

(assert (=> b!101733 m!147957))

(assert (=> b!101733 m!147955))

(declare-fun m!147959 () Bool)

(assert (=> b!101733 m!147959))

(declare-fun m!147961 () Bool)

(assert (=> b!101733 m!147961))

(declare-fun m!147963 () Bool)

(assert (=> b!101733 m!147963))

(declare-fun m!147965 () Bool)

(assert (=> b!101733 m!147965))

(assert (=> b!101733 m!147939))

(declare-fun m!147967 () Bool)

(assert (=> b!101733 m!147967))

(declare-fun m!147969 () Bool)

(assert (=> b!101733 m!147969))

(declare-fun m!147971 () Bool)

(assert (=> b!101733 m!147971))

(declare-fun m!147973 () Bool)

(assert (=> b!101733 m!147973))

(declare-fun m!147975 () Bool)

(assert (=> b!101733 m!147975))

(declare-fun m!147977 () Bool)

(assert (=> b!101733 m!147977))

(declare-fun m!147979 () Bool)

(assert (=> b!101733 m!147979))

(assert (=> b!101733 m!147759))

(declare-fun m!147981 () Bool)

(assert (=> b!101733 m!147981))

(declare-fun m!147983 () Bool)

(assert (=> b!101733 m!147983))

(declare-fun m!147985 () Bool)

(assert (=> b!101733 m!147985))

(declare-fun m!147987 () Bool)

(assert (=> b!101733 m!147987))

(declare-fun m!147989 () Bool)

(assert (=> b!101733 m!147989))

(declare-fun m!147991 () Bool)

(assert (=> b!101733 m!147991))

(declare-fun m!147993 () Bool)

(assert (=> b!101733 m!147993))

(declare-fun m!147995 () Bool)

(assert (=> b!101733 m!147995))

(declare-fun m!147997 () Bool)

(assert (=> b!101733 m!147997))

(declare-fun m!147999 () Bool)

(assert (=> b!101733 m!147999))

(declare-fun m!148001 () Bool)

(assert (=> b!101733 m!148001))

(declare-fun m!148003 () Bool)

(assert (=> b!101733 m!148003))

(declare-fun m!148005 () Bool)

(assert (=> b!101735 m!148005))

(assert (=> b!101735 m!148005))

(declare-fun m!148007 () Bool)

(assert (=> b!101735 m!148007))

(assert (=> b!101574 d!31688))

(declare-fun d!31744 () Bool)

(declare-fun e!66531 () Bool)

(assert (=> d!31744 e!66531))

(declare-fun res!83623 () Bool)

(assert (=> d!31744 (=> (not res!83623) (not e!66531))))

(declare-fun lt!147730 () tuple2!8242)

(declare-fun lt!147731 () tuple2!8242)

(assert (=> d!31744 (= res!83623 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147730))) (currentByte!5001 (_1!4376 lt!147730)) (currentBit!4996 (_1!4376 lt!147730))) (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147731))) (currentByte!5001 (_1!4376 lt!147731)) (currentBit!4996 (_1!4376 lt!147731)))))))

(declare-fun lt!147733 () BitStream!3828)

(declare-fun lt!147732 () Unit!6226)

(declare-fun choose!50 (BitStream!3828 BitStream!3828 BitStream!3828 tuple2!8242 tuple2!8242 BitStream!3828 Bool tuple2!8242 tuple2!8242 BitStream!3828 Bool) Unit!6226)

(assert (=> d!31744 (= lt!147732 (choose!50 lt!147380 (_2!4377 lt!147376) lt!147733 lt!147730 (tuple2!8243 (_1!4376 lt!147730) (_2!4376 lt!147730)) (_1!4376 lt!147730) (_2!4376 lt!147730) lt!147731 (tuple2!8243 (_1!4376 lt!147731) (_2!4376 lt!147731)) (_1!4376 lt!147731) (_2!4376 lt!147731)))))

(assert (=> d!31744 (= lt!147731 (readBitPure!0 lt!147733))))

(assert (=> d!31744 (= lt!147730 (readBitPure!0 lt!147380))))

(assert (=> d!31744 (= lt!147733 (BitStream!3829 (buf!2534 (_2!4377 lt!147376)) (currentByte!5001 lt!147380) (currentBit!4996 lt!147380)))))

(assert (=> d!31744 (invariant!0 (currentBit!4996 lt!147380) (currentByte!5001 lt!147380) (size!2177 (buf!2534 (_2!4377 lt!147376))))))

(assert (=> d!31744 (= (readBitPrefixLemma!0 lt!147380 (_2!4377 lt!147376)) lt!147732)))

(declare-fun b!101746 () Bool)

(assert (=> b!101746 (= e!66531 (= (_2!4376 lt!147730) (_2!4376 lt!147731)))))

(assert (= (and d!31744 res!83623) b!101746))

(declare-fun m!148009 () Bool)

(assert (=> d!31744 m!148009))

(declare-fun m!148011 () Bool)

(assert (=> d!31744 m!148011))

(declare-fun m!148013 () Bool)

(assert (=> d!31744 m!148013))

(declare-fun m!148015 () Bool)

(assert (=> d!31744 m!148015))

(assert (=> d!31744 m!147729))

(declare-fun m!148017 () Bool)

(assert (=> d!31744 m!148017))

(assert (=> b!101574 d!31744))

(declare-fun d!31746 () Bool)

(assert (=> d!31746 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4378 lt!147382)))) ((_ sign_extend 32) (currentByte!5001 (_1!4378 lt!147382))) ((_ sign_extend 32) (currentBit!4996 (_1!4378 lt!147382))) lt!147370) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4378 lt!147382)))) ((_ sign_extend 32) (currentByte!5001 (_1!4378 lt!147382))) ((_ sign_extend 32) (currentBit!4996 (_1!4378 lt!147382)))) lt!147370))))

(declare-fun bs!7777 () Bool)

(assert (= bs!7777 d!31746))

(declare-fun m!148019 () Bool)

(assert (=> bs!7777 m!148019))

(assert (=> b!101574 d!31746))

(declare-fun d!31748 () Bool)

(declare-datatypes ((tuple2!8256 0))(
  ( (tuple2!8257 (_1!4383 Bool) (_2!4383 BitStream!3828)) )
))
(declare-fun lt!147736 () tuple2!8256)

(declare-fun readBit!0 (BitStream!3828) tuple2!8256)

(assert (=> d!31748 (= lt!147736 (readBit!0 (_1!4378 lt!147382)))))

(assert (=> d!31748 (= (readBitPure!0 (_1!4378 lt!147382)) (tuple2!8243 (_2!4383 lt!147736) (_1!4383 lt!147736)))))

(declare-fun bs!7778 () Bool)

(assert (= bs!7778 d!31748))

(declare-fun m!148021 () Bool)

(assert (=> bs!7778 m!148021))

(assert (=> b!101574 d!31748))

(declare-fun b!101757 () Bool)

(declare-fun res!83632 () Bool)

(declare-fun e!66536 () Bool)

(assert (=> b!101757 (=> (not res!83632) (not e!66536))))

(declare-fun lt!147781 () tuple2!8246)

(assert (=> b!101757 (= res!83632 (isPrefixOf!0 (_1!4378 lt!147781) (_2!4377 lt!147368)))))

(declare-fun b!101758 () Bool)

(declare-fun res!83631 () Bool)

(assert (=> b!101758 (=> (not res!83631) (not e!66536))))

(assert (=> b!101758 (= res!83631 (isPrefixOf!0 (_2!4378 lt!147781) (_2!4377 lt!147376)))))

(declare-fun lt!147784 () (_ BitVec 64))

(declare-fun lt!147786 () (_ BitVec 64))

(declare-fun b!101759 () Bool)

(assert (=> b!101759 (= e!66536 (= (_1!4378 lt!147781) (withMovedBitIndex!0 (_2!4378 lt!147781) (bvsub lt!147786 lt!147784))))))

(assert (=> b!101759 (or (= (bvand lt!147786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147786 lt!147784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101759 (= lt!147784 (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147376))) (currentByte!5001 (_2!4377 lt!147376)) (currentBit!4996 (_2!4377 lt!147376))))))

(assert (=> b!101759 (= lt!147786 (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))))))

(declare-fun d!31750 () Bool)

(assert (=> d!31750 e!66536))

(declare-fun res!83630 () Bool)

(assert (=> d!31750 (=> (not res!83630) (not e!66536))))

(assert (=> d!31750 (= res!83630 (isPrefixOf!0 (_1!4378 lt!147781) (_2!4378 lt!147781)))))

(declare-fun lt!147789 () BitStream!3828)

(assert (=> d!31750 (= lt!147781 (tuple2!8247 lt!147789 (_2!4377 lt!147376)))))

(declare-fun lt!147779 () Unit!6226)

(declare-fun lt!147795 () Unit!6226)

(assert (=> d!31750 (= lt!147779 lt!147795)))

(assert (=> d!31750 (isPrefixOf!0 lt!147789 (_2!4377 lt!147376))))

(assert (=> d!31750 (= lt!147795 (lemmaIsPrefixTransitive!0 lt!147789 (_2!4377 lt!147376) (_2!4377 lt!147376)))))

(declare-fun lt!147792 () Unit!6226)

(declare-fun lt!147790 () Unit!6226)

(assert (=> d!31750 (= lt!147792 lt!147790)))

(assert (=> d!31750 (isPrefixOf!0 lt!147789 (_2!4377 lt!147376))))

(assert (=> d!31750 (= lt!147790 (lemmaIsPrefixTransitive!0 lt!147789 (_2!4377 lt!147368) (_2!4377 lt!147376)))))

(declare-fun lt!147796 () Unit!6226)

(declare-fun e!66537 () Unit!6226)

(assert (=> d!31750 (= lt!147796 e!66537)))

(declare-fun c!6338 () Bool)

(assert (=> d!31750 (= c!6338 (not (= (size!2177 (buf!2534 (_2!4377 lt!147368))) #b00000000000000000000000000000000)))))

(declare-fun lt!147777 () Unit!6226)

(declare-fun lt!147778 () Unit!6226)

(assert (=> d!31750 (= lt!147777 lt!147778)))

(assert (=> d!31750 (isPrefixOf!0 (_2!4377 lt!147376) (_2!4377 lt!147376))))

(assert (=> d!31750 (= lt!147778 (lemmaIsPrefixRefl!0 (_2!4377 lt!147376)))))

(declare-fun lt!147783 () Unit!6226)

(declare-fun lt!147788 () Unit!6226)

(assert (=> d!31750 (= lt!147783 lt!147788)))

(assert (=> d!31750 (= lt!147788 (lemmaIsPrefixRefl!0 (_2!4377 lt!147376)))))

(declare-fun lt!147780 () Unit!6226)

(declare-fun lt!147782 () Unit!6226)

(assert (=> d!31750 (= lt!147780 lt!147782)))

(assert (=> d!31750 (isPrefixOf!0 lt!147789 lt!147789)))

(assert (=> d!31750 (= lt!147782 (lemmaIsPrefixRefl!0 lt!147789))))

(declare-fun lt!147794 () Unit!6226)

(declare-fun lt!147791 () Unit!6226)

(assert (=> d!31750 (= lt!147794 lt!147791)))

(assert (=> d!31750 (isPrefixOf!0 (_2!4377 lt!147368) (_2!4377 lt!147368))))

(assert (=> d!31750 (= lt!147791 (lemmaIsPrefixRefl!0 (_2!4377 lt!147368)))))

(assert (=> d!31750 (= lt!147789 (BitStream!3829 (buf!2534 (_2!4377 lt!147376)) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))))))

(assert (=> d!31750 (isPrefixOf!0 (_2!4377 lt!147368) (_2!4377 lt!147376))))

(assert (=> d!31750 (= (reader!0 (_2!4377 lt!147368) (_2!4377 lt!147376)) lt!147781)))

(declare-fun b!101760 () Bool)

(declare-fun lt!147787 () Unit!6226)

(assert (=> b!101760 (= e!66537 lt!147787)))

(declare-fun lt!147785 () (_ BitVec 64))

(assert (=> b!101760 (= lt!147785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!147793 () (_ BitVec 64))

(assert (=> b!101760 (= lt!147793 (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4769 array!4769 (_ BitVec 64) (_ BitVec 64)) Unit!6226)

(assert (=> b!101760 (= lt!147787 (arrayBitRangesEqSymmetric!0 (buf!2534 (_2!4377 lt!147368)) (buf!2534 (_2!4377 lt!147376)) lt!147785 lt!147793))))

(assert (=> b!101760 (arrayBitRangesEq!0 (buf!2534 (_2!4377 lt!147376)) (buf!2534 (_2!4377 lt!147368)) lt!147785 lt!147793)))

(declare-fun b!101761 () Bool)

(declare-fun Unit!6236 () Unit!6226)

(assert (=> b!101761 (= e!66537 Unit!6236)))

(assert (= (and d!31750 c!6338) b!101760))

(assert (= (and d!31750 (not c!6338)) b!101761))

(assert (= (and d!31750 res!83630) b!101757))

(assert (= (and b!101757 res!83632) b!101758))

(assert (= (and b!101758 res!83631) b!101759))

(declare-fun m!148023 () Bool)

(assert (=> d!31750 m!148023))

(declare-fun m!148025 () Bool)

(assert (=> d!31750 m!148025))

(declare-fun m!148027 () Bool)

(assert (=> d!31750 m!148027))

(declare-fun m!148029 () Bool)

(assert (=> d!31750 m!148029))

(declare-fun m!148031 () Bool)

(assert (=> d!31750 m!148031))

(declare-fun m!148033 () Bool)

(assert (=> d!31750 m!148033))

(declare-fun m!148035 () Bool)

(assert (=> d!31750 m!148035))

(declare-fun m!148037 () Bool)

(assert (=> d!31750 m!148037))

(declare-fun m!148039 () Bool)

(assert (=> d!31750 m!148039))

(declare-fun m!148041 () Bool)

(assert (=> d!31750 m!148041))

(declare-fun m!148043 () Bool)

(assert (=> d!31750 m!148043))

(declare-fun m!148045 () Bool)

(assert (=> b!101757 m!148045))

(declare-fun m!148047 () Bool)

(assert (=> b!101758 m!148047))

(assert (=> b!101760 m!147759))

(declare-fun m!148049 () Bool)

(assert (=> b!101760 m!148049))

(declare-fun m!148051 () Bool)

(assert (=> b!101760 m!148051))

(declare-fun m!148053 () Bool)

(assert (=> b!101759 m!148053))

(assert (=> b!101759 m!147817))

(assert (=> b!101759 m!147759))

(assert (=> b!101574 d!31750))

(declare-fun d!31752 () Bool)

(declare-fun lt!147797 () tuple2!8256)

(assert (=> d!31752 (= lt!147797 (readBit!0 (BitStream!3829 (buf!2534 (_2!4377 lt!147376)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305))))))

(assert (=> d!31752 (= (readBitPure!0 (BitStream!3829 (buf!2534 (_2!4377 lt!147376)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305))) (tuple2!8243 (_2!4383 lt!147797) (_1!4383 lt!147797)))))

(declare-fun bs!7779 () Bool)

(assert (= bs!7779 d!31752))

(declare-fun m!148055 () Bool)

(assert (=> bs!7779 m!148055))

(assert (=> b!101574 d!31752))

(declare-fun d!31754 () Bool)

(declare-fun lt!147798 () tuple2!8256)

(assert (=> d!31754 (= lt!147798 (readBit!0 lt!147380))))

(assert (=> d!31754 (= (readBitPure!0 lt!147380) (tuple2!8243 (_2!4383 lt!147798) (_1!4383 lt!147798)))))

(declare-fun bs!7780 () Bool)

(assert (= bs!7780 d!31754))

(declare-fun m!148057 () Bool)

(assert (=> bs!7780 m!148057))

(assert (=> b!101574 d!31754))

(declare-fun b!101762 () Bool)

(declare-fun res!83635 () Bool)

(declare-fun e!66538 () Bool)

(assert (=> b!101762 (=> (not res!83635) (not e!66538))))

(declare-fun lt!147803 () tuple2!8246)

(assert (=> b!101762 (= res!83635 (isPrefixOf!0 (_1!4378 lt!147803) thiss!1305))))

(declare-fun b!101763 () Bool)

(declare-fun res!83634 () Bool)

(assert (=> b!101763 (=> (not res!83634) (not e!66538))))

(assert (=> b!101763 (= res!83634 (isPrefixOf!0 (_2!4378 lt!147803) (_2!4377 lt!147376)))))

(declare-fun b!101764 () Bool)

(declare-fun lt!147808 () (_ BitVec 64))

(declare-fun lt!147806 () (_ BitVec 64))

(assert (=> b!101764 (= e!66538 (= (_1!4378 lt!147803) (withMovedBitIndex!0 (_2!4378 lt!147803) (bvsub lt!147808 lt!147806))))))

(assert (=> b!101764 (or (= (bvand lt!147808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147806 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147808 lt!147806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101764 (= lt!147806 (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147376))) (currentByte!5001 (_2!4377 lt!147376)) (currentBit!4996 (_2!4377 lt!147376))))))

(assert (=> b!101764 (= lt!147808 (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)))))

(declare-fun d!31756 () Bool)

(assert (=> d!31756 e!66538))

(declare-fun res!83633 () Bool)

(assert (=> d!31756 (=> (not res!83633) (not e!66538))))

(assert (=> d!31756 (= res!83633 (isPrefixOf!0 (_1!4378 lt!147803) (_2!4378 lt!147803)))))

(declare-fun lt!147811 () BitStream!3828)

(assert (=> d!31756 (= lt!147803 (tuple2!8247 lt!147811 (_2!4377 lt!147376)))))

(declare-fun lt!147801 () Unit!6226)

(declare-fun lt!147817 () Unit!6226)

(assert (=> d!31756 (= lt!147801 lt!147817)))

(assert (=> d!31756 (isPrefixOf!0 lt!147811 (_2!4377 lt!147376))))

(assert (=> d!31756 (= lt!147817 (lemmaIsPrefixTransitive!0 lt!147811 (_2!4377 lt!147376) (_2!4377 lt!147376)))))

(declare-fun lt!147814 () Unit!6226)

(declare-fun lt!147812 () Unit!6226)

(assert (=> d!31756 (= lt!147814 lt!147812)))

(assert (=> d!31756 (isPrefixOf!0 lt!147811 (_2!4377 lt!147376))))

(assert (=> d!31756 (= lt!147812 (lemmaIsPrefixTransitive!0 lt!147811 thiss!1305 (_2!4377 lt!147376)))))

(declare-fun lt!147818 () Unit!6226)

(declare-fun e!66539 () Unit!6226)

(assert (=> d!31756 (= lt!147818 e!66539)))

(declare-fun c!6339 () Bool)

(assert (=> d!31756 (= c!6339 (not (= (size!2177 (buf!2534 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!147799 () Unit!6226)

(declare-fun lt!147800 () Unit!6226)

(assert (=> d!31756 (= lt!147799 lt!147800)))

(assert (=> d!31756 (isPrefixOf!0 (_2!4377 lt!147376) (_2!4377 lt!147376))))

(assert (=> d!31756 (= lt!147800 (lemmaIsPrefixRefl!0 (_2!4377 lt!147376)))))

(declare-fun lt!147805 () Unit!6226)

(declare-fun lt!147810 () Unit!6226)

(assert (=> d!31756 (= lt!147805 lt!147810)))

(assert (=> d!31756 (= lt!147810 (lemmaIsPrefixRefl!0 (_2!4377 lt!147376)))))

(declare-fun lt!147802 () Unit!6226)

(declare-fun lt!147804 () Unit!6226)

(assert (=> d!31756 (= lt!147802 lt!147804)))

(assert (=> d!31756 (isPrefixOf!0 lt!147811 lt!147811)))

(assert (=> d!31756 (= lt!147804 (lemmaIsPrefixRefl!0 lt!147811))))

(declare-fun lt!147816 () Unit!6226)

(declare-fun lt!147813 () Unit!6226)

(assert (=> d!31756 (= lt!147816 lt!147813)))

(assert (=> d!31756 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31756 (= lt!147813 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31756 (= lt!147811 (BitStream!3829 (buf!2534 (_2!4377 lt!147376)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)))))

(assert (=> d!31756 (isPrefixOf!0 thiss!1305 (_2!4377 lt!147376))))

(assert (=> d!31756 (= (reader!0 thiss!1305 (_2!4377 lt!147376)) lt!147803)))

(declare-fun b!101765 () Bool)

(declare-fun lt!147809 () Unit!6226)

(assert (=> b!101765 (= e!66539 lt!147809)))

(declare-fun lt!147807 () (_ BitVec 64))

(assert (=> b!101765 (= lt!147807 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!147815 () (_ BitVec 64))

(assert (=> b!101765 (= lt!147815 (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)))))

(assert (=> b!101765 (= lt!147809 (arrayBitRangesEqSymmetric!0 (buf!2534 thiss!1305) (buf!2534 (_2!4377 lt!147376)) lt!147807 lt!147815))))

(assert (=> b!101765 (arrayBitRangesEq!0 (buf!2534 (_2!4377 lt!147376)) (buf!2534 thiss!1305) lt!147807 lt!147815)))

(declare-fun b!101766 () Bool)

(declare-fun Unit!6237 () Unit!6226)

(assert (=> b!101766 (= e!66539 Unit!6237)))

(assert (= (and d!31756 c!6339) b!101765))

(assert (= (and d!31756 (not c!6339)) b!101766))

(assert (= (and d!31756 res!83633) b!101762))

(assert (= (and b!101762 res!83635) b!101763))

(assert (= (and b!101763 res!83634) b!101764))

(assert (=> d!31756 m!148023))

(declare-fun m!148059 () Bool)

(assert (=> d!31756 m!148059))

(declare-fun m!148061 () Bool)

(assert (=> d!31756 m!148061))

(declare-fun m!148063 () Bool)

(assert (=> d!31756 m!148063))

(declare-fun m!148065 () Bool)

(assert (=> d!31756 m!148065))

(declare-fun m!148067 () Bool)

(assert (=> d!31756 m!148067))

(assert (=> d!31756 m!148035))

(declare-fun m!148069 () Bool)

(assert (=> d!31756 m!148069))

(declare-fun m!148071 () Bool)

(assert (=> d!31756 m!148071))

(assert (=> d!31756 m!147727))

(declare-fun m!148073 () Bool)

(assert (=> d!31756 m!148073))

(declare-fun m!148075 () Bool)

(assert (=> b!101762 m!148075))

(declare-fun m!148077 () Bool)

(assert (=> b!101763 m!148077))

(assert (=> b!101765 m!147761))

(declare-fun m!148079 () Bool)

(assert (=> b!101765 m!148079))

(declare-fun m!148081 () Bool)

(assert (=> b!101765 m!148081))

(declare-fun m!148083 () Bool)

(assert (=> b!101764 m!148083))

(assert (=> b!101764 m!147817))

(assert (=> b!101764 m!147761))

(assert (=> b!101574 d!31756))

(declare-fun d!31758 () Bool)

(assert (=> d!31758 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147376)))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305)) lt!147370) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147376)))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305))) lt!147370))))

(declare-fun bs!7781 () Bool)

(assert (= bs!7781 d!31758))

(declare-fun m!148085 () Bool)

(assert (=> bs!7781 m!148085))

(assert (=> b!101574 d!31758))

(declare-fun d!31760 () Bool)

(declare-fun lt!147819 () tuple2!8256)

(assert (=> d!31760 (= lt!147819 (readBit!0 (readerFrom!0 (_2!4377 lt!147368) (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305))))))

(assert (=> d!31760 (= (readBitPure!0 (readerFrom!0 (_2!4377 lt!147368) (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305))) (tuple2!8243 (_2!4383 lt!147819) (_1!4383 lt!147819)))))

(declare-fun bs!7782 () Bool)

(assert (= bs!7782 d!31760))

(assert (=> bs!7782 m!147717))

(declare-fun m!148087 () Bool)

(assert (=> bs!7782 m!148087))

(assert (=> b!101568 d!31760))

(declare-fun d!31762 () Bool)

(declare-fun e!66542 () Bool)

(assert (=> d!31762 e!66542))

(declare-fun res!83639 () Bool)

(assert (=> d!31762 (=> (not res!83639) (not e!66542))))

(assert (=> d!31762 (= res!83639 (invariant!0 (currentBit!4996 (_2!4377 lt!147368)) (currentByte!5001 (_2!4377 lt!147368)) (size!2177 (buf!2534 (_2!4377 lt!147368)))))))

(assert (=> d!31762 (= (readerFrom!0 (_2!4377 lt!147368) (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305)) (BitStream!3829 (buf!2534 (_2!4377 lt!147368)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)))))

(declare-fun b!101769 () Bool)

(assert (=> b!101769 (= e!66542 (invariant!0 (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147368)))))))

(assert (= (and d!31762 res!83639) b!101769))

(declare-fun m!148089 () Bool)

(assert (=> d!31762 m!148089))

(assert (=> b!101769 m!147753))

(assert (=> b!101568 d!31762))

(declare-fun d!31764 () Bool)

(assert (=> d!31764 (= (invariant!0 (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147376)))) (and (bvsge (currentBit!4996 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4996 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5001 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147376)))) (and (= (currentBit!4996 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147376))))))))))

(assert (=> b!101573 d!31764))

(declare-fun d!31766 () Bool)

(assert (=> d!31766 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!101570 d!31766))

(declare-fun d!31768 () Bool)

(declare-fun e!66543 () Bool)

(assert (=> d!31768 e!66543))

(declare-fun res!83641 () Bool)

(assert (=> d!31768 (=> (not res!83641) (not e!66543))))

(declare-fun lt!147821 () (_ BitVec 64))

(declare-fun lt!147823 () (_ BitVec 64))

(declare-fun lt!147825 () (_ BitVec 64))

(assert (=> d!31768 (= res!83641 (= lt!147825 (bvsub lt!147821 lt!147823)))))

(assert (=> d!31768 (or (= (bvand lt!147821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147821 lt!147823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31768 (= lt!147823 (remainingBits!0 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147368)))) ((_ sign_extend 32) (currentByte!5001 (_2!4377 lt!147368))) ((_ sign_extend 32) (currentBit!4996 (_2!4377 lt!147368)))))))

(declare-fun lt!147820 () (_ BitVec 64))

(declare-fun lt!147822 () (_ BitVec 64))

(assert (=> d!31768 (= lt!147821 (bvmul lt!147820 lt!147822))))

(assert (=> d!31768 (or (= lt!147820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147822 (bvsdiv (bvmul lt!147820 lt!147822) lt!147820)))))

(assert (=> d!31768 (= lt!147822 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31768 (= lt!147820 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147368)))))))

(assert (=> d!31768 (= lt!147825 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5001 (_2!4377 lt!147368))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4996 (_2!4377 lt!147368)))))))

(assert (=> d!31768 (invariant!0 (currentBit!4996 (_2!4377 lt!147368)) (currentByte!5001 (_2!4377 lt!147368)) (size!2177 (buf!2534 (_2!4377 lt!147368))))))

(assert (=> d!31768 (= (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368))) lt!147825)))

(declare-fun b!101770 () Bool)

(declare-fun res!83640 () Bool)

(assert (=> b!101770 (=> (not res!83640) (not e!66543))))

(assert (=> b!101770 (= res!83640 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147825))))

(declare-fun b!101771 () Bool)

(declare-fun lt!147824 () (_ BitVec 64))

(assert (=> b!101771 (= e!66543 (bvsle lt!147825 (bvmul lt!147824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101771 (or (= lt!147824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147824)))))

(assert (=> b!101771 (= lt!147824 ((_ sign_extend 32) (size!2177 (buf!2534 (_2!4377 lt!147368)))))))

(assert (= (and d!31768 res!83641) b!101770))

(assert (= (and b!101770 res!83640) b!101771))

(declare-fun m!148091 () Bool)

(assert (=> d!31768 m!148091))

(assert (=> d!31768 m!148089))

(assert (=> b!101575 d!31768))

(declare-fun d!31770 () Bool)

(declare-fun e!66544 () Bool)

(assert (=> d!31770 e!66544))

(declare-fun res!83643 () Bool)

(assert (=> d!31770 (=> (not res!83643) (not e!66544))))

(declare-fun lt!147829 () (_ BitVec 64))

(declare-fun lt!147831 () (_ BitVec 64))

(declare-fun lt!147827 () (_ BitVec 64))

(assert (=> d!31770 (= res!83643 (= lt!147831 (bvsub lt!147827 lt!147829)))))

(assert (=> d!31770 (or (= (bvand lt!147827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147829 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147827 lt!147829) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31770 (= lt!147829 (remainingBits!0 ((_ sign_extend 32) (size!2177 (buf!2534 thiss!1305))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305))))))

(declare-fun lt!147826 () (_ BitVec 64))

(declare-fun lt!147828 () (_ BitVec 64))

(assert (=> d!31770 (= lt!147827 (bvmul lt!147826 lt!147828))))

(assert (=> d!31770 (or (= lt!147826 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147828 (bvsdiv (bvmul lt!147826 lt!147828) lt!147826)))))

(assert (=> d!31770 (= lt!147828 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31770 (= lt!147826 ((_ sign_extend 32) (size!2177 (buf!2534 thiss!1305))))))

(assert (=> d!31770 (= lt!147831 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5001 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4996 thiss!1305))))))

(assert (=> d!31770 (invariant!0 (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305) (size!2177 (buf!2534 thiss!1305)))))

(assert (=> d!31770 (= (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)) lt!147831)))

(declare-fun b!101772 () Bool)

(declare-fun res!83642 () Bool)

(assert (=> b!101772 (=> (not res!83642) (not e!66544))))

(assert (=> b!101772 (= res!83642 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147831))))

(declare-fun b!101773 () Bool)

(declare-fun lt!147830 () (_ BitVec 64))

(assert (=> b!101773 (= e!66544 (bvsle lt!147831 (bvmul lt!147830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101773 (or (= lt!147830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147830)))))

(assert (=> b!101773 (= lt!147830 ((_ sign_extend 32) (size!2177 (buf!2534 thiss!1305))))))

(assert (= (and d!31770 res!83643) b!101772))

(assert (= (and b!101772 res!83642) b!101773))

(declare-fun m!148093 () Bool)

(assert (=> d!31770 m!148093))

(declare-fun m!148095 () Bool)

(assert (=> d!31770 m!148095))

(assert (=> b!101575 d!31770))

(declare-fun d!31772 () Bool)

(assert (=> d!31772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2177 (buf!2534 thiss!1305))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305)) lt!147370) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2177 (buf!2534 thiss!1305))) ((_ sign_extend 32) (currentByte!5001 thiss!1305)) ((_ sign_extend 32) (currentBit!4996 thiss!1305))) lt!147370))))

(declare-fun bs!7783 () Bool)

(assert (= bs!7783 d!31772))

(assert (=> bs!7783 m!148093))

(assert (=> b!101566 d!31772))

(declare-fun d!31774 () Bool)

(assert (=> d!31774 (= (array_inv!1979 (buf!2534 thiss!1305)) (bvsge (size!2177 (buf!2534 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!101576 d!31774))

(declare-fun d!31776 () Bool)

(declare-fun e!66545 () Bool)

(assert (=> d!31776 e!66545))

(declare-fun res!83645 () Bool)

(assert (=> d!31776 (=> (not res!83645) (not e!66545))))

(declare-fun lt!147833 () (_ BitVec 64))

(declare-fun lt!147837 () (_ BitVec 64))

(declare-fun lt!147835 () (_ BitVec 64))

(assert (=> d!31776 (= res!83645 (= lt!147837 (bvsub lt!147833 lt!147835)))))

(assert (=> d!31776 (or (= (bvand lt!147833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147833 lt!147835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31776 (= lt!147835 (remainingBits!0 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147375)))) ((_ sign_extend 32) (currentByte!5001 (_1!4376 lt!147375))) ((_ sign_extend 32) (currentBit!4996 (_1!4376 lt!147375)))))))

(declare-fun lt!147832 () (_ BitVec 64))

(declare-fun lt!147834 () (_ BitVec 64))

(assert (=> d!31776 (= lt!147833 (bvmul lt!147832 lt!147834))))

(assert (=> d!31776 (or (= lt!147832 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147834 (bvsdiv (bvmul lt!147832 lt!147834) lt!147832)))))

(assert (=> d!31776 (= lt!147834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31776 (= lt!147832 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147375)))))))

(assert (=> d!31776 (= lt!147837 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5001 (_1!4376 lt!147375))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4996 (_1!4376 lt!147375)))))))

(assert (=> d!31776 (invariant!0 (currentBit!4996 (_1!4376 lt!147375)) (currentByte!5001 (_1!4376 lt!147375)) (size!2177 (buf!2534 (_1!4376 lt!147375))))))

(assert (=> d!31776 (= (bitIndex!0 (size!2177 (buf!2534 (_1!4376 lt!147375))) (currentByte!5001 (_1!4376 lt!147375)) (currentBit!4996 (_1!4376 lt!147375))) lt!147837)))

(declare-fun b!101774 () Bool)

(declare-fun res!83644 () Bool)

(assert (=> b!101774 (=> (not res!83644) (not e!66545))))

(assert (=> b!101774 (= res!83644 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147837))))

(declare-fun b!101775 () Bool)

(declare-fun lt!147836 () (_ BitVec 64))

(assert (=> b!101775 (= e!66545 (bvsle lt!147837 (bvmul lt!147836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101775 (or (= lt!147836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147836)))))

(assert (=> b!101775 (= lt!147836 ((_ sign_extend 32) (size!2177 (buf!2534 (_1!4376 lt!147375)))))))

(assert (= (and d!31776 res!83645) b!101774))

(assert (= (and b!101774 res!83644) b!101775))

(declare-fun m!148097 () Bool)

(assert (=> d!31776 m!148097))

(declare-fun m!148099 () Bool)

(assert (=> d!31776 m!148099))

(assert (=> b!101565 d!31776))

(declare-fun d!31778 () Bool)

(assert (=> d!31778 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305) (size!2177 (buf!2534 thiss!1305))))))

(declare-fun bs!7784 () Bool)

(assert (= bs!7784 d!31778))

(assert (=> bs!7784 m!148095))

(assert (=> start!20238 d!31778))

(declare-fun d!31780 () Bool)

(declare-fun res!83648 () Bool)

(declare-fun e!66546 () Bool)

(assert (=> d!31780 (=> (not res!83648) (not e!66546))))

(assert (=> d!31780 (= res!83648 (= (size!2177 (buf!2534 thiss!1305)) (size!2177 (buf!2534 (_2!4377 lt!147368)))))))

(assert (=> d!31780 (= (isPrefixOf!0 thiss!1305 (_2!4377 lt!147368)) e!66546)))

(declare-fun b!101776 () Bool)

(declare-fun res!83646 () Bool)

(assert (=> b!101776 (=> (not res!83646) (not e!66546))))

(assert (=> b!101776 (= res!83646 (bvsle (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305)) (bitIndex!0 (size!2177 (buf!2534 (_2!4377 lt!147368))) (currentByte!5001 (_2!4377 lt!147368)) (currentBit!4996 (_2!4377 lt!147368)))))))

(declare-fun b!101777 () Bool)

(declare-fun e!66547 () Bool)

(assert (=> b!101777 (= e!66546 e!66547)))

(declare-fun res!83647 () Bool)

(assert (=> b!101777 (=> res!83647 e!66547)))

(assert (=> b!101777 (= res!83647 (= (size!2177 (buf!2534 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!101778 () Bool)

(assert (=> b!101778 (= e!66547 (arrayBitRangesEq!0 (buf!2534 thiss!1305) (buf!2534 (_2!4377 lt!147368)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2177 (buf!2534 thiss!1305)) (currentByte!5001 thiss!1305) (currentBit!4996 thiss!1305))))))

(assert (= (and d!31780 res!83648) b!101776))

(assert (= (and b!101776 res!83646) b!101777))

(assert (= (and b!101777 (not res!83647)) b!101778))

(assert (=> b!101776 m!147761))

(assert (=> b!101776 m!147759))

(assert (=> b!101778 m!147761))

(assert (=> b!101778 m!147761))

(declare-fun m!148101 () Bool)

(assert (=> b!101778 m!148101))

(assert (=> b!101567 d!31780))

(declare-fun d!31782 () Bool)

(assert (=> d!31782 (= (invariant!0 (currentBit!4996 thiss!1305) (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147368)))) (and (bvsge (currentBit!4996 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4996 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5001 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147368)))) (and (= (currentBit!4996 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5001 thiss!1305) (size!2177 (buf!2534 (_2!4377 lt!147368))))))))))

(assert (=> b!101572 d!31782))

(check-sat (not b!101735) (not b!101742) (not b!101758) (not b!101619) (not d!31686) (not d!31746) (not b!101733) (not d!31752) (not b!101776) (not d!31744) (not b!101757) (not d!31684) (not b!101764) (not d!31750) (not b!101621) (not d!31680) (not d!31768) (not b!101741) (not b!101769) (not d!31748) (not d!31776) (not b!101640) (not bm!1264) (not d!31760) (not d!31758) (not b!101738) (not b!101743) (not b!101637) (not d!31754) (not b!101638) (not b!101732) (not d!31770) (not b!101759) (not d!31772) (not d!31756) (not d!31678) (not b!101639) (not d!31778) (not b!101778) (not b!101736) (not b!101760) (not b!101734) (not b!101762) (not b!101763) (not b!101765) (not d!31682) (not b!101739) (not d!31762))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15138 () Bool)

(assert start!15138)

(declare-fun b!77491 () Bool)

(declare-fun res!64039 () Bool)

(declare-fun e!50811 () Bool)

(assert (=> b!77491 (=> (not res!64039) (not e!50811))))

(declare-datatypes ((array!3249 0))(
  ( (array!3250 (arr!2111 (Array (_ BitVec 32) (_ BitVec 8))) (size!1510 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2594 0))(
  ( (BitStream!2595 (buf!1903 array!3249) (currentByte!3717 (_ BitVec 32)) (currentBit!3712 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2594)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77491 (= res!64039 (validate_offset_bits!1 ((_ sign_extend 32) (size!1510 (buf!1903 thiss!1090))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090)) nBits!322))))

(declare-fun b!77492 () Bool)

(declare-fun res!64037 () Bool)

(declare-fun e!50814 () Bool)

(assert (=> b!77492 (=> (not res!64037) (not e!50814))))

(declare-datatypes ((Unit!5114 0))(
  ( (Unit!5115) )
))
(declare-datatypes ((tuple2!6848 0))(
  ( (tuple2!6849 (_1!3558 Unit!5114) (_2!3558 BitStream!2594)) )
))
(declare-fun lt!124207 () tuple2!6848)

(declare-fun isPrefixOf!0 (BitStream!2594 BitStream!2594) Bool)

(assert (=> b!77492 (= res!64037 (isPrefixOf!0 thiss!1090 (_2!3558 lt!124207)))))

(declare-fun b!77494 () Bool)

(declare-datatypes ((tuple2!6850 0))(
  ( (tuple2!6851 (_1!3559 BitStream!2594) (_2!3559 Bool)) )
))
(declare-fun lt!124204 () tuple2!6850)

(declare-datatypes ((tuple2!6852 0))(
  ( (tuple2!6853 (_1!3560 BitStream!2594) (_2!3560 BitStream!2594)) )
))
(declare-fun lt!124205 () tuple2!6852)

(assert (=> b!77494 (= e!50814 (not (or (not (_2!3559 lt!124204)) (not (= (_1!3559 lt!124204) (_2!3560 lt!124205))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2594 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6850)

(assert (=> b!77494 (= lt!124204 (checkBitsLoopPure!0 (_1!3560 lt!124205) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77494 (validate_offset_bits!1 ((_ sign_extend 32) (size!1510 (buf!1903 (_2!3558 lt!124207)))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090)) nBits!322)))

(declare-fun lt!124209 () Unit!5114)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2594 array!3249 (_ BitVec 64)) Unit!5114)

(assert (=> b!77494 (= lt!124209 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1903 (_2!3558 lt!124207)) nBits!322))))

(declare-fun reader!0 (BitStream!2594 BitStream!2594) tuple2!6852)

(assert (=> b!77494 (= lt!124205 (reader!0 thiss!1090 (_2!3558 lt!124207)))))

(declare-fun b!77495 () Bool)

(declare-fun res!64035 () Bool)

(assert (=> b!77495 (=> (not res!64035) (not e!50814))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77495 (= res!64035 (= (bitIndex!0 (size!1510 (buf!1903 (_2!3558 lt!124207))) (currentByte!3717 (_2!3558 lt!124207)) (currentBit!3712 (_2!3558 lt!124207))) (bvadd (bitIndex!0 (size!1510 (buf!1903 thiss!1090)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090)) nBits!322)))))

(declare-fun lt!124208 () (_ BitVec 64))

(declare-fun b!77496 () Bool)

(declare-fun lt!124206 () (_ BitVec 64))

(assert (=> b!77496 (= e!50811 (not (or (not (= lt!124208 (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!124208 (bvand (bvadd lt!124206 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!77496 (= lt!124208 (bvand lt!124206 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77496 (= lt!124206 (bitIndex!0 (size!1510 (buf!1903 thiss!1090)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090)))))

(assert (=> b!77496 e!50814))

(declare-fun res!64036 () Bool)

(assert (=> b!77496 (=> (not res!64036) (not e!50814))))

(assert (=> b!77496 (= res!64036 (= (size!1510 (buf!1903 thiss!1090)) (size!1510 (buf!1903 (_2!3558 lt!124207)))))))

(declare-fun appendNBits!0 (BitStream!2594 (_ BitVec 64) Bool) tuple2!6848)

(assert (=> b!77496 (= lt!124207 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77493 () Bool)

(declare-fun e!50812 () Bool)

(declare-fun array_inv!1356 (array!3249) Bool)

(assert (=> b!77493 (= e!50812 (array_inv!1356 (buf!1903 thiss!1090)))))

(declare-fun res!64038 () Bool)

(assert (=> start!15138 (=> (not res!64038) (not e!50811))))

(assert (=> start!15138 (= res!64038 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15138 e!50811))

(assert (=> start!15138 true))

(declare-fun inv!12 (BitStream!2594) Bool)

(assert (=> start!15138 (and (inv!12 thiss!1090) e!50812)))

(assert (= (and start!15138 res!64038) b!77491))

(assert (= (and b!77491 res!64039) b!77496))

(assert (= (and b!77496 res!64036) b!77495))

(assert (= (and b!77495 res!64035) b!77492))

(assert (= (and b!77492 res!64037) b!77494))

(assert (= start!15138 b!77493))

(declare-fun m!123001 () Bool)

(assert (=> start!15138 m!123001))

(declare-fun m!123003 () Bool)

(assert (=> b!77496 m!123003))

(declare-fun m!123005 () Bool)

(assert (=> b!77496 m!123005))

(declare-fun m!123007 () Bool)

(assert (=> b!77492 m!123007))

(declare-fun m!123009 () Bool)

(assert (=> b!77495 m!123009))

(assert (=> b!77495 m!123003))

(declare-fun m!123011 () Bool)

(assert (=> b!77491 m!123011))

(declare-fun m!123013 () Bool)

(assert (=> b!77494 m!123013))

(declare-fun m!123015 () Bool)

(assert (=> b!77494 m!123015))

(declare-fun m!123017 () Bool)

(assert (=> b!77494 m!123017))

(declare-fun m!123019 () Bool)

(assert (=> b!77494 m!123019))

(declare-fun m!123021 () Bool)

(assert (=> b!77493 m!123021))

(push 1)

(assert (not b!77493))

(assert (not b!77492))

(assert (not start!15138))

(assert (not b!77491))

(assert (not b!77496))

(assert (not b!77494))

(assert (not b!77495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24472 () Bool)

(declare-fun res!64047 () Bool)

(declare-fun e!50820 () Bool)

(assert (=> d!24472 (=> (not res!64047) (not e!50820))))

(assert (=> d!24472 (= res!64047 (= (size!1510 (buf!1903 thiss!1090)) (size!1510 (buf!1903 (_2!3558 lt!124207)))))))

(assert (=> d!24472 (= (isPrefixOf!0 thiss!1090 (_2!3558 lt!124207)) e!50820)))

(declare-fun b!77503 () Bool)

(declare-fun res!64048 () Bool)

(assert (=> b!77503 (=> (not res!64048) (not e!50820))))

(assert (=> b!77503 (= res!64048 (bvsle (bitIndex!0 (size!1510 (buf!1903 thiss!1090)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090)) (bitIndex!0 (size!1510 (buf!1903 (_2!3558 lt!124207))) (currentByte!3717 (_2!3558 lt!124207)) (currentBit!3712 (_2!3558 lt!124207)))))))

(declare-fun b!77504 () Bool)

(declare-fun e!50819 () Bool)

(assert (=> b!77504 (= e!50820 e!50819)))

(declare-fun res!64046 () Bool)

(assert (=> b!77504 (=> res!64046 e!50819)))

(assert (=> b!77504 (= res!64046 (= (size!1510 (buf!1903 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!77505 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3249 array!3249 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77505 (= e!50819 (arrayBitRangesEq!0 (buf!1903 thiss!1090) (buf!1903 (_2!3558 lt!124207)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1510 (buf!1903 thiss!1090)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090))))))

(assert (= (and d!24472 res!64047) b!77503))

(assert (= (and b!77503 res!64048) b!77504))

(assert (= (and b!77504 (not res!64046)) b!77505))

(assert (=> b!77503 m!123003))

(assert (=> b!77503 m!123009))

(assert (=> b!77505 m!123003))

(assert (=> b!77505 m!123003))

(declare-fun m!123039 () Bool)

(assert (=> b!77505 m!123039))

(assert (=> b!77492 d!24472))

(declare-fun d!24478 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24478 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3712 thiss!1090) (currentByte!3717 thiss!1090) (size!1510 (buf!1903 thiss!1090))))))

(declare-fun bs!5931 () Bool)

(assert (= bs!5931 d!24478))

(declare-fun m!123041 () Bool)

(assert (=> bs!5931 m!123041))

(assert (=> start!15138 d!24478))

(declare-fun d!24480 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1510 (buf!1903 thiss!1090))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1510 (buf!1903 thiss!1090))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090))) nBits!322))))

(declare-fun bs!5932 () Bool)

(assert (= bs!5932 d!24480))

(declare-fun m!123043 () Bool)

(assert (=> bs!5932 m!123043))

(assert (=> b!77491 d!24480))

(declare-fun d!24482 () Bool)

(declare-fun e!50823 () Bool)

(assert (=> d!24482 e!50823))

(declare-fun res!64054 () Bool)

(assert (=> d!24482 (=> (not res!64054) (not e!50823))))

(declare-fun lt!124235 () (_ BitVec 64))

(declare-fun lt!124238 () (_ BitVec 64))

(declare-fun lt!124237 () (_ BitVec 64))

(assert (=> d!24482 (= res!64054 (= lt!124238 (bvsub lt!124235 lt!124237)))))

(assert (=> d!24482 (or (= (bvand lt!124235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124237 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124235 lt!124237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24482 (= lt!124237 (remainingBits!0 ((_ sign_extend 32) (size!1510 (buf!1903 thiss!1090))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090))))))

(declare-fun lt!124239 () (_ BitVec 64))

(declare-fun lt!124234 () (_ BitVec 64))

(assert (=> d!24482 (= lt!124235 (bvmul lt!124239 lt!124234))))

(assert (=> d!24482 (or (= lt!124239 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124234 (bvsdiv (bvmul lt!124239 lt!124234) lt!124239)))))

(assert (=> d!24482 (= lt!124234 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24482 (= lt!124239 ((_ sign_extend 32) (size!1510 (buf!1903 thiss!1090))))))

(assert (=> d!24482 (= lt!124238 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3717 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3712 thiss!1090))))))

(assert (=> d!24482 (invariant!0 (currentBit!3712 thiss!1090) (currentByte!3717 thiss!1090) (size!1510 (buf!1903 thiss!1090)))))

(assert (=> d!24482 (= (bitIndex!0 (size!1510 (buf!1903 thiss!1090)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090)) lt!124238)))

(declare-fun b!77510 () Bool)

(declare-fun res!64053 () Bool)

(assert (=> b!77510 (=> (not res!64053) (not e!50823))))

(assert (=> b!77510 (= res!64053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124238))))

(declare-fun b!77511 () Bool)

(declare-fun lt!124236 () (_ BitVec 64))

(assert (=> b!77511 (= e!50823 (bvsle lt!124238 (bvmul lt!124236 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77511 (or (= lt!124236 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124236 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124236)))))

(assert (=> b!77511 (= lt!124236 ((_ sign_extend 32) (size!1510 (buf!1903 thiss!1090))))))

(assert (= (and d!24482 res!64054) b!77510))

(assert (= (and b!77510 res!64053) b!77511))

(assert (=> d!24482 m!123043))

(assert (=> d!24482 m!123041))

(assert (=> b!77496 d!24482))

(declare-fun b!77574 () Bool)

(declare-fun e!50852 () Bool)

(assert (=> b!77574 (= e!50852 (validate_offset_bits!1 ((_ sign_extend 32) (size!1510 (buf!1903 thiss!1090))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090)) nBits!322))))

(declare-fun d!24484 () Bool)

(declare-fun e!50853 () Bool)

(assert (=> d!24484 e!50853))

(declare-fun res!64105 () Bool)

(assert (=> d!24484 (=> (not res!64105) (not e!50853))))

(declare-fun lt!124413 () tuple2!6848)

(assert (=> d!24484 (= res!64105 (= (size!1510 (buf!1903 thiss!1090)) (size!1510 (buf!1903 (_2!3558 lt!124413)))))))

(declare-fun choose!36 (BitStream!2594 (_ BitVec 64) Bool) tuple2!6848)

(assert (=> d!24484 (= lt!124413 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24484 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24484 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!124413)))

(declare-fun b!77572 () Bool)

(declare-fun res!64103 () Bool)

(assert (=> b!77572 (=> (not res!64103) (not e!50853))))

(assert (=> b!77572 (= res!64103 (isPrefixOf!0 thiss!1090 (_2!3558 lt!124413)))))

(declare-fun b!77571 () Bool)

(declare-fun res!64102 () Bool)

(assert (=> b!77571 (=> (not res!64102) (not e!50853))))

(declare-fun lt!124410 () (_ BitVec 64))

(assert (=> b!77571 (= res!64102 (= (bitIndex!0 (size!1510 (buf!1903 (_2!3558 lt!124413))) (currentByte!3717 (_2!3558 lt!124413)) (currentBit!3712 (_2!3558 lt!124413))) (bvadd lt!124410 nBits!322)))))

(assert (=> b!77571 (or (not (= (bvand lt!124410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124410 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77571 (= lt!124410 (bitIndex!0 (size!1510 (buf!1903 thiss!1090)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090)))))

(declare-fun b!77573 () Bool)

(declare-fun lt!124411 () tuple2!6850)

(declare-fun lt!124409 () tuple2!6852)

(assert (=> b!77573 (= e!50853 (and (_2!3559 lt!124411) (= (_1!3559 lt!124411) (_2!3560 lt!124409))))))

(assert (=> b!77573 (= lt!124411 (checkBitsLoopPure!0 (_1!3560 lt!124409) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!124408 () Unit!5114)

(declare-fun lt!124412 () Unit!5114)

(assert (=> b!77573 (= lt!124408 lt!124412)))

(assert (=> b!77573 (validate_offset_bits!1 ((_ sign_extend 32) (size!1510 (buf!1903 (_2!3558 lt!124413)))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090)) nBits!322)))

(assert (=> b!77573 (= lt!124412 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1903 (_2!3558 lt!124413)) nBits!322))))

(assert (=> b!77573 e!50852))

(declare-fun res!64104 () Bool)

(assert (=> b!77573 (=> (not res!64104) (not e!50852))))

(assert (=> b!77573 (= res!64104 (and (= (size!1510 (buf!1903 thiss!1090)) (size!1510 (buf!1903 (_2!3558 lt!124413)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77573 (= lt!124409 (reader!0 thiss!1090 (_2!3558 lt!124413)))))

(assert (= (and d!24484 res!64105) b!77571))

(assert (= (and b!77571 res!64102) b!77572))

(assert (= (and b!77572 res!64103) b!77573))

(assert (= (and b!77573 res!64104) b!77574))

(declare-fun m!123111 () Bool)

(assert (=> d!24484 m!123111))

(declare-fun m!123113 () Bool)

(assert (=> b!77571 m!123113))

(assert (=> b!77571 m!123003))

(assert (=> b!77574 m!123011))

(declare-fun m!123115 () Bool)

(assert (=> b!77573 m!123115))

(declare-fun m!123117 () Bool)

(assert (=> b!77573 m!123117))

(declare-fun m!123119 () Bool)

(assert (=> b!77573 m!123119))

(declare-fun m!123121 () Bool)

(assert (=> b!77573 m!123121))

(declare-fun m!123123 () Bool)

(assert (=> b!77572 m!123123))

(assert (=> b!77496 d!24484))

(declare-fun d!24496 () Bool)

(declare-fun e!50854 () Bool)

(assert (=> d!24496 e!50854))

(declare-fun res!64107 () Bool)

(assert (=> d!24496 (=> (not res!64107) (not e!50854))))

(declare-fun lt!124418 () (_ BitVec 64))

(declare-fun lt!124417 () (_ BitVec 64))

(declare-fun lt!124415 () (_ BitVec 64))

(assert (=> d!24496 (= res!64107 (= lt!124418 (bvsub lt!124415 lt!124417)))))

(assert (=> d!24496 (or (= (bvand lt!124415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124417 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124415 lt!124417) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24496 (= lt!124417 (remainingBits!0 ((_ sign_extend 32) (size!1510 (buf!1903 (_2!3558 lt!124207)))) ((_ sign_extend 32) (currentByte!3717 (_2!3558 lt!124207))) ((_ sign_extend 32) (currentBit!3712 (_2!3558 lt!124207)))))))

(declare-fun lt!124419 () (_ BitVec 64))

(declare-fun lt!124414 () (_ BitVec 64))

(assert (=> d!24496 (= lt!124415 (bvmul lt!124419 lt!124414))))

(assert (=> d!24496 (or (= lt!124419 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124414 (bvsdiv (bvmul lt!124419 lt!124414) lt!124419)))))

(assert (=> d!24496 (= lt!124414 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24496 (= lt!124419 ((_ sign_extend 32) (size!1510 (buf!1903 (_2!3558 lt!124207)))))))

(assert (=> d!24496 (= lt!124418 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3717 (_2!3558 lt!124207))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3712 (_2!3558 lt!124207)))))))

(assert (=> d!24496 (invariant!0 (currentBit!3712 (_2!3558 lt!124207)) (currentByte!3717 (_2!3558 lt!124207)) (size!1510 (buf!1903 (_2!3558 lt!124207))))))

(assert (=> d!24496 (= (bitIndex!0 (size!1510 (buf!1903 (_2!3558 lt!124207))) (currentByte!3717 (_2!3558 lt!124207)) (currentBit!3712 (_2!3558 lt!124207))) lt!124418)))

(declare-fun b!77575 () Bool)

(declare-fun res!64106 () Bool)

(assert (=> b!77575 (=> (not res!64106) (not e!50854))))

(assert (=> b!77575 (= res!64106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124418))))

(declare-fun b!77576 () Bool)

(declare-fun lt!124416 () (_ BitVec 64))

(assert (=> b!77576 (= e!50854 (bvsle lt!124418 (bvmul lt!124416 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77576 (or (= lt!124416 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124416 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124416)))))

(assert (=> b!77576 (= lt!124416 ((_ sign_extend 32) (size!1510 (buf!1903 (_2!3558 lt!124207)))))))

(assert (= (and d!24496 res!64107) b!77575))

(assert (= (and b!77575 res!64106) b!77576))

(declare-fun m!123125 () Bool)

(assert (=> d!24496 m!123125))

(declare-fun m!123127 () Bool)

(assert (=> d!24496 m!123127))

(assert (=> b!77495 d!24496))

(assert (=> b!77495 d!24482))

(declare-fun d!24498 () Bool)

(declare-datatypes ((tuple2!6858 0))(
  ( (tuple2!6859 (_1!3563 Bool) (_2!3563 BitStream!2594)) )
))
(declare-fun lt!124422 () tuple2!6858)

(declare-fun checkBitsLoop!0 (BitStream!2594 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6858)

(assert (=> d!24498 (= lt!124422 (checkBitsLoop!0 (_1!3560 lt!124205) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24498 (= (checkBitsLoopPure!0 (_1!3560 lt!124205) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6851 (_2!3563 lt!124422) (_1!3563 lt!124422)))))

(declare-fun bs!5933 () Bool)

(assert (= bs!5933 d!24498))

(declare-fun m!123129 () Bool)

(assert (=> bs!5933 m!123129))

(assert (=> b!77494 d!24498))

(declare-fun d!24500 () Bool)

(assert (=> d!24500 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1510 (buf!1903 (_2!3558 lt!124207)))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1510 (buf!1903 (_2!3558 lt!124207)))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090))) nBits!322))))

(declare-fun bs!5934 () Bool)

(assert (= bs!5934 d!24500))

(declare-fun m!123131 () Bool)

(assert (=> bs!5934 m!123131))

(assert (=> b!77494 d!24500))

(declare-fun d!24502 () Bool)

(assert (=> d!24502 (validate_offset_bits!1 ((_ sign_extend 32) (size!1510 (buf!1903 (_2!3558 lt!124207)))) ((_ sign_extend 32) (currentByte!3717 thiss!1090)) ((_ sign_extend 32) (currentBit!3712 thiss!1090)) nBits!322)))

(declare-fun lt!124425 () Unit!5114)

(declare-fun choose!9 (BitStream!2594 array!3249 (_ BitVec 64) BitStream!2594) Unit!5114)

(assert (=> d!24502 (= lt!124425 (choose!9 thiss!1090 (buf!1903 (_2!3558 lt!124207)) nBits!322 (BitStream!2595 (buf!1903 (_2!3558 lt!124207)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090))))))

(assert (=> d!24502 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1903 (_2!3558 lt!124207)) nBits!322) lt!124425)))

(declare-fun bs!5935 () Bool)

(assert (= bs!5935 d!24502))

(assert (=> bs!5935 m!123015))

(declare-fun m!123133 () Bool)

(assert (=> bs!5935 m!123133))

(assert (=> b!77494 d!24502))

(declare-fun b!77625 () Bool)

(declare-fun res!64153 () Bool)

(declare-fun e!50879 () Bool)

(assert (=> b!77625 (=> (not res!64153) (not e!50879))))

(declare-fun lt!124525 () tuple2!6852)

(assert (=> b!77625 (= res!64153 (isPrefixOf!0 (_1!3560 lt!124525) thiss!1090))))

(declare-fun b!77626 () Bool)

(declare-fun e!50880 () Unit!5114)

(declare-fun Unit!5118 () Unit!5114)

(assert (=> b!77626 (= e!50880 Unit!5118)))

(declare-fun b!77627 () Bool)

(declare-fun lt!124528 () Unit!5114)

(assert (=> b!77627 (= e!50880 lt!124528)))

(declare-fun lt!124520 () (_ BitVec 64))

(assert (=> b!77627 (= lt!124520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124529 () (_ BitVec 64))

(assert (=> b!77627 (= lt!124529 (bitIndex!0 (size!1510 (buf!1903 thiss!1090)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3249 array!3249 (_ BitVec 64) (_ BitVec 64)) Unit!5114)

(assert (=> b!77627 (= lt!124528 (arrayBitRangesEqSymmetric!0 (buf!1903 thiss!1090) (buf!1903 (_2!3558 lt!124207)) lt!124520 lt!124529))))

(assert (=> b!77627 (arrayBitRangesEq!0 (buf!1903 (_2!3558 lt!124207)) (buf!1903 thiss!1090) lt!124520 lt!124529)))

(declare-fun b!77628 () Bool)

(declare-fun res!64151 () Bool)

(assert (=> b!77628 (=> (not res!64151) (not e!50879))))

(assert (=> b!77628 (= res!64151 (isPrefixOf!0 (_2!3560 lt!124525) (_2!3558 lt!124207)))))

(declare-fun b!77624 () Bool)

(declare-fun lt!124531 () (_ BitVec 64))

(declare-fun lt!124516 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2594 (_ BitVec 64)) BitStream!2594)

(assert (=> b!77624 (= e!50879 (= (_1!3560 lt!124525) (withMovedBitIndex!0 (_2!3560 lt!124525) (bvsub lt!124516 lt!124531))))))

(assert (=> b!77624 (or (= (bvand lt!124516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124531 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124516 lt!124531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77624 (= lt!124531 (bitIndex!0 (size!1510 (buf!1903 (_2!3558 lt!124207))) (currentByte!3717 (_2!3558 lt!124207)) (currentBit!3712 (_2!3558 lt!124207))))))

(assert (=> b!77624 (= lt!124516 (bitIndex!0 (size!1510 (buf!1903 thiss!1090)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090)))))

(declare-fun d!24504 () Bool)

(assert (=> d!24504 e!50879))

(declare-fun res!64152 () Bool)

(assert (=> d!24504 (=> (not res!64152) (not e!50879))))

(assert (=> d!24504 (= res!64152 (isPrefixOf!0 (_1!3560 lt!124525) (_2!3560 lt!124525)))))

(declare-fun lt!124532 () BitStream!2594)

(assert (=> d!24504 (= lt!124525 (tuple2!6853 lt!124532 (_2!3558 lt!124207)))))

(declare-fun lt!124519 () Unit!5114)

(declare-fun lt!124523 () Unit!5114)

(assert (=> d!24504 (= lt!124519 lt!124523)))

(assert (=> d!24504 (isPrefixOf!0 lt!124532 (_2!3558 lt!124207))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2594 BitStream!2594 BitStream!2594) Unit!5114)

(assert (=> d!24504 (= lt!124523 (lemmaIsPrefixTransitive!0 lt!124532 (_2!3558 lt!124207) (_2!3558 lt!124207)))))

(declare-fun lt!124517 () Unit!5114)

(declare-fun lt!124524 () Unit!5114)

(assert (=> d!24504 (= lt!124517 lt!124524)))

(assert (=> d!24504 (isPrefixOf!0 lt!124532 (_2!3558 lt!124207))))

(assert (=> d!24504 (= lt!124524 (lemmaIsPrefixTransitive!0 lt!124532 thiss!1090 (_2!3558 lt!124207)))))

(declare-fun lt!124526 () Unit!5114)

(assert (=> d!24504 (= lt!124526 e!50880)))

(declare-fun c!5612 () Bool)

(assert (=> d!24504 (= c!5612 (not (= (size!1510 (buf!1903 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!124518 () Unit!5114)

(declare-fun lt!124521 () Unit!5114)

(assert (=> d!24504 (= lt!124518 lt!124521)))

(assert (=> d!24504 (isPrefixOf!0 (_2!3558 lt!124207) (_2!3558 lt!124207))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2594) Unit!5114)

(assert (=> d!24504 (= lt!124521 (lemmaIsPrefixRefl!0 (_2!3558 lt!124207)))))

(declare-fun lt!124530 () Unit!5114)

(declare-fun lt!124527 () Unit!5114)

(assert (=> d!24504 (= lt!124530 lt!124527)))

(assert (=> d!24504 (= lt!124527 (lemmaIsPrefixRefl!0 (_2!3558 lt!124207)))))

(declare-fun lt!124522 () Unit!5114)

(declare-fun lt!124514 () Unit!5114)

(assert (=> d!24504 (= lt!124522 lt!124514)))

(assert (=> d!24504 (isPrefixOf!0 lt!124532 lt!124532)))

(assert (=> d!24504 (= lt!124514 (lemmaIsPrefixRefl!0 lt!124532))))

(declare-fun lt!124533 () Unit!5114)

(declare-fun lt!124515 () Unit!5114)

(assert (=> d!24504 (= lt!124533 lt!124515)))

(assert (=> d!24504 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24504 (= lt!124515 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24504 (= lt!124532 (BitStream!2595 (buf!1903 (_2!3558 lt!124207)) (currentByte!3717 thiss!1090) (currentBit!3712 thiss!1090)))))

(assert (=> d!24504 (isPrefixOf!0 thiss!1090 (_2!3558 lt!124207))))

(assert (=> d!24504 (= (reader!0 thiss!1090 (_2!3558 lt!124207)) lt!124525)))

(assert (= (and d!24504 c!5612) b!77627))

(assert (= (and d!24504 (not c!5612)) b!77626))

(assert (= (and d!24504 res!64152) b!77625))

(assert (= (and b!77625 res!64153) b!77628))

(assert (= (and b!77628 res!64151) b!77624))

(declare-fun m!123173 () Bool)

(assert (=> b!77628 m!123173))

(declare-fun m!123175 () Bool)

(assert (=> b!77625 m!123175))

(assert (=> b!77627 m!123003))

(declare-fun m!123177 () Bool)

(assert (=> b!77627 m!123177))

(declare-fun m!123179 () Bool)

(assert (=> b!77627 m!123179))

(declare-fun m!123181 () Bool)

(assert (=> d!24504 m!123181))

(declare-fun m!123183 () Bool)

(assert (=> d!24504 m!123183))

(declare-fun m!123185 () Bool)

(assert (=> d!24504 m!123185))

(declare-fun m!123187 () Bool)

(assert (=> d!24504 m!123187))

(declare-fun m!123189 () Bool)

(assert (=> d!24504 m!123189))

(declare-fun m!123191 () Bool)

(assert (=> d!24504 m!123191))

(assert (=> d!24504 m!123007))

(declare-fun m!123193 () Bool)

(assert (=> d!24504 m!123193))

(declare-fun m!123195 () Bool)

(assert (=> d!24504 m!123195))

(declare-fun m!123197 () Bool)

(assert (=> d!24504 m!123197))

(declare-fun m!123199 () Bool)

(assert (=> d!24504 m!123199))

(declare-fun m!123201 () Bool)

(assert (=> b!77624 m!123201))

(assert (=> b!77624 m!123009))

(assert (=> b!77624 m!123003))

(assert (=> b!77494 d!24504))

(declare-fun d!24518 () Bool)

(assert (=> d!24518 (= (array_inv!1356 (buf!1903 thiss!1090)) (bvsge (size!1510 (buf!1903 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!77493 d!24518))

(push 1)


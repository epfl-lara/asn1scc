; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15134 () Bool)

(assert start!15134)

(declare-fun b!77455 () Bool)

(declare-fun res!64007 () Bool)

(declare-fun e!50789 () Bool)

(assert (=> b!77455 (=> (not res!64007) (not e!50789))))

(declare-datatypes ((array!3245 0))(
  ( (array!3246 (arr!2109 (Array (_ BitVec 32) (_ BitVec 8))) (size!1508 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2590 0))(
  ( (BitStream!2591 (buf!1901 array!3245) (currentByte!3715 (_ BitVec 32)) (currentBit!3710 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2590)

(declare-datatypes ((Unit!5110 0))(
  ( (Unit!5111) )
))
(declare-datatypes ((tuple2!6836 0))(
  ( (tuple2!6837 (_1!3552 Unit!5110) (_2!3552 BitStream!2590)) )
))
(declare-fun lt!124171 () tuple2!6836)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77455 (= res!64007 (= (bitIndex!0 (size!1508 (buf!1901 (_2!3552 lt!124171))) (currentByte!3715 (_2!3552 lt!124171)) (currentBit!3710 (_2!3552 lt!124171))) (bvadd (bitIndex!0 (size!1508 (buf!1901 thiss!1090)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090)) nBits!322)))))

(declare-fun lt!124170 () (_ BitVec 64))

(declare-fun e!50787 () Bool)

(declare-fun b!77456 () Bool)

(declare-fun lt!124172 () (_ BitVec 64))

(assert (=> b!77456 (= e!50787 (not (or (not (= lt!124170 (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!124170 (bvand (bvadd lt!124172 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!77456 (= lt!124170 (bvand lt!124172 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77456 (= lt!124172 (bitIndex!0 (size!1508 (buf!1901 thiss!1090)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090)))))

(assert (=> b!77456 e!50789))

(declare-fun res!64008 () Bool)

(assert (=> b!77456 (=> (not res!64008) (not e!50789))))

(assert (=> b!77456 (= res!64008 (= (size!1508 (buf!1901 thiss!1090)) (size!1508 (buf!1901 (_2!3552 lt!124171)))))))

(declare-fun appendNBits!0 (BitStream!2590 (_ BitVec 64) Bool) tuple2!6836)

(assert (=> b!77456 (= lt!124171 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun res!64009 () Bool)

(assert (=> start!15134 (=> (not res!64009) (not e!50787))))

(assert (=> start!15134 (= res!64009 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15134 e!50787))

(assert (=> start!15134 true))

(declare-fun e!50788 () Bool)

(declare-fun inv!12 (BitStream!2590) Bool)

(assert (=> start!15134 (and (inv!12 thiss!1090) e!50788)))

(declare-fun b!77457 () Bool)

(declare-fun res!64006 () Bool)

(assert (=> b!77457 (=> (not res!64006) (not e!50789))))

(declare-fun isPrefixOf!0 (BitStream!2590 BitStream!2590) Bool)

(assert (=> b!77457 (= res!64006 (isPrefixOf!0 thiss!1090 (_2!3552 lt!124171)))))

(declare-fun b!77458 () Bool)

(declare-datatypes ((tuple2!6838 0))(
  ( (tuple2!6839 (_1!3553 BitStream!2590) (_2!3553 Bool)) )
))
(declare-fun lt!124173 () tuple2!6838)

(declare-datatypes ((tuple2!6840 0))(
  ( (tuple2!6841 (_1!3554 BitStream!2590) (_2!3554 BitStream!2590)) )
))
(declare-fun lt!124168 () tuple2!6840)

(assert (=> b!77458 (= e!50789 (not (or (not (_2!3553 lt!124173)) (not (= (_1!3553 lt!124173) (_2!3554 lt!124168))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2590 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6838)

(assert (=> b!77458 (= lt!124173 (checkBitsLoopPure!0 (_1!3554 lt!124168) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1508 (buf!1901 (_2!3552 lt!124171)))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090)) nBits!322)))

(declare-fun lt!124169 () Unit!5110)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2590 array!3245 (_ BitVec 64)) Unit!5110)

(assert (=> b!77458 (= lt!124169 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1901 (_2!3552 lt!124171)) nBits!322))))

(declare-fun reader!0 (BitStream!2590 BitStream!2590) tuple2!6840)

(assert (=> b!77458 (= lt!124168 (reader!0 thiss!1090 (_2!3552 lt!124171)))))

(declare-fun b!77459 () Bool)

(declare-fun res!64005 () Bool)

(assert (=> b!77459 (=> (not res!64005) (not e!50787))))

(assert (=> b!77459 (= res!64005 (validate_offset_bits!1 ((_ sign_extend 32) (size!1508 (buf!1901 thiss!1090))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090)) nBits!322))))

(declare-fun b!77460 () Bool)

(declare-fun array_inv!1354 (array!3245) Bool)

(assert (=> b!77460 (= e!50788 (array_inv!1354 (buf!1901 thiss!1090)))))

(assert (= (and start!15134 res!64009) b!77459))

(assert (= (and b!77459 res!64005) b!77456))

(assert (= (and b!77456 res!64008) b!77455))

(assert (= (and b!77455 res!64007) b!77457))

(assert (= (and b!77457 res!64006) b!77458))

(assert (= start!15134 b!77460))

(declare-fun m!122957 () Bool)

(assert (=> b!77460 m!122957))

(declare-fun m!122959 () Bool)

(assert (=> start!15134 m!122959))

(declare-fun m!122961 () Bool)

(assert (=> b!77455 m!122961))

(declare-fun m!122963 () Bool)

(assert (=> b!77455 m!122963))

(declare-fun m!122965 () Bool)

(assert (=> b!77458 m!122965))

(declare-fun m!122967 () Bool)

(assert (=> b!77458 m!122967))

(declare-fun m!122969 () Bool)

(assert (=> b!77458 m!122969))

(declare-fun m!122971 () Bool)

(assert (=> b!77458 m!122971))

(declare-fun m!122973 () Bool)

(assert (=> b!77457 m!122973))

(assert (=> b!77456 m!122963))

(declare-fun m!122975 () Bool)

(assert (=> b!77456 m!122975))

(declare-fun m!122977 () Bool)

(assert (=> b!77459 m!122977))

(push 1)

(assert (not b!77459))

(assert (not b!77460))

(assert (not b!77456))

(assert (not b!77457))

(assert (not b!77458))

(assert (not b!77455))

(assert (not start!15134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24458 () Bool)

(assert (=> d!24458 (= (array_inv!1354 (buf!1901 thiss!1090)) (bvsge (size!1508 (buf!1901 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!77460 d!24458))

(declare-fun d!24460 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24460 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1508 (buf!1901 thiss!1090))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1508 (buf!1901 thiss!1090))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090))) nBits!322))))

(declare-fun bs!5924 () Bool)

(assert (= bs!5924 d!24460))

(declare-fun m!123025 () Bool)

(assert (=> bs!5924 m!123025))

(assert (=> b!77459 d!24460))

(declare-fun d!24462 () Bool)

(declare-datatypes ((tuple2!6856 0))(
  ( (tuple2!6857 (_1!3562 Bool) (_2!3562 BitStream!2590)) )
))
(declare-fun lt!124215 () tuple2!6856)

(declare-fun checkBitsLoop!0 (BitStream!2590 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6856)

(assert (=> d!24462 (= lt!124215 (checkBitsLoop!0 (_1!3554 lt!124168) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24462 (= (checkBitsLoopPure!0 (_1!3554 lt!124168) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6839 (_2!3562 lt!124215) (_1!3562 lt!124215)))))

(declare-fun bs!5927 () Bool)

(assert (= bs!5927 d!24462))

(declare-fun m!123031 () Bool)

(assert (=> bs!5927 m!123031))

(assert (=> b!77458 d!24462))

(declare-fun d!24468 () Bool)

(assert (=> d!24468 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1508 (buf!1901 (_2!3552 lt!124171)))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1508 (buf!1901 (_2!3552 lt!124171)))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090))) nBits!322))))

(declare-fun bs!5928 () Bool)

(assert (= bs!5928 d!24468))

(declare-fun m!123033 () Bool)

(assert (=> bs!5928 m!123033))

(assert (=> b!77458 d!24468))

(declare-fun d!24470 () Bool)

(assert (=> d!24470 (validate_offset_bits!1 ((_ sign_extend 32) (size!1508 (buf!1901 (_2!3552 lt!124171)))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090)) nBits!322)))

(declare-fun lt!124221 () Unit!5110)

(declare-fun choose!9 (BitStream!2590 array!3245 (_ BitVec 64) BitStream!2590) Unit!5110)

(assert (=> d!24470 (= lt!124221 (choose!9 thiss!1090 (buf!1901 (_2!3552 lt!124171)) nBits!322 (BitStream!2591 (buf!1901 (_2!3552 lt!124171)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090))))))

(assert (=> d!24470 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1901 (_2!3552 lt!124171)) nBits!322) lt!124221)))

(declare-fun bs!5930 () Bool)

(assert (= bs!5930 d!24470))

(assert (=> bs!5930 m!122967))

(declare-fun m!123037 () Bool)

(assert (=> bs!5930 m!123037))

(assert (=> b!77458 d!24470))

(declare-fun lt!124354 () (_ BitVec 64))

(declare-fun lt!124348 () (_ BitVec 64))

(declare-fun lt!124341 () tuple2!6840)

(declare-fun e!50835 () Bool)

(declare-fun b!77537 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2590 (_ BitVec 64)) BitStream!2590)

(assert (=> b!77537 (= e!50835 (= (_1!3554 lt!124341) (withMovedBitIndex!0 (_2!3554 lt!124341) (bvsub lt!124348 lt!124354))))))

(assert (=> b!77537 (or (= (bvand lt!124348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124354 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124348 lt!124354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77537 (= lt!124354 (bitIndex!0 (size!1508 (buf!1901 (_2!3552 lt!124171))) (currentByte!3715 (_2!3552 lt!124171)) (currentBit!3710 (_2!3552 lt!124171))))))

(assert (=> b!77537 (= lt!124348 (bitIndex!0 (size!1508 (buf!1901 thiss!1090)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090)))))

(declare-fun b!77538 () Bool)

(declare-fun res!64070 () Bool)

(assert (=> b!77538 (=> (not res!64070) (not e!50835))))

(assert (=> b!77538 (= res!64070 (isPrefixOf!0 (_2!3554 lt!124341) (_2!3552 lt!124171)))))

(declare-fun b!77539 () Bool)

(declare-fun e!50834 () Unit!5110)

(declare-fun lt!124352 () Unit!5110)

(assert (=> b!77539 (= e!50834 lt!124352)))

(declare-fun lt!124350 () (_ BitVec 64))

(assert (=> b!77539 (= lt!124350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124342 () (_ BitVec 64))

(assert (=> b!77539 (= lt!124342 (bitIndex!0 (size!1508 (buf!1901 thiss!1090)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3245 array!3245 (_ BitVec 64) (_ BitVec 64)) Unit!5110)

(assert (=> b!77539 (= lt!124352 (arrayBitRangesEqSymmetric!0 (buf!1901 thiss!1090) (buf!1901 (_2!3552 lt!124171)) lt!124350 lt!124342))))

(declare-fun arrayBitRangesEq!0 (array!3245 array!3245 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77539 (arrayBitRangesEq!0 (buf!1901 (_2!3552 lt!124171)) (buf!1901 thiss!1090) lt!124350 lt!124342)))

(declare-fun b!77540 () Bool)

(declare-fun Unit!5117 () Unit!5110)

(assert (=> b!77540 (= e!50834 Unit!5117)))

(declare-fun b!77541 () Bool)

(declare-fun res!64072 () Bool)

(assert (=> b!77541 (=> (not res!64072) (not e!50835))))

(assert (=> b!77541 (= res!64072 (isPrefixOf!0 (_1!3554 lt!124341) thiss!1090))))

(declare-fun d!24476 () Bool)

(assert (=> d!24476 e!50835))

(declare-fun res!64071 () Bool)

(assert (=> d!24476 (=> (not res!64071) (not e!50835))))

(assert (=> d!24476 (= res!64071 (isPrefixOf!0 (_1!3554 lt!124341) (_2!3554 lt!124341)))))

(declare-fun lt!124344 () BitStream!2590)

(assert (=> d!24476 (= lt!124341 (tuple2!6841 lt!124344 (_2!3552 lt!124171)))))

(declare-fun lt!124349 () Unit!5110)

(declare-fun lt!124340 () Unit!5110)

(assert (=> d!24476 (= lt!124349 lt!124340)))

(assert (=> d!24476 (isPrefixOf!0 lt!124344 (_2!3552 lt!124171))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2590 BitStream!2590 BitStream!2590) Unit!5110)

(assert (=> d!24476 (= lt!124340 (lemmaIsPrefixTransitive!0 lt!124344 (_2!3552 lt!124171) (_2!3552 lt!124171)))))

(declare-fun lt!124351 () Unit!5110)

(declare-fun lt!124346 () Unit!5110)

(assert (=> d!24476 (= lt!124351 lt!124346)))

(assert (=> d!24476 (isPrefixOf!0 lt!124344 (_2!3552 lt!124171))))

(assert (=> d!24476 (= lt!124346 (lemmaIsPrefixTransitive!0 lt!124344 thiss!1090 (_2!3552 lt!124171)))))

(declare-fun lt!124357 () Unit!5110)

(assert (=> d!24476 (= lt!124357 e!50834)))

(declare-fun c!5609 () Bool)

(assert (=> d!24476 (= c!5609 (not (= (size!1508 (buf!1901 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!124345 () Unit!5110)

(declare-fun lt!124343 () Unit!5110)

(assert (=> d!24476 (= lt!124345 lt!124343)))

(assert (=> d!24476 (isPrefixOf!0 (_2!3552 lt!124171) (_2!3552 lt!124171))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2590) Unit!5110)

(assert (=> d!24476 (= lt!124343 (lemmaIsPrefixRefl!0 (_2!3552 lt!124171)))))

(declare-fun lt!124358 () Unit!5110)

(declare-fun lt!124347 () Unit!5110)

(assert (=> d!24476 (= lt!124358 lt!124347)))

(assert (=> d!24476 (= lt!124347 (lemmaIsPrefixRefl!0 (_2!3552 lt!124171)))))

(declare-fun lt!124356 () Unit!5110)

(declare-fun lt!124353 () Unit!5110)

(assert (=> d!24476 (= lt!124356 lt!124353)))

(assert (=> d!24476 (isPrefixOf!0 lt!124344 lt!124344)))

(assert (=> d!24476 (= lt!124353 (lemmaIsPrefixRefl!0 lt!124344))))

(declare-fun lt!124355 () Unit!5110)

(declare-fun lt!124359 () Unit!5110)

(assert (=> d!24476 (= lt!124355 lt!124359)))

(assert (=> d!24476 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24476 (= lt!124359 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24476 (= lt!124344 (BitStream!2591 (buf!1901 (_2!3552 lt!124171)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090)))))

(assert (=> d!24476 (isPrefixOf!0 thiss!1090 (_2!3552 lt!124171))))

(assert (=> d!24476 (= (reader!0 thiss!1090 (_2!3552 lt!124171)) lt!124341)))

(assert (= (and d!24476 c!5609) b!77539))

(assert (= (and d!24476 (not c!5609)) b!77540))

(assert (= (and d!24476 res!64071) b!77541))

(assert (= (and b!77541 res!64072) b!77538))

(assert (= (and b!77538 res!64070) b!77537))

(declare-fun m!123075 () Bool)

(assert (=> b!77541 m!123075))

(assert (=> b!77539 m!122963))

(declare-fun m!123077 () Bool)

(assert (=> b!77539 m!123077))

(declare-fun m!123079 () Bool)

(assert (=> b!77539 m!123079))

(declare-fun m!123081 () Bool)

(assert (=> b!77537 m!123081))

(assert (=> b!77537 m!122961))

(assert (=> b!77537 m!122963))

(assert (=> d!24476 m!122973))

(declare-fun m!123083 () Bool)

(assert (=> d!24476 m!123083))

(declare-fun m!123085 () Bool)

(assert (=> d!24476 m!123085))

(declare-fun m!123087 () Bool)

(assert (=> d!24476 m!123087))

(declare-fun m!123089 () Bool)

(assert (=> d!24476 m!123089))

(declare-fun m!123091 () Bool)

(assert (=> d!24476 m!123091))

(declare-fun m!123093 () Bool)

(assert (=> d!24476 m!123093))

(declare-fun m!123095 () Bool)

(assert (=> d!24476 m!123095))

(declare-fun m!123097 () Bool)

(assert (=> d!24476 m!123097))

(declare-fun m!123099 () Bool)

(assert (=> d!24476 m!123099))

(declare-fun m!123101 () Bool)

(assert (=> d!24476 m!123101))

(declare-fun m!123103 () Bool)

(assert (=> b!77538 m!123103))

(assert (=> b!77458 d!24476))

(declare-fun d!24488 () Bool)

(declare-fun res!64081 () Bool)

(declare-fun e!50841 () Bool)

(assert (=> d!24488 (=> (not res!64081) (not e!50841))))

(assert (=> d!24488 (= res!64081 (= (size!1508 (buf!1901 thiss!1090)) (size!1508 (buf!1901 (_2!3552 lt!124171)))))))

(assert (=> d!24488 (= (isPrefixOf!0 thiss!1090 (_2!3552 lt!124171)) e!50841)))

(declare-fun b!77548 () Bool)

(declare-fun res!64080 () Bool)

(assert (=> b!77548 (=> (not res!64080) (not e!50841))))

(assert (=> b!77548 (= res!64080 (bvsle (bitIndex!0 (size!1508 (buf!1901 thiss!1090)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090)) (bitIndex!0 (size!1508 (buf!1901 (_2!3552 lt!124171))) (currentByte!3715 (_2!3552 lt!124171)) (currentBit!3710 (_2!3552 lt!124171)))))))

(declare-fun b!77549 () Bool)

(declare-fun e!50840 () Bool)

(assert (=> b!77549 (= e!50841 e!50840)))

(declare-fun res!64079 () Bool)

(assert (=> b!77549 (=> res!64079 e!50840)))

(assert (=> b!77549 (= res!64079 (= (size!1508 (buf!1901 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!77550 () Bool)

(assert (=> b!77550 (= e!50840 (arrayBitRangesEq!0 (buf!1901 thiss!1090) (buf!1901 (_2!3552 lt!124171)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1508 (buf!1901 thiss!1090)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090))))))

(assert (= (and d!24488 res!64081) b!77548))

(assert (= (and b!77548 res!64080) b!77549))

(assert (= (and b!77549 (not res!64079)) b!77550))

(assert (=> b!77548 m!122963))

(assert (=> b!77548 m!122961))

(assert (=> b!77550 m!122963))

(assert (=> b!77550 m!122963))

(declare-fun m!123105 () Bool)

(assert (=> b!77550 m!123105))

(assert (=> b!77457 d!24488))

(declare-fun d!24490 () Bool)

(declare-fun e!50847 () Bool)

(assert (=> d!24490 e!50847))

(declare-fun res!64092 () Bool)

(assert (=> d!24490 (=> (not res!64092) (not e!50847))))

(declare-fun lt!124390 () (_ BitVec 64))

(declare-fun lt!124391 () (_ BitVec 64))

(declare-fun lt!124392 () (_ BitVec 64))

(assert (=> d!24490 (= res!64092 (= lt!124392 (bvsub lt!124390 lt!124391)))))

(assert (=> d!24490 (or (= (bvand lt!124390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124391 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124390 lt!124391) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24490 (= lt!124391 (remainingBits!0 ((_ sign_extend 32) (size!1508 (buf!1901 thiss!1090))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090))))))

(declare-fun lt!124394 () (_ BitVec 64))

(declare-fun lt!124393 () (_ BitVec 64))

(assert (=> d!24490 (= lt!124390 (bvmul lt!124394 lt!124393))))

(assert (=> d!24490 (or (= lt!124394 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124393 (bvsdiv (bvmul lt!124394 lt!124393) lt!124394)))))

(assert (=> d!24490 (= lt!124393 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24490 (= lt!124394 ((_ sign_extend 32) (size!1508 (buf!1901 thiss!1090))))))

(assert (=> d!24490 (= lt!124392 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3715 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3710 thiss!1090))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24490 (invariant!0 (currentBit!3710 thiss!1090) (currentByte!3715 thiss!1090) (size!1508 (buf!1901 thiss!1090)))))

(assert (=> d!24490 (= (bitIndex!0 (size!1508 (buf!1901 thiss!1090)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090)) lt!124392)))

(declare-fun b!77561 () Bool)

(declare-fun res!64093 () Bool)

(assert (=> b!77561 (=> (not res!64093) (not e!50847))))

(assert (=> b!77561 (= res!64093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124392))))

(declare-fun b!77562 () Bool)

(declare-fun lt!124395 () (_ BitVec 64))

(assert (=> b!77562 (= e!50847 (bvsle lt!124392 (bvmul lt!124395 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77562 (or (= lt!124395 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124395 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124395)))))

(assert (=> b!77562 (= lt!124395 ((_ sign_extend 32) (size!1508 (buf!1901 thiss!1090))))))

(assert (= (and d!24490 res!64092) b!77561))

(assert (= (and b!77561 res!64093) b!77562))

(assert (=> d!24490 m!123025))

(declare-fun m!123109 () Bool)

(assert (=> d!24490 m!123109))

(assert (=> b!77456 d!24490))

(declare-fun d!24494 () Bool)

(declare-fun e!50871 () Bool)

(assert (=> d!24494 e!50871))

(declare-fun res!64136 () Bool)

(assert (=> d!24494 (=> (not res!64136) (not e!50871))))

(declare-fun lt!124465 () tuple2!6836)

(assert (=> d!24494 (= res!64136 (= (size!1508 (buf!1901 thiss!1090)) (size!1508 (buf!1901 (_2!3552 lt!124465)))))))

(declare-fun choose!36 (BitStream!2590 (_ BitVec 64) Bool) tuple2!6836)

(assert (=> d!24494 (= lt!124465 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24494 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24494 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!124465)))

(declare-fun b!77606 () Bool)

(declare-fun res!64139 () Bool)

(assert (=> b!77606 (=> (not res!64139) (not e!50871))))

(assert (=> b!77606 (= res!64139 (isPrefixOf!0 thiss!1090 (_2!3552 lt!124465)))))

(declare-fun b!77607 () Bool)

(declare-fun lt!124462 () tuple2!6838)

(declare-fun lt!124466 () tuple2!6840)

(assert (=> b!77607 (= e!50871 (and (_2!3553 lt!124462) (= (_1!3553 lt!124462) (_2!3554 lt!124466))))))

(assert (=> b!77607 (= lt!124462 (checkBitsLoopPure!0 (_1!3554 lt!124466) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!124463 () Unit!5110)

(declare-fun lt!124467 () Unit!5110)

(assert (=> b!77607 (= lt!124463 lt!124467)))

(assert (=> b!77607 (validate_offset_bits!1 ((_ sign_extend 32) (size!1508 (buf!1901 (_2!3552 lt!124465)))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090)) nBits!322)))

(assert (=> b!77607 (= lt!124467 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1901 (_2!3552 lt!124465)) nBits!322))))

(declare-fun e!50870 () Bool)

(assert (=> b!77607 e!50870))

(declare-fun res!64137 () Bool)

(assert (=> b!77607 (=> (not res!64137) (not e!50870))))

(assert (=> b!77607 (= res!64137 (and (= (size!1508 (buf!1901 thiss!1090)) (size!1508 (buf!1901 (_2!3552 lt!124465)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77607 (= lt!124466 (reader!0 thiss!1090 (_2!3552 lt!124465)))))

(declare-fun b!77605 () Bool)

(declare-fun res!64138 () Bool)

(assert (=> b!77605 (=> (not res!64138) (not e!50871))))

(declare-fun lt!124464 () (_ BitVec 64))

(assert (=> b!77605 (= res!64138 (= (bitIndex!0 (size!1508 (buf!1901 (_2!3552 lt!124465))) (currentByte!3715 (_2!3552 lt!124465)) (currentBit!3710 (_2!3552 lt!124465))) (bvadd lt!124464 nBits!322)))))

(assert (=> b!77605 (or (not (= (bvand lt!124464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124464 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77605 (= lt!124464 (bitIndex!0 (size!1508 (buf!1901 thiss!1090)) (currentByte!3715 thiss!1090) (currentBit!3710 thiss!1090)))))

(declare-fun b!77608 () Bool)

(assert (=> b!77608 (= e!50870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1508 (buf!1901 thiss!1090))) ((_ sign_extend 32) (currentByte!3715 thiss!1090)) ((_ sign_extend 32) (currentBit!3710 thiss!1090)) nBits!322))))

(assert (= (and d!24494 res!64136) b!77605))

(assert (= (and b!77605 res!64138) b!77606))

(assert (= (and b!77606 res!64139) b!77607))

(assert (= (and b!77607 res!64137) b!77608))

(declare-fun m!123155 () Bool)

(assert (=> d!24494 m!123155))

(assert (=> b!77608 m!122977))

(declare-fun m!123157 () Bool)

(assert (=> b!77607 m!123157))

(declare-fun m!123159 () Bool)

(assert (=> b!77607 m!123159))

(declare-fun m!123161 () Bool)

(assert (=> b!77607 m!123161))

(declare-fun m!123163 () Bool)

(assert (=> b!77607 m!123163))

(declare-fun m!123165 () Bool)

(assert (=> b!77605 m!123165))

(assert (=> b!77605 m!122963))

(declare-fun m!123167 () Bool)

(assert (=> b!77606 m!123167))

(assert (=> b!77456 d!24494))

(declare-fun d!24514 () Bool)

(assert (=> d!24514 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3710 thiss!1090) (currentByte!3715 thiss!1090) (size!1508 (buf!1901 thiss!1090))))))

(declare-fun bs!5937 () Bool)

(assert (= bs!5937 d!24514))

(assert (=> bs!5937 m!123109))

(assert (=> start!15134 d!24514))

(declare-fun d!24516 () Bool)

(declare-fun e!50876 () Bool)

(assert (=> d!24516 e!50876))

(declare-fun res!64143 () Bool)

(assert (=> d!24516 (=> (not res!64143) (not e!50876))))

(declare-fun lt!124506 () (_ BitVec 64))

(declare-fun lt!124504 () (_ BitVec 64))

(declare-fun lt!124505 () (_ BitVec 64))

(assert (=> d!24516 (= res!64143 (= lt!124506 (bvsub lt!124504 lt!124505)))))

(assert (=> d!24516 (or (= (bvand lt!124504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124504 lt!124505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24516 (= lt!124505 (remainingBits!0 ((_ sign_extend 32) (size!1508 (buf!1901 (_2!3552 lt!124171)))) ((_ sign_extend 32) (currentByte!3715 (_2!3552 lt!124171))) ((_ sign_extend 32) (currentBit!3710 (_2!3552 lt!124171)))))))

(declare-fun lt!124508 () (_ BitVec 64))

(declare-fun lt!124507 () (_ BitVec 64))

(assert (=> d!24516 (= lt!124504 (bvmul lt!124508 lt!124507))))

(assert (=> d!24516 (or (= lt!124508 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124507 (bvsdiv (bvmul lt!124508 lt!124507) lt!124508)))))

(assert (=> d!24516 (= lt!124507 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24516 (= lt!124508 ((_ sign_extend 32) (size!1508 (buf!1901 (_2!3552 lt!124171)))))))

(assert (=> d!24516 (= lt!124506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3715 (_2!3552 lt!124171))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3710 (_2!3552 lt!124171)))))))

(assert (=> d!24516 (invariant!0 (currentBit!3710 (_2!3552 lt!124171)) (currentByte!3715 (_2!3552 lt!124171)) (size!1508 (buf!1901 (_2!3552 lt!124171))))))

(assert (=> d!24516 (= (bitIndex!0 (size!1508 (buf!1901 (_2!3552 lt!124171))) (currentByte!3715 (_2!3552 lt!124171)) (currentBit!3710 (_2!3552 lt!124171))) lt!124506)))

(declare-fun b!77616 () Bool)

(declare-fun res!64144 () Bool)

(assert (=> b!77616 (=> (not res!64144) (not e!50876))))

(assert (=> b!77616 (= res!64144 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124506))))

(declare-fun b!77617 () Bool)

(declare-fun lt!124509 () (_ BitVec 64))

(assert (=> b!77617 (= e!50876 (bvsle lt!124506 (bvmul lt!124509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77617 (or (= lt!124509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124509)))))

(assert (=> b!77617 (= lt!124509 ((_ sign_extend 32) (size!1508 (buf!1901 (_2!3552 lt!124171)))))))

(assert (= (and d!24516 res!64143) b!77616))

(assert (= (and b!77616 res!64144) b!77617))

(declare-fun m!123169 () Bool)

(assert (=> d!24516 m!123169))

(declare-fun m!123171 () Bool)

(assert (=> d!24516 m!123171))

(assert (=> b!77455 d!24516))

(assert (=> b!77455 d!24490))

(push 1)

(assert (not b!77550))

(assert (not d!24462))

(assert (not b!77608))

(assert (not b!77605))

(assert (not d!24516))

(assert (not b!77539))

(assert (not b!77541))

(assert (not d!24476))

(assert (not b!77538))

(assert (not d!24514))

(assert (not b!77606))

(assert (not d!24460))

(assert (not d!24470))

(assert (not d!24494))

(assert (not b!77607))

(assert (not d!24468))

(assert (not d!24490))

(assert (not b!77548))

(assert (not b!77537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


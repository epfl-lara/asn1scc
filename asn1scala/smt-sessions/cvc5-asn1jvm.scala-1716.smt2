; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47390 () Bool)

(assert start!47390)

(declare-fun b!226047 () Bool)

(declare-fun e!154464 () Bool)

(declare-datatypes ((array!11291 0))(
  ( (array!11292 (arr!5911 (Array (_ BitVec 32) (_ BitVec 8))) (size!4954 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9004 0))(
  ( (BitStream!9005 (buf!5495 array!11291) (currentByte!10297 (_ BitVec 32)) (currentBit!10292 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9004)

(declare-fun array_inv!4695 (array!11291) Bool)

(assert (=> b!226047 (= e!154464 (array_inv!4695 (buf!5495 thiss!1870)))))

(declare-fun b!226045 () Bool)

(declare-fun res!189687 () Bool)

(declare-fun e!154465 () Bool)

(assert (=> b!226045 (=> (not res!189687) (not e!154465))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226045 (= res!189687 (bvslt i!761 to!496))))

(declare-fun b!226046 () Bool)

(declare-fun lt!359146 () (_ BitVec 64))

(declare-fun lt!359145 () (_ BitVec 64))

(assert (=> b!226046 (= e!154465 (not (or (not (= lt!359146 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!359146 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!359145) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226046 (= lt!359146 (bvand lt!359145 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226046 (= lt!359145 (bitIndex!0 (size!4954 (buf!5495 thiss!1870)) (currentByte!10297 thiss!1870) (currentBit!10292 thiss!1870)))))

(declare-fun arr!308 () array!11291)

(declare-datatypes ((tuple2!19358 0))(
  ( (tuple2!19359 (_1!10466 (_ BitVec 8)) (_2!10466 BitStream!9004)) )
))
(declare-fun lt!359147 () tuple2!19358)

(declare-datatypes ((Unit!16653 0))(
  ( (Unit!16654) )
))
(declare-datatypes ((tuple3!1290 0))(
  ( (tuple3!1291 (_1!10467 Unit!16653) (_2!10467 BitStream!9004) (_3!787 array!11291)) )
))
(declare-fun lt!359148 () tuple3!1290)

(declare-fun readByteArrayLoop!0 (BitStream!9004 array!11291 (_ BitVec 32) (_ BitVec 32)) tuple3!1290)

(assert (=> b!226046 (= lt!359148 (readByteArrayLoop!0 (_2!10466 lt!359147) (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226046 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4954 (buf!5495 (_2!10466 lt!359147)))) ((_ sign_extend 32) (currentByte!10297 (_2!10466 lt!359147))) ((_ sign_extend 32) (currentBit!10292 (_2!10466 lt!359147))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!359144 () Unit!16653)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9004 BitStream!9004 (_ BitVec 64) (_ BitVec 32)) Unit!16653)

(assert (=> b!226046 (= lt!359144 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10466 lt!359147) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9004) tuple2!19358)

(assert (=> b!226046 (= lt!359147 (readByte!0 thiss!1870))))

(declare-fun res!189686 () Bool)

(assert (=> start!47390 (=> (not res!189686) (not e!154465))))

(assert (=> start!47390 (= res!189686 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4954 arr!308))))))

(assert (=> start!47390 e!154465))

(assert (=> start!47390 true))

(assert (=> start!47390 (array_inv!4695 arr!308)))

(declare-fun inv!12 (BitStream!9004) Bool)

(assert (=> start!47390 (and (inv!12 thiss!1870) e!154464)))

(declare-fun b!226044 () Bool)

(declare-fun res!189688 () Bool)

(assert (=> b!226044 (=> (not res!189688) (not e!154465))))

(assert (=> b!226044 (= res!189688 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4954 (buf!5495 thiss!1870))) ((_ sign_extend 32) (currentByte!10297 thiss!1870)) ((_ sign_extend 32) (currentBit!10292 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47390 res!189686) b!226044))

(assert (= (and b!226044 res!189688) b!226045))

(assert (= (and b!226045 res!189687) b!226046))

(assert (= start!47390 b!226047))

(declare-fun m!347089 () Bool)

(assert (=> b!226047 m!347089))

(declare-fun m!347091 () Bool)

(assert (=> b!226046 m!347091))

(declare-fun m!347093 () Bool)

(assert (=> b!226046 m!347093))

(declare-fun m!347095 () Bool)

(assert (=> b!226046 m!347095))

(declare-fun m!347097 () Bool)

(assert (=> b!226046 m!347097))

(declare-fun m!347099 () Bool)

(assert (=> b!226046 m!347099))

(declare-fun m!347101 () Bool)

(assert (=> b!226046 m!347101))

(declare-fun m!347103 () Bool)

(assert (=> start!47390 m!347103))

(declare-fun m!347105 () Bool)

(assert (=> start!47390 m!347105))

(declare-fun m!347107 () Bool)

(assert (=> b!226044 m!347107))

(push 1)

(assert (not b!226044))

(assert (not b!226046))

(assert (not b!226047))

(assert (not start!47390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76700 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76700 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4954 (buf!5495 thiss!1870))) ((_ sign_extend 32) (currentByte!10297 thiss!1870)) ((_ sign_extend 32) (currentBit!10292 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4954 (buf!5495 thiss!1870))) ((_ sign_extend 32) (currentByte!10297 thiss!1870)) ((_ sign_extend 32) (currentBit!10292 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18753 () Bool)

(assert (= bs!18753 d!76700))

(declare-fun m!347149 () Bool)

(assert (=> bs!18753 m!347149))

(assert (=> b!226044 d!76700))

(declare-fun d!76702 () Bool)

(declare-fun lt!359213 () (_ BitVec 8))

(declare-fun lt!359211 () (_ BitVec 8))

(assert (=> d!76702 (= lt!359213 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5911 (buf!5495 thiss!1870)) (currentByte!10297 thiss!1870))) ((_ sign_extend 24) lt!359211))))))

(assert (=> d!76702 (= lt!359211 ((_ extract 7 0) (currentBit!10292 thiss!1870)))))

(declare-fun e!154499 () Bool)

(assert (=> d!76702 e!154499))

(declare-fun res!189718 () Bool)

(assert (=> d!76702 (=> (not res!189718) (not e!154499))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76702 (= res!189718 (validate_offset_bits!1 ((_ sign_extend 32) (size!4954 (buf!5495 thiss!1870))) ((_ sign_extend 32) (currentByte!10297 thiss!1870)) ((_ sign_extend 32) (currentBit!10292 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19364 0))(
  ( (tuple2!19365 (_1!10472 Unit!16653) (_2!10472 (_ BitVec 8))) )
))
(declare-fun Unit!16659 () Unit!16653)

(declare-fun Unit!16660 () Unit!16653)

(assert (=> d!76702 (= (readByte!0 thiss!1870) (tuple2!19359 (_2!10472 (ite (bvsgt ((_ sign_extend 24) lt!359211) #b00000000000000000000000000000000) (tuple2!19365 Unit!16659 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359213) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5911 (buf!5495 thiss!1870)) (bvadd (currentByte!10297 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359211)))))))) (tuple2!19365 Unit!16660 lt!359213))) (BitStream!9005 (buf!5495 thiss!1870) (bvadd (currentByte!10297 thiss!1870) #b00000000000000000000000000000001) (currentBit!10292 thiss!1870))))))

(declare-fun b!226080 () Bool)

(declare-fun e!154498 () Bool)

(assert (=> b!226080 (= e!154499 e!154498)))

(declare-fun res!189717 () Bool)

(assert (=> b!226080 (=> (not res!189717) (not e!154498))))

(declare-fun lt!359212 () tuple2!19358)

(assert (=> b!226080 (= res!189717 (= (buf!5495 (_2!10466 lt!359212)) (buf!5495 thiss!1870)))))

(declare-fun lt!359207 () (_ BitVec 8))

(declare-fun lt!359209 () (_ BitVec 8))

(declare-fun Unit!16661 () Unit!16653)

(declare-fun Unit!16662 () Unit!16653)

(assert (=> b!226080 (= lt!359212 (tuple2!19359 (_2!10472 (ite (bvsgt ((_ sign_extend 24) lt!359207) #b00000000000000000000000000000000) (tuple2!19365 Unit!16661 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359209) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5911 (buf!5495 thiss!1870)) (bvadd (currentByte!10297 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359207)))))))) (tuple2!19365 Unit!16662 lt!359209))) (BitStream!9005 (buf!5495 thiss!1870) (bvadd (currentByte!10297 thiss!1870) #b00000000000000000000000000000001) (currentBit!10292 thiss!1870))))))

(assert (=> b!226080 (= lt!359209 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5911 (buf!5495 thiss!1870)) (currentByte!10297 thiss!1870))) ((_ sign_extend 24) lt!359207))))))

(assert (=> b!226080 (= lt!359207 ((_ extract 7 0) (currentBit!10292 thiss!1870)))))

(declare-fun b!226081 () Bool)

(declare-fun lt!359208 () (_ BitVec 64))

(declare-fun lt!359210 () (_ BitVec 64))

(assert (=> b!226081 (= e!154498 (= (bitIndex!0 (size!4954 (buf!5495 (_2!10466 lt!359212))) (currentByte!10297 (_2!10466 lt!359212)) (currentBit!10292 (_2!10466 lt!359212))) (bvadd lt!359208 lt!359210)))))

(assert (=> b!226081 (or (not (= (bvand lt!359208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359210 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359208 lt!359210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226081 (= lt!359210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226081 (= lt!359208 (bitIndex!0 (size!4954 (buf!5495 thiss!1870)) (currentByte!10297 thiss!1870) (currentBit!10292 thiss!1870)))))

(assert (= (and d!76702 res!189718) b!226080))

(assert (= (and b!226080 res!189717) b!226081))

(declare-fun m!347155 () Bool)

(assert (=> d!76702 m!347155))

(declare-fun m!347157 () Bool)

(assert (=> d!76702 m!347157))

(declare-fun m!347159 () Bool)

(assert (=> d!76702 m!347159))

(assert (=> b!226080 m!347159))

(assert (=> b!226080 m!347155))

(declare-fun m!347161 () Bool)

(assert (=> b!226081 m!347161))

(assert (=> b!226081 m!347101))

(assert (=> b!226046 d!76702))

(declare-fun b!226110 () Bool)

(declare-fun lt!359420 () tuple3!1290)

(declare-fun e!154520 () Bool)

(declare-fun arrayRangesEq!811 (array!11291 array!11291 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226110 (= e!154520 (arrayRangesEq!811 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)) (_3!787 lt!359420) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun c!11154 () Bool)

(declare-fun lt!359394 () tuple2!19358)

(declare-fun bm!3676 () Bool)

(declare-fun call!3680 () (_ BitVec 64))

(assert (=> bm!3676 (= call!3680 (bitIndex!0 (ite c!11154 (size!4954 (buf!5495 (_2!10466 lt!359394))) (size!4954 (buf!5495 (_2!10466 lt!359147)))) (ite c!11154 (currentByte!10297 (_2!10466 lt!359394)) (currentByte!10297 (_2!10466 lt!359147))) (ite c!11154 (currentBit!10292 (_2!10466 lt!359394)) (currentBit!10292 (_2!10466 lt!359147)))))))

(declare-fun b!226111 () Bool)

(declare-fun e!154522 () tuple3!1290)

(declare-fun lt!359400 () Unit!16653)

(assert (=> b!226111 (= e!154522 (tuple3!1291 lt!359400 (_2!10466 lt!359147) (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))))))

(assert (=> b!226111 (= call!3680 call!3680)))

(declare-fun lt!359412 () Unit!16653)

(declare-fun Unit!16667 () Unit!16653)

(assert (=> b!226111 (= lt!359412 Unit!16667)))

(declare-fun lt!359404 () Unit!16653)

(declare-fun arrayRangesEqReflexiveLemma!115 (array!11291) Unit!16653)

(assert (=> b!226111 (= lt!359404 (arrayRangesEqReflexiveLemma!115 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))))))

(declare-fun call!3681 () Bool)

(assert (=> b!226111 call!3681))

(declare-fun lt!359419 () Unit!16653)

(assert (=> b!226111 (= lt!359419 lt!359404)))

(declare-fun lt!359413 () array!11291)

(assert (=> b!226111 (= lt!359413 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)))))

(declare-fun lt!359388 () array!11291)

(assert (=> b!226111 (= lt!359388 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)))))

(declare-fun lt!359402 () (_ BitVec 32))

(assert (=> b!226111 (= lt!359402 #b00000000000000000000000000000000)))

(declare-fun lt!359407 () (_ BitVec 32))

(assert (=> b!226111 (= lt!359407 (size!4954 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))))))

(declare-fun lt!359393 () (_ BitVec 32))

(assert (=> b!226111 (= lt!359393 #b00000000000000000000000000000000)))

(declare-fun lt!359411 () (_ BitVec 32))

(assert (=> b!226111 (= lt!359411 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!100 (array!11291 array!11291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16653)

(assert (=> b!226111 (= lt!359400 (arrayRangesEqSlicedLemma!100 lt!359413 lt!359388 lt!359402 lt!359407 lt!359393 lt!359411))))

(declare-fun call!3679 () Bool)

(assert (=> b!226111 call!3679))

(declare-fun b!226112 () Bool)

(declare-fun res!189742 () Bool)

(assert (=> b!226112 (=> (not res!189742) (not e!154520))))

(assert (=> b!226112 (= res!189742 (and (= (buf!5495 (_2!10466 lt!359147)) (buf!5495 (_2!10467 lt!359420))) (= (size!4954 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))) (size!4954 (_3!787 lt!359420)))))))

(declare-fun e!154521 () Bool)

(declare-fun b!226113 () Bool)

(declare-datatypes ((tuple2!19368 0))(
  ( (tuple2!19369 (_1!10474 BitStream!9004) (_2!10474 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9004) tuple2!19368)

(assert (=> b!226113 (= e!154521 (= (select (arr!5911 (_3!787 lt!359420)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10474 (readBytePure!0 (_2!10466 lt!359147)))))))

(assert (=> b!226113 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4954 (_3!787 lt!359420))))))

(declare-fun lt!359401 () tuple3!1290)

(declare-fun bm!3677 () Bool)

(assert (=> bm!3677 (= call!3681 (arrayRangesEq!811 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)) (ite c!11154 (_3!787 lt!359401) (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))) #b00000000000000000000000000000000 (ite c!11154 (bvadd #b00000000000000000000000000000001 i!761) (size!4954 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))))))))

(declare-fun b!226114 () Bool)

(declare-fun lt!359390 () Unit!16653)

(assert (=> b!226114 (= e!154522 (tuple3!1291 lt!359390 (_2!10467 lt!359401) (_3!787 lt!359401)))))

(assert (=> b!226114 (= lt!359394 (readByte!0 (_2!10466 lt!359147)))))

(declare-fun lt!359416 () array!11291)

(assert (=> b!226114 (= lt!359416 (array!11292 (store (arr!5911 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10466 lt!359394)) (size!4954 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)))))))

(declare-fun lt!359399 () (_ BitVec 64))

(assert (=> b!226114 (= lt!359399 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!359397 () (_ BitVec 32))

(assert (=> b!226114 (= lt!359397 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!359386 () Unit!16653)

(assert (=> b!226114 (= lt!359386 (validateOffsetBytesFromBitIndexLemma!0 (_2!10466 lt!359147) (_2!10466 lt!359394) lt!359399 lt!359397))))

(assert (=> b!226114 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4954 (buf!5495 (_2!10466 lt!359394)))) ((_ sign_extend 32) (currentByte!10297 (_2!10466 lt!359394))) ((_ sign_extend 32) (currentBit!10292 (_2!10466 lt!359394))) (bvsub lt!359397 ((_ extract 31 0) (bvsdiv (bvadd lt!359399 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!359418 () Unit!16653)

(assert (=> b!226114 (= lt!359418 lt!359386)))

(assert (=> b!226114 (= lt!359401 (readByteArrayLoop!0 (_2!10466 lt!359394) lt!359416 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226114 (= call!3680 (bvadd (bitIndex!0 (size!4954 (buf!5495 (_2!10466 lt!359147))) (currentByte!10297 (_2!10466 lt!359147)) (currentBit!10292 (_2!10466 lt!359147))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!359391 () Unit!16653)

(declare-fun Unit!16669 () Unit!16653)

(assert (=> b!226114 (= lt!359391 Unit!16669)))

(assert (=> b!226114 (= (bvadd call!3680 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4954 (buf!5495 (_2!10467 lt!359401))) (currentByte!10297 (_2!10467 lt!359401)) (currentBit!10292 (_2!10467 lt!359401))))))

(declare-fun lt!359406 () Unit!16653)

(declare-fun Unit!16670 () Unit!16653)

(assert (=> b!226114 (= lt!359406 Unit!16670)))

(assert (=> b!226114 (= (bvadd (bitIndex!0 (size!4954 (buf!5495 (_2!10466 lt!359147))) (currentByte!10297 (_2!10466 lt!359147)) (currentBit!10292 (_2!10466 lt!359147))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4954 (buf!5495 (_2!10467 lt!359401))) (currentByte!10297 (_2!10467 lt!359401)) (currentBit!10292 (_2!10467 lt!359401))))))

(declare-fun lt!359417 () Unit!16653)

(declare-fun Unit!16671 () Unit!16653)

(assert (=> b!226114 (= lt!359417 Unit!16671)))

(assert (=> b!226114 (and (= (buf!5495 (_2!10466 lt!359147)) (buf!5495 (_2!10467 lt!359401))) (= (size!4954 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))) (size!4954 (_3!787 lt!359401))))))

(declare-fun lt!359392 () Unit!16653)

(declare-fun Unit!16672 () Unit!16653)

(assert (=> b!226114 (= lt!359392 Unit!16672)))

(declare-fun lt!359408 () Unit!16653)

(declare-fun arrayUpdatedAtPrefixLemma!370 (array!11291 (_ BitVec 32) (_ BitVec 8)) Unit!16653)

(assert (=> b!226114 (= lt!359408 (arrayUpdatedAtPrefixLemma!370 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10466 lt!359394)))))

(assert (=> b!226114 call!3679))

(declare-fun lt!359409 () Unit!16653)

(assert (=> b!226114 (= lt!359409 lt!359408)))

(declare-fun lt!359403 () (_ BitVec 32))

(assert (=> b!226114 (= lt!359403 #b00000000000000000000000000000000)))

(declare-fun lt!359395 () Unit!16653)

(declare-fun arrayRangesEqTransitive!249 (array!11291 array!11291 array!11291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16653)

(assert (=> b!226114 (= lt!359395 (arrayRangesEqTransitive!249 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)) lt!359416 (_3!787 lt!359401) lt!359403 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226114 (arrayRangesEq!811 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)) (_3!787 lt!359401) lt!359403 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!359414 () Unit!16653)

(assert (=> b!226114 (= lt!359414 lt!359395)))

(assert (=> b!226114 call!3681))

(declare-fun lt!359396 () Unit!16653)

(declare-fun Unit!16673 () Unit!16653)

(assert (=> b!226114 (= lt!359396 Unit!16673)))

(declare-fun lt!359387 () Unit!16653)

(declare-fun arrayRangesEqImpliesEq!100 (array!11291 array!11291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16653)

(assert (=> b!226114 (= lt!359387 (arrayRangesEqImpliesEq!100 lt!359416 (_3!787 lt!359401) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226114 (= (select (store (arr!5911 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10466 lt!359394)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5911 (_3!787 lt!359401)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!359405 () Unit!16653)

(assert (=> b!226114 (= lt!359405 lt!359387)))

(declare-fun lt!359389 () Bool)

(assert (=> b!226114 (= lt!359389 (= (select (arr!5911 (_3!787 lt!359401)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10466 lt!359394)))))

(declare-fun Unit!16674 () Unit!16653)

(assert (=> b!226114 (= lt!359390 Unit!16674)))

(assert (=> b!226114 lt!359389))

(declare-fun d!76714 () Bool)

(assert (=> d!76714 e!154521))

(declare-fun res!189741 () Bool)

(assert (=> d!76714 (=> res!189741 e!154521)))

(assert (=> d!76714 (= res!189741 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!359398 () Bool)

(assert (=> d!76714 (= lt!359398 e!154520)))

(declare-fun res!189740 () Bool)

(assert (=> d!76714 (=> (not res!189740) (not e!154520))))

(declare-fun lt!359421 () (_ BitVec 64))

(declare-fun lt!359415 () (_ BitVec 64))

(assert (=> d!76714 (= res!189740 (= (bvadd lt!359415 lt!359421) (bitIndex!0 (size!4954 (buf!5495 (_2!10467 lt!359420))) (currentByte!10297 (_2!10467 lt!359420)) (currentBit!10292 (_2!10467 lt!359420)))))))

(assert (=> d!76714 (or (not (= (bvand lt!359415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359421 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359415 lt!359421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!359410 () (_ BitVec 64))

(assert (=> d!76714 (= lt!359421 (bvmul lt!359410 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76714 (or (= lt!359410 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359410 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359410)))))

(assert (=> d!76714 (= lt!359410 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76714 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76714 (= lt!359415 (bitIndex!0 (size!4954 (buf!5495 (_2!10466 lt!359147))) (currentByte!10297 (_2!10466 lt!359147)) (currentBit!10292 (_2!10466 lt!359147))))))

(assert (=> d!76714 (= lt!359420 e!154522)))

(assert (=> d!76714 (= c!11154 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76714 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4954 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)))))))

(assert (=> d!76714 (= (readByteArrayLoop!0 (_2!10466 lt!359147) (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!359420)))

(declare-fun bm!3678 () Bool)

(assert (=> bm!3678 (= call!3679 (arrayRangesEq!811 (ite c!11154 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)) lt!359413) (ite c!11154 (array!11292 (store (arr!5911 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10466 lt!359394)) (size!4954 (array!11292 (store (arr!5911 arr!308) i!761 (_1!10466 lt!359147)) (size!4954 arr!308)))) lt!359388) (ite c!11154 #b00000000000000000000000000000000 lt!359393) (ite c!11154 (bvadd #b00000000000000000000000000000001 i!761) lt!359411)))))

(assert (= (and d!76714 c!11154) b!226114))

(assert (= (and d!76714 (not c!11154)) b!226111))

(assert (= (or b!226114 b!226111) bm!3677))

(assert (= (or b!226114 b!226111) bm!3678))

(assert (= (or b!226114 b!226111) bm!3676))

(assert (= (and d!76714 res!189740) b!226112))

(assert (= (and b!226112 res!189742) b!226110))

(assert (= (and d!76714 (not res!189741)) b!226113))

(declare-fun m!347183 () Bool)

(assert (=> b!226111 m!347183))

(declare-fun m!347185 () Bool)

(assert (=> b!226111 m!347185))

(declare-fun m!347187 () Bool)

(assert (=> d!76714 m!347187))

(declare-fun m!347189 () Bool)

(assert (=> d!76714 m!347189))

(declare-fun m!347191 () Bool)

(assert (=> b!226113 m!347191))

(declare-fun m!347193 () Bool)

(assert (=> b!226113 m!347193))

(declare-fun m!347195 () Bool)

(assert (=> b!226114 m!347195))

(declare-fun m!347197 () Bool)

(assert (=> b!226114 m!347197))

(declare-fun m!347199 () Bool)

(assert (=> b!226114 m!347199))

(declare-fun m!347201 () Bool)

(assert (=> b!226114 m!347201))

(declare-fun m!347203 () Bool)

(assert (=> b!226114 m!347203))

(declare-fun m!347205 () Bool)

(assert (=> b!226114 m!347205))

(declare-fun m!347207 () Bool)

(assert (=> b!226114 m!347207))

(declare-fun m!347209 () Bool)

(assert (=> b!226114 m!347209))

(declare-fun m!347211 () Bool)

(assert (=> b!226114 m!347211))

(declare-fun m!347213 () Bool)

(assert (=> b!226114 m!347213))

(assert (=> b!226114 m!347189))

(declare-fun m!347215 () Bool)

(assert (=> b!226114 m!347215))

(declare-fun m!347217 () Bool)

(assert (=> b!226114 m!347217))

(assert (=> bm!3678 m!347213))

(declare-fun m!347219 () Bool)

(assert (=> bm!3678 m!347219))

(declare-fun m!347221 () Bool)

(assert (=> b!226110 m!347221))

(declare-fun m!347223 () Bool)

(assert (=> bm!3677 m!347223))

(declare-fun m!347225 () Bool)

(assert (=> bm!3676 m!347225))

(assert (=> b!226046 d!76714))

(declare-fun d!76730 () Bool)

(declare-fun e!154530 () Bool)

(assert (=> d!76730 e!154530))

(declare-fun res!189755 () Bool)

(assert (=> d!76730 (=> (not res!189755) (not e!154530))))

(declare-fun lt!359483 () (_ BitVec 64))

(declare-fun lt!359485 () (_ BitVec 64))

(declare-fun lt!359484 () (_ BitVec 64))

(assert (=> d!76730 (= res!189755 (= lt!359485 (bvsub lt!359484 lt!359483)))))

(assert (=> d!76730 (or (= (bvand lt!359484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359484 lt!359483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76730 (= lt!359483 (remainingBits!0 ((_ sign_extend 32) (size!4954 (buf!5495 thiss!1870))) ((_ sign_extend 32) (currentByte!10297 thiss!1870)) ((_ sign_extend 32) (currentBit!10292 thiss!1870))))))

(declare-fun lt!359482 () (_ BitVec 64))

(declare-fun lt!359487 () (_ BitVec 64))

(assert (=> d!76730 (= lt!359484 (bvmul lt!359482 lt!359487))))

(assert (=> d!76730 (or (= lt!359482 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359487 (bvsdiv (bvmul lt!359482 lt!359487) lt!359482)))))

(assert (=> d!76730 (= lt!359487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76730 (= lt!359482 ((_ sign_extend 32) (size!4954 (buf!5495 thiss!1870))))))

(assert (=> d!76730 (= lt!359485 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10297 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10292 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76730 (invariant!0 (currentBit!10292 thiss!1870) (currentByte!10297 thiss!1870) (size!4954 (buf!5495 thiss!1870)))))

(assert (=> d!76730 (= (bitIndex!0 (size!4954 (buf!5495 thiss!1870)) (currentByte!10297 thiss!1870) (currentBit!10292 thiss!1870)) lt!359485)))

(declare-fun b!226128 () Bool)

(declare-fun res!189754 () Bool)

(assert (=> b!226128 (=> (not res!189754) (not e!154530))))

(assert (=> b!226128 (= res!189754 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359485))))

(declare-fun b!226129 () Bool)

(declare-fun lt!359486 () (_ BitVec 64))

(assert (=> b!226129 (= e!154530 (bvsle lt!359485 (bvmul lt!359486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226129 (or (= lt!359486 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359486 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359486)))))

(assert (=> b!226129 (= lt!359486 ((_ sign_extend 32) (size!4954 (buf!5495 thiss!1870))))))

(assert (= (and d!76730 res!189755) b!226128))

(assert (= (and b!226128 res!189754) b!226129))

(assert (=> d!76730 m!347149))

(declare-fun m!347271 () Bool)

(assert (=> d!76730 m!347271))

(assert (=> b!226046 d!76730))

(declare-fun d!76734 () Bool)

(assert (=> d!76734 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4954 (buf!5495 (_2!10466 lt!359147)))) ((_ sign_extend 32) (currentByte!10297 (_2!10466 lt!359147))) ((_ sign_extend 32) (currentBit!10292 (_2!10466 lt!359147))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4954 (buf!5495 (_2!10466 lt!359147)))) ((_ sign_extend 32) (currentByte!10297 (_2!10466 lt!359147))) ((_ sign_extend 32) (currentBit!10292 (_2!10466 lt!359147)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18758 () Bool)

(assert (= bs!18758 d!76734))

(declare-fun m!347273 () Bool)

(assert (=> bs!18758 m!347273))

(assert (=> b!226046 d!76734))

(declare-fun d!76736 () Bool)

(declare-fun e!154536 () Bool)

(assert (=> d!76736 e!154536))

(declare-fun res!189762 () Bool)

(assert (=> d!76736 (=> (not res!189762) (not e!154536))))

(assert (=> d!76736 (= res!189762 (and (or (let ((rhs!3840 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3840 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3840) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76739 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76739 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76739 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3838 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3838 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3838) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!359506 () Unit!16653)

(declare-fun choose!57 (BitStream!9004 BitStream!9004 (_ BitVec 64) (_ BitVec 32)) Unit!16653)

(assert (=> d!76736 (= lt!359506 (choose!57 thiss!1870 (_2!10466 lt!359147) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76736 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10466 lt!359147) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!359506)))

(declare-fun lt!359508 () (_ BitVec 32))

(declare-fun b!226136 () Bool)

(assert (=> b!226136 (= e!154536 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4954 (buf!5495 (_2!10466 lt!359147)))) ((_ sign_extend 32) (currentByte!10297 (_2!10466 lt!359147))) ((_ sign_extend 32) (currentBit!10292 (_2!10466 lt!359147))) (bvsub (bvsub to!496 i!761) lt!359508)))))

(assert (=> b!226136 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!359508 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!359508) #b10000000000000000000000000000000)))))

(declare-fun lt!359507 () (_ BitVec 64))

(assert (=> b!226136 (= lt!359508 ((_ extract 31 0) lt!359507))))

(assert (=> b!226136 (and (bvslt lt!359507 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!359507 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226136 (= lt!359507 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76736 res!189762) b!226136))

(declare-fun m!347275 () Bool)

(assert (=> d!76736 m!347275))

(declare-fun m!347277 () Bool)

(assert (=> b!226136 m!347277))

(assert (=> b!226046 d!76736))

(declare-fun d!76742 () Bool)

(assert (=> d!76742 (= (array_inv!4695 (buf!5495 thiss!1870)) (bvsge (size!4954 (buf!5495 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226047 d!76742))

(declare-fun d!76744 () Bool)

(assert (=> d!76744 (= (array_inv!4695 arr!308) (bvsge (size!4954 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47390 d!76744))

(declare-fun d!76746 () Bool)

(assert (=> d!76746 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10292 thiss!1870) (currentByte!10297 thiss!1870) (size!4954 (buf!5495 thiss!1870))))))

(declare-fun bs!18760 () Bool)

(assert (= bs!18760 d!76746))

(assert (=> bs!18760 m!347271))

(assert (=> start!47390 d!76746))

(push 1)

(assert (not d!76736))

(assert (not d!76714))

(assert (not b!226136))

(assert (not d!76702))

(assert (not bm!3677))

(assert (not b!226081))

(assert (not d!76734))

(assert (not bm!3678))

(assert (not bm!3676))

(assert (not d!76730))

(assert (not b!226110))

(assert (not b!226114))

(assert (not d!76746))

(assert (not b!226113))

(assert (not b!226111))

(assert (not d!76700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


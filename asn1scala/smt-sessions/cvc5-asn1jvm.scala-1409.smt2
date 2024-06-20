; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38710 () Bool)

(assert start!38710)

(declare-fun b!174322 () Bool)

(declare-fun res!144372 () Bool)

(declare-fun e!121574 () Bool)

(assert (=> b!174322 (=> res!144372 e!121574)))

(declare-datatypes ((array!9385 0))(
  ( (array!9386 (arr!5071 (Array (_ BitVec 32) (_ BitVec 8))) (size!4141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7390 0))(
  ( (BitStream!7391 (buf!4572 array!9385) (currentByte!8686 (_ BitVec 32)) (currentBit!8681 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7390)

(declare-datatypes ((Unit!12536 0))(
  ( (Unit!12537) )
))
(declare-datatypes ((tuple2!15040 0))(
  ( (tuple2!15041 (_1!8162 Unit!12536) (_2!8162 BitStream!7390)) )
))
(declare-fun lt!268731 () tuple2!15040)

(assert (=> b!174322 (= res!144372 (not (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!268731))))))))

(declare-fun b!174323 () Bool)

(declare-fun res!144377 () Bool)

(declare-fun e!121572 () Bool)

(assert (=> b!174323 (=> (not res!144377) (not e!121572))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174323 (= res!144377 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!174324 () Bool)

(declare-fun e!121575 () Bool)

(declare-datatypes ((tuple2!15042 0))(
  ( (tuple2!15043 (_1!8163 BitStream!7390) (_2!8163 (_ BitVec 64))) )
))
(declare-fun lt!268732 () tuple2!15042)

(declare-datatypes ((tuple2!15044 0))(
  ( (tuple2!15045 (_1!8164 BitStream!7390) (_2!8164 BitStream!7390)) )
))
(declare-fun lt!268730 () tuple2!15044)

(assert (=> b!174324 (= e!121575 (not (= (_1!8163 lt!268732) (_2!8164 lt!268730))))))

(declare-fun b!174325 () Bool)

(declare-fun res!144374 () Bool)

(assert (=> b!174325 (=> res!144374 e!121574)))

(declare-fun isPrefixOf!0 (BitStream!7390 BitStream!7390) Bool)

(assert (=> b!174325 (= res!144374 (not (isPrefixOf!0 thiss!1187 (_2!8162 lt!268731))))))

(declare-fun b!174326 () Bool)

(assert (=> b!174326 (= e!121574 e!121575)))

(declare-fun res!144371 () Bool)

(assert (=> b!174326 (=> res!144371 e!121575)))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174326 (= res!144371 (not (= (_2!8163 lt!268732) (bvand v!186 (onesLSBLong!0 nBits!340)))))))

(declare-fun readNBitsLSBFirstPure!0 (BitStream!7390 (_ BitVec 32)) tuple2!15042)

(assert (=> b!174326 (= lt!268732 (readNBitsLSBFirstPure!0 (_1!8164 lt!268730) nBits!340))))

(assert (=> b!174326 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!268733 () Unit!12536)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7390 array!9385 (_ BitVec 64)) Unit!12536)

(assert (=> b!174326 (= lt!268733 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4572 (_2!8162 lt!268731)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7390 BitStream!7390) tuple2!15044)

(assert (=> b!174326 (= lt!268730 (reader!0 thiss!1187 (_2!8162 lt!268731)))))

(declare-fun b!174327 () Bool)

(declare-fun res!144373 () Bool)

(assert (=> b!174327 (=> (not res!144373) (not e!121572))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174327 (= res!144373 (invariant!0 (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187) (size!4141 (buf!4572 thiss!1187))))))

(declare-fun b!174329 () Bool)

(declare-fun res!144378 () Bool)

(assert (=> b!174329 (=> res!144378 e!121574)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174329 (= res!144378 (not (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731))) (bvadd (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) ((_ sign_extend 32) nBits!340)))))))

(declare-fun b!174330 () Bool)

(declare-fun e!121576 () Bool)

(declare-fun array_inv!3882 (array!9385) Bool)

(assert (=> b!174330 (= e!121576 (array_inv!3882 (buf!4572 thiss!1187)))))

(declare-fun b!174328 () Bool)

(assert (=> b!174328 (= e!121572 e!121574)))

(declare-fun res!144375 () Bool)

(assert (=> b!174328 (=> res!144375 e!121574)))

(assert (=> b!174328 (= res!144375 (not (= (size!4141 (buf!4572 (_2!8162 lt!268731))) (size!4141 (buf!4572 thiss!1187)))))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7390 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15040)

(assert (=> b!174328 (= lt!268731 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun res!144376 () Bool)

(assert (=> start!38710 (=> (not res!144376) (not e!121572))))

(assert (=> start!38710 (= res!144376 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38710 e!121572))

(assert (=> start!38710 true))

(declare-fun inv!12 (BitStream!7390) Bool)

(assert (=> start!38710 (and (inv!12 thiss!1187) e!121576)))

(assert (= (and start!38710 res!144376) b!174323))

(assert (= (and b!174323 res!144377) b!174327))

(assert (= (and b!174327 res!144373) b!174328))

(assert (= (and b!174328 (not res!144375)) b!174329))

(assert (= (and b!174329 (not res!144378)) b!174322))

(assert (= (and b!174322 (not res!144372)) b!174325))

(assert (= (and b!174325 (not res!144374)) b!174326))

(assert (= (and b!174326 (not res!144371)) b!174324))

(assert (= start!38710 b!174330))

(declare-fun m!273675 () Bool)

(assert (=> b!174326 m!273675))

(declare-fun m!273677 () Bool)

(assert (=> b!174326 m!273677))

(declare-fun m!273679 () Bool)

(assert (=> b!174326 m!273679))

(declare-fun m!273681 () Bool)

(assert (=> b!174326 m!273681))

(declare-fun m!273683 () Bool)

(assert (=> b!174326 m!273683))

(declare-fun m!273685 () Bool)

(assert (=> start!38710 m!273685))

(declare-fun m!273687 () Bool)

(assert (=> b!174325 m!273687))

(declare-fun m!273689 () Bool)

(assert (=> b!174323 m!273689))

(declare-fun m!273691 () Bool)

(assert (=> b!174329 m!273691))

(declare-fun m!273693 () Bool)

(assert (=> b!174329 m!273693))

(declare-fun m!273695 () Bool)

(assert (=> b!174327 m!273695))

(declare-fun m!273697 () Bool)

(assert (=> b!174330 m!273697))

(declare-fun m!273699 () Bool)

(assert (=> b!174328 m!273699))

(push 1)

(assert (not start!38710))

(assert (not b!174330))

(assert (not b!174326))

(assert (not b!174323))

(assert (not b!174329))

(assert (not b!174328))

(assert (not b!174325))

(assert (not b!174327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61403 () Bool)

(declare-fun e!121615 () Bool)

(assert (=> d!61403 e!121615))

(declare-fun res!144440 () Bool)

(assert (=> d!61403 (=> (not res!144440) (not e!121615))))

(declare-fun lt!268841 () (_ BitVec 64))

(declare-fun lt!268838 () (_ BitVec 64))

(declare-fun lt!268836 () (_ BitVec 64))

(assert (=> d!61403 (= res!144440 (= lt!268836 (bvsub lt!268838 lt!268841)))))

(assert (=> d!61403 (or (= (bvand lt!268838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268838 lt!268841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61403 (= lt!268841 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!268731))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!268731)))))))

(declare-fun lt!268840 () (_ BitVec 64))

(declare-fun lt!268839 () (_ BitVec 64))

(assert (=> d!61403 (= lt!268838 (bvmul lt!268840 lt!268839))))

(assert (=> d!61403 (or (= lt!268840 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268839 (bvsdiv (bvmul lt!268840 lt!268839) lt!268840)))))

(assert (=> d!61403 (= lt!268839 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61403 (= lt!268840 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))))))

(assert (=> d!61403 (= lt!268836 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!268731))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!268731)))))))

(assert (=> d!61403 (invariant!0 (currentBit!8681 (_2!8162 lt!268731)) (currentByte!8686 (_2!8162 lt!268731)) (size!4141 (buf!4572 (_2!8162 lt!268731))))))

(assert (=> d!61403 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731))) lt!268836)))

(declare-fun b!174404 () Bool)

(declare-fun res!144441 () Bool)

(assert (=> b!174404 (=> (not res!144441) (not e!121615))))

(assert (=> b!174404 (= res!144441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268836))))

(declare-fun b!174405 () Bool)

(declare-fun lt!268837 () (_ BitVec 64))

(assert (=> b!174405 (= e!121615 (bvsle lt!268836 (bvmul lt!268837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174405 (or (= lt!268837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268837)))))

(assert (=> b!174405 (= lt!268837 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))))))

(assert (= (and d!61403 res!144440) b!174404))

(assert (= (and b!174404 res!144441) b!174405))

(declare-fun m!273789 () Bool)

(assert (=> d!61403 m!273789))

(declare-fun m!273791 () Bool)

(assert (=> d!61403 m!273791))

(assert (=> b!174329 d!61403))

(declare-fun d!61411 () Bool)

(declare-fun e!121616 () Bool)

(assert (=> d!61411 e!121616))

(declare-fun res!144442 () Bool)

(assert (=> d!61411 (=> (not res!144442) (not e!121616))))

(declare-fun lt!268847 () (_ BitVec 64))

(declare-fun lt!268844 () (_ BitVec 64))

(declare-fun lt!268842 () (_ BitVec 64))

(assert (=> d!61411 (= res!144442 (= lt!268842 (bvsub lt!268844 lt!268847)))))

(assert (=> d!61411 (or (= (bvand lt!268844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268844 lt!268847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61411 (= lt!268847 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))))))

(declare-fun lt!268846 () (_ BitVec 64))

(declare-fun lt!268845 () (_ BitVec 64))

(assert (=> d!61411 (= lt!268844 (bvmul lt!268846 lt!268845))))

(assert (=> d!61411 (or (= lt!268846 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268845 (bvsdiv (bvmul lt!268846 lt!268845) lt!268846)))))

(assert (=> d!61411 (= lt!268845 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61411 (= lt!268846 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))))))

(assert (=> d!61411 (= lt!268842 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 thiss!1187))))))

(assert (=> d!61411 (invariant!0 (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187) (size!4141 (buf!4572 thiss!1187)))))

(assert (=> d!61411 (= (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) lt!268842)))

(declare-fun b!174406 () Bool)

(declare-fun res!144443 () Bool)

(assert (=> b!174406 (=> (not res!144443) (not e!121616))))

(assert (=> b!174406 (= res!144443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268842))))

(declare-fun b!174407 () Bool)

(declare-fun lt!268843 () (_ BitVec 64))

(assert (=> b!174407 (= e!121616 (bvsle lt!268842 (bvmul lt!268843 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174407 (or (= lt!268843 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268843 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268843)))))

(assert (=> b!174407 (= lt!268843 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))))))

(assert (= (and d!61411 res!144442) b!174406))

(assert (= (and b!174406 res!144443) b!174407))

(declare-fun m!273793 () Bool)

(assert (=> d!61411 m!273793))

(assert (=> d!61411 m!273695))

(assert (=> b!174329 d!61411))

(declare-fun d!61413 () Bool)

(declare-fun res!144451 () Bool)

(declare-fun e!121622 () Bool)

(assert (=> d!61413 (=> (not res!144451) (not e!121622))))

(assert (=> d!61413 (= res!144451 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!268731)))))))

(assert (=> d!61413 (= (isPrefixOf!0 thiss!1187 (_2!8162 lt!268731)) e!121622)))

(declare-fun b!174414 () Bool)

(declare-fun res!144452 () Bool)

(assert (=> b!174414 (=> (not res!144452) (not e!121622))))

(assert (=> b!174414 (= res!144452 (bvsle (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731)))))))

(declare-fun b!174415 () Bool)

(declare-fun e!121621 () Bool)

(assert (=> b!174415 (= e!121622 e!121621)))

(declare-fun res!144450 () Bool)

(assert (=> b!174415 (=> res!144450 e!121621)))

(assert (=> b!174415 (= res!144450 (= (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174416 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9385 array!9385 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174416 (= e!121621 (arrayBitRangesEq!0 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!268731)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (= (and d!61413 res!144451) b!174414))

(assert (= (and b!174414 res!144452) b!174415))

(assert (= (and b!174415 (not res!144450)) b!174416))

(assert (=> b!174414 m!273693))

(assert (=> b!174414 m!273691))

(assert (=> b!174416 m!273693))

(assert (=> b!174416 m!273693))

(declare-fun m!273795 () Bool)

(assert (=> b!174416 m!273795))

(assert (=> b!174325 d!61413))

(declare-fun d!61415 () Bool)

(assert (=> d!61415 (= (array_inv!3882 (buf!4572 thiss!1187)) (bvsge (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!174330 d!61415))

(declare-fun d!61417 () Bool)

(assert (=> d!61417 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!268876 () Unit!12536)

(declare-fun choose!9 (BitStream!7390 array!9385 (_ BitVec 64) BitStream!7390) Unit!12536)

(assert (=> d!61417 (= lt!268876 (choose!9 thiss!1187 (buf!4572 (_2!8162 lt!268731)) ((_ sign_extend 32) nBits!340) (BitStream!7391 (buf!4572 (_2!8162 lt!268731)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (=> d!61417 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4572 (_2!8162 lt!268731)) ((_ sign_extend 32) nBits!340)) lt!268876)))

(declare-fun bs!15307 () Bool)

(assert (= bs!15307 d!61417))

(assert (=> bs!15307 m!273675))

(declare-fun m!273803 () Bool)

(assert (=> bs!15307 m!273803))

(assert (=> b!174326 d!61417))

(declare-fun lt!268993 () (_ BitVec 64))

(declare-fun lt!268990 () tuple2!15044)

(declare-fun e!121637 () Bool)

(declare-fun lt!269000 () (_ BitVec 64))

(declare-fun b!174450 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7390 (_ BitVec 64)) BitStream!7390)

(assert (=> b!174450 (= e!121637 (= (_1!8164 lt!268990) (withMovedBitIndex!0 (_2!8164 lt!268990) (bvsub lt!268993 lt!269000))))))

(assert (=> b!174450 (or (= (bvand lt!268993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268993 lt!269000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174450 (= lt!269000 (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731))))))

(assert (=> b!174450 (= lt!268993 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(declare-fun b!174451 () Bool)

(declare-fun e!121638 () Unit!12536)

(declare-fun Unit!12566 () Unit!12536)

(assert (=> b!174451 (= e!121638 Unit!12566)))

(declare-fun b!174453 () Bool)

(declare-fun res!144476 () Bool)

(assert (=> b!174453 (=> (not res!144476) (not e!121637))))

(assert (=> b!174453 (= res!144476 (isPrefixOf!0 (_1!8164 lt!268990) thiss!1187))))

(declare-fun b!174454 () Bool)

(declare-fun lt!268992 () Unit!12536)

(assert (=> b!174454 (= e!121638 lt!268992)))

(declare-fun lt!268988 () (_ BitVec 64))

(assert (=> b!174454 (= lt!268988 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!268983 () (_ BitVec 64))

(assert (=> b!174454 (= lt!268983 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9385 array!9385 (_ BitVec 64) (_ BitVec 64)) Unit!12536)

(assert (=> b!174454 (= lt!268992 (arrayBitRangesEqSymmetric!0 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!268731)) lt!268988 lt!268983))))

(assert (=> b!174454 (arrayBitRangesEq!0 (buf!4572 (_2!8162 lt!268731)) (buf!4572 thiss!1187) lt!268988 lt!268983)))

(declare-fun d!61425 () Bool)

(assert (=> d!61425 e!121637))

(declare-fun res!144478 () Bool)

(assert (=> d!61425 (=> (not res!144478) (not e!121637))))

(assert (=> d!61425 (= res!144478 (isPrefixOf!0 (_1!8164 lt!268990) (_2!8164 lt!268990)))))

(declare-fun lt!268984 () BitStream!7390)

(assert (=> d!61425 (= lt!268990 (tuple2!15045 lt!268984 (_2!8162 lt!268731)))))

(declare-fun lt!268994 () Unit!12536)

(declare-fun lt!268987 () Unit!12536)

(assert (=> d!61425 (= lt!268994 lt!268987)))

(assert (=> d!61425 (isPrefixOf!0 lt!268984 (_2!8162 lt!268731))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7390 BitStream!7390 BitStream!7390) Unit!12536)

(assert (=> d!61425 (= lt!268987 (lemmaIsPrefixTransitive!0 lt!268984 (_2!8162 lt!268731) (_2!8162 lt!268731)))))

(declare-fun lt!268985 () Unit!12536)

(declare-fun lt!268986 () Unit!12536)

(assert (=> d!61425 (= lt!268985 lt!268986)))

(assert (=> d!61425 (isPrefixOf!0 lt!268984 (_2!8162 lt!268731))))

(assert (=> d!61425 (= lt!268986 (lemmaIsPrefixTransitive!0 lt!268984 thiss!1187 (_2!8162 lt!268731)))))

(declare-fun lt!268995 () Unit!12536)

(assert (=> d!61425 (= lt!268995 e!121638)))

(declare-fun c!9177 () Bool)

(assert (=> d!61425 (= c!9177 (not (= (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!268989 () Unit!12536)

(declare-fun lt!268999 () Unit!12536)

(assert (=> d!61425 (= lt!268989 lt!268999)))

(assert (=> d!61425 (isPrefixOf!0 (_2!8162 lt!268731) (_2!8162 lt!268731))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7390) Unit!12536)

(assert (=> d!61425 (= lt!268999 (lemmaIsPrefixRefl!0 (_2!8162 lt!268731)))))

(declare-fun lt!268981 () Unit!12536)

(declare-fun lt!268991 () Unit!12536)

(assert (=> d!61425 (= lt!268981 lt!268991)))

(assert (=> d!61425 (= lt!268991 (lemmaIsPrefixRefl!0 (_2!8162 lt!268731)))))

(declare-fun lt!268998 () Unit!12536)

(declare-fun lt!268997 () Unit!12536)

(assert (=> d!61425 (= lt!268998 lt!268997)))

(assert (=> d!61425 (isPrefixOf!0 lt!268984 lt!268984)))

(assert (=> d!61425 (= lt!268997 (lemmaIsPrefixRefl!0 lt!268984))))

(declare-fun lt!268982 () Unit!12536)

(declare-fun lt!268996 () Unit!12536)

(assert (=> d!61425 (= lt!268982 lt!268996)))

(assert (=> d!61425 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61425 (= lt!268996 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61425 (= lt!268984 (BitStream!7391 (buf!4572 (_2!8162 lt!268731)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(assert (=> d!61425 (isPrefixOf!0 thiss!1187 (_2!8162 lt!268731))))

(assert (=> d!61425 (= (reader!0 thiss!1187 (_2!8162 lt!268731)) lt!268990)))

(declare-fun b!174452 () Bool)

(declare-fun res!144477 () Bool)

(assert (=> b!174452 (=> (not res!144477) (not e!121637))))

(assert (=> b!174452 (= res!144477 (isPrefixOf!0 (_2!8164 lt!268990) (_2!8162 lt!268731)))))

(assert (= (and d!61425 c!9177) b!174454))

(assert (= (and d!61425 (not c!9177)) b!174451))

(assert (= (and d!61425 res!144478) b!174453))

(assert (= (and b!174453 res!144476) b!174452))

(assert (= (and b!174452 res!144477) b!174450))

(declare-fun m!273841 () Bool)

(assert (=> b!174452 m!273841))

(declare-fun m!273843 () Bool)

(assert (=> d!61425 m!273843))

(assert (=> d!61425 m!273687))

(declare-fun m!273845 () Bool)

(assert (=> d!61425 m!273845))

(declare-fun m!273847 () Bool)

(assert (=> d!61425 m!273847))

(declare-fun m!273849 () Bool)

(assert (=> d!61425 m!273849))

(declare-fun m!273851 () Bool)

(assert (=> d!61425 m!273851))

(declare-fun m!273853 () Bool)

(assert (=> d!61425 m!273853))

(declare-fun m!273855 () Bool)

(assert (=> d!61425 m!273855))

(declare-fun m!273857 () Bool)

(assert (=> d!61425 m!273857))

(declare-fun m!273859 () Bool)

(assert (=> d!61425 m!273859))

(declare-fun m!273861 () Bool)

(assert (=> d!61425 m!273861))

(declare-fun m!273863 () Bool)

(assert (=> b!174453 m!273863))

(assert (=> b!174454 m!273693))

(declare-fun m!273865 () Bool)

(assert (=> b!174454 m!273865))

(declare-fun m!273867 () Bool)

(assert (=> b!174454 m!273867))

(declare-fun m!273869 () Bool)

(assert (=> b!174450 m!273869))

(assert (=> b!174450 m!273691))

(assert (=> b!174450 m!273693))

(assert (=> b!174326 d!61425))

(declare-fun d!61441 () Bool)

(assert (=> d!61441 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15311 () Bool)

(assert (= bs!15311 d!61441))

(declare-fun m!273871 () Bool)

(assert (=> bs!15311 m!273871))

(assert (=> b!174326 d!61441))

(declare-fun d!61443 () Bool)

(assert (=> d!61443 (= (onesLSBLong!0 nBits!340) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!340))))))

(assert (=> b!174326 d!61443))

(declare-fun d!61445 () Bool)

(declare-datatypes ((tuple2!15066 0))(
  ( (tuple2!15067 (_1!8175 (_ BitVec 64)) (_2!8175 BitStream!7390)) )
))
(declare-fun lt!269003 () tuple2!15066)

(declare-fun readNBitsLSBFirst!0 (BitStream!7390 (_ BitVec 32)) tuple2!15066)

(assert (=> d!61445 (= lt!269003 (readNBitsLSBFirst!0 (_1!8164 lt!268730) nBits!340))))

(assert (=> d!61445 (= (readNBitsLSBFirstPure!0 (_1!8164 lt!268730) nBits!340) (tuple2!15043 (_2!8175 lt!269003) (_1!8175 lt!269003)))))

(declare-fun bs!15312 () Bool)

(assert (= bs!15312 d!61445))

(declare-fun m!273873 () Bool)

(assert (=> bs!15312 m!273873))

(assert (=> b!174326 d!61445))

(declare-fun d!61447 () Bool)

(assert (=> d!61447 (= (invariant!0 (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187) (size!4141 (buf!4572 thiss!1187))) (and (bvsge (currentBit!8681 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8681 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8686 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8686 thiss!1187) (size!4141 (buf!4572 thiss!1187))) (and (= (currentBit!8681 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8686 thiss!1187) (size!4141 (buf!4572 thiss!1187)))))))))

(assert (=> b!174327 d!61447))

(declare-fun d!61449 () Bool)

(assert (=> d!61449 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187) (size!4141 (buf!4572 thiss!1187))))))

(declare-fun bs!15313 () Bool)

(assert (= bs!15313 d!61449))

(assert (=> bs!15313 m!273695))

(assert (=> start!38710 d!61449))

(declare-fun d!61451 () Bool)

(assert (=> d!61451 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15314 () Bool)

(assert (= bs!15314 d!61451))

(assert (=> bs!15314 m!273793))

(assert (=> b!174323 d!61451))

(declare-fun b!174609 () Bool)

(declare-fun res!144601 () Bool)

(declare-fun call!2894 () Bool)

(assert (=> b!174609 (= res!144601 call!2894)))

(declare-fun e!121735 () Bool)

(assert (=> b!174609 (=> (not res!144601) (not e!121735))))

(declare-fun b!174610 () Bool)

(declare-fun e!121730 () tuple2!15040)

(declare-fun lt!269517 () tuple2!15040)

(assert (=> b!174610 (= e!121730 (tuple2!15041 (_1!8162 lt!269517) (_2!8162 lt!269517)))))

(declare-fun lt!269514 () Bool)

(assert (=> b!174610 (= lt!269514 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!269481 () tuple2!15040)

(declare-fun appendBit!0 (BitStream!7390 Bool) tuple2!15040)

(assert (=> b!174610 (= lt!269481 (appendBit!0 thiss!1187 lt!269514))))

(declare-fun res!144612 () Bool)

(assert (=> b!174610 (= res!144612 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!269481)))))))

(assert (=> b!174610 (=> (not res!144612) (not e!121735))))

(assert (=> b!174610 e!121735))

(declare-fun lt!269477 () tuple2!15040)

(assert (=> b!174610 (= lt!269477 lt!269481)))

(assert (=> b!174610 (= lt!269517 (appendBitsLSBFirstLoopTR!0 (_2!8162 lt!269477) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!269526 () Unit!12536)

(assert (=> b!174610 (= lt!269526 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8162 lt!269477) (_2!8162 lt!269517)))))

(assert (=> b!174610 (isPrefixOf!0 thiss!1187 (_2!8162 lt!269517))))

(declare-fun lt!269508 () Unit!12536)

(assert (=> b!174610 (= lt!269508 lt!269526)))

(assert (=> b!174610 (invariant!0 (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187) (size!4141 (buf!4572 (_2!8162 lt!269477))))))

(declare-fun lt!269496 () BitStream!7390)

(assert (=> b!174610 (= lt!269496 (BitStream!7391 (buf!4572 (_2!8162 lt!269477)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(assert (=> b!174610 (invariant!0 (currentBit!8681 lt!269496) (currentByte!8686 lt!269496) (size!4141 (buf!4572 (_2!8162 lt!269517))))))

(declare-fun lt!269527 () BitStream!7390)

(assert (=> b!174610 (= lt!269527 (BitStream!7391 (buf!4572 (_2!8162 lt!269517)) (currentByte!8686 lt!269496) (currentBit!8681 lt!269496)))))

(declare-datatypes ((tuple2!15068 0))(
  ( (tuple2!15069 (_1!8176 BitStream!7390) (_2!8176 Bool)) )
))
(declare-fun lt!269522 () tuple2!15068)

(declare-fun readBitPure!0 (BitStream!7390) tuple2!15068)

(assert (=> b!174610 (= lt!269522 (readBitPure!0 lt!269496))))

(declare-fun lt!269488 () tuple2!15068)

(assert (=> b!174610 (= lt!269488 (readBitPure!0 lt!269527))))

(declare-fun lt!269503 () Unit!12536)

(declare-fun readBitPrefixLemma!0 (BitStream!7390 BitStream!7390) Unit!12536)

(assert (=> b!174610 (= lt!269503 (readBitPrefixLemma!0 lt!269496 (_2!8162 lt!269517)))))

(declare-fun res!144610 () Bool)

(assert (=> b!174610 (= res!144610 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269522))) (currentByte!8686 (_1!8176 lt!269522)) (currentBit!8681 (_1!8176 lt!269522))) (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269488))) (currentByte!8686 (_1!8176 lt!269488)) (currentBit!8681 (_1!8176 lt!269488)))))))

(declare-fun e!121732 () Bool)

(assert (=> b!174610 (=> (not res!144610) (not e!121732))))

(assert (=> b!174610 e!121732))

(declare-fun lt!269494 () Unit!12536)

(assert (=> b!174610 (= lt!269494 lt!269503)))

(declare-fun lt!269518 () tuple2!15044)

(assert (=> b!174610 (= lt!269518 (reader!0 thiss!1187 (_2!8162 lt!269517)))))

(declare-fun lt!269504 () tuple2!15044)

(assert (=> b!174610 (= lt!269504 (reader!0 (_2!8162 lt!269477) (_2!8162 lt!269517)))))

(declare-fun lt!269510 () tuple2!15068)

(assert (=> b!174610 (= lt!269510 (readBitPure!0 (_1!8164 lt!269518)))))

(assert (=> b!174610 (= (_2!8176 lt!269510) lt!269514)))

(declare-fun lt!269529 () Unit!12536)

(declare-fun Unit!12567 () Unit!12536)

(assert (=> b!174610 (= lt!269529 Unit!12567)))

(declare-fun lt!269509 () (_ BitVec 64))

(assert (=> b!174610 (= lt!269509 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!269489 () (_ BitVec 64))

(assert (=> b!174610 (= lt!269489 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!269515 () Unit!12536)

(assert (=> b!174610 (= lt!269515 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4572 (_2!8162 lt!269517)) lt!269489))))

(assert (=> b!174610 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269489)))

(declare-fun lt!269500 () Unit!12536)

(assert (=> b!174610 (= lt!269500 lt!269515)))

(declare-fun lt!269497 () tuple2!15042)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15042)

(assert (=> b!174610 (= lt!269497 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269518) nBits!340 #b00000000000000000000000000000000 lt!269509))))

(declare-fun lt!269524 () (_ BitVec 64))

(assert (=> b!174610 (= lt!269524 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!269507 () Unit!12536)

(assert (=> b!174610 (= lt!269507 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8162 lt!269477) (buf!4572 (_2!8162 lt!269517)) lt!269524))))

(assert (=> b!174610 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477))) lt!269524)))

(declare-fun lt!269478 () Unit!12536)

(assert (=> b!174610 (= lt!269478 lt!269507)))

(declare-fun lt!269479 () tuple2!15042)

(assert (=> b!174610 (= lt!269479 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269504) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269509 (ite (_2!8176 lt!269510) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!269492 () tuple2!15042)

(assert (=> b!174610 (= lt!269492 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269518) nBits!340 #b00000000000000000000000000000000 lt!269509))))

(declare-fun c!9194 () Bool)

(assert (=> b!174610 (= c!9194 (_2!8176 (readBitPure!0 (_1!8164 lt!269518))))))

(declare-fun lt!269512 () tuple2!15042)

(declare-fun e!121731 () (_ BitVec 64))

(assert (=> b!174610 (= lt!269512 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8164 lt!269518) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269509 e!121731)))))

(declare-fun lt!269531 () Unit!12536)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12536)

(assert (=> b!174610 (= lt!269531 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8164 lt!269518) nBits!340 #b00000000000000000000000000000000 lt!269509))))

(assert (=> b!174610 (and (= (_2!8163 lt!269492) (_2!8163 lt!269512)) (= (_1!8163 lt!269492) (_1!8163 lt!269512)))))

(declare-fun lt!269505 () Unit!12536)

(assert (=> b!174610 (= lt!269505 lt!269531)))

(assert (=> b!174610 (= (_1!8164 lt!269518) (withMovedBitIndex!0 (_2!8164 lt!269518) (bvsub (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))))))

(declare-fun lt!269490 () Unit!12536)

(declare-fun Unit!12568 () Unit!12536)

(assert (=> b!174610 (= lt!269490 Unit!12568)))

(assert (=> b!174610 (= (_1!8164 lt!269504) (withMovedBitIndex!0 (_2!8164 lt!269504) (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))))))

(declare-fun lt!269487 () Unit!12536)

(declare-fun Unit!12569 () Unit!12536)

(assert (=> b!174610 (= lt!269487 Unit!12569)))

(assert (=> b!174610 (= (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!269523 () Unit!12536)

(declare-fun Unit!12570 () Unit!12536)

(assert (=> b!174610 (= lt!269523 Unit!12570)))

(assert (=> b!174610 (= (_2!8163 lt!269497) (_2!8163 lt!269479))))

(declare-fun lt!269476 () Unit!12536)

(declare-fun Unit!12571 () Unit!12536)

(assert (=> b!174610 (= lt!269476 Unit!12571)))

(assert (=> b!174610 (invariant!0 (currentBit!8681 (_2!8162 lt!269517)) (currentByte!8686 (_2!8162 lt!269517)) (size!4141 (buf!4572 (_2!8162 lt!269517))))))

(declare-fun lt!269484 () Unit!12536)

(declare-fun Unit!12572 () Unit!12536)

(assert (=> b!174610 (= lt!269484 Unit!12572)))

(assert (=> b!174610 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!269517))))))

(declare-fun lt!269528 () Unit!12536)

(declare-fun Unit!12573 () Unit!12536)

(assert (=> b!174610 (= lt!269528 Unit!12573)))

(assert (=> b!174610 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))) (bvsub (bvadd (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!269530 () Unit!12536)

(declare-fun Unit!12574 () Unit!12536)

(assert (=> b!174610 (= lt!269530 Unit!12574)))

(declare-fun lt!269521 () Unit!12536)

(declare-fun Unit!12575 () Unit!12536)

(assert (=> b!174610 (= lt!269521 Unit!12575)))

(declare-fun lt!269506 () tuple2!15044)

(assert (=> b!174610 (= lt!269506 (reader!0 thiss!1187 (_2!8162 lt!269517)))))

(declare-fun lt!269480 () (_ BitVec 64))

(assert (=> b!174610 (= lt!269480 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!269482 () Unit!12536)

(assert (=> b!174610 (= lt!269482 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4572 (_2!8162 lt!269517)) lt!269480))))

(assert (=> b!174610 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269480)))

(declare-fun lt!269483 () Unit!12536)

(assert (=> b!174610 (= lt!269483 lt!269482)))

(declare-fun lt!269499 () tuple2!15042)

(assert (=> b!174610 (= lt!269499 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269506) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!144609 () Bool)

(assert (=> b!174610 (= res!144609 (= (_2!8163 lt!269499) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!121728 () Bool)

(assert (=> b!174610 (=> (not res!144609) (not e!121728))))

(assert (=> b!174610 e!121728))

(declare-fun lt!269495 () Unit!12536)

(declare-fun Unit!12576 () Unit!12536)

(assert (=> b!174610 (= lt!269495 Unit!12576)))

(declare-fun b!174611 () Bool)

(assert (=> b!174611 (= e!121732 (= (_2!8176 lt!269522) (_2!8176 lt!269488)))))

(declare-fun b!174612 () Bool)

(declare-fun e!121727 () Bool)

(declare-fun e!121733 () Bool)

(assert (=> b!174612 (= e!121727 e!121733)))

(declare-fun res!144607 () Bool)

(assert (=> b!174612 (=> (not res!144607) (not e!121733))))

(declare-fun lt!269485 () tuple2!15042)

(assert (=> b!174612 (= res!144607 (= (_2!8163 lt!269485) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun lt!269519 () tuple2!15044)

(assert (=> b!174612 (= lt!269485 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269519) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!269491 () Unit!12536)

(declare-fun lt!269520 () Unit!12536)

(assert (=> b!174612 (= lt!269491 lt!269520)))

(declare-fun lt!269486 () tuple2!15040)

(declare-fun lt!269511 () (_ BitVec 64))

(assert (=> b!174612 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269486)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269511)))

(assert (=> b!174612 (= lt!269520 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4572 (_2!8162 lt!269486)) lt!269511))))

(declare-fun e!121729 () Bool)

(assert (=> b!174612 e!121729))

(declare-fun res!144602 () Bool)

(assert (=> b!174612 (=> (not res!144602) (not e!121729))))

(assert (=> b!174612 (= res!144602 (and (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!269486)))) (bvsge lt!269511 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174612 (= lt!269511 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!174612 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!174612 (= lt!269519 (reader!0 thiss!1187 (_2!8162 lt!269486)))))

(declare-fun c!9195 () Bool)

(declare-fun bm!2891 () Bool)

(assert (=> bm!2891 (= call!2894 (isPrefixOf!0 thiss!1187 (ite c!9195 thiss!1187 (_2!8162 lt!269481))))))

(declare-fun b!174613 () Bool)

(declare-fun res!144608 () Bool)

(assert (=> b!174613 (=> (not res!144608) (not e!121727))))

(declare-fun lt!269516 () (_ BitVec 64))

(declare-fun lt!269498 () (_ BitVec 64))

(assert (=> b!174613 (= res!144608 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269486))) (currentByte!8686 (_2!8162 lt!269486)) (currentBit!8681 (_2!8162 lt!269486))) (bvsub lt!269498 lt!269516)))))

(assert (=> b!174613 (or (= (bvand lt!269498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269498 lt!269516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174613 (= lt!269516 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!269493 () (_ BitVec 64))

(declare-fun lt!269525 () (_ BitVec 64))

(assert (=> b!174613 (= lt!269498 (bvadd lt!269493 lt!269525))))

(assert (=> b!174613 (or (not (= (bvand lt!269493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269525 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269493 lt!269525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174613 (= lt!269525 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174613 (= lt!269493 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(declare-fun b!174614 () Bool)

(declare-fun lt!269502 () tuple2!15068)

(declare-fun readerFrom!0 (BitStream!7390 (_ BitVec 32) (_ BitVec 32)) BitStream!7390)

(assert (=> b!174614 (= lt!269502 (readBitPure!0 (readerFrom!0 (_2!8162 lt!269481) (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187))))))

(declare-fun res!144603 () Bool)

(assert (=> b!174614 (= res!144603 (and (= (_2!8176 lt!269502) lt!269514) (= (_1!8176 lt!269502) (_2!8162 lt!269481))))))

(declare-fun e!121734 () Bool)

(assert (=> b!174614 (=> (not res!144603) (not e!121734))))

(assert (=> b!174614 (= e!121735 e!121734)))

(declare-fun b!174615 () Bool)

(declare-fun Unit!12577 () Unit!12536)

(assert (=> b!174615 (= e!121730 (tuple2!15041 Unit!12577 thiss!1187))))

(declare-fun lt!269501 () Unit!12536)

(assert (=> b!174615 (= lt!269501 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!174615 call!2894))

(declare-fun lt!269513 () Unit!12536)

(assert (=> b!174615 (= lt!269513 lt!269501)))

(declare-fun b!174616 () Bool)

(assert (=> b!174616 (= e!121729 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269511))))

(declare-fun b!174617 () Bool)

(assert (=> b!174617 (= e!121731 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!61453 () Bool)

(assert (=> d!61453 e!121727))

(declare-fun res!144604 () Bool)

(assert (=> d!61453 (=> (not res!144604) (not e!121727))))

(assert (=> d!61453 (= res!144604 (invariant!0 (currentBit!8681 (_2!8162 lt!269486)) (currentByte!8686 (_2!8162 lt!269486)) (size!4141 (buf!4572 (_2!8162 lt!269486)))))))

(assert (=> d!61453 (= lt!269486 e!121730)))

(assert (=> d!61453 (= c!9195 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61453 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61453 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!269486)))

(declare-fun b!174618 () Bool)

(assert (=> b!174618 (= e!121734 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269502))) (currentByte!8686 (_1!8176 lt!269502)) (currentBit!8681 (_1!8176 lt!269502))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269481))) (currentByte!8686 (_2!8162 lt!269481)) (currentBit!8681 (_2!8162 lt!269481)))))))

(declare-fun b!174619 () Bool)

(declare-fun res!144611 () Bool)

(assert (=> b!174619 (=> (not res!144611) (not e!121727))))

(assert (=> b!174619 (= res!144611 (isPrefixOf!0 thiss!1187 (_2!8162 lt!269486)))))

(declare-fun b!174620 () Bool)

(assert (=> b!174620 (= e!121728 (= (_1!8163 lt!269499) (_2!8164 lt!269506)))))

(declare-fun b!174621 () Bool)

(declare-fun res!144605 () Bool)

(assert (=> b!174621 (=> (not res!144605) (not e!121727))))

(assert (=> b!174621 (= res!144605 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!269486)))))))

(declare-fun b!174622 () Bool)

(assert (=> b!174622 (= e!121733 (= (_1!8163 lt!269485) (_2!8164 lt!269519)))))

(declare-fun b!174623 () Bool)

(declare-fun res!144606 () Bool)

(assert (=> b!174623 (= res!144606 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269481))) (currentByte!8686 (_2!8162 lt!269481)) (currentBit!8681 (_2!8162 lt!269481))) (bvadd (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!174623 (=> (not res!144606) (not e!121735))))

(declare-fun b!174624 () Bool)

(assert (=> b!174624 (= e!121731 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (= (and d!61453 c!9195) b!174615))

(assert (= (and d!61453 (not c!9195)) b!174610))

(assert (= (and b!174610 res!144612) b!174623))

(assert (= (and b!174623 res!144606) b!174609))

(assert (= (and b!174609 res!144601) b!174614))

(assert (= (and b!174614 res!144603) b!174618))

(assert (= (and b!174610 res!144610) b!174611))

(assert (= (and b!174610 c!9194) b!174624))

(assert (= (and b!174610 (not c!9194)) b!174617))

(assert (= (and b!174610 res!144609) b!174620))

(assert (= (or b!174615 b!174609) bm!2891))

(assert (= (and d!61453 res!144604) b!174621))

(assert (= (and b!174621 res!144605) b!174613))

(assert (= (and b!174613 res!144608) b!174619))

(assert (= (and b!174619 res!144611) b!174612))

(assert (= (and b!174612 res!144602) b!174616))

(assert (= (and b!174612 res!144607) b!174622))

(declare-fun m!274065 () Bool)

(assert (=> b!174616 m!274065))

(declare-fun m!274067 () Bool)

(assert (=> b!174619 m!274067))

(declare-fun m!274069 () Bool)

(assert (=> b!174614 m!274069))

(assert (=> b!174614 m!274069))

(declare-fun m!274071 () Bool)

(assert (=> b!174614 m!274071))

(assert (=> b!174615 m!273845))

(declare-fun m!274073 () Bool)

(assert (=> b!174618 m!274073))

(declare-fun m!274075 () Bool)

(assert (=> b!174618 m!274075))

(declare-fun m!274077 () Bool)

(assert (=> b!174613 m!274077))

(assert (=> b!174613 m!273693))

(declare-fun m!274079 () Bool)

(assert (=> b!174612 m!274079))

(declare-fun m!274081 () Bool)

(assert (=> b!174612 m!274081))

(declare-fun m!274083 () Bool)

(assert (=> b!174612 m!274083))

(declare-fun m!274085 () Bool)

(assert (=> b!174612 m!274085))

(declare-fun m!274087 () Bool)

(assert (=> b!174612 m!274087))

(assert (=> b!174612 m!273677))

(assert (=> b!174623 m!274075))

(assert (=> b!174623 m!273693))

(declare-fun m!274089 () Bool)

(assert (=> bm!2891 m!274089))

(declare-fun m!274091 () Bool)

(assert (=> d!61453 m!274091))

(declare-fun m!274093 () Bool)

(assert (=> b!174610 m!274093))

(declare-fun m!274095 () Bool)

(assert (=> b!174610 m!274095))

(assert (=> b!174610 m!274081))

(declare-fun m!274097 () Bool)

(assert (=> b!174610 m!274097))

(declare-fun m!274099 () Bool)

(assert (=> b!174610 m!274099))

(declare-fun m!274101 () Bool)

(assert (=> b!174610 m!274101))

(declare-fun m!274103 () Bool)

(assert (=> b!174610 m!274103))

(declare-fun m!274105 () Bool)

(assert (=> b!174610 m!274105))

(declare-fun m!274107 () Bool)

(assert (=> b!174610 m!274107))

(declare-fun m!274109 () Bool)

(assert (=> b!174610 m!274109))

(declare-fun m!274111 () Bool)

(assert (=> b!174610 m!274111))

(declare-fun m!274113 () Bool)

(assert (=> b!174610 m!274113))

(assert (=> b!174610 m!273677))

(assert (=> b!174610 m!273693))

(declare-fun m!274115 () Bool)

(assert (=> b!174610 m!274115))

(declare-fun m!274117 () Bool)

(assert (=> b!174610 m!274117))

(declare-fun m!274119 () Bool)

(assert (=> b!174610 m!274119))

(declare-fun m!274121 () Bool)

(assert (=> b!174610 m!274121))

(declare-fun m!274123 () Bool)

(assert (=> b!174610 m!274123))

(declare-fun m!274125 () Bool)

(assert (=> b!174610 m!274125))

(declare-fun m!274127 () Bool)

(assert (=> b!174610 m!274127))

(declare-fun m!274129 () Bool)

(assert (=> b!174610 m!274129))

(declare-fun m!274131 () Bool)

(assert (=> b!174610 m!274131))

(declare-fun m!274133 () Bool)

(assert (=> b!174610 m!274133))

(declare-fun m!274135 () Bool)

(assert (=> b!174610 m!274135))

(declare-fun m!274137 () Bool)

(assert (=> b!174610 m!274137))

(declare-fun m!274139 () Bool)

(assert (=> b!174610 m!274139))

(declare-fun m!274141 () Bool)

(assert (=> b!174610 m!274141))

(declare-fun m!274143 () Bool)

(assert (=> b!174610 m!274143))

(declare-fun m!274145 () Bool)

(assert (=> b!174610 m!274145))

(declare-fun m!274147 () Bool)

(assert (=> b!174610 m!274147))

(assert (=> b!174610 m!274139))

(declare-fun m!274149 () Bool)

(assert (=> b!174610 m!274149))

(declare-fun m!274151 () Bool)

(assert (=> b!174610 m!274151))

(declare-fun m!274153 () Bool)

(assert (=> b!174610 m!274153))

(assert (=> b!174328 d!61453))

(push 1)

(assert (not d!61411))

(assert (not b!174452))

(assert (not b!174615))

(assert (not b!174414))

(assert (not b!174416))

(assert (not d!61453))

(assert (not d!61451))

(assert (not b!174454))

(assert (not d!61425))

(assert (not b!174453))

(assert (not bm!2891))

(assert (not d!61449))

(assert (not d!61417))

(assert (not b!174612))

(assert (not b!174619))

(assert (not b!174616))

(assert (not b!174450))

(assert (not b!174618))

(assert (not d!61445))

(assert (not b!174623))

(assert (not b!174613))

(assert (not d!61403))

(assert (not b!174614))

(assert (not b!174610))

(assert (not d!61441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61473 () Bool)

(assert (=> d!61473 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269511) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))) lt!269511))))

(declare-fun bs!15318 () Bool)

(assert (= bs!15318 d!61473))

(assert (=> bs!15318 m!273793))

(assert (=> b!174616 d!61473))

(declare-fun d!61475 () Bool)

(assert (=> d!61475 (isPrefixOf!0 thiss!1187 thiss!1187)))

(declare-fun lt!269534 () Unit!12536)

(declare-fun choose!11 (BitStream!7390) Unit!12536)

(assert (=> d!61475 (= lt!269534 (choose!11 thiss!1187))))

(assert (=> d!61475 (= (lemmaIsPrefixRefl!0 thiss!1187) lt!269534)))

(declare-fun bs!15320 () Bool)

(assert (= bs!15320 d!61475))

(assert (=> bs!15320 m!273853))

(declare-fun m!274155 () Bool)

(assert (=> bs!15320 m!274155))

(assert (=> b!174615 d!61475))

(declare-fun d!61477 () Bool)

(declare-fun e!121738 () Bool)

(assert (=> d!61477 e!121738))

(declare-fun res!144615 () Bool)

(assert (=> d!61477 (=> (not res!144615) (not e!121738))))

(declare-fun lt!269544 () tuple2!15066)

(assert (=> d!61477 (= res!144615 (= (buf!4572 (_2!8175 lt!269544)) (buf!4572 (_1!8164 lt!268730))))))

(declare-fun lt!269545 () tuple2!15066)

(assert (=> d!61477 (= lt!269544 (tuple2!15067 (_1!8175 lt!269545) (_2!8175 lt!269545)))))

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15066)

(assert (=> d!61477 (= lt!269545 (readNBitsLSBFirstsLoop!0 (_1!8164 lt!268730) nBits!340 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61477 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61477 (= (readNBitsLSBFirst!0 (_1!8164 lt!268730) nBits!340) lt!269544)))

(declare-fun b!174627 () Bool)

(declare-fun lt!269543 () (_ BitVec 64))

(declare-fun lt!269546 () (_ BitVec 64))

(assert (=> b!174627 (= e!121738 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8175 lt!269544))) (currentByte!8686 (_2!8175 lt!269544)) (currentBit!8681 (_2!8175 lt!269544))) (bvadd lt!269546 lt!269543)))))

(assert (=> b!174627 (or (not (= (bvand lt!269546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269543 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269546 lt!269543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174627 (= lt!269543 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174627 (= lt!269546 (bitIndex!0 (size!4141 (buf!4572 (_1!8164 lt!268730))) (currentByte!8686 (_1!8164 lt!268730)) (currentBit!8681 (_1!8164 lt!268730))))))

(assert (= (and d!61477 res!144615) b!174627))

(declare-fun m!274157 () Bool)

(assert (=> d!61477 m!274157))

(declare-fun m!274159 () Bool)

(assert (=> b!174627 m!274159))

(declare-fun m!274161 () Bool)

(assert (=> b!174627 m!274161))

(assert (=> d!61445 d!61477))

(declare-fun d!61479 () Bool)

(declare-fun res!144617 () Bool)

(declare-fun e!121740 () Bool)

(assert (=> d!61479 (=> (not res!144617) (not e!121740))))

(assert (=> d!61479 (= res!144617 (= (size!4141 (buf!4572 lt!268984)) (size!4141 (buf!4572 (_2!8162 lt!268731)))))))

(assert (=> d!61479 (= (isPrefixOf!0 lt!268984 (_2!8162 lt!268731)) e!121740)))

(declare-fun b!174628 () Bool)

(declare-fun res!144618 () Bool)

(assert (=> b!174628 (=> (not res!144618) (not e!121740))))

(assert (=> b!174628 (= res!144618 (bvsle (bitIndex!0 (size!4141 (buf!4572 lt!268984)) (currentByte!8686 lt!268984) (currentBit!8681 lt!268984)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731)))))))

(declare-fun b!174629 () Bool)

(declare-fun e!121739 () Bool)

(assert (=> b!174629 (= e!121740 e!121739)))

(declare-fun res!144616 () Bool)

(assert (=> b!174629 (=> res!144616 e!121739)))

(assert (=> b!174629 (= res!144616 (= (size!4141 (buf!4572 lt!268984)) #b00000000000000000000000000000000))))

(declare-fun b!174630 () Bool)

(assert (=> b!174630 (= e!121739 (arrayBitRangesEq!0 (buf!4572 lt!268984) (buf!4572 (_2!8162 lt!268731)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 lt!268984)) (currentByte!8686 lt!268984) (currentBit!8681 lt!268984))))))

(assert (= (and d!61479 res!144617) b!174628))

(assert (= (and b!174628 res!144618) b!174629))

(assert (= (and b!174629 (not res!144616)) b!174630))

(declare-fun m!274163 () Bool)

(assert (=> b!174628 m!274163))

(assert (=> b!174628 m!273691))

(assert (=> b!174630 m!274163))

(assert (=> b!174630 m!274163))

(declare-fun m!274165 () Bool)

(assert (=> b!174630 m!274165))

(assert (=> d!61425 d!61479))

(declare-fun d!61481 () Bool)

(assert (=> d!61481 (isPrefixOf!0 lt!268984 lt!268984)))

(declare-fun lt!269547 () Unit!12536)

(assert (=> d!61481 (= lt!269547 (choose!11 lt!268984))))

(assert (=> d!61481 (= (lemmaIsPrefixRefl!0 lt!268984) lt!269547)))

(declare-fun bs!15321 () Bool)

(assert (= bs!15321 d!61481))

(assert (=> bs!15321 m!273851))

(declare-fun m!274167 () Bool)

(assert (=> bs!15321 m!274167))

(assert (=> d!61425 d!61481))

(declare-fun d!61483 () Bool)

(declare-fun res!144620 () Bool)

(declare-fun e!121742 () Bool)

(assert (=> d!61483 (=> (not res!144620) (not e!121742))))

(assert (=> d!61483 (= res!144620 (= (size!4141 (buf!4572 (_2!8162 lt!268731))) (size!4141 (buf!4572 (_2!8162 lt!268731)))))))

(assert (=> d!61483 (= (isPrefixOf!0 (_2!8162 lt!268731) (_2!8162 lt!268731)) e!121742)))

(declare-fun b!174631 () Bool)

(declare-fun res!144621 () Bool)

(assert (=> b!174631 (=> (not res!144621) (not e!121742))))

(assert (=> b!174631 (= res!144621 (bvsle (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731)))))))

(declare-fun b!174632 () Bool)

(declare-fun e!121741 () Bool)

(assert (=> b!174632 (= e!121742 e!121741)))

(declare-fun res!144619 () Bool)

(assert (=> b!174632 (=> res!144619 e!121741)))

(assert (=> b!174632 (= res!144619 (= (size!4141 (buf!4572 (_2!8162 lt!268731))) #b00000000000000000000000000000000))))

(declare-fun b!174633 () Bool)

(assert (=> b!174633 (= e!121741 (arrayBitRangesEq!0 (buf!4572 (_2!8162 lt!268731)) (buf!4572 (_2!8162 lt!268731)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731)))))))

(assert (= (and d!61483 res!144620) b!174631))

(assert (= (and b!174631 res!144621) b!174632))

(assert (= (and b!174632 (not res!144619)) b!174633))

(assert (=> b!174631 m!273691))

(assert (=> b!174631 m!273691))

(assert (=> b!174633 m!273691))

(assert (=> b!174633 m!273691))

(declare-fun m!274169 () Bool)

(assert (=> b!174633 m!274169))

(assert (=> d!61425 d!61483))

(declare-fun d!61485 () Bool)

(declare-fun res!144623 () Bool)

(declare-fun e!121744 () Bool)

(assert (=> d!61485 (=> (not res!144623) (not e!121744))))

(assert (=> d!61485 (= res!144623 (= (size!4141 (buf!4572 (_1!8164 lt!268990))) (size!4141 (buf!4572 (_2!8164 lt!268990)))))))

(assert (=> d!61485 (= (isPrefixOf!0 (_1!8164 lt!268990) (_2!8164 lt!268990)) e!121744)))

(declare-fun b!174634 () Bool)

(declare-fun res!144624 () Bool)

(assert (=> b!174634 (=> (not res!144624) (not e!121744))))

(assert (=> b!174634 (= res!144624 (bvsle (bitIndex!0 (size!4141 (buf!4572 (_1!8164 lt!268990))) (currentByte!8686 (_1!8164 lt!268990)) (currentBit!8681 (_1!8164 lt!268990))) (bitIndex!0 (size!4141 (buf!4572 (_2!8164 lt!268990))) (currentByte!8686 (_2!8164 lt!268990)) (currentBit!8681 (_2!8164 lt!268990)))))))

(declare-fun b!174635 () Bool)

(declare-fun e!121743 () Bool)

(assert (=> b!174635 (= e!121744 e!121743)))

(declare-fun res!144622 () Bool)

(assert (=> b!174635 (=> res!144622 e!121743)))

(assert (=> b!174635 (= res!144622 (= (size!4141 (buf!4572 (_1!8164 lt!268990))) #b00000000000000000000000000000000))))

(declare-fun b!174636 () Bool)

(assert (=> b!174636 (= e!121743 (arrayBitRangesEq!0 (buf!4572 (_1!8164 lt!268990)) (buf!4572 (_2!8164 lt!268990)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 (_1!8164 lt!268990))) (currentByte!8686 (_1!8164 lt!268990)) (currentBit!8681 (_1!8164 lt!268990)))))))

(assert (= (and d!61485 res!144623) b!174634))

(assert (= (and b!174634 res!144624) b!174635))

(assert (= (and b!174635 (not res!144622)) b!174636))

(declare-fun m!274171 () Bool)

(assert (=> b!174634 m!274171))

(declare-fun m!274173 () Bool)

(assert (=> b!174634 m!274173))

(assert (=> b!174636 m!274171))

(assert (=> b!174636 m!274171))

(declare-fun m!274175 () Bool)

(assert (=> b!174636 m!274175))

(assert (=> d!61425 d!61485))

(declare-fun d!61487 () Bool)

(assert (=> d!61487 (isPrefixOf!0 lt!268984 (_2!8162 lt!268731))))

(declare-fun lt!269550 () Unit!12536)

(declare-fun choose!30 (BitStream!7390 BitStream!7390 BitStream!7390) Unit!12536)

(assert (=> d!61487 (= lt!269550 (choose!30 lt!268984 thiss!1187 (_2!8162 lt!268731)))))

(assert (=> d!61487 (isPrefixOf!0 lt!268984 thiss!1187)))

(assert (=> d!61487 (= (lemmaIsPrefixTransitive!0 lt!268984 thiss!1187 (_2!8162 lt!268731)) lt!269550)))

(declare-fun bs!15322 () Bool)

(assert (= bs!15322 d!61487))

(assert (=> bs!15322 m!273857))

(declare-fun m!274177 () Bool)

(assert (=> bs!15322 m!274177))

(declare-fun m!274179 () Bool)

(assert (=> bs!15322 m!274179))

(assert (=> d!61425 d!61487))

(declare-fun d!61489 () Bool)

(declare-fun res!144626 () Bool)

(declare-fun e!121746 () Bool)

(assert (=> d!61489 (=> (not res!144626) (not e!121746))))

(assert (=> d!61489 (= res!144626 (= (size!4141 (buf!4572 lt!268984)) (size!4141 (buf!4572 lt!268984))))))

(assert (=> d!61489 (= (isPrefixOf!0 lt!268984 lt!268984) e!121746)))

(declare-fun b!174637 () Bool)

(declare-fun res!144627 () Bool)

(assert (=> b!174637 (=> (not res!144627) (not e!121746))))

(assert (=> b!174637 (= res!144627 (bvsle (bitIndex!0 (size!4141 (buf!4572 lt!268984)) (currentByte!8686 lt!268984) (currentBit!8681 lt!268984)) (bitIndex!0 (size!4141 (buf!4572 lt!268984)) (currentByte!8686 lt!268984) (currentBit!8681 lt!268984))))))

(declare-fun b!174638 () Bool)

(declare-fun e!121745 () Bool)

(assert (=> b!174638 (= e!121746 e!121745)))

(declare-fun res!144625 () Bool)

(assert (=> b!174638 (=> res!144625 e!121745)))

(assert (=> b!174638 (= res!144625 (= (size!4141 (buf!4572 lt!268984)) #b00000000000000000000000000000000))))

(declare-fun b!174639 () Bool)

(assert (=> b!174639 (= e!121745 (arrayBitRangesEq!0 (buf!4572 lt!268984) (buf!4572 lt!268984) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 lt!268984)) (currentByte!8686 lt!268984) (currentBit!8681 lt!268984))))))

(assert (= (and d!61489 res!144626) b!174637))

(assert (= (and b!174637 res!144627) b!174638))

(assert (= (and b!174638 (not res!144625)) b!174639))

(assert (=> b!174637 m!274163))

(assert (=> b!174637 m!274163))

(assert (=> b!174639 m!274163))

(assert (=> b!174639 m!274163))

(declare-fun m!274181 () Bool)

(assert (=> b!174639 m!274181))

(assert (=> d!61425 d!61489))

(declare-fun d!61491 () Bool)

(assert (=> d!61491 (isPrefixOf!0 (_2!8162 lt!268731) (_2!8162 lt!268731))))

(declare-fun lt!269551 () Unit!12536)

(assert (=> d!61491 (= lt!269551 (choose!11 (_2!8162 lt!268731)))))

(assert (=> d!61491 (= (lemmaIsPrefixRefl!0 (_2!8162 lt!268731)) lt!269551)))

(declare-fun bs!15323 () Bool)

(assert (= bs!15323 d!61491))

(assert (=> bs!15323 m!273847))

(declare-fun m!274183 () Bool)

(assert (=> bs!15323 m!274183))

(assert (=> d!61425 d!61491))

(assert (=> d!61425 d!61475))

(assert (=> d!61425 d!61413))

(declare-fun d!61493 () Bool)

(declare-fun res!144629 () Bool)

(declare-fun e!121748 () Bool)

(assert (=> d!61493 (=> (not res!144629) (not e!121748))))

(assert (=> d!61493 (= res!144629 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 thiss!1187))))))

(assert (=> d!61493 (= (isPrefixOf!0 thiss!1187 thiss!1187) e!121748)))

(declare-fun b!174640 () Bool)

(declare-fun res!144630 () Bool)

(assert (=> b!174640 (=> (not res!144630) (not e!121748))))

(assert (=> b!174640 (= res!144630 (bvsle (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(declare-fun b!174641 () Bool)

(declare-fun e!121747 () Bool)

(assert (=> b!174641 (= e!121748 e!121747)))

(declare-fun res!144628 () Bool)

(assert (=> b!174641 (=> res!144628 e!121747)))

(assert (=> b!174641 (= res!144628 (= (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174642 () Bool)

(assert (=> b!174642 (= e!121747 (arrayBitRangesEq!0 (buf!4572 thiss!1187) (buf!4572 thiss!1187) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (= (and d!61493 res!144629) b!174640))

(assert (= (and b!174640 res!144630) b!174641))

(assert (= (and b!174641 (not res!144628)) b!174642))

(assert (=> b!174640 m!273693))

(assert (=> b!174640 m!273693))

(assert (=> b!174642 m!273693))

(assert (=> b!174642 m!273693))

(declare-fun m!274185 () Bool)

(assert (=> b!174642 m!274185))

(assert (=> d!61425 d!61493))

(declare-fun d!61495 () Bool)

(assert (=> d!61495 (isPrefixOf!0 lt!268984 (_2!8162 lt!268731))))

(declare-fun lt!269552 () Unit!12536)

(assert (=> d!61495 (= lt!269552 (choose!30 lt!268984 (_2!8162 lt!268731) (_2!8162 lt!268731)))))

(assert (=> d!61495 (isPrefixOf!0 lt!268984 (_2!8162 lt!268731))))

(assert (=> d!61495 (= (lemmaIsPrefixTransitive!0 lt!268984 (_2!8162 lt!268731) (_2!8162 lt!268731)) lt!269552)))

(declare-fun bs!15324 () Bool)

(assert (= bs!15324 d!61495))

(assert (=> bs!15324 m!273857))

(declare-fun m!274187 () Bool)

(assert (=> bs!15324 m!274187))

(assert (=> bs!15324 m!273857))

(assert (=> d!61425 d!61495))

(declare-fun d!61497 () Bool)

(declare-datatypes ((tuple2!15070 0))(
  ( (tuple2!15071 (_1!8177 Bool) (_2!8177 BitStream!7390)) )
))
(declare-fun lt!269555 () tuple2!15070)

(declare-fun readBit!0 (BitStream!7390) tuple2!15070)

(assert (=> d!61497 (= lt!269555 (readBit!0 (readerFrom!0 (_2!8162 lt!269481) (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187))))))

(assert (=> d!61497 (= (readBitPure!0 (readerFrom!0 (_2!8162 lt!269481) (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187))) (tuple2!15069 (_2!8177 lt!269555) (_1!8177 lt!269555)))))

(declare-fun bs!15325 () Bool)

(assert (= bs!15325 d!61497))

(assert (=> bs!15325 m!274069))

(declare-fun m!274189 () Bool)

(assert (=> bs!15325 m!274189))

(assert (=> b!174614 d!61497))

(declare-fun d!61499 () Bool)

(declare-fun e!121751 () Bool)

(assert (=> d!61499 e!121751))

(declare-fun res!144634 () Bool)

(assert (=> d!61499 (=> (not res!144634) (not e!121751))))

(assert (=> d!61499 (= res!144634 (invariant!0 (currentBit!8681 (_2!8162 lt!269481)) (currentByte!8686 (_2!8162 lt!269481)) (size!4141 (buf!4572 (_2!8162 lt!269481)))))))

(assert (=> d!61499 (= (readerFrom!0 (_2!8162 lt!269481) (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187)) (BitStream!7391 (buf!4572 (_2!8162 lt!269481)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(declare-fun b!174645 () Bool)

(assert (=> b!174645 (= e!121751 (invariant!0 (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187) (size!4141 (buf!4572 (_2!8162 lt!269481)))))))

(assert (= (and d!61499 res!144634) b!174645))

(declare-fun m!274191 () Bool)

(assert (=> d!61499 m!274191))

(declare-fun m!274193 () Bool)

(assert (=> b!174645 m!274193))

(assert (=> b!174614 d!61499))

(declare-fun d!61501 () Bool)

(assert (=> d!61501 (= (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!268731))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!268731)))) (bvsub (bvmul ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!268731))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!268731))))))))

(assert (=> d!61403 d!61501))

(declare-fun d!61503 () Bool)

(assert (=> d!61503 (= (invariant!0 (currentBit!8681 (_2!8162 lt!268731)) (currentByte!8686 (_2!8162 lt!268731)) (size!4141 (buf!4572 (_2!8162 lt!268731)))) (and (bvsge (currentBit!8681 (_2!8162 lt!268731)) #b00000000000000000000000000000000) (bvslt (currentBit!8681 (_2!8162 lt!268731)) #b00000000000000000000000000001000) (bvsge (currentByte!8686 (_2!8162 lt!268731)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8686 (_2!8162 lt!268731)) (size!4141 (buf!4572 (_2!8162 lt!268731)))) (and (= (currentBit!8681 (_2!8162 lt!268731)) #b00000000000000000000000000000000) (= (currentByte!8686 (_2!8162 lt!268731)) (size!4141 (buf!4572 (_2!8162 lt!268731))))))))))

(assert (=> d!61403 d!61503))

(declare-fun d!61505 () Bool)

(declare-fun e!121752 () Bool)

(assert (=> d!61505 e!121752))

(declare-fun res!144635 () Bool)

(assert (=> d!61505 (=> (not res!144635) (not e!121752))))

(declare-fun lt!269556 () (_ BitVec 64))

(declare-fun lt!269561 () (_ BitVec 64))

(declare-fun lt!269558 () (_ BitVec 64))

(assert (=> d!61505 (= res!144635 (= lt!269556 (bvsub lt!269558 lt!269561)))))

(assert (=> d!61505 (or (= (bvand lt!269558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269561 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269558 lt!269561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61505 (= lt!269561 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269502)))) ((_ sign_extend 32) (currentByte!8686 (_1!8176 lt!269502))) ((_ sign_extend 32) (currentBit!8681 (_1!8176 lt!269502)))))))

(declare-fun lt!269560 () (_ BitVec 64))

(declare-fun lt!269559 () (_ BitVec 64))

(assert (=> d!61505 (= lt!269558 (bvmul lt!269560 lt!269559))))

(assert (=> d!61505 (or (= lt!269560 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269559 (bvsdiv (bvmul lt!269560 lt!269559) lt!269560)))))

(assert (=> d!61505 (= lt!269559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61505 (= lt!269560 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269502)))))))

(assert (=> d!61505 (= lt!269556 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_1!8176 lt!269502))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_1!8176 lt!269502)))))))

(assert (=> d!61505 (invariant!0 (currentBit!8681 (_1!8176 lt!269502)) (currentByte!8686 (_1!8176 lt!269502)) (size!4141 (buf!4572 (_1!8176 lt!269502))))))

(assert (=> d!61505 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269502))) (currentByte!8686 (_1!8176 lt!269502)) (currentBit!8681 (_1!8176 lt!269502))) lt!269556)))

(declare-fun b!174646 () Bool)

(declare-fun res!144636 () Bool)

(assert (=> b!174646 (=> (not res!144636) (not e!121752))))

(assert (=> b!174646 (= res!144636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269556))))

(declare-fun b!174647 () Bool)

(declare-fun lt!269557 () (_ BitVec 64))

(assert (=> b!174647 (= e!121752 (bvsle lt!269556 (bvmul lt!269557 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174647 (or (= lt!269557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269557)))))

(assert (=> b!174647 (= lt!269557 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269502)))))))

(assert (= (and d!61505 res!144635) b!174646))

(assert (= (and b!174646 res!144636) b!174647))

(declare-fun m!274195 () Bool)

(assert (=> d!61505 m!274195))

(declare-fun m!274197 () Bool)

(assert (=> d!61505 m!274197))

(assert (=> b!174618 d!61505))

(declare-fun d!61507 () Bool)

(declare-fun e!121753 () Bool)

(assert (=> d!61507 e!121753))

(declare-fun res!144637 () Bool)

(assert (=> d!61507 (=> (not res!144637) (not e!121753))))

(declare-fun lt!269564 () (_ BitVec 64))

(declare-fun lt!269562 () (_ BitVec 64))

(declare-fun lt!269567 () (_ BitVec 64))

(assert (=> d!61507 (= res!144637 (= lt!269562 (bvsub lt!269564 lt!269567)))))

(assert (=> d!61507 (or (= (bvand lt!269564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269567 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269564 lt!269567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61507 (= lt!269567 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269481)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269481))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269481)))))))

(declare-fun lt!269566 () (_ BitVec 64))

(declare-fun lt!269565 () (_ BitVec 64))

(assert (=> d!61507 (= lt!269564 (bvmul lt!269566 lt!269565))))

(assert (=> d!61507 (or (= lt!269566 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269565 (bvsdiv (bvmul lt!269566 lt!269565) lt!269566)))))

(assert (=> d!61507 (= lt!269565 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61507 (= lt!269566 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269481)))))))

(assert (=> d!61507 (= lt!269562 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269481))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269481)))))))

(assert (=> d!61507 (invariant!0 (currentBit!8681 (_2!8162 lt!269481)) (currentByte!8686 (_2!8162 lt!269481)) (size!4141 (buf!4572 (_2!8162 lt!269481))))))

(assert (=> d!61507 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269481))) (currentByte!8686 (_2!8162 lt!269481)) (currentBit!8681 (_2!8162 lt!269481))) lt!269562)))

(declare-fun b!174648 () Bool)

(declare-fun res!144638 () Bool)

(assert (=> b!174648 (=> (not res!144638) (not e!121753))))

(assert (=> b!174648 (= res!144638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269562))))

(declare-fun b!174649 () Bool)

(declare-fun lt!269563 () (_ BitVec 64))

(assert (=> b!174649 (= e!121753 (bvsle lt!269562 (bvmul lt!269563 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174649 (or (= lt!269563 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269563 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269563)))))

(assert (=> b!174649 (= lt!269563 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269481)))))))

(assert (= (and d!61507 res!144637) b!174648))

(assert (= (and b!174648 res!144638) b!174649))

(declare-fun m!274199 () Bool)

(assert (=> d!61507 m!274199))

(assert (=> d!61507 m!274191))

(assert (=> b!174618 d!61507))

(assert (=> d!61449 d!61447))

(assert (=> b!174414 d!61411))

(assert (=> b!174414 d!61403))

(declare-fun d!61509 () Bool)

(declare-fun res!144640 () Bool)

(declare-fun e!121755 () Bool)

(assert (=> d!61509 (=> (not res!144640) (not e!121755))))

(assert (=> d!61509 (= res!144640 (= (size!4141 (buf!4572 (_1!8164 lt!268990))) (size!4141 (buf!4572 thiss!1187))))))

(assert (=> d!61509 (= (isPrefixOf!0 (_1!8164 lt!268990) thiss!1187) e!121755)))

(declare-fun b!174650 () Bool)

(declare-fun res!144641 () Bool)

(assert (=> b!174650 (=> (not res!144641) (not e!121755))))

(assert (=> b!174650 (= res!144641 (bvsle (bitIndex!0 (size!4141 (buf!4572 (_1!8164 lt!268990))) (currentByte!8686 (_1!8164 lt!268990)) (currentBit!8681 (_1!8164 lt!268990))) (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(declare-fun b!174651 () Bool)

(declare-fun e!121754 () Bool)

(assert (=> b!174651 (= e!121755 e!121754)))

(declare-fun res!144639 () Bool)

(assert (=> b!174651 (=> res!144639 e!121754)))

(assert (=> b!174651 (= res!144639 (= (size!4141 (buf!4572 (_1!8164 lt!268990))) #b00000000000000000000000000000000))))

(declare-fun b!174652 () Bool)

(assert (=> b!174652 (= e!121754 (arrayBitRangesEq!0 (buf!4572 (_1!8164 lt!268990)) (buf!4572 thiss!1187) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 (_1!8164 lt!268990))) (currentByte!8686 (_1!8164 lt!268990)) (currentBit!8681 (_1!8164 lt!268990)))))))

(assert (= (and d!61509 res!144640) b!174650))

(assert (= (and b!174650 res!144641) b!174651))

(assert (= (and b!174651 (not res!144639)) b!174652))

(assert (=> b!174650 m!274171))

(assert (=> b!174650 m!273693))

(assert (=> b!174652 m!274171))

(assert (=> b!174652 m!274171))

(declare-fun m!274201 () Bool)

(assert (=> b!174652 m!274201))

(assert (=> b!174453 d!61509))

(assert (=> b!174454 d!61411))

(declare-fun d!61511 () Bool)

(assert (=> d!61511 (arrayBitRangesEq!0 (buf!4572 (_2!8162 lt!268731)) (buf!4572 thiss!1187) lt!268988 lt!268983)))

(declare-fun lt!269570 () Unit!12536)

(declare-fun choose!8 (array!9385 array!9385 (_ BitVec 64) (_ BitVec 64)) Unit!12536)

(assert (=> d!61511 (= lt!269570 (choose!8 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!268731)) lt!268988 lt!268983))))

(assert (=> d!61511 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268988) (bvsle lt!268988 lt!268983))))

(assert (=> d!61511 (= (arrayBitRangesEqSymmetric!0 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!268731)) lt!268988 lt!268983) lt!269570)))

(declare-fun bs!15326 () Bool)

(assert (= bs!15326 d!61511))

(assert (=> bs!15326 m!273867))

(declare-fun m!274203 () Bool)

(assert (=> bs!15326 m!274203))

(assert (=> b!174454 d!61511))

(declare-fun b!174667 () Bool)

(declare-fun e!121769 () Bool)

(declare-fun e!121768 () Bool)

(assert (=> b!174667 (= e!121769 e!121768)))

(declare-fun res!144655 () Bool)

(assert (=> b!174667 (=> (not res!144655) (not e!121768))))

(declare-fun e!121772 () Bool)

(assert (=> b!174667 (= res!144655 e!121772)))

(declare-fun res!144656 () Bool)

(assert (=> b!174667 (=> res!144656 e!121772)))

(declare-datatypes ((tuple4!252 0))(
  ( (tuple4!253 (_1!8178 (_ BitVec 32)) (_2!8178 (_ BitVec 32)) (_3!642 (_ BitVec 32)) (_4!126 (_ BitVec 32))) )
))
(declare-fun lt!269579 () tuple4!252)

(assert (=> b!174667 (= res!144656 (bvsge (_1!8178 lt!269579) (_2!8178 lt!269579)))))

(declare-fun lt!269577 () (_ BitVec 32))

(assert (=> b!174667 (= lt!269577 ((_ extract 31 0) (bvsrem lt!268983 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!269578 () (_ BitVec 32))

(assert (=> b!174667 (= lt!269578 ((_ extract 31 0) (bvsrem lt!268988 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!252)

(assert (=> b!174667 (= lt!269579 (arrayBitIndices!0 lt!268988 lt!268983))))

(declare-fun b!174668 () Bool)

(declare-fun e!121771 () Bool)

(declare-fun e!121773 () Bool)

(assert (=> b!174668 (= e!121771 e!121773)))

(declare-fun res!144654 () Bool)

(declare-fun call!2897 () Bool)

(assert (=> b!174668 (= res!144654 call!2897)))

(assert (=> b!174668 (=> (not res!144654) (not e!121773))))

(declare-fun b!174669 () Bool)

(assert (=> b!174669 (= e!121771 call!2897)))

(declare-fun bm!2894 () Bool)

(declare-fun c!9198 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2894 (= call!2897 (byteRangesEq!0 (select (arr!5071 (buf!4572 (_2!8162 lt!268731))) (_3!642 lt!269579)) (select (arr!5071 (buf!4572 thiss!1187)) (_3!642 lt!269579)) lt!269578 (ite c!9198 lt!269577 #b00000000000000000000000000001000)))))

(declare-fun b!174670 () Bool)

(assert (=> b!174670 (= e!121768 e!121771)))

(assert (=> b!174670 (= c!9198 (= (_3!642 lt!269579) (_4!126 lt!269579)))))

(declare-fun b!174671 () Bool)

(declare-fun arrayRangesEq!688 (array!9385 array!9385 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174671 (= e!121772 (arrayRangesEq!688 (buf!4572 (_2!8162 lt!268731)) (buf!4572 thiss!1187) (_1!8178 lt!269579) (_2!8178 lt!269579)))))

(declare-fun d!61513 () Bool)

(declare-fun res!144653 () Bool)

(assert (=> d!61513 (=> res!144653 e!121769)))

(assert (=> d!61513 (= res!144653 (bvsge lt!268988 lt!268983))))

(assert (=> d!61513 (= (arrayBitRangesEq!0 (buf!4572 (_2!8162 lt!268731)) (buf!4572 thiss!1187) lt!268988 lt!268983) e!121769)))

(declare-fun b!174672 () Bool)

(declare-fun res!144652 () Bool)

(assert (=> b!174672 (= res!144652 (= lt!269577 #b00000000000000000000000000000000))))

(declare-fun e!121770 () Bool)

(assert (=> b!174672 (=> res!144652 e!121770)))

(assert (=> b!174672 (= e!121773 e!121770)))

(declare-fun b!174673 () Bool)

(assert (=> b!174673 (= e!121770 (byteRangesEq!0 (select (arr!5071 (buf!4572 (_2!8162 lt!268731))) (_4!126 lt!269579)) (select (arr!5071 (buf!4572 thiss!1187)) (_4!126 lt!269579)) #b00000000000000000000000000000000 lt!269577))))

(assert (= (and d!61513 (not res!144653)) b!174667))

(assert (= (and b!174667 (not res!144656)) b!174671))

(assert (= (and b!174667 res!144655) b!174670))

(assert (= (and b!174670 c!9198) b!174669))

(assert (= (and b!174670 (not c!9198)) b!174668))

(assert (= (and b!174668 res!144654) b!174672))

(assert (= (and b!174672 (not res!144652)) b!174673))

(assert (= (or b!174669 b!174668) bm!2894))

(declare-fun m!274205 () Bool)

(assert (=> b!174667 m!274205))

(declare-fun m!274207 () Bool)

(assert (=> bm!2894 m!274207))

(declare-fun m!274209 () Bool)

(assert (=> bm!2894 m!274209))

(assert (=> bm!2894 m!274207))

(assert (=> bm!2894 m!274209))

(declare-fun m!274211 () Bool)

(assert (=> bm!2894 m!274211))

(declare-fun m!274213 () Bool)

(assert (=> b!174671 m!274213))

(declare-fun m!274215 () Bool)

(assert (=> b!174673 m!274215))

(declare-fun m!274217 () Bool)

(assert (=> b!174673 m!274217))

(assert (=> b!174673 m!274215))

(assert (=> b!174673 m!274217))

(declare-fun m!274219 () Bool)

(assert (=> b!174673 m!274219))

(assert (=> b!174454 d!61513))

(declare-fun d!61515 () Bool)

(declare-fun e!121774 () Bool)

(assert (=> d!61515 e!121774))

(declare-fun res!144657 () Bool)

(assert (=> d!61515 (=> (not res!144657) (not e!121774))))

(declare-fun lt!269582 () (_ BitVec 64))

(declare-fun lt!269585 () (_ BitVec 64))

(declare-fun lt!269580 () (_ BitVec 64))

(assert (=> d!61515 (= res!144657 (= lt!269580 (bvsub lt!269582 lt!269585)))))

(assert (=> d!61515 (or (= (bvand lt!269582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269585 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269582 lt!269585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61515 (= lt!269585 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269522)))) ((_ sign_extend 32) (currentByte!8686 (_1!8176 lt!269522))) ((_ sign_extend 32) (currentBit!8681 (_1!8176 lt!269522)))))))

(declare-fun lt!269584 () (_ BitVec 64))

(declare-fun lt!269583 () (_ BitVec 64))

(assert (=> d!61515 (= lt!269582 (bvmul lt!269584 lt!269583))))

(assert (=> d!61515 (or (= lt!269584 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269583 (bvsdiv (bvmul lt!269584 lt!269583) lt!269584)))))

(assert (=> d!61515 (= lt!269583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61515 (= lt!269584 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269522)))))))

(assert (=> d!61515 (= lt!269580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_1!8176 lt!269522))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_1!8176 lt!269522)))))))

(assert (=> d!61515 (invariant!0 (currentBit!8681 (_1!8176 lt!269522)) (currentByte!8686 (_1!8176 lt!269522)) (size!4141 (buf!4572 (_1!8176 lt!269522))))))

(assert (=> d!61515 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269522))) (currentByte!8686 (_1!8176 lt!269522)) (currentBit!8681 (_1!8176 lt!269522))) lt!269580)))

(declare-fun b!174674 () Bool)

(declare-fun res!144658 () Bool)

(assert (=> b!174674 (=> (not res!144658) (not e!121774))))

(assert (=> b!174674 (= res!144658 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269580))))

(declare-fun b!174675 () Bool)

(declare-fun lt!269581 () (_ BitVec 64))

(assert (=> b!174675 (= e!121774 (bvsle lt!269580 (bvmul lt!269581 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174675 (or (= lt!269581 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269581 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269581)))))

(assert (=> b!174675 (= lt!269581 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269522)))))))

(assert (= (and d!61515 res!144657) b!174674))

(assert (= (and b!174674 res!144658) b!174675))

(declare-fun m!274221 () Bool)

(assert (=> d!61515 m!274221))

(declare-fun m!274223 () Bool)

(assert (=> d!61515 m!274223))

(assert (=> b!174610 d!61515))

(declare-fun d!61517 () Bool)

(assert (=> d!61517 (= (invariant!0 (currentBit!8681 (_2!8162 lt!269517)) (currentByte!8686 (_2!8162 lt!269517)) (size!4141 (buf!4572 (_2!8162 lt!269517)))) (and (bvsge (currentBit!8681 (_2!8162 lt!269517)) #b00000000000000000000000000000000) (bvslt (currentBit!8681 (_2!8162 lt!269517)) #b00000000000000000000000000001000) (bvsge (currentByte!8686 (_2!8162 lt!269517)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8686 (_2!8162 lt!269517)) (size!4141 (buf!4572 (_2!8162 lt!269517)))) (and (= (currentBit!8681 (_2!8162 lt!269517)) #b00000000000000000000000000000000) (= (currentByte!8686 (_2!8162 lt!269517)) (size!4141 (buf!4572 (_2!8162 lt!269517))))))))))

(assert (=> b!174610 d!61517))

(declare-fun d!61519 () Bool)

(assert (=> d!61519 (isPrefixOf!0 thiss!1187 (_2!8162 lt!269517))))

(declare-fun lt!269586 () Unit!12536)

(assert (=> d!61519 (= lt!269586 (choose!30 thiss!1187 (_2!8162 lt!269477) (_2!8162 lt!269517)))))

(assert (=> d!61519 (isPrefixOf!0 thiss!1187 (_2!8162 lt!269477))))

(assert (=> d!61519 (= (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8162 lt!269477) (_2!8162 lt!269517)) lt!269586)))

(declare-fun bs!15327 () Bool)

(assert (= bs!15327 d!61519))

(assert (=> bs!15327 m!274125))

(declare-fun m!274225 () Bool)

(assert (=> bs!15327 m!274225))

(declare-fun m!274227 () Bool)

(assert (=> bs!15327 m!274227))

(assert (=> b!174610 d!61519))

(declare-fun d!61521 () Bool)

(declare-fun e!121777 () Bool)

(assert (=> d!61521 e!121777))

(declare-fun res!144661 () Bool)

(assert (=> d!61521 (=> (not res!144661) (not e!121777))))

(declare-fun lt!269598 () tuple2!15068)

(declare-fun lt!269595 () tuple2!15068)

(assert (=> d!61521 (= res!144661 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269598))) (currentByte!8686 (_1!8176 lt!269598)) (currentBit!8681 (_1!8176 lt!269598))) (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269595))) (currentByte!8686 (_1!8176 lt!269595)) (currentBit!8681 (_1!8176 lt!269595)))))))

(declare-fun lt!269596 () BitStream!7390)

(declare-fun lt!269597 () Unit!12536)

(declare-fun choose!50 (BitStream!7390 BitStream!7390 BitStream!7390 tuple2!15068 tuple2!15068 BitStream!7390 Bool tuple2!15068 tuple2!15068 BitStream!7390 Bool) Unit!12536)

(assert (=> d!61521 (= lt!269597 (choose!50 lt!269496 (_2!8162 lt!269517) lt!269596 lt!269598 (tuple2!15069 (_1!8176 lt!269598) (_2!8176 lt!269598)) (_1!8176 lt!269598) (_2!8176 lt!269598) lt!269595 (tuple2!15069 (_1!8176 lt!269595) (_2!8176 lt!269595)) (_1!8176 lt!269595) (_2!8176 lt!269595)))))

(assert (=> d!61521 (= lt!269595 (readBitPure!0 lt!269596))))

(assert (=> d!61521 (= lt!269598 (readBitPure!0 lt!269496))))

(assert (=> d!61521 (= lt!269596 (BitStream!7391 (buf!4572 (_2!8162 lt!269517)) (currentByte!8686 lt!269496) (currentBit!8681 lt!269496)))))

(assert (=> d!61521 (invariant!0 (currentBit!8681 lt!269496) (currentByte!8686 lt!269496) (size!4141 (buf!4572 (_2!8162 lt!269517))))))

(assert (=> d!61521 (= (readBitPrefixLemma!0 lt!269496 (_2!8162 lt!269517)) lt!269597)))

(declare-fun b!174678 () Bool)

(assert (=> b!174678 (= e!121777 (= (_2!8176 lt!269598) (_2!8176 lt!269595)))))

(assert (= (and d!61521 res!144661) b!174678))

(assert (=> d!61521 m!274147))

(declare-fun m!274229 () Bool)

(assert (=> d!61521 m!274229))

(declare-fun m!274231 () Bool)

(assert (=> d!61521 m!274231))

(declare-fun m!274233 () Bool)

(assert (=> d!61521 m!274233))

(assert (=> d!61521 m!274093))

(declare-fun m!274235 () Bool)

(assert (=> d!61521 m!274235))

(assert (=> b!174610 d!61521))

(declare-fun d!61523 () Bool)

(assert (=> d!61523 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269480)))

(declare-fun lt!269599 () Unit!12536)

(assert (=> d!61523 (= lt!269599 (choose!9 thiss!1187 (buf!4572 (_2!8162 lt!269517)) lt!269480 (BitStream!7391 (buf!4572 (_2!8162 lt!269517)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (=> d!61523 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4572 (_2!8162 lt!269517)) lt!269480) lt!269599)))

(declare-fun bs!15328 () Bool)

(assert (= bs!15328 d!61523))

(assert (=> bs!15328 m!274131))

(declare-fun m!274237 () Bool)

(assert (=> bs!15328 m!274237))

(assert (=> b!174610 d!61523))

(declare-fun d!61525 () Bool)

(declare-fun lt!269600 () tuple2!15070)

(assert (=> d!61525 (= lt!269600 (readBit!0 lt!269496))))

(assert (=> d!61525 (= (readBitPure!0 lt!269496) (tuple2!15069 (_2!8177 lt!269600) (_1!8177 lt!269600)))))

(declare-fun bs!15329 () Bool)

(assert (= bs!15329 d!61525))

(declare-fun m!274239 () Bool)

(assert (=> bs!15329 m!274239))

(assert (=> b!174610 d!61525))

(declare-fun d!61527 () Bool)

(declare-fun lt!269618 () tuple2!15042)

(declare-fun lt!269615 () tuple2!15042)

(assert (=> d!61527 (and (= (_2!8163 lt!269618) (_2!8163 lt!269615)) (= (_1!8163 lt!269618) (_1!8163 lt!269615)))))

(declare-fun lt!269616 () (_ BitVec 64))

(declare-fun lt!269613 () Bool)

(declare-fun lt!269614 () Unit!12536)

(declare-fun lt!269617 () BitStream!7390)

(declare-fun choose!56 (BitStream!7390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!15042 tuple2!15042 BitStream!7390 (_ BitVec 64) Bool BitStream!7390 (_ BitVec 64) tuple2!15042 tuple2!15042 BitStream!7390 (_ BitVec 64)) Unit!12536)

(assert (=> d!61527 (= lt!269614 (choose!56 (_1!8164 lt!269518) nBits!340 #b00000000000000000000000000000000 lt!269509 lt!269618 (tuple2!15043 (_1!8163 lt!269618) (_2!8163 lt!269618)) (_1!8163 lt!269618) (_2!8163 lt!269618) lt!269613 lt!269617 lt!269616 lt!269615 (tuple2!15043 (_1!8163 lt!269615) (_2!8163 lt!269615)) (_1!8163 lt!269615) (_2!8163 lt!269615)))))

(assert (=> d!61527 (= lt!269615 (readNBitsLSBFirstsLoopPure!0 lt!269617 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!269616))))

(assert (=> d!61527 (= lt!269616 (bvor lt!269509 (ite lt!269613 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61527 (= lt!269617 (withMovedBitIndex!0 (_1!8164 lt!269518) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!61527 (= lt!269613 (_2!8176 (readBitPure!0 (_1!8164 lt!269518))))))

(assert (=> d!61527 (= lt!269618 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269518) nBits!340 #b00000000000000000000000000000000 lt!269509))))

(assert (=> d!61527 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8164 lt!269518) nBits!340 #b00000000000000000000000000000000 lt!269509) lt!269614)))

(declare-fun bs!15331 () Bool)

(assert (= bs!15331 d!61527))

(assert (=> bs!15331 m!274151))

(assert (=> bs!15331 m!274133))

(declare-fun m!274241 () Bool)

(assert (=> bs!15331 m!274241))

(declare-fun m!274243 () Bool)

(assert (=> bs!15331 m!274243))

(assert (=> bs!15331 m!274139))

(assert (=> b!174610 d!61527))

(declare-fun d!61529 () Bool)

(declare-fun lt!269619 () tuple2!15070)

(assert (=> d!61529 (= lt!269619 (readBit!0 (_1!8164 lt!269518)))))

(assert (=> d!61529 (= (readBitPure!0 (_1!8164 lt!269518)) (tuple2!15069 (_2!8177 lt!269619) (_1!8177 lt!269619)))))

(declare-fun bs!15332 () Bool)

(assert (= bs!15332 d!61529))

(declare-fun m!274245 () Bool)

(assert (=> bs!15332 m!274245))

(assert (=> b!174610 d!61529))

(declare-fun e!121778 () Bool)

(declare-fun b!174679 () Bool)

(declare-fun lt!269629 () tuple2!15044)

(declare-fun lt!269632 () (_ BitVec 64))

(declare-fun lt!269639 () (_ BitVec 64))

(assert (=> b!174679 (= e!121778 (= (_1!8164 lt!269629) (withMovedBitIndex!0 (_2!8164 lt!269629) (bvsub lt!269632 lt!269639))))))

(assert (=> b!174679 (or (= (bvand lt!269632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269632 lt!269639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174679 (= lt!269639 (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))))

(assert (=> b!174679 (= lt!269632 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(declare-fun b!174680 () Bool)

(declare-fun e!121779 () Unit!12536)

(declare-fun Unit!12578 () Unit!12536)

(assert (=> b!174680 (= e!121779 Unit!12578)))

(declare-fun b!174682 () Bool)

(declare-fun res!144662 () Bool)

(assert (=> b!174682 (=> (not res!144662) (not e!121778))))

(assert (=> b!174682 (= res!144662 (isPrefixOf!0 (_1!8164 lt!269629) thiss!1187))))

(declare-fun b!174683 () Bool)

(declare-fun lt!269631 () Unit!12536)

(assert (=> b!174683 (= e!121779 lt!269631)))

(declare-fun lt!269627 () (_ BitVec 64))

(assert (=> b!174683 (= lt!269627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!269622 () (_ BitVec 64))

(assert (=> b!174683 (= lt!269622 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(assert (=> b!174683 (= lt!269631 (arrayBitRangesEqSymmetric!0 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!269517)) lt!269627 lt!269622))))

(assert (=> b!174683 (arrayBitRangesEq!0 (buf!4572 (_2!8162 lt!269517)) (buf!4572 thiss!1187) lt!269627 lt!269622)))

(declare-fun d!61531 () Bool)

(assert (=> d!61531 e!121778))

(declare-fun res!144664 () Bool)

(assert (=> d!61531 (=> (not res!144664) (not e!121778))))

(assert (=> d!61531 (= res!144664 (isPrefixOf!0 (_1!8164 lt!269629) (_2!8164 lt!269629)))))

(declare-fun lt!269623 () BitStream!7390)

(assert (=> d!61531 (= lt!269629 (tuple2!15045 lt!269623 (_2!8162 lt!269517)))))

(declare-fun lt!269633 () Unit!12536)

(declare-fun lt!269626 () Unit!12536)

(assert (=> d!61531 (= lt!269633 lt!269626)))

(assert (=> d!61531 (isPrefixOf!0 lt!269623 (_2!8162 lt!269517))))

(assert (=> d!61531 (= lt!269626 (lemmaIsPrefixTransitive!0 lt!269623 (_2!8162 lt!269517) (_2!8162 lt!269517)))))

(declare-fun lt!269624 () Unit!12536)

(declare-fun lt!269625 () Unit!12536)

(assert (=> d!61531 (= lt!269624 lt!269625)))

(assert (=> d!61531 (isPrefixOf!0 lt!269623 (_2!8162 lt!269517))))

(assert (=> d!61531 (= lt!269625 (lemmaIsPrefixTransitive!0 lt!269623 thiss!1187 (_2!8162 lt!269517)))))

(declare-fun lt!269634 () Unit!12536)

(assert (=> d!61531 (= lt!269634 e!121779)))

(declare-fun c!9199 () Bool)

(assert (=> d!61531 (= c!9199 (not (= (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!269628 () Unit!12536)

(declare-fun lt!269638 () Unit!12536)

(assert (=> d!61531 (= lt!269628 lt!269638)))

(assert (=> d!61531 (isPrefixOf!0 (_2!8162 lt!269517) (_2!8162 lt!269517))))

(assert (=> d!61531 (= lt!269638 (lemmaIsPrefixRefl!0 (_2!8162 lt!269517)))))

(declare-fun lt!269620 () Unit!12536)

(declare-fun lt!269630 () Unit!12536)

(assert (=> d!61531 (= lt!269620 lt!269630)))

(assert (=> d!61531 (= lt!269630 (lemmaIsPrefixRefl!0 (_2!8162 lt!269517)))))

(declare-fun lt!269637 () Unit!12536)

(declare-fun lt!269636 () Unit!12536)

(assert (=> d!61531 (= lt!269637 lt!269636)))

(assert (=> d!61531 (isPrefixOf!0 lt!269623 lt!269623)))

(assert (=> d!61531 (= lt!269636 (lemmaIsPrefixRefl!0 lt!269623))))

(declare-fun lt!269621 () Unit!12536)

(declare-fun lt!269635 () Unit!12536)

(assert (=> d!61531 (= lt!269621 lt!269635)))

(assert (=> d!61531 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61531 (= lt!269635 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61531 (= lt!269623 (BitStream!7391 (buf!4572 (_2!8162 lt!269517)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(assert (=> d!61531 (isPrefixOf!0 thiss!1187 (_2!8162 lt!269517))))

(assert (=> d!61531 (= (reader!0 thiss!1187 (_2!8162 lt!269517)) lt!269629)))

(declare-fun b!174681 () Bool)

(declare-fun res!144663 () Bool)

(assert (=> b!174681 (=> (not res!144663) (not e!121778))))

(assert (=> b!174681 (= res!144663 (isPrefixOf!0 (_2!8164 lt!269629) (_2!8162 lt!269517)))))

(assert (= (and d!61531 c!9199) b!174683))

(assert (= (and d!61531 (not c!9199)) b!174680))

(assert (= (and d!61531 res!144664) b!174682))

(assert (= (and b!174682 res!144662) b!174681))

(assert (= (and b!174681 res!144663) b!174679))

(declare-fun m!274247 () Bool)

(assert (=> b!174681 m!274247))

(declare-fun m!274249 () Bool)

(assert (=> d!61531 m!274249))

(assert (=> d!61531 m!274125))

(assert (=> d!61531 m!273845))

(declare-fun m!274251 () Bool)

(assert (=> d!61531 m!274251))

(declare-fun m!274253 () Bool)

(assert (=> d!61531 m!274253))

(declare-fun m!274255 () Bool)

(assert (=> d!61531 m!274255))

(assert (=> d!61531 m!273853))

(declare-fun m!274257 () Bool)

(assert (=> d!61531 m!274257))

(declare-fun m!274259 () Bool)

(assert (=> d!61531 m!274259))

(declare-fun m!274261 () Bool)

(assert (=> d!61531 m!274261))

(declare-fun m!274263 () Bool)

(assert (=> d!61531 m!274263))

(declare-fun m!274265 () Bool)

(assert (=> b!174682 m!274265))

(assert (=> b!174683 m!273693))

(declare-fun m!274267 () Bool)

(assert (=> b!174683 m!274267))

(declare-fun m!274269 () Bool)

(assert (=> b!174683 m!274269))

(declare-fun m!274271 () Bool)

(assert (=> b!174679 m!274271))

(assert (=> b!174679 m!274107))

(assert (=> b!174679 m!273693))

(assert (=> b!174610 d!61531))

(assert (=> b!174610 d!61443))

(declare-fun d!61533 () Bool)

(assert (=> d!61533 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477))) lt!269524) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477)))) lt!269524))))

(declare-fun bs!15333 () Bool)

(assert (= bs!15333 d!61533))

(declare-fun m!274273 () Bool)

(assert (=> bs!15333 m!274273))

(assert (=> b!174610 d!61533))

(declare-fun d!61535 () Bool)

(assert (=> d!61535 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))) lt!269480))))

(declare-fun bs!15334 () Bool)

(assert (= bs!15334 d!61535))

(declare-fun m!274275 () Bool)

(assert (=> bs!15334 m!274275))

(assert (=> b!174610 d!61535))

(declare-fun d!61537 () Bool)

(declare-fun e!121782 () Bool)

(assert (=> d!61537 e!121782))

(declare-fun res!144667 () Bool)

(assert (=> d!61537 (=> (not res!144667) (not e!121782))))

(declare-fun lt!269645 () (_ BitVec 64))

(declare-fun lt!269644 () BitStream!7390)

(assert (=> d!61537 (= res!144667 (= (bvadd lt!269645 (bvsub (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))) (bitIndex!0 (size!4141 (buf!4572 lt!269644)) (currentByte!8686 lt!269644) (currentBit!8681 lt!269644))))))

(assert (=> d!61537 (or (not (= (bvand lt!269645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269645 (bvsub (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61537 (= lt!269645 (bitIndex!0 (size!4141 (buf!4572 (_2!8164 lt!269518))) (currentByte!8686 (_2!8164 lt!269518)) (currentBit!8681 (_2!8164 lt!269518))))))

(declare-fun moveBitIndex!0 (BitStream!7390 (_ BitVec 64)) tuple2!15040)

(assert (=> d!61537 (= lt!269644 (_2!8162 (moveBitIndex!0 (_2!8164 lt!269518) (bvsub (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517)))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7390 (_ BitVec 64)) Bool)

(assert (=> d!61537 (moveBitIndexPrecond!0 (_2!8164 lt!269518) (bvsub (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517)))))))

(assert (=> d!61537 (= (withMovedBitIndex!0 (_2!8164 lt!269518) (bvsub (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))) lt!269644)))

(declare-fun b!174686 () Bool)

(assert (=> b!174686 (= e!121782 (= (size!4141 (buf!4572 (_2!8164 lt!269518))) (size!4141 (buf!4572 lt!269644))))))

(assert (= (and d!61537 res!144667) b!174686))

(declare-fun m!274277 () Bool)

(assert (=> d!61537 m!274277))

(declare-fun m!274279 () Bool)

(assert (=> d!61537 m!274279))

(declare-fun m!274281 () Bool)

(assert (=> d!61537 m!274281))

(declare-fun m!274283 () Bool)

(assert (=> d!61537 m!274283))

(assert (=> b!174610 d!61537))

(declare-fun b!174687 () Bool)

(declare-fun res!144668 () Bool)

(declare-fun call!2898 () Bool)

(assert (=> b!174687 (= res!144668 call!2898)))

(declare-fun e!121791 () Bool)

(assert (=> b!174687 (=> (not res!144668) (not e!121791))))

(declare-fun b!174688 () Bool)

(declare-fun e!121786 () tuple2!15040)

(declare-fun lt!269687 () tuple2!15040)

(assert (=> b!174688 (= e!121786 (tuple2!15041 (_1!8162 lt!269687) (_2!8162 lt!269687)))))

(declare-fun lt!269684 () Bool)

(assert (=> b!174688 (= lt!269684 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!269651 () tuple2!15040)

(assert (=> b!174688 (= lt!269651 (appendBit!0 (_2!8162 lt!269477) lt!269684))))

(declare-fun res!144679 () Bool)

(assert (=> b!174688 (= res!144679 (= (size!4141 (buf!4572 (_2!8162 lt!269477))) (size!4141 (buf!4572 (_2!8162 lt!269651)))))))

(assert (=> b!174688 (=> (not res!144679) (not e!121791))))

(assert (=> b!174688 e!121791))

(declare-fun lt!269647 () tuple2!15040)

(assert (=> b!174688 (= lt!269647 lt!269651)))

(assert (=> b!174688 (= lt!269687 (appendBitsLSBFirstLoopTR!0 (_2!8162 lt!269647) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!269696 () Unit!12536)

(assert (=> b!174688 (= lt!269696 (lemmaIsPrefixTransitive!0 (_2!8162 lt!269477) (_2!8162 lt!269647) (_2!8162 lt!269687)))))

(assert (=> b!174688 (isPrefixOf!0 (_2!8162 lt!269477) (_2!8162 lt!269687))))

(declare-fun lt!269678 () Unit!12536)

(assert (=> b!174688 (= lt!269678 lt!269696)))

(assert (=> b!174688 (invariant!0 (currentBit!8681 (_2!8162 lt!269477)) (currentByte!8686 (_2!8162 lt!269477)) (size!4141 (buf!4572 (_2!8162 lt!269647))))))

(declare-fun lt!269666 () BitStream!7390)

(assert (=> b!174688 (= lt!269666 (BitStream!7391 (buf!4572 (_2!8162 lt!269647)) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))))))

(assert (=> b!174688 (invariant!0 (currentBit!8681 lt!269666) (currentByte!8686 lt!269666) (size!4141 (buf!4572 (_2!8162 lt!269687))))))

(declare-fun lt!269697 () BitStream!7390)

(assert (=> b!174688 (= lt!269697 (BitStream!7391 (buf!4572 (_2!8162 lt!269687)) (currentByte!8686 lt!269666) (currentBit!8681 lt!269666)))))

(declare-fun lt!269692 () tuple2!15068)

(assert (=> b!174688 (= lt!269692 (readBitPure!0 lt!269666))))

(declare-fun lt!269658 () tuple2!15068)

(assert (=> b!174688 (= lt!269658 (readBitPure!0 lt!269697))))

(declare-fun lt!269673 () Unit!12536)

(assert (=> b!174688 (= lt!269673 (readBitPrefixLemma!0 lt!269666 (_2!8162 lt!269687)))))

(declare-fun res!144677 () Bool)

(assert (=> b!174688 (= res!144677 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269692))) (currentByte!8686 (_1!8176 lt!269692)) (currentBit!8681 (_1!8176 lt!269692))) (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269658))) (currentByte!8686 (_1!8176 lt!269658)) (currentBit!8681 (_1!8176 lt!269658)))))))

(declare-fun e!121788 () Bool)

(assert (=> b!174688 (=> (not res!144677) (not e!121788))))

(assert (=> b!174688 e!121788))

(declare-fun lt!269664 () Unit!12536)

(assert (=> b!174688 (= lt!269664 lt!269673)))

(declare-fun lt!269688 () tuple2!15044)

(assert (=> b!174688 (= lt!269688 (reader!0 (_2!8162 lt!269477) (_2!8162 lt!269687)))))

(declare-fun lt!269674 () tuple2!15044)

(assert (=> b!174688 (= lt!269674 (reader!0 (_2!8162 lt!269647) (_2!8162 lt!269687)))))

(declare-fun lt!269680 () tuple2!15068)

(assert (=> b!174688 (= lt!269680 (readBitPure!0 (_1!8164 lt!269688)))))

(assert (=> b!174688 (= (_2!8176 lt!269680) lt!269684)))

(declare-fun lt!269699 () Unit!12536)

(declare-fun Unit!12579 () Unit!12536)

(assert (=> b!174688 (= lt!269699 Unit!12579)))

(declare-fun lt!269679 () (_ BitVec 64))

(assert (=> b!174688 (= lt!269679 (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!269659 () (_ BitVec 64))

(assert (=> b!174688 (= lt!269659 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!269685 () Unit!12536)

(assert (=> b!174688 (= lt!269685 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8162 lt!269477) (buf!4572 (_2!8162 lt!269687)) lt!269659))))

(assert (=> b!174688 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269687)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477))) lt!269659)))

(declare-fun lt!269670 () Unit!12536)

(assert (=> b!174688 (= lt!269670 lt!269685)))

(declare-fun lt!269667 () tuple2!15042)

(assert (=> b!174688 (= lt!269667 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269688) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!269679))))

(declare-fun lt!269694 () (_ BitVec 64))

(assert (=> b!174688 (= lt!269694 ((_ sign_extend 32) (bvsub (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!269677 () Unit!12536)

(assert (=> b!174688 (= lt!269677 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8162 lt!269647) (buf!4572 (_2!8162 lt!269687)) lt!269694))))

(assert (=> b!174688 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269687)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269647))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269647))) lt!269694)))

(declare-fun lt!269648 () Unit!12536)

(assert (=> b!174688 (= lt!269648 lt!269677)))

(declare-fun lt!269649 () tuple2!15042)

(assert (=> b!174688 (= lt!269649 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269674) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!269679 (ite (_2!8176 lt!269680) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!269662 () tuple2!15042)

(assert (=> b!174688 (= lt!269662 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269688) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!269679))))

(declare-fun c!9200 () Bool)

(assert (=> b!174688 (= c!9200 (_2!8176 (readBitPure!0 (_1!8164 lt!269688))))))

(declare-fun e!121787 () (_ BitVec 64))

(declare-fun lt!269682 () tuple2!15042)

(assert (=> b!174688 (= lt!269682 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8164 lt!269688) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!269679 e!121787)))))

(declare-fun lt!269701 () Unit!12536)

(assert (=> b!174688 (= lt!269701 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8164 lt!269688) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!269679))))

(assert (=> b!174688 (and (= (_2!8163 lt!269662) (_2!8163 lt!269682)) (= (_1!8163 lt!269662) (_1!8163 lt!269682)))))

(declare-fun lt!269675 () Unit!12536)

(assert (=> b!174688 (= lt!269675 lt!269701)))

(assert (=> b!174688 (= (_1!8164 lt!269688) (withMovedBitIndex!0 (_2!8164 lt!269688) (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269687))) (currentByte!8686 (_2!8162 lt!269687)) (currentBit!8681 (_2!8162 lt!269687))))))))

(declare-fun lt!269660 () Unit!12536)

(declare-fun Unit!12580 () Unit!12536)

(assert (=> b!174688 (= lt!269660 Unit!12580)))

(assert (=> b!174688 (= (_1!8164 lt!269674) (withMovedBitIndex!0 (_2!8164 lt!269674) (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269647))) (currentByte!8686 (_2!8162 lt!269647)) (currentBit!8681 (_2!8162 lt!269647))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269687))) (currentByte!8686 (_2!8162 lt!269687)) (currentBit!8681 (_2!8162 lt!269687))))))))

(declare-fun lt!269657 () Unit!12536)

(declare-fun Unit!12581 () Unit!12536)

(assert (=> b!174688 (= lt!269657 Unit!12581)))

(assert (=> b!174688 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269647))) (currentByte!8686 (_2!8162 lt!269647)) (currentBit!8681 (_2!8162 lt!269647))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!269693 () Unit!12536)

(declare-fun Unit!12582 () Unit!12536)

(assert (=> b!174688 (= lt!269693 Unit!12582)))

(assert (=> b!174688 (= (_2!8163 lt!269667) (_2!8163 lt!269649))))

(declare-fun lt!269646 () Unit!12536)

(declare-fun Unit!12583 () Unit!12536)

(assert (=> b!174688 (= lt!269646 Unit!12583)))

(assert (=> b!174688 (invariant!0 (currentBit!8681 (_2!8162 lt!269687)) (currentByte!8686 (_2!8162 lt!269687)) (size!4141 (buf!4572 (_2!8162 lt!269687))))))

(declare-fun lt!269654 () Unit!12536)

(declare-fun Unit!12584 () Unit!12536)

(assert (=> b!174688 (= lt!269654 Unit!12584)))

(assert (=> b!174688 (= (size!4141 (buf!4572 (_2!8162 lt!269477))) (size!4141 (buf!4572 (_2!8162 lt!269687))))))

(declare-fun lt!269698 () Unit!12536)

(declare-fun Unit!12585 () Unit!12536)

(assert (=> b!174688 (= lt!269698 Unit!12585)))

(assert (=> b!174688 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269687))) (currentByte!8686 (_2!8162 lt!269687)) (currentBit!8681 (_2!8162 lt!269687))) (bvsub (bvadd (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!269700 () Unit!12536)

(declare-fun Unit!12586 () Unit!12536)

(assert (=> b!174688 (= lt!269700 Unit!12586)))

(declare-fun lt!269691 () Unit!12536)

(declare-fun Unit!12587 () Unit!12536)

(assert (=> b!174688 (= lt!269691 Unit!12587)))

(declare-fun lt!269676 () tuple2!15044)

(assert (=> b!174688 (= lt!269676 (reader!0 (_2!8162 lt!269477) (_2!8162 lt!269687)))))

(declare-fun lt!269650 () (_ BitVec 64))

(assert (=> b!174688 (= lt!269650 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!269652 () Unit!12536)

(assert (=> b!174688 (= lt!269652 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8162 lt!269477) (buf!4572 (_2!8162 lt!269687)) lt!269650))))

(assert (=> b!174688 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269687)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477))) lt!269650)))

(declare-fun lt!269653 () Unit!12536)

(assert (=> b!174688 (= lt!269653 lt!269652)))

(declare-fun lt!269669 () tuple2!15042)

(assert (=> b!174688 (= lt!269669 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269676) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun res!144676 () Bool)

(assert (=> b!174688 (= res!144676 (= (_2!8163 lt!269669) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!121784 () Bool)

(assert (=> b!174688 (=> (not res!144676) (not e!121784))))

(assert (=> b!174688 e!121784))

(declare-fun lt!269665 () Unit!12536)

(declare-fun Unit!12588 () Unit!12536)

(assert (=> b!174688 (= lt!269665 Unit!12588)))

(declare-fun b!174689 () Bool)

(assert (=> b!174689 (= e!121788 (= (_2!8176 lt!269692) (_2!8176 lt!269658)))))

(declare-fun b!174690 () Bool)

(declare-fun e!121783 () Bool)

(declare-fun e!121789 () Bool)

(assert (=> b!174690 (= e!121783 e!121789)))

(declare-fun res!144674 () Bool)

(assert (=> b!174690 (=> (not res!144674) (not e!121789))))

(declare-fun lt!269655 () tuple2!15042)

(assert (=> b!174690 (= res!144674 (= (_2!8163 lt!269655) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun lt!269689 () tuple2!15044)

(assert (=> b!174690 (= lt!269655 (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269689) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun lt!269661 () Unit!12536)

(declare-fun lt!269690 () Unit!12536)

(assert (=> b!174690 (= lt!269661 lt!269690)))

(declare-fun lt!269656 () tuple2!15040)

(declare-fun lt!269681 () (_ BitVec 64))

(assert (=> b!174690 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269656)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477))) lt!269681)))

(assert (=> b!174690 (= lt!269690 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8162 lt!269477) (buf!4572 (_2!8162 lt!269656)) lt!269681))))

(declare-fun e!121785 () Bool)

(assert (=> b!174690 e!121785))

(declare-fun res!144669 () Bool)

(assert (=> b!174690 (=> (not res!144669) (not e!121785))))

(assert (=> b!174690 (= res!144669 (and (= (size!4141 (buf!4572 (_2!8162 lt!269477))) (size!4141 (buf!4572 (_2!8162 lt!269656)))) (bvsge lt!269681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174690 (= lt!269681 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174690 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!174690 (= lt!269689 (reader!0 (_2!8162 lt!269477) (_2!8162 lt!269656)))))

(declare-fun c!9201 () Bool)

(declare-fun bm!2895 () Bool)

(assert (=> bm!2895 (= call!2898 (isPrefixOf!0 (_2!8162 lt!269477) (ite c!9201 (_2!8162 lt!269477) (_2!8162 lt!269651))))))

(declare-fun b!174691 () Bool)

(declare-fun res!144675 () Bool)

(assert (=> b!174691 (=> (not res!144675) (not e!121783))))

(declare-fun lt!269686 () (_ BitVec 64))

(declare-fun lt!269668 () (_ BitVec 64))

(assert (=> b!174691 (= res!144675 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269656))) (currentByte!8686 (_2!8162 lt!269656)) (currentBit!8681 (_2!8162 lt!269656))) (bvsub lt!269668 lt!269686)))))

(assert (=> b!174691 (or (= (bvand lt!269668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269668 lt!269686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174691 (= lt!269686 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!269663 () (_ BitVec 64))

(declare-fun lt!269695 () (_ BitVec 64))

(assert (=> b!174691 (= lt!269668 (bvadd lt!269663 lt!269695))))

(assert (=> b!174691 (or (not (= (bvand lt!269663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269695 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269663 lt!269695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174691 (= lt!269695 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174691 (= lt!269663 (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))))))

(declare-fun b!174692 () Bool)

(declare-fun lt!269672 () tuple2!15068)

(assert (=> b!174692 (= lt!269672 (readBitPure!0 (readerFrom!0 (_2!8162 lt!269651) (currentBit!8681 (_2!8162 lt!269477)) (currentByte!8686 (_2!8162 lt!269477)))))))

(declare-fun res!144670 () Bool)

(assert (=> b!174692 (= res!144670 (and (= (_2!8176 lt!269672) lt!269684) (= (_1!8176 lt!269672) (_2!8162 lt!269651))))))

(declare-fun e!121790 () Bool)

(assert (=> b!174692 (=> (not res!144670) (not e!121790))))

(assert (=> b!174692 (= e!121791 e!121790)))

(declare-fun b!174693 () Bool)

(declare-fun Unit!12589 () Unit!12536)

(assert (=> b!174693 (= e!121786 (tuple2!15041 Unit!12589 (_2!8162 lt!269477)))))

(declare-fun lt!269671 () Unit!12536)

(assert (=> b!174693 (= lt!269671 (lemmaIsPrefixRefl!0 (_2!8162 lt!269477)))))

(assert (=> b!174693 call!2898))

(declare-fun lt!269683 () Unit!12536)

(assert (=> b!174693 (= lt!269683 lt!269671)))

(declare-fun b!174694 () Bool)

(assert (=> b!174694 (= e!121785 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269477)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477))) lt!269681))))

(declare-fun b!174695 () Bool)

(assert (=> b!174695 (= e!121787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!61539 () Bool)

(assert (=> d!61539 e!121783))

(declare-fun res!144671 () Bool)

(assert (=> d!61539 (=> (not res!144671) (not e!121783))))

(assert (=> d!61539 (= res!144671 (invariant!0 (currentBit!8681 (_2!8162 lt!269656)) (currentByte!8686 (_2!8162 lt!269656)) (size!4141 (buf!4572 (_2!8162 lt!269656)))))))

(assert (=> d!61539 (= lt!269656 e!121786)))

(assert (=> d!61539 (= c!9201 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!340))))

(assert (=> d!61539 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61539 (= (appendBitsLSBFirstLoopTR!0 (_2!8162 lt!269477) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!269656)))

(declare-fun b!174696 () Bool)

(assert (=> b!174696 (= e!121790 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269672))) (currentByte!8686 (_1!8176 lt!269672)) (currentBit!8681 (_1!8176 lt!269672))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269651))) (currentByte!8686 (_2!8162 lt!269651)) (currentBit!8681 (_2!8162 lt!269651)))))))

(declare-fun b!174697 () Bool)

(declare-fun res!144678 () Bool)

(assert (=> b!174697 (=> (not res!144678) (not e!121783))))

(assert (=> b!174697 (= res!144678 (isPrefixOf!0 (_2!8162 lt!269477) (_2!8162 lt!269656)))))

(declare-fun b!174698 () Bool)

(assert (=> b!174698 (= e!121784 (= (_1!8163 lt!269669) (_2!8164 lt!269676)))))

(declare-fun b!174699 () Bool)

(declare-fun res!144672 () Bool)

(assert (=> b!174699 (=> (not res!144672) (not e!121783))))

(assert (=> b!174699 (= res!144672 (= (size!4141 (buf!4572 (_2!8162 lt!269477))) (size!4141 (buf!4572 (_2!8162 lt!269656)))))))

(declare-fun b!174700 () Bool)

(assert (=> b!174700 (= e!121789 (= (_1!8163 lt!269655) (_2!8164 lt!269689)))))

(declare-fun b!174701 () Bool)

(declare-fun res!144673 () Bool)

(assert (=> b!174701 (= res!144673 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269651))) (currentByte!8686 (_2!8162 lt!269651)) (currentBit!8681 (_2!8162 lt!269651))) (bvadd (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!174701 (=> (not res!144673) (not e!121791))))

(declare-fun b!174702 () Bool)

(assert (=> b!174702 (= e!121787 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!61539 c!9201) b!174693))

(assert (= (and d!61539 (not c!9201)) b!174688))

(assert (= (and b!174688 res!144679) b!174701))

(assert (= (and b!174701 res!144673) b!174687))

(assert (= (and b!174687 res!144668) b!174692))

(assert (= (and b!174692 res!144670) b!174696))

(assert (= (and b!174688 res!144677) b!174689))

(assert (= (and b!174688 c!9200) b!174702))

(assert (= (and b!174688 (not c!9200)) b!174695))

(assert (= (and b!174688 res!144676) b!174698))

(assert (= (or b!174693 b!174687) bm!2895))

(assert (= (and d!61539 res!144671) b!174699))

(assert (= (and b!174699 res!144672) b!174691))

(assert (= (and b!174691 res!144675) b!174697))

(assert (= (and b!174697 res!144678) b!174690))

(assert (= (and b!174690 res!144669) b!174694))

(assert (= (and b!174690 res!144674) b!174700))

(declare-fun m!274285 () Bool)

(assert (=> b!174694 m!274285))

(declare-fun m!274287 () Bool)

(assert (=> b!174697 m!274287))

(declare-fun m!274289 () Bool)

(assert (=> b!174692 m!274289))

(assert (=> b!174692 m!274289))

(declare-fun m!274291 () Bool)

(assert (=> b!174692 m!274291))

(declare-fun m!274293 () Bool)

(assert (=> b!174693 m!274293))

(declare-fun m!274295 () Bool)

(assert (=> b!174696 m!274295))

(declare-fun m!274297 () Bool)

(assert (=> b!174696 m!274297))

(declare-fun m!274299 () Bool)

(assert (=> b!174691 m!274299))

(assert (=> b!174691 m!274135))

(declare-fun m!274301 () Bool)

(assert (=> b!174690 m!274301))

(declare-fun m!274303 () Bool)

(assert (=> b!174690 m!274303))

(declare-fun m!274305 () Bool)

(assert (=> b!174690 m!274305))

(declare-fun m!274307 () Bool)

(assert (=> b!174690 m!274307))

(declare-fun m!274309 () Bool)

(assert (=> b!174690 m!274309))

(assert (=> b!174690 m!273677))

(assert (=> b!174701 m!274297))

(assert (=> b!174701 m!274135))

(declare-fun m!274311 () Bool)

(assert (=> bm!2895 m!274311))

(declare-fun m!274313 () Bool)

(assert (=> d!61539 m!274313))

(declare-fun m!274315 () Bool)

(assert (=> b!174688 m!274315))

(declare-fun m!274317 () Bool)

(assert (=> b!174688 m!274317))

(assert (=> b!174688 m!274303))

(declare-fun m!274319 () Bool)

(assert (=> b!174688 m!274319))

(declare-fun m!274321 () Bool)

(assert (=> b!174688 m!274321))

(declare-fun m!274323 () Bool)

(assert (=> b!174688 m!274323))

(declare-fun m!274325 () Bool)

(assert (=> b!174688 m!274325))

(declare-fun m!274327 () Bool)

(assert (=> b!174688 m!274327))

(declare-fun m!274329 () Bool)

(assert (=> b!174688 m!274329))

(declare-fun m!274331 () Bool)

(assert (=> b!174688 m!274331))

(declare-fun m!274333 () Bool)

(assert (=> b!174688 m!274333))

(declare-fun m!274335 () Bool)

(assert (=> b!174688 m!274335))

(assert (=> b!174688 m!273677))

(assert (=> b!174688 m!274135))

(declare-fun m!274337 () Bool)

(assert (=> b!174688 m!274337))

(declare-fun m!274339 () Bool)

(assert (=> b!174688 m!274339))

(declare-fun m!274341 () Bool)

(assert (=> b!174688 m!274341))

(declare-fun m!274343 () Bool)

(assert (=> b!174688 m!274343))

(declare-fun m!274345 () Bool)

(assert (=> b!174688 m!274345))

(declare-fun m!274347 () Bool)

(assert (=> b!174688 m!274347))

(declare-fun m!274349 () Bool)

(assert (=> b!174688 m!274349))

(declare-fun m!274351 () Bool)

(assert (=> b!174688 m!274351))

(declare-fun m!274353 () Bool)

(assert (=> b!174688 m!274353))

(declare-fun m!274355 () Bool)

(assert (=> b!174688 m!274355))

(declare-fun m!274357 () Bool)

(assert (=> b!174688 m!274357))

(declare-fun m!274359 () Bool)

(assert (=> b!174688 m!274359))

(declare-fun m!274361 () Bool)

(assert (=> b!174688 m!274361))

(declare-fun m!274363 () Bool)

(assert (=> b!174688 m!274363))

(declare-fun m!274365 () Bool)

(assert (=> b!174688 m!274365))

(declare-fun m!274367 () Bool)

(assert (=> b!174688 m!274367))

(declare-fun m!274369 () Bool)

(assert (=> b!174688 m!274369))

(assert (=> b!174688 m!274361))

(declare-fun m!274371 () Bool)

(assert (=> b!174688 m!274371))

(declare-fun m!274373 () Bool)

(assert (=> b!174688 m!274373))

(declare-fun m!274375 () Bool)

(assert (=> b!174688 m!274375))

(assert (=> b!174610 d!61539))

(declare-fun lt!269704 () tuple2!15066)

(declare-fun d!61541 () Bool)

(assert (=> d!61541 (= lt!269704 (readNBitsLSBFirstsLoop!0 (_1!8164 lt!269506) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(assert (=> d!61541 (= (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269506) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))) (tuple2!15043 (_2!8175 lt!269704) (_1!8175 lt!269704)))))

(declare-fun bs!15335 () Bool)

(assert (= bs!15335 d!61541))

(declare-fun m!274377 () Bool)

(assert (=> bs!15335 m!274377))

(assert (=> b!174610 d!61541))

(declare-fun d!61543 () Bool)

(assert (=> d!61543 (= (onesLSBLong!0 #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174610 d!61543))

(declare-fun d!61545 () Bool)

(assert (=> d!61545 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269489)))

(declare-fun lt!269705 () Unit!12536)

(assert (=> d!61545 (= lt!269705 (choose!9 thiss!1187 (buf!4572 (_2!8162 lt!269517)) lt!269489 (BitStream!7391 (buf!4572 (_2!8162 lt!269517)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (=> d!61545 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4572 (_2!8162 lt!269517)) lt!269489) lt!269705)))

(declare-fun bs!15336 () Bool)

(assert (= bs!15336 d!61545))

(assert (=> bs!15336 m!274127))

(declare-fun m!274379 () Bool)

(assert (=> bs!15336 m!274379))

(assert (=> b!174610 d!61545))

(declare-fun d!61547 () Bool)

(declare-fun e!121792 () Bool)

(assert (=> d!61547 e!121792))

(declare-fun res!144680 () Bool)

(assert (=> d!61547 (=> (not res!144680) (not e!121792))))

(declare-fun lt!269706 () BitStream!7390)

(declare-fun lt!269707 () (_ BitVec 64))

(assert (=> d!61547 (= res!144680 (= (bvadd lt!269707 (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))) (bitIndex!0 (size!4141 (buf!4572 lt!269706)) (currentByte!8686 lt!269706) (currentBit!8681 lt!269706))))))

(assert (=> d!61547 (or (not (= (bvand lt!269707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269707 (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61547 (= lt!269707 (bitIndex!0 (size!4141 (buf!4572 (_2!8164 lt!269504))) (currentByte!8686 (_2!8164 lt!269504)) (currentBit!8681 (_2!8164 lt!269504))))))

(assert (=> d!61547 (= lt!269706 (_2!8162 (moveBitIndex!0 (_2!8164 lt!269504) (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517)))))))))

(assert (=> d!61547 (moveBitIndexPrecond!0 (_2!8164 lt!269504) (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517)))))))

(assert (=> d!61547 (= (withMovedBitIndex!0 (_2!8164 lt!269504) (bvsub (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))) lt!269706)))

(declare-fun b!174703 () Bool)

(assert (=> b!174703 (= e!121792 (= (size!4141 (buf!4572 (_2!8164 lt!269504))) (size!4141 (buf!4572 lt!269706))))))

(assert (= (and d!61547 res!144680) b!174703))

(declare-fun m!274381 () Bool)

(assert (=> d!61547 m!274381))

(declare-fun m!274383 () Bool)

(assert (=> d!61547 m!274383))

(declare-fun m!274385 () Bool)

(assert (=> d!61547 m!274385))

(declare-fun m!274387 () Bool)

(assert (=> d!61547 m!274387))

(assert (=> b!174610 d!61547))

(declare-fun d!61549 () Bool)

(declare-fun e!121793 () Bool)

(assert (=> d!61549 e!121793))

(declare-fun res!144681 () Bool)

(assert (=> d!61549 (=> (not res!144681) (not e!121793))))

(declare-fun lt!269710 () (_ BitVec 64))

(declare-fun lt!269713 () (_ BitVec 64))

(declare-fun lt!269708 () (_ BitVec 64))

(assert (=> d!61549 (= res!144681 (= lt!269708 (bvsub lt!269710 lt!269713)))))

(assert (=> d!61549 (or (= (bvand lt!269710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269713 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269710 lt!269713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61549 (= lt!269713 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269488)))) ((_ sign_extend 32) (currentByte!8686 (_1!8176 lt!269488))) ((_ sign_extend 32) (currentBit!8681 (_1!8176 lt!269488)))))))

(declare-fun lt!269712 () (_ BitVec 64))

(declare-fun lt!269711 () (_ BitVec 64))

(assert (=> d!61549 (= lt!269710 (bvmul lt!269712 lt!269711))))

(assert (=> d!61549 (or (= lt!269712 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269711 (bvsdiv (bvmul lt!269712 lt!269711) lt!269712)))))

(assert (=> d!61549 (= lt!269711 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61549 (= lt!269712 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269488)))))))

(assert (=> d!61549 (= lt!269708 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_1!8176 lt!269488))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_1!8176 lt!269488)))))))

(assert (=> d!61549 (invariant!0 (currentBit!8681 (_1!8176 lt!269488)) (currentByte!8686 (_1!8176 lt!269488)) (size!4141 (buf!4572 (_1!8176 lt!269488))))))

(assert (=> d!61549 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269488))) (currentByte!8686 (_1!8176 lt!269488)) (currentBit!8681 (_1!8176 lt!269488))) lt!269708)))

(declare-fun b!174704 () Bool)

(declare-fun res!144682 () Bool)

(assert (=> b!174704 (=> (not res!144682) (not e!121793))))

(assert (=> b!174704 (= res!144682 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269708))))

(declare-fun b!174705 () Bool)

(declare-fun lt!269709 () (_ BitVec 64))

(assert (=> b!174705 (= e!121793 (bvsle lt!269708 (bvmul lt!269709 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174705 (or (= lt!269709 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269709 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269709)))))

(assert (=> b!174705 (= lt!269709 ((_ sign_extend 32) (size!4141 (buf!4572 (_1!8176 lt!269488)))))))

(assert (= (and d!61549 res!144681) b!174704))

(assert (= (and b!174704 res!144682) b!174705))

(declare-fun m!274389 () Bool)

(assert (=> d!61549 m!274389))

(declare-fun m!274391 () Bool)

(assert (=> d!61549 m!274391))

(assert (=> b!174610 d!61549))

(declare-fun lt!269723 () tuple2!15044)

(declare-fun lt!269733 () (_ BitVec 64))

(declare-fun b!174706 () Bool)

(declare-fun e!121794 () Bool)

(declare-fun lt!269726 () (_ BitVec 64))

(assert (=> b!174706 (= e!121794 (= (_1!8164 lt!269723) (withMovedBitIndex!0 (_2!8164 lt!269723) (bvsub lt!269726 lt!269733))))))

(assert (=> b!174706 (or (= (bvand lt!269726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269733 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269726 lt!269733) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174706 (= lt!269733 (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))))))

(assert (=> b!174706 (= lt!269726 (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))))))

(declare-fun b!174707 () Bool)

(declare-fun e!121795 () Unit!12536)

(declare-fun Unit!12590 () Unit!12536)

(assert (=> b!174707 (= e!121795 Unit!12590)))

(declare-fun b!174709 () Bool)

(declare-fun res!144683 () Bool)

(assert (=> b!174709 (=> (not res!144683) (not e!121794))))

(assert (=> b!174709 (= res!144683 (isPrefixOf!0 (_1!8164 lt!269723) (_2!8162 lt!269477)))))

(declare-fun b!174710 () Bool)

(declare-fun lt!269725 () Unit!12536)

(assert (=> b!174710 (= e!121795 lt!269725)))

(declare-fun lt!269721 () (_ BitVec 64))

(assert (=> b!174710 (= lt!269721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!269716 () (_ BitVec 64))

(assert (=> b!174710 (= lt!269716 (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))))))

(assert (=> b!174710 (= lt!269725 (arrayBitRangesEqSymmetric!0 (buf!4572 (_2!8162 lt!269477)) (buf!4572 (_2!8162 lt!269517)) lt!269721 lt!269716))))

(assert (=> b!174710 (arrayBitRangesEq!0 (buf!4572 (_2!8162 lt!269517)) (buf!4572 (_2!8162 lt!269477)) lt!269721 lt!269716)))

(declare-fun d!61551 () Bool)

(assert (=> d!61551 e!121794))

(declare-fun res!144685 () Bool)

(assert (=> d!61551 (=> (not res!144685) (not e!121794))))

(assert (=> d!61551 (= res!144685 (isPrefixOf!0 (_1!8164 lt!269723) (_2!8164 lt!269723)))))

(declare-fun lt!269717 () BitStream!7390)

(assert (=> d!61551 (= lt!269723 (tuple2!15045 lt!269717 (_2!8162 lt!269517)))))

(declare-fun lt!269727 () Unit!12536)

(declare-fun lt!269720 () Unit!12536)

(assert (=> d!61551 (= lt!269727 lt!269720)))

(assert (=> d!61551 (isPrefixOf!0 lt!269717 (_2!8162 lt!269517))))

(assert (=> d!61551 (= lt!269720 (lemmaIsPrefixTransitive!0 lt!269717 (_2!8162 lt!269517) (_2!8162 lt!269517)))))

(declare-fun lt!269718 () Unit!12536)

(declare-fun lt!269719 () Unit!12536)

(assert (=> d!61551 (= lt!269718 lt!269719)))

(assert (=> d!61551 (isPrefixOf!0 lt!269717 (_2!8162 lt!269517))))

(assert (=> d!61551 (= lt!269719 (lemmaIsPrefixTransitive!0 lt!269717 (_2!8162 lt!269477) (_2!8162 lt!269517)))))

(declare-fun lt!269728 () Unit!12536)

(assert (=> d!61551 (= lt!269728 e!121795)))

(declare-fun c!9202 () Bool)

(assert (=> d!61551 (= c!9202 (not (= (size!4141 (buf!4572 (_2!8162 lt!269477))) #b00000000000000000000000000000000)))))

(declare-fun lt!269722 () Unit!12536)

(declare-fun lt!269732 () Unit!12536)

(assert (=> d!61551 (= lt!269722 lt!269732)))

(assert (=> d!61551 (isPrefixOf!0 (_2!8162 lt!269517) (_2!8162 lt!269517))))

(assert (=> d!61551 (= lt!269732 (lemmaIsPrefixRefl!0 (_2!8162 lt!269517)))))

(declare-fun lt!269714 () Unit!12536)

(declare-fun lt!269724 () Unit!12536)

(assert (=> d!61551 (= lt!269714 lt!269724)))

(assert (=> d!61551 (= lt!269724 (lemmaIsPrefixRefl!0 (_2!8162 lt!269517)))))

(declare-fun lt!269731 () Unit!12536)

(declare-fun lt!269730 () Unit!12536)

(assert (=> d!61551 (= lt!269731 lt!269730)))

(assert (=> d!61551 (isPrefixOf!0 lt!269717 lt!269717)))

(assert (=> d!61551 (= lt!269730 (lemmaIsPrefixRefl!0 lt!269717))))

(declare-fun lt!269715 () Unit!12536)

(declare-fun lt!269729 () Unit!12536)

(assert (=> d!61551 (= lt!269715 lt!269729)))

(assert (=> d!61551 (isPrefixOf!0 (_2!8162 lt!269477) (_2!8162 lt!269477))))

(assert (=> d!61551 (= lt!269729 (lemmaIsPrefixRefl!0 (_2!8162 lt!269477)))))

(assert (=> d!61551 (= lt!269717 (BitStream!7391 (buf!4572 (_2!8162 lt!269517)) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))))))

(assert (=> d!61551 (isPrefixOf!0 (_2!8162 lt!269477) (_2!8162 lt!269517))))

(assert (=> d!61551 (= (reader!0 (_2!8162 lt!269477) (_2!8162 lt!269517)) lt!269723)))

(declare-fun b!174708 () Bool)

(declare-fun res!144684 () Bool)

(assert (=> b!174708 (=> (not res!144684) (not e!121794))))

(assert (=> b!174708 (= res!144684 (isPrefixOf!0 (_2!8164 lt!269723) (_2!8162 lt!269517)))))

(assert (= (and d!61551 c!9202) b!174710))

(assert (= (and d!61551 (not c!9202)) b!174707))

(assert (= (and d!61551 res!144685) b!174709))

(assert (= (and b!174709 res!144683) b!174708))

(assert (= (and b!174708 res!144684) b!174706))

(declare-fun m!274393 () Bool)

(assert (=> b!174708 m!274393))

(declare-fun m!274395 () Bool)

(assert (=> d!61551 m!274395))

(declare-fun m!274397 () Bool)

(assert (=> d!61551 m!274397))

(assert (=> d!61551 m!274293))

(assert (=> d!61551 m!274251))

(declare-fun m!274399 () Bool)

(assert (=> d!61551 m!274399))

(declare-fun m!274401 () Bool)

(assert (=> d!61551 m!274401))

(declare-fun m!274403 () Bool)

(assert (=> d!61551 m!274403))

(assert (=> d!61551 m!274257))

(declare-fun m!274405 () Bool)

(assert (=> d!61551 m!274405))

(declare-fun m!274407 () Bool)

(assert (=> d!61551 m!274407))

(declare-fun m!274409 () Bool)

(assert (=> d!61551 m!274409))

(declare-fun m!274411 () Bool)

(assert (=> b!174709 m!274411))

(assert (=> b!174710 m!274135))

(declare-fun m!274413 () Bool)

(assert (=> b!174710 m!274413))

(declare-fun m!274415 () Bool)

(assert (=> b!174710 m!274415))

(declare-fun m!274417 () Bool)

(assert (=> b!174706 m!274417))

(assert (=> b!174706 m!274107))

(assert (=> b!174706 m!274135))

(assert (=> b!174610 d!61551))

(declare-fun d!61553 () Bool)

(declare-fun e!121796 () Bool)

(assert (=> d!61553 e!121796))

(declare-fun res!144686 () Bool)

(assert (=> d!61553 (=> (not res!144686) (not e!121796))))

(declare-fun lt!269735 () (_ BitVec 64))

(declare-fun lt!269734 () BitStream!7390)

(assert (=> d!61553 (= res!144686 (= (bvadd lt!269735 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4141 (buf!4572 lt!269734)) (currentByte!8686 lt!269734) (currentBit!8681 lt!269734))))))

(assert (=> d!61553 (or (not (= (bvand lt!269735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269735 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61553 (= lt!269735 (bitIndex!0 (size!4141 (buf!4572 (_1!8164 lt!269518))) (currentByte!8686 (_1!8164 lt!269518)) (currentBit!8681 (_1!8164 lt!269518))))))

(assert (=> d!61553 (= lt!269734 (_2!8162 (moveBitIndex!0 (_1!8164 lt!269518) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!61553 (moveBitIndexPrecond!0 (_1!8164 lt!269518) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!61553 (= (withMovedBitIndex!0 (_1!8164 lt!269518) #b0000000000000000000000000000000000000000000000000000000000000001) lt!269734)))

(declare-fun b!174711 () Bool)

(assert (=> b!174711 (= e!121796 (= (size!4141 (buf!4572 (_1!8164 lt!269518))) (size!4141 (buf!4572 lt!269734))))))

(assert (= (and d!61553 res!144686) b!174711))

(declare-fun m!274419 () Bool)

(assert (=> d!61553 m!274419))

(declare-fun m!274421 () Bool)

(assert (=> d!61553 m!274421))

(declare-fun m!274423 () Bool)

(assert (=> d!61553 m!274423))

(declare-fun m!274425 () Bool)

(assert (=> d!61553 m!274425))

(assert (=> b!174610 d!61553))

(declare-fun d!61555 () Bool)

(assert (=> d!61555 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477))) lt!269524)))

(declare-fun lt!269736 () Unit!12536)

(assert (=> d!61555 (= lt!269736 (choose!9 (_2!8162 lt!269477) (buf!4572 (_2!8162 lt!269517)) lt!269524 (BitStream!7391 (buf!4572 (_2!8162 lt!269517)) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477)))))))

(assert (=> d!61555 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8162 lt!269477) (buf!4572 (_2!8162 lt!269517)) lt!269524) lt!269736)))

(declare-fun bs!15337 () Bool)

(assert (= bs!15337 d!61555))

(assert (=> bs!15337 m!274145))

(declare-fun m!274427 () Bool)

(assert (=> bs!15337 m!274427))

(assert (=> b!174610 d!61555))

(declare-fun d!61557 () Bool)

(declare-fun e!121797 () Bool)

(assert (=> d!61557 e!121797))

(declare-fun res!144687 () Bool)

(assert (=> d!61557 (=> (not res!144687) (not e!121797))))

(declare-fun lt!269739 () (_ BitVec 64))

(declare-fun lt!269737 () (_ BitVec 64))

(declare-fun lt!269742 () (_ BitVec 64))

(assert (=> d!61557 (= res!144687 (= lt!269737 (bvsub lt!269739 lt!269742)))))

(assert (=> d!61557 (or (= (bvand lt!269739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269742 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269739 lt!269742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61557 (= lt!269742 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269477)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477)))))))

(declare-fun lt!269741 () (_ BitVec 64))

(declare-fun lt!269740 () (_ BitVec 64))

(assert (=> d!61557 (= lt!269739 (bvmul lt!269741 lt!269740))))

(assert (=> d!61557 (or (= lt!269741 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269740 (bvsdiv (bvmul lt!269741 lt!269740) lt!269741)))))

(assert (=> d!61557 (= lt!269740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61557 (= lt!269741 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269477)))))))

(assert (=> d!61557 (= lt!269737 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269477))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269477)))))))

(assert (=> d!61557 (invariant!0 (currentBit!8681 (_2!8162 lt!269477)) (currentByte!8686 (_2!8162 lt!269477)) (size!4141 (buf!4572 (_2!8162 lt!269477))))))

(assert (=> d!61557 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269477))) (currentByte!8686 (_2!8162 lt!269477)) (currentBit!8681 (_2!8162 lt!269477))) lt!269737)))

(declare-fun b!174712 () Bool)

(declare-fun res!144688 () Bool)

(assert (=> b!174712 (=> (not res!144688) (not e!121797))))

(assert (=> b!174712 (= res!144688 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269737))))

(declare-fun b!174713 () Bool)

(declare-fun lt!269738 () (_ BitVec 64))

(assert (=> b!174713 (= e!121797 (bvsle lt!269737 (bvmul lt!269738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174713 (or (= lt!269738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269738)))))

(assert (=> b!174713 (= lt!269738 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269477)))))))

(assert (= (and d!61557 res!144687) b!174712))

(assert (= (and b!174712 res!144688) b!174713))

(declare-fun m!274429 () Bool)

(assert (=> d!61557 m!274429))

(declare-fun m!274431 () Bool)

(assert (=> d!61557 m!274431))

(assert (=> b!174610 d!61557))

(declare-fun lt!269743 () tuple2!15066)

(declare-fun d!61559 () Bool)

(assert (=> d!61559 (= lt!269743 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8164 lt!269518) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269509 e!121731)))))

(assert (=> d!61559 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8164 lt!269518) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269509 e!121731)) (tuple2!15043 (_2!8175 lt!269743) (_1!8175 lt!269743)))))

(declare-fun bs!15338 () Bool)

(assert (= bs!15338 d!61559))

(assert (=> bs!15338 m!274139))

(declare-fun m!274433 () Bool)

(assert (=> bs!15338 m!274433))

(assert (=> b!174610 d!61559))

(assert (=> b!174610 d!61411))

(declare-fun d!61561 () Bool)

(assert (=> d!61561 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269489) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))) lt!269489))))

(declare-fun bs!15339 () Bool)

(assert (= bs!15339 d!61561))

(assert (=> bs!15339 m!274275))

(assert (=> b!174610 d!61561))

(declare-fun d!61563 () Bool)

(assert (=> d!61563 (= (invariant!0 (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187) (size!4141 (buf!4572 (_2!8162 lt!269477)))) (and (bvsge (currentBit!8681 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8681 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8686 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8686 thiss!1187) (size!4141 (buf!4572 (_2!8162 lt!269477)))) (and (= (currentBit!8681 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8686 thiss!1187) (size!4141 (buf!4572 (_2!8162 lt!269477))))))))))

(assert (=> b!174610 d!61563))

(declare-fun d!61565 () Bool)

(assert (=> d!61565 (= (invariant!0 (currentBit!8681 lt!269496) (currentByte!8686 lt!269496) (size!4141 (buf!4572 (_2!8162 lt!269517)))) (and (bvsge (currentBit!8681 lt!269496) #b00000000000000000000000000000000) (bvslt (currentBit!8681 lt!269496) #b00000000000000000000000000001000) (bvsge (currentByte!8686 lt!269496) #b00000000000000000000000000000000) (or (bvslt (currentByte!8686 lt!269496) (size!4141 (buf!4572 (_2!8162 lt!269517)))) (and (= (currentBit!8681 lt!269496) #b00000000000000000000000000000000) (= (currentByte!8686 lt!269496) (size!4141 (buf!4572 (_2!8162 lt!269517))))))))))

(assert (=> b!174610 d!61565))

(declare-fun d!61567 () Bool)

(declare-fun lt!269744 () tuple2!15066)

(assert (=> d!61567 (= lt!269744 (readNBitsLSBFirstsLoop!0 (_1!8164 lt!269518) nBits!340 #b00000000000000000000000000000000 lt!269509))))

(assert (=> d!61567 (= (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269518) nBits!340 #b00000000000000000000000000000000 lt!269509) (tuple2!15043 (_2!8175 lt!269744) (_1!8175 lt!269744)))))

(declare-fun bs!15340 () Bool)

(assert (= bs!15340 d!61567))

(declare-fun m!274435 () Bool)

(assert (=> bs!15340 m!274435))

(assert (=> b!174610 d!61567))

(declare-fun d!61569 () Bool)

(declare-fun e!121798 () Bool)

(assert (=> d!61569 e!121798))

(declare-fun res!144689 () Bool)

(assert (=> d!61569 (=> (not res!144689) (not e!121798))))

(declare-fun lt!269750 () (_ BitVec 64))

(declare-fun lt!269747 () (_ BitVec 64))

(declare-fun lt!269745 () (_ BitVec 64))

(assert (=> d!61569 (= res!144689 (= lt!269745 (bvsub lt!269747 lt!269750)))))

(assert (=> d!61569 (or (= (bvand lt!269747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269750 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269747 lt!269750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61569 (= lt!269750 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269517))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269517)))))))

(declare-fun lt!269749 () (_ BitVec 64))

(declare-fun lt!269748 () (_ BitVec 64))

(assert (=> d!61569 (= lt!269747 (bvmul lt!269749 lt!269748))))

(assert (=> d!61569 (or (= lt!269749 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269748 (bvsdiv (bvmul lt!269749 lt!269748) lt!269749)))))

(assert (=> d!61569 (= lt!269748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61569 (= lt!269749 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))))))

(assert (=> d!61569 (= lt!269745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269517))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269517)))))))

(assert (=> d!61569 (invariant!0 (currentBit!8681 (_2!8162 lt!269517)) (currentByte!8686 (_2!8162 lt!269517)) (size!4141 (buf!4572 (_2!8162 lt!269517))))))

(assert (=> d!61569 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517))) lt!269745)))

(declare-fun b!174714 () Bool)

(declare-fun res!144690 () Bool)

(assert (=> b!174714 (=> (not res!144690) (not e!121798))))

(assert (=> b!174714 (= res!144690 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269745))))

(declare-fun b!174715 () Bool)

(declare-fun lt!269746 () (_ BitVec 64))

(assert (=> b!174715 (= e!121798 (bvsle lt!269745 (bvmul lt!269746 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174715 (or (= lt!269746 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269746 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269746)))))

(assert (=> b!174715 (= lt!269746 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269517)))))))

(assert (= (and d!61569 res!144689) b!174714))

(assert (= (and b!174714 res!144690) b!174715))

(declare-fun m!274437 () Bool)

(assert (=> d!61569 m!274437))

(assert (=> d!61569 m!274111))

(assert (=> b!174610 d!61569))

(declare-fun d!61571 () Bool)

(declare-fun res!144692 () Bool)

(declare-fun e!121800 () Bool)

(assert (=> d!61571 (=> (not res!144692) (not e!121800))))

(assert (=> d!61571 (= res!144692 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!269517)))))))

(assert (=> d!61571 (= (isPrefixOf!0 thiss!1187 (_2!8162 lt!269517)) e!121800)))

(declare-fun b!174716 () Bool)

(declare-fun res!144693 () Bool)

(assert (=> b!174716 (=> (not res!144693) (not e!121800))))

(assert (=> b!174716 (= res!144693 (bvsle (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269517))) (currentByte!8686 (_2!8162 lt!269517)) (currentBit!8681 (_2!8162 lt!269517)))))))

(declare-fun b!174717 () Bool)

(declare-fun e!121799 () Bool)

(assert (=> b!174717 (= e!121800 e!121799)))

(declare-fun res!144691 () Bool)

(assert (=> b!174717 (=> res!144691 e!121799)))

(assert (=> b!174717 (= res!144691 (= (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174718 () Bool)

(assert (=> b!174718 (= e!121799 (arrayBitRangesEq!0 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!269517)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (= (and d!61571 res!144692) b!174716))

(assert (= (and b!174716 res!144693) b!174717))

(assert (= (and b!174717 (not res!144691)) b!174718))

(assert (=> b!174716 m!273693))

(assert (=> b!174716 m!274107))

(assert (=> b!174718 m!273693))

(assert (=> b!174718 m!273693))

(declare-fun m!274439 () Bool)

(assert (=> b!174718 m!274439))

(assert (=> b!174610 d!61571))

(declare-fun d!61573 () Bool)

(declare-fun lt!269751 () tuple2!15070)

(assert (=> d!61573 (= lt!269751 (readBit!0 lt!269527))))

(assert (=> d!61573 (= (readBitPure!0 lt!269527) (tuple2!15069 (_2!8177 lt!269751) (_1!8177 lt!269751)))))

(declare-fun bs!15341 () Bool)

(assert (= bs!15341 d!61573))

(declare-fun m!274441 () Bool)

(assert (=> bs!15341 m!274441))

(assert (=> b!174610 d!61573))

(declare-fun b!174731 () Bool)

(declare-fun e!121806 () Bool)

(declare-fun lt!269760 () tuple2!15068)

(declare-fun lt!269762 () tuple2!15040)

(assert (=> b!174731 (= e!121806 (= (bitIndex!0 (size!4141 (buf!4572 (_1!8176 lt!269760))) (currentByte!8686 (_1!8176 lt!269760)) (currentBit!8681 (_1!8176 lt!269760))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269762))) (currentByte!8686 (_2!8162 lt!269762)) (currentBit!8681 (_2!8162 lt!269762)))))))

(declare-fun b!174730 () Bool)

(declare-fun e!121805 () Bool)

(assert (=> b!174730 (= e!121805 e!121806)))

(declare-fun res!144702 () Bool)

(assert (=> b!174730 (=> (not res!144702) (not e!121806))))

(assert (=> b!174730 (= res!144702 (and (= (_2!8176 lt!269760) lt!269514) (= (_1!8176 lt!269760) (_2!8162 lt!269762))))))

(assert (=> b!174730 (= lt!269760 (readBitPure!0 (readerFrom!0 (_2!8162 lt!269762) (currentBit!8681 thiss!1187) (currentByte!8686 thiss!1187))))))

(declare-fun b!174729 () Bool)

(declare-fun res!144704 () Bool)

(assert (=> b!174729 (=> (not res!144704) (not e!121805))))

(assert (=> b!174729 (= res!144704 (isPrefixOf!0 thiss!1187 (_2!8162 lt!269762)))))

(declare-fun b!174728 () Bool)

(declare-fun res!144705 () Bool)

(assert (=> b!174728 (=> (not res!144705) (not e!121805))))

(declare-fun lt!269761 () (_ BitVec 64))

(declare-fun lt!269763 () (_ BitVec 64))

(assert (=> b!174728 (= res!144705 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269762))) (currentByte!8686 (_2!8162 lt!269762)) (currentBit!8681 (_2!8162 lt!269762))) (bvadd lt!269763 lt!269761)))))

(assert (=> b!174728 (or (not (= (bvand lt!269763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269761 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269763 lt!269761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174728 (= lt!269761 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!174728 (= lt!269763 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(declare-fun d!61575 () Bool)

(assert (=> d!61575 e!121805))

(declare-fun res!144703 () Bool)

(assert (=> d!61575 (=> (not res!144703) (not e!121805))))

(assert (=> d!61575 (= res!144703 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!269762)))))))

(declare-fun choose!16 (BitStream!7390 Bool) tuple2!15040)

(assert (=> d!61575 (= lt!269762 (choose!16 thiss!1187 lt!269514))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!61575 (validate_offset_bit!0 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)))))

(assert (=> d!61575 (= (appendBit!0 thiss!1187 lt!269514) lt!269762)))

(assert (= (and d!61575 res!144703) b!174728))

(assert (= (and b!174728 res!144705) b!174729))

(assert (= (and b!174729 res!144704) b!174730))

(assert (= (and b!174730 res!144702) b!174731))

(declare-fun m!274443 () Bool)

(assert (=> b!174729 m!274443))

(declare-fun m!274445 () Bool)

(assert (=> b!174730 m!274445))

(assert (=> b!174730 m!274445))

(declare-fun m!274447 () Bool)

(assert (=> b!174730 m!274447))

(declare-fun m!274449 () Bool)

(assert (=> d!61575 m!274449))

(declare-fun m!274451 () Bool)

(assert (=> d!61575 m!274451))

(declare-fun m!274453 () Bool)

(assert (=> b!174728 m!274453))

(assert (=> b!174728 m!273693))

(declare-fun m!274455 () Bool)

(assert (=> b!174731 m!274455))

(assert (=> b!174731 m!274453))

(assert (=> b!174610 d!61575))

(declare-fun lt!269764 () tuple2!15066)

(declare-fun d!61577 () Bool)

(assert (=> d!61577 (= lt!269764 (readNBitsLSBFirstsLoop!0 (_1!8164 lt!269504) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269509 (ite (_2!8176 lt!269510) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!61577 (= (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269504) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269509 (ite (_2!8176 lt!269510) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!15043 (_2!8175 lt!269764) (_1!8175 lt!269764)))))

(declare-fun bs!15342 () Bool)

(assert (= bs!15342 d!61577))

(declare-fun m!274457 () Bool)

(assert (=> bs!15342 m!274457))

(assert (=> b!174610 d!61577))

(declare-fun d!61579 () Bool)

(assert (=> d!61579 (= (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))) (bvsub (bvmul ((_ sign_extend 32) (size!4141 (buf!4572 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 thiss!1187)))))))

(assert (=> d!61411 d!61579))

(assert (=> d!61411 d!61447))

(declare-fun b!174732 () Bool)

(declare-fun e!121808 () Bool)

(declare-fun e!121807 () Bool)

(assert (=> b!174732 (= e!121808 e!121807)))

(declare-fun res!144709 () Bool)

(assert (=> b!174732 (=> (not res!144709) (not e!121807))))

(declare-fun e!121811 () Bool)

(assert (=> b!174732 (= res!144709 e!121811)))

(declare-fun res!144710 () Bool)

(assert (=> b!174732 (=> res!144710 e!121811)))

(declare-fun lt!269767 () tuple4!252)

(assert (=> b!174732 (= res!144710 (bvsge (_1!8178 lt!269767) (_2!8178 lt!269767)))))

(declare-fun lt!269765 () (_ BitVec 32))

(assert (=> b!174732 (= lt!269765 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!269766 () (_ BitVec 32))

(assert (=> b!174732 (= lt!269766 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174732 (= lt!269767 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(declare-fun b!174733 () Bool)

(declare-fun e!121810 () Bool)

(declare-fun e!121812 () Bool)

(assert (=> b!174733 (= e!121810 e!121812)))

(declare-fun res!144708 () Bool)

(declare-fun call!2899 () Bool)

(assert (=> b!174733 (= res!144708 call!2899)))

(assert (=> b!174733 (=> (not res!144708) (not e!121812))))

(declare-fun b!174734 () Bool)

(assert (=> b!174734 (= e!121810 call!2899)))

(declare-fun bm!2896 () Bool)

(declare-fun c!9203 () Bool)

(assert (=> bm!2896 (= call!2899 (byteRangesEq!0 (select (arr!5071 (buf!4572 thiss!1187)) (_3!642 lt!269767)) (select (arr!5071 (buf!4572 (_2!8162 lt!268731))) (_3!642 lt!269767)) lt!269766 (ite c!9203 lt!269765 #b00000000000000000000000000001000)))))

(declare-fun b!174735 () Bool)

(assert (=> b!174735 (= e!121807 e!121810)))

(assert (=> b!174735 (= c!9203 (= (_3!642 lt!269767) (_4!126 lt!269767)))))

(declare-fun b!174736 () Bool)

(assert (=> b!174736 (= e!121811 (arrayRangesEq!688 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!268731)) (_1!8178 lt!269767) (_2!8178 lt!269767)))))

(declare-fun d!61581 () Bool)

(declare-fun res!144707 () Bool)

(assert (=> d!61581 (=> res!144707 e!121808)))

(assert (=> d!61581 (= res!144707 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (=> d!61581 (= (arrayBitRangesEq!0 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!268731)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))) e!121808)))

(declare-fun b!174737 () Bool)

(declare-fun res!144706 () Bool)

(assert (=> b!174737 (= res!144706 (= lt!269765 #b00000000000000000000000000000000))))

(declare-fun e!121809 () Bool)

(assert (=> b!174737 (=> res!144706 e!121809)))

(assert (=> b!174737 (= e!121812 e!121809)))

(declare-fun b!174738 () Bool)

(assert (=> b!174738 (= e!121809 (byteRangesEq!0 (select (arr!5071 (buf!4572 thiss!1187)) (_4!126 lt!269767)) (select (arr!5071 (buf!4572 (_2!8162 lt!268731))) (_4!126 lt!269767)) #b00000000000000000000000000000000 lt!269765))))

(assert (= (and d!61581 (not res!144707)) b!174732))

(assert (= (and b!174732 (not res!144710)) b!174736))

(assert (= (and b!174732 res!144709) b!174735))

(assert (= (and b!174735 c!9203) b!174734))

(assert (= (and b!174735 (not c!9203)) b!174733))

(assert (= (and b!174733 res!144708) b!174737))

(assert (= (and b!174737 (not res!144706)) b!174738))

(assert (= (or b!174734 b!174733) bm!2896))

(assert (=> b!174732 m!273693))

(declare-fun m!274459 () Bool)

(assert (=> b!174732 m!274459))

(declare-fun m!274461 () Bool)

(assert (=> bm!2896 m!274461))

(declare-fun m!274463 () Bool)

(assert (=> bm!2896 m!274463))

(assert (=> bm!2896 m!274461))

(assert (=> bm!2896 m!274463))

(declare-fun m!274465 () Bool)

(assert (=> bm!2896 m!274465))

(declare-fun m!274467 () Bool)

(assert (=> b!174736 m!274467))

(declare-fun m!274469 () Bool)

(assert (=> b!174738 m!274469))

(declare-fun m!274471 () Bool)

(assert (=> b!174738 m!274471))

(assert (=> b!174738 m!274469))

(assert (=> b!174738 m!274471))

(declare-fun m!274473 () Bool)

(assert (=> b!174738 m!274473))

(assert (=> b!174416 d!61581))

(assert (=> b!174416 d!61411))

(declare-fun d!61583 () Bool)

(declare-fun e!121813 () Bool)

(assert (=> d!61583 e!121813))

(declare-fun res!144711 () Bool)

(assert (=> d!61583 (=> (not res!144711) (not e!121813))))

(declare-fun lt!269769 () (_ BitVec 64))

(declare-fun lt!269768 () BitStream!7390)

(assert (=> d!61583 (= res!144711 (= (bvadd lt!269769 (bvsub lt!268993 lt!269000)) (bitIndex!0 (size!4141 (buf!4572 lt!269768)) (currentByte!8686 lt!269768) (currentBit!8681 lt!269768))))))

(assert (=> d!61583 (or (not (= (bvand lt!269769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268993 lt!269000) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269769 (bvsub lt!268993 lt!269000)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61583 (= lt!269769 (bitIndex!0 (size!4141 (buf!4572 (_2!8164 lt!268990))) (currentByte!8686 (_2!8164 lt!268990)) (currentBit!8681 (_2!8164 lt!268990))))))

(assert (=> d!61583 (= lt!269768 (_2!8162 (moveBitIndex!0 (_2!8164 lt!268990) (bvsub lt!268993 lt!269000))))))

(assert (=> d!61583 (moveBitIndexPrecond!0 (_2!8164 lt!268990) (bvsub lt!268993 lt!269000))))

(assert (=> d!61583 (= (withMovedBitIndex!0 (_2!8164 lt!268990) (bvsub lt!268993 lt!269000)) lt!269768)))

(declare-fun b!174739 () Bool)

(assert (=> b!174739 (= e!121813 (= (size!4141 (buf!4572 (_2!8164 lt!268990))) (size!4141 (buf!4572 lt!269768))))))

(assert (= (and d!61583 res!144711) b!174739))

(declare-fun m!274475 () Bool)

(assert (=> d!61583 m!274475))

(assert (=> d!61583 m!274173))

(declare-fun m!274477 () Bool)

(assert (=> d!61583 m!274477))

(declare-fun m!274479 () Bool)

(assert (=> d!61583 m!274479))

(assert (=> b!174450 d!61583))

(assert (=> b!174450 d!61403))

(assert (=> b!174450 d!61411))

(declare-fun d!61585 () Bool)

(declare-fun e!121814 () Bool)

(assert (=> d!61585 e!121814))

(declare-fun res!144712 () Bool)

(assert (=> d!61585 (=> (not res!144712) (not e!121814))))

(declare-fun lt!269770 () (_ BitVec 64))

(declare-fun lt!269775 () (_ BitVec 64))

(declare-fun lt!269772 () (_ BitVec 64))

(assert (=> d!61585 (= res!144712 (= lt!269770 (bvsub lt!269772 lt!269775)))))

(assert (=> d!61585 (or (= (bvand lt!269772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269775 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269772 lt!269775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61585 (= lt!269775 (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269486)))) ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269486))) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269486)))))))

(declare-fun lt!269774 () (_ BitVec 64))

(declare-fun lt!269773 () (_ BitVec 64))

(assert (=> d!61585 (= lt!269772 (bvmul lt!269774 lt!269773))))

(assert (=> d!61585 (or (= lt!269774 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269773 (bvsdiv (bvmul lt!269774 lt!269773) lt!269774)))))

(assert (=> d!61585 (= lt!269773 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61585 (= lt!269774 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269486)))))))

(assert (=> d!61585 (= lt!269770 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 (_2!8162 lt!269486))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 (_2!8162 lt!269486)))))))

(assert (=> d!61585 (invariant!0 (currentBit!8681 (_2!8162 lt!269486)) (currentByte!8686 (_2!8162 lt!269486)) (size!4141 (buf!4572 (_2!8162 lt!269486))))))

(assert (=> d!61585 (= (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269486))) (currentByte!8686 (_2!8162 lt!269486)) (currentBit!8681 (_2!8162 lt!269486))) lt!269770)))

(declare-fun b!174740 () Bool)

(declare-fun res!144713 () Bool)

(assert (=> b!174740 (=> (not res!144713) (not e!121814))))

(assert (=> b!174740 (= res!144713 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269770))))

(declare-fun b!174741 () Bool)

(declare-fun lt!269771 () (_ BitVec 64))

(assert (=> b!174741 (= e!121814 (bvsle lt!269770 (bvmul lt!269771 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174741 (or (= lt!269771 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269771 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269771)))))

(assert (=> b!174741 (= lt!269771 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269486)))))))

(assert (= (and d!61585 res!144712) b!174740))

(assert (= (and b!174740 res!144713) b!174741))

(declare-fun m!274481 () Bool)

(assert (=> d!61585 m!274481))

(assert (=> d!61585 m!274091))

(assert (=> b!174613 d!61585))

(assert (=> b!174613 d!61411))

(declare-fun d!61587 () Bool)

(declare-fun res!144715 () Bool)

(declare-fun e!121816 () Bool)

(assert (=> d!61587 (=> (not res!144715) (not e!121816))))

(assert (=> d!61587 (= res!144715 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (ite c!9195 thiss!1187 (_2!8162 lt!269481))))))))

(assert (=> d!61587 (= (isPrefixOf!0 thiss!1187 (ite c!9195 thiss!1187 (_2!8162 lt!269481))) e!121816)))

(declare-fun b!174742 () Bool)

(declare-fun res!144716 () Bool)

(assert (=> b!174742 (=> (not res!144716) (not e!121816))))

(assert (=> b!174742 (= res!144716 (bvsle (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (ite c!9195 thiss!1187 (_2!8162 lt!269481)))) (currentByte!8686 (ite c!9195 thiss!1187 (_2!8162 lt!269481))) (currentBit!8681 (ite c!9195 thiss!1187 (_2!8162 lt!269481))))))))

(declare-fun b!174743 () Bool)

(declare-fun e!121815 () Bool)

(assert (=> b!174743 (= e!121816 e!121815)))

(declare-fun res!144714 () Bool)

(assert (=> b!174743 (=> res!144714 e!121815)))

(assert (=> b!174743 (= res!144714 (= (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174744 () Bool)

(assert (=> b!174744 (= e!121815 (arrayBitRangesEq!0 (buf!4572 thiss!1187) (buf!4572 (ite c!9195 thiss!1187 (_2!8162 lt!269481))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (= (and d!61587 res!144715) b!174742))

(assert (= (and b!174742 res!144716) b!174743))

(assert (= (and b!174743 (not res!144714)) b!174744))

(assert (=> b!174742 m!273693))

(declare-fun m!274483 () Bool)

(assert (=> b!174742 m!274483))

(assert (=> b!174744 m!273693))

(assert (=> b!174744 m!273693))

(declare-fun m!274485 () Bool)

(assert (=> b!174744 m!274485))

(assert (=> bm!2891 d!61587))

(declare-fun d!61589 () Bool)

(declare-fun res!144718 () Bool)

(declare-fun e!121818 () Bool)

(assert (=> d!61589 (=> (not res!144718) (not e!121818))))

(assert (=> d!61589 (= res!144718 (= (size!4141 (buf!4572 (_2!8164 lt!268990))) (size!4141 (buf!4572 (_2!8162 lt!268731)))))))

(assert (=> d!61589 (= (isPrefixOf!0 (_2!8164 lt!268990) (_2!8162 lt!268731)) e!121818)))

(declare-fun b!174745 () Bool)

(declare-fun res!144719 () Bool)

(assert (=> b!174745 (=> (not res!144719) (not e!121818))))

(assert (=> b!174745 (= res!144719 (bvsle (bitIndex!0 (size!4141 (buf!4572 (_2!8164 lt!268990))) (currentByte!8686 (_2!8164 lt!268990)) (currentBit!8681 (_2!8164 lt!268990))) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!268731))) (currentByte!8686 (_2!8162 lt!268731)) (currentBit!8681 (_2!8162 lt!268731)))))))

(declare-fun b!174746 () Bool)

(declare-fun e!121817 () Bool)

(assert (=> b!174746 (= e!121818 e!121817)))

(declare-fun res!144717 () Bool)

(assert (=> b!174746 (=> res!144717 e!121817)))

(assert (=> b!174746 (= res!144717 (= (size!4141 (buf!4572 (_2!8164 lt!268990))) #b00000000000000000000000000000000))))

(declare-fun b!174747 () Bool)

(assert (=> b!174747 (= e!121817 (arrayBitRangesEq!0 (buf!4572 (_2!8164 lt!268990)) (buf!4572 (_2!8162 lt!268731)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 (_2!8164 lt!268990))) (currentByte!8686 (_2!8164 lt!268990)) (currentBit!8681 (_2!8164 lt!268990)))))))

(assert (= (and d!61589 res!144718) b!174745))

(assert (= (and b!174745 res!144719) b!174746))

(assert (= (and b!174746 (not res!144717)) b!174747))

(assert (=> b!174745 m!274173))

(assert (=> b!174745 m!273691))

(assert (=> b!174747 m!274173))

(assert (=> b!174747 m!274173))

(declare-fun m!274487 () Bool)

(assert (=> b!174747 m!274487))

(assert (=> b!174452 d!61589))

(declare-fun lt!269795 () (_ BitVec 64))

(declare-fun e!121819 () Bool)

(declare-fun lt!269785 () tuple2!15044)

(declare-fun b!174748 () Bool)

(declare-fun lt!269788 () (_ BitVec 64))

(assert (=> b!174748 (= e!121819 (= (_1!8164 lt!269785) (withMovedBitIndex!0 (_2!8164 lt!269785) (bvsub lt!269788 lt!269795))))))

(assert (=> b!174748 (or (= (bvand lt!269788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269795 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269788 lt!269795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174748 (= lt!269795 (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269486))) (currentByte!8686 (_2!8162 lt!269486)) (currentBit!8681 (_2!8162 lt!269486))))))

(assert (=> b!174748 (= lt!269788 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(declare-fun b!174749 () Bool)

(declare-fun e!121820 () Unit!12536)

(declare-fun Unit!12591 () Unit!12536)

(assert (=> b!174749 (= e!121820 Unit!12591)))

(declare-fun b!174751 () Bool)

(declare-fun res!144720 () Bool)

(assert (=> b!174751 (=> (not res!144720) (not e!121819))))

(assert (=> b!174751 (= res!144720 (isPrefixOf!0 (_1!8164 lt!269785) thiss!1187))))

(declare-fun b!174752 () Bool)

(declare-fun lt!269787 () Unit!12536)

(assert (=> b!174752 (= e!121820 lt!269787)))

(declare-fun lt!269783 () (_ BitVec 64))

(assert (=> b!174752 (= lt!269783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!269778 () (_ BitVec 64))

(assert (=> b!174752 (= lt!269778 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(assert (=> b!174752 (= lt!269787 (arrayBitRangesEqSymmetric!0 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!269486)) lt!269783 lt!269778))))

(assert (=> b!174752 (arrayBitRangesEq!0 (buf!4572 (_2!8162 lt!269486)) (buf!4572 thiss!1187) lt!269783 lt!269778)))

(declare-fun d!61591 () Bool)

(assert (=> d!61591 e!121819))

(declare-fun res!144722 () Bool)

(assert (=> d!61591 (=> (not res!144722) (not e!121819))))

(assert (=> d!61591 (= res!144722 (isPrefixOf!0 (_1!8164 lt!269785) (_2!8164 lt!269785)))))

(declare-fun lt!269779 () BitStream!7390)

(assert (=> d!61591 (= lt!269785 (tuple2!15045 lt!269779 (_2!8162 lt!269486)))))

(declare-fun lt!269789 () Unit!12536)

(declare-fun lt!269782 () Unit!12536)

(assert (=> d!61591 (= lt!269789 lt!269782)))

(assert (=> d!61591 (isPrefixOf!0 lt!269779 (_2!8162 lt!269486))))

(assert (=> d!61591 (= lt!269782 (lemmaIsPrefixTransitive!0 lt!269779 (_2!8162 lt!269486) (_2!8162 lt!269486)))))

(declare-fun lt!269780 () Unit!12536)

(declare-fun lt!269781 () Unit!12536)

(assert (=> d!61591 (= lt!269780 lt!269781)))

(assert (=> d!61591 (isPrefixOf!0 lt!269779 (_2!8162 lt!269486))))

(assert (=> d!61591 (= lt!269781 (lemmaIsPrefixTransitive!0 lt!269779 thiss!1187 (_2!8162 lt!269486)))))

(declare-fun lt!269790 () Unit!12536)

(assert (=> d!61591 (= lt!269790 e!121820)))

(declare-fun c!9204 () Bool)

(assert (=> d!61591 (= c!9204 (not (= (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!269784 () Unit!12536)

(declare-fun lt!269794 () Unit!12536)

(assert (=> d!61591 (= lt!269784 lt!269794)))

(assert (=> d!61591 (isPrefixOf!0 (_2!8162 lt!269486) (_2!8162 lt!269486))))

(assert (=> d!61591 (= lt!269794 (lemmaIsPrefixRefl!0 (_2!8162 lt!269486)))))

(declare-fun lt!269776 () Unit!12536)

(declare-fun lt!269786 () Unit!12536)

(assert (=> d!61591 (= lt!269776 lt!269786)))

(assert (=> d!61591 (= lt!269786 (lemmaIsPrefixRefl!0 (_2!8162 lt!269486)))))

(declare-fun lt!269793 () Unit!12536)

(declare-fun lt!269792 () Unit!12536)

(assert (=> d!61591 (= lt!269793 lt!269792)))

(assert (=> d!61591 (isPrefixOf!0 lt!269779 lt!269779)))

(assert (=> d!61591 (= lt!269792 (lemmaIsPrefixRefl!0 lt!269779))))

(declare-fun lt!269777 () Unit!12536)

(declare-fun lt!269791 () Unit!12536)

(assert (=> d!61591 (= lt!269777 lt!269791)))

(assert (=> d!61591 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61591 (= lt!269791 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61591 (= lt!269779 (BitStream!7391 (buf!4572 (_2!8162 lt!269486)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)))))

(assert (=> d!61591 (isPrefixOf!0 thiss!1187 (_2!8162 lt!269486))))

(assert (=> d!61591 (= (reader!0 thiss!1187 (_2!8162 lt!269486)) lt!269785)))

(declare-fun b!174750 () Bool)

(declare-fun res!144721 () Bool)

(assert (=> b!174750 (=> (not res!144721) (not e!121819))))

(assert (=> b!174750 (= res!144721 (isPrefixOf!0 (_2!8164 lt!269785) (_2!8162 lt!269486)))))

(assert (= (and d!61591 c!9204) b!174752))

(assert (= (and d!61591 (not c!9204)) b!174749))

(assert (= (and d!61591 res!144722) b!174751))

(assert (= (and b!174751 res!144720) b!174750))

(assert (= (and b!174750 res!144721) b!174748))

(declare-fun m!274489 () Bool)

(assert (=> b!174750 m!274489))

(declare-fun m!274491 () Bool)

(assert (=> d!61591 m!274491))

(assert (=> d!61591 m!274067))

(assert (=> d!61591 m!273845))

(declare-fun m!274493 () Bool)

(assert (=> d!61591 m!274493))

(declare-fun m!274495 () Bool)

(assert (=> d!61591 m!274495))

(declare-fun m!274497 () Bool)

(assert (=> d!61591 m!274497))

(assert (=> d!61591 m!273853))

(declare-fun m!274499 () Bool)

(assert (=> d!61591 m!274499))

(declare-fun m!274501 () Bool)

(assert (=> d!61591 m!274501))

(declare-fun m!274503 () Bool)

(assert (=> d!61591 m!274503))

(declare-fun m!274505 () Bool)

(assert (=> d!61591 m!274505))

(declare-fun m!274507 () Bool)

(assert (=> b!174751 m!274507))

(assert (=> b!174752 m!273693))

(declare-fun m!274509 () Bool)

(assert (=> b!174752 m!274509))

(declare-fun m!274511 () Bool)

(assert (=> b!174752 m!274511))

(declare-fun m!274513 () Bool)

(assert (=> b!174748 m!274513))

(assert (=> b!174748 m!274077))

(assert (=> b!174748 m!273693))

(assert (=> b!174612 d!61591))

(declare-fun d!61593 () Bool)

(assert (=> d!61593 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269486)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269511) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269486)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))) lt!269511))))

(declare-fun bs!15343 () Bool)

(assert (= bs!15343 d!61593))

(declare-fun m!274515 () Bool)

(assert (=> bs!15343 m!274515))

(assert (=> b!174612 d!61593))

(assert (=> b!174612 d!61443))

(declare-fun d!61595 () Bool)

(declare-fun lt!269796 () tuple2!15066)

(assert (=> d!61595 (= lt!269796 (readNBitsLSBFirstsLoop!0 (_1!8164 lt!269519) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(assert (=> d!61595 (= (readNBitsLSBFirstsLoopPure!0 (_1!8164 lt!269519) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))) (tuple2!15043 (_2!8175 lt!269796) (_1!8175 lt!269796)))))

(declare-fun bs!15344 () Bool)

(assert (= bs!15344 d!61595))

(declare-fun m!274517 () Bool)

(assert (=> bs!15344 m!274517))

(assert (=> b!174612 d!61595))

(declare-fun d!61597 () Bool)

(assert (=> d!61597 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!269486)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) lt!269511)))

(declare-fun lt!269797 () Unit!12536)

(assert (=> d!61597 (= lt!269797 (choose!9 thiss!1187 (buf!4572 (_2!8162 lt!269486)) lt!269511 (BitStream!7391 (buf!4572 (_2!8162 lt!269486)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (=> d!61597 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4572 (_2!8162 lt!269486)) lt!269511) lt!269797)))

(declare-fun bs!15345 () Bool)

(assert (= bs!15345 d!61597))

(assert (=> bs!15345 m!274083))

(declare-fun m!274519 () Bool)

(assert (=> bs!15345 m!274519))

(assert (=> b!174612 d!61597))

(assert (=> b!174612 d!61543))

(assert (=> d!61417 d!61441))

(declare-fun d!61599 () Bool)

(assert (=> d!61599 (validate_offset_bits!1 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(assert (=> d!61599 true))

(declare-fun _$6!354 () Unit!12536)

(assert (=> d!61599 (= (choose!9 thiss!1187 (buf!4572 (_2!8162 lt!268731)) ((_ sign_extend 32) nBits!340) (BitStream!7391 (buf!4572 (_2!8162 lt!268731)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))) _$6!354)))

(declare-fun bs!15346 () Bool)

(assert (= bs!15346 d!61599))

(assert (=> bs!15346 m!273675))

(assert (=> d!61417 d!61599))

(declare-fun d!61601 () Bool)

(assert (=> d!61601 (= (invariant!0 (currentBit!8681 (_2!8162 lt!269486)) (currentByte!8686 (_2!8162 lt!269486)) (size!4141 (buf!4572 (_2!8162 lt!269486)))) (and (bvsge (currentBit!8681 (_2!8162 lt!269486)) #b00000000000000000000000000000000) (bvslt (currentBit!8681 (_2!8162 lt!269486)) #b00000000000000000000000000001000) (bvsge (currentByte!8686 (_2!8162 lt!269486)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8686 (_2!8162 lt!269486)) (size!4141 (buf!4572 (_2!8162 lt!269486)))) (and (= (currentBit!8681 (_2!8162 lt!269486)) #b00000000000000000000000000000000) (= (currentByte!8686 (_2!8162 lt!269486)) (size!4141 (buf!4572 (_2!8162 lt!269486))))))))))

(assert (=> d!61453 d!61601))

(assert (=> d!61451 d!61579))

(declare-fun d!61603 () Bool)

(assert (=> d!61603 (= (remainingBits!0 ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) ((_ sign_extend 32) (currentByte!8686 thiss!1187)) ((_ sign_extend 32) (currentBit!8681 thiss!1187))) (bvsub (bvmul ((_ sign_extend 32) (size!4141 (buf!4572 (_2!8162 lt!268731)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8686 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8681 thiss!1187)))))))

(assert (=> d!61441 d!61603))

(declare-fun d!61605 () Bool)

(declare-fun res!144724 () Bool)

(declare-fun e!121822 () Bool)

(assert (=> d!61605 (=> (not res!144724) (not e!121822))))

(assert (=> d!61605 (= res!144724 (= (size!4141 (buf!4572 thiss!1187)) (size!4141 (buf!4572 (_2!8162 lt!269486)))))))

(assert (=> d!61605 (= (isPrefixOf!0 thiss!1187 (_2!8162 lt!269486)) e!121822)))

(declare-fun b!174753 () Bool)

(declare-fun res!144725 () Bool)

(assert (=> b!174753 (=> (not res!144725) (not e!121822))))

(assert (=> b!174753 (= res!144725 (bvsle (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187)) (bitIndex!0 (size!4141 (buf!4572 (_2!8162 lt!269486))) (currentByte!8686 (_2!8162 lt!269486)) (currentBit!8681 (_2!8162 lt!269486)))))))

(declare-fun b!174754 () Bool)

(declare-fun e!121821 () Bool)

(assert (=> b!174754 (= e!121822 e!121821)))

(declare-fun res!144723 () Bool)

(assert (=> b!174754 (=> res!144723 e!121821)))

(assert (=> b!174754 (= res!144723 (= (size!4141 (buf!4572 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174755 () Bool)

(assert (=> b!174755 (= e!121821 (arrayBitRangesEq!0 (buf!4572 thiss!1187) (buf!4572 (_2!8162 lt!269486)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4141 (buf!4572 thiss!1187)) (currentByte!8686 thiss!1187) (currentBit!8681 thiss!1187))))))

(assert (= (and d!61605 res!144724) b!174753))

(assert (= (and b!174753 res!144725) b!174754))

(assert (= (and b!174754 (not res!144723)) b!174755))

(assert (=> b!174753 m!273693))

(assert (=> b!174753 m!274077))

(assert (=> b!174755 m!273693))

(assert (=> b!174755 m!273693))

(declare-fun m!274521 () Bool)

(assert (=> b!174755 m!274521))

(assert (=> b!174619 d!61605))

(assert (=> b!174623 d!61507))

(assert (=> b!174623 d!61411))

(push 1)

(assert (not d!61511))

(assert (not b!174694))

(assert (not b!174691))

(assert (not d!61537))

(assert (not d!61473))

(assert (not b!174728))

(assert (not d!61475))

(assert (not b!174742))

(assert (not b!174652))

(assert (not d!61553))

(assert (not b!174729))

(assert (not bm!2896))

(assert (not d!61529))

(assert (not b!174628))

(assert (not bm!2894))

(assert (not b!174709))

(assert (not d!61491))

(assert (not d!61547))

(assert (not b!174701))

(assert (not d!61595))

(assert (not d!61551))

(assert (not d!61577))

(assert (not d!61525))

(assert (not b!174633))

(assert (not b!174631))

(assert (not b!174667))

(assert (not d!61533))

(assert (not b!174747))

(assert (not d!61557))

(assert (not b!174681))

(assert (not d!61567))

(assert (not b!174716))

(assert (not d!61515))

(assert (not d!61527))

(assert (not b!174639))

(assert (not d!61585))

(assert (not b!174697))

(assert (not b!174696))

(assert (not b!174627))

(assert (not bm!2895))

(assert (not d!61569))

(assert (not b!174736))

(assert (not d!61555))

(assert (not b!174708))

(assert (not d!61545))

(assert (not d!61549))

(assert (not b!174673))

(assert (not b!174738))

(assert (not b!174706))

(assert (not d!61573))

(assert (not b!174671))

(assert (not d!61597))

(assert (not d!61507))

(assert (not d!61575))

(assert (not d!61583))

(assert (not b!174682))

(assert (not b!174645))

(assert (not d!61523))

(assert (not b!174753))

(assert (not b!174688))

(assert (not d!61497))

(assert (not d!61561))

(assert (not b!174732))

(assert (not b!174690))

(assert (not d!61499))

(assert (not b!174730))

(assert (not d!61477))

(assert (not b!174731))

(assert (not b!174683))

(assert (not d!61599))

(assert (not b!174634))

(assert (not b!174692))

(assert (not b!174748))

(assert (not d!61559))

(assert (not d!61541))

(assert (not b!174718))

(assert (not b!174751))

(assert (not d!61591))

(assert (not b!174745))

(assert (not d!61481))

(assert (not d!61505))

(assert (not b!174637))

(assert (not b!174750))

(assert (not b!174636))

(assert (not b!174710))

(assert (not d!61593))

(assert (not b!174679))

(assert (not b!174650))

(assert (not b!174752))

(assert (not d!61521))

(assert (not b!174744))

(assert (not d!61495))

(assert (not b!174693))

(assert (not d!61487))

(assert (not d!61531))

(assert (not b!174642))

(assert (not b!174640))

(assert (not d!61539))

(assert (not d!61535))

(assert (not b!174630))

(assert (not b!174755))

(assert (not d!61519))

(check-sat)

(pop 1)

(push 1)

(check-sat)


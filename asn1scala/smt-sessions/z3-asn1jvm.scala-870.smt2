; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25076 () Bool)

(assert start!25076)

(declare-fun b!127094 () Bool)

(declare-fun e!83883 () Bool)

(declare-datatypes ((array!5764 0))(
  ( (array!5765 (arr!3220 (Array (_ BitVec 32) (_ BitVec 8))) (size!2609 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4542 0))(
  ( (BitStream!4543 (buf!2994 array!5764) (currentByte!5733 (_ BitVec 32)) (currentBit!5728 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4542)

(declare-fun array_inv!2398 (array!5764) Bool)

(assert (=> b!127094 (= e!83883 (array_inv!2398 (buf!2994 thiss!1614)))))

(declare-fun b!127095 () Bool)

(declare-fun e!83884 () Bool)

(declare-fun e!83888 () Bool)

(assert (=> b!127095 (= e!83884 e!83888)))

(declare-fun res!105349 () Bool)

(assert (=> b!127095 (=> (not res!105349) (not e!83888))))

(declare-datatypes ((Unit!7818 0))(
  ( (Unit!7819) )
))
(declare-datatypes ((tuple2!10702 0))(
  ( (tuple2!10703 (_1!5636 Unit!7818) (_2!5636 BitStream!4542)) )
))
(declare-fun lt!198343 () tuple2!10702)

(declare-fun lt!198341 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127095 (= res!105349 (= (bitIndex!0 (size!2609 (buf!2994 (_2!5636 lt!198343))) (currentByte!5733 (_2!5636 lt!198343)) (currentBit!5728 (_2!5636 lt!198343))) (bvadd (bitIndex!0 (size!2609 (buf!2994 thiss!1614)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198341))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!127095 (= lt!198341 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127096 () Bool)

(declare-fun res!105348 () Bool)

(assert (=> b!127096 (=> (not res!105348) (not e!83888))))

(declare-fun isPrefixOf!0 (BitStream!4542 BitStream!4542) Bool)

(assert (=> b!127096 (= res!105348 (isPrefixOf!0 thiss!1614 (_2!5636 lt!198343)))))

(declare-datatypes ((tuple2!10704 0))(
  ( (tuple2!10705 (_1!5637 BitStream!4542) (_2!5637 array!5764)) )
))
(declare-fun lt!198338 () tuple2!10704)

(declare-fun b!127098 () Bool)

(declare-fun arr!227 () array!5764)

(declare-fun e!83887 () Bool)

(declare-fun arrayRangesEq!93 (array!5764 array!5764 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127098 (= e!83887 (not (arrayRangesEq!93 arr!227 (_2!5637 lt!198338) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127099 () Bool)

(declare-fun e!83885 () Bool)

(declare-fun lt!198339 () (_ BitVec 64))

(declare-fun lt!198337 () (_ BitVec 64))

(declare-fun lt!198340 () (_ BitVec 64))

(assert (=> b!127099 (= e!83885 (not (or (not (= lt!198339 (bvand lt!198337 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!198339 (bvand (bvadd lt!198340 lt!198337) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!127099 (= lt!198339 (bvand lt!198340 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127099 (= lt!198337 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)))))

(assert (=> b!127099 (= lt!198340 (bitIndex!0 (size!2609 (buf!2994 thiss!1614)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614)))))

(assert (=> b!127099 e!83884))

(declare-fun res!105345 () Bool)

(assert (=> b!127099 (=> (not res!105345) (not e!83884))))

(assert (=> b!127099 (= res!105345 (= (size!2609 (buf!2994 thiss!1614)) (size!2609 (buf!2994 (_2!5636 lt!198343)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4542 array!5764 (_ BitVec 32) (_ BitVec 32)) tuple2!10702)

(assert (=> b!127099 (= lt!198343 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127100 () Bool)

(declare-fun res!105346 () Bool)

(assert (=> b!127100 (=> (not res!105346) (not e!83885))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127100 (= res!105346 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2609 (buf!2994 thiss!1614))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614)) noOfBytes!1))))

(declare-fun res!105347 () Bool)

(assert (=> start!25076 (=> (not res!105347) (not e!83885))))

(assert (=> start!25076 (= res!105347 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2609 arr!227))))))

(assert (=> start!25076 e!83885))

(assert (=> start!25076 true))

(assert (=> start!25076 (array_inv!2398 arr!227)))

(declare-fun inv!12 (BitStream!4542) Bool)

(assert (=> start!25076 (and (inv!12 thiss!1614) e!83883)))

(declare-fun b!127097 () Bool)

(assert (=> b!127097 (= e!83888 (not e!83887))))

(declare-fun res!105344 () Bool)

(assert (=> b!127097 (=> res!105344 e!83887)))

(declare-datatypes ((tuple2!10706 0))(
  ( (tuple2!10707 (_1!5638 BitStream!4542) (_2!5638 BitStream!4542)) )
))
(declare-fun lt!198344 () tuple2!10706)

(assert (=> b!127097 (= res!105344 (or (not (= (size!2609 (_2!5637 lt!198338)) (size!2609 arr!227))) (not (= (_1!5637 lt!198338) (_2!5638 lt!198344)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4542 array!5764 (_ BitVec 32) (_ BitVec 32)) tuple2!10704)

(assert (=> b!127097 (= lt!198338 (readByteArrayLoopPure!0 (_1!5638 lt!198344) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127097 (validate_offset_bits!1 ((_ sign_extend 32) (size!2609 (buf!2994 (_2!5636 lt!198343)))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614)) lt!198341)))

(declare-fun lt!198342 () Unit!7818)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4542 array!5764 (_ BitVec 64)) Unit!7818)

(assert (=> b!127097 (= lt!198342 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2994 (_2!5636 lt!198343)) lt!198341))))

(declare-fun reader!0 (BitStream!4542 BitStream!4542) tuple2!10706)

(assert (=> b!127097 (= lt!198344 (reader!0 thiss!1614 (_2!5636 lt!198343)))))

(assert (= (and start!25076 res!105347) b!127100))

(assert (= (and b!127100 res!105346) b!127099))

(assert (= (and b!127099 res!105345) b!127095))

(assert (= (and b!127095 res!105349) b!127096))

(assert (= (and b!127096 res!105348) b!127097))

(assert (= (and b!127097 (not res!105344)) b!127098))

(assert (= start!25076 b!127094))

(declare-fun m!192737 () Bool)

(assert (=> b!127099 m!192737))

(declare-fun m!192739 () Bool)

(assert (=> b!127099 m!192739))

(declare-fun m!192741 () Bool)

(assert (=> b!127097 m!192741))

(declare-fun m!192743 () Bool)

(assert (=> b!127097 m!192743))

(declare-fun m!192745 () Bool)

(assert (=> b!127097 m!192745))

(declare-fun m!192747 () Bool)

(assert (=> b!127097 m!192747))

(declare-fun m!192749 () Bool)

(assert (=> b!127094 m!192749))

(declare-fun m!192751 () Bool)

(assert (=> b!127100 m!192751))

(declare-fun m!192753 () Bool)

(assert (=> start!25076 m!192753))

(declare-fun m!192755 () Bool)

(assert (=> start!25076 m!192755))

(declare-fun m!192757 () Bool)

(assert (=> b!127098 m!192757))

(declare-fun m!192759 () Bool)

(assert (=> b!127096 m!192759))

(declare-fun m!192761 () Bool)

(assert (=> b!127095 m!192761))

(assert (=> b!127095 m!192737))

(check-sat (not b!127095) (not b!127098) (not b!127100) (not b!127097) (not b!127094) (not start!25076) (not b!127096) (not b!127099))
(check-sat)
(get-model)

(declare-fun d!41140 () Bool)

(declare-fun e!83912 () Bool)

(assert (=> d!41140 e!83912))

(declare-fun res!105372 () Bool)

(assert (=> d!41140 (=> (not res!105372) (not e!83912))))

(declare-fun lt!198389 () (_ BitVec 64))

(declare-fun lt!198391 () (_ BitVec 64))

(declare-fun lt!198387 () (_ BitVec 64))

(assert (=> d!41140 (= res!105372 (= lt!198391 (bvsub lt!198389 lt!198387)))))

(assert (=> d!41140 (or (= (bvand lt!198389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198389 lt!198387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41140 (= lt!198387 (remainingBits!0 ((_ sign_extend 32) (size!2609 (buf!2994 thiss!1614))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614))))))

(declare-fun lt!198390 () (_ BitVec 64))

(declare-fun lt!198388 () (_ BitVec 64))

(assert (=> d!41140 (= lt!198389 (bvmul lt!198390 lt!198388))))

(assert (=> d!41140 (or (= lt!198390 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!198388 (bvsdiv (bvmul lt!198390 lt!198388) lt!198390)))))

(assert (=> d!41140 (= lt!198388 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41140 (= lt!198390 ((_ sign_extend 32) (size!2609 (buf!2994 thiss!1614))))))

(assert (=> d!41140 (= lt!198391 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5733 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5728 thiss!1614))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!41140 (invariant!0 (currentBit!5728 thiss!1614) (currentByte!5733 thiss!1614) (size!2609 (buf!2994 thiss!1614)))))

(assert (=> d!41140 (= (bitIndex!0 (size!2609 (buf!2994 thiss!1614)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614)) lt!198391)))

(declare-fun b!127126 () Bool)

(declare-fun res!105373 () Bool)

(assert (=> b!127126 (=> (not res!105373) (not e!83912))))

(assert (=> b!127126 (= res!105373 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!198391))))

(declare-fun b!127127 () Bool)

(declare-fun lt!198392 () (_ BitVec 64))

(assert (=> b!127127 (= e!83912 (bvsle lt!198391 (bvmul lt!198392 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!127127 (or (= lt!198392 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198392 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198392)))))

(assert (=> b!127127 (= lt!198392 ((_ sign_extend 32) (size!2609 (buf!2994 thiss!1614))))))

(assert (= (and d!41140 res!105372) b!127126))

(assert (= (and b!127126 res!105373) b!127127))

(declare-fun m!192795 () Bool)

(assert (=> d!41140 m!192795))

(declare-fun m!192797 () Bool)

(assert (=> d!41140 m!192797))

(assert (=> b!127099 d!41140))

(declare-fun b!127167 () Bool)

(declare-fun res!105410 () Bool)

(declare-fun e!83934 () Bool)

(assert (=> b!127167 (=> (not res!105410) (not e!83934))))

(declare-fun lt!198516 () tuple2!10702)

(assert (=> b!127167 (= res!105410 (isPrefixOf!0 thiss!1614 (_2!5636 lt!198516)))))

(declare-fun b!127168 () Bool)

(declare-fun e!83932 () Bool)

(assert (=> b!127168 (= e!83934 e!83932)))

(declare-fun res!105407 () Bool)

(assert (=> b!127168 (=> (not res!105407) (not e!83932))))

(declare-fun lt!198519 () tuple2!10704)

(declare-fun lt!198521 () tuple2!10706)

(assert (=> b!127168 (= res!105407 (and (= (size!2609 (_2!5637 lt!198519)) (size!2609 arr!227)) (= (_1!5637 lt!198519) (_2!5638 lt!198521))))))

(assert (=> b!127168 (= lt!198519 (readByteArrayLoopPure!0 (_1!5638 lt!198521) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198517 () Unit!7818)

(declare-fun lt!198520 () Unit!7818)

(assert (=> b!127168 (= lt!198517 lt!198520)))

(declare-fun lt!198515 () (_ BitVec 64))

(assert (=> b!127168 (validate_offset_bits!1 ((_ sign_extend 32) (size!2609 (buf!2994 (_2!5636 lt!198516)))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614)) lt!198515)))

(assert (=> b!127168 (= lt!198520 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2994 (_2!5636 lt!198516)) lt!198515))))

(declare-fun e!83933 () Bool)

(assert (=> b!127168 e!83933))

(declare-fun res!105409 () Bool)

(assert (=> b!127168 (=> (not res!105409) (not e!83933))))

(assert (=> b!127168 (= res!105409 (and (= (size!2609 (buf!2994 thiss!1614)) (size!2609 (buf!2994 (_2!5636 lt!198516)))) (bvsge lt!198515 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!127168 (= lt!198515 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!127168 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!127168 (= lt!198521 (reader!0 thiss!1614 (_2!5636 lt!198516)))))

(declare-fun b!127169 () Bool)

(declare-fun res!105408 () Bool)

(assert (=> b!127169 (=> (not res!105408) (not e!83934))))

(declare-fun lt!198513 () (_ BitVec 64))

(declare-fun lt!198518 () (_ BitVec 64))

(assert (=> b!127169 (= res!105408 (= (bitIndex!0 (size!2609 (buf!2994 (_2!5636 lt!198516))) (currentByte!5733 (_2!5636 lt!198516)) (currentBit!5728 (_2!5636 lt!198516))) (bvadd lt!198513 lt!198518)))))

(assert (=> b!127169 (or (not (= (bvand lt!198513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198518 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!198513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!198513 lt!198518) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!198514 () (_ BitVec 64))

(assert (=> b!127169 (= lt!198518 (bvmul lt!198514 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!127169 (or (= lt!198514 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198514 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198514)))))

(assert (=> b!127169 (= lt!198514 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!127169 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!127169 (= lt!198513 (bitIndex!0 (size!2609 (buf!2994 thiss!1614)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614)))))

(declare-fun b!127170 () Bool)

(assert (=> b!127170 (= e!83933 (validate_offset_bits!1 ((_ sign_extend 32) (size!2609 (buf!2994 thiss!1614))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614)) lt!198515))))

(declare-fun b!127171 () Bool)

(assert (=> b!127171 (= e!83932 (arrayRangesEq!93 arr!227 (_2!5637 lt!198519) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun d!41150 () Bool)

(assert (=> d!41150 e!83934))

(declare-fun res!105411 () Bool)

(assert (=> d!41150 (=> (not res!105411) (not e!83934))))

(assert (=> d!41150 (= res!105411 (= (size!2609 (buf!2994 thiss!1614)) (size!2609 (buf!2994 (_2!5636 lt!198516)))))))

(declare-fun choose!64 (BitStream!4542 array!5764 (_ BitVec 32) (_ BitVec 32)) tuple2!10702)

(assert (=> d!41150 (= lt!198516 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41150 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2609 arr!227)))))

(assert (=> d!41150 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!198516)))

(assert (= (and d!41150 res!105411) b!127169))

(assert (= (and b!127169 res!105408) b!127167))

(assert (= (and b!127167 res!105410) b!127168))

(assert (= (and b!127168 res!105409) b!127170))

(assert (= (and b!127168 res!105407) b!127171))

(declare-fun m!192841 () Bool)

(assert (=> b!127169 m!192841))

(assert (=> b!127169 m!192737))

(declare-fun m!192843 () Bool)

(assert (=> b!127171 m!192843))

(declare-fun m!192845 () Bool)

(assert (=> b!127170 m!192845))

(declare-fun m!192847 () Bool)

(assert (=> b!127167 m!192847))

(declare-fun m!192849 () Bool)

(assert (=> b!127168 m!192849))

(declare-fun m!192851 () Bool)

(assert (=> b!127168 m!192851))

(declare-fun m!192853 () Bool)

(assert (=> b!127168 m!192853))

(declare-fun m!192855 () Bool)

(assert (=> b!127168 m!192855))

(declare-fun m!192857 () Bool)

(assert (=> d!41150 m!192857))

(assert (=> b!127099 d!41150))

(declare-fun d!41162 () Bool)

(assert (=> d!41162 (= (array_inv!2398 (buf!2994 thiss!1614)) (bvsge (size!2609 (buf!2994 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!127094 d!41162))

(declare-fun d!41164 () Bool)

(assert (=> d!41164 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2609 (buf!2994 thiss!1614))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2609 (buf!2994 thiss!1614))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9989 () Bool)

(assert (= bs!9989 d!41164))

(assert (=> bs!9989 m!192795))

(assert (=> b!127100 d!41164))

(declare-fun d!41166 () Bool)

(declare-fun e!83935 () Bool)

(assert (=> d!41166 e!83935))

(declare-fun res!105412 () Bool)

(assert (=> d!41166 (=> (not res!105412) (not e!83935))))

(declare-fun lt!198524 () (_ BitVec 64))

(declare-fun lt!198522 () (_ BitVec 64))

(declare-fun lt!198526 () (_ BitVec 64))

(assert (=> d!41166 (= res!105412 (= lt!198526 (bvsub lt!198524 lt!198522)))))

(assert (=> d!41166 (or (= (bvand lt!198524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198524 lt!198522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41166 (= lt!198522 (remainingBits!0 ((_ sign_extend 32) (size!2609 (buf!2994 (_2!5636 lt!198343)))) ((_ sign_extend 32) (currentByte!5733 (_2!5636 lt!198343))) ((_ sign_extend 32) (currentBit!5728 (_2!5636 lt!198343)))))))

(declare-fun lt!198525 () (_ BitVec 64))

(declare-fun lt!198523 () (_ BitVec 64))

(assert (=> d!41166 (= lt!198524 (bvmul lt!198525 lt!198523))))

(assert (=> d!41166 (or (= lt!198525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!198523 (bvsdiv (bvmul lt!198525 lt!198523) lt!198525)))))

(assert (=> d!41166 (= lt!198523 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41166 (= lt!198525 ((_ sign_extend 32) (size!2609 (buf!2994 (_2!5636 lt!198343)))))))

(assert (=> d!41166 (= lt!198526 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5733 (_2!5636 lt!198343))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5728 (_2!5636 lt!198343)))))))

(assert (=> d!41166 (invariant!0 (currentBit!5728 (_2!5636 lt!198343)) (currentByte!5733 (_2!5636 lt!198343)) (size!2609 (buf!2994 (_2!5636 lt!198343))))))

(assert (=> d!41166 (= (bitIndex!0 (size!2609 (buf!2994 (_2!5636 lt!198343))) (currentByte!5733 (_2!5636 lt!198343)) (currentBit!5728 (_2!5636 lt!198343))) lt!198526)))

(declare-fun b!127172 () Bool)

(declare-fun res!105413 () Bool)

(assert (=> b!127172 (=> (not res!105413) (not e!83935))))

(assert (=> b!127172 (= res!105413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!198526))))

(declare-fun b!127173 () Bool)

(declare-fun lt!198527 () (_ BitVec 64))

(assert (=> b!127173 (= e!83935 (bvsle lt!198526 (bvmul lt!198527 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!127173 (or (= lt!198527 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198527 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198527)))))

(assert (=> b!127173 (= lt!198527 ((_ sign_extend 32) (size!2609 (buf!2994 (_2!5636 lt!198343)))))))

(assert (= (and d!41166 res!105412) b!127172))

(assert (= (and b!127172 res!105413) b!127173))

(declare-fun m!192859 () Bool)

(assert (=> d!41166 m!192859))

(declare-fun m!192861 () Bool)

(assert (=> d!41166 m!192861))

(assert (=> b!127095 d!41166))

(assert (=> b!127095 d!41140))

(declare-fun d!41168 () Bool)

(declare-fun res!105430 () Bool)

(declare-fun e!83947 () Bool)

(assert (=> d!41168 (=> (not res!105430) (not e!83947))))

(assert (=> d!41168 (= res!105430 (= (size!2609 (buf!2994 thiss!1614)) (size!2609 (buf!2994 (_2!5636 lt!198343)))))))

(assert (=> d!41168 (= (isPrefixOf!0 thiss!1614 (_2!5636 lt!198343)) e!83947)))

(declare-fun b!127190 () Bool)

(declare-fun res!105432 () Bool)

(assert (=> b!127190 (=> (not res!105432) (not e!83947))))

(assert (=> b!127190 (= res!105432 (bvsle (bitIndex!0 (size!2609 (buf!2994 thiss!1614)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614)) (bitIndex!0 (size!2609 (buf!2994 (_2!5636 lt!198343))) (currentByte!5733 (_2!5636 lt!198343)) (currentBit!5728 (_2!5636 lt!198343)))))))

(declare-fun b!127191 () Bool)

(declare-fun e!83946 () Bool)

(assert (=> b!127191 (= e!83947 e!83946)))

(declare-fun res!105431 () Bool)

(assert (=> b!127191 (=> res!105431 e!83946)))

(assert (=> b!127191 (= res!105431 (= (size!2609 (buf!2994 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!127192 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5764 array!5764 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127192 (= e!83946 (arrayBitRangesEq!0 (buf!2994 thiss!1614) (buf!2994 (_2!5636 lt!198343)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2609 (buf!2994 thiss!1614)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614))))))

(assert (= (and d!41168 res!105430) b!127190))

(assert (= (and b!127190 res!105432) b!127191))

(assert (= (and b!127191 (not res!105431)) b!127192))

(assert (=> b!127190 m!192737))

(assert (=> b!127190 m!192761))

(assert (=> b!127192 m!192737))

(assert (=> b!127192 m!192737))

(declare-fun m!192863 () Bool)

(assert (=> b!127192 m!192863))

(assert (=> b!127096 d!41168))

(declare-fun d!41170 () Bool)

(assert (=> d!41170 (= (array_inv!2398 arr!227) (bvsge (size!2609 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!25076 d!41170))

(declare-fun d!41172 () Bool)

(assert (=> d!41172 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5728 thiss!1614) (currentByte!5733 thiss!1614) (size!2609 (buf!2994 thiss!1614))))))

(declare-fun bs!9990 () Bool)

(assert (= bs!9990 d!41172))

(assert (=> bs!9990 m!192797))

(assert (=> start!25076 d!41172))

(declare-datatypes ((tuple3!462 0))(
  ( (tuple3!463 (_1!5643 Unit!7818) (_2!5643 BitStream!4542) (_3!286 array!5764)) )
))
(declare-fun lt!198557 () tuple3!462)

(declare-fun d!41174 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4542 array!5764 (_ BitVec 32) (_ BitVec 32)) tuple3!462)

(assert (=> d!41174 (= lt!198557 (readByteArrayLoop!0 (_1!5638 lt!198344) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41174 (= (readByteArrayLoopPure!0 (_1!5638 lt!198344) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10705 (_2!5643 lt!198557) (_3!286 lt!198557)))))

(declare-fun bs!9991 () Bool)

(assert (= bs!9991 d!41174))

(declare-fun m!192883 () Bool)

(assert (=> bs!9991 m!192883))

(assert (=> b!127097 d!41174))

(declare-fun d!41178 () Bool)

(assert (=> d!41178 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2609 (buf!2994 (_2!5636 lt!198343)))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614)) lt!198341) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2609 (buf!2994 (_2!5636 lt!198343)))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614))) lt!198341))))

(declare-fun bs!9992 () Bool)

(assert (= bs!9992 d!41178))

(declare-fun m!192887 () Bool)

(assert (=> bs!9992 m!192887))

(assert (=> b!127097 d!41178))

(declare-fun d!41180 () Bool)

(assert (=> d!41180 (validate_offset_bits!1 ((_ sign_extend 32) (size!2609 (buf!2994 (_2!5636 lt!198343)))) ((_ sign_extend 32) (currentByte!5733 thiss!1614)) ((_ sign_extend 32) (currentBit!5728 thiss!1614)) lt!198341)))

(declare-fun lt!198560 () Unit!7818)

(declare-fun choose!9 (BitStream!4542 array!5764 (_ BitVec 64) BitStream!4542) Unit!7818)

(assert (=> d!41180 (= lt!198560 (choose!9 thiss!1614 (buf!2994 (_2!5636 lt!198343)) lt!198341 (BitStream!4543 (buf!2994 (_2!5636 lt!198343)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614))))))

(assert (=> d!41180 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2994 (_2!5636 lt!198343)) lt!198341) lt!198560)))

(declare-fun bs!9994 () Bool)

(assert (= bs!9994 d!41180))

(assert (=> bs!9994 m!192743))

(declare-fun m!192893 () Bool)

(assert (=> bs!9994 m!192893))

(assert (=> b!127097 d!41180))

(declare-fun d!41190 () Bool)

(declare-fun e!83988 () Bool)

(assert (=> d!41190 e!83988))

(declare-fun res!105490 () Bool)

(assert (=> d!41190 (=> (not res!105490) (not e!83988))))

(declare-fun lt!198635 () tuple2!10706)

(assert (=> d!41190 (= res!105490 (isPrefixOf!0 (_1!5638 lt!198635) (_2!5638 lt!198635)))))

(declare-fun lt!198643 () BitStream!4542)

(assert (=> d!41190 (= lt!198635 (tuple2!10707 lt!198643 (_2!5636 lt!198343)))))

(declare-fun lt!198647 () Unit!7818)

(declare-fun lt!198639 () Unit!7818)

(assert (=> d!41190 (= lt!198647 lt!198639)))

(assert (=> d!41190 (isPrefixOf!0 lt!198643 (_2!5636 lt!198343))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4542 BitStream!4542 BitStream!4542) Unit!7818)

(assert (=> d!41190 (= lt!198639 (lemmaIsPrefixTransitive!0 lt!198643 (_2!5636 lt!198343) (_2!5636 lt!198343)))))

(declare-fun lt!198648 () Unit!7818)

(declare-fun lt!198649 () Unit!7818)

(assert (=> d!41190 (= lt!198648 lt!198649)))

(assert (=> d!41190 (isPrefixOf!0 lt!198643 (_2!5636 lt!198343))))

(assert (=> d!41190 (= lt!198649 (lemmaIsPrefixTransitive!0 lt!198643 thiss!1614 (_2!5636 lt!198343)))))

(declare-fun lt!198644 () Unit!7818)

(declare-fun e!83989 () Unit!7818)

(assert (=> d!41190 (= lt!198644 e!83989)))

(declare-fun c!7500 () Bool)

(assert (=> d!41190 (= c!7500 (not (= (size!2609 (buf!2994 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!198651 () Unit!7818)

(declare-fun lt!198646 () Unit!7818)

(assert (=> d!41190 (= lt!198651 lt!198646)))

(assert (=> d!41190 (isPrefixOf!0 (_2!5636 lt!198343) (_2!5636 lt!198343))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4542) Unit!7818)

(assert (=> d!41190 (= lt!198646 (lemmaIsPrefixRefl!0 (_2!5636 lt!198343)))))

(declare-fun lt!198650 () Unit!7818)

(declare-fun lt!198653 () Unit!7818)

(assert (=> d!41190 (= lt!198650 lt!198653)))

(assert (=> d!41190 (= lt!198653 (lemmaIsPrefixRefl!0 (_2!5636 lt!198343)))))

(declare-fun lt!198645 () Unit!7818)

(declare-fun lt!198640 () Unit!7818)

(assert (=> d!41190 (= lt!198645 lt!198640)))

(assert (=> d!41190 (isPrefixOf!0 lt!198643 lt!198643)))

(assert (=> d!41190 (= lt!198640 (lemmaIsPrefixRefl!0 lt!198643))))

(declare-fun lt!198641 () Unit!7818)

(declare-fun lt!198634 () Unit!7818)

(assert (=> d!41190 (= lt!198641 lt!198634)))

(assert (=> d!41190 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!41190 (= lt!198634 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!41190 (= lt!198643 (BitStream!4543 (buf!2994 (_2!5636 lt!198343)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614)))))

(assert (=> d!41190 (isPrefixOf!0 thiss!1614 (_2!5636 lt!198343))))

(assert (=> d!41190 (= (reader!0 thiss!1614 (_2!5636 lt!198343)) lt!198635)))

(declare-fun b!127253 () Bool)

(declare-fun lt!198636 () (_ BitVec 64))

(declare-fun lt!198652 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4542 (_ BitVec 64)) BitStream!4542)

(assert (=> b!127253 (= e!83988 (= (_1!5638 lt!198635) (withMovedBitIndex!0 (_2!5638 lt!198635) (bvsub lt!198652 lt!198636))))))

(assert (=> b!127253 (or (= (bvand lt!198652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198636 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198652 lt!198636) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!127253 (= lt!198636 (bitIndex!0 (size!2609 (buf!2994 (_2!5636 lt!198343))) (currentByte!5733 (_2!5636 lt!198343)) (currentBit!5728 (_2!5636 lt!198343))))))

(assert (=> b!127253 (= lt!198652 (bitIndex!0 (size!2609 (buf!2994 thiss!1614)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614)))))

(declare-fun b!127254 () Bool)

(declare-fun Unit!7823 () Unit!7818)

(assert (=> b!127254 (= e!83989 Unit!7823)))

(declare-fun b!127255 () Bool)

(declare-fun res!105489 () Bool)

(assert (=> b!127255 (=> (not res!105489) (not e!83988))))

(assert (=> b!127255 (= res!105489 (isPrefixOf!0 (_2!5638 lt!198635) (_2!5636 lt!198343)))))

(declare-fun b!127256 () Bool)

(declare-fun lt!198637 () Unit!7818)

(assert (=> b!127256 (= e!83989 lt!198637)))

(declare-fun lt!198642 () (_ BitVec 64))

(assert (=> b!127256 (= lt!198642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!198638 () (_ BitVec 64))

(assert (=> b!127256 (= lt!198638 (bitIndex!0 (size!2609 (buf!2994 thiss!1614)) (currentByte!5733 thiss!1614) (currentBit!5728 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5764 array!5764 (_ BitVec 64) (_ BitVec 64)) Unit!7818)

(assert (=> b!127256 (= lt!198637 (arrayBitRangesEqSymmetric!0 (buf!2994 thiss!1614) (buf!2994 (_2!5636 lt!198343)) lt!198642 lt!198638))))

(assert (=> b!127256 (arrayBitRangesEq!0 (buf!2994 (_2!5636 lt!198343)) (buf!2994 thiss!1614) lt!198642 lt!198638)))

(declare-fun b!127257 () Bool)

(declare-fun res!105491 () Bool)

(assert (=> b!127257 (=> (not res!105491) (not e!83988))))

(assert (=> b!127257 (= res!105491 (isPrefixOf!0 (_1!5638 lt!198635) thiss!1614))))

(assert (= (and d!41190 c!7500) b!127256))

(assert (= (and d!41190 (not c!7500)) b!127254))

(assert (= (and d!41190 res!105490) b!127257))

(assert (= (and b!127257 res!105491) b!127255))

(assert (= (and b!127255 res!105489) b!127253))

(assert (=> b!127256 m!192737))

(declare-fun m!192929 () Bool)

(assert (=> b!127256 m!192929))

(declare-fun m!192931 () Bool)

(assert (=> b!127256 m!192931))

(declare-fun m!192933 () Bool)

(assert (=> b!127257 m!192933))

(declare-fun m!192935 () Bool)

(assert (=> b!127253 m!192935))

(assert (=> b!127253 m!192761))

(assert (=> b!127253 m!192737))

(declare-fun m!192937 () Bool)

(assert (=> d!41190 m!192937))

(declare-fun m!192939 () Bool)

(assert (=> d!41190 m!192939))

(declare-fun m!192941 () Bool)

(assert (=> d!41190 m!192941))

(declare-fun m!192943 () Bool)

(assert (=> d!41190 m!192943))

(declare-fun m!192945 () Bool)

(assert (=> d!41190 m!192945))

(assert (=> d!41190 m!192759))

(declare-fun m!192947 () Bool)

(assert (=> d!41190 m!192947))

(declare-fun m!192949 () Bool)

(assert (=> d!41190 m!192949))

(declare-fun m!192951 () Bool)

(assert (=> d!41190 m!192951))

(declare-fun m!192953 () Bool)

(assert (=> d!41190 m!192953))

(declare-fun m!192955 () Bool)

(assert (=> d!41190 m!192955))

(declare-fun m!192957 () Bool)

(assert (=> b!127255 m!192957))

(assert (=> b!127097 d!41190))

(declare-fun d!41210 () Bool)

(declare-fun res!105496 () Bool)

(declare-fun e!83994 () Bool)

(assert (=> d!41210 (=> res!105496 e!83994)))

(assert (=> d!41210 (= res!105496 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41210 (= (arrayRangesEq!93 arr!227 (_2!5637 lt!198338) #b00000000000000000000000000000000 noOfBytes!1) e!83994)))

(declare-fun b!127262 () Bool)

(declare-fun e!83995 () Bool)

(assert (=> b!127262 (= e!83994 e!83995)))

(declare-fun res!105497 () Bool)

(assert (=> b!127262 (=> (not res!105497) (not e!83995))))

(assert (=> b!127262 (= res!105497 (= (select (arr!3220 arr!227) #b00000000000000000000000000000000) (select (arr!3220 (_2!5637 lt!198338)) #b00000000000000000000000000000000)))))

(declare-fun b!127263 () Bool)

(assert (=> b!127263 (= e!83995 (arrayRangesEq!93 arr!227 (_2!5637 lt!198338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!41210 (not res!105496)) b!127262))

(assert (= (and b!127262 res!105497) b!127263))

(declare-fun m!192959 () Bool)

(assert (=> b!127262 m!192959))

(declare-fun m!192961 () Bool)

(assert (=> b!127262 m!192961))

(declare-fun m!192963 () Bool)

(assert (=> b!127263 m!192963))

(assert (=> b!127098 d!41210))

(check-sat (not b!127255) (not d!41140) (not b!127263) (not b!127170) (not b!127168) (not b!127190) (not b!127257) (not d!41166) (not d!41174) (not d!41164) (not d!41172) (not d!41180) (not d!41150) (not b!127256) (not b!127171) (not b!127192) (not b!127253) (not d!41178) (not d!41190) (not b!127167) (not b!127169))

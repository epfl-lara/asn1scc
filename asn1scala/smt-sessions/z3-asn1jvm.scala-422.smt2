; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10970 () Bool)

(assert start!10970)

(declare-fun b!54562 () Bool)

(declare-fun e!36412 () Bool)

(declare-fun e!36416 () Bool)

(assert (=> b!54562 (= e!36412 e!36416)))

(declare-fun res!45517 () Bool)

(assert (=> b!54562 (=> res!45517 e!36416)))

(declare-datatypes ((array!2559 0))(
  ( (array!2560 (arr!1707 (Array (_ BitVec 32) (_ BitVec 8))) (size!1167 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2022 0))(
  ( (BitStream!2023 (buf!1524 array!2559) (currentByte!3100 (_ BitVec 32)) (currentBit!3095 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2022)

(declare-datatypes ((Unit!3765 0))(
  ( (Unit!3766) )
))
(declare-datatypes ((tuple2!4974 0))(
  ( (tuple2!4975 (_1!2598 Unit!3765) (_2!2598 BitStream!2022)) )
))
(declare-fun lt!84655 () tuple2!4974)

(declare-fun isPrefixOf!0 (BitStream!2022 BitStream!2022) Bool)

(assert (=> b!54562 (= res!45517 (not (isPrefixOf!0 thiss!1379 (_2!2598 lt!84655))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54562 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!84655))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!84655))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84661 () Unit!3765)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2022 BitStream!2022 (_ BitVec 64) (_ BitVec 64)) Unit!3765)

(assert (=> b!54562 (= lt!84661 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2598 lt!84655) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2559)

(declare-fun appendBitFromByte!0 (BitStream!2022 (_ BitVec 8) (_ BitVec 32)) tuple2!4974)

(assert (=> b!54562 (= lt!84655 (appendBitFromByte!0 thiss!1379 (select (arr!1707 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54563 () Bool)

(declare-fun res!45521 () Bool)

(declare-fun e!36414 () Bool)

(assert (=> b!54563 (=> (not res!45521) (not e!36414))))

(assert (=> b!54563 (= res!45521 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 thiss!1379))) ((_ sign_extend 32) (currentByte!3100 thiss!1379)) ((_ sign_extend 32) (currentBit!3095 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54564 () Bool)

(assert (=> b!54564 (= e!36414 (not e!36412))))

(declare-fun res!45518 () Bool)

(assert (=> b!54564 (=> res!45518 e!36412)))

(assert (=> b!54564 (= res!45518 (bvsge i!635 to!314))))

(assert (=> b!54564 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!84654 () Unit!3765)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2022) Unit!3765)

(assert (=> b!54564 (= lt!84654 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!84653 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54564 (= lt!84653 (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)))))

(declare-fun b!54565 () Bool)

(declare-fun e!36418 () Bool)

(declare-fun lt!84656 () (_ BitVec 64))

(assert (=> b!54565 (= e!36418 (or (not (= lt!84656 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!84656 (bvand (bvadd lt!84653 to!314) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!54565 (= lt!84656 (bvand lt!84653 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36417 () Bool)

(declare-fun b!54566 () Bool)

(declare-datatypes ((tuple2!4976 0))(
  ( (tuple2!4977 (_1!2599 BitStream!2022) (_2!2599 BitStream!2022)) )
))
(declare-fun lt!84658 () tuple2!4976)

(declare-datatypes ((List!586 0))(
  ( (Nil!583) (Cons!582 (h!701 Bool) (t!1336 List!586)) )
))
(declare-fun head!405 (List!586) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2022 array!2559 (_ BitVec 64) (_ BitVec 64)) List!586)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2022 BitStream!2022 (_ BitVec 64)) List!586)

(assert (=> b!54566 (= e!36417 (= (head!405 (byteArrayBitContentToList!0 (_2!2598 lt!84655) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!405 (bitStreamReadBitsIntoList!0 (_2!2598 lt!84655) (_1!2599 lt!84658) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!45522 () Bool)

(assert (=> start!10970 (=> (not res!45522) (not e!36414))))

(assert (=> start!10970 (= res!45522 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1167 srcBuffer!2))))))))

(assert (=> start!10970 e!36414))

(assert (=> start!10970 true))

(declare-fun array_inv!1070 (array!2559) Bool)

(assert (=> start!10970 (array_inv!1070 srcBuffer!2)))

(declare-fun e!36413 () Bool)

(declare-fun inv!12 (BitStream!2022) Bool)

(assert (=> start!10970 (and (inv!12 thiss!1379) e!36413)))

(declare-fun b!54567 () Bool)

(assert (=> b!54567 (= e!36413 (array_inv!1070 (buf!1524 thiss!1379)))))

(declare-fun b!54568 () Bool)

(assert (=> b!54568 (= e!36416 e!36418)))

(declare-fun res!45519 () Bool)

(assert (=> b!54568 (=> res!45519 e!36418)))

(declare-fun lt!84660 () tuple2!4974)

(assert (=> b!54568 (= res!45519 (not (isPrefixOf!0 (_2!2598 lt!84655) (_2!2598 lt!84660))))))

(assert (=> b!54568 (isPrefixOf!0 thiss!1379 (_2!2598 lt!84660))))

(declare-fun lt!84657 () Unit!3765)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2022 BitStream!2022 BitStream!2022) Unit!3765)

(assert (=> b!54568 (= lt!84657 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2598 lt!84655) (_2!2598 lt!84660)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2022 array!2559 (_ BitVec 64) (_ BitVec 64)) tuple2!4974)

(assert (=> b!54568 (= lt!84660 (appendBitsMSBFirstLoop!0 (_2!2598 lt!84655) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!54568 e!36417))

(declare-fun res!45520 () Bool)

(assert (=> b!54568 (=> (not res!45520) (not e!36417))))

(assert (=> b!54568 (= res!45520 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 thiss!1379)) ((_ sign_extend 32) (currentBit!3095 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84659 () Unit!3765)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2022 array!2559 (_ BitVec 64)) Unit!3765)

(assert (=> b!54568 (= lt!84659 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1524 (_2!2598 lt!84655)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2022 BitStream!2022) tuple2!4976)

(assert (=> b!54568 (= lt!84658 (reader!0 thiss!1379 (_2!2598 lt!84655)))))

(assert (= (and start!10970 res!45522) b!54563))

(assert (= (and b!54563 res!45521) b!54564))

(assert (= (and b!54564 (not res!45518)) b!54562))

(assert (= (and b!54562 (not res!45517)) b!54568))

(assert (= (and b!54568 res!45520) b!54566))

(assert (= (and b!54568 (not res!45519)) b!54565))

(assert (= start!10970 b!54567))

(declare-fun m!85835 () Bool)

(assert (=> b!54567 m!85835))

(declare-fun m!85837 () Bool)

(assert (=> b!54566 m!85837))

(assert (=> b!54566 m!85837))

(declare-fun m!85839 () Bool)

(assert (=> b!54566 m!85839))

(declare-fun m!85841 () Bool)

(assert (=> b!54566 m!85841))

(assert (=> b!54566 m!85841))

(declare-fun m!85843 () Bool)

(assert (=> b!54566 m!85843))

(declare-fun m!85845 () Bool)

(assert (=> b!54563 m!85845))

(declare-fun m!85847 () Bool)

(assert (=> b!54564 m!85847))

(declare-fun m!85849 () Bool)

(assert (=> b!54564 m!85849))

(declare-fun m!85851 () Bool)

(assert (=> b!54564 m!85851))

(declare-fun m!85853 () Bool)

(assert (=> start!10970 m!85853))

(declare-fun m!85855 () Bool)

(assert (=> start!10970 m!85855))

(declare-fun m!85857 () Bool)

(assert (=> b!54562 m!85857))

(declare-fun m!85859 () Bool)

(assert (=> b!54562 m!85859))

(declare-fun m!85861 () Bool)

(assert (=> b!54562 m!85861))

(assert (=> b!54562 m!85859))

(declare-fun m!85863 () Bool)

(assert (=> b!54562 m!85863))

(declare-fun m!85865 () Bool)

(assert (=> b!54562 m!85865))

(declare-fun m!85867 () Bool)

(assert (=> b!54568 m!85867))

(declare-fun m!85869 () Bool)

(assert (=> b!54568 m!85869))

(declare-fun m!85871 () Bool)

(assert (=> b!54568 m!85871))

(declare-fun m!85873 () Bool)

(assert (=> b!54568 m!85873))

(declare-fun m!85875 () Bool)

(assert (=> b!54568 m!85875))

(declare-fun m!85877 () Bool)

(assert (=> b!54568 m!85877))

(declare-fun m!85879 () Bool)

(assert (=> b!54568 m!85879))

(check-sat (not b!54562) (not b!54568) (not start!10970) (not b!54567) (not b!54564) (not b!54563) (not b!54566))
(check-sat)
(get-model)

(declare-fun d!17380 () Bool)

(declare-fun res!45547 () Bool)

(declare-fun e!36448 () Bool)

(assert (=> d!17380 (=> (not res!45547) (not e!36448))))

(assert (=> d!17380 (= res!45547 (= (size!1167 (buf!1524 thiss!1379)) (size!1167 (buf!1524 (_2!2598 lt!84655)))))))

(assert (=> d!17380 (= (isPrefixOf!0 thiss!1379 (_2!2598 lt!84655)) e!36448)))

(declare-fun b!54596 () Bool)

(declare-fun res!45548 () Bool)

(assert (=> b!54596 (=> (not res!45548) (not e!36448))))

(assert (=> b!54596 (= res!45548 (bvsle (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)) (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84655))) (currentByte!3100 (_2!2598 lt!84655)) (currentBit!3095 (_2!2598 lt!84655)))))))

(declare-fun b!54597 () Bool)

(declare-fun e!36449 () Bool)

(assert (=> b!54597 (= e!36448 e!36449)))

(declare-fun res!45549 () Bool)

(assert (=> b!54597 (=> res!45549 e!36449)))

(assert (=> b!54597 (= res!45549 (= (size!1167 (buf!1524 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54598 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2559 array!2559 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54598 (= e!36449 (arrayBitRangesEq!0 (buf!1524 thiss!1379) (buf!1524 (_2!2598 lt!84655)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379))))))

(assert (= (and d!17380 res!45547) b!54596))

(assert (= (and b!54596 res!45548) b!54597))

(assert (= (and b!54597 (not res!45549)) b!54598))

(assert (=> b!54596 m!85851))

(declare-fun m!85927 () Bool)

(assert (=> b!54596 m!85927))

(assert (=> b!54598 m!85851))

(assert (=> b!54598 m!85851))

(declare-fun m!85929 () Bool)

(assert (=> b!54598 m!85929))

(assert (=> b!54562 d!17380))

(declare-fun d!17382 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17382 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!84655))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!84655))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!84655))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!84655)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4383 () Bool)

(assert (= bs!4383 d!17382))

(declare-fun m!85931 () Bool)

(assert (=> bs!4383 m!85931))

(assert (=> b!54562 d!17382))

(declare-fun d!17384 () Bool)

(declare-fun e!36452 () Bool)

(assert (=> d!17384 e!36452))

(declare-fun res!45552 () Bool)

(assert (=> d!17384 (=> (not res!45552) (not e!36452))))

(assert (=> d!17384 (= res!45552 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!84691 () Unit!3765)

(declare-fun choose!27 (BitStream!2022 BitStream!2022 (_ BitVec 64) (_ BitVec 64)) Unit!3765)

(assert (=> d!17384 (= lt!84691 (choose!27 thiss!1379 (_2!2598 lt!84655) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17384 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17384 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2598 lt!84655) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!84691)))

(declare-fun b!54601 () Bool)

(assert (=> b!54601 (= e!36452 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!84655))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!84655))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17384 res!45552) b!54601))

(declare-fun m!85933 () Bool)

(assert (=> d!17384 m!85933))

(assert (=> b!54601 m!85865))

(assert (=> b!54562 d!17384))

(declare-fun b!54670 () Bool)

(declare-fun e!36493 () Bool)

(declare-datatypes ((tuple2!4984 0))(
  ( (tuple2!4985 (_1!2603 BitStream!2022) (_2!2603 Bool)) )
))
(declare-fun lt!84754 () tuple2!4984)

(declare-fun lt!84758 () tuple2!4974)

(assert (=> b!54670 (= e!36493 (= (bitIndex!0 (size!1167 (buf!1524 (_1!2603 lt!84754))) (currentByte!3100 (_1!2603 lt!84754)) (currentBit!3095 (_1!2603 lt!84754))) (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84758))) (currentByte!3100 (_2!2598 lt!84758)) (currentBit!3095 (_2!2598 lt!84758)))))))

(declare-fun b!54671 () Bool)

(declare-fun e!36495 () Bool)

(declare-fun e!36496 () Bool)

(assert (=> b!54671 (= e!36495 e!36496)))

(declare-fun res!45602 () Bool)

(assert (=> b!54671 (=> (not res!45602) (not e!36496))))

(declare-fun lt!84756 () tuple2!4984)

(declare-fun lt!84755 () tuple2!4974)

(declare-fun lt!84761 () Bool)

(assert (=> b!54671 (= res!45602 (and (= (_2!2603 lt!84756) lt!84761) (= (_1!2603 lt!84756) (_2!2598 lt!84755))))))

(declare-fun readBitPure!0 (BitStream!2022) tuple2!4984)

(declare-fun readerFrom!0 (BitStream!2022 (_ BitVec 32) (_ BitVec 32)) BitStream!2022)

(assert (=> b!54671 (= lt!84756 (readBitPure!0 (readerFrom!0 (_2!2598 lt!84755) (currentBit!3095 thiss!1379) (currentByte!3100 thiss!1379))))))

(declare-fun b!54672 () Bool)

(declare-fun res!45606 () Bool)

(declare-fun e!36494 () Bool)

(assert (=> b!54672 (=> (not res!45606) (not e!36494))))

(assert (=> b!54672 (= res!45606 (isPrefixOf!0 thiss!1379 (_2!2598 lt!84758)))))

(declare-fun b!54673 () Bool)

(declare-fun res!45607 () Bool)

(assert (=> b!54673 (=> (not res!45607) (not e!36494))))

(declare-fun lt!84763 () (_ BitVec 64))

(declare-fun lt!84760 () (_ BitVec 64))

(assert (=> b!54673 (= res!45607 (= (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84758))) (currentByte!3100 (_2!2598 lt!84758)) (currentBit!3095 (_2!2598 lt!84758))) (bvadd lt!84760 lt!84763)))))

(assert (=> b!54673 (or (not (= (bvand lt!84760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84763 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!84760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!84760 lt!84763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54673 (= lt!84763 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!54673 (= lt!84760 (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)))))

(declare-fun d!17386 () Bool)

(assert (=> d!17386 e!36494))

(declare-fun res!45604 () Bool)

(assert (=> d!17386 (=> (not res!45604) (not e!36494))))

(assert (=> d!17386 (= res!45604 (= (size!1167 (buf!1524 (_2!2598 lt!84758))) (size!1167 (buf!1524 thiss!1379))))))

(declare-fun lt!84753 () (_ BitVec 8))

(declare-fun lt!84752 () array!2559)

(assert (=> d!17386 (= lt!84753 (select (arr!1707 lt!84752) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17386 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1167 lt!84752)))))

(assert (=> d!17386 (= lt!84752 (array!2560 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!84757 () tuple2!4974)

(assert (=> d!17386 (= lt!84758 (tuple2!4975 (_1!2598 lt!84757) (_2!2598 lt!84757)))))

(assert (=> d!17386 (= lt!84757 lt!84755)))

(assert (=> d!17386 e!36495))

(declare-fun res!45605 () Bool)

(assert (=> d!17386 (=> (not res!45605) (not e!36495))))

(assert (=> d!17386 (= res!45605 (= (size!1167 (buf!1524 thiss!1379)) (size!1167 (buf!1524 (_2!2598 lt!84755)))))))

(declare-fun appendBit!0 (BitStream!2022 Bool) tuple2!4974)

(assert (=> d!17386 (= lt!84755 (appendBit!0 thiss!1379 lt!84761))))

(assert (=> d!17386 (= lt!84761 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1707 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17386 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17386 (= (appendBitFromByte!0 thiss!1379 (select (arr!1707 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!84758)))

(declare-fun b!54674 () Bool)

(assert (=> b!54674 (= e!36496 (= (bitIndex!0 (size!1167 (buf!1524 (_1!2603 lt!84756))) (currentByte!3100 (_1!2603 lt!84756)) (currentBit!3095 (_1!2603 lt!84756))) (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84755))) (currentByte!3100 (_2!2598 lt!84755)) (currentBit!3095 (_2!2598 lt!84755)))))))

(declare-fun b!54675 () Bool)

(declare-fun res!45608 () Bool)

(assert (=> b!54675 (=> (not res!45608) (not e!36495))))

(assert (=> b!54675 (= res!45608 (isPrefixOf!0 thiss!1379 (_2!2598 lt!84755)))))

(declare-fun b!54676 () Bool)

(assert (=> b!54676 (= e!36494 e!36493)))

(declare-fun res!45603 () Bool)

(assert (=> b!54676 (=> (not res!45603) (not e!36493))))

(assert (=> b!54676 (= res!45603 (and (= (_2!2603 lt!84754) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1707 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!84753)) #b00000000000000000000000000000000))) (= (_1!2603 lt!84754) (_2!2598 lt!84758))))))

(declare-datatypes ((tuple2!4990 0))(
  ( (tuple2!4991 (_1!2606 array!2559) (_2!2606 BitStream!2022)) )
))
(declare-fun lt!84759 () tuple2!4990)

(declare-fun lt!84762 () BitStream!2022)

(declare-fun readBits!0 (BitStream!2022 (_ BitVec 64)) tuple2!4990)

(assert (=> b!54676 (= lt!84759 (readBits!0 lt!84762 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!54676 (= lt!84754 (readBitPure!0 lt!84762))))

(assert (=> b!54676 (= lt!84762 (readerFrom!0 (_2!2598 lt!84758) (currentBit!3095 thiss!1379) (currentByte!3100 thiss!1379)))))

(declare-fun b!54677 () Bool)

(declare-fun res!45609 () Bool)

(assert (=> b!54677 (=> (not res!45609) (not e!36495))))

(assert (=> b!54677 (= res!45609 (= (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84755))) (currentByte!3100 (_2!2598 lt!84755)) (currentBit!3095 (_2!2598 lt!84755))) (bvadd (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17386 res!45605) b!54677))

(assert (= (and b!54677 res!45609) b!54675))

(assert (= (and b!54675 res!45608) b!54671))

(assert (= (and b!54671 res!45602) b!54674))

(assert (= (and d!17386 res!45604) b!54673))

(assert (= (and b!54673 res!45607) b!54672))

(assert (= (and b!54672 res!45606) b!54676))

(assert (= (and b!54676 res!45603) b!54670))

(declare-fun m!85973 () Bool)

(assert (=> b!54676 m!85973))

(declare-fun m!85975 () Bool)

(assert (=> b!54676 m!85975))

(declare-fun m!85977 () Bool)

(assert (=> b!54676 m!85977))

(declare-fun m!85979 () Bool)

(assert (=> b!54670 m!85979))

(declare-fun m!85981 () Bool)

(assert (=> b!54670 m!85981))

(declare-fun m!85983 () Bool)

(assert (=> d!17386 m!85983))

(declare-fun m!85985 () Bool)

(assert (=> d!17386 m!85985))

(declare-fun m!85987 () Bool)

(assert (=> d!17386 m!85987))

(declare-fun m!85989 () Bool)

(assert (=> b!54671 m!85989))

(assert (=> b!54671 m!85989))

(declare-fun m!85991 () Bool)

(assert (=> b!54671 m!85991))

(declare-fun m!85993 () Bool)

(assert (=> b!54672 m!85993))

(assert (=> b!54673 m!85981))

(assert (=> b!54673 m!85851))

(declare-fun m!85995 () Bool)

(assert (=> b!54677 m!85995))

(assert (=> b!54677 m!85851))

(declare-fun m!85997 () Bool)

(assert (=> b!54674 m!85997))

(assert (=> b!54674 m!85995))

(declare-fun m!85999 () Bool)

(assert (=> b!54675 m!85999))

(assert (=> b!54562 d!17386))

(declare-fun d!17424 () Bool)

(assert (=> d!17424 (= (array_inv!1070 (buf!1524 thiss!1379)) (bvsge (size!1167 (buf!1524 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!54567 d!17424))

(declare-fun d!17426 () Bool)

(assert (=> d!17426 (= (array_inv!1070 srcBuffer!2) (bvsge (size!1167 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10970 d!17426))

(declare-fun d!17428 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17428 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3095 thiss!1379) (currentByte!3100 thiss!1379) (size!1167 (buf!1524 thiss!1379))))))

(declare-fun bs!4389 () Bool)

(assert (= bs!4389 d!17428))

(declare-fun m!86001 () Bool)

(assert (=> bs!4389 m!86001))

(assert (=> start!10970 d!17428))

(declare-fun b!54781 () Bool)

(declare-fun res!45701 () Bool)

(declare-fun e!36546 () Bool)

(assert (=> b!54781 (=> (not res!45701) (not e!36546))))

(declare-fun lt!85119 () tuple2!4974)

(assert (=> b!54781 (= res!45701 (= (size!1167 (buf!1524 (_2!2598 lt!84655))) (size!1167 (buf!1524 (_2!2598 lt!85119)))))))

(declare-fun lt!85112 () tuple2!4976)

(declare-fun b!54782 () Bool)

(assert (=> b!54782 (= e!36546 (= (bitStreamReadBitsIntoList!0 (_2!2598 lt!85119) (_1!2599 lt!85112) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2598 lt!85119) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!54782 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54782 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!85096 () Unit!3765)

(declare-fun lt!85102 () Unit!3765)

(assert (=> b!54782 (= lt!85096 lt!85102)))

(declare-fun lt!85117 () (_ BitVec 64))

(assert (=> b!54782 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!85119)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!84655))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!84655))) lt!85117)))

(assert (=> b!54782 (= lt!85102 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2598 lt!84655) (buf!1524 (_2!2598 lt!85119)) lt!85117))))

(declare-fun e!36547 () Bool)

(assert (=> b!54782 e!36547))

(declare-fun res!45700 () Bool)

(assert (=> b!54782 (=> (not res!45700) (not e!36547))))

(assert (=> b!54782 (= res!45700 (and (= (size!1167 (buf!1524 (_2!2598 lt!84655))) (size!1167 (buf!1524 (_2!2598 lt!85119)))) (bvsge lt!85117 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54782 (= lt!85117 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!54782 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54782 (= lt!85112 (reader!0 (_2!2598 lt!84655) (_2!2598 lt!85119)))))

(declare-fun lt!85093 () tuple2!4974)

(declare-fun c!3884 () Bool)

(declare-fun lt!85131 () tuple2!4974)

(declare-fun bm!691 () Bool)

(declare-fun call!696 () tuple2!4976)

(assert (=> bm!691 (= call!696 (reader!0 (ite c!3884 (_2!2598 lt!85093) (_2!2598 lt!84655)) (ite c!3884 (_2!2598 lt!85131) (_2!2598 lt!84655))))))

(declare-fun b!54783 () Bool)

(declare-fun res!45698 () Bool)

(assert (=> b!54783 (=> (not res!45698) (not e!36546))))

(assert (=> b!54783 (= res!45698 (invariant!0 (currentBit!3095 (_2!2598 lt!85119)) (currentByte!3100 (_2!2598 lt!85119)) (size!1167 (buf!1524 (_2!2598 lt!85119)))))))

(declare-fun b!54784 () Bool)

(declare-fun e!36548 () tuple2!4974)

(declare-fun Unit!3769 () Unit!3765)

(assert (=> b!54784 (= e!36548 (tuple2!4975 Unit!3769 (_2!2598 lt!84655)))))

(assert (=> b!54784 (= (size!1167 (buf!1524 (_2!2598 lt!84655))) (size!1167 (buf!1524 (_2!2598 lt!84655))))))

(declare-fun lt!85104 () Unit!3765)

(declare-fun Unit!3770 () Unit!3765)

(assert (=> b!54784 (= lt!85104 Unit!3770)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2022 array!2559 array!2559 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54784 (checkByteArrayBitContent!0 (_2!2598 lt!84655) srcBuffer!2 (_1!2606 (readBits!0 (_1!2599 call!696) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!54785 () Bool)

(declare-fun res!45702 () Bool)

(assert (=> b!54785 (=> (not res!45702) (not e!36546))))

(assert (=> b!54785 (= res!45702 (= (size!1167 (buf!1524 (_2!2598 lt!85119))) (size!1167 (buf!1524 (_2!2598 lt!84655)))))))

(declare-fun b!54786 () Bool)

(assert (=> b!54786 (= e!36547 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!84655))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!84655))) lt!85117))))

(declare-fun d!17430 () Bool)

(assert (=> d!17430 e!36546))

(declare-fun res!45699 () Bool)

(assert (=> d!17430 (=> (not res!45699) (not e!36546))))

(declare-fun lt!85130 () (_ BitVec 64))

(assert (=> d!17430 (= res!45699 (= (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!85119))) (currentByte!3100 (_2!2598 lt!85119)) (currentBit!3095 (_2!2598 lt!85119))) (bvsub lt!85130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17430 (or (= (bvand lt!85130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!85126 () (_ BitVec 64))

(assert (=> d!17430 (= lt!85130 (bvadd lt!85126 to!314))))

(assert (=> d!17430 (or (not (= (bvand lt!85126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!85126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!85126 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17430 (= lt!85126 (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84655))) (currentByte!3100 (_2!2598 lt!84655)) (currentBit!3095 (_2!2598 lt!84655))))))

(assert (=> d!17430 (= lt!85119 e!36548)))

(assert (=> d!17430 (= c!3884 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!85129 () Unit!3765)

(declare-fun lt!85121 () Unit!3765)

(assert (=> d!17430 (= lt!85129 lt!85121)))

(assert (=> d!17430 (isPrefixOf!0 (_2!2598 lt!84655) (_2!2598 lt!84655))))

(assert (=> d!17430 (= lt!85121 (lemmaIsPrefixRefl!0 (_2!2598 lt!84655)))))

(declare-fun lt!85133 () (_ BitVec 64))

(assert (=> d!17430 (= lt!85133 (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84655))) (currentByte!3100 (_2!2598 lt!84655)) (currentBit!3095 (_2!2598 lt!84655))))))

(assert (=> d!17430 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17430 (= (appendBitsMSBFirstLoop!0 (_2!2598 lt!84655) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!85119)))

(declare-fun b!54787 () Bool)

(declare-fun res!45697 () Bool)

(assert (=> b!54787 (=> (not res!45697) (not e!36546))))

(assert (=> b!54787 (= res!45697 (isPrefixOf!0 (_2!2598 lt!84655) (_2!2598 lt!85119)))))

(declare-fun b!54788 () Bool)

(declare-fun Unit!3771 () Unit!3765)

(assert (=> b!54788 (= e!36548 (tuple2!4975 Unit!3771 (_2!2598 lt!85131)))))

(assert (=> b!54788 (= lt!85093 (appendBitFromByte!0 (_2!2598 lt!84655) (select (arr!1707 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!85114 () (_ BitVec 64))

(assert (=> b!54788 (= lt!85114 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85101 () (_ BitVec 64))

(assert (=> b!54788 (= lt!85101 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85103 () Unit!3765)

(assert (=> b!54788 (= lt!85103 (validateOffsetBitsIneqLemma!0 (_2!2598 lt!84655) (_2!2598 lt!85093) lt!85114 lt!85101))))

(assert (=> b!54788 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!85093)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!85093))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!85093))) (bvsub lt!85114 lt!85101))))

(declare-fun lt!85115 () Unit!3765)

(assert (=> b!54788 (= lt!85115 lt!85103)))

(declare-fun lt!85092 () tuple2!4976)

(assert (=> b!54788 (= lt!85092 (reader!0 (_2!2598 lt!84655) (_2!2598 lt!85093)))))

(declare-fun lt!85128 () (_ BitVec 64))

(assert (=> b!54788 (= lt!85128 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85107 () Unit!3765)

(assert (=> b!54788 (= lt!85107 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2598 lt!84655) (buf!1524 (_2!2598 lt!85093)) lt!85128))))

(assert (=> b!54788 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!85093)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!84655))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!84655))) lt!85128)))

(declare-fun lt!85116 () Unit!3765)

(assert (=> b!54788 (= lt!85116 lt!85107)))

(assert (=> b!54788 (= (head!405 (byteArrayBitContentToList!0 (_2!2598 lt!85093) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!405 (bitStreamReadBitsIntoList!0 (_2!2598 lt!85093) (_1!2599 lt!85092) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85123 () Unit!3765)

(declare-fun Unit!3772 () Unit!3765)

(assert (=> b!54788 (= lt!85123 Unit!3772)))

(assert (=> b!54788 (= lt!85131 (appendBitsMSBFirstLoop!0 (_2!2598 lt!85093) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!85113 () Unit!3765)

(assert (=> b!54788 (= lt!85113 (lemmaIsPrefixTransitive!0 (_2!2598 lt!84655) (_2!2598 lt!85093) (_2!2598 lt!85131)))))

(assert (=> b!54788 (isPrefixOf!0 (_2!2598 lt!84655) (_2!2598 lt!85131))))

(declare-fun lt!85099 () Unit!3765)

(assert (=> b!54788 (= lt!85099 lt!85113)))

(assert (=> b!54788 (= (size!1167 (buf!1524 (_2!2598 lt!85131))) (size!1167 (buf!1524 (_2!2598 lt!84655))))))

(declare-fun lt!85108 () Unit!3765)

(declare-fun Unit!3773 () Unit!3765)

(assert (=> b!54788 (= lt!85108 Unit!3773)))

(assert (=> b!54788 (= (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!85131))) (currentByte!3100 (_2!2598 lt!85131)) (currentBit!3095 (_2!2598 lt!85131))) (bvsub (bvadd (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84655))) (currentByte!3100 (_2!2598 lt!84655)) (currentBit!3095 (_2!2598 lt!84655))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85100 () Unit!3765)

(declare-fun Unit!3774 () Unit!3765)

(assert (=> b!54788 (= lt!85100 Unit!3774)))

(assert (=> b!54788 (= (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!85131))) (currentByte!3100 (_2!2598 lt!85131)) (currentBit!3095 (_2!2598 lt!85131))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!85093))) (currentByte!3100 (_2!2598 lt!85093)) (currentBit!3095 (_2!2598 lt!85093))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85125 () Unit!3765)

(declare-fun Unit!3775 () Unit!3765)

(assert (=> b!54788 (= lt!85125 Unit!3775)))

(declare-fun lt!85095 () tuple2!4976)

(assert (=> b!54788 (= lt!85095 (reader!0 (_2!2598 lt!84655) (_2!2598 lt!85131)))))

(declare-fun lt!85120 () (_ BitVec 64))

(assert (=> b!54788 (= lt!85120 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85127 () Unit!3765)

(assert (=> b!54788 (= lt!85127 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2598 lt!84655) (buf!1524 (_2!2598 lt!85131)) lt!85120))))

(assert (=> b!54788 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!85131)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!84655))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!84655))) lt!85120)))

(declare-fun lt!85106 () Unit!3765)

(assert (=> b!54788 (= lt!85106 lt!85127)))

(declare-fun lt!85105 () tuple2!4976)

(assert (=> b!54788 (= lt!85105 call!696)))

(declare-fun lt!85094 () (_ BitVec 64))

(assert (=> b!54788 (= lt!85094 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85122 () Unit!3765)

(assert (=> b!54788 (= lt!85122 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2598 lt!85093) (buf!1524 (_2!2598 lt!85131)) lt!85094))))

(assert (=> b!54788 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!85131)))) ((_ sign_extend 32) (currentByte!3100 (_2!2598 lt!85093))) ((_ sign_extend 32) (currentBit!3095 (_2!2598 lt!85093))) lt!85094)))

(declare-fun lt!85091 () Unit!3765)

(assert (=> b!54788 (= lt!85091 lt!85122)))

(declare-fun lt!85132 () List!586)

(assert (=> b!54788 (= lt!85132 (byteArrayBitContentToList!0 (_2!2598 lt!85131) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!85110 () List!586)

(assert (=> b!54788 (= lt!85110 (byteArrayBitContentToList!0 (_2!2598 lt!85131) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85098 () List!586)

(assert (=> b!54788 (= lt!85098 (bitStreamReadBitsIntoList!0 (_2!2598 lt!85131) (_1!2599 lt!85095) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!85118 () List!586)

(assert (=> b!54788 (= lt!85118 (bitStreamReadBitsIntoList!0 (_2!2598 lt!85131) (_1!2599 lt!85105) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85124 () (_ BitVec 64))

(assert (=> b!54788 (= lt!85124 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85097 () Unit!3765)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2022 BitStream!2022 BitStream!2022 BitStream!2022 (_ BitVec 64) List!586) Unit!3765)

(assert (=> b!54788 (= lt!85097 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2598 lt!85131) (_2!2598 lt!85131) (_1!2599 lt!85095) (_1!2599 lt!85105) lt!85124 lt!85098))))

(declare-fun tail!258 (List!586) List!586)

(assert (=> b!54788 (= (bitStreamReadBitsIntoList!0 (_2!2598 lt!85131) (_1!2599 lt!85105) (bvsub lt!85124 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!258 lt!85098))))

(declare-fun lt!85111 () Unit!3765)

(assert (=> b!54788 (= lt!85111 lt!85097)))

(declare-fun lt!85109 () Unit!3765)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2559 array!2559 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3765)

(assert (=> b!54788 (= lt!85109 (arrayBitRangesEqImpliesEq!0 (buf!1524 (_2!2598 lt!85093)) (buf!1524 (_2!2598 lt!85131)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!85133 (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!85093))) (currentByte!3100 (_2!2598 lt!85093)) (currentBit!3095 (_2!2598 lt!85093)))))))

(declare-fun bitAt!0 (array!2559 (_ BitVec 64)) Bool)

(assert (=> b!54788 (= (bitAt!0 (buf!1524 (_2!2598 lt!85093)) lt!85133) (bitAt!0 (buf!1524 (_2!2598 lt!85131)) lt!85133))))

(declare-fun lt!85090 () Unit!3765)

(assert (=> b!54788 (= lt!85090 lt!85109)))

(assert (= (and d!17430 c!3884) b!54788))

(assert (= (and d!17430 (not c!3884)) b!54784))

(assert (= (or b!54788 b!54784) bm!691))

(assert (= (and d!17430 res!45699) b!54783))

(assert (= (and b!54783 res!45698) b!54781))

(assert (= (and b!54781 res!45701) b!54787))

(assert (= (and b!54787 res!45697) b!54785))

(assert (= (and b!54785 res!45702) b!54782))

(assert (= (and b!54782 res!45700) b!54786))

(declare-fun m!86107 () Bool)

(assert (=> b!54787 m!86107))

(declare-fun m!86109 () Bool)

(assert (=> b!54783 m!86109))

(declare-fun m!86111 () Bool)

(assert (=> b!54788 m!86111))

(declare-fun m!86113 () Bool)

(assert (=> b!54788 m!86113))

(declare-fun m!86115 () Bool)

(assert (=> b!54788 m!86115))

(declare-fun m!86117 () Bool)

(assert (=> b!54788 m!86117))

(declare-fun m!86119 () Bool)

(assert (=> b!54788 m!86119))

(declare-fun m!86121 () Bool)

(assert (=> b!54788 m!86121))

(declare-fun m!86123 () Bool)

(assert (=> b!54788 m!86123))

(declare-fun m!86125 () Bool)

(assert (=> b!54788 m!86125))

(declare-fun m!86127 () Bool)

(assert (=> b!54788 m!86127))

(declare-fun m!86129 () Bool)

(assert (=> b!54788 m!86129))

(declare-fun m!86131 () Bool)

(assert (=> b!54788 m!86131))

(declare-fun m!86133 () Bool)

(assert (=> b!54788 m!86133))

(declare-fun m!86135 () Bool)

(assert (=> b!54788 m!86135))

(declare-fun m!86137 () Bool)

(assert (=> b!54788 m!86137))

(assert (=> b!54788 m!86117))

(declare-fun m!86139 () Bool)

(assert (=> b!54788 m!86139))

(declare-fun m!86141 () Bool)

(assert (=> b!54788 m!86141))

(declare-fun m!86143 () Bool)

(assert (=> b!54788 m!86143))

(declare-fun m!86145 () Bool)

(assert (=> b!54788 m!86145))

(declare-fun m!86147 () Bool)

(assert (=> b!54788 m!86147))

(declare-fun m!86149 () Bool)

(assert (=> b!54788 m!86149))

(declare-fun m!86151 () Bool)

(assert (=> b!54788 m!86151))

(declare-fun m!86153 () Bool)

(assert (=> b!54788 m!86153))

(declare-fun m!86155 () Bool)

(assert (=> b!54788 m!86155))

(declare-fun m!86157 () Bool)

(assert (=> b!54788 m!86157))

(declare-fun m!86159 () Bool)

(assert (=> b!54788 m!86159))

(declare-fun m!86161 () Bool)

(assert (=> b!54788 m!86161))

(declare-fun m!86163 () Bool)

(assert (=> b!54788 m!86163))

(assert (=> b!54788 m!85927))

(declare-fun m!86165 () Bool)

(assert (=> b!54788 m!86165))

(declare-fun m!86167 () Bool)

(assert (=> b!54788 m!86167))

(assert (=> b!54788 m!86155))

(assert (=> b!54788 m!86151))

(assert (=> b!54788 m!86131))

(declare-fun m!86169 () Bool)

(assert (=> b!54788 m!86169))

(declare-fun m!86171 () Bool)

(assert (=> b!54788 m!86171))

(declare-fun m!86173 () Bool)

(assert (=> b!54786 m!86173))

(declare-fun m!86175 () Bool)

(assert (=> d!17430 m!86175))

(assert (=> d!17430 m!85927))

(declare-fun m!86177 () Bool)

(assert (=> d!17430 m!86177))

(declare-fun m!86179 () Bool)

(assert (=> d!17430 m!86179))

(declare-fun m!86181 () Bool)

(assert (=> b!54784 m!86181))

(declare-fun m!86183 () Bool)

(assert (=> b!54784 m!86183))

(declare-fun m!86185 () Bool)

(assert (=> b!54782 m!86185))

(declare-fun m!86187 () Bool)

(assert (=> b!54782 m!86187))

(declare-fun m!86189 () Bool)

(assert (=> b!54782 m!86189))

(declare-fun m!86191 () Bool)

(assert (=> b!54782 m!86191))

(declare-fun m!86193 () Bool)

(assert (=> b!54782 m!86193))

(declare-fun m!86195 () Bool)

(assert (=> bm!691 m!86195))

(assert (=> b!54568 d!17430))

(declare-fun b!54822 () Bool)

(declare-fun res!45732 () Bool)

(declare-fun e!36563 () Bool)

(assert (=> b!54822 (=> (not res!45732) (not e!36563))))

(declare-fun lt!85233 () tuple2!4976)

(assert (=> b!54822 (= res!45732 (isPrefixOf!0 (_1!2599 lt!85233) thiss!1379))))

(declare-fun b!54823 () Bool)

(declare-fun res!45731 () Bool)

(assert (=> b!54823 (=> (not res!45731) (not e!36563))))

(assert (=> b!54823 (= res!45731 (isPrefixOf!0 (_2!2599 lt!85233) (_2!2598 lt!84655)))))

(declare-fun d!17466 () Bool)

(assert (=> d!17466 e!36563))

(declare-fun res!45730 () Bool)

(assert (=> d!17466 (=> (not res!45730) (not e!36563))))

(assert (=> d!17466 (= res!45730 (isPrefixOf!0 (_1!2599 lt!85233) (_2!2599 lt!85233)))))

(declare-fun lt!85238 () BitStream!2022)

(assert (=> d!17466 (= lt!85233 (tuple2!4977 lt!85238 (_2!2598 lt!84655)))))

(declare-fun lt!85248 () Unit!3765)

(declare-fun lt!85242 () Unit!3765)

(assert (=> d!17466 (= lt!85248 lt!85242)))

(assert (=> d!17466 (isPrefixOf!0 lt!85238 (_2!2598 lt!84655))))

(assert (=> d!17466 (= lt!85242 (lemmaIsPrefixTransitive!0 lt!85238 (_2!2598 lt!84655) (_2!2598 lt!84655)))))

(declare-fun lt!85243 () Unit!3765)

(declare-fun lt!85241 () Unit!3765)

(assert (=> d!17466 (= lt!85243 lt!85241)))

(assert (=> d!17466 (isPrefixOf!0 lt!85238 (_2!2598 lt!84655))))

(assert (=> d!17466 (= lt!85241 (lemmaIsPrefixTransitive!0 lt!85238 thiss!1379 (_2!2598 lt!84655)))))

(declare-fun lt!85245 () Unit!3765)

(declare-fun e!36562 () Unit!3765)

(assert (=> d!17466 (= lt!85245 e!36562)))

(declare-fun c!3888 () Bool)

(assert (=> d!17466 (= c!3888 (not (= (size!1167 (buf!1524 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!85230 () Unit!3765)

(declare-fun lt!85236 () Unit!3765)

(assert (=> d!17466 (= lt!85230 lt!85236)))

(assert (=> d!17466 (isPrefixOf!0 (_2!2598 lt!84655) (_2!2598 lt!84655))))

(assert (=> d!17466 (= lt!85236 (lemmaIsPrefixRefl!0 (_2!2598 lt!84655)))))

(declare-fun lt!85231 () Unit!3765)

(declare-fun lt!85249 () Unit!3765)

(assert (=> d!17466 (= lt!85231 lt!85249)))

(assert (=> d!17466 (= lt!85249 (lemmaIsPrefixRefl!0 (_2!2598 lt!84655)))))

(declare-fun lt!85235 () Unit!3765)

(declare-fun lt!85246 () Unit!3765)

(assert (=> d!17466 (= lt!85235 lt!85246)))

(assert (=> d!17466 (isPrefixOf!0 lt!85238 lt!85238)))

(assert (=> d!17466 (= lt!85246 (lemmaIsPrefixRefl!0 lt!85238))))

(declare-fun lt!85234 () Unit!3765)

(declare-fun lt!85247 () Unit!3765)

(assert (=> d!17466 (= lt!85234 lt!85247)))

(assert (=> d!17466 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17466 (= lt!85247 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17466 (= lt!85238 (BitStream!2023 (buf!1524 (_2!2598 lt!84655)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)))))

(assert (=> d!17466 (isPrefixOf!0 thiss!1379 (_2!2598 lt!84655))))

(assert (=> d!17466 (= (reader!0 thiss!1379 (_2!2598 lt!84655)) lt!85233)))

(declare-fun b!54824 () Bool)

(declare-fun lt!85240 () Unit!3765)

(assert (=> b!54824 (= e!36562 lt!85240)))

(declare-fun lt!85237 () (_ BitVec 64))

(assert (=> b!54824 (= lt!85237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85239 () (_ BitVec 64))

(assert (=> b!54824 (= lt!85239 (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2559 array!2559 (_ BitVec 64) (_ BitVec 64)) Unit!3765)

(assert (=> b!54824 (= lt!85240 (arrayBitRangesEqSymmetric!0 (buf!1524 thiss!1379) (buf!1524 (_2!2598 lt!84655)) lt!85237 lt!85239))))

(assert (=> b!54824 (arrayBitRangesEq!0 (buf!1524 (_2!2598 lt!84655)) (buf!1524 thiss!1379) lt!85237 lt!85239)))

(declare-fun lt!85232 () (_ BitVec 64))

(declare-fun b!54825 () Bool)

(declare-fun lt!85244 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2022 (_ BitVec 64)) BitStream!2022)

(assert (=> b!54825 (= e!36563 (= (_1!2599 lt!85233) (withMovedBitIndex!0 (_2!2599 lt!85233) (bvsub lt!85232 lt!85244))))))

(assert (=> b!54825 (or (= (bvand lt!85232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85244 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85232 lt!85244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54825 (= lt!85244 (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84655))) (currentByte!3100 (_2!2598 lt!84655)) (currentBit!3095 (_2!2598 lt!84655))))))

(assert (=> b!54825 (= lt!85232 (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)))))

(declare-fun b!54826 () Bool)

(declare-fun Unit!3783 () Unit!3765)

(assert (=> b!54826 (= e!36562 Unit!3783)))

(assert (= (and d!17466 c!3888) b!54824))

(assert (= (and d!17466 (not c!3888)) b!54826))

(assert (= (and d!17466 res!45730) b!54822))

(assert (= (and b!54822 res!45732) b!54823))

(assert (= (and b!54823 res!45731) b!54825))

(assert (=> d!17466 m!85847))

(declare-fun m!86291 () Bool)

(assert (=> d!17466 m!86291))

(declare-fun m!86293 () Bool)

(assert (=> d!17466 m!86293))

(declare-fun m!86295 () Bool)

(assert (=> d!17466 m!86295))

(declare-fun m!86297 () Bool)

(assert (=> d!17466 m!86297))

(assert (=> d!17466 m!85849))

(declare-fun m!86299 () Bool)

(assert (=> d!17466 m!86299))

(assert (=> d!17466 m!85857))

(declare-fun m!86301 () Bool)

(assert (=> d!17466 m!86301))

(assert (=> d!17466 m!86177))

(assert (=> d!17466 m!86179))

(assert (=> b!54824 m!85851))

(declare-fun m!86303 () Bool)

(assert (=> b!54824 m!86303))

(declare-fun m!86305 () Bool)

(assert (=> b!54824 m!86305))

(declare-fun m!86307 () Bool)

(assert (=> b!54823 m!86307))

(declare-fun m!86309 () Bool)

(assert (=> b!54825 m!86309))

(assert (=> b!54825 m!85927))

(assert (=> b!54825 m!85851))

(declare-fun m!86311 () Bool)

(assert (=> b!54822 m!86311))

(assert (=> b!54568 d!17466))

(declare-fun d!17474 () Bool)

(assert (=> d!17474 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 thiss!1379)) ((_ sign_extend 32) (currentBit!3095 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 thiss!1379)) ((_ sign_extend 32) (currentBit!3095 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4399 () Bool)

(assert (= bs!4399 d!17474))

(declare-fun m!86313 () Bool)

(assert (=> bs!4399 m!86313))

(assert (=> b!54568 d!17474))

(declare-fun d!17476 () Bool)

(declare-fun res!45733 () Bool)

(declare-fun e!36564 () Bool)

(assert (=> d!17476 (=> (not res!45733) (not e!36564))))

(assert (=> d!17476 (= res!45733 (= (size!1167 (buf!1524 (_2!2598 lt!84655))) (size!1167 (buf!1524 (_2!2598 lt!84660)))))))

(assert (=> d!17476 (= (isPrefixOf!0 (_2!2598 lt!84655) (_2!2598 lt!84660)) e!36564)))

(declare-fun b!54827 () Bool)

(declare-fun res!45734 () Bool)

(assert (=> b!54827 (=> (not res!45734) (not e!36564))))

(assert (=> b!54827 (= res!45734 (bvsle (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84655))) (currentByte!3100 (_2!2598 lt!84655)) (currentBit!3095 (_2!2598 lt!84655))) (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84660))) (currentByte!3100 (_2!2598 lt!84660)) (currentBit!3095 (_2!2598 lt!84660)))))))

(declare-fun b!54828 () Bool)

(declare-fun e!36565 () Bool)

(assert (=> b!54828 (= e!36564 e!36565)))

(declare-fun res!45735 () Bool)

(assert (=> b!54828 (=> res!45735 e!36565)))

(assert (=> b!54828 (= res!45735 (= (size!1167 (buf!1524 (_2!2598 lt!84655))) #b00000000000000000000000000000000))))

(declare-fun b!54829 () Bool)

(assert (=> b!54829 (= e!36565 (arrayBitRangesEq!0 (buf!1524 (_2!2598 lt!84655)) (buf!1524 (_2!2598 lt!84660)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84655))) (currentByte!3100 (_2!2598 lt!84655)) (currentBit!3095 (_2!2598 lt!84655)))))))

(assert (= (and d!17476 res!45733) b!54827))

(assert (= (and b!54827 res!45734) b!54828))

(assert (= (and b!54828 (not res!45735)) b!54829))

(assert (=> b!54827 m!85927))

(declare-fun m!86315 () Bool)

(assert (=> b!54827 m!86315))

(assert (=> b!54829 m!85927))

(assert (=> b!54829 m!85927))

(declare-fun m!86317 () Bool)

(assert (=> b!54829 m!86317))

(assert (=> b!54568 d!17476))

(declare-fun d!17478 () Bool)

(assert (=> d!17478 (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 (_2!2598 lt!84655)))) ((_ sign_extend 32) (currentByte!3100 thiss!1379)) ((_ sign_extend 32) (currentBit!3095 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85252 () Unit!3765)

(declare-fun choose!9 (BitStream!2022 array!2559 (_ BitVec 64) BitStream!2022) Unit!3765)

(assert (=> d!17478 (= lt!85252 (choose!9 thiss!1379 (buf!1524 (_2!2598 lt!84655)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2023 (buf!1524 (_2!2598 lt!84655)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379))))))

(assert (=> d!17478 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1524 (_2!2598 lt!84655)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!85252)))

(declare-fun bs!4400 () Bool)

(assert (= bs!4400 d!17478))

(assert (=> bs!4400 m!85875))

(declare-fun m!86319 () Bool)

(assert (=> bs!4400 m!86319))

(assert (=> b!54568 d!17478))

(declare-fun d!17480 () Bool)

(declare-fun res!45736 () Bool)

(declare-fun e!36566 () Bool)

(assert (=> d!17480 (=> (not res!45736) (not e!36566))))

(assert (=> d!17480 (= res!45736 (= (size!1167 (buf!1524 thiss!1379)) (size!1167 (buf!1524 (_2!2598 lt!84660)))))))

(assert (=> d!17480 (= (isPrefixOf!0 thiss!1379 (_2!2598 lt!84660)) e!36566)))

(declare-fun b!54830 () Bool)

(declare-fun res!45737 () Bool)

(assert (=> b!54830 (=> (not res!45737) (not e!36566))))

(assert (=> b!54830 (= res!45737 (bvsle (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)) (bitIndex!0 (size!1167 (buf!1524 (_2!2598 lt!84660))) (currentByte!3100 (_2!2598 lt!84660)) (currentBit!3095 (_2!2598 lt!84660)))))))

(declare-fun b!54831 () Bool)

(declare-fun e!36567 () Bool)

(assert (=> b!54831 (= e!36566 e!36567)))

(declare-fun res!45738 () Bool)

(assert (=> b!54831 (=> res!45738 e!36567)))

(assert (=> b!54831 (= res!45738 (= (size!1167 (buf!1524 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54832 () Bool)

(assert (=> b!54832 (= e!36567 (arrayBitRangesEq!0 (buf!1524 thiss!1379) (buf!1524 (_2!2598 lt!84660)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379))))))

(assert (= (and d!17480 res!45736) b!54830))

(assert (= (and b!54830 res!45737) b!54831))

(assert (= (and b!54831 (not res!45738)) b!54832))

(assert (=> b!54830 m!85851))

(assert (=> b!54830 m!86315))

(assert (=> b!54832 m!85851))

(assert (=> b!54832 m!85851))

(declare-fun m!86321 () Bool)

(assert (=> b!54832 m!86321))

(assert (=> b!54568 d!17480))

(declare-fun d!17482 () Bool)

(assert (=> d!17482 (isPrefixOf!0 thiss!1379 (_2!2598 lt!84660))))

(declare-fun lt!85259 () Unit!3765)

(declare-fun choose!30 (BitStream!2022 BitStream!2022 BitStream!2022) Unit!3765)

(assert (=> d!17482 (= lt!85259 (choose!30 thiss!1379 (_2!2598 lt!84655) (_2!2598 lt!84660)))))

(assert (=> d!17482 (isPrefixOf!0 thiss!1379 (_2!2598 lt!84655))))

(assert (=> d!17482 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2598 lt!84655) (_2!2598 lt!84660)) lt!85259)))

(declare-fun bs!4401 () Bool)

(assert (= bs!4401 d!17482))

(assert (=> bs!4401 m!85873))

(declare-fun m!86323 () Bool)

(assert (=> bs!4401 m!86323))

(assert (=> bs!4401 m!85857))

(assert (=> b!54568 d!17482))

(declare-fun d!17484 () Bool)

(assert (=> d!17484 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1167 (buf!1524 thiss!1379))) ((_ sign_extend 32) (currentByte!3100 thiss!1379)) ((_ sign_extend 32) (currentBit!3095 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1167 (buf!1524 thiss!1379))) ((_ sign_extend 32) (currentByte!3100 thiss!1379)) ((_ sign_extend 32) (currentBit!3095 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4402 () Bool)

(assert (= bs!4402 d!17484))

(declare-fun m!86325 () Bool)

(assert (=> bs!4402 m!86325))

(assert (=> b!54563 d!17484))

(declare-fun d!17486 () Bool)

(declare-fun res!45739 () Bool)

(declare-fun e!36568 () Bool)

(assert (=> d!17486 (=> (not res!45739) (not e!36568))))

(assert (=> d!17486 (= res!45739 (= (size!1167 (buf!1524 thiss!1379)) (size!1167 (buf!1524 thiss!1379))))))

(assert (=> d!17486 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36568)))

(declare-fun b!54833 () Bool)

(declare-fun res!45740 () Bool)

(assert (=> b!54833 (=> (not res!45740) (not e!36568))))

(assert (=> b!54833 (= res!45740 (bvsle (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)) (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379))))))

(declare-fun b!54834 () Bool)

(declare-fun e!36569 () Bool)

(assert (=> b!54834 (= e!36568 e!36569)))

(declare-fun res!45741 () Bool)

(assert (=> b!54834 (=> res!45741 e!36569)))

(assert (=> b!54834 (= res!45741 (= (size!1167 (buf!1524 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54835 () Bool)

(assert (=> b!54835 (= e!36569 (arrayBitRangesEq!0 (buf!1524 thiss!1379) (buf!1524 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379))))))

(assert (= (and d!17486 res!45739) b!54833))

(assert (= (and b!54833 res!45740) b!54834))

(assert (= (and b!54834 (not res!45741)) b!54835))

(assert (=> b!54833 m!85851))

(assert (=> b!54833 m!85851))

(assert (=> b!54835 m!85851))

(assert (=> b!54835 m!85851))

(declare-fun m!86327 () Bool)

(assert (=> b!54835 m!86327))

(assert (=> b!54564 d!17486))

(declare-fun d!17488 () Bool)

(assert (=> d!17488 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!85308 () Unit!3765)

(declare-fun choose!11 (BitStream!2022) Unit!3765)

(assert (=> d!17488 (= lt!85308 (choose!11 thiss!1379))))

(assert (=> d!17488 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!85308)))

(declare-fun bs!4404 () Bool)

(assert (= bs!4404 d!17488))

(assert (=> bs!4404 m!85847))

(declare-fun m!86329 () Bool)

(assert (=> bs!4404 m!86329))

(assert (=> b!54564 d!17488))

(declare-fun d!17490 () Bool)

(declare-fun e!36587 () Bool)

(assert (=> d!17490 e!36587))

(declare-fun res!45768 () Bool)

(assert (=> d!17490 (=> (not res!45768) (not e!36587))))

(declare-fun lt!85419 () (_ BitVec 64))

(declare-fun lt!85421 () (_ BitVec 64))

(declare-fun lt!85420 () (_ BitVec 64))

(assert (=> d!17490 (= res!45768 (= lt!85420 (bvsub lt!85419 lt!85421)))))

(assert (=> d!17490 (or (= (bvand lt!85419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85419 lt!85421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17490 (= lt!85421 (remainingBits!0 ((_ sign_extend 32) (size!1167 (buf!1524 thiss!1379))) ((_ sign_extend 32) (currentByte!3100 thiss!1379)) ((_ sign_extend 32) (currentBit!3095 thiss!1379))))))

(declare-fun lt!85424 () (_ BitVec 64))

(declare-fun lt!85423 () (_ BitVec 64))

(assert (=> d!17490 (= lt!85419 (bvmul lt!85424 lt!85423))))

(assert (=> d!17490 (or (= lt!85424 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!85423 (bvsdiv (bvmul lt!85424 lt!85423) lt!85424)))))

(assert (=> d!17490 (= lt!85423 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17490 (= lt!85424 ((_ sign_extend 32) (size!1167 (buf!1524 thiss!1379))))))

(assert (=> d!17490 (= lt!85420 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3100 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3095 thiss!1379))))))

(assert (=> d!17490 (invariant!0 (currentBit!3095 thiss!1379) (currentByte!3100 thiss!1379) (size!1167 (buf!1524 thiss!1379)))))

(assert (=> d!17490 (= (bitIndex!0 (size!1167 (buf!1524 thiss!1379)) (currentByte!3100 thiss!1379) (currentBit!3095 thiss!1379)) lt!85420)))

(declare-fun b!54877 () Bool)

(declare-fun res!45767 () Bool)

(assert (=> b!54877 (=> (not res!45767) (not e!36587))))

(assert (=> b!54877 (= res!45767 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!85420))))

(declare-fun b!54878 () Bool)

(declare-fun lt!85422 () (_ BitVec 64))

(assert (=> b!54878 (= e!36587 (bvsle lt!85420 (bvmul lt!85422 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!54878 (or (= lt!85422 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!85422 #b0000000000000000000000000000000000000000000000000000000000001000) lt!85422)))))

(assert (=> b!54878 (= lt!85422 ((_ sign_extend 32) (size!1167 (buf!1524 thiss!1379))))))

(assert (= (and d!17490 res!45768) b!54877))

(assert (= (and b!54877 res!45767) b!54878))

(assert (=> d!17490 m!86325))

(assert (=> d!17490 m!86001))

(assert (=> b!54564 d!17490))

(declare-fun d!17502 () Bool)

(assert (=> d!17502 (= (head!405 (byteArrayBitContentToList!0 (_2!2598 lt!84655) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!701 (byteArrayBitContentToList!0 (_2!2598 lt!84655) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54566 d!17502))

(declare-fun d!17504 () Bool)

(declare-fun c!3899 () Bool)

(assert (=> d!17504 (= c!3899 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36590 () List!586)

(assert (=> d!17504 (= (byteArrayBitContentToList!0 (_2!2598 lt!84655) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!36590)))

(declare-fun b!54883 () Bool)

(assert (=> b!54883 (= e!36590 Nil!583)))

(declare-fun b!54884 () Bool)

(assert (=> b!54884 (= e!36590 (Cons!582 (not (= (bvand ((_ sign_extend 24) (select (arr!1707 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2598 lt!84655) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17504 c!3899) b!54883))

(assert (= (and d!17504 (not c!3899)) b!54884))

(assert (=> b!54884 m!85859))

(assert (=> b!54884 m!85987))

(declare-fun m!86355 () Bool)

(assert (=> b!54884 m!86355))

(assert (=> b!54566 d!17504))

(declare-fun d!17506 () Bool)

(assert (=> d!17506 (= (head!405 (bitStreamReadBitsIntoList!0 (_2!2598 lt!84655) (_1!2599 lt!84658) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!701 (bitStreamReadBitsIntoList!0 (_2!2598 lt!84655) (_1!2599 lt!84658) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54566 d!17506))

(declare-fun b!54915 () Bool)

(declare-fun e!36604 () Bool)

(declare-fun lt!85486 () List!586)

(declare-fun isEmpty!157 (List!586) Bool)

(assert (=> b!54915 (= e!36604 (isEmpty!157 lt!85486))))

(declare-fun lt!85484 () (_ BitVec 64))

(declare-fun b!54914 () Bool)

(declare-datatypes ((tuple2!4998 0))(
  ( (tuple2!4999 (_1!2610 Bool) (_2!2610 BitStream!2022)) )
))
(declare-fun lt!85485 () tuple2!4998)

(declare-datatypes ((tuple2!5000 0))(
  ( (tuple2!5001 (_1!2611 List!586) (_2!2611 BitStream!2022)) )
))
(declare-fun e!36605 () tuple2!5000)

(assert (=> b!54914 (= e!36605 (tuple2!5001 (Cons!582 (_1!2610 lt!85485) (bitStreamReadBitsIntoList!0 (_2!2598 lt!84655) (_2!2610 lt!85485) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!85484))) (_2!2610 lt!85485)))))

(declare-fun readBit!0 (BitStream!2022) tuple2!4998)

(assert (=> b!54914 (= lt!85485 (readBit!0 (_1!2599 lt!84658)))))

(assert (=> b!54914 (= lt!85484 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!17508 () Bool)

(assert (=> d!17508 e!36604))

(declare-fun c!3911 () Bool)

(assert (=> d!17508 (= c!3911 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17508 (= lt!85486 (_1!2611 e!36605))))

(declare-fun c!3912 () Bool)

(assert (=> d!17508 (= c!3912 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17508 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17508 (= (bitStreamReadBitsIntoList!0 (_2!2598 lt!84655) (_1!2599 lt!84658) #b0000000000000000000000000000000000000000000000000000000000000001) lt!85486)))

(declare-fun b!54916 () Bool)

(declare-fun length!272 (List!586) Int)

(assert (=> b!54916 (= e!36604 (> (length!272 lt!85486) 0))))

(declare-fun b!54913 () Bool)

(assert (=> b!54913 (= e!36605 (tuple2!5001 Nil!583 (_1!2599 lt!84658)))))

(assert (= (and d!17508 c!3912) b!54913))

(assert (= (and d!17508 (not c!3912)) b!54914))

(assert (= (and d!17508 c!3911) b!54915))

(assert (= (and d!17508 (not c!3911)) b!54916))

(declare-fun m!86451 () Bool)

(assert (=> b!54915 m!86451))

(declare-fun m!86453 () Bool)

(assert (=> b!54914 m!86453))

(declare-fun m!86455 () Bool)

(assert (=> b!54914 m!86455))

(declare-fun m!86457 () Bool)

(assert (=> b!54916 m!86457))

(assert (=> b!54566 d!17508))

(check-sat (not b!54832) (not b!54670) (not b!54782) (not b!54833) (not b!54827) (not b!54598) (not b!54596) (not b!54835) (not b!54601) (not b!54825) (not b!54677) (not b!54783) (not b!54884) (not d!17478) (not b!54830) (not d!17428) (not b!54676) (not b!54823) (not b!54788) (not d!17482) (not b!54671) (not bm!691) (not b!54824) (not d!17466) (not b!54672) (not b!54675) (not d!17488) (not b!54914) (not b!54822) (not b!54674) (not d!17382) (not b!54784) (not d!17484) (not b!54787) (not d!17490) (not d!17386) (not b!54786) (not b!54829) (not b!54915) (not d!17474) (not d!17384) (not b!54916) (not b!54673) (not d!17430))

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65744 () Bool)

(assert start!65744)

(declare-fun b!294949 () Bool)

(declare-fun res!243540 () Bool)

(declare-fun e!210911 () Bool)

(assert (=> b!294949 (=> (not res!243540) (not e!210911))))

(declare-datatypes ((array!17676 0))(
  ( (array!17677 (arr!8700 (Array (_ BitVec 32) (_ BitVec 8))) (size!7662 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13328 0))(
  ( (BitStream!13329 (buf!7725 array!17676) (currentByte!14222 (_ BitVec 32)) (currentBit!14217 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13328)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294949 (= res!243540 (validate_offset_bits!1 ((_ sign_extend 32) (size!7662 (buf!7725 thiss!1728))) ((_ sign_extend 32) (currentByte!14222 thiss!1728)) ((_ sign_extend 32) (currentBit!14217 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!243542 () Bool)

(assert (=> start!65744 (=> (not res!243542) (not e!210911))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17676)

(assert (=> start!65744 (= res!243542 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7662 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65744 e!210911))

(declare-fun e!210907 () Bool)

(declare-fun inv!12 (BitStream!13328) Bool)

(assert (=> start!65744 (and (inv!12 thiss!1728) e!210907)))

(assert (=> start!65744 true))

(declare-fun array_inv!7274 (array!17676) Bool)

(assert (=> start!65744 (array_inv!7274 arr!273)))

(declare-fun b!294950 () Bool)

(assert (=> b!294950 (= e!210907 (array_inv!7274 (buf!7725 thiss!1728)))))

(declare-fun e!210908 () Bool)

(declare-fun b!294951 () Bool)

(declare-datatypes ((Unit!20561 0))(
  ( (Unit!20562) )
))
(declare-datatypes ((tuple3!1840 0))(
  ( (tuple3!1841 (_1!12963 Unit!20561) (_2!12963 BitStream!13328) (_3!1358 array!17676)) )
))
(declare-fun lt!428548 () tuple3!1840)

(assert (=> b!294951 (= e!210908 (and (= (buf!7725 thiss!1728) (buf!7725 (_2!12963 lt!428548))) (= (size!7662 arr!273) (size!7662 (_3!1358 lt!428548)))))))

(declare-fun b!294952 () Bool)

(declare-fun res!243538 () Bool)

(assert (=> b!294952 (=> (not res!243538) (not e!210911))))

(assert (=> b!294952 (= res!243538 (bvslt from!505 to!474))))

(declare-fun lt!428550 () array!17676)

(declare-fun e!210909 () Bool)

(declare-fun b!294953 () Bool)

(declare-fun arrayBitRangesEq!0 (array!17676 array!17676 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294953 (= e!210909 (arrayBitRangesEq!0 lt!428550 (_3!1358 lt!428548) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294954 () Bool)

(assert (=> b!294954 (= e!210911 (not e!210909))))

(declare-fun res!243541 () Bool)

(assert (=> b!294954 (=> res!243541 e!210909)))

(assert (=> b!294954 (= res!243541 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7662 arr!273)))) (bvsge from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(assert (=> b!294954 (arrayBitRangesEq!0 arr!273 (_3!1358 lt!428548) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428549 () Unit!20561)

(declare-fun arrayBitRangesEqTransitive!0 (array!17676 array!17676 array!17676 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20561)

(assert (=> b!294954 (= lt!428549 (arrayBitRangesEqTransitive!0 arr!273 lt!428550 (_3!1358 lt!428548) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294954 (arrayBitRangesEq!0 arr!273 lt!428550 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23210 0))(
  ( (tuple2!23211 (_1!12964 Bool) (_2!12964 BitStream!13328)) )
))
(declare-fun lt!428545 () tuple2!23210)

(declare-fun lt!428543 () Unit!20561)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17676 (_ BitVec 64) Bool) Unit!20561)

(assert (=> b!294954 (= lt!428543 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12964 lt!428545)))))

(assert (=> b!294954 e!210908))

(declare-fun res!243539 () Bool)

(assert (=> b!294954 (=> (not res!243539) (not e!210908))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294954 (= res!243539 (= (bvsub (bvadd (bitIndex!0 (size!7662 (buf!7725 thiss!1728)) (currentByte!14222 thiss!1728) (currentBit!14217 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7662 (buf!7725 (_2!12963 lt!428548))) (currentByte!14222 (_2!12963 lt!428548)) (currentBit!14217 (_2!12963 lt!428548)))))))

(declare-fun readBitsLoop!0 (BitStream!13328 (_ BitVec 64) array!17676 (_ BitVec 64) (_ BitVec 64)) tuple3!1840)

(assert (=> b!294954 (= lt!428548 (readBitsLoop!0 (_2!12964 lt!428545) nBits!523 lt!428550 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294954 (validate_offset_bits!1 ((_ sign_extend 32) (size!7662 (buf!7725 (_2!12964 lt!428545)))) ((_ sign_extend 32) (currentByte!14222 (_2!12964 lt!428545))) ((_ sign_extend 32) (currentBit!14217 (_2!12964 lt!428545))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428544 () Unit!20561)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13328 BitStream!13328 (_ BitVec 64) (_ BitVec 64)) Unit!20561)

(assert (=> b!294954 (= lt!428544 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12964 lt!428545) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428547 () (_ BitVec 32))

(declare-fun lt!428546 () (_ BitVec 32))

(assert (=> b!294954 (= lt!428550 (array!17677 (store (arr!8700 arr!273) lt!428547 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8700 arr!273) lt!428547)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428546)))) ((_ sign_extend 24) (ite (_1!12964 lt!428545) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428546) #b00000000))))) (size!7662 arr!273)))))

(assert (=> b!294954 (= lt!428546 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294954 (= lt!428547 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13328) tuple2!23210)

(assert (=> b!294954 (= lt!428545 (readBit!0 thiss!1728))))

(assert (= (and start!65744 res!243542) b!294949))

(assert (= (and b!294949 res!243540) b!294952))

(assert (= (and b!294952 res!243538) b!294954))

(assert (= (and b!294954 res!243539) b!294951))

(assert (= (and b!294954 (not res!243541)) b!294953))

(assert (= start!65744 b!294950))

(declare-fun m!431761 () Bool)

(assert (=> b!294949 m!431761))

(declare-fun m!431763 () Bool)

(assert (=> start!65744 m!431763))

(declare-fun m!431765 () Bool)

(assert (=> start!65744 m!431765))

(declare-fun m!431767 () Bool)

(assert (=> b!294953 m!431767))

(declare-fun m!431769 () Bool)

(assert (=> b!294954 m!431769))

(declare-fun m!431771 () Bool)

(assert (=> b!294954 m!431771))

(declare-fun m!431773 () Bool)

(assert (=> b!294954 m!431773))

(declare-fun m!431775 () Bool)

(assert (=> b!294954 m!431775))

(declare-fun m!431777 () Bool)

(assert (=> b!294954 m!431777))

(declare-fun m!431779 () Bool)

(assert (=> b!294954 m!431779))

(declare-fun m!431781 () Bool)

(assert (=> b!294954 m!431781))

(declare-fun m!431783 () Bool)

(assert (=> b!294954 m!431783))

(declare-fun m!431785 () Bool)

(assert (=> b!294954 m!431785))

(declare-fun m!431787 () Bool)

(assert (=> b!294954 m!431787))

(declare-fun m!431789 () Bool)

(assert (=> b!294954 m!431789))

(declare-fun m!431791 () Bool)

(assert (=> b!294954 m!431791))

(declare-fun m!431793 () Bool)

(assert (=> b!294954 m!431793))

(declare-fun m!431795 () Bool)

(assert (=> b!294950 m!431795))

(push 1)

(assert (not b!294953))

(assert (not b!294949))

(assert (not b!294954))

(assert (not start!65744))

(assert (not b!294950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!295017 () Bool)

(declare-fun e!210964 () Bool)

(declare-fun e!210967 () Bool)

(assert (=> b!295017 (= e!210964 e!210967)))

(declare-fun res!243593 () Bool)

(assert (=> b!295017 (=> (not res!243593) (not e!210967))))

(declare-fun e!210968 () Bool)

(assert (=> b!295017 (= res!243593 e!210968)))

(declare-fun res!243591 () Bool)

(assert (=> b!295017 (=> res!243591 e!210968)))

(declare-datatypes ((tuple4!878 0))(
  ( (tuple4!879 (_1!12967 (_ BitVec 32)) (_2!12967 (_ BitVec 32)) (_3!1360 (_ BitVec 32)) (_4!439 (_ BitVec 32))) )
))
(declare-fun lt!428609 () tuple4!878)

(assert (=> b!295017 (= res!243591 (bvsge (_1!12967 lt!428609) (_2!12967 lt!428609)))))

(declare-fun lt!428608 () (_ BitVec 32))

(assert (=> b!295017 (= lt!428608 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428610 () (_ BitVec 32))

(assert (=> b!295017 (= lt!428610 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!878)

(assert (=> b!295017 (= lt!428609 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!295018 () Bool)

(declare-fun e!210966 () Bool)

(assert (=> b!295018 (= e!210967 e!210966)))

(declare-fun c!13436 () Bool)

(assert (=> b!295018 (= c!13436 (= (_3!1360 lt!428609) (_4!439 lt!428609)))))

(declare-fun bm!5035 () Bool)

(declare-fun call!5038 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5035 (= call!5038 (byteRangesEq!0 (select (arr!8700 lt!428550) (_3!1360 lt!428609)) (select (arr!8700 (_3!1358 lt!428548)) (_3!1360 lt!428609)) lt!428610 (ite c!13436 lt!428608 #b00000000000000000000000000001000)))))

(declare-fun b!295019 () Bool)

(declare-fun arrayRangesEq!1497 (array!17676 array!17676 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295019 (= e!210968 (arrayRangesEq!1497 lt!428550 (_3!1358 lt!428548) (_1!12967 lt!428609) (_2!12967 lt!428609)))))

(declare-fun b!295020 () Bool)

(assert (=> b!295020 (= e!210966 call!5038)))

(declare-fun d!99448 () Bool)

(declare-fun res!243594 () Bool)

(assert (=> d!99448 (=> res!243594 e!210964)))

(assert (=> d!99448 (= res!243594 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99448 (= (arrayBitRangesEq!0 lt!428550 (_3!1358 lt!428548) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) e!210964)))

(declare-fun b!295021 () Bool)

(declare-fun e!210965 () Bool)

(assert (=> b!295021 (= e!210965 (byteRangesEq!0 (select (arr!8700 lt!428550) (_4!439 lt!428609)) (select (arr!8700 (_3!1358 lt!428548)) (_4!439 lt!428609)) #b00000000000000000000000000000000 lt!428608))))

(declare-fun b!295022 () Bool)

(declare-fun res!243592 () Bool)

(assert (=> b!295022 (= res!243592 (= lt!428608 #b00000000000000000000000000000000))))

(assert (=> b!295022 (=> res!243592 e!210965)))

(declare-fun e!210969 () Bool)

(assert (=> b!295022 (= e!210969 e!210965)))

(declare-fun b!295023 () Bool)

(assert (=> b!295023 (= e!210966 e!210969)))

(declare-fun res!243590 () Bool)

(assert (=> b!295023 (= res!243590 call!5038)))

(assert (=> b!295023 (=> (not res!243590) (not e!210969))))

(assert (= (and d!99448 (not res!243594)) b!295017))

(assert (= (and b!295017 (not res!243591)) b!295019))

(assert (= (and b!295017 res!243593) b!295018))

(assert (= (and b!295018 c!13436) b!295020))

(assert (= (and b!295018 (not c!13436)) b!295023))

(assert (= (and b!295023 res!243590) b!295022))

(assert (= (and b!295022 (not res!243592)) b!295021))

(assert (= (or b!295020 b!295023) bm!5035))

(declare-fun m!431865 () Bool)

(assert (=> b!295017 m!431865))

(declare-fun m!431867 () Bool)

(assert (=> bm!5035 m!431867))

(declare-fun m!431869 () Bool)

(assert (=> bm!5035 m!431869))

(assert (=> bm!5035 m!431867))

(assert (=> bm!5035 m!431869))

(declare-fun m!431871 () Bool)

(assert (=> bm!5035 m!431871))

(declare-fun m!431873 () Bool)

(assert (=> b!295019 m!431873))

(declare-fun m!431875 () Bool)

(assert (=> b!295021 m!431875))

(declare-fun m!431877 () Bool)

(assert (=> b!295021 m!431877))

(assert (=> b!295021 m!431875))

(assert (=> b!295021 m!431877))

(declare-fun m!431879 () Bool)

(assert (=> b!295021 m!431879))

(assert (=> b!294953 d!99448))

(declare-fun d!99450 () Bool)

(assert (=> d!99450 (= (array_inv!7274 (buf!7725 thiss!1728)) (bvsge (size!7662 (buf!7725 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!294950 d!99450))

(declare-fun d!99452 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99452 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7662 (buf!7725 thiss!1728))) ((_ sign_extend 32) (currentByte!14222 thiss!1728)) ((_ sign_extend 32) (currentBit!14217 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7662 (buf!7725 thiss!1728))) ((_ sign_extend 32) (currentByte!14222 thiss!1728)) ((_ sign_extend 32) (currentBit!14217 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25439 () Bool)

(assert (= bs!25439 d!99452))

(declare-fun m!431881 () Bool)

(assert (=> bs!25439 m!431881))

(assert (=> b!294949 d!99452))

(declare-fun d!99454 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99454 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14217 thiss!1728) (currentByte!14222 thiss!1728) (size!7662 (buf!7725 thiss!1728))))))

(declare-fun bs!25440 () Bool)

(assert (= bs!25440 d!99454))

(declare-fun m!431883 () Bool)

(assert (=> bs!25440 m!431883))

(assert (=> start!65744 d!99454))

(declare-fun d!99456 () Bool)

(assert (=> d!99456 (= (array_inv!7274 arr!273) (bvsge (size!7662 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65744 d!99456))

(declare-fun d!99458 () Bool)

(assert (=> d!99458 (arrayBitRangesEq!0 arr!273 (_3!1358 lt!428548) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428613 () Unit!20561)

(declare-fun choose!49 (array!17676 array!17676 array!17676 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20561)

(assert (=> d!99458 (= lt!428613 (choose!49 arr!273 lt!428550 (_3!1358 lt!428548) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99458 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99458 (= (arrayBitRangesEqTransitive!0 arr!273 lt!428550 (_3!1358 lt!428548) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!428613)))

(declare-fun bs!25441 () Bool)

(assert (= bs!25441 d!99458))

(assert (=> bs!25441 m!431789))

(declare-fun m!431885 () Bool)

(assert (=> bs!25441 m!431885))

(assert (=> b!294954 d!99458))

(declare-fun d!99460 () Bool)

(declare-fun e!210972 () Bool)

(assert (=> d!99460 e!210972))

(declare-fun res!243600 () Bool)

(assert (=> d!99460 (=> (not res!243600) (not e!210972))))

(declare-fun lt!428631 () (_ BitVec 64))

(declare-fun lt!428627 () (_ BitVec 64))

(declare-fun lt!428628 () (_ BitVec 64))

(assert (=> d!99460 (= res!243600 (= lt!428631 (bvsub lt!428627 lt!428628)))))

(assert (=> d!99460 (or (= (bvand lt!428627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!428628 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428627 lt!428628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99460 (= lt!428628 (remainingBits!0 ((_ sign_extend 32) (size!7662 (buf!7725 thiss!1728))) ((_ sign_extend 32) (currentByte!14222 thiss!1728)) ((_ sign_extend 32) (currentBit!14217 thiss!1728))))))

(declare-fun lt!428630 () (_ BitVec 64))

(declare-fun lt!428629 () (_ BitVec 64))

(assert (=> d!99460 (= lt!428627 (bvmul lt!428630 lt!428629))))

(assert (=> d!99460 (or (= lt!428630 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!428629 (bvsdiv (bvmul lt!428630 lt!428629) lt!428630)))))

(assert (=> d!99460 (= lt!428629 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99460 (= lt!428630 ((_ sign_extend 32) (size!7662 (buf!7725 thiss!1728))))))

(assert (=> d!99460 (= lt!428631 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14222 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14217 thiss!1728))))))

(assert (=> d!99460 (invariant!0 (currentBit!14217 thiss!1728) (currentByte!14222 thiss!1728) (size!7662 (buf!7725 thiss!1728)))))

(assert (=> d!99460 (= (bitIndex!0 (size!7662 (buf!7725 thiss!1728)) (currentByte!14222 thiss!1728) (currentBit!14217 thiss!1728)) lt!428631)))

(declare-fun b!295028 () Bool)

(declare-fun res!243599 () Bool)

(assert (=> b!295028 (=> (not res!243599) (not e!210972))))

(assert (=> b!295028 (= res!243599 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!428631))))

(declare-fun b!295029 () Bool)

(declare-fun lt!428626 () (_ BitVec 64))

(assert (=> b!295029 (= e!210972 (bvsle lt!428631 (bvmul lt!428626 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295029 (or (= lt!428626 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!428626 #b0000000000000000000000000000000000000000000000000000000000001000) lt!428626)))))

(assert (=> b!295029 (= lt!428626 ((_ sign_extend 32) (size!7662 (buf!7725 thiss!1728))))))

(assert (= (and d!99460 res!243600) b!295028))

(assert (= (and b!295028 res!243599) b!295029))

(assert (=> d!99460 m!431881))

(assert (=> d!99460 m!431883))

(assert (=> b!294954 d!99460))

(declare-fun d!99462 () Bool)

(declare-fun e!210975 () Bool)

(assert (=> d!99462 e!210975))

(declare-fun res!243603 () Bool)

(assert (=> d!99462 (=> (not res!243603) (not e!210975))))

(declare-fun lt!428640 () (_ BitVec 32))

(assert (=> d!99462 (= res!243603 (and (bvsge lt!428640 #b00000000000000000000000000000000) (bvslt lt!428640 (size!7662 arr!273))))))

(declare-fun lt!428643 () (_ BitVec 8))

(declare-fun lt!428641 () (_ BitVec 32))

(declare-fun lt!428642 () Unit!20561)

(declare-fun choose!53 (array!17676 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20561)

(assert (=> d!99462 (= lt!428642 (choose!53 arr!273 from!505 (_1!12964 lt!428545) lt!428640 lt!428641 lt!428643))))

(assert (=> d!99462 (= lt!428643 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8700 arr!273) lt!428640)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428641)))) ((_ sign_extend 24) (ite (_1!12964 lt!428545) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428641) #b00000000)))))))

(assert (=> d!99462 (= lt!428641 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99462 (= lt!428640 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99462 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12964 lt!428545)) lt!428642)))

(declare-fun b!295033 () Bool)

(assert (=> b!295033 (= e!210975 (arrayBitRangesEq!0 arr!273 (array!17677 (store (arr!8700 arr!273) lt!428640 lt!428643) (size!7662 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99462 res!243603) b!295033))

(declare-fun m!431887 () Bool)

(assert (=> d!99462 m!431887))

(declare-fun m!431889 () Bool)

(assert (=> d!99462 m!431889))

(declare-fun m!431891 () Bool)

(assert (=> d!99462 m!431891))

(declare-fun m!431893 () Bool)

(assert (=> b!295033 m!431893))

(declare-fun m!431895 () Bool)

(assert (=> b!295033 m!431895))

(assert (=> b!294954 d!99462))

(declare-fun b!295111 () Bool)

(declare-fun res!243667 () Bool)

(declare-fun e!211016 () Bool)

(assert (=> b!295111 (=> (not res!243667) (not e!211016))))

(declare-fun lt!428971 () tuple3!1840)

(assert (=> b!295111 (= res!243667 (and (= (buf!7725 (_2!12964 lt!428545)) (buf!7725 (_2!12963 lt!428971))) (= (size!7662 lt!428550) (size!7662 (_3!1358 lt!428971)))))))

(declare-fun e!211017 () Bool)

(declare-fun b!295112 () Bool)

(declare-fun lt!428990 () tuple3!1840)

(assert (=> b!295112 (= e!211017 (and (= (buf!7725 (_2!12964 lt!428545)) (buf!7725 (_2!12963 lt!428990))) (= (size!7662 lt!428550) (size!7662 (_3!1358 lt!428990)))))))

(declare-fun b!295114 () Bool)

(declare-fun res!243668 () Bool)

(assert (=> b!295114 (=> (not res!243668) (not e!211016))))

(assert (=> b!295114 (= res!243668 (arrayBitRangesEq!0 lt!428550 (_3!1358 lt!428971) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!295115 () Bool)

(declare-fun res!243670 () Bool)

(assert (=> b!295115 (=> (not res!243670) (not e!211016))))

(assert (=> b!295115 (= res!243670 (invariant!0 (currentBit!14217 (_2!12963 lt!428971)) (currentByte!14222 (_2!12963 lt!428971)) (size!7662 (buf!7725 (_2!12963 lt!428971)))))))

(declare-fun lt!428973 () tuple2!23210)

(declare-fun lt!428978 () (_ BitVec 32))

(declare-fun lt!428965 () (_ BitVec 32))

(declare-fun c!13445 () Bool)

(declare-fun bm!5052 () Bool)

(declare-fun call!5055 () Bool)

(assert (=> bm!5052 (= call!5055 (arrayBitRangesEq!0 lt!428550 (ite c!13445 (array!17677 (store (arr!8700 lt!428550) lt!428965 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8700 lt!428550) lt!428965)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428978)))) ((_ sign_extend 24) (ite (_1!12964 lt!428973) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428978) #b00000000))))) (size!7662 lt!428550)) lt!428550) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13445 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7662 lt!428550)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!295116 () Bool)

(declare-fun e!211018 () tuple3!1840)

(declare-fun lt!428988 () Unit!20561)

(assert (=> b!295116 (= e!211018 (tuple3!1841 lt!428988 (_2!12963 lt!428990) (_3!1358 lt!428990)))))

(assert (=> b!295116 (= lt!428973 (readBit!0 (_2!12964 lt!428545)))))

(declare-fun lt!428975 () (_ BitVec 32))

(assert (=> b!295116 (= lt!428975 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428963 () (_ BitVec 32))

(assert (=> b!295116 (= lt!428963 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428974 () array!17676)

(assert (=> b!295116 (= lt!428974 (array!17677 (store (arr!8700 lt!428550) lt!428975 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8700 lt!428550) lt!428975)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428963)))) ((_ sign_extend 24) (ite (_1!12964 lt!428973) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428963) #b00000000))))) (size!7662 lt!428550)))))

(declare-fun lt!428983 () (_ BitVec 64))

(assert (=> b!295116 (= lt!428983 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!428961 () (_ BitVec 64))

(assert (=> b!295116 (= lt!428961 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!428981 () Unit!20561)

(assert (=> b!295116 (= lt!428981 (validateOffsetBitsIneqLemma!0 (_2!12964 lt!428545) (_2!12964 lt!428973) lt!428983 lt!428961))))

(assert (=> b!295116 (validate_offset_bits!1 ((_ sign_extend 32) (size!7662 (buf!7725 (_2!12964 lt!428973)))) ((_ sign_extend 32) (currentByte!14222 (_2!12964 lt!428973))) ((_ sign_extend 32) (currentBit!14217 (_2!12964 lt!428973))) (bvsub lt!428983 lt!428961))))

(declare-fun lt!428992 () Unit!20561)

(assert (=> b!295116 (= lt!428992 lt!428981)))

(assert (=> b!295116 (= lt!428990 (readBitsLoop!0 (_2!12964 lt!428973) nBits!523 lt!428974 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!243669 () Bool)

(assert (=> b!295116 (= res!243669 (= (bvsub (bvadd (bitIndex!0 (size!7662 (buf!7725 (_2!12964 lt!428545))) (currentByte!14222 (_2!12964 lt!428545)) (currentBit!14217 (_2!12964 lt!428545))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7662 (buf!7725 (_2!12963 lt!428990))) (currentByte!14222 (_2!12963 lt!428990)) (currentBit!14217 (_2!12963 lt!428990)))))))

(assert (=> b!295116 (=> (not res!243669) (not e!211017))))

(assert (=> b!295116 e!211017))

(declare-fun lt!428986 () Unit!20561)

(declare-fun Unit!20567 () Unit!20561)

(assert (=> b!295116 (= lt!428986 Unit!20567)))

(assert (=> b!295116 (= lt!428965 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295116 (= lt!428978 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428984 () Unit!20561)

(assert (=> b!295116 (= lt!428984 (arrayBitRangesUpdatedAtLemma!0 lt!428550 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12964 lt!428973)))))

(assert (=> b!295116 call!5055))

(declare-fun lt!428967 () Unit!20561)

(assert (=> b!295116 (= lt!428967 lt!428984)))

(declare-fun lt!428972 () (_ BitVec 64))

(assert (=> b!295116 (= lt!428972 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428982 () Unit!20561)

(assert (=> b!295116 (= lt!428982 (arrayBitRangesEqTransitive!0 lt!428550 lt!428974 (_3!1358 lt!428990) lt!428972 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295116 (arrayBitRangesEq!0 lt!428550 (_3!1358 lt!428990) lt!428972 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!428960 () Unit!20561)

(assert (=> b!295116 (= lt!428960 lt!428982)))

(declare-fun call!5056 () Bool)

(assert (=> b!295116 call!5056))

(declare-fun lt!428987 () Unit!20561)

(declare-fun Unit!20568 () Unit!20561)

(assert (=> b!295116 (= lt!428987 Unit!20568)))

(declare-fun lt!428979 () Unit!20561)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17676 array!17676 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20561)

(assert (=> b!295116 (= lt!428979 (arrayBitRangesEqImpliesEq!0 lt!428974 (_3!1358 lt!428990) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!17676 (_ BitVec 64)) Bool)

(assert (=> b!295116 (= (bitAt!0 lt!428974 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1358 lt!428990) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!428976 () Unit!20561)

(assert (=> b!295116 (= lt!428976 lt!428979)))

(declare-fun lt!428985 () Unit!20561)

(declare-fun Unit!20570 () Unit!20561)

(assert (=> b!295116 (= lt!428985 Unit!20570)))

(declare-fun lt!428991 () Bool)

(assert (=> b!295116 (= lt!428991 (= (bitAt!0 (_3!1358 lt!428990) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12964 lt!428973)))))

(declare-fun Unit!20571 () Unit!20561)

(assert (=> b!295116 (= lt!428988 Unit!20571)))

(assert (=> b!295116 lt!428991))

(declare-fun b!295117 () Bool)

(declare-datatypes ((List!979 0))(
  ( (Nil!976) (Cons!975 (h!1094 Bool) (t!1864 List!979)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13328 array!17676 (_ BitVec 64) (_ BitVec 64)) List!979)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13328 BitStream!13328 (_ BitVec 64)) List!979)

(assert (=> b!295117 (= e!211016 (= (byteArrayBitContentToList!0 (_2!12963 lt!428971) (_3!1358 lt!428971) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12963 lt!428971) (_2!12964 lt!428545) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295117 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295117 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!428989 () (_ BitVec 64))

(declare-fun lt!428993 () array!17676)

(declare-fun lt!428968 () array!17676)

(declare-fun lt!428969 () (_ BitVec 64))

(declare-fun bm!5053 () Bool)

(assert (=> bm!5053 (= call!5056 (arrayBitRangesEq!0 (ite c!13445 lt!428550 lt!428993) (ite c!13445 (_3!1358 lt!428990) lt!428968) (ite c!13445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!428969) (ite c!13445 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!428989)))))

(declare-fun d!99464 () Bool)

(assert (=> d!99464 e!211016))

(declare-fun res!243671 () Bool)

(assert (=> d!99464 (=> (not res!243671) (not e!211016))))

(declare-fun lt!428964 () (_ BitVec 64))

(assert (=> d!99464 (= res!243671 (= (bvsub lt!428964 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7662 (buf!7725 (_2!12963 lt!428971))) (currentByte!14222 (_2!12963 lt!428971)) (currentBit!14217 (_2!12963 lt!428971)))))))

(assert (=> d!99464 (or (= (bvand lt!428964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428964 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!428966 () (_ BitVec 64))

(assert (=> d!99464 (= lt!428964 (bvadd lt!428966 to!474))))

(assert (=> d!99464 (or (not (= (bvand lt!428966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!428966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!428966 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99464 (= lt!428966 (bitIndex!0 (size!7662 (buf!7725 (_2!12964 lt!428545))) (currentByte!14222 (_2!12964 lt!428545)) (currentBit!14217 (_2!12964 lt!428545))))))

(assert (=> d!99464 (= lt!428971 e!211018)))

(assert (=> d!99464 (= c!13445 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99464 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99464 (= (readBitsLoop!0 (_2!12964 lt!428545) nBits!523 lt!428550 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!428971)))

(declare-fun b!295113 () Bool)

(declare-fun res!243666 () Bool)

(assert (=> b!295113 (=> (not res!243666) (not e!211016))))

(declare-fun e!211019 () Bool)

(assert (=> b!295113 (= res!243666 e!211019)))

(declare-fun res!243665 () Bool)

(assert (=> b!295113 (=> res!243665 e!211019)))

(assert (=> b!295113 (= res!243665 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun lt!428962 () Unit!20561)

(declare-fun b!295118 () Bool)

(assert (=> b!295118 (= e!211018 (tuple3!1841 lt!428962 (_2!12964 lt!428545) lt!428550))))

(declare-fun lt!428994 () Unit!20561)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17676) Unit!20561)

(assert (=> b!295118 (= lt!428994 (arrayBitRangesEqReflexiveLemma!0 lt!428550))))

(assert (=> b!295118 call!5055))

(declare-fun lt!428959 () Unit!20561)

(assert (=> b!295118 (= lt!428959 lt!428994)))

(assert (=> b!295118 (= lt!428993 lt!428550)))

(assert (=> b!295118 (= lt!428968 lt!428550)))

(declare-fun lt!428980 () (_ BitVec 64))

(assert (=> b!295118 (= lt!428980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428977 () (_ BitVec 64))

(assert (=> b!295118 (= lt!428977 ((_ sign_extend 32) (size!7662 lt!428550)))))

(declare-fun lt!428970 () (_ BitVec 64))

(assert (=> b!295118 (= lt!428970 (bvmul lt!428977 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!295118 (= lt!428969 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!295118 (= lt!428989 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17676 array!17676 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20561)

(assert (=> b!295118 (= lt!428962 (arrayBitRangesEqSlicedLemma!0 lt!428993 lt!428968 lt!428980 lt!428970 lt!428969 lt!428989))))

(assert (=> b!295118 call!5056))

(declare-fun b!295119 () Bool)

(declare-datatypes ((tuple2!23218 0))(
  ( (tuple2!23219 (_1!12970 BitStream!13328) (_2!12970 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13328) tuple2!23218)

(assert (=> b!295119 (= e!211019 (= (bitAt!0 (_3!1358 lt!428971) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12970 (readBitPure!0 (_2!12964 lt!428545)))))))

(assert (= (and d!99464 c!13445) b!295116))

(assert (= (and d!99464 (not c!13445)) b!295118))

(assert (= (and b!295116 res!243669) b!295112))

(assert (= (or b!295116 b!295118) bm!5053))

(assert (= (or b!295116 b!295118) bm!5052))

(assert (= (and d!99464 res!243671) b!295111))

(assert (= (and b!295111 res!243667) b!295114))

(assert (= (and b!295114 res!243668) b!295113))

(assert (= (and b!295113 (not res!243665)) b!295119))

(assert (= (and b!295113 res!243666) b!295115))

(assert (= (and b!295115 res!243670) b!295117))

(declare-fun m!432027 () Bool)

(assert (=> b!295114 m!432027))

(declare-fun m!432029 () Bool)

(assert (=> b!295117 m!432029))

(declare-fun m!432031 () Bool)

(assert (=> b!295117 m!432031))

(declare-fun m!432033 () Bool)

(assert (=> b!295118 m!432033))

(declare-fun m!432035 () Bool)

(assert (=> b!295118 m!432035))

(declare-fun m!432037 () Bool)

(assert (=> b!295119 m!432037))

(declare-fun m!432039 () Bool)

(assert (=> b!295119 m!432039))

(declare-fun m!432041 () Bool)

(assert (=> b!295115 m!432041))

(declare-fun m!432043 () Bool)

(assert (=> bm!5053 m!432043))

(declare-fun m!432045 () Bool)

(assert (=> bm!5052 m!432045))

(declare-fun m!432047 () Bool)

(assert (=> bm!5052 m!432047))

(declare-fun m!432049 () Bool)

(assert (=> bm!5052 m!432049))

(declare-fun m!432053 () Bool)

(assert (=> bm!5052 m!432053))

(declare-fun m!432055 () Bool)

(assert (=> b!295116 m!432055))

(declare-fun m!432057 () Bool)

(assert (=> b!295116 m!432057))

(declare-fun m!432059 () Bool)

(assert (=> b!295116 m!432059))

(declare-fun m!432061 () Bool)

(assert (=> b!295116 m!432061))

(declare-fun m!432063 () Bool)

(assert (=> b!295116 m!432063))

(declare-fun m!432065 () Bool)

(assert (=> b!295116 m!432065))

(declare-fun m!432067 () Bool)

(assert (=> b!295116 m!432067))

(declare-fun m!432069 () Bool)

(assert (=> b!295116 m!432069))

(declare-fun m!432071 () Bool)

(assert (=> b!295116 m!432071))

(declare-fun m!432073 () Bool)

(assert (=> b!295116 m!432073))

(declare-fun m!432075 () Bool)

(assert (=> b!295116 m!432075))

(declare-fun m!432077 () Bool)

(assert (=> b!295116 m!432077))

(declare-fun m!432079 () Bool)

(assert (=> b!295116 m!432079))

(declare-fun m!432081 () Bool)

(assert (=> b!295116 m!432081))

(declare-fun m!432083 () Bool)

(assert (=> b!295116 m!432083))

(declare-fun m!432085 () Bool)

(assert (=> d!99464 m!432085))

(assert (=> d!99464 m!432083))

(assert (=> b!294954 d!99464))

(declare-fun d!99474 () Bool)

(declare-fun e!211020 () Bool)

(assert (=> d!99474 e!211020))

(declare-fun res!243673 () Bool)

(assert (=> d!99474 (=> (not res!243673) (not e!211020))))

(declare-fun lt!428997 () (_ BitVec 64))

(declare-fun lt!428996 () (_ BitVec 64))

(declare-fun lt!429000 () (_ BitVec 64))

(assert (=> d!99474 (= res!243673 (= lt!429000 (bvsub lt!428996 lt!428997)))))

(assert (=> d!99474 (or (= (bvand lt!428996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!428997 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428996 lt!428997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99474 (= lt!428997 (remainingBits!0 ((_ sign_extend 32) (size!7662 (buf!7725 (_2!12963 lt!428548)))) ((_ sign_extend 32) (currentByte!14222 (_2!12963 lt!428548))) ((_ sign_extend 32) (currentBit!14217 (_2!12963 lt!428548)))))))

(declare-fun lt!428999 () (_ BitVec 64))

(declare-fun lt!428998 () (_ BitVec 64))

(assert (=> d!99474 (= lt!428996 (bvmul lt!428999 lt!428998))))

(assert (=> d!99474 (or (= lt!428999 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!428998 (bvsdiv (bvmul lt!428999 lt!428998) lt!428999)))))

(assert (=> d!99474 (= lt!428998 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99474 (= lt!428999 ((_ sign_extend 32) (size!7662 (buf!7725 (_2!12963 lt!428548)))))))

(assert (=> d!99474 (= lt!429000 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14222 (_2!12963 lt!428548))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14217 (_2!12963 lt!428548)))))))

(assert (=> d!99474 (invariant!0 (currentBit!14217 (_2!12963 lt!428548)) (currentByte!14222 (_2!12963 lt!428548)) (size!7662 (buf!7725 (_2!12963 lt!428548))))))

(assert (=> d!99474 (= (bitIndex!0 (size!7662 (buf!7725 (_2!12963 lt!428548))) (currentByte!14222 (_2!12963 lt!428548)) (currentBit!14217 (_2!12963 lt!428548))) lt!429000)))

(declare-fun b!295120 () Bool)

(declare-fun res!243672 () Bool)

(assert (=> b!295120 (=> (not res!243672) (not e!211020))))

(assert (=> b!295120 (= res!243672 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!429000))))

(declare-fun b!295121 () Bool)

(declare-fun lt!428995 () (_ BitVec 64))

(assert (=> b!295121 (= e!211020 (bvsle lt!429000 (bvmul lt!428995 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295121 (or (= lt!428995 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!428995 #b0000000000000000000000000000000000000000000000000000000000001000) lt!428995)))))

(assert (=> b!295121 (= lt!428995 ((_ sign_extend 32) (size!7662 (buf!7725 (_2!12963 lt!428548)))))))

(assert (= (and d!99474 res!243673) b!295120))

(assert (= (and b!295120 res!243672) b!295121))

(declare-fun m!432087 () Bool)

(assert (=> d!99474 m!432087))

(declare-fun m!432089 () Bool)

(assert (=> d!99474 m!432089))

(assert (=> b!294954 d!99474))

(declare-fun b!295122 () Bool)

(declare-fun e!211021 () Bool)

(declare-fun e!211024 () Bool)

(assert (=> b!295122 (= e!211021 e!211024)))

(declare-fun res!243677 () Bool)

(assert (=> b!295122 (=> (not res!243677) (not e!211024))))

(declare-fun e!211025 () Bool)

(assert (=> b!295122 (= res!243677 e!211025)))

(declare-fun res!243675 () Bool)

(assert (=> b!295122 (=> res!243675 e!211025)))

(declare-fun lt!429002 () tuple4!878)

(assert (=> b!295122 (= res!243675 (bvsge (_1!12967 lt!429002) (_2!12967 lt!429002)))))

(declare-fun lt!429001 () (_ BitVec 32))

(assert (=> b!295122 (= lt!429001 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429003 () (_ BitVec 32))

(assert (=> b!295122 (= lt!429003 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295122 (= lt!429002 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295123 () Bool)

(declare-fun e!211023 () Bool)

(assert (=> b!295123 (= e!211024 e!211023)))

(declare-fun c!13446 () Bool)

(assert (=> b!295123 (= c!13446 (= (_3!1360 lt!429002) (_4!439 lt!429002)))))

(declare-fun bm!5054 () Bool)

(declare-fun call!5057 () Bool)

(assert (=> bm!5054 (= call!5057 (byteRangesEq!0 (select (arr!8700 arr!273) (_3!1360 lt!429002)) (select (arr!8700 lt!428550) (_3!1360 lt!429002)) lt!429003 (ite c!13446 lt!429001 #b00000000000000000000000000001000)))))

(declare-fun b!295124 () Bool)

(assert (=> b!295124 (= e!211025 (arrayRangesEq!1497 arr!273 lt!428550 (_1!12967 lt!429002) (_2!12967 lt!429002)))))

(declare-fun b!295125 () Bool)

(assert (=> b!295125 (= e!211023 call!5057)))

(declare-fun d!99476 () Bool)

(declare-fun res!243678 () Bool)

(assert (=> d!99476 (=> res!243678 e!211021)))

(assert (=> d!99476 (= res!243678 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99476 (= (arrayBitRangesEq!0 arr!273 lt!428550 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211021)))

(declare-fun b!295126 () Bool)

(declare-fun e!211022 () Bool)

(assert (=> b!295126 (= e!211022 (byteRangesEq!0 (select (arr!8700 arr!273) (_4!439 lt!429002)) (select (arr!8700 lt!428550) (_4!439 lt!429002)) #b00000000000000000000000000000000 lt!429001))))

(declare-fun b!295127 () Bool)

(declare-fun res!243676 () Bool)

(assert (=> b!295127 (= res!243676 (= lt!429001 #b00000000000000000000000000000000))))

(assert (=> b!295127 (=> res!243676 e!211022)))

(declare-fun e!211026 () Bool)

(assert (=> b!295127 (= e!211026 e!211022)))

(declare-fun b!295128 () Bool)

(assert (=> b!295128 (= e!211023 e!211026)))

(declare-fun res!243674 () Bool)

(assert (=> b!295128 (= res!243674 call!5057)))

(assert (=> b!295128 (=> (not res!243674) (not e!211026))))

(assert (= (and d!99476 (not res!243678)) b!295122))

(assert (= (and b!295122 (not res!243675)) b!295124))

(assert (= (and b!295122 res!243677) b!295123))

(assert (= (and b!295123 c!13446) b!295125))

(assert (= (and b!295123 (not c!13446)) b!295128))

(assert (= (and b!295128 res!243674) b!295127))

(assert (= (and b!295127 (not res!243676)) b!295126))

(assert (= (or b!295125 b!295128) bm!5054))

(declare-fun m!432091 () Bool)

(assert (=> b!295122 m!432091))

(declare-fun m!432093 () Bool)

(assert (=> bm!5054 m!432093))

(declare-fun m!432095 () Bool)

(assert (=> bm!5054 m!432095))

(assert (=> bm!5054 m!432093))

(assert (=> bm!5054 m!432095))

(declare-fun m!432097 () Bool)

(assert (=> bm!5054 m!432097))

(declare-fun m!432099 () Bool)

(assert (=> b!295124 m!432099))

(declare-fun m!432101 () Bool)

(assert (=> b!295126 m!432101))

(declare-fun m!432103 () Bool)

(assert (=> b!295126 m!432103))

(assert (=> b!295126 m!432101))

(assert (=> b!295126 m!432103))

(declare-fun m!432105 () Bool)

(assert (=> b!295126 m!432105))

(assert (=> b!294954 d!99476))

(declare-fun d!99478 () Bool)

(declare-fun e!211039 () Bool)

(assert (=> d!99478 e!211039))

(declare-fun res!243690 () Bool)

(assert (=> d!99478 (=> (not res!243690) (not e!211039))))

(declare-datatypes ((tuple2!23222 0))(
  ( (tuple2!23223 (_1!12973 Unit!20561) (_2!12973 BitStream!13328)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13328) tuple2!23222)

(assert (=> d!99478 (= res!243690 (= (buf!7725 (_2!12973 (increaseBitIndex!0 thiss!1728))) (buf!7725 thiss!1728)))))

(declare-fun lt!429043 () Bool)

(assert (=> d!99478 (= lt!429043 (not (= (bvand ((_ sign_extend 24) (select (arr!8700 (buf!7725 thiss!1728)) (currentByte!14222 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14217 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429045 () tuple2!23210)

(assert (=> d!99478 (= lt!429045 (tuple2!23211 (not (= (bvand ((_ sign_extend 24) (select (arr!8700 (buf!7725 thiss!1728)) (currentByte!14222 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14217 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12973 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99478 (validate_offset_bit!0 ((_ sign_extend 32) (size!7662 (buf!7725 thiss!1728))) ((_ sign_extend 32) (currentByte!14222 thiss!1728)) ((_ sign_extend 32) (currentBit!14217 thiss!1728)))))

(assert (=> d!99478 (= (readBit!0 thiss!1728) lt!429045)))

(declare-fun lt!429042 () (_ BitVec 64))

(declare-fun b!295140 () Bool)

(declare-fun lt!429044 () (_ BitVec 64))

(assert (=> b!295140 (= e!211039 (= (bitIndex!0 (size!7662 (buf!7725 (_2!12973 (increaseBitIndex!0 thiss!1728)))) (currentByte!14222 (_2!12973 (increaseBitIndex!0 thiss!1728))) (currentBit!14217 (_2!12973 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!429042 lt!429044)))))

(assert (=> b!295140 (or (not (= (bvand lt!429042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429044 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!429042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!429042 lt!429044) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295140 (= lt!429044 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295140 (= lt!429042 (bitIndex!0 (size!7662 (buf!7725 thiss!1728)) (currentByte!14222 thiss!1728) (currentBit!14217 thiss!1728)))))

(declare-fun lt!429041 () Bool)

(assert (=> b!295140 (= lt!429041 (not (= (bvand ((_ sign_extend 24) (select (arr!8700 (buf!7725 thiss!1728)) (currentByte!14222 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14217 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429040 () Bool)

(assert (=> b!295140 (= lt!429040 (not (= (bvand ((_ sign_extend 24) (select (arr!8700 (buf!7725 thiss!1728)) (currentByte!14222 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14217 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429039 () Bool)

(assert (=> b!295140 (= lt!429039 (not (= (bvand ((_ sign_extend 24) (select (arr!8700 (buf!7725 thiss!1728)) (currentByte!14222 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14217 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99478 res!243690) b!295140))

(declare-fun m!432113 () Bool)

(assert (=> d!99478 m!432113))

(declare-fun m!432115 () Bool)

(assert (=> d!99478 m!432115))

(declare-fun m!432117 () Bool)

(assert (=> d!99478 m!432117))

(declare-fun m!432119 () Bool)

(assert (=> d!99478 m!432119))

(assert (=> b!295140 m!432115))

(declare-fun m!432121 () Bool)

(assert (=> b!295140 m!432121))

(assert (=> b!295140 m!432117))

(assert (=> b!295140 m!432113))

(assert (=> b!295140 m!431777))

(assert (=> b!294954 d!99478))

(declare-fun d!99484 () Bool)

(declare-fun e!211042 () Bool)

(assert (=> d!99484 e!211042))

(declare-fun res!243693 () Bool)

(assert (=> d!99484 (=> (not res!243693) (not e!211042))))

(assert (=> d!99484 (= res!243693 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429048 () Unit!20561)

(declare-fun choose!27 (BitStream!13328 BitStream!13328 (_ BitVec 64) (_ BitVec 64)) Unit!20561)

(assert (=> d!99484 (= lt!429048 (choose!27 thiss!1728 (_2!12964 lt!428545) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99484 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99484 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12964 lt!428545) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!429048)))

(declare-fun b!295143 () Bool)

(assert (=> b!295143 (= e!211042 (validate_offset_bits!1 ((_ sign_extend 32) (size!7662 (buf!7725 (_2!12964 lt!428545)))) ((_ sign_extend 32) (currentByte!14222 (_2!12964 lt!428545))) ((_ sign_extend 32) (currentBit!14217 (_2!12964 lt!428545))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99484 res!243693) b!295143))

(declare-fun m!432123 () Bool)

(assert (=> d!99484 m!432123))

(assert (=> b!295143 m!431775))

(assert (=> b!294954 d!99484))

(declare-fun d!99486 () Bool)

(assert (=> d!99486 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7662 (buf!7725 (_2!12964 lt!428545)))) ((_ sign_extend 32) (currentByte!14222 (_2!12964 lt!428545))) ((_ sign_extend 32) (currentBit!14217 (_2!12964 lt!428545))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7662 (buf!7725 (_2!12964 lt!428545)))) ((_ sign_extend 32) (currentByte!14222 (_2!12964 lt!428545))) ((_ sign_extend 32) (currentBit!14217 (_2!12964 lt!428545)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25443 () Bool)

(assert (= bs!25443 d!99486))

(declare-fun m!432125 () Bool)

(assert (=> bs!25443 m!432125))

(assert (=> b!294954 d!99486))

(declare-fun b!295146 () Bool)

(declare-fun e!211045 () Bool)

(declare-fun e!211048 () Bool)

(assert (=> b!295146 (= e!211045 e!211048)))

(declare-fun res!243699 () Bool)

(assert (=> b!295146 (=> (not res!243699) (not e!211048))))

(declare-fun e!211049 () Bool)

(assert (=> b!295146 (= res!243699 e!211049)))

(declare-fun res!243697 () Bool)

(assert (=> b!295146 (=> res!243697 e!211049)))

(declare-fun lt!429056 () tuple4!878)

(assert (=> b!295146 (= res!243697 (bvsge (_1!12967 lt!429056) (_2!12967 lt!429056)))))

(declare-fun lt!429055 () (_ BitVec 32))

(assert (=> b!295146 (= lt!429055 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429057 () (_ BitVec 32))

(assert (=> b!295146 (= lt!429057 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295146 (= lt!429056 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295147 () Bool)

(declare-fun e!211047 () Bool)

(assert (=> b!295147 (= e!211048 e!211047)))

(declare-fun c!13447 () Bool)

(assert (=> b!295147 (= c!13447 (= (_3!1360 lt!429056) (_4!439 lt!429056)))))

(declare-fun bm!5055 () Bool)

(declare-fun call!5058 () Bool)

(assert (=> bm!5055 (= call!5058 (byteRangesEq!0 (select (arr!8700 arr!273) (_3!1360 lt!429056)) (select (arr!8700 (_3!1358 lt!428548)) (_3!1360 lt!429056)) lt!429057 (ite c!13447 lt!429055 #b00000000000000000000000000001000)))))

(declare-fun b!295148 () Bool)

(assert (=> b!295148 (= e!211049 (arrayRangesEq!1497 arr!273 (_3!1358 lt!428548) (_1!12967 lt!429056) (_2!12967 lt!429056)))))

(declare-fun b!295149 () Bool)

(assert (=> b!295149 (= e!211047 call!5058)))

(declare-fun d!99488 () Bool)

(declare-fun res!243700 () Bool)

(assert (=> d!99488 (=> res!243700 e!211045)))

(assert (=> d!99488 (= res!243700 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99488 (= (arrayBitRangesEq!0 arr!273 (_3!1358 lt!428548) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211045)))

(declare-fun b!295150 () Bool)

(declare-fun e!211046 () Bool)

(assert (=> b!295150 (= e!211046 (byteRangesEq!0 (select (arr!8700 arr!273) (_4!439 lt!429056)) (select (arr!8700 (_3!1358 lt!428548)) (_4!439 lt!429056)) #b00000000000000000000000000000000 lt!429055))))

(declare-fun b!295151 () Bool)

(declare-fun res!243698 () Bool)

(assert (=> b!295151 (= res!243698 (= lt!429055 #b00000000000000000000000000000000))))

(assert (=> b!295151 (=> res!243698 e!211046)))

(declare-fun e!211050 () Bool)

(assert (=> b!295151 (= e!211050 e!211046)))

(declare-fun b!295152 () Bool)

(assert (=> b!295152 (= e!211047 e!211050)))

(declare-fun res!243696 () Bool)

(assert (=> b!295152 (= res!243696 call!5058)))

(assert (=> b!295152 (=> (not res!243696) (not e!211050))))

(assert (= (and d!99488 (not res!243700)) b!295146))

(assert (= (and b!295146 (not res!243697)) b!295148))

(assert (= (and b!295146 res!243699) b!295147))

(assert (= (and b!295147 c!13447) b!295149))

(assert (= (and b!295147 (not c!13447)) b!295152))

(assert (= (and b!295152 res!243696) b!295151))

(assert (= (and b!295151 (not res!243698)) b!295150))

(assert (= (or b!295149 b!295152) bm!5055))

(assert (=> b!295146 m!432091))

(declare-fun m!432127 () Bool)

(assert (=> bm!5055 m!432127))

(declare-fun m!432129 () Bool)

(assert (=> bm!5055 m!432129))

(assert (=> bm!5055 m!432127))

(assert (=> bm!5055 m!432129))

(declare-fun m!432131 () Bool)

(assert (=> bm!5055 m!432131))

(declare-fun m!432133 () Bool)

(assert (=> b!295148 m!432133))

(declare-fun m!432135 () Bool)

(assert (=> b!295150 m!432135))

(declare-fun m!432137 () Bool)

(assert (=> b!295150 m!432137))

(assert (=> b!295150 m!432135))

(assert (=> b!295150 m!432137))

(declare-fun m!432139 () Bool)

(assert (=> b!295150 m!432139))

(assert (=> b!294954 d!99488))

(push 1)

(assert (not b!295150))

(assert (not b!295146))

(assert (not b!295033))

(assert (not d!99464))

(assert (not d!99458))

(assert (not b!295148))

(assert (not b!295124))

(assert (not d!99460))

(assert (not b!295118))

(assert (not b!295140))

(assert (not b!295021))

(assert (not bm!5053))

(assert (not d!99474))

(assert (not b!295122))

(assert (not bm!5035))

(assert (not d!99486))

(assert (not b!295115))

(assert (not b!295117))

(assert (not d!99454))

(assert (not bm!5054))

(assert (not d!99452))

(assert (not b!295019))

(assert (not b!295119))

(assert (not bm!5052))

(assert (not b!295143))

(assert (not d!99484))

(assert (not d!99462))

(assert (not b!295116))

(assert (not bm!5055))

(assert (not b!295114))

(assert (not d!99478))

(assert (not b!295126))

(assert (not b!295017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65742 () Bool)

(assert start!65742)

(declare-fun b!294931 () Bool)

(declare-fun e!210894 () Bool)

(declare-fun e!210890 () Bool)

(assert (=> b!294931 (= e!210894 (not e!210890))))

(declare-fun res!243525 () Bool)

(assert (=> b!294931 (=> res!243525 e!210890)))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17674 0))(
  ( (array!17675 (arr!8699 (Array (_ BitVec 32) (_ BitVec 8))) (size!7661 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17674)

(assert (=> b!294931 (= res!243525 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7661 arr!273)))) (bvsge from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-datatypes ((BitStream!13326 0))(
  ( (BitStream!13327 (buf!7724 array!17674) (currentByte!14221 (_ BitVec 32)) (currentBit!14216 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20559 0))(
  ( (Unit!20560) )
))
(declare-datatypes ((tuple3!1838 0))(
  ( (tuple3!1839 (_1!12961 Unit!20559) (_2!12961 BitStream!13326) (_3!1357 array!17674)) )
))
(declare-fun lt!428526 () tuple3!1838)

(declare-fun arrayBitRangesEq!0 (array!17674 array!17674 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294931 (arrayBitRangesEq!0 arr!273 (_3!1357 lt!428526) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428519 () array!17674)

(declare-fun lt!428522 () Unit!20559)

(declare-fun arrayBitRangesEqTransitive!0 (array!17674 array!17674 array!17674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20559)

(assert (=> b!294931 (= lt!428522 (arrayBitRangesEqTransitive!0 arr!273 lt!428519 (_3!1357 lt!428526) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294931 (arrayBitRangesEq!0 arr!273 lt!428519 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428521 () Unit!20559)

(declare-datatypes ((tuple2!23208 0))(
  ( (tuple2!23209 (_1!12962 Bool) (_2!12962 BitStream!13326)) )
))
(declare-fun lt!428523 () tuple2!23208)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17674 (_ BitVec 64) Bool) Unit!20559)

(assert (=> b!294931 (= lt!428521 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12962 lt!428523)))))

(declare-fun e!210892 () Bool)

(assert (=> b!294931 e!210892))

(declare-fun res!243527 () Bool)

(assert (=> b!294931 (=> (not res!243527) (not e!210892))))

(declare-fun thiss!1728 () BitStream!13326)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294931 (= res!243527 (= (bvsub (bvadd (bitIndex!0 (size!7661 (buf!7724 thiss!1728)) (currentByte!14221 thiss!1728) (currentBit!14216 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7661 (buf!7724 (_2!12961 lt!428526))) (currentByte!14221 (_2!12961 lt!428526)) (currentBit!14216 (_2!12961 lt!428526)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13326 (_ BitVec 64) array!17674 (_ BitVec 64) (_ BitVec 64)) tuple3!1838)

(assert (=> b!294931 (= lt!428526 (readBitsLoop!0 (_2!12962 lt!428523) nBits!523 lt!428519 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294931 (validate_offset_bits!1 ((_ sign_extend 32) (size!7661 (buf!7724 (_2!12962 lt!428523)))) ((_ sign_extend 32) (currentByte!14221 (_2!12962 lt!428523))) ((_ sign_extend 32) (currentBit!14216 (_2!12962 lt!428523))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428525 () Unit!20559)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13326 BitStream!13326 (_ BitVec 64) (_ BitVec 64)) Unit!20559)

(assert (=> b!294931 (= lt!428525 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12962 lt!428523) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428524 () (_ BitVec 32))

(declare-fun lt!428520 () (_ BitVec 32))

(assert (=> b!294931 (= lt!428519 (array!17675 (store (arr!8699 arr!273) lt!428524 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8699 arr!273) lt!428524)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428520)))) ((_ sign_extend 24) (ite (_1!12962 lt!428523) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428520) #b00000000))))) (size!7661 arr!273)))))

(assert (=> b!294931 (= lt!428520 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294931 (= lt!428524 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13326) tuple2!23208)

(assert (=> b!294931 (= lt!428523 (readBit!0 thiss!1728))))

(declare-fun b!294932 () Bool)

(declare-fun res!243523 () Bool)

(assert (=> b!294932 (=> (not res!243523) (not e!210894))))

(assert (=> b!294932 (= res!243523 (bvslt from!505 to!474))))

(declare-fun res!243524 () Bool)

(assert (=> start!65742 (=> (not res!243524) (not e!210894))))

(assert (=> start!65742 (= res!243524 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7661 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65742 e!210894))

(declare-fun e!210893 () Bool)

(declare-fun inv!12 (BitStream!13326) Bool)

(assert (=> start!65742 (and (inv!12 thiss!1728) e!210893)))

(assert (=> start!65742 true))

(declare-fun array_inv!7273 (array!17674) Bool)

(assert (=> start!65742 (array_inv!7273 arr!273)))

(declare-fun b!294933 () Bool)

(assert (=> b!294933 (= e!210892 (and (= (buf!7724 thiss!1728) (buf!7724 (_2!12961 lt!428526))) (= (size!7661 arr!273) (size!7661 (_3!1357 lt!428526)))))))

(declare-fun b!294934 () Bool)

(assert (=> b!294934 (= e!210890 (arrayBitRangesEq!0 lt!428519 (_3!1357 lt!428526) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294935 () Bool)

(assert (=> b!294935 (= e!210893 (array_inv!7273 (buf!7724 thiss!1728)))))

(declare-fun b!294936 () Bool)

(declare-fun res!243526 () Bool)

(assert (=> b!294936 (=> (not res!243526) (not e!210894))))

(assert (=> b!294936 (= res!243526 (validate_offset_bits!1 ((_ sign_extend 32) (size!7661 (buf!7724 thiss!1728))) ((_ sign_extend 32) (currentByte!14221 thiss!1728)) ((_ sign_extend 32) (currentBit!14216 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65742 res!243524) b!294936))

(assert (= (and b!294936 res!243526) b!294932))

(assert (= (and b!294932 res!243523) b!294931))

(assert (= (and b!294931 res!243527) b!294933))

(assert (= (and b!294931 (not res!243525)) b!294934))

(assert (= start!65742 b!294935))

(declare-fun m!431725 () Bool)

(assert (=> start!65742 m!431725))

(declare-fun m!431727 () Bool)

(assert (=> start!65742 m!431727))

(declare-fun m!431729 () Bool)

(assert (=> b!294934 m!431729))

(declare-fun m!431731 () Bool)

(assert (=> b!294931 m!431731))

(declare-fun m!431733 () Bool)

(assert (=> b!294931 m!431733))

(declare-fun m!431735 () Bool)

(assert (=> b!294931 m!431735))

(declare-fun m!431737 () Bool)

(assert (=> b!294931 m!431737))

(declare-fun m!431739 () Bool)

(assert (=> b!294931 m!431739))

(declare-fun m!431741 () Bool)

(assert (=> b!294931 m!431741))

(declare-fun m!431743 () Bool)

(assert (=> b!294931 m!431743))

(declare-fun m!431745 () Bool)

(assert (=> b!294931 m!431745))

(declare-fun m!431747 () Bool)

(assert (=> b!294931 m!431747))

(declare-fun m!431749 () Bool)

(assert (=> b!294931 m!431749))

(declare-fun m!431751 () Bool)

(assert (=> b!294931 m!431751))

(declare-fun m!431753 () Bool)

(assert (=> b!294931 m!431753))

(declare-fun m!431755 () Bool)

(assert (=> b!294931 m!431755))

(declare-fun m!431757 () Bool)

(assert (=> b!294935 m!431757))

(declare-fun m!431759 () Bool)

(assert (=> b!294936 m!431759))

(check-sat (not b!294936) (not b!294935) (not b!294934) (not b!294931) (not start!65742))
(check-sat)
(get-model)

(declare-fun d!99414 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99414 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14216 thiss!1728) (currentByte!14221 thiss!1728) (size!7661 (buf!7724 thiss!1728))))))

(declare-fun bs!25434 () Bool)

(assert (= bs!25434 d!99414))

(declare-fun m!431797 () Bool)

(assert (=> bs!25434 m!431797))

(assert (=> start!65742 d!99414))

(declare-fun d!99416 () Bool)

(assert (=> d!99416 (= (array_inv!7273 arr!273) (bvsge (size!7661 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65742 d!99416))

(declare-fun d!99418 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99418 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7661 (buf!7724 thiss!1728))) ((_ sign_extend 32) (currentByte!14221 thiss!1728)) ((_ sign_extend 32) (currentBit!14216 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7661 (buf!7724 thiss!1728))) ((_ sign_extend 32) (currentByte!14221 thiss!1728)) ((_ sign_extend 32) (currentBit!14216 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25435 () Bool)

(assert (= bs!25435 d!99418))

(declare-fun m!431799 () Bool)

(assert (=> bs!25435 m!431799))

(assert (=> b!294936 d!99418))

(declare-fun d!99420 () Bool)

(assert (=> d!99420 (= (array_inv!7273 (buf!7724 thiss!1728)) (bvsge (size!7661 (buf!7724 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!294935 d!99420))

(declare-fun b!294969 () Bool)

(declare-fun res!243554 () Bool)

(declare-fun lt!428557 () (_ BitVec 32))

(assert (=> b!294969 (= res!243554 (= lt!428557 #b00000000000000000000000000000000))))

(declare-fun e!210925 () Bool)

(assert (=> b!294969 (=> res!243554 e!210925)))

(declare-fun e!210929 () Bool)

(assert (=> b!294969 (= e!210929 e!210925)))

(declare-fun b!294970 () Bool)

(declare-fun e!210930 () Bool)

(declare-fun e!210926 () Bool)

(assert (=> b!294970 (= e!210930 e!210926)))

(declare-fun res!243553 () Bool)

(assert (=> b!294970 (=> (not res!243553) (not e!210926))))

(declare-fun e!210928 () Bool)

(assert (=> b!294970 (= res!243553 e!210928)))

(declare-fun res!243556 () Bool)

(assert (=> b!294970 (=> res!243556 e!210928)))

(declare-datatypes ((tuple4!876 0))(
  ( (tuple4!877 (_1!12965 (_ BitVec 32)) (_2!12965 (_ BitVec 32)) (_3!1359 (_ BitVec 32)) (_4!438 (_ BitVec 32))) )
))
(declare-fun lt!428558 () tuple4!876)

(assert (=> b!294970 (= res!243556 (bvsge (_1!12965 lt!428558) (_2!12965 lt!428558)))))

(assert (=> b!294970 (= lt!428557 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428559 () (_ BitVec 32))

(assert (=> b!294970 (= lt!428559 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!876)

(assert (=> b!294970 (= lt!428558 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294971 () Bool)

(declare-fun e!210927 () Bool)

(assert (=> b!294971 (= e!210926 e!210927)))

(declare-fun c!13431 () Bool)

(assert (=> b!294971 (= c!13431 (= (_3!1359 lt!428558) (_4!438 lt!428558)))))

(declare-fun b!294973 () Bool)

(assert (=> b!294973 (= e!210927 e!210929)))

(declare-fun res!243555 () Bool)

(declare-fun call!5033 () Bool)

(assert (=> b!294973 (= res!243555 call!5033)))

(assert (=> b!294973 (=> (not res!243555) (not e!210929))))

(declare-fun b!294974 () Bool)

(declare-fun arrayRangesEq!1496 (array!17674 array!17674 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!294974 (= e!210928 (arrayRangesEq!1496 lt!428519 (_3!1357 lt!428526) (_1!12965 lt!428558) (_2!12965 lt!428558)))))

(declare-fun b!294975 () Bool)

(assert (=> b!294975 (= e!210927 call!5033)))

(declare-fun bm!5030 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5030 (= call!5033 (byteRangesEq!0 (select (arr!8699 lt!428519) (_3!1359 lt!428558)) (select (arr!8699 (_3!1357 lt!428526)) (_3!1359 lt!428558)) lt!428559 (ite c!13431 lt!428557 #b00000000000000000000000000001000)))))

(declare-fun d!99422 () Bool)

(declare-fun res!243557 () Bool)

(assert (=> d!99422 (=> res!243557 e!210930)))

(assert (=> d!99422 (= res!243557 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99422 (= (arrayBitRangesEq!0 lt!428519 (_3!1357 lt!428526) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) e!210930)))

(declare-fun b!294972 () Bool)

(assert (=> b!294972 (= e!210925 (byteRangesEq!0 (select (arr!8699 lt!428519) (_4!438 lt!428558)) (select (arr!8699 (_3!1357 lt!428526)) (_4!438 lt!428558)) #b00000000000000000000000000000000 lt!428557))))

(assert (= (and d!99422 (not res!243557)) b!294970))

(assert (= (and b!294970 (not res!243556)) b!294974))

(assert (= (and b!294970 res!243553) b!294971))

(assert (= (and b!294971 c!13431) b!294975))

(assert (= (and b!294971 (not c!13431)) b!294973))

(assert (= (and b!294973 res!243555) b!294969))

(assert (= (and b!294969 (not res!243554)) b!294972))

(assert (= (or b!294975 b!294973) bm!5030))

(declare-fun m!431801 () Bool)

(assert (=> b!294970 m!431801))

(declare-fun m!431803 () Bool)

(assert (=> b!294974 m!431803))

(declare-fun m!431805 () Bool)

(assert (=> bm!5030 m!431805))

(declare-fun m!431807 () Bool)

(assert (=> bm!5030 m!431807))

(assert (=> bm!5030 m!431805))

(assert (=> bm!5030 m!431807))

(declare-fun m!431809 () Bool)

(assert (=> bm!5030 m!431809))

(declare-fun m!431811 () Bool)

(assert (=> b!294972 m!431811))

(declare-fun m!431813 () Bool)

(assert (=> b!294972 m!431813))

(assert (=> b!294972 m!431811))

(assert (=> b!294972 m!431813))

(declare-fun m!431815 () Bool)

(assert (=> b!294972 m!431815))

(assert (=> b!294934 d!99422))

(declare-fun d!99424 () Bool)

(assert (=> d!99424 (arrayBitRangesEq!0 arr!273 (_3!1357 lt!428526) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428562 () Unit!20559)

(declare-fun choose!49 (array!17674 array!17674 array!17674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20559)

(assert (=> d!99424 (= lt!428562 (choose!49 arr!273 lt!428519 (_3!1357 lt!428526) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99424 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99424 (= (arrayBitRangesEqTransitive!0 arr!273 lt!428519 (_3!1357 lt!428526) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!428562)))

(declare-fun bs!25436 () Bool)

(assert (= bs!25436 d!99424))

(assert (=> bs!25436 m!431745))

(declare-fun m!431817 () Bool)

(assert (=> bs!25436 m!431817))

(assert (=> b!294931 d!99424))

(declare-fun b!294976 () Bool)

(declare-fun res!243559 () Bool)

(declare-fun lt!428563 () (_ BitVec 32))

(assert (=> b!294976 (= res!243559 (= lt!428563 #b00000000000000000000000000000000))))

(declare-fun e!210931 () Bool)

(assert (=> b!294976 (=> res!243559 e!210931)))

(declare-fun e!210935 () Bool)

(assert (=> b!294976 (= e!210935 e!210931)))

(declare-fun b!294977 () Bool)

(declare-fun e!210936 () Bool)

(declare-fun e!210932 () Bool)

(assert (=> b!294977 (= e!210936 e!210932)))

(declare-fun res!243558 () Bool)

(assert (=> b!294977 (=> (not res!243558) (not e!210932))))

(declare-fun e!210934 () Bool)

(assert (=> b!294977 (= res!243558 e!210934)))

(declare-fun res!243561 () Bool)

(assert (=> b!294977 (=> res!243561 e!210934)))

(declare-fun lt!428564 () tuple4!876)

(assert (=> b!294977 (= res!243561 (bvsge (_1!12965 lt!428564) (_2!12965 lt!428564)))))

(assert (=> b!294977 (= lt!428563 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428565 () (_ BitVec 32))

(assert (=> b!294977 (= lt!428565 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294977 (= lt!428564 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!294978 () Bool)

(declare-fun e!210933 () Bool)

(assert (=> b!294978 (= e!210932 e!210933)))

(declare-fun c!13432 () Bool)

(assert (=> b!294978 (= c!13432 (= (_3!1359 lt!428564) (_4!438 lt!428564)))))

(declare-fun b!294980 () Bool)

(assert (=> b!294980 (= e!210933 e!210935)))

(declare-fun res!243560 () Bool)

(declare-fun call!5034 () Bool)

(assert (=> b!294980 (= res!243560 call!5034)))

(assert (=> b!294980 (=> (not res!243560) (not e!210935))))

(declare-fun b!294981 () Bool)

(assert (=> b!294981 (= e!210934 (arrayRangesEq!1496 arr!273 lt!428519 (_1!12965 lt!428564) (_2!12965 lt!428564)))))

(declare-fun b!294982 () Bool)

(assert (=> b!294982 (= e!210933 call!5034)))

(declare-fun bm!5031 () Bool)

(assert (=> bm!5031 (= call!5034 (byteRangesEq!0 (select (arr!8699 arr!273) (_3!1359 lt!428564)) (select (arr!8699 lt!428519) (_3!1359 lt!428564)) lt!428565 (ite c!13432 lt!428563 #b00000000000000000000000000001000)))))

(declare-fun d!99426 () Bool)

(declare-fun res!243562 () Bool)

(assert (=> d!99426 (=> res!243562 e!210936)))

(assert (=> d!99426 (= res!243562 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99426 (= (arrayBitRangesEq!0 arr!273 lt!428519 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!210936)))

(declare-fun b!294979 () Bool)

(assert (=> b!294979 (= e!210931 (byteRangesEq!0 (select (arr!8699 arr!273) (_4!438 lt!428564)) (select (arr!8699 lt!428519) (_4!438 lt!428564)) #b00000000000000000000000000000000 lt!428563))))

(assert (= (and d!99426 (not res!243562)) b!294977))

(assert (= (and b!294977 (not res!243561)) b!294981))

(assert (= (and b!294977 res!243558) b!294978))

(assert (= (and b!294978 c!13432) b!294982))

(assert (= (and b!294978 (not c!13432)) b!294980))

(assert (= (and b!294980 res!243560) b!294976))

(assert (= (and b!294976 (not res!243559)) b!294979))

(assert (= (or b!294982 b!294980) bm!5031))

(declare-fun m!431819 () Bool)

(assert (=> b!294977 m!431819))

(declare-fun m!431821 () Bool)

(assert (=> b!294981 m!431821))

(declare-fun m!431823 () Bool)

(assert (=> bm!5031 m!431823))

(declare-fun m!431825 () Bool)

(assert (=> bm!5031 m!431825))

(assert (=> bm!5031 m!431823))

(assert (=> bm!5031 m!431825))

(declare-fun m!431827 () Bool)

(assert (=> bm!5031 m!431827))

(declare-fun m!431829 () Bool)

(assert (=> b!294979 m!431829))

(declare-fun m!431831 () Bool)

(assert (=> b!294979 m!431831))

(assert (=> b!294979 m!431829))

(assert (=> b!294979 m!431831))

(declare-fun m!431833 () Bool)

(assert (=> b!294979 m!431833))

(assert (=> b!294931 d!99426))

(declare-fun d!99428 () Bool)

(declare-fun e!210939 () Bool)

(assert (=> d!99428 e!210939))

(declare-fun res!243565 () Bool)

(assert (=> d!99428 (=> (not res!243565) (not e!210939))))

(declare-fun lt!428576 () (_ BitVec 32))

(assert (=> d!99428 (= res!243565 (and (bvsge lt!428576 #b00000000000000000000000000000000) (bvslt lt!428576 (size!7661 arr!273))))))

(declare-fun lt!428577 () (_ BitVec 8))

(declare-fun lt!428575 () (_ BitVec 32))

(declare-fun lt!428574 () Unit!20559)

(declare-fun choose!53 (array!17674 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20559)

(assert (=> d!99428 (= lt!428574 (choose!53 arr!273 from!505 (_1!12962 lt!428523) lt!428576 lt!428575 lt!428577))))

(assert (=> d!99428 (= lt!428577 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8699 arr!273) lt!428576)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428575)))) ((_ sign_extend 24) (ite (_1!12962 lt!428523) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428575) #b00000000)))))))

(assert (=> d!99428 (= lt!428575 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99428 (= lt!428576 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99428 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12962 lt!428523)) lt!428574)))

(declare-fun b!294986 () Bool)

(assert (=> b!294986 (= e!210939 (arrayBitRangesEq!0 arr!273 (array!17675 (store (arr!8699 arr!273) lt!428576 lt!428577) (size!7661 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99428 res!243565) b!294986))

(declare-fun m!431837 () Bool)

(assert (=> d!99428 m!431837))

(declare-fun m!431839 () Bool)

(assert (=> d!99428 m!431839))

(declare-fun m!431841 () Bool)

(assert (=> d!99428 m!431841))

(declare-fun m!431843 () Bool)

(assert (=> b!294986 m!431843))

(declare-fun m!431845 () Bool)

(assert (=> b!294986 m!431845))

(assert (=> b!294931 d!99428))

(declare-fun d!99438 () Bool)

(declare-fun e!210942 () Bool)

(assert (=> d!99438 e!210942))

(declare-fun res!243570 () Bool)

(assert (=> d!99438 (=> (not res!243570) (not e!210942))))

(declare-fun lt!428591 () (_ BitVec 64))

(declare-fun lt!428592 () (_ BitVec 64))

(declare-fun lt!428593 () (_ BitVec 64))

(assert (=> d!99438 (= res!243570 (= lt!428591 (bvsub lt!428592 lt!428593)))))

(assert (=> d!99438 (or (= (bvand lt!428592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!428593 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428592 lt!428593) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99438 (= lt!428593 (remainingBits!0 ((_ sign_extend 32) (size!7661 (buf!7724 thiss!1728))) ((_ sign_extend 32) (currentByte!14221 thiss!1728)) ((_ sign_extend 32) (currentBit!14216 thiss!1728))))))

(declare-fun lt!428594 () (_ BitVec 64))

(declare-fun lt!428590 () (_ BitVec 64))

(assert (=> d!99438 (= lt!428592 (bvmul lt!428594 lt!428590))))

(assert (=> d!99438 (or (= lt!428594 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!428590 (bvsdiv (bvmul lt!428594 lt!428590) lt!428594)))))

(assert (=> d!99438 (= lt!428590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99438 (= lt!428594 ((_ sign_extend 32) (size!7661 (buf!7724 thiss!1728))))))

(assert (=> d!99438 (= lt!428591 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14221 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14216 thiss!1728))))))

(assert (=> d!99438 (invariant!0 (currentBit!14216 thiss!1728) (currentByte!14221 thiss!1728) (size!7661 (buf!7724 thiss!1728)))))

(assert (=> d!99438 (= (bitIndex!0 (size!7661 (buf!7724 thiss!1728)) (currentByte!14221 thiss!1728) (currentBit!14216 thiss!1728)) lt!428591)))

(declare-fun b!294991 () Bool)

(declare-fun res!243571 () Bool)

(assert (=> b!294991 (=> (not res!243571) (not e!210942))))

(assert (=> b!294991 (= res!243571 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!428591))))

(declare-fun b!294992 () Bool)

(declare-fun lt!428595 () (_ BitVec 64))

(assert (=> b!294992 (= e!210942 (bvsle lt!428591 (bvmul lt!428595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294992 (or (= lt!428595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!428595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!428595)))))

(assert (=> b!294992 (= lt!428595 ((_ sign_extend 32) (size!7661 (buf!7724 thiss!1728))))))

(assert (= (and d!99438 res!243570) b!294991))

(assert (= (and b!294991 res!243571) b!294992))

(assert (=> d!99438 m!431799))

(assert (=> d!99438 m!431797))

(assert (=> b!294931 d!99438))

(declare-fun d!99440 () Bool)

(assert (=> d!99440 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7661 (buf!7724 (_2!12962 lt!428523)))) ((_ sign_extend 32) (currentByte!14221 (_2!12962 lt!428523))) ((_ sign_extend 32) (currentBit!14216 (_2!12962 lt!428523))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7661 (buf!7724 (_2!12962 lt!428523)))) ((_ sign_extend 32) (currentByte!14221 (_2!12962 lt!428523))) ((_ sign_extend 32) (currentBit!14216 (_2!12962 lt!428523)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25438 () Bool)

(assert (= bs!25438 d!99440))

(declare-fun m!431847 () Bool)

(assert (=> bs!25438 m!431847))

(assert (=> b!294931 d!99440))

(declare-fun d!99442 () Bool)

(declare-fun e!210945 () Bool)

(assert (=> d!99442 e!210945))

(declare-fun res!243574 () Bool)

(assert (=> d!99442 (=> (not res!243574) (not e!210945))))

(assert (=> d!99442 (= res!243574 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428598 () Unit!20559)

(declare-fun choose!27 (BitStream!13326 BitStream!13326 (_ BitVec 64) (_ BitVec 64)) Unit!20559)

(assert (=> d!99442 (= lt!428598 (choose!27 thiss!1728 (_2!12962 lt!428523) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99442 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99442 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12962 lt!428523) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!428598)))

(declare-fun b!294995 () Bool)

(assert (=> b!294995 (= e!210945 (validate_offset_bits!1 ((_ sign_extend 32) (size!7661 (buf!7724 (_2!12962 lt!428523)))) ((_ sign_extend 32) (currentByte!14221 (_2!12962 lt!428523))) ((_ sign_extend 32) (currentBit!14216 (_2!12962 lt!428523))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99442 res!243574) b!294995))

(declare-fun m!431849 () Bool)

(assert (=> d!99442 m!431849))

(assert (=> b!294995 m!431737))

(assert (=> b!294931 d!99442))

(declare-fun b!294996 () Bool)

(declare-fun res!243576 () Bool)

(declare-fun lt!428599 () (_ BitVec 32))

(assert (=> b!294996 (= res!243576 (= lt!428599 #b00000000000000000000000000000000))))

(declare-fun e!210946 () Bool)

(assert (=> b!294996 (=> res!243576 e!210946)))

(declare-fun e!210950 () Bool)

(assert (=> b!294996 (= e!210950 e!210946)))

(declare-fun b!294997 () Bool)

(declare-fun e!210951 () Bool)

(declare-fun e!210947 () Bool)

(assert (=> b!294997 (= e!210951 e!210947)))

(declare-fun res!243575 () Bool)

(assert (=> b!294997 (=> (not res!243575) (not e!210947))))

(declare-fun e!210949 () Bool)

(assert (=> b!294997 (= res!243575 e!210949)))

(declare-fun res!243578 () Bool)

(assert (=> b!294997 (=> res!243578 e!210949)))

(declare-fun lt!428600 () tuple4!876)

(assert (=> b!294997 (= res!243578 (bvsge (_1!12965 lt!428600) (_2!12965 lt!428600)))))

(assert (=> b!294997 (= lt!428599 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428601 () (_ BitVec 32))

(assert (=> b!294997 (= lt!428601 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294997 (= lt!428600 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!294998 () Bool)

(declare-fun e!210948 () Bool)

(assert (=> b!294998 (= e!210947 e!210948)))

(declare-fun c!13433 () Bool)

(assert (=> b!294998 (= c!13433 (= (_3!1359 lt!428600) (_4!438 lt!428600)))))

(declare-fun b!295000 () Bool)

(assert (=> b!295000 (= e!210948 e!210950)))

(declare-fun res!243577 () Bool)

(declare-fun call!5035 () Bool)

(assert (=> b!295000 (= res!243577 call!5035)))

(assert (=> b!295000 (=> (not res!243577) (not e!210950))))

(declare-fun b!295001 () Bool)

(assert (=> b!295001 (= e!210949 (arrayRangesEq!1496 arr!273 (_3!1357 lt!428526) (_1!12965 lt!428600) (_2!12965 lt!428600)))))

(declare-fun b!295002 () Bool)

(assert (=> b!295002 (= e!210948 call!5035)))

(declare-fun bm!5032 () Bool)

(assert (=> bm!5032 (= call!5035 (byteRangesEq!0 (select (arr!8699 arr!273) (_3!1359 lt!428600)) (select (arr!8699 (_3!1357 lt!428526)) (_3!1359 lt!428600)) lt!428601 (ite c!13433 lt!428599 #b00000000000000000000000000001000)))))

(declare-fun d!99444 () Bool)

(declare-fun res!243579 () Bool)

(assert (=> d!99444 (=> res!243579 e!210951)))

(assert (=> d!99444 (= res!243579 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99444 (= (arrayBitRangesEq!0 arr!273 (_3!1357 lt!428526) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!210951)))

(declare-fun b!294999 () Bool)

(assert (=> b!294999 (= e!210946 (byteRangesEq!0 (select (arr!8699 arr!273) (_4!438 lt!428600)) (select (arr!8699 (_3!1357 lt!428526)) (_4!438 lt!428600)) #b00000000000000000000000000000000 lt!428599))))

(assert (= (and d!99444 (not res!243579)) b!294997))

(assert (= (and b!294997 (not res!243578)) b!295001))

(assert (= (and b!294997 res!243575) b!294998))

(assert (= (and b!294998 c!13433) b!295002))

(assert (= (and b!294998 (not c!13433)) b!295000))

(assert (= (and b!295000 res!243577) b!294996))

(assert (= (and b!294996 (not res!243576)) b!294999))

(assert (= (or b!295002 b!295000) bm!5032))

(assert (=> b!294997 m!431819))

(declare-fun m!431851 () Bool)

(assert (=> b!295001 m!431851))

(declare-fun m!431853 () Bool)

(assert (=> bm!5032 m!431853))

(declare-fun m!431855 () Bool)

(assert (=> bm!5032 m!431855))

(assert (=> bm!5032 m!431853))

(assert (=> bm!5032 m!431855))

(declare-fun m!431857 () Bool)

(assert (=> bm!5032 m!431857))

(declare-fun m!431859 () Bool)

(assert (=> b!294999 m!431859))

(declare-fun m!431861 () Bool)

(assert (=> b!294999 m!431861))

(assert (=> b!294999 m!431859))

(assert (=> b!294999 m!431861))

(declare-fun m!431863 () Bool)

(assert (=> b!294999 m!431863))

(assert (=> b!294931 d!99444))

(declare-fun b!295052 () Bool)

(declare-fun e!210987 () tuple3!1838)

(declare-fun lt!428732 () Unit!20559)

(declare-fun lt!428729 () tuple3!1838)

(assert (=> b!295052 (= e!210987 (tuple3!1839 lt!428732 (_2!12961 lt!428729) (_3!1357 lt!428729)))))

(declare-fun lt!428743 () tuple2!23208)

(assert (=> b!295052 (= lt!428743 (readBit!0 (_2!12962 lt!428523)))))

(declare-fun lt!428727 () (_ BitVec 32))

(assert (=> b!295052 (= lt!428727 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428731 () (_ BitVec 32))

(assert (=> b!295052 (= lt!428731 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428734 () array!17674)

(assert (=> b!295052 (= lt!428734 (array!17675 (store (arr!8699 lt!428519) lt!428727 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8699 lt!428519) lt!428727)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428731)))) ((_ sign_extend 24) (ite (_1!12962 lt!428743) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428731) #b00000000))))) (size!7661 lt!428519)))))

(declare-fun lt!428744 () (_ BitVec 64))

(assert (=> b!295052 (= lt!428744 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!428726 () (_ BitVec 64))

(assert (=> b!295052 (= lt!428726 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!428728 () Unit!20559)

(assert (=> b!295052 (= lt!428728 (validateOffsetBitsIneqLemma!0 (_2!12962 lt!428523) (_2!12962 lt!428743) lt!428744 lt!428726))))

(assert (=> b!295052 (validate_offset_bits!1 ((_ sign_extend 32) (size!7661 (buf!7724 (_2!12962 lt!428743)))) ((_ sign_extend 32) (currentByte!14221 (_2!12962 lt!428743))) ((_ sign_extend 32) (currentBit!14216 (_2!12962 lt!428743))) (bvsub lt!428744 lt!428726))))

(declare-fun lt!428716 () Unit!20559)

(assert (=> b!295052 (= lt!428716 lt!428728)))

(assert (=> b!295052 (= lt!428729 (readBitsLoop!0 (_2!12962 lt!428743) nBits!523 lt!428734 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!243619 () Bool)

(assert (=> b!295052 (= res!243619 (= (bvsub (bvadd (bitIndex!0 (size!7661 (buf!7724 (_2!12962 lt!428523))) (currentByte!14221 (_2!12962 lt!428523)) (currentBit!14216 (_2!12962 lt!428523))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7661 (buf!7724 (_2!12961 lt!428729))) (currentByte!14221 (_2!12961 lt!428729)) (currentBit!14216 (_2!12961 lt!428729)))))))

(declare-fun e!210984 () Bool)

(assert (=> b!295052 (=> (not res!243619) (not e!210984))))

(assert (=> b!295052 e!210984))

(declare-fun lt!428730 () Unit!20559)

(declare-fun Unit!20563 () Unit!20559)

(assert (=> b!295052 (= lt!428730 Unit!20563)))

(declare-fun lt!428719 () (_ BitVec 32))

(assert (=> b!295052 (= lt!428719 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428751 () (_ BitVec 32))

(assert (=> b!295052 (= lt!428751 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428725 () Unit!20559)

(assert (=> b!295052 (= lt!428725 (arrayBitRangesUpdatedAtLemma!0 lt!428519 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12962 lt!428743)))))

(assert (=> b!295052 (arrayBitRangesEq!0 lt!428519 (array!17675 (store (arr!8699 lt!428519) lt!428719 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8699 lt!428519) lt!428719)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428751)))) ((_ sign_extend 24) (ite (_1!12962 lt!428743) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428751) #b00000000))))) (size!7661 lt!428519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!428722 () Unit!20559)

(assert (=> b!295052 (= lt!428722 lt!428725)))

(declare-fun lt!428733 () (_ BitVec 64))

(assert (=> b!295052 (= lt!428733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428736 () Unit!20559)

(assert (=> b!295052 (= lt!428736 (arrayBitRangesEqTransitive!0 lt!428519 lt!428734 (_3!1357 lt!428729) lt!428733 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!5043 () Bool)

(assert (=> b!295052 call!5043))

(declare-fun lt!428720 () Unit!20559)

(assert (=> b!295052 (= lt!428720 lt!428736)))

(declare-fun call!5044 () Bool)

(assert (=> b!295052 call!5044))

(declare-fun lt!428717 () Unit!20559)

(declare-fun Unit!20564 () Unit!20559)

(assert (=> b!295052 (= lt!428717 Unit!20564)))

(declare-fun lt!428745 () Unit!20559)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17674 array!17674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20559)

(assert (=> b!295052 (= lt!428745 (arrayBitRangesEqImpliesEq!0 lt!428734 (_3!1357 lt!428729) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!17674 (_ BitVec 64)) Bool)

(assert (=> b!295052 (= (bitAt!0 lt!428734 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1357 lt!428729) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!428723 () Unit!20559)

(assert (=> b!295052 (= lt!428723 lt!428745)))

(declare-fun lt!428724 () Unit!20559)

(declare-fun Unit!20565 () Unit!20559)

(assert (=> b!295052 (= lt!428724 Unit!20565)))

(declare-fun lt!428742 () Bool)

(assert (=> b!295052 (= lt!428742 (= (bitAt!0 (_3!1357 lt!428729) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12962 lt!428743)))))

(declare-fun Unit!20566 () Unit!20559)

(assert (=> b!295052 (= lt!428732 Unit!20566)))

(assert (=> b!295052 lt!428742))

(declare-fun b!295053 () Bool)

(assert (=> b!295053 (= e!210984 (and (= (buf!7724 (_2!12962 lt!428523)) (buf!7724 (_2!12961 lt!428729))) (= (size!7661 lt!428519) (size!7661 (_3!1357 lt!428729)))))))

(declare-fun e!210985 () Bool)

(declare-fun lt!428747 () tuple3!1838)

(declare-fun b!295054 () Bool)

(declare-datatypes ((tuple2!23212 0))(
  ( (tuple2!23213 (_1!12966 BitStream!13326) (_2!12966 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13326) tuple2!23212)

(assert (=> b!295054 (= e!210985 (= (bitAt!0 (_3!1357 lt!428747) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12966 (readBitPure!0 (_2!12962 lt!428523)))))))

(declare-fun b!295056 () Bool)

(declare-fun res!243622 () Bool)

(declare-fun e!210986 () Bool)

(assert (=> b!295056 (=> (not res!243622) (not e!210986))))

(assert (=> b!295056 (= res!243622 (invariant!0 (currentBit!14216 (_2!12961 lt!428747)) (currentByte!14221 (_2!12961 lt!428747)) (size!7661 (buf!7724 (_2!12961 lt!428747)))))))

(declare-fun b!295057 () Bool)

(declare-fun res!243620 () Bool)

(assert (=> b!295057 (=> (not res!243620) (not e!210986))))

(assert (=> b!295057 (= res!243620 (arrayBitRangesEq!0 lt!428519 (_3!1357 lt!428747) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!428750 () (_ BitVec 64))

(declare-fun lt!428721 () (_ BitVec 64))

(declare-fun c!13439 () Bool)

(declare-fun lt!428738 () array!17674)

(declare-fun bm!5040 () Bool)

(declare-fun lt!428746 () array!17674)

(assert (=> bm!5040 (= call!5044 (arrayBitRangesEq!0 (ite c!13439 lt!428519 lt!428738) (ite c!13439 (_3!1357 lt!428729) lt!428746) (ite c!13439 #b0000000000000000000000000000000000000000000000000000000000000000 lt!428721) (ite c!13439 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!428750)))))

(declare-fun b!295058 () Bool)

(declare-fun res!243624 () Bool)

(assert (=> b!295058 (=> (not res!243624) (not e!210986))))

(assert (=> b!295058 (= res!243624 (and (= (buf!7724 (_2!12962 lt!428523)) (buf!7724 (_2!12961 lt!428747))) (= (size!7661 lt!428519) (size!7661 (_3!1357 lt!428747)))))))

(declare-fun bm!5041 () Bool)

(assert (=> bm!5041 (= call!5043 (arrayBitRangesEq!0 lt!428519 (ite c!13439 (_3!1357 lt!428729) lt!428519) (ite c!13439 lt!428733 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13439 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7661 lt!428519)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!295055 () Bool)

(declare-fun res!243618 () Bool)

(assert (=> b!295055 (=> (not res!243618) (not e!210986))))

(assert (=> b!295055 (= res!243618 e!210985)))

(declare-fun res!243621 () Bool)

(assert (=> b!295055 (=> res!243621 e!210985)))

(assert (=> b!295055 (= res!243621 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun d!99446 () Bool)

(assert (=> d!99446 e!210986))

(declare-fun res!243623 () Bool)

(assert (=> d!99446 (=> (not res!243623) (not e!210986))))

(declare-fun lt!428739 () (_ BitVec 64))

(assert (=> d!99446 (= res!243623 (= (bvsub lt!428739 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7661 (buf!7724 (_2!12961 lt!428747))) (currentByte!14221 (_2!12961 lt!428747)) (currentBit!14216 (_2!12961 lt!428747)))))))

(assert (=> d!99446 (or (= (bvand lt!428739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428739 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!428741 () (_ BitVec 64))

(assert (=> d!99446 (= lt!428739 (bvadd lt!428741 to!474))))

(assert (=> d!99446 (or (not (= (bvand lt!428741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!428741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!428741 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99446 (= lt!428741 (bitIndex!0 (size!7661 (buf!7724 (_2!12962 lt!428523))) (currentByte!14221 (_2!12962 lt!428523)) (currentBit!14216 (_2!12962 lt!428523))))))

(assert (=> d!99446 (= lt!428747 e!210987)))

(assert (=> d!99446 (= c!13439 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99446 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99446 (= (readBitsLoop!0 (_2!12962 lt!428523) nBits!523 lt!428519 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!428747)))

(declare-fun b!295059 () Bool)

(declare-fun lt!428735 () Unit!20559)

(assert (=> b!295059 (= e!210987 (tuple3!1839 lt!428735 (_2!12962 lt!428523) lt!428519))))

(declare-fun lt!428740 () Unit!20559)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17674) Unit!20559)

(assert (=> b!295059 (= lt!428740 (arrayBitRangesEqReflexiveLemma!0 lt!428519))))

(assert (=> b!295059 call!5043))

(declare-fun lt!428737 () Unit!20559)

(assert (=> b!295059 (= lt!428737 lt!428740)))

(assert (=> b!295059 (= lt!428738 lt!428519)))

(assert (=> b!295059 (= lt!428746 lt!428519)))

(declare-fun lt!428749 () (_ BitVec 64))

(assert (=> b!295059 (= lt!428749 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428748 () (_ BitVec 64))

(assert (=> b!295059 (= lt!428748 ((_ sign_extend 32) (size!7661 lt!428519)))))

(declare-fun lt!428718 () (_ BitVec 64))

(assert (=> b!295059 (= lt!428718 (bvmul lt!428748 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!295059 (= lt!428721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!295059 (= lt!428750 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17674 array!17674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20559)

(assert (=> b!295059 (= lt!428735 (arrayBitRangesEqSlicedLemma!0 lt!428738 lt!428746 lt!428749 lt!428718 lt!428721 lt!428750))))

(assert (=> b!295059 call!5044))

(declare-fun b!295060 () Bool)

(declare-datatypes ((List!978 0))(
  ( (Nil!975) (Cons!974 (h!1093 Bool) (t!1863 List!978)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13326 array!17674 (_ BitVec 64) (_ BitVec 64)) List!978)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13326 BitStream!13326 (_ BitVec 64)) List!978)

(assert (=> b!295060 (= e!210986 (= (byteArrayBitContentToList!0 (_2!12961 lt!428747) (_3!1357 lt!428747) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12961 lt!428747) (_2!12962 lt!428523) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295060 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295060 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!99446 c!13439) b!295052))

(assert (= (and d!99446 (not c!13439)) b!295059))

(assert (= (and b!295052 res!243619) b!295053))

(assert (= (or b!295052 b!295059) bm!5040))

(assert (= (or b!295052 b!295059) bm!5041))

(assert (= (and d!99446 res!243623) b!295058))

(assert (= (and b!295058 res!243624) b!295057))

(assert (= (and b!295057 res!243620) b!295055))

(assert (= (and b!295055 (not res!243621)) b!295054))

(assert (= (and b!295055 res!243618) b!295056))

(assert (= (and b!295056 res!243622) b!295060))

(declare-fun m!431897 () Bool)

(assert (=> b!295052 m!431897))

(declare-fun m!431899 () Bool)

(assert (=> b!295052 m!431899))

(declare-fun m!431901 () Bool)

(assert (=> b!295052 m!431901))

(declare-fun m!431903 () Bool)

(assert (=> b!295052 m!431903))

(declare-fun m!431905 () Bool)

(assert (=> b!295052 m!431905))

(declare-fun m!431907 () Bool)

(assert (=> b!295052 m!431907))

(declare-fun m!431909 () Bool)

(assert (=> b!295052 m!431909))

(declare-fun m!431911 () Bool)

(assert (=> b!295052 m!431911))

(declare-fun m!431913 () Bool)

(assert (=> b!295052 m!431913))

(declare-fun m!431915 () Bool)

(assert (=> b!295052 m!431915))

(declare-fun m!431917 () Bool)

(assert (=> b!295052 m!431917))

(declare-fun m!431919 () Bool)

(assert (=> b!295052 m!431919))

(declare-fun m!431921 () Bool)

(assert (=> b!295052 m!431921))

(declare-fun m!431923 () Bool)

(assert (=> b!295052 m!431923))

(declare-fun m!431925 () Bool)

(assert (=> b!295052 m!431925))

(declare-fun m!431927 () Bool)

(assert (=> b!295052 m!431927))

(declare-fun m!431929 () Bool)

(assert (=> b!295052 m!431929))

(declare-fun m!431931 () Bool)

(assert (=> b!295052 m!431931))

(declare-fun m!431933 () Bool)

(assert (=> b!295056 m!431933))

(declare-fun m!431935 () Bool)

(assert (=> b!295054 m!431935))

(declare-fun m!431937 () Bool)

(assert (=> b!295054 m!431937))

(declare-fun m!431939 () Bool)

(assert (=> bm!5041 m!431939))

(declare-fun m!431941 () Bool)

(assert (=> d!99446 m!431941))

(assert (=> d!99446 m!431907))

(declare-fun m!431943 () Bool)

(assert (=> b!295057 m!431943))

(declare-fun m!431945 () Bool)

(assert (=> b!295060 m!431945))

(declare-fun m!431947 () Bool)

(assert (=> b!295060 m!431947))

(declare-fun m!431949 () Bool)

(assert (=> b!295059 m!431949))

(declare-fun m!431951 () Bool)

(assert (=> b!295059 m!431951))

(declare-fun m!431953 () Bool)

(assert (=> bm!5040 m!431953))

(assert (=> b!294931 d!99446))

(declare-fun d!99466 () Bool)

(declare-fun e!210988 () Bool)

(assert (=> d!99466 e!210988))

(declare-fun res!243625 () Bool)

(assert (=> d!99466 (=> (not res!243625) (not e!210988))))

(declare-fun lt!428753 () (_ BitVec 64))

(declare-fun lt!428754 () (_ BitVec 64))

(declare-fun lt!428755 () (_ BitVec 64))

(assert (=> d!99466 (= res!243625 (= lt!428753 (bvsub lt!428754 lt!428755)))))

(assert (=> d!99466 (or (= (bvand lt!428754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!428755 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428754 lt!428755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99466 (= lt!428755 (remainingBits!0 ((_ sign_extend 32) (size!7661 (buf!7724 (_2!12961 lt!428526)))) ((_ sign_extend 32) (currentByte!14221 (_2!12961 lt!428526))) ((_ sign_extend 32) (currentBit!14216 (_2!12961 lt!428526)))))))

(declare-fun lt!428756 () (_ BitVec 64))

(declare-fun lt!428752 () (_ BitVec 64))

(assert (=> d!99466 (= lt!428754 (bvmul lt!428756 lt!428752))))

(assert (=> d!99466 (or (= lt!428756 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!428752 (bvsdiv (bvmul lt!428756 lt!428752) lt!428756)))))

(assert (=> d!99466 (= lt!428752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99466 (= lt!428756 ((_ sign_extend 32) (size!7661 (buf!7724 (_2!12961 lt!428526)))))))

(assert (=> d!99466 (= lt!428753 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14221 (_2!12961 lt!428526))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14216 (_2!12961 lt!428526)))))))

(assert (=> d!99466 (invariant!0 (currentBit!14216 (_2!12961 lt!428526)) (currentByte!14221 (_2!12961 lt!428526)) (size!7661 (buf!7724 (_2!12961 lt!428526))))))

(assert (=> d!99466 (= (bitIndex!0 (size!7661 (buf!7724 (_2!12961 lt!428526))) (currentByte!14221 (_2!12961 lt!428526)) (currentBit!14216 (_2!12961 lt!428526))) lt!428753)))

(declare-fun b!295061 () Bool)

(declare-fun res!243626 () Bool)

(assert (=> b!295061 (=> (not res!243626) (not e!210988))))

(assert (=> b!295061 (= res!243626 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!428753))))

(declare-fun b!295062 () Bool)

(declare-fun lt!428757 () (_ BitVec 64))

(assert (=> b!295062 (= e!210988 (bvsle lt!428753 (bvmul lt!428757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295062 (or (= lt!428757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!428757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!428757)))))

(assert (=> b!295062 (= lt!428757 ((_ sign_extend 32) (size!7661 (buf!7724 (_2!12961 lt!428526)))))))

(assert (= (and d!99466 res!243625) b!295061))

(assert (= (and b!295061 res!243626) b!295062))

(declare-fun m!431955 () Bool)

(assert (=> d!99466 m!431955))

(declare-fun m!431957 () Bool)

(assert (=> d!99466 m!431957))

(assert (=> b!294931 d!99466))

(declare-fun d!99468 () Bool)

(declare-fun e!210997 () Bool)

(assert (=> d!99468 e!210997))

(declare-fun res!243629 () Bool)

(assert (=> d!99468 (=> (not res!243629) (not e!210997))))

(declare-datatypes ((tuple2!23214 0))(
  ( (tuple2!23215 (_1!12968 Unit!20559) (_2!12968 BitStream!13326)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13326) tuple2!23214)

(assert (=> d!99468 (= res!243629 (= (buf!7724 (_2!12968 (increaseBitIndex!0 thiss!1728))) (buf!7724 thiss!1728)))))

(declare-fun lt!428781 () Bool)

(assert (=> d!99468 (= lt!428781 (not (= (bvand ((_ sign_extend 24) (select (arr!8699 (buf!7724 thiss!1728)) (currentByte!14221 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14216 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!428778 () tuple2!23208)

(assert (=> d!99468 (= lt!428778 (tuple2!23209 (not (= (bvand ((_ sign_extend 24) (select (arr!8699 (buf!7724 thiss!1728)) (currentByte!14221 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14216 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12968 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99468 (validate_offset_bit!0 ((_ sign_extend 32) (size!7661 (buf!7724 thiss!1728))) ((_ sign_extend 32) (currentByte!14221 thiss!1728)) ((_ sign_extend 32) (currentBit!14216 thiss!1728)))))

(assert (=> d!99468 (= (readBit!0 thiss!1728) lt!428778)))

(declare-fun lt!428783 () (_ BitVec 64))

(declare-fun b!295069 () Bool)

(declare-fun lt!428779 () (_ BitVec 64))

(assert (=> b!295069 (= e!210997 (= (bitIndex!0 (size!7661 (buf!7724 (_2!12968 (increaseBitIndex!0 thiss!1728)))) (currentByte!14221 (_2!12968 (increaseBitIndex!0 thiss!1728))) (currentBit!14216 (_2!12968 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!428779 lt!428783)))))

(assert (=> b!295069 (or (not (= (bvand lt!428779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!428783 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!428779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!428779 lt!428783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295069 (= lt!428783 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295069 (= lt!428779 (bitIndex!0 (size!7661 (buf!7724 thiss!1728)) (currentByte!14221 thiss!1728) (currentBit!14216 thiss!1728)))))

(declare-fun lt!428784 () Bool)

(assert (=> b!295069 (= lt!428784 (not (= (bvand ((_ sign_extend 24) (select (arr!8699 (buf!7724 thiss!1728)) (currentByte!14221 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14216 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!428782 () Bool)

(assert (=> b!295069 (= lt!428782 (not (= (bvand ((_ sign_extend 24) (select (arr!8699 (buf!7724 thiss!1728)) (currentByte!14221 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14216 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!428780 () Bool)

(assert (=> b!295069 (= lt!428780 (not (= (bvand ((_ sign_extend 24) (select (arr!8699 (buf!7724 thiss!1728)) (currentByte!14221 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14216 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99468 res!243629) b!295069))

(declare-fun m!431959 () Bool)

(assert (=> d!99468 m!431959))

(declare-fun m!431961 () Bool)

(assert (=> d!99468 m!431961))

(declare-fun m!431963 () Bool)

(assert (=> d!99468 m!431963))

(declare-fun m!431965 () Bool)

(assert (=> d!99468 m!431965))

(assert (=> b!295069 m!431963))

(assert (=> b!295069 m!431961))

(declare-fun m!431967 () Bool)

(assert (=> b!295069 m!431967))

(assert (=> b!295069 m!431733))

(assert (=> b!295069 m!431959))

(assert (=> b!294931 d!99468))

(check-sat (not b!295054) (not b!294977) (not d!99428) (not b!294995) (not b!294997) (not d!99438) (not d!99442) (not b!294972) (not d!99468) (not d!99414) (not b!295056) (not b!295052) (not b!294986) (not d!99440) (not d!99466) (not b!294970) (not b!295001) (not bm!5041) (not b!295060) (not bm!5040) (not b!295057) (not b!294974) (not d!99424) (not bm!5032) (not bm!5031) (not b!294981) (not b!294999) (not bm!5030) (not d!99446) (not b!295069) (not d!99418) (not b!294979) (not b!295059))

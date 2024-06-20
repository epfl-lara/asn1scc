; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68272 () Bool)

(assert start!68272)

(declare-fun b!306566 () Bool)

(declare-fun e!220872 () Bool)

(declare-datatypes ((tuple4!1252 0))(
  ( (tuple4!1253 (_1!13281 (_ BitVec 32)) (_2!13281 (_ BitVec 32)) (_3!1583 (_ BitVec 32)) (_4!626 (_ BitVec 32))) )
))
(declare-fun lt!439720 () tuple4!1252)

(declare-datatypes ((array!18588 0))(
  ( (array!18589 (arr!9138 (Array (_ BitVec 32) (_ BitVec 8))) (size!8055 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18588)

(assert (=> b!306566 (= e!220872 (and (not (= (_3!1583 lt!439720) (_4!626 lt!439720))) (or (bvslt (_3!1583 lt!439720) #b00000000000000000000000000000000) (bvsge (_3!1583 lt!439720) (size!8055 a2!948)))))))

(declare-datatypes ((Unit!21389 0))(
  ( (Unit!21390) )
))
(declare-fun lt!439715 () Unit!21389)

(declare-fun e!220873 () Unit!21389)

(assert (=> b!306566 (= lt!439715 e!220873)))

(declare-fun c!15002 () Bool)

(declare-fun lt!439725 () tuple4!1252)

(assert (=> b!306566 (= c!15002 (and (bvslt (_4!626 lt!439720) (_4!626 lt!439725)) (bvslt (_3!1583 lt!439725) (_4!626 lt!439720))))))

(declare-fun lt!439723 () Unit!21389)

(declare-fun e!220879 () Unit!21389)

(assert (=> b!306566 (= lt!439723 e!220879)))

(declare-fun c!15001 () Bool)

(assert (=> b!306566 (= c!15001 (and (bvslt (_3!1583 lt!439725) (_3!1583 lt!439720)) (bvslt (_3!1583 lt!439720) (_4!626 lt!439725))))))

(declare-fun b!306567 () Bool)

(declare-fun lt!439719 () Unit!21389)

(assert (=> b!306567 (= e!220879 lt!439719)))

(declare-fun a1!948 () array!18588)

(declare-fun arrayRangesEqImpliesEq!288 (array!18588 array!18588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21389)

(assert (=> b!306567 (= lt!439719 (arrayRangesEqImpliesEq!288 a1!948 a2!948 (_1!13281 lt!439725) (_3!1583 lt!439720) (_2!13281 lt!439725)))))

(assert (=> b!306567 (= (select (arr!9138 a1!948) (_3!1583 lt!439720)) (select (arr!9138 a2!948) (_3!1583 lt!439720)))))

(declare-fun b!306569 () Bool)

(declare-fun res!251735 () Bool)

(declare-fun e!220869 () Bool)

(assert (=> b!306569 (=> (not res!251735) (not e!220869))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18588 array!18588 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306569 (= res!251735 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306570 () Bool)

(declare-fun Unit!21391 () Unit!21389)

(assert (=> b!306570 (= e!220879 Unit!21391)))

(declare-fun b!306571 () Bool)

(declare-fun e!220876 () Bool)

(declare-fun call!5849 () Bool)

(assert (=> b!306571 (= e!220876 call!5849)))

(declare-fun bm!5846 () Bool)

(declare-fun lt!439716 () (_ BitVec 32))

(declare-fun c!15000 () Bool)

(declare-fun lt!439718 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5846 (= call!5849 (byteRangesEq!0 (ite c!15000 (select (arr!9138 a1!948) (_3!1583 lt!439725)) (select (arr!9138 a1!948) (_4!626 lt!439725))) (ite c!15000 (select (arr!9138 a2!948) (_3!1583 lt!439725)) (select (arr!9138 a2!948) (_4!626 lt!439725))) (ite c!15000 lt!439718 #b00000000000000000000000000000000) lt!439716))))

(declare-fun res!251736 () Bool)

(declare-fun e!220874 () Bool)

(assert (=> start!68272 (=> (not res!251736) (not e!220874))))

(assert (=> start!68272 (= res!251736 (and (bvsle (size!8055 a1!948) (size!8055 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68272 e!220874))

(assert (=> start!68272 true))

(declare-fun array_inv!7667 (array!18588) Bool)

(assert (=> start!68272 (array_inv!7667 a1!948)))

(assert (=> start!68272 (array_inv!7667 a2!948)))

(declare-fun b!306568 () Bool)

(declare-fun lt!439724 () Unit!21389)

(assert (=> b!306568 (= e!220873 lt!439724)))

(assert (=> b!306568 (= lt!439724 (arrayRangesEqImpliesEq!288 a1!948 a2!948 (_1!13281 lt!439725) (_4!626 lt!439720) (_2!13281 lt!439725)))))

(assert (=> b!306568 (= (select (arr!9138 a1!948) (_4!626 lt!439720)) (select (arr!9138 a2!948) (_4!626 lt!439720)))))

(declare-fun b!306572 () Bool)

(assert (=> b!306572 (= e!220874 e!220869)))

(declare-fun res!251731 () Bool)

(assert (=> b!306572 (=> (not res!251731) (not e!220869))))

(declare-fun lt!439717 () (_ BitVec 64))

(assert (=> b!306572 (= res!251731 (and (bvsle toBit!258 lt!439717) (bvsle fromBit!258 lt!439717)))))

(assert (=> b!306572 (= lt!439717 (bvmul ((_ sign_extend 32) (size!8055 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!306573 () Bool)

(declare-fun e!220878 () Bool)

(assert (=> b!306573 (= e!220876 e!220878)))

(declare-fun res!251730 () Bool)

(assert (=> b!306573 (= res!251730 (byteRangesEq!0 (select (arr!9138 a1!948) (_3!1583 lt!439725)) (select (arr!9138 a2!948) (_3!1583 lt!439725)) lt!439718 #b00000000000000000000000000000111))))

(assert (=> b!306573 (=> (not res!251730) (not e!220878))))

(declare-fun b!306574 () Bool)

(declare-fun e!220877 () Unit!21389)

(declare-fun lt!439721 () Unit!21389)

(assert (=> b!306574 (= e!220877 lt!439721)))

(declare-fun arrayRangesEqSlicedLemma!279 (array!18588 array!18588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21389)

(assert (=> b!306574 (= lt!439721 (arrayRangesEqSlicedLemma!279 a1!948 a2!948 (_1!13281 lt!439725) (_2!13281 lt!439725) (_1!13281 lt!439720) (_2!13281 lt!439720)))))

(declare-fun arrayRangesEq!1684 (array!18588 array!18588 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306574 (arrayRangesEq!1684 a1!948 a2!948 (_1!13281 lt!439720) (_2!13281 lt!439720))))

(declare-fun b!306575 () Bool)

(declare-fun res!251734 () Bool)

(assert (=> b!306575 (=> (not res!251734) (not e!220869))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!306575 (= res!251734 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439717) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306576 () Bool)

(declare-fun res!251732 () Bool)

(assert (=> b!306576 (= res!251732 (= lt!439716 #b00000000000000000000000000000000))))

(declare-fun e!220870 () Bool)

(assert (=> b!306576 (=> res!251732 e!220870)))

(assert (=> b!306576 (= e!220878 e!220870)))

(declare-fun b!306577 () Bool)

(declare-fun Unit!21392 () Unit!21389)

(assert (=> b!306577 (= e!220877 Unit!21392)))

(declare-fun b!306578 () Bool)

(declare-fun Unit!21393 () Unit!21389)

(assert (=> b!306578 (= e!220873 Unit!21393)))

(declare-fun b!306579 () Bool)

(assert (=> b!306579 (= e!220870 call!5849)))

(declare-fun b!306580 () Bool)

(assert (=> b!306580 (= e!220869 e!220872)))

(declare-fun res!251733 () Bool)

(assert (=> b!306580 (=> (not res!251733) (not e!220872))))

(assert (=> b!306580 (= res!251733 e!220876)))

(assert (=> b!306580 (= c!15000 (= (_3!1583 lt!439725) (_4!626 lt!439725)))))

(declare-fun lt!439722 () Unit!21389)

(assert (=> b!306580 (= lt!439722 e!220877)))

(declare-fun c!15003 () Bool)

(assert (=> b!306580 (= c!15003 (bvslt (_1!13281 lt!439720) (_2!13281 lt!439720)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1252)

(assert (=> b!306580 (= lt!439720 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306580 (= lt!439716 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306580 (= lt!439718 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306580 (= lt!439725 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!68272 res!251736) b!306572))

(assert (= (and b!306572 res!251731) b!306569))

(assert (= (and b!306569 res!251735) b!306575))

(assert (= (and b!306575 res!251734) b!306580))

(assert (= (and b!306580 c!15003) b!306574))

(assert (= (and b!306580 (not c!15003)) b!306577))

(assert (= (and b!306580 c!15000) b!306571))

(assert (= (and b!306580 (not c!15000)) b!306573))

(assert (= (and b!306573 res!251730) b!306576))

(assert (= (and b!306576 (not res!251732)) b!306579))

(assert (= (or b!306571 b!306579) bm!5846))

(assert (= (and b!306580 res!251733) b!306566))

(assert (= (and b!306566 c!15001) b!306567))

(assert (= (and b!306566 (not c!15001)) b!306570))

(assert (= (and b!306566 c!15002) b!306568))

(assert (= (and b!306566 (not c!15002)) b!306578))

(declare-fun m!445033 () Bool)

(assert (=> b!306573 m!445033))

(declare-fun m!445035 () Bool)

(assert (=> b!306573 m!445035))

(assert (=> b!306573 m!445033))

(assert (=> b!306573 m!445035))

(declare-fun m!445037 () Bool)

(assert (=> b!306573 m!445037))

(declare-fun m!445039 () Bool)

(assert (=> b!306580 m!445039))

(declare-fun m!445041 () Bool)

(assert (=> b!306580 m!445041))

(assert (=> bm!5846 m!445035))

(declare-fun m!445043 () Bool)

(assert (=> bm!5846 m!445043))

(assert (=> bm!5846 m!445033))

(declare-fun m!445045 () Bool)

(assert (=> bm!5846 m!445045))

(declare-fun m!445047 () Bool)

(assert (=> bm!5846 m!445047))

(declare-fun m!445049 () Bool)

(assert (=> b!306568 m!445049))

(declare-fun m!445051 () Bool)

(assert (=> b!306568 m!445051))

(declare-fun m!445053 () Bool)

(assert (=> b!306568 m!445053))

(declare-fun m!445055 () Bool)

(assert (=> b!306569 m!445055))

(declare-fun m!445057 () Bool)

(assert (=> start!68272 m!445057))

(declare-fun m!445059 () Bool)

(assert (=> start!68272 m!445059))

(declare-fun m!445061 () Bool)

(assert (=> b!306567 m!445061))

(declare-fun m!445063 () Bool)

(assert (=> b!306567 m!445063))

(declare-fun m!445065 () Bool)

(assert (=> b!306567 m!445065))

(declare-fun m!445067 () Bool)

(assert (=> b!306574 m!445067))

(declare-fun m!445069 () Bool)

(assert (=> b!306574 m!445069))

(push 1)

(assert (not b!306567))

(assert (not b!306569))

(assert (not b!306568))

(assert (not b!306573))

(assert (not start!68272))

(assert (not b!306574))

(assert (not bm!5846))

(assert (not b!306580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102304 () Bool)

(assert (=> d!102304 (arrayRangesEq!1684 a1!948 a2!948 (_1!13281 lt!439720) (_2!13281 lt!439720))))

(declare-fun lt!439750 () Unit!21389)

(declare-fun choose!630 (array!18588 array!18588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21389)

(assert (=> d!102304 (= lt!439750 (choose!630 a1!948 a2!948 (_1!13281 lt!439725) (_2!13281 lt!439725) (_1!13281 lt!439720) (_2!13281 lt!439720)))))

(assert (=> d!102304 (and (bvsle #b00000000000000000000000000000000 (_1!13281 lt!439725)) (bvsle (_1!13281 lt!439725) (_2!13281 lt!439725)))))

(assert (=> d!102304 (= (arrayRangesEqSlicedLemma!279 a1!948 a2!948 (_1!13281 lt!439725) (_2!13281 lt!439725) (_1!13281 lt!439720) (_2!13281 lt!439720)) lt!439750)))

(declare-fun bs!26361 () Bool)

(assert (= bs!26361 d!102304))

(assert (=> bs!26361 m!445069))

(declare-fun m!445123 () Bool)

(assert (=> bs!26361 m!445123))

(assert (=> b!306574 d!102304))

(declare-fun d!102306 () Bool)

(declare-fun res!251768 () Bool)

(declare-fun e!220914 () Bool)

(assert (=> d!102306 (=> res!251768 e!220914)))

(assert (=> d!102306 (= res!251768 (= (_1!13281 lt!439720) (_2!13281 lt!439720)))))

(assert (=> d!102306 (= (arrayRangesEq!1684 a1!948 a2!948 (_1!13281 lt!439720) (_2!13281 lt!439720)) e!220914)))

(declare-fun b!306618 () Bool)

(declare-fun e!220915 () Bool)

(assert (=> b!306618 (= e!220914 e!220915)))

(declare-fun res!251769 () Bool)

(assert (=> b!306618 (=> (not res!251769) (not e!220915))))

(assert (=> b!306618 (= res!251769 (= (select (arr!9138 a1!948) (_1!13281 lt!439720)) (select (arr!9138 a2!948) (_1!13281 lt!439720))))))

(declare-fun b!306619 () Bool)

(assert (=> b!306619 (= e!220915 (arrayRangesEq!1684 a1!948 a2!948 (bvadd (_1!13281 lt!439720) #b00000000000000000000000000000001) (_2!13281 lt!439720)))))

(assert (= (and d!102306 (not res!251768)) b!306618))

(assert (= (and b!306618 res!251769) b!306619))

(declare-fun m!445125 () Bool)

(assert (=> b!306618 m!445125))

(declare-fun m!445127 () Bool)

(assert (=> b!306618 m!445127))

(declare-fun m!445129 () Bool)

(assert (=> b!306619 m!445129))

(assert (=> b!306574 d!102306))

(declare-fun d!102312 () Bool)

(assert (=> d!102312 (= (array_inv!7667 a1!948) (bvsge (size!8055 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68272 d!102312))

(declare-fun d!102314 () Bool)

(assert (=> d!102314 (= (array_inv!7667 a2!948) (bvsge (size!8055 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68272 d!102314))

(declare-fun d!102316 () Bool)

(assert (=> d!102316 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1253 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306580 d!102316))

(declare-fun d!102318 () Bool)

(assert (=> d!102318 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1253 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306580 d!102318))

(declare-fun d!102320 () Bool)

(assert (=> d!102320 (= (byteRangesEq!0 (ite c!15000 (select (arr!9138 a1!948) (_3!1583 lt!439725)) (select (arr!9138 a1!948) (_4!626 lt!439725))) (ite c!15000 (select (arr!9138 a2!948) (_3!1583 lt!439725)) (select (arr!9138 a2!948) (_4!626 lt!439725))) (ite c!15000 lt!439718 #b00000000000000000000000000000000) lt!439716) (or (= (ite c!15000 lt!439718 #b00000000000000000000000000000000) lt!439716) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15000 (select (arr!9138 a1!948) (_3!1583 lt!439725)) (select (arr!9138 a1!948) (_4!626 lt!439725)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15000 lt!439718 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15000 (select (arr!9138 a2!948) (_3!1583 lt!439725)) (select (arr!9138 a2!948) (_4!626 lt!439725)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15000 lt!439718 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26362 () Bool)

(assert (= bs!26362 d!102320))

(declare-fun m!445131 () Bool)

(assert (=> bs!26362 m!445131))

(declare-fun m!445133 () Bool)

(assert (=> bs!26362 m!445133))

(assert (=> bm!5846 d!102320))

(declare-fun d!102322 () Bool)

(assert (=> d!102322 (and (bvsge (_3!1583 lt!439720) #b00000000000000000000000000000000) (bvslt (_3!1583 lt!439720) (size!8055 a1!948)) (bvslt (_3!1583 lt!439720) (size!8055 a2!948)) (= (select (arr!9138 a1!948) (_3!1583 lt!439720)) (select (arr!9138 a2!948) (_3!1583 lt!439720))))))

(declare-fun lt!439763 () Unit!21389)

(declare-fun choose!631 (array!18588 array!18588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21389)

(assert (=> d!102322 (= lt!439763 (choose!631 a1!948 a2!948 (_1!13281 lt!439725) (_3!1583 lt!439720) (_2!13281 lt!439725)))))

(assert (=> d!102322 (and (bvsle #b00000000000000000000000000000000 (_1!13281 lt!439725)) (bvsle (_1!13281 lt!439725) (_2!13281 lt!439725)))))

(assert (=> d!102322 (= (arrayRangesEqImpliesEq!288 a1!948 a2!948 (_1!13281 lt!439725) (_3!1583 lt!439720) (_2!13281 lt!439725)) lt!439763)))

(declare-fun bs!26364 () Bool)

(assert (= bs!26364 d!102322))

(assert (=> bs!26364 m!445063))

(assert (=> bs!26364 m!445065))

(declare-fun m!445151 () Bool)

(assert (=> bs!26364 m!445151))

(assert (=> b!306567 d!102322))

(declare-fun d!102330 () Bool)

(assert (=> d!102330 (and (bvsge (_4!626 lt!439720) #b00000000000000000000000000000000) (bvslt (_4!626 lt!439720) (size!8055 a1!948)) (bvslt (_4!626 lt!439720) (size!8055 a2!948)) (= (select (arr!9138 a1!948) (_4!626 lt!439720)) (select (arr!9138 a2!948) (_4!626 lt!439720))))))

(declare-fun lt!439764 () Unit!21389)

(assert (=> d!102330 (= lt!439764 (choose!631 a1!948 a2!948 (_1!13281 lt!439725) (_4!626 lt!439720) (_2!13281 lt!439725)))))

(assert (=> d!102330 (and (bvsle #b00000000000000000000000000000000 (_1!13281 lt!439725)) (bvsle (_1!13281 lt!439725) (_2!13281 lt!439725)))))

(assert (=> d!102330 (= (arrayRangesEqImpliesEq!288 a1!948 a2!948 (_1!13281 lt!439725) (_4!626 lt!439720) (_2!13281 lt!439725)) lt!439764)))

(declare-fun bs!26365 () Bool)

(assert (= bs!26365 d!102330))

(assert (=> bs!26365 m!445051))

(assert (=> bs!26365 m!445053))

(declare-fun m!445153 () Bool)

(assert (=> bs!26365 m!445153))

(assert (=> b!306568 d!102330))

(declare-fun d!102332 () Bool)

(assert (=> d!102332 (= (byteRangesEq!0 (select (arr!9138 a1!948) (_3!1583 lt!439725)) (select (arr!9138 a2!948) (_3!1583 lt!439725)) lt!439718 #b00000000000000000000000000000111) (or (= lt!439718 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9138 a1!948) (_3!1583 lt!439725))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439718)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9138 a2!948) (_3!1583 lt!439725))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439718)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26366 () Bool)

(assert (= bs!26366 d!102332))

(declare-fun m!445155 () Bool)

(assert (=> bs!26366 m!445155))

(declare-fun m!445157 () Bool)

(assert (=> bs!26366 m!445157))

(assert (=> b!306573 d!102332))

(declare-fun b!306655 () Bool)

(declare-fun e!220947 () Bool)

(declare-fun call!5858 () Bool)

(assert (=> b!306655 (= e!220947 call!5858)))

(declare-fun b!306656 () Bool)

(declare-fun e!220951 () Bool)

(assert (=> b!306656 (= e!220947 e!220951)))

(declare-fun res!251798 () Bool)

(assert (=> b!306656 (= res!251798 call!5858)))

(assert (=> b!306656 (=> (not res!251798) (not e!220951))))

(declare-fun d!102334 () Bool)

(declare-fun res!251797 () Bool)

(declare-fun e!220950 () Bool)

(assert (=> d!102334 (=> res!251797 e!220950)))

(assert (=> d!102334 (= res!251797 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102334 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220950)))

(declare-fun b!306657 () Bool)

(declare-fun e!220946 () Bool)

(assert (=> b!306657 (= e!220946 e!220947)))

(declare-fun c!15012 () Bool)

(declare-fun lt!439773 () tuple4!1252)

(assert (=> b!306657 (= c!15012 (= (_3!1583 lt!439773) (_4!626 lt!439773)))))

(declare-fun e!220948 () Bool)

(declare-fun b!306658 () Bool)

(assert (=> b!306658 (= e!220948 (arrayRangesEq!1684 a1!948 a2!948 (_1!13281 lt!439773) (_2!13281 lt!439773)))))

(declare-fun b!306659 () Bool)

(declare-fun e!220949 () Bool)

(declare-fun lt!439771 () (_ BitVec 32))

(assert (=> b!306659 (= e!220949 (byteRangesEq!0 (select (arr!9138 a1!948) (_4!626 lt!439773)) (select (arr!9138 a2!948) (_4!626 lt!439773)) #b00000000000000000000000000000000 lt!439771))))

(declare-fun b!306660 () Bool)

(assert (=> b!306660 (= e!220950 e!220946)))

(declare-fun res!251795 () Bool)

(assert (=> b!306660 (=> (not res!251795) (not e!220946))))

(assert (=> b!306660 (= res!251795 e!220948)))

(declare-fun res!251796 () Bool)

(assert (=> b!306660 (=> res!251796 e!220948)))

(assert (=> b!306660 (= res!251796 (bvsge (_1!13281 lt!439773) (_2!13281 lt!439773)))))

(assert (=> b!306660 (= lt!439771 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439772 () (_ BitVec 32))

(assert (=> b!306660 (= lt!439772 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306660 (= lt!439773 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306661 () Bool)

(declare-fun res!251799 () Bool)

(assert (=> b!306661 (= res!251799 (= lt!439771 #b00000000000000000000000000000000))))

(assert (=> b!306661 (=> res!251799 e!220949)))

(assert (=> b!306661 (= e!220951 e!220949)))

(declare-fun bm!5855 () Bool)

(assert (=> bm!5855 (= call!5858 (byteRangesEq!0 (select (arr!9138 a1!948) (_3!1583 lt!439773)) (select (arr!9138 a2!948) (_3!1583 lt!439773)) lt!439772 (ite c!15012 lt!439771 #b00000000000000000000000000001000)))))

(assert (= (and d!102334 (not res!251797)) b!306660))

(assert (= (and b!306660 (not res!251796)) b!306658))

(assert (= (and b!306660 res!251795) b!306657))

(assert (= (and b!306657 c!15012) b!306655))

(assert (= (and b!306657 (not c!15012)) b!306656))

(assert (= (and b!306656 res!251798) b!306661))

(assert (= (and b!306661 (not res!251799)) b!306659))

(assert (= (or b!306655 b!306656) bm!5855))

(declare-fun m!445159 () Bool)

(assert (=> b!306658 m!445159))

(declare-fun m!445161 () Bool)

(assert (=> b!306659 m!445161))

(declare-fun m!445163 () Bool)

(assert (=> b!306659 m!445163))

(assert (=> b!306659 m!445161))

(assert (=> b!306659 m!445163))

(declare-fun m!445165 () Bool)

(assert (=> b!306659 m!445165))

(assert (=> b!306660 m!445041))

(declare-fun m!445167 () Bool)

(assert (=> bm!5855 m!445167))

(declare-fun m!445169 () Bool)

(assert (=> bm!5855 m!445169))

(assert (=> bm!5855 m!445167))

(assert (=> bm!5855 m!445169))

(declare-fun m!445171 () Bool)

(assert (=> bm!5855 m!445171))

(assert (=> b!306569 d!102334))

(push 1)

(assert (not d!102330))

(assert (not b!306659))

(assert (not d!102304))

(assert (not b!306660))

(assert (not b!306619))

(assert (not bm!5855))

(assert (not d!102322))

(assert (not b!306658))

(check-sat)

(pop 1)

(push 1)

(check-sat)


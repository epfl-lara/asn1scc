; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67018 () Bool)

(assert start!67018)

(declare-fun b!300262 () Bool)

(declare-datatypes ((Unit!21001 0))(
  ( (Unit!21002) )
))
(declare-fun e!215612 () Unit!21001)

(declare-fun Unit!21003 () Unit!21001)

(assert (=> b!300262 (= e!215612 Unit!21003)))

(declare-fun b!300263 () Bool)

(declare-fun res!247576 () Bool)

(declare-fun e!215619 () Bool)

(assert (=> b!300263 (=> (not res!247576) (not e!215619))))

(declare-fun lt!435868 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300263 (= res!247576 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435868) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247575 () Bool)

(declare-fun e!215620 () Bool)

(assert (=> start!67018 (=> (not res!247575) (not e!215620))))

(declare-datatypes ((array!18218 0))(
  ( (array!18219 (arr!8995 (Array (_ BitVec 32) (_ BitVec 8))) (size!7912 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18218)

(declare-fun a2!948 () array!18218)

(assert (=> start!67018 (= res!247575 (and (bvsle (size!7912 a1!948) (size!7912 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67018 e!215620))

(assert (=> start!67018 true))

(declare-fun array_inv!7524 (array!18218) Bool)

(assert (=> start!67018 (array_inv!7524 a1!948)))

(assert (=> start!67018 (array_inv!7524 a2!948)))

(declare-fun b!300264 () Bool)

(declare-fun res!247577 () Bool)

(declare-fun lt!435878 () (_ BitVec 32))

(assert (=> b!300264 (= res!247577 (= lt!435878 #b00000000000000000000000000000000))))

(declare-fun e!215618 () Bool)

(assert (=> b!300264 (=> res!247577 e!215618)))

(declare-fun e!215616 () Bool)

(assert (=> b!300264 (= e!215616 e!215618)))

(declare-fun lt!435879 () (_ BitVec 32))

(declare-datatypes ((tuple4!1032 0))(
  ( (tuple4!1033 (_1!13171 (_ BitVec 32)) (_2!13171 (_ BitVec 32)) (_3!1473 (_ BitVec 32)) (_4!516 (_ BitVec 32))) )
))
(declare-fun lt!435876 () tuple4!1032)

(declare-fun b!300265 () Bool)

(declare-fun lt!435873 () (_ BitVec 32))

(declare-fun e!215615 () Bool)

(assert (=> b!300265 (= e!215615 (and (= (_3!1473 lt!435876) (_4!516 lt!435876)) (or (bvsgt #b00000000000000000000000000000000 lt!435879) (bvsgt lt!435879 lt!435873) (bvsgt lt!435873 #b00000000000000000000000000001000))))))

(declare-fun lt!435875 () Unit!21001)

(assert (=> b!300265 (= lt!435875 e!215612)))

(declare-fun c!13927 () Bool)

(declare-fun lt!435877 () tuple4!1032)

(assert (=> b!300265 (= c!13927 (and (bvslt (_4!516 lt!435876) (_4!516 lt!435877)) (bvslt (_3!1473 lt!435877) (_4!516 lt!435876))))))

(declare-fun lt!435871 () Unit!21001)

(declare-fun e!215614 () Unit!21001)

(assert (=> b!300265 (= lt!435871 e!215614)))

(declare-fun c!13926 () Bool)

(assert (=> b!300265 (= c!13926 (and (bvslt (_3!1473 lt!435877) (_3!1473 lt!435876)) (bvslt (_3!1473 lt!435876) (_4!516 lt!435877))))))

(declare-fun b!300266 () Bool)

(assert (=> b!300266 (= e!215619 e!215615)))

(declare-fun res!247578 () Bool)

(assert (=> b!300266 (=> (not res!247578) (not e!215615))))

(declare-fun e!215617 () Bool)

(assert (=> b!300266 (= res!247578 e!215617)))

(declare-fun c!13929 () Bool)

(assert (=> b!300266 (= c!13929 (= (_3!1473 lt!435877) (_4!516 lt!435877)))))

(declare-fun lt!435872 () Unit!21001)

(declare-fun e!215613 () Unit!21001)

(assert (=> b!300266 (= lt!435872 e!215613)))

(declare-fun c!13928 () Bool)

(assert (=> b!300266 (= c!13928 (bvslt (_1!13171 lt!435876) (_2!13171 lt!435876)))))

(assert (=> b!300266 (= lt!435873 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300266 (= lt!435879 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1032)

(assert (=> b!300266 (= lt!435876 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300266 (= lt!435878 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435867 () (_ BitVec 32))

(assert (=> b!300266 (= lt!435867 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300266 (= lt!435877 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300267 () Bool)

(declare-fun lt!435869 () Unit!21001)

(assert (=> b!300267 (= e!215613 lt!435869)))

(declare-fun arrayRangesEqSlicedLemma!184 (array!18218 array!18218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21001)

(assert (=> b!300267 (= lt!435869 (arrayRangesEqSlicedLemma!184 a1!948 a2!948 (_1!13171 lt!435877) (_2!13171 lt!435877) (_1!13171 lt!435876) (_2!13171 lt!435876)))))

(declare-fun arrayRangesEq!1574 (array!18218 array!18218 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300267 (arrayRangesEq!1574 a1!948 a2!948 (_1!13171 lt!435876) (_2!13171 lt!435876))))

(declare-fun b!300268 () Bool)

(declare-fun res!247579 () Bool)

(assert (=> b!300268 (=> (not res!247579) (not e!215619))))

(declare-fun arrayBitRangesEq!0 (array!18218 array!18218 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300268 (= res!247579 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300269 () Bool)

(declare-fun call!5369 () Bool)

(assert (=> b!300269 (= e!215617 call!5369)))

(declare-fun b!300270 () Bool)

(assert (=> b!300270 (= e!215617 e!215616)))

(declare-fun res!247580 () Bool)

(assert (=> b!300270 (= res!247580 call!5369)))

(assert (=> b!300270 (=> (not res!247580) (not e!215616))))

(declare-fun b!300271 () Bool)

(declare-fun Unit!21004 () Unit!21001)

(assert (=> b!300271 (= e!215614 Unit!21004)))

(declare-fun b!300272 () Bool)

(assert (=> b!300272 (= e!215620 e!215619)))

(declare-fun res!247574 () Bool)

(assert (=> b!300272 (=> (not res!247574) (not e!215619))))

(assert (=> b!300272 (= res!247574 (and (bvsle toBit!258 lt!435868) (bvsle fromBit!258 lt!435868)))))

(assert (=> b!300272 (= lt!435868 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7912 a1!948))))))

(declare-fun b!300273 () Bool)

(declare-fun lt!435874 () Unit!21001)

(assert (=> b!300273 (= e!215614 lt!435874)))

(declare-fun arrayRangesEqImpliesEq!229 (array!18218 array!18218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21001)

(assert (=> b!300273 (= lt!435874 (arrayRangesEqImpliesEq!229 a1!948 a2!948 (_1!13171 lt!435877) (_3!1473 lt!435876) (_2!13171 lt!435877)))))

(assert (=> b!300273 (= (select (arr!8995 a1!948) (_3!1473 lt!435876)) (select (arr!8995 a2!948) (_3!1473 lt!435876)))))

(declare-fun bm!5366 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5366 (= call!5369 (byteRangesEq!0 (select (arr!8995 a1!948) (_3!1473 lt!435877)) (select (arr!8995 a2!948) (_3!1473 lt!435877)) lt!435867 (ite c!13929 lt!435878 #b00000000000000000000000000000111)))))

(declare-fun b!300274 () Bool)

(assert (=> b!300274 (= e!215618 (byteRangesEq!0 (select (arr!8995 a1!948) (_4!516 lt!435877)) (select (arr!8995 a2!948) (_4!516 lt!435877)) #b00000000000000000000000000000000 lt!435878))))

(declare-fun b!300275 () Bool)

(declare-fun Unit!21005 () Unit!21001)

(assert (=> b!300275 (= e!215613 Unit!21005)))

(declare-fun b!300276 () Bool)

(declare-fun lt!435870 () Unit!21001)

(assert (=> b!300276 (= e!215612 lt!435870)))

(assert (=> b!300276 (= lt!435870 (arrayRangesEqImpliesEq!229 a1!948 a2!948 (_1!13171 lt!435877) (_4!516 lt!435876) (_2!13171 lt!435877)))))

(assert (=> b!300276 (= (select (arr!8995 a1!948) (_4!516 lt!435876)) (select (arr!8995 a2!948) (_4!516 lt!435876)))))

(assert (= (and start!67018 res!247575) b!300272))

(assert (= (and b!300272 res!247574) b!300268))

(assert (= (and b!300268 res!247579) b!300263))

(assert (= (and b!300263 res!247576) b!300266))

(assert (= (and b!300266 c!13928) b!300267))

(assert (= (and b!300266 (not c!13928)) b!300275))

(assert (= (and b!300266 c!13929) b!300269))

(assert (= (and b!300266 (not c!13929)) b!300270))

(assert (= (and b!300270 res!247580) b!300264))

(assert (= (and b!300264 (not res!247577)) b!300274))

(assert (= (or b!300269 b!300270) bm!5366))

(assert (= (and b!300266 res!247578) b!300265))

(assert (= (and b!300265 c!13926) b!300273))

(assert (= (and b!300265 (not c!13926)) b!300271))

(assert (= (and b!300265 c!13927) b!300276))

(assert (= (and b!300265 (not c!13927)) b!300262))

(declare-fun m!439255 () Bool)

(assert (=> start!67018 m!439255))

(declare-fun m!439257 () Bool)

(assert (=> start!67018 m!439257))

(declare-fun m!439259 () Bool)

(assert (=> b!300266 m!439259))

(declare-fun m!439261 () Bool)

(assert (=> b!300266 m!439261))

(declare-fun m!439263 () Bool)

(assert (=> b!300276 m!439263))

(declare-fun m!439265 () Bool)

(assert (=> b!300276 m!439265))

(declare-fun m!439267 () Bool)

(assert (=> b!300276 m!439267))

(declare-fun m!439269 () Bool)

(assert (=> b!300273 m!439269))

(declare-fun m!439271 () Bool)

(assert (=> b!300273 m!439271))

(declare-fun m!439273 () Bool)

(assert (=> b!300273 m!439273))

(declare-fun m!439275 () Bool)

(assert (=> b!300267 m!439275))

(declare-fun m!439277 () Bool)

(assert (=> b!300267 m!439277))

(declare-fun m!439279 () Bool)

(assert (=> b!300274 m!439279))

(declare-fun m!439281 () Bool)

(assert (=> b!300274 m!439281))

(assert (=> b!300274 m!439279))

(assert (=> b!300274 m!439281))

(declare-fun m!439283 () Bool)

(assert (=> b!300274 m!439283))

(declare-fun m!439285 () Bool)

(assert (=> bm!5366 m!439285))

(declare-fun m!439287 () Bool)

(assert (=> bm!5366 m!439287))

(assert (=> bm!5366 m!439285))

(assert (=> bm!5366 m!439287))

(declare-fun m!439289 () Bool)

(assert (=> bm!5366 m!439289))

(declare-fun m!439291 () Bool)

(assert (=> b!300268 m!439291))

(push 1)

(assert (not start!67018))

(assert (not b!300266))

(assert (not b!300268))

(assert (not b!300274))

(assert (not b!300267))

(assert (not bm!5366))

(assert (not b!300276))

(assert (not b!300273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100688 () Bool)

(declare-fun res!247657 () Bool)

(declare-fun e!215726 () Bool)

(assert (=> d!100688 (=> res!247657 e!215726)))

(assert (=> d!100688 (= res!247657 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100688 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!215726)))

(declare-fun b!300408 () Bool)

(declare-fun e!215730 () Bool)

(declare-fun e!215727 () Bool)

(assert (=> b!300408 (= e!215730 e!215727)))

(declare-fun c!13959 () Bool)

(declare-fun lt!435981 () tuple4!1032)

(assert (=> b!300408 (= c!13959 (= (_3!1473 lt!435981) (_4!516 lt!435981)))))

(declare-fun b!300409 () Bool)

(declare-fun res!247654 () Bool)

(declare-fun lt!435980 () (_ BitVec 32))

(assert (=> b!300409 (= res!247654 (= lt!435980 #b00000000000000000000000000000000))))

(declare-fun e!215725 () Bool)

(assert (=> b!300409 (=> res!247654 e!215725)))

(declare-fun e!215728 () Bool)

(assert (=> b!300409 (= e!215728 e!215725)))

(declare-fun e!215729 () Bool)

(declare-fun b!300410 () Bool)

(assert (=> b!300410 (= e!215729 (arrayRangesEq!1574 a1!948 a2!948 (_1!13171 lt!435981) (_2!13171 lt!435981)))))

(declare-fun b!300411 () Bool)

(declare-fun call!5381 () Bool)

(assert (=> b!300411 (= e!215725 call!5381)))

(declare-fun lt!435982 () (_ BitVec 32))

(declare-fun bm!5378 () Bool)

(assert (=> bm!5378 (= call!5381 (byteRangesEq!0 (ite c!13959 (select (arr!8995 a1!948) (_3!1473 lt!435981)) (select (arr!8995 a1!948) (_4!516 lt!435981))) (ite c!13959 (select (arr!8995 a2!948) (_3!1473 lt!435981)) (select (arr!8995 a2!948) (_4!516 lt!435981))) (ite c!13959 lt!435982 #b00000000000000000000000000000000) lt!435980))))

(declare-fun b!300412 () Bool)

(assert (=> b!300412 (= e!215727 call!5381)))

(declare-fun b!300413 () Bool)

(assert (=> b!300413 (= e!215727 e!215728)))

(declare-fun res!247658 () Bool)

(assert (=> b!300413 (= res!247658 (byteRangesEq!0 (select (arr!8995 a1!948) (_3!1473 lt!435981)) (select (arr!8995 a2!948) (_3!1473 lt!435981)) lt!435982 #b00000000000000000000000000001000))))

(assert (=> b!300413 (=> (not res!247658) (not e!215728))))

(declare-fun b!300414 () Bool)

(assert (=> b!300414 (= e!215726 e!215730)))

(declare-fun res!247656 () Bool)

(assert (=> b!300414 (=> (not res!247656) (not e!215730))))

(assert (=> b!300414 (= res!247656 e!215729)))

(declare-fun res!247655 () Bool)

(assert (=> b!300414 (=> res!247655 e!215729)))

(assert (=> b!300414 (= res!247655 (bvsge (_1!13171 lt!435981) (_2!13171 lt!435981)))))

(assert (=> b!300414 (= lt!435980 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300414 (= lt!435982 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300414 (= lt!435981 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!100688 (not res!247657)) b!300414))

(assert (= (and b!300414 (not res!247655)) b!300410))

(assert (= (and b!300414 res!247656) b!300408))

(assert (= (and b!300408 c!13959) b!300412))

(assert (= (and b!300408 (not c!13959)) b!300413))

(assert (= (and b!300413 res!247658) b!300409))

(assert (= (and b!300409 (not res!247654)) b!300411))

(assert (= (or b!300412 b!300411) bm!5378))

(declare-fun m!439403 () Bool)

(assert (=> b!300410 m!439403))

(declare-fun m!439405 () Bool)

(assert (=> bm!5378 m!439405))

(declare-fun m!439407 () Bool)

(assert (=> bm!5378 m!439407))

(declare-fun m!439409 () Bool)

(assert (=> bm!5378 m!439409))

(declare-fun m!439411 () Bool)

(assert (=> bm!5378 m!439411))

(declare-fun m!439413 () Bool)

(assert (=> bm!5378 m!439413))

(assert (=> b!300413 m!439411))

(assert (=> b!300413 m!439409))

(assert (=> b!300413 m!439411))

(assert (=> b!300413 m!439409))

(declare-fun m!439415 () Bool)

(assert (=> b!300413 m!439415))

(assert (=> b!300414 m!439261))

(assert (=> b!300268 d!100688))

(declare-fun d!100690 () Bool)

(assert (=> d!100690 (and (bvsge (_3!1473 lt!435876) #b00000000000000000000000000000000) (bvslt (_3!1473 lt!435876) (size!7912 a1!948)) (bvslt (_3!1473 lt!435876) (size!7912 a2!948)) (= (select (arr!8995 a1!948) (_3!1473 lt!435876)) (select (arr!8995 a2!948) (_3!1473 lt!435876))))))

(declare-fun lt!435985 () Unit!21001)

(declare-fun choose!523 (array!18218 array!18218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21001)

(assert (=> d!100690 (= lt!435985 (choose!523 a1!948 a2!948 (_1!13171 lt!435877) (_3!1473 lt!435876) (_2!13171 lt!435877)))))

(assert (=> d!100690 (and (bvsle #b00000000000000000000000000000000 (_1!13171 lt!435877)) (bvsle (_1!13171 lt!435877) (_2!13171 lt!435877)))))

(assert (=> d!100690 (= (arrayRangesEqImpliesEq!229 a1!948 a2!948 (_1!13171 lt!435877) (_3!1473 lt!435876) (_2!13171 lt!435877)) lt!435985)))

(declare-fun bs!25955 () Bool)

(assert (= bs!25955 d!100690))

(assert (=> bs!25955 m!439271))

(assert (=> bs!25955 m!439273))

(declare-fun m!439417 () Bool)

(assert (=> bs!25955 m!439417))

(assert (=> b!300273 d!100690))

(declare-fun d!100692 () Bool)

(assert (=> d!100692 (arrayRangesEq!1574 a1!948 a2!948 (_1!13171 lt!435876) (_2!13171 lt!435876))))

(declare-fun lt!435988 () Unit!21001)

(declare-fun choose!524 (array!18218 array!18218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21001)

(assert (=> d!100692 (= lt!435988 (choose!524 a1!948 a2!948 (_1!13171 lt!435877) (_2!13171 lt!435877) (_1!13171 lt!435876) (_2!13171 lt!435876)))))

(assert (=> d!100692 (and (bvsle #b00000000000000000000000000000000 (_1!13171 lt!435877)) (bvsle (_1!13171 lt!435877) (_2!13171 lt!435877)))))

(assert (=> d!100692 (= (arrayRangesEqSlicedLemma!184 a1!948 a2!948 (_1!13171 lt!435877) (_2!13171 lt!435877) (_1!13171 lt!435876) (_2!13171 lt!435876)) lt!435988)))

(declare-fun bs!25956 () Bool)

(assert (= bs!25956 d!100692))

(assert (=> bs!25956 m!439277))

(declare-fun m!439419 () Bool)

(assert (=> bs!25956 m!439419))

(assert (=> b!300267 d!100692))

(declare-fun d!100694 () Bool)

(declare-fun res!247663 () Bool)

(declare-fun e!215735 () Bool)

(assert (=> d!100694 (=> res!247663 e!215735)))

(assert (=> d!100694 (= res!247663 (= (_1!13171 lt!435876) (_2!13171 lt!435876)))))

(assert (=> d!100694 (= (arrayRangesEq!1574 a1!948 a2!948 (_1!13171 lt!435876) (_2!13171 lt!435876)) e!215735)))

(declare-fun b!300419 () Bool)

(declare-fun e!215736 () Bool)

(assert (=> b!300419 (= e!215735 e!215736)))

(declare-fun res!247664 () Bool)

(assert (=> b!300419 (=> (not res!247664) (not e!215736))))

(assert (=> b!300419 (= res!247664 (= (select (arr!8995 a1!948) (_1!13171 lt!435876)) (select (arr!8995 a2!948) (_1!13171 lt!435876))))))

(declare-fun b!300420 () Bool)

(assert (=> b!300420 (= e!215736 (arrayRangesEq!1574 a1!948 a2!948 (bvadd (_1!13171 lt!435876) #b00000000000000000000000000000001) (_2!13171 lt!435876)))))

(assert (= (and d!100694 (not res!247663)) b!300419))

(assert (= (and b!300419 res!247664) b!300420))

(declare-fun m!439421 () Bool)

(assert (=> b!300419 m!439421))

(declare-fun m!439423 () Bool)

(assert (=> b!300419 m!439423))

(declare-fun m!439425 () Bool)

(assert (=> b!300420 m!439425))

(assert (=> b!300267 d!100694))

(declare-fun d!100696 () Bool)

(assert (=> d!100696 (and (bvsge (_4!516 lt!435876) #b00000000000000000000000000000000) (bvslt (_4!516 lt!435876) (size!7912 a1!948)) (bvslt (_4!516 lt!435876) (size!7912 a2!948)) (= (select (arr!8995 a1!948) (_4!516 lt!435876)) (select (arr!8995 a2!948) (_4!516 lt!435876))))))

(declare-fun lt!435989 () Unit!21001)

(assert (=> d!100696 (= lt!435989 (choose!523 a1!948 a2!948 (_1!13171 lt!435877) (_4!516 lt!435876) (_2!13171 lt!435877)))))

(assert (=> d!100696 (and (bvsle #b00000000000000000000000000000000 (_1!13171 lt!435877)) (bvsle (_1!13171 lt!435877) (_2!13171 lt!435877)))))

(assert (=> d!100696 (= (arrayRangesEqImpliesEq!229 a1!948 a2!948 (_1!13171 lt!435877) (_4!516 lt!435876) (_2!13171 lt!435877)) lt!435989)))

(declare-fun bs!25957 () Bool)

(assert (= bs!25957 d!100696))

(assert (=> bs!25957 m!439265))

(assert (=> bs!25957 m!439267))

(declare-fun m!439427 () Bool)

(assert (=> bs!25957 m!439427))

(assert (=> b!300276 d!100696))

(declare-fun d!100698 () Bool)

(assert (=> d!100698 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1033 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!300266 d!100698))

(declare-fun d!100700 () Bool)

(assert (=> d!100700 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1033 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!300266 d!100700))

(declare-fun d!100702 () Bool)

(assert (=> d!100702 (= (array_inv!7524 a1!948) (bvsge (size!7912 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67018 d!100702))

(declare-fun d!100704 () Bool)

(assert (=> d!100704 (= (array_inv!7524 a2!948) (bvsge (size!7912 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67018 d!100704))

(declare-fun d!100706 () Bool)

(assert (=> d!100706 (= (byteRangesEq!0 (select (arr!8995 a1!948) (_4!516 lt!435877)) (select (arr!8995 a2!948) (_4!516 lt!435877)) #b00000000000000000000000000000000 lt!435878) (or (= #b00000000000000000000000000000000 lt!435878) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8995 a1!948) (_4!516 lt!435877))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!435878))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8995 a2!948) (_4!516 lt!435877))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!435878))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25958 () Bool)

(assert (= bs!25958 d!100706))

(declare-fun m!439429 () Bool)

(assert (=> bs!25958 m!439429))

(declare-fun m!439431 () Bool)

(assert (=> bs!25958 m!439431))

(assert (=> b!300274 d!100706))

(declare-fun d!100708 () Bool)

(assert (=> d!100708 (= (byteRangesEq!0 (select (arr!8995 a1!948) (_3!1473 lt!435877)) (select (arr!8995 a2!948) (_3!1473 lt!435877)) lt!435867 (ite c!13929 lt!435878 #b00000000000000000000000000000111)) (or (= lt!435867 (ite c!13929 lt!435878 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8995 a1!948) (_3!1473 lt!435877))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!13929 lt!435878 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!435867)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8995 a2!948) (_3!1473 lt!435877))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!13929 lt!435878 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!435867)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25959 () Bool)

(assert (= bs!25959 d!100708))

(declare-fun m!439433 () Bool)

(assert (=> bs!25959 m!439433))

(declare-fun m!439435 () Bool)

(assert (=> bs!25959 m!439435))

(assert (=> bm!5366 d!100708))

(push 1)

(assert (not b!300413))

(assert (not b!300410))

(assert (not b!300420))

(assert (not b!300414))

(assert (not d!100690))

(assert (not d!100696))

(assert (not d!100692))

(assert (not bm!5378))

(check-sat)

(pop 1)

(push 1)

(check-sat)


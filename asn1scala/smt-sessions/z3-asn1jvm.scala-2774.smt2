; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67008 () Bool)

(assert start!67008)

(declare-fun b!300063 () Bool)

(declare-fun e!215468 () Bool)

(declare-fun e!215469 () Bool)

(assert (=> b!300063 (= e!215468 e!215469)))

(declare-fun res!247470 () Bool)

(assert (=> b!300063 (=> (not res!247470) (not e!215469))))

(declare-fun e!215467 () Bool)

(assert (=> b!300063 (= res!247470 e!215467)))

(declare-fun c!13881 () Bool)

(declare-datatypes ((tuple4!1022 0))(
  ( (tuple4!1023 (_1!13166 (_ BitVec 32)) (_2!13166 (_ BitVec 32)) (_3!1468 (_ BitVec 32)) (_4!511 (_ BitVec 32))) )
))
(declare-fun lt!435731 () tuple4!1022)

(assert (=> b!300063 (= c!13881 (= (_3!1468 lt!435731) (_4!511 lt!435731)))))

(declare-datatypes ((Unit!20981 0))(
  ( (Unit!20982) )
))
(declare-fun lt!435729 () Unit!20981)

(declare-fun e!215464 () Unit!20981)

(assert (=> b!300063 (= lt!435729 e!215464)))

(declare-fun c!13880 () Bool)

(declare-fun lt!435727 () tuple4!1022)

(assert (=> b!300063 (= c!13880 (bvslt (_1!13166 lt!435727) (_2!13166 lt!435727)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1022)

(assert (=> b!300063 (= lt!435727 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435728 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!300063 (= lt!435728 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435724 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!300063 (= lt!435724 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300063 (= lt!435731 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300064 () Bool)

(declare-fun Unit!20983 () Unit!20981)

(assert (=> b!300064 (= e!215464 Unit!20983)))

(declare-fun b!300065 () Bool)

(declare-fun e!215465 () Unit!20981)

(declare-fun lt!435730 () Unit!20981)

(assert (=> b!300065 (= e!215465 lt!435730)))

(declare-datatypes ((array!18208 0))(
  ( (array!18209 (arr!8990 (Array (_ BitVec 32) (_ BitVec 8))) (size!7907 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18208)

(declare-fun a2!948 () array!18208)

(declare-fun arrayRangesEqImpliesEq!224 (array!18208 array!18208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20981)

(assert (=> b!300065 (= lt!435730 (arrayRangesEqImpliesEq!224 a1!948 a2!948 (_1!13166 lt!435731) (_3!1468 lt!435727) (_2!13166 lt!435731)))))

(assert (=> b!300065 (= (select (arr!8990 a1!948) (_3!1468 lt!435727)) (select (arr!8990 a2!948) (_3!1468 lt!435727)))))

(declare-fun b!300066 () Bool)

(declare-fun e!215460 () Bool)

(assert (=> b!300066 (= e!215467 e!215460)))

(declare-fun res!247469 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300066 (= res!247469 (byteRangesEq!0 (select (arr!8990 a1!948) (_3!1468 lt!435731)) (select (arr!8990 a2!948) (_3!1468 lt!435731)) lt!435724 #b00000000000000000000000000000111))))

(assert (=> b!300066 (=> (not res!247469) (not e!215460))))

(declare-fun b!300067 () Bool)

(declare-fun e!215462 () Bool)

(assert (=> b!300067 (= e!215462 e!215468)))

(declare-fun res!247472 () Bool)

(assert (=> b!300067 (=> (not res!247472) (not e!215468))))

(declare-fun lt!435732 () (_ BitVec 64))

(assert (=> b!300067 (= res!247472 (and (bvsle toBit!258 lt!435732) (bvsle fromBit!258 lt!435732)))))

(assert (=> b!300067 (= lt!435732 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7907 a1!948))))))

(declare-fun res!247473 () Bool)

(assert (=> start!67008 (=> (not res!247473) (not e!215462))))

(assert (=> start!67008 (= res!247473 (and (bvsle (size!7907 a1!948) (size!7907 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67008 e!215462))

(assert (=> start!67008 true))

(declare-fun array_inv!7519 (array!18208) Bool)

(assert (=> start!67008 (array_inv!7519 a1!948)))

(assert (=> start!67008 (array_inv!7519 a2!948)))

(declare-fun b!300068 () Bool)

(declare-fun res!247474 () Bool)

(assert (=> b!300068 (=> (not res!247474) (not e!215468))))

(declare-fun arrayBitRangesEq!0 (array!18208 array!18208 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300068 (= res!247474 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300069 () Bool)

(declare-fun lt!435725 () Unit!20981)

(assert (=> b!300069 (= e!215464 lt!435725)))

(declare-fun arrayRangesEqSlicedLemma!179 (array!18208 array!18208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20981)

(assert (=> b!300069 (= lt!435725 (arrayRangesEqSlicedLemma!179 a1!948 a2!948 (_1!13166 lt!435731) (_2!13166 lt!435731) (_1!13166 lt!435727) (_2!13166 lt!435727)))))

(declare-fun arrayRangesEq!1569 (array!18208 array!18208 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300069 (arrayRangesEq!1569 a1!948 a2!948 (_1!13166 lt!435727) (_2!13166 lt!435727))))

(declare-fun b!300070 () Bool)

(declare-fun res!247475 () Bool)

(assert (=> b!300070 (=> (not res!247475) (not e!215468))))

(assert (=> b!300070 (= res!247475 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435732) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300071 () Bool)

(declare-fun e!215466 () Bool)

(declare-fun call!5354 () Bool)

(assert (=> b!300071 (= e!215466 call!5354)))

(declare-fun bm!5351 () Bool)

(assert (=> bm!5351 (= call!5354 (byteRangesEq!0 (ite c!13881 (select (arr!8990 a1!948) (_3!1468 lt!435731)) (select (arr!8990 a1!948) (_4!511 lt!435731))) (ite c!13881 (select (arr!8990 a2!948) (_3!1468 lt!435731)) (select (arr!8990 a2!948) (_4!511 lt!435731))) (ite c!13881 lt!435724 #b00000000000000000000000000000000) lt!435728))))

(declare-fun b!300072 () Bool)

(assert (=> b!300072 (= e!215467 call!5354)))

(declare-fun b!300073 () Bool)

(declare-fun Unit!20984 () Unit!20981)

(assert (=> b!300073 (= e!215465 Unit!20984)))

(declare-fun b!300074 () Bool)

(assert (=> b!300074 (= e!215469 false)))

(declare-fun lt!435726 () Unit!20981)

(assert (=> b!300074 (= lt!435726 e!215465)))

(declare-fun c!13879 () Bool)

(assert (=> b!300074 (= c!13879 (and (bvslt (_3!1468 lt!435731) (_3!1468 lt!435727)) (bvslt (_3!1468 lt!435727) (_4!511 lt!435731))))))

(declare-fun b!300075 () Bool)

(declare-fun res!247471 () Bool)

(assert (=> b!300075 (= res!247471 (= lt!435728 #b00000000000000000000000000000000))))

(assert (=> b!300075 (=> res!247471 e!215466)))

(assert (=> b!300075 (= e!215460 e!215466)))

(assert (= (and start!67008 res!247473) b!300067))

(assert (= (and b!300067 res!247472) b!300068))

(assert (= (and b!300068 res!247474) b!300070))

(assert (= (and b!300070 res!247475) b!300063))

(assert (= (and b!300063 c!13880) b!300069))

(assert (= (and b!300063 (not c!13880)) b!300064))

(assert (= (and b!300063 c!13881) b!300072))

(assert (= (and b!300063 (not c!13881)) b!300066))

(assert (= (and b!300066 res!247469) b!300075))

(assert (= (and b!300075 (not res!247471)) b!300071))

(assert (= (or b!300072 b!300071) bm!5351))

(assert (= (and b!300063 res!247470) b!300074))

(assert (= (and b!300074 c!13879) b!300065))

(assert (= (and b!300074 (not c!13879)) b!300073))

(declare-fun m!439095 () Bool)

(assert (=> bm!5351 m!439095))

(declare-fun m!439097 () Bool)

(assert (=> bm!5351 m!439097))

(declare-fun m!439099 () Bool)

(assert (=> bm!5351 m!439099))

(declare-fun m!439101 () Bool)

(assert (=> bm!5351 m!439101))

(declare-fun m!439103 () Bool)

(assert (=> bm!5351 m!439103))

(declare-fun m!439105 () Bool)

(assert (=> b!300063 m!439105))

(declare-fun m!439107 () Bool)

(assert (=> b!300063 m!439107))

(declare-fun m!439109 () Bool)

(assert (=> b!300069 m!439109))

(declare-fun m!439111 () Bool)

(assert (=> b!300069 m!439111))

(declare-fun m!439113 () Bool)

(assert (=> b!300065 m!439113))

(declare-fun m!439115 () Bool)

(assert (=> b!300065 m!439115))

(declare-fun m!439117 () Bool)

(assert (=> b!300065 m!439117))

(assert (=> b!300066 m!439097))

(assert (=> b!300066 m!439101))

(assert (=> b!300066 m!439097))

(assert (=> b!300066 m!439101))

(declare-fun m!439119 () Bool)

(assert (=> b!300066 m!439119))

(declare-fun m!439121 () Bool)

(assert (=> start!67008 m!439121))

(declare-fun m!439123 () Bool)

(assert (=> start!67008 m!439123))

(declare-fun m!439125 () Bool)

(assert (=> b!300068 m!439125))

(check-sat (not start!67008) (not bm!5351) (not b!300068) (not b!300066) (not b!300069) (not b!300063) (not b!300065))
(check-sat)

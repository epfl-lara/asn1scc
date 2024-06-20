; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67446 () Bool)

(assert start!67446)

(declare-fun b!302868 () Bool)

(declare-fun res!249276 () Bool)

(declare-fun e!217829 () Bool)

(assert (=> b!302868 (=> (not res!249276) (not e!217829))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18401 0))(
  ( (array!18402 (arr!9073 (Array (_ BitVec 32) (_ BitVec 8))) (size!7990 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18401)

(declare-fun a2!948 () array!18401)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18401 array!18401 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302868 (= res!249276 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302869 () Bool)

(declare-fun e!217830 () Bool)

(declare-datatypes ((tuple4!1122 0))(
  ( (tuple4!1123 (_1!13216 (_ BitVec 32)) (_2!13216 (_ BitVec 32)) (_3!1518 (_ BitVec 32)) (_4!561 (_ BitVec 32))) )
))
(declare-fun lt!437471 () tuple4!1122)

(declare-fun arrayRangesEq!1619 (array!18401 array!18401 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302869 (= e!217830 (not (arrayRangesEq!1619 a1!948 a2!948 (_1!13216 lt!437471) (_2!13216 lt!437471))))))

(declare-fun res!249272 () Bool)

(declare-fun e!217828 () Bool)

(assert (=> start!67446 (=> (not res!249272) (not e!217828))))

(assert (=> start!67446 (= res!249272 (and (bvsle (size!7990 a1!948) (size!7990 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67446 e!217828))

(assert (=> start!67446 true))

(declare-fun array_inv!7602 (array!18401) Bool)

(assert (=> start!67446 (array_inv!7602 a1!948)))

(assert (=> start!67446 (array_inv!7602 a2!948)))

(declare-fun b!302870 () Bool)

(assert (=> b!302870 (= e!217829 e!217830)))

(declare-fun res!249275 () Bool)

(assert (=> b!302870 (=> (not res!249275) (not e!217830))))

(declare-fun lt!437470 () tuple4!1122)

(assert (=> b!302870 (= res!249275 (and (bvslt (_1!13216 lt!437470) (_2!13216 lt!437470)) (bvsle #b00000000000000000000000000000000 (_1!13216 lt!437471)) (bvsle (_1!13216 lt!437471) (_2!13216 lt!437471)) (bvsle (_2!13216 lt!437471) (size!7990 a1!948)) (bvsle (_1!13216 lt!437471) (_1!13216 lt!437470)) (bvsle (_1!13216 lt!437470) (_2!13216 lt!437470)) (bvsle (_2!13216 lt!437470) (_2!13216 lt!437471))))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1122)

(assert (=> b!302870 (= lt!437470 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302870 (= lt!437471 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302871 () Bool)

(assert (=> b!302871 (= e!217828 e!217829)))

(declare-fun res!249273 () Bool)

(assert (=> b!302871 (=> (not res!249273) (not e!217829))))

(declare-fun lt!437472 () (_ BitVec 64))

(assert (=> b!302871 (= res!249273 (and (bvsle toBit!258 lt!437472) (bvsle fromBit!258 lt!437472)))))

(assert (=> b!302871 (= lt!437472 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7990 a1!948))))))

(declare-fun b!302872 () Bool)

(declare-fun res!249274 () Bool)

(assert (=> b!302872 (=> (not res!249274) (not e!217829))))

(assert (=> b!302872 (= res!249274 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437472) (not (= fromSlice!52 toSlice!52))))))

(assert (= (and start!67446 res!249272) b!302871))

(assert (= (and b!302871 res!249273) b!302868))

(assert (= (and b!302868 res!249276) b!302872))

(assert (= (and b!302872 res!249274) b!302870))

(assert (= (and b!302870 res!249275) b!302869))

(declare-fun m!441597 () Bool)

(assert (=> b!302868 m!441597))

(declare-fun m!441599 () Bool)

(assert (=> b!302869 m!441599))

(declare-fun m!441601 () Bool)

(assert (=> start!67446 m!441601))

(declare-fun m!441603 () Bool)

(assert (=> start!67446 m!441603))

(declare-fun m!441605 () Bool)

(assert (=> b!302870 m!441605))

(declare-fun m!441607 () Bool)

(assert (=> b!302870 m!441607))

(push 1)

(assert (not b!302868))

(assert (not start!67446))

(assert (not b!302870))

(assert (not b!302869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!217898 () Bool)

(declare-fun b!302944 () Bool)

(declare-fun lt!437507 () tuple4!1122)

(declare-fun lt!437506 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302944 (= e!217898 (byteRangesEq!0 (select (arr!9073 a1!948) (_4!561 lt!437507)) (select (arr!9073 a2!948) (_4!561 lt!437507)) #b00000000000000000000000000000000 lt!437506))))

(declare-fun b!302945 () Bool)

(declare-fun e!217900 () Bool)

(declare-fun e!217903 () Bool)

(assert (=> b!302945 (= e!217900 e!217903)))

(declare-fun res!249339 () Bool)

(declare-fun call!5555 () Bool)

(assert (=> b!302945 (= res!249339 call!5555)))

(assert (=> b!302945 (=> (not res!249339) (not e!217903))))

(declare-fun lt!437508 () (_ BitVec 32))

(declare-fun c!14385 () Bool)

(declare-fun bm!5552 () Bool)

(assert (=> bm!5552 (= call!5555 (byteRangesEq!0 (select (arr!9073 a1!948) (_3!1518 lt!437507)) (select (arr!9073 a2!948) (_3!1518 lt!437507)) lt!437508 (ite c!14385 lt!437506 #b00000000000000000000000000001000)))))

(declare-fun d!101192 () Bool)

(declare-fun res!249340 () Bool)

(declare-fun e!217901 () Bool)

(assert (=> d!101192 (=> res!249340 e!217901)))

(assert (=> d!101192 (= res!249340 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101192 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217901)))

(declare-fun b!302946 () Bool)

(declare-fun e!217899 () Bool)

(assert (=> b!302946 (= e!217899 e!217900)))

(assert (=> b!302946 (= c!14385 (= (_3!1518 lt!437507) (_4!561 lt!437507)))))

(declare-fun b!302947 () Bool)

(assert (=> b!302947 (= e!217900 call!5555)))

(declare-fun b!302948 () Bool)

(declare-fun e!217902 () Bool)

(assert (=> b!302948 (= e!217902 (arrayRangesEq!1619 a1!948 a2!948 (_1!13216 lt!437507) (_2!13216 lt!437507)))))

(declare-fun b!302949 () Bool)

(assert (=> b!302949 (= e!217901 e!217899)))

(declare-fun res!249342 () Bool)

(assert (=> b!302949 (=> (not res!249342) (not e!217899))))

(assert (=> b!302949 (= res!249342 e!217902)))

(declare-fun res!249341 () Bool)

(assert (=> b!302949 (=> res!249341 e!217902)))

(assert (=> b!302949 (= res!249341 (bvsge (_1!13216 lt!437507) (_2!13216 lt!437507)))))

(assert (=> b!302949 (= lt!437506 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302949 (= lt!437508 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302949 (= lt!437507 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302950 () Bool)

(declare-fun res!249338 () Bool)

(assert (=> b!302950 (= res!249338 (= lt!437506 #b00000000000000000000000000000000))))

(assert (=> b!302950 (=> res!249338 e!217898)))

(assert (=> b!302950 (= e!217903 e!217898)))

(assert (= (and d!101192 (not res!249340)) b!302949))

(assert (= (and b!302949 (not res!249341)) b!302948))

(assert (= (and b!302949 res!249342) b!302946))

(assert (= (and b!302946 c!14385) b!302947))

(assert (= (and b!302946 (not c!14385)) b!302945))

(assert (= (and b!302945 res!249339) b!302950))

(assert (= (and b!302950 (not res!249338)) b!302944))

(assert (= (or b!302947 b!302945) bm!5552))

(declare-fun m!441653 () Bool)

(assert (=> b!302944 m!441653))

(declare-fun m!441655 () Bool)

(assert (=> b!302944 m!441655))

(assert (=> b!302944 m!441653))

(assert (=> b!302944 m!441655))

(declare-fun m!441657 () Bool)

(assert (=> b!302944 m!441657))

(declare-fun m!441659 () Bool)

(assert (=> bm!5552 m!441659))

(declare-fun m!441661 () Bool)

(assert (=> bm!5552 m!441661))

(assert (=> bm!5552 m!441659))

(assert (=> bm!5552 m!441661))

(declare-fun m!441663 () Bool)

(assert (=> bm!5552 m!441663))

(declare-fun m!441665 () Bool)

(assert (=> b!302948 m!441665))

(assert (=> b!302949 m!441607))

(assert (=> b!302868 d!101192))

(declare-fun d!101200 () Bool)

(assert (=> d!101200 (= (array_inv!7602 a1!948) (bvsge (size!7990 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67446 d!101200))

(declare-fun d!101202 () Bool)

(assert (=> d!101202 (= (array_inv!7602 a2!948) (bvsge (size!7990 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67446 d!101202))

(declare-fun d!101204 () Bool)

(assert (=> d!101204 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1123 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302870 d!101204))

(declare-fun d!101206 () Bool)

(assert (=> d!101206 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1123 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302870 d!101206))

(declare-fun d!101208 () Bool)

(declare-fun res!249347 () Bool)

(declare-fun e!217908 () Bool)

(assert (=> d!101208 (=> res!249347 e!217908)))

(assert (=> d!101208 (= res!249347 (= (_1!13216 lt!437471) (_2!13216 lt!437471)))))

(assert (=> d!101208 (= (arrayRangesEq!1619 a1!948 a2!948 (_1!13216 lt!437471) (_2!13216 lt!437471)) e!217908)))

(declare-fun b!302955 () Bool)

(declare-fun e!217909 () Bool)

(assert (=> b!302955 (= e!217908 e!217909)))

(declare-fun res!249348 () Bool)

(assert (=> b!302955 (=> (not res!249348) (not e!217909))))

(assert (=> b!302955 (= res!249348 (= (select (arr!9073 a1!948) (_1!13216 lt!437471)) (select (arr!9073 a2!948) (_1!13216 lt!437471))))))

(declare-fun b!302956 () Bool)

(assert (=> b!302956 (= e!217909 (arrayRangesEq!1619 a1!948 a2!948 (bvadd (_1!13216 lt!437471) #b00000000000000000000000000000001) (_2!13216 lt!437471)))))

(assert (= (and d!101208 (not res!249347)) b!302955))

(assert (= (and b!302955 res!249348) b!302956))

(declare-fun m!441667 () Bool)

(assert (=> b!302955 m!441667))

(declare-fun m!441669 () Bool)

(assert (=> b!302955 m!441669))

(declare-fun m!441671 () Bool)

(assert (=> b!302956 m!441671))

(assert (=> b!302869 d!101208))

(push 1)

(assert (not b!302949))

(assert (not bm!5552))

(assert (not b!302944))

(assert (not b!302956))

(assert (not b!302948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


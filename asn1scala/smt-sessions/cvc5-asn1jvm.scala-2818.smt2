; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68028 () Bool)

(assert start!68028)

(declare-fun b!305358 () Bool)

(declare-fun e!219922 () Bool)

(declare-fun e!219916 () Bool)

(assert (=> b!305358 (= e!219922 e!219916)))

(declare-fun res!251017 () Bool)

(assert (=> b!305358 (=> (not res!251017) (not e!219916))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438926 () (_ BitVec 64))

(assert (=> b!305358 (= res!251017 (and (bvsle toBit!258 lt!438926) (bvsle fromBit!258 lt!438926)))))

(declare-datatypes ((array!18539 0))(
  ( (array!18540 (arr!9121 (Array (_ BitVec 32) (_ BitVec 8))) (size!8038 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18539)

(assert (=> b!305358 (= lt!438926 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8038 a1!948))))))

(declare-fun lt!438930 () (_ BitVec 32))

(declare-datatypes ((tuple4!1218 0))(
  ( (tuple4!1219 (_1!13264 (_ BitVec 32)) (_2!13264 (_ BitVec 32)) (_3!1566 (_ BitVec 32)) (_4!609 (_ BitVec 32))) )
))
(declare-fun lt!438929 () tuple4!1218)

(declare-fun b!305359 () Bool)

(declare-fun a2!948 () array!18539)

(declare-fun e!219917 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305359 (= e!219917 (byteRangesEq!0 (select (arr!9121 a1!948) (_4!609 lt!438929)) (select (arr!9121 a2!948) (_4!609 lt!438929)) #b00000000000000000000000000000000 lt!438930))))

(declare-fun b!305360 () Bool)

(declare-fun e!219923 () Bool)

(assert (=> b!305360 (= e!219916 e!219923)))

(declare-fun res!251019 () Bool)

(assert (=> b!305360 (=> (not res!251019) (not e!219923))))

(declare-fun e!219925 () Bool)

(assert (=> b!305360 (= res!251019 e!219925)))

(declare-fun c!14755 () Bool)

(assert (=> b!305360 (= c!14755 (= (_3!1566 lt!438929) (_4!609 lt!438929)))))

(declare-datatypes ((Unit!21307 0))(
  ( (Unit!21308) )
))
(declare-fun lt!438924 () Unit!21307)

(declare-fun e!219924 () Unit!21307)

(assert (=> b!305360 (= lt!438924 e!219924)))

(declare-fun c!14756 () Bool)

(declare-fun lt!438925 () tuple4!1218)

(assert (=> b!305360 (= c!14756 (bvslt (_1!13264 lt!438925) (_2!13264 lt!438925)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1218)

(assert (=> b!305360 (= lt!438925 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!305360 (= lt!438930 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438922 () (_ BitVec 32))

(assert (=> b!305360 (= lt!438922 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305360 (= lt!438929 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun call!5750 () Bool)

(declare-fun bm!5747 () Bool)

(assert (=> bm!5747 (= call!5750 (byteRangesEq!0 (select (arr!9121 a1!948) (_3!1566 lt!438929)) (select (arr!9121 a2!948) (_3!1566 lt!438929)) lt!438922 (ite c!14755 lt!438930 #b00000000000000000000000000000111)))))

(declare-fun b!305361 () Bool)

(declare-fun e!219915 () Unit!21307)

(declare-fun lt!438928 () Unit!21307)

(assert (=> b!305361 (= e!219915 lt!438928)))

(declare-fun arrayRangesEqImpliesEq!271 (array!18539 array!18539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21307)

(assert (=> b!305361 (= lt!438928 (arrayRangesEqImpliesEq!271 a1!948 a2!948 (_1!13264 lt!438929) (_3!1566 lt!438925) (_2!13264 lt!438929)))))

(assert (=> b!305361 (= (select (arr!9121 a1!948) (_3!1566 lt!438925)) (select (arr!9121 a2!948) (_3!1566 lt!438925)))))

(declare-fun b!305362 () Bool)

(declare-fun lt!438927 () Unit!21307)

(assert (=> b!305362 (= e!219924 lt!438927)))

(declare-fun arrayRangesEqSlicedLemma!262 (array!18539 array!18539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21307)

(assert (=> b!305362 (= lt!438927 (arrayRangesEqSlicedLemma!262 a1!948 a2!948 (_1!13264 lt!438929) (_2!13264 lt!438929) (_1!13264 lt!438925) (_2!13264 lt!438925)))))

(declare-fun arrayRangesEq!1667 (array!18539 array!18539 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305362 (arrayRangesEq!1667 a1!948 a2!948 (_1!13264 lt!438925) (_2!13264 lt!438925))))

(declare-fun b!305363 () Bool)

(declare-fun Unit!21309 () Unit!21307)

(assert (=> b!305363 (= e!219915 Unit!21309)))

(declare-fun res!251014 () Bool)

(assert (=> start!68028 (=> (not res!251014) (not e!219922))))

(assert (=> start!68028 (= res!251014 (and (bvsle (size!8038 a1!948) (size!8038 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68028 e!219922))

(assert (=> start!68028 true))

(declare-fun array_inv!7650 (array!18539) Bool)

(assert (=> start!68028 (array_inv!7650 a1!948)))

(assert (=> start!68028 (array_inv!7650 a2!948)))

(declare-fun b!305364 () Bool)

(declare-fun Unit!21310 () Unit!21307)

(assert (=> b!305364 (= e!219924 Unit!21310)))

(declare-fun b!305365 () Bool)

(assert (=> b!305365 (= e!219925 call!5750)))

(declare-fun b!305366 () Bool)

(declare-fun e!219920 () Bool)

(assert (=> b!305366 (= e!219925 e!219920)))

(declare-fun res!251015 () Bool)

(assert (=> b!305366 (= res!251015 call!5750)))

(assert (=> b!305366 (=> (not res!251015) (not e!219920))))

(declare-fun b!305367 () Bool)

(declare-fun res!251012 () Bool)

(assert (=> b!305367 (=> (not res!251012) (not e!219916))))

(assert (=> b!305367 (= res!251012 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438926) (not (= fromSlice!52 toSlice!52))))))

(declare-fun e!219918 () Bool)

(declare-fun b!305368 () Bool)

(assert (=> b!305368 (= e!219918 (not (arrayRangesEq!1667 a1!948 a2!948 (_1!13264 lt!438929) (_2!13264 lt!438929))))))

(declare-fun b!305369 () Bool)

(assert (=> b!305369 (= e!219923 e!219918)))

(declare-fun res!251018 () Bool)

(assert (=> b!305369 (=> (not res!251018) (not e!219918))))

(assert (=> b!305369 (= res!251018 (and (bvslt (_4!609 lt!438925) (_4!609 lt!438929)) (bvslt (_3!1566 lt!438929) (_4!609 lt!438925)) (bvsle #b00000000000000000000000000000000 (_1!13264 lt!438929)) (bvsle (_1!13264 lt!438929) (_2!13264 lt!438929)) (bvsle (_2!13264 lt!438929) (size!8038 a1!948)) (bvsle (_1!13264 lt!438929) (_4!609 lt!438925)) (bvslt (_4!609 lt!438925) (_2!13264 lt!438929))))))

(declare-fun lt!438923 () Unit!21307)

(assert (=> b!305369 (= lt!438923 e!219915)))

(declare-fun c!14757 () Bool)

(assert (=> b!305369 (= c!14757 (and (bvslt (_3!1566 lt!438929) (_3!1566 lt!438925)) (bvslt (_3!1566 lt!438925) (_4!609 lt!438929))))))

(declare-fun b!305370 () Bool)

(declare-fun res!251016 () Bool)

(assert (=> b!305370 (= res!251016 (= lt!438930 #b00000000000000000000000000000000))))

(assert (=> b!305370 (=> res!251016 e!219917)))

(assert (=> b!305370 (= e!219920 e!219917)))

(declare-fun b!305371 () Bool)

(declare-fun res!251013 () Bool)

(assert (=> b!305371 (=> (not res!251013) (not e!219916))))

(declare-fun arrayBitRangesEq!0 (array!18539 array!18539 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305371 (= res!251013 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!68028 res!251014) b!305358))

(assert (= (and b!305358 res!251017) b!305371))

(assert (= (and b!305371 res!251013) b!305367))

(assert (= (and b!305367 res!251012) b!305360))

(assert (= (and b!305360 c!14756) b!305362))

(assert (= (and b!305360 (not c!14756)) b!305364))

(assert (= (and b!305360 c!14755) b!305365))

(assert (= (and b!305360 (not c!14755)) b!305366))

(assert (= (and b!305366 res!251015) b!305370))

(assert (= (and b!305370 (not res!251016)) b!305359))

(assert (= (or b!305365 b!305366) bm!5747))

(assert (= (and b!305360 res!251019) b!305369))

(assert (= (and b!305369 c!14757) b!305361))

(assert (= (and b!305369 (not c!14757)) b!305363))

(assert (= (and b!305369 res!251018) b!305368))

(declare-fun m!443811 () Bool)

(assert (=> b!305359 m!443811))

(declare-fun m!443813 () Bool)

(assert (=> b!305359 m!443813))

(assert (=> b!305359 m!443811))

(assert (=> b!305359 m!443813))

(declare-fun m!443815 () Bool)

(assert (=> b!305359 m!443815))

(declare-fun m!443817 () Bool)

(assert (=> b!305371 m!443817))

(declare-fun m!443819 () Bool)

(assert (=> b!305360 m!443819))

(declare-fun m!443821 () Bool)

(assert (=> b!305360 m!443821))

(declare-fun m!443823 () Bool)

(assert (=> bm!5747 m!443823))

(declare-fun m!443825 () Bool)

(assert (=> bm!5747 m!443825))

(assert (=> bm!5747 m!443823))

(assert (=> bm!5747 m!443825))

(declare-fun m!443827 () Bool)

(assert (=> bm!5747 m!443827))

(declare-fun m!443829 () Bool)

(assert (=> b!305362 m!443829))

(declare-fun m!443831 () Bool)

(assert (=> b!305362 m!443831))

(declare-fun m!443833 () Bool)

(assert (=> b!305368 m!443833))

(declare-fun m!443835 () Bool)

(assert (=> start!68028 m!443835))

(declare-fun m!443837 () Bool)

(assert (=> start!68028 m!443837))

(declare-fun m!443839 () Bool)

(assert (=> b!305361 m!443839))

(declare-fun m!443841 () Bool)

(assert (=> b!305361 m!443841))

(declare-fun m!443843 () Bool)

(assert (=> b!305361 m!443843))

(push 1)

(assert (not start!68028))

(assert (not b!305361))

(assert (not b!305359))

(assert (not b!305362))

(assert (not b!305371))

(assert (not bm!5747))

(assert (not b!305368))

(assert (not b!305360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101932 () Bool)

(assert (=> d!101932 (and (bvsge (_3!1566 lt!438925) #b00000000000000000000000000000000) (bvslt (_3!1566 lt!438925) (size!8038 a1!948)) (bvslt (_3!1566 lt!438925) (size!8038 a2!948)) (= (select (arr!9121 a1!948) (_3!1566 lt!438925)) (select (arr!9121 a2!948) (_3!1566 lt!438925))))))

(declare-fun lt!438987 () Unit!21307)

(declare-fun choose!596 (array!18539 array!18539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21307)

(assert (=> d!101932 (= lt!438987 (choose!596 a1!948 a2!948 (_1!13264 lt!438929) (_3!1566 lt!438925) (_2!13264 lt!438929)))))

(assert (=> d!101932 (and (bvsle #b00000000000000000000000000000000 (_1!13264 lt!438929)) (bvsle (_1!13264 lt!438929) (_2!13264 lt!438929)))))

(assert (=> d!101932 (= (arrayRangesEqImpliesEq!271 a1!948 a2!948 (_1!13264 lt!438929) (_3!1566 lt!438925) (_2!13264 lt!438929)) lt!438987)))

(declare-fun bs!26263 () Bool)

(assert (= bs!26263 d!101932))

(assert (=> bs!26263 m!443841))

(assert (=> bs!26263 m!443843))

(declare-fun m!443923 () Bool)

(assert (=> bs!26263 m!443923))

(assert (=> b!305361 d!101932))

(declare-fun d!101934 () Bool)

(assert (=> d!101934 (arrayRangesEq!1667 a1!948 a2!948 (_1!13264 lt!438925) (_2!13264 lt!438925))))

(declare-fun lt!438996 () Unit!21307)

(declare-fun choose!598 (array!18539 array!18539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21307)

(assert (=> d!101934 (= lt!438996 (choose!598 a1!948 a2!948 (_1!13264 lt!438929) (_2!13264 lt!438929) (_1!13264 lt!438925) (_2!13264 lt!438925)))))

(assert (=> d!101934 (and (bvsle #b00000000000000000000000000000000 (_1!13264 lt!438929)) (bvsle (_1!13264 lt!438929) (_2!13264 lt!438929)))))

(assert (=> d!101934 (= (arrayRangesEqSlicedLemma!262 a1!948 a2!948 (_1!13264 lt!438929) (_2!13264 lt!438929) (_1!13264 lt!438925) (_2!13264 lt!438925)) lt!438996)))

(declare-fun bs!26264 () Bool)

(assert (= bs!26264 d!101934))

(assert (=> bs!26264 m!443831))

(declare-fun m!443925 () Bool)

(assert (=> bs!26264 m!443925))

(assert (=> b!305362 d!101934))

(declare-fun d!101936 () Bool)

(declare-fun res!251088 () Bool)

(declare-fun e!220014 () Bool)

(assert (=> d!101936 (=> res!251088 e!220014)))

(assert (=> d!101936 (= res!251088 (= (_1!13264 lt!438925) (_2!13264 lt!438925)))))

(assert (=> d!101936 (= (arrayRangesEq!1667 a1!948 a2!948 (_1!13264 lt!438925) (_2!13264 lt!438925)) e!220014)))

(declare-fun b!305480 () Bool)

(declare-fun e!220015 () Bool)

(assert (=> b!305480 (= e!220014 e!220015)))

(declare-fun res!251089 () Bool)

(assert (=> b!305480 (=> (not res!251089) (not e!220015))))

(assert (=> b!305480 (= res!251089 (= (select (arr!9121 a1!948) (_1!13264 lt!438925)) (select (arr!9121 a2!948) (_1!13264 lt!438925))))))

(declare-fun b!305481 () Bool)

(assert (=> b!305481 (= e!220015 (arrayRangesEq!1667 a1!948 a2!948 (bvadd (_1!13264 lt!438925) #b00000000000000000000000000000001) (_2!13264 lt!438925)))))

(assert (= (and d!101936 (not res!251088)) b!305480))

(assert (= (and b!305480 res!251089) b!305481))

(declare-fun m!443927 () Bool)

(assert (=> b!305480 m!443927))

(declare-fun m!443929 () Bool)

(assert (=> b!305480 m!443929))

(declare-fun m!443931 () Bool)

(assert (=> b!305481 m!443931))

(assert (=> b!305362 d!101936))

(declare-fun d!101938 () Bool)

(declare-fun res!251090 () Bool)

(declare-fun e!220016 () Bool)

(assert (=> d!101938 (=> res!251090 e!220016)))

(assert (=> d!101938 (= res!251090 (= (_1!13264 lt!438929) (_2!13264 lt!438929)))))

(assert (=> d!101938 (= (arrayRangesEq!1667 a1!948 a2!948 (_1!13264 lt!438929) (_2!13264 lt!438929)) e!220016)))

(declare-fun b!305482 () Bool)

(declare-fun e!220017 () Bool)

(assert (=> b!305482 (= e!220016 e!220017)))

(declare-fun res!251091 () Bool)

(assert (=> b!305482 (=> (not res!251091) (not e!220017))))

(assert (=> b!305482 (= res!251091 (= (select (arr!9121 a1!948) (_1!13264 lt!438929)) (select (arr!9121 a2!948) (_1!13264 lt!438929))))))

(declare-fun b!305483 () Bool)

(assert (=> b!305483 (= e!220017 (arrayRangesEq!1667 a1!948 a2!948 (bvadd (_1!13264 lt!438929) #b00000000000000000000000000000001) (_2!13264 lt!438929)))))

(assert (= (and d!101938 (not res!251090)) b!305482))

(assert (= (and b!305482 res!251091) b!305483))

(declare-fun m!443933 () Bool)

(assert (=> b!305482 m!443933))

(declare-fun m!443935 () Bool)

(assert (=> b!305482 m!443935))

(declare-fun m!443937 () Bool)

(assert (=> b!305483 m!443937))

(assert (=> b!305368 d!101938))

(declare-fun d!101940 () Bool)

(assert (=> d!101940 (= (byteRangesEq!0 (select (arr!9121 a1!948) (_4!609 lt!438929)) (select (arr!9121 a2!948) (_4!609 lt!438929)) #b00000000000000000000000000000000 lt!438930) (or (= #b00000000000000000000000000000000 lt!438930) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9121 a1!948) (_4!609 lt!438929))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438930))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9121 a2!948) (_4!609 lt!438929))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438930))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26267 () Bool)

(assert (= bs!26267 d!101940))

(declare-fun m!443959 () Bool)

(assert (=> bs!26267 m!443959))

(declare-fun m!443961 () Bool)

(assert (=> bs!26267 m!443961))

(assert (=> b!305359 d!101940))

(declare-fun d!101948 () Bool)

(assert (=> d!101948 (= (array_inv!7650 a1!948) (bvsge (size!8038 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68028 d!101948))

(declare-fun d!101950 () Bool)

(assert (=> d!101950 (= (array_inv!7650 a2!948) (bvsge (size!8038 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68028 d!101950))

(declare-fun d!101952 () Bool)

(assert (=> d!101952 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1219 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305360 d!101952))

(declare-fun d!101956 () Bool)

(assert (=> d!101956 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1219 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305360 d!101956))

(declare-fun d!101958 () Bool)

(assert (=> d!101958 (= (byteRangesEq!0 (select (arr!9121 a1!948) (_3!1566 lt!438929)) (select (arr!9121 a2!948) (_3!1566 lt!438929)) lt!438922 (ite c!14755 lt!438930 #b00000000000000000000000000000111)) (or (= lt!438922 (ite c!14755 lt!438930 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9121 a1!948) (_3!1566 lt!438929))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14755 lt!438930 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438922)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9121 a2!948) (_3!1566 lt!438929))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14755 lt!438930 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438922)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26269 () Bool)

(assert (= bs!26269 d!101958))

(declare-fun m!443971 () Bool)

(assert (=> bs!26269 m!443971))

(declare-fun m!443973 () Bool)

(assert (=> bs!26269 m!443973))

(assert (=> bm!5747 d!101958))

(declare-fun lt!439021 () tuple4!1218)

(declare-fun e!220061 () Bool)

(declare-fun b!305528 () Bool)

(assert (=> b!305528 (= e!220061 (arrayRangesEq!1667 a1!948 a2!948 (_1!13264 lt!439021) (_2!13264 lt!439021)))))

(declare-fun b!305529 () Bool)

(declare-fun res!251127 () Bool)

(declare-fun lt!439022 () (_ BitVec 32))

(assert (=> b!305529 (= res!251127 (= lt!439022 #b00000000000000000000000000000000))))

(declare-fun e!220059 () Bool)

(assert (=> b!305529 (=> res!251127 e!220059)))

(declare-fun e!220056 () Bool)

(assert (=> b!305529 (= e!220056 e!220059)))

(declare-fun b!305530 () Bool)

(declare-fun e!220060 () Bool)

(declare-fun call!5765 () Bool)

(assert (=> b!305530 (= e!220060 call!5765)))

(declare-fun lt!439023 () (_ BitVec 32))

(declare-fun bm!5762 () Bool)

(declare-fun c!14784 () Bool)

(assert (=> bm!5762 (= call!5765 (byteRangesEq!0 (ite c!14784 (select (arr!9121 a1!948) (_3!1566 lt!439021)) (select (arr!9121 a1!948) (_4!609 lt!439021))) (ite c!14784 (select (arr!9121 a2!948) (_3!1566 lt!439021)) (select (arr!9121 a2!948) (_4!609 lt!439021))) (ite c!14784 lt!439023 #b00000000000000000000000000000000) lt!439022))))

(declare-fun b!305531 () Bool)

(declare-fun e!220058 () Bool)

(assert (=> b!305531 (= e!220058 e!220060)))

(assert (=> b!305531 (= c!14784 (= (_3!1566 lt!439021) (_4!609 lt!439021)))))

(declare-fun b!305532 () Bool)

(assert (=> b!305532 (= e!220059 call!5765)))

(declare-fun b!305533 () Bool)

(declare-fun e!220057 () Bool)

(assert (=> b!305533 (= e!220057 e!220058)))

(declare-fun res!251126 () Bool)

(assert (=> b!305533 (=> (not res!251126) (not e!220058))))

(assert (=> b!305533 (= res!251126 e!220061)))

(declare-fun res!251128 () Bool)

(assert (=> b!305533 (=> res!251128 e!220061)))

(assert (=> b!305533 (= res!251128 (bvsge (_1!13264 lt!439021) (_2!13264 lt!439021)))))

(assert (=> b!305533 (= lt!439022 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305533 (= lt!439023 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305533 (= lt!439021 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101962 () Bool)

(declare-fun res!251125 () Bool)

(assert (=> d!101962 (=> res!251125 e!220057)))

(assert (=> d!101962 (= res!251125 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101962 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220057)))

(declare-fun b!305534 () Bool)

(assert (=> b!305534 (= e!220060 e!220056)))

(declare-fun res!251124 () Bool)

(assert (=> b!305534 (= res!251124 (byteRangesEq!0 (select (arr!9121 a1!948) (_3!1566 lt!439021)) (select (arr!9121 a2!948) (_3!1566 lt!439021)) lt!439023 #b00000000000000000000000000001000))))

(assert (=> b!305534 (=> (not res!251124) (not e!220056))))

(assert (= (and d!101962 (not res!251125)) b!305533))

(assert (= (and b!305533 (not res!251128)) b!305528))

(assert (= (and b!305533 res!251126) b!305531))

(assert (= (and b!305531 c!14784) b!305530))

(assert (= (and b!305531 (not c!14784)) b!305534))

(assert (= (and b!305534 res!251124) b!305529))

(assert (= (and b!305529 (not res!251127)) b!305532))

(assert (= (or b!305530 b!305532) bm!5762))

(declare-fun m!443989 () Bool)

(assert (=> b!305528 m!443989))

(declare-fun m!443991 () Bool)

(assert (=> bm!5762 m!443991))

(declare-fun m!443993 () Bool)

(assert (=> bm!5762 m!443993))

(declare-fun m!443995 () Bool)

(assert (=> bm!5762 m!443995))

(declare-fun m!443997 () Bool)

(assert (=> bm!5762 m!443997))

(declare-fun m!443999 () Bool)

(assert (=> bm!5762 m!443999))

(assert (=> b!305533 m!443821))

(assert (=> b!305534 m!443995))

(assert (=> b!305534 m!443991))

(assert (=> b!305534 m!443995))

(assert (=> b!305534 m!443991))

(declare-fun m!444001 () Bool)

(assert (=> b!305534 m!444001))

(assert (=> b!305371 d!101962))

(push 1)

(assert (not b!305481))

(assert (not b!305534))

(assert (not bm!5762))

(assert (not b!305528))

(assert (not d!101934))

(assert (not b!305483))

(assert (not d!101932))

(assert (not b!305533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


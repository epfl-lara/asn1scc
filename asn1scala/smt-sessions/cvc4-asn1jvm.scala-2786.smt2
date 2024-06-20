; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67246 () Bool)

(assert start!67246)

(declare-fun b!302099 () Bool)

(declare-fun e!216999 () Bool)

(declare-fun e!216995 () Bool)

(assert (=> b!302099 (= e!216999 e!216995)))

(declare-fun res!248610 () Bool)

(declare-datatypes ((array!18294 0))(
  ( (array!18295 (arr!9027 (Array (_ BitVec 32) (_ BitVec 8))) (size!7944 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18294)

(declare-fun a2!948 () array!18294)

(declare-datatypes ((tuple4!1096 0))(
  ( (tuple4!1097 (_1!13203 (_ BitVec 32)) (_2!13203 (_ BitVec 32)) (_3!1505 (_ BitVec 32)) (_4!548 (_ BitVec 32))) )
))
(declare-fun lt!437122 () tuple4!1096)

(declare-fun lt!437126 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302099 (= res!248610 (byteRangesEq!0 (select (arr!9027 a1!948) (_3!1505 lt!437122)) (select (arr!9027 a2!948) (_3!1505 lt!437122)) lt!437126 #b00000000000000000000000000000111))))

(assert (=> b!302099 (=> (not res!248610) (not e!216995))))

(declare-fun b!302100 () Bool)

(declare-datatypes ((Unit!21155 0))(
  ( (Unit!21156) )
))
(declare-fun e!217001 () Unit!21155)

(declare-fun Unit!21157 () Unit!21155)

(assert (=> b!302100 (= e!217001 Unit!21157)))

(declare-fun b!302102 () Bool)

(declare-fun res!248611 () Bool)

(declare-fun lt!437125 () (_ BitVec 32))

(assert (=> b!302102 (= res!248611 (= lt!437125 #b00000000000000000000000000000000))))

(declare-fun e!217005 () Bool)

(assert (=> b!302102 (=> res!248611 e!217005)))

(assert (=> b!302102 (= e!216995 e!217005)))

(declare-fun b!302103 () Bool)

(declare-fun e!217002 () Bool)

(declare-fun e!217006 () Bool)

(assert (=> b!302103 (= e!217002 e!217006)))

(declare-fun res!248612 () Bool)

(assert (=> b!302103 (=> (not res!248612) (not e!217006))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437121 () (_ BitVec 64))

(assert (=> b!302103 (= res!248612 (and (bvsle toBit!258 lt!437121) (bvsle fromBit!258 lt!437121)))))

(assert (=> b!302103 (= lt!437121 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7944 a1!948))))))

(declare-fun b!302104 () Bool)

(declare-fun call!5501 () Bool)

(assert (=> b!302104 (= e!217005 call!5501)))

(declare-fun b!302105 () Bool)

(declare-fun e!217004 () Unit!21155)

(declare-fun Unit!21158 () Unit!21155)

(assert (=> b!302105 (= e!217004 Unit!21158)))

(declare-fun b!302106 () Bool)

(declare-fun res!248614 () Bool)

(assert (=> b!302106 (=> (not res!248614) (not e!217006))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302106 (= res!248614 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437121) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302107 () Bool)

(declare-fun e!217003 () Unit!21155)

(declare-fun Unit!21159 () Unit!21155)

(assert (=> b!302107 (= e!217003 Unit!21159)))

(declare-fun b!302108 () Bool)

(declare-fun e!216998 () Bool)

(assert (=> b!302108 (= e!217006 e!216998)))

(declare-fun res!248607 () Bool)

(assert (=> b!302108 (=> (not res!248607) (not e!216998))))

(assert (=> b!302108 (= res!248607 e!216999)))

(declare-fun c!14329 () Bool)

(assert (=> b!302108 (= c!14329 (= (_3!1505 lt!437122) (_4!548 lt!437122)))))

(declare-fun lt!437119 () Unit!21155)

(assert (=> b!302108 (= lt!437119 e!217001)))

(declare-fun c!14330 () Bool)

(declare-fun lt!437124 () tuple4!1096)

(assert (=> b!302108 (= c!14330 (bvslt (_1!13203 lt!437124) (_2!13203 lt!437124)))))

(declare-fun lt!437117 () (_ BitVec 32))

(assert (=> b!302108 (= lt!437117 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1096)

(assert (=> b!302108 (= lt!437124 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302108 (= lt!437125 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302108 (= lt!437126 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302108 (= lt!437122 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302109 () Bool)

(declare-fun res!248615 () Bool)

(declare-fun e!217000 () Bool)

(assert (=> b!302109 (=> (not res!248615) (not e!217000))))

(assert (=> b!302109 (= res!248615 (byteRangesEq!0 (select (arr!9027 a1!948) (_3!1505 lt!437124)) (select (arr!9027 a2!948) (_3!1505 lt!437124)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!302110 () Bool)

(assert (=> b!302110 (= e!216999 call!5501)))

(declare-fun b!302111 () Bool)

(assert (=> b!302111 (= e!217000 (not (byteRangesEq!0 (select (arr!9027 a1!948) (_4!548 lt!437124)) (select (arr!9027 a2!948) (_4!548 lt!437124)) #b00000000000000000000000000000000 lt!437117)))))

(declare-fun bm!5498 () Bool)

(assert (=> bm!5498 (= call!5501 (byteRangesEq!0 (ite c!14329 (select (arr!9027 a1!948) (_3!1505 lt!437122)) (select (arr!9027 a1!948) (_4!548 lt!437122))) (ite c!14329 (select (arr!9027 a2!948) (_3!1505 lt!437122)) (select (arr!9027 a2!948) (_4!548 lt!437122))) (ite c!14329 lt!437126 #b00000000000000000000000000000000) lt!437125))))

(declare-fun b!302112 () Bool)

(declare-fun res!248613 () Bool)

(assert (=> b!302112 (=> (not res!248613) (not e!217000))))

(assert (=> b!302112 (= res!248613 (not (= lt!437117 #b00000000000000000000000000000000)))))

(declare-fun b!302113 () Bool)

(declare-fun lt!437116 () Unit!21155)

(assert (=> b!302113 (= e!217001 lt!437116)))

(declare-fun arrayRangesEqSlicedLemma!216 (array!18294 array!18294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21155)

(assert (=> b!302113 (= lt!437116 (arrayRangesEqSlicedLemma!216 a1!948 a2!948 (_1!13203 lt!437122) (_2!13203 lt!437122) (_1!13203 lt!437124) (_2!13203 lt!437124)))))

(declare-fun arrayRangesEq!1606 (array!18294 array!18294 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302113 (arrayRangesEq!1606 a1!948 a2!948 (_1!13203 lt!437124) (_2!13203 lt!437124))))

(declare-fun b!302101 () Bool)

(declare-fun res!248616 () Bool)

(assert (=> b!302101 (=> (not res!248616) (not e!217006))))

(declare-fun arrayBitRangesEq!0 (array!18294 array!18294 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302101 (= res!248616 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!248608 () Bool)

(assert (=> start!67246 (=> (not res!248608) (not e!217002))))

(assert (=> start!67246 (= res!248608 (and (bvsle (size!7944 a1!948) (size!7944 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67246 e!217002))

(assert (=> start!67246 true))

(declare-fun array_inv!7556 (array!18294) Bool)

(assert (=> start!67246 (array_inv!7556 a1!948)))

(assert (=> start!67246 (array_inv!7556 a2!948)))

(declare-fun b!302114 () Bool)

(declare-fun lt!437118 () Unit!21155)

(assert (=> b!302114 (= e!217003 lt!437118)))

(declare-fun arrayRangesEqImpliesEq!258 (array!18294 array!18294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21155)

(assert (=> b!302114 (= lt!437118 (arrayRangesEqImpliesEq!258 a1!948 a2!948 (_1!13203 lt!437122) (_3!1505 lt!437124) (_2!13203 lt!437122)))))

(assert (=> b!302114 (= (select (arr!9027 a1!948) (_3!1505 lt!437124)) (select (arr!9027 a2!948) (_3!1505 lt!437124)))))

(declare-fun b!302115 () Bool)

(assert (=> b!302115 (= e!216998 e!217000)))

(declare-fun res!248609 () Bool)

(assert (=> b!302115 (=> (not res!248609) (not e!217000))))

(assert (=> b!302115 (= res!248609 (not (= (_3!1505 lt!437124) (_4!548 lt!437124))))))

(declare-fun lt!437127 () Unit!21155)

(assert (=> b!302115 (= lt!437127 e!217004)))

(declare-fun c!14331 () Bool)

(assert (=> b!302115 (= c!14331 (and (bvslt (_4!548 lt!437124) (_4!548 lt!437122)) (bvslt (_3!1505 lt!437122) (_4!548 lt!437124))))))

(declare-fun lt!437123 () Unit!21155)

(assert (=> b!302115 (= lt!437123 e!217003)))

(declare-fun c!14328 () Bool)

(assert (=> b!302115 (= c!14328 (and (bvslt (_3!1505 lt!437122) (_3!1505 lt!437124)) (bvslt (_3!1505 lt!437124) (_4!548 lt!437122))))))

(declare-fun b!302116 () Bool)

(declare-fun lt!437120 () Unit!21155)

(assert (=> b!302116 (= e!217004 lt!437120)))

(assert (=> b!302116 (= lt!437120 (arrayRangesEqImpliesEq!258 a1!948 a2!948 (_1!13203 lt!437122) (_4!548 lt!437124) (_2!13203 lt!437122)))))

(assert (=> b!302116 (= (select (arr!9027 a1!948) (_4!548 lt!437124)) (select (arr!9027 a2!948) (_4!548 lt!437124)))))

(assert (= (and start!67246 res!248608) b!302103))

(assert (= (and b!302103 res!248612) b!302101))

(assert (= (and b!302101 res!248616) b!302106))

(assert (= (and b!302106 res!248614) b!302108))

(assert (= (and b!302108 c!14330) b!302113))

(assert (= (and b!302108 (not c!14330)) b!302100))

(assert (= (and b!302108 c!14329) b!302110))

(assert (= (and b!302108 (not c!14329)) b!302099))

(assert (= (and b!302099 res!248610) b!302102))

(assert (= (and b!302102 (not res!248611)) b!302104))

(assert (= (or b!302110 b!302104) bm!5498))

(assert (= (and b!302108 res!248607) b!302115))

(assert (= (and b!302115 c!14328) b!302114))

(assert (= (and b!302115 (not c!14328)) b!302107))

(assert (= (and b!302115 c!14331) b!302116))

(assert (= (and b!302115 (not c!14331)) b!302105))

(assert (= (and b!302115 res!248609) b!302109))

(assert (= (and b!302109 res!248615) b!302112))

(assert (= (and b!302112 res!248613) b!302111))

(declare-fun m!440913 () Bool)

(assert (=> start!67246 m!440913))

(declare-fun m!440915 () Bool)

(assert (=> start!67246 m!440915))

(declare-fun m!440917 () Bool)

(assert (=> b!302111 m!440917))

(declare-fun m!440919 () Bool)

(assert (=> b!302111 m!440919))

(assert (=> b!302111 m!440917))

(assert (=> b!302111 m!440919))

(declare-fun m!440921 () Bool)

(assert (=> b!302111 m!440921))

(declare-fun m!440923 () Bool)

(assert (=> b!302114 m!440923))

(declare-fun m!440925 () Bool)

(assert (=> b!302114 m!440925))

(declare-fun m!440927 () Bool)

(assert (=> b!302114 m!440927))

(declare-fun m!440929 () Bool)

(assert (=> b!302101 m!440929))

(declare-fun m!440931 () Bool)

(assert (=> bm!5498 m!440931))

(declare-fun m!440933 () Bool)

(assert (=> bm!5498 m!440933))

(declare-fun m!440935 () Bool)

(assert (=> bm!5498 m!440935))

(declare-fun m!440937 () Bool)

(assert (=> bm!5498 m!440937))

(declare-fun m!440939 () Bool)

(assert (=> bm!5498 m!440939))

(declare-fun m!440941 () Bool)

(assert (=> b!302108 m!440941))

(declare-fun m!440943 () Bool)

(assert (=> b!302108 m!440943))

(declare-fun m!440945 () Bool)

(assert (=> b!302116 m!440945))

(assert (=> b!302116 m!440917))

(assert (=> b!302116 m!440919))

(assert (=> b!302109 m!440925))

(assert (=> b!302109 m!440927))

(assert (=> b!302109 m!440925))

(assert (=> b!302109 m!440927))

(declare-fun m!440947 () Bool)

(assert (=> b!302109 m!440947))

(declare-fun m!440949 () Bool)

(assert (=> b!302113 m!440949))

(declare-fun m!440951 () Bool)

(assert (=> b!302113 m!440951))

(assert (=> b!302099 m!440937))

(assert (=> b!302099 m!440933))

(assert (=> b!302099 m!440937))

(assert (=> b!302099 m!440933))

(declare-fun m!440953 () Bool)

(assert (=> b!302099 m!440953))

(push 1)

(assert (not b!302099))

(assert (not b!302114))

(assert (not b!302116))

(assert (not b!302101))

(assert (not b!302113))

(assert (not b!302109))

(assert (not b!302111))

(assert (not bm!5498))

(assert (not b!302108))

(assert (not start!67246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101012 () Bool)

(assert (=> d!101012 (= (byteRangesEq!0 (select (arr!9027 a1!948) (_4!548 lt!437124)) (select (arr!9027 a2!948) (_4!548 lt!437124)) #b00000000000000000000000000000000 lt!437117) (or (= #b00000000000000000000000000000000 lt!437117) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9027 a1!948) (_4!548 lt!437124))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437117))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9027 a2!948) (_4!548 lt!437124))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437117))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26057 () Bool)

(assert (= bs!26057 d!101012))

(declare-fun m!441035 () Bool)

(assert (=> bs!26057 m!441035))

(declare-fun m!441037 () Bool)

(assert (=> bs!26057 m!441037))

(assert (=> b!302111 d!101012))

(declare-fun d!101014 () Bool)

(assert (=> d!101014 (= (byteRangesEq!0 (select (arr!9027 a1!948) (_3!1505 lt!437124)) (select (arr!9027 a2!948) (_3!1505 lt!437124)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9027 a1!948) (_3!1505 lt!437124))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9027 a2!948) (_3!1505 lt!437124))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26058 () Bool)

(assert (= bs!26058 d!101014))

(declare-fun m!441039 () Bool)

(assert (=> bs!26058 m!441039))

(declare-fun m!441041 () Bool)

(assert (=> bs!26058 m!441041))

(assert (=> b!302109 d!101014))

(declare-fun d!101016 () Bool)

(assert (=> d!101016 (arrayRangesEq!1606 a1!948 a2!948 (_1!13203 lt!437124) (_2!13203 lt!437124))))

(declare-fun lt!437162 () Unit!21155)

(declare-fun choose!546 (array!18294 array!18294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21155)

(assert (=> d!101016 (= lt!437162 (choose!546 a1!948 a2!948 (_1!13203 lt!437122) (_2!13203 lt!437122) (_1!13203 lt!437124) (_2!13203 lt!437124)))))

(assert (=> d!101016 (and (bvsle #b00000000000000000000000000000000 (_1!13203 lt!437122)) (bvsle (_1!13203 lt!437122) (_2!13203 lt!437122)))))

(assert (=> d!101016 (= (arrayRangesEqSlicedLemma!216 a1!948 a2!948 (_1!13203 lt!437122) (_2!13203 lt!437122) (_1!13203 lt!437124) (_2!13203 lt!437124)) lt!437162)))

(declare-fun bs!26059 () Bool)

(assert (= bs!26059 d!101016))

(assert (=> bs!26059 m!440951))

(declare-fun m!441043 () Bool)

(assert (=> bs!26059 m!441043))

(assert (=> b!302113 d!101016))

(declare-fun d!101018 () Bool)

(declare-fun res!248663 () Bool)

(declare-fun e!217059 () Bool)

(assert (=> d!101018 (=> res!248663 e!217059)))

(assert (=> d!101018 (= res!248663 (= (_1!13203 lt!437124) (_2!13203 lt!437124)))))

(assert (=> d!101018 (= (arrayRangesEq!1606 a1!948 a2!948 (_1!13203 lt!437124) (_2!13203 lt!437124)) e!217059)))

(declare-fun b!302175 () Bool)

(declare-fun e!217060 () Bool)

(assert (=> b!302175 (= e!217059 e!217060)))

(declare-fun res!248664 () Bool)

(assert (=> b!302175 (=> (not res!248664) (not e!217060))))

(assert (=> b!302175 (= res!248664 (= (select (arr!9027 a1!948) (_1!13203 lt!437124)) (select (arr!9027 a2!948) (_1!13203 lt!437124))))))

(declare-fun b!302176 () Bool)

(assert (=> b!302176 (= e!217060 (arrayRangesEq!1606 a1!948 a2!948 (bvadd (_1!13203 lt!437124) #b00000000000000000000000000000001) (_2!13203 lt!437124)))))

(assert (= (and d!101018 (not res!248663)) b!302175))

(assert (= (and b!302175 res!248664) b!302176))

(declare-fun m!441045 () Bool)

(assert (=> b!302175 m!441045))

(declare-fun m!441047 () Bool)

(assert (=> b!302175 m!441047))

(declare-fun m!441049 () Bool)

(assert (=> b!302176 m!441049))

(assert (=> b!302113 d!101018))

(declare-fun d!101020 () Bool)

(assert (=> d!101020 (= (byteRangesEq!0 (select (arr!9027 a1!948) (_3!1505 lt!437122)) (select (arr!9027 a2!948) (_3!1505 lt!437122)) lt!437126 #b00000000000000000000000000000111) (or (= lt!437126 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9027 a1!948) (_3!1505 lt!437122))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!437126)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9027 a2!948) (_3!1505 lt!437122))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!437126)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26060 () Bool)

(assert (= bs!26060 d!101020))

(assert (=> bs!26060 m!441039))

(declare-fun m!441051 () Bool)

(assert (=> bs!26060 m!441051))

(assert (=> b!302099 d!101020))

(declare-fun d!101022 () Bool)

(assert (=> d!101022 (and (bvsge (_3!1505 lt!437124) #b00000000000000000000000000000000) (bvslt (_3!1505 lt!437124) (size!7944 a1!948)) (bvslt (_3!1505 lt!437124) (size!7944 a2!948)) (= (select (arr!9027 a1!948) (_3!1505 lt!437124)) (select (arr!9027 a2!948) (_3!1505 lt!437124))))))

(declare-fun lt!437165 () Unit!21155)

(declare-fun choose!547 (array!18294 array!18294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21155)

(assert (=> d!101022 (= lt!437165 (choose!547 a1!948 a2!948 (_1!13203 lt!437122) (_3!1505 lt!437124) (_2!13203 lt!437122)))))

(assert (=> d!101022 (and (bvsle #b00000000000000000000000000000000 (_1!13203 lt!437122)) (bvsle (_1!13203 lt!437122) (_2!13203 lt!437122)))))

(assert (=> d!101022 (= (arrayRangesEqImpliesEq!258 a1!948 a2!948 (_1!13203 lt!437122) (_3!1505 lt!437124) (_2!13203 lt!437122)) lt!437165)))

(declare-fun bs!26061 () Bool)

(assert (= bs!26061 d!101022))

(assert (=> bs!26061 m!440925))

(assert (=> bs!26061 m!440927))

(declare-fun m!441053 () Bool)

(assert (=> bs!26061 m!441053))

(assert (=> b!302114 d!101022))

(declare-fun d!101024 () Bool)

(assert (=> d!101024 (= (array_inv!7556 a1!948) (bvsge (size!7944 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67246 d!101024))

(declare-fun d!101026 () Bool)

(assert (=> d!101026 (= (array_inv!7556 a2!948) (bvsge (size!7944 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67246 d!101026))

(declare-fun d!101028 () Bool)

(assert (=> d!101028 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1097 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302108 d!101028))

(declare-fun d!101030 () Bool)

(assert (=> d!101030 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1097 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302108 d!101030))

(declare-fun b!302191 () Bool)

(declare-fun e!217078 () Bool)

(declare-fun e!217073 () Bool)

(assert (=> b!302191 (= e!217078 e!217073)))

(declare-fun c!14340 () Bool)

(declare-fun lt!437174 () tuple4!1096)

(assert (=> b!302191 (= c!14340 (= (_3!1505 lt!437174) (_4!548 lt!437174)))))

(declare-fun b!302192 () Bool)

(declare-fun call!5510 () Bool)

(assert (=> b!302192 (= e!217073 call!5510)))

(declare-fun lt!437173 () (_ BitVec 32))

(declare-fun lt!437172 () (_ BitVec 32))

(declare-fun bm!5507 () Bool)

(assert (=> bm!5507 (= call!5510 (byteRangesEq!0 (ite c!14340 (select (arr!9027 a1!948) (_3!1505 lt!437174)) (select (arr!9027 a1!948) (_4!548 lt!437174))) (ite c!14340 (select (arr!9027 a2!948) (_3!1505 lt!437174)) (select (arr!9027 a2!948) (_4!548 lt!437174))) (ite c!14340 lt!437173 #b00000000000000000000000000000000) lt!437172))))

(declare-fun e!217075 () Bool)

(declare-fun b!302193 () Bool)

(assert (=> b!302193 (= e!217075 (arrayRangesEq!1606 a1!948 a2!948 (_1!13203 lt!437174) (_2!13203 lt!437174)))))

(declare-fun d!101032 () Bool)

(declare-fun res!248675 () Bool)

(declare-fun e!217077 () Bool)

(assert (=> d!101032 (=> res!248675 e!217077)))

(assert (=> d!101032 (= res!248675 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101032 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217077)))

(declare-fun b!302194 () Bool)

(declare-fun res!248678 () Bool)

(assert (=> b!302194 (= res!248678 (= lt!437172 #b00000000000000000000000000000000))))

(declare-fun e!217076 () Bool)

(assert (=> b!302194 (=> res!248678 e!217076)))

(declare-fun e!217074 () Bool)

(assert (=> b!302194 (= e!217074 e!217076)))

(declare-fun b!302195 () Bool)

(assert (=> b!302195 (= e!217076 call!5510)))

(declare-fun b!302196 () Bool)

(assert (=> b!302196 (= e!217077 e!217078)))

(declare-fun res!248679 () Bool)

(assert (=> b!302196 (=> (not res!248679) (not e!217078))))

(assert (=> b!302196 (= res!248679 e!217075)))

(declare-fun res!248677 () Bool)

(assert (=> b!302196 (=> res!248677 e!217075)))

(assert (=> b!302196 (= res!248677 (bvsge (_1!13203 lt!437174) (_2!13203 lt!437174)))))

(assert (=> b!302196 (= lt!437172 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302196 (= lt!437173 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302196 (= lt!437174 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302197 () Bool)

(assert (=> b!302197 (= e!217073 e!217074)))

(declare-fun res!248676 () Bool)

(assert (=> b!302197 (= res!248676 (byteRangesEq!0 (select (arr!9027 a1!948) (_3!1505 lt!437174)) (select (arr!9027 a2!948) (_3!1505 lt!437174)) lt!437173 #b00000000000000000000000000001000))))

(assert (=> b!302197 (=> (not res!248676) (not e!217074))))

(assert (= (and d!101032 (not res!248675)) b!302196))

(assert (= (and b!302196 (not res!248677)) b!302193))

(assert (= (and b!302196 res!248679) b!302191))

(assert (= (and b!302191 c!14340) b!302192))

(assert (= (and b!302191 (not c!14340)) b!302197))

(assert (= (and b!302197 res!248676) b!302194))

(assert (= (and b!302194 (not res!248678)) b!302195))

(assert (= (or b!302192 b!302195) bm!5507))

(declare-fun m!441055 () Bool)

(assert (=> bm!5507 m!441055))

(declare-fun m!441057 () Bool)

(assert (=> bm!5507 m!441057))

(declare-fun m!441059 () Bool)

(assert (=> bm!5507 m!441059))

(declare-fun m!441061 () Bool)

(assert (=> bm!5507 m!441061))

(declare-fun m!441063 () Bool)

(assert (=> bm!5507 m!441063))

(declare-fun m!441065 () Bool)

(assert (=> b!302193 m!441065))

(assert (=> b!302196 m!440943))

(assert (=> b!302197 m!441059))

(assert (=> b!302197 m!441055))

(assert (=> b!302197 m!441059))

(assert (=> b!302197 m!441055))

(declare-fun m!441067 () Bool)

(assert (=> b!302197 m!441067))

(assert (=> b!302101 d!101032))

(declare-fun d!101034 () Bool)

(assert (=> d!101034 (and (bvsge (_4!548 lt!437124) #b00000000000000000000000000000000) (bvslt (_4!548 lt!437124) (size!7944 a1!948)) (bvslt (_4!548 lt!437124) (size!7944 a2!948)) (= (select (arr!9027 a1!948) (_4!548 lt!437124)) (select (arr!9027 a2!948) (_4!548 lt!437124))))))

(declare-fun lt!437175 () Unit!21155)

(assert (=> d!101034 (= lt!437175 (choose!547 a1!948 a2!948 (_1!13203 lt!437122) (_4!548 lt!437124) (_2!13203 lt!437122)))))

(assert (=> d!101034 (and (bvsle #b00000000000000000000000000000000 (_1!13203 lt!437122)) (bvsle (_1!13203 lt!437122) (_2!13203 lt!437122)))))

(assert (=> d!101034 (= (arrayRangesEqImpliesEq!258 a1!948 a2!948 (_1!13203 lt!437122) (_4!548 lt!437124) (_2!13203 lt!437122)) lt!437175)))

(declare-fun bs!26062 () Bool)

(assert (= bs!26062 d!101034))

(assert (=> bs!26062 m!440917))

(assert (=> bs!26062 m!440919))

(declare-fun m!441069 () Bool)

(assert (=> bs!26062 m!441069))

(assert (=> b!302116 d!101034))

(declare-fun d!101036 () Bool)

(assert (=> d!101036 (= (byteRangesEq!0 (ite c!14329 (select (arr!9027 a1!948) (_3!1505 lt!437122)) (select (arr!9027 a1!948) (_4!548 lt!437122))) (ite c!14329 (select (arr!9027 a2!948) (_3!1505 lt!437122)) (select (arr!9027 a2!948) (_4!548 lt!437122))) (ite c!14329 lt!437126 #b00000000000000000000000000000000) lt!437125) (or (= (ite c!14329 lt!437126 #b00000000000000000000000000000000) lt!437125) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14329 (select (arr!9027 a1!948) (_3!1505 lt!437122)) (select (arr!9027 a1!948) (_4!548 lt!437122)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437125))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14329 lt!437126 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14329 (select (arr!9027 a2!948) (_3!1505 lt!437122)) (select (arr!9027 a2!948) (_4!548 lt!437122)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437125))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14329 lt!437126 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26063 () Bool)

(assert (= bs!26063 d!101036))

(declare-fun m!441071 () Bool)

(assert (=> bs!26063 m!441071))

(declare-fun m!441073 () Bool)

(assert (=> bs!26063 m!441073))

(assert (=> bm!5498 d!101036))

(push 1)

(assert (not bm!5507))

(assert (not d!101034))

(assert (not b!302193))

(assert (not b!302176))

(assert (not b!302196))

(assert (not d!101022))

(assert (not d!101016))

(assert (not b!302197))

(check-sat)

(pop 1)

(push 1)

(check-sat)


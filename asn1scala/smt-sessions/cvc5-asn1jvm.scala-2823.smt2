; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68268 () Bool)

(assert start!68268)

(declare-fun b!306476 () Bool)

(declare-datatypes ((Unit!21379 0))(
  ( (Unit!21380) )
))
(declare-fun e!220804 () Unit!21379)

(declare-fun Unit!21381 () Unit!21379)

(assert (=> b!306476 (= e!220804 Unit!21381)))

(declare-fun b!306477 () Bool)

(declare-fun e!220807 () Bool)

(declare-fun e!220812 () Bool)

(assert (=> b!306477 (= e!220807 e!220812)))

(declare-fun res!251692 () Bool)

(declare-datatypes ((array!18584 0))(
  ( (array!18585 (arr!9136 (Array (_ BitVec 32) (_ BitVec 8))) (size!8053 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18584)

(declare-fun lt!439653 () (_ BitVec 32))

(declare-fun a2!948 () array!18584)

(declare-datatypes ((tuple4!1248 0))(
  ( (tuple4!1249 (_1!13279 (_ BitVec 32)) (_2!13279 (_ BitVec 32)) (_3!1581 (_ BitVec 32)) (_4!624 (_ BitVec 32))) )
))
(declare-fun lt!439659 () tuple4!1248)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306477 (= res!251692 (byteRangesEq!0 (select (arr!9136 a1!948) (_3!1581 lt!439659)) (select (arr!9136 a2!948) (_3!1581 lt!439659)) lt!439653 #b00000000000000000000000000000111))))

(assert (=> b!306477 (=> (not res!251692) (not e!220812))))

(declare-fun call!5843 () Bool)

(declare-fun lt!439650 () (_ BitVec 32))

(declare-fun bm!5840 () Bool)

(declare-fun c!14976 () Bool)

(assert (=> bm!5840 (= call!5843 (byteRangesEq!0 (ite c!14976 (select (arr!9136 a1!948) (_3!1581 lt!439659)) (select (arr!9136 a1!948) (_4!624 lt!439659))) (ite c!14976 (select (arr!9136 a2!948) (_3!1581 lt!439659)) (select (arr!9136 a2!948) (_4!624 lt!439659))) (ite c!14976 lt!439653 #b00000000000000000000000000000000) lt!439650))))

(declare-fun b!306478 () Bool)

(declare-fun e!220806 () Bool)

(declare-fun e!220809 () Bool)

(assert (=> b!306478 (= e!220806 e!220809)))

(declare-fun res!251688 () Bool)

(assert (=> b!306478 (=> (not res!251688) (not e!220809))))

(assert (=> b!306478 (= res!251688 e!220807)))

(assert (=> b!306478 (= c!14976 (= (_3!1581 lt!439659) (_4!624 lt!439659)))))

(declare-fun lt!439652 () Unit!21379)

(assert (=> b!306478 (= lt!439652 e!220804)))

(declare-fun c!14978 () Bool)

(declare-fun lt!439657 () tuple4!1248)

(assert (=> b!306478 (= c!14978 (bvslt (_1!13279 lt!439657) (_2!13279 lt!439657)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1248)

(assert (=> b!306478 (= lt!439657 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!306478 (= lt!439650 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!306478 (= lt!439653 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306478 (= lt!439659 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306479 () Bool)

(declare-fun e!220808 () Unit!21379)

(declare-fun Unit!21382 () Unit!21379)

(assert (=> b!306479 (= e!220808 Unit!21382)))

(declare-fun b!306480 () Bool)

(declare-fun e!220810 () Bool)

(assert (=> b!306480 (= e!220810 e!220806)))

(declare-fun res!251694 () Bool)

(assert (=> b!306480 (=> (not res!251694) (not e!220806))))

(declare-fun lt!439651 () (_ BitVec 64))

(assert (=> b!306480 (= res!251694 (and (bvsle toBit!258 lt!439651) (bvsle fromBit!258 lt!439651)))))

(assert (=> b!306480 (= lt!439651 (bvmul ((_ sign_extend 32) (size!8053 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!306481 () Bool)

(declare-fun res!251691 () Bool)

(assert (=> b!306481 (=> (not res!251691) (not e!220806))))

(assert (=> b!306481 (= res!251691 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439651) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306483 () Bool)

(declare-fun e!220805 () Unit!21379)

(declare-fun Unit!21383 () Unit!21379)

(assert (=> b!306483 (= e!220805 Unit!21383)))

(declare-fun b!306484 () Bool)

(declare-fun res!251690 () Bool)

(assert (=> b!306484 (=> (not res!251690) (not e!220806))))

(declare-fun arrayBitRangesEq!0 (array!18584 array!18584 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306484 (= res!251690 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306485 () Bool)

(declare-fun e!220813 () Bool)

(assert (=> b!306485 (= e!220813 call!5843)))

(declare-fun b!306486 () Bool)

(declare-fun lt!439656 () Unit!21379)

(assert (=> b!306486 (= e!220804 lt!439656)))

(declare-fun arrayRangesEqSlicedLemma!277 (array!18584 array!18584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21379)

(assert (=> b!306486 (= lt!439656 (arrayRangesEqSlicedLemma!277 a1!948 a2!948 (_1!13279 lt!439659) (_2!13279 lt!439659) (_1!13279 lt!439657) (_2!13279 lt!439657)))))

(declare-fun arrayRangesEq!1682 (array!18584 array!18584 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306486 (arrayRangesEq!1682 a1!948 a2!948 (_1!13279 lt!439657) (_2!13279 lt!439657))))

(declare-fun b!306487 () Bool)

(assert (=> b!306487 (= e!220807 call!5843)))

(declare-fun res!251693 () Bool)

(assert (=> start!68268 (=> (not res!251693) (not e!220810))))

(assert (=> start!68268 (= res!251693 (and (bvsle (size!8053 a1!948) (size!8053 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68268 e!220810))

(assert (=> start!68268 true))

(declare-fun array_inv!7665 (array!18584) Bool)

(assert (=> start!68268 (array_inv!7665 a1!948)))

(assert (=> start!68268 (array_inv!7665 a2!948)))

(declare-fun b!306482 () Bool)

(declare-fun res!251689 () Bool)

(assert (=> b!306482 (= res!251689 (= lt!439650 #b00000000000000000000000000000000))))

(assert (=> b!306482 (=> res!251689 e!220813)))

(assert (=> b!306482 (= e!220812 e!220813)))

(declare-fun b!306488 () Bool)

(assert (=> b!306488 (= e!220809 (and (not (= (_3!1581 lt!439657) (_4!624 lt!439657))) (or (bvslt (_3!1581 lt!439657) #b00000000000000000000000000000000) (bvsge (_3!1581 lt!439657) (size!8053 a2!948)))))))

(declare-fun lt!439654 () Unit!21379)

(assert (=> b!306488 (= lt!439654 e!220808)))

(declare-fun c!14977 () Bool)

(assert (=> b!306488 (= c!14977 (and (bvslt (_4!624 lt!439657) (_4!624 lt!439659)) (bvslt (_3!1581 lt!439659) (_4!624 lt!439657))))))

(declare-fun lt!439649 () Unit!21379)

(assert (=> b!306488 (= lt!439649 e!220805)))

(declare-fun c!14979 () Bool)

(assert (=> b!306488 (= c!14979 (and (bvslt (_3!1581 lt!439659) (_3!1581 lt!439657)) (bvslt (_3!1581 lt!439657) (_4!624 lt!439659))))))

(declare-fun b!306489 () Bool)

(declare-fun lt!439658 () Unit!21379)

(assert (=> b!306489 (= e!220808 lt!439658)))

(declare-fun arrayRangesEqImpliesEq!286 (array!18584 array!18584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21379)

(assert (=> b!306489 (= lt!439658 (arrayRangesEqImpliesEq!286 a1!948 a2!948 (_1!13279 lt!439659) (_4!624 lt!439657) (_2!13279 lt!439659)))))

(assert (=> b!306489 (= (select (arr!9136 a1!948) (_4!624 lt!439657)) (select (arr!9136 a2!948) (_4!624 lt!439657)))))

(declare-fun b!306490 () Bool)

(declare-fun lt!439655 () Unit!21379)

(assert (=> b!306490 (= e!220805 lt!439655)))

(assert (=> b!306490 (= lt!439655 (arrayRangesEqImpliesEq!286 a1!948 a2!948 (_1!13279 lt!439659) (_3!1581 lt!439657) (_2!13279 lt!439659)))))

(assert (=> b!306490 (= (select (arr!9136 a1!948) (_3!1581 lt!439657)) (select (arr!9136 a2!948) (_3!1581 lt!439657)))))

(assert (= (and start!68268 res!251693) b!306480))

(assert (= (and b!306480 res!251694) b!306484))

(assert (= (and b!306484 res!251690) b!306481))

(assert (= (and b!306481 res!251691) b!306478))

(assert (= (and b!306478 c!14978) b!306486))

(assert (= (and b!306478 (not c!14978)) b!306476))

(assert (= (and b!306478 c!14976) b!306487))

(assert (= (and b!306478 (not c!14976)) b!306477))

(assert (= (and b!306477 res!251692) b!306482))

(assert (= (and b!306482 (not res!251689)) b!306485))

(assert (= (or b!306487 b!306485) bm!5840))

(assert (= (and b!306478 res!251688) b!306488))

(assert (= (and b!306488 c!14979) b!306490))

(assert (= (and b!306488 (not c!14979)) b!306483))

(assert (= (and b!306488 c!14977) b!306489))

(assert (= (and b!306488 (not c!14977)) b!306479))

(declare-fun m!444957 () Bool)

(assert (=> b!306484 m!444957))

(declare-fun m!444959 () Bool)

(assert (=> b!306486 m!444959))

(declare-fun m!444961 () Bool)

(assert (=> b!306486 m!444961))

(declare-fun m!444963 () Bool)

(assert (=> b!306490 m!444963))

(declare-fun m!444965 () Bool)

(assert (=> b!306490 m!444965))

(declare-fun m!444967 () Bool)

(assert (=> b!306490 m!444967))

(declare-fun m!444969 () Bool)

(assert (=> b!306477 m!444969))

(declare-fun m!444971 () Bool)

(assert (=> b!306477 m!444971))

(assert (=> b!306477 m!444969))

(assert (=> b!306477 m!444971))

(declare-fun m!444973 () Bool)

(assert (=> b!306477 m!444973))

(declare-fun m!444975 () Bool)

(assert (=> b!306478 m!444975))

(declare-fun m!444977 () Bool)

(assert (=> b!306478 m!444977))

(declare-fun m!444979 () Bool)

(assert (=> bm!5840 m!444979))

(assert (=> bm!5840 m!444971))

(declare-fun m!444981 () Bool)

(assert (=> bm!5840 m!444981))

(assert (=> bm!5840 m!444969))

(declare-fun m!444983 () Bool)

(assert (=> bm!5840 m!444983))

(declare-fun m!444985 () Bool)

(assert (=> start!68268 m!444985))

(declare-fun m!444987 () Bool)

(assert (=> start!68268 m!444987))

(declare-fun m!444989 () Bool)

(assert (=> b!306489 m!444989))

(declare-fun m!444991 () Bool)

(assert (=> b!306489 m!444991))

(declare-fun m!444993 () Bool)

(assert (=> b!306489 m!444993))

(push 1)

(assert (not bm!5840))

(assert (not b!306486))

(assert (not b!306490))

(assert (not b!306478))

(assert (not b!306484))

(assert (not b!306477))

(assert (not b!306489))

(assert (not start!68268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102278 () Bool)

(assert (=> d!102278 (arrayRangesEq!1682 a1!948 a2!948 (_1!13279 lt!439657) (_2!13279 lt!439657))))

(declare-fun lt!439743 () Unit!21379)

(declare-fun choose!628 (array!18584 array!18584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21379)

(assert (=> d!102278 (= lt!439743 (choose!628 a1!948 a2!948 (_1!13279 lt!439659) (_2!13279 lt!439659) (_1!13279 lt!439657) (_2!13279 lt!439657)))))

(assert (=> d!102278 (and (bvsle #b00000000000000000000000000000000 (_1!13279 lt!439659)) (bvsle (_1!13279 lt!439659) (_2!13279 lt!439659)))))

(assert (=> d!102278 (= (arrayRangesEqSlicedLemma!277 a1!948 a2!948 (_1!13279 lt!439659) (_2!13279 lt!439659) (_1!13279 lt!439657) (_2!13279 lt!439657)) lt!439743)))

(declare-fun bs!26355 () Bool)

(assert (= bs!26355 d!102278))

(assert (=> bs!26355 m!444961))

(declare-fun m!445093 () Bool)

(assert (=> bs!26355 m!445093))

(assert (=> b!306486 d!102278))

(declare-fun d!102282 () Bool)

(declare-fun res!251762 () Bool)

(declare-fun e!220908 () Bool)

(assert (=> d!102282 (=> res!251762 e!220908)))

(assert (=> d!102282 (= res!251762 (= (_1!13279 lt!439657) (_2!13279 lt!439657)))))

(assert (=> d!102282 (= (arrayRangesEq!1682 a1!948 a2!948 (_1!13279 lt!439657) (_2!13279 lt!439657)) e!220908)))

(declare-fun b!306612 () Bool)

(declare-fun e!220909 () Bool)

(assert (=> b!306612 (= e!220908 e!220909)))

(declare-fun res!251763 () Bool)

(assert (=> b!306612 (=> (not res!251763) (not e!220909))))

(assert (=> b!306612 (= res!251763 (= (select (arr!9136 a1!948) (_1!13279 lt!439657)) (select (arr!9136 a2!948) (_1!13279 lt!439657))))))

(declare-fun b!306613 () Bool)

(assert (=> b!306613 (= e!220909 (arrayRangesEq!1682 a1!948 a2!948 (bvadd (_1!13279 lt!439657) #b00000000000000000000000000000001) (_2!13279 lt!439657)))))

(assert (= (and d!102282 (not res!251762)) b!306612))

(assert (= (and b!306612 res!251763) b!306613))

(declare-fun m!445101 () Bool)

(assert (=> b!306612 m!445101))

(declare-fun m!445103 () Bool)

(assert (=> b!306612 m!445103))

(declare-fun m!445105 () Bool)

(assert (=> b!306613 m!445105))

(assert (=> b!306486 d!102282))

(declare-fun d!102286 () Bool)

(assert (=> d!102286 (= (byteRangesEq!0 (select (arr!9136 a1!948) (_3!1581 lt!439659)) (select (arr!9136 a2!948) (_3!1581 lt!439659)) lt!439653 #b00000000000000000000000000000111) (or (= lt!439653 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9136 a1!948) (_3!1581 lt!439659))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439653)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9136 a2!948) (_3!1581 lt!439659))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439653)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26358 () Bool)

(assert (= bs!26358 d!102286))

(declare-fun m!445113 () Bool)

(assert (=> bs!26358 m!445113))

(declare-fun m!445115 () Bool)

(assert (=> bs!26358 m!445115))

(assert (=> b!306477 d!102286))

(declare-fun d!102298 () Bool)

(assert (=> d!102298 (= (byteRangesEq!0 (ite c!14976 (select (arr!9136 a1!948) (_3!1581 lt!439659)) (select (arr!9136 a1!948) (_4!624 lt!439659))) (ite c!14976 (select (arr!9136 a2!948) (_3!1581 lt!439659)) (select (arr!9136 a2!948) (_4!624 lt!439659))) (ite c!14976 lt!439653 #b00000000000000000000000000000000) lt!439650) (or (= (ite c!14976 lt!439653 #b00000000000000000000000000000000) lt!439650) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14976 (select (arr!9136 a1!948) (_3!1581 lt!439659)) (select (arr!9136 a1!948) (_4!624 lt!439659)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439650))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14976 lt!439653 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14976 (select (arr!9136 a2!948) (_3!1581 lt!439659)) (select (arr!9136 a2!948) (_4!624 lt!439659)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439650))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14976 lt!439653 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26359 () Bool)

(assert (= bs!26359 d!102298))

(declare-fun m!445117 () Bool)

(assert (=> bs!26359 m!445117))

(declare-fun m!445119 () Bool)

(assert (=> bs!26359 m!445119))

(assert (=> bm!5840 d!102298))

(declare-fun d!102300 () Bool)

(assert (=> d!102300 (and (bvsge (_4!624 lt!439657) #b00000000000000000000000000000000) (bvslt (_4!624 lt!439657) (size!8053 a1!948)) (bvslt (_4!624 lt!439657) (size!8053 a2!948)) (= (select (arr!9136 a1!948) (_4!624 lt!439657)) (select (arr!9136 a2!948) (_4!624 lt!439657))))))

(declare-fun lt!439747 () Unit!21379)

(declare-fun choose!629 (array!18584 array!18584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21379)

(assert (=> d!102300 (= lt!439747 (choose!629 a1!948 a2!948 (_1!13279 lt!439659) (_4!624 lt!439657) (_2!13279 lt!439659)))))

(assert (=> d!102300 (and (bvsle #b00000000000000000000000000000000 (_1!13279 lt!439659)) (bvsle (_1!13279 lt!439659) (_2!13279 lt!439659)))))

(assert (=> d!102300 (= (arrayRangesEqImpliesEq!286 a1!948 a2!948 (_1!13279 lt!439659) (_4!624 lt!439657) (_2!13279 lt!439659)) lt!439747)))

(declare-fun bs!26360 () Bool)

(assert (= bs!26360 d!102300))

(assert (=> bs!26360 m!444991))

(assert (=> bs!26360 m!444993))

(declare-fun m!445121 () Bool)

(assert (=> bs!26360 m!445121))

(assert (=> b!306489 d!102300))

(declare-fun d!102302 () Bool)

(assert (=> d!102302 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1249 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306478 d!102302))

(declare-fun d!102308 () Bool)

(assert (=> d!102308 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1249 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306478 d!102308))

(declare-fun b!306634 () Bool)

(declare-fun e!220930 () Bool)

(declare-fun call!5855 () Bool)

(assert (=> b!306634 (= e!220930 call!5855)))

(declare-fun lt!439757 () (_ BitVec 32))

(declare-fun e!220931 () Bool)

(declare-fun b!306635 () Bool)

(declare-fun lt!439758 () tuple4!1248)

(assert (=> b!306635 (= e!220931 (byteRangesEq!0 (select (arr!9136 a1!948) (_4!624 lt!439758)) (select (arr!9136 a2!948) (_4!624 lt!439758)) #b00000000000000000000000000000000 lt!439757))))

(declare-fun d!102310 () Bool)

(declare-fun res!251781 () Bool)

(declare-fun e!220933 () Bool)

(assert (=> d!102310 (=> res!251781 e!220933)))

(assert (=> d!102310 (= res!251781 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102310 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220933)))

(declare-fun b!306636 () Bool)

(declare-fun res!251783 () Bool)

(assert (=> b!306636 (= res!251783 (= lt!439757 #b00000000000000000000000000000000))))

(assert (=> b!306636 (=> res!251783 e!220931)))

(declare-fun e!220929 () Bool)

(assert (=> b!306636 (= e!220929 e!220931)))

(declare-fun b!306637 () Bool)

(declare-fun e!220932 () Bool)

(assert (=> b!306637 (= e!220932 e!220930)))

(declare-fun c!15009 () Bool)

(assert (=> b!306637 (= c!15009 (= (_3!1581 lt!439758) (_4!624 lt!439758)))))

(declare-fun b!306638 () Bool)

(assert (=> b!306638 (= e!220933 e!220932)))

(declare-fun res!251780 () Bool)

(assert (=> b!306638 (=> (not res!251780) (not e!220932))))

(declare-fun e!220928 () Bool)

(assert (=> b!306638 (= res!251780 e!220928)))

(declare-fun res!251782 () Bool)

(assert (=> b!306638 (=> res!251782 e!220928)))

(assert (=> b!306638 (= res!251782 (bvsge (_1!13279 lt!439758) (_2!13279 lt!439758)))))

(assert (=> b!306638 (= lt!439757 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439759 () (_ BitVec 32))

(assert (=> b!306638 (= lt!439759 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306638 (= lt!439758 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306639 () Bool)

(assert (=> b!306639 (= e!220928 (arrayRangesEq!1682 a1!948 a2!948 (_1!13279 lt!439758) (_2!13279 lt!439758)))))

(declare-fun b!306640 () Bool)

(assert (=> b!306640 (= e!220930 e!220929)))

(declare-fun res!251784 () Bool)

(assert (=> b!306640 (= res!251784 call!5855)))

(assert (=> b!306640 (=> (not res!251784) (not e!220929))))

(declare-fun bm!5852 () Bool)

(assert (=> bm!5852 (= call!5855 (byteRangesEq!0 (select (arr!9136 a1!948) (_3!1581 lt!439758)) (select (arr!9136 a2!948) (_3!1581 lt!439758)) lt!439759 (ite c!15009 lt!439757 #b00000000000000000000000000001000)))))

(assert (= (and d!102310 (not res!251781)) b!306638))

(assert (= (and b!306638 (not res!251782)) b!306639))

(assert (= (and b!306638 res!251780) b!306637))

(assert (= (and b!306637 c!15009) b!306634))

(assert (= (and b!306637 (not c!15009)) b!306640))

(assert (= (and b!306640 res!251784) b!306636))

(assert (= (and b!306636 (not res!251783)) b!306635))

(assert (= (or b!306634 b!306640) bm!5852))

(declare-fun m!445135 () Bool)

(assert (=> b!306635 m!445135))

(declare-fun m!445137 () Bool)

(assert (=> b!306635 m!445137))

(assert (=> b!306635 m!445135))

(assert (=> b!306635 m!445137))

(declare-fun m!445139 () Bool)

(assert (=> b!306635 m!445139))

(assert (=> b!306638 m!444977))

(declare-fun m!445141 () Bool)

(assert (=> b!306639 m!445141))

(declare-fun m!445143 () Bool)

(assert (=> bm!5852 m!445143))

(declare-fun m!445145 () Bool)

(assert (=> bm!5852 m!445145))

(assert (=> bm!5852 m!445143))

(assert (=> bm!5852 m!445145))

(declare-fun m!445147 () Bool)

(assert (=> bm!5852 m!445147))

(assert (=> b!306484 d!102310))

(declare-fun d!102324 () Bool)

(assert (=> d!102324 (= (array_inv!7665 a1!948) (bvsge (size!8053 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68268 d!102324))

(declare-fun d!102326 () Bool)

(assert (=> d!102326 (= (array_inv!7665 a2!948) (bvsge (size!8053 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68268 d!102326))

(declare-fun d!102328 () Bool)

(assert (=> d!102328 (and (bvsge (_3!1581 lt!439657) #b00000000000000000000000000000000) (bvslt (_3!1581 lt!439657) (size!8053 a1!948)) (bvslt (_3!1581 lt!439657) (size!8053 a2!948)) (= (select (arr!9136 a1!948) (_3!1581 lt!439657)) (select (arr!9136 a2!948) (_3!1581 lt!439657))))))

(declare-fun lt!439760 () Unit!21379)

(assert (=> d!102328 (= lt!439760 (choose!629 a1!948 a2!948 (_1!13279 lt!439659) (_3!1581 lt!439657) (_2!13279 lt!439659)))))

(assert (=> d!102328 (and (bvsle #b00000000000000000000000000000000 (_1!13279 lt!439659)) (bvsle (_1!13279 lt!439659) (_2!13279 lt!439659)))))

(assert (=> d!102328 (= (arrayRangesEqImpliesEq!286 a1!948 a2!948 (_1!13279 lt!439659) (_3!1581 lt!439657) (_2!13279 lt!439659)) lt!439760)))

(declare-fun bs!26363 () Bool)

(assert (= bs!26363 d!102328))

(assert (=> bs!26363 m!444965))

(assert (=> bs!26363 m!444967))

(declare-fun m!445149 () Bool)

(assert (=> bs!26363 m!445149))

(assert (=> b!306490 d!102328))

(push 1)

(assert (not b!306639))

(assert (not d!102300))

(assert (not bm!5852))

(assert (not b!306613))

(assert (not d!102328))

(assert (not b!306635))

(assert (not d!102278))

(assert (not b!306638))

(check-sat)


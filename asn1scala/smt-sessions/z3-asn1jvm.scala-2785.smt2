; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67196 () Bool)

(assert start!67196)

(declare-fun b!301810 () Bool)

(declare-fun res!248436 () Bool)

(declare-fun e!216779 () Bool)

(assert (=> b!301810 (=> (not res!248436) (not e!216779))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436930 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301810 (= res!248436 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436930) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301811 () Bool)

(declare-fun res!248437 () Bool)

(declare-fun lt!436934 () (_ BitVec 32))

(assert (=> b!301811 (= res!248437 (= lt!436934 #b00000000000000000000000000000000))))

(declare-fun e!216782 () Bool)

(assert (=> b!301811 (=> res!248437 e!216782)))

(declare-fun e!216790 () Bool)

(assert (=> b!301811 (= e!216790 e!216782)))

(declare-fun b!301812 () Bool)

(declare-fun res!248433 () Bool)

(assert (=> b!301812 (=> (not res!248433) (not e!216779))))

(declare-datatypes ((array!18283 0))(
  ( (array!18284 (arr!9023 (Array (_ BitVec 32) (_ BitVec 8))) (size!7940 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18283)

(declare-fun a2!948 () array!18283)

(declare-fun arrayBitRangesEq!0 (array!18283 array!18283 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301812 (= res!248433 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301814 () Bool)

(declare-fun e!216780 () Bool)

(declare-fun e!216781 () Bool)

(assert (=> b!301814 (= e!216780 e!216781)))

(declare-fun res!248439 () Bool)

(assert (=> b!301814 (=> (not res!248439) (not e!216781))))

(declare-datatypes ((tuple4!1088 0))(
  ( (tuple4!1089 (_1!13199 (_ BitVec 32)) (_2!13199 (_ BitVec 32)) (_3!1501 (_ BitVec 32)) (_4!544 (_ BitVec 32))) )
))
(declare-fun lt!436938 () tuple4!1088)

(assert (=> b!301814 (= res!248439 (not (= (_3!1501 lt!436938) (_4!544 lt!436938))))))

(declare-datatypes ((Unit!21135 0))(
  ( (Unit!21136) )
))
(declare-fun lt!436933 () Unit!21135)

(declare-fun e!216783 () Unit!21135)

(assert (=> b!301814 (= lt!436933 e!216783)))

(declare-fun c!14272 () Bool)

(declare-fun lt!436931 () tuple4!1088)

(assert (=> b!301814 (= c!14272 (and (bvslt (_4!544 lt!436938) (_4!544 lt!436931)) (bvslt (_3!1501 lt!436931) (_4!544 lt!436938))))))

(declare-fun lt!436929 () Unit!21135)

(declare-fun e!216785 () Unit!21135)

(assert (=> b!301814 (= lt!436929 e!216785)))

(declare-fun c!14274 () Bool)

(assert (=> b!301814 (= c!14274 (and (bvslt (_3!1501 lt!436931) (_3!1501 lt!436938)) (bvslt (_3!1501 lt!436938) (_4!544 lt!436931))))))

(declare-fun b!301815 () Bool)

(declare-fun call!5480 () Bool)

(assert (=> b!301815 (= e!216782 call!5480)))

(declare-fun b!301816 () Bool)

(assert (=> b!301816 (= e!216779 e!216780)))

(declare-fun res!248432 () Bool)

(assert (=> b!301816 (=> (not res!248432) (not e!216780))))

(declare-fun e!216786 () Bool)

(assert (=> b!301816 (= res!248432 e!216786)))

(declare-fun c!14271 () Bool)

(assert (=> b!301816 (= c!14271 (= (_3!1501 lt!436931) (_4!544 lt!436931)))))

(declare-fun lt!436928 () Unit!21135)

(declare-fun e!216787 () Unit!21135)

(assert (=> b!301816 (= lt!436928 e!216787)))

(declare-fun c!14273 () Bool)

(assert (=> b!301816 (= c!14273 (bvslt (_1!13199 lt!436938) (_2!13199 lt!436938)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1088)

(assert (=> b!301816 (= lt!436938 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301816 (= lt!436934 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436932 () (_ BitVec 32))

(assert (=> b!301816 (= lt!436932 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301816 (= lt!436931 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301817 () Bool)

(declare-fun lt!436937 () Unit!21135)

(assert (=> b!301817 (= e!216787 lt!436937)))

(declare-fun arrayRangesEqSlicedLemma!212 (array!18283 array!18283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21135)

(assert (=> b!301817 (= lt!436937 (arrayRangesEqSlicedLemma!212 a1!948 a2!948 (_1!13199 lt!436931) (_2!13199 lt!436931) (_1!13199 lt!436938) (_2!13199 lt!436938)))))

(declare-fun arrayRangesEq!1602 (array!18283 array!18283 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301817 (arrayRangesEq!1602 a1!948 a2!948 (_1!13199 lt!436938) (_2!13199 lt!436938))))

(declare-fun b!301818 () Bool)

(assert (=> b!301818 (= e!216786 e!216790)))

(declare-fun res!248434 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301818 (= res!248434 (byteRangesEq!0 (select (arr!9023 a1!948) (_3!1501 lt!436931)) (select (arr!9023 a2!948) (_3!1501 lt!436931)) lt!436932 #b00000000000000000000000000000111))))

(assert (=> b!301818 (=> (not res!248434) (not e!216790))))

(declare-fun b!301819 () Bool)

(declare-fun lt!436935 () Unit!21135)

(assert (=> b!301819 (= e!216785 lt!436935)))

(declare-fun arrayRangesEqImpliesEq!254 (array!18283 array!18283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21135)

(assert (=> b!301819 (= lt!436935 (arrayRangesEqImpliesEq!254 a1!948 a2!948 (_1!13199 lt!436931) (_3!1501 lt!436938) (_2!13199 lt!436931)))))

(assert (=> b!301819 (= (select (arr!9023 a1!948) (_3!1501 lt!436938)) (select (arr!9023 a2!948) (_3!1501 lt!436938)))))

(declare-fun b!301813 () Bool)

(declare-fun Unit!21137 () Unit!21135)

(assert (=> b!301813 (= e!216785 Unit!21137)))

(declare-fun res!248438 () Bool)

(declare-fun e!216789 () Bool)

(assert (=> start!67196 (=> (not res!248438) (not e!216789))))

(assert (=> start!67196 (= res!248438 (and (bvsle (size!7940 a1!948) (size!7940 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67196 e!216789))

(assert (=> start!67196 true))

(declare-fun array_inv!7552 (array!18283) Bool)

(assert (=> start!67196 (array_inv!7552 a1!948)))

(assert (=> start!67196 (array_inv!7552 a2!948)))

(declare-fun b!301820 () Bool)

(declare-fun lt!436936 () Unit!21135)

(assert (=> b!301820 (= e!216783 lt!436936)))

(assert (=> b!301820 (= lt!436936 (arrayRangesEqImpliesEq!254 a1!948 a2!948 (_1!13199 lt!436931) (_4!544 lt!436938) (_2!13199 lt!436931)))))

(assert (=> b!301820 (= (select (arr!9023 a1!948) (_4!544 lt!436938)) (select (arr!9023 a2!948) (_4!544 lt!436938)))))

(declare-fun b!301821 () Bool)

(declare-fun Unit!21138 () Unit!21135)

(assert (=> b!301821 (= e!216787 Unit!21138)))

(declare-fun b!301822 () Bool)

(assert (=> b!301822 (= e!216781 (not (byteRangesEq!0 (select (arr!9023 a1!948) (_3!1501 lt!436938)) (select (arr!9023 a2!948) (_3!1501 lt!436938)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111)))))

(declare-fun bm!5477 () Bool)

(assert (=> bm!5477 (= call!5480 (byteRangesEq!0 (ite c!14271 (select (arr!9023 a1!948) (_3!1501 lt!436931)) (select (arr!9023 a1!948) (_4!544 lt!436931))) (ite c!14271 (select (arr!9023 a2!948) (_3!1501 lt!436931)) (select (arr!9023 a2!948) (_4!544 lt!436931))) (ite c!14271 lt!436932 #b00000000000000000000000000000000) lt!436934))))

(declare-fun b!301823 () Bool)

(assert (=> b!301823 (= e!216786 call!5480)))

(declare-fun b!301824 () Bool)

(assert (=> b!301824 (= e!216789 e!216779)))

(declare-fun res!248435 () Bool)

(assert (=> b!301824 (=> (not res!248435) (not e!216779))))

(assert (=> b!301824 (= res!248435 (and (bvsle toBit!258 lt!436930) (bvsle fromBit!258 lt!436930)))))

(assert (=> b!301824 (= lt!436930 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7940 a1!948))))))

(declare-fun b!301825 () Bool)

(declare-fun Unit!21139 () Unit!21135)

(assert (=> b!301825 (= e!216783 Unit!21139)))

(assert (= (and start!67196 res!248438) b!301824))

(assert (= (and b!301824 res!248435) b!301812))

(assert (= (and b!301812 res!248433) b!301810))

(assert (= (and b!301810 res!248436) b!301816))

(assert (= (and b!301816 c!14273) b!301817))

(assert (= (and b!301816 (not c!14273)) b!301821))

(assert (= (and b!301816 c!14271) b!301823))

(assert (= (and b!301816 (not c!14271)) b!301818))

(assert (= (and b!301818 res!248434) b!301811))

(assert (= (and b!301811 (not res!248437)) b!301815))

(assert (= (or b!301823 b!301815) bm!5477))

(assert (= (and b!301816 res!248432) b!301814))

(assert (= (and b!301814 c!14274) b!301819))

(assert (= (and b!301814 (not c!14274)) b!301813))

(assert (= (and b!301814 c!14272) b!301820))

(assert (= (and b!301814 (not c!14272)) b!301825))

(assert (= (and b!301814 res!248439) b!301822))

(declare-fun m!440641 () Bool)

(assert (=> b!301822 m!440641))

(declare-fun m!440643 () Bool)

(assert (=> b!301822 m!440643))

(assert (=> b!301822 m!440641))

(assert (=> b!301822 m!440643))

(declare-fun m!440645 () Bool)

(assert (=> b!301822 m!440645))

(declare-fun m!440647 () Bool)

(assert (=> bm!5477 m!440647))

(declare-fun m!440649 () Bool)

(assert (=> bm!5477 m!440649))

(declare-fun m!440651 () Bool)

(assert (=> bm!5477 m!440651))

(declare-fun m!440653 () Bool)

(assert (=> bm!5477 m!440653))

(declare-fun m!440655 () Bool)

(assert (=> bm!5477 m!440655))

(declare-fun m!440657 () Bool)

(assert (=> b!301819 m!440657))

(assert (=> b!301819 m!440641))

(assert (=> b!301819 m!440643))

(declare-fun m!440659 () Bool)

(assert (=> b!301817 m!440659))

(declare-fun m!440661 () Bool)

(assert (=> b!301817 m!440661))

(declare-fun m!440663 () Bool)

(assert (=> start!67196 m!440663))

(declare-fun m!440665 () Bool)

(assert (=> start!67196 m!440665))

(declare-fun m!440667 () Bool)

(assert (=> b!301816 m!440667))

(declare-fun m!440669 () Bool)

(assert (=> b!301816 m!440669))

(declare-fun m!440671 () Bool)

(assert (=> b!301820 m!440671))

(declare-fun m!440673 () Bool)

(assert (=> b!301820 m!440673))

(declare-fun m!440675 () Bool)

(assert (=> b!301820 m!440675))

(declare-fun m!440677 () Bool)

(assert (=> b!301812 m!440677))

(assert (=> b!301818 m!440649))

(assert (=> b!301818 m!440651))

(assert (=> b!301818 m!440649))

(assert (=> b!301818 m!440651))

(declare-fun m!440679 () Bool)

(assert (=> b!301818 m!440679))

(check-sat (not start!67196) (not b!301816) (not b!301818) (not bm!5477) (not b!301820) (not b!301812) (not b!301817) (not b!301822) (not b!301819))
(check-sat)
(get-model)

(declare-fun d!100886 () Bool)

(assert (=> d!100886 (and (bvsge (_4!544 lt!436938) #b00000000000000000000000000000000) (bvslt (_4!544 lt!436938) (size!7940 a1!948)) (bvslt (_4!544 lt!436938) (size!7940 a2!948)) (= (select (arr!9023 a1!948) (_4!544 lt!436938)) (select (arr!9023 a2!948) (_4!544 lt!436938))))))

(declare-fun lt!436974 () Unit!21135)

(declare-fun choose!536 (array!18283 array!18283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21135)

(assert (=> d!100886 (= lt!436974 (choose!536 a1!948 a2!948 (_1!13199 lt!436931) (_4!544 lt!436938) (_2!13199 lt!436931)))))

(assert (=> d!100886 (and (bvsle #b00000000000000000000000000000000 (_1!13199 lt!436931)) (bvsle (_1!13199 lt!436931) (_2!13199 lt!436931)))))

(assert (=> d!100886 (= (arrayRangesEqImpliesEq!254 a1!948 a2!948 (_1!13199 lt!436931) (_4!544 lt!436938) (_2!13199 lt!436931)) lt!436974)))

(declare-fun bs!26022 () Bool)

(assert (= bs!26022 d!100886))

(assert (=> bs!26022 m!440673))

(assert (=> bs!26022 m!440675))

(declare-fun m!440721 () Bool)

(assert (=> bs!26022 m!440721))

(assert (=> b!301820 d!100886))

(declare-fun d!100888 () Bool)

(assert (=> d!100888 (and (bvsge (_3!1501 lt!436938) #b00000000000000000000000000000000) (bvslt (_3!1501 lt!436938) (size!7940 a1!948)) (bvslt (_3!1501 lt!436938) (size!7940 a2!948)) (= (select (arr!9023 a1!948) (_3!1501 lt!436938)) (select (arr!9023 a2!948) (_3!1501 lt!436938))))))

(declare-fun lt!436975 () Unit!21135)

(assert (=> d!100888 (= lt!436975 (choose!536 a1!948 a2!948 (_1!13199 lt!436931) (_3!1501 lt!436938) (_2!13199 lt!436931)))))

(assert (=> d!100888 (and (bvsle #b00000000000000000000000000000000 (_1!13199 lt!436931)) (bvsle (_1!13199 lt!436931) (_2!13199 lt!436931)))))

(assert (=> d!100888 (= (arrayRangesEqImpliesEq!254 a1!948 a2!948 (_1!13199 lt!436931) (_3!1501 lt!436938) (_2!13199 lt!436931)) lt!436975)))

(declare-fun bs!26023 () Bool)

(assert (= bs!26023 d!100888))

(assert (=> bs!26023 m!440641))

(assert (=> bs!26023 m!440643))

(declare-fun m!440723 () Bool)

(assert (=> bs!26023 m!440723))

(assert (=> b!301819 d!100888))

(declare-fun d!100890 () Bool)

(assert (=> d!100890 (= (byteRangesEq!0 (select (arr!9023 a1!948) (_3!1501 lt!436931)) (select (arr!9023 a2!948) (_3!1501 lt!436931)) lt!436932 #b00000000000000000000000000000111) (or (= lt!436932 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9023 a1!948) (_3!1501 lt!436931))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436932)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9023 a2!948) (_3!1501 lt!436931))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436932)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26024 () Bool)

(assert (= bs!26024 d!100890))

(declare-fun m!440725 () Bool)

(assert (=> bs!26024 m!440725))

(declare-fun m!440727 () Bool)

(assert (=> bs!26024 m!440727))

(assert (=> b!301818 d!100890))

(declare-fun d!100892 () Bool)

(assert (=> d!100892 (= (byteRangesEq!0 (ite c!14271 (select (arr!9023 a1!948) (_3!1501 lt!436931)) (select (arr!9023 a1!948) (_4!544 lt!436931))) (ite c!14271 (select (arr!9023 a2!948) (_3!1501 lt!436931)) (select (arr!9023 a2!948) (_4!544 lt!436931))) (ite c!14271 lt!436932 #b00000000000000000000000000000000) lt!436934) (or (= (ite c!14271 lt!436932 #b00000000000000000000000000000000) lt!436934) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14271 (select (arr!9023 a1!948) (_3!1501 lt!436931)) (select (arr!9023 a1!948) (_4!544 lt!436931)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436934))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14271 lt!436932 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14271 (select (arr!9023 a2!948) (_3!1501 lt!436931)) (select (arr!9023 a2!948) (_4!544 lt!436931)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436934))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14271 lt!436932 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26025 () Bool)

(assert (= bs!26025 d!100892))

(declare-fun m!440729 () Bool)

(assert (=> bs!26025 m!440729))

(declare-fun m!440731 () Bool)

(assert (=> bs!26025 m!440731))

(assert (=> bm!5477 d!100892))

(declare-fun b!301888 () Bool)

(declare-fun e!216843 () Bool)

(declare-fun e!216841 () Bool)

(assert (=> b!301888 (= e!216843 e!216841)))

(declare-fun res!248478 () Bool)

(declare-fun lt!436983 () (_ BitVec 32))

(declare-fun lt!436982 () tuple4!1088)

(assert (=> b!301888 (= res!248478 (byteRangesEq!0 (select (arr!9023 a1!948) (_3!1501 lt!436982)) (select (arr!9023 a2!948) (_3!1501 lt!436982)) lt!436983 #b00000000000000000000000000001000))))

(assert (=> b!301888 (=> (not res!248478) (not e!216841))))

(declare-fun b!301889 () Bool)

(declare-fun e!216842 () Bool)

(declare-fun call!5486 () Bool)

(assert (=> b!301889 (= e!216842 call!5486)))

(declare-fun b!301890 () Bool)

(declare-fun e!216844 () Bool)

(assert (=> b!301890 (= e!216844 e!216843)))

(declare-fun c!14289 () Bool)

(assert (=> b!301890 (= c!14289 (= (_3!1501 lt!436982) (_4!544 lt!436982)))))

(declare-fun b!301891 () Bool)

(assert (=> b!301891 (= e!216843 call!5486)))

(declare-fun b!301892 () Bool)

(declare-fun res!248476 () Bool)

(declare-fun lt!436984 () (_ BitVec 32))

(assert (=> b!301892 (= res!248476 (= lt!436984 #b00000000000000000000000000000000))))

(assert (=> b!301892 (=> res!248476 e!216842)))

(assert (=> b!301892 (= e!216841 e!216842)))

(declare-fun d!100894 () Bool)

(declare-fun res!248474 () Bool)

(declare-fun e!216839 () Bool)

(assert (=> d!100894 (=> res!248474 e!216839)))

(assert (=> d!100894 (= res!248474 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100894 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216839)))

(declare-fun b!301893 () Bool)

(declare-fun e!216840 () Bool)

(assert (=> b!301893 (= e!216840 (arrayRangesEq!1602 a1!948 a2!948 (_1!13199 lt!436982) (_2!13199 lt!436982)))))

(declare-fun bm!5483 () Bool)

(assert (=> bm!5483 (= call!5486 (byteRangesEq!0 (ite c!14289 (select (arr!9023 a1!948) (_3!1501 lt!436982)) (select (arr!9023 a1!948) (_4!544 lt!436982))) (ite c!14289 (select (arr!9023 a2!948) (_3!1501 lt!436982)) (select (arr!9023 a2!948) (_4!544 lt!436982))) (ite c!14289 lt!436983 #b00000000000000000000000000000000) lt!436984))))

(declare-fun b!301894 () Bool)

(assert (=> b!301894 (= e!216839 e!216844)))

(declare-fun res!248477 () Bool)

(assert (=> b!301894 (=> (not res!248477) (not e!216844))))

(assert (=> b!301894 (= res!248477 e!216840)))

(declare-fun res!248475 () Bool)

(assert (=> b!301894 (=> res!248475 e!216840)))

(assert (=> b!301894 (= res!248475 (bvsge (_1!13199 lt!436982) (_2!13199 lt!436982)))))

(assert (=> b!301894 (= lt!436984 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301894 (= lt!436983 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301894 (= lt!436982 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!100894 (not res!248474)) b!301894))

(assert (= (and b!301894 (not res!248475)) b!301893))

(assert (= (and b!301894 res!248477) b!301890))

(assert (= (and b!301890 c!14289) b!301891))

(assert (= (and b!301890 (not c!14289)) b!301888))

(assert (= (and b!301888 res!248478) b!301892))

(assert (= (and b!301892 (not res!248476)) b!301889))

(assert (= (or b!301891 b!301889) bm!5483))

(declare-fun m!440733 () Bool)

(assert (=> b!301888 m!440733))

(declare-fun m!440735 () Bool)

(assert (=> b!301888 m!440735))

(assert (=> b!301888 m!440733))

(assert (=> b!301888 m!440735))

(declare-fun m!440737 () Bool)

(assert (=> b!301888 m!440737))

(declare-fun m!440739 () Bool)

(assert (=> b!301893 m!440739))

(declare-fun m!440741 () Bool)

(assert (=> bm!5483 m!440741))

(assert (=> bm!5483 m!440735))

(assert (=> bm!5483 m!440733))

(declare-fun m!440743 () Bool)

(assert (=> bm!5483 m!440743))

(declare-fun m!440745 () Bool)

(assert (=> bm!5483 m!440745))

(assert (=> b!301894 m!440669))

(assert (=> b!301812 d!100894))

(declare-fun d!100896 () Bool)

(assert (=> d!100896 (arrayRangesEq!1602 a1!948 a2!948 (_1!13199 lt!436938) (_2!13199 lt!436938))))

(declare-fun lt!436987 () Unit!21135)

(declare-fun choose!537 (array!18283 array!18283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21135)

(assert (=> d!100896 (= lt!436987 (choose!537 a1!948 a2!948 (_1!13199 lt!436931) (_2!13199 lt!436931) (_1!13199 lt!436938) (_2!13199 lt!436938)))))

(assert (=> d!100896 (and (bvsle #b00000000000000000000000000000000 (_1!13199 lt!436931)) (bvsle (_1!13199 lt!436931) (_2!13199 lt!436931)))))

(assert (=> d!100896 (= (arrayRangesEqSlicedLemma!212 a1!948 a2!948 (_1!13199 lt!436931) (_2!13199 lt!436931) (_1!13199 lt!436938) (_2!13199 lt!436938)) lt!436987)))

(declare-fun bs!26026 () Bool)

(assert (= bs!26026 d!100896))

(assert (=> bs!26026 m!440661))

(declare-fun m!440747 () Bool)

(assert (=> bs!26026 m!440747))

(assert (=> b!301817 d!100896))

(declare-fun d!100898 () Bool)

(declare-fun res!248483 () Bool)

(declare-fun e!216849 () Bool)

(assert (=> d!100898 (=> res!248483 e!216849)))

(assert (=> d!100898 (= res!248483 (= (_1!13199 lt!436938) (_2!13199 lt!436938)))))

(assert (=> d!100898 (= (arrayRangesEq!1602 a1!948 a2!948 (_1!13199 lt!436938) (_2!13199 lt!436938)) e!216849)))

(declare-fun b!301899 () Bool)

(declare-fun e!216850 () Bool)

(assert (=> b!301899 (= e!216849 e!216850)))

(declare-fun res!248484 () Bool)

(assert (=> b!301899 (=> (not res!248484) (not e!216850))))

(assert (=> b!301899 (= res!248484 (= (select (arr!9023 a1!948) (_1!13199 lt!436938)) (select (arr!9023 a2!948) (_1!13199 lt!436938))))))

(declare-fun b!301900 () Bool)

(assert (=> b!301900 (= e!216850 (arrayRangesEq!1602 a1!948 a2!948 (bvadd (_1!13199 lt!436938) #b00000000000000000000000000000001) (_2!13199 lt!436938)))))

(assert (= (and d!100898 (not res!248483)) b!301899))

(assert (= (and b!301899 res!248484) b!301900))

(declare-fun m!440749 () Bool)

(assert (=> b!301899 m!440749))

(declare-fun m!440751 () Bool)

(assert (=> b!301899 m!440751))

(declare-fun m!440753 () Bool)

(assert (=> b!301900 m!440753))

(assert (=> b!301817 d!100898))

(declare-fun d!100900 () Bool)

(assert (=> d!100900 (= (byteRangesEq!0 (select (arr!9023 a1!948) (_3!1501 lt!436938)) (select (arr!9023 a2!948) (_3!1501 lt!436938)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9023 a1!948) (_3!1501 lt!436938))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9023 a2!948) (_3!1501 lt!436938))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26027 () Bool)

(assert (= bs!26027 d!100900))

(assert (=> bs!26027 m!440725))

(declare-fun m!440755 () Bool)

(assert (=> bs!26027 m!440755))

(assert (=> b!301822 d!100900))

(declare-fun d!100902 () Bool)

(assert (=> d!100902 (= (array_inv!7552 a1!948) (bvsge (size!7940 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67196 d!100902))

(declare-fun d!100904 () Bool)

(assert (=> d!100904 (= (array_inv!7552 a2!948) (bvsge (size!7940 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67196 d!100904))

(declare-fun d!100906 () Bool)

(assert (=> d!100906 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1089 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301816 d!100906))

(declare-fun d!100908 () Bool)

(assert (=> d!100908 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1089 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301816 d!100908))

(check-sat (not b!301894) (not bm!5483) (not d!100888) (not d!100896) (not d!100886) (not b!301893) (not b!301888) (not b!301900))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67704 () Bool)

(assert start!67704)

(declare-fun b!303852 () Bool)

(declare-fun e!218674 () Bool)

(declare-fun call!5615 () Bool)

(assert (=> b!303852 (= e!218674 call!5615)))

(declare-fun b!303853 () Bool)

(declare-datatypes ((Unit!21214 0))(
  ( (Unit!21215) )
))
(declare-fun e!218680 () Unit!21214)

(declare-fun Unit!21216 () Unit!21214)

(assert (=> b!303853 (= e!218680 Unit!21216)))

(declare-fun b!303854 () Bool)

(declare-fun e!218678 () Bool)

(declare-fun e!218675 () Bool)

(assert (=> b!303854 (= e!218678 e!218675)))

(declare-fun res!250020 () Bool)

(assert (=> b!303854 (=> (not res!250020) (not e!218675))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438023 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!303854 (= res!250020 (and (bvsle toBit!258 lt!438023) (bvsle fromBit!258 lt!438023)))))

(declare-datatypes ((array!18464 0))(
  ( (array!18465 (arr!9094 (Array (_ BitVec 32) (_ BitVec 8))) (size!8011 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18464)

(assert (=> b!303854 (= lt!438023 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8011 a1!948))))))

(declare-fun b!303855 () Bool)

(declare-fun e!218679 () Bool)

(assert (=> b!303855 (= e!218679 call!5615)))

(declare-fun b!303856 () Bool)

(declare-fun res!250019 () Bool)

(assert (=> b!303856 (=> (not res!250019) (not e!218675))))

(declare-fun a2!948 () array!18464)

(declare-fun arrayBitRangesEq!0 (array!18464 array!18464 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303856 (= res!250019 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303857 () Bool)

(declare-fun e!218677 () Bool)

(assert (=> b!303857 (= e!218679 e!218677)))

(declare-fun lt!438020 () (_ BitVec 32))

(declare-datatypes ((tuple4!1164 0))(
  ( (tuple4!1165 (_1!13237 (_ BitVec 32)) (_2!13237 (_ BitVec 32)) (_3!1539 (_ BitVec 32)) (_4!582 (_ BitVec 32))) )
))
(declare-fun lt!438021 () tuple4!1164)

(declare-fun res!250018 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303857 (= res!250018 (byteRangesEq!0 (select (arr!9094 a1!948) (_3!1539 lt!438021)) (select (arr!9094 a2!948) (_3!1539 lt!438021)) lt!438020 #b00000000000000000000000000000111))))

(assert (=> b!303857 (=> (not res!250018) (not e!218677))))

(declare-fun b!303858 () Bool)

(declare-fun res!250017 () Bool)

(assert (=> b!303858 (=> (not res!250017) (not e!218675))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303858 (= res!250017 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438023) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!250014 () Bool)

(assert (=> start!67704 (=> (not res!250014) (not e!218678))))

(assert (=> start!67704 (= res!250014 (and (bvsle (size!8011 a1!948) (size!8011 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67704 e!218678))

(assert (=> start!67704 true))

(declare-fun array_inv!7623 (array!18464) Bool)

(assert (=> start!67704 (array_inv!7623 a1!948)))

(assert (=> start!67704 (array_inv!7623 a2!948)))

(declare-fun b!303859 () Bool)

(declare-fun lt!438018 () Unit!21214)

(assert (=> b!303859 (= e!218680 lt!438018)))

(declare-fun lt!438024 () tuple4!1164)

(declare-fun arrayRangesEqSlicedLemma!235 (array!18464 array!18464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21214)

(assert (=> b!303859 (= lt!438018 (arrayRangesEqSlicedLemma!235 a1!948 a2!948 (_1!13237 lt!438021) (_2!13237 lt!438021) (_1!13237 lt!438024) (_2!13237 lt!438024)))))

(declare-fun arrayRangesEq!1640 (array!18464 array!18464 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303859 (arrayRangesEq!1640 a1!948 a2!948 (_1!13237 lt!438024) (_2!13237 lt!438024))))

(declare-fun b!303860 () Bool)

(declare-fun e!218672 () Bool)

(assert (=> b!303860 (= e!218672 (and (bvslt (_3!1539 lt!438021) (_3!1539 lt!438024)) (bvslt (_3!1539 lt!438024) (_4!582 lt!438021)) (or (bvsgt #b00000000000000000000000000000000 (_1!13237 lt!438021)) (bvsgt (_1!13237 lt!438021) (_2!13237 lt!438021)))))))

(declare-fun b!303861 () Bool)

(declare-fun res!250015 () Bool)

(declare-fun lt!438019 () (_ BitVec 32))

(assert (=> b!303861 (= res!250015 (= lt!438019 #b00000000000000000000000000000000))))

(assert (=> b!303861 (=> res!250015 e!218674)))

(assert (=> b!303861 (= e!218677 e!218674)))

(declare-fun b!303862 () Bool)

(assert (=> b!303862 (= e!218675 e!218672)))

(declare-fun res!250016 () Bool)

(assert (=> b!303862 (=> (not res!250016) (not e!218672))))

(assert (=> b!303862 (= res!250016 e!218679)))

(declare-fun c!14502 () Bool)

(assert (=> b!303862 (= c!14502 (= (_3!1539 lt!438021) (_4!582 lt!438021)))))

(declare-fun lt!438022 () Unit!21214)

(assert (=> b!303862 (= lt!438022 e!218680)))

(declare-fun c!14501 () Bool)

(assert (=> b!303862 (= c!14501 (bvslt (_1!13237 lt!438024) (_2!13237 lt!438024)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1164)

(assert (=> b!303862 (= lt!438024 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303862 (= lt!438019 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303862 (= lt!438020 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303862 (= lt!438021 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5612 () Bool)

(assert (=> bm!5612 (= call!5615 (byteRangesEq!0 (ite c!14502 (select (arr!9094 a1!948) (_3!1539 lt!438021)) (select (arr!9094 a1!948) (_4!582 lt!438021))) (ite c!14502 (select (arr!9094 a2!948) (_3!1539 lt!438021)) (select (arr!9094 a2!948) (_4!582 lt!438021))) (ite c!14502 lt!438020 #b00000000000000000000000000000000) lt!438019))))

(assert (= (and start!67704 res!250014) b!303854))

(assert (= (and b!303854 res!250020) b!303856))

(assert (= (and b!303856 res!250019) b!303858))

(assert (= (and b!303858 res!250017) b!303862))

(assert (= (and b!303862 c!14501) b!303859))

(assert (= (and b!303862 (not c!14501)) b!303853))

(assert (= (and b!303862 c!14502) b!303855))

(assert (= (and b!303862 (not c!14502)) b!303857))

(assert (= (and b!303857 res!250018) b!303861))

(assert (= (and b!303861 (not res!250015)) b!303852))

(assert (= (or b!303855 b!303852) bm!5612))

(assert (= (and b!303862 res!250016) b!303860))

(declare-fun m!442401 () Bool)

(assert (=> b!303862 m!442401))

(declare-fun m!442403 () Bool)

(assert (=> b!303862 m!442403))

(declare-fun m!442405 () Bool)

(assert (=> b!303856 m!442405))

(declare-fun m!442407 () Bool)

(assert (=> start!67704 m!442407))

(declare-fun m!442409 () Bool)

(assert (=> start!67704 m!442409))

(declare-fun m!442411 () Bool)

(assert (=> b!303859 m!442411))

(declare-fun m!442413 () Bool)

(assert (=> b!303859 m!442413))

(declare-fun m!442415 () Bool)

(assert (=> b!303857 m!442415))

(declare-fun m!442417 () Bool)

(assert (=> b!303857 m!442417))

(assert (=> b!303857 m!442415))

(assert (=> b!303857 m!442417))

(declare-fun m!442419 () Bool)

(assert (=> b!303857 m!442419))

(assert (=> bm!5612 m!442415))

(declare-fun m!442421 () Bool)

(assert (=> bm!5612 m!442421))

(assert (=> bm!5612 m!442417))

(declare-fun m!442423 () Bool)

(assert (=> bm!5612 m!442423))

(declare-fun m!442425 () Bool)

(assert (=> bm!5612 m!442425))

(push 1)

(assert (not b!303857))

(assert (not b!303859))

(assert (not b!303862))

(assert (not b!303856))

(assert (not bm!5612))

(assert (not start!67704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101516 () Bool)

(assert (=> d!101516 (arrayRangesEq!1640 a1!948 a2!948 (_1!13237 lt!438024) (_2!13237 lt!438024))))

(declare-fun lt!438081 () Unit!21214)

(declare-fun choose!567 (array!18464 array!18464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21214)

(assert (=> d!101516 (= lt!438081 (choose!567 a1!948 a2!948 (_1!13237 lt!438021) (_2!13237 lt!438021) (_1!13237 lt!438024) (_2!13237 lt!438024)))))

(assert (=> d!101516 (and (bvsle #b00000000000000000000000000000000 (_1!13237 lt!438021)) (bvsle (_1!13237 lt!438021) (_2!13237 lt!438021)))))

(assert (=> d!101516 (= (arrayRangesEqSlicedLemma!235 a1!948 a2!948 (_1!13237 lt!438021) (_2!13237 lt!438021) (_1!13237 lt!438024) (_2!13237 lt!438024)) lt!438081)))

(declare-fun bs!26166 () Bool)

(assert (= bs!26166 d!101516))

(assert (=> bs!26166 m!442413))

(declare-fun m!442509 () Bool)

(assert (=> bs!26166 m!442509))

(assert (=> b!303859 d!101516))

(declare-fun d!101518 () Bool)

(declare-fun res!250088 () Bool)

(declare-fun e!218763 () Bool)

(assert (=> d!101518 (=> res!250088 e!218763)))

(assert (=> d!101518 (= res!250088 (= (_1!13237 lt!438024) (_2!13237 lt!438024)))))

(assert (=> d!101518 (= (arrayRangesEq!1640 a1!948 a2!948 (_1!13237 lt!438024) (_2!13237 lt!438024)) e!218763)))

(declare-fun b!303960 () Bool)

(declare-fun e!218764 () Bool)

(assert (=> b!303960 (= e!218763 e!218764)))

(declare-fun res!250089 () Bool)

(assert (=> b!303960 (=> (not res!250089) (not e!218764))))

(assert (=> b!303960 (= res!250089 (= (select (arr!9094 a1!948) (_1!13237 lt!438024)) (select (arr!9094 a2!948) (_1!13237 lt!438024))))))

(declare-fun b!303961 () Bool)

(assert (=> b!303961 (= e!218764 (arrayRangesEq!1640 a1!948 a2!948 (bvadd (_1!13237 lt!438024) #b00000000000000000000000000000001) (_2!13237 lt!438024)))))

(assert (= (and d!101518 (not res!250088)) b!303960))

(assert (= (and b!303960 res!250089) b!303961))

(declare-fun m!442511 () Bool)

(assert (=> b!303960 m!442511))

(declare-fun m!442513 () Bool)

(assert (=> b!303960 m!442513))

(declare-fun m!442515 () Bool)

(assert (=> b!303961 m!442515))

(assert (=> b!303859 d!101518))

(declare-fun d!101520 () Bool)

(assert (=> d!101520 (= (array_inv!7623 a1!948) (bvsge (size!8011 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67704 d!101520))

(declare-fun d!101522 () Bool)

(assert (=> d!101522 (= (array_inv!7623 a2!948) (bvsge (size!8011 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67704 d!101522))

(declare-fun d!101524 () Bool)

(declare-fun res!250102 () Bool)

(declare-fun e!218781 () Bool)

(assert (=> d!101524 (=> res!250102 e!218781)))

(assert (=> d!101524 (= res!250102 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101524 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218781)))

(declare-fun b!303976 () Bool)

(declare-fun e!218779 () Bool)

(declare-fun e!218777 () Bool)

(assert (=> b!303976 (= e!218779 e!218777)))

(declare-fun res!250103 () Bool)

(declare-fun call!5627 () Bool)

(assert (=> b!303976 (= res!250103 call!5627)))

(assert (=> b!303976 (=> (not res!250103) (not e!218777))))

(declare-fun b!303977 () Bool)

(declare-fun e!218782 () Bool)

(assert (=> b!303977 (= e!218782 e!218779)))

(declare-fun c!14520 () Bool)

(declare-fun lt!438089 () tuple4!1164)

(assert (=> b!303977 (= c!14520 (= (_3!1539 lt!438089) (_4!582 lt!438089)))))

(declare-fun lt!438090 () (_ BitVec 32))

(declare-fun bm!5624 () Bool)

(declare-fun lt!438088 () (_ BitVec 32))

(assert (=> bm!5624 (= call!5627 (byteRangesEq!0 (select (arr!9094 a1!948) (_3!1539 lt!438089)) (select (arr!9094 a2!948) (_3!1539 lt!438089)) lt!438088 (ite c!14520 lt!438090 #b00000000000000000000000000001000)))))

(declare-fun b!303978 () Bool)

(declare-fun res!250100 () Bool)

(assert (=> b!303978 (= res!250100 (= lt!438090 #b00000000000000000000000000000000))))

(declare-fun e!218778 () Bool)

(assert (=> b!303978 (=> res!250100 e!218778)))

(assert (=> b!303978 (= e!218777 e!218778)))

(declare-fun b!303979 () Bool)

(assert (=> b!303979 (= e!218778 (byteRangesEq!0 (select (arr!9094 a1!948) (_4!582 lt!438089)) (select (arr!9094 a2!948) (_4!582 lt!438089)) #b00000000000000000000000000000000 lt!438090))))

(declare-fun b!303980 () Bool)

(declare-fun e!218780 () Bool)

(assert (=> b!303980 (= e!218780 (arrayRangesEq!1640 a1!948 a2!948 (_1!13237 lt!438089) (_2!13237 lt!438089)))))

(declare-fun b!303981 () Bool)

(assert (=> b!303981 (= e!218781 e!218782)))

(declare-fun res!250104 () Bool)

(assert (=> b!303981 (=> (not res!250104) (not e!218782))))

(assert (=> b!303981 (= res!250104 e!218780)))

(declare-fun res!250101 () Bool)

(assert (=> b!303981 (=> res!250101 e!218780)))

(assert (=> b!303981 (= res!250101 (bvsge (_1!13237 lt!438089) (_2!13237 lt!438089)))))

(assert (=> b!303981 (= lt!438090 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303981 (= lt!438088 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303981 (= lt!438089 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303982 () Bool)

(assert (=> b!303982 (= e!218779 call!5627)))

(assert (= (and d!101524 (not res!250102)) b!303981))

(assert (= (and b!303981 (not res!250101)) b!303980))

(assert (= (and b!303981 res!250104) b!303977))

(assert (= (and b!303977 c!14520) b!303982))

(assert (= (and b!303977 (not c!14520)) b!303976))

(assert (= (and b!303976 res!250103) b!303978))

(assert (= (and b!303978 (not res!250100)) b!303979))

(assert (= (or b!303982 b!303976) bm!5624))

(declare-fun m!442517 () Bool)

(assert (=> bm!5624 m!442517))

(declare-fun m!442519 () Bool)

(assert (=> bm!5624 m!442519))

(assert (=> bm!5624 m!442517))

(assert (=> bm!5624 m!442519))

(declare-fun m!442521 () Bool)

(assert (=> bm!5624 m!442521))

(declare-fun m!442523 () Bool)

(assert (=> b!303979 m!442523))

(declare-fun m!442525 () Bool)

(assert (=> b!303979 m!442525))

(assert (=> b!303979 m!442523))

(assert (=> b!303979 m!442525))

(declare-fun m!442527 () Bool)

(assert (=> b!303979 m!442527))

(declare-fun m!442529 () Bool)

(assert (=> b!303980 m!442529))

(assert (=> b!303981 m!442403))

(assert (=> b!303856 d!101524))

(declare-fun d!101526 () Bool)

(assert (=> d!101526 (= (byteRangesEq!0 (select (arr!9094 a1!948) (_3!1539 lt!438021)) (select (arr!9094 a2!948) (_3!1539 lt!438021)) lt!438020 #b00000000000000000000000000000111) (or (= lt!438020 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9094 a1!948) (_3!1539 lt!438021))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438020)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9094 a2!948) (_3!1539 lt!438021))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438020)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26167 () Bool)

(assert (= bs!26167 d!101526))

(declare-fun m!442531 () Bool)

(assert (=> bs!26167 m!442531))

(declare-fun m!442533 () Bool)

(assert (=> bs!26167 m!442533))

(assert (=> b!303857 d!101526))

(declare-fun d!101528 () Bool)

(assert (=> d!101528 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1165 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303862 d!101528))

(declare-fun d!101530 () Bool)

(assert (=> d!101530 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1165 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303862 d!101530))

(declare-fun d!101532 () Bool)

(assert (=> d!101532 (= (byteRangesEq!0 (ite c!14502 (select (arr!9094 a1!948) (_3!1539 lt!438021)) (select (arr!9094 a1!948) (_4!582 lt!438021))) (ite c!14502 (select (arr!9094 a2!948) (_3!1539 lt!438021)) (select (arr!9094 a2!948) (_4!582 lt!438021))) (ite c!14502 lt!438020 #b00000000000000000000000000000000) lt!438019) (or (= (ite c!14502 lt!438020 #b00000000000000000000000000000000) lt!438019) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14502 (select (arr!9094 a1!948) (_3!1539 lt!438021)) (select (arr!9094 a1!948) (_4!582 lt!438021)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438019))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14502 lt!438020 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14502 (select (arr!9094 a2!948) (_3!1539 lt!438021)) (select (arr!9094 a2!948) (_4!582 lt!438021)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438019))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14502 lt!438020 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26168 () Bool)

(assert (= bs!26168 d!101532))

(declare-fun m!442535 () Bool)

(assert (=> bs!26168 m!442535))

(declare-fun m!442537 () Bool)

(assert (=> bs!26168 m!442537))

(assert (=> bm!5612 d!101532))

(push 1)

(assert (not bm!5624))

(assert (not b!303961))

(assert (not b!303980))

(assert (not b!303981))

(assert (not b!303979))

(assert (not d!101516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67666 () Bool)

(assert start!67666)

(declare-fun b!303741 () Bool)

(declare-fun res!249936 () Bool)

(declare-fun e!218576 () Bool)

(assert (=> b!303741 (=> (not res!249936) (not e!218576))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18459 0))(
  ( (array!18460 (arr!9093 (Array (_ BitVec 32) (_ BitVec 8))) (size!8010 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18459)

(declare-fun a2!948 () array!18459)

(declare-datatypes ((tuple4!1162 0))(
  ( (tuple4!1163 (_1!13236 (_ BitVec 32)) (_2!13236 (_ BitVec 32)) (_3!1538 (_ BitVec 32)) (_4!581 (_ BitVec 32))) )
))
(declare-fun lt!437964 () tuple4!1162)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303741 (= res!249936 (byteRangesEq!0 (select (arr!9093 a1!948) (_3!1538 lt!437964)) (select (arr!9093 a2!948) (_3!1538 lt!437964)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!303742 () Bool)

(declare-datatypes ((Unit!21211 0))(
  ( (Unit!21212) )
))
(declare-fun e!218578 () Unit!21211)

(declare-fun lt!437967 () Unit!21211)

(assert (=> b!303742 (= e!218578 lt!437967)))

(declare-fun lt!437966 () tuple4!1162)

(declare-fun arrayRangesEqSlicedLemma!234 (array!18459 array!18459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21211)

(assert (=> b!303742 (= lt!437967 (arrayRangesEqSlicedLemma!234 a1!948 a2!948 (_1!13236 lt!437964) (_2!13236 lt!437964) (_1!13236 lt!437966) (_2!13236 lt!437966)))))

(declare-fun arrayRangesEq!1639 (array!18459 array!18459 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303742 (arrayRangesEq!1639 a1!948 a2!948 (_1!13236 lt!437966) (_2!13236 lt!437966))))

(declare-fun b!303743 () Bool)

(declare-fun Unit!21213 () Unit!21211)

(assert (=> b!303743 (= e!218578 Unit!21213)))

(declare-fun b!303744 () Bool)

(declare-fun res!249933 () Bool)

(declare-fun e!218580 () Bool)

(assert (=> b!303744 (=> (not res!249933) (not e!218580))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437965 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303744 (= res!249933 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437965) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!249931 () Bool)

(declare-fun e!218581 () Bool)

(assert (=> start!67666 (=> (not res!249931) (not e!218581))))

(assert (=> start!67666 (= res!249931 (and (bvsle (size!8010 a1!948) (size!8010 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67666 e!218581))

(assert (=> start!67666 true))

(declare-fun array_inv!7622 (array!18459) Bool)

(assert (=> start!67666 (array_inv!7622 a1!948)))

(assert (=> start!67666 (array_inv!7622 a2!948)))

(declare-fun b!303745 () Bool)

(assert (=> b!303745 (= e!218581 e!218580)))

(declare-fun res!249932 () Bool)

(assert (=> b!303745 (=> (not res!249932) (not e!218580))))

(assert (=> b!303745 (= res!249932 (and (bvsle toBit!258 lt!437965) (bvsle fromBit!258 lt!437965)))))

(assert (=> b!303745 (= lt!437965 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8010 a1!948))))))

(declare-fun b!303746 () Bool)

(assert (=> b!303746 (= e!218580 e!218576)))

(declare-fun res!249934 () Bool)

(assert (=> b!303746 (=> (not res!249934) (not e!218576))))

(assert (=> b!303746 (= res!249934 (not (= (_3!1538 lt!437964) (_4!581 lt!437964))))))

(declare-fun lt!437963 () Unit!21211)

(assert (=> b!303746 (= lt!437963 e!218578)))

(declare-fun c!14487 () Bool)

(assert (=> b!303746 (= c!14487 (bvslt (_1!13236 lt!437966) (_2!13236 lt!437966)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1162)

(assert (=> b!303746 (= lt!437966 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303746 (= lt!437964 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303747 () Bool)

(assert (=> b!303747 (= e!218576 (and (not (= ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!581 lt!437964) #b00000000000000000000000000000000) (bvsge (_4!581 lt!437964) (size!8010 a2!948)))))))

(declare-fun b!303748 () Bool)

(declare-fun res!249935 () Bool)

(assert (=> b!303748 (=> (not res!249935) (not e!218580))))

(declare-fun arrayBitRangesEq!0 (array!18459 array!18459 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303748 (= res!249935 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67666 res!249931) b!303745))

(assert (= (and b!303745 res!249932) b!303748))

(assert (= (and b!303748 res!249935) b!303744))

(assert (= (and b!303744 res!249933) b!303746))

(assert (= (and b!303746 c!14487) b!303742))

(assert (= (and b!303746 (not c!14487)) b!303743))

(assert (= (and b!303746 res!249934) b!303741))

(assert (= (and b!303741 res!249936) b!303747))

(declare-fun m!442303 () Bool)

(assert (=> b!303741 m!442303))

(declare-fun m!442305 () Bool)

(assert (=> b!303741 m!442305))

(assert (=> b!303741 m!442303))

(assert (=> b!303741 m!442305))

(declare-fun m!442307 () Bool)

(assert (=> b!303741 m!442307))

(declare-fun m!442309 () Bool)

(assert (=> b!303746 m!442309))

(declare-fun m!442311 () Bool)

(assert (=> b!303746 m!442311))

(declare-fun m!442313 () Bool)

(assert (=> start!67666 m!442313))

(declare-fun m!442315 () Bool)

(assert (=> start!67666 m!442315))

(declare-fun m!442317 () Bool)

(assert (=> b!303748 m!442317))

(declare-fun m!442319 () Bool)

(assert (=> b!303742 m!442319))

(declare-fun m!442321 () Bool)

(assert (=> b!303742 m!442321))

(push 1)

(assert (not b!303748))

(assert (not b!303741))

(assert (not start!67666))

(assert (not b!303742))

(assert (not b!303746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101476 () Bool)

(assert (=> d!101476 (= (array_inv!7622 a1!948) (bvsge (size!8010 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67666 d!101476))

(declare-fun d!101478 () Bool)

(assert (=> d!101478 (= (array_inv!7622 a2!948) (bvsge (size!8010 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67666 d!101478))

(declare-fun d!101480 () Bool)

(assert (=> d!101480 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1163 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303746 d!101480))

(declare-fun d!101486 () Bool)

(assert (=> d!101486 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1163 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303746 d!101486))

(declare-fun d!101488 () Bool)

(assert (=> d!101488 (= (byteRangesEq!0 (select (arr!9093 a1!948) (_3!1538 lt!437964)) (select (arr!9093 a2!948) (_3!1538 lt!437964)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9093 a1!948) (_3!1538 lt!437964))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9093 a2!948) (_3!1538 lt!437964))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26158 () Bool)

(assert (= bs!26158 d!101488))

(declare-fun m!442361 () Bool)

(assert (=> bs!26158 m!442361))

(declare-fun m!442363 () Bool)

(assert (=> bs!26158 m!442363))

(assert (=> b!303741 d!101488))

(declare-fun d!101490 () Bool)

(assert (=> d!101490 (arrayRangesEq!1639 a1!948 a2!948 (_1!13236 lt!437966) (_2!13236 lt!437966))))

(declare-fun lt!437991 () Unit!21211)

(declare-fun choose!565 (array!18459 array!18459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21211)

(assert (=> d!101490 (= lt!437991 (choose!565 a1!948 a2!948 (_1!13236 lt!437964) (_2!13236 lt!437964) (_1!13236 lt!437966) (_2!13236 lt!437966)))))

(assert (=> d!101490 (and (bvsle #b00000000000000000000000000000000 (_1!13236 lt!437964)) (bvsle (_1!13236 lt!437964) (_2!13236 lt!437964)))))

(assert (=> d!101490 (= (arrayRangesEqSlicedLemma!234 a1!948 a2!948 (_1!13236 lt!437964) (_2!13236 lt!437964) (_1!13236 lt!437966) (_2!13236 lt!437966)) lt!437991)))

(declare-fun bs!26159 () Bool)

(assert (= bs!26159 d!101490))

(assert (=> bs!26159 m!442321))

(declare-fun m!442365 () Bool)

(assert (=> bs!26159 m!442365))

(assert (=> b!303742 d!101490))

(declare-fun d!101492 () Bool)

(declare-fun res!249983 () Bool)

(declare-fun e!218634 () Bool)

(assert (=> d!101492 (=> res!249983 e!218634)))

(assert (=> d!101492 (= res!249983 (= (_1!13236 lt!437966) (_2!13236 lt!437966)))))

(assert (=> d!101492 (= (arrayRangesEq!1639 a1!948 a2!948 (_1!13236 lt!437966) (_2!13236 lt!437966)) e!218634)))

(declare-fun b!303807 () Bool)

(declare-fun e!218635 () Bool)

(assert (=> b!303807 (= e!218634 e!218635)))

(declare-fun res!249984 () Bool)

(assert (=> b!303807 (=> (not res!249984) (not e!218635))))

(assert (=> b!303807 (= res!249984 (= (select (arr!9093 a1!948) (_1!13236 lt!437966)) (select (arr!9093 a2!948) (_1!13236 lt!437966))))))

(declare-fun b!303808 () Bool)

(assert (=> b!303808 (= e!218635 (arrayRangesEq!1639 a1!948 a2!948 (bvadd (_1!13236 lt!437966) #b00000000000000000000000000000001) (_2!13236 lt!437966)))))

(assert (= (and d!101492 (not res!249983)) b!303807))

(assert (= (and b!303807 res!249984) b!303808))

(declare-fun m!442379 () Bool)

(assert (=> b!303807 m!442379))

(declare-fun m!442383 () Bool)

(assert (=> b!303807 m!442383))

(declare-fun m!442385 () Bool)

(assert (=> b!303808 m!442385))

(assert (=> b!303742 d!101492))

(declare-fun b!303824 () Bool)

(declare-fun e!218648 () Bool)

(declare-fun call!5612 () Bool)

(assert (=> b!303824 (= e!218648 call!5612)))

(declare-fun lt!438002 () (_ BitVec 32))

(declare-fun lt!438001 () (_ BitVec 32))

(declare-fun c!14496 () Bool)

(declare-fun lt!438003 () tuple4!1162)

(declare-fun bm!5609 () Bool)

(assert (=> bm!5609 (= call!5612 (byteRangesEq!0 (ite c!14496 (select (arr!9093 a1!948) (_3!1538 lt!438003)) (select (arr!9093 a1!948) (_4!581 lt!438003))) (ite c!14496 (select (arr!9093 a2!948) (_3!1538 lt!438003)) (select (arr!9093 a2!948) (_4!581 lt!438003))) (ite c!14496 lt!438002 #b00000000000000000000000000000000) lt!438001))))

(declare-fun b!303825 () Bool)

(declare-fun e!218650 () Bool)

(assert (=> b!303825 (= e!218650 (arrayRangesEq!1639 a1!948 a2!948 (_1!13236 lt!438003) (_2!13236 lt!438003)))))

(declare-fun b!303826 () Bool)

(declare-fun res!249999 () Bool)

(assert (=> b!303826 (= res!249999 (= lt!438001 #b00000000000000000000000000000000))))

(assert (=> b!303826 (=> res!249999 e!218648)))

(declare-fun e!218652 () Bool)

(assert (=> b!303826 (= e!218652 e!218648)))

(declare-fun b!303827 () Bool)

(declare-fun e!218653 () Bool)

(declare-fun e!218649 () Bool)

(assert (=> b!303827 (= e!218653 e!218649)))

(declare-fun res!249996 () Bool)

(assert (=> b!303827 (=> (not res!249996) (not e!218649))))

(assert (=> b!303827 (= res!249996 e!218650)))

(declare-fun res!249998 () Bool)

(assert (=> b!303827 (=> res!249998 e!218650)))

(assert (=> b!303827 (= res!249998 (bvsge (_1!13236 lt!438003) (_2!13236 lt!438003)))))

(assert (=> b!303827 (= lt!438001 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303827 (= lt!438002 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303827 (= lt!438003 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303828 () Bool)

(declare-fun e!218651 () Bool)

(assert (=> b!303828 (= e!218651 call!5612)))

(declare-fun b!303829 () Bool)

(assert (=> b!303829 (= e!218651 e!218652)))

(declare-fun res!249997 () Bool)

(assert (=> b!303829 (= res!249997 (byteRangesEq!0 (select (arr!9093 a1!948) (_3!1538 lt!438003)) (select (arr!9093 a2!948) (_3!1538 lt!438003)) lt!438002 #b00000000000000000000000000001000))))

(assert (=> b!303829 (=> (not res!249997) (not e!218652))))

(declare-fun d!101494 () Bool)

(declare-fun res!249995 () Bool)

(assert (=> d!101494 (=> res!249995 e!218653)))

(assert (=> d!101494 (= res!249995 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101494 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218653)))

(declare-fun b!303823 () Bool)

(assert (=> b!303823 (= e!218649 e!218651)))

(assert (=> b!303823 (= c!14496 (= (_3!1538 lt!438003) (_4!581 lt!438003)))))

(assert (= (and d!101494 (not res!249995)) b!303827))

(assert (= (and b!303827 (not res!249998)) b!303825))

(assert (= (and b!303827 res!249996) b!303823))

(assert (= (and b!303823 c!14496) b!303828))

(assert (= (and b!303823 (not c!14496)) b!303829))

(assert (= (and b!303829 res!249997) b!303826))

(assert (= (and b!303826 (not res!249999)) b!303824))

(assert (= (or b!303828 b!303824) bm!5609))

(declare-fun m!442387 () Bool)

(assert (=> bm!5609 m!442387))

(declare-fun m!442389 () Bool)

(assert (=> bm!5609 m!442389))

(declare-fun m!442391 () Bool)

(assert (=> bm!5609 m!442391))

(declare-fun m!442393 () Bool)

(assert (=> bm!5609 m!442393))

(declare-fun m!442395 () Bool)

(assert (=> bm!5609 m!442395))

(declare-fun m!442397 () Bool)

(assert (=> b!303825 m!442397))

(assert (=> b!303827 m!442311))

(assert (=> b!303829 m!442395))

(assert (=> b!303829 m!442389))

(assert (=> b!303829 m!442395))

(assert (=> b!303829 m!442389))

(declare-fun m!442399 () Bool)

(assert (=> b!303829 m!442399))

(assert (=> b!303748 d!101494))

(push 1)

(assert (not b!303825))

(assert (not bm!5609))

(assert (not b!303808))

(assert (not b!303829))

(assert (not b!303827))

(assert (not d!101490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


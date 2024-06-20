; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67398 () Bool)

(assert start!67398)

(declare-fun b!302670 () Bool)

(declare-fun res!249110 () Bool)

(declare-fun e!217645 () Bool)

(assert (=> b!302670 (=> (not res!249110) (not e!217645))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437363 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302670 (= res!249110 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437363) (not (= fromSlice!52 toSlice!52))))))

(declare-datatypes ((tuple4!1110 0))(
  ( (tuple4!1111 (_1!13210 (_ BitVec 32)) (_2!13210 (_ BitVec 32)) (_3!1512 (_ BitVec 32)) (_4!555 (_ BitVec 32))) )
))
(declare-fun lt!437362 () tuple4!1110)

(declare-datatypes ((array!18383 0))(
  ( (array!18384 (arr!9067 (Array (_ BitVec 32) (_ BitVec 8))) (size!7984 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18383)

(declare-fun lt!437364 () tuple4!1110)

(declare-fun b!302671 () Bool)

(assert (=> b!302671 (= e!217645 (and (bvslt (_1!13210 lt!437364) (_2!13210 lt!437364)) (bvsle #b00000000000000000000000000000000 (_1!13210 lt!437362)) (bvsle (_1!13210 lt!437362) (_2!13210 lt!437362)) (bvsgt (_2!13210 lt!437362) (size!7984 a1!948))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1110)

(assert (=> b!302671 (= lt!437364 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302671 (= lt!437362 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302668 () Bool)

(declare-fun e!217646 () Bool)

(assert (=> b!302668 (= e!217646 e!217645)))

(declare-fun res!249109 () Bool)

(assert (=> b!302668 (=> (not res!249109) (not e!217645))))

(assert (=> b!302668 (= res!249109 (and (bvsle toBit!258 lt!437363) (bvsle fromBit!258 lt!437363)))))

(assert (=> b!302668 (= lt!437363 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7984 a1!948))))))

(declare-fun res!249108 () Bool)

(assert (=> start!67398 (=> (not res!249108) (not e!217646))))

(declare-fun a2!948 () array!18383)

(assert (=> start!67398 (= res!249108 (and (bvsle (size!7984 a1!948) (size!7984 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67398 e!217646))

(assert (=> start!67398 true))

(declare-fun array_inv!7596 (array!18383) Bool)

(assert (=> start!67398 (array_inv!7596 a1!948)))

(assert (=> start!67398 (array_inv!7596 a2!948)))

(declare-fun b!302669 () Bool)

(declare-fun res!249111 () Bool)

(assert (=> b!302669 (=> (not res!249111) (not e!217645))))

(declare-fun arrayBitRangesEq!0 (array!18383 array!18383 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302669 (= res!249111 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67398 res!249108) b!302668))

(assert (= (and b!302668 res!249109) b!302669))

(assert (= (and b!302669 res!249111) b!302670))

(assert (= (and b!302670 res!249110) b!302671))

(declare-fun m!441453 () Bool)

(assert (=> b!302671 m!441453))

(declare-fun m!441455 () Bool)

(assert (=> b!302671 m!441455))

(declare-fun m!441457 () Bool)

(assert (=> start!67398 m!441457))

(declare-fun m!441459 () Bool)

(assert (=> start!67398 m!441459))

(declare-fun m!441461 () Bool)

(assert (=> b!302669 m!441461))

(push 1)

(assert (not b!302671))

(assert (not start!67398))

(assert (not b!302669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101126 () Bool)

(assert (=> d!101126 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1111 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302671 d!101126))

(declare-fun d!101128 () Bool)

(assert (=> d!101128 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1111 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302671 d!101128))

(declare-fun d!101130 () Bool)

(assert (=> d!101130 (= (array_inv!7596 a1!948) (bvsge (size!7984 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67398 d!101130))

(declare-fun d!101132 () Bool)

(assert (=> d!101132 (= (array_inv!7596 a2!948) (bvsge (size!7984 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67398 d!101132))

(declare-fun b!302732 () Bool)

(declare-fun res!249164 () Bool)

(declare-fun lt!437400 () (_ BitVec 32))

(assert (=> b!302732 (= res!249164 (= lt!437400 #b00000000000000000000000000000000))))

(declare-fun e!217703 () Bool)

(assert (=> b!302732 (=> res!249164 e!217703)))

(declare-fun e!217708 () Bool)

(assert (=> b!302732 (= e!217708 e!217703)))

(declare-fun b!302733 () Bool)

(declare-fun e!217706 () Bool)

(declare-fun e!217707 () Bool)

(assert (=> b!302733 (= e!217706 e!217707)))

(declare-fun res!249165 () Bool)

(assert (=> b!302733 (=> (not res!249165) (not e!217707))))

(declare-fun e!217704 () Bool)

(assert (=> b!302733 (= res!249165 e!217704)))

(declare-fun res!249161 () Bool)

(assert (=> b!302733 (=> res!249161 e!217704)))

(declare-fun lt!437399 () tuple4!1110)

(assert (=> b!302733 (= res!249161 (bvsge (_1!13210 lt!437399) (_2!13210 lt!437399)))))

(assert (=> b!302733 (= lt!437400 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437398 () (_ BitVec 32))

(assert (=> b!302733 (= lt!437398 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302733 (= lt!437399 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302734 () Bool)

(declare-fun e!217705 () Bool)

(assert (=> b!302734 (= e!217705 e!217708)))

(declare-fun res!249163 () Bool)

(declare-fun call!5537 () Bool)

(assert (=> b!302734 (= res!249163 call!5537)))

(assert (=> b!302734 (=> (not res!249163) (not e!217708))))

(declare-fun bm!5534 () Bool)

(declare-fun c!14367 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5534 (= call!5537 (byteRangesEq!0 (select (arr!9067 a1!948) (_3!1512 lt!437399)) (select (arr!9067 a2!948) (_3!1512 lt!437399)) lt!437398 (ite c!14367 lt!437400 #b00000000000000000000000000001000)))))

(declare-fun b!302735 () Bool)

(assert (=> b!302735 (= e!217703 (byteRangesEq!0 (select (arr!9067 a1!948) (_4!555 lt!437399)) (select (arr!9067 a2!948) (_4!555 lt!437399)) #b00000000000000000000000000000000 lt!437400))))

(declare-fun b!302736 () Bool)

(assert (=> b!302736 (= e!217705 call!5537)))

(declare-fun b!302737 () Bool)

(assert (=> b!302737 (= e!217707 e!217705)))

(assert (=> b!302737 (= c!14367 (= (_3!1512 lt!437399) (_4!555 lt!437399)))))

(declare-fun b!302731 () Bool)

(declare-fun arrayRangesEq!1614 (array!18383 array!18383 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302731 (= e!217704 (arrayRangesEq!1614 a1!948 a2!948 (_1!13210 lt!437399) (_2!13210 lt!437399)))))

(declare-fun d!101134 () Bool)

(declare-fun res!249162 () Bool)

(assert (=> d!101134 (=> res!249162 e!217706)))

(assert (=> d!101134 (= res!249162 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101134 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217706)))

(assert (= (and d!101134 (not res!249162)) b!302733))

(assert (= (and b!302733 (not res!249161)) b!302731))

(assert (= (and b!302733 res!249165) b!302737))

(assert (= (and b!302737 c!14367) b!302736))

(assert (= (and b!302737 (not c!14367)) b!302734))

(assert (= (and b!302734 res!249163) b!302732))

(assert (= (and b!302732 (not res!249164)) b!302735))

(assert (= (or b!302736 b!302734) bm!5534))

(assert (=> b!302733 m!441455))

(declare-fun m!441497 () Bool)

(assert (=> bm!5534 m!441497))

(declare-fun m!441499 () Bool)

(assert (=> bm!5534 m!441499))

(assert (=> bm!5534 m!441497))

(assert (=> bm!5534 m!441499))

(declare-fun m!441501 () Bool)

(assert (=> bm!5534 m!441501))

(declare-fun m!441503 () Bool)

(assert (=> b!302735 m!441503))

(declare-fun m!441505 () Bool)

(assert (=> b!302735 m!441505))

(assert (=> b!302735 m!441503))

(assert (=> b!302735 m!441505))

(declare-fun m!441507 () Bool)

(assert (=> b!302735 m!441507))

(declare-fun m!441509 () Bool)

(assert (=> b!302731 m!441509))

(assert (=> b!302669 d!101134))

(push 1)

(assert (not bm!5534))

(assert (not b!302735))

(assert (not b!302731))

(assert (not b!302733))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67548 () Bool)

(assert start!67548)

(declare-fun b!303266 () Bool)

(declare-datatypes ((Unit!21178 0))(
  ( (Unit!21179) )
))
(declare-fun e!218179 () Unit!21178)

(declare-fun Unit!21180 () Unit!21178)

(assert (=> b!303266 (= e!218179 Unit!21180)))

(declare-fun b!303267 () Bool)

(declare-fun res!249578 () Bool)

(declare-fun e!218178 () Bool)

(assert (=> b!303267 (=> (not res!249578) (not e!218178))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437694 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303267 (= res!249578 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437694) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303268 () Bool)

(declare-fun lt!437691 () Unit!21178)

(assert (=> b!303268 (= e!218179 lt!437691)))

(declare-datatypes ((tuple4!1140 0))(
  ( (tuple4!1141 (_1!13225 (_ BitVec 32)) (_2!13225 (_ BitVec 32)) (_3!1527 (_ BitVec 32)) (_4!570 (_ BitVec 32))) )
))
(declare-fun lt!437690 () tuple4!1140)

(declare-datatypes ((array!18428 0))(
  ( (array!18429 (arr!9082 (Array (_ BitVec 32) (_ BitVec 8))) (size!7999 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18428)

(declare-fun a2!948 () array!18428)

(declare-fun lt!437693 () tuple4!1140)

(declare-fun arrayRangesEqSlicedLemma!223 (array!18428 array!18428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21178)

(assert (=> b!303268 (= lt!437691 (arrayRangesEqSlicedLemma!223 a1!948 a2!948 (_1!13225 lt!437693) (_2!13225 lt!437693) (_1!13225 lt!437690) (_2!13225 lt!437690)))))

(declare-fun arrayRangesEq!1628 (array!18428 array!18428 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303268 (arrayRangesEq!1628 a1!948 a2!948 (_1!13225 lt!437690) (_2!13225 lt!437690))))

(declare-fun b!303269 () Bool)

(declare-fun e!218181 () Bool)

(assert (=> b!303269 (= e!218181 e!218178)))

(declare-fun res!249577 () Bool)

(assert (=> b!303269 (=> (not res!249577) (not e!218178))))

(assert (=> b!303269 (= res!249577 (and (bvsle toBit!258 lt!437694) (bvsle fromBit!258 lt!437694)))))

(assert (=> b!303269 (= lt!437694 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7999 a1!948))))))

(declare-fun b!303270 () Bool)

(declare-fun res!249576 () Bool)

(assert (=> b!303270 (=> (not res!249576) (not e!218178))))

(declare-fun arrayBitRangesEq!0 (array!18428 array!18428 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303270 (= res!249576 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303271 () Bool)

(assert (=> b!303271 (= e!218178 (and (not (= (_3!1527 lt!437693) (_4!570 lt!437693))) (or (bvslt (_3!1527 lt!437693) #b00000000000000000000000000000000) (bvsge (_3!1527 lt!437693) (size!7999 a1!948)))))))

(declare-fun lt!437692 () Unit!21178)

(assert (=> b!303271 (= lt!437692 e!218179)))

(declare-fun c!14427 () Bool)

(assert (=> b!303271 (= c!14427 (bvslt (_1!13225 lt!437690) (_2!13225 lt!437690)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1140)

(assert (=> b!303271 (= lt!437690 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303271 (= lt!437693 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!249579 () Bool)

(assert (=> start!67548 (=> (not res!249579) (not e!218181))))

(assert (=> start!67548 (= res!249579 (and (bvsle (size!7999 a1!948) (size!7999 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67548 e!218181))

(assert (=> start!67548 true))

(declare-fun array_inv!7611 (array!18428) Bool)

(assert (=> start!67548 (array_inv!7611 a1!948)))

(assert (=> start!67548 (array_inv!7611 a2!948)))

(assert (= (and start!67548 res!249579) b!303269))

(assert (= (and b!303269 res!249577) b!303270))

(assert (= (and b!303270 res!249576) b!303267))

(assert (= (and b!303267 res!249578) b!303271))

(assert (= (and b!303271 c!14427) b!303268))

(assert (= (and b!303271 (not c!14427)) b!303266))

(declare-fun m!441909 () Bool)

(assert (=> b!303268 m!441909))

(declare-fun m!441911 () Bool)

(assert (=> b!303268 m!441911))

(declare-fun m!441913 () Bool)

(assert (=> b!303270 m!441913))

(declare-fun m!441915 () Bool)

(assert (=> b!303271 m!441915))

(declare-fun m!441917 () Bool)

(assert (=> b!303271 m!441917))

(declare-fun m!441919 () Bool)

(assert (=> start!67548 m!441919))

(declare-fun m!441921 () Bool)

(assert (=> start!67548 m!441921))

(push 1)

(assert (not b!303268))

(assert (not b!303271))

(assert (not start!67548))

(assert (not b!303270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101324 () Bool)

(assert (=> d!101324 (arrayRangesEq!1628 a1!948 a2!948 (_1!13225 lt!437690) (_2!13225 lt!437690))))

(declare-fun lt!437736 () Unit!21178)

(declare-fun choose!555 (array!18428 array!18428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21178)

(assert (=> d!101324 (= lt!437736 (choose!555 a1!948 a2!948 (_1!13225 lt!437693) (_2!13225 lt!437693) (_1!13225 lt!437690) (_2!13225 lt!437690)))))

(assert (=> d!101324 (and (bvsle #b00000000000000000000000000000000 (_1!13225 lt!437693)) (bvsle (_1!13225 lt!437693) (_2!13225 lt!437693)))))

(assert (=> d!101324 (= (arrayRangesEqSlicedLemma!223 a1!948 a2!948 (_1!13225 lt!437693) (_2!13225 lt!437693) (_1!13225 lt!437690) (_2!13225 lt!437690)) lt!437736)))

(declare-fun bs!26134 () Bool)

(assert (= bs!26134 d!101324))

(assert (=> bs!26134 m!441911))

(declare-fun m!441959 () Bool)

(assert (=> bs!26134 m!441959))

(assert (=> b!303268 d!101324))

(declare-fun d!101326 () Bool)

(declare-fun res!249629 () Bool)

(declare-fun e!218241 () Bool)

(assert (=> d!101326 (=> res!249629 e!218241)))

(assert (=> d!101326 (= res!249629 (= (_1!13225 lt!437690) (_2!13225 lt!437690)))))

(assert (=> d!101326 (= (arrayRangesEq!1628 a1!948 a2!948 (_1!13225 lt!437690) (_2!13225 lt!437690)) e!218241)))

(declare-fun b!303339 () Bool)

(declare-fun e!218242 () Bool)

(assert (=> b!303339 (= e!218241 e!218242)))

(declare-fun res!249630 () Bool)

(assert (=> b!303339 (=> (not res!249630) (not e!218242))))

(assert (=> b!303339 (= res!249630 (= (select (arr!9082 a1!948) (_1!13225 lt!437690)) (select (arr!9082 a2!948) (_1!13225 lt!437690))))))

(declare-fun b!303340 () Bool)

(assert (=> b!303340 (= e!218242 (arrayRangesEq!1628 a1!948 a2!948 (bvadd (_1!13225 lt!437690) #b00000000000000000000000000000001) (_2!13225 lt!437690)))))

(assert (= (and d!101326 (not res!249629)) b!303339))

(assert (= (and b!303339 res!249630) b!303340))

(declare-fun m!441975 () Bool)

(assert (=> b!303339 m!441975))

(declare-fun m!441977 () Bool)

(assert (=> b!303339 m!441977))

(declare-fun m!441979 () Bool)

(assert (=> b!303340 m!441979))

(assert (=> b!303268 d!101326))

(declare-fun d!101328 () Bool)

(assert (=> d!101328 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1141 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303271 d!101328))

(declare-fun d!101330 () Bool)

(assert (=> d!101330 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1141 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303271 d!101330))

(declare-fun d!101332 () Bool)

(assert (=> d!101332 (= (array_inv!7611 a1!948) (bvsge (size!7999 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67548 d!101332))

(declare-fun d!101334 () Bool)

(assert (=> d!101334 (= (array_inv!7611 a2!948) (bvsge (size!7999 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67548 d!101334))

(declare-fun b!303355 () Bool)

(declare-fun e!218257 () Bool)

(declare-fun lt!437748 () (_ BitVec 32))

(declare-fun lt!437746 () tuple4!1140)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303355 (= e!218257 (byteRangesEq!0 (select (arr!9082 a1!948) (_4!570 lt!437746)) (select (arr!9082 a2!948) (_4!570 lt!437746)) #b00000000000000000000000000000000 lt!437748))))

(declare-fun b!303356 () Bool)

(declare-fun e!218255 () Bool)

(declare-fun e!218260 () Bool)

(assert (=> b!303356 (= e!218255 e!218260)))

(declare-fun res!249645 () Bool)

(assert (=> b!303356 (=> (not res!249645) (not e!218260))))

(declare-fun e!218256 () Bool)

(assert (=> b!303356 (= res!249645 e!218256)))

(declare-fun res!249643 () Bool)

(assert (=> b!303356 (=> res!249643 e!218256)))

(assert (=> b!303356 (= res!249643 (bvsge (_1!13225 lt!437746) (_2!13225 lt!437746)))))

(assert (=> b!303356 (= lt!437748 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437747 () (_ BitVec 32))

(assert (=> b!303356 (= lt!437747 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303356 (= lt!437746 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303357 () Bool)

(assert (=> b!303357 (= e!218256 (arrayRangesEq!1628 a1!948 a2!948 (_1!13225 lt!437746) (_2!13225 lt!437746)))))

(declare-fun b!303358 () Bool)

(declare-fun res!249641 () Bool)

(assert (=> b!303358 (= res!249641 (= lt!437748 #b00000000000000000000000000000000))))

(assert (=> b!303358 (=> res!249641 e!218257)))

(declare-fun e!218258 () Bool)

(assert (=> b!303358 (= e!218258 e!218257)))

(declare-fun b!303360 () Bool)

(declare-fun e!218259 () Bool)

(declare-fun call!5582 () Bool)

(assert (=> b!303360 (= e!218259 call!5582)))

(declare-fun b!303361 () Bool)

(assert (=> b!303361 (= e!218260 e!218259)))

(declare-fun c!14439 () Bool)

(assert (=> b!303361 (= c!14439 (= (_3!1527 lt!437746) (_4!570 lt!437746)))))

(declare-fun bm!5579 () Bool)

(assert (=> bm!5579 (= call!5582 (byteRangesEq!0 (select (arr!9082 a1!948) (_3!1527 lt!437746)) (select (arr!9082 a2!948) (_3!1527 lt!437746)) lt!437747 (ite c!14439 lt!437748 #b00000000000000000000000000001000)))))

(declare-fun d!101336 () Bool)

(declare-fun res!249644 () Bool)

(assert (=> d!101336 (=> res!249644 e!218255)))

(assert (=> d!101336 (= res!249644 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101336 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218255)))

(declare-fun b!303359 () Bool)

(assert (=> b!303359 (= e!218259 e!218258)))

(declare-fun res!249642 () Bool)

(assert (=> b!303359 (= res!249642 call!5582)))

(assert (=> b!303359 (=> (not res!249642) (not e!218258))))

(assert (= (and d!101336 (not res!249644)) b!303356))

(assert (= (and b!303356 (not res!249643)) b!303357))

(assert (= (and b!303356 res!249645) b!303361))

(assert (= (and b!303361 c!14439) b!303360))

(assert (= (and b!303361 (not c!14439)) b!303359))

(assert (= (and b!303359 res!249642) b!303358))

(assert (= (and b!303358 (not res!249641)) b!303355))

(assert (= (or b!303360 b!303359) bm!5579))

(declare-fun m!441981 () Bool)

(assert (=> b!303355 m!441981))

(declare-fun m!441983 () Bool)

(assert (=> b!303355 m!441983))

(assert (=> b!303355 m!441981))

(assert (=> b!303355 m!441983))

(declare-fun m!441985 () Bool)

(assert (=> b!303355 m!441985))

(assert (=> b!303356 m!441917))

(declare-fun m!441987 () Bool)

(assert (=> b!303357 m!441987))

(declare-fun m!441989 () Bool)

(assert (=> bm!5579 m!441989))

(declare-fun m!441991 () Bool)

(assert (=> bm!5579 m!441991))

(assert (=> bm!5579 m!441989))

(assert (=> bm!5579 m!441991))

(declare-fun m!441993 () Bool)

(assert (=> bm!5579 m!441993))

(assert (=> b!303270 d!101336))

(push 1)

(assert (not b!303357))

(assert (not b!303355))

(assert (not bm!5579))

(assert (not b!303340))

(assert (not d!101324))

(assert (not b!303356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


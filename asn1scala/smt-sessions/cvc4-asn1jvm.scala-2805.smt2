; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67552 () Bool)

(assert start!67552)

(declare-fun b!303302 () Bool)

(declare-fun res!249603 () Bool)

(declare-fun e!218209 () Bool)

(assert (=> b!303302 (=> (not res!249603) (not e!218209))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437721 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303302 (= res!249603 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437721) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303303 () Bool)

(declare-datatypes ((Unit!21184 0))(
  ( (Unit!21185) )
))
(declare-fun e!218210 () Unit!21184)

(declare-fun lt!437722 () Unit!21184)

(assert (=> b!303303 (= e!218210 lt!437722)))

(declare-datatypes ((array!18432 0))(
  ( (array!18433 (arr!9084 (Array (_ BitVec 32) (_ BitVec 8))) (size!8001 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18432)

(declare-fun a2!948 () array!18432)

(declare-datatypes ((tuple4!1144 0))(
  ( (tuple4!1145 (_1!13227 (_ BitVec 32)) (_2!13227 (_ BitVec 32)) (_3!1529 (_ BitVec 32)) (_4!572 (_ BitVec 32))) )
))
(declare-fun lt!437723 () tuple4!1144)

(declare-fun lt!437724 () tuple4!1144)

(declare-fun arrayRangesEqSlicedLemma!225 (array!18432 array!18432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21184)

(assert (=> b!303303 (= lt!437722 (arrayRangesEqSlicedLemma!225 a1!948 a2!948 (_1!13227 lt!437724) (_2!13227 lt!437724) (_1!13227 lt!437723) (_2!13227 lt!437723)))))

(declare-fun arrayRangesEq!1630 (array!18432 array!18432 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303303 (arrayRangesEq!1630 a1!948 a2!948 (_1!13227 lt!437723) (_2!13227 lt!437723))))

(declare-fun b!303304 () Bool)

(declare-fun e!218208 () Bool)

(assert (=> b!303304 (= e!218208 e!218209)))

(declare-fun res!249600 () Bool)

(assert (=> b!303304 (=> (not res!249600) (not e!218209))))

(assert (=> b!303304 (= res!249600 (and (bvsle toBit!258 lt!437721) (bvsle fromBit!258 lt!437721)))))

(assert (=> b!303304 (= lt!437721 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8001 a1!948))))))

(declare-fun b!303305 () Bool)

(declare-fun Unit!21186 () Unit!21184)

(assert (=> b!303305 (= e!218210 Unit!21186)))

(declare-fun res!249601 () Bool)

(assert (=> start!67552 (=> (not res!249601) (not e!218208))))

(assert (=> start!67552 (= res!249601 (and (bvsle (size!8001 a1!948) (size!8001 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67552 e!218208))

(assert (=> start!67552 true))

(declare-fun array_inv!7613 (array!18432) Bool)

(assert (=> start!67552 (array_inv!7613 a1!948)))

(assert (=> start!67552 (array_inv!7613 a2!948)))

(declare-fun b!303306 () Bool)

(assert (=> b!303306 (= e!218209 (and (not (= (_3!1529 lt!437724) (_4!572 lt!437724))) (or (bvslt (_3!1529 lt!437724) #b00000000000000000000000000000000) (bvsge (_3!1529 lt!437724) (size!8001 a1!948)))))))

(declare-fun lt!437720 () Unit!21184)

(assert (=> b!303306 (= lt!437720 e!218210)))

(declare-fun c!14433 () Bool)

(assert (=> b!303306 (= c!14433 (bvslt (_1!13227 lt!437723) (_2!13227 lt!437723)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1144)

(assert (=> b!303306 (= lt!437723 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303306 (= lt!437724 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303307 () Bool)

(declare-fun res!249602 () Bool)

(assert (=> b!303307 (=> (not res!249602) (not e!218209))))

(declare-fun arrayBitRangesEq!0 (array!18432 array!18432 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303307 (= res!249602 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67552 res!249601) b!303304))

(assert (= (and b!303304 res!249600) b!303307))

(assert (= (and b!303307 res!249602) b!303302))

(assert (= (and b!303302 res!249603) b!303306))

(assert (= (and b!303306 c!14433) b!303303))

(assert (= (and b!303306 (not c!14433)) b!303305))

(declare-fun m!441937 () Bool)

(assert (=> b!303303 m!441937))

(declare-fun m!441939 () Bool)

(assert (=> b!303303 m!441939))

(declare-fun m!441941 () Bool)

(assert (=> start!67552 m!441941))

(declare-fun m!441943 () Bool)

(assert (=> start!67552 m!441943))

(declare-fun m!441945 () Bool)

(assert (=> b!303306 m!441945))

(declare-fun m!441947 () Bool)

(assert (=> b!303306 m!441947))

(declare-fun m!441949 () Bool)

(assert (=> b!303307 m!441949))

(push 1)

(assert (not b!303307))

(assert (not b!303306))

(assert (not start!67552))

(assert (not b!303303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!303376 () Bool)

(declare-fun e!218275 () Bool)

(declare-fun e!218276 () Bool)

(assert (=> b!303376 (= e!218275 e!218276)))

(declare-fun c!14442 () Bool)

(declare-fun lt!437755 () tuple4!1144)

(assert (=> b!303376 (= c!14442 (= (_3!1529 lt!437755) (_4!572 lt!437755)))))

(declare-fun b!303377 () Bool)

(declare-fun call!5585 () Bool)

(assert (=> b!303377 (= e!218276 call!5585)))

(declare-fun b!303378 () Bool)

(declare-fun res!249658 () Bool)

(declare-fun lt!437756 () (_ BitVec 32))

(assert (=> b!303378 (= res!249658 (= lt!437756 #b00000000000000000000000000000000))))

(declare-fun e!218273 () Bool)

(assert (=> b!303378 (=> res!249658 e!218273)))

(declare-fun e!218274 () Bool)

(assert (=> b!303378 (= e!218274 e!218273)))

(declare-fun b!303379 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303379 (= e!218273 (byteRangesEq!0 (select (arr!9084 a1!948) (_4!572 lt!437755)) (select (arr!9084 a2!948) (_4!572 lt!437755)) #b00000000000000000000000000000000 lt!437756))))

(declare-fun b!303380 () Bool)

(assert (=> b!303380 (= e!218276 e!218274)))

(declare-fun res!249659 () Bool)

(assert (=> b!303380 (= res!249659 call!5585)))

(assert (=> b!303380 (=> (not res!249659) (not e!218274))))

(declare-fun lt!437757 () (_ BitVec 32))

(declare-fun bm!5582 () Bool)

(assert (=> bm!5582 (= call!5585 (byteRangesEq!0 (select (arr!9084 a1!948) (_3!1529 lt!437755)) (select (arr!9084 a2!948) (_3!1529 lt!437755)) lt!437757 (ite c!14442 lt!437756 #b00000000000000000000000000001000)))))

(declare-fun b!303381 () Bool)

(declare-fun e!218278 () Bool)

(assert (=> b!303381 (= e!218278 (arrayRangesEq!1630 a1!948 a2!948 (_1!13227 lt!437755) (_2!13227 lt!437755)))))

(declare-fun b!303382 () Bool)

(declare-fun e!218277 () Bool)

(assert (=> b!303382 (= e!218277 e!218275)))

(declare-fun res!249657 () Bool)

(assert (=> b!303382 (=> (not res!249657) (not e!218275))))

(assert (=> b!303382 (= res!249657 e!218278)))

(declare-fun res!249660 () Bool)

(assert (=> b!303382 (=> res!249660 e!218278)))

(assert (=> b!303382 (= res!249660 (bvsge (_1!13227 lt!437755) (_2!13227 lt!437755)))))

(assert (=> b!303382 (= lt!437756 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303382 (= lt!437757 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303382 (= lt!437755 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101338 () Bool)

(declare-fun res!249656 () Bool)

(assert (=> d!101338 (=> res!249656 e!218277)))

(assert (=> d!101338 (= res!249656 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101338 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218277)))

(assert (= (and d!101338 (not res!249656)) b!303382))

(assert (= (and b!303382 (not res!249660)) b!303381))

(assert (= (and b!303382 res!249657) b!303376))

(assert (= (and b!303376 c!14442) b!303377))

(assert (= (and b!303376 (not c!14442)) b!303380))

(assert (= (and b!303380 res!249659) b!303378))

(assert (= (and b!303378 (not res!249658)) b!303379))

(assert (= (or b!303377 b!303380) bm!5582))

(declare-fun m!441995 () Bool)

(assert (=> b!303379 m!441995))

(declare-fun m!441997 () Bool)

(assert (=> b!303379 m!441997))

(assert (=> b!303379 m!441995))

(assert (=> b!303379 m!441997))

(declare-fun m!441999 () Bool)

(assert (=> b!303379 m!441999))

(declare-fun m!442001 () Bool)

(assert (=> bm!5582 m!442001))

(declare-fun m!442003 () Bool)

(assert (=> bm!5582 m!442003))

(assert (=> bm!5582 m!442001))

(assert (=> bm!5582 m!442003))

(declare-fun m!442005 () Bool)

(assert (=> bm!5582 m!442005))

(declare-fun m!442007 () Bool)

(assert (=> b!303381 m!442007))

(assert (=> b!303382 m!441947))

(assert (=> b!303307 d!101338))

(declare-fun d!101340 () Bool)

(assert (=> d!101340 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1145 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303306 d!101340))

(declare-fun d!101342 () Bool)

(assert (=> d!101342 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1145 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303306 d!101342))

(declare-fun d!101344 () Bool)

(assert (=> d!101344 (= (array_inv!7613 a1!948) (bvsge (size!8001 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67552 d!101344))

(declare-fun d!101346 () Bool)

(assert (=> d!101346 (= (array_inv!7613 a2!948) (bvsge (size!8001 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67552 d!101346))

(declare-fun d!101348 () Bool)

(assert (=> d!101348 (arrayRangesEq!1630 a1!948 a2!948 (_1!13227 lt!437723) (_2!13227 lt!437723))))

(declare-fun lt!437760 () Unit!21184)

(declare-fun choose!556 (array!18432 array!18432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21184)

(assert (=> d!101348 (= lt!437760 (choose!556 a1!948 a2!948 (_1!13227 lt!437724) (_2!13227 lt!437724) (_1!13227 lt!437723) (_2!13227 lt!437723)))))

(assert (=> d!101348 (and (bvsle #b00000000000000000000000000000000 (_1!13227 lt!437724)) (bvsle (_1!13227 lt!437724) (_2!13227 lt!437724)))))

(assert (=> d!101348 (= (arrayRangesEqSlicedLemma!225 a1!948 a2!948 (_1!13227 lt!437724) (_2!13227 lt!437724) (_1!13227 lt!437723) (_2!13227 lt!437723)) lt!437760)))

(declare-fun bs!26135 () Bool)

(assert (= bs!26135 d!101348))

(assert (=> bs!26135 m!441939))

(declare-fun m!442009 () Bool)

(assert (=> bs!26135 m!442009))

(assert (=> b!303303 d!101348))

(declare-fun d!101350 () Bool)

(declare-fun res!249665 () Bool)

(declare-fun e!218283 () Bool)

(assert (=> d!101350 (=> res!249665 e!218283)))

(assert (=> d!101350 (= res!249665 (= (_1!13227 lt!437723) (_2!13227 lt!437723)))))

(assert (=> d!101350 (= (arrayRangesEq!1630 a1!948 a2!948 (_1!13227 lt!437723) (_2!13227 lt!437723)) e!218283)))

(declare-fun b!303387 () Bool)

(declare-fun e!218284 () Bool)

(assert (=> b!303387 (= e!218283 e!218284)))

(declare-fun res!249666 () Bool)

(assert (=> b!303387 (=> (not res!249666) (not e!218284))))

(assert (=> b!303387 (= res!249666 (= (select (arr!9084 a1!948) (_1!13227 lt!437723)) (select (arr!9084 a2!948) (_1!13227 lt!437723))))))

(declare-fun b!303388 () Bool)

(assert (=> b!303388 (= e!218284 (arrayRangesEq!1630 a1!948 a2!948 (bvadd (_1!13227 lt!437723) #b00000000000000000000000000000001) (_2!13227 lt!437723)))))

(assert (= (and d!101350 (not res!249665)) b!303387))

(assert (= (and b!303387 res!249666) b!303388))

(declare-fun m!442011 () Bool)

(assert (=> b!303387 m!442011))

(declare-fun m!442013 () Bool)

(assert (=> b!303387 m!442013))

(declare-fun m!442015 () Bool)

(assert (=> b!303388 m!442015))

(assert (=> b!303303 d!101350))

(push 1)

(assert (not b!303388))

(assert (not b!303382))

(assert (not b!303381))

(assert (not b!303379))

(assert (not bm!5582))

(assert (not d!101348))

(check-sat)


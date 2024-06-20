; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67794 () Bool)

(assert start!67794)

(declare-fun b!304266 () Bool)

(declare-fun e!219029 () Bool)

(declare-fun e!219023 () Bool)

(assert (=> b!304266 (= e!219029 e!219023)))

(declare-datatypes ((array!18488 0))(
  ( (array!18489 (arr!9103 (Array (_ BitVec 32) (_ BitVec 8))) (size!8020 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18488)

(declare-fun a2!948 () array!18488)

(declare-fun res!250303 () Bool)

(declare-fun lt!438266 () (_ BitVec 32))

(declare-datatypes ((tuple4!1182 0))(
  ( (tuple4!1183 (_1!13246 (_ BitVec 32)) (_2!13246 (_ BitVec 32)) (_3!1548 (_ BitVec 32)) (_4!591 (_ BitVec 32))) )
))
(declare-fun lt!438265 () tuple4!1182)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304266 (= res!250303 (byteRangesEq!0 (select (arr!9103 a1!948) (_3!1548 lt!438265)) (select (arr!9103 a2!948) (_3!1548 lt!438265)) lt!438266 #b00000000000000000000000000000111))))

(assert (=> b!304266 (=> (not res!250303) (not e!219023))))

(declare-fun res!250305 () Bool)

(declare-fun e!219031 () Bool)

(assert (=> start!67794 (=> (not res!250305) (not e!219031))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67794 (= res!250305 (and (bvsle (size!8020 a1!948) (size!8020 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67794 e!219031))

(assert (=> start!67794 true))

(declare-fun array_inv!7632 (array!18488) Bool)

(assert (=> start!67794 (array_inv!7632 a1!948)))

(assert (=> start!67794 (array_inv!7632 a2!948)))

(declare-fun b!304267 () Bool)

(declare-fun e!219025 () Bool)

(assert (=> b!304267 (= e!219031 e!219025)))

(declare-fun res!250302 () Bool)

(assert (=> b!304267 (=> (not res!250302) (not e!219025))))

(declare-fun lt!438264 () (_ BitVec 64))

(assert (=> b!304267 (= res!250302 (and (bvsle toBit!258 lt!438264) (bvsle fromBit!258 lt!438264)))))

(assert (=> b!304267 (= lt!438264 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8020 a1!948))))))

(declare-fun b!304268 () Bool)

(declare-datatypes ((Unit!21241 0))(
  ( (Unit!21242) )
))
(declare-fun e!219027 () Unit!21241)

(declare-fun lt!438261 () Unit!21241)

(assert (=> b!304268 (= e!219027 lt!438261)))

(declare-fun lt!438262 () tuple4!1182)

(declare-fun arrayRangesEqSlicedLemma!244 (array!18488 array!18488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21241)

(assert (=> b!304268 (= lt!438261 (arrayRangesEqSlicedLemma!244 a1!948 a2!948 (_1!13246 lt!438265) (_2!13246 lt!438265) (_1!13246 lt!438262) (_2!13246 lt!438262)))))

(declare-fun arrayRangesEq!1649 (array!18488 array!18488 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304268 (arrayRangesEq!1649 a1!948 a2!948 (_1!13246 lt!438262) (_2!13246 lt!438262))))

(declare-fun b!304269 () Bool)

(declare-fun res!250304 () Bool)

(assert (=> b!304269 (=> (not res!250304) (not e!219025))))

(declare-fun arrayBitRangesEq!0 (array!18488 array!18488 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304269 (= res!250304 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun c!14564 () Bool)

(declare-fun lt!438263 () (_ BitVec 32))

(declare-fun bm!5648 () Bool)

(declare-fun call!5651 () Bool)

(assert (=> bm!5648 (= call!5651 (byteRangesEq!0 (ite c!14564 (select (arr!9103 a1!948) (_3!1548 lt!438265)) (select (arr!9103 a1!948) (_4!591 lt!438265))) (ite c!14564 (select (arr!9103 a2!948) (_3!1548 lt!438265)) (select (arr!9103 a2!948) (_4!591 lt!438265))) (ite c!14564 lt!438266 #b00000000000000000000000000000000) lt!438263))))

(declare-fun b!304270 () Bool)

(assert (=> b!304270 (= e!219029 call!5651)))

(declare-fun b!304271 () Bool)

(declare-fun e!219030 () Bool)

(assert (=> b!304271 (= e!219030 call!5651)))

(declare-fun e!219026 () Bool)

(declare-fun b!304272 () Bool)

(assert (=> b!304272 (= e!219026 (and (bvslt (_3!1548 lt!438265) (_3!1548 lt!438262)) (bvslt (_3!1548 lt!438262) (_4!591 lt!438265)) (bvsle #b00000000000000000000000000000000 (_1!13246 lt!438265)) (bvsle (_1!13246 lt!438265) (_2!13246 lt!438265)) (bvsle (_2!13246 lt!438265) (size!8020 a1!948)) (or (bvsgt (_1!13246 lt!438265) (_3!1548 lt!438262)) (bvsge (_3!1548 lt!438262) (_2!13246 lt!438265)))))))

(declare-fun b!304273 () Bool)

(declare-fun res!250306 () Bool)

(assert (=> b!304273 (=> (not res!250306) (not e!219025))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304273 (= res!250306 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438264) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304274 () Bool)

(assert (=> b!304274 (= e!219025 e!219026)))

(declare-fun res!250307 () Bool)

(assert (=> b!304274 (=> (not res!250307) (not e!219026))))

(assert (=> b!304274 (= res!250307 e!219029)))

(assert (=> b!304274 (= c!14564 (= (_3!1548 lt!438265) (_4!591 lt!438265)))))

(declare-fun lt!438267 () Unit!21241)

(assert (=> b!304274 (= lt!438267 e!219027)))

(declare-fun c!14565 () Bool)

(assert (=> b!304274 (= c!14565 (bvslt (_1!13246 lt!438262) (_2!13246 lt!438262)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1182)

(assert (=> b!304274 (= lt!438262 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304274 (= lt!438263 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304274 (= lt!438266 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304274 (= lt!438265 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304275 () Bool)

(declare-fun res!250308 () Bool)

(assert (=> b!304275 (= res!250308 (= lt!438263 #b00000000000000000000000000000000))))

(assert (=> b!304275 (=> res!250308 e!219030)))

(assert (=> b!304275 (= e!219023 e!219030)))

(declare-fun b!304276 () Bool)

(declare-fun Unit!21243 () Unit!21241)

(assert (=> b!304276 (= e!219027 Unit!21243)))

(assert (= (and start!67794 res!250305) b!304267))

(assert (= (and b!304267 res!250302) b!304269))

(assert (= (and b!304269 res!250304) b!304273))

(assert (= (and b!304273 res!250306) b!304274))

(assert (= (and b!304274 c!14565) b!304268))

(assert (= (and b!304274 (not c!14565)) b!304276))

(assert (= (and b!304274 c!14564) b!304270))

(assert (= (and b!304274 (not c!14564)) b!304266))

(assert (= (and b!304266 res!250303) b!304275))

(assert (= (and b!304275 (not res!250308)) b!304271))

(assert (= (or b!304270 b!304271) bm!5648))

(assert (= (and b!304274 res!250307) b!304272))

(declare-fun m!442779 () Bool)

(assert (=> b!304268 m!442779))

(declare-fun m!442781 () Bool)

(assert (=> b!304268 m!442781))

(declare-fun m!442783 () Bool)

(assert (=> start!67794 m!442783))

(declare-fun m!442785 () Bool)

(assert (=> start!67794 m!442785))

(declare-fun m!442787 () Bool)

(assert (=> bm!5648 m!442787))

(declare-fun m!442789 () Bool)

(assert (=> bm!5648 m!442789))

(declare-fun m!442791 () Bool)

(assert (=> bm!5648 m!442791))

(declare-fun m!442793 () Bool)

(assert (=> bm!5648 m!442793))

(declare-fun m!442795 () Bool)

(assert (=> bm!5648 m!442795))

(declare-fun m!442797 () Bool)

(assert (=> b!304269 m!442797))

(assert (=> b!304266 m!442787))

(assert (=> b!304266 m!442793))

(assert (=> b!304266 m!442787))

(assert (=> b!304266 m!442793))

(declare-fun m!442799 () Bool)

(assert (=> b!304266 m!442799))

(declare-fun m!442801 () Bool)

(assert (=> b!304274 m!442801))

(declare-fun m!442803 () Bool)

(assert (=> b!304274 m!442803))

(push 1)

(assert (not start!67794))

(assert (not bm!5648))

(assert (not b!304274))

(assert (not b!304268))

(assert (not b!304269))

(assert (not b!304266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101628 () Bool)

(assert (=> d!101628 (= (byteRangesEq!0 (select (arr!9103 a1!948) (_3!1548 lt!438265)) (select (arr!9103 a2!948) (_3!1548 lt!438265)) lt!438266 #b00000000000000000000000000000111) (or (= lt!438266 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9103 a1!948) (_3!1548 lt!438265))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438266)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9103 a2!948) (_3!1548 lt!438265))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438266)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26193 () Bool)

(assert (= bs!26193 d!101628))

(declare-fun m!442887 () Bool)

(assert (=> bs!26193 m!442887))

(declare-fun m!442889 () Bool)

(assert (=> bs!26193 m!442889))

(assert (=> b!304266 d!101628))

(declare-fun d!101632 () Bool)

(assert (=> d!101632 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1183 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304274 d!101632))

(declare-fun d!101634 () Bool)

(assert (=> d!101634 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1183 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304274 d!101634))

(declare-fun d!101636 () Bool)

(assert (=> d!101636 (= (array_inv!7632 a1!948) (bvsge (size!8020 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67794 d!101636))

(declare-fun d!101638 () Bool)

(assert (=> d!101638 (= (array_inv!7632 a2!948) (bvsge (size!8020 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67794 d!101638))

(declare-fun d!101640 () Bool)

(assert (=> d!101640 (= (byteRangesEq!0 (ite c!14564 (select (arr!9103 a1!948) (_3!1548 lt!438265)) (select (arr!9103 a1!948) (_4!591 lt!438265))) (ite c!14564 (select (arr!9103 a2!948) (_3!1548 lt!438265)) (select (arr!9103 a2!948) (_4!591 lt!438265))) (ite c!14564 lt!438266 #b00000000000000000000000000000000) lt!438263) (or (= (ite c!14564 lt!438266 #b00000000000000000000000000000000) lt!438263) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14564 (select (arr!9103 a1!948) (_3!1548 lt!438265)) (select (arr!9103 a1!948) (_4!591 lt!438265)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438263))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14564 lt!438266 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14564 (select (arr!9103 a2!948) (_3!1548 lt!438265)) (select (arr!9103 a2!948) (_4!591 lt!438265)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438263))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14564 lt!438266 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26194 () Bool)

(assert (= bs!26194 d!101640))

(declare-fun m!442891 () Bool)

(assert (=> bs!26194 m!442891))

(declare-fun m!442893 () Bool)

(assert (=> bs!26194 m!442893))

(assert (=> bm!5648 d!101640))

(declare-fun lt!438328 () (_ BitVec 32))

(declare-fun b!304384 () Bool)

(declare-fun lt!438329 () tuple4!1182)

(declare-fun e!219124 () Bool)

(assert (=> b!304384 (= e!219124 (byteRangesEq!0 (select (arr!9103 a1!948) (_4!591 lt!438329)) (select (arr!9103 a2!948) (_4!591 lt!438329)) #b00000000000000000000000000000000 lt!438328))))

(declare-fun c!14583 () Bool)

(declare-fun bm!5660 () Bool)

(declare-fun lt!438330 () (_ BitVec 32))

(declare-fun call!5663 () Bool)

(assert (=> bm!5660 (= call!5663 (byteRangesEq!0 (select (arr!9103 a1!948) (_3!1548 lt!438329)) (select (arr!9103 a2!948) (_3!1548 lt!438329)) lt!438330 (ite c!14583 lt!438328 #b00000000000000000000000000001000)))))

(declare-fun b!304385 () Bool)

(declare-fun e!219127 () Bool)

(declare-fun e!219125 () Bool)

(assert (=> b!304385 (= e!219127 e!219125)))

(declare-fun res!250385 () Bool)

(assert (=> b!304385 (=> (not res!250385) (not e!219125))))

(declare-fun e!219123 () Bool)

(assert (=> b!304385 (= res!250385 e!219123)))

(declare-fun res!250384 () Bool)

(assert (=> b!304385 (=> res!250384 e!219123)))

(assert (=> b!304385 (= res!250384 (bvsge (_1!13246 lt!438329) (_2!13246 lt!438329)))))

(assert (=> b!304385 (= lt!438328 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304385 (= lt!438330 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304385 (= lt!438329 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304386 () Bool)

(declare-fun e!219122 () Bool)

(assert (=> b!304386 (= e!219122 call!5663)))

(declare-fun d!101642 () Bool)

(declare-fun res!250386 () Bool)

(assert (=> d!101642 (=> res!250386 e!219127)))

(assert (=> d!101642 (= res!250386 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101642 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219127)))

(declare-fun b!304387 () Bool)

(declare-fun res!250383 () Bool)

(assert (=> b!304387 (= res!250383 (= lt!438328 #b00000000000000000000000000000000))))

(assert (=> b!304387 (=> res!250383 e!219124)))

(declare-fun e!219126 () Bool)

(assert (=> b!304387 (= e!219126 e!219124)))

(declare-fun b!304388 () Bool)

(assert (=> b!304388 (= e!219125 e!219122)))

(assert (=> b!304388 (= c!14583 (= (_3!1548 lt!438329) (_4!591 lt!438329)))))

(declare-fun b!304389 () Bool)

(assert (=> b!304389 (= e!219122 e!219126)))

(declare-fun res!250382 () Bool)

(assert (=> b!304389 (= res!250382 call!5663)))

(assert (=> b!304389 (=> (not res!250382) (not e!219126))))

(declare-fun b!304390 () Bool)

(assert (=> b!304390 (= e!219123 (arrayRangesEq!1649 a1!948 a2!948 (_1!13246 lt!438329) (_2!13246 lt!438329)))))

(assert (= (and d!101642 (not res!250386)) b!304385))

(assert (= (and b!304385 (not res!250384)) b!304390))

(assert (= (and b!304385 res!250385) b!304388))

(assert (= (and b!304388 c!14583) b!304386))

(assert (= (and b!304388 (not c!14583)) b!304389))

(assert (= (and b!304389 res!250382) b!304387))

(assert (= (and b!304387 (not res!250383)) b!304384))

(assert (= (or b!304386 b!304389) bm!5660))

(declare-fun m!442895 () Bool)

(assert (=> b!304384 m!442895))

(declare-fun m!442897 () Bool)

(assert (=> b!304384 m!442897))

(assert (=> b!304384 m!442895))

(assert (=> b!304384 m!442897))

(declare-fun m!442899 () Bool)

(assert (=> b!304384 m!442899))

(declare-fun m!442901 () Bool)

(assert (=> bm!5660 m!442901))

(declare-fun m!442903 () Bool)

(assert (=> bm!5660 m!442903))

(assert (=> bm!5660 m!442901))

(assert (=> bm!5660 m!442903))

(declare-fun m!442905 () Bool)

(assert (=> bm!5660 m!442905))

(assert (=> b!304385 m!442803))

(declare-fun m!442907 () Bool)

(assert (=> b!304390 m!442907))

(assert (=> b!304269 d!101642))

(declare-fun d!101654 () Bool)

(assert (=> d!101654 (arrayRangesEq!1649 a1!948 a2!948 (_1!13246 lt!438262) (_2!13246 lt!438262))))

(declare-fun lt!438333 () Unit!21241)

(declare-fun choose!573 (array!18488 array!18488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21241)

(assert (=> d!101654 (= lt!438333 (choose!573 a1!948 a2!948 (_1!13246 lt!438265) (_2!13246 lt!438265) (_1!13246 lt!438262) (_2!13246 lt!438262)))))

(assert (=> d!101654 (and (bvsle #b00000000000000000000000000000000 (_1!13246 lt!438265)) (bvsle (_1!13246 lt!438265) (_2!13246 lt!438265)))))

(assert (=> d!101654 (= (arrayRangesEqSlicedLemma!244 a1!948 a2!948 (_1!13246 lt!438265) (_2!13246 lt!438265) (_1!13246 lt!438262) (_2!13246 lt!438262)) lt!438333)))

(declare-fun bs!26195 () Bool)

(assert (= bs!26195 d!101654))

(assert (=> bs!26195 m!442781))

(declare-fun m!442909 () Bool)

(assert (=> bs!26195 m!442909))

(assert (=> b!304268 d!101654))

(declare-fun d!101656 () Bool)

(declare-fun res!250391 () Bool)

(declare-fun e!219132 () Bool)

(assert (=> d!101656 (=> res!250391 e!219132)))

(assert (=> d!101656 (= res!250391 (= (_1!13246 lt!438262) (_2!13246 lt!438262)))))

(assert (=> d!101656 (= (arrayRangesEq!1649 a1!948 a2!948 (_1!13246 lt!438262) (_2!13246 lt!438262)) e!219132)))

(declare-fun b!304395 () Bool)

(declare-fun e!219133 () Bool)

(assert (=> b!304395 (= e!219132 e!219133)))

(declare-fun res!250392 () Bool)

(assert (=> b!304395 (=> (not res!250392) (not e!219133))))

(assert (=> b!304395 (= res!250392 (= (select (arr!9103 a1!948) (_1!13246 lt!438262)) (select (arr!9103 a2!948) (_1!13246 lt!438262))))))

(declare-fun b!304396 () Bool)

(assert (=> b!304396 (= e!219133 (arrayRangesEq!1649 a1!948 a2!948 (bvadd (_1!13246 lt!438262) #b00000000000000000000000000000001) (_2!13246 lt!438262)))))

(assert (= (and d!101656 (not res!250391)) b!304395))

(assert (= (and b!304395 res!250392) b!304396))

(declare-fun m!442915 () Bool)

(assert (=> b!304395 m!442915))

(declare-fun m!442917 () Bool)

(assert (=> b!304395 m!442917))

(declare-fun m!442919 () Bool)

(assert (=> b!304396 m!442919))

(assert (=> b!304268 d!101656))

(push 1)

(assert (not d!101654))

(assert (not b!304396))

(assert (not b!304385))

(assert (not bm!5660))

(assert (not b!304390))

(assert (not b!304384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


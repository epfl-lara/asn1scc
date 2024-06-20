; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67400 () Bool)

(assert start!67400)

(declare-fun b!302682 () Bool)

(declare-fun res!249120 () Bool)

(declare-fun e!217657 () Bool)

(assert (=> b!302682 (=> (not res!249120) (not e!217657))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437371 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302682 (= res!249120 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437371) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302680 () Bool)

(declare-fun e!217658 () Bool)

(assert (=> b!302680 (= e!217658 e!217657)))

(declare-fun res!249123 () Bool)

(assert (=> b!302680 (=> (not res!249123) (not e!217657))))

(assert (=> b!302680 (= res!249123 (and (bvsle toBit!258 lt!437371) (bvsle fromBit!258 lt!437371)))))

(declare-datatypes ((array!18385 0))(
  ( (array!18386 (arr!9068 (Array (_ BitVec 32) (_ BitVec 8))) (size!7985 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18385)

(assert (=> b!302680 (= lt!437371 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7985 a1!948))))))

(declare-fun b!302681 () Bool)

(declare-fun res!249122 () Bool)

(assert (=> b!302681 (=> (not res!249122) (not e!217657))))

(declare-fun a2!948 () array!18385)

(declare-fun arrayBitRangesEq!0 (array!18385 array!18385 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302681 (= res!249122 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-datatypes ((tuple4!1112 0))(
  ( (tuple4!1113 (_1!13211 (_ BitVec 32)) (_2!13211 (_ BitVec 32)) (_3!1513 (_ BitVec 32)) (_4!556 (_ BitVec 32))) )
))
(declare-fun lt!437372 () tuple4!1112)

(declare-fun lt!437373 () tuple4!1112)

(declare-fun b!302683 () Bool)

(assert (=> b!302683 (= e!217657 (and (bvslt (_1!13211 lt!437373) (_2!13211 lt!437373)) (bvsle #b00000000000000000000000000000000 (_1!13211 lt!437372)) (bvsle (_1!13211 lt!437372) (_2!13211 lt!437372)) (bvsgt (_2!13211 lt!437372) (size!7985 a1!948))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1112)

(assert (=> b!302683 (= lt!437373 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302683 (= lt!437372 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!249121 () Bool)

(assert (=> start!67400 (=> (not res!249121) (not e!217658))))

(assert (=> start!67400 (= res!249121 (and (bvsle (size!7985 a1!948) (size!7985 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67400 e!217658))

(assert (=> start!67400 true))

(declare-fun array_inv!7597 (array!18385) Bool)

(assert (=> start!67400 (array_inv!7597 a1!948)))

(assert (=> start!67400 (array_inv!7597 a2!948)))

(assert (= (and start!67400 res!249121) b!302680))

(assert (= (and b!302680 res!249123) b!302681))

(assert (= (and b!302681 res!249122) b!302682))

(assert (= (and b!302682 res!249120) b!302683))

(declare-fun m!441463 () Bool)

(assert (=> b!302681 m!441463))

(declare-fun m!441465 () Bool)

(assert (=> b!302683 m!441465))

(declare-fun m!441467 () Bool)

(assert (=> b!302683 m!441467))

(declare-fun m!441469 () Bool)

(assert (=> start!67400 m!441469))

(declare-fun m!441471 () Bool)

(assert (=> start!67400 m!441471))

(check-sat (not start!67400) (not b!302681) (not b!302683))
(check-sat)
(get-model)

(declare-fun d!101120 () Bool)

(assert (=> d!101120 (= (array_inv!7597 a1!948) (bvsge (size!7985 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67400 d!101120))

(declare-fun d!101122 () Bool)

(assert (=> d!101122 (= (array_inv!7597 a2!948) (bvsge (size!7985 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67400 d!101122))

(declare-fun b!302710 () Bool)

(declare-fun e!217688 () Bool)

(declare-fun e!217685 () Bool)

(assert (=> b!302710 (= e!217688 e!217685)))

(declare-fun res!249148 () Bool)

(declare-fun call!5534 () Bool)

(assert (=> b!302710 (= res!249148 call!5534)))

(assert (=> b!302710 (=> (not res!249148) (not e!217685))))

(declare-fun d!101124 () Bool)

(declare-fun res!249147 () Bool)

(declare-fun e!217686 () Bool)

(assert (=> d!101124 (=> res!249147 e!217686)))

(assert (=> d!101124 (= res!249147 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101124 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217686)))

(declare-fun e!217689 () Bool)

(declare-fun lt!437391 () tuple4!1112)

(declare-fun b!302711 () Bool)

(declare-fun arrayRangesEq!1613 (array!18385 array!18385 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302711 (= e!217689 (arrayRangesEq!1613 a1!948 a2!948 (_1!13211 lt!437391) (_2!13211 lt!437391)))))

(declare-fun b!302712 () Bool)

(declare-fun e!217690 () Bool)

(assert (=> b!302712 (= e!217686 e!217690)))

(declare-fun res!249146 () Bool)

(assert (=> b!302712 (=> (not res!249146) (not e!217690))))

(assert (=> b!302712 (= res!249146 e!217689)))

(declare-fun res!249149 () Bool)

(assert (=> b!302712 (=> res!249149 e!217689)))

(assert (=> b!302712 (= res!249149 (bvsge (_1!13211 lt!437391) (_2!13211 lt!437391)))))

(declare-fun lt!437390 () (_ BitVec 32))

(assert (=> b!302712 (= lt!437390 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437389 () (_ BitVec 32))

(assert (=> b!302712 (= lt!437389 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302712 (= lt!437391 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5531 () Bool)

(declare-fun c!14364 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5531 (= call!5534 (byteRangesEq!0 (select (arr!9068 a1!948) (_3!1513 lt!437391)) (select (arr!9068 a2!948) (_3!1513 lt!437391)) lt!437389 (ite c!14364 lt!437390 #b00000000000000000000000000001000)))))

(declare-fun b!302713 () Bool)

(declare-fun res!249150 () Bool)

(assert (=> b!302713 (= res!249150 (= lt!437390 #b00000000000000000000000000000000))))

(declare-fun e!217687 () Bool)

(assert (=> b!302713 (=> res!249150 e!217687)))

(assert (=> b!302713 (= e!217685 e!217687)))

(declare-fun b!302714 () Bool)

(assert (=> b!302714 (= e!217688 call!5534)))

(declare-fun b!302715 () Bool)

(assert (=> b!302715 (= e!217687 (byteRangesEq!0 (select (arr!9068 a1!948) (_4!556 lt!437391)) (select (arr!9068 a2!948) (_4!556 lt!437391)) #b00000000000000000000000000000000 lt!437390))))

(declare-fun b!302716 () Bool)

(assert (=> b!302716 (= e!217690 e!217688)))

(assert (=> b!302716 (= c!14364 (= (_3!1513 lt!437391) (_4!556 lt!437391)))))

(assert (= (and d!101124 (not res!249147)) b!302712))

(assert (= (and b!302712 (not res!249149)) b!302711))

(assert (= (and b!302712 res!249146) b!302716))

(assert (= (and b!302716 c!14364) b!302714))

(assert (= (and b!302716 (not c!14364)) b!302710))

(assert (= (and b!302710 res!249148) b!302713))

(assert (= (and b!302713 (not res!249150)) b!302715))

(assert (= (or b!302714 b!302710) bm!5531))

(declare-fun m!441483 () Bool)

(assert (=> b!302711 m!441483))

(assert (=> b!302712 m!441467))

(declare-fun m!441485 () Bool)

(assert (=> bm!5531 m!441485))

(declare-fun m!441487 () Bool)

(assert (=> bm!5531 m!441487))

(assert (=> bm!5531 m!441485))

(assert (=> bm!5531 m!441487))

(declare-fun m!441489 () Bool)

(assert (=> bm!5531 m!441489))

(declare-fun m!441491 () Bool)

(assert (=> b!302715 m!441491))

(declare-fun m!441493 () Bool)

(assert (=> b!302715 m!441493))

(assert (=> b!302715 m!441491))

(assert (=> b!302715 m!441493))

(declare-fun m!441495 () Bool)

(assert (=> b!302715 m!441495))

(assert (=> b!302681 d!101124))

(declare-fun d!101136 () Bool)

(assert (=> d!101136 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1113 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302683 d!101136))

(declare-fun d!101144 () Bool)

(assert (=> d!101144 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1113 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302683 d!101144))

(check-sat (not b!302712) (not bm!5531) (not b!302715) (not b!302711))
(check-sat)

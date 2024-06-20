; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67376 () Bool)

(assert start!67376)

(declare-fun b!302583 () Bool)

(declare-fun res!249042 () Bool)

(declare-fun e!217570 () Bool)

(assert (=> b!302583 (=> (not res!249042) (not e!217570))))

(declare-fun lt!437319 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302583 (= res!249042 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437319) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302582 () Bool)

(declare-fun res!249040 () Bool)

(assert (=> b!302582 (=> (not res!249040) (not e!217570))))

(declare-datatypes ((array!18376 0))(
  ( (array!18377 (arr!9065 (Array (_ BitVec 32) (_ BitVec 8))) (size!7982 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18376)

(declare-fun a2!948 () array!18376)

(declare-fun arrayBitRangesEq!0 (array!18376 array!18376 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302582 (= res!249040 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!249041 () Bool)

(declare-fun e!217569 () Bool)

(assert (=> start!67376 (=> (not res!249041) (not e!217569))))

(assert (=> start!67376 (= res!249041 (and (bvsle (size!7982 a1!948) (size!7982 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67376 e!217569))

(assert (=> start!67376 true))

(declare-fun array_inv!7594 (array!18376) Bool)

(assert (=> start!67376 (array_inv!7594 a1!948)))

(assert (=> start!67376 (array_inv!7594 a2!948)))

(declare-fun b!302581 () Bool)

(assert (=> b!302581 (= e!217569 e!217570)))

(declare-fun res!249039 () Bool)

(assert (=> b!302581 (=> (not res!249039) (not e!217570))))

(assert (=> b!302581 (= res!249039 (and (bvsle toBit!258 lt!437319) (bvsle fromBit!258 lt!437319)))))

(assert (=> b!302581 (= lt!437319 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7982 a1!948))))))

(declare-fun b!302584 () Bool)

(declare-datatypes ((tuple4!1106 0))(
  ( (tuple4!1107 (_1!13208 (_ BitVec 32)) (_2!13208 (_ BitVec 32)) (_3!1510 (_ BitVec 32)) (_4!553 (_ BitVec 32))) )
))
(declare-fun lt!437318 () tuple4!1106)

(declare-fun lt!437317 () tuple4!1106)

(assert (=> b!302584 (= e!217570 (and (bvslt (_1!13208 lt!437318) (_2!13208 lt!437318)) (or (bvsgt #b00000000000000000000000000000000 (_1!13208 lt!437317)) (bvsgt (_1!13208 lt!437317) (_2!13208 lt!437317)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1106)

(assert (=> b!302584 (= lt!437318 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302584 (= lt!437317 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!67376 res!249041) b!302581))

(assert (= (and b!302581 res!249039) b!302582))

(assert (= (and b!302582 res!249040) b!302583))

(assert (= (and b!302583 res!249042) b!302584))

(declare-fun m!441391 () Bool)

(assert (=> b!302582 m!441391))

(declare-fun m!441393 () Bool)

(assert (=> start!67376 m!441393))

(declare-fun m!441395 () Bool)

(assert (=> start!67376 m!441395))

(declare-fun m!441397 () Bool)

(assert (=> b!302584 m!441397))

(declare-fun m!441399 () Bool)

(assert (=> b!302584 m!441399))

(check-sat (not b!302584) (not b!302582) (not start!67376))
(check-sat)
(get-model)

(declare-fun d!101088 () Bool)

(assert (=> d!101088 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1107 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302584 d!101088))

(declare-fun d!101090 () Bool)

(assert (=> d!101090 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1107 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302584 d!101090))

(declare-fun e!217595 () Bool)

(declare-fun lt!437335 () tuple4!1106)

(declare-fun b!302611 () Bool)

(declare-fun arrayRangesEq!1610 (array!18376 array!18376 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302611 (= e!217595 (arrayRangesEq!1610 a1!948 a2!948 (_1!13208 lt!437335) (_2!13208 lt!437335)))))

(declare-fun b!302612 () Bool)

(declare-fun e!217596 () Bool)

(declare-fun e!217597 () Bool)

(assert (=> b!302612 (= e!217596 e!217597)))

(declare-fun c!14355 () Bool)

(assert (=> b!302612 (= c!14355 (= (_3!1510 lt!437335) (_4!553 lt!437335)))))

(declare-fun lt!437336 () (_ BitVec 32))

(declare-fun b!302613 () Bool)

(declare-fun e!217598 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302613 (= e!217598 (byteRangesEq!0 (select (arr!9065 a1!948) (_4!553 lt!437335)) (select (arr!9065 a2!948) (_4!553 lt!437335)) #b00000000000000000000000000000000 lt!437336))))

(declare-fun b!302614 () Bool)

(declare-fun res!249068 () Bool)

(assert (=> b!302614 (= res!249068 (= lt!437336 #b00000000000000000000000000000000))))

(assert (=> b!302614 (=> res!249068 e!217598)))

(declare-fun e!217600 () Bool)

(assert (=> b!302614 (= e!217600 e!217598)))

(declare-fun b!302615 () Bool)

(declare-fun call!5525 () Bool)

(assert (=> b!302615 (= e!217597 call!5525)))

(declare-fun bm!5522 () Bool)

(declare-fun lt!437337 () (_ BitVec 32))

(assert (=> bm!5522 (= call!5525 (byteRangesEq!0 (select (arr!9065 a1!948) (_3!1510 lt!437335)) (select (arr!9065 a2!948) (_3!1510 lt!437335)) lt!437337 (ite c!14355 lt!437336 #b00000000000000000000000000001000)))))

(declare-fun b!302616 () Bool)

(assert (=> b!302616 (= e!217597 e!217600)))

(declare-fun res!249066 () Bool)

(assert (=> b!302616 (= res!249066 call!5525)))

(assert (=> b!302616 (=> (not res!249066) (not e!217600))))

(declare-fun b!302617 () Bool)

(declare-fun e!217599 () Bool)

(assert (=> b!302617 (= e!217599 e!217596)))

(declare-fun res!249067 () Bool)

(assert (=> b!302617 (=> (not res!249067) (not e!217596))))

(assert (=> b!302617 (= res!249067 e!217595)))

(declare-fun res!249065 () Bool)

(assert (=> b!302617 (=> res!249065 e!217595)))

(assert (=> b!302617 (= res!249065 (bvsge (_1!13208 lt!437335) (_2!13208 lt!437335)))))

(assert (=> b!302617 (= lt!437336 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302617 (= lt!437337 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302617 (= lt!437335 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101092 () Bool)

(declare-fun res!249069 () Bool)

(assert (=> d!101092 (=> res!249069 e!217599)))

(assert (=> d!101092 (= res!249069 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101092 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217599)))

(assert (= (and d!101092 (not res!249069)) b!302617))

(assert (= (and b!302617 (not res!249065)) b!302611))

(assert (= (and b!302617 res!249067) b!302612))

(assert (= (and b!302612 c!14355) b!302615))

(assert (= (and b!302612 (not c!14355)) b!302616))

(assert (= (and b!302616 res!249066) b!302614))

(assert (= (and b!302614 (not res!249068)) b!302613))

(assert (= (or b!302615 b!302616) bm!5522))

(declare-fun m!441411 () Bool)

(assert (=> b!302611 m!441411))

(declare-fun m!441413 () Bool)

(assert (=> b!302613 m!441413))

(declare-fun m!441415 () Bool)

(assert (=> b!302613 m!441415))

(assert (=> b!302613 m!441413))

(assert (=> b!302613 m!441415))

(declare-fun m!441417 () Bool)

(assert (=> b!302613 m!441417))

(declare-fun m!441419 () Bool)

(assert (=> bm!5522 m!441419))

(declare-fun m!441421 () Bool)

(assert (=> bm!5522 m!441421))

(assert (=> bm!5522 m!441419))

(assert (=> bm!5522 m!441421))

(declare-fun m!441423 () Bool)

(assert (=> bm!5522 m!441423))

(assert (=> b!302617 m!441399))

(assert (=> b!302582 d!101092))

(declare-fun d!101096 () Bool)

(assert (=> d!101096 (= (array_inv!7594 a1!948) (bvsge (size!7982 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67376 d!101096))

(declare-fun d!101102 () Bool)

(assert (=> d!101102 (= (array_inv!7594 a2!948) (bvsge (size!7982 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67376 d!101102))

(check-sat (not b!302611) (not bm!5522) (not b!302613) (not b!302617))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67378 () Bool)

(assert start!67378)

(declare-fun b!302594 () Bool)

(declare-fun res!249052 () Bool)

(declare-fun e!217580 () Bool)

(assert (=> b!302594 (=> (not res!249052) (not e!217580))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18378 0))(
  ( (array!18379 (arr!9066 (Array (_ BitVec 32) (_ BitVec 8))) (size!7983 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18378)

(declare-fun a2!948 () array!18378)

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18378 array!18378 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302594 (= res!249052 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302593 () Bool)

(declare-fun e!217581 () Bool)

(assert (=> b!302593 (= e!217581 e!217580)))

(declare-fun res!249054 () Bool)

(assert (=> b!302593 (=> (not res!249054) (not e!217580))))

(declare-fun lt!437326 () (_ BitVec 64))

(assert (=> b!302593 (= res!249054 (and (bvsle toBit!258 lt!437326) (bvsle fromBit!258 lt!437326)))))

(assert (=> b!302593 (= lt!437326 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7983 a1!948))))))

(declare-fun res!249051 () Bool)

(assert (=> start!67378 (=> (not res!249051) (not e!217581))))

(assert (=> start!67378 (= res!249051 (and (bvsle (size!7983 a1!948) (size!7983 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67378 e!217581))

(assert (=> start!67378 true))

(declare-fun array_inv!7595 (array!18378) Bool)

(assert (=> start!67378 (array_inv!7595 a1!948)))

(assert (=> start!67378 (array_inv!7595 a2!948)))

(declare-fun b!302595 () Bool)

(declare-fun res!249053 () Bool)

(assert (=> b!302595 (=> (not res!249053) (not e!217580))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302595 (= res!249053 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437326) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302596 () Bool)

(declare-datatypes ((tuple4!1108 0))(
  ( (tuple4!1109 (_1!13209 (_ BitVec 32)) (_2!13209 (_ BitVec 32)) (_3!1511 (_ BitVec 32)) (_4!554 (_ BitVec 32))) )
))
(declare-fun lt!437327 () tuple4!1108)

(declare-fun lt!437328 () tuple4!1108)

(assert (=> b!302596 (= e!217580 (and (bvslt (_1!13209 lt!437327) (_2!13209 lt!437327)) (or (bvsgt #b00000000000000000000000000000000 (_1!13209 lt!437328)) (bvsgt (_1!13209 lt!437328) (_2!13209 lt!437328)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1108)

(assert (=> b!302596 (= lt!437327 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302596 (= lt!437328 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!67378 res!249051) b!302593))

(assert (= (and b!302593 res!249054) b!302594))

(assert (= (and b!302594 res!249052) b!302595))

(assert (= (and b!302595 res!249053) b!302596))

(declare-fun m!441401 () Bool)

(assert (=> b!302594 m!441401))

(declare-fun m!441403 () Bool)

(assert (=> start!67378 m!441403))

(declare-fun m!441405 () Bool)

(assert (=> start!67378 m!441405))

(declare-fun m!441407 () Bool)

(assert (=> b!302596 m!441407))

(declare-fun m!441409 () Bool)

(assert (=> b!302596 m!441409))

(push 1)

(assert (not b!302594))

(assert (not start!67378))

(assert (not b!302596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!302653 () Bool)

(declare-fun e!217634 () Bool)

(declare-fun call!5531 () Bool)

(assert (=> b!302653 (= e!217634 call!5531)))

(declare-fun d!101106 () Bool)

(declare-fun res!249097 () Bool)

(declare-fun e!217632 () Bool)

(assert (=> d!101106 (=> res!249097 e!217632)))

(assert (=> d!101106 (= res!249097 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101106 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217632)))

(declare-fun b!302654 () Bool)

(declare-fun e!217635 () Bool)

(assert (=> b!302654 (= e!217635 e!217634)))

(declare-fun c!14361 () Bool)

(declare-fun lt!437353 () tuple4!1108)

(assert (=> b!302654 (= c!14361 (= (_3!1511 lt!437353) (_4!554 lt!437353)))))

(declare-fun e!217631 () Bool)

(declare-fun b!302655 () Bool)

(declare-fun arrayRangesEq!1612 (array!18378 array!18378 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302655 (= e!217631 (arrayRangesEq!1612 a1!948 a2!948 (_1!13209 lt!437353) (_2!13209 lt!437353)))))

(declare-fun b!302656 () Bool)

(assert (=> b!302656 (= e!217632 e!217635)))

(declare-fun res!249098 () Bool)

(assert (=> b!302656 (=> (not res!249098) (not e!217635))))

(assert (=> b!302656 (= res!249098 e!217631)))

(declare-fun res!249095 () Bool)

(assert (=> b!302656 (=> res!249095 e!217631)))

(assert (=> b!302656 (= res!249095 (bvsge (_1!13209 lt!437353) (_2!13209 lt!437353)))))

(declare-fun lt!437355 () (_ BitVec 32))

(assert (=> b!302656 (= lt!437355 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437354 () (_ BitVec 32))

(assert (=> b!302656 (= lt!437354 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302656 (= lt!437353 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302657 () Bool)

(declare-fun res!249099 () Bool)

(assert (=> b!302657 (= res!249099 (= lt!437355 #b00000000000000000000000000000000))))

(declare-fun e!217636 () Bool)

(assert (=> b!302657 (=> res!249099 e!217636)))

(declare-fun e!217633 () Bool)

(assert (=> b!302657 (= e!217633 e!217636)))

(declare-fun bm!5528 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5528 (= call!5531 (byteRangesEq!0 (ite c!14361 (select (arr!9066 a1!948) (_3!1511 lt!437353)) (select (arr!9066 a1!948) (_4!554 lt!437353))) (ite c!14361 (select (arr!9066 a2!948) (_3!1511 lt!437353)) (select (arr!9066 a2!948) (_4!554 lt!437353))) (ite c!14361 lt!437354 #b00000000000000000000000000000000) lt!437355))))

(declare-fun b!302658 () Bool)

(assert (=> b!302658 (= e!217636 call!5531)))

(declare-fun b!302659 () Bool)

(assert (=> b!302659 (= e!217634 e!217633)))

(declare-fun res!249096 () Bool)

(assert (=> b!302659 (= res!249096 (byteRangesEq!0 (select (arr!9066 a1!948) (_3!1511 lt!437353)) (select (arr!9066 a2!948) (_3!1511 lt!437353)) lt!437354 #b00000000000000000000000000001000))))

(assert (=> b!302659 (=> (not res!249096) (not e!217633))))

(assert (= (and d!101106 (not res!249097)) b!302656))

(assert (= (and b!302656 (not res!249095)) b!302655))

(assert (= (and b!302656 res!249098) b!302654))

(assert (= (and b!302654 c!14361) b!302653))

(assert (= (and b!302654 (not c!14361)) b!302659))

(assert (= (and b!302659 res!249096) b!302657))

(assert (= (and b!302657 (not res!249099)) b!302658))

(assert (= (or b!302653 b!302658) bm!5528))

(declare-fun m!441439 () Bool)

(assert (=> b!302655 m!441439))

(assert (=> b!302656 m!441409))

(declare-fun m!441441 () Bool)

(assert (=> bm!5528 m!441441))

(declare-fun m!441443 () Bool)

(assert (=> bm!5528 m!441443))

(declare-fun m!441445 () Bool)

(assert (=> bm!5528 m!441445))

(declare-fun m!441447 () Bool)

(assert (=> bm!5528 m!441447))

(declare-fun m!441449 () Bool)

(assert (=> bm!5528 m!441449))

(assert (=> b!302659 m!441445))

(assert (=> b!302659 m!441449))

(assert (=> b!302659 m!441445))

(assert (=> b!302659 m!441449))

(declare-fun m!441451 () Bool)

(assert (=> b!302659 m!441451))

(assert (=> b!302594 d!101106))

(declare-fun d!101110 () Bool)

(assert (=> d!101110 (= (array_inv!7595 a1!948) (bvsge (size!7983 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67378 d!101110))

(declare-fun d!101112 () Bool)

(assert (=> d!101112 (= (array_inv!7595 a2!948) (bvsge (size!7983 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67378 d!101112))

(declare-fun d!101114 () Bool)

(assert (=> d!101114 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1109 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302596 d!101114))

(declare-fun d!101116 () Bool)

(assert (=> d!101116 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1109 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302596 d!101116))

(push 1)

(assert (not b!302659))

(assert (not b!302655))

(assert (not b!302656))

(assert (not bm!5528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


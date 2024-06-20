; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67374 () Bool)

(assert start!67374)

(declare-fun res!249029 () Bool)

(declare-fun e!217558 () Bool)

(assert (=> start!67374 (=> (not res!249029) (not e!217558))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18374 0))(
  ( (array!18375 (arr!9064 (Array (_ BitVec 32) (_ BitVec 8))) (size!7981 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18374)

(declare-fun a2!948 () array!18374)

(assert (=> start!67374 (= res!249029 (and (bvsle (size!7981 a1!948) (size!7981 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67374 e!217558))

(assert (=> start!67374 true))

(declare-fun array_inv!7593 (array!18374) Bool)

(assert (=> start!67374 (array_inv!7593 a1!948)))

(assert (=> start!67374 (array_inv!7593 a2!948)))

(declare-fun b!302570 () Bool)

(declare-fun res!249028 () Bool)

(declare-fun e!217556 () Bool)

(assert (=> b!302570 (=> (not res!249028) (not e!217556))))

(declare-fun arrayBitRangesEq!0 (array!18374 array!18374 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302570 (= res!249028 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302572 () Bool)

(declare-datatypes ((tuple4!1104 0))(
  ( (tuple4!1105 (_1!13207 (_ BitVec 32)) (_2!13207 (_ BitVec 32)) (_3!1509 (_ BitVec 32)) (_4!552 (_ BitVec 32))) )
))
(declare-fun lt!437309 () tuple4!1104)

(declare-fun lt!437308 () tuple4!1104)

(assert (=> b!302572 (= e!217556 (and (bvslt (_1!13207 lt!437309) (_2!13207 lt!437309)) (or (bvsgt #b00000000000000000000000000000000 (_1!13207 lt!437308)) (bvsgt (_1!13207 lt!437308) (_2!13207 lt!437308)))))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1104)

(assert (=> b!302572 (= lt!437309 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302572 (= lt!437308 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302569 () Bool)

(assert (=> b!302569 (= e!217558 e!217556)))

(declare-fun res!249027 () Bool)

(assert (=> b!302569 (=> (not res!249027) (not e!217556))))

(declare-fun lt!437310 () (_ BitVec 64))

(assert (=> b!302569 (= res!249027 (and (bvsle toBit!258 lt!437310) (bvsle fromBit!258 lt!437310)))))

(assert (=> b!302569 (= lt!437310 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7981 a1!948))))))

(declare-fun b!302571 () Bool)

(declare-fun res!249030 () Bool)

(assert (=> b!302571 (=> (not res!249030) (not e!217556))))

(assert (=> b!302571 (= res!249030 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437310) (not (= fromSlice!52 toSlice!52))))))

(assert (= (and start!67374 res!249029) b!302569))

(assert (= (and b!302569 res!249027) b!302570))

(assert (= (and b!302570 res!249028) b!302571))

(assert (= (and b!302571 res!249030) b!302572))

(declare-fun m!441381 () Bool)

(assert (=> start!67374 m!441381))

(declare-fun m!441383 () Bool)

(assert (=> start!67374 m!441383))

(declare-fun m!441385 () Bool)

(assert (=> b!302570 m!441385))

(declare-fun m!441387 () Bool)

(assert (=> b!302572 m!441387))

(declare-fun m!441389 () Bool)

(assert (=> b!302572 m!441389))

(push 1)

(assert (not b!302572))

(assert (not b!302570))

(assert (not start!67374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101094 () Bool)

(assert (=> d!101094 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1105 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302572 d!101094))

(declare-fun d!101098 () Bool)

(assert (=> d!101098 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1105 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302572 d!101098))

(declare-fun c!14358 () Bool)

(declare-fun call!5528 () Bool)

(declare-fun bm!5525 () Bool)

(declare-fun lt!437344 () (_ BitVec 32))

(declare-fun lt!437345 () tuple4!1104)

(declare-fun lt!437346 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5525 (= call!5528 (byteRangesEq!0 (ite c!14358 (select (arr!9064 a1!948) (_3!1509 lt!437345)) (select (arr!9064 a1!948) (_4!552 lt!437345))) (ite c!14358 (select (arr!9064 a2!948) (_3!1509 lt!437345)) (select (arr!9064 a2!948) (_4!552 lt!437345))) (ite c!14358 lt!437346 #b00000000000000000000000000000000) lt!437344))))

(declare-fun b!302632 () Bool)

(declare-fun e!217617 () Bool)

(assert (=> b!302632 (= e!217617 call!5528)))

(declare-fun b!302633 () Bool)

(declare-fun e!217615 () Bool)

(declare-fun e!217613 () Bool)

(assert (=> b!302633 (= e!217615 e!217613)))

(declare-fun res!249080 () Bool)

(assert (=> b!302633 (= res!249080 (byteRangesEq!0 (select (arr!9064 a1!948) (_3!1509 lt!437345)) (select (arr!9064 a2!948) (_3!1509 lt!437345)) lt!437346 #b00000000000000000000000000001000))))

(assert (=> b!302633 (=> (not res!249080) (not e!217613))))

(declare-fun b!302634 () Bool)

(declare-fun res!249082 () Bool)

(assert (=> b!302634 (= res!249082 (= lt!437344 #b00000000000000000000000000000000))))

(assert (=> b!302634 (=> res!249082 e!217617)))

(assert (=> b!302634 (= e!217613 e!217617)))

(declare-fun b!302636 () Bool)

(declare-fun e!217618 () Bool)

(assert (=> b!302636 (= e!217618 e!217615)))

(assert (=> b!302636 (= c!14358 (= (_3!1509 lt!437345) (_4!552 lt!437345)))))

(declare-fun b!302637 () Bool)

(declare-fun e!217614 () Bool)

(assert (=> b!302637 (= e!217614 e!217618)))

(declare-fun res!249081 () Bool)

(assert (=> b!302637 (=> (not res!249081) (not e!217618))))

(declare-fun e!217616 () Bool)

(assert (=> b!302637 (= res!249081 e!217616)))

(declare-fun res!249084 () Bool)

(assert (=> b!302637 (=> res!249084 e!217616)))

(assert (=> b!302637 (= res!249084 (bvsge (_1!13207 lt!437345) (_2!13207 lt!437345)))))

(assert (=> b!302637 (= lt!437344 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302637 (= lt!437346 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302637 (= lt!437345 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302638 () Bool)

(declare-fun arrayRangesEq!1611 (array!18374 array!18374 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302638 (= e!217616 (arrayRangesEq!1611 a1!948 a2!948 (_1!13207 lt!437345) (_2!13207 lt!437345)))))

(declare-fun b!302635 () Bool)

(assert (=> b!302635 (= e!217615 call!5528)))

(declare-fun d!101100 () Bool)

(declare-fun res!249083 () Bool)

(assert (=> d!101100 (=> res!249083 e!217614)))

(assert (=> d!101100 (= res!249083 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101100 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217614)))

(assert (= (and d!101100 (not res!249083)) b!302637))

(assert (= (and b!302637 (not res!249084)) b!302638))

(assert (= (and b!302637 res!249081) b!302636))

(assert (= (and b!302636 c!14358) b!302635))

(assert (= (and b!302636 (not c!14358)) b!302633))

(assert (= (and b!302633 res!249080) b!302634))

(assert (= (and b!302634 (not res!249082)) b!302632))

(assert (= (or b!302635 b!302632) bm!5525))

(declare-fun m!441425 () Bool)

(assert (=> bm!5525 m!441425))

(declare-fun m!441427 () Bool)

(assert (=> bm!5525 m!441427))

(declare-fun m!441429 () Bool)

(assert (=> bm!5525 m!441429))

(declare-fun m!441431 () Bool)

(assert (=> bm!5525 m!441431))

(declare-fun m!441433 () Bool)

(assert (=> bm!5525 m!441433))

(assert (=> b!302633 m!441433))

(assert (=> b!302633 m!441431))

(assert (=> b!302633 m!441433))

(assert (=> b!302633 m!441431))

(declare-fun m!441435 () Bool)

(assert (=> b!302633 m!441435))

(assert (=> b!302637 m!441389))

(declare-fun m!441437 () Bool)

(assert (=> b!302638 m!441437))

(assert (=> b!302570 d!101100))

(declare-fun d!101104 () Bool)

(assert (=> d!101104 (= (array_inv!7593 a1!948) (bvsge (size!7981 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67374 d!101104))

(declare-fun d!101108 () Bool)

(assert (=> d!101108 (= (array_inv!7593 a2!948) (bvsge (size!7981 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67374 d!101108))

(push 1)

(assert (not bm!5525))

(assert (not b!302637))

(assert (not b!302638))

(assert (not b!302633))

(check-sat)


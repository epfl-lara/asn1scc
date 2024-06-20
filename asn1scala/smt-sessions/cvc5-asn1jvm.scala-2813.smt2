; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67836 () Bool)

(assert start!67836)

(declare-fun b!304448 () Bool)

(declare-datatypes ((Unit!21250 0))(
  ( (Unit!21251) )
))
(declare-fun e!219184 () Unit!21250)

(declare-fun lt!438365 () Unit!21250)

(assert (=> b!304448 (= e!219184 lt!438365)))

(declare-datatypes ((tuple4!1188 0))(
  ( (tuple4!1189 (_1!13249 (_ BitVec 32)) (_2!13249 (_ BitVec 32)) (_3!1551 (_ BitVec 32)) (_4!594 (_ BitVec 32))) )
))
(declare-fun lt!438366 () tuple4!1188)

(declare-datatypes ((array!18497 0))(
  ( (array!18498 (arr!9106 (Array (_ BitVec 32) (_ BitVec 8))) (size!8023 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18497)

(declare-fun lt!438361 () tuple4!1188)

(declare-fun a2!948 () array!18497)

(declare-fun arrayRangesEqSlicedLemma!247 (array!18497 array!18497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21250)

(assert (=> b!304448 (= lt!438365 (arrayRangesEqSlicedLemma!247 a1!948 a2!948 (_1!13249 lt!438361) (_2!13249 lt!438361) (_1!13249 lt!438366) (_2!13249 lt!438366)))))

(declare-fun arrayRangesEq!1652 (array!18497 array!18497 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304448 (arrayRangesEq!1652 a1!948 a2!948 (_1!13249 lt!438366) (_2!13249 lt!438366))))

(declare-fun b!304449 () Bool)

(declare-fun res!250434 () Bool)

(declare-fun e!219183 () Bool)

(assert (=> b!304449 (=> (not res!250434) (not e!219183))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18497 array!18497 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304449 (= res!250434 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304451 () Bool)

(declare-fun e!219176 () Bool)

(declare-fun lt!438364 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304451 (= e!219176 (byteRangesEq!0 (select (arr!9106 a1!948) (_4!594 lt!438361)) (select (arr!9106 a2!948) (_4!594 lt!438361)) #b00000000000000000000000000000000 lt!438364))))

(declare-fun e!219179 () Bool)

(declare-fun b!304452 () Bool)

(assert (=> b!304452 (= e!219179 (not (arrayRangesEq!1652 a1!948 a2!948 (_1!13249 lt!438361) (_2!13249 lt!438361))))))

(declare-fun b!304453 () Bool)

(declare-fun res!250433 () Bool)

(assert (=> b!304453 (= res!250433 (= lt!438364 #b00000000000000000000000000000000))))

(assert (=> b!304453 (=> res!250433 e!219176)))

(declare-fun e!219181 () Bool)

(assert (=> b!304453 (= e!219181 e!219176)))

(declare-fun b!304454 () Bool)

(assert (=> b!304454 (= e!219183 e!219179)))

(declare-fun res!250435 () Bool)

(assert (=> b!304454 (=> (not res!250435) (not e!219179))))

(declare-fun e!219178 () Bool)

(assert (=> b!304454 (= res!250435 e!219178)))

(declare-fun c!14592 () Bool)

(assert (=> b!304454 (= c!14592 (= (_3!1551 lt!438361) (_4!594 lt!438361)))))

(declare-fun lt!438362 () Unit!21250)

(assert (=> b!304454 (= lt!438362 e!219184)))

(declare-fun c!14591 () Bool)

(assert (=> b!304454 (= c!14591 (bvslt (_1!13249 lt!438366) (_2!13249 lt!438366)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1188)

(assert (=> b!304454 (= lt!438366 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304454 (= lt!438364 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438363 () (_ BitVec 32))

(assert (=> b!304454 (= lt!438363 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304454 (= lt!438361 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun call!5669 () Bool)

(declare-fun bm!5666 () Bool)

(assert (=> bm!5666 (= call!5669 (byteRangesEq!0 (select (arr!9106 a1!948) (_3!1551 lt!438361)) (select (arr!9106 a2!948) (_3!1551 lt!438361)) lt!438363 (ite c!14592 lt!438364 #b00000000000000000000000000000111)))))

(declare-fun b!304455 () Bool)

(assert (=> b!304455 (= e!219178 call!5669)))

(declare-fun b!304456 () Bool)

(declare-fun e!219182 () Bool)

(assert (=> b!304456 (= e!219182 e!219183)))

(declare-fun res!250437 () Bool)

(assert (=> b!304456 (=> (not res!250437) (not e!219183))))

(declare-fun lt!438360 () (_ BitVec 64))

(assert (=> b!304456 (= res!250437 (and (bvsle toBit!258 lt!438360) (bvsle fromBit!258 lt!438360)))))

(assert (=> b!304456 (= lt!438360 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8023 a1!948))))))

(declare-fun b!304457 () Bool)

(declare-fun res!250431 () Bool)

(assert (=> b!304457 (=> (not res!250431) (not e!219179))))

(assert (=> b!304457 (= res!250431 (and (bvslt (_3!1551 lt!438361) (_3!1551 lt!438366)) (bvslt (_3!1551 lt!438366) (_4!594 lt!438361)) (bvsle #b00000000000000000000000000000000 (_1!13249 lt!438361)) (bvsle (_1!13249 lt!438361) (_2!13249 lt!438361)) (bvsle (_2!13249 lt!438361) (size!8023 a1!948)) (bvsle (_1!13249 lt!438361) (_3!1551 lt!438366)) (bvslt (_3!1551 lt!438366) (_2!13249 lt!438361))))))

(declare-fun b!304458 () Bool)

(declare-fun Unit!21252 () Unit!21250)

(assert (=> b!304458 (= e!219184 Unit!21252)))

(declare-fun b!304459 () Bool)

(assert (=> b!304459 (= e!219178 e!219181)))

(declare-fun res!250430 () Bool)

(assert (=> b!304459 (= res!250430 call!5669)))

(assert (=> b!304459 (=> (not res!250430) (not e!219181))))

(declare-fun b!304450 () Bool)

(declare-fun res!250436 () Bool)

(assert (=> b!304450 (=> (not res!250436) (not e!219183))))

(assert (=> b!304450 (= res!250436 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438360) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!250432 () Bool)

(assert (=> start!67836 (=> (not res!250432) (not e!219182))))

(assert (=> start!67836 (= res!250432 (and (bvsle (size!8023 a1!948) (size!8023 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67836 e!219182))

(assert (=> start!67836 true))

(declare-fun array_inv!7635 (array!18497) Bool)

(assert (=> start!67836 (array_inv!7635 a1!948)))

(assert (=> start!67836 (array_inv!7635 a2!948)))

(assert (= (and start!67836 res!250432) b!304456))

(assert (= (and b!304456 res!250437) b!304449))

(assert (= (and b!304449 res!250434) b!304450))

(assert (= (and b!304450 res!250436) b!304454))

(assert (= (and b!304454 c!14591) b!304448))

(assert (= (and b!304454 (not c!14591)) b!304458))

(assert (= (and b!304454 c!14592) b!304455))

(assert (= (and b!304454 (not c!14592)) b!304459))

(assert (= (and b!304459 res!250430) b!304453))

(assert (= (and b!304453 (not res!250433)) b!304451))

(assert (= (or b!304455 b!304459) bm!5666))

(assert (= (and b!304454 res!250435) b!304457))

(assert (= (and b!304457 res!250431) b!304452))

(declare-fun m!442947 () Bool)

(assert (=> start!67836 m!442947))

(declare-fun m!442949 () Bool)

(assert (=> start!67836 m!442949))

(declare-fun m!442951 () Bool)

(assert (=> bm!5666 m!442951))

(declare-fun m!442953 () Bool)

(assert (=> bm!5666 m!442953))

(assert (=> bm!5666 m!442951))

(assert (=> bm!5666 m!442953))

(declare-fun m!442955 () Bool)

(assert (=> bm!5666 m!442955))

(declare-fun m!442957 () Bool)

(assert (=> b!304451 m!442957))

(declare-fun m!442959 () Bool)

(assert (=> b!304451 m!442959))

(assert (=> b!304451 m!442957))

(assert (=> b!304451 m!442959))

(declare-fun m!442961 () Bool)

(assert (=> b!304451 m!442961))

(declare-fun m!442963 () Bool)

(assert (=> b!304448 m!442963))

(declare-fun m!442965 () Bool)

(assert (=> b!304448 m!442965))

(declare-fun m!442967 () Bool)

(assert (=> b!304454 m!442967))

(declare-fun m!442969 () Bool)

(assert (=> b!304454 m!442969))

(declare-fun m!442971 () Bool)

(assert (=> b!304449 m!442971))

(declare-fun m!442973 () Bool)

(assert (=> b!304452 m!442973))

(push 1)

(assert (not b!304454))

(assert (not b!304449))

(assert (not b!304448))

(assert (not b!304452))

(assert (not bm!5666))

(assert (not start!67836))

(assert (not b!304451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101688 () Bool)

(assert (=> d!101688 (= (byteRangesEq!0 (select (arr!9106 a1!948) (_4!594 lt!438361)) (select (arr!9106 a2!948) (_4!594 lt!438361)) #b00000000000000000000000000000000 lt!438364) (or (= #b00000000000000000000000000000000 lt!438364) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9106 a1!948) (_4!594 lt!438361))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438364))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9106 a2!948) (_4!594 lt!438361))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438364))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26205 () Bool)

(assert (= bs!26205 d!101688))

(declare-fun m!443067 () Bool)

(assert (=> bs!26205 m!443067))

(declare-fun m!443069 () Bool)

(assert (=> bs!26205 m!443069))

(assert (=> b!304451 d!101688))

(declare-fun d!101690 () Bool)

(assert (=> d!101690 (= (byteRangesEq!0 (select (arr!9106 a1!948) (_3!1551 lt!438361)) (select (arr!9106 a2!948) (_3!1551 lt!438361)) lt!438363 (ite c!14592 lt!438364 #b00000000000000000000000000000111)) (or (= lt!438363 (ite c!14592 lt!438364 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9106 a1!948) (_3!1551 lt!438361))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14592 lt!438364 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438363)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9106 a2!948) (_3!1551 lt!438361))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14592 lt!438364 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438363)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26206 () Bool)

(assert (= bs!26206 d!101690))

(declare-fun m!443071 () Bool)

(assert (=> bs!26206 m!443071))

(declare-fun m!443073 () Bool)

(assert (=> bs!26206 m!443073))

(assert (=> bm!5666 d!101690))

(declare-fun d!101692 () Bool)

(assert (=> d!101692 (arrayRangesEq!1652 a1!948 a2!948 (_1!13249 lt!438366) (_2!13249 lt!438366))))

(declare-fun lt!438423 () Unit!21250)

(declare-fun choose!576 (array!18497 array!18497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21250)

(assert (=> d!101692 (= lt!438423 (choose!576 a1!948 a2!948 (_1!13249 lt!438361) (_2!13249 lt!438361) (_1!13249 lt!438366) (_2!13249 lt!438366)))))

(assert (=> d!101692 (and (bvsle #b00000000000000000000000000000000 (_1!13249 lt!438361)) (bvsle (_1!13249 lt!438361) (_2!13249 lt!438361)))))

(assert (=> d!101692 (= (arrayRangesEqSlicedLemma!247 a1!948 a2!948 (_1!13249 lt!438361) (_2!13249 lt!438361) (_1!13249 lt!438366) (_2!13249 lt!438366)) lt!438423)))

(declare-fun bs!26207 () Bool)

(assert (= bs!26207 d!101692))

(assert (=> bs!26207 m!442965))

(declare-fun m!443075 () Bool)

(assert (=> bs!26207 m!443075))

(assert (=> b!304448 d!101692))

(declare-fun d!101694 () Bool)

(declare-fun res!250513 () Bool)

(declare-fun e!219269 () Bool)

(assert (=> d!101694 (=> res!250513 e!219269)))

(assert (=> d!101694 (= res!250513 (= (_1!13249 lt!438366) (_2!13249 lt!438366)))))

(assert (=> d!101694 (= (arrayRangesEq!1652 a1!948 a2!948 (_1!13249 lt!438366) (_2!13249 lt!438366)) e!219269)))

(declare-fun b!304565 () Bool)

(declare-fun e!219270 () Bool)

(assert (=> b!304565 (= e!219269 e!219270)))

(declare-fun res!250514 () Bool)

(assert (=> b!304565 (=> (not res!250514) (not e!219270))))

(assert (=> b!304565 (= res!250514 (= (select (arr!9106 a1!948) (_1!13249 lt!438366)) (select (arr!9106 a2!948) (_1!13249 lt!438366))))))

(declare-fun b!304566 () Bool)

(assert (=> b!304566 (= e!219270 (arrayRangesEq!1652 a1!948 a2!948 (bvadd (_1!13249 lt!438366) #b00000000000000000000000000000001) (_2!13249 lt!438366)))))

(assert (= (and d!101694 (not res!250513)) b!304565))

(assert (= (and b!304565 res!250514) b!304566))

(declare-fun m!443077 () Bool)

(assert (=> b!304565 m!443077))

(declare-fun m!443079 () Bool)

(assert (=> b!304565 m!443079))

(declare-fun m!443081 () Bool)

(assert (=> b!304566 m!443081))

(assert (=> b!304448 d!101694))

(declare-fun e!219287 () Bool)

(declare-fun lt!438430 () tuple4!1188)

(declare-fun b!304581 () Bool)

(assert (=> b!304581 (= e!219287 (arrayRangesEq!1652 a1!948 a2!948 (_1!13249 lt!438430) (_2!13249 lt!438430)))))

(declare-fun c!14610 () Bool)

(declare-fun bm!5678 () Bool)

(declare-fun call!5681 () Bool)

(declare-fun lt!438432 () (_ BitVec 32))

(declare-fun lt!438431 () (_ BitVec 32))

(assert (=> bm!5678 (= call!5681 (byteRangesEq!0 (ite c!14610 (select (arr!9106 a1!948) (_3!1551 lt!438430)) (select (arr!9106 a1!948) (_4!594 lt!438430))) (ite c!14610 (select (arr!9106 a2!948) (_3!1551 lt!438430)) (select (arr!9106 a2!948) (_4!594 lt!438430))) (ite c!14610 lt!438432 #b00000000000000000000000000000000) lt!438431))))

(declare-fun b!304582 () Bool)

(declare-fun e!219286 () Bool)

(declare-fun e!219283 () Bool)

(assert (=> b!304582 (= e!219286 e!219283)))

(declare-fun res!250529 () Bool)

(assert (=> b!304582 (= res!250529 (byteRangesEq!0 (select (arr!9106 a1!948) (_3!1551 lt!438430)) (select (arr!9106 a2!948) (_3!1551 lt!438430)) lt!438432 #b00000000000000000000000000001000))))

(assert (=> b!304582 (=> (not res!250529) (not e!219283))))

(declare-fun d!101696 () Bool)

(declare-fun res!250525 () Bool)

(declare-fun e!219288 () Bool)

(assert (=> d!101696 (=> res!250525 e!219288)))

(assert (=> d!101696 (= res!250525 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101696 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219288)))

(declare-fun b!304583 () Bool)

(declare-fun e!219284 () Bool)

(assert (=> b!304583 (= e!219284 e!219286)))

(assert (=> b!304583 (= c!14610 (= (_3!1551 lt!438430) (_4!594 lt!438430)))))

(declare-fun b!304584 () Bool)

(declare-fun e!219285 () Bool)

(assert (=> b!304584 (= e!219285 call!5681)))

(declare-fun b!304585 () Bool)

(assert (=> b!304585 (= e!219286 call!5681)))

(declare-fun b!304586 () Bool)

(declare-fun res!250528 () Bool)

(assert (=> b!304586 (= res!250528 (= lt!438431 #b00000000000000000000000000000000))))

(assert (=> b!304586 (=> res!250528 e!219285)))

(assert (=> b!304586 (= e!219283 e!219285)))

(declare-fun b!304587 () Bool)

(assert (=> b!304587 (= e!219288 e!219284)))

(declare-fun res!250526 () Bool)

(assert (=> b!304587 (=> (not res!250526) (not e!219284))))

(assert (=> b!304587 (= res!250526 e!219287)))

(declare-fun res!250527 () Bool)

(assert (=> b!304587 (=> res!250527 e!219287)))

(assert (=> b!304587 (= res!250527 (bvsge (_1!13249 lt!438430) (_2!13249 lt!438430)))))

(assert (=> b!304587 (= lt!438431 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304587 (= lt!438432 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304587 (= lt!438430 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!101696 (not res!250525)) b!304587))

(assert (= (and b!304587 (not res!250527)) b!304581))

(assert (= (and b!304587 res!250526) b!304583))

(assert (= (and b!304583 c!14610) b!304585))

(assert (= (and b!304583 (not c!14610)) b!304582))

(assert (= (and b!304582 res!250529) b!304586))

(assert (= (and b!304586 (not res!250528)) b!304584))

(assert (= (or b!304585 b!304584) bm!5678))

(declare-fun m!443083 () Bool)

(assert (=> b!304581 m!443083))

(declare-fun m!443085 () Bool)

(assert (=> bm!5678 m!443085))

(declare-fun m!443087 () Bool)

(assert (=> bm!5678 m!443087))

(declare-fun m!443089 () Bool)

(assert (=> bm!5678 m!443089))

(declare-fun m!443091 () Bool)

(assert (=> bm!5678 m!443091))

(declare-fun m!443093 () Bool)

(assert (=> bm!5678 m!443093))

(assert (=> b!304582 m!443091))

(assert (=> b!304582 m!443087))

(assert (=> b!304582 m!443091))

(assert (=> b!304582 m!443087))

(declare-fun m!443095 () Bool)

(assert (=> b!304582 m!443095))

(assert (=> b!304587 m!442969))

(assert (=> b!304449 d!101696))

(declare-fun d!101698 () Bool)

(assert (=> d!101698 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1189 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304454 d!101698))

(declare-fun d!101700 () Bool)

(assert (=> d!101700 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1189 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304454 d!101700))

(declare-fun d!101702 () Bool)

(declare-fun res!250530 () Bool)

(declare-fun e!219289 () Bool)

(assert (=> d!101702 (=> res!250530 e!219289)))

(assert (=> d!101702 (= res!250530 (= (_1!13249 lt!438361) (_2!13249 lt!438361)))))

(assert (=> d!101702 (= (arrayRangesEq!1652 a1!948 a2!948 (_1!13249 lt!438361) (_2!13249 lt!438361)) e!219289)))

(declare-fun b!304588 () Bool)

(declare-fun e!219290 () Bool)

(assert (=> b!304588 (= e!219289 e!219290)))

(declare-fun res!250531 () Bool)

(assert (=> b!304588 (=> (not res!250531) (not e!219290))))

(assert (=> b!304588 (= res!250531 (= (select (arr!9106 a1!948) (_1!13249 lt!438361)) (select (arr!9106 a2!948) (_1!13249 lt!438361))))))

(declare-fun b!304589 () Bool)

(assert (=> b!304589 (= e!219290 (arrayRangesEq!1652 a1!948 a2!948 (bvadd (_1!13249 lt!438361) #b00000000000000000000000000000001) (_2!13249 lt!438361)))))

(assert (= (and d!101702 (not res!250530)) b!304588))

(assert (= (and b!304588 res!250531) b!304589))

(declare-fun m!443097 () Bool)

(assert (=> b!304588 m!443097))

(declare-fun m!443099 () Bool)

(assert (=> b!304588 m!443099))

(declare-fun m!443101 () Bool)

(assert (=> b!304589 m!443101))

(assert (=> b!304452 d!101702))

(declare-fun d!101704 () Bool)

(assert (=> d!101704 (= (array_inv!7635 a1!948) (bvsge (size!8023 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67836 d!101704))

(declare-fun d!101706 () Bool)

(assert (=> d!101706 (= (array_inv!7635 a2!948) (bvsge (size!8023 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67836 d!101706))

(push 1)

(assert (not b!304589))

(assert (not bm!5678))

(assert (not b!304587))

(assert (not d!101692))

(assert (not b!304566))

(assert (not b!304581))

(assert (not b!304582))

(check-sat)

(pop 1)

(push 1)

(check-sat)


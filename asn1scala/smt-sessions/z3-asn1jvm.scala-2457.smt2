; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62270 () Bool)

(assert start!62270)

(declare-fun b!279291 () Bool)

(declare-fun res!231912 () Bool)

(declare-fun e!199080 () Bool)

(assert (=> b!279291 (=> (not res!231912) (not e!199080))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!279291 (= res!231912 (bvslt from!822 to!789))))

(declare-fun b!279292 () Bool)

(declare-datatypes ((Unit!19573 0))(
  ( (Unit!19574) )
))
(declare-fun e!199077 () Unit!19573)

(declare-fun Unit!19575 () Unit!19573)

(assert (=> b!279292 (= e!199077 Unit!19575)))

(declare-datatypes ((array!16122 0))(
  ( (array!16123 (arr!7973 (Array (_ BitVec 32) (_ BitVec 8))) (size!6977 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16122)

(declare-fun a2!699 () array!16122)

(declare-datatypes ((tuple4!704 0))(
  ( (tuple4!705 (_1!12427 (_ BitVec 32)) (_2!12427 (_ BitVec 32)) (_3!1132 (_ BitVec 32)) (_4!352 (_ BitVec 32))) )
))
(declare-fun lt!416305 () tuple4!704)

(declare-fun arrayRangesEq!1245 (array!16122 array!16122 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279292 (arrayRangesEq!1245 a1!699 a2!699 (_1!12427 lt!416305) (_2!12427 lt!416305))))

(declare-fun lt!416307 () Unit!19573)

(declare-fun arrayRangesEqSymmetricLemma!152 (array!16122 array!16122 (_ BitVec 32) (_ BitVec 32)) Unit!19573)

(assert (=> b!279292 (= lt!416307 (arrayRangesEqSymmetricLemma!152 a1!699 a2!699 (_1!12427 lt!416305) (_2!12427 lt!416305)))))

(assert (=> b!279292 (arrayRangesEq!1245 a2!699 a1!699 (_1!12427 lt!416305) (_2!12427 lt!416305))))

(declare-fun res!231913 () Bool)

(assert (=> start!62270 (=> (not res!231913) (not e!199080))))

(assert (=> start!62270 (= res!231913 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6977 a1!699) (size!6977 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6977 a1!699))))))))

(assert (=> start!62270 e!199080))

(assert (=> start!62270 true))

(declare-fun array_inv!6701 (array!16122) Bool)

(assert (=> start!62270 (array_inv!6701 a1!699)))

(assert (=> start!62270 (array_inv!6701 a2!699)))

(declare-fun b!279293 () Bool)

(declare-fun res!231914 () Bool)

(assert (=> b!279293 (=> (not res!231914) (not e!199080))))

(declare-fun arrayBitRangesEq!0 (array!16122 array!16122 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279293 (= res!231914 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279294 () Bool)

(declare-fun Unit!19576 () Unit!19573)

(assert (=> b!279294 (= e!199077 Unit!19576)))

(declare-fun b!279295 () Bool)

(assert (=> b!279295 (= e!199080 (and (= (_3!1132 lt!416305) (_4!352 lt!416305)) (or (bvslt (_3!1132 lt!416305) #b00000000000000000000000000000000) (bvsge (_3!1132 lt!416305) (size!6977 a2!699)))))))

(declare-fun lt!416306 () Unit!19573)

(assert (=> b!279295 (= lt!416306 e!199077)))

(declare-fun c!12861 () Bool)

(assert (=> b!279295 (= c!12861 (bvslt (_1!12427 lt!416305) (_2!12427 lt!416305)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!704)

(assert (=> b!279295 (= lt!416305 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62270 res!231913) b!279293))

(assert (= (and b!279293 res!231914) b!279291))

(assert (= (and b!279291 res!231912) b!279295))

(assert (= (and b!279295 c!12861) b!279292))

(assert (= (and b!279295 (not c!12861)) b!279294))

(declare-fun m!412335 () Bool)

(assert (=> b!279292 m!412335))

(declare-fun m!412337 () Bool)

(assert (=> b!279292 m!412337))

(declare-fun m!412339 () Bool)

(assert (=> b!279292 m!412339))

(declare-fun m!412341 () Bool)

(assert (=> start!62270 m!412341))

(declare-fun m!412343 () Bool)

(assert (=> start!62270 m!412343))

(declare-fun m!412345 () Bool)

(assert (=> b!279293 m!412345))

(declare-fun m!412347 () Bool)

(assert (=> b!279295 m!412347))

(check-sat (not b!279295) (not start!62270) (not b!279293) (not b!279292))
(check-sat)
(get-model)

(declare-fun d!96046 () Bool)

(assert (=> d!96046 (= (arrayBitIndices!0 from!822 to!789) (tuple4!705 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279295 d!96046))

(declare-fun d!96050 () Bool)

(assert (=> d!96050 (= (array_inv!6701 a1!699) (bvsge (size!6977 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62270 d!96050))

(declare-fun d!96052 () Bool)

(assert (=> d!96052 (= (array_inv!6701 a2!699) (bvsge (size!6977 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62270 d!96052))

(declare-fun b!279376 () Bool)

(declare-fun e!199152 () Bool)

(declare-fun e!199153 () Bool)

(assert (=> b!279376 (= e!199152 e!199153)))

(declare-fun c!12872 () Bool)

(declare-fun lt!416344 () tuple4!704)

(assert (=> b!279376 (= c!12872 (= (_3!1132 lt!416344) (_4!352 lt!416344)))))

(declare-fun d!96054 () Bool)

(declare-fun res!231978 () Bool)

(declare-fun e!199155 () Bool)

(assert (=> d!96054 (=> res!231978 e!199155)))

(assert (=> d!96054 (= res!231978 (bvsge from!822 to!789))))

(assert (=> d!96054 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199155)))

(declare-fun e!199156 () Bool)

(declare-fun b!279377 () Bool)

(assert (=> b!279377 (= e!199156 (arrayRangesEq!1245 a1!699 a2!699 (_1!12427 lt!416344) (_2!12427 lt!416344)))))

(declare-fun bm!4558 () Bool)

(declare-fun lt!416345 () (_ BitVec 32))

(declare-fun lt!416346 () (_ BitVec 32))

(declare-fun call!4561 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4558 (= call!4561 (byteRangesEq!0 (ite c!12872 (select (arr!7973 a1!699) (_3!1132 lt!416344)) (select (arr!7973 a1!699) (_4!352 lt!416344))) (ite c!12872 (select (arr!7973 a2!699) (_3!1132 lt!416344)) (select (arr!7973 a2!699) (_4!352 lt!416344))) (ite c!12872 lt!416346 #b00000000000000000000000000000000) lt!416345))))

(declare-fun b!279378 () Bool)

(assert (=> b!279378 (= e!199153 call!4561)))

(declare-fun b!279379 () Bool)

(declare-fun e!199151 () Bool)

(assert (=> b!279379 (= e!199151 call!4561)))

(declare-fun b!279380 () Bool)

(declare-fun e!199154 () Bool)

(assert (=> b!279380 (= e!199153 e!199154)))

(declare-fun res!231979 () Bool)

(assert (=> b!279380 (= res!231979 (byteRangesEq!0 (select (arr!7973 a1!699) (_3!1132 lt!416344)) (select (arr!7973 a2!699) (_3!1132 lt!416344)) lt!416346 #b00000000000000000000000000001000))))

(assert (=> b!279380 (=> (not res!231979) (not e!199154))))

(declare-fun b!279381 () Bool)

(declare-fun res!231976 () Bool)

(assert (=> b!279381 (= res!231976 (= lt!416345 #b00000000000000000000000000000000))))

(assert (=> b!279381 (=> res!231976 e!199151)))

(assert (=> b!279381 (= e!199154 e!199151)))

(declare-fun b!279382 () Bool)

(assert (=> b!279382 (= e!199155 e!199152)))

(declare-fun res!231975 () Bool)

(assert (=> b!279382 (=> (not res!231975) (not e!199152))))

(assert (=> b!279382 (= res!231975 e!199156)))

(declare-fun res!231977 () Bool)

(assert (=> b!279382 (=> res!231977 e!199156)))

(assert (=> b!279382 (= res!231977 (bvsge (_1!12427 lt!416344) (_2!12427 lt!416344)))))

(assert (=> b!279382 (= lt!416345 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279382 (= lt!416346 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279382 (= lt!416344 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!96054 (not res!231978)) b!279382))

(assert (= (and b!279382 (not res!231977)) b!279377))

(assert (= (and b!279382 res!231975) b!279376))

(assert (= (and b!279376 c!12872) b!279378))

(assert (= (and b!279376 (not c!12872)) b!279380))

(assert (= (and b!279380 res!231979) b!279381))

(assert (= (and b!279381 (not res!231976)) b!279379))

(assert (= (or b!279378 b!279379) bm!4558))

(declare-fun m!412397 () Bool)

(assert (=> b!279377 m!412397))

(declare-fun m!412403 () Bool)

(assert (=> bm!4558 m!412403))

(declare-fun m!412405 () Bool)

(assert (=> bm!4558 m!412405))

(declare-fun m!412413 () Bool)

(assert (=> bm!4558 m!412413))

(declare-fun m!412417 () Bool)

(assert (=> bm!4558 m!412417))

(declare-fun m!412419 () Bool)

(assert (=> bm!4558 m!412419))

(assert (=> b!279380 m!412403))

(assert (=> b!279380 m!412405))

(assert (=> b!279380 m!412403))

(assert (=> b!279380 m!412405))

(declare-fun m!412423 () Bool)

(assert (=> b!279380 m!412423))

(assert (=> b!279382 m!412347))

(assert (=> b!279293 d!96054))

(declare-fun d!96080 () Bool)

(declare-fun res!231989 () Bool)

(declare-fun e!199167 () Bool)

(assert (=> d!96080 (=> res!231989 e!199167)))

(assert (=> d!96080 (= res!231989 (= (_1!12427 lt!416305) (_2!12427 lt!416305)))))

(assert (=> d!96080 (= (arrayRangesEq!1245 a1!699 a2!699 (_1!12427 lt!416305) (_2!12427 lt!416305)) e!199167)))

(declare-fun b!279394 () Bool)

(declare-fun e!199168 () Bool)

(assert (=> b!279394 (= e!199167 e!199168)))

(declare-fun res!231990 () Bool)

(assert (=> b!279394 (=> (not res!231990) (not e!199168))))

(assert (=> b!279394 (= res!231990 (= (select (arr!7973 a1!699) (_1!12427 lt!416305)) (select (arr!7973 a2!699) (_1!12427 lt!416305))))))

(declare-fun b!279395 () Bool)

(assert (=> b!279395 (= e!199168 (arrayRangesEq!1245 a1!699 a2!699 (bvadd (_1!12427 lt!416305) #b00000000000000000000000000000001) (_2!12427 lt!416305)))))

(assert (= (and d!96080 (not res!231989)) b!279394))

(assert (= (and b!279394 res!231990) b!279395))

(declare-fun m!412425 () Bool)

(assert (=> b!279394 m!412425))

(declare-fun m!412427 () Bool)

(assert (=> b!279394 m!412427))

(declare-fun m!412429 () Bool)

(assert (=> b!279395 m!412429))

(assert (=> b!279292 d!96080))

(declare-fun d!96082 () Bool)

(assert (=> d!96082 (arrayRangesEq!1245 a2!699 a1!699 (_1!12427 lt!416305) (_2!12427 lt!416305))))

(declare-fun lt!416352 () Unit!19573)

(declare-fun choose!463 (array!16122 array!16122 (_ BitVec 32) (_ BitVec 32)) Unit!19573)

(assert (=> d!96082 (= lt!416352 (choose!463 a1!699 a2!699 (_1!12427 lt!416305) (_2!12427 lt!416305)))))

(assert (=> d!96082 (and (bvsle #b00000000000000000000000000000000 (_1!12427 lt!416305)) (bvsle (_1!12427 lt!416305) (_2!12427 lt!416305)) (bvsle (_2!12427 lt!416305) (size!6977 a1!699)))))

(assert (=> d!96082 (= (arrayRangesEqSymmetricLemma!152 a1!699 a2!699 (_1!12427 lt!416305) (_2!12427 lt!416305)) lt!416352)))

(declare-fun bs!24247 () Bool)

(assert (= bs!24247 d!96082))

(assert (=> bs!24247 m!412339))

(declare-fun m!412431 () Bool)

(assert (=> bs!24247 m!412431))

(assert (=> b!279292 d!96082))

(declare-fun d!96084 () Bool)

(declare-fun res!231991 () Bool)

(declare-fun e!199169 () Bool)

(assert (=> d!96084 (=> res!231991 e!199169)))

(assert (=> d!96084 (= res!231991 (= (_1!12427 lt!416305) (_2!12427 lt!416305)))))

(assert (=> d!96084 (= (arrayRangesEq!1245 a2!699 a1!699 (_1!12427 lt!416305) (_2!12427 lt!416305)) e!199169)))

(declare-fun b!279396 () Bool)

(declare-fun e!199170 () Bool)

(assert (=> b!279396 (= e!199169 e!199170)))

(declare-fun res!231992 () Bool)

(assert (=> b!279396 (=> (not res!231992) (not e!199170))))

(assert (=> b!279396 (= res!231992 (= (select (arr!7973 a2!699) (_1!12427 lt!416305)) (select (arr!7973 a1!699) (_1!12427 lt!416305))))))

(declare-fun b!279397 () Bool)

(assert (=> b!279397 (= e!199170 (arrayRangesEq!1245 a2!699 a1!699 (bvadd (_1!12427 lt!416305) #b00000000000000000000000000000001) (_2!12427 lt!416305)))))

(assert (= (and d!96084 (not res!231991)) b!279396))

(assert (= (and b!279396 res!231992) b!279397))

(assert (=> b!279396 m!412427))

(assert (=> b!279396 m!412425))

(declare-fun m!412433 () Bool)

(assert (=> b!279397 m!412433))

(assert (=> b!279292 d!96084))

(check-sat (not d!96082) (not b!279382) (not b!279395) (not bm!4558) (not b!279380) (not b!279377) (not b!279397))
(check-sat)

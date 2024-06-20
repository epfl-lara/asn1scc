; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62838 () Bool)

(assert start!62838)

(declare-fun b!281277 () Bool)

(declare-fun res!233399 () Bool)

(declare-fun e!200816 () Bool)

(assert (=> b!281277 (=> (not res!233399) (not e!200816))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!281277 (= res!233399 (bvslt from!822 to!789))))

(declare-fun res!233397 () Bool)

(assert (=> start!62838 (=> (not res!233397) (not e!200816))))

(declare-datatypes ((array!16246 0))(
  ( (array!16247 (arr!8014 (Array (_ BitVec 32) (_ BitVec 8))) (size!7018 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16246)

(declare-fun a2!699 () array!16246)

(assert (=> start!62838 (= res!233397 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7018 a1!699) (size!7018 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7018 a1!699))))))))

(assert (=> start!62838 e!200816))

(assert (=> start!62838 true))

(declare-fun array_inv!6742 (array!16246) Bool)

(assert (=> start!62838 (array_inv!6742 a1!699)))

(assert (=> start!62838 (array_inv!6742 a2!699)))

(declare-fun b!281278 () Bool)

(declare-fun e!200815 () Bool)

(declare-fun e!200812 () Bool)

(assert (=> b!281278 (= e!200815 (not e!200812))))

(declare-fun res!233398 () Bool)

(assert (=> b!281278 (=> res!233398 e!200812)))

(declare-fun lt!417258 () (_ BitVec 32))

(assert (=> b!281278 (= res!233398 (= lt!417258 #b00000000000000000000000000000000))))

(declare-fun e!200817 () Bool)

(assert (=> b!281278 e!200817))

(declare-fun res!233394 () Bool)

(assert (=> b!281278 (=> (not res!233394) (not e!200817))))

(declare-datatypes ((tuple4!786 0))(
  ( (tuple4!787 (_1!12468 (_ BitVec 32)) (_2!12468 (_ BitVec 32)) (_3!1173 (_ BitVec 32)) (_4!393 (_ BitVec 32))) )
))
(declare-fun lt!417256 () tuple4!786)

(declare-fun lt!417254 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281278 (= res!233394 (byteRangesEq!0 (select (arr!8014 a1!699) (_3!1173 lt!417256)) (select (arr!8014 a2!699) (_3!1173 lt!417256)) lt!417254 #b00000000000000000000000000001000))))

(declare-fun b!281279 () Bool)

(assert (=> b!281279 (= e!200812 (byteRangesEq!0 (select (arr!8014 a1!699) (_4!393 lt!417256)) (select (arr!8014 a2!699) (_4!393 lt!417256)) #b00000000000000000000000000000000 lt!417258))))

(declare-fun b!281280 () Bool)

(declare-datatypes ((Unit!19737 0))(
  ( (Unit!19738) )
))
(declare-fun e!200811 () Unit!19737)

(declare-fun Unit!19739 () Unit!19737)

(assert (=> b!281280 (= e!200811 Unit!19739)))

(declare-fun b!281281 () Bool)

(assert (=> b!281281 (= e!200816 e!200815)))

(declare-fun res!233396 () Bool)

(assert (=> b!281281 (=> (not res!233396) (not e!200815))))

(assert (=> b!281281 (= res!233396 (not (= (_3!1173 lt!417256) (_4!393 lt!417256))))))

(declare-fun lt!417257 () Unit!19737)

(assert (=> b!281281 (= lt!417257 e!200811)))

(declare-fun c!13113 () Bool)

(assert (=> b!281281 (= c!13113 (bvslt (_1!12468 lt!417256) (_2!12468 lt!417256)))))

(assert (=> b!281281 (= lt!417258 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281281 (= lt!417254 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!786)

(assert (=> b!281281 (= lt!417256 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281282 () Bool)

(assert (=> b!281282 (= e!200817 (byteRangesEq!0 (select (arr!8014 a2!699) (_3!1173 lt!417256)) (select (arr!8014 a1!699) (_3!1173 lt!417256)) lt!417254 #b00000000000000000000000000001000))))

(declare-fun b!281283 () Bool)

(declare-fun res!233395 () Bool)

(assert (=> b!281283 (=> (not res!233395) (not e!200816))))

(declare-fun arrayBitRangesEq!0 (array!16246 array!16246 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!281283 (= res!233395 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!281284 () Bool)

(declare-fun Unit!19740 () Unit!19737)

(assert (=> b!281284 (= e!200811 Unit!19740)))

(declare-fun arrayRangesEq!1286 (array!16246 array!16246 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281284 (arrayRangesEq!1286 a1!699 a2!699 (_1!12468 lt!417256) (_2!12468 lt!417256))))

(declare-fun lt!417255 () Unit!19737)

(declare-fun arrayRangesEqSymmetricLemma!193 (array!16246 array!16246 (_ BitVec 32) (_ BitVec 32)) Unit!19737)

(assert (=> b!281284 (= lt!417255 (arrayRangesEqSymmetricLemma!193 a1!699 a2!699 (_1!12468 lt!417256) (_2!12468 lt!417256)))))

(assert (=> b!281284 (arrayRangesEq!1286 a2!699 a1!699 (_1!12468 lt!417256) (_2!12468 lt!417256))))

(assert (= (and start!62838 res!233397) b!281283))

(assert (= (and b!281283 res!233395) b!281277))

(assert (= (and b!281277 res!233399) b!281281))

(assert (= (and b!281281 c!13113) b!281284))

(assert (= (and b!281281 (not c!13113)) b!281280))

(assert (= (and b!281281 res!233396) b!281278))

(assert (= (and b!281278 res!233394) b!281282))

(assert (= (and b!281278 (not res!233398)) b!281279))

(declare-fun m!414297 () Bool)

(assert (=> b!281279 m!414297))

(declare-fun m!414299 () Bool)

(assert (=> b!281279 m!414299))

(assert (=> b!281279 m!414297))

(assert (=> b!281279 m!414299))

(declare-fun m!414301 () Bool)

(assert (=> b!281279 m!414301))

(declare-fun m!414303 () Bool)

(assert (=> start!62838 m!414303))

(declare-fun m!414305 () Bool)

(assert (=> start!62838 m!414305))

(declare-fun m!414307 () Bool)

(assert (=> b!281282 m!414307))

(declare-fun m!414309 () Bool)

(assert (=> b!281282 m!414309))

(assert (=> b!281282 m!414307))

(assert (=> b!281282 m!414309))

(declare-fun m!414311 () Bool)

(assert (=> b!281282 m!414311))

(declare-fun m!414313 () Bool)

(assert (=> b!281284 m!414313))

(declare-fun m!414315 () Bool)

(assert (=> b!281284 m!414315))

(declare-fun m!414317 () Bool)

(assert (=> b!281284 m!414317))

(declare-fun m!414319 () Bool)

(assert (=> b!281281 m!414319))

(declare-fun m!414321 () Bool)

(assert (=> b!281283 m!414321))

(assert (=> b!281278 m!414309))

(assert (=> b!281278 m!414307))

(assert (=> b!281278 m!414309))

(assert (=> b!281278 m!414307))

(declare-fun m!414323 () Bool)

(assert (=> b!281278 m!414323))

(push 1)

(assert (not b!281278))

(assert (not b!281282))

(assert (not b!281279))

(assert (not b!281283))

(assert (not b!281284))

(assert (not b!281281))

(assert (not start!62838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96766 () Bool)

(assert (=> d!96766 (= (byteRangesEq!0 (select (arr!8014 a1!699) (_4!393 lt!417256)) (select (arr!8014 a2!699) (_4!393 lt!417256)) #b00000000000000000000000000000000 lt!417258) (or (= #b00000000000000000000000000000000 lt!417258) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8014 a1!699) (_4!393 lt!417256))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417258))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8014 a2!699) (_4!393 lt!417256))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417258))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24377 () Bool)

(assert (= bs!24377 d!96766))

(declare-fun m!414381 () Bool)

(assert (=> bs!24377 m!414381))

(declare-fun m!414383 () Bool)

(assert (=> bs!24377 m!414383))

(assert (=> b!281279 d!96766))

(declare-fun d!96768 () Bool)

(assert (=> d!96768 (= (byteRangesEq!0 (select (arr!8014 a1!699) (_3!1173 lt!417256)) (select (arr!8014 a2!699) (_3!1173 lt!417256)) lt!417254 #b00000000000000000000000000001000) (or (= lt!417254 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8014 a1!699) (_3!1173 lt!417256))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417254)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8014 a2!699) (_3!1173 lt!417256))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417254)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24378 () Bool)

(assert (= bs!24378 d!96768))

(declare-fun m!414385 () Bool)

(assert (=> bs!24378 m!414385))

(declare-fun m!414387 () Bool)

(assert (=> bs!24378 m!414387))

(assert (=> b!281278 d!96768))

(declare-fun b!281347 () Bool)

(declare-fun lt!417297 () tuple4!786)

(declare-fun e!200873 () Bool)

(assert (=> b!281347 (= e!200873 (arrayRangesEq!1286 a1!699 a2!699 (_1!12468 lt!417297) (_2!12468 lt!417297)))))

(declare-fun d!96770 () Bool)

(declare-fun res!233450 () Bool)

(declare-fun e!200874 () Bool)

(assert (=> d!96770 (=> res!233450 e!200874)))

(assert (=> d!96770 (= res!233450 (bvsge from!822 to!789))))

(assert (=> d!96770 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200874)))

(declare-fun b!281348 () Bool)

(declare-fun res!233446 () Bool)

(declare-fun lt!417296 () (_ BitVec 32))

(assert (=> b!281348 (= res!233446 (= lt!417296 #b00000000000000000000000000000000))))

(declare-fun e!200877 () Bool)

(assert (=> b!281348 (=> res!233446 e!200877)))

(declare-fun e!200872 () Bool)

(assert (=> b!281348 (= e!200872 e!200877)))

(declare-fun call!4685 () Bool)

(declare-fun lt!417295 () (_ BitVec 32))

(declare-fun c!13122 () Bool)

(declare-fun bm!4682 () Bool)

(assert (=> bm!4682 (= call!4685 (byteRangesEq!0 (ite c!13122 (select (arr!8014 a1!699) (_3!1173 lt!417297)) (select (arr!8014 a1!699) (_4!393 lt!417297))) (ite c!13122 (select (arr!8014 a2!699) (_3!1173 lt!417297)) (select (arr!8014 a2!699) (_4!393 lt!417297))) (ite c!13122 lt!417295 #b00000000000000000000000000000000) lt!417296))))

(declare-fun b!281349 () Bool)

(declare-fun e!200875 () Bool)

(assert (=> b!281349 (= e!200874 e!200875)))

(declare-fun res!233448 () Bool)

(assert (=> b!281349 (=> (not res!233448) (not e!200875))))

(assert (=> b!281349 (= res!233448 e!200873)))

(declare-fun res!233447 () Bool)

(assert (=> b!281349 (=> res!233447 e!200873)))

(assert (=> b!281349 (= res!233447 (bvsge (_1!12468 lt!417297) (_2!12468 lt!417297)))))

(assert (=> b!281349 (= lt!417296 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281349 (= lt!417295 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281349 (= lt!417297 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281350 () Bool)

(declare-fun e!200876 () Bool)

(assert (=> b!281350 (= e!200875 e!200876)))

(assert (=> b!281350 (= c!13122 (= (_3!1173 lt!417297) (_4!393 lt!417297)))))

(declare-fun b!281351 () Bool)

(assert (=> b!281351 (= e!200876 e!200872)))

(declare-fun res!233449 () Bool)

(assert (=> b!281351 (= res!233449 (byteRangesEq!0 (select (arr!8014 a1!699) (_3!1173 lt!417297)) (select (arr!8014 a2!699) (_3!1173 lt!417297)) lt!417295 #b00000000000000000000000000001000))))

(assert (=> b!281351 (=> (not res!233449) (not e!200872))))

(declare-fun b!281352 () Bool)

(assert (=> b!281352 (= e!200876 call!4685)))

(declare-fun b!281353 () Bool)

(assert (=> b!281353 (= e!200877 call!4685)))

(assert (= (and d!96770 (not res!233450)) b!281349))

(assert (= (and b!281349 (not res!233447)) b!281347))

(assert (= (and b!281349 res!233448) b!281350))

(assert (= (and b!281350 c!13122) b!281352))

(assert (= (and b!281350 (not c!13122)) b!281351))

(assert (= (and b!281351 res!233449) b!281348))

(assert (= (and b!281348 (not res!233446)) b!281353))

(assert (= (or b!281352 b!281353) bm!4682))

(declare-fun m!414401 () Bool)

(assert (=> b!281347 m!414401))

(declare-fun m!414403 () Bool)

(assert (=> bm!4682 m!414403))

(declare-fun m!414405 () Bool)

(assert (=> bm!4682 m!414405))

(declare-fun m!414407 () Bool)

(assert (=> bm!4682 m!414407))

(declare-fun m!414409 () Bool)

(assert (=> bm!4682 m!414409))

(declare-fun m!414411 () Bool)

(assert (=> bm!4682 m!414411))

(assert (=> b!281349 m!414319))

(assert (=> b!281351 m!414411))

(assert (=> b!281351 m!414407))

(assert (=> b!281351 m!414411))

(assert (=> b!281351 m!414407))

(declare-fun m!414413 () Bool)

(assert (=> b!281351 m!414413))

(assert (=> b!281283 d!96770))

(declare-fun d!96790 () Bool)

(assert (=> d!96790 (= (array_inv!6742 a1!699) (bvsge (size!7018 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62838 d!96790))

(declare-fun d!96792 () Bool)

(assert (=> d!96792 (= (array_inv!6742 a2!699) (bvsge (size!7018 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62838 d!96792))

(declare-fun d!96794 () Bool)

(declare-fun res!233471 () Bool)

(declare-fun e!200900 () Bool)

(assert (=> d!96794 (=> res!233471 e!200900)))

(assert (=> d!96794 (= res!233471 (= (_1!12468 lt!417256) (_2!12468 lt!417256)))))

(assert (=> d!96794 (= (arrayRangesEq!1286 a1!699 a2!699 (_1!12468 lt!417256) (_2!12468 lt!417256)) e!200900)))

(declare-fun b!281378 () Bool)

(declare-fun e!200901 () Bool)

(assert (=> b!281378 (= e!200900 e!200901)))

(declare-fun res!233472 () Bool)

(assert (=> b!281378 (=> (not res!233472) (not e!200901))))

(assert (=> b!281378 (= res!233472 (= (select (arr!8014 a1!699) (_1!12468 lt!417256)) (select (arr!8014 a2!699) (_1!12468 lt!417256))))))

(declare-fun b!281379 () Bool)

(assert (=> b!281379 (= e!200901 (arrayRangesEq!1286 a1!699 a2!699 (bvadd (_1!12468 lt!417256) #b00000000000000000000000000000001) (_2!12468 lt!417256)))))

(assert (= (and d!96794 (not res!233471)) b!281378))

(assert (= (and b!281378 res!233472) b!281379))

(declare-fun m!414421 () Bool)

(assert (=> b!281378 m!414421))

(declare-fun m!414423 () Bool)

(assert (=> b!281378 m!414423))

(declare-fun m!414425 () Bool)

(assert (=> b!281379 m!414425))

(assert (=> b!281284 d!96794))

(declare-fun d!96798 () Bool)

(assert (=> d!96798 (arrayRangesEq!1286 a2!699 a1!699 (_1!12468 lt!417256) (_2!12468 lt!417256))))

(declare-fun lt!417309 () Unit!19737)

(declare-fun choose!496 (array!16246 array!16246 (_ BitVec 32) (_ BitVec 32)) Unit!19737)

(assert (=> d!96798 (= lt!417309 (choose!496 a1!699 a2!699 (_1!12468 lt!417256) (_2!12468 lt!417256)))))

(assert (=> d!96798 (and (bvsle #b00000000000000000000000000000000 (_1!12468 lt!417256)) (bvsle (_1!12468 lt!417256) (_2!12468 lt!417256)) (bvsle (_2!12468 lt!417256) (size!7018 a1!699)))))

(assert (=> d!96798 (= (arrayRangesEqSymmetricLemma!193 a1!699 a2!699 (_1!12468 lt!417256) (_2!12468 lt!417256)) lt!417309)))

(declare-fun bs!24384 () Bool)

(assert (= bs!24384 d!96798))

(assert (=> bs!24384 m!414317))

(declare-fun m!414431 () Bool)

(assert (=> bs!24384 m!414431))

(assert (=> b!281284 d!96798))

(declare-fun d!96804 () Bool)

(declare-fun res!233475 () Bool)

(declare-fun e!200904 () Bool)

(assert (=> d!96804 (=> res!233475 e!200904)))

(assert (=> d!96804 (= res!233475 (= (_1!12468 lt!417256) (_2!12468 lt!417256)))))

(assert (=> d!96804 (= (arrayRangesEq!1286 a2!699 a1!699 (_1!12468 lt!417256) (_2!12468 lt!417256)) e!200904)))

(declare-fun b!281382 () Bool)

(declare-fun e!200905 () Bool)

(assert (=> b!281382 (= e!200904 e!200905)))

(declare-fun res!233476 () Bool)

(assert (=> b!281382 (=> (not res!233476) (not e!200905))))

(assert (=> b!281382 (= res!233476 (= (select (arr!8014 a2!699) (_1!12468 lt!417256)) (select (arr!8014 a1!699) (_1!12468 lt!417256))))))

(declare-fun b!281383 () Bool)

(assert (=> b!281383 (= e!200905 (arrayRangesEq!1286 a2!699 a1!699 (bvadd (_1!12468 lt!417256) #b00000000000000000000000000000001) (_2!12468 lt!417256)))))

(assert (= (and d!96804 (not res!233475)) b!281382))

(assert (= (and b!281382 res!233476) b!281383))

(assert (=> b!281382 m!414423))

(assert (=> b!281382 m!414421))

(declare-fun m!414433 () Bool)

(assert (=> b!281383 m!414433))

(assert (=> b!281284 d!96804))

(declare-fun d!96806 () Bool)

(assert (=> d!96806 (= (byteRangesEq!0 (select (arr!8014 a2!699) (_3!1173 lt!417256)) (select (arr!8014 a1!699) (_3!1173 lt!417256)) lt!417254 #b00000000000000000000000000001000) (or (= lt!417254 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8014 a2!699) (_3!1173 lt!417256))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417254)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8014 a1!699) (_3!1173 lt!417256))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417254)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24385 () Bool)

(assert (= bs!24385 d!96806))

(assert (=> bs!24385 m!414385))

(assert (=> bs!24385 m!414387))

(assert (=> b!281282 d!96806))

(declare-fun d!96808 () Bool)

(assert (=> d!96808 (= (arrayBitIndices!0 from!822 to!789) (tuple4!787 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!281281 d!96808))

(push 1)

(assert (not d!96798))

(assert (not b!281383))

(assert (not bm!4682))

(assert (not b!281349))

(assert (not b!281347))

(assert (not b!281379))

(assert (not b!281351))

(check-sat)

(pop 1)

(push 1)

(check-sat)


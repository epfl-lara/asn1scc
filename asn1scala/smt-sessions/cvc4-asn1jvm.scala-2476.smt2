; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63052 () Bool)

(assert start!63052)

(declare-fun b!282204 () Bool)

(declare-datatypes ((Unit!19805 0))(
  ( (Unit!19806) )
))
(declare-fun e!201598 () Unit!19805)

(declare-fun Unit!19807 () Unit!19805)

(assert (=> b!282204 (= e!201598 Unit!19807)))

(declare-fun res!234127 () Bool)

(declare-fun e!201599 () Bool)

(assert (=> start!63052 (=> (not res!234127) (not e!201599))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16295 0))(
  ( (array!16296 (arr!8031 (Array (_ BitVec 32) (_ BitVec 8))) (size!7035 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16295)

(declare-fun a2!699 () array!16295)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!63052 (= res!234127 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7035 a1!699) (size!7035 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7035 a1!699))))))))

(assert (=> start!63052 e!201599))

(assert (=> start!63052 true))

(declare-fun array_inv!6759 (array!16295) Bool)

(assert (=> start!63052 (array_inv!6759 a1!699)))

(assert (=> start!63052 (array_inv!6759 a2!699)))

(declare-fun e!201594 () Bool)

(declare-fun b!282205 () Bool)

(declare-fun arrayBitRangesEq!0 (array!16295 array!16295 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!282205 (= e!201594 (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789))))

(declare-fun b!282206 () Bool)

(declare-fun Unit!19808 () Unit!19805)

(assert (=> b!282206 (= e!201598 Unit!19808)))

(declare-datatypes ((tuple4!820 0))(
  ( (tuple4!821 (_1!12485 (_ BitVec 32)) (_2!12485 (_ BitVec 32)) (_3!1190 (_ BitVec 32)) (_4!410 (_ BitVec 32))) )
))
(declare-fun lt!417690 () tuple4!820)

(declare-fun arrayRangesEq!1303 (array!16295 array!16295 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282206 (arrayRangesEq!1303 a1!699 a2!699 (_1!12485 lt!417690) (_2!12485 lt!417690))))

(declare-fun lt!417693 () Unit!19805)

(declare-fun arrayRangesEqSymmetricLemma!210 (array!16295 array!16295 (_ BitVec 32) (_ BitVec 32)) Unit!19805)

(assert (=> b!282206 (= lt!417693 (arrayRangesEqSymmetricLemma!210 a1!699 a2!699 (_1!12485 lt!417690) (_2!12485 lt!417690)))))

(assert (=> b!282206 (arrayRangesEq!1303 a2!699 a1!699 (_1!12485 lt!417690) (_2!12485 lt!417690))))

(declare-fun b!282207 () Bool)

(declare-fun res!234128 () Bool)

(assert (=> b!282207 (=> (not res!234128) (not e!201599))))

(assert (=> b!282207 (= res!234128 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!282208 () Bool)

(declare-fun e!201596 () Bool)

(assert (=> b!282208 (= e!201599 e!201596)))

(declare-fun res!234126 () Bool)

(assert (=> b!282208 (=> (not res!234126) (not e!201596))))

(assert (=> b!282208 (= res!234126 (not (= (_3!1190 lt!417690) (_4!410 lt!417690))))))

(declare-fun lt!417692 () Unit!19805)

(assert (=> b!282208 (= lt!417692 e!201598)))

(declare-fun c!13212 () Bool)

(assert (=> b!282208 (= c!13212 (bvslt (_1!12485 lt!417690) (_2!12485 lt!417690)))))

(declare-fun lt!417691 () (_ BitVec 32))

(assert (=> b!282208 (= lt!417691 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!820)

(assert (=> b!282208 (= lt!417690 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282209 () Bool)

(assert (=> b!282209 (= e!201596 (not e!201594))))

(declare-fun res!234125 () Bool)

(assert (=> b!282209 (=> res!234125 e!201594)))

(assert (=> b!282209 (= res!234125 (not (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)))))

(declare-fun e!201595 () Bool)

(assert (=> b!282209 e!201595))

(declare-fun res!234124 () Bool)

(assert (=> b!282209 (=> (not res!234124) (not e!201595))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282209 (= res!234124 (byteRangesEq!0 (select (arr!8031 a1!699) (_3!1190 lt!417690)) (select (arr!8031 a2!699) (_3!1190 lt!417690)) lt!417691 #b00000000000000000000000000001000))))

(declare-fun b!282210 () Bool)

(declare-fun res!234123 () Bool)

(assert (=> b!282210 (=> (not res!234123) (not e!201599))))

(assert (=> b!282210 (= res!234123 (bvslt from!822 to!789))))

(declare-fun b!282211 () Bool)

(assert (=> b!282211 (= e!201595 (byteRangesEq!0 (select (arr!8031 a2!699) (_3!1190 lt!417690)) (select (arr!8031 a1!699) (_3!1190 lt!417690)) lt!417691 #b00000000000000000000000000001000))))

(assert (= (and start!63052 res!234127) b!282207))

(assert (= (and b!282207 res!234128) b!282210))

(assert (= (and b!282210 res!234123) b!282208))

(assert (= (and b!282208 c!13212) b!282206))

(assert (= (and b!282208 (not c!13212)) b!282204))

(assert (= (and b!282208 res!234126) b!282209))

(assert (= (and b!282209 res!234124) b!282211))

(assert (= (and b!282209 (not res!234125)) b!282205))

(declare-fun m!415305 () Bool)

(assert (=> b!282209 m!415305))

(declare-fun m!415307 () Bool)

(assert (=> b!282209 m!415307))

(assert (=> b!282209 m!415305))

(assert (=> b!282209 m!415307))

(declare-fun m!415309 () Bool)

(assert (=> b!282209 m!415309))

(declare-fun m!415311 () Bool)

(assert (=> b!282207 m!415311))

(assert (=> b!282211 m!415307))

(assert (=> b!282211 m!415305))

(assert (=> b!282211 m!415307))

(assert (=> b!282211 m!415305))

(declare-fun m!415313 () Bool)

(assert (=> b!282211 m!415313))

(declare-fun m!415315 () Bool)

(assert (=> start!63052 m!415315))

(declare-fun m!415317 () Bool)

(assert (=> start!63052 m!415317))

(declare-fun m!415319 () Bool)

(assert (=> b!282206 m!415319))

(declare-fun m!415321 () Bool)

(assert (=> b!282206 m!415321))

(declare-fun m!415323 () Bool)

(assert (=> b!282206 m!415323))

(declare-fun m!415325 () Bool)

(assert (=> b!282208 m!415325))

(declare-fun m!415327 () Bool)

(assert (=> b!282205 m!415327))

(push 1)

(assert (not b!282205))

(assert (not b!282207))

(assert (not start!63052))

(assert (not b!282209))

(assert (not b!282211))

(assert (not b!282206))

(assert (not b!282208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!282283 () Bool)

(declare-fun res!234184 () Bool)

(declare-fun lt!417726 () (_ BitVec 32))

(assert (=> b!282283 (= res!234184 (= lt!417726 #b00000000000000000000000000000000))))

(declare-fun e!201665 () Bool)

(assert (=> b!282283 (=> res!234184 e!201665)))

(declare-fun e!201668 () Bool)

(assert (=> b!282283 (= e!201668 e!201665)))

(declare-fun b!282284 () Bool)

(declare-fun e!201667 () Bool)

(declare-fun e!201666 () Bool)

(assert (=> b!282284 (= e!201667 e!201666)))

(declare-fun res!234185 () Bool)

(assert (=> b!282284 (=> (not res!234185) (not e!201666))))

(declare-fun e!201663 () Bool)

(assert (=> b!282284 (= res!234185 e!201663)))

(declare-fun res!234183 () Bool)

(assert (=> b!282284 (=> res!234183 e!201663)))

(declare-fun lt!417725 () tuple4!820)

(assert (=> b!282284 (= res!234183 (bvsge (_1!12485 lt!417725) (_2!12485 lt!417725)))))

(assert (=> b!282284 (= lt!417726 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417724 () (_ BitVec 32))

(assert (=> b!282284 (= lt!417724 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282284 (= lt!417725 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282285 () Bool)

(declare-fun e!201664 () Bool)

(declare-fun call!4740 () Bool)

(assert (=> b!282285 (= e!201664 call!4740)))

(declare-fun b!282286 () Bool)

(assert (=> b!282286 (= e!201663 (arrayRangesEq!1303 a1!699 a2!699 (_1!12485 lt!417725) (_2!12485 lt!417725)))))

(declare-fun bm!4737 () Bool)

(declare-fun c!13222 () Bool)

(assert (=> bm!4737 (= call!4740 (byteRangesEq!0 (ite c!13222 (select (arr!8031 a1!699) (_3!1190 lt!417725)) (select (arr!8031 a1!699) (_4!410 lt!417725))) (ite c!13222 (select (arr!8031 a2!699) (_3!1190 lt!417725)) (select (arr!8031 a2!699) (_4!410 lt!417725))) (ite c!13222 lt!417724 #b00000000000000000000000000000000) lt!417726))))

(declare-fun b!282287 () Bool)

(assert (=> b!282287 (= e!201665 call!4740)))

(declare-fun b!282288 () Bool)

(assert (=> b!282288 (= e!201666 e!201664)))

(assert (=> b!282288 (= c!13222 (= (_3!1190 lt!417725) (_4!410 lt!417725)))))

(declare-fun b!282289 () Bool)

(assert (=> b!282289 (= e!201664 e!201668)))

(declare-fun res!234182 () Bool)

(assert (=> b!282289 (= res!234182 (byteRangesEq!0 (select (arr!8031 a1!699) (_3!1190 lt!417725)) (select (arr!8031 a2!699) (_3!1190 lt!417725)) lt!417724 #b00000000000000000000000000001000))))

(assert (=> b!282289 (=> (not res!234182) (not e!201668))))

(declare-fun d!97116 () Bool)

(declare-fun res!234186 () Bool)

(assert (=> d!97116 (=> res!234186 e!201667)))

(assert (=> d!97116 (= res!234186 (bvsge from!822 to!789))))

(assert (=> d!97116 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201667)))

(assert (= (and d!97116 (not res!234186)) b!282284))

(assert (= (and b!282284 (not res!234183)) b!282286))

(assert (= (and b!282284 res!234185) b!282288))

(assert (= (and b!282288 c!13222) b!282285))

(assert (= (and b!282288 (not c!13222)) b!282289))

(assert (= (and b!282289 res!234182) b!282283))

(assert (= (and b!282283 (not res!234184)) b!282287))

(assert (= (or b!282285 b!282287) bm!4737))

(assert (=> b!282284 m!415325))

(declare-fun m!415389 () Bool)

(assert (=> b!282286 m!415389))

(declare-fun m!415391 () Bool)

(assert (=> bm!4737 m!415391))

(declare-fun m!415393 () Bool)

(assert (=> bm!4737 m!415393))

(declare-fun m!415395 () Bool)

(assert (=> bm!4737 m!415395))

(declare-fun m!415397 () Bool)

(assert (=> bm!4737 m!415397))

(declare-fun m!415399 () Bool)

(assert (=> bm!4737 m!415399))

(assert (=> b!282289 m!415397))

(assert (=> b!282289 m!415395))

(assert (=> b!282289 m!415397))

(assert (=> b!282289 m!415395))

(declare-fun m!415405 () Bool)

(assert (=> b!282289 m!415405))

(assert (=> b!282207 d!97116))

(declare-fun d!97120 () Bool)

(assert (=> d!97120 (= (array_inv!6759 a1!699) (bvsge (size!7035 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!63052 d!97120))

(declare-fun d!97124 () Bool)

(assert (=> d!97124 (= (array_inv!6759 a2!699) (bvsge (size!7035 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!63052 d!97124))

(declare-fun d!97126 () Bool)

(assert (=> d!97126 (= (arrayBitIndices!0 from!822 to!789) (tuple4!821 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!282208 d!97126))

(declare-fun d!97130 () Bool)

(assert (=> d!97130 (= (byteRangesEq!0 (select (arr!8031 a1!699) (_3!1190 lt!417690)) (select (arr!8031 a2!699) (_3!1190 lt!417690)) lt!417691 #b00000000000000000000000000001000) (or (= lt!417691 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8031 a1!699) (_3!1190 lt!417690))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417691)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8031 a2!699) (_3!1190 lt!417690))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417691)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24464 () Bool)

(assert (= bs!24464 d!97130))

(declare-fun m!415427 () Bool)

(assert (=> bs!24464 m!415427))

(declare-fun m!415429 () Bool)

(assert (=> bs!24464 m!415429))

(assert (=> b!282209 d!97130))

(declare-fun b!282305 () Bool)

(declare-fun res!234202 () Bool)

(declare-fun lt!417735 () (_ BitVec 32))

(assert (=> b!282305 (= res!234202 (= lt!417735 #b00000000000000000000000000000000))))

(declare-fun e!201685 () Bool)

(assert (=> b!282305 (=> res!234202 e!201685)))

(declare-fun e!201688 () Bool)

(assert (=> b!282305 (= e!201688 e!201685)))

(declare-fun b!282306 () Bool)

(declare-fun e!201687 () Bool)

(declare-fun e!201686 () Bool)

(assert (=> b!282306 (= e!201687 e!201686)))

(declare-fun res!234203 () Bool)

(assert (=> b!282306 (=> (not res!234203) (not e!201686))))

(declare-fun e!201683 () Bool)

(assert (=> b!282306 (= res!234203 e!201683)))

(declare-fun res!234201 () Bool)

(assert (=> b!282306 (=> res!234201 e!201683)))

(declare-fun lt!417734 () tuple4!820)

(assert (=> b!282306 (= res!234201 (bvsge (_1!12485 lt!417734) (_2!12485 lt!417734)))))

(assert (=> b!282306 (= lt!417735 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417733 () (_ BitVec 32))

(assert (=> b!282306 (= lt!417733 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282306 (= lt!417734 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282307 () Bool)

(declare-fun e!201684 () Bool)

(declare-fun call!4742 () Bool)

(assert (=> b!282307 (= e!201684 call!4742)))

(declare-fun b!282308 () Bool)

(assert (=> b!282308 (= e!201683 (arrayRangesEq!1303 a2!699 a1!699 (_1!12485 lt!417734) (_2!12485 lt!417734)))))

(declare-fun bm!4739 () Bool)

(declare-fun c!13224 () Bool)

(assert (=> bm!4739 (= call!4742 (byteRangesEq!0 (ite c!13224 (select (arr!8031 a2!699) (_3!1190 lt!417734)) (select (arr!8031 a2!699) (_4!410 lt!417734))) (ite c!13224 (select (arr!8031 a1!699) (_3!1190 lt!417734)) (select (arr!8031 a1!699) (_4!410 lt!417734))) (ite c!13224 lt!417733 #b00000000000000000000000000000000) lt!417735))))

(declare-fun b!282309 () Bool)

(assert (=> b!282309 (= e!201685 call!4742)))

(declare-fun b!282310 () Bool)

(assert (=> b!282310 (= e!201686 e!201684)))

(assert (=> b!282310 (= c!13224 (= (_3!1190 lt!417734) (_4!410 lt!417734)))))

(declare-fun b!282311 () Bool)

(assert (=> b!282311 (= e!201684 e!201688)))

(declare-fun res!234200 () Bool)

(assert (=> b!282311 (= res!234200 (byteRangesEq!0 (select (arr!8031 a2!699) (_3!1190 lt!417734)) (select (arr!8031 a1!699) (_3!1190 lt!417734)) lt!417733 #b00000000000000000000000000001000))))

(assert (=> b!282311 (=> (not res!234200) (not e!201688))))

(declare-fun d!97140 () Bool)

(declare-fun res!234204 () Bool)

(assert (=> d!97140 (=> res!234204 e!201687)))

(assert (=> d!97140 (= res!234204 (bvsge from!822 to!789))))

(assert (=> d!97140 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!201687)))

(assert (= (and d!97140 (not res!234204)) b!282306))

(assert (= (and b!282306 (not res!234201)) b!282308))

(assert (= (and b!282306 res!234203) b!282310))

(assert (= (and b!282310 c!13224) b!282307))

(assert (= (and b!282310 (not c!13224)) b!282311))

(assert (= (and b!282311 res!234200) b!282305))

(assert (= (and b!282305 (not res!234202)) b!282309))

(assert (= (or b!282307 b!282309) bm!4739))

(assert (=> b!282306 m!415325))

(declare-fun m!415431 () Bool)

(assert (=> b!282308 m!415431))

(declare-fun m!415433 () Bool)

(assert (=> bm!4739 m!415433))

(declare-fun m!415435 () Bool)

(assert (=> bm!4739 m!415435))

(declare-fun m!415437 () Bool)

(assert (=> bm!4739 m!415437))

(declare-fun m!415439 () Bool)

(assert (=> bm!4739 m!415439))

(declare-fun m!415441 () Bool)

(assert (=> bm!4739 m!415441))

(assert (=> b!282311 m!415439))

(assert (=> b!282311 m!415437))

(assert (=> b!282311 m!415439))

(assert (=> b!282311 m!415437))

(declare-fun m!415443 () Bool)

(assert (=> b!282311 m!415443))

(assert (=> b!282205 d!97140))

(declare-fun d!97142 () Bool)

(assert (=> d!97142 (= (byteRangesEq!0 (select (arr!8031 a2!699) (_3!1190 lt!417690)) (select (arr!8031 a1!699) (_3!1190 lt!417690)) lt!417691 #b00000000000000000000000000001000) (or (= lt!417691 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8031 a2!699) (_3!1190 lt!417690))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417691)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8031 a1!699) (_3!1190 lt!417690))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417691)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24465 () Bool)

(assert (= bs!24465 d!97142))

(assert (=> bs!24465 m!415427))

(assert (=> bs!24465 m!415429))

(assert (=> b!282211 d!97142))

(declare-fun d!97144 () Bool)

(declare-fun res!234209 () Bool)

(declare-fun e!201693 () Bool)

(assert (=> d!97144 (=> res!234209 e!201693)))

(assert (=> d!97144 (= res!234209 (= (_1!12485 lt!417690) (_2!12485 lt!417690)))))

(assert (=> d!97144 (= (arrayRangesEq!1303 a1!699 a2!699 (_1!12485 lt!417690) (_2!12485 lt!417690)) e!201693)))

(declare-fun b!282316 () Bool)

(declare-fun e!201694 () Bool)

(assert (=> b!282316 (= e!201693 e!201694)))

(declare-fun res!234210 () Bool)

(assert (=> b!282316 (=> (not res!234210) (not e!201694))))

(assert (=> b!282316 (= res!234210 (= (select (arr!8031 a1!699) (_1!12485 lt!417690)) (select (arr!8031 a2!699) (_1!12485 lt!417690))))))

(declare-fun b!282317 () Bool)

(assert (=> b!282317 (= e!201694 (arrayRangesEq!1303 a1!699 a2!699 (bvadd (_1!12485 lt!417690) #b00000000000000000000000000000001) (_2!12485 lt!417690)))))

(assert (= (and d!97144 (not res!234209)) b!282316))

(assert (= (and b!282316 res!234210) b!282317))

(declare-fun m!415445 () Bool)

(assert (=> b!282316 m!415445))

(declare-fun m!415447 () Bool)

(assert (=> b!282316 m!415447))

(declare-fun m!415449 () Bool)

(assert (=> b!282317 m!415449))

(assert (=> b!282206 d!97144))

(declare-fun d!97146 () Bool)

(assert (=> d!97146 (arrayRangesEq!1303 a2!699 a1!699 (_1!12485 lt!417690) (_2!12485 lt!417690))))

(declare-fun lt!417738 () Unit!19805)

(declare-fun choose!512 (array!16295 array!16295 (_ BitVec 32) (_ BitVec 32)) Unit!19805)

(assert (=> d!97146 (= lt!417738 (choose!512 a1!699 a2!699 (_1!12485 lt!417690) (_2!12485 lt!417690)))))

(assert (=> d!97146 (and (bvsle #b00000000000000000000000000000000 (_1!12485 lt!417690)) (bvsle (_1!12485 lt!417690) (_2!12485 lt!417690)) (bvsle (_2!12485 lt!417690) (size!7035 a1!699)))))

(assert (=> d!97146 (= (arrayRangesEqSymmetricLemma!210 a1!699 a2!699 (_1!12485 lt!417690) (_2!12485 lt!417690)) lt!417738)))

(declare-fun bs!24466 () Bool)

(assert (= bs!24466 d!97146))

(assert (=> bs!24466 m!415323))

(declare-fun m!415451 () Bool)

(assert (=> bs!24466 m!415451))

(assert (=> b!282206 d!97146))

(declare-fun d!97148 () Bool)

(declare-fun res!234211 () Bool)

(declare-fun e!201695 () Bool)

(assert (=> d!97148 (=> res!234211 e!201695)))


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63048 () Bool)

(assert start!63048)

(declare-fun e!201555 () Bool)

(declare-datatypes ((array!16291 0))(
  ( (array!16292 (arr!8029 (Array (_ BitVec 32) (_ BitVec 8))) (size!7033 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16291)

(declare-fun b!282156 () Bool)

(declare-datatypes ((tuple4!816 0))(
  ( (tuple4!817 (_1!12483 (_ BitVec 32)) (_2!12483 (_ BitVec 32)) (_3!1188 (_ BitVec 32)) (_4!408 (_ BitVec 32))) )
))
(declare-fun lt!417669 () tuple4!816)

(declare-fun a2!699 () array!16291)

(declare-fun lt!417668 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282156 (= e!201555 (byteRangesEq!0 (select (arr!8029 a2!699) (_3!1188 lt!417669)) (select (arr!8029 a1!699) (_3!1188 lt!417669)) lt!417668 #b00000000000000000000000000001000))))

(declare-fun b!282157 () Bool)

(declare-fun res!234089 () Bool)

(declare-fun e!201554 () Bool)

(assert (=> b!282157 (=> (not res!234089) (not e!201554))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16291 array!16291 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!282157 (= res!234089 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!234088 () Bool)

(assert (=> start!63048 (=> (not res!234088) (not e!201554))))

(assert (=> start!63048 (= res!234088 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7033 a1!699) (size!7033 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7033 a1!699))))))))

(assert (=> start!63048 e!201554))

(assert (=> start!63048 true))

(declare-fun array_inv!6757 (array!16291) Bool)

(assert (=> start!63048 (array_inv!6757 a1!699)))

(assert (=> start!63048 (array_inv!6757 a2!699)))

(declare-fun b!282158 () Bool)

(declare-fun e!201557 () Bool)

(declare-fun e!201558 () Bool)

(assert (=> b!282158 (= e!201557 (not e!201558))))

(declare-fun res!234090 () Bool)

(assert (=> b!282158 (=> res!234090 e!201558)))

(assert (=> b!282158 (= res!234090 (not (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)))))

(assert (=> b!282158 e!201555))

(declare-fun res!234091 () Bool)

(assert (=> b!282158 (=> (not res!234091) (not e!201555))))

(assert (=> b!282158 (= res!234091 (byteRangesEq!0 (select (arr!8029 a1!699) (_3!1188 lt!417669)) (select (arr!8029 a2!699) (_3!1188 lt!417669)) lt!417668 #b00000000000000000000000000001000))))

(declare-fun b!282159 () Bool)

(declare-datatypes ((Unit!19797 0))(
  ( (Unit!19798) )
))
(declare-fun e!201556 () Unit!19797)

(declare-fun Unit!19799 () Unit!19797)

(assert (=> b!282159 (= e!201556 Unit!19799)))

(declare-fun b!282160 () Bool)

(declare-fun res!234087 () Bool)

(assert (=> b!282160 (=> (not res!234087) (not e!201554))))

(assert (=> b!282160 (= res!234087 (bvslt from!822 to!789))))

(declare-fun b!282161 () Bool)

(assert (=> b!282161 (= e!201554 e!201557)))

(declare-fun res!234092 () Bool)

(assert (=> b!282161 (=> (not res!234092) (not e!201557))))

(assert (=> b!282161 (= res!234092 (not (= (_3!1188 lt!417669) (_4!408 lt!417669))))))

(declare-fun lt!417666 () Unit!19797)

(assert (=> b!282161 (= lt!417666 e!201556)))

(declare-fun c!13206 () Bool)

(assert (=> b!282161 (= c!13206 (bvslt (_1!12483 lt!417669) (_2!12483 lt!417669)))))

(assert (=> b!282161 (= lt!417668 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!816)

(assert (=> b!282161 (= lt!417669 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282162 () Bool)

(assert (=> b!282162 (= e!201558 (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789))))

(declare-fun b!282163 () Bool)

(declare-fun Unit!19800 () Unit!19797)

(assert (=> b!282163 (= e!201556 Unit!19800)))

(declare-fun arrayRangesEq!1301 (array!16291 array!16291 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282163 (arrayRangesEq!1301 a1!699 a2!699 (_1!12483 lt!417669) (_2!12483 lt!417669))))

(declare-fun lt!417667 () Unit!19797)

(declare-fun arrayRangesEqSymmetricLemma!208 (array!16291 array!16291 (_ BitVec 32) (_ BitVec 32)) Unit!19797)

(assert (=> b!282163 (= lt!417667 (arrayRangesEqSymmetricLemma!208 a1!699 a2!699 (_1!12483 lt!417669) (_2!12483 lt!417669)))))

(assert (=> b!282163 (arrayRangesEq!1301 a2!699 a1!699 (_1!12483 lt!417669) (_2!12483 lt!417669))))

(assert (= (and start!63048 res!234088) b!282157))

(assert (= (and b!282157 res!234089) b!282160))

(assert (= (and b!282160 res!234087) b!282161))

(assert (= (and b!282161 c!13206) b!282163))

(assert (= (and b!282161 (not c!13206)) b!282159))

(assert (= (and b!282161 res!234092) b!282158))

(assert (= (and b!282158 res!234091) b!282156))

(assert (= (and b!282158 (not res!234090)) b!282162))

(declare-fun m!415257 () Bool)

(assert (=> b!282161 m!415257))

(declare-fun m!415259 () Bool)

(assert (=> b!282162 m!415259))

(declare-fun m!415261 () Bool)

(assert (=> b!282158 m!415261))

(declare-fun m!415263 () Bool)

(assert (=> b!282158 m!415263))

(assert (=> b!282158 m!415261))

(assert (=> b!282158 m!415263))

(declare-fun m!415265 () Bool)

(assert (=> b!282158 m!415265))

(declare-fun m!415267 () Bool)

(assert (=> b!282157 m!415267))

(declare-fun m!415269 () Bool)

(assert (=> b!282163 m!415269))

(declare-fun m!415271 () Bool)

(assert (=> b!282163 m!415271))

(declare-fun m!415273 () Bool)

(assert (=> b!282163 m!415273))

(declare-fun m!415275 () Bool)

(assert (=> start!63048 m!415275))

(declare-fun m!415277 () Bool)

(assert (=> start!63048 m!415277))

(assert (=> b!282156 m!415263))

(assert (=> b!282156 m!415261))

(assert (=> b!282156 m!415263))

(assert (=> b!282156 m!415261))

(declare-fun m!415279 () Bool)

(assert (=> b!282156 m!415279))

(push 1)

(assert (not b!282163))

(assert (not start!63048))

(assert (not b!282161))

(assert (not b!282158))

(assert (not b!282156))

(assert (not b!282162))

(assert (not b!282157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97100 () Bool)

(assert (=> d!97100 (= (arrayBitIndices!0 from!822 to!789) (tuple4!817 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!282161 d!97100))

(declare-fun d!97104 () Bool)

(assert (=> d!97104 (= (byteRangesEq!0 (select (arr!8029 a2!699) (_3!1188 lt!417669)) (select (arr!8029 a1!699) (_3!1188 lt!417669)) lt!417668 #b00000000000000000000000000001000) (or (= lt!417668 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8029 a2!699) (_3!1188 lt!417669))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417668)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8029 a1!699) (_3!1188 lt!417669))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417668)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24461 () Bool)

(assert (= bs!24461 d!97104))

(declare-fun m!415371 () Bool)

(assert (=> bs!24461 m!415371))

(declare-fun m!415373 () Bool)

(assert (=> bs!24461 m!415373))

(assert (=> b!282156 d!97104))

(declare-fun d!97114 () Bool)

(declare-fun res!234178 () Bool)

(declare-fun e!201657 () Bool)

(assert (=> d!97114 (=> res!234178 e!201657)))

(assert (=> d!97114 (= res!234178 (bvsge from!822 to!789))))

(assert (=> d!97114 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!201657)))

(declare-fun b!282276 () Bool)

(declare-fun e!201658 () Bool)

(declare-fun e!201661 () Bool)

(assert (=> b!282276 (= e!201658 e!201661)))

(declare-fun res!234177 () Bool)

(declare-fun lt!417723 () tuple4!816)

(declare-fun lt!417722 () (_ BitVec 32))

(assert (=> b!282276 (= res!234177 (byteRangesEq!0 (select (arr!8029 a2!699) (_3!1188 lt!417723)) (select (arr!8029 a1!699) (_3!1188 lt!417723)) lt!417722 #b00000000000000000000000000001000))))

(assert (=> b!282276 (=> (not res!234177) (not e!201661))))

(declare-fun b!282277 () Bool)

(declare-fun e!201659 () Bool)

(assert (=> b!282277 (= e!201657 e!201659)))

(declare-fun res!234181 () Bool)

(assert (=> b!282277 (=> (not res!234181) (not e!201659))))

(declare-fun e!201662 () Bool)

(assert (=> b!282277 (= res!234181 e!201662)))

(declare-fun res!234179 () Bool)

(assert (=> b!282277 (=> res!234179 e!201662)))

(assert (=> b!282277 (= res!234179 (bvsge (_1!12483 lt!417723) (_2!12483 lt!417723)))))

(declare-fun lt!417721 () (_ BitVec 32))

(assert (=> b!282277 (= lt!417721 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282277 (= lt!417722 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282277 (= lt!417723 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282278 () Bool)

(declare-fun res!234180 () Bool)

(assert (=> b!282278 (= res!234180 (= lt!417721 #b00000000000000000000000000000000))))

(declare-fun e!201660 () Bool)

(assert (=> b!282278 (=> res!234180 e!201660)))

(assert (=> b!282278 (= e!201661 e!201660)))

(declare-fun b!282279 () Bool)

(declare-fun call!4739 () Bool)

(assert (=> b!282279 (= e!201660 call!4739)))

(declare-fun b!282280 () Bool)

(assert (=> b!282280 (= e!201662 (arrayRangesEq!1301 a2!699 a1!699 (_1!12483 lt!417723) (_2!12483 lt!417723)))))

(declare-fun bm!4736 () Bool)

(declare-fun c!13221 () Bool)

(assert (=> bm!4736 (= call!4739 (byteRangesEq!0 (ite c!13221 (select (arr!8029 a2!699) (_3!1188 lt!417723)) (select (arr!8029 a2!699) (_4!408 lt!417723))) (ite c!13221 (select (arr!8029 a1!699) (_3!1188 lt!417723)) (select (arr!8029 a1!699) (_4!408 lt!417723))) (ite c!13221 lt!417722 #b00000000000000000000000000000000) lt!417721))))

(declare-fun b!282281 () Bool)

(assert (=> b!282281 (= e!201658 call!4739)))

(declare-fun b!282282 () Bool)

(assert (=> b!282282 (= e!201659 e!201658)))

(assert (=> b!282282 (= c!13221 (= (_3!1188 lt!417723) (_4!408 lt!417723)))))

(assert (= (and d!97114 (not res!234178)) b!282277))

(assert (= (and b!282277 (not res!234179)) b!282280))

(assert (= (and b!282277 res!234181) b!282282))

(assert (= (and b!282282 c!13221) b!282281))

(assert (= (and b!282282 (not c!13221)) b!282276))

(assert (= (and b!282276 res!234177) b!282278))

(assert (= (and b!282278 (not res!234180)) b!282279))

(assert (= (or b!282281 b!282279) bm!4736))

(declare-fun m!415375 () Bool)

(assert (=> b!282276 m!415375))

(declare-fun m!415377 () Bool)

(assert (=> b!282276 m!415377))

(assert (=> b!282276 m!415375))

(assert (=> b!282276 m!415377))

(declare-fun m!415379 () Bool)

(assert (=> b!282276 m!415379))

(assert (=> b!282277 m!415257))

(declare-fun m!415381 () Bool)

(assert (=> b!282280 m!415381))

(declare-fun m!415383 () Bool)

(assert (=> bm!4736 m!415383))

(assert (=> bm!4736 m!415377))

(declare-fun m!415385 () Bool)

(assert (=> bm!4736 m!415385))

(declare-fun m!415387 () Bool)

(assert (=> bm!4736 m!415387))

(assert (=> bm!4736 m!415375))

(assert (=> b!282162 d!97114))

(declare-fun d!97118 () Bool)

(declare-fun res!234188 () Bool)

(declare-fun e!201669 () Bool)

(assert (=> d!97118 (=> res!234188 e!201669)))

(assert (=> d!97118 (= res!234188 (bvsge from!822 to!789))))

(assert (=> d!97118 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201669)))

(declare-fun b!282290 () Bool)

(declare-fun e!201670 () Bool)

(declare-fun e!201673 () Bool)

(assert (=> b!282290 (= e!201670 e!201673)))

(declare-fun lt!417728 () (_ BitVec 32))

(declare-fun res!234187 () Bool)

(declare-fun lt!417729 () tuple4!816)

(assert (=> b!282290 (= res!234187 (byteRangesEq!0 (select (arr!8029 a1!699) (_3!1188 lt!417729)) (select (arr!8029 a2!699) (_3!1188 lt!417729)) lt!417728 #b00000000000000000000000000001000))))

(assert (=> b!282290 (=> (not res!234187) (not e!201673))))

(declare-fun b!282291 () Bool)

(declare-fun e!201671 () Bool)

(assert (=> b!282291 (= e!201669 e!201671)))

(declare-fun res!234191 () Bool)

(assert (=> b!282291 (=> (not res!234191) (not e!201671))))

(declare-fun e!201674 () Bool)

(assert (=> b!282291 (= res!234191 e!201674)))

(declare-fun res!234189 () Bool)

(assert (=> b!282291 (=> res!234189 e!201674)))

(assert (=> b!282291 (= res!234189 (bvsge (_1!12483 lt!417729) (_2!12483 lt!417729)))))

(declare-fun lt!417727 () (_ BitVec 32))

(assert (=> b!282291 (= lt!417727 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282291 (= lt!417728 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282291 (= lt!417729 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282292 () Bool)

(declare-fun res!234190 () Bool)

(assert (=> b!282292 (= res!234190 (= lt!417727 #b00000000000000000000000000000000))))

(declare-fun e!201672 () Bool)

(assert (=> b!282292 (=> res!234190 e!201672)))

(assert (=> b!282292 (= e!201673 e!201672)))

(declare-fun b!282293 () Bool)

(declare-fun call!4741 () Bool)

(assert (=> b!282293 (= e!201672 call!4741)))

(declare-fun b!282294 () Bool)

(assert (=> b!282294 (= e!201674 (arrayRangesEq!1301 a1!699 a2!699 (_1!12483 lt!417729) (_2!12483 lt!417729)))))

(declare-fun bm!4738 () Bool)

(declare-fun c!13223 () Bool)

(assert (=> bm!4738 (= call!4741 (byteRangesEq!0 (ite c!13223 (select (arr!8029 a1!699) (_3!1188 lt!417729)) (select (arr!8029 a1!699) (_4!408 lt!417729))) (ite c!13223 (select (arr!8029 a2!699) (_3!1188 lt!417729)) (select (arr!8029 a2!699) (_4!408 lt!417729))) (ite c!13223 lt!417728 #b00000000000000000000000000000000) lt!417727))))

(declare-fun b!282295 () Bool)

(assert (=> b!282295 (= e!201670 call!4741)))

(declare-fun b!282296 () Bool)

(assert (=> b!282296 (= e!201671 e!201670)))

(assert (=> b!282296 (= c!13223 (= (_3!1188 lt!417729) (_4!408 lt!417729)))))

(assert (= (and d!97118 (not res!234188)) b!282291))

(assert (= (and b!282291 (not res!234189)) b!282294))

(assert (= (and b!282291 res!234191) b!282296))

(assert (= (and b!282296 c!13223) b!282295))

(assert (= (and b!282296 (not c!13223)) b!282290))

(assert (= (and b!282290 res!234187) b!282292))

(assert (= (and b!282292 (not res!234190)) b!282293))

(assert (= (or b!282295 b!282293) bm!4738))

(declare-fun m!415401 () Bool)

(assert (=> b!282290 m!415401))

(declare-fun m!415403 () Bool)

(assert (=> b!282290 m!415403))

(assert (=> b!282290 m!415401))

(assert (=> b!282290 m!415403))

(declare-fun m!415407 () Bool)

(assert (=> b!282290 m!415407))

(assert (=> b!282291 m!415257))

(declare-fun m!415409 () Bool)

(assert (=> b!282294 m!415409))

(declare-fun m!415411 () Bool)

(assert (=> bm!4738 m!415411))

(assert (=> bm!4738 m!415403))

(declare-fun m!415413 () Bool)

(assert (=> bm!4738 m!415413))

(declare-fun m!415415 () Bool)

(assert (=> bm!4738 m!415415))

(assert (=> bm!4738 m!415401))

(assert (=> b!282157 d!97118))

(declare-fun d!97122 () Bool)

(declare-fun res!234196 () Bool)

(declare-fun e!201679 () Bool)

(assert (=> d!97122 (=> res!234196 e!201679)))

(assert (=> d!97122 (= res!234196 (= (_1!12483 lt!417669) (_2!12483 lt!417669)))))

(assert (=> d!97122 (= (arrayRangesEq!1301 a1!699 a2!699 (_1!12483 lt!417669) (_2!12483 lt!417669)) e!201679)))

(declare-fun b!282301 () Bool)

(declare-fun e!201680 () Bool)

(assert (=> b!282301 (= e!201679 e!201680)))

(declare-fun res!234197 () Bool)

(assert (=> b!282301 (=> (not res!234197) (not e!201680))))

(assert (=> b!282301 (= res!234197 (= (select (arr!8029 a1!699) (_1!12483 lt!417669)) (select (arr!8029 a2!699) (_1!12483 lt!417669))))))

(declare-fun b!282302 () Bool)

(assert (=> b!282302 (= e!201680 (arrayRangesEq!1301 a1!699 a2!699 (bvadd (_1!12483 lt!417669) #b00000000000000000000000000000001) (_2!12483 lt!417669)))))

(assert (= (and d!97122 (not res!234196)) b!282301))

(assert (= (and b!282301 res!234197) b!282302))

(declare-fun m!415417 () Bool)

(assert (=> b!282301 m!415417))

(declare-fun m!415419 () Bool)

(assert (=> b!282301 m!415419))

(declare-fun m!415421 () Bool)

(assert (=> b!282302 m!415421))

(assert (=> b!282163 d!97122))

(declare-fun d!97128 () Bool)

(assert (=> d!97128 (arrayRangesEq!1301 a2!699 a1!699 (_1!12483 lt!417669) (_2!12483 lt!417669))))

(declare-fun lt!417732 () Unit!19797)

(declare-fun choose!511 (array!16291 array!16291 (_ BitVec 32) (_ BitVec 32)) Unit!19797)

(assert (=> d!97128 (= lt!417732 (choose!511 a1!699 a2!699 (_1!12483 lt!417669) (_2!12483 lt!417669)))))

(assert (=> d!97128 (and (bvsle #b00000000000000000000000000000000 (_1!12483 lt!417669)) (bvsle (_1!12483 lt!417669) (_2!12483 lt!417669)) (bvsle (_2!12483 lt!417669) (size!7033 a1!699)))))

(assert (=> d!97128 (= (arrayRangesEqSymmetricLemma!208 a1!699 a2!699 (_1!12483 lt!417669) (_2!12483 lt!417669)) lt!417732)))

(declare-fun bs!24462 () Bool)

(assert (= bs!24462 d!97128))

(assert (=> bs!24462 m!415273))

(declare-fun m!415423 () Bool)

(assert (=> bs!24462 m!415423))

(assert (=> b!282163 d!97128))

(declare-fun d!97132 () Bool)

(declare-fun res!234198 () Bool)

(declare-fun e!201681 () Bool)

(assert (=> d!97132 (=> res!234198 e!201681)))

(assert (=> d!97132 (= res!234198 (= (_1!12483 lt!417669) (_2!12483 lt!417669)))))

(assert (=> d!97132 (= (arrayRangesEq!1301 a2!699 a1!699 (_1!12483 lt!417669) (_2!12483 lt!417669)) e!201681)))

(declare-fun b!282303 () Bool)

(declare-fun e!201682 () Bool)

(assert (=> b!282303 (= e!201681 e!201682)))

(declare-fun res!234199 () Bool)

(assert (=> b!282303 (=> (not res!234199) (not e!201682))))

(assert (=> b!282303 (= res!234199 (= (select (arr!8029 a2!699) (_1!12483 lt!417669)) (select (arr!8029 a1!699) (_1!12483 lt!417669))))))

(declare-fun b!282304 () Bool)

(assert (=> b!282304 (= e!201682 (arrayRangesEq!1301 a2!699 a1!699 (bvadd (_1!12483 lt!417669) #b00000000000000000000000000000001) (_2!12483 lt!417669)))))

(assert (= (and d!97132 (not res!234198)) b!282303))

(assert (= (and b!282303 res!234199) b!282304))

(assert (=> b!282303 m!415419))

(assert (=> b!282303 m!415417))

(declare-fun m!415425 () Bool)

(assert (=> b!282304 m!415425))

(assert (=> b!282163 d!97132))

(declare-fun d!97134 () Bool)

(assert (=> d!97134 (= (byteRangesEq!0 (select (arr!8029 a1!699) (_3!1188 lt!417669)) (select (arr!8029 a2!699) (_3!1188 lt!417669)) lt!417668 #b00000000000000000000000000001000) (or (= lt!417668 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8029 a1!699) (_3!1188 lt!417669))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417668)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8029 a2!699) (_3!1188 lt!417669))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417668)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24463 () Bool)

(assert (= bs!24463 d!97134))

(assert (=> bs!24463 m!415371))

(assert (=> bs!24463 m!415373))

(assert (=> b!282158 d!97134))

(declare-fun d!97136 () Bool)

(assert (=> d!97136 (= (array_inv!6757 a1!699) (bvsge (size!7033 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!63048 d!97136))

(declare-fun d!97138 () Bool)

(assert (=> d!97138 (= (array_inv!6757 a2!699) (bvsge (size!7033 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!63048 d!97138))

(push 1)

(assert (not b!282290))

(assert (not b!282277))

(assert (not b!282276))

(assert (not b!282304))

(assert (not b!282302))

(assert (not b!282294))

(assert (not bm!4738))

(assert (not bm!4736))

(assert (not b!282280))

(assert (not d!97128))

(assert (not b!282291))

(check-sat)

(pop 1)

(push 1)

(check-sat)


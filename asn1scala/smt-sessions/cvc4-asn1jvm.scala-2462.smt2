; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62476 () Bool)

(assert start!62476)

(declare-fun b!280018 () Bool)

(declare-datatypes ((Unit!19637 0))(
  ( (Unit!19638) )
))
(declare-fun e!199714 () Unit!19637)

(declare-fun Unit!19639 () Unit!19637)

(assert (=> b!280018 (= e!199714 Unit!19639)))

(declare-fun e!199715 () Bool)

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16169 0))(
  ( (array!16170 (arr!7989 (Array (_ BitVec 32) (_ BitVec 8))) (size!6993 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16169)

(declare-fun b!280019 () Bool)

(declare-fun a2!699 () array!16169)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16169 array!16169 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280019 (= e!199715 (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789))))

(declare-fun b!280020 () Bool)

(declare-fun res!232454 () Bool)

(declare-fun e!199712 () Bool)

(assert (=> b!280020 (=> (not res!232454) (not e!199712))))

(assert (=> b!280020 (= res!232454 (bvslt from!822 to!789))))

(declare-fun b!280021 () Bool)

(declare-fun Unit!19640 () Unit!19637)

(assert (=> b!280021 (= e!199714 Unit!19640)))

(declare-datatypes ((tuple4!736 0))(
  ( (tuple4!737 (_1!12443 (_ BitVec 32)) (_2!12443 (_ BitVec 32)) (_3!1148 (_ BitVec 32)) (_4!368 (_ BitVec 32))) )
))
(declare-fun lt!416664 () tuple4!736)

(declare-fun arrayRangesEq!1261 (array!16169 array!16169 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280021 (arrayRangesEq!1261 a1!699 a2!699 (_1!12443 lt!416664) (_2!12443 lt!416664))))

(declare-fun lt!416665 () Unit!19637)

(declare-fun arrayRangesEqSymmetricLemma!168 (array!16169 array!16169 (_ BitVec 32) (_ BitVec 32)) Unit!19637)

(assert (=> b!280021 (= lt!416665 (arrayRangesEqSymmetricLemma!168 a1!699 a2!699 (_1!12443 lt!416664) (_2!12443 lt!416664)))))

(assert (=> b!280021 (arrayRangesEq!1261 a2!699 a1!699 (_1!12443 lt!416664) (_2!12443 lt!416664))))

(declare-fun b!280022 () Bool)

(declare-fun e!199711 () Bool)

(assert (=> b!280022 (= e!199711 (not e!199715))))

(declare-fun res!232455 () Bool)

(assert (=> b!280022 (=> res!232455 e!199715)))

(declare-fun lt!416667 () (_ BitVec 32))

(declare-fun lt!416663 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280022 (= res!232455 (not (byteRangesEq!0 (select (arr!7989 a2!699) (_3!1148 lt!416664)) (select (arr!7989 a1!699) (_3!1148 lt!416664)) lt!416667 lt!416663)))))

(assert (=> b!280022 (byteRangesEq!0 (select (arr!7989 a1!699) (_3!1148 lt!416664)) (select (arr!7989 a2!699) (_3!1148 lt!416664)) lt!416667 lt!416663)))

(declare-fun b!280023 () Bool)

(declare-fun res!232456 () Bool)

(assert (=> b!280023 (=> (not res!232456) (not e!199712))))

(assert (=> b!280023 (= res!232456 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!232453 () Bool)

(assert (=> start!62476 (=> (not res!232453) (not e!199712))))

(assert (=> start!62476 (= res!232453 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6993 a1!699) (size!6993 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6993 a1!699))))))))

(assert (=> start!62476 e!199712))

(assert (=> start!62476 true))

(declare-fun array_inv!6717 (array!16169) Bool)

(assert (=> start!62476 (array_inv!6717 a1!699)))

(assert (=> start!62476 (array_inv!6717 a2!699)))

(declare-fun b!280024 () Bool)

(assert (=> b!280024 (= e!199712 e!199711)))

(declare-fun res!232457 () Bool)

(assert (=> b!280024 (=> (not res!232457) (not e!199711))))

(assert (=> b!280024 (= res!232457 (= (_3!1148 lt!416664) (_4!368 lt!416664)))))

(declare-fun lt!416666 () Unit!19637)

(assert (=> b!280024 (= lt!416666 e!199714)))

(declare-fun c!12954 () Bool)

(assert (=> b!280024 (= c!12954 (bvslt (_1!12443 lt!416664) (_2!12443 lt!416664)))))

(assert (=> b!280024 (= lt!416663 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280024 (= lt!416667 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!736)

(assert (=> b!280024 (= lt!416664 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62476 res!232453) b!280023))

(assert (= (and b!280023 res!232456) b!280020))

(assert (= (and b!280020 res!232454) b!280024))

(assert (= (and b!280024 c!12954) b!280021))

(assert (= (and b!280024 (not c!12954)) b!280018))

(assert (= (and b!280024 res!232457) b!280022))

(assert (= (and b!280022 (not res!232455)) b!280019))

(declare-fun m!413037 () Bool)

(assert (=> b!280019 m!413037))

(declare-fun m!413039 () Bool)

(assert (=> b!280024 m!413039))

(declare-fun m!413041 () Bool)

(assert (=> b!280021 m!413041))

(declare-fun m!413043 () Bool)

(assert (=> b!280021 m!413043))

(declare-fun m!413045 () Bool)

(assert (=> b!280021 m!413045))

(declare-fun m!413047 () Bool)

(assert (=> b!280022 m!413047))

(declare-fun m!413049 () Bool)

(assert (=> b!280022 m!413049))

(assert (=> b!280022 m!413047))

(assert (=> b!280022 m!413049))

(declare-fun m!413051 () Bool)

(assert (=> b!280022 m!413051))

(assert (=> b!280022 m!413049))

(assert (=> b!280022 m!413047))

(declare-fun m!413053 () Bool)

(assert (=> b!280022 m!413053))

(declare-fun m!413055 () Bool)

(assert (=> start!62476 m!413055))

(declare-fun m!413057 () Bool)

(assert (=> start!62476 m!413057))

(declare-fun m!413059 () Bool)

(assert (=> b!280023 m!413059))

(push 1)

(assert (not b!280021))

(assert (not b!280019))

(assert (not b!280024))

(assert (not b!280022))

(assert (not b!280023))

(assert (not start!62476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!280111 () Bool)

(declare-fun e!199794 () Bool)

(declare-fun e!199796 () Bool)

(assert (=> b!280111 (= e!199794 e!199796)))

(declare-fun res!232525 () Bool)

(declare-fun call!4609 () Bool)

(assert (=> b!280111 (= res!232525 call!4609)))

(assert (=> b!280111 (=> (not res!232525) (not e!199796))))

(declare-fun b!280112 () Bool)

(declare-fun e!199797 () Bool)

(declare-fun lt!416705 () tuple4!736)

(assert (=> b!280112 (= e!199797 (arrayRangesEq!1261 a1!699 a2!699 (_1!12443 lt!416705) (_2!12443 lt!416705)))))

(declare-fun c!12965 () Bool)

(declare-fun lt!416704 () (_ BitVec 32))

(declare-fun lt!416706 () (_ BitVec 32))

(declare-fun bm!4606 () Bool)

(assert (=> bm!4606 (= call!4609 (byteRangesEq!0 (select (arr!7989 a1!699) (_3!1148 lt!416705)) (select (arr!7989 a2!699) (_3!1148 lt!416705)) lt!416704 (ite c!12965 lt!416706 #b00000000000000000000000000001000)))))

(declare-fun b!280113 () Bool)

(declare-fun res!232524 () Bool)

(assert (=> b!280113 (= res!232524 (= lt!416706 #b00000000000000000000000000000000))))

(declare-fun e!199798 () Bool)

(assert (=> b!280113 (=> res!232524 e!199798)))

(assert (=> b!280113 (= e!199796 e!199798)))

(declare-fun d!96332 () Bool)

(declare-fun res!232527 () Bool)

(declare-fun e!199795 () Bool)

(assert (=> d!96332 (=> res!232527 e!199795)))

(assert (=> d!96332 (= res!232527 (bvsge from!822 to!789))))

(assert (=> d!96332 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199795)))

(declare-fun b!280114 () Bool)

(assert (=> b!280114 (= e!199794 call!4609)))

(declare-fun b!280115 () Bool)

(declare-fun e!199793 () Bool)

(assert (=> b!280115 (= e!199793 e!199794)))

(assert (=> b!280115 (= c!12965 (= (_3!1148 lt!416705) (_4!368 lt!416705)))))

(declare-fun b!280116 () Bool)

(assert (=> b!280116 (= e!199798 (byteRangesEq!0 (select (arr!7989 a1!699) (_4!368 lt!416705)) (select (arr!7989 a2!699) (_4!368 lt!416705)) #b00000000000000000000000000000000 lt!416706))))

(declare-fun b!280117 () Bool)

(assert (=> b!280117 (= e!199795 e!199793)))

(declare-fun res!232528 () Bool)

(assert (=> b!280117 (=> (not res!232528) (not e!199793))))

(assert (=> b!280117 (= res!232528 e!199797)))

(declare-fun res!232526 () Bool)

(assert (=> b!280117 (=> res!232526 e!199797)))

(assert (=> b!280117 (= res!232526 (bvsge (_1!12443 lt!416705) (_2!12443 lt!416705)))))

(assert (=> b!280117 (= lt!416706 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280117 (= lt!416704 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280117 (= lt!416705 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!96332 (not res!232527)) b!280117))

(assert (= (and b!280117 (not res!232526)) b!280112))

(assert (= (and b!280117 res!232528) b!280115))

(assert (= (and b!280115 c!12965) b!280114))

(assert (= (and b!280115 (not c!12965)) b!280111))

(assert (= (and b!280111 res!232525) b!280113))

(assert (= (and b!280113 (not res!232524)) b!280116))

(assert (= (or b!280114 b!280111) bm!4606))

(declare-fun m!413145 () Bool)

(assert (=> b!280112 m!413145))

(declare-fun m!413147 () Bool)

(assert (=> bm!4606 m!413147))

(declare-fun m!413149 () Bool)

(assert (=> bm!4606 m!413149))

(assert (=> bm!4606 m!413147))

(assert (=> bm!4606 m!413149))

(declare-fun m!413151 () Bool)

(assert (=> bm!4606 m!413151))

(declare-fun m!413153 () Bool)

(assert (=> b!280116 m!413153))

(declare-fun m!413155 () Bool)

(assert (=> b!280116 m!413155))

(assert (=> b!280116 m!413153))

(assert (=> b!280116 m!413155))

(declare-fun m!413157 () Bool)

(assert (=> b!280116 m!413157))

(assert (=> b!280117 m!413039))

(assert (=> b!280023 d!96332))

(declare-fun d!96336 () Bool)

(assert (=> d!96336 (= (arrayBitIndices!0 from!822 to!789) (tuple4!737 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280024 d!96336))

(declare-fun d!96338 () Bool)

(assert (=> d!96338 (= (byteRangesEq!0 (select (arr!7989 a2!699) (_3!1148 lt!416664)) (select (arr!7989 a1!699) (_3!1148 lt!416664)) lt!416667 lt!416663) (or (= lt!416667 lt!416663) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7989 a2!699) (_3!1148 lt!416664))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416663))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416667)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7989 a1!699) (_3!1148 lt!416664))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416663))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416667)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24296 () Bool)

(assert (= bs!24296 d!96338))

(declare-fun m!413159 () Bool)

(assert (=> bs!24296 m!413159))

(declare-fun m!413161 () Bool)

(assert (=> bs!24296 m!413161))

(assert (=> b!280022 d!96338))

(declare-fun d!96340 () Bool)

(assert (=> d!96340 (= (byteRangesEq!0 (select (arr!7989 a1!699) (_3!1148 lt!416664)) (select (arr!7989 a2!699) (_3!1148 lt!416664)) lt!416667 lt!416663) (or (= lt!416667 lt!416663) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7989 a1!699) (_3!1148 lt!416664))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416663))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416667)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7989 a2!699) (_3!1148 lt!416664))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416663))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416667)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24297 () Bool)

(assert (= bs!24297 d!96340))

(assert (=> bs!24297 m!413159))

(assert (=> bs!24297 m!413161))

(assert (=> b!280022 d!96340))

(declare-fun d!96342 () Bool)


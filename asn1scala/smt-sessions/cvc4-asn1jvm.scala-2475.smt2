; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63010 () Bool)

(assert start!63010)

(declare-fun b!282021 () Bool)

(declare-datatypes ((Unit!19793 0))(
  ( (Unit!19794) )
))
(declare-fun e!201437 () Unit!19793)

(declare-fun Unit!19795 () Unit!19793)

(assert (=> b!282021 (= e!201437 Unit!19795)))

(declare-fun b!282022 () Bool)

(declare-fun e!201438 () Bool)

(declare-fun e!201435 () Bool)

(assert (=> b!282022 (= e!201438 e!201435)))

(declare-fun res!233990 () Bool)

(assert (=> b!282022 (=> (not res!233990) (not e!201435))))

(declare-datatypes ((tuple4!814 0))(
  ( (tuple4!815 (_1!12482 (_ BitVec 32)) (_2!12482 (_ BitVec 32)) (_3!1187 (_ BitVec 32)) (_4!407 (_ BitVec 32))) )
))
(declare-fun lt!417611 () tuple4!814)

(assert (=> b!282022 (= res!233990 (not (= (_3!1187 lt!417611) (_4!407 lt!417611))))))

(declare-fun lt!417610 () Unit!19793)

(assert (=> b!282022 (= lt!417610 e!201437)))

(declare-fun c!13191 () Bool)

(assert (=> b!282022 (= c!13191 (bvslt (_1!12482 lt!417611) (_2!12482 lt!417611)))))

(declare-fun lt!417612 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!282022 (= lt!417612 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417609 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!282022 (= lt!417609 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!814)

(assert (=> b!282022 (= lt!417611 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282023 () Bool)

(declare-fun e!201439 () Bool)

(assert (=> b!282023 (= e!201435 (not e!201439))))

(declare-fun res!233984 () Bool)

(assert (=> b!282023 (=> res!233984 e!201439)))

(assert (=> b!282023 (= res!233984 (= lt!417612 #b00000000000000000000000000000000))))

(declare-fun e!201441 () Bool)

(assert (=> b!282023 e!201441))

(declare-fun res!233982 () Bool)

(assert (=> b!282023 (=> (not res!233982) (not e!201441))))

(declare-datatypes ((array!16286 0))(
  ( (array!16287 (arr!8028 (Array (_ BitVec 32) (_ BitVec 8))) (size!7032 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16286)

(declare-fun a2!699 () array!16286)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282023 (= res!233982 (byteRangesEq!0 (select (arr!8028 a1!699) (_3!1187 lt!417611)) (select (arr!8028 a2!699) (_3!1187 lt!417611)) lt!417609 #b00000000000000000000000000001000))))

(declare-fun b!282024 () Bool)

(declare-fun res!233983 () Bool)

(assert (=> b!282024 (=> (not res!233983) (not e!201438))))

(declare-fun arrayBitRangesEq!0 (array!16286 array!16286 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!282024 (= res!233983 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!233986 () Bool)

(assert (=> start!63010 (=> (not res!233986) (not e!201438))))

(assert (=> start!63010 (= res!233986 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7032 a1!699) (size!7032 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7032 a1!699))))))))

(assert (=> start!63010 e!201438))

(assert (=> start!63010 true))

(declare-fun array_inv!6756 (array!16286) Bool)

(assert (=> start!63010 (array_inv!6756 a1!699)))

(assert (=> start!63010 (array_inv!6756 a2!699)))

(declare-fun e!201434 () Bool)

(declare-fun b!282025 () Bool)

(assert (=> b!282025 (= e!201434 (byteRangesEq!0 (select (arr!8028 a1!699) (_4!407 lt!417611)) (select (arr!8028 a2!699) (_4!407 lt!417611)) #b00000000000000000000000000000000 lt!417612))))

(declare-fun b!282026 () Bool)

(declare-fun res!233989 () Bool)

(assert (=> b!282026 (=> (not res!233989) (not e!201441))))

(assert (=> b!282026 (= res!233989 (byteRangesEq!0 (select (arr!8028 a2!699) (_3!1187 lt!417611)) (select (arr!8028 a1!699) (_3!1187 lt!417611)) lt!417609 #b00000000000000000000000000001000))))

(declare-fun b!282027 () Bool)

(assert (=> b!282027 (= e!201441 e!201434)))

(declare-fun res!233987 () Bool)

(assert (=> b!282027 (=> res!233987 e!201434)))

(assert (=> b!282027 (= res!233987 (= lt!417612 #b00000000000000000000000000000000))))

(declare-fun b!282028 () Bool)

(declare-fun Unit!19796 () Unit!19793)

(assert (=> b!282028 (= e!201437 Unit!19796)))

(declare-fun arrayRangesEq!1300 (array!16286 array!16286 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282028 (arrayRangesEq!1300 a1!699 a2!699 (_1!12482 lt!417611) (_2!12482 lt!417611))))

(declare-fun lt!417608 () Unit!19793)

(declare-fun arrayRangesEqSymmetricLemma!207 (array!16286 array!16286 (_ BitVec 32) (_ BitVec 32)) Unit!19793)

(assert (=> b!282028 (= lt!417608 (arrayRangesEqSymmetricLemma!207 a1!699 a2!699 (_1!12482 lt!417611) (_2!12482 lt!417611)))))

(assert (=> b!282028 (arrayRangesEq!1300 a2!699 a1!699 (_1!12482 lt!417611) (_2!12482 lt!417611))))

(declare-fun b!282029 () Bool)

(declare-fun res!233988 () Bool)

(assert (=> b!282029 (=> res!233988 e!201439)))

(assert (=> b!282029 (= res!233988 (not (byteRangesEq!0 (select (arr!8028 a2!699) (_4!407 lt!417611)) (select (arr!8028 a1!699) (_4!407 lt!417611)) #b00000000000000000000000000000000 lt!417612)))))

(declare-fun b!282030 () Bool)

(declare-fun res!233985 () Bool)

(assert (=> b!282030 (=> (not res!233985) (not e!201438))))

(assert (=> b!282030 (= res!233985 (bvslt from!822 to!789))))

(declare-fun b!282031 () Bool)

(assert (=> b!282031 (= e!201439 (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789))))

(assert (= (and start!63010 res!233986) b!282024))

(assert (= (and b!282024 res!233983) b!282030))

(assert (= (and b!282030 res!233985) b!282022))

(assert (= (and b!282022 c!13191) b!282028))

(assert (= (and b!282022 (not c!13191)) b!282021))

(assert (= (and b!282022 res!233990) b!282023))

(assert (= (and b!282023 res!233982) b!282026))

(assert (= (and b!282026 res!233989) b!282027))

(assert (= (and b!282027 (not res!233987)) b!282025))

(assert (= (and b!282023 (not res!233984)) b!282029))

(assert (= (and b!282029 (not res!233988)) b!282031))

(declare-fun m!415087 () Bool)

(assert (=> b!282028 m!415087))

(declare-fun m!415089 () Bool)

(assert (=> b!282028 m!415089))

(declare-fun m!415091 () Bool)

(assert (=> b!282028 m!415091))

(declare-fun m!415093 () Bool)

(assert (=> b!282029 m!415093))

(declare-fun m!415095 () Bool)

(assert (=> b!282029 m!415095))

(assert (=> b!282029 m!415093))

(assert (=> b!282029 m!415095))

(declare-fun m!415097 () Bool)

(assert (=> b!282029 m!415097))

(declare-fun m!415099 () Bool)

(assert (=> b!282031 m!415099))

(declare-fun m!415101 () Bool)

(assert (=> b!282022 m!415101))

(declare-fun m!415103 () Bool)

(assert (=> b!282026 m!415103))

(declare-fun m!415105 () Bool)

(assert (=> b!282026 m!415105))

(assert (=> b!282026 m!415103))

(assert (=> b!282026 m!415105))

(declare-fun m!415107 () Bool)

(assert (=> b!282026 m!415107))

(assert (=> b!282025 m!415095))

(assert (=> b!282025 m!415093))

(assert (=> b!282025 m!415095))

(assert (=> b!282025 m!415093))

(declare-fun m!415109 () Bool)

(assert (=> b!282025 m!415109))

(declare-fun m!415111 () Bool)

(assert (=> start!63010 m!415111))

(declare-fun m!415113 () Bool)

(assert (=> start!63010 m!415113))

(assert (=> b!282023 m!415105))

(assert (=> b!282023 m!415103))

(assert (=> b!282023 m!415105))

(assert (=> b!282023 m!415103))

(declare-fun m!415115 () Bool)

(assert (=> b!282023 m!415115))

(declare-fun m!415117 () Bool)

(assert (=> b!282024 m!415117))

(push 1)

(assert (not b!282023))

(assert (not b!282024))

(assert (not b!282022))

(assert (not b!282029))

(assert (not b!282026))

(assert (not b!282031))

(assert (not b!282028))

(assert (not b!282025))

(assert (not start!63010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97038 () Bool)

(assert (=> d!97038 (= (byteRangesEq!0 (select (arr!8028 a1!699) (_3!1187 lt!417611)) (select (arr!8028 a2!699) (_3!1187 lt!417611)) lt!417609 #b00000000000000000000000000001000) (or (= lt!417609 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8028 a1!699) (_3!1187 lt!417611))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417609)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8028 a2!699) (_3!1187 lt!417611))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417609)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24445 () Bool)

(assert (= bs!24445 d!97038))

(declare-fun m!415141 () Bool)

(assert (=> bs!24445 m!415141))

(declare-fun m!415143 () Bool)

(assert (=> bs!24445 m!415143))

(assert (=> b!282023 d!97038))

(declare-fun d!97040 () Bool)

(declare-fun res!234013 () Bool)

(declare-fun e!201466 () Bool)

(assert (=> d!97040 (=> res!234013 e!201466)))

(assert (=> d!97040 (= res!234013 (= (_1!12482 lt!417611) (_2!12482 lt!417611)))))

(assert (=> d!97040 (= (arrayRangesEq!1300 a1!699 a2!699 (_1!12482 lt!417611) (_2!12482 lt!417611)) e!201466)))

(declare-fun b!282058 () Bool)

(declare-fun e!201467 () Bool)

(assert (=> b!282058 (= e!201466 e!201467)))

(declare-fun res!234014 () Bool)

(assert (=> b!282058 (=> (not res!234014) (not e!201467))))

(assert (=> b!282058 (= res!234014 (= (select (arr!8028 a1!699) (_1!12482 lt!417611)) (select (arr!8028 a2!699) (_1!12482 lt!417611))))))

(declare-fun b!282059 () Bool)

(assert (=> b!282059 (= e!201467 (arrayRangesEq!1300 a1!699 a2!699 (bvadd (_1!12482 lt!417611) #b00000000000000000000000000000001) (_2!12482 lt!417611)))))

(assert (= (and d!97040 (not res!234013)) b!282058))

(assert (= (and b!282058 res!234014) b!282059))

(declare-fun m!415145 () Bool)

(assert (=> b!282058 m!415145))

(declare-fun m!415147 () Bool)

(assert (=> b!282058 m!415147))

(declare-fun m!415149 () Bool)

(assert (=> b!282059 m!415149))

(assert (=> b!282028 d!97040))

(declare-fun d!97042 () Bool)

(assert (=> d!97042 (arrayRangesEq!1300 a2!699 a1!699 (_1!12482 lt!417611) (_2!12482 lt!417611))))

(declare-fun lt!417630 () Unit!19793)

(declare-fun choose!509 (array!16286 array!16286 (_ BitVec 32) (_ BitVec 32)) Unit!19793)

(assert (=> d!97042 (= lt!417630 (choose!509 a1!699 a2!699 (_1!12482 lt!417611) (_2!12482 lt!417611)))))

(assert (=> d!97042 (and (bvsle #b00000000000000000000000000000000 (_1!12482 lt!417611)) (bvsle (_1!12482 lt!417611) (_2!12482 lt!417611)) (bvsle (_2!12482 lt!417611) (size!7032 a1!699)))))

(assert (=> d!97042 (= (arrayRangesEqSymmetricLemma!207 a1!699 a2!699 (_1!12482 lt!417611) (_2!12482 lt!417611)) lt!417630)))

(declare-fun bs!24446 () Bool)

(assert (= bs!24446 d!97042))

(assert (=> bs!24446 m!415091))

(declare-fun m!415151 () Bool)

(assert (=> bs!24446 m!415151))

(assert (=> b!282028 d!97042))

(declare-fun d!97044 () Bool)

(declare-fun res!234025 () Bool)

(declare-fun e!201480 () Bool)

(assert (=> d!97044 (=> res!234025 e!201480)))

(assert (=> d!97044 (= res!234025 (= (_1!12482 lt!417611) (_2!12482 lt!417611)))))

(assert (=> d!97044 (= (arrayRangesEq!1300 a2!699 a1!699 (_1!12482 lt!417611) (_2!12482 lt!417611)) e!201480)))

(declare-fun b!282074 () Bool)

(declare-fun e!201481 () Bool)

(assert (=> b!282074 (= e!201480 e!201481)))

(declare-fun res!234026 () Bool)

(assert (=> b!282074 (=> (not res!234026) (not e!201481))))

(assert (=> b!282074 (= res!234026 (= (select (arr!8028 a2!699) (_1!12482 lt!417611)) (select (arr!8028 a1!699) (_1!12482 lt!417611))))))

(declare-fun b!282075 () Bool)

(assert (=> b!282075 (= e!201481 (arrayRangesEq!1300 a2!699 a1!699 (bvadd (_1!12482 lt!417611) #b00000000000000000000000000000001) (_2!12482 lt!417611)))))

(assert (= (and d!97044 (not res!234025)) b!282074))

(assert (= (and b!282074 res!234026) b!282075))

(assert (=> b!282074 m!415147))

(assert (=> b!282074 m!415145))

(declare-fun m!415153 () Bool)

(assert (=> b!282075 m!415153))

(assert (=> b!282028 d!97044))

(declare-fun d!97046 () Bool)

(assert (=> d!97046 (= (byteRangesEq!0 (select (arr!8028 a2!699) (_4!407 lt!417611)) (select (arr!8028 a1!699) (_4!407 lt!417611)) #b00000000000000000000000000000000 lt!417612) (or (= #b00000000000000000000000000000000 lt!417612) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8028 a2!699) (_4!407 lt!417611))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417612))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8028 a1!699) (_4!407 lt!417611))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417612))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24447 () Bool)

(assert (= bs!24447 d!97046))

(declare-fun m!415155 () Bool)

(assert (=> bs!24447 m!415155))

(declare-fun m!415157 () Bool)

(assert (=> bs!24447 m!415157))

(assert (=> b!282029 d!97046))

(declare-fun d!97048 () Bool)

(declare-fun res!234068 () Bool)

(declare-fun e!201527 () Bool)

(assert (=> d!97048 (=> res!234068 e!201527)))

(assert (=> d!97048 (= res!234068 (bvsge from!822 to!789))))

(assert (=> d!97048 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201527)))

(declare-fun c!13202 () Bool)

(declare-fun bm!4726 () Bool)

(declare-fun lt!417653 () (_ BitVec 32))

(declare-fun lt!417654 () (_ BitVec 32))

(declare-fun call!4729 () Bool)

(declare-fun lt!417652 () tuple4!814)

(assert (=> bm!4726 (= call!4729 (byteRangesEq!0 (select (arr!8028 a1!699) (_3!1187 lt!417652)) (select (arr!8028 a2!699) (_3!1187 lt!417652)) lt!417653 (ite c!13202 lt!417654 #b00000000000000000000000000001000)))))

(declare-fun b!282126 () Bool)

(declare-fun e!201529 () Bool)

(assert (=> b!282126 (= e!201529 (byteRangesEq!0 (select (arr!8028 a1!699) (_4!407 lt!417652)) (select (arr!8028 a2!699) (_4!407 lt!417652)) #b00000000000000000000000000000000 lt!417654))))

(declare-fun b!282127 () Bool)

(declare-fun e!201530 () Bool)

(assert (=> b!282127 (= e!201527 e!201530)))

(declare-fun res!234065 () Bool)

(assert (=> b!282127 (=> (not res!234065) (not e!201530))))

(declare-fun e!201531 () Bool)

(assert (=> b!282127 (= res!234065 e!201531)))

(declare-fun res!234066 () Bool)

(assert (=> b!282127 (=> res!234066 e!201531)))

(assert (=> b!282127 (= res!234066 (bvsge (_1!12482 lt!417652) (_2!12482 lt!417652)))))

(assert (=> b!282127 (= lt!417654 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282127 (= lt!417653 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282127 (= lt!417652 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282128 () Bool)

(declare-fun e!201526 () Bool)

(declare-fun e!201528 () Bool)

(assert (=> b!282128 (= e!201526 e!201528)))

(declare-fun res!234067 () Bool)

(assert (=> b!282128 (= res!234067 call!4729)))

(assert (=> b!282128 (=> (not res!234067) (not e!201528))))

(declare-fun b!282129 () Bool)

(declare-fun res!234069 () Bool)

(assert (=> b!282129 (= res!234069 (= lt!417654 #b00000000000000000000000000000000))))

(assert (=> b!282129 (=> res!234069 e!201529)))

(assert (=> b!282129 (= e!201528 e!201529)))

(declare-fun b!282130 () Bool)

(assert (=> b!282130 (= e!201526 call!4729)))

(declare-fun b!282131 () Bool)

(assert (=> b!282131 (= e!201530 e!201526)))

(assert (=> b!282131 (= c!13202 (= (_3!1187 lt!417652) (_4!407 lt!417652)))))

(declare-fun b!282132 () Bool)

(assert (=> b!282132 (= e!201531 (arrayRangesEq!1300 a1!699 a2!699 (_1!12482 lt!417652) (_2!12482 lt!417652)))))

(assert (= (and d!97048 (not res!234068)) b!282127))

(assert (= (and b!282127 (not res!234066)) b!282132))

(assert (= (and b!282127 res!234065) b!282131))

(assert (= (and b!282131 c!13202) b!282130))

(assert (= (and b!282131 (not c!13202)) b!282128))

(assert (= (and b!282128 res!234067) b!282129))

(assert (= (and b!282129 (not res!234069)) b!282126))

(assert (= (or b!282130 b!282128) bm!4726))

(declare-fun m!415229 () Bool)

(assert (=> bm!4726 m!415229))

(declare-fun m!415231 () Bool)

(assert (=> bm!4726 m!415231))

(assert (=> bm!4726 m!415229))

(assert (=> bm!4726 m!415231))

(declare-fun m!415233 () Bool)

(assert (=> bm!4726 m!415233))

(declare-fun m!415235 () Bool)

(assert (=> b!282126 m!415235))

(declare-fun m!415237 () Bool)

(assert (=> b!282126 m!415237))

(assert (=> b!282126 m!415235))

(assert (=> b!282126 m!415237))

(declare-fun m!415239 () Bool)

(assert (=> b!282126 m!415239))

(assert (=> b!282127 m!415101))

(declare-fun m!415241 () Bool)

(assert (=> b!282132 m!415241))

(assert (=> b!282024 d!97048))

(declare-fun d!97076 () Bool)

(assert (=> d!97076 (= (byteRangesEq!0 (select (arr!8028 a1!699) (_4!407 lt!417611)) (select (arr!8028 a2!699) (_4!407 lt!417611)) #b00000000000000000000000000000000 lt!417612) (or (= #b00000000000000000000000000000000 lt!417612) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8028 a1!699) (_4!407 lt!417611))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417612))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8028 a2!699) (_4!407 lt!417611))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417612))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24453 () Bool)

(assert (= bs!24453 d!97076))

(assert (=> bs!24453 m!415155))

(assert (=> bs!24453 m!415157))

(assert (=> b!282025 d!97076))

(declare-fun d!97078 () Bool)

(assert (=> d!97078 (= (array_inv!6756 a1!699) (bvsge (size!7032 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!63010 d!97078))

(declare-fun d!97080 () Bool)

(assert (=> d!97080 (= (array_inv!6756 a2!699) (bvsge (size!7032 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!63010 d!97080))

(declare-fun d!97082 () Bool)

(declare-fun res!234073 () Bool)

(declare-fun e!201533 () Bool)

(assert (=> d!97082 (=> res!234073 e!201533)))

(assert (=> d!97082 (= res!234073 (bvsge from!822 to!789))))

(assert (=> d!97082 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!201533)))

(declare-fun call!4730 () Bool)

(declare-fun bm!4727 () Bool)

(declare-fun lt!417657 () (_ BitVec 32))

(declare-fun c!13203 () Bool)

(declare-fun lt!417655 () tuple4!814)

(declare-fun lt!417656 () (_ BitVec 32))

(assert (=> bm!4727 (= call!4730 (byteRangesEq!0 (select (arr!8028 a2!699) (_3!1187 lt!417655)) (select (arr!8028 a1!699) (_3!1187 lt!417655)) lt!417656 (ite c!13203 lt!417657 #b00000000000000000000000000001000)))))

(declare-fun b!282133 () Bool)

(declare-fun e!201535 () Bool)

(assert (=> b!282133 (= e!201535 (byteRangesEq!0 (select (arr!8028 a2!699) (_4!407 lt!417655)) (select (arr!8028 a1!699) (_4!407 lt!417655)) #b00000000000000000000000000000000 lt!417657))))

(declare-fun b!282134 () Bool)

(declare-fun e!201536 () Bool)

(assert (=> b!282134 (= e!201533 e!201536)))

(declare-fun res!234070 () Bool)

(assert (=> b!282134 (=> (not res!234070) (not e!201536))))

(declare-fun e!201537 () Bool)

(assert (=> b!282134 (= res!234070 e!201537)))

(declare-fun res!234071 () Bool)

(assert (=> b!282134 (=> res!234071 e!201537)))

(assert (=> b!282134 (= res!234071 (bvsge (_1!12482 lt!417655) (_2!12482 lt!417655)))))

(assert (=> b!282134 (= lt!417657 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282134 (= lt!417656 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282134 (= lt!417655 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282135 () Bool)

(declare-fun e!201532 () Bool)

(declare-fun e!201534 () Bool)

(assert (=> b!282135 (= e!201532 e!201534)))

(declare-fun res!234072 () Bool)

(assert (=> b!282135 (= res!234072 call!4730)))

(assert (=> b!282135 (=> (not res!234072) (not e!201534))))

(declare-fun b!282136 () Bool)

(declare-fun res!234074 () Bool)

(assert (=> b!282136 (= res!234074 (= lt!417657 #b00000000000000000000000000000000))))

(assert (=> b!282136 (=> res!234074 e!201535)))

(assert (=> b!282136 (= e!201534 e!201535)))

(declare-fun b!282137 () Bool)

(assert (=> b!282137 (= e!201532 call!4730)))

(declare-fun b!282138 () Bool)

(assert (=> b!282138 (= e!201536 e!201532)))

(assert (=> b!282138 (= c!13203 (= (_3!1187 lt!417655) (_4!407 lt!417655)))))

(declare-fun b!282139 () Bool)

(assert (=> b!282139 (= e!201537 (arrayRangesEq!1300 a2!699 a1!699 (_1!12482 lt!417655) (_2!12482 lt!417655)))))

(assert (= (and d!97082 (not res!234073)) b!282134))

(assert (= (and b!282134 (not res!234071)) b!282139))

(assert (= (and b!282134 res!234070) b!282138))

(assert (= (and b!282138 c!13203) b!282137))

(assert (= (and b!282138 (not c!13203)) b!282135))

(assert (= (and b!282135 res!234072) b!282136))

(assert (= (and b!282136 (not res!234074)) b!282133))

(assert (= (or b!282137 b!282135) bm!4727))

(declare-fun m!415243 () Bool)

(assert (=> bm!4727 m!415243))

(declare-fun m!415245 () Bool)

(assert (=> bm!4727 m!415245))

(assert (=> bm!4727 m!415243))

(assert (=> bm!4727 m!415245))

(declare-fun m!415247 () Bool)

(assert (=> bm!4727 m!415247))

(declare-fun m!415249 () Bool)

(assert (=> b!282133 m!415249))

(declare-fun m!415251 () Bool)

(assert (=> b!282133 m!415251))

(assert (=> b!282133 m!415249))

(assert (=> b!282133 m!415251))

(declare-fun m!415253 () Bool)

(assert (=> b!282133 m!415253))

(assert (=> b!282134 m!415101))

(declare-fun m!415255 () Bool)

(assert (=> b!282139 m!415255))

(assert (=> b!282031 d!97082))

(declare-fun d!97084 () Bool)

(assert (=> d!97084 (= (byteRangesEq!0 (select (arr!8028 a2!699) (_3!1187 lt!417611)) (select (arr!8028 a1!699) (_3!1187 lt!417611)) lt!417609 #b00000000000000000000000000001000) (or (= lt!417609 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8028 a2!699) (_3!1187 lt!417611))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417609)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8028 a1!699) (_3!1187 lt!417611))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417609)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24454 () Bool)

(assert (= bs!24454 d!97084))

(assert (=> bs!24454 m!415141))

(assert (=> bs!24454 m!415143))

(assert (=> b!282026 d!97084))

(declare-fun d!97086 () Bool)

(assert (=> d!97086 (= (arrayBitIndices!0 from!822 to!789) (tuple4!815 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!282022 d!97086))

(push 1)

(assert (not b!282075))

(assert (not b!282133))

(assert (not bm!4726))

(assert (not b!282134))

(assert (not b!282126))

(assert (not bm!4727))

(assert (not b!282059))

(assert (not b!282127))

(assert (not b!282132))

(assert (not b!282139))

(assert (not d!97042))

(check-sat)

(pop 1)

(push 1)

(check-sat)


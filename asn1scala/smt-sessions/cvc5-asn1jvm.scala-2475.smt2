; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63006 () Bool)

(assert start!63006)

(declare-fun b!281955 () Bool)

(declare-datatypes ((Unit!19785 0))(
  ( (Unit!19786) )
))
(declare-fun e!201392 () Unit!19785)

(declare-fun Unit!19787 () Unit!19785)

(assert (=> b!281955 (= e!201392 Unit!19787)))

(declare-datatypes ((array!16282 0))(
  ( (array!16283 (arr!8026 (Array (_ BitVec 32) (_ BitVec 8))) (size!7030 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16282)

(declare-fun a2!699 () array!16282)

(declare-datatypes ((tuple4!810 0))(
  ( (tuple4!811 (_1!12480 (_ BitVec 32)) (_2!12480 (_ BitVec 32)) (_3!1185 (_ BitVec 32)) (_4!405 (_ BitVec 32))) )
))
(declare-fun lt!417578 () tuple4!810)

(declare-fun arrayRangesEq!1298 (array!16282 array!16282 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281955 (arrayRangesEq!1298 a1!699 a2!699 (_1!12480 lt!417578) (_2!12480 lt!417578))))

(declare-fun lt!417579 () Unit!19785)

(declare-fun arrayRangesEqSymmetricLemma!205 (array!16282 array!16282 (_ BitVec 32) (_ BitVec 32)) Unit!19785)

(assert (=> b!281955 (= lt!417579 (arrayRangesEqSymmetricLemma!205 a1!699 a2!699 (_1!12480 lt!417578) (_2!12480 lt!417578)))))

(assert (=> b!281955 (arrayRangesEq!1298 a2!699 a1!699 (_1!12480 lt!417578) (_2!12480 lt!417578))))

(declare-fun b!281956 () Bool)

(declare-fun res!233934 () Bool)

(declare-fun e!201389 () Bool)

(assert (=> b!281956 (=> (not res!233934) (not e!201389))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!281956 (= res!233934 (bvslt from!822 to!789))))

(declare-fun b!281957 () Bool)

(declare-fun e!201386 () Bool)

(assert (=> b!281957 (= e!201389 e!201386)))

(declare-fun res!233936 () Bool)

(assert (=> b!281957 (=> (not res!233936) (not e!201386))))

(assert (=> b!281957 (= res!233936 (not (= (_3!1185 lt!417578) (_4!405 lt!417578))))))

(declare-fun lt!417580 () Unit!19785)

(assert (=> b!281957 (= lt!417580 e!201392)))

(declare-fun c!13185 () Bool)

(assert (=> b!281957 (= c!13185 (bvslt (_1!12480 lt!417578) (_2!12480 lt!417578)))))

(declare-fun lt!417581 () (_ BitVec 32))

(assert (=> b!281957 (= lt!417581 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417582 () (_ BitVec 32))

(assert (=> b!281957 (= lt!417582 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!810)

(assert (=> b!281957 (= lt!417578 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281958 () Bool)

(declare-fun res!233928 () Bool)

(assert (=> b!281958 (=> (not res!233928) (not e!201389))))

(declare-fun arrayBitRangesEq!0 (array!16282 array!16282 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!281958 (= res!233928 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!281959 () Bool)

(declare-fun res!233933 () Bool)

(declare-fun e!201390 () Bool)

(assert (=> b!281959 (=> res!233933 e!201390)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281959 (= res!233933 (not (byteRangesEq!0 (select (arr!8026 a2!699) (_4!405 lt!417578)) (select (arr!8026 a1!699) (_4!405 lt!417578)) #b00000000000000000000000000000000 lt!417581)))))

(declare-fun e!201387 () Bool)

(declare-fun b!281960 () Bool)

(assert (=> b!281960 (= e!201387 (byteRangesEq!0 (select (arr!8026 a1!699) (_4!405 lt!417578)) (select (arr!8026 a2!699) (_4!405 lt!417578)) #b00000000000000000000000000000000 lt!417581))))

(declare-fun b!281961 () Bool)

(assert (=> b!281961 (= e!201386 (not e!201390))))

(declare-fun res!233935 () Bool)

(assert (=> b!281961 (=> res!233935 e!201390)))

(assert (=> b!281961 (= res!233935 (= lt!417581 #b00000000000000000000000000000000))))

(declare-fun e!201393 () Bool)

(assert (=> b!281961 e!201393))

(declare-fun res!233931 () Bool)

(assert (=> b!281961 (=> (not res!233931) (not e!201393))))

(assert (=> b!281961 (= res!233931 (byteRangesEq!0 (select (arr!8026 a1!699) (_3!1185 lt!417578)) (select (arr!8026 a2!699) (_3!1185 lt!417578)) lt!417582 #b00000000000000000000000000001000))))

(declare-fun b!281962 () Bool)

(declare-fun Unit!19788 () Unit!19785)

(assert (=> b!281962 (= e!201392 Unit!19788)))

(declare-fun b!281963 () Bool)

(declare-fun res!233929 () Bool)

(assert (=> b!281963 (=> (not res!233929) (not e!201393))))

(assert (=> b!281963 (= res!233929 (byteRangesEq!0 (select (arr!8026 a2!699) (_3!1185 lt!417578)) (select (arr!8026 a1!699) (_3!1185 lt!417578)) lt!417582 #b00000000000000000000000000001000))))

(declare-fun b!281964 () Bool)

(assert (=> b!281964 (= e!201390 (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789))))

(declare-fun res!233930 () Bool)

(assert (=> start!63006 (=> (not res!233930) (not e!201389))))

(assert (=> start!63006 (= res!233930 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7030 a1!699) (size!7030 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7030 a1!699))))))))

(assert (=> start!63006 e!201389))

(assert (=> start!63006 true))

(declare-fun array_inv!6754 (array!16282) Bool)

(assert (=> start!63006 (array_inv!6754 a1!699)))

(assert (=> start!63006 (array_inv!6754 a2!699)))

(declare-fun b!281965 () Bool)

(assert (=> b!281965 (= e!201393 e!201387)))

(declare-fun res!233932 () Bool)

(assert (=> b!281965 (=> res!233932 e!201387)))

(assert (=> b!281965 (= res!233932 (= lt!417581 #b00000000000000000000000000000000))))

(assert (= (and start!63006 res!233930) b!281958))

(assert (= (and b!281958 res!233928) b!281956))

(assert (= (and b!281956 res!233934) b!281957))

(assert (= (and b!281957 c!13185) b!281955))

(assert (= (and b!281957 (not c!13185)) b!281962))

(assert (= (and b!281957 res!233936) b!281961))

(assert (= (and b!281961 res!233931) b!281963))

(assert (= (and b!281963 res!233929) b!281965))

(assert (= (and b!281965 (not res!233932)) b!281960))

(assert (= (and b!281961 (not res!233935)) b!281959))

(assert (= (and b!281959 (not res!233933)) b!281964))

(declare-fun m!415023 () Bool)

(assert (=> b!281963 m!415023))

(declare-fun m!415025 () Bool)

(assert (=> b!281963 m!415025))

(assert (=> b!281963 m!415023))

(assert (=> b!281963 m!415025))

(declare-fun m!415027 () Bool)

(assert (=> b!281963 m!415027))

(declare-fun m!415029 () Bool)

(assert (=> b!281958 m!415029))

(declare-fun m!415031 () Bool)

(assert (=> b!281959 m!415031))

(declare-fun m!415033 () Bool)

(assert (=> b!281959 m!415033))

(assert (=> b!281959 m!415031))

(assert (=> b!281959 m!415033))

(declare-fun m!415035 () Bool)

(assert (=> b!281959 m!415035))

(declare-fun m!415037 () Bool)

(assert (=> start!63006 m!415037))

(declare-fun m!415039 () Bool)

(assert (=> start!63006 m!415039))

(assert (=> b!281961 m!415025))

(assert (=> b!281961 m!415023))

(assert (=> b!281961 m!415025))

(assert (=> b!281961 m!415023))

(declare-fun m!415041 () Bool)

(assert (=> b!281961 m!415041))

(declare-fun m!415043 () Bool)

(assert (=> b!281957 m!415043))

(declare-fun m!415045 () Bool)

(assert (=> b!281964 m!415045))

(assert (=> b!281960 m!415033))

(assert (=> b!281960 m!415031))

(assert (=> b!281960 m!415033))

(assert (=> b!281960 m!415031))

(declare-fun m!415047 () Bool)

(assert (=> b!281960 m!415047))

(declare-fun m!415049 () Bool)

(assert (=> b!281955 m!415049))

(declare-fun m!415051 () Bool)

(assert (=> b!281955 m!415051))

(declare-fun m!415053 () Bool)

(assert (=> b!281955 m!415053))

(push 1)

(assert (not b!281959))

(assert (not b!281963))

(assert (not b!281958))

(assert (not b!281964))

(assert (not b!281960))

(assert (not start!63006))

(assert (not b!281957))

(assert (not b!281961))

(assert (not b!281955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97022 () Bool)

(assert (=> d!97022 (= (byteRangesEq!0 (select (arr!8026 a2!699) (_4!405 lt!417578)) (select (arr!8026 a1!699) (_4!405 lt!417578)) #b00000000000000000000000000000000 lt!417581) (or (= #b00000000000000000000000000000000 lt!417581) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8026 a2!699) (_4!405 lt!417578))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417581))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8026 a1!699) (_4!405 lt!417578))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417581))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24443 () Bool)

(assert (= bs!24443 d!97022))

(declare-fun m!415133 () Bool)

(assert (=> bs!24443 m!415133))

(declare-fun m!415135 () Bool)

(assert (=> bs!24443 m!415135))

(assert (=> b!281959 d!97022))

(declare-fun d!97028 () Bool)

(assert (=> d!97028 (= (array_inv!6754 a1!699) (bvsge (size!7030 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!63006 d!97028))

(declare-fun d!97030 () Bool)

(assert (=> d!97030 (= (array_inv!6754 a2!699) (bvsge (size!7030 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!63006 d!97030))

(declare-fun d!97032 () Bool)

(declare-fun res!234031 () Bool)

(declare-fun e!201483 () Bool)

(assert (=> d!97032 (=> res!234031 e!201483)))

(assert (=> d!97032 (= res!234031 (bvsge from!822 to!789))))

(assert (=> d!97032 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!201483)))

(declare-fun b!282076 () Bool)

(declare-fun e!201487 () Bool)

(declare-fun e!201485 () Bool)

(assert (=> b!282076 (= e!201487 e!201485)))

(declare-fun c!13196 () Bool)

(declare-fun lt!417632 () tuple4!810)

(assert (=> b!282076 (= c!13196 (= (_3!1185 lt!417632) (_4!405 lt!417632)))))

(declare-fun b!282077 () Bool)

(declare-fun call!4723 () Bool)

(assert (=> b!282077 (= e!201485 call!4723)))

(declare-fun b!282078 () Bool)

(declare-fun e!201482 () Bool)

(assert (=> b!282078 (= e!201482 (arrayRangesEq!1298 a2!699 a1!699 (_1!12480 lt!417632) (_2!12480 lt!417632)))))

(declare-fun b!282079 () Bool)

(declare-fun res!234030 () Bool)

(declare-fun lt!417631 () (_ BitVec 32))

(assert (=> b!282079 (= res!234030 (= lt!417631 #b00000000000000000000000000000000))))

(declare-fun e!201486 () Bool)

(assert (=> b!282079 (=> res!234030 e!201486)))

(declare-fun e!201484 () Bool)

(assert (=> b!282079 (= e!201484 e!201486)))

(declare-fun b!282080 () Bool)

(assert (=> b!282080 (= e!201483 e!201487)))

(declare-fun res!234027 () Bool)

(assert (=> b!282080 (=> (not res!234027) (not e!201487))))

(assert (=> b!282080 (= res!234027 e!201482)))

(declare-fun res!234028 () Bool)

(assert (=> b!282080 (=> res!234028 e!201482)))

(assert (=> b!282080 (= res!234028 (bvsge (_1!12480 lt!417632) (_2!12480 lt!417632)))))

(assert (=> b!282080 (= lt!417631 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417633 () (_ BitVec 32))

(assert (=> b!282080 (= lt!417633 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282080 (= lt!417632 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4720 () Bool)

(assert (=> bm!4720 (= call!4723 (byteRangesEq!0 (ite c!13196 (select (arr!8026 a2!699) (_3!1185 lt!417632)) (select (arr!8026 a2!699) (_4!405 lt!417632))) (ite c!13196 (select (arr!8026 a1!699) (_3!1185 lt!417632)) (select (arr!8026 a1!699) (_4!405 lt!417632))) (ite c!13196 lt!417633 #b00000000000000000000000000000000) lt!417631))))

(declare-fun b!282081 () Bool)

(assert (=> b!282081 (= e!201486 call!4723)))

(declare-fun b!282082 () Bool)

(assert (=> b!282082 (= e!201485 e!201484)))

(declare-fun res!234029 () Bool)

(assert (=> b!282082 (= res!234029 (byteRangesEq!0 (select (arr!8026 a2!699) (_3!1185 lt!417632)) (select (arr!8026 a1!699) (_3!1185 lt!417632)) lt!417633 #b00000000000000000000000000001000))))

(assert (=> b!282082 (=> (not res!234029) (not e!201484))))

(assert (= (and d!97032 (not res!234031)) b!282080))

(assert (= (and b!282080 (not res!234028)) b!282078))

(assert (= (and b!282080 res!234027) b!282076))

(assert (= (and b!282076 c!13196) b!282077))

(assert (= (and b!282076 (not c!13196)) b!282082))

(assert (= (and b!282082 res!234029) b!282079))

(assert (= (and b!282079 (not res!234030)) b!282081))

(assert (= (or b!282077 b!282081) bm!4720))

(declare-fun m!415159 () Bool)

(assert (=> b!282078 m!415159))

(assert (=> b!282080 m!415043))

(declare-fun m!415161 () Bool)

(assert (=> bm!4720 m!415161))

(declare-fun m!415163 () Bool)

(assert (=> bm!4720 m!415163))

(declare-fun m!415165 () Bool)

(assert (=> bm!4720 m!415165))

(declare-fun m!415167 () Bool)

(assert (=> bm!4720 m!415167))

(declare-fun m!415169 () Bool)

(assert (=> bm!4720 m!415169))

(assert (=> b!282082 m!415169))

(assert (=> b!282082 m!415161))

(assert (=> b!282082 m!415169))

(assert (=> b!282082 m!415161))

(declare-fun m!415171 () Bool)

(assert (=> b!282082 m!415171))

(assert (=> b!281964 d!97032))

(declare-fun d!97050 () Bool)

(declare-fun res!234036 () Bool)

(declare-fun e!201492 () Bool)

(assert (=> d!97050 (=> res!234036 e!201492)))

(assert (=> d!97050 (= res!234036 (= (_1!12480 lt!417578) (_2!12480 lt!417578)))))

(assert (=> d!97050 (= (arrayRangesEq!1298 a1!699 a2!699 (_1!12480 lt!417578) (_2!12480 lt!417578)) e!201492)))

(declare-fun b!282087 () Bool)

(declare-fun e!201493 () Bool)

(assert (=> b!282087 (= e!201492 e!201493)))

(declare-fun res!234037 () Bool)

(assert (=> b!282087 (=> (not res!234037) (not e!201493))))

(assert (=> b!282087 (= res!234037 (= (select (arr!8026 a1!699) (_1!12480 lt!417578)) (select (arr!8026 a2!699) (_1!12480 lt!417578))))))

(declare-fun b!282088 () Bool)

(assert (=> b!282088 (= e!201493 (arrayRangesEq!1298 a1!699 a2!699 (bvadd (_1!12480 lt!417578) #b00000000000000000000000000000001) (_2!12480 lt!417578)))))

(assert (= (and d!97050 (not res!234036)) b!282087))

(assert (= (and b!282087 res!234037) b!282088))

(declare-fun m!415173 () Bool)

(assert (=> b!282087 m!415173))

(declare-fun m!415175 () Bool)

(assert (=> b!282087 m!415175))

(declare-fun m!415177 () Bool)

(assert (=> b!282088 m!415177))

(assert (=> b!281955 d!97050))

(declare-fun d!97052 () Bool)

(assert (=> d!97052 (arrayRangesEq!1298 a2!699 a1!699 (_1!12480 lt!417578) (_2!12480 lt!417578))))

(declare-fun lt!417642 () Unit!19785)

(declare-fun choose!508 (array!16282 array!16282 (_ BitVec 32) (_ BitVec 32)) Unit!19785)

(assert (=> d!97052 (= lt!417642 (choose!508 a1!699 a2!699 (_1!12480 lt!417578) (_2!12480 lt!417578)))))

(assert (=> d!97052 (and (bvsle #b00000000000000000000000000000000 (_1!12480 lt!417578)) (bvsle (_1!12480 lt!417578) (_2!12480 lt!417578)) (bvsle (_2!12480 lt!417578) (size!7030 a1!699)))))

(assert (=> d!97052 (= (arrayRangesEqSymmetricLemma!205 a1!699 a2!699 (_1!12480 lt!417578) (_2!12480 lt!417578)) lt!417642)))

(declare-fun bs!24448 () Bool)

(assert (= bs!24448 d!97052))

(assert (=> bs!24448 m!415053))

(declare-fun m!415193 () Bool)

(assert (=> bs!24448 m!415193))

(assert (=> b!281955 d!97052))

(declare-fun d!97056 () Bool)

(declare-fun res!234048 () Bool)

(declare-fun e!201506 () Bool)

(assert (=> d!97056 (=> res!234048 e!201506)))

(assert (=> d!97056 (= res!234048 (= (_1!12480 lt!417578) (_2!12480 lt!417578)))))

(assert (=> d!97056 (= (arrayRangesEq!1298 a2!699 a1!699 (_1!12480 lt!417578) (_2!12480 lt!417578)) e!201506)))

(declare-fun b!282103 () Bool)

(declare-fun e!201507 () Bool)

(assert (=> b!282103 (= e!201506 e!201507)))

(declare-fun res!234049 () Bool)

(assert (=> b!282103 (=> (not res!234049) (not e!201507))))

(assert (=> b!282103 (= res!234049 (= (select (arr!8026 a2!699) (_1!12480 lt!417578)) (select (arr!8026 a1!699) (_1!12480 lt!417578))))))

(declare-fun b!282104 () Bool)

(assert (=> b!282104 (= e!201507 (arrayRangesEq!1298 a2!699 a1!699 (bvadd (_1!12480 lt!417578) #b00000000000000000000000000000001) (_2!12480 lt!417578)))))

(assert (= (and d!97056 (not res!234048)) b!282103))

(assert (= (and b!282103 res!234049) b!282104))

(assert (=> b!282103 m!415175))

(assert (=> b!282103 m!415173))

(declare-fun m!415195 () Bool)

(assert (=> b!282104 m!415195))

(assert (=> b!281955 d!97056))

(declare-fun d!97058 () Bool)

(assert (=> d!97058 (= (byteRangesEq!0 (select (arr!8026 a1!699) (_4!405 lt!417578)) (select (arr!8026 a2!699) (_4!405 lt!417578)) #b00000000000000000000000000000000 lt!417581) (or (= #b00000000000000000000000000000000 lt!417581) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8026 a1!699) (_4!405 lt!417578))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417581))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8026 a2!699) (_4!405 lt!417578))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417581))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24449 () Bool)

(assert (= bs!24449 d!97058))

(assert (=> bs!24449 m!415133))

(assert (=> bs!24449 m!415135))

(assert (=> b!281960 d!97058))

(declare-fun d!97060 () Bool)

(assert (=> d!97060 (= (byteRangesEq!0 (select (arr!8026 a1!699) (_3!1185 lt!417578)) (select (arr!8026 a2!699) (_3!1185 lt!417578)) lt!417582 #b00000000000000000000000000001000) (or (= lt!417582 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8026 a1!699) (_3!1185 lt!417578))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417582)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8026 a2!699) (_3!1185 lt!417578))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417582)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24450 () Bool)

(assert (= bs!24450 d!97060))

(declare-fun m!415211 () Bool)

(assert (=> bs!24450 m!415211))

(declare-fun m!415213 () Bool)

(assert (=> bs!24450 m!415213))

(assert (=> b!281961 d!97060))

(declare-fun d!97064 () Bool)

(assert (=> d!97064 (= (arrayBitIndices!0 from!822 to!789) (tuple4!811 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!281957 d!97064))

(declare-fun d!97072 () Bool)

(assert (=> d!97072 (= (byteRangesEq!0 (select (arr!8026 a2!699) (_3!1185 lt!417578)) (select (arr!8026 a1!699) (_3!1185 lt!417578)) lt!417582 #b00000000000000000000000000001000) (or (= lt!417582 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8026 a2!699) (_3!1185 lt!417578))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417582)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8026 a1!699) (_3!1185 lt!417578))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417582)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24452 () Bool)

(assert (= bs!24452 d!97072))

(assert (=> bs!24452 m!415211))

(assert (=> bs!24452 m!415213))

(assert (=> b!281963 d!97072))

(declare-fun d!97074 () Bool)

(declare-fun res!234064 () Bool)

(declare-fun e!201521 () Bool)

(assert (=> d!97074 (=> res!234064 e!201521)))

(assert (=> d!97074 (= res!234064 (bvsge from!822 to!789))))

(assert (=> d!97074 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201521)))

(declare-fun b!282119 () Bool)

(declare-fun e!201525 () Bool)

(declare-fun e!201523 () Bool)

(assert (=> b!282119 (= e!201525 e!201523)))

(declare-fun c!13201 () Bool)

(declare-fun lt!417650 () tuple4!810)

(assert (=> b!282119 (= c!13201 (= (_3!1185 lt!417650) (_4!405 lt!417650)))))

(declare-fun b!282120 () Bool)

(declare-fun call!4728 () Bool)

(assert (=> b!282120 (= e!201523 call!4728)))

(declare-fun e!201520 () Bool)

(declare-fun b!282121 () Bool)

(assert (=> b!282121 (= e!201520 (arrayRangesEq!1298 a1!699 a2!699 (_1!12480 lt!417650) (_2!12480 lt!417650)))))

(declare-fun b!282122 () Bool)

(declare-fun res!234063 () Bool)

(declare-fun lt!417649 () (_ BitVec 32))

(assert (=> b!282122 (= res!234063 (= lt!417649 #b00000000000000000000000000000000))))

(declare-fun e!201524 () Bool)

(assert (=> b!282122 (=> res!234063 e!201524)))

(declare-fun e!201522 () Bool)

(assert (=> b!282122 (= e!201522 e!201524)))

(declare-fun b!282123 () Bool)

(assert (=> b!282123 (= e!201521 e!201525)))

(declare-fun res!234060 () Bool)

(assert (=> b!282123 (=> (not res!234060) (not e!201525))))

(assert (=> b!282123 (= res!234060 e!201520)))

(declare-fun res!234061 () Bool)

(assert (=> b!282123 (=> res!234061 e!201520)))

(assert (=> b!282123 (= res!234061 (bvsge (_1!12480 lt!417650) (_2!12480 lt!417650)))))

(assert (=> b!282123 (= lt!417649 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417651 () (_ BitVec 32))

(assert (=> b!282123 (= lt!417651 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282123 (= lt!417650 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4725 () Bool)

(assert (=> bm!4725 (= call!4728 (byteRangesEq!0 (ite c!13201 (select (arr!8026 a1!699) (_3!1185 lt!417650)) (select (arr!8026 a1!699) (_4!405 lt!417650))) (ite c!13201 (select (arr!8026 a2!699) (_3!1185 lt!417650)) (select (arr!8026 a2!699) (_4!405 lt!417650))) (ite c!13201 lt!417651 #b00000000000000000000000000000000) lt!417649))))

(declare-fun b!282124 () Bool)

(assert (=> b!282124 (= e!201524 call!4728)))

(declare-fun b!282125 () Bool)

(assert (=> b!282125 (= e!201523 e!201522)))

(declare-fun res!234062 () Bool)

(assert (=> b!282125 (= res!234062 (byteRangesEq!0 (select (arr!8026 a1!699) (_3!1185 lt!417650)) (select (arr!8026 a2!699) (_3!1185 lt!417650)) lt!417651 #b00000000000000000000000000001000))))

(assert (=> b!282125 (=> (not res!234062) (not e!201522))))

(assert (= (and d!97074 (not res!234064)) b!282123))

(assert (= (and b!282123 (not res!234061)) b!282121))

(assert (= (and b!282123 res!234060) b!282119))

(assert (= (and b!282119 c!13201) b!282120))

(assert (= (and b!282119 (not c!13201)) b!282125))

(assert (= (and b!282125 res!234062) b!282122))

(assert (= (and b!282122 (not res!234063)) b!282124))

(assert (= (or b!282120 b!282124) bm!4725))

(declare-fun m!415215 () Bool)

(assert (=> b!282121 m!415215))

(assert (=> b!282123 m!415043))

(declare-fun m!415217 () Bool)

(assert (=> bm!4725 m!415217))

(declare-fun m!415219 () Bool)

(assert (=> bm!4725 m!415219))

(declare-fun m!415221 () Bool)

(assert (=> bm!4725 m!415221))

(declare-fun m!415223 () Bool)

(assert (=> bm!4725 m!415223))

(declare-fun m!415225 () Bool)

(assert (=> bm!4725 m!415225))

(assert (=> b!282125 m!415225))

(assert (=> b!282125 m!415217))

(assert (=> b!282125 m!415225))

(assert (=> b!282125 m!415217))

(declare-fun m!415227 () Bool)

(assert (=> b!282125 m!415227))

(assert (=> b!281958 d!97074))

(push 1)

(assert (not b!282088))

(assert (not b!282125))

(assert (not b!282078))

(assert (not b!282121))

(assert (not bm!4720))

(assert (not d!97052))

(assert (not bm!4725))

(assert (not b!282104))

(assert (not b!282082))

(assert (not b!282080))

(assert (not b!282123))

(check-sat)

(pop 1)

(push 1)

(check-sat)


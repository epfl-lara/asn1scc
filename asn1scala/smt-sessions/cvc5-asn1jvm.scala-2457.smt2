; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62268 () Bool)

(assert start!62268)

(declare-fun b!279276 () Bool)

(declare-datatypes ((Unit!19569 0))(
  ( (Unit!19570) )
))
(declare-fun e!199067 () Unit!19569)

(declare-fun Unit!19571 () Unit!19569)

(assert (=> b!279276 (= e!199067 Unit!19571)))

(declare-fun res!231903 () Bool)

(declare-fun e!199066 () Bool)

(assert (=> start!62268 (=> (not res!231903) (not e!199066))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16120 0))(
  ( (array!16121 (arr!7972 (Array (_ BitVec 32) (_ BitVec 8))) (size!6976 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16120)

(declare-fun a2!699 () array!16120)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62268 (= res!231903 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6976 a1!699) (size!6976 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6976 a1!699))))))))

(assert (=> start!62268 e!199066))

(assert (=> start!62268 true))

(declare-fun array_inv!6700 (array!16120) Bool)

(assert (=> start!62268 (array_inv!6700 a1!699)))

(assert (=> start!62268 (array_inv!6700 a2!699)))

(declare-fun b!279277 () Bool)

(declare-fun res!231904 () Bool)

(assert (=> b!279277 (=> (not res!231904) (not e!199066))))

(declare-fun arrayBitRangesEq!0 (array!16120 array!16120 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279277 (= res!231904 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279278 () Bool)

(declare-datatypes ((tuple4!702 0))(
  ( (tuple4!703 (_1!12426 (_ BitVec 32)) (_2!12426 (_ BitVec 32)) (_3!1131 (_ BitVec 32)) (_4!351 (_ BitVec 32))) )
))
(declare-fun lt!416298 () tuple4!702)

(assert (=> b!279278 (= e!199066 (and (= (_3!1131 lt!416298) (_4!351 lt!416298)) (or (bvslt (_3!1131 lt!416298) #b00000000000000000000000000000000) (bvsge (_3!1131 lt!416298) (size!6976 a2!699)))))))

(declare-fun lt!416297 () Unit!19569)

(assert (=> b!279278 (= lt!416297 e!199067)))

(declare-fun c!12858 () Bool)

(assert (=> b!279278 (= c!12858 (bvslt (_1!12426 lt!416298) (_2!12426 lt!416298)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!702)

(assert (=> b!279278 (= lt!416298 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279279 () Bool)

(declare-fun Unit!19572 () Unit!19569)

(assert (=> b!279279 (= e!199067 Unit!19572)))

(declare-fun arrayRangesEq!1244 (array!16120 array!16120 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279279 (arrayRangesEq!1244 a1!699 a2!699 (_1!12426 lt!416298) (_2!12426 lt!416298))))

(declare-fun lt!416296 () Unit!19569)

(declare-fun arrayRangesEqSymmetricLemma!151 (array!16120 array!16120 (_ BitVec 32) (_ BitVec 32)) Unit!19569)

(assert (=> b!279279 (= lt!416296 (arrayRangesEqSymmetricLemma!151 a1!699 a2!699 (_1!12426 lt!416298) (_2!12426 lt!416298)))))

(assert (=> b!279279 (arrayRangesEq!1244 a2!699 a1!699 (_1!12426 lt!416298) (_2!12426 lt!416298))))

(declare-fun b!279280 () Bool)

(declare-fun res!231905 () Bool)

(assert (=> b!279280 (=> (not res!231905) (not e!199066))))

(assert (=> b!279280 (= res!231905 (bvslt from!822 to!789))))

(assert (= (and start!62268 res!231903) b!279277))

(assert (= (and b!279277 res!231904) b!279280))

(assert (= (and b!279280 res!231905) b!279278))

(assert (= (and b!279278 c!12858) b!279279))

(assert (= (and b!279278 (not c!12858)) b!279276))

(declare-fun m!412321 () Bool)

(assert (=> start!62268 m!412321))

(declare-fun m!412323 () Bool)

(assert (=> start!62268 m!412323))

(declare-fun m!412325 () Bool)

(assert (=> b!279277 m!412325))

(declare-fun m!412327 () Bool)

(assert (=> b!279278 m!412327))

(declare-fun m!412329 () Bool)

(assert (=> b!279279 m!412329))

(declare-fun m!412331 () Bool)

(assert (=> b!279279 m!412331))

(declare-fun m!412333 () Bool)

(assert (=> b!279279 m!412333))

(push 1)

(assert (not b!279277))

(assert (not b!279279))

(assert (not b!279278))

(assert (not start!62268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!279331 () Bool)

(declare-fun e!199113 () Bool)

(declare-fun call!4556 () Bool)

(assert (=> b!279331 (= e!199113 call!4556)))

(declare-fun b!279332 () Bool)

(declare-fun e!199112 () Bool)

(assert (=> b!279332 (= e!199112 e!199113)))

(declare-fun c!12867 () Bool)

(declare-fun lt!416328 () tuple4!702)

(assert (=> b!279332 (= c!12867 (= (_3!1131 lt!416328) (_4!351 lt!416328)))))

(declare-fun d!96044 () Bool)

(declare-fun res!231941 () Bool)

(declare-fun e!199115 () Bool)

(assert (=> d!96044 (=> res!231941 e!199115)))

(assert (=> d!96044 (= res!231941 (bvsge from!822 to!789))))

(assert (=> d!96044 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199115)))

(declare-fun b!279333 () Bool)

(declare-fun e!199116 () Bool)

(assert (=> b!279333 (= e!199116 (arrayRangesEq!1244 a1!699 a2!699 (_1!12426 lt!416328) (_2!12426 lt!416328)))))

(declare-fun b!279334 () Bool)

(declare-fun res!231943 () Bool)

(declare-fun lt!416327 () (_ BitVec 32))

(assert (=> b!279334 (= res!231943 (= lt!416327 #b00000000000000000000000000000000))))

(declare-fun e!199111 () Bool)

(assert (=> b!279334 (=> res!231943 e!199111)))

(declare-fun e!199114 () Bool)

(assert (=> b!279334 (= e!199114 e!199111)))

(declare-fun b!279335 () Bool)

(assert (=> b!279335 (= e!199111 call!4556)))

(declare-fun lt!416326 () (_ BitVec 32))

(declare-fun bm!4553 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4553 (= call!4556 (byteRangesEq!0 (ite c!12867 (select (arr!7972 a1!699) (_3!1131 lt!416328)) (select (arr!7972 a1!699) (_4!351 lt!416328))) (ite c!12867 (select (arr!7972 a2!699) (_3!1131 lt!416328)) (select (arr!7972 a2!699) (_4!351 lt!416328))) (ite c!12867 lt!416326 #b00000000000000000000000000000000) lt!416327))))

(declare-fun b!279336 () Bool)

(assert (=> b!279336 (= e!199113 e!199114)))

(declare-fun res!231944 () Bool)

(assert (=> b!279336 (= res!231944 (byteRangesEq!0 (select (arr!7972 a1!699) (_3!1131 lt!416328)) (select (arr!7972 a2!699) (_3!1131 lt!416328)) lt!416326 #b00000000000000000000000000001000))))

(assert (=> b!279336 (=> (not res!231944) (not e!199114))))

(declare-fun b!279337 () Bool)

(assert (=> b!279337 (= e!199115 e!199112)))

(declare-fun res!231942 () Bool)

(assert (=> b!279337 (=> (not res!231942) (not e!199112))))

(assert (=> b!279337 (= res!231942 e!199116)))

(declare-fun res!231940 () Bool)

(assert (=> b!279337 (=> res!231940 e!199116)))

(assert (=> b!279337 (= res!231940 (bvsge (_1!12426 lt!416328) (_2!12426 lt!416328)))))

(assert (=> b!279337 (= lt!416327 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279337 (= lt!416326 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279337 (= lt!416328 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!96044 (not res!231941)) b!279337))

(assert (= (and b!279337 (not res!231940)) b!279333))

(assert (= (and b!279337 res!231942) b!279332))

(assert (= (and b!279332 c!12867) b!279331))

(assert (= (and b!279332 (not c!12867)) b!279336))

(assert (= (and b!279336 res!231944) b!279334))

(assert (= (and b!279334 (not res!231943)) b!279335))

(assert (= (or b!279331 b!279335) bm!4553))

(declare-fun m!412373 () Bool)

(assert (=> b!279333 m!412373))

(declare-fun m!412375 () Bool)

(assert (=> bm!4553 m!412375))

(declare-fun m!412377 () Bool)

(assert (=> bm!4553 m!412377))

(declare-fun m!412379 () Bool)

(assert (=> bm!4553 m!412379))

(declare-fun m!412381 () Bool)

(assert (=> bm!4553 m!412381))

(declare-fun m!412383 () Bool)

(assert (=> bm!4553 m!412383))

(assert (=> b!279336 m!412379))

(assert (=> b!279336 m!412377))

(assert (=> b!279336 m!412379))

(assert (=> b!279336 m!412377))

(declare-fun m!412385 () Bool)

(assert (=> b!279336 m!412385))

(assert (=> b!279337 m!412327))

(assert (=> b!279277 d!96044))

(declare-fun d!96068 () Bool)

(declare-fun res!231951 () Bool)

(declare-fun e!199123 () Bool)

(assert (=> d!96068 (=> res!231951 e!199123)))

(assert (=> d!96068 (= res!231951 (= (_1!12426 lt!416298) (_2!12426 lt!416298)))))

(assert (=> d!96068 (= (arrayRangesEq!1244 a1!699 a2!699 (_1!12426 lt!416298) (_2!12426 lt!416298)) e!199123)))

(declare-fun b!279344 () Bool)

(declare-fun e!199124 () Bool)

(assert (=> b!279344 (= e!199123 e!199124)))

(declare-fun res!231952 () Bool)

(assert (=> b!279344 (=> (not res!231952) (not e!199124))))

(assert (=> b!279344 (= res!231952 (= (select (arr!7972 a1!699) (_1!12426 lt!416298)) (select (arr!7972 a2!699) (_1!12426 lt!416298))))))

(declare-fun b!279345 () Bool)

(assert (=> b!279345 (= e!199124 (arrayRangesEq!1244 a1!699 a2!699 (bvadd (_1!12426 lt!416298) #b00000000000000000000000000000001) (_2!12426 lt!416298)))))

(assert (= (and d!96068 (not res!231951)) b!279344))

(assert (= (and b!279344 res!231952) b!279345))

(declare-fun m!412387 () Bool)

(assert (=> b!279344 m!412387))

(declare-fun m!412389 () Bool)

(assert (=> b!279344 m!412389))

(declare-fun m!412391 () Bool)

(assert (=> b!279345 m!412391))

(assert (=> b!279279 d!96068))

(declare-fun d!96070 () Bool)

(assert (=> d!96070 (arrayRangesEq!1244 a2!699 a1!699 (_1!12426 lt!416298) (_2!12426 lt!416298))))

(declare-fun lt!416331 () Unit!19569)

(declare-fun choose!461 (array!16120 array!16120 (_ BitVec 32) (_ BitVec 32)) Unit!19569)

(assert (=> d!96070 (= lt!416331 (choose!461 a1!699 a2!699 (_1!12426 lt!416298) (_2!12426 lt!416298)))))

(assert (=> d!96070 (and (bvsle #b00000000000000000000000000000000 (_1!12426 lt!416298)) (bvsle (_1!12426 lt!416298) (_2!12426 lt!416298)) (bvsle (_2!12426 lt!416298) (size!6976 a1!699)))))

(assert (=> d!96070 (= (arrayRangesEqSymmetricLemma!151 a1!699 a2!699 (_1!12426 lt!416298) (_2!12426 lt!416298)) lt!416331)))

(declare-fun bs!24246 () Bool)

(assert (= bs!24246 d!96070))

(assert (=> bs!24246 m!412333))

(declare-fun m!412393 () Bool)

(assert (=> bs!24246 m!412393))

(assert (=> b!279279 d!96070))

(declare-fun d!96072 () Bool)

(declare-fun res!231953 () Bool)

(declare-fun e!199125 () Bool)

(assert (=> d!96072 (=> res!231953 e!199125)))

(assert (=> d!96072 (= res!231953 (= (_1!12426 lt!416298) (_2!12426 lt!416298)))))

(assert (=> d!96072 (= (arrayRangesEq!1244 a2!699 a1!699 (_1!12426 lt!416298) (_2!12426 lt!416298)) e!199125)))

(declare-fun b!279346 () Bool)

(declare-fun e!199126 () Bool)

(assert (=> b!279346 (= e!199125 e!199126)))

(declare-fun res!231954 () Bool)

(assert (=> b!279346 (=> (not res!231954) (not e!199126))))

(assert (=> b!279346 (= res!231954 (= (select (arr!7972 a2!699) (_1!12426 lt!416298)) (select (arr!7972 a1!699) (_1!12426 lt!416298))))))

(declare-fun b!279347 () Bool)

(assert (=> b!279347 (= e!199126 (arrayRangesEq!1244 a2!699 a1!699 (bvadd (_1!12426 lt!416298) #b00000000000000000000000000000001) (_2!12426 lt!416298)))))

(assert (= (and d!96072 (not res!231953)) b!279346))

(assert (= (and b!279346 res!231954) b!279347))

(assert (=> b!279346 m!412389))

(assert (=> b!279346 m!412387))

(declare-fun m!412395 () Bool)

(assert (=> b!279347 m!412395))

(assert (=> b!279279 d!96072))

(declare-fun d!96074 () Bool)

(assert (=> d!96074 (= (arrayBitIndices!0 from!822 to!789) (tuple4!703 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279278 d!96074))

(declare-fun d!96076 () Bool)

(assert (=> d!96076 (= (array_inv!6700 a1!699) (bvsge (size!6976 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62268 d!96076))

(declare-fun d!96078 () Bool)

(assert (=> d!96078 (= (array_inv!6700 a2!699) (bvsge (size!6976 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62268 d!96078))

(push 1)

(assert (not b!279336))

(assert (not b!279345))

(assert (not b!279337))

(assert (not b!279347))

(assert (not b!279333))

(assert (not d!96070))

(assert (not bm!4553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


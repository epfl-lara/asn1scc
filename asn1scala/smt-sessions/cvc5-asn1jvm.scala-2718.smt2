; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66508 () Bool)

(assert start!66508)

(declare-fun b!298038 () Bool)

(declare-fun e!213468 () Bool)

(declare-datatypes ((array!17867 0))(
  ( (array!17868 (arr!8824 (Array (_ BitVec 32) (_ BitVec 8))) (size!7744 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13492 0))(
  ( (BitStream!13493 (buf!7807 array!17867) (currentByte!14361 (_ BitVec 32)) (currentBit!14356 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13492)

(declare-fun array_inv!7356 (array!17867) Bool)

(assert (=> b!298038 (= e!213468 (array_inv!7356 (buf!7807 thiss!1728)))))

(declare-fun res!245957 () Bool)

(declare-fun e!213466 () Bool)

(assert (=> start!66508 (=> (not res!245957) (not e!213466))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17867)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!66508 (= res!245957 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7744 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66508 e!213466))

(declare-fun inv!12 (BitStream!13492) Bool)

(assert (=> start!66508 (and (inv!12 thiss!1728) e!213468)))

(assert (=> start!66508 true))

(assert (=> start!66508 (array_inv!7356 arr!273)))

(declare-fun b!298037 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298037 (= e!213466 (not (invariant!0 (currentBit!14356 thiss!1728) (currentByte!14361 thiss!1728) (size!7744 (buf!7807 thiss!1728)))))))

(declare-fun arrayBitRangesEq!0 (array!17867 array!17867 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298037 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434227 () (_ BitVec 64))

(declare-datatypes ((Unit!20809 0))(
  ( (Unit!20810) )
))
(declare-fun lt!434229 () Unit!20809)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17867 array!17867 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20809)

(assert (=> b!298037 (= lt!434229 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434227 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298037 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434227)))

(assert (=> b!298037 (= lt!434227 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7744 arr!273))))))

(declare-fun lt!434228 () Unit!20809)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17867) Unit!20809)

(assert (=> b!298037 (= lt!434228 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!298035 () Bool)

(declare-fun res!245956 () Bool)

(assert (=> b!298035 (=> (not res!245956) (not e!213466))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298035 (= res!245956 (validate_offset_bits!1 ((_ sign_extend 32) (size!7744 (buf!7807 thiss!1728))) ((_ sign_extend 32) (currentByte!14361 thiss!1728)) ((_ sign_extend 32) (currentBit!14356 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!298036 () Bool)

(declare-fun res!245955 () Bool)

(assert (=> b!298036 (=> (not res!245955) (not e!213466))))

(assert (=> b!298036 (= res!245955 (bvsge from!505 to!474))))

(assert (= (and start!66508 res!245957) b!298035))

(assert (= (and b!298035 res!245956) b!298036))

(assert (= (and b!298036 res!245955) b!298037))

(assert (= start!66508 b!298038))

(declare-fun m!436939 () Bool)

(assert (=> b!298038 m!436939))

(declare-fun m!436941 () Bool)

(assert (=> start!66508 m!436941))

(declare-fun m!436943 () Bool)

(assert (=> start!66508 m!436943))

(declare-fun m!436945 () Bool)

(assert (=> b!298037 m!436945))

(declare-fun m!436947 () Bool)

(assert (=> b!298037 m!436947))

(declare-fun m!436949 () Bool)

(assert (=> b!298037 m!436949))

(declare-fun m!436951 () Bool)

(assert (=> b!298037 m!436951))

(declare-fun m!436953 () Bool)

(assert (=> b!298037 m!436953))

(declare-fun m!436955 () Bool)

(assert (=> b!298035 m!436955))

(push 1)

(assert (not start!66508))

(assert (not b!298035))

(assert (not b!298038))

(assert (not b!298037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100310 () Bool)

(assert (=> d!100310 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14356 thiss!1728) (currentByte!14361 thiss!1728) (size!7744 (buf!7807 thiss!1728))))))

(declare-fun bs!25678 () Bool)

(assert (= bs!25678 d!100310))

(assert (=> bs!25678 m!436947))

(assert (=> start!66508 d!100310))

(declare-fun d!100312 () Bool)

(assert (=> d!100312 (= (array_inv!7356 arr!273) (bvsge (size!7744 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66508 d!100312))

(declare-fun d!100314 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100314 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7744 (buf!7807 thiss!1728))) ((_ sign_extend 32) (currentByte!14361 thiss!1728)) ((_ sign_extend 32) (currentBit!14356 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7744 (buf!7807 thiss!1728))) ((_ sign_extend 32) (currentByte!14361 thiss!1728)) ((_ sign_extend 32) (currentBit!14356 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25679 () Bool)

(assert (= bs!25679 d!100314))

(declare-fun m!436995 () Bool)

(assert (=> bs!25679 m!436995))

(assert (=> b!298035 d!100314))

(declare-fun d!100316 () Bool)

(assert (=> d!100316 (= (array_inv!7356 (buf!7807 thiss!1728)) (bvsge (size!7744 (buf!7807 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!298038 d!100316))

(declare-fun d!100318 () Bool)

(assert (=> d!100318 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434256 () Unit!20809)

(declare-fun choose!4 (array!17867 array!17867 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20809)

(assert (=> d!100318 (= lt!434256 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434227 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100318 (bvsle (size!7744 arr!273) (size!7744 arr!273))))

(assert (=> d!100318 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434227 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!434256)))

(declare-fun bs!25680 () Bool)

(assert (= bs!25680 d!100318))

(assert (=> bs!25680 m!436949))

(declare-fun m!437001 () Bool)

(assert (=> bs!25680 m!437001))

(assert (=> b!298037 d!100318))

(declare-fun b!298094 () Bool)

(declare-fun e!213523 () Bool)

(declare-fun call!5272 () Bool)

(assert (=> b!298094 (= e!213523 call!5272)))

(declare-fun b!298095 () Bool)

(declare-fun e!213520 () Bool)

(declare-fun e!213526 () Bool)

(assert (=> b!298095 (= e!213520 e!213526)))

(declare-fun lt!434272 () (_ BitVec 32))

(declare-fun res!246001 () Bool)

(declare-datatypes ((tuple4!932 0))(
  ( (tuple4!933 (_1!13115 (_ BitVec 32)) (_2!13115 (_ BitVec 32)) (_3!1423 (_ BitVec 32)) (_4!466 (_ BitVec 32))) )
))
(declare-fun lt!434269 () tuple4!932)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298095 (= res!246001 (byteRangesEq!0 (select (arr!8824 arr!273) (_3!1423 lt!434269)) (select (arr!8824 arr!273) (_3!1423 lt!434269)) lt!434272 #b00000000000000000000000000001000))))

(assert (=> b!298095 (=> (not res!246001) (not e!213526))))

(declare-fun lt!434270 () (_ BitVec 32))

(declare-fun bm!5269 () Bool)

(declare-fun c!13634 () Bool)

(assert (=> bm!5269 (= call!5272 (byteRangesEq!0 (ite c!13634 (select (arr!8824 arr!273) (_3!1423 lt!434269)) (select (arr!8824 arr!273) (_4!466 lt!434269))) (ite c!13634 (select (arr!8824 arr!273) (_3!1423 lt!434269)) (select (arr!8824 arr!273) (_4!466 lt!434269))) (ite c!13634 lt!434272 #b00000000000000000000000000000000) lt!434270))))

(declare-fun b!298096 () Bool)

(declare-fun res!245999 () Bool)

(assert (=> b!298096 (= res!245999 (= lt!434270 #b00000000000000000000000000000000))))

(assert (=> b!298096 (=> res!245999 e!213523)))

(assert (=> b!298096 (= e!213526 e!213523)))

(declare-fun b!298097 () Bool)

(assert (=> b!298097 (= e!213520 call!5272)))

(declare-fun b!298098 () Bool)

(declare-fun e!213522 () Bool)

(declare-fun e!213525 () Bool)

(assert (=> b!298098 (= e!213522 e!213525)))

(declare-fun res!246004 () Bool)

(assert (=> b!298098 (=> (not res!246004) (not e!213525))))

(declare-fun e!213521 () Bool)

(assert (=> b!298098 (= res!246004 e!213521)))

(declare-fun res!246000 () Bool)

(assert (=> b!298098 (=> res!246000 e!213521)))

(assert (=> b!298098 (= res!246000 (bvsge (_1!13115 lt!434269) (_2!13115 lt!434269)))))

(assert (=> b!298098 (= lt!434270 ((_ extract 31 0) (bvsrem lt!434227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298098 (= lt!434272 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!932)

(assert (=> b!298098 (= lt!434269 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434227))))

(declare-fun d!100322 () Bool)

(declare-fun res!246002 () Bool)

(assert (=> d!100322 (=> res!246002 e!213522)))

(assert (=> d!100322 (= res!246002 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!434227))))

(assert (=> d!100322 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434227) e!213522)))

(declare-fun b!298099 () Bool)

(declare-fun arrayRangesEq!1524 (array!17867 array!17867 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298099 (= e!213521 (arrayRangesEq!1524 arr!273 arr!273 (_1!13115 lt!434269) (_2!13115 lt!434269)))))

(declare-fun b!298100 () Bool)

(assert (=> b!298100 (= e!213525 e!213520)))

(assert (=> b!298100 (= c!13634 (= (_3!1423 lt!434269) (_4!466 lt!434269)))))

(assert (= (and d!100322 (not res!246002)) b!298098))

(assert (= (and b!298098 (not res!246000)) b!298099))

(assert (= (and b!298098 res!246004) b!298100))

(assert (= (and b!298100 c!13634) b!298097))

(assert (= (and b!298100 (not c!13634)) b!298095))

(assert (= (and b!298095 res!246001) b!298096))

(assert (= (and b!298096 (not res!245999)) b!298094))

(assert (= (or b!298097 b!298094) bm!5269))

(declare-fun m!437007 () Bool)

(assert (=> b!298095 m!437007))

(assert (=> b!298095 m!437007))

(assert (=> b!298095 m!437007))

(assert (=> b!298095 m!437007))

(declare-fun m!437013 () Bool)

(assert (=> b!298095 m!437013))

(assert (=> bm!5269 m!437007))

(assert (=> bm!5269 m!437007))

(declare-fun m!437015 () Bool)

(assert (=> bm!5269 m!437015))

(assert (=> bm!5269 m!437015))

(declare-fun m!437023 () Bool)

(assert (=> bm!5269 m!437023))

(declare-fun m!437025 () Bool)

(assert (=> b!298098 m!437025))

(declare-fun m!437027 () Bool)

(assert (=> b!298099 m!437027))

(assert (=> b!298037 d!100322))

(declare-fun d!100332 () Bool)

(assert (=> d!100332 (= (invariant!0 (currentBit!14356 thiss!1728) (currentByte!14361 thiss!1728) (size!7744 (buf!7807 thiss!1728))) (and (bvsge (currentBit!14356 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14356 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14361 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14361 thiss!1728) (size!7744 (buf!7807 thiss!1728))) (and (= (currentBit!14356 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14361 thiss!1728) (size!7744 (buf!7807 thiss!1728)))))))))

(assert (=> b!298037 d!100332))

(declare-fun d!100334 () Bool)

(declare-fun e!213558 () Bool)

(assert (=> d!100334 e!213558))

(declare-fun res!246031 () Bool)

(assert (=> d!100334 (=> (not res!246031) (not e!213558))))

(declare-fun lt!434295 () (_ BitVec 64))

(assert (=> d!100334 (= res!246031 (or (= lt!434295 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!434295 #b0000000000000000000000000000000000000000000000000000000000001000) lt!434295))))))

(assert (=> d!100334 (= lt!434295 ((_ sign_extend 32) (size!7744 arr!273)))))

(declare-fun lt!434294 () Unit!20809)

(declare-fun choose!59 (array!17867) Unit!20809)

(assert (=> d!100334 (= lt!434294 (choose!59 arr!273))))

(assert (=> d!100334 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!434294)))

(declare-fun b!298138 () Bool)

(assert (=> b!298138 (= e!213558 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7744 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100334 res!246031) b!298138))

(declare-fun m!437055 () Bool)

(assert (=> d!100334 m!437055))

(declare-fun m!437057 () Bool)

(assert (=> b!298138 m!437057))

(assert (=> b!298037 d!100334))

(declare-fun b!298139 () Bool)

(declare-fun e!213562 () Bool)

(declare-fun call!5278 () Bool)

(assert (=> b!298139 (= e!213562 call!5278)))

(declare-fun b!298140 () Bool)

(declare-fun e!213559 () Bool)

(declare-fun e!213564 () Bool)

(assert (=> b!298140 (= e!213559 e!213564)))

(declare-fun res!246034 () Bool)

(declare-fun lt!434298 () (_ BitVec 32))

(declare-fun lt!434296 () tuple4!932)

(assert (=> b!298140 (= res!246034 (byteRangesEq!0 (select (arr!8824 arr!273) (_3!1423 lt!434296)) (select (arr!8824 arr!273) (_3!1423 lt!434296)) lt!434298 #b00000000000000000000000000001000))))

(assert (=> b!298140 (=> (not res!246034) (not e!213564))))

(declare-fun c!13640 () Bool)

(declare-fun lt!434297 () (_ BitVec 32))

(declare-fun bm!5275 () Bool)

(assert (=> bm!5275 (= call!5278 (byteRangesEq!0 (ite c!13640 (select (arr!8824 arr!273) (_3!1423 lt!434296)) (select (arr!8824 arr!273) (_4!466 lt!434296))) (ite c!13640 (select (arr!8824 arr!273) (_3!1423 lt!434296)) (select (arr!8824 arr!273) (_4!466 lt!434296))) (ite c!13640 lt!434298 #b00000000000000000000000000000000) lt!434297))))

(declare-fun b!298141 () Bool)

(declare-fun res!246032 () Bool)

(assert (=> b!298141 (= res!246032 (= lt!434297 #b00000000000000000000000000000000))))

(assert (=> b!298141 (=> res!246032 e!213562)))

(assert (=> b!298141 (= e!213564 e!213562)))

(declare-fun b!298142 () Bool)

(assert (=> b!298142 (= e!213559 call!5278)))

(declare-fun b!298143 () Bool)

(declare-fun e!213561 () Bool)

(declare-fun e!213563 () Bool)

(assert (=> b!298143 (= e!213561 e!213563)))

(declare-fun res!246036 () Bool)

(assert (=> b!298143 (=> (not res!246036) (not e!213563))))

(declare-fun e!213560 () Bool)

(assert (=> b!298143 (= res!246036 e!213560)))

(declare-fun res!246033 () Bool)

(assert (=> b!298143 (=> res!246033 e!213560)))

(assert (=> b!298143 (= res!246033 (bvsge (_1!13115 lt!434296) (_2!13115 lt!434296)))))

(assert (=> b!298143 (= lt!434297 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298143 (= lt!434298 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298143 (= lt!434296 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!100346 () Bool)

(declare-fun res!246035 () Bool)

(assert (=> d!100346 (=> res!246035 e!213561)))

(assert (=> d!100346 (= res!246035 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100346 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213561)))

(declare-fun b!298144 () Bool)

(assert (=> b!298144 (= e!213560 (arrayRangesEq!1524 arr!273 arr!273 (_1!13115 lt!434296) (_2!13115 lt!434296)))))

(declare-fun b!298145 () Bool)

(assert (=> b!298145 (= e!213563 e!213559)))

(assert (=> b!298145 (= c!13640 (= (_3!1423 lt!434296) (_4!466 lt!434296)))))

(assert (= (and d!100346 (not res!246035)) b!298143))

(assert (= (and b!298143 (not res!246033)) b!298144))

(assert (= (and b!298143 res!246036) b!298145))

(assert (= (and b!298145 c!13640) b!298142))

(assert (= (and b!298145 (not c!13640)) b!298140))

(assert (= (and b!298140 res!246034) b!298141))

(assert (= (and b!298141 (not res!246032)) b!298139))

(assert (= (or b!298142 b!298139) bm!5275))

(declare-fun m!437059 () Bool)

(assert (=> b!298140 m!437059))

(assert (=> b!298140 m!437059))

(assert (=> b!298140 m!437059))

(assert (=> b!298140 m!437059))

(declare-fun m!437061 () Bool)

(assert (=> b!298140 m!437061))

(assert (=> bm!5275 m!437059))

(assert (=> bm!5275 m!437059))

(declare-fun m!437063 () Bool)

(assert (=> bm!5275 m!437063))

(assert (=> bm!5275 m!437063))

(declare-fun m!437065 () Bool)

(assert (=> bm!5275 m!437065))

(declare-fun m!437067 () Bool)

(assert (=> b!298143 m!437067))

(declare-fun m!437069 () Bool)

(assert (=> b!298144 m!437069))

(assert (=> b!298037 d!100346))

(push 1)

(assert (not bm!5275))

(assert (not b!298138))

(assert (not bm!5269))

(assert (not d!100314))

(assert (not d!100318))

(assert (not b!298098))

(assert (not b!298143))

(assert (not d!100334))

(assert (not b!298099))

(assert (not d!100310))

(assert (not b!298140))

(assert (not b!298095))

(assert (not b!298144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


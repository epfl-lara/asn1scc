; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65076 () Bool)

(assert start!65076)

(declare-fun b!292110 () Bool)

(declare-fun e!208299 () Bool)

(declare-datatypes ((array!17359 0))(
  ( (array!17360 (arr!8543 (Array (_ BitVec 32) (_ BitVec 8))) (size!7517 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13044 0))(
  ( (BitStream!13045 (buf!7583 array!17359) (currentByte!14026 (_ BitVec 32)) (currentBit!14021 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13044)

(declare-fun array_inv!7129 (array!17359) Bool)

(assert (=> b!292110 (= e!208299 (array_inv!7129 (buf!7583 thiss!1728)))))

(declare-fun b!292108 () Bool)

(declare-fun res!241294 () Bool)

(declare-fun e!208296 () Bool)

(assert (=> b!292108 (=> (not res!241294) (not e!208296))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292108 (= res!241294 (bvsge from!505 to!474))))

(declare-fun res!241295 () Bool)

(assert (=> start!65076 (=> (not res!241295) (not e!208296))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17359)

(assert (=> start!65076 (= res!241295 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7517 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65076 e!208296))

(declare-fun inv!12 (BitStream!13044) Bool)

(assert (=> start!65076 (and (inv!12 thiss!1728) e!208299)))

(assert (=> start!65076 true))

(assert (=> start!65076 (array_inv!7129 arr!273)))

(declare-fun b!292109 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292109 (= e!208296 (not (invariant!0 (currentBit!14021 thiss!1728) (currentByte!14026 thiss!1728) (size!7517 (buf!7583 thiss!1728)))))))

(declare-fun arrayBitRangesEq!0 (array!17359 array!17359 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292109 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20323 0))(
  ( (Unit!20324) )
))
(declare-fun lt!424489 () Unit!20323)

(declare-fun lt!424491 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17359 array!17359 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20323)

(assert (=> b!292109 (= lt!424489 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424491 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292109 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424491)))

(assert (=> b!292109 (= lt!424491 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7517 arr!273))))))

(declare-fun lt!424490 () Unit!20323)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17359) Unit!20323)

(assert (=> b!292109 (= lt!424490 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292107 () Bool)

(declare-fun res!241293 () Bool)

(assert (=> b!292107 (=> (not res!241293) (not e!208296))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292107 (= res!241293 (validate_offset_bits!1 ((_ sign_extend 32) (size!7517 (buf!7583 thiss!1728))) ((_ sign_extend 32) (currentByte!14026 thiss!1728)) ((_ sign_extend 32) (currentBit!14021 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65076 res!241295) b!292107))

(assert (= (and b!292107 res!241293) b!292108))

(assert (= (and b!292108 res!241294) b!292109))

(assert (= start!65076 b!292110))

(declare-fun m!427543 () Bool)

(assert (=> b!292110 m!427543))

(declare-fun m!427545 () Bool)

(assert (=> start!65076 m!427545))

(declare-fun m!427547 () Bool)

(assert (=> start!65076 m!427547))

(declare-fun m!427549 () Bool)

(assert (=> b!292109 m!427549))

(declare-fun m!427551 () Bool)

(assert (=> b!292109 m!427551))

(declare-fun m!427553 () Bool)

(assert (=> b!292109 m!427553))

(declare-fun m!427555 () Bool)

(assert (=> b!292109 m!427555))

(declare-fun m!427557 () Bool)

(assert (=> b!292109 m!427557))

(declare-fun m!427559 () Bool)

(assert (=> b!292107 m!427559))

(check-sat (not b!292109) (not b!292110) (not start!65076) (not b!292107))
(check-sat)
(get-model)

(declare-fun b!292154 () Bool)

(declare-fun e!208341 () Bool)

(declare-fun call!4915 () Bool)

(assert (=> b!292154 (= e!208341 call!4915)))

(declare-fun b!292155 () Bool)

(declare-fun e!208339 () Bool)

(assert (=> b!292155 (= e!208339 call!4915)))

(declare-datatypes ((tuple4!854 0))(
  ( (tuple4!855 (_1!12770 (_ BitVec 32)) (_2!12770 (_ BitVec 32)) (_3!1297 (_ BitVec 32)) (_4!427 (_ BitVec 32))) )
))
(declare-fun lt!424520 () tuple4!854)

(declare-fun lt!424519 () (_ BitVec 32))

(declare-fun bm!4912 () Bool)

(declare-fun c!13349 () Bool)

(declare-fun lt!424521 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4912 (= call!4915 (byteRangesEq!0 (ite c!13349 (select (arr!8543 arr!273) (_3!1297 lt!424520)) (select (arr!8543 arr!273) (_4!427 lt!424520))) (ite c!13349 (select (arr!8543 arr!273) (_3!1297 lt!424520)) (select (arr!8543 arr!273) (_4!427 lt!424520))) (ite c!13349 lt!424521 #b00000000000000000000000000000000) lt!424519))))

(declare-fun d!98826 () Bool)

(declare-fun res!241329 () Bool)

(declare-fun e!208344 () Bool)

(assert (=> d!98826 (=> res!241329 e!208344)))

(assert (=> d!98826 (= res!241329 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!424491))))

(assert (=> d!98826 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424491) e!208344)))

(declare-fun b!292156 () Bool)

(declare-fun e!208342 () Bool)

(assert (=> b!292156 (= e!208344 e!208342)))

(declare-fun res!241328 () Bool)

(assert (=> b!292156 (=> (not res!241328) (not e!208342))))

(declare-fun e!208343 () Bool)

(assert (=> b!292156 (= res!241328 e!208343)))

(declare-fun res!241332 () Bool)

(assert (=> b!292156 (=> res!241332 e!208343)))

(assert (=> b!292156 (= res!241332 (bvsge (_1!12770 lt!424520) (_2!12770 lt!424520)))))

(assert (=> b!292156 (= lt!424519 ((_ extract 31 0) (bvsrem lt!424491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292156 (= lt!424521 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!854)

(assert (=> b!292156 (= lt!424520 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424491))))

(declare-fun b!292157 () Bool)

(declare-fun arrayRangesEq!1485 (array!17359 array!17359 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292157 (= e!208343 (arrayRangesEq!1485 arr!273 arr!273 (_1!12770 lt!424520) (_2!12770 lt!424520)))))

(declare-fun b!292158 () Bool)

(declare-fun res!241330 () Bool)

(assert (=> b!292158 (= res!241330 (= lt!424519 #b00000000000000000000000000000000))))

(assert (=> b!292158 (=> res!241330 e!208339)))

(declare-fun e!208340 () Bool)

(assert (=> b!292158 (= e!208340 e!208339)))

(declare-fun b!292159 () Bool)

(assert (=> b!292159 (= e!208341 e!208340)))

(declare-fun res!241331 () Bool)

(assert (=> b!292159 (= res!241331 (byteRangesEq!0 (select (arr!8543 arr!273) (_3!1297 lt!424520)) (select (arr!8543 arr!273) (_3!1297 lt!424520)) lt!424521 #b00000000000000000000000000001000))))

(assert (=> b!292159 (=> (not res!241331) (not e!208340))))

(declare-fun b!292160 () Bool)

(assert (=> b!292160 (= e!208342 e!208341)))

(assert (=> b!292160 (= c!13349 (= (_3!1297 lt!424520) (_4!427 lt!424520)))))

(assert (= (and d!98826 (not res!241329)) b!292156))

(assert (= (and b!292156 (not res!241332)) b!292157))

(assert (= (and b!292156 res!241328) b!292160))

(assert (= (and b!292160 c!13349) b!292154))

(assert (= (and b!292160 (not c!13349)) b!292159))

(assert (= (and b!292159 res!241331) b!292158))

(assert (= (and b!292158 (not res!241330)) b!292155))

(assert (= (or b!292154 b!292155) bm!4912))

(declare-fun m!427583 () Bool)

(assert (=> bm!4912 m!427583))

(declare-fun m!427585 () Bool)

(assert (=> bm!4912 m!427585))

(declare-fun m!427587 () Bool)

(assert (=> bm!4912 m!427587))

(assert (=> bm!4912 m!427585))

(assert (=> bm!4912 m!427583))

(declare-fun m!427589 () Bool)

(assert (=> b!292156 m!427589))

(declare-fun m!427591 () Bool)

(assert (=> b!292157 m!427591))

(assert (=> b!292159 m!427585))

(assert (=> b!292159 m!427585))

(assert (=> b!292159 m!427585))

(assert (=> b!292159 m!427585))

(declare-fun m!427593 () Bool)

(assert (=> b!292159 m!427593))

(assert (=> b!292109 d!98826))

(declare-fun d!98838 () Bool)

(assert (=> d!98838 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424529 () Unit!20323)

(declare-fun choose!4 (array!17359 array!17359 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20323)

(assert (=> d!98838 (= lt!424529 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424491 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98838 (bvsle (size!7517 arr!273) (size!7517 arr!273))))

(assert (=> d!98838 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424491 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!424529)))

(declare-fun bs!25203 () Bool)

(assert (= bs!25203 d!98838))

(assert (=> bs!25203 m!427553))

(declare-fun m!427607 () Bool)

(assert (=> bs!25203 m!427607))

(assert (=> b!292109 d!98838))

(declare-fun d!98842 () Bool)

(assert (=> d!98842 (= (invariant!0 (currentBit!14021 thiss!1728) (currentByte!14026 thiss!1728) (size!7517 (buf!7583 thiss!1728))) (and (bvsge (currentBit!14021 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14021 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14026 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14026 thiss!1728) (size!7517 (buf!7583 thiss!1728))) (and (= (currentBit!14021 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14026 thiss!1728) (size!7517 (buf!7583 thiss!1728)))))))))

(assert (=> b!292109 d!98842))

(declare-fun d!98846 () Bool)

(declare-fun e!208377 () Bool)

(assert (=> d!98846 e!208377))

(declare-fun res!241360 () Bool)

(assert (=> d!98846 (=> (not res!241360) (not e!208377))))

(declare-fun lt!424548 () (_ BitVec 64))

(assert (=> d!98846 (= res!241360 (or (= lt!424548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424548))))))

(assert (=> d!98846 (= lt!424548 ((_ sign_extend 32) (size!7517 arr!273)))))

(declare-fun lt!424547 () Unit!20323)

(declare-fun choose!59 (array!17359) Unit!20323)

(assert (=> d!98846 (= lt!424547 (choose!59 arr!273))))

(assert (=> d!98846 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!424547)))

(declare-fun b!292198 () Bool)

(assert (=> b!292198 (= e!208377 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7517 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98846 res!241360) b!292198))

(declare-fun m!427637 () Bool)

(assert (=> d!98846 m!427637))

(declare-fun m!427639 () Bool)

(assert (=> b!292198 m!427639))

(assert (=> b!292109 d!98846))

(declare-fun b!292199 () Bool)

(declare-fun e!208380 () Bool)

(declare-fun call!4921 () Bool)

(assert (=> b!292199 (= e!208380 call!4921)))

(declare-fun b!292200 () Bool)

(declare-fun e!208378 () Bool)

(assert (=> b!292200 (= e!208378 call!4921)))

(declare-fun c!13355 () Bool)

(declare-fun lt!424553 () (_ BitVec 32))

(declare-fun lt!424551 () (_ BitVec 32))

(declare-fun bm!4918 () Bool)

(declare-fun lt!424552 () tuple4!854)

(assert (=> bm!4918 (= call!4921 (byteRangesEq!0 (ite c!13355 (select (arr!8543 arr!273) (_3!1297 lt!424552)) (select (arr!8543 arr!273) (_4!427 lt!424552))) (ite c!13355 (select (arr!8543 arr!273) (_3!1297 lt!424552)) (select (arr!8543 arr!273) (_4!427 lt!424552))) (ite c!13355 lt!424553 #b00000000000000000000000000000000) lt!424551))))

(declare-fun d!98858 () Bool)

(declare-fun res!241362 () Bool)

(declare-fun e!208383 () Bool)

(assert (=> d!98858 (=> res!241362 e!208383)))

(assert (=> d!98858 (= res!241362 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98858 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208383)))

(declare-fun b!292201 () Bool)

(declare-fun e!208381 () Bool)

(assert (=> b!292201 (= e!208383 e!208381)))

(declare-fun res!241361 () Bool)

(assert (=> b!292201 (=> (not res!241361) (not e!208381))))

(declare-fun e!208382 () Bool)

(assert (=> b!292201 (= res!241361 e!208382)))

(declare-fun res!241365 () Bool)

(assert (=> b!292201 (=> res!241365 e!208382)))

(assert (=> b!292201 (= res!241365 (bvsge (_1!12770 lt!424552) (_2!12770 lt!424552)))))

(assert (=> b!292201 (= lt!424551 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292201 (= lt!424553 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292201 (= lt!424552 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!292202 () Bool)

(assert (=> b!292202 (= e!208382 (arrayRangesEq!1485 arr!273 arr!273 (_1!12770 lt!424552) (_2!12770 lt!424552)))))

(declare-fun b!292203 () Bool)

(declare-fun res!241363 () Bool)

(assert (=> b!292203 (= res!241363 (= lt!424551 #b00000000000000000000000000000000))))

(assert (=> b!292203 (=> res!241363 e!208378)))

(declare-fun e!208379 () Bool)

(assert (=> b!292203 (= e!208379 e!208378)))

(declare-fun b!292204 () Bool)

(assert (=> b!292204 (= e!208380 e!208379)))

(declare-fun res!241364 () Bool)

(assert (=> b!292204 (= res!241364 (byteRangesEq!0 (select (arr!8543 arr!273) (_3!1297 lt!424552)) (select (arr!8543 arr!273) (_3!1297 lt!424552)) lt!424553 #b00000000000000000000000000001000))))

(assert (=> b!292204 (=> (not res!241364) (not e!208379))))

(declare-fun b!292205 () Bool)

(assert (=> b!292205 (= e!208381 e!208380)))

(assert (=> b!292205 (= c!13355 (= (_3!1297 lt!424552) (_4!427 lt!424552)))))

(assert (= (and d!98858 (not res!241362)) b!292201))

(assert (= (and b!292201 (not res!241365)) b!292202))

(assert (= (and b!292201 res!241361) b!292205))

(assert (= (and b!292205 c!13355) b!292199))

(assert (= (and b!292205 (not c!13355)) b!292204))

(assert (= (and b!292204 res!241364) b!292203))

(assert (= (and b!292203 (not res!241363)) b!292200))

(assert (= (or b!292199 b!292200) bm!4918))

(declare-fun m!427643 () Bool)

(assert (=> bm!4918 m!427643))

(declare-fun m!427645 () Bool)

(assert (=> bm!4918 m!427645))

(declare-fun m!427647 () Bool)

(assert (=> bm!4918 m!427647))

(assert (=> bm!4918 m!427645))

(assert (=> bm!4918 m!427643))

(declare-fun m!427649 () Bool)

(assert (=> b!292201 m!427649))

(declare-fun m!427651 () Bool)

(assert (=> b!292202 m!427651))

(assert (=> b!292204 m!427645))

(assert (=> b!292204 m!427645))

(assert (=> b!292204 m!427645))

(assert (=> b!292204 m!427645))

(declare-fun m!427653 () Bool)

(assert (=> b!292204 m!427653))

(assert (=> b!292109 d!98858))

(declare-fun d!98862 () Bool)

(assert (=> d!98862 (= (array_inv!7129 (buf!7583 thiss!1728)) (bvsge (size!7517 (buf!7583 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!292110 d!98862))

(declare-fun d!98864 () Bool)

(assert (=> d!98864 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14021 thiss!1728) (currentByte!14026 thiss!1728) (size!7517 (buf!7583 thiss!1728))))))

(declare-fun bs!25208 () Bool)

(assert (= bs!25208 d!98864))

(assert (=> bs!25208 m!427551))

(assert (=> start!65076 d!98864))

(declare-fun d!98866 () Bool)

(assert (=> d!98866 (= (array_inv!7129 arr!273) (bvsge (size!7517 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65076 d!98866))

(declare-fun d!98868 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7517 (buf!7583 thiss!1728))) ((_ sign_extend 32) (currentByte!14026 thiss!1728)) ((_ sign_extend 32) (currentBit!14021 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7517 (buf!7583 thiss!1728))) ((_ sign_extend 32) (currentByte!14026 thiss!1728)) ((_ sign_extend 32) (currentBit!14021 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25209 () Bool)

(assert (= bs!25209 d!98868))

(declare-fun m!427655 () Bool)

(assert (=> bs!25209 m!427655))

(assert (=> b!292107 d!98868))

(check-sat (not d!98868) (not bm!4918) (not b!292202) (not b!292157) (not d!98846) (not b!292201) (not b!292198) (not bm!4912) (not d!98838) (not b!292156) (not b!292159) (not b!292204) (not d!98864))

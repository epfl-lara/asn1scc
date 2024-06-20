; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65078 () Bool)

(assert start!65078)

(declare-fun b!292119 () Bool)

(declare-fun res!241304 () Bool)

(declare-fun e!208308 () Bool)

(assert (=> b!292119 (=> (not res!241304) (not e!208308))))

(declare-datatypes ((array!17361 0))(
  ( (array!17362 (arr!8544 (Array (_ BitVec 32) (_ BitVec 8))) (size!7518 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13046 0))(
  ( (BitStream!13047 (buf!7584 array!17361) (currentByte!14027 (_ BitVec 32)) (currentBit!14022 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13046)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292119 (= res!241304 (validate_offset_bits!1 ((_ sign_extend 32) (size!7518 (buf!7584 thiss!1728))) ((_ sign_extend 32) (currentByte!14027 thiss!1728)) ((_ sign_extend 32) (currentBit!14022 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292121 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292121 (= e!208308 (not (invariant!0 (currentBit!14022 thiss!1728) (currentByte!14027 thiss!1728) (size!7518 (buf!7584 thiss!1728)))))))

(declare-fun arr!273 () array!17361)

(declare-fun arrayBitRangesEq!0 (array!17361 array!17361 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292121 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424498 () (_ BitVec 64))

(declare-datatypes ((Unit!20325 0))(
  ( (Unit!20326) )
))
(declare-fun lt!424500 () Unit!20325)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17361 array!17361 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20325)

(assert (=> b!292121 (= lt!424500 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424498 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292121 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424498)))

(assert (=> b!292121 (= lt!424498 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7518 arr!273))))))

(declare-fun lt!424499 () Unit!20325)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17361) Unit!20325)

(assert (=> b!292121 (= lt!424499 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241302 () Bool)

(assert (=> start!65078 (=> (not res!241302) (not e!208308))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65078 (= res!241302 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7518 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65078 e!208308))

(declare-fun e!208310 () Bool)

(declare-fun inv!12 (BitStream!13046) Bool)

(assert (=> start!65078 (and (inv!12 thiss!1728) e!208310)))

(assert (=> start!65078 true))

(declare-fun array_inv!7130 (array!17361) Bool)

(assert (=> start!65078 (array_inv!7130 arr!273)))

(declare-fun b!292120 () Bool)

(declare-fun res!241303 () Bool)

(assert (=> b!292120 (=> (not res!241303) (not e!208308))))

(assert (=> b!292120 (= res!241303 (bvsge from!505 to!474))))

(declare-fun b!292122 () Bool)

(assert (=> b!292122 (= e!208310 (array_inv!7130 (buf!7584 thiss!1728)))))

(assert (= (and start!65078 res!241302) b!292119))

(assert (= (and b!292119 res!241304) b!292120))

(assert (= (and b!292120 res!241303) b!292121))

(assert (= start!65078 b!292122))

(declare-fun m!427561 () Bool)

(assert (=> b!292119 m!427561))

(declare-fun m!427563 () Bool)

(assert (=> b!292121 m!427563))

(declare-fun m!427565 () Bool)

(assert (=> b!292121 m!427565))

(declare-fun m!427567 () Bool)

(assert (=> b!292121 m!427567))

(declare-fun m!427569 () Bool)

(assert (=> b!292121 m!427569))

(declare-fun m!427571 () Bool)

(assert (=> b!292121 m!427571))

(declare-fun m!427573 () Bool)

(assert (=> start!65078 m!427573))

(declare-fun m!427575 () Bool)

(assert (=> start!65078 m!427575))

(declare-fun m!427577 () Bool)

(assert (=> b!292122 m!427577))

(push 1)

(assert (not b!292121))

(assert (not b!292122))

(assert (not start!65078))

(assert (not b!292119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98834 () Bool)

(assert (=> d!98834 (= (invariant!0 (currentBit!14022 thiss!1728) (currentByte!14027 thiss!1728) (size!7518 (buf!7584 thiss!1728))) (and (bvsge (currentBit!14022 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14022 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14027 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14027 thiss!1728) (size!7518 (buf!7584 thiss!1728))) (and (= (currentBit!14022 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14027 thiss!1728) (size!7518 (buf!7584 thiss!1728)))))))))

(assert (=> b!292121 d!98834))

(declare-fun b!292189 () Bool)

(declare-fun e!208369 () Bool)

(declare-fun e!208372 () Bool)

(assert (=> b!292189 (= e!208369 e!208372)))

(declare-fun res!241355 () Bool)

(declare-fun call!4920 () Bool)

(assert (=> b!292189 (= res!241355 call!4920)))

(assert (=> b!292189 (=> (not res!241355) (not e!208372))))

(declare-fun b!292190 () Bool)

(assert (=> b!292190 (= e!208369 call!4920)))

(declare-fun b!292191 () Bool)

(declare-fun e!208373 () Bool)

(assert (=> b!292191 (= e!208373 e!208369)))

(declare-fun c!13354 () Bool)

(declare-datatypes ((tuple4!856 0))(
  ( (tuple4!857 (_1!12771 (_ BitVec 32)) (_2!12771 (_ BitVec 32)) (_3!1298 (_ BitVec 32)) (_4!428 (_ BitVec 32))) )
))
(declare-fun lt!424540 () tuple4!856)

(assert (=> b!292191 (= c!13354 (= (_3!1298 lt!424540) (_4!428 lt!424540)))))

(declare-fun b!292192 () Bool)

(declare-fun e!208374 () Bool)

(assert (=> b!292192 (= e!208374 e!208373)))

(declare-fun res!241356 () Bool)

(assert (=> b!292192 (=> (not res!241356) (not e!208373))))

(declare-fun e!208370 () Bool)

(assert (=> b!292192 (= res!241356 e!208370)))

(declare-fun res!241353 () Bool)

(assert (=> b!292192 (=> res!241353 e!208370)))

(assert (=> b!292192 (= res!241353 (bvsge (_1!12771 lt!424540) (_2!12771 lt!424540)))))

(declare-fun lt!424541 () (_ BitVec 32))

(assert (=> b!292192 (= lt!424541 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424542 () (_ BitVec 32))

(assert (=> b!292192 (= lt!424542 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!856)

(assert (=> b!292192 (= lt!424540 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!292194 () Bool)

(declare-fun e!208371 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292194 (= e!208371 (byteRangesEq!0 (select (arr!8544 arr!273) (_4!428 lt!424540)) (select (arr!8544 arr!273) (_4!428 lt!424540)) #b00000000000000000000000000000000 lt!424541))))

(declare-fun bm!4917 () Bool)

(assert (=> bm!4917 (= call!4920 (byteRangesEq!0 (select (arr!8544 arr!273) (_3!1298 lt!424540)) (select (arr!8544 arr!273) (_3!1298 lt!424540)) lt!424542 (ite c!13354 lt!424541 #b00000000000000000000000000001000)))))

(declare-fun b!292195 () Bool)

(declare-fun arrayRangesEq!1486 (array!17361 array!17361 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292195 (= e!208370 (arrayRangesEq!1486 arr!273 arr!273 (_1!12771 lt!424540) (_2!12771 lt!424540)))))

(declare-fun b!292193 () Bool)

(declare-fun res!241354 () Bool)

(assert (=> b!292193 (= res!241354 (= lt!424541 #b00000000000000000000000000000000))))

(assert (=> b!292193 (=> res!241354 e!208371)))

(assert (=> b!292193 (= e!208372 e!208371)))

(declare-fun d!98836 () Bool)

(declare-fun res!241357 () Bool)

(assert (=> d!98836 (=> res!241357 e!208374)))

(assert (=> d!98836 (= res!241357 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98836 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208374)))

(assert (= (and d!98836 (not res!241357)) b!292192))

(assert (= (and b!292192 (not res!241353)) b!292195))

(assert (= (and b!292192 res!241356) b!292191))

(assert (= (and b!292191 c!13354) b!292190))

(assert (= (and b!292191 (not c!13354)) b!292189))

(assert (= (and b!292189 res!241355) b!292193))

(assert (= (and b!292193 (not res!241354)) b!292194))

(assert (= (or b!292190 b!292189) bm!4917))

(declare-fun m!427623 () Bool)

(assert (=> b!292192 m!427623))

(declare-fun m!427625 () Bool)

(assert (=> b!292194 m!427625))

(assert (=> b!292194 m!427625))

(assert (=> b!292194 m!427625))

(assert (=> b!292194 m!427625))

(declare-fun m!427629 () Bool)

(assert (=> b!292194 m!427629))

(declare-fun m!427631 () Bool)

(assert (=> bm!4917 m!427631))

(assert (=> bm!4917 m!427631))

(assert (=> bm!4917 m!427631))

(assert (=> bm!4917 m!427631))

(declare-fun m!427633 () Bool)

(assert (=> bm!4917 m!427633))

(declare-fun m!427635 () Bool)

(assert (=> b!292195 m!427635))

(assert (=> b!292121 d!98836))

(declare-fun d!98856 () Bool)

(assert (=> d!98856 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424554 () Unit!20325)

(declare-fun choose!4 (array!17361 array!17361 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20325)

(assert (=> d!98856 (= lt!424554 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424498 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98856 (bvsle (size!7518 arr!273) (size!7518 arr!273))))

(assert (=> d!98856 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424498 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!424554)))

(declare-fun bs!25207 () Bool)

(assert (= bs!25207 d!98856))

(assert (=> bs!25207 m!427571))

(declare-fun m!427641 () Bool)

(assert (=> bs!25207 m!427641))

(assert (=> b!292121 d!98856))

(declare-fun d!98860 () Bool)

(declare-fun e!208386 () Bool)

(assert (=> d!98860 e!208386))

(declare-fun res!241368 () Bool)

(assert (=> d!98860 (=> (not res!241368) (not e!208386))))

(declare-fun lt!424560 () (_ BitVec 64))

(assert (=> d!98860 (= res!241368 (or (= lt!424560 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424560 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424560))))))

(assert (=> d!98860 (= lt!424560 ((_ sign_extend 32) (size!7518 arr!273)))))

(declare-fun lt!424559 () Unit!20325)

(declare-fun choose!59 (array!17361) Unit!20325)

(assert (=> d!98860 (= lt!424559 (choose!59 arr!273))))

(assert (=> d!98860 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!424559)))

(declare-fun b!292208 () Bool)

(assert (=> b!292208 (= e!208386 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7518 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98860 res!241368) b!292208))

(declare-fun m!427657 () Bool)

(assert (=> d!98860 m!427657))

(declare-fun m!427659 () Bool)

(assert (=> b!292208 m!427659))

(assert (=> b!292121 d!98860))

(declare-fun b!292209 () Bool)

(declare-fun e!208387 () Bool)

(declare-fun e!208390 () Bool)

(assert (=> b!292209 (= e!208387 e!208390)))

(declare-fun res!241371 () Bool)

(declare-fun call!4922 () Bool)

(assert (=> b!292209 (= res!241371 call!4922)))

(assert (=> b!292209 (=> (not res!241371) (not e!208390))))

(declare-fun b!292210 () Bool)

(assert (=> b!292210 (= e!208387 call!4922)))

(declare-fun b!292211 () Bool)

(declare-fun e!208391 () Bool)

(assert (=> b!292211 (= e!208391 e!208387)))

(declare-fun c!13356 () Bool)

(declare-fun lt!424561 () tuple4!856)

(assert (=> b!292211 (= c!13356 (= (_3!1298 lt!424561) (_4!428 lt!424561)))))

(declare-fun b!292212 () Bool)

(declare-fun e!208392 () Bool)

(assert (=> b!292212 (= e!208392 e!208391)))

(declare-fun res!241372 () Bool)

(assert (=> b!292212 (=> (not res!241372) (not e!208391))))

(declare-fun e!208388 () Bool)

(assert (=> b!292212 (= res!241372 e!208388)))

(declare-fun res!241369 () Bool)

(assert (=> b!292212 (=> res!241369 e!208388)))

(assert (=> b!292212 (= res!241369 (bvsge (_1!12771 lt!424561) (_2!12771 lt!424561)))))

(declare-fun lt!424562 () (_ BitVec 32))

(assert (=> b!292212 (= lt!424562 ((_ extract 31 0) (bvsrem lt!424498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424563 () (_ BitVec 32))

(assert (=> b!292212 (= lt!424563 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292212 (= lt!424561 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424498))))

(declare-fun b!292214 () Bool)

(declare-fun e!208389 () Bool)

(assert (=> b!292214 (= e!208389 (byteRangesEq!0 (select (arr!8544 arr!273) (_4!428 lt!424561)) (select (arr!8544 arr!273) (_4!428 lt!424561)) #b00000000000000000000000000000000 lt!424562))))

(declare-fun bm!4919 () Bool)

(assert (=> bm!4919 (= call!4922 (byteRangesEq!0 (select (arr!8544 arr!273) (_3!1298 lt!424561)) (select (arr!8544 arr!273) (_3!1298 lt!424561)) lt!424563 (ite c!13356 lt!424562 #b00000000000000000000000000001000)))))

(declare-fun b!292215 () Bool)

(assert (=> b!292215 (= e!208388 (arrayRangesEq!1486 arr!273 arr!273 (_1!12771 lt!424561) (_2!12771 lt!424561)))))

(declare-fun b!292213 () Bool)

(declare-fun res!241370 () Bool)

(assert (=> b!292213 (= res!241370 (= lt!424562 #b00000000000000000000000000000000))))

(assert (=> b!292213 (=> res!241370 e!208389)))

(assert (=> b!292213 (= e!208390 e!208389)))

(declare-fun d!98870 () Bool)

(declare-fun res!241373 () Bool)

(assert (=> d!98870 (=> res!241373 e!208392)))

(assert (=> d!98870 (= res!241373 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!424498))))

(assert (=> d!98870 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424498) e!208392)))

(assert (= (and d!98870 (not res!241373)) b!292212))

(assert (= (and b!292212 (not res!241369)) b!292215))


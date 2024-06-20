; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65126 () Bool)

(assert start!65126)

(declare-fun b!292251 () Bool)

(declare-fun e!208428 () Bool)

(declare-datatypes ((array!17370 0))(
  ( (array!17371 (arr!8547 (Array (_ BitVec 32) (_ BitVec 8))) (size!7521 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13052 0))(
  ( (BitStream!13053 (buf!7587 array!17370) (currentByte!14036 (_ BitVec 32)) (currentBit!14031 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13052)

(declare-fun array_inv!7133 (array!17370) Bool)

(assert (=> b!292251 (= e!208428 (array_inv!7133 (buf!7587 thiss!1728)))))

(declare-fun b!292248 () Bool)

(declare-fun res!241400 () Bool)

(declare-fun e!208425 () Bool)

(assert (=> b!292248 (=> (not res!241400) (not e!208425))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292248 (= res!241400 (validate_offset_bits!1 ((_ sign_extend 32) (size!7521 (buf!7587 thiss!1728))) ((_ sign_extend 32) (currentByte!14036 thiss!1728)) ((_ sign_extend 32) (currentBit!14031 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!241399 () Bool)

(assert (=> start!65126 (=> (not res!241399) (not e!208425))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17370)

(assert (=> start!65126 (= res!241399 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7521 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65126 e!208425))

(declare-fun inv!12 (BitStream!13052) Bool)

(assert (=> start!65126 (and (inv!12 thiss!1728) e!208428)))

(assert (=> start!65126 true))

(assert (=> start!65126 (array_inv!7133 arr!273)))

(declare-fun b!292249 () Bool)

(declare-fun res!241398 () Bool)

(assert (=> b!292249 (=> (not res!241398) (not e!208425))))

(assert (=> b!292249 (= res!241398 (bvsge from!505 to!474))))

(declare-fun b!292250 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292250 (= e!208425 (not (invariant!0 (currentBit!14031 thiss!1728) (currentByte!14036 thiss!1728) (size!7521 (buf!7587 thiss!1728)))))))

(declare-fun arrayBitRangesEq!0 (array!17370 array!17370 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292250 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20331 0))(
  ( (Unit!20332) )
))
(declare-fun lt!424588 () Unit!20331)

(declare-fun lt!424589 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17370 array!17370 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20331)

(assert (=> b!292250 (= lt!424588 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424589 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292250 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424589)))

(assert (=> b!292250 (= lt!424589 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7521 arr!273))))))

(declare-fun lt!424590 () Unit!20331)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17370) Unit!20331)

(assert (=> b!292250 (= lt!424590 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65126 res!241399) b!292248))

(assert (= (and b!292248 res!241400) b!292249))

(assert (= (and b!292249 res!241398) b!292250))

(assert (= start!65126 b!292251))

(declare-fun m!427711 () Bool)

(assert (=> b!292251 m!427711))

(declare-fun m!427713 () Bool)

(assert (=> b!292248 m!427713))

(declare-fun m!427715 () Bool)

(assert (=> start!65126 m!427715))

(declare-fun m!427717 () Bool)

(assert (=> start!65126 m!427717))

(declare-fun m!427719 () Bool)

(assert (=> b!292250 m!427719))

(declare-fun m!427721 () Bool)

(assert (=> b!292250 m!427721))

(declare-fun m!427723 () Bool)

(assert (=> b!292250 m!427723))

(declare-fun m!427725 () Bool)

(assert (=> b!292250 m!427725))

(declare-fun m!427727 () Bool)

(assert (=> b!292250 m!427727))

(push 1)

(assert (not start!65126))

(assert (not b!292251))

(assert (not b!292250))

(assert (not b!292248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98898 () Bool)

(assert (=> d!98898 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14031 thiss!1728) (currentByte!14036 thiss!1728) (size!7521 (buf!7587 thiss!1728))))))

(declare-fun bs!25216 () Bool)

(assert (= bs!25216 d!98898))

(assert (=> bs!25216 m!427725))

(assert (=> start!65126 d!98898))

(declare-fun d!98900 () Bool)

(assert (=> d!98900 (= (array_inv!7133 arr!273) (bvsge (size!7521 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65126 d!98900))

(declare-fun d!98902 () Bool)

(assert (=> d!98902 (= (array_inv!7133 (buf!7587 thiss!1728)) (bvsge (size!7521 (buf!7587 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!292251 d!98902))

(declare-fun d!98904 () Bool)

(declare-fun res!241454 () Bool)

(declare-fun e!208494 () Bool)

(assert (=> d!98904 (=> res!241454 e!208494)))

(assert (=> d!98904 (= res!241454 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!424589))))

(assert (=> d!98904 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424589) e!208494)))

(declare-datatypes ((tuple4!862 0))(
  ( (tuple4!863 (_1!12774 (_ BitVec 32)) (_2!12774 (_ BitVec 32)) (_3!1301 (_ BitVec 32)) (_4!431 (_ BitVec 32))) )
))
(declare-fun lt!424635 () tuple4!862)

(declare-fun lt!424633 () (_ BitVec 32))

(declare-fun call!4932 () Bool)

(declare-fun bm!4929 () Bool)

(declare-fun lt!424634 () (_ BitVec 32))

(declare-fun c!13366 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4929 (= call!4932 (byteRangesEq!0 (select (arr!8547 arr!273) (_3!1301 lt!424635)) (select (arr!8547 arr!273) (_3!1301 lt!424635)) lt!424634 (ite c!13366 lt!424633 #b00000000000000000000000000001000)))))

(declare-fun b!292321 () Bool)

(declare-fun e!208492 () Bool)

(assert (=> b!292321 (= e!208492 (byteRangesEq!0 (select (arr!8547 arr!273) (_4!431 lt!424635)) (select (arr!8547 arr!273) (_4!431 lt!424635)) #b00000000000000000000000000000000 lt!424633))))

(declare-fun b!292322 () Bool)

(declare-fun e!208489 () Bool)

(declare-fun e!208490 () Bool)

(assert (=> b!292322 (= e!208489 e!208490)))

(assert (=> b!292322 (= c!13366 (= (_3!1301 lt!424635) (_4!431 lt!424635)))))

(declare-fun b!292323 () Bool)

(declare-fun e!208491 () Bool)

(assert (=> b!292323 (= e!208490 e!208491)))

(declare-fun res!241455 () Bool)

(assert (=> b!292323 (= res!241455 call!4932)))

(assert (=> b!292323 (=> (not res!241455) (not e!208491))))

(declare-fun b!292324 () Bool)

(declare-fun res!241456 () Bool)

(assert (=> b!292324 (= res!241456 (= lt!424633 #b00000000000000000000000000000000))))

(assert (=> b!292324 (=> res!241456 e!208492)))

(assert (=> b!292324 (= e!208491 e!208492)))

(declare-fun b!292325 () Bool)

(assert (=> b!292325 (= e!208494 e!208489)))

(declare-fun res!241453 () Bool)

(assert (=> b!292325 (=> (not res!241453) (not e!208489))))

(declare-fun e!208493 () Bool)

(assert (=> b!292325 (= res!241453 e!208493)))

(declare-fun res!241452 () Bool)

(assert (=> b!292325 (=> res!241452 e!208493)))

(assert (=> b!292325 (= res!241452 (bvsge (_1!12774 lt!424635) (_2!12774 lt!424635)))))

(assert (=> b!292325 (= lt!424633 ((_ extract 31 0) (bvsrem lt!424589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292325 (= lt!424634 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!862)

(assert (=> b!292325 (= lt!424635 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424589))))

(declare-fun b!292326 () Bool)

(assert (=> b!292326 (= e!208490 call!4932)))

(declare-fun b!292327 () Bool)

(declare-fun arrayRangesEq!1489 (array!17370 array!17370 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292327 (= e!208493 (arrayRangesEq!1489 arr!273 arr!273 (_1!12774 lt!424635) (_2!12774 lt!424635)))))

(assert (= (and d!98904 (not res!241454)) b!292325))

(assert (= (and b!292325 (not res!241452)) b!292327))

(assert (= (and b!292325 res!241453) b!292322))

(assert (= (and b!292322 c!13366) b!292326))

(assert (= (and b!292322 (not c!13366)) b!292323))

(assert (= (and b!292323 res!241455) b!292324))

(assert (= (and b!292324 (not res!241456)) b!292321))

(assert (= (or b!292326 b!292323) bm!4929))

(declare-fun m!427777 () Bool)

(assert (=> bm!4929 m!427777))

(assert (=> bm!4929 m!427777))

(assert (=> bm!4929 m!427777))

(assert (=> bm!4929 m!427777))

(declare-fun m!427779 () Bool)

(assert (=> bm!4929 m!427779))

(declare-fun m!427781 () Bool)

(assert (=> b!292321 m!427781))

(assert (=> b!292321 m!427781))

(assert (=> b!292321 m!427781))

(assert (=> b!292321 m!427781))

(declare-fun m!427783 () Bool)

(assert (=> b!292321 m!427783))

(declare-fun m!427785 () Bool)

(assert (=> b!292325 m!427785))

(declare-fun m!427787 () Bool)

(assert (=> b!292327 m!427787))

(assert (=> b!292250 d!98904))

(declare-fun d!98916 () Bool)

(assert (=> d!98916 (= (invariant!0 (currentBit!14031 thiss!1728) (currentByte!14036 thiss!1728) (size!7521 (buf!7587 thiss!1728))) (and (bvsge (currentBit!14031 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14031 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14036 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14036 thiss!1728) (size!7521 (buf!7587 thiss!1728))) (and (= (currentBit!14031 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14036 thiss!1728) (size!7521 (buf!7587 thiss!1728)))))))))

(assert (=> b!292250 d!98916))

(declare-fun d!98920 () Bool)

(declare-fun e!208503 () Bool)

(assert (=> d!98920 e!208503))

(declare-fun res!241464 () Bool)

(assert (=> d!98920 (=> (not res!241464) (not e!208503))))

(declare-fun lt!424647 () (_ BitVec 64))

(assert (=> d!98920 (= res!241464 (or (= lt!424647 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424647 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424647))))))

(assert (=> d!98920 (= lt!424647 ((_ sign_extend 32) (size!7521 arr!273)))))

(declare-fun lt!424646 () Unit!20331)

(declare-fun choose!59 (array!17370) Unit!20331)

(assert (=> d!98920 (= lt!424646 (choose!59 arr!273))))

(assert (=> d!98920 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!424646)))

(declare-fun b!292337 () Bool)

(assert (=> b!292337 (= e!208503 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7521 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98920 res!241464) b!292337))

(declare-fun m!427805 () Bool)

(assert (=> d!98920 m!427805))

(declare-fun m!427807 () Bool)

(assert (=> b!292337 m!427807))

(assert (=> b!292250 d!98920))

(declare-fun d!98928 () Bool)

(declare-fun res!241467 () Bool)

(declare-fun e!208509 () Bool)

(assert (=> d!98928 (=> res!241467 e!208509)))

(assert (=> d!98928 (= res!241467 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98928 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208509)))

(declare-fun lt!424650 () tuple4!862)

(declare-fun lt!424649 () (_ BitVec 32))

(declare-fun lt!424648 () (_ BitVec 32))

(declare-fun bm!4931 () Bool)

(declare-fun call!4934 () Bool)

(declare-fun c!13368 () Bool)

(assert (=> bm!4931 (= call!4934 (byteRangesEq!0 (select (arr!8547 arr!273) (_3!1301 lt!424650)) (select (arr!8547 arr!273) (_3!1301 lt!424650)) lt!424649 (ite c!13368 lt!424648 #b00000000000000000000000000001000)))))

(declare-fun e!208507 () Bool)

(declare-fun b!292338 () Bool)

(assert (=> b!292338 (= e!208507 (byteRangesEq!0 (select (arr!8547 arr!273) (_4!431 lt!424650)) (select (arr!8547 arr!273) (_4!431 lt!424650)) #b00000000000000000000000000000000 lt!424648))))

(declare-fun b!292339 () Bool)

(declare-fun e!208504 () Bool)

(declare-fun e!208505 () Bool)

(assert (=> b!292339 (= e!208504 e!208505)))

(assert (=> b!292339 (= c!13368 (= (_3!1301 lt!424650) (_4!431 lt!424650)))))

(declare-fun b!292340 () Bool)

(declare-fun e!208506 () Bool)

(assert (=> b!292340 (= e!208505 e!208506)))

(declare-fun res!241468 () Bool)

(assert (=> b!292340 (= res!241468 call!4934)))

(assert (=> b!292340 (=> (not res!241468) (not e!208506))))

(declare-fun b!292341 () Bool)

(declare-fun res!241469 () Bool)

(assert (=> b!292341 (= res!241469 (= lt!424648 #b00000000000000000000000000000000))))

(assert (=> b!292341 (=> res!241469 e!208507)))

(assert (=> b!292341 (= e!208506 e!208507)))

(declare-fun b!292342 () Bool)

(assert (=> b!292342 (= e!208509 e!208504)))

(declare-fun res!241466 () Bool)

(assert (=> b!292342 (=> (not res!241466) (not e!208504))))

(declare-fun e!208508 () Bool)

(assert (=> b!292342 (= res!241466 e!208508)))

(declare-fun res!241465 () Bool)

(assert (=> b!292342 (=> res!241465 e!208508)))

(assert (=> b!292342 (= res!241465 (bvsge (_1!12774 lt!424650) (_2!12774 lt!424650)))))

(assert (=> b!292342 (= lt!424648 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292342 (= lt!424649 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292342 (= lt!424650 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!292343 () Bool)

(assert (=> b!292343 (= e!208505 call!4934)))

(declare-fun b!292344 () Bool)

(assert (=> b!292344 (= e!208508 (arrayRangesEq!1489 arr!273 arr!273 (_1!12774 lt!424650) (_2!12774 lt!424650)))))

(assert (= (and d!98928 (not res!241467)) b!292342))

(assert (= (and b!292342 (not res!241465)) b!292344))

(assert (= (and b!292342 res!241466) b!292339))

(assert (= (and b!292339 c!13368) b!292343))


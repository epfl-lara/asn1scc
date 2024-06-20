; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65644 () Bool)

(assert start!65644)

(declare-fun b!294363 () Bool)

(declare-fun e!210386 () Bool)

(declare-fun e!210387 () Bool)

(assert (=> b!294363 (= e!210386 e!210387)))

(declare-fun res!243070 () Bool)

(assert (=> b!294363 (=> res!243070 e!210387)))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun lt!427451 () (_ BitVec 64))

(assert (=> b!294363 (= res!243070 (or (bvsgt from!505 lt!427451) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!427451)))))

(declare-datatypes ((array!17627 0))(
  ( (array!17628 (arr!8674 (Array (_ BitVec 32) (_ BitVec 8))) (size!7639 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17627)

(assert (=> b!294363 (= lt!427451 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7639 arr!273))))))

(declare-fun b!294364 () Bool)

(declare-fun e!210383 () Bool)

(declare-datatypes ((BitStream!13282 0))(
  ( (BitStream!13283 (buf!7702 array!17627) (currentByte!14193 (_ BitVec 32)) (currentBit!14188 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13282)

(declare-fun array_inv!7251 (array!17627) Bool)

(assert (=> b!294364 (= e!210383 (array_inv!7251 (buf!7702 thiss!1728)))))

(declare-fun b!294365 () Bool)

(declare-fun res!243069 () Bool)

(declare-fun e!210382 () Bool)

(assert (=> b!294365 (=> (not res!243069) (not e!210382))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294365 (= res!243069 (bvslt from!505 to!474))))

(declare-fun b!294366 () Bool)

(declare-fun res!243066 () Bool)

(assert (=> b!294366 (=> (not res!243066) (not e!210382))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294366 (= res!243066 (validate_offset_bits!1 ((_ sign_extend 32) (size!7639 (buf!7702 thiss!1728))) ((_ sign_extend 32) (currentByte!14193 thiss!1728)) ((_ sign_extend 32) (currentBit!14188 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun lt!427452 () array!17627)

(declare-fun b!294367 () Bool)

(declare-datatypes ((Unit!20503 0))(
  ( (Unit!20504) )
))
(declare-datatypes ((tuple3!1794 0))(
  ( (tuple3!1795 (_1!12908 Unit!20503) (_2!12908 BitStream!13282) (_3!1332 array!17627)) )
))
(declare-fun lt!427456 () tuple3!1794)

(declare-fun arrayBitRangesEq!0 (array!17627 array!17627 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294367 (= e!210387 (arrayBitRangesEq!0 lt!427452 (_3!1332 lt!427456) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun res!243071 () Bool)

(assert (=> start!65644 (=> (not res!243071) (not e!210382))))

(assert (=> start!65644 (= res!243071 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7639 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65644 e!210382))

(declare-fun inv!12 (BitStream!13282) Bool)

(assert (=> start!65644 (and (inv!12 thiss!1728) e!210383)))

(assert (=> start!65644 true))

(assert (=> start!65644 (array_inv!7251 arr!273)))

(declare-fun b!294368 () Bool)

(assert (=> b!294368 (= e!210382 (not e!210386))))

(declare-fun res!243068 () Bool)

(assert (=> b!294368 (=> res!243068 e!210386)))

(assert (=> b!294368 (= res!243068 (bvsgt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294368 (arrayBitRangesEq!0 arr!273 lt!427452 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23152 0))(
  ( (tuple2!23153 (_1!12909 Bool) (_2!12909 BitStream!13282)) )
))
(declare-fun lt!427455 () tuple2!23152)

(declare-fun lt!427454 () Unit!20503)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17627 (_ BitVec 64) Bool) Unit!20503)

(assert (=> b!294368 (= lt!427454 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12909 lt!427455)))))

(declare-fun e!210384 () Bool)

(assert (=> b!294368 e!210384))

(declare-fun res!243067 () Bool)

(assert (=> b!294368 (=> (not res!243067) (not e!210384))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294368 (= res!243067 (= (bvsub (bvadd (bitIndex!0 (size!7639 (buf!7702 thiss!1728)) (currentByte!14193 thiss!1728) (currentBit!14188 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7639 (buf!7702 (_2!12908 lt!427456))) (currentByte!14193 (_2!12908 lt!427456)) (currentBit!14188 (_2!12908 lt!427456)))))))

(declare-fun readBitsLoop!0 (BitStream!13282 (_ BitVec 64) array!17627 (_ BitVec 64) (_ BitVec 64)) tuple3!1794)

(assert (=> b!294368 (= lt!427456 (readBitsLoop!0 (_2!12909 lt!427455) nBits!523 lt!427452 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294368 (validate_offset_bits!1 ((_ sign_extend 32) (size!7639 (buf!7702 (_2!12909 lt!427455)))) ((_ sign_extend 32) (currentByte!14193 (_2!12909 lt!427455))) ((_ sign_extend 32) (currentBit!14188 (_2!12909 lt!427455))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427457 () Unit!20503)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13282 BitStream!13282 (_ BitVec 64) (_ BitVec 64)) Unit!20503)

(assert (=> b!294368 (= lt!427457 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12909 lt!427455) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427453 () (_ BitVec 32))

(declare-fun lt!427458 () (_ BitVec 32))

(assert (=> b!294368 (= lt!427452 (array!17628 (store (arr!8674 arr!273) lt!427453 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8674 arr!273) lt!427453)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427458)))) ((_ sign_extend 24) (ite (_1!12909 lt!427455) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427458) #b00000000))))) (size!7639 arr!273)))))

(assert (=> b!294368 (= lt!427458 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294368 (= lt!427453 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13282) tuple2!23152)

(assert (=> b!294368 (= lt!427455 (readBit!0 thiss!1728))))

(declare-fun b!294369 () Bool)

(assert (=> b!294369 (= e!210384 (and (= (buf!7702 thiss!1728) (buf!7702 (_2!12908 lt!427456))) (= (size!7639 arr!273) (size!7639 (_3!1332 lt!427456)))))))

(assert (= (and start!65644 res!243071) b!294366))

(assert (= (and b!294366 res!243066) b!294365))

(assert (= (and b!294365 res!243069) b!294368))

(assert (= (and b!294368 res!243067) b!294369))

(assert (= (and b!294368 (not res!243068)) b!294363))

(assert (= (and b!294363 (not res!243070)) b!294367))

(assert (= start!65644 b!294364))

(declare-fun m!430615 () Bool)

(assert (=> b!294364 m!430615))

(declare-fun m!430617 () Bool)

(assert (=> start!65644 m!430617))

(declare-fun m!430619 () Bool)

(assert (=> start!65644 m!430619))

(declare-fun m!430621 () Bool)

(assert (=> b!294367 m!430621))

(declare-fun m!430623 () Bool)

(assert (=> b!294366 m!430623))

(declare-fun m!430625 () Bool)

(assert (=> b!294368 m!430625))

(declare-fun m!430627 () Bool)

(assert (=> b!294368 m!430627))

(declare-fun m!430629 () Bool)

(assert (=> b!294368 m!430629))

(declare-fun m!430631 () Bool)

(assert (=> b!294368 m!430631))

(declare-fun m!430633 () Bool)

(assert (=> b!294368 m!430633))

(declare-fun m!430635 () Bool)

(assert (=> b!294368 m!430635))

(declare-fun m!430637 () Bool)

(assert (=> b!294368 m!430637))

(declare-fun m!430639 () Bool)

(assert (=> b!294368 m!430639))

(declare-fun m!430641 () Bool)

(assert (=> b!294368 m!430641))

(declare-fun m!430643 () Bool)

(assert (=> b!294368 m!430643))

(declare-fun m!430645 () Bool)

(assert (=> b!294368 m!430645))

(push 1)

(assert (not b!294368))

(assert (not b!294367))

(assert (not b!294364))

(assert (not b!294366))

(assert (not start!65644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99336 () Bool)

(assert (=> d!99336 (= (array_inv!7251 (buf!7702 thiss!1728)) (bvsge (size!7639 (buf!7702 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!294364 d!99336))

(declare-fun d!99338 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99338 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7639 (buf!7702 thiss!1728))) ((_ sign_extend 32) (currentByte!14193 thiss!1728)) ((_ sign_extend 32) (currentBit!14188 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7639 (buf!7702 thiss!1728))) ((_ sign_extend 32) (currentByte!14193 thiss!1728)) ((_ sign_extend 32) (currentBit!14188 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25405 () Bool)

(assert (= bs!25405 d!99338))

(declare-fun m!430749 () Bool)

(assert (=> bs!25405 m!430749))

(assert (=> b!294366 d!99338))

(declare-fun d!99340 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99340 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14188 thiss!1728) (currentByte!14193 thiss!1728) (size!7639 (buf!7702 thiss!1728))))))

(declare-fun bs!25406 () Bool)

(assert (= bs!25406 d!99340))

(declare-fun m!430751 () Bool)

(assert (=> bs!25406 m!430751))

(assert (=> start!65644 d!99340))

(declare-fun d!99342 () Bool)

(assert (=> d!99342 (= (array_inv!7251 arr!273) (bvsge (size!7639 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65644 d!99342))

(declare-fun b!294465 () Bool)

(declare-fun e!210479 () Bool)

(declare-fun e!210478 () Bool)

(assert (=> b!294465 (= e!210479 e!210478)))

(declare-fun c!13413 () Bool)

(declare-datatypes ((tuple4!872 0))(
  ( (tuple4!873 (_1!12916 (_ BitVec 32)) (_2!12916 (_ BitVec 32)) (_3!1336 (_ BitVec 32)) (_4!436 (_ BitVec 32))) )
))
(declare-fun lt!427582 () tuple4!872)

(assert (=> b!294465 (= c!13413 (= (_3!1336 lt!427582) (_4!436 lt!427582)))))

(declare-fun b!294466 () Bool)

(declare-fun res!243153 () Bool)

(declare-fun lt!427584 () (_ BitVec 32))

(assert (=> b!294466 (= res!243153 (= lt!427584 #b00000000000000000000000000000000))))

(declare-fun e!210477 () Bool)

(assert (=> b!294466 (=> res!243153 e!210477)))

(declare-fun e!210480 () Bool)

(assert (=> b!294466 (= e!210480 e!210477)))

(declare-fun b!294467 () Bool)

(declare-fun e!210482 () Bool)

(assert (=> b!294467 (= e!210482 e!210479)))

(declare-fun res!243151 () Bool)

(assert (=> b!294467 (=> (not res!243151) (not e!210479))))

(declare-fun e!210481 () Bool)

(assert (=> b!294467 (= res!243151 e!210481)))

(declare-fun res!243150 () Bool)

(assert (=> b!294467 (=> res!243150 e!210481)))

(assert (=> b!294467 (= res!243150 (bvsge (_1!12916 lt!427582) (_2!12916 lt!427582)))))

(assert (=> b!294467 (= lt!427584 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427583 () (_ BitVec 32))

(assert (=> b!294467 (= lt!427583 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!872)

(assert (=> b!294467 (= lt!427582 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294468 () Bool)

(declare-fun call!5006 () Bool)

(assert (=> b!294468 (= e!210478 call!5006)))

(declare-fun b!294469 () Bool)

(declare-fun arrayRangesEq!1494 (array!17627 array!17627 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!294469 (= e!210481 (arrayRangesEq!1494 lt!427452 (_3!1332 lt!427456) (_1!12916 lt!427582) (_2!12916 lt!427582)))))

(declare-fun d!99344 () Bool)

(declare-fun res!243154 () Bool)

(assert (=> d!99344 (=> res!243154 e!210482)))

(assert (=> d!99344 (= res!243154 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99344 (= (arrayBitRangesEq!0 lt!427452 (_3!1332 lt!427456) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) e!210482)))

(declare-fun b!294470 () Bool)

(assert (=> b!294470 (= e!210478 e!210480)))

(declare-fun res!243152 () Bool)

(assert (=> b!294470 (= res!243152 call!5006)))

(assert (=> b!294470 (=> (not res!243152) (not e!210480))))

(declare-fun b!294471 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!294471 (= e!210477 (byteRangesEq!0 (select (arr!8674 lt!427452) (_4!436 lt!427582)) (select (arr!8674 (_3!1332 lt!427456)) (_4!436 lt!427582)) #b00000000000000000000000000000000 lt!427584))))

(declare-fun bm!5003 () Bool)

(assert (=> bm!5003 (= call!5006 (byteRangesEq!0 (select (arr!8674 lt!427452) (_3!1336 lt!427582)) (select (arr!8674 (_3!1332 lt!427456)) (_3!1336 lt!427582)) lt!427583 (ite c!13413 lt!427584 #b00000000000000000000000000001000)))))

(assert (= (and d!99344 (not res!243154)) b!294467))

(assert (= (and b!294467 (not res!243150)) b!294469))

(assert (= (and b!294467 res!243151) b!294465))

(assert (= (and b!294465 c!13413) b!294468))

(assert (= (and b!294465 (not c!13413)) b!294470))

(assert (= (and b!294470 res!243152) b!294466))

(assert (= (and b!294466 (not res!243153)) b!294471))

(assert (= (or b!294468 b!294470) bm!5003))

(declare-fun m!430763 () Bool)

(assert (=> b!294467 m!430763))

(declare-fun m!430765 () Bool)

(assert (=> b!294469 m!430765))

(declare-fun m!430767 () Bool)

(assert (=> b!294471 m!430767))

(declare-fun m!430769 () Bool)

(assert (=> b!294471 m!430769))

(assert (=> b!294471 m!430767))

(assert (=> b!294471 m!430769))

(declare-fun m!430771 () Bool)

(assert (=> b!294471 m!430771))

(declare-fun m!430773 () Bool)

(assert (=> bm!5003 m!430773))

(declare-fun m!430775 () Bool)

(assert (=> bm!5003 m!430775))

(assert (=> bm!5003 m!430773))

(assert (=> bm!5003 m!430775))

(declare-fun m!430777 () Bool)

(assert (=> bm!5003 m!430777))

(assert (=> b!294367 d!99344))

(declare-fun lt!427793 () Unit!20503)

(declare-fun b!294509 () Bool)

(declare-fun e!210500 () tuple3!1794)

(assert (=> b!294509 (= e!210500 (tuple3!1795 lt!427793 (_2!12909 lt!427455) lt!427452))))

(declare-fun lt!427776 () Unit!20503)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17627) Unit!20503)

(assert (=> b!294509 (= lt!427776 (arrayBitRangesEqReflexiveLemma!0 lt!427452))))

(declare-fun call!5015 () Bool)

(assert (=> b!294509 call!5015))

(declare-fun lt!427767 () Unit!20503)

(assert (=> b!294509 (= lt!427767 lt!427776)))

(declare-fun lt!427796 () array!17627)

(assert (=> b!294509 (= lt!427796 lt!427452)))

(declare-fun lt!427729 () array!17627)

(assert (=> b!294509 (= lt!427729 lt!427452)))

(declare-fun lt!427794 () (_ BitVec 64))

(assert (=> b!294509 (= lt!427794 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427741 () (_ BitVec 64))

(assert (=> b!294509 (= lt!427741 ((_ sign_extend 32) (size!7639 lt!427452)))))

(declare-fun lt!427798 () (_ BitVec 64))

(assert (=> b!294509 (= lt!427798 (bvmul lt!427741 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!427765 () (_ BitVec 64))

(assert (=> b!294509 (= lt!427765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427749 () (_ BitVec 64))

(assert (=> b!294509 (= lt!427749 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17627 array!17627 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20503)

(assert (=> b!294509 (= lt!427793 (arrayBitRangesEqSlicedLemma!0 lt!427796 lt!427729 lt!427794 lt!427798 lt!427765 lt!427749))))

(declare-fun call!5018 () Bool)

(assert (=> b!294509 call!5018))

(declare-fun lt!427747 () tuple2!23152)

(declare-fun bm!5012 () Bool)

(declare-fun c!13418 () Bool)

(declare-fun lt!427774 () (_ BitVec 32))

(declare-fun lt!427733 () (_ BitVec 32))

(assert (=> bm!5012 (= call!5015 (arrayBitRangesEq!0 lt!427452 (ite c!13418 (array!17628 (store (arr!8674 lt!427452) lt!427774 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8674 lt!427452) lt!427774)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427733)))) ((_ sign_extend 24) (ite (_1!12909 lt!427747) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427733) #b00000000))))) (size!7639 lt!427452)) lt!427452) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13418 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7639 lt!427452)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!210502 () Bool)

(declare-fun lt!427781 () tuple3!1794)

(declare-fun b!294512 () Bool)

(declare-fun bitAt!0 (array!17627 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!23162 0))(
  ( (tuple2!23163 (_1!12918 BitStream!13282) (_2!12918 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13282) tuple2!23162)

(assert (=> b!294512 (= e!210502 (= (bitAt!0 (_3!1332 lt!427781) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12918 (readBitPure!0 (_2!12909 lt!427455)))))))

(declare-fun d!99348 () Bool)

(declare-fun e!210499 () Bool)

(assert (=> d!99348 e!210499))

(declare-fun res!243195 () Bool)

(assert (=> d!99348 (=> (not res!243195) (not e!210499))))

(declare-fun lt!427750 () (_ BitVec 64))

(assert (=> d!99348 (= res!243195 (= (bvsub lt!427750 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7639 (buf!7702 (_2!12908 lt!427781))) (currentByte!14193 (_2!12908 lt!427781)) (currentBit!14188 (_2!12908 lt!427781)))))))

(assert (=> d!99348 (or (= (bvand lt!427750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!427750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!427750 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!427739 () (_ BitVec 64))

(assert (=> d!99348 (= lt!427750 (bvadd lt!427739 to!474))))

(assert (=> d!99348 (or (not (= (bvand lt!427739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!427739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!427739 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99348 (= lt!427739 (bitIndex!0 (size!7639 (buf!7702 (_2!12909 lt!427455))) (currentByte!14193 (_2!12909 lt!427455)) (currentBit!14188 (_2!12909 lt!427455))))))

(assert (=> d!99348 (= lt!427781 e!210500)))

(assert (=> d!99348 (= c!13418 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99348 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99348 (= (readBitsLoop!0 (_2!12909 lt!427455) nBits!523 lt!427452 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!427781)))

(declare-fun b!294514 () Bool)

(declare-datatypes ((List!976 0))(
  ( (Nil!973) (Cons!972 (h!1091 Bool) (t!1861 List!976)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13282 array!17627 (_ BitVec 64) (_ BitVec 64)) List!976)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13282 BitStream!13282 (_ BitVec 64)) List!976)

(assert (=> b!294514 (= e!210499 (= (byteArrayBitContentToList!0 (_2!12908 lt!427781) (_3!1332 lt!427781) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12908 lt!427781) (_2!12909 lt!427455) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!294514 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!294514 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294515 () Bool)

(declare-fun res!243190 () Bool)

(assert (=> b!294515 (=> (not res!243190) (not e!210499))))

(assert (=> b!294515 (= res!243190 e!210502)))

(declare-fun res!243194 () Bool)

(assert (=> b!294515 (=> res!243194 e!210502)))

(assert (=> b!294515 (= res!243194 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!294516 () Bool)

(declare-fun e!210506 () Bool)

(declare-fun lt!427736 () tuple3!1794)

(assert (=> b!294516 (= e!210506 (and (= (buf!7702 (_2!12909 lt!427455)) (buf!7702 (_2!12908 lt!427736))) (= (size!7639 lt!427452) (size!7639 (_3!1332 lt!427736)))))))

(declare-fun b!294518 () Bool)

(declare-fun res!243191 () Bool)

(assert (=> b!294518 (=> (not res!243191) (not e!210499))))

(assert (=> b!294518 (= res!243191 (and (= (buf!7702 (_2!12909 lt!427455)) (buf!7702 (_2!12908 lt!427781))) (= (size!7639 lt!427452) (size!7639 (_3!1332 lt!427781)))))))

(declare-fun b!294520 () Bool)

(declare-fun res!243189 () Bool)

(assert (=> b!294520 (=> (not res!243189) (not e!210499))))

(assert (=> b!294520 (= res!243189 (invariant!0 (currentBit!14188 (_2!12908 lt!427781)) (currentByte!14193 (_2!12908 lt!427781)) (size!7639 (buf!7702 (_2!12908 lt!427781)))))))

(declare-fun b!294522 () Bool)

(declare-fun res!243184 () Bool)

(assert (=> b!294522 (=> (not res!243184) (not e!210499))))

(assert (=> b!294522 (= res!243184 (arrayBitRangesEq!0 lt!427452 (_3!1332 lt!427781) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294524 () Bool)

(declare-fun lt!427745 () Unit!20503)

(assert (=> b!294524 (= e!210500 (tuple3!1795 lt!427745 (_2!12908 lt!427736) (_3!1332 lt!427736)))))

(assert (=> b!294524 (= lt!427747 (readBit!0 (_2!12909 lt!427455)))))

(declare-fun lt!427764 () (_ BitVec 32))

(assert (=> b!294524 (= lt!427764 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427735 () (_ BitVec 32))

(assert (=> b!294524 (= lt!427735 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427753 () array!17627)

(assert (=> b!294524 (= lt!427753 (array!17628 (store (arr!8674 lt!427452) lt!427764 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8674 lt!427452) lt!427764)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427735)))) ((_ sign_extend 24) (ite (_1!12909 lt!427747) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427735) #b00000000))))) (size!7639 lt!427452)))))

(declare-fun lt!427760 () (_ BitVec 64))

(assert (=> b!294524 (= lt!427760 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!427800 () (_ BitVec 64))

(assert (=> b!294524 (= lt!427800 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!427769 () Unit!20503)

(assert (=> b!294524 (= lt!427769 (validateOffsetBitsIneqLemma!0 (_2!12909 lt!427455) (_2!12909 lt!427747) lt!427760 lt!427800))))

(assert (=> b!294524 (validate_offset_bits!1 ((_ sign_extend 32) (size!7639 (buf!7702 (_2!12909 lt!427747)))) ((_ sign_extend 32) (currentByte!14193 (_2!12909 lt!427747))) ((_ sign_extend 32) (currentBit!14188 (_2!12909 lt!427747))) (bvsub lt!427760 lt!427800))))

(declare-fun lt!427757 () Unit!20503)

(assert (=> b!294524 (= lt!427757 lt!427769)))

(assert (=> b!294524 (= lt!427736 (readBitsLoop!0 (_2!12909 lt!427747) nBits!523 lt!427753 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!243186 () Bool)

(assert (=> b!294524 (= res!243186 (= (bvsub (bvadd (bitIndex!0 (size!7639 (buf!7702 (_2!12909 lt!427455))) (currentByte!14193 (_2!12909 lt!427455)) (currentBit!14188 (_2!12909 lt!427455))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7639 (buf!7702 (_2!12908 lt!427736))) (currentByte!14193 (_2!12908 lt!427736)) (currentBit!14188 (_2!12908 lt!427736)))))))

(assert (=> b!294524 (=> (not res!243186) (not e!210506))))

(assert (=> b!294524 e!210506))

(declare-fun lt!427743 () Unit!20503)

(declare-fun Unit!20513 () Unit!20503)

(assert (=> b!294524 (= lt!427743 Unit!20513)))

(assert (=> b!294524 (= lt!427774 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294524 (= lt!427733 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427787 () Unit!20503)

(assert (=> b!294524 (= lt!427787 (arrayBitRangesUpdatedAtLemma!0 lt!427452 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12909 lt!427747)))))

(assert (=> b!294524 call!5015))

(declare-fun lt!427799 () Unit!20503)

(assert (=> b!294524 (= lt!427799 lt!427787)))

(declare-fun lt!427771 () (_ BitVec 64))

(assert (=> b!294524 (= lt!427771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427786 () Unit!20503)

(declare-fun arrayBitRangesEqTransitive!0 (array!17627 array!17627 array!17627 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20503)

(assert (=> b!294524 (= lt!427786 (arrayBitRangesEqTransitive!0 lt!427452 lt!427753 (_3!1332 lt!427736) lt!427771 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!294524 call!5018))

(declare-fun lt!427778 () Unit!20503)

(assert (=> b!294524 (= lt!427778 lt!427786)))

(assert (=> b!294524 (arrayBitRangesEq!0 lt!427452 (_3!1332 lt!427736) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!427755 () Unit!20503)

(declare-fun Unit!20514 () Unit!20503)

(assert (=> b!294524 (= lt!427755 Unit!20514)))

(declare-fun lt!427762 () Unit!20503)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17627 array!17627 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20503)

(assert (=> b!294524 (= lt!427762 (arrayBitRangesEqImpliesEq!0 lt!427753 (_3!1332 lt!427736) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!294524 (= (bitAt!0 lt!427753 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1332 lt!427736) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!427791 () Unit!20503)

(assert (=> b!294524 (= lt!427791 lt!427762)))

(declare-fun lt!427784 () Unit!20503)

(declare-fun Unit!20515 () Unit!20503)

(assert (=> b!294524 (= lt!427784 Unit!20515)))

(declare-fun lt!427780 () Bool)

(assert (=> b!294524 (= lt!427780 (= (bitAt!0 (_3!1332 lt!427736) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12909 lt!427747)))))

(declare-fun Unit!20516 () Unit!20503)

(assert (=> b!294524 (= lt!427745 Unit!20516)))

(assert (=> b!294524 lt!427780))

(declare-fun bm!5015 () Bool)

(assert (=> bm!5015 (= call!5018 (arrayBitRangesEq!0 (ite c!13418 lt!427452 lt!427796) (ite c!13418 (_3!1332 lt!427736) lt!427729) (ite c!13418 lt!427771 lt!427765) (ite c!13418 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!427749)))))

(assert (= (and d!99348 c!13418) b!294524))

(assert (= (and d!99348 (not c!13418)) b!294509))

(assert (= (and b!294524 res!243186) b!294516))

(assert (= (or b!294524 b!294509) bm!5015))

(assert (= (or b!294524 b!294509) bm!5012))

(assert (= (and d!99348 res!243195) b!294518))

(assert (= (and b!294518 res!243191) b!294522))

(assert (= (and b!294522 res!243184) b!294515))

(assert (= (and b!294515 (not res!243194)) b!294512))

(assert (= (and b!294515 res!243190) b!294520))

(assert (= (and b!294520 res!243189) b!294514))

(declare-fun m!430779 () Bool)

(assert (=> b!294514 m!430779))

(declare-fun m!430783 () Bool)

(assert (=> b!294514 m!430783))

(declare-fun m!430787 () Bool)

(assert (=> bm!5012 m!430787))

(declare-fun m!430791 () Bool)

(assert (=> bm!5012 m!430791))

(declare-fun m!430799 () Bool)

(assert (=> bm!5012 m!430799))

(declare-fun m!430805 () Bool)

(assert (=> bm!5012 m!430805))

(declare-fun m!430807 () Bool)

(assert (=> b!294509 m!430807))

(declare-fun m!430809 () Bool)

(assert (=> b!294509 m!430809))

(declare-fun m!430811 () Bool)

(assert (=> b!294520 m!430811))

(declare-fun m!430815 () Bool)

(assert (=> bm!5015 m!430815))

(declare-fun m!430819 () Bool)

(assert (=> b!294512 m!430819))

(declare-fun m!430821 () Bool)

(assert (=> b!294512 m!430821))

(declare-fun m!430823 () Bool)

(assert (=> b!294524 m!430823))

(declare-fun m!430825 () Bool)

(assert (=> b!294524 m!430825))

(declare-fun m!430829 () Bool)

(assert (=> b!294524 m!430829))

(declare-fun m!430835 () Bool)

(assert (=> b!294524 m!430835))

(declare-fun m!430839 () Bool)

(assert (=> b!294524 m!430839))

(declare-fun m!430841 () Bool)

(assert (=> b!294524 m!430841))

(declare-fun m!430847 () Bool)

(assert (=> b!294524 m!430847))

(declare-fun m!430853 () Bool)

(assert (=> b!294524 m!430853))

(declare-fun m!430857 () Bool)

(assert (=> b!294524 m!430857))

(declare-fun m!430863 () Bool)

(assert (=> b!294524 m!430863))

(declare-fun m!430869 () Bool)

(assert (=> b!294524 m!430869))

(declare-fun m!430873 () Bool)

(assert (=> b!294524 m!430873))

(declare-fun m!430877 () Bool)

(assert (=> b!294524 m!430877))

(declare-fun m!430879 () Bool)

(assert (=> b!294524 m!430879))

(declare-fun m!430881 () Bool)

(assert (=> b!294524 m!430881))

(declare-fun m!430885 () Bool)

(assert (=> b!294522 m!430885))

(declare-fun m!430887 () Bool)

(assert (=> d!99348 m!430887))

(assert (=> d!99348 m!430873))

(assert (=> b!294368 d!99348))

(declare-fun d!99354 () Bool)

(declare-fun e!210523 () Bool)

(assert (=> d!99354 e!210523))

(declare-fun res!243218 () Bool)

(assert (=> d!99354 (=> (not res!243218) (not e!210523))))

(declare-fun lt!427885 () (_ BitVec 32))

(assert (=> d!99354 (= res!243218 (and (bvsge lt!427885 #b00000000000000000000000000000000) (bvslt lt!427885 (size!7639 arr!273))))))

(declare-fun lt!427886 () (_ BitVec 32))

(declare-fun lt!427884 () (_ BitVec 8))

(declare-fun lt!427887 () Unit!20503)

(declare-fun choose!53 (array!17627 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20503)

(assert (=> d!99354 (= lt!427887 (choose!53 arr!273 from!505 (_1!12909 lt!427455) lt!427885 lt!427886 lt!427884))))

(assert (=> d!99354 (= lt!427884 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8674 arr!273) lt!427885)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427886)))) ((_ sign_extend 24) (ite (_1!12909 lt!427455) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427886) #b00000000)))))))

(assert (=> d!99354 (= lt!427886 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99354 (= lt!427885 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99354 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12909 lt!427455)) lt!427887)))

(declare-fun b!294554 () Bool)

(assert (=> b!294554 (= e!210523 (arrayBitRangesEq!0 arr!273 (array!17628 (store (arr!8674 arr!273) lt!427885 lt!427884) (size!7639 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99354 res!243218) b!294554))

(declare-fun m!430911 () Bool)

(assert (=> d!99354 m!430911))

(declare-fun m!430913 () Bool)

(assert (=> d!99354 m!430913))

(declare-fun m!430915 () Bool)

(assert (=> d!99354 m!430915))

(declare-fun m!430917 () Bool)

(assert (=> b!294554 m!430917))

(declare-fun m!430919 () Bool)

(assert (=> b!294554 m!430919))

(assert (=> b!294368 d!99354))

(declare-fun d!99366 () Bool)

(declare-fun e!210530 () Bool)

(assert (=> d!99366 e!210530))

(declare-fun res!243231 () Bool)

(assert (=> d!99366 (=> (not res!243231) (not e!210530))))

(declare-fun lt!427939 () (_ BitVec 64))

(declare-fun lt!427937 () (_ BitVec 64))

(declare-fun lt!427940 () (_ BitVec 64))

(assert (=> d!99366 (= res!243231 (= lt!427940 (bvsub lt!427937 lt!427939)))))

(assert (=> d!99366 (or (= (bvand lt!427937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!427939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!427937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!427937 lt!427939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99366 (= lt!427939 (remainingBits!0 ((_ sign_extend 32) (size!7639 (buf!7702 thiss!1728))) ((_ sign_extend 32) (currentByte!14193 thiss!1728)) ((_ sign_extend 32) (currentBit!14188 thiss!1728))))))

(declare-fun lt!427936 () (_ BitVec 64))

(declare-fun lt!427941 () (_ BitVec 64))

(assert (=> d!99366 (= lt!427937 (bvmul lt!427936 lt!427941))))

(assert (=> d!99366 (or (= lt!427936 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!427941 (bvsdiv (bvmul lt!427936 lt!427941) lt!427936)))))

(assert (=> d!99366 (= lt!427941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99366 (= lt!427936 ((_ sign_extend 32) (size!7639 (buf!7702 thiss!1728))))))

(assert (=> d!99366 (= lt!427940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14193 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14188 thiss!1728))))))

(assert (=> d!99366 (invariant!0 (currentBit!14188 thiss!1728) (currentByte!14193 thiss!1728) (size!7639 (buf!7702 thiss!1728)))))

(assert (=> d!99366 (= (bitIndex!0 (size!7639 (buf!7702 thiss!1728)) (currentByte!14193 thiss!1728) (currentBit!14188 thiss!1728)) lt!427940)))

(declare-fun b!294568 () Bool)

(declare-fun res!243230 () Bool)

(assert (=> b!294568 (=> (not res!243230) (not e!210530))))

(assert (=> b!294568 (= res!243230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!427940))))

(declare-fun b!294569 () Bool)

(declare-fun lt!427938 () (_ BitVec 64))

(assert (=> b!294569 (= e!210530 (bvsle lt!427940 (bvmul lt!427938 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294569 (or (= lt!427938 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!427938 #b0000000000000000000000000000000000000000000000000000000000001000) lt!427938)))))

(assert (=> b!294569 (= lt!427938 ((_ sign_extend 32) (size!7639 (buf!7702 thiss!1728))))))

(assert (= (and d!99366 res!243231) b!294568))

(assert (= (and b!294568 res!243230) b!294569))

(assert (=> d!99366 m!430749))

(assert (=> d!99366 m!430751))

(assert (=> b!294368 d!99366))

(declare-fun d!99368 () Bool)

(declare-fun e!210552 () Bool)

(assert (=> d!99368 e!210552))

(declare-fun res!243247 () Bool)

(assert (=> d!99368 (=> (not res!243247) (not e!210552))))

(declare-datatypes ((tuple2!23166 0))(
  ( (tuple2!23167 (_1!12920 Unit!20503) (_2!12920 BitStream!13282)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13282) tuple2!23166)

(assert (=> d!99368 (= res!243247 (= (buf!7702 (_2!12920 (increaseBitIndex!0 thiss!1728))) (buf!7702 thiss!1728)))))

(declare-fun lt!427971 () Bool)

(assert (=> d!99368 (= lt!427971 (not (= (bvand ((_ sign_extend 24) (select (arr!8674 (buf!7702 thiss!1728)) (currentByte!14193 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14188 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!427966 () tuple2!23152)

(assert (=> d!99368 (= lt!427966 (tuple2!23153 (not (= (bvand ((_ sign_extend 24) (select (arr!8674 (buf!7702 thiss!1728)) (currentByte!14193 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14188 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12920 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99368 (validate_offset_bit!0 ((_ sign_extend 32) (size!7639 (buf!7702 thiss!1728))) ((_ sign_extend 32) (currentByte!14193 thiss!1728)) ((_ sign_extend 32) (currentBit!14188 thiss!1728)))))

(assert (=> d!99368 (= (readBit!0 thiss!1728) lt!427966)))

(declare-fun b!294589 () Bool)

(declare-fun lt!427968 () (_ BitVec 64))

(declare-fun lt!427965 () (_ BitVec 64))

(assert (=> b!294589 (= e!210552 (= (bitIndex!0 (size!7639 (buf!7702 (_2!12920 (increaseBitIndex!0 thiss!1728)))) (currentByte!14193 (_2!12920 (increaseBitIndex!0 thiss!1728))) (currentBit!14188 (_2!12920 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!427968 lt!427965)))))

(assert (=> b!294589 (or (not (= (bvand lt!427968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!427965 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!427968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!427968 lt!427965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!294589 (= lt!427965 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!294589 (= lt!427968 (bitIndex!0 (size!7639 (buf!7702 thiss!1728)) (currentByte!14193 thiss!1728) (currentBit!14188 thiss!1728)))))

(declare-fun lt!427967 () Bool)

(assert (=> b!294589 (= lt!427967 (not (= (bvand ((_ sign_extend 24) (select (arr!8674 (buf!7702 thiss!1728)) (currentByte!14193 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14188 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!427969 () Bool)

(assert (=> b!294589 (= lt!427969 (not (= (bvand ((_ sign_extend 24) (select (arr!8674 (buf!7702 thiss!1728)) (currentByte!14193 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14188 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!427970 () Bool)

(assert (=> b!294589 (= lt!427970 (not (= (bvand ((_ sign_extend 24) (select (arr!8674 (buf!7702 thiss!1728)) (currentByte!14193 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14188 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99368 res!243247) b!294589))

(declare-fun m!430983 () Bool)

(assert (=> d!99368 m!430983))

(declare-fun m!430985 () Bool)

(assert (=> d!99368 m!430985))

(declare-fun m!430987 () Bool)

(assert (=> d!99368 m!430987))

(declare-fun m!430989 () Bool)

(assert (=> d!99368 m!430989))

(assert (=> b!294589 m!430987))

(declare-fun m!430991 () Bool)

(assert (=> b!294589 m!430991))

(assert (=> b!294589 m!430631))

(assert (=> b!294589 m!430985))

(assert (=> b!294589 m!430983))

(assert (=> b!294368 d!99368))

(declare-fun b!294590 () Bool)

(declare-fun e!210555 () Bool)

(declare-fun e!210554 () Bool)

(assert (=> b!294590 (= e!210555 e!210554)))

(declare-fun c!13426 () Bool)

(declare-fun lt!427972 () tuple4!872)

(assert (=> b!294590 (= c!13426 (= (_3!1336 lt!427972) (_4!436 lt!427972)))))

(declare-fun b!294591 () Bool)

(declare-fun res!243251 () Bool)

(declare-fun lt!427974 () (_ BitVec 32))

(assert (=> b!294591 (= res!243251 (= lt!427974 #b00000000000000000000000000000000))))

(declare-fun e!210553 () Bool)

(assert (=> b!294591 (=> res!243251 e!210553)))

(declare-fun e!210556 () Bool)

(assert (=> b!294591 (= e!210556 e!210553)))

(declare-fun b!294592 () Bool)

(declare-fun e!210558 () Bool)

(assert (=> b!294592 (= e!210558 e!210555)))

(declare-fun res!243249 () Bool)

(assert (=> b!294592 (=> (not res!243249) (not e!210555))))

(declare-fun e!210557 () Bool)

(assert (=> b!294592 (= res!243249 e!210557)))

(declare-fun res!243248 () Bool)

(assert (=> b!294592 (=> res!243248 e!210557)))

(assert (=> b!294592 (= res!243248 (bvsge (_1!12916 lt!427972) (_2!12916 lt!427972)))))

(assert (=> b!294592 (= lt!427974 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427973 () (_ BitVec 32))

(assert (=> b!294592 (= lt!427973 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294592 (= lt!427972 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!294593 () Bool)

(declare-fun call!5028 () Bool)

(assert (=> b!294593 (= e!210554 call!5028)))

(declare-fun b!294594 () Bool)

(assert (=> b!294594 (= e!210557 (arrayRangesEq!1494 arr!273 lt!427452 (_1!12916 lt!427972) (_2!12916 lt!427972)))))

(declare-fun d!99376 () Bool)

(declare-fun res!243252 () Bool)

(assert (=> d!99376 (=> res!243252 e!210558)))

(assert (=> d!99376 (= res!243252 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99376 (= (arrayBitRangesEq!0 arr!273 lt!427452 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!210558)))

(declare-fun b!294595 () Bool)

(assert (=> b!294595 (= e!210554 e!210556)))

(declare-fun res!243250 () Bool)

(assert (=> b!294595 (= res!243250 call!5028)))

(assert (=> b!294595 (=> (not res!243250) (not e!210556))))

(declare-fun b!294596 () Bool)

(assert (=> b!294596 (= e!210553 (byteRangesEq!0 (select (arr!8674 arr!273) (_4!436 lt!427972)) (select (arr!8674 lt!427452) (_4!436 lt!427972)) #b00000000000000000000000000000000 lt!427974))))

(declare-fun bm!5025 () Bool)

(assert (=> bm!5025 (= call!5028 (byteRangesEq!0 (select (arr!8674 arr!273) (_3!1336 lt!427972)) (select (arr!8674 lt!427452) (_3!1336 lt!427972)) lt!427973 (ite c!13426 lt!427974 #b00000000000000000000000000001000)))))

(assert (= (and d!99376 (not res!243252)) b!294592))

(assert (= (and b!294592 (not res!243248)) b!294594))

(assert (= (and b!294592 res!243249) b!294590))

(assert (= (and b!294590 c!13426) b!294593))

(assert (= (and b!294590 (not c!13426)) b!294595))

(assert (= (and b!294595 res!243250) b!294591))

(assert (= (and b!294591 (not res!243251)) b!294596))

(assert (= (or b!294593 b!294595) bm!5025))

(declare-fun m!430993 () Bool)

(assert (=> b!294592 m!430993))

(declare-fun m!430995 () Bool)

(assert (=> b!294594 m!430995))

(declare-fun m!430997 () Bool)

(assert (=> b!294596 m!430997))

(declare-fun m!430999 () Bool)

(assert (=> b!294596 m!430999))

(assert (=> b!294596 m!430997))

(assert (=> b!294596 m!430999))

(declare-fun m!431001 () Bool)

(assert (=> b!294596 m!431001))

(declare-fun m!431003 () Bool)

(assert (=> bm!5025 m!431003))

(declare-fun m!431005 () Bool)

(assert (=> bm!5025 m!431005))

(assert (=> bm!5025 m!431003))

(assert (=> bm!5025 m!431005))

(declare-fun m!431007 () Bool)

(assert (=> bm!5025 m!431007))

(assert (=> b!294368 d!99376))

(declare-fun d!99378 () Bool)

(declare-fun e!210567 () Bool)

(assert (=> d!99378 e!210567))

(declare-fun res!243260 () Bool)

(assert (=> d!99378 (=> (not res!243260) (not e!210567))))

(assert (=> d!99378 (= res!243260 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!427980 () Unit!20503)

(declare-fun choose!27 (BitStream!13282 BitStream!13282 (_ BitVec 64) (_ BitVec 64)) Unit!20503)

(assert (=> d!99378 (= lt!427980 (choose!27 thiss!1728 (_2!12909 lt!427455) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99378 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99378 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12909 lt!427455) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!427980)))

(declare-fun b!294606 () Bool)

(assert (=> b!294606 (= e!210567 (validate_offset_bits!1 ((_ sign_extend 32) (size!7639 (buf!7702 (_2!12909 lt!427455)))) ((_ sign_extend 32) (currentByte!14193 (_2!12909 lt!427455))) ((_ sign_extend 32) (currentBit!14188 (_2!12909 lt!427455))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99378 res!243260) b!294606))

(declare-fun m!431025 () Bool)

(assert (=> d!99378 m!431025))

(assert (=> b!294606 m!430637))

(assert (=> b!294368 d!99378))

(declare-fun d!99382 () Bool)

(declare-fun e!210568 () Bool)

(assert (=> d!99382 e!210568))

(declare-fun res!243262 () Bool)

(assert (=> d!99382 (=> (not res!243262) (not e!210568))))

(declare-fun lt!427985 () (_ BitVec 64))

(declare-fun lt!427984 () (_ BitVec 64))

(declare-fun lt!427982 () (_ BitVec 64))

(assert (=> d!99382 (= res!243262 (= lt!427985 (bvsub lt!427982 lt!427984)))))

(assert (=> d!99382 (or (= (bvand lt!427982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!427984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!427982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!427982 lt!427984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99382 (= lt!427984 (remainingBits!0 ((_ sign_extend 32) (size!7639 (buf!7702 (_2!12908 lt!427456)))) ((_ sign_extend 32) (currentByte!14193 (_2!12908 lt!427456))) ((_ sign_extend 32) (currentBit!14188 (_2!12908 lt!427456)))))))

(declare-fun lt!427981 () (_ BitVec 64))

(declare-fun lt!427986 () (_ BitVec 64))

(assert (=> d!99382 (= lt!427982 (bvmul lt!427981 lt!427986))))

(assert (=> d!99382 (or (= lt!427981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!427986 (bvsdiv (bvmul lt!427981 lt!427986) lt!427981)))))

(assert (=> d!99382 (= lt!427986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99382 (= lt!427981 ((_ sign_extend 32) (size!7639 (buf!7702 (_2!12908 lt!427456)))))))

(assert (=> d!99382 (= lt!427985 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14193 (_2!12908 lt!427456))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14188 (_2!12908 lt!427456)))))))

(assert (=> d!99382 (invariant!0 (currentBit!14188 (_2!12908 lt!427456)) (currentByte!14193 (_2!12908 lt!427456)) (size!7639 (buf!7702 (_2!12908 lt!427456))))))

(assert (=> d!99382 (= (bitIndex!0 (size!7639 (buf!7702 (_2!12908 lt!427456))) (currentByte!14193 (_2!12908 lt!427456)) (currentBit!14188 (_2!12908 lt!427456))) lt!427985)))

(declare-fun b!294607 () Bool)

(declare-fun res!243261 () Bool)

(assert (=> b!294607 (=> (not res!243261) (not e!210568))))

(assert (=> b!294607 (= res!243261 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!427985))))

(declare-fun b!294608 () Bool)

(declare-fun lt!427983 () (_ BitVec 64))

(assert (=> b!294608 (= e!210568 (bvsle lt!427985 (bvmul lt!427983 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294608 (or (= lt!427983 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!427983 #b0000000000000000000000000000000000000000000000000000000000001000) lt!427983)))))

(assert (=> b!294608 (= lt!427983 ((_ sign_extend 32) (size!7639 (buf!7702 (_2!12908 lt!427456)))))))

(assert (= (and d!99382 res!243262) b!294607))

(assert (= (and b!294607 res!243261) b!294608))

(declare-fun m!431027 () Bool)

(assert (=> d!99382 m!431027))

(declare-fun m!431029 () Bool)

(assert (=> d!99382 m!431029))

(assert (=> b!294368 d!99382))

(declare-fun d!99384 () Bool)

(assert (=> d!99384 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7639 (buf!7702 (_2!12909 lt!427455)))) ((_ sign_extend 32) (currentByte!14193 (_2!12909 lt!427455))) ((_ sign_extend 32) (currentBit!14188 (_2!12909 lt!427455))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7639 (buf!7702 (_2!12909 lt!427455)))) ((_ sign_extend 32) (currentByte!14193 (_2!12909 lt!427455))) ((_ sign_extend 32) (currentBit!14188 (_2!12909 lt!427455)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25410 () Bool)

(assert (= bs!25410 d!99384))

(declare-fun m!431031 () Bool)

(assert (=> bs!25410 m!431031))

(assert (=> b!294368 d!99384))

(push 1)

(assert (not d!99338))

(assert (not b!294512))

(assert (not b!294469))

(assert (not d!99354))

(assert (not d!99368))

(assert (not b!294606))

(assert (not d!99384))

(assert (not d!99378))

(assert (not b!294522))

(assert (not bm!5015))

(assert (not d!99348))

(assert (not d!99366))

(assert (not b!294554))

(assert (not b!294467))

(assert (not bm!5012))

(assert (not b!294520))

(assert (not b!294594))

(assert (not b!294592))

(assert (not d!99382))

(assert (not b!294524))

(assert (not b!294589))

(assert (not b!294509))

(assert (not bm!5003))

(assert (not b!294471))

(assert (not d!99340))

(assert (not bm!5025))

(assert (not b!294596))

(assert (not b!294514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


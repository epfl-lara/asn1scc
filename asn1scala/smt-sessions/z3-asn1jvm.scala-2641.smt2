; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65124 () Bool)

(assert start!65124)

(declare-fun b!292239 () Bool)

(declare-fun e!208414 () Bool)

(declare-datatypes ((array!17368 0))(
  ( (array!17369 (arr!8546 (Array (_ BitVec 32) (_ BitVec 8))) (size!7520 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13050 0))(
  ( (BitStream!13051 (buf!7586 array!17368) (currentByte!14035 (_ BitVec 32)) (currentBit!14030 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13050)

(declare-fun array_inv!7132 (array!17368) Bool)

(assert (=> b!292239 (= e!208414 (array_inv!7132 (buf!7586 thiss!1728)))))

(declare-fun b!292236 () Bool)

(declare-fun res!241391 () Bool)

(declare-fun e!208413 () Bool)

(assert (=> b!292236 (=> (not res!241391) (not e!208413))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292236 (= res!241391 (validate_offset_bits!1 ((_ sign_extend 32) (size!7520 (buf!7586 thiss!1728))) ((_ sign_extend 32) (currentByte!14035 thiss!1728)) ((_ sign_extend 32) (currentBit!14030 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292237 () Bool)

(declare-fun res!241390 () Bool)

(assert (=> b!292237 (=> (not res!241390) (not e!208413))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292237 (= res!241390 (bvsge from!505 to!474))))

(declare-fun res!241389 () Bool)

(assert (=> start!65124 (=> (not res!241389) (not e!208413))))

(declare-fun arr!273 () array!17368)

(assert (=> start!65124 (= res!241389 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7520 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65124 e!208413))

(declare-fun inv!12 (BitStream!13050) Bool)

(assert (=> start!65124 (and (inv!12 thiss!1728) e!208414)))

(assert (=> start!65124 true))

(assert (=> start!65124 (array_inv!7132 arr!273)))

(declare-fun b!292238 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292238 (= e!208413 (not (invariant!0 (currentBit!14030 thiss!1728) (currentByte!14035 thiss!1728) (size!7520 (buf!7586 thiss!1728)))))))

(declare-fun arrayBitRangesEq!0 (array!17368 array!17368 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292238 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424580 () (_ BitVec 64))

(declare-datatypes ((Unit!20329 0))(
  ( (Unit!20330) )
))
(declare-fun lt!424579 () Unit!20329)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17368 array!17368 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20329)

(assert (=> b!292238 (= lt!424579 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424580 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292238 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424580)))

(assert (=> b!292238 (= lt!424580 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7520 arr!273))))))

(declare-fun lt!424581 () Unit!20329)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17368) Unit!20329)

(assert (=> b!292238 (= lt!424581 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65124 res!241389) b!292236))

(assert (= (and b!292236 res!241391) b!292237))

(assert (= (and b!292237 res!241390) b!292238))

(assert (= start!65124 b!292239))

(declare-fun m!427693 () Bool)

(assert (=> b!292239 m!427693))

(declare-fun m!427695 () Bool)

(assert (=> b!292236 m!427695))

(declare-fun m!427697 () Bool)

(assert (=> start!65124 m!427697))

(declare-fun m!427699 () Bool)

(assert (=> start!65124 m!427699))

(declare-fun m!427701 () Bool)

(assert (=> b!292238 m!427701))

(declare-fun m!427703 () Bool)

(assert (=> b!292238 m!427703))

(declare-fun m!427705 () Bool)

(assert (=> b!292238 m!427705))

(declare-fun m!427707 () Bool)

(assert (=> b!292238 m!427707))

(declare-fun m!427709 () Bool)

(assert (=> b!292238 m!427709))

(check-sat (not b!292239) (not b!292238) (not b!292236) (not start!65124))
(check-sat)
(get-model)

(declare-fun d!98882 () Bool)

(assert (=> d!98882 (= (array_inv!7132 (buf!7586 thiss!1728)) (bvsge (size!7520 (buf!7586 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!292239 d!98882))

(declare-fun d!98884 () Bool)

(assert (=> d!98884 (= (invariant!0 (currentBit!14030 thiss!1728) (currentByte!14035 thiss!1728) (size!7520 (buf!7586 thiss!1728))) (and (bvsge (currentBit!14030 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14030 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14035 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14035 thiss!1728) (size!7520 (buf!7586 thiss!1728))) (and (= (currentBit!14030 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14035 thiss!1728) (size!7520 (buf!7586 thiss!1728)))))))))

(assert (=> b!292238 d!98884))

(declare-fun d!98886 () Bool)

(declare-fun e!208431 () Bool)

(assert (=> d!98886 e!208431))

(declare-fun res!241403 () Bool)

(assert (=> d!98886 (=> (not res!241403) (not e!208431))))

(declare-fun lt!424599 () (_ BitVec 64))

(assert (=> d!98886 (= res!241403 (or (= lt!424599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424599))))))

(assert (=> d!98886 (= lt!424599 ((_ sign_extend 32) (size!7520 arr!273)))))

(declare-fun lt!424598 () Unit!20329)

(declare-fun choose!59 (array!17368) Unit!20329)

(assert (=> d!98886 (= lt!424598 (choose!59 arr!273))))

(assert (=> d!98886 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!424598)))

(declare-fun b!292254 () Bool)

(assert (=> b!292254 (= e!208431 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7520 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98886 res!241403) b!292254))

(declare-fun m!427731 () Bool)

(assert (=> d!98886 m!427731))

(declare-fun m!427733 () Bool)

(assert (=> b!292254 m!427733))

(assert (=> b!292238 d!98886))

(declare-fun d!98894 () Bool)

(declare-fun res!241450 () Bool)

(declare-fun e!208486 () Bool)

(assert (=> d!98894 (=> res!241450 e!208486)))

(assert (=> d!98894 (= res!241450 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98894 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208486)))

(declare-fun b!292314 () Bool)

(declare-fun e!208488 () Bool)

(declare-fun e!208483 () Bool)

(assert (=> b!292314 (= e!208488 e!208483)))

(declare-fun c!13365 () Bool)

(declare-datatypes ((tuple4!860 0))(
  ( (tuple4!861 (_1!12773 (_ BitVec 32)) (_2!12773 (_ BitVec 32)) (_3!1300 (_ BitVec 32)) (_4!430 (_ BitVec 32))) )
))
(declare-fun lt!424631 () tuple4!860)

(assert (=> b!292314 (= c!13365 (= (_3!1300 lt!424631) (_4!430 lt!424631)))))

(declare-fun b!292315 () Bool)

(declare-fun e!208484 () Bool)

(assert (=> b!292315 (= e!208483 e!208484)))

(declare-fun res!241447 () Bool)

(declare-fun lt!424630 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292315 (= res!241447 (byteRangesEq!0 (select (arr!8546 arr!273) (_3!1300 lt!424631)) (select (arr!8546 arr!273) (_3!1300 lt!424631)) lt!424630 #b00000000000000000000000000001000))))

(assert (=> b!292315 (=> (not res!241447) (not e!208484))))

(declare-fun b!292316 () Bool)

(assert (=> b!292316 (= e!208486 e!208488)))

(declare-fun res!241449 () Bool)

(assert (=> b!292316 (=> (not res!241449) (not e!208488))))

(declare-fun e!208487 () Bool)

(assert (=> b!292316 (= res!241449 e!208487)))

(declare-fun res!241451 () Bool)

(assert (=> b!292316 (=> res!241451 e!208487)))

(assert (=> b!292316 (= res!241451 (bvsge (_1!12773 lt!424631) (_2!12773 lt!424631)))))

(declare-fun lt!424632 () (_ BitVec 32))

(assert (=> b!292316 (= lt!424632 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292316 (= lt!424630 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!860)

(assert (=> b!292316 (= lt!424631 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun bm!4928 () Bool)

(declare-fun call!4931 () Bool)

(assert (=> bm!4928 (= call!4931 (byteRangesEq!0 (ite c!13365 (select (arr!8546 arr!273) (_3!1300 lt!424631)) (select (arr!8546 arr!273) (_4!430 lt!424631))) (ite c!13365 (select (arr!8546 arr!273) (_3!1300 lt!424631)) (select (arr!8546 arr!273) (_4!430 lt!424631))) (ite c!13365 lt!424630 #b00000000000000000000000000000000) lt!424632))))

(declare-fun b!292317 () Bool)

(declare-fun e!208485 () Bool)

(assert (=> b!292317 (= e!208485 call!4931)))

(declare-fun b!292318 () Bool)

(declare-fun res!241448 () Bool)

(assert (=> b!292318 (= res!241448 (= lt!424632 #b00000000000000000000000000000000))))

(assert (=> b!292318 (=> res!241448 e!208485)))

(assert (=> b!292318 (= e!208484 e!208485)))

(declare-fun b!292319 () Bool)

(assert (=> b!292319 (= e!208483 call!4931)))

(declare-fun b!292320 () Bool)

(declare-fun arrayRangesEq!1488 (array!17368 array!17368 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292320 (= e!208487 (arrayRangesEq!1488 arr!273 arr!273 (_1!12773 lt!424631) (_2!12773 lt!424631)))))

(assert (= (and d!98894 (not res!241450)) b!292316))

(assert (= (and b!292316 (not res!241451)) b!292320))

(assert (= (and b!292316 res!241449) b!292314))

(assert (= (and b!292314 c!13365) b!292319))

(assert (= (and b!292314 (not c!13365)) b!292315))

(assert (= (and b!292315 res!241447) b!292318))

(assert (= (and b!292318 (not res!241448)) b!292317))

(assert (= (or b!292319 b!292317) bm!4928))

(declare-fun m!427763 () Bool)

(assert (=> b!292315 m!427763))

(assert (=> b!292315 m!427763))

(assert (=> b!292315 m!427763))

(assert (=> b!292315 m!427763))

(declare-fun m!427765 () Bool)

(assert (=> b!292315 m!427765))

(declare-fun m!427767 () Bool)

(assert (=> b!292316 m!427767))

(declare-fun m!427769 () Bool)

(assert (=> bm!4928 m!427769))

(assert (=> bm!4928 m!427763))

(assert (=> bm!4928 m!427769))

(assert (=> bm!4928 m!427763))

(declare-fun m!427773 () Bool)

(assert (=> bm!4928 m!427773))

(declare-fun m!427775 () Bool)

(assert (=> b!292320 m!427775))

(assert (=> b!292238 d!98894))

(declare-fun d!98912 () Bool)

(assert (=> d!98912 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424638 () Unit!20329)

(declare-fun choose!4 (array!17368 array!17368 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20329)

(assert (=> d!98912 (= lt!424638 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424580 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98912 (bvsle (size!7520 arr!273) (size!7520 arr!273))))

(assert (=> d!98912 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424580 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!424638)))

(declare-fun bs!25219 () Bool)

(assert (= bs!25219 d!98912))

(assert (=> bs!25219 m!427709))

(declare-fun m!427789 () Bool)

(assert (=> bs!25219 m!427789))

(assert (=> b!292238 d!98912))

(declare-fun d!98922 () Bool)

(declare-fun res!241460 () Bool)

(declare-fun e!208498 () Bool)

(assert (=> d!98922 (=> res!241460 e!208498)))

(assert (=> d!98922 (= res!241460 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!424580))))

(assert (=> d!98922 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424580) e!208498)))

(declare-fun b!292328 () Bool)

(declare-fun e!208500 () Bool)

(declare-fun e!208495 () Bool)

(assert (=> b!292328 (= e!208500 e!208495)))

(declare-fun c!13367 () Bool)

(declare-fun lt!424640 () tuple4!860)

(assert (=> b!292328 (= c!13367 (= (_3!1300 lt!424640) (_4!430 lt!424640)))))

(declare-fun b!292329 () Bool)

(declare-fun e!208496 () Bool)

(assert (=> b!292329 (= e!208495 e!208496)))

(declare-fun lt!424639 () (_ BitVec 32))

(declare-fun res!241457 () Bool)

(assert (=> b!292329 (= res!241457 (byteRangesEq!0 (select (arr!8546 arr!273) (_3!1300 lt!424640)) (select (arr!8546 arr!273) (_3!1300 lt!424640)) lt!424639 #b00000000000000000000000000001000))))

(assert (=> b!292329 (=> (not res!241457) (not e!208496))))

(declare-fun b!292330 () Bool)

(assert (=> b!292330 (= e!208498 e!208500)))

(declare-fun res!241459 () Bool)

(assert (=> b!292330 (=> (not res!241459) (not e!208500))))

(declare-fun e!208499 () Bool)

(assert (=> b!292330 (= res!241459 e!208499)))

(declare-fun res!241461 () Bool)

(assert (=> b!292330 (=> res!241461 e!208499)))

(assert (=> b!292330 (= res!241461 (bvsge (_1!12773 lt!424640) (_2!12773 lt!424640)))))

(declare-fun lt!424641 () (_ BitVec 32))

(assert (=> b!292330 (= lt!424641 ((_ extract 31 0) (bvsrem lt!424580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292330 (= lt!424639 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292330 (= lt!424640 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424580))))

(declare-fun bm!4930 () Bool)

(declare-fun call!4933 () Bool)

(assert (=> bm!4930 (= call!4933 (byteRangesEq!0 (ite c!13367 (select (arr!8546 arr!273) (_3!1300 lt!424640)) (select (arr!8546 arr!273) (_4!430 lt!424640))) (ite c!13367 (select (arr!8546 arr!273) (_3!1300 lt!424640)) (select (arr!8546 arr!273) (_4!430 lt!424640))) (ite c!13367 lt!424639 #b00000000000000000000000000000000) lt!424641))))

(declare-fun b!292331 () Bool)

(declare-fun e!208497 () Bool)

(assert (=> b!292331 (= e!208497 call!4933)))

(declare-fun b!292332 () Bool)

(declare-fun res!241458 () Bool)

(assert (=> b!292332 (= res!241458 (= lt!424641 #b00000000000000000000000000000000))))

(assert (=> b!292332 (=> res!241458 e!208497)))

(assert (=> b!292332 (= e!208496 e!208497)))

(declare-fun b!292333 () Bool)

(assert (=> b!292333 (= e!208495 call!4933)))

(declare-fun b!292334 () Bool)

(assert (=> b!292334 (= e!208499 (arrayRangesEq!1488 arr!273 arr!273 (_1!12773 lt!424640) (_2!12773 lt!424640)))))

(assert (= (and d!98922 (not res!241460)) b!292330))

(assert (= (and b!292330 (not res!241461)) b!292334))

(assert (= (and b!292330 res!241459) b!292328))

(assert (= (and b!292328 c!13367) b!292333))

(assert (= (and b!292328 (not c!13367)) b!292329))

(assert (= (and b!292329 res!241457) b!292332))

(assert (= (and b!292332 (not res!241458)) b!292331))

(assert (= (or b!292333 b!292331) bm!4930))

(declare-fun m!427791 () Bool)

(assert (=> b!292329 m!427791))

(assert (=> b!292329 m!427791))

(assert (=> b!292329 m!427791))

(assert (=> b!292329 m!427791))

(declare-fun m!427793 () Bool)

(assert (=> b!292329 m!427793))

(declare-fun m!427795 () Bool)

(assert (=> b!292330 m!427795))

(declare-fun m!427797 () Bool)

(assert (=> bm!4930 m!427797))

(assert (=> bm!4930 m!427791))

(assert (=> bm!4930 m!427797))

(assert (=> bm!4930 m!427791))

(declare-fun m!427799 () Bool)

(assert (=> bm!4930 m!427799))

(declare-fun m!427801 () Bool)

(assert (=> b!292334 m!427801))

(assert (=> b!292238 d!98922))

(declare-fun d!98924 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98924 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7520 (buf!7586 thiss!1728))) ((_ sign_extend 32) (currentByte!14035 thiss!1728)) ((_ sign_extend 32) (currentBit!14030 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7520 (buf!7586 thiss!1728))) ((_ sign_extend 32) (currentByte!14035 thiss!1728)) ((_ sign_extend 32) (currentBit!14030 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25220 () Bool)

(assert (= bs!25220 d!98924))

(declare-fun m!427803 () Bool)

(assert (=> bs!25220 m!427803))

(assert (=> b!292236 d!98924))

(declare-fun d!98926 () Bool)

(assert (=> d!98926 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14030 thiss!1728) (currentByte!14035 thiss!1728) (size!7520 (buf!7586 thiss!1728))))))

(declare-fun bs!25221 () Bool)

(assert (= bs!25221 d!98926))

(assert (=> bs!25221 m!427707))

(assert (=> start!65124 d!98926))

(declare-fun d!98930 () Bool)

(assert (=> d!98930 (= (array_inv!7132 arr!273) (bvsge (size!7520 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65124 d!98930))

(check-sat (not d!98924) (not b!292334) (not b!292329) (not b!292254) (not bm!4930) (not d!98886) (not d!98912) (not b!292320) (not bm!4928) (not d!98926) (not b!292330) (not b!292315) (not b!292316))

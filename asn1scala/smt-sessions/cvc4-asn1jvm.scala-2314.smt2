; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58738 () Bool)

(assert start!58738)

(declare-fun b!269651 () Bool)

(declare-fun e!189563 () Bool)

(declare-datatypes ((array!15030 0))(
  ( (array!15031 (arr!7536 (Array (_ BitVec 32) (_ BitVec 8))) (size!6549 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11912 0))(
  ( (BitStream!11913 (buf!7017 array!15030) (currentByte!12967 (_ BitVec 32)) (currentBit!12962 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11912)

(declare-fun array_inv!6273 (array!15030) Bool)

(assert (=> b!269651 (= e!189563 (array_inv!6273 (buf!7017 w1!591)))))

(declare-fun b!269652 () Bool)

(declare-fun res!224765 () Bool)

(declare-fun e!189565 () Bool)

(assert (=> b!269652 (=> (not res!224765) (not e!189565))))

(declare-fun w3!25 () BitStream!11912)

(declare-fun w2!587 () BitStream!11912)

(assert (=> b!269652 (= res!224765 (and (bvsle #b00000000000000000000000000000000 (currentByte!12967 w1!591)) (bvsle (currentByte!12967 w1!591) (currentByte!12967 w2!587)) (bvsle (size!6549 (buf!7017 w1!591)) (size!6549 (buf!7017 w2!587))) (bvsle (size!6549 (buf!7017 w2!587)) (size!6549 (buf!7017 w3!25))) (bvsle (currentByte!12967 w1!591) (size!6549 (buf!7017 w1!591))) (bvsle (currentByte!12967 w2!587) (size!6549 (buf!7017 w2!587)))))))

(declare-fun res!224766 () Bool)

(assert (=> start!58738 (=> (not res!224766) (not e!189565))))

(declare-fun isPrefixOf!0 (BitStream!11912 BitStream!11912) Bool)

(assert (=> start!58738 (= res!224766 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58738 e!189565))

(declare-fun inv!12 (BitStream!11912) Bool)

(assert (=> start!58738 (and (inv!12 w1!591) e!189563)))

(declare-fun e!189561 () Bool)

(assert (=> start!58738 (and (inv!12 w2!587) e!189561)))

(declare-fun e!189562 () Bool)

(assert (=> start!58738 (and (inv!12 w3!25) e!189562)))

(declare-fun b!269653 () Bool)

(assert (=> b!269653 (= e!189561 (array_inv!6273 (buf!7017 w2!587)))))

(declare-fun b!269654 () Bool)

(declare-fun res!224764 () Bool)

(assert (=> b!269654 (=> (not res!224764) (not e!189565))))

(assert (=> b!269654 (= res!224764 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!269655 () Bool)

(declare-fun res!224767 () Bool)

(assert (=> b!269655 (=> (not res!224767) (not e!189565))))

(declare-fun arrayRangesEq!1081 (array!15030 array!15030 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269655 (= res!224767 (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) #b00000000000000000000000000000000 (currentByte!12967 w1!591)))))

(declare-fun b!269656 () Bool)

(assert (=> b!269656 (= e!189565 (not (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) #b00000000000000000000000000000000 (currentByte!12967 w2!587))))))

(declare-fun b!269657 () Bool)

(assert (=> b!269657 (= e!189562 (array_inv!6273 (buf!7017 w3!25)))))

(assert (= (and start!58738 res!224766) b!269654))

(assert (= (and b!269654 res!224764) b!269652))

(assert (= (and b!269652 res!224765) b!269655))

(assert (= (and b!269655 res!224767) b!269656))

(assert (= start!58738 b!269651))

(assert (= start!58738 b!269653))

(assert (= start!58738 b!269657))

(declare-fun m!401293 () Bool)

(assert (=> b!269653 m!401293))

(declare-fun m!401295 () Bool)

(assert (=> b!269654 m!401295))

(declare-fun m!401297 () Bool)

(assert (=> b!269651 m!401297))

(declare-fun m!401299 () Bool)

(assert (=> start!58738 m!401299))

(declare-fun m!401301 () Bool)

(assert (=> start!58738 m!401301))

(declare-fun m!401303 () Bool)

(assert (=> start!58738 m!401303))

(declare-fun m!401305 () Bool)

(assert (=> start!58738 m!401305))

(declare-fun m!401307 () Bool)

(assert (=> b!269657 m!401307))

(declare-fun m!401309 () Bool)

(assert (=> b!269656 m!401309))

(declare-fun m!401311 () Bool)

(assert (=> b!269655 m!401311))

(push 1)

(assert (not b!269651))

(assert (not b!269654))

(assert (not b!269656))

(assert (not start!58738))

(assert (not b!269657))

(assert (not b!269655))

(assert (not b!269653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91354 () Bool)

(assert (=> d!91354 (= (array_inv!6273 (buf!7017 w2!587)) (bvsge (size!6549 (buf!7017 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269653 d!91354))

(declare-fun d!91356 () Bool)

(declare-fun res!224798 () Bool)

(declare-fun e!189591 () Bool)

(assert (=> d!91356 (=> (not res!224798) (not e!189591))))

(assert (=> d!91356 (= res!224798 (= (size!6549 (buf!7017 w2!587)) (size!6549 (buf!7017 w3!25))))))

(assert (=> d!91356 (= (isPrefixOf!0 w2!587 w3!25) e!189591)))

(declare-fun b!269688 () Bool)

(declare-fun res!224800 () Bool)

(assert (=> b!269688 (=> (not res!224800) (not e!189591))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269688 (= res!224800 (bvsle (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587)) (bitIndex!0 (size!6549 (buf!7017 w3!25)) (currentByte!12967 w3!25) (currentBit!12962 w3!25))))))

(declare-fun b!269689 () Bool)

(declare-fun e!189590 () Bool)

(assert (=> b!269689 (= e!189591 e!189590)))

(declare-fun res!224799 () Bool)

(assert (=> b!269689 (=> res!224799 e!189590)))

(assert (=> b!269689 (= res!224799 (= (size!6549 (buf!7017 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269690 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15030 array!15030 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269690 (= e!189590 (arrayBitRangesEq!0 (buf!7017 w2!587) (buf!7017 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587))))))

(assert (= (and d!91356 res!224798) b!269688))

(assert (= (and b!269688 res!224800) b!269689))

(assert (= (and b!269689 (not res!224799)) b!269690))

(declare-fun m!401337 () Bool)

(assert (=> b!269688 m!401337))

(declare-fun m!401339 () Bool)

(assert (=> b!269688 m!401339))

(assert (=> b!269690 m!401337))

(assert (=> b!269690 m!401337))

(declare-fun m!401343 () Bool)

(assert (=> b!269690 m!401343))

(assert (=> b!269654 d!91356))

(declare-fun d!91370 () Bool)

(declare-fun res!224813 () Bool)

(declare-fun e!189602 () Bool)

(assert (=> d!91370 (=> res!224813 e!189602)))

(assert (=> d!91370 (= res!224813 (= #b00000000000000000000000000000000 (currentByte!12967 w1!591)))))

(assert (=> d!91370 (= (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) #b00000000000000000000000000000000 (currentByte!12967 w1!591)) e!189602)))

(declare-fun b!269703 () Bool)

(declare-fun e!189603 () Bool)

(assert (=> b!269703 (= e!189602 e!189603)))

(declare-fun res!224814 () Bool)

(assert (=> b!269703 (=> (not res!224814) (not e!189603))))

(assert (=> b!269703 (= res!224814 (= (select (arr!7536 (buf!7017 w1!591)) #b00000000000000000000000000000000) (select (arr!7536 (buf!7017 w2!587)) #b00000000000000000000000000000000)))))

(declare-fun b!269704 () Bool)

(assert (=> b!269704 (= e!189603 (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12967 w1!591)))))

(assert (= (and d!91370 (not res!224813)) b!269703))

(assert (= (and b!269703 res!224814) b!269704))

(declare-fun m!401361 () Bool)

(assert (=> b!269703 m!401361))

(declare-fun m!401363 () Bool)

(assert (=> b!269703 m!401363))

(declare-fun m!401365 () Bool)

(assert (=> b!269704 m!401365))

(assert (=> b!269655 d!91370))

(declare-fun d!91390 () Bool)

(declare-fun res!224815 () Bool)

(declare-fun e!189604 () Bool)

(assert (=> d!91390 (=> res!224815 e!189604)))

(assert (=> d!91390 (= res!224815 (= #b00000000000000000000000000000000 (currentByte!12967 w2!587)))))

(assert (=> d!91390 (= (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) #b00000000000000000000000000000000 (currentByte!12967 w2!587)) e!189604)))

(declare-fun b!269705 () Bool)

(declare-fun e!189605 () Bool)

(assert (=> b!269705 (= e!189604 e!189605)))

(declare-fun res!224816 () Bool)

(assert (=> b!269705 (=> (not res!224816) (not e!189605))))

(assert (=> b!269705 (= res!224816 (= (select (arr!7536 (buf!7017 w2!587)) #b00000000000000000000000000000000) (select (arr!7536 (buf!7017 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!269706 () Bool)

(assert (=> b!269706 (= e!189605 (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12967 w2!587)))))

(assert (= (and d!91390 (not res!224815)) b!269705))

(assert (= (and b!269705 res!224816) b!269706))

(assert (=> b!269705 m!401363))

(declare-fun m!401367 () Bool)

(assert (=> b!269705 m!401367))

(declare-fun m!401369 () Bool)

(assert (=> b!269706 m!401369))

(assert (=> b!269656 d!91390))

(declare-fun d!91392 () Bool)

(assert (=> d!91392 (= (array_inv!6273 (buf!7017 w1!591)) (bvsge (size!6549 (buf!7017 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269651 d!91392))

(declare-fun d!91394 () Bool)

(declare-fun res!224821 () Bool)

(declare-fun e!189611 () Bool)

(assert (=> d!91394 (=> (not res!224821) (not e!189611))))

(assert (=> d!91394 (= res!224821 (= (size!6549 (buf!7017 w1!591)) (size!6549 (buf!7017 w2!587))))))

(assert (=> d!91394 (= (isPrefixOf!0 w1!591 w2!587) e!189611)))

(declare-fun b!269711 () Bool)

(declare-fun res!224823 () Bool)

(assert (=> b!269711 (=> (not res!224823) (not e!189611))))

(assert (=> b!269711 (= res!224823 (bvsle (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591)) (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587))))))

(declare-fun b!269712 () Bool)

(declare-fun e!189610 () Bool)

(assert (=> b!269712 (= e!189611 e!189610)))

(declare-fun res!224822 () Bool)

(assert (=> b!269712 (=> res!224822 e!189610)))

(assert (=> b!269712 (= res!224822 (= (size!6549 (buf!7017 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269713 () Bool)

(assert (=> b!269713 (= e!189610 (arrayBitRangesEq!0 (buf!7017 w1!591) (buf!7017 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591))))))

(assert (= (and d!91394 res!224821) b!269711))

(assert (= (and b!269711 res!224823) b!269712))

(assert (= (and b!269712 (not res!224822)) b!269713))

(declare-fun m!401371 () Bool)

(assert (=> b!269711 m!401371))

(assert (=> b!269711 m!401337))

(assert (=> b!269713 m!401371))

(assert (=> b!269713 m!401371))

(declare-fun m!401373 () Bool)

(assert (=> b!269713 m!401373))

(assert (=> start!58738 d!91394))

(declare-fun d!91396 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91396 (= (inv!12 w1!591) (invariant!0 (currentBit!12962 w1!591) (currentByte!12967 w1!591) (size!6549 (buf!7017 w1!591))))))

(declare-fun bs!23132 () Bool)

(assert (= bs!23132 d!91396))

(declare-fun m!401381 () Bool)

(assert (=> bs!23132 m!401381))

(assert (=> start!58738 d!91396))

(declare-fun d!91400 () Bool)

(assert (=> d!91400 (= (inv!12 w2!587) (invariant!0 (currentBit!12962 w2!587) (currentByte!12967 w2!587) (size!6549 (buf!7017 w2!587))))))

(declare-fun bs!23133 () Bool)

(assert (= bs!23133 d!91400))

(declare-fun m!401387 () Bool)

(assert (=> bs!23133 m!401387))

(assert (=> start!58738 d!91400))

(declare-fun d!91402 () Bool)

(assert (=> d!91402 (= (inv!12 w3!25) (invariant!0 (currentBit!12962 w3!25) (currentByte!12967 w3!25) (size!6549 (buf!7017 w3!25))))))

(declare-fun bs!23134 () Bool)

(assert (= bs!23134 d!91402))

(declare-fun m!401389 () Bool)

(assert (=> bs!23134 m!401389))

(assert (=> start!58738 d!91402))

(declare-fun d!91404 () Bool)

(assert (=> d!91404 (= (array_inv!6273 (buf!7017 w3!25)) (bvsge (size!6549 (buf!7017 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269657 d!91404))

(push 1)

(assert (not d!91402))

(assert (not b!269704))

(assert (not b!269706))

(assert (not d!91396))

(assert (not b!269713))

(assert (not d!91400))

(assert (not b!269690))

(assert (not b!269688))

(assert (not b!269711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91420 () Bool)

(assert (=> d!91420 (= (invariant!0 (currentBit!12962 w2!587) (currentByte!12967 w2!587) (size!6549 (buf!7017 w2!587))) (and (bvsge (currentBit!12962 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12962 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12967 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12967 w2!587) (size!6549 (buf!7017 w2!587))) (and (= (currentBit!12962 w2!587) #b00000000000000000000000000000000) (= (currentByte!12967 w2!587) (size!6549 (buf!7017 w2!587)))))))))

(assert (=> d!91400 d!91420))

(declare-fun b!269786 () Bool)

(declare-fun e!189670 () Bool)

(declare-fun call!4302 () Bool)

(assert (=> b!269786 (= e!189670 call!4302)))

(declare-datatypes ((tuple4!444 0))(
  ( (tuple4!445 (_1!12205 (_ BitVec 32)) (_2!12205 (_ BitVec 32)) (_3!1002 (_ BitVec 32)) (_4!222 (_ BitVec 32))) )
))
(declare-fun lt!409190 () tuple4!444)

(declare-fun b!269787 () Bool)

(declare-fun e!189668 () Bool)

(assert (=> b!269787 (= e!189668 (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) (_1!12205 lt!409190) (_2!12205 lt!409190)))))

(declare-fun b!269788 () Bool)

(declare-fun e!189671 () Bool)

(declare-fun e!189673 () Bool)

(assert (=> b!269788 (= e!189671 e!189673)))

(declare-fun lt!409189 () (_ BitVec 32))

(declare-fun res!224887 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269788 (= res!224887 (byteRangesEq!0 (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409190)) (select (arr!7536 (buf!7017 w3!25)) (_3!1002 lt!409190)) lt!409189 #b00000000000000000000000000001000))))

(assert (=> b!269788 (=> (not res!224887) (not e!189673))))

(declare-fun d!91432 () Bool)

(declare-fun res!224888 () Bool)

(declare-fun e!189669 () Bool)

(assert (=> d!91432 (=> res!224888 e!189669)))

(assert (=> d!91432 (= res!224888 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587))))))

(assert (=> d!91432 (= (arrayBitRangesEq!0 (buf!7017 w2!587) (buf!7017 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587))) e!189669)))

(declare-fun b!269789 () Bool)

(declare-fun res!224884 () Bool)

(declare-fun lt!409188 () (_ BitVec 32))

(assert (=> b!269789 (= res!224884 (= lt!409188 #b00000000000000000000000000000000))))

(assert (=> b!269789 (=> res!224884 e!189670)))

(assert (=> b!269789 (= e!189673 e!189670)))

(declare-fun b!269790 () Bool)

(assert (=> b!269790 (= e!189671 call!4302)))

(declare-fun c!12451 () Bool)

(declare-fun bm!4299 () Bool)

(assert (=> bm!4299 (= call!4302 (byteRangesEq!0 (ite c!12451 (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409190)) (select (arr!7536 (buf!7017 w2!587)) (_4!222 lt!409190))) (ite c!12451 (select (arr!7536 (buf!7017 w3!25)) (_3!1002 lt!409190)) (select (arr!7536 (buf!7017 w3!25)) (_4!222 lt!409190))) (ite c!12451 lt!409189 #b00000000000000000000000000000000) lt!409188))))

(declare-fun b!269791 () Bool)

(declare-fun e!189672 () Bool)

(assert (=> b!269791 (= e!189669 e!189672)))

(declare-fun res!224885 () Bool)

(assert (=> b!269791 (=> (not res!224885) (not e!189672))))

(assert (=> b!269791 (= res!224885 e!189668)))

(declare-fun res!224886 () Bool)

(assert (=> b!269791 (=> res!224886 e!189668)))

(assert (=> b!269791 (= res!224886 (bvsge (_1!12205 lt!409190) (_2!12205 lt!409190)))))

(assert (=> b!269791 (= lt!409188 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269791 (= lt!409189 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!444)

(assert (=> b!269791 (= lt!409190 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587))))))

(declare-fun b!269792 () Bool)

(assert (=> b!269792 (= e!189672 e!189671)))

(assert (=> b!269792 (= c!12451 (= (_3!1002 lt!409190) (_4!222 lt!409190)))))

(assert (= (and d!91432 (not res!224888)) b!269791))

(assert (= (and b!269791 (not res!224886)) b!269787))

(assert (= (and b!269791 res!224885) b!269792))

(assert (= (and b!269792 c!12451) b!269790))

(assert (= (and b!269792 (not c!12451)) b!269788))

(assert (= (and b!269788 res!224887) b!269789))

(assert (= (and b!269789 (not res!224884)) b!269786))

(assert (= (or b!269790 b!269786) bm!4299))

(declare-fun m!401419 () Bool)

(assert (=> b!269787 m!401419))

(declare-fun m!401421 () Bool)

(assert (=> b!269788 m!401421))

(declare-fun m!401423 () Bool)

(assert (=> b!269788 m!401423))

(assert (=> b!269788 m!401421))

(assert (=> b!269788 m!401423))

(declare-fun m!401425 () Bool)

(assert (=> b!269788 m!401425))

(assert (=> bm!4299 m!401423))

(declare-fun m!401429 () Bool)

(assert (=> bm!4299 m!401429))

(assert (=> bm!4299 m!401421))

(declare-fun m!401437 () Bool)

(assert (=> bm!4299 m!401437))

(declare-fun m!401441 () Bool)

(assert (=> bm!4299 m!401441))

(assert (=> b!269791 m!401337))

(declare-fun m!401447 () Bool)

(assert (=> b!269791 m!401447))

(assert (=> b!269690 d!91432))

(declare-fun d!91440 () Bool)

(declare-fun e!189702 () Bool)

(assert (=> d!91440 e!189702))

(declare-fun res!224915 () Bool)

(assert (=> d!91440 (=> (not res!224915) (not e!189702))))

(declare-fun lt!409217 () (_ BitVec 64))

(declare-fun lt!409220 () (_ BitVec 64))

(declare-fun lt!409218 () (_ BitVec 64))

(assert (=> d!91440 (= res!224915 (= lt!409218 (bvsub lt!409220 lt!409217)))))

(assert (=> d!91440 (or (= (bvand lt!409220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409217 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409220 lt!409217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91440 (= lt!409217 (remainingBits!0 ((_ sign_extend 32) (size!6549 (buf!7017 w2!587))) ((_ sign_extend 32) (currentByte!12967 w2!587)) ((_ sign_extend 32) (currentBit!12962 w2!587))))))

(declare-fun lt!409216 () (_ BitVec 64))

(declare-fun lt!409219 () (_ BitVec 64))

(assert (=> d!91440 (= lt!409220 (bvmul lt!409216 lt!409219))))

(assert (=> d!91440 (or (= lt!409216 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409219 (bvsdiv (bvmul lt!409216 lt!409219) lt!409216)))))

(assert (=> d!91440 (= lt!409219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91440 (= lt!409216 ((_ sign_extend 32) (size!6549 (buf!7017 w2!587))))))

(assert (=> d!91440 (= lt!409218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12967 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12962 w2!587))))))

(assert (=> d!91440 (invariant!0 (currentBit!12962 w2!587) (currentByte!12967 w2!587) (size!6549 (buf!7017 w2!587)))))

(assert (=> d!91440 (= (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587)) lt!409218)))

(declare-fun b!269827 () Bool)

(declare-fun res!224916 () Bool)

(assert (=> b!269827 (=> (not res!224916) (not e!189702))))

(assert (=> b!269827 (= res!224916 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409218))))

(declare-fun b!269828 () Bool)

(declare-fun lt!409215 () (_ BitVec 64))

(assert (=> b!269828 (= e!189702 (bvsle lt!409218 (bvmul lt!409215 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269828 (or (= lt!409215 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409215 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409215)))))

(assert (=> b!269828 (= lt!409215 ((_ sign_extend 32) (size!6549 (buf!7017 w2!587))))))

(assert (= (and d!91440 res!224915) b!269827))

(assert (= (and b!269827 res!224916) b!269828))

(declare-fun m!401503 () Bool)

(assert (=> d!91440 m!401503))

(assert (=> d!91440 m!401387))

(assert (=> b!269690 d!91440))

(declare-fun d!91452 () Bool)

(declare-fun res!224917 () Bool)

(declare-fun e!189703 () Bool)

(assert (=> d!91452 (=> res!224917 e!189703)))

(assert (=> d!91452 (= res!224917 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12967 w2!587)))))

(assert (=> d!91452 (= (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12967 w2!587)) e!189703)))

(declare-fun b!269829 () Bool)

(declare-fun e!189704 () Bool)

(assert (=> b!269829 (= e!189703 e!189704)))

(declare-fun res!224918 () Bool)

(assert (=> b!269829 (=> (not res!224918) (not e!189704))))

(assert (=> b!269829 (= res!224918 (= (select (arr!7536 (buf!7017 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7536 (buf!7017 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269830 () Bool)

(assert (=> b!269830 (= e!189704 (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12967 w2!587)))))

(assert (= (and d!91452 (not res!224917)) b!269829))

(assert (= (and b!269829 res!224918) b!269830))

(declare-fun m!401505 () Bool)

(assert (=> b!269829 m!401505))

(declare-fun m!401507 () Bool)

(assert (=> b!269829 m!401507))

(declare-fun m!401509 () Bool)

(assert (=> b!269830 m!401509))

(assert (=> b!269706 d!91452))

(declare-fun d!91454 () Bool)

(declare-fun e!189705 () Bool)

(assert (=> d!91454 e!189705))

(declare-fun res!224919 () Bool)

(assert (=> d!91454 (=> (not res!224919) (not e!189705))))

(declare-fun lt!409223 () (_ BitVec 64))

(declare-fun lt!409226 () (_ BitVec 64))

(declare-fun lt!409224 () (_ BitVec 64))

(assert (=> d!91454 (= res!224919 (= lt!409224 (bvsub lt!409226 lt!409223)))))

(assert (=> d!91454 (or (= (bvand lt!409226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409223 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409226 lt!409223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91454 (= lt!409223 (remainingBits!0 ((_ sign_extend 32) (size!6549 (buf!7017 w1!591))) ((_ sign_extend 32) (currentByte!12967 w1!591)) ((_ sign_extend 32) (currentBit!12962 w1!591))))))

(declare-fun lt!409222 () (_ BitVec 64))

(declare-fun lt!409225 () (_ BitVec 64))

(assert (=> d!91454 (= lt!409226 (bvmul lt!409222 lt!409225))))

(assert (=> d!91454 (or (= lt!409222 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409225 (bvsdiv (bvmul lt!409222 lt!409225) lt!409222)))))

(assert (=> d!91454 (= lt!409225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91454 (= lt!409222 ((_ sign_extend 32) (size!6549 (buf!7017 w1!591))))))

(assert (=> d!91454 (= lt!409224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12967 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12962 w1!591))))))

(assert (=> d!91454 (invariant!0 (currentBit!12962 w1!591) (currentByte!12967 w1!591) (size!6549 (buf!7017 w1!591)))))

(assert (=> d!91454 (= (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591)) lt!409224)))

(declare-fun b!269831 () Bool)

(declare-fun res!224920 () Bool)

(assert (=> b!269831 (=> (not res!224920) (not e!189705))))

(assert (=> b!269831 (= res!224920 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409224))))

(declare-fun b!269832 () Bool)

(declare-fun lt!409221 () (_ BitVec 64))

(assert (=> b!269832 (= e!189705 (bvsle lt!409224 (bvmul lt!409221 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269832 (or (= lt!409221 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409221 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409221)))))

(assert (=> b!269832 (= lt!409221 ((_ sign_extend 32) (size!6549 (buf!7017 w1!591))))))

(assert (= (and d!91454 res!224919) b!269831))

(assert (= (and b!269831 res!224920) b!269832))

(declare-fun m!401511 () Bool)

(assert (=> d!91454 m!401511))

(assert (=> d!91454 m!401381))

(assert (=> b!269711 d!91454))

(assert (=> b!269711 d!91440))

(declare-fun d!91456 () Bool)

(declare-fun res!224921 () Bool)

(declare-fun e!189706 () Bool)

(assert (=> d!91456 (=> res!224921 e!189706)))

(assert (=> d!91456 (= res!224921 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12967 w1!591)))))

(assert (=> d!91456 (= (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12967 w1!591)) e!189706)))

(declare-fun b!269833 () Bool)

(declare-fun e!189707 () Bool)

(assert (=> b!269833 (= e!189706 e!189707)))

(declare-fun res!224922 () Bool)

(assert (=> b!269833 (=> (not res!224922) (not e!189707))))

(assert (=> b!269833 (= res!224922 (= (select (arr!7536 (buf!7017 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7536 (buf!7017 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269834 () Bool)

(assert (=> b!269834 (= e!189707 (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12967 w1!591)))))

(assert (= (and d!91456 (not res!224921)) b!269833))

(assert (= (and b!269833 res!224922) b!269834))

(declare-fun m!401513 () Bool)

(assert (=> b!269833 m!401513))

(assert (=> b!269833 m!401505))

(declare-fun m!401515 () Bool)

(assert (=> b!269834 m!401515))

(assert (=> b!269704 d!91456))

(declare-fun b!269835 () Bool)

(declare-fun e!189710 () Bool)

(declare-fun call!4307 () Bool)

(assert (=> b!269835 (= e!189710 call!4307)))

(declare-fun b!269836 () Bool)

(declare-fun e!189708 () Bool)

(declare-fun lt!409229 () tuple4!444)

(assert (=> b!269836 (= e!189708 (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) (_1!12205 lt!409229) (_2!12205 lt!409229)))))

(declare-fun b!269837 () Bool)

(declare-fun e!189711 () Bool)

(declare-fun e!189713 () Bool)

(assert (=> b!269837 (= e!189711 e!189713)))

(declare-fun lt!409228 () (_ BitVec 32))

(declare-fun res!224926 () Bool)

(assert (=> b!269837 (= res!224926 (byteRangesEq!0 (select (arr!7536 (buf!7017 w1!591)) (_3!1002 lt!409229)) (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409229)) lt!409228 #b00000000000000000000000000001000))))

(assert (=> b!269837 (=> (not res!224926) (not e!189713))))

(declare-fun d!91458 () Bool)

(declare-fun res!224927 () Bool)

(declare-fun e!189709 () Bool)

(assert (=> d!91458 (=> res!224927 e!189709)))

(assert (=> d!91458 (= res!224927 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591))))))

(assert (=> d!91458 (= (arrayBitRangesEq!0 (buf!7017 w1!591) (buf!7017 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591))) e!189709)))

(declare-fun b!269838 () Bool)

(declare-fun res!224923 () Bool)

(declare-fun lt!409227 () (_ BitVec 32))

(assert (=> b!269838 (= res!224923 (= lt!409227 #b00000000000000000000000000000000))))

(assert (=> b!269838 (=> res!224923 e!189710)))

(assert (=> b!269838 (= e!189713 e!189710)))

(declare-fun b!269839 () Bool)

(assert (=> b!269839 (= e!189711 call!4307)))

(declare-fun bm!4304 () Bool)

(declare-fun c!12456 () Bool)

(assert (=> bm!4304 (= call!4307 (byteRangesEq!0 (ite c!12456 (select (arr!7536 (buf!7017 w1!591)) (_3!1002 lt!409229)) (select (arr!7536 (buf!7017 w1!591)) (_4!222 lt!409229))) (ite c!12456 (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409229)) (select (arr!7536 (buf!7017 w2!587)) (_4!222 lt!409229))) (ite c!12456 lt!409228 #b00000000000000000000000000000000) lt!409227))))

(declare-fun b!269840 () Bool)

(declare-fun e!189712 () Bool)

(assert (=> b!269840 (= e!189709 e!189712)))

(declare-fun res!224924 () Bool)

(assert (=> b!269840 (=> (not res!224924) (not e!189712))))

(assert (=> b!269840 (= res!224924 e!189708)))

(declare-fun res!224925 () Bool)

(assert (=> b!269840 (=> res!224925 e!189708)))

(assert (=> b!269840 (= res!224925 (bvsge (_1!12205 lt!409229) (_2!12205 lt!409229)))))

(assert (=> b!269840 (= lt!409227 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269840 (= lt!409228 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269840 (= lt!409229 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591))))))

(declare-fun b!269841 () Bool)

(assert (=> b!269841 (= e!189712 e!189711)))

(assert (=> b!269841 (= c!12456 (= (_3!1002 lt!409229) (_4!222 lt!409229)))))

(assert (= (and d!91458 (not res!224927)) b!269840))

(assert (= (and b!269840 (not res!224925)) b!269836))

(assert (= (and b!269840 res!224924) b!269841))

(assert (= (and b!269841 c!12456) b!269839))

(assert (= (and b!269841 (not c!12456)) b!269837))

(assert (= (and b!269837 res!224926) b!269838))

(assert (= (and b!269838 (not res!224923)) b!269835))

(assert (= (or b!269839 b!269835) bm!4304))

(declare-fun m!401517 () Bool)

(assert (=> b!269836 m!401517))

(declare-fun m!401519 () Bool)

(assert (=> b!269837 m!401519))

(declare-fun m!401521 () Bool)

(assert (=> b!269837 m!401521))

(assert (=> b!269837 m!401519))

(assert (=> b!269837 m!401521))

(declare-fun m!401523 () Bool)

(assert (=> b!269837 m!401523))

(assert (=> bm!4304 m!401521))

(declare-fun m!401525 () Bool)

(assert (=> bm!4304 m!401525))

(assert (=> bm!4304 m!401519))

(declare-fun m!401527 () Bool)

(assert (=> bm!4304 m!401527))

(declare-fun m!401529 () Bool)

(assert (=> bm!4304 m!401529))

(assert (=> b!269840 m!401371))

(declare-fun m!401531 () Bool)

(assert (=> b!269840 m!401531))

(assert (=> b!269713 d!91458))

(assert (=> b!269713 d!91454))

(declare-fun d!91460 () Bool)

(assert (=> d!91460 (= (invariant!0 (currentBit!12962 w3!25) (currentByte!12967 w3!25) (size!6549 (buf!7017 w3!25))) (and (bvsge (currentBit!12962 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12962 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12967 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12967 w3!25) (size!6549 (buf!7017 w3!25))) (and (= (currentBit!12962 w3!25) #b00000000000000000000000000000000) (= (currentByte!12967 w3!25) (size!6549 (buf!7017 w3!25)))))))))

(assert (=> d!91402 d!91460))

(assert (=> b!269688 d!91440))

(declare-fun d!91462 () Bool)

(declare-fun e!189714 () Bool)

(assert (=> d!91462 e!189714))

(declare-fun res!224928 () Bool)

(assert (=> d!91462 (=> (not res!224928) (not e!189714))))

(declare-fun lt!409232 () (_ BitVec 64))

(declare-fun lt!409235 () (_ BitVec 64))

(declare-fun lt!409233 () (_ BitVec 64))

(assert (=> d!91462 (= res!224928 (= lt!409233 (bvsub lt!409235 lt!409232)))))

(assert (=> d!91462 (or (= (bvand lt!409235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409235 lt!409232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91462 (= lt!409232 (remainingBits!0 ((_ sign_extend 32) (size!6549 (buf!7017 w3!25))) ((_ sign_extend 32) (currentByte!12967 w3!25)) ((_ sign_extend 32) (currentBit!12962 w3!25))))))

(declare-fun lt!409231 () (_ BitVec 64))

(declare-fun lt!409234 () (_ BitVec 64))

(assert (=> d!91462 (= lt!409235 (bvmul lt!409231 lt!409234))))

(assert (=> d!91462 (or (= lt!409231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409234 (bvsdiv (bvmul lt!409231 lt!409234) lt!409231)))))

(assert (=> d!91462 (= lt!409234 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91462 (= lt!409231 ((_ sign_extend 32) (size!6549 (buf!7017 w3!25))))))

(assert (=> d!91462 (= lt!409233 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12967 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12962 w3!25))))))

(assert (=> d!91462 (invariant!0 (currentBit!12962 w3!25) (currentByte!12967 w3!25) (size!6549 (buf!7017 w3!25)))))

(assert (=> d!91462 (= (bitIndex!0 (size!6549 (buf!7017 w3!25)) (currentByte!12967 w3!25) (currentBit!12962 w3!25)) lt!409233)))

(declare-fun b!269842 () Bool)

(declare-fun res!224929 () Bool)

(assert (=> b!269842 (=> (not res!224929) (not e!189714))))

(assert (=> b!269842 (= res!224929 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409233))))

(declare-fun b!269843 () Bool)

(declare-fun lt!409230 () (_ BitVec 64))

(assert (=> b!269843 (= e!189714 (bvsle lt!409233 (bvmul lt!409230 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269843 (or (= lt!409230 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409230 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409230)))))

(assert (=> b!269843 (= lt!409230 ((_ sign_extend 32) (size!6549 (buf!7017 w3!25))))))

(assert (= (and d!91462 res!224928) b!269842))

(assert (= (and b!269842 res!224929) b!269843))

(declare-fun m!401533 () Bool)

(assert (=> d!91462 m!401533))

(assert (=> d!91462 m!401389))

(assert (=> b!269688 d!91462))

(declare-fun d!91464 () Bool)

(assert (=> d!91464 (= (invariant!0 (currentBit!12962 w1!591) (currentByte!12967 w1!591) (size!6549 (buf!7017 w1!591))) (and (bvsge (currentBit!12962 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12962 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12967 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12967 w1!591) (size!6549 (buf!7017 w1!591))) (and (= (currentBit!12962 w1!591) #b00000000000000000000000000000000) (= (currentByte!12967 w1!591) (size!6549 (buf!7017 w1!591)))))))))

(assert (=> d!91396 d!91464))

(push 1)

(assert (not b!269788))

(assert (not bm!4304))

(assert (not b!269791))

(assert (not b!269836))

(assert (not b!269837))

(assert (not d!91440))

(assert (not bm!4299))

(assert (not d!91454))

(assert (not d!91462))

(assert (not b!269840))

(assert (not b!269830))

(assert (not b!269787))

(assert (not b!269834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91492 () Bool)

(declare-fun res!224938 () Bool)

(declare-fun e!189723 () Bool)

(assert (=> d!91492 (=> res!224938 e!189723)))

(assert (=> d!91492 (= res!224938 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12967 w2!587)))))

(assert (=> d!91492 (= (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12967 w2!587)) e!189723)))

(declare-fun b!269852 () Bool)

(declare-fun e!189724 () Bool)

(assert (=> b!269852 (= e!189723 e!189724)))

(declare-fun res!224939 () Bool)

(assert (=> b!269852 (=> (not res!224939) (not e!189724))))

(assert (=> b!269852 (= res!224939 (= (select (arr!7536 (buf!7017 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7536 (buf!7017 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!269853 () Bool)

(assert (=> b!269853 (= e!189724 (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12967 w2!587)))))

(assert (= (and d!91492 (not res!224938)) b!269852))

(assert (= (and b!269852 res!224939) b!269853))

(declare-fun m!401571 () Bool)

(assert (=> b!269852 m!401571))

(declare-fun m!401573 () Bool)

(assert (=> b!269852 m!401573))

(declare-fun m!401575 () Bool)

(assert (=> b!269853 m!401575))

(assert (=> b!269830 d!91492))

(declare-fun d!91494 () Bool)

(declare-fun res!224940 () Bool)

(declare-fun e!189725 () Bool)

(assert (=> d!91494 (=> res!224940 e!189725)))

(assert (=> d!91494 (= res!224940 (= (_1!12205 lt!409229) (_2!12205 lt!409229)))))

(assert (=> d!91494 (= (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) (_1!12205 lt!409229) (_2!12205 lt!409229)) e!189725)))

(declare-fun b!269854 () Bool)

(declare-fun e!189726 () Bool)

(assert (=> b!269854 (= e!189725 e!189726)))

(declare-fun res!224941 () Bool)

(assert (=> b!269854 (=> (not res!224941) (not e!189726))))

(assert (=> b!269854 (= res!224941 (= (select (arr!7536 (buf!7017 w1!591)) (_1!12205 lt!409229)) (select (arr!7536 (buf!7017 w2!587)) (_1!12205 lt!409229))))))

(declare-fun b!269855 () Bool)

(assert (=> b!269855 (= e!189726 (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) (bvadd (_1!12205 lt!409229) #b00000000000000000000000000000001) (_2!12205 lt!409229)))))

(assert (= (and d!91494 (not res!224940)) b!269854))

(assert (= (and b!269854 res!224941) b!269855))

(declare-fun m!401577 () Bool)

(assert (=> b!269854 m!401577))

(declare-fun m!401579 () Bool)

(assert (=> b!269854 m!401579))

(declare-fun m!401581 () Bool)

(assert (=> b!269855 m!401581))

(assert (=> b!269836 d!91494))

(declare-fun d!91496 () Bool)

(assert (=> d!91496 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587))) (tuple4!445 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6549 (buf!7017 w2!587)) (currentByte!12967 w2!587) (currentBit!12962 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269791 d!91496))

(declare-fun d!91498 () Bool)

(assert (=> d!91498 (= (byteRangesEq!0 (select (arr!7536 (buf!7017 w1!591)) (_3!1002 lt!409229)) (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409229)) lt!409228 #b00000000000000000000000000001000) (or (= lt!409228 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7536 (buf!7017 w1!591)) (_3!1002 lt!409229))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409228)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409229))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409228)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23139 () Bool)

(assert (= bs!23139 d!91498))

(declare-fun m!401583 () Bool)

(assert (=> bs!23139 m!401583))

(declare-fun m!401585 () Bool)

(assert (=> bs!23139 m!401585))

(assert (=> b!269837 d!91498))

(declare-fun d!91500 () Bool)

(assert (=> d!91500 (= (byteRangesEq!0 (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409190)) (select (arr!7536 (buf!7017 w3!25)) (_3!1002 lt!409190)) lt!409189 #b00000000000000000000000000001000) (or (= lt!409189 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409190))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409189)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7536 (buf!7017 w3!25)) (_3!1002 lt!409190))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409189)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23140 () Bool)

(assert (= bs!23140 d!91500))

(assert (=> bs!23140 m!401583))

(declare-fun m!401587 () Bool)

(assert (=> bs!23140 m!401587))

(assert (=> b!269788 d!91500))

(declare-fun d!91502 () Bool)

(assert (=> d!91502 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591))) (tuple4!445 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6549 (buf!7017 w1!591)) (currentByte!12967 w1!591) (currentBit!12962 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269840 d!91502))

(declare-fun d!91504 () Bool)

(assert (=> d!91504 (= (remainingBits!0 ((_ sign_extend 32) (size!6549 (buf!7017 w3!25))) ((_ sign_extend 32) (currentByte!12967 w3!25)) ((_ sign_extend 32) (currentBit!12962 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6549 (buf!7017 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12967 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12962 w3!25)))))))

(assert (=> d!91462 d!91504))

(assert (=> d!91462 d!91460))

(declare-fun d!91506 () Bool)

(declare-fun res!224942 () Bool)

(declare-fun e!189727 () Bool)

(assert (=> d!91506 (=> res!224942 e!189727)))

(assert (=> d!91506 (= res!224942 (= (_1!12205 lt!409190) (_2!12205 lt!409190)))))

(assert (=> d!91506 (= (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) (_1!12205 lt!409190) (_2!12205 lt!409190)) e!189727)))

(declare-fun b!269856 () Bool)

(declare-fun e!189728 () Bool)

(assert (=> b!269856 (= e!189727 e!189728)))

(declare-fun res!224943 () Bool)

(assert (=> b!269856 (=> (not res!224943) (not e!189728))))

(assert (=> b!269856 (= res!224943 (= (select (arr!7536 (buf!7017 w2!587)) (_1!12205 lt!409190)) (select (arr!7536 (buf!7017 w3!25)) (_1!12205 lt!409190))))))

(declare-fun b!269857 () Bool)

(assert (=> b!269857 (= e!189728 (arrayRangesEq!1081 (buf!7017 w2!587) (buf!7017 w3!25) (bvadd (_1!12205 lt!409190) #b00000000000000000000000000000001) (_2!12205 lt!409190)))))

(assert (= (and d!91506 (not res!224942)) b!269856))

(assert (= (and b!269856 res!224943) b!269857))

(declare-fun m!401589 () Bool)

(assert (=> b!269856 m!401589))

(declare-fun m!401591 () Bool)

(assert (=> b!269856 m!401591))

(declare-fun m!401593 () Bool)

(assert (=> b!269857 m!401593))

(assert (=> b!269787 d!91506))

(declare-fun d!91508 () Bool)

(assert (=> d!91508 (= (byteRangesEq!0 (ite c!12456 (select (arr!7536 (buf!7017 w1!591)) (_3!1002 lt!409229)) (select (arr!7536 (buf!7017 w1!591)) (_4!222 lt!409229))) (ite c!12456 (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409229)) (select (arr!7536 (buf!7017 w2!587)) (_4!222 lt!409229))) (ite c!12456 lt!409228 #b00000000000000000000000000000000) lt!409227) (or (= (ite c!12456 lt!409228 #b00000000000000000000000000000000) lt!409227) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12456 (select (arr!7536 (buf!7017 w1!591)) (_3!1002 lt!409229)) (select (arr!7536 (buf!7017 w1!591)) (_4!222 lt!409229)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409227))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12456 lt!409228 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12456 (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409229)) (select (arr!7536 (buf!7017 w2!587)) (_4!222 lt!409229)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409227))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12456 lt!409228 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23141 () Bool)

(assert (= bs!23141 d!91508))

(declare-fun m!401595 () Bool)

(assert (=> bs!23141 m!401595))

(declare-fun m!401597 () Bool)

(assert (=> bs!23141 m!401597))

(assert (=> bm!4304 d!91508))

(declare-fun d!91510 () Bool)

(assert (=> d!91510 (= (remainingBits!0 ((_ sign_extend 32) (size!6549 (buf!7017 w1!591))) ((_ sign_extend 32) (currentByte!12967 w1!591)) ((_ sign_extend 32) (currentBit!12962 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6549 (buf!7017 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12967 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12962 w1!591)))))))

(assert (=> d!91454 d!91510))

(assert (=> d!91454 d!91464))

(declare-fun d!91512 () Bool)

(assert (=> d!91512 (= (byteRangesEq!0 (ite c!12451 (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409190)) (select (arr!7536 (buf!7017 w2!587)) (_4!222 lt!409190))) (ite c!12451 (select (arr!7536 (buf!7017 w3!25)) (_3!1002 lt!409190)) (select (arr!7536 (buf!7017 w3!25)) (_4!222 lt!409190))) (ite c!12451 lt!409189 #b00000000000000000000000000000000) lt!409188) (or (= (ite c!12451 lt!409189 #b00000000000000000000000000000000) lt!409188) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12451 (select (arr!7536 (buf!7017 w2!587)) (_3!1002 lt!409190)) (select (arr!7536 (buf!7017 w2!587)) (_4!222 lt!409190)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409188))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12451 lt!409189 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12451 (select (arr!7536 (buf!7017 w3!25)) (_3!1002 lt!409190)) (select (arr!7536 (buf!7017 w3!25)) (_4!222 lt!409190)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409188))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12451 lt!409189 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23142 () Bool)

(assert (= bs!23142 d!91512))

(declare-fun m!401599 () Bool)

(assert (=> bs!23142 m!401599))

(declare-fun m!401601 () Bool)

(assert (=> bs!23142 m!401601))

(assert (=> bm!4299 d!91512))

(declare-fun d!91514 () Bool)

(declare-fun res!224944 () Bool)

(declare-fun e!189729 () Bool)

(assert (=> d!91514 (=> res!224944 e!189729)))

(assert (=> d!91514 (= res!224944 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12967 w1!591)))))

(assert (=> d!91514 (= (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12967 w1!591)) e!189729)))

(declare-fun b!269858 () Bool)

(declare-fun e!189730 () Bool)

(assert (=> b!269858 (= e!189729 e!189730)))

(declare-fun res!224945 () Bool)

(assert (=> b!269858 (=> (not res!224945) (not e!189730))))

(assert (=> b!269858 (= res!224945 (= (select (arr!7536 (buf!7017 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7536 (buf!7017 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!269859 () Bool)

(assert (=> b!269859 (= e!189730 (arrayRangesEq!1081 (buf!7017 w1!591) (buf!7017 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12967 w1!591)))))

(assert (= (and d!91514 (not res!224944)) b!269858))

(assert (= (and b!269858 res!224945) b!269859))

(declare-fun m!401603 () Bool)

(assert (=> b!269858 m!401603))

(assert (=> b!269858 m!401571))

(declare-fun m!401605 () Bool)

(assert (=> b!269859 m!401605))

(assert (=> b!269834 d!91514))

(declare-fun d!91516 () Bool)

(assert (=> d!91516 (= (remainingBits!0 ((_ sign_extend 32) (size!6549 (buf!7017 w2!587))) ((_ sign_extend 32) (currentByte!12967 w2!587)) ((_ sign_extend 32) (currentBit!12962 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6549 (buf!7017 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12967 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12962 w2!587)))))))

(assert (=> d!91440 d!91516))

(assert (=> d!91440 d!91420))

(push 1)

(assert (not b!269855))

(assert (not b!269853))

(assert (not b!269859))

(assert (not b!269857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


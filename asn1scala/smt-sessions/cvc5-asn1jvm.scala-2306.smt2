; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58416 () Bool)

(assert start!58416)

(declare-fun b!268268 () Bool)

(declare-fun e!188280 () Bool)

(declare-datatypes ((array!14960 0))(
  ( (array!14961 (arr!7510 (Array (_ BitVec 32) (_ BitVec 8))) (size!6523 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11860 0))(
  ( (BitStream!11861 (buf!6991 array!14960) (currentByte!12909 (_ BitVec 32)) (currentBit!12904 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11860)

(declare-fun array_inv!6247 (array!14960) Bool)

(assert (=> b!268268 (= e!188280 (array_inv!6247 (buf!6991 w3!25)))))

(declare-fun b!268269 () Bool)

(declare-fun e!188274 () Bool)

(declare-fun w1!591 () BitStream!11860)

(assert (=> b!268269 (= e!188274 (array_inv!6247 (buf!6991 w1!591)))))

(declare-fun b!268270 () Bool)

(declare-fun e!188273 () Bool)

(declare-fun w2!587 () BitStream!11860)

(assert (=> b!268270 (= e!188273 (array_inv!6247 (buf!6991 w2!587)))))

(declare-fun res!223771 () Bool)

(declare-fun e!188277 () Bool)

(assert (=> start!58416 (=> (not res!223771) (not e!188277))))

(declare-fun isPrefixOf!0 (BitStream!11860 BitStream!11860) Bool)

(assert (=> start!58416 (= res!223771 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58416 e!188277))

(declare-fun inv!12 (BitStream!11860) Bool)

(assert (=> start!58416 (and (inv!12 w1!591) e!188274)))

(assert (=> start!58416 (and (inv!12 w2!587) e!188273)))

(assert (=> start!58416 (and (inv!12 w3!25) e!188280)))

(declare-fun b!268271 () Bool)

(declare-datatypes ((Unit!19019 0))(
  ( (Unit!19020) )
))
(declare-fun e!188276 () Unit!19019)

(declare-fun Unit!19021 () Unit!19019)

(assert (=> b!268271 (= e!188276 Unit!19021)))

(declare-fun b!268272 () Bool)

(declare-fun e!188272 () Bool)

(declare-fun e!188278 () Bool)

(assert (=> b!268272 (= e!188272 e!188278)))

(declare-fun res!223769 () Bool)

(assert (=> b!268272 (=> res!223769 e!188278)))

(assert (=> b!268272 (= res!223769 (or (bvsge (currentByte!12909 w1!591) (size!6523 (buf!6991 w1!591))) (bvslt (currentByte!12909 w1!591) (currentByte!12909 w2!587))))))

(declare-fun b!268273 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268273 (= e!188278 (byteRangesEq!0 (select (arr!7510 (buf!6991 w1!591)) (currentByte!12909 w1!591)) (select (arr!7510 (buf!6991 w3!25)) (currentByte!12909 w1!591)) #b00000000000000000000000000000000 (currentBit!12904 w1!591)))))

(declare-fun b!268274 () Bool)

(declare-fun res!223768 () Bool)

(assert (=> b!268274 (=> (not res!223768) (not e!188277))))

(assert (=> b!268274 (= res!223768 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268275 () Bool)

(assert (=> b!268275 (= e!188277 (not (or (bvsge (currentByte!12909 w1!591) (size!6523 (buf!6991 w1!591))) (and (bvsle #b00000000000000000000000000000000 (currentBit!12904 w1!591)) (bvsle (currentBit!12904 w1!591) #b00000000000000000000000000001000)))))))

(declare-fun lt!408379 () Unit!19019)

(assert (=> b!268275 (= lt!408379 e!188276)))

(declare-fun c!12369 () Bool)

(assert (=> b!268275 (= c!12369 (and (bvslt (currentByte!12909 w1!591) (size!6523 (buf!6991 w1!591))) (bvslt (currentByte!12909 w1!591) (currentByte!12909 w2!587))))))

(assert (=> b!268275 e!188272))

(declare-fun res!223770 () Bool)

(assert (=> b!268275 (=> (not res!223770) (not e!188272))))

(declare-fun arrayRangesEq!1058 (array!14960 array!14960 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268275 (= res!223770 (arrayRangesEq!1058 (buf!6991 w1!591) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591)))))

(declare-fun lt!408378 () Unit!19019)

(declare-fun arrayRangesEqTransitive!333 (array!14960 array!14960 array!14960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19019)

(assert (=> b!268275 (= lt!408378 (arrayRangesEqTransitive!333 (buf!6991 w1!591) (buf!6991 w2!587) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591) (currentByte!12909 w2!587)))))

(declare-fun b!268276 () Bool)

(declare-fun e!188279 () Bool)

(assert (=> b!268276 (= e!188279 (byteRangesEq!0 (select (arr!7510 (buf!6991 w1!591)) (currentByte!12909 w1!591)) (select (arr!7510 (buf!6991 w3!25)) (currentByte!12909 w1!591)) #b00000000000000000000000000000000 (currentBit!12904 w1!591)))))

(declare-fun b!268277 () Bool)

(declare-fun Unit!19022 () Unit!19019)

(assert (=> b!268277 (= e!188276 Unit!19022)))

(declare-fun lt!408380 () Unit!19019)

(declare-fun arrayRangesEqImpliesEq!148 (array!14960 array!14960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19019)

(assert (=> b!268277 (= lt!408380 (arrayRangesEqImpliesEq!148 (buf!6991 w2!587) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591) (currentByte!12909 w2!587)))))

(declare-fun res!223767 () Bool)

(assert (=> b!268277 (= res!223767 (= (select (arr!7510 (buf!6991 w2!587)) (currentByte!12909 w1!591)) (select (arr!7510 (buf!6991 w3!25)) (currentByte!12909 w1!591))))))

(assert (=> b!268277 (=> (not res!223767) (not e!188279))))

(assert (=> b!268277 e!188279))

(assert (= (and start!58416 res!223771) b!268274))

(assert (= (and b!268274 res!223768) b!268275))

(assert (= (and b!268275 res!223770) b!268272))

(assert (= (and b!268272 (not res!223769)) b!268273))

(assert (= (and b!268275 c!12369) b!268277))

(assert (= (and b!268275 (not c!12369)) b!268271))

(assert (= (and b!268277 res!223767) b!268276))

(assert (= start!58416 b!268269))

(assert (= start!58416 b!268270))

(assert (= start!58416 b!268268))

(declare-fun m!399677 () Bool)

(assert (=> b!268274 m!399677))

(declare-fun m!399679 () Bool)

(assert (=> b!268270 m!399679))

(declare-fun m!399681 () Bool)

(assert (=> b!268268 m!399681))

(declare-fun m!399683 () Bool)

(assert (=> b!268273 m!399683))

(declare-fun m!399685 () Bool)

(assert (=> b!268273 m!399685))

(assert (=> b!268273 m!399683))

(assert (=> b!268273 m!399685))

(declare-fun m!399687 () Bool)

(assert (=> b!268273 m!399687))

(declare-fun m!399689 () Bool)

(assert (=> start!58416 m!399689))

(declare-fun m!399691 () Bool)

(assert (=> start!58416 m!399691))

(declare-fun m!399693 () Bool)

(assert (=> start!58416 m!399693))

(declare-fun m!399695 () Bool)

(assert (=> start!58416 m!399695))

(declare-fun m!399697 () Bool)

(assert (=> b!268269 m!399697))

(declare-fun m!399699 () Bool)

(assert (=> b!268277 m!399699))

(declare-fun m!399701 () Bool)

(assert (=> b!268277 m!399701))

(assert (=> b!268277 m!399685))

(declare-fun m!399703 () Bool)

(assert (=> b!268275 m!399703))

(declare-fun m!399705 () Bool)

(assert (=> b!268275 m!399705))

(assert (=> b!268276 m!399683))

(assert (=> b!268276 m!399685))

(assert (=> b!268276 m!399683))

(assert (=> b!268276 m!399685))

(assert (=> b!268276 m!399687))

(push 1)

(assert (not start!58416))

(assert (not b!268270))

(assert (not b!268275))

(assert (not b!268269))

(assert (not b!268273))

(assert (not b!268274))

(assert (not b!268277))

(assert (not b!268276))

(assert (not b!268268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90678 () Bool)

(assert (=> d!90678 (= (byteRangesEq!0 (select (arr!7510 (buf!6991 w1!591)) (currentByte!12909 w1!591)) (select (arr!7510 (buf!6991 w3!25)) (currentByte!12909 w1!591)) #b00000000000000000000000000000000 (currentBit!12904 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!12904 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7510 (buf!6991 w1!591)) (currentByte!12909 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!12904 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7510 (buf!6991 w3!25)) (currentByte!12909 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!12904 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23020 () Bool)

(assert (= bs!23020 d!90678))

(declare-fun m!399771 () Bool)

(assert (=> bs!23020 m!399771))

(declare-fun m!399773 () Bool)

(assert (=> bs!23020 m!399773))

(assert (=> b!268276 d!90678))

(declare-fun d!90688 () Bool)

(assert (=> d!90688 (and (bvsge (currentByte!12909 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!12909 w1!591) (size!6523 (buf!6991 w2!587))) (bvslt (currentByte!12909 w1!591) (size!6523 (buf!6991 w3!25))) (= (select (arr!7510 (buf!6991 w2!587)) (currentByte!12909 w1!591)) (select (arr!7510 (buf!6991 w3!25)) (currentByte!12909 w1!591))))))

(declare-fun lt!408401 () Unit!19019)

(declare-fun choose!375 (array!14960 array!14960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19019)

(assert (=> d!90688 (= lt!408401 (choose!375 (buf!6991 w2!587) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591) (currentByte!12909 w2!587)))))

(assert (=> d!90688 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12909 w2!587)))))

(assert (=> d!90688 (= (arrayRangesEqImpliesEq!148 (buf!6991 w2!587) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591) (currentByte!12909 w2!587)) lt!408401)))

(declare-fun bs!23021 () Bool)

(assert (= bs!23021 d!90688))

(assert (=> bs!23021 m!399701))

(assert (=> bs!23021 m!399685))

(declare-fun m!399775 () Bool)

(assert (=> bs!23021 m!399775))

(assert (=> b!268277 d!90688))

(declare-fun d!90692 () Bool)

(declare-fun res!223820 () Bool)

(declare-fun e!188360 () Bool)

(assert (=> d!90692 (=> (not res!223820) (not e!188360))))

(assert (=> d!90692 (= res!223820 (= (size!6523 (buf!6991 w1!591)) (size!6523 (buf!6991 w2!587))))))

(assert (=> d!90692 (= (isPrefixOf!0 w1!591 w2!587) e!188360)))

(declare-fun b!268356 () Bool)

(declare-fun res!223821 () Bool)

(assert (=> b!268356 (=> (not res!223821) (not e!188360))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268356 (= res!223821 (bvsle (bitIndex!0 (size!6523 (buf!6991 w1!591)) (currentByte!12909 w1!591) (currentBit!12904 w1!591)) (bitIndex!0 (size!6523 (buf!6991 w2!587)) (currentByte!12909 w2!587) (currentBit!12904 w2!587))))))

(declare-fun b!268357 () Bool)

(declare-fun e!188359 () Bool)

(assert (=> b!268357 (= e!188360 e!188359)))

(declare-fun res!223822 () Bool)

(assert (=> b!268357 (=> res!223822 e!188359)))

(assert (=> b!268357 (= res!223822 (= (size!6523 (buf!6991 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268358 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14960 array!14960 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268358 (= e!188359 (arrayBitRangesEq!0 (buf!6991 w1!591) (buf!6991 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6523 (buf!6991 w1!591)) (currentByte!12909 w1!591) (currentBit!12904 w1!591))))))

(assert (= (and d!90692 res!223820) b!268356))

(assert (= (and b!268356 res!223821) b!268357))

(assert (= (and b!268357 (not res!223822)) b!268358))

(declare-fun m!399801 () Bool)

(assert (=> b!268356 m!399801))

(declare-fun m!399803 () Bool)

(assert (=> b!268356 m!399803))

(assert (=> b!268358 m!399801))

(assert (=> b!268358 m!399801))

(declare-fun m!399805 () Bool)

(assert (=> b!268358 m!399805))

(assert (=> start!58416 d!90692))

(declare-fun d!90710 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90710 (= (inv!12 w1!591) (invariant!0 (currentBit!12904 w1!591) (currentByte!12909 w1!591) (size!6523 (buf!6991 w1!591))))))

(declare-fun bs!23028 () Bool)

(assert (= bs!23028 d!90710))

(declare-fun m!399813 () Bool)

(assert (=> bs!23028 m!399813))

(assert (=> start!58416 d!90710))

(declare-fun d!90718 () Bool)

(assert (=> d!90718 (= (inv!12 w2!587) (invariant!0 (currentBit!12904 w2!587) (currentByte!12909 w2!587) (size!6523 (buf!6991 w2!587))))))

(declare-fun bs!23029 () Bool)

(assert (= bs!23029 d!90718))

(declare-fun m!399815 () Bool)

(assert (=> bs!23029 m!399815))

(assert (=> start!58416 d!90718))

(declare-fun d!90720 () Bool)

(assert (=> d!90720 (= (inv!12 w3!25) (invariant!0 (currentBit!12904 w3!25) (currentByte!12909 w3!25) (size!6523 (buf!6991 w3!25))))))

(declare-fun bs!23030 () Bool)

(assert (= bs!23030 d!90720))

(declare-fun m!399817 () Bool)

(assert (=> bs!23030 m!399817))

(assert (=> start!58416 d!90720))

(declare-fun d!90722 () Bool)

(assert (=> d!90722 (= (array_inv!6247 (buf!6991 w3!25)) (bvsge (size!6523 (buf!6991 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268268 d!90722))

(assert (=> b!268273 d!90678))

(declare-fun d!90724 () Bool)

(declare-fun res!223829 () Bool)

(declare-fun e!188368 () Bool)

(assert (=> d!90724 (=> (not res!223829) (not e!188368))))

(assert (=> d!90724 (= res!223829 (= (size!6523 (buf!6991 w2!587)) (size!6523 (buf!6991 w3!25))))))

(assert (=> d!90724 (= (isPrefixOf!0 w2!587 w3!25) e!188368)))

(declare-fun b!268365 () Bool)

(declare-fun res!223830 () Bool)

(assert (=> b!268365 (=> (not res!223830) (not e!188368))))

(assert (=> b!268365 (= res!223830 (bvsle (bitIndex!0 (size!6523 (buf!6991 w2!587)) (currentByte!12909 w2!587) (currentBit!12904 w2!587)) (bitIndex!0 (size!6523 (buf!6991 w3!25)) (currentByte!12909 w3!25) (currentBit!12904 w3!25))))))

(declare-fun b!268366 () Bool)

(declare-fun e!188367 () Bool)

(assert (=> b!268366 (= e!188368 e!188367)))

(declare-fun res!223831 () Bool)

(assert (=> b!268366 (=> res!223831 e!188367)))

(assert (=> b!268366 (= res!223831 (= (size!6523 (buf!6991 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268367 () Bool)

(assert (=> b!268367 (= e!188367 (arrayBitRangesEq!0 (buf!6991 w2!587) (buf!6991 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6523 (buf!6991 w2!587)) (currentByte!12909 w2!587) (currentBit!12904 w2!587))))))

(assert (= (and d!90724 res!223829) b!268365))

(assert (= (and b!268365 res!223830) b!268366))

(assert (= (and b!268366 (not res!223831)) b!268367))

(assert (=> b!268365 m!399803))

(declare-fun m!399819 () Bool)

(assert (=> b!268365 m!399819))

(assert (=> b!268367 m!399803))

(assert (=> b!268367 m!399803))

(declare-fun m!399821 () Bool)

(assert (=> b!268367 m!399821))

(assert (=> b!268274 d!90724))

(declare-fun d!90726 () Bool)

(assert (=> d!90726 (= (array_inv!6247 (buf!6991 w1!591)) (bvsge (size!6523 (buf!6991 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268269 d!90726))

(declare-fun d!90728 () Bool)

(assert (=> d!90728 (= (array_inv!6247 (buf!6991 w2!587)) (bvsge (size!6523 (buf!6991 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268270 d!90728))

(declare-fun d!90730 () Bool)

(declare-fun res!223836 () Bool)

(declare-fun e!188373 () Bool)

(assert (=> d!90730 (=> res!223836 e!188373)))

(assert (=> d!90730 (= res!223836 (= #b00000000000000000000000000000000 (currentByte!12909 w1!591)))))

(assert (=> d!90730 (= (arrayRangesEq!1058 (buf!6991 w1!591) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591)) e!188373)))

(declare-fun b!268372 () Bool)

(declare-fun e!188374 () Bool)

(assert (=> b!268372 (= e!188373 e!188374)))

(declare-fun res!223837 () Bool)

(assert (=> b!268372 (=> (not res!223837) (not e!188374))))

(assert (=> b!268372 (= res!223837 (= (select (arr!7510 (buf!6991 w1!591)) #b00000000000000000000000000000000) (select (arr!7510 (buf!6991 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268373 () Bool)

(assert (=> b!268373 (= e!188374 (arrayRangesEq!1058 (buf!6991 w1!591) (buf!6991 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12909 w1!591)))))

(assert (= (and d!90730 (not res!223836)) b!268372))

(assert (= (and b!268372 res!223837) b!268373))

(declare-fun m!399825 () Bool)

(assert (=> b!268372 m!399825))

(declare-fun m!399827 () Bool)

(assert (=> b!268372 m!399827))

(declare-fun m!399829 () Bool)

(assert (=> b!268373 m!399829))

(assert (=> b!268275 d!90730))

(declare-fun d!90732 () Bool)

(assert (=> d!90732 (arrayRangesEq!1058 (buf!6991 w1!591) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591))))

(declare-fun lt!408413 () Unit!19019)

(declare-fun choose!379 (array!14960 array!14960 array!14960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19019)

(assert (=> d!90732 (= lt!408413 (choose!379 (buf!6991 w1!591) (buf!6991 w2!587) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591) (currentByte!12909 w2!587)))))

(assert (=> d!90732 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12909 w1!591)) (bvsle (currentByte!12909 w1!591) (currentByte!12909 w2!587)))))

(assert (=> d!90732 (= (arrayRangesEqTransitive!333 (buf!6991 w1!591) (buf!6991 w2!587) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591) (currentByte!12909 w2!587)) lt!408413)))

(declare-fun bs!23032 () Bool)

(assert (= bs!23032 d!90732))

(assert (=> bs!23032 m!399703))

(declare-fun m!399837 () Bool)

(assert (=> bs!23032 m!399837))

(assert (=> b!268275 d!90732))

(push 1)

(assert (not b!268367))

(assert (not b!268373))

(assert (not d!90710))

(assert (not b!268365))

(assert (not b!268358))

(assert (not d!90732))

(assert (not d!90688))

(assert (not d!90720))

(assert (not d!90718))

(assert (not b!268356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90770 () Bool)

(assert (=> d!90770 (= (select (arr!7510 (buf!6991 w2!587)) (currentByte!12909 w1!591)) (select (arr!7510 (buf!6991 w3!25)) (currentByte!12909 w1!591)))))

(assert (=> d!90770 true))

(declare-fun _$12!96 () Unit!19019)

(assert (=> d!90770 (= (choose!375 (buf!6991 w2!587) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591) (currentByte!12909 w2!587)) _$12!96)))

(declare-fun bs!23039 () Bool)

(assert (= bs!23039 d!90770))

(assert (=> bs!23039 m!399701))

(assert (=> bs!23039 m!399685))

(assert (=> d!90688 d!90770))

(assert (=> d!90732 d!90730))

(declare-fun d!90772 () Bool)

(assert (=> d!90772 (arrayRangesEq!1058 (buf!6991 w1!591) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591))))

(assert (=> d!90772 true))

(declare-fun _$16!110 () Unit!19019)

(assert (=> d!90772 (= (choose!379 (buf!6991 w1!591) (buf!6991 w2!587) (buf!6991 w3!25) #b00000000000000000000000000000000 (currentByte!12909 w1!591) (currentByte!12909 w2!587)) _$16!110)))

(declare-fun bs!23040 () Bool)

(assert (= bs!23040 d!90772))

(assert (=> bs!23040 m!399703))

(assert (=> d!90732 d!90772))

(declare-fun d!90774 () Bool)

(declare-fun e!188422 () Bool)

(assert (=> d!90774 e!188422))

(declare-fun res!223892 () Bool)

(assert (=> d!90774 (=> (not res!223892) (not e!188422))))

(declare-fun lt!408476 () (_ BitVec 64))

(declare-fun lt!408474 () (_ BitVec 64))

(declare-fun lt!408471 () (_ BitVec 64))

(assert (=> d!90774 (= res!223892 (= lt!408474 (bvsub lt!408476 lt!408471)))))

(assert (=> d!90774 (or (= (bvand lt!408476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408476 lt!408471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90774 (= lt!408471 (remainingBits!0 ((_ sign_extend 32) (size!6523 (buf!6991 w2!587))) ((_ sign_extend 32) (currentByte!12909 w2!587)) ((_ sign_extend 32) (currentBit!12904 w2!587))))))

(declare-fun lt!408472 () (_ BitVec 64))

(declare-fun lt!408475 () (_ BitVec 64))

(assert (=> d!90774 (= lt!408476 (bvmul lt!408472 lt!408475))))

(assert (=> d!90774 (or (= lt!408472 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408475 (bvsdiv (bvmul lt!408472 lt!408475) lt!408472)))))

(assert (=> d!90774 (= lt!408475 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90774 (= lt!408472 ((_ sign_extend 32) (size!6523 (buf!6991 w2!587))))))

(assert (=> d!90774 (= lt!408474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12909 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12904 w2!587))))))

(assert (=> d!90774 (invariant!0 (currentBit!12904 w2!587) (currentByte!12909 w2!587) (size!6523 (buf!6991 w2!587)))))

(assert (=> d!90774 (= (bitIndex!0 (size!6523 (buf!6991 w2!587)) (currentByte!12909 w2!587) (currentBit!12904 w2!587)) lt!408474)))

(declare-fun b!268436 () Bool)

(declare-fun res!223893 () Bool)

(assert (=> b!268436 (=> (not res!223893) (not e!188422))))

(assert (=> b!268436 (= res!223893 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408474))))

(declare-fun b!268437 () Bool)

(declare-fun lt!408473 () (_ BitVec 64))

(assert (=> b!268437 (= e!188422 (bvsle lt!408474 (bvmul lt!408473 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268437 (or (= lt!408473 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408473 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408473)))))

(assert (=> b!268437 (= lt!408473 ((_ sign_extend 32) (size!6523 (buf!6991 w2!587))))))

(assert (= (and d!90774 res!223892) b!268436))

(assert (= (and b!268436 res!223893) b!268437))

(declare-fun m!399901 () Bool)

(assert (=> d!90774 m!399901))

(assert (=> d!90774 m!399815))

(assert (=> b!268365 d!90774))

(declare-fun d!90776 () Bool)

(declare-fun e!188423 () Bool)

(assert (=> d!90776 e!188423))

(declare-fun res!223894 () Bool)

(assert (=> d!90776 (=> (not res!223894) (not e!188423))))

(declare-fun lt!408480 () (_ BitVec 64))

(declare-fun lt!408482 () (_ BitVec 64))

(declare-fun lt!408477 () (_ BitVec 64))

(assert (=> d!90776 (= res!223894 (= lt!408480 (bvsub lt!408482 lt!408477)))))

(assert (=> d!90776 (or (= (bvand lt!408482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408482 lt!408477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90776 (= lt!408477 (remainingBits!0 ((_ sign_extend 32) (size!6523 (buf!6991 w3!25))) ((_ sign_extend 32) (currentByte!12909 w3!25)) ((_ sign_extend 32) (currentBit!12904 w3!25))))))

(declare-fun lt!408478 () (_ BitVec 64))

(declare-fun lt!408481 () (_ BitVec 64))

(assert (=> d!90776 (= lt!408482 (bvmul lt!408478 lt!408481))))

(assert (=> d!90776 (or (= lt!408478 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408481 (bvsdiv (bvmul lt!408478 lt!408481) lt!408478)))))

(assert (=> d!90776 (= lt!408481 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90776 (= lt!408478 ((_ sign_extend 32) (size!6523 (buf!6991 w3!25))))))

(assert (=> d!90776 (= lt!408480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12909 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12904 w3!25))))))

(assert (=> d!90776 (invariant!0 (currentBit!12904 w3!25) (currentByte!12909 w3!25) (size!6523 (buf!6991 w3!25)))))

(assert (=> d!90776 (= (bitIndex!0 (size!6523 (buf!6991 w3!25)) (currentByte!12909 w3!25) (currentBit!12904 w3!25)) lt!408480)))

(declare-fun b!268438 () Bool)

(declare-fun res!223895 () Bool)

(assert (=> b!268438 (=> (not res!223895) (not e!188423))))

(assert (=> b!268438 (= res!223895 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408480))))

(declare-fun b!268439 () Bool)

(declare-fun lt!408479 () (_ BitVec 64))

(assert (=> b!268439 (= e!188423 (bvsle lt!408480 (bvmul lt!408479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268439 (or (= lt!408479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408479)))))

(assert (=> b!268439 (= lt!408479 ((_ sign_extend 32) (size!6523 (buf!6991 w3!25))))))

(assert (= (and d!90776 res!223894) b!268438))

(assert (= (and b!268438 res!223895) b!268439))

(declare-fun m!399903 () Bool)

(assert (=> d!90776 m!399903))

(assert (=> d!90776 m!399817))

(assert (=> b!268365 d!90776))

(declare-fun d!90778 () Bool)

(assert (=> d!90778 (= (invariant!0 (currentBit!12904 w3!25) (currentByte!12909 w3!25) (size!6523 (buf!6991 w3!25))) (and (bvsge (currentBit!12904 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12904 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12909 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12909 w3!25) (size!6523 (buf!6991 w3!25))) (and (= (currentBit!12904 w3!25) #b00000000000000000000000000000000) (= (currentByte!12909 w3!25) (size!6523 (buf!6991 w3!25)))))))))

(assert (=> d!90720 d!90778))

(declare-fun d!90780 () Bool)

(assert (=> d!90780 (= (invariant!0 (currentBit!12904 w2!587) (currentByte!12909 w2!587) (size!6523 (buf!6991 w2!587))) (and (bvsge (currentBit!12904 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12904 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12909 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12909 w2!587) (size!6523 (buf!6991 w2!587))) (and (= (currentBit!12904 w2!587) #b00000000000000000000000000000000) (= (currentByte!12909 w2!587) (size!6523 (buf!6991 w2!587)))))))))

(assert (=> d!90718 d!90780))

(declare-fun d!90782 () Bool)

(assert (=> d!90782 (= (invariant!0 (currentBit!12904 w1!591) (currentByte!12909 w1!591) (size!6523 (buf!6991 w1!591))) (and (bvsge (currentBit!12904 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12904 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12909 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12909 w1!591) (size!6523 (buf!6991 w1!591))) (and (= (currentBit!12904 w1!591) #b00000000000000000000000000000000) (= (currentByte!12909 w1!591) (size!6523 (buf!6991 w1!591)))))))))

(assert (=> d!90710 d!90782))

(declare-fun d!90784 () Bool)

(declare-fun e!188424 () Bool)

(assert (=> d!90784 e!188424))

(declare-fun res!223896 () Bool)

(assert (=> d!90784 (=> (not res!223896) (not e!188424))))

(declare-fun lt!408488 () (_ BitVec 64))

(declare-fun lt!408483 () (_ BitVec 64))

(declare-fun lt!408486 () (_ BitVec 64))

(assert (=> d!90784 (= res!223896 (= lt!408486 (bvsub lt!408488 lt!408483)))))

(assert (=> d!90784 (or (= (bvand lt!408488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408488 lt!408483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90784 (= lt!408483 (remainingBits!0 ((_ sign_extend 32) (size!6523 (buf!6991 w1!591))) ((_ sign_extend 32) (currentByte!12909 w1!591)) ((_ sign_extend 32) (currentBit!12904 w1!591))))))

(declare-fun lt!408484 () (_ BitVec 64))

(declare-fun lt!408487 () (_ BitVec 64))

(assert (=> d!90784 (= lt!408488 (bvmul lt!408484 lt!408487))))

(assert (=> d!90784 (or (= lt!408484 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408487 (bvsdiv (bvmul lt!408484 lt!408487) lt!408484)))))

(assert (=> d!90784 (= lt!408487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90784 (= lt!408484 ((_ sign_extend 32) (size!6523 (buf!6991 w1!591))))))

(assert (=> d!90784 (= lt!408486 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12909 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12904 w1!591))))))

(assert (=> d!90784 (invariant!0 (currentBit!12904 w1!591) (currentByte!12909 w1!591) (size!6523 (buf!6991 w1!591)))))

(assert (=> d!90784 (= (bitIndex!0 (size!6523 (buf!6991 w1!591)) (currentByte!12909 w1!591) (currentBit!12904 w1!591)) lt!408486)))

(declare-fun b!268440 () Bool)

(declare-fun res!223897 () Bool)

(assert (=> b!268440 (=> (not res!223897) (not e!188424))))

(assert (=> b!268440 (= res!223897 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408486))))

(declare-fun b!268441 () Bool)

(declare-fun lt!408485 () (_ BitVec 64))

(assert (=> b!268441 (= e!188424 (bvsle lt!408486 (bvmul lt!408485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268441 (or (= lt!408485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408485)))))

(assert (=> b!268441 (= lt!408485 ((_ sign_extend 32) (size!6523 (buf!6991 w1!591))))))

(assert (= (and d!90784 res!223896) b!268440))

(assert (= (and b!268440 res!223897) b!268441))

(declare-fun m!399905 () Bool)

(assert (=> d!90784 m!399905))

(assert (=> d!90784 m!399813))

(assert (=> b!268356 d!90784))

(assert (=> b!268356 d!90774))

(declare-fun d!90786 () Bool)

(declare-fun res!223898 () Bool)

(declare-fun e!188425 () Bool)

(assert (=> d!90786 (=> res!223898 e!188425)))

(assert (=> d!90786 (= res!223898 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12909 w1!591)))))

(assert (=> d!90786 (= (arrayRangesEq!1058 (buf!6991 w1!591) (buf!6991 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12909 w1!591)) e!188425)))

(declare-fun b!268442 () Bool)

(declare-fun e!188426 () Bool)

(assert (=> b!268442 (= e!188425 e!188426)))

(declare-fun res!223899 () Bool)

(assert (=> b!268442 (=> (not res!223899) (not e!188426))))

(assert (=> b!268442 (= res!223899 (= (select (arr!7510 (buf!6991 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7510 (buf!6991 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268443 () Bool)

(assert (=> b!268443 (= e!188426 (arrayRangesEq!1058 (buf!6991 w1!591) (buf!6991 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12909 w1!591)))))

(assert (= (and d!90786 (not res!223898)) b!268442))

(assert (= (and b!268442 res!223899) b!268443))

(declare-fun m!399907 () Bool)

(assert (=> b!268442 m!399907))

(declare-fun m!399909 () Bool)

(assert (=> b!268442 m!399909))

(declare-fun m!399911 () Bool)

(assert (=> b!268443 m!399911))

(assert (=> b!268373 d!90786))

(declare-datatypes ((tuple4!416 0))(
  ( (tuple4!417 (_1!12191 (_ BitVec 32)) (_2!12191 (_ BitVec 32)) (_3!988 (_ BitVec 32)) (_4!208 (_ BitVec 32))) )
))
(declare-fun lt!408496 () tuple4!416)

(declare-fun b!268458 () Bool)

(declare-fun e!188444 () Bool)

(assert (=> b!268458 (= e!188444 (arrayRangesEq!1058 (buf!6991 w2!587) (buf!6991 w3!25) (_1!12191 lt!408496) (_2!12191 lt!408496)))))

(declare-fun b!268459 () Bool)

(declare-fun e!188440 () Bool)

(declare-fun call!4242 () Bool)

(assert (=> b!268459 (= e!188440 call!4242)))

(declare-fun b!268460 () Bool)

(declare-fun e!188441 () Bool)

(assert (=> b!268460 (= e!188441 e!188440)))

(declare-fun c!12382 () Bool)

(assert (=> b!268460 (= c!12382 (= (_3!988 lt!408496) (_4!208 lt!408496)))))

(declare-fun lt!408495 () (_ BitVec 32))

(declare-fun lt!408497 () (_ BitVec 32))

(declare-fun bm!4239 () Bool)

(assert (=> bm!4239 (= call!4242 (byteRangesEq!0 (ite c!12382 (select (arr!7510 (buf!6991 w2!587)) (_3!988 lt!408496)) (select (arr!7510 (buf!6991 w2!587)) (_4!208 lt!408496))) (ite c!12382 (select (arr!7510 (buf!6991 w3!25)) (_3!988 lt!408496)) (select (arr!7510 (buf!6991 w3!25)) (_4!208 lt!408496))) (ite c!12382 lt!408497 #b00000000000000000000000000000000) lt!408495))))

(declare-fun d!90788 () Bool)

(declare-fun res!223911 () Bool)

(declare-fun e!188442 () Bool)

(assert (=> d!90788 (=> res!223911 e!188442)))

(assert (=> d!90788 (= res!223911 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6523 (buf!6991 w2!587)) (currentByte!12909 w2!587) (currentBit!12904 w2!587))))))

(assert (=> d!90788 (= (arrayBitRangesEq!0 (buf!6991 w2!587) (buf!6991 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6523 (buf!6991 w2!587)) (currentByte!12909 w2!587) (currentBit!12904 w2!587))) e!188442)))

(declare-fun b!268461 () Bool)

(assert (=> b!268461 (= e!188442 e!188441)))

(declare-fun res!223912 () Bool)

(assert (=> b!268461 (=> (not res!223912) (not e!188441))))

(assert (=> b!268461 (= res!223912 e!188444)))

(declare-fun res!223913 () Bool)

(assert (=> b!268461 (=> res!223913 e!188444)))

(assert (=> b!268461 (= res!223913 (bvsge (_1!12191 lt!408496) (_2!12191 lt!408496)))))

(assert (=> b!268461 (= lt!408495 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6523 (buf!6991 w2!587)) (currentByte!12909 w2!587) (currentBit!12904 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268461 (= lt!408497 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!416)

(assert (=> b!268461 (= lt!408496 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6523 (buf!6991 w2!587)) (currentByte!12909 w2!587) (currentBit!12904 w2!587))))))

(declare-fun b!268462 () Bool)

(declare-fun e!188439 () Bool)

(assert (=> b!268462 (= e!188439 call!4242)))

(declare-fun b!268463 () Bool)

(declare-fun e!188443 () Bool)

(assert (=> b!268463 (= e!188440 e!188443)))

(declare-fun res!223910 () Bool)

(assert (=> b!268463 (= res!223910 (byteRangesEq!0 (select (arr!7510 (buf!6991 w2!587)) (_3!988 lt!408496)) (select (arr!7510 (buf!6991 w3!25)) (_3!988 lt!408496)) lt!408497 #b00000000000000000000000000001000))))

(assert (=> b!268463 (=> (not res!223910) (not e!188443))))

(declare-fun b!268464 () Bool)

(declare-fun res!223914 () Bool)

(assert (=> b!268464 (= res!223914 (= lt!408495 #b00000000000000000000000000000000))))

(assert (=> b!268464 (=> res!223914 e!188439)))

(assert (=> b!268464 (= e!188443 e!188439)))

(assert (= (and d!90788 (not res!223911)) b!268461))

(assert (= (and b!268461 (not res!223913)) b!268458))

(assert (= (and b!268461 res!223912) b!268460))

(assert (= (and b!268460 c!12382) b!268459))

(assert (= (and b!268460 (not c!12382)) b!268463))

(assert (= (and b!268463 res!223910) b!268464))

(assert (= (and b!268464 (not res!223914)) b!268462))

(assert (= (or b!268459 b!268462) bm!4239))

(declare-fun m!399913 () Bool)

(assert (=> b!268458 m!399913))

(declare-fun m!399915 () Bool)

(assert (=> bm!4239 m!399915))

(declare-fun m!399917 () Bool)

(assert (=> bm!4239 m!399917))

(declare-fun m!399919 () Bool)

(assert (=> bm!4239 m!399919))

(declare-fun m!399921 () Bool)

(assert (=> bm!4239 m!399921))

(declare-fun m!399923 () Bool)

(assert (=> bm!4239 m!399923))

(assert (=> b!268461 m!399803))

(declare-fun m!399925 () Bool)

(assert (=> b!268461 m!399925))

(assert (=> b!268463 m!399919))

(assert (=> b!268463 m!399921))

(assert (=> b!268463 m!399919))

(assert (=> b!268463 m!399921))

(declare-fun m!399927 () Bool)

(assert (=> b!268463 m!399927))

(assert (=> b!268367 d!90788))

(assert (=> b!268367 d!90774))

(declare-fun b!268465 () Bool)

(declare-fun e!188450 () Bool)

(declare-fun lt!408499 () tuple4!416)

(assert (=> b!268465 (= e!188450 (arrayRangesEq!1058 (buf!6991 w1!591) (buf!6991 w2!587) (_1!12191 lt!408499) (_2!12191 lt!408499)))))

(declare-fun b!268466 () Bool)

(declare-fun e!188446 () Bool)

(declare-fun call!4243 () Bool)

(assert (=> b!268466 (= e!188446 call!4243)))

(declare-fun b!268467 () Bool)

(declare-fun e!188447 () Bool)

(assert (=> b!268467 (= e!188447 e!188446)))

(declare-fun c!12383 () Bool)

(assert (=> b!268467 (= c!12383 (= (_3!988 lt!408499) (_4!208 lt!408499)))))

(declare-fun bm!4240 () Bool)

(declare-fun lt!408500 () (_ BitVec 32))

(declare-fun lt!408498 () (_ BitVec 32))

(assert (=> bm!4240 (= call!4243 (byteRangesEq!0 (ite c!12383 (select (arr!7510 (buf!6991 w1!591)) (_3!988 lt!408499)) (select (arr!7510 (buf!6991 w1!591)) (_4!208 lt!408499))) (ite c!12383 (select (arr!7510 (buf!6991 w2!587)) (_3!988 lt!408499)) (select (arr!7510 (buf!6991 w2!587)) (_4!208 lt!408499))) (ite c!12383 lt!408500 #b00000000000000000000000000000000) lt!408498))))

(declare-fun d!90796 () Bool)

(declare-fun res!223916 () Bool)

(declare-fun e!188448 () Bool)

(assert (=> d!90796 (=> res!223916 e!188448)))

(assert (=> d!90796 (= res!223916 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6523 (buf!6991 w1!591)) (currentByte!12909 w1!591) (currentBit!12904 w1!591))))))

(assert (=> d!90796 (= (arrayBitRangesEq!0 (buf!6991 w1!591) (buf!6991 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6523 (buf!6991 w1!591)) (currentByte!12909 w1!591) (currentBit!12904 w1!591))) e!188448)))

(declare-fun b!268468 () Bool)

(assert (=> b!268468 (= e!188448 e!188447)))

(declare-fun res!223917 () Bool)

(assert (=> b!268468 (=> (not res!223917) (not e!188447))))

(assert (=> b!268468 (= res!223917 e!188450)))

(declare-fun res!223918 () Bool)

(assert (=> b!268468 (=> res!223918 e!188450)))

(assert (=> b!268468 (= res!223918 (bvsge (_1!12191 lt!408499) (_2!12191 lt!408499)))))

(assert (=> b!268468 (= lt!408498 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6523 (buf!6991 w1!591)) (currentByte!12909 w1!591) (currentBit!12904 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268468 (= lt!408500 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268468 (= lt!408499 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6523 (buf!6991 w1!591)) (currentByte!12909 w1!591) (currentBit!12904 w1!591))))))

(declare-fun b!268469 () Bool)

(declare-fun e!188445 () Bool)

(assert (=> b!268469 (= e!188445 call!4243)))

(declare-fun b!268470 () Bool)

(declare-fun e!188449 () Bool)

(assert (=> b!268470 (= e!188446 e!188449)))

(declare-fun res!223915 () Bool)

(assert (=> b!268470 (= res!223915 (byteRangesEq!0 (select (arr!7510 (buf!6991 w1!591)) (_3!988 lt!408499)) (select (arr!7510 (buf!6991 w2!587)) (_3!988 lt!408499)) lt!408500 #b00000000000000000000000000001000))))

(assert (=> b!268470 (=> (not res!223915) (not e!188449))))

(declare-fun b!268471 () Bool)

(declare-fun res!223919 () Bool)

(assert (=> b!268471 (= res!223919 (= lt!408498 #b00000000000000000000000000000000))))

(assert (=> b!268471 (=> res!223919 e!188445)))

(assert (=> b!268471 (= e!188449 e!188445)))

(assert (= (and d!90796 (not res!223916)) b!268468))

(assert (= (and b!268468 (not res!223918)) b!268465))

(assert (= (and b!268468 res!223917) b!268467))

(assert (= (and b!268467 c!12383) b!268466))

(assert (= (and b!268467 (not c!12383)) b!268470))

(assert (= (and b!268470 res!223915) b!268471))

(assert (= (and b!268471 (not res!223919)) b!268469))

(assert (= (or b!268466 b!268469) bm!4240))

(declare-fun m!399929 () Bool)

(assert (=> b!268465 m!399929))

(declare-fun m!399931 () Bool)

(assert (=> bm!4240 m!399931))

(declare-fun m!399933 () Bool)

(assert (=> bm!4240 m!399933))

(declare-fun m!399935 () Bool)

(assert (=> bm!4240 m!399935))

(declare-fun m!399937 () Bool)

(assert (=> bm!4240 m!399937))

(declare-fun m!399939 () Bool)

(assert (=> bm!4240 m!399939))

(assert (=> b!268468 m!399801))

(declare-fun m!399941 () Bool)

(assert (=> b!268468 m!399941))

(assert (=> b!268470 m!399935))

(assert (=> b!268470 m!399937))

(assert (=> b!268470 m!399935))

(assert (=> b!268470 m!399937))

(declare-fun m!399943 () Bool)

(assert (=> b!268470 m!399943))

(assert (=> b!268358 d!90796))

(assert (=> b!268358 d!90784))

(push 1)

(assert (not b!268443))

(assert (not b!268458))

(assert (not bm!4240))

(assert (not b!268465))

(assert (not bm!4239))

(assert (not b!268468))

(assert (not d!90776))

(assert (not b!268463))

(assert (not b!268461))

(assert (not d!90784))

(assert (not b!268470))

(assert (not d!90774))

(assert (not d!90772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


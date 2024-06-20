; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61204 () Bool)

(assert start!61204)

(declare-fun res!229149 () Bool)

(declare-fun e!195696 () Bool)

(assert (=> start!61204 (=> (not res!229149) (not e!195696))))

(declare-datatypes ((array!15765 0))(
  ( (array!15766 (arr!7817 (Array (_ BitVec 32) (_ BitVec 8))) (size!6830 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12474 0))(
  ( (BitStream!12475 (buf!7298 array!15765) (currentByte!13471 (_ BitVec 32)) (currentBit!13466 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12474)

(declare-fun bs2!19 () BitStream!12474)

(assert (=> start!61204 (= res!229149 (= (size!6830 (buf!7298 bs1!11)) (size!6830 (buf!7298 bs2!19))))))

(assert (=> start!61204 e!195696))

(declare-fun e!195692 () Bool)

(declare-fun inv!12 (BitStream!12474) Bool)

(assert (=> start!61204 (and (inv!12 bs1!11) e!195692)))

(declare-fun e!195691 () Bool)

(assert (=> start!61204 (and (inv!12 bs2!19) e!195691)))

(declare-fun b!275716 () Bool)

(declare-fun array_inv!6554 (array!15765) Bool)

(assert (=> b!275716 (= e!195691 (array_inv!6554 (buf!7298 bs2!19)))))

(declare-fun b!275717 () Bool)

(declare-fun e!195695 () Bool)

(assert (=> b!275717 (= e!195696 e!195695)))

(declare-fun res!229148 () Bool)

(assert (=> b!275717 (=> (not res!229148) (not e!195695))))

(declare-fun lt!413700 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!15765 array!15765 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275717 (= res!229148 (arrayBitRangesEq!0 (buf!7298 bs1!11) (buf!7298 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413700))))

(declare-fun lt!413701 () (_ BitVec 64))

(assert (=> b!275717 (= lt!413700 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!413701))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275717 (= lt!413701 (bitIndex!0 (size!6830 (buf!7298 bs1!11)) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))

(declare-fun b!275718 () Bool)

(declare-fun e!195693 () Bool)

(assert (=> b!275718 (= e!195695 (not e!195693))))

(declare-fun res!229150 () Bool)

(assert (=> b!275718 (=> res!229150 e!195693)))

(assert (=> b!275718 (= res!229150 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413700) (bvsgt lt!413700 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413701) (bvsge lt!413701 lt!413700)))))

(declare-datatypes ((tuple2!22480 0))(
  ( (tuple2!22481 (_1!12272 BitStream!12474) (_2!12272 Bool)) )
))
(declare-fun lt!413698 () tuple2!22480)

(declare-fun readBitPure!0 (BitStream!12474) tuple2!22480)

(assert (=> b!275718 (= lt!413698 (readBitPure!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))

(declare-fun lt!413702 () tuple2!22480)

(assert (=> b!275718 (= lt!413702 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275718 (invariant!0 (currentBit!13466 bs1!11) (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs2!19)))))

(declare-fun b!275719 () Bool)

(assert (=> b!275719 (= e!195693 (invariant!0 (currentBit!13466 (_1!12272 lt!413702)) (currentByte!13471 (_1!12272 lt!413702)) (size!6830 (buf!7298 (_1!12272 lt!413702)))))))

(declare-fun bitAt!0 (array!15765 (_ BitVec 64)) Bool)

(assert (=> b!275719 (= (bitAt!0 (buf!7298 bs1!11) lt!413701) (bitAt!0 (buf!7298 bs2!19) lt!413701))))

(declare-datatypes ((Unit!19357 0))(
  ( (Unit!19358) )
))
(declare-fun lt!413699 () Unit!19357)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15765 array!15765 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19357)

(assert (=> b!275719 (= lt!413699 (arrayBitRangesEqImpliesEq!0 (buf!7298 bs1!11) (buf!7298 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413701 lt!413700))))

(declare-fun b!275720 () Bool)

(declare-fun res!229147 () Bool)

(assert (=> b!275720 (=> (not res!229147) (not e!195696))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275720 (= res!229147 (validate_offset_bit!0 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) ((_ sign_extend 32) (currentByte!13471 bs1!11)) ((_ sign_extend 32) (currentBit!13466 bs1!11))))))

(declare-fun b!275721 () Bool)

(assert (=> b!275721 (= e!195692 (array_inv!6554 (buf!7298 bs1!11)))))

(assert (= (and start!61204 res!229149) b!275720))

(assert (= (and b!275720 res!229147) b!275717))

(assert (= (and b!275717 res!229148) b!275718))

(assert (= (and b!275718 (not res!229150)) b!275719))

(assert (= start!61204 b!275721))

(assert (= start!61204 b!275716))

(declare-fun m!408443 () Bool)

(assert (=> b!275720 m!408443))

(declare-fun m!408445 () Bool)

(assert (=> b!275716 m!408445))

(declare-fun m!408447 () Bool)

(assert (=> start!61204 m!408447))

(declare-fun m!408449 () Bool)

(assert (=> start!61204 m!408449))

(declare-fun m!408451 () Bool)

(assert (=> b!275719 m!408451))

(declare-fun m!408453 () Bool)

(assert (=> b!275719 m!408453))

(declare-fun m!408455 () Bool)

(assert (=> b!275719 m!408455))

(declare-fun m!408457 () Bool)

(assert (=> b!275719 m!408457))

(declare-fun m!408459 () Bool)

(assert (=> b!275718 m!408459))

(declare-fun m!408461 () Bool)

(assert (=> b!275718 m!408461))

(declare-fun m!408463 () Bool)

(assert (=> b!275718 m!408463))

(declare-fun m!408465 () Bool)

(assert (=> b!275721 m!408465))

(declare-fun m!408467 () Bool)

(assert (=> b!275717 m!408467))

(declare-fun m!408469 () Bool)

(assert (=> b!275717 m!408469))

(check-sat (not b!275717) (not b!275719) (not start!61204) (not b!275716) (not b!275721) (not b!275720) (not b!275718))
(check-sat)
(get-model)

(declare-fun d!94716 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94716 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) ((_ sign_extend 32) (currentByte!13471 bs1!11)) ((_ sign_extend 32) (currentBit!13466 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) ((_ sign_extend 32) (currentByte!13471 bs1!11)) ((_ sign_extend 32) (currentBit!13466 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23885 () Bool)

(assert (= bs!23885 d!94716))

(declare-fun m!408499 () Bool)

(assert (=> bs!23885 m!408499))

(assert (=> b!275720 d!94716))

(declare-fun d!94718 () Bool)

(assert (=> d!94718 (= (array_inv!6554 (buf!7298 bs1!11)) (bvsge (size!6830 (buf!7298 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275721 d!94718))

(declare-fun d!94722 () Bool)

(assert (=> d!94722 (= (invariant!0 (currentBit!13466 (_1!12272 lt!413702)) (currentByte!13471 (_1!12272 lt!413702)) (size!6830 (buf!7298 (_1!12272 lt!413702)))) (and (bvsge (currentBit!13466 (_1!12272 lt!413702)) #b00000000000000000000000000000000) (bvslt (currentBit!13466 (_1!12272 lt!413702)) #b00000000000000000000000000001000) (bvsge (currentByte!13471 (_1!12272 lt!413702)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13471 (_1!12272 lt!413702)) (size!6830 (buf!7298 (_1!12272 lt!413702)))) (and (= (currentBit!13466 (_1!12272 lt!413702)) #b00000000000000000000000000000000) (= (currentByte!13471 (_1!12272 lt!413702)) (size!6830 (buf!7298 (_1!12272 lt!413702))))))))))

(assert (=> b!275719 d!94722))

(declare-fun d!94726 () Bool)

(assert (=> d!94726 (= (bitAt!0 (buf!7298 bs1!11) lt!413701) (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs1!11)) ((_ extract 31 0) (bvsdiv lt!413701 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413701 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23889 () Bool)

(assert (= bs!23889 d!94726))

(declare-fun m!408509 () Bool)

(assert (=> bs!23889 m!408509))

(declare-fun m!408511 () Bool)

(assert (=> bs!23889 m!408511))

(assert (=> b!275719 d!94726))

(declare-fun d!94736 () Bool)

(assert (=> d!94736 (= (bitAt!0 (buf!7298 bs2!19) lt!413701) (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs2!19)) ((_ extract 31 0) (bvsdiv lt!413701 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413701 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23890 () Bool)

(assert (= bs!23890 d!94736))

(declare-fun m!408513 () Bool)

(assert (=> bs!23890 m!408513))

(assert (=> bs!23890 m!408511))

(assert (=> b!275719 d!94736))

(declare-fun d!94738 () Bool)

(assert (=> d!94738 (= (bitAt!0 (buf!7298 bs1!11) lt!413701) (bitAt!0 (buf!7298 bs2!19) lt!413701))))

(declare-fun lt!413731 () Unit!19357)

(declare-fun choose!31 (array!15765 array!15765 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19357)

(assert (=> d!94738 (= lt!413731 (choose!31 (buf!7298 bs1!11) (buf!7298 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413701 lt!413700))))

(assert (=> d!94738 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413700))))

(assert (=> d!94738 (= (arrayBitRangesEqImpliesEq!0 (buf!7298 bs1!11) (buf!7298 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413701 lt!413700) lt!413731)))

(declare-fun bs!23900 () Bool)

(assert (= bs!23900 d!94738))

(assert (=> bs!23900 m!408453))

(assert (=> bs!23900 m!408455))

(declare-fun m!408533 () Bool)

(assert (=> bs!23900 m!408533))

(assert (=> b!275719 d!94738))

(declare-fun d!94770 () Bool)

(assert (=> d!94770 (= (inv!12 bs1!11) (invariant!0 (currentBit!13466 bs1!11) (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs1!11))))))

(declare-fun bs!23901 () Bool)

(assert (= bs!23901 d!94770))

(declare-fun m!408535 () Bool)

(assert (=> bs!23901 m!408535))

(assert (=> start!61204 d!94770))

(declare-fun d!94772 () Bool)

(assert (=> d!94772 (= (inv!12 bs2!19) (invariant!0 (currentBit!13466 bs2!19) (currentByte!13471 bs2!19) (size!6830 (buf!7298 bs2!19))))))

(declare-fun bs!23902 () Bool)

(assert (= bs!23902 d!94772))

(declare-fun m!408537 () Bool)

(assert (=> bs!23902 m!408537))

(assert (=> start!61204 d!94772))

(declare-fun d!94774 () Bool)

(declare-datatypes ((tuple2!22488 0))(
  ( (tuple2!22489 (_1!12278 Bool) (_2!12278 BitStream!12474)) )
))
(declare-fun lt!413734 () tuple2!22488)

(declare-fun readBit!0 (BitStream!12474) tuple2!22488)

(assert (=> d!94774 (= lt!413734 (readBit!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))

(assert (=> d!94774 (= (readBitPure!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (tuple2!22481 (_2!12278 lt!413734) (_1!12278 lt!413734)))))

(declare-fun bs!23903 () Bool)

(assert (= bs!23903 d!94774))

(declare-fun m!408539 () Bool)

(assert (=> bs!23903 m!408539))

(assert (=> b!275718 d!94774))

(declare-fun d!94776 () Bool)

(declare-fun lt!413735 () tuple2!22488)

(assert (=> d!94776 (= lt!413735 (readBit!0 bs1!11))))

(assert (=> d!94776 (= (readBitPure!0 bs1!11) (tuple2!22481 (_2!12278 lt!413735) (_1!12278 lt!413735)))))

(declare-fun bs!23904 () Bool)

(assert (= bs!23904 d!94776))

(declare-fun m!408541 () Bool)

(assert (=> bs!23904 m!408541))

(assert (=> b!275718 d!94776))

(declare-fun d!94778 () Bool)

(assert (=> d!94778 (= (invariant!0 (currentBit!13466 bs1!11) (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs2!19))) (and (bvsge (currentBit!13466 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13466 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13471 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs2!19))) (and (= (currentBit!13466 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs2!19)))))))))

(assert (=> b!275718 d!94778))

(declare-fun d!94780 () Bool)

(assert (=> d!94780 (= (array_inv!6554 (buf!7298 bs2!19)) (bvsge (size!6830 (buf!7298 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275716 d!94780))

(declare-fun b!275804 () Bool)

(declare-fun e!195776 () Bool)

(declare-fun call!4418 () Bool)

(assert (=> b!275804 (= e!195776 call!4418)))

(declare-fun b!275805 () Bool)

(declare-fun e!195772 () Bool)

(assert (=> b!275805 (= e!195772 call!4418)))

(declare-fun b!275806 () Bool)

(declare-fun e!195773 () Bool)

(declare-fun e!195775 () Bool)

(assert (=> b!275806 (= e!195773 e!195775)))

(declare-fun res!229211 () Bool)

(assert (=> b!275806 (=> (not res!229211) (not e!195775))))

(declare-fun e!195774 () Bool)

(assert (=> b!275806 (= res!229211 e!195774)))

(declare-fun res!229213 () Bool)

(assert (=> b!275806 (=> res!229213 e!195774)))

(declare-datatypes ((tuple4!508 0))(
  ( (tuple4!509 (_1!12279 (_ BitVec 32)) (_2!12279 (_ BitVec 32)) (_3!1034 (_ BitVec 32)) (_4!254 (_ BitVec 32))) )
))
(declare-fun lt!413786 () tuple4!508)

(assert (=> b!275806 (= res!229213 (bvsge (_1!12279 lt!413786) (_2!12279 lt!413786)))))

(declare-fun lt!413785 () (_ BitVec 32))

(assert (=> b!275806 (= lt!413785 ((_ extract 31 0) (bvsrem lt!413700 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!413784 () (_ BitVec 32))

(assert (=> b!275806 (= lt!413784 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!508)

(assert (=> b!275806 (= lt!413786 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413700))))

(declare-fun b!275807 () Bool)

(declare-fun arrayRangesEq!1147 (array!15765 array!15765 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275807 (= e!195774 (arrayRangesEq!1147 (buf!7298 bs1!11) (buf!7298 bs2!19) (_1!12279 lt!413786) (_2!12279 lt!413786)))))

(declare-fun c!12603 () Bool)

(declare-fun bm!4415 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4415 (= call!4418 (byteRangesEq!0 (ite c!12603 (select (arr!7817 (buf!7298 bs1!11)) (_3!1034 lt!413786)) (select (arr!7817 (buf!7298 bs1!11)) (_4!254 lt!413786))) (ite c!12603 (select (arr!7817 (buf!7298 bs2!19)) (_3!1034 lt!413786)) (select (arr!7817 (buf!7298 bs2!19)) (_4!254 lt!413786))) (ite c!12603 lt!413784 #b00000000000000000000000000000000) lt!413785))))

(declare-fun b!275809 () Bool)

(declare-fun res!229215 () Bool)

(assert (=> b!275809 (= res!229215 (= lt!413785 #b00000000000000000000000000000000))))

(assert (=> b!275809 (=> res!229215 e!195772)))

(declare-fun e!195771 () Bool)

(assert (=> b!275809 (= e!195771 e!195772)))

(declare-fun b!275810 () Bool)

(assert (=> b!275810 (= e!195775 e!195776)))

(assert (=> b!275810 (= c!12603 (= (_3!1034 lt!413786) (_4!254 lt!413786)))))

(declare-fun d!94782 () Bool)

(declare-fun res!229214 () Bool)

(assert (=> d!94782 (=> res!229214 e!195773)))

(assert (=> d!94782 (= res!229214 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!413700))))

(assert (=> d!94782 (= (arrayBitRangesEq!0 (buf!7298 bs1!11) (buf!7298 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413700) e!195773)))

(declare-fun b!275808 () Bool)

(assert (=> b!275808 (= e!195776 e!195771)))

(declare-fun res!229212 () Bool)

(assert (=> b!275808 (= res!229212 (byteRangesEq!0 (select (arr!7817 (buf!7298 bs1!11)) (_3!1034 lt!413786)) (select (arr!7817 (buf!7298 bs2!19)) (_3!1034 lt!413786)) lt!413784 #b00000000000000000000000000001000))))

(assert (=> b!275808 (=> (not res!229212) (not e!195771))))

(assert (= (and d!94782 (not res!229214)) b!275806))

(assert (= (and b!275806 (not res!229213)) b!275807))

(assert (= (and b!275806 res!229211) b!275810))

(assert (= (and b!275810 c!12603) b!275804))

(assert (= (and b!275810 (not c!12603)) b!275808))

(assert (= (and b!275808 res!229212) b!275809))

(assert (= (and b!275809 (not res!229215)) b!275805))

(assert (= (or b!275804 b!275805) bm!4415))

(declare-fun m!408575 () Bool)

(assert (=> b!275806 m!408575))

(declare-fun m!408577 () Bool)

(assert (=> b!275807 m!408577))

(declare-fun m!408579 () Bool)

(assert (=> bm!4415 m!408579))

(declare-fun m!408581 () Bool)

(assert (=> bm!4415 m!408581))

(declare-fun m!408585 () Bool)

(assert (=> bm!4415 m!408585))

(declare-fun m!408587 () Bool)

(assert (=> bm!4415 m!408587))

(declare-fun m!408589 () Bool)

(assert (=> bm!4415 m!408589))

(assert (=> b!275808 m!408587))

(assert (=> b!275808 m!408579))

(assert (=> b!275808 m!408587))

(assert (=> b!275808 m!408579))

(declare-fun m!408591 () Bool)

(assert (=> b!275808 m!408591))

(assert (=> b!275717 d!94782))

(declare-fun d!94792 () Bool)

(declare-fun e!195781 () Bool)

(assert (=> d!94792 e!195781))

(declare-fun res!229225 () Bool)

(assert (=> d!94792 (=> (not res!229225) (not e!195781))))

(declare-fun lt!413815 () (_ BitVec 64))

(declare-fun lt!413817 () (_ BitVec 64))

(declare-fun lt!413816 () (_ BitVec 64))

(assert (=> d!94792 (= res!229225 (= lt!413816 (bvsub lt!413815 lt!413817)))))

(assert (=> d!94792 (or (= (bvand lt!413815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413817 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413815 lt!413817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94792 (= lt!413817 (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) ((_ sign_extend 32) (currentByte!13471 bs1!11)) ((_ sign_extend 32) (currentBit!13466 bs1!11))))))

(declare-fun lt!413818 () (_ BitVec 64))

(declare-fun lt!413814 () (_ BitVec 64))

(assert (=> d!94792 (= lt!413815 (bvmul lt!413818 lt!413814))))

(assert (=> d!94792 (or (= lt!413818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413814 (bvsdiv (bvmul lt!413818 lt!413814) lt!413818)))))

(assert (=> d!94792 (= lt!413814 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94792 (= lt!413818 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))))))

(assert (=> d!94792 (= lt!413816 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13471 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13466 bs1!11))))))

(assert (=> d!94792 (invariant!0 (currentBit!13466 bs1!11) (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs1!11)))))

(assert (=> d!94792 (= (bitIndex!0 (size!6830 (buf!7298 bs1!11)) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)) lt!413816)))

(declare-fun b!275819 () Bool)

(declare-fun res!229224 () Bool)

(assert (=> b!275819 (=> (not res!229224) (not e!195781))))

(assert (=> b!275819 (= res!229224 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413816))))

(declare-fun b!275820 () Bool)

(declare-fun lt!413819 () (_ BitVec 64))

(assert (=> b!275820 (= e!195781 (bvsle lt!413816 (bvmul lt!413819 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275820 (or (= lt!413819 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413819 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413819)))))

(assert (=> b!275820 (= lt!413819 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))))))

(assert (= (and d!94792 res!229225) b!275819))

(assert (= (and b!275819 res!229224) b!275820))

(assert (=> d!94792 m!408499))

(assert (=> d!94792 m!408535))

(assert (=> b!275717 d!94792))

(check-sat (not d!94774) (not d!94716) (not b!275806) (not d!94770) (not d!94792) (not b!275807) (not b!275808) (not d!94772) (not d!94738) (not d!94776) (not bm!4415))
(check-sat)
(get-model)

(declare-fun d!94800 () Bool)

(assert (=> d!94800 (= (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) ((_ sign_extend 32) (currentByte!13471 bs1!11)) ((_ sign_extend 32) (currentBit!13466 bs1!11))) (bvsub (bvmul ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13471 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13466 bs1!11)))))))

(assert (=> d!94792 d!94800))

(declare-fun d!94802 () Bool)

(assert (=> d!94802 (= (invariant!0 (currentBit!13466 bs1!11) (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs1!11))) (and (bvsge (currentBit!13466 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13466 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13471 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs1!11))) (and (= (currentBit!13466 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13471 bs1!11) (size!6830 (buf!7298 bs1!11)))))))))

(assert (=> d!94792 d!94802))

(assert (=> d!94738 d!94726))

(assert (=> d!94738 d!94736))

(declare-fun d!94804 () Bool)

(assert (=> d!94804 (= (bitAt!0 (buf!7298 bs1!11) lt!413701) (bitAt!0 (buf!7298 bs2!19) lt!413701))))

(assert (=> d!94804 true))

(declare-fun _$31!32 () Unit!19357)

(assert (=> d!94804 (= (choose!31 (buf!7298 bs1!11) (buf!7298 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413701 lt!413700) _$31!32)))

(declare-fun bs!23909 () Bool)

(assert (= bs!23909 d!94804))

(assert (=> bs!23909 m!408453))

(assert (=> bs!23909 m!408455))

(assert (=> d!94738 d!94804))

(declare-fun d!94806 () Bool)

(assert (=> d!94806 (= (invariant!0 (currentBit!13466 bs2!19) (currentByte!13471 bs2!19) (size!6830 (buf!7298 bs2!19))) (and (bvsge (currentBit!13466 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13466 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13471 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13471 bs2!19) (size!6830 (buf!7298 bs2!19))) (and (= (currentBit!13466 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13471 bs2!19) (size!6830 (buf!7298 bs2!19)))))))))

(assert (=> d!94772 d!94806))

(declare-fun d!94808 () Bool)

(assert (=> d!94808 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413700) (tuple4!509 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!413700 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!413700 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!275806 d!94808))

(assert (=> d!94770 d!94802))

(declare-fun d!94810 () Bool)

(assert (=> d!94810 (= (byteRangesEq!0 (ite c!12603 (select (arr!7817 (buf!7298 bs1!11)) (_3!1034 lt!413786)) (select (arr!7817 (buf!7298 bs1!11)) (_4!254 lt!413786))) (ite c!12603 (select (arr!7817 (buf!7298 bs2!19)) (_3!1034 lt!413786)) (select (arr!7817 (buf!7298 bs2!19)) (_4!254 lt!413786))) (ite c!12603 lt!413784 #b00000000000000000000000000000000) lt!413785) (or (= (ite c!12603 lt!413784 #b00000000000000000000000000000000) lt!413785) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12603 (select (arr!7817 (buf!7298 bs1!11)) (_3!1034 lt!413786)) (select (arr!7817 (buf!7298 bs1!11)) (_4!254 lt!413786)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!413785))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12603 lt!413784 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12603 (select (arr!7817 (buf!7298 bs2!19)) (_3!1034 lt!413786)) (select (arr!7817 (buf!7298 bs2!19)) (_4!254 lt!413786)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!413785))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12603 lt!413784 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23910 () Bool)

(assert (= bs!23910 d!94810))

(declare-fun m!408601 () Bool)

(assert (=> bs!23910 m!408601))

(declare-fun m!408603 () Bool)

(assert (=> bs!23910 m!408603))

(assert (=> bm!4415 d!94810))

(declare-fun d!94812 () Bool)

(assert (=> d!94812 (= (byteRangesEq!0 (select (arr!7817 (buf!7298 bs1!11)) (_3!1034 lt!413786)) (select (arr!7817 (buf!7298 bs2!19)) (_3!1034 lt!413786)) lt!413784 #b00000000000000000000000000001000) (or (= lt!413784 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs1!11)) (_3!1034 lt!413786))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!413784)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs2!19)) (_3!1034 lt!413786))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!413784)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23911 () Bool)

(assert (= bs!23911 d!94812))

(declare-fun m!408605 () Bool)

(assert (=> bs!23911 m!408605))

(declare-fun m!408607 () Bool)

(assert (=> bs!23911 m!408607))

(assert (=> b!275808 d!94812))

(declare-fun d!94814 () Bool)

(declare-fun res!229230 () Bool)

(declare-fun e!195786 () Bool)

(assert (=> d!94814 (=> res!229230 e!195786)))

(assert (=> d!94814 (= res!229230 (= (_1!12279 lt!413786) (_2!12279 lt!413786)))))

(assert (=> d!94814 (= (arrayRangesEq!1147 (buf!7298 bs1!11) (buf!7298 bs2!19) (_1!12279 lt!413786) (_2!12279 lt!413786)) e!195786)))

(declare-fun b!275825 () Bool)

(declare-fun e!195787 () Bool)

(assert (=> b!275825 (= e!195786 e!195787)))

(declare-fun res!229231 () Bool)

(assert (=> b!275825 (=> (not res!229231) (not e!195787))))

(assert (=> b!275825 (= res!229231 (= (select (arr!7817 (buf!7298 bs1!11)) (_1!12279 lt!413786)) (select (arr!7817 (buf!7298 bs2!19)) (_1!12279 lt!413786))))))

(declare-fun b!275826 () Bool)

(assert (=> b!275826 (= e!195787 (arrayRangesEq!1147 (buf!7298 bs1!11) (buf!7298 bs2!19) (bvadd (_1!12279 lt!413786) #b00000000000000000000000000000001) (_2!12279 lt!413786)))))

(assert (= (and d!94814 (not res!229230)) b!275825))

(assert (= (and b!275825 res!229231) b!275826))

(declare-fun m!408609 () Bool)

(assert (=> b!275825 m!408609))

(declare-fun m!408611 () Bool)

(assert (=> b!275825 m!408611))

(declare-fun m!408613 () Bool)

(assert (=> b!275826 m!408613))

(assert (=> b!275807 d!94814))

(assert (=> d!94716 d!94800))

(declare-fun d!94816 () Bool)

(declare-fun e!195794 () Bool)

(assert (=> d!94816 e!195794))

(declare-fun res!229234 () Bool)

(assert (=> d!94816 (=> (not res!229234) (not e!195794))))

(declare-datatypes ((tuple2!22490 0))(
  ( (tuple2!22491 (_1!12280 Unit!19357) (_2!12280 BitStream!12474)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12474) tuple2!22490)

(assert (=> d!94816 (= res!229234 (= (buf!7298 (_2!12280 (increaseBitIndex!0 bs1!11))) (buf!7298 bs1!11)))))

(declare-fun lt!413840 () Bool)

(assert (=> d!94816 (= lt!413840 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs1!11)) (currentByte!13471 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!413834 () tuple2!22488)

(assert (=> d!94816 (= lt!413834 (tuple2!22489 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs1!11)) (currentByte!13471 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 bs1!11)))) #b00000000000000000000000000000000)) (_2!12280 (increaseBitIndex!0 bs1!11))))))

(assert (=> d!94816 (validate_offset_bit!0 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) ((_ sign_extend 32) (currentByte!13471 bs1!11)) ((_ sign_extend 32) (currentBit!13466 bs1!11)))))

(assert (=> d!94816 (= (readBit!0 bs1!11) lt!413834)))

(declare-fun b!275829 () Bool)

(declare-fun lt!413836 () (_ BitVec 64))

(declare-fun lt!413835 () (_ BitVec 64))

(assert (=> b!275829 (= e!195794 (= (bitIndex!0 (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 bs1!11)))) (currentByte!13471 (_2!12280 (increaseBitIndex!0 bs1!11))) (currentBit!13466 (_2!12280 (increaseBitIndex!0 bs1!11)))) (bvadd lt!413836 lt!413835)))))

(assert (=> b!275829 (or (not (= (bvand lt!413836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413835 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!413836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!413836 lt!413835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!275829 (= lt!413835 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!275829 (= lt!413836 (bitIndex!0 (size!6830 (buf!7298 bs1!11)) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))

(declare-fun lt!413839 () Bool)

(assert (=> b!275829 (= lt!413839 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs1!11)) (currentByte!13471 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!413837 () Bool)

(assert (=> b!275829 (= lt!413837 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs1!11)) (currentByte!13471 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!413838 () Bool)

(assert (=> b!275829 (= lt!413838 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 bs1!11)) (currentByte!13471 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 bs1!11)))) #b00000000000000000000000000000000)))))

(assert (= (and d!94816 res!229234) b!275829))

(declare-fun m!408615 () Bool)

(assert (=> d!94816 m!408615))

(declare-fun m!408617 () Bool)

(assert (=> d!94816 m!408617))

(declare-fun m!408619 () Bool)

(assert (=> d!94816 m!408619))

(assert (=> d!94816 m!408443))

(assert (=> b!275829 m!408469))

(declare-fun m!408621 () Bool)

(assert (=> b!275829 m!408621))

(assert (=> b!275829 m!408615))

(assert (=> b!275829 m!408619))

(assert (=> b!275829 m!408617))

(assert (=> d!94776 d!94816))

(declare-fun d!94818 () Bool)

(declare-fun e!195795 () Bool)

(assert (=> d!94818 e!195795))

(declare-fun res!229235 () Bool)

(assert (=> d!94818 (=> (not res!229235) (not e!195795))))

(assert (=> d!94818 (= res!229235 (= (buf!7298 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))))

(declare-fun lt!413847 () Bool)

(assert (=> d!94818 (= lt!413847 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!413841 () tuple2!22488)

(assert (=> d!94818 (= lt!413841 (tuple2!22489 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) #b00000000000000000000000000000000)) (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))

(assert (=> d!94818 (validate_offset_bit!0 ((_ sign_extend 32) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 32) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) ((_ sign_extend 32) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))))

(assert (=> d!94818 (= (readBit!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) lt!413841)))

(declare-fun lt!413843 () (_ BitVec 64))

(declare-fun b!275830 () Bool)

(declare-fun lt!413842 () (_ BitVec 64))

(assert (=> b!275830 (= e!195795 (= (bitIndex!0 (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) (currentByte!13471 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) (currentBit!13466 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) (bvadd lt!413843 lt!413842)))))

(assert (=> b!275830 (or (not (= (bvand lt!413843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413842 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!413843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!413843 lt!413842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!275830 (= lt!413842 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!275830 (= lt!413843 (bitIndex!0 (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))))

(declare-fun lt!413846 () Bool)

(assert (=> b!275830 (= lt!413846 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!413844 () Bool)

(assert (=> b!275830 (= lt!413844 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!413845 () Bool)

(assert (=> b!275830 (= lt!413845 (not (= (bvand ((_ sign_extend 24) (select (arr!7817 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!94818 res!229235) b!275830))

(declare-fun m!408623 () Bool)

(assert (=> d!94818 m!408623))

(declare-fun m!408625 () Bool)

(assert (=> d!94818 m!408625))

(declare-fun m!408627 () Bool)

(assert (=> d!94818 m!408627))

(declare-fun m!408629 () Bool)

(assert (=> d!94818 m!408629))

(declare-fun m!408631 () Bool)

(assert (=> b!275830 m!408631))

(declare-fun m!408633 () Bool)

(assert (=> b!275830 m!408633))

(assert (=> b!275830 m!408623))

(assert (=> b!275830 m!408627))

(assert (=> b!275830 m!408625))

(assert (=> d!94774 d!94818))

(check-sat (not b!275830) (not d!94818) (not d!94804) (not b!275829) (not d!94816) (not b!275826))
(check-sat)
(get-model)

(assert (=> d!94804 d!94726))

(assert (=> d!94804 d!94736))

(declare-fun d!94820 () Bool)

(declare-fun e!195796 () Bool)

(assert (=> d!94820 e!195796))

(declare-fun res!229237 () Bool)

(assert (=> d!94820 (=> (not res!229237) (not e!195796))))

(declare-fun lt!413851 () (_ BitVec 64))

(declare-fun lt!413850 () (_ BitVec 64))

(declare-fun lt!413849 () (_ BitVec 64))

(assert (=> d!94820 (= res!229237 (= lt!413850 (bvsub lt!413849 lt!413851)))))

(assert (=> d!94820 (or (= (bvand lt!413849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413851 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413849 lt!413851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94820 (= lt!413851 (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 bs1!11))))) ((_ sign_extend 32) (currentByte!13471 (_2!12280 (increaseBitIndex!0 bs1!11)))) ((_ sign_extend 32) (currentBit!13466 (_2!12280 (increaseBitIndex!0 bs1!11))))))))

(declare-fun lt!413852 () (_ BitVec 64))

(declare-fun lt!413848 () (_ BitVec 64))

(assert (=> d!94820 (= lt!413849 (bvmul lt!413852 lt!413848))))

(assert (=> d!94820 (or (= lt!413852 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413848 (bvsdiv (bvmul lt!413852 lt!413848) lt!413852)))))

(assert (=> d!94820 (= lt!413848 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94820 (= lt!413852 ((_ sign_extend 32) (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 bs1!11))))))))

(assert (=> d!94820 (= lt!413850 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13471 (_2!12280 (increaseBitIndex!0 bs1!11)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13466 (_2!12280 (increaseBitIndex!0 bs1!11))))))))

(assert (=> d!94820 (invariant!0 (currentBit!13466 (_2!12280 (increaseBitIndex!0 bs1!11))) (currentByte!13471 (_2!12280 (increaseBitIndex!0 bs1!11))) (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 bs1!11)))))))

(assert (=> d!94820 (= (bitIndex!0 (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 bs1!11)))) (currentByte!13471 (_2!12280 (increaseBitIndex!0 bs1!11))) (currentBit!13466 (_2!12280 (increaseBitIndex!0 bs1!11)))) lt!413850)))

(declare-fun b!275831 () Bool)

(declare-fun res!229236 () Bool)

(assert (=> b!275831 (=> (not res!229236) (not e!195796))))

(assert (=> b!275831 (= res!229236 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413850))))

(declare-fun b!275832 () Bool)

(declare-fun lt!413853 () (_ BitVec 64))

(assert (=> b!275832 (= e!195796 (bvsle lt!413850 (bvmul lt!413853 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275832 (or (= lt!413853 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413853 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413853)))))

(assert (=> b!275832 (= lt!413853 ((_ sign_extend 32) (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 bs1!11))))))))

(assert (= (and d!94820 res!229237) b!275831))

(assert (= (and b!275831 res!229236) b!275832))

(declare-fun m!408635 () Bool)

(assert (=> d!94820 m!408635))

(declare-fun m!408637 () Bool)

(assert (=> d!94820 m!408637))

(assert (=> b!275829 d!94820))

(declare-fun d!94822 () Bool)

(declare-fun e!195799 () Bool)

(assert (=> d!94822 e!195799))

(declare-fun res!229243 () Bool)

(assert (=> d!94822 (=> (not res!229243) (not e!195799))))

(declare-fun lt!413868 () (_ BitVec 64))

(declare-fun lt!413865 () tuple2!22490)

(declare-fun lt!413866 () (_ BitVec 64))

(assert (=> d!94822 (= res!229243 (= (bvadd lt!413868 lt!413866) (bitIndex!0 (size!6830 (buf!7298 (_2!12280 lt!413865))) (currentByte!13471 (_2!12280 lt!413865)) (currentBit!13466 (_2!12280 lt!413865)))))))

(assert (=> d!94822 (or (not (= (bvand lt!413868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413866 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!413868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!413868 lt!413866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94822 (= lt!413866 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!94822 (= lt!413868 (bitIndex!0 (size!6830 (buf!7298 bs1!11)) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))

(declare-fun Unit!19361 () Unit!19357)

(declare-fun Unit!19362 () Unit!19357)

(assert (=> d!94822 (= lt!413865 (ite (bvslt (currentBit!13466 bs1!11) #b00000000000000000000000000000111) (tuple2!22491 Unit!19361 (BitStream!12475 (buf!7298 bs1!11) (currentByte!13471 bs1!11) (bvadd (currentBit!13466 bs1!11) #b00000000000000000000000000000001))) (tuple2!22491 Unit!19362 (BitStream!12475 (buf!7298 bs1!11) (bvadd (currentByte!13471 bs1!11) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!94822 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) ((_ sign_extend 32) (currentByte!13471 bs1!11)) ((_ sign_extend 32) (currentBit!13466 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!94822 (= (increaseBitIndex!0 bs1!11) lt!413865)))

(declare-fun b!275837 () Bool)

(declare-fun res!229242 () Bool)

(assert (=> b!275837 (=> (not res!229242) (not e!195799))))

(declare-fun lt!413864 () (_ BitVec 64))

(declare-fun lt!413867 () (_ BitVec 64))

(assert (=> b!275837 (= res!229242 (= (bvsub lt!413864 lt!413867) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!275837 (or (= (bvand lt!413864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413864 lt!413867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!275837 (= lt!413867 (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 (_2!12280 lt!413865)))) ((_ sign_extend 32) (currentByte!13471 (_2!12280 lt!413865))) ((_ sign_extend 32) (currentBit!13466 (_2!12280 lt!413865)))))))

(assert (=> b!275837 (= lt!413864 (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 bs1!11))) ((_ sign_extend 32) (currentByte!13471 bs1!11)) ((_ sign_extend 32) (currentBit!13466 bs1!11))))))

(declare-fun b!275838 () Bool)

(assert (=> b!275838 (= e!195799 (= (size!6830 (buf!7298 bs1!11)) (size!6830 (buf!7298 (_2!12280 lt!413865)))))))

(assert (= (and d!94822 res!229243) b!275837))

(assert (= (and b!275837 res!229242) b!275838))

(declare-fun m!408639 () Bool)

(assert (=> d!94822 m!408639))

(assert (=> d!94822 m!408469))

(assert (=> d!94822 m!408499))

(declare-fun m!408641 () Bool)

(assert (=> b!275837 m!408641))

(assert (=> b!275837 m!408499))

(assert (=> b!275829 d!94822))

(assert (=> b!275829 d!94792))

(assert (=> d!94816 d!94822))

(assert (=> d!94816 d!94716))

(declare-fun d!94824 () Bool)

(declare-fun e!195800 () Bool)

(assert (=> d!94824 e!195800))

(declare-fun res!229245 () Bool)

(assert (=> d!94824 (=> (not res!229245) (not e!195800))))

(declare-fun lt!413872 () (_ BitVec 64))

(declare-fun lt!413870 () (_ BitVec 64))

(declare-fun lt!413871 () (_ BitVec 64))

(assert (=> d!94824 (= res!229245 (= lt!413871 (bvsub lt!413870 lt!413872)))))

(assert (=> d!94824 (or (= (bvand lt!413870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413872 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413870 lt!413872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94824 (= lt!413872 (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))) ((_ sign_extend 32) (currentByte!13471 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) ((_ sign_extend 32) (currentBit!13466 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))))

(declare-fun lt!413873 () (_ BitVec 64))

(declare-fun lt!413869 () (_ BitVec 64))

(assert (=> d!94824 (= lt!413870 (bvmul lt!413873 lt!413869))))

(assert (=> d!94824 (or (= lt!413873 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413869 (bvsdiv (bvmul lt!413873 lt!413869) lt!413873)))))

(assert (=> d!94824 (= lt!413869 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94824 (= lt!413873 ((_ sign_extend 32) (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))))

(assert (=> d!94824 (= lt!413871 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13471 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13466 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))))

(assert (=> d!94824 (invariant!0 (currentBit!13466 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) (currentByte!13471 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))))))

(assert (=> d!94824 (= (bitIndex!0 (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) (currentByte!13471 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) (currentBit!13466 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))) lt!413871)))

(declare-fun b!275839 () Bool)

(declare-fun res!229244 () Bool)

(assert (=> b!275839 (=> (not res!229244) (not e!195800))))

(assert (=> b!275839 (= res!229244 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413871))))

(declare-fun b!275840 () Bool)

(declare-fun lt!413874 () (_ BitVec 64))

(assert (=> b!275840 (= e!195800 (bvsle lt!413871 (bvmul lt!413874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275840 (or (= lt!413874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413874)))))

(assert (=> b!275840 (= lt!413874 ((_ sign_extend 32) (size!6830 (buf!7298 (_2!12280 (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))))

(assert (= (and d!94824 res!229245) b!275839))

(assert (= (and b!275839 res!229244) b!275840))

(declare-fun m!408643 () Bool)

(assert (=> d!94824 m!408643))

(declare-fun m!408645 () Bool)

(assert (=> d!94824 m!408645))

(assert (=> b!275830 d!94824))

(declare-fun d!94826 () Bool)

(declare-fun e!195801 () Bool)

(assert (=> d!94826 e!195801))

(declare-fun res!229247 () Bool)

(assert (=> d!94826 (=> (not res!229247) (not e!195801))))

(declare-fun lt!413877 () (_ BitVec 64))

(declare-fun lt!413876 () tuple2!22490)

(declare-fun lt!413879 () (_ BitVec 64))

(assert (=> d!94826 (= res!229247 (= (bvadd lt!413879 lt!413877) (bitIndex!0 (size!6830 (buf!7298 (_2!12280 lt!413876))) (currentByte!13471 (_2!12280 lt!413876)) (currentBit!13466 (_2!12280 lt!413876)))))))

(assert (=> d!94826 (or (not (= (bvand lt!413879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413877 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!413879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!413879 lt!413877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94826 (= lt!413877 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!94826 (= lt!413879 (bitIndex!0 (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))))

(declare-fun Unit!19363 () Unit!19357)

(declare-fun Unit!19364 () Unit!19357)

(assert (=> d!94826 (= lt!413876 (ite (bvslt (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) #b00000000000000000000000000000111) (tuple2!22491 Unit!19363 (BitStream!12475 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (bvadd (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) #b00000000000000000000000000000001))) (tuple2!22491 Unit!19364 (BitStream!12475 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (bvadd (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!94826 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 32) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) ((_ sign_extend 32) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!94826 (= (increaseBitIndex!0 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) lt!413876)))

(declare-fun b!275841 () Bool)

(declare-fun res!229246 () Bool)

(assert (=> b!275841 (=> (not res!229246) (not e!195801))))

(declare-fun lt!413875 () (_ BitVec 64))

(declare-fun lt!413878 () (_ BitVec 64))

(assert (=> b!275841 (= res!229246 (= (bvsub lt!413875 lt!413878) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!275841 (or (= (bvand lt!413875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413878 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413875 lt!413878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!275841 (= lt!413878 (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 (_2!12280 lt!413876)))) ((_ sign_extend 32) (currentByte!13471 (_2!12280 lt!413876))) ((_ sign_extend 32) (currentBit!13466 (_2!12280 lt!413876)))))))

(assert (=> b!275841 (= lt!413875 (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 32) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) ((_ sign_extend 32) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))

(declare-fun b!275842 () Bool)

(assert (=> b!275842 (= e!195801 (= (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (size!6830 (buf!7298 (_2!12280 lt!413876)))))))

(assert (= (and d!94826 res!229247) b!275841))

(assert (= (and b!275841 res!229246) b!275842))

(declare-fun m!408647 () Bool)

(assert (=> d!94826 m!408647))

(assert (=> d!94826 m!408631))

(declare-fun m!408649 () Bool)

(assert (=> d!94826 m!408649))

(declare-fun m!408651 () Bool)

(assert (=> b!275841 m!408651))

(assert (=> b!275841 m!408649))

(assert (=> b!275830 d!94826))

(declare-fun d!94828 () Bool)

(declare-fun e!195802 () Bool)

(assert (=> d!94828 e!195802))

(declare-fun res!229249 () Bool)

(assert (=> d!94828 (=> (not res!229249) (not e!195802))))

(declare-fun lt!413882 () (_ BitVec 64))

(declare-fun lt!413881 () (_ BitVec 64))

(declare-fun lt!413883 () (_ BitVec 64))

(assert (=> d!94828 (= res!229249 (= lt!413882 (bvsub lt!413881 lt!413883)))))

(assert (=> d!94828 (or (= (bvand lt!413881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413883 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413881 lt!413883) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94828 (= lt!413883 (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 32) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) ((_ sign_extend 32) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))

(declare-fun lt!413884 () (_ BitVec 64))

(declare-fun lt!413880 () (_ BitVec 64))

(assert (=> d!94828 (= lt!413881 (bvmul lt!413884 lt!413880))))

(assert (=> d!94828 (or (= lt!413884 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413880 (bvsdiv (bvmul lt!413884 lt!413880) lt!413884)))))

(assert (=> d!94828 (= lt!413880 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94828 (= lt!413884 ((_ sign_extend 32) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))

(assert (=> d!94828 (= lt!413882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))

(assert (=> d!94828 (invariant!0 (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))))))

(assert (=> d!94828 (= (bitIndex!0 (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) lt!413882)))

(declare-fun b!275843 () Bool)

(declare-fun res!229248 () Bool)

(assert (=> b!275843 (=> (not res!229248) (not e!195802))))

(assert (=> b!275843 (= res!229248 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413882))))

(declare-fun b!275844 () Bool)

(declare-fun lt!413885 () (_ BitVec 64))

(assert (=> b!275844 (= e!195802 (bvsle lt!413882 (bvmul lt!413885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275844 (or (= lt!413885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413885)))))

(assert (=> b!275844 (= lt!413885 ((_ sign_extend 32) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))))))

(assert (= (and d!94828 res!229249) b!275843))

(assert (= (and b!275843 res!229248) b!275844))

(assert (=> d!94828 m!408649))

(declare-fun m!408653 () Bool)

(assert (=> d!94828 m!408653))

(assert (=> b!275830 d!94828))

(assert (=> d!94818 d!94826))

(declare-fun d!94830 () Bool)

(assert (=> d!94830 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 32) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) ((_ sign_extend 32) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6830 (buf!7298 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) ((_ sign_extend 32) (currentByte!13471 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11)))) ((_ sign_extend 32) (currentBit!13466 (BitStream!12475 (buf!7298 bs2!19) (currentByte!13471 bs1!11) (currentBit!13466 bs1!11))))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23912 () Bool)

(assert (= bs!23912 d!94830))

(assert (=> bs!23912 m!408649))

(assert (=> d!94818 d!94830))

(declare-fun d!94832 () Bool)

(declare-fun res!229250 () Bool)

(declare-fun e!195803 () Bool)

(assert (=> d!94832 (=> res!229250 e!195803)))

(assert (=> d!94832 (= res!229250 (= (bvadd (_1!12279 lt!413786) #b00000000000000000000000000000001) (_2!12279 lt!413786)))))

(assert (=> d!94832 (= (arrayRangesEq!1147 (buf!7298 bs1!11) (buf!7298 bs2!19) (bvadd (_1!12279 lt!413786) #b00000000000000000000000000000001) (_2!12279 lt!413786)) e!195803)))

(declare-fun b!275845 () Bool)

(declare-fun e!195804 () Bool)

(assert (=> b!275845 (= e!195803 e!195804)))

(declare-fun res!229251 () Bool)

(assert (=> b!275845 (=> (not res!229251) (not e!195804))))

(assert (=> b!275845 (= res!229251 (= (select (arr!7817 (buf!7298 bs1!11)) (bvadd (_1!12279 lt!413786) #b00000000000000000000000000000001)) (select (arr!7817 (buf!7298 bs2!19)) (bvadd (_1!12279 lt!413786) #b00000000000000000000000000000001))))))

(declare-fun b!275846 () Bool)

(assert (=> b!275846 (= e!195804 (arrayRangesEq!1147 (buf!7298 bs1!11) (buf!7298 bs2!19) (bvadd (_1!12279 lt!413786) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!12279 lt!413786)))))

(assert (= (and d!94832 (not res!229250)) b!275845))

(assert (= (and b!275845 res!229251) b!275846))

(declare-fun m!408655 () Bool)

(assert (=> b!275845 m!408655))

(declare-fun m!408657 () Bool)

(assert (=> b!275845 m!408657))

(declare-fun m!408659 () Bool)

(assert (=> b!275846 m!408659))

(assert (=> b!275826 d!94832))

(check-sat (not d!94822) (not d!94828) (not d!94824) (not d!94830) (not b!275837) (not b!275841) (not b!275846) (not d!94820) (not d!94826))
(check-sat)

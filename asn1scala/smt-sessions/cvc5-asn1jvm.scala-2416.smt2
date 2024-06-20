; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61576 () Bool)

(assert start!61576)

(declare-fun res!229797 () Bool)

(declare-fun e!196526 () Bool)

(assert (=> start!61576 (=> (not res!229797) (not e!196526))))

(declare-datatypes ((array!15829 0))(
  ( (array!15830 (arr!7846 (Array (_ BitVec 32) (_ BitVec 8))) (size!6853 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12520 0))(
  ( (BitStream!12521 (buf!7321 array!15829) (currentByte!13550 (_ BitVec 32)) (currentBit!13545 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12520)

(declare-fun bs2!19 () BitStream!12520)

(assert (=> start!61576 (= res!229797 (= (size!6853 (buf!7321 bs1!11)) (size!6853 (buf!7321 bs2!19))))))

(assert (=> start!61576 e!196526))

(declare-fun e!196525 () Bool)

(declare-fun inv!12 (BitStream!12520) Bool)

(assert (=> start!61576 (and (inv!12 bs1!11) e!196525)))

(declare-fun e!196521 () Bool)

(assert (=> start!61576 (and (inv!12 bs2!19) e!196521)))

(declare-fun b!276593 () Bool)

(declare-fun array_inv!6577 (array!15829) Bool)

(assert (=> b!276593 (= e!196521 (array_inv!6577 (buf!7321 bs2!19)))))

(declare-fun b!276594 () Bool)

(declare-fun res!229796 () Bool)

(assert (=> b!276594 (=> (not res!229796) (not e!196526))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276594 (= res!229796 (validate_offset_bit!0 ((_ sign_extend 32) (size!6853 (buf!7321 bs1!11))) ((_ sign_extend 32) (currentByte!13550 bs1!11)) ((_ sign_extend 32) (currentBit!13545 bs1!11))))))

(declare-fun b!276595 () Bool)

(declare-fun e!196522 () Bool)

(assert (=> b!276595 (= e!196526 e!196522)))

(declare-fun res!229798 () Bool)

(assert (=> b!276595 (=> (not res!229798) (not e!196522))))

(declare-fun lt!414746 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!15829 array!15829 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276595 (= res!229798 (arrayBitRangesEq!0 (buf!7321 bs1!11) (buf!7321 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414746))))

(declare-fun lt!414745 () (_ BitVec 64))

(assert (=> b!276595 (= lt!414746 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414745))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276595 (= lt!414745 (bitIndex!0 (size!6853 (buf!7321 bs1!11)) (currentByte!13550 bs1!11) (currentBit!13545 bs1!11)))))

(declare-fun b!276596 () Bool)

(assert (=> b!276596 (= e!196525 (array_inv!6577 (buf!7321 bs1!11)))))

(declare-fun b!276597 () Bool)

(assert (=> b!276597 (= e!196522 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414746) (bvsgt lt!414746 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6853 (buf!7321 bs1!11))))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414745) (bvslt lt!414745 lt!414746)))))))

(declare-datatypes ((tuple2!22554 0))(
  ( (tuple2!22555 (_1!12324 BitStream!12520) (_2!12324 Bool)) )
))
(declare-fun lt!414747 () tuple2!22554)

(declare-fun readBitPure!0 (BitStream!12520) tuple2!22554)

(assert (=> b!276597 (= lt!414747 (readBitPure!0 (BitStream!12521 (buf!7321 bs2!19) (currentByte!13550 bs1!11) (currentBit!13545 bs1!11))))))

(declare-fun lt!414744 () tuple2!22554)

(assert (=> b!276597 (= lt!414744 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276597 (invariant!0 (currentBit!13545 bs1!11) (currentByte!13550 bs1!11) (size!6853 (buf!7321 bs2!19)))))

(assert (= (and start!61576 res!229797) b!276594))

(assert (= (and b!276594 res!229796) b!276595))

(assert (= (and b!276595 res!229798) b!276597))

(assert (= start!61576 b!276596))

(assert (= start!61576 b!276593))

(declare-fun m!409625 () Bool)

(assert (=> b!276597 m!409625))

(declare-fun m!409627 () Bool)

(assert (=> b!276597 m!409627))

(declare-fun m!409629 () Bool)

(assert (=> b!276597 m!409629))

(declare-fun m!409631 () Bool)

(assert (=> b!276596 m!409631))

(declare-fun m!409633 () Bool)

(assert (=> start!61576 m!409633))

(declare-fun m!409635 () Bool)

(assert (=> start!61576 m!409635))

(declare-fun m!409637 () Bool)

(assert (=> b!276595 m!409637))

(declare-fun m!409639 () Bool)

(assert (=> b!276595 m!409639))

(declare-fun m!409641 () Bool)

(assert (=> b!276594 m!409641))

(declare-fun m!409643 () Bool)

(assert (=> b!276593 m!409643))

(push 1)

(assert (not b!276597))

(assert (not b!276595))

(assert (not b!276594))

(assert (not b!276596))

(assert (not start!61576))

(assert (not b!276593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95272 () Bool)

(assert (=> d!95272 (= (array_inv!6577 (buf!7321 bs2!19)) (bvsge (size!6853 (buf!7321 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276593 d!95272))

(declare-fun d!95274 () Bool)

(declare-datatypes ((tuple2!22560 0))(
  ( (tuple2!22561 (_1!12327 Bool) (_2!12327 BitStream!12520)) )
))
(declare-fun lt!414774 () tuple2!22560)

(declare-fun readBit!0 (BitStream!12520) tuple2!22560)

(assert (=> d!95274 (= lt!414774 (readBit!0 (BitStream!12521 (buf!7321 bs2!19) (currentByte!13550 bs1!11) (currentBit!13545 bs1!11))))))

(assert (=> d!95274 (= (readBitPure!0 (BitStream!12521 (buf!7321 bs2!19) (currentByte!13550 bs1!11) (currentBit!13545 bs1!11))) (tuple2!22555 (_2!12327 lt!414774) (_1!12327 lt!414774)))))

(declare-fun bs!24030 () Bool)

(assert (= bs!24030 d!95274))

(declare-fun m!409685 () Bool)

(assert (=> bs!24030 m!409685))

(assert (=> b!276597 d!95274))

(declare-fun d!95276 () Bool)

(declare-fun lt!414775 () tuple2!22560)

(assert (=> d!95276 (= lt!414775 (readBit!0 bs1!11))))

(assert (=> d!95276 (= (readBitPure!0 bs1!11) (tuple2!22555 (_2!12327 lt!414775) (_1!12327 lt!414775)))))

(declare-fun bs!24031 () Bool)

(assert (= bs!24031 d!95276))

(declare-fun m!409687 () Bool)

(assert (=> bs!24031 m!409687))

(assert (=> b!276597 d!95276))

(declare-fun d!95278 () Bool)

(assert (=> d!95278 (= (invariant!0 (currentBit!13545 bs1!11) (currentByte!13550 bs1!11) (size!6853 (buf!7321 bs2!19))) (and (bvsge (currentBit!13545 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13545 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13550 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13550 bs1!11) (size!6853 (buf!7321 bs2!19))) (and (= (currentBit!13545 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13550 bs1!11) (size!6853 (buf!7321 bs2!19)))))))))

(assert (=> b!276597 d!95278))

(declare-fun d!95280 () Bool)

(assert (=> d!95280 (= (inv!12 bs1!11) (invariant!0 (currentBit!13545 bs1!11) (currentByte!13550 bs1!11) (size!6853 (buf!7321 bs1!11))))))

(declare-fun bs!24032 () Bool)

(assert (= bs!24032 d!95280))

(declare-fun m!409689 () Bool)

(assert (=> bs!24032 m!409689))

(assert (=> start!61576 d!95280))

(declare-fun d!95284 () Bool)

(assert (=> d!95284 (= (inv!12 bs2!19) (invariant!0 (currentBit!13545 bs2!19) (currentByte!13550 bs2!19) (size!6853 (buf!7321 bs2!19))))))

(declare-fun bs!24033 () Bool)

(assert (= bs!24033 d!95284))

(declare-fun m!409691 () Bool)

(assert (=> bs!24033 m!409691))

(assert (=> start!61576 d!95284))

(declare-fun d!95286 () Bool)

(assert (=> d!95286 (= (array_inv!6577 (buf!7321 bs1!11)) (bvsge (size!6853 (buf!7321 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276596 d!95286))

(declare-fun b!276654 () Bool)

(declare-fun e!196586 () Bool)

(declare-fun e!196589 () Bool)

(assert (=> b!276654 (= e!196586 e!196589)))

(declare-fun res!229835 () Bool)

(assert (=> b!276654 (=> (not res!229835) (not e!196589))))

(declare-fun e!196588 () Bool)

(assert (=> b!276654 (= res!229835 e!196588)))

(declare-fun res!229836 () Bool)

(assert (=> b!276654 (=> res!229836 e!196588)))

(declare-datatypes ((tuple4!534 0))(
  ( (tuple4!535 (_1!12328 (_ BitVec 32)) (_2!12328 (_ BitVec 32)) (_3!1047 (_ BitVec 32)) (_4!267 (_ BitVec 32))) )
))
(declare-fun lt!414789 () tuple4!534)

(assert (=> b!276654 (= res!229836 (bvsge (_1!12328 lt!414789) (_2!12328 lt!414789)))))

(declare-fun lt!414788 () (_ BitVec 32))

(assert (=> b!276654 (= lt!414788 ((_ extract 31 0) (bvsrem lt!414746 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!414790 () (_ BitVec 32))

(assert (=> b!276654 (= lt!414790 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!534)

(assert (=> b!276654 (= lt!414789 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414746))))

(declare-fun d!95288 () Bool)

(declare-fun res!229839 () Bool)

(assert (=> d!95288 (=> res!229839 e!196586)))

(assert (=> d!95288 (= res!229839 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414746))))

(assert (=> d!95288 (= (arrayBitRangesEq!0 (buf!7321 bs1!11) (buf!7321 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414746) e!196586)))

(declare-fun b!276655 () Bool)

(declare-fun e!196585 () Bool)

(declare-fun e!196587 () Bool)

(assert (=> b!276655 (= e!196585 e!196587)))

(declare-fun res!229837 () Bool)

(declare-fun call!4457 () Bool)

(assert (=> b!276655 (= res!229837 call!4457)))

(assert (=> b!276655 (=> (not res!229837) (not e!196587))))

(declare-fun b!276656 () Bool)

(assert (=> b!276656 (= e!196589 e!196585)))

(declare-fun c!12644 () Bool)

(assert (=> b!276656 (= c!12644 (= (_3!1047 lt!414789) (_4!267 lt!414789)))))

(declare-fun b!276657 () Bool)

(assert (=> b!276657 (= e!196585 call!4457)))

(declare-fun b!276658 () Bool)

(declare-fun arrayRangesEq!1161 (array!15829 array!15829 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276658 (= e!196588 (arrayRangesEq!1161 (buf!7321 bs1!11) (buf!7321 bs2!19) (_1!12328 lt!414789) (_2!12328 lt!414789)))))

(declare-fun b!276659 () Bool)

(declare-fun e!196590 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276659 (= e!196590 (byteRangesEq!0 (select (arr!7846 (buf!7321 bs1!11)) (_4!267 lt!414789)) (select (arr!7846 (buf!7321 bs2!19)) (_4!267 lt!414789)) #b00000000000000000000000000000000 lt!414788))))

(declare-fun b!276660 () Bool)

(declare-fun res!229838 () Bool)

(assert (=> b!276660 (= res!229838 (= lt!414788 #b00000000000000000000000000000000))))

(assert (=> b!276660 (=> res!229838 e!196590)))

(assert (=> b!276660 (= e!196587 e!196590)))

(declare-fun bm!4454 () Bool)

(assert (=> bm!4454 (= call!4457 (byteRangesEq!0 (select (arr!7846 (buf!7321 bs1!11)) (_3!1047 lt!414789)) (select (arr!7846 (buf!7321 bs2!19)) (_3!1047 lt!414789)) lt!414790 (ite c!12644 lt!414788 #b00000000000000000000000000001000)))))

(assert (= (and d!95288 (not res!229839)) b!276654))

(assert (= (and b!276654 (not res!229836)) b!276658))

(assert (= (and b!276654 res!229835) b!276656))

(assert (= (and b!276656 c!12644) b!276657))

(assert (= (and b!276656 (not c!12644)) b!276655))

(assert (= (and b!276655 res!229837) b!276660))

(assert (= (and b!276660 (not res!229838)) b!276659))

(assert (= (or b!276657 b!276655) bm!4454))

(declare-fun m!409695 () Bool)

(assert (=> b!276654 m!409695))

(declare-fun m!409697 () Bool)

(assert (=> b!276658 m!409697))

(declare-fun m!409699 () Bool)

(assert (=> b!276659 m!409699))

(declare-fun m!409701 () Bool)

(assert (=> b!276659 m!409701))

(assert (=> b!276659 m!409699))

(assert (=> b!276659 m!409701))

(declare-fun m!409703 () Bool)

(assert (=> b!276659 m!409703))

(declare-fun m!409705 () Bool)

(assert (=> bm!4454 m!409705))

(declare-fun m!409707 () Bool)

(assert (=> bm!4454 m!409707))

(assert (=> bm!4454 m!409705))

(assert (=> bm!4454 m!409707))

(declare-fun m!409709 () Bool)

(assert (=> bm!4454 m!409709))

(assert (=> b!276595 d!95288))

(declare-fun d!95296 () Bool)

(declare-fun e!196613 () Bool)

(assert (=> d!95296 e!196613))

(declare-fun res!229862 () Bool)

(assert (=> d!95296 (=> (not res!229862) (not e!196613))))

(declare-fun lt!414812 () (_ BitVec 64))

(declare-fun lt!414813 () (_ BitVec 64))

(declare-fun lt!414816 () (_ BitVec 64))

(assert (=> d!95296 (= res!229862 (= lt!414816 (bvsub lt!414812 lt!414813)))))

(assert (=> d!95296 (or (= (bvand lt!414812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414813 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414812 lt!414813) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95296 (= lt!414813 (remainingBits!0 ((_ sign_extend 32) (size!6853 (buf!7321 bs1!11))) ((_ sign_extend 32) (currentByte!13550 bs1!11)) ((_ sign_extend 32) (currentBit!13545 bs1!11))))))

(declare-fun lt!414815 () (_ BitVec 64))

(declare-fun lt!414817 () (_ BitVec 64))

(assert (=> d!95296 (= lt!414812 (bvmul lt!414815 lt!414817))))

(assert (=> d!95296 (or (= lt!414815 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414817 (bvsdiv (bvmul lt!414815 lt!414817) lt!414815)))))

(assert (=> d!95296 (= lt!414817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95296 (= lt!414815 ((_ sign_extend 32) (size!6853 (buf!7321 bs1!11))))))

(assert (=> d!95296 (= lt!414816 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13550 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13545 bs1!11))))))

(assert (=> d!95296 (invariant!0 (currentBit!13545 bs1!11) (currentByte!13550 bs1!11) (size!6853 (buf!7321 bs1!11)))))

(assert (=> d!95296 (= (bitIndex!0 (size!6853 (buf!7321 bs1!11)) (currentByte!13550 bs1!11) (currentBit!13545 bs1!11)) lt!414816)))

(declare-fun b!276688 () Bool)

(declare-fun res!229861 () Bool)

(assert (=> b!276688 (=> (not res!229861) (not e!196613))))

(assert (=> b!276688 (= res!229861 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414816))))

(declare-fun b!276689 () Bool)

(declare-fun lt!414814 () (_ BitVec 64))

(assert (=> b!276689 (= e!196613 (bvsle lt!414816 (bvmul lt!414814 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276689 (or (= lt!414814 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414814 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414814)))))

(assert (=> b!276689 (= lt!414814 ((_ sign_extend 32) (size!6853 (buf!7321 bs1!11))))))

(assert (= (and d!95296 res!229862) b!276688))

(assert (= (and b!276688 res!229861) b!276689))

(declare-fun m!409727 () Bool)

(assert (=> d!95296 m!409727))

(assert (=> d!95296 m!409689))

(assert (=> b!276595 d!95296))

(declare-fun d!95300 () Bool)

(assert (=> d!95300 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6853 (buf!7321 bs1!11))) ((_ sign_extend 32) (currentByte!13550 bs1!11)) ((_ sign_extend 32) (currentBit!13545 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6853 (buf!7321 bs1!11))) ((_ sign_extend 32) (currentByte!13550 bs1!11)) ((_ sign_extend 32) (currentBit!13545 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24035 () Bool)

(assert (= bs!24035 d!95300))

(assert (=> bs!24035 m!409727))

(assert (=> b!276594 d!95300))

(push 1)

(assert (not d!95274))

(assert (not d!95300))

(assert (not b!276654))

(assert (not d!95284))

(assert (not d!95276))

(assert (not b!276659))

(assert (not bm!4454))

(assert (not d!95296))

(assert (not d!95280))

(assert (not b!276658))

(check-sat)

(pop 1)

(push 1)

(check-sat)


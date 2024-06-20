; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30096 () Bool)

(assert start!30096)

(declare-fun b!154431 () Bool)

(declare-fun e!103816 () Bool)

(declare-datatypes ((array!6991 0))(
  ( (array!6992 (arr!3972 (Array (_ BitVec 32) (_ BitVec 8))) (size!3149 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5556 0))(
  ( (BitStream!5557 (buf!3652 array!6991) (currentByte!6674 (_ BitVec 32)) (currentBit!6669 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5556)

(declare-fun array_inv!2938 (array!6991) Bool)

(assert (=> b!154431 (= e!103816 (array_inv!2938 (buf!3652 bs1!10)))))

(declare-fun res!129247 () Bool)

(declare-fun e!103817 () Bool)

(assert (=> start!30096 (=> (not res!129247) (not e!103817))))

(declare-fun bs2!18 () BitStream!5556)

(assert (=> start!30096 (= res!129247 (= (size!3149 (buf!3652 bs1!10)) (size!3149 (buf!3652 bs2!18))))))

(assert (=> start!30096 e!103817))

(declare-fun inv!12 (BitStream!5556) Bool)

(assert (=> start!30096 (and (inv!12 bs1!10) e!103816)))

(declare-fun e!103821 () Bool)

(assert (=> start!30096 (and (inv!12 bs2!18) e!103821)))

(declare-fun b!154432 () Bool)

(declare-fun e!103819 () Bool)

(declare-fun lt!240785 () (_ BitVec 64))

(assert (=> b!154432 (= e!103819 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240785 #b0000000000000000000000000000000000000000000000000000000000001000)) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((tuple2!13680 0))(
  ( (tuple2!13681 (_1!7239 BitStream!5556) (_2!7239 (_ BitVec 8))) )
))
(declare-fun lt!240784 () tuple2!13680)

(declare-fun readBytePure!0 (BitStream!5556) tuple2!13680)

(assert (=> b!154432 (= lt!240784 (readBytePure!0 (BitStream!5557 (buf!3652 bs2!18) (currentByte!6674 bs1!10) (currentBit!6669 bs1!10))))))

(declare-fun lt!240787 () tuple2!13680)

(assert (=> b!154432 (= lt!240787 (readBytePure!0 bs1!10))))

(declare-fun b!154433 () Bool)

(declare-fun res!129246 () Bool)

(assert (=> b!154433 (=> (not res!129246) (not e!103819))))

(declare-fun lt!240786 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154433 (= res!129246 (bvsle lt!240786 (bitIndex!0 (size!3149 (buf!3652 bs2!18)) (currentByte!6674 bs2!18) (currentBit!6669 bs2!18))))))

(declare-fun b!154434 () Bool)

(declare-fun res!129248 () Bool)

(assert (=> b!154434 (=> (not res!129248) (not e!103819))))

(declare-fun arrayBitRangesEq!0 (array!6991 array!6991 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154434 (= res!129248 (arrayBitRangesEq!0 (buf!3652 bs1!10) (buf!3652 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240786))))

(declare-fun b!154435 () Bool)

(assert (=> b!154435 (= e!103817 e!103819)))

(declare-fun res!129249 () Bool)

(assert (=> b!154435 (=> (not res!129249) (not e!103819))))

(assert (=> b!154435 (= res!129249 (bvsle lt!240786 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3149 (buf!3652 bs1!10))))))))

(assert (=> b!154435 (= lt!240786 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240785))))

(assert (=> b!154435 (= lt!240785 (bitIndex!0 (size!3149 (buf!3652 bs1!10)) (currentByte!6674 bs1!10) (currentBit!6669 bs1!10)))))

(declare-fun b!154436 () Bool)

(assert (=> b!154436 (= e!103821 (array_inv!2938 (buf!3652 bs2!18)))))

(assert (= (and start!30096 res!129247) b!154435))

(assert (= (and b!154435 res!129249) b!154433))

(assert (= (and b!154433 res!129246) b!154434))

(assert (= (and b!154434 res!129248) b!154432))

(assert (= start!30096 b!154431))

(assert (= start!30096 b!154436))

(declare-fun m!240397 () Bool)

(assert (=> start!30096 m!240397))

(declare-fun m!240399 () Bool)

(assert (=> start!30096 m!240399))

(declare-fun m!240401 () Bool)

(assert (=> b!154432 m!240401))

(declare-fun m!240403 () Bool)

(assert (=> b!154432 m!240403))

(declare-fun m!240405 () Bool)

(assert (=> b!154434 m!240405))

(declare-fun m!240407 () Bool)

(assert (=> b!154431 m!240407))

(declare-fun m!240409 () Bool)

(assert (=> b!154436 m!240409))

(declare-fun m!240411 () Bool)

(assert (=> b!154433 m!240411))

(declare-fun m!240413 () Bool)

(assert (=> b!154435 m!240413))

(check-sat (not b!154431) (not b!154435) (not b!154436) (not b!154432) (not b!154433) (not start!30096) (not b!154434))
(check-sat)
(get-model)

(declare-fun d!50890 () Bool)

(declare-fun res!129281 () Bool)

(declare-fun e!103857 () Bool)

(assert (=> d!50890 (=> res!129281 e!103857)))

(assert (=> d!50890 (= res!129281 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240786))))

(assert (=> d!50890 (= (arrayBitRangesEq!0 (buf!3652 bs1!10) (buf!3652 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240786) e!103857)))

(declare-fun b!154475 () Bool)

(declare-fun res!129279 () Bool)

(declare-fun lt!240824 () (_ BitVec 32))

(assert (=> b!154475 (= res!129279 (= lt!240824 #b00000000000000000000000000000000))))

(declare-fun e!103858 () Bool)

(assert (=> b!154475 (=> res!129279 e!103858)))

(declare-fun e!103860 () Bool)

(assert (=> b!154475 (= e!103860 e!103858)))

(declare-fun b!154476 () Bool)

(declare-fun call!2198 () Bool)

(assert (=> b!154476 (= e!103858 call!2198)))

(declare-fun lt!240826 () (_ BitVec 32))

(declare-datatypes ((tuple4!192 0))(
  ( (tuple4!193 (_1!7241 (_ BitVec 32)) (_2!7241 (_ BitVec 32)) (_3!399 (_ BitVec 32)) (_4!96 (_ BitVec 32))) )
))
(declare-fun lt!240825 () tuple4!192)

(declare-fun c!8214 () Bool)

(declare-fun bm!2195 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2195 (= call!2198 (byteRangesEq!0 (ite c!8214 (select (arr!3972 (buf!3652 bs1!10)) (_3!399 lt!240825)) (select (arr!3972 (buf!3652 bs1!10)) (_4!96 lt!240825))) (ite c!8214 (select (arr!3972 (buf!3652 bs2!18)) (_3!399 lt!240825)) (select (arr!3972 (buf!3652 bs2!18)) (_4!96 lt!240825))) (ite c!8214 lt!240826 #b00000000000000000000000000000000) lt!240824))))

(declare-fun b!154477 () Bool)

(declare-fun e!103859 () Bool)

(declare-fun arrayRangesEq!389 (array!6991 array!6991 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154477 (= e!103859 (arrayRangesEq!389 (buf!3652 bs1!10) (buf!3652 bs2!18) (_1!7241 lt!240825) (_2!7241 lt!240825)))))

(declare-fun b!154478 () Bool)

(declare-fun e!103856 () Bool)

(assert (=> b!154478 (= e!103857 e!103856)))

(declare-fun res!129278 () Bool)

(assert (=> b!154478 (=> (not res!129278) (not e!103856))))

(assert (=> b!154478 (= res!129278 e!103859)))

(declare-fun res!129282 () Bool)

(assert (=> b!154478 (=> res!129282 e!103859)))

(assert (=> b!154478 (= res!129282 (bvsge (_1!7241 lt!240825) (_2!7241 lt!240825)))))

(assert (=> b!154478 (= lt!240824 ((_ extract 31 0) (bvsrem lt!240786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154478 (= lt!240826 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!192)

(assert (=> b!154478 (= lt!240825 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240786))))

(declare-fun b!154479 () Bool)

(declare-fun e!103855 () Bool)

(assert (=> b!154479 (= e!103855 call!2198)))

(declare-fun b!154480 () Bool)

(assert (=> b!154480 (= e!103855 e!103860)))

(declare-fun res!129280 () Bool)

(assert (=> b!154480 (= res!129280 (byteRangesEq!0 (select (arr!3972 (buf!3652 bs1!10)) (_3!399 lt!240825)) (select (arr!3972 (buf!3652 bs2!18)) (_3!399 lt!240825)) lt!240826 #b00000000000000000000000000001000))))

(assert (=> b!154480 (=> (not res!129280) (not e!103860))))

(declare-fun b!154481 () Bool)

(assert (=> b!154481 (= e!103856 e!103855)))

(assert (=> b!154481 (= c!8214 (= (_3!399 lt!240825) (_4!96 lt!240825)))))

(assert (= (and d!50890 (not res!129281)) b!154478))

(assert (= (and b!154478 (not res!129282)) b!154477))

(assert (= (and b!154478 res!129278) b!154481))

(assert (= (and b!154481 c!8214) b!154479))

(assert (= (and b!154481 (not c!8214)) b!154480))

(assert (= (and b!154480 res!129280) b!154475))

(assert (= (and b!154475 (not res!129279)) b!154476))

(assert (= (or b!154479 b!154476) bm!2195))

(declare-fun m!240437 () Bool)

(assert (=> bm!2195 m!240437))

(declare-fun m!240439 () Bool)

(assert (=> bm!2195 m!240439))

(declare-fun m!240441 () Bool)

(assert (=> bm!2195 m!240441))

(declare-fun m!240443 () Bool)

(assert (=> bm!2195 m!240443))

(declare-fun m!240445 () Bool)

(assert (=> bm!2195 m!240445))

(declare-fun m!240447 () Bool)

(assert (=> b!154477 m!240447))

(declare-fun m!240449 () Bool)

(assert (=> b!154478 m!240449))

(assert (=> b!154480 m!240439))

(assert (=> b!154480 m!240443))

(assert (=> b!154480 m!240439))

(assert (=> b!154480 m!240443))

(declare-fun m!240451 () Bool)

(assert (=> b!154480 m!240451))

(assert (=> b!154434 d!50890))

(declare-fun d!50898 () Bool)

(declare-fun e!103875 () Bool)

(assert (=> d!50898 e!103875))

(declare-fun res!129297 () Bool)

(assert (=> d!50898 (=> (not res!129297) (not e!103875))))

(declare-fun lt!240845 () (_ BitVec 64))

(declare-fun lt!240846 () (_ BitVec 64))

(declare-fun lt!240850 () (_ BitVec 64))

(assert (=> d!50898 (= res!129297 (= lt!240845 (bvsub lt!240850 lt!240846)))))

(assert (=> d!50898 (or (= (bvand lt!240850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240846 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240850 lt!240846) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50898 (= lt!240846 (remainingBits!0 ((_ sign_extend 32) (size!3149 (buf!3652 bs2!18))) ((_ sign_extend 32) (currentByte!6674 bs2!18)) ((_ sign_extend 32) (currentBit!6669 bs2!18))))))

(declare-fun lt!240848 () (_ BitVec 64))

(declare-fun lt!240847 () (_ BitVec 64))

(assert (=> d!50898 (= lt!240850 (bvmul lt!240848 lt!240847))))

(assert (=> d!50898 (or (= lt!240848 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240847 (bvsdiv (bvmul lt!240848 lt!240847) lt!240848)))))

(assert (=> d!50898 (= lt!240847 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50898 (= lt!240848 ((_ sign_extend 32) (size!3149 (buf!3652 bs2!18))))))

(assert (=> d!50898 (= lt!240845 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6674 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6669 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50898 (invariant!0 (currentBit!6669 bs2!18) (currentByte!6674 bs2!18) (size!3149 (buf!3652 bs2!18)))))

(assert (=> d!50898 (= (bitIndex!0 (size!3149 (buf!3652 bs2!18)) (currentByte!6674 bs2!18) (currentBit!6669 bs2!18)) lt!240845)))

(declare-fun b!154500 () Bool)

(declare-fun res!129298 () Bool)

(assert (=> b!154500 (=> (not res!129298) (not e!103875))))

(assert (=> b!154500 (= res!129298 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240845))))

(declare-fun b!154501 () Bool)

(declare-fun lt!240849 () (_ BitVec 64))

(assert (=> b!154501 (= e!103875 (bvsle lt!240845 (bvmul lt!240849 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154501 (or (= lt!240849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240849)))))

(assert (=> b!154501 (= lt!240849 ((_ sign_extend 32) (size!3149 (buf!3652 bs2!18))))))

(assert (= (and d!50898 res!129297) b!154500))

(assert (= (and b!154500 res!129298) b!154501))

(declare-fun m!240453 () Bool)

(assert (=> d!50898 m!240453))

(declare-fun m!240455 () Bool)

(assert (=> d!50898 m!240455))

(assert (=> b!154433 d!50898))

(declare-fun d!50902 () Bool)

(declare-fun e!103876 () Bool)

(assert (=> d!50902 e!103876))

(declare-fun res!129299 () Bool)

(assert (=> d!50902 (=> (not res!129299) (not e!103876))))

(declare-fun lt!240851 () (_ BitVec 64))

(declare-fun lt!240856 () (_ BitVec 64))

(declare-fun lt!240852 () (_ BitVec 64))

(assert (=> d!50902 (= res!129299 (= lt!240851 (bvsub lt!240856 lt!240852)))))

(assert (=> d!50902 (or (= (bvand lt!240856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240856 lt!240852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50902 (= lt!240852 (remainingBits!0 ((_ sign_extend 32) (size!3149 (buf!3652 bs1!10))) ((_ sign_extend 32) (currentByte!6674 bs1!10)) ((_ sign_extend 32) (currentBit!6669 bs1!10))))))

(declare-fun lt!240854 () (_ BitVec 64))

(declare-fun lt!240853 () (_ BitVec 64))

(assert (=> d!50902 (= lt!240856 (bvmul lt!240854 lt!240853))))

(assert (=> d!50902 (or (= lt!240854 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240853 (bvsdiv (bvmul lt!240854 lt!240853) lt!240854)))))

(assert (=> d!50902 (= lt!240853 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50902 (= lt!240854 ((_ sign_extend 32) (size!3149 (buf!3652 bs1!10))))))

(assert (=> d!50902 (= lt!240851 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6674 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6669 bs1!10))))))

(assert (=> d!50902 (invariant!0 (currentBit!6669 bs1!10) (currentByte!6674 bs1!10) (size!3149 (buf!3652 bs1!10)))))

(assert (=> d!50902 (= (bitIndex!0 (size!3149 (buf!3652 bs1!10)) (currentByte!6674 bs1!10) (currentBit!6669 bs1!10)) lt!240851)))

(declare-fun b!154502 () Bool)

(declare-fun res!129300 () Bool)

(assert (=> b!154502 (=> (not res!129300) (not e!103876))))

(assert (=> b!154502 (= res!129300 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240851))))

(declare-fun b!154503 () Bool)

(declare-fun lt!240855 () (_ BitVec 64))

(assert (=> b!154503 (= e!103876 (bvsle lt!240851 (bvmul lt!240855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154503 (or (= lt!240855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240855)))))

(assert (=> b!154503 (= lt!240855 ((_ sign_extend 32) (size!3149 (buf!3652 bs1!10))))))

(assert (= (and d!50902 res!129299) b!154502))

(assert (= (and b!154502 res!129300) b!154503))

(declare-fun m!240457 () Bool)

(assert (=> d!50902 m!240457))

(declare-fun m!240459 () Bool)

(assert (=> d!50902 m!240459))

(assert (=> b!154435 d!50902))

(declare-fun d!50904 () Bool)

(assert (=> d!50904 (= (inv!12 bs1!10) (invariant!0 (currentBit!6669 bs1!10) (currentByte!6674 bs1!10) (size!3149 (buf!3652 bs1!10))))))

(declare-fun bs!12452 () Bool)

(assert (= bs!12452 d!50904))

(assert (=> bs!12452 m!240459))

(assert (=> start!30096 d!50904))

(declare-fun d!50906 () Bool)

(assert (=> d!50906 (= (inv!12 bs2!18) (invariant!0 (currentBit!6669 bs2!18) (currentByte!6674 bs2!18) (size!3149 (buf!3652 bs2!18))))))

(declare-fun bs!12453 () Bool)

(assert (= bs!12453 d!50906))

(assert (=> bs!12453 m!240455))

(assert (=> start!30096 d!50906))

(declare-fun d!50908 () Bool)

(assert (=> d!50908 (= (array_inv!2938 (buf!3652 bs1!10)) (bvsge (size!3149 (buf!3652 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154431 d!50908))

(declare-fun d!50910 () Bool)

(assert (=> d!50910 (= (array_inv!2938 (buf!3652 bs2!18)) (bvsge (size!3149 (buf!3652 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154436 d!50910))

(declare-fun d!50912 () Bool)

(declare-datatypes ((tuple2!13684 0))(
  ( (tuple2!13685 (_1!7244 (_ BitVec 8)) (_2!7244 BitStream!5556)) )
))
(declare-fun lt!240868 () tuple2!13684)

(declare-fun readByte!0 (BitStream!5556) tuple2!13684)

(assert (=> d!50912 (= lt!240868 (readByte!0 (BitStream!5557 (buf!3652 bs2!18) (currentByte!6674 bs1!10) (currentBit!6669 bs1!10))))))

(assert (=> d!50912 (= (readBytePure!0 (BitStream!5557 (buf!3652 bs2!18) (currentByte!6674 bs1!10) (currentBit!6669 bs1!10))) (tuple2!13681 (_2!7244 lt!240868) (_1!7244 lt!240868)))))

(declare-fun bs!12456 () Bool)

(assert (= bs!12456 d!50912))

(declare-fun m!240479 () Bool)

(assert (=> bs!12456 m!240479))

(assert (=> b!154432 d!50912))

(declare-fun d!50920 () Bool)

(declare-fun lt!240875 () tuple2!13684)

(assert (=> d!50920 (= lt!240875 (readByte!0 bs1!10))))

(assert (=> d!50920 (= (readBytePure!0 bs1!10) (tuple2!13681 (_2!7244 lt!240875) (_1!7244 lt!240875)))))

(declare-fun bs!12457 () Bool)

(assert (= bs!12457 d!50920))

(declare-fun m!240481 () Bool)

(assert (=> bs!12457 m!240481))

(assert (=> b!154432 d!50920))

(check-sat (not d!50904) (not b!154478) (not d!50920) (not d!50898) (not b!154480) (not b!154477) (not bm!2195) (not d!50906) (not d!50902) (not d!50912))

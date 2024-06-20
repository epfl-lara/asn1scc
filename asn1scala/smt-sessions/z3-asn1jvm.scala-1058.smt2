; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30356 () Bool)

(assert start!30356)

(declare-fun b!155411 () Bool)

(declare-fun e!104667 () Bool)

(declare-fun e!104666 () Bool)

(assert (=> b!155411 (= e!104667 e!104666)))

(declare-fun res!129998 () Bool)

(assert (=> b!155411 (=> (not res!129998) (not e!104666))))

(declare-fun lt!241827 () (_ BitVec 32))

(declare-datatypes ((array!7051 0))(
  ( (array!7052 (arr!3993 (Array (_ BitVec 32) (_ BitVec 8))) (size!3170 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5598 0))(
  ( (BitStream!5599 (buf!3673 array!7051) (currentByte!6719 (_ BitVec 32)) (currentBit!6714 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5598)

(assert (=> b!155411 (= res!129998 (and (bvsle #b00000000000000000000000000000000 lt!241827) (bvsle lt!241827 (size!3170 (buf!3673 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6719 bs1!10)) (bvslt (currentByte!6719 bs1!10) lt!241827)))))

(declare-fun lt!241828 () (_ BitVec 64))

(assert (=> b!155411 (= lt!241827 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241828 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13764 0))(
  ( (tuple2!13765 (_1!7299 BitStream!5598) (_2!7299 (_ BitVec 8))) )
))
(declare-fun lt!241824 () tuple2!13764)

(declare-fun bs2!18 () BitStream!5598)

(declare-fun readBytePure!0 (BitStream!5598) tuple2!13764)

(assert (=> b!155411 (= lt!241824 (readBytePure!0 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))))))

(declare-fun lt!241825 () tuple2!13764)

(assert (=> b!155411 (= lt!241825 (readBytePure!0 bs1!10))))

(declare-fun b!155412 () Bool)

(declare-fun res!130001 () Bool)

(assert (=> b!155412 (=> (not res!130001) (not e!104667))))

(declare-fun lt!241823 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155412 (= res!130001 (bvsle lt!241823 (bitIndex!0 (size!3170 (buf!3673 bs2!18)) (currentByte!6719 bs2!18) (currentBit!6714 bs2!18))))))

(declare-fun b!155413 () Bool)

(declare-fun res!129996 () Bool)

(assert (=> b!155413 (=> (not res!129996) (not e!104666))))

(declare-fun arrayRangesEq!408 (array!7051 array!7051 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155413 (= res!129996 (arrayRangesEq!408 (buf!3673 bs1!10) (buf!3673 bs2!18) #b00000000000000000000000000000000 lt!241827))))

(declare-fun b!155414 () Bool)

(declare-fun res!129999 () Bool)

(assert (=> b!155414 (=> (not res!129999) (not e!104667))))

(declare-fun arrayBitRangesEq!0 (array!7051 array!7051 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155414 (= res!129999 (arrayBitRangesEq!0 (buf!3673 bs1!10) (buf!3673 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241823))))

(declare-fun b!155415 () Bool)

(declare-fun e!104665 () Bool)

(assert (=> b!155415 (= e!104665 (= (_2!7299 lt!241825) (_2!7299 lt!241824)))))

(declare-fun b!155416 () Bool)

(declare-fun e!104669 () Bool)

(declare-fun array_inv!2959 (array!7051) Bool)

(assert (=> b!155416 (= e!104669 (array_inv!2959 (buf!3673 bs1!10)))))

(declare-fun b!155417 () Bool)

(assert (=> b!155417 (= e!104666 (not e!104665))))

(declare-fun res!129997 () Bool)

(assert (=> b!155417 (=> (not res!129997) (not e!104665))))

(assert (=> b!155417 (= res!129997 (= (bitIndex!0 (size!3170 (buf!3673 (_1!7299 lt!241825))) (currentByte!6719 (_1!7299 lt!241825)) (currentBit!6714 (_1!7299 lt!241825))) (bitIndex!0 (size!3170 (buf!3673 (_1!7299 lt!241824))) (currentByte!6719 (_1!7299 lt!241824)) (currentBit!6714 (_1!7299 lt!241824)))))))

(assert (=> b!155417 (= (select (arr!3993 (buf!3673 bs1!10)) (currentByte!6719 bs1!10)) (select (arr!3993 (buf!3673 bs2!18)) (currentByte!6719 bs1!10)))))

(declare-datatypes ((Unit!9783 0))(
  ( (Unit!9784) )
))
(declare-fun lt!241826 () Unit!9783)

(declare-fun arrayRangesEqImpliesEq!28 (array!7051 array!7051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9783)

(assert (=> b!155417 (= lt!241826 (arrayRangesEqImpliesEq!28 (buf!3673 bs1!10) (buf!3673 bs2!18) #b00000000000000000000000000000000 (currentByte!6719 bs1!10) lt!241827))))

(declare-fun b!155418 () Bool)

(declare-fun e!104672 () Bool)

(assert (=> b!155418 (= e!104672 e!104667)))

(declare-fun res!129995 () Bool)

(assert (=> b!155418 (=> (not res!129995) (not e!104667))))

(assert (=> b!155418 (= res!129995 (bvsle lt!241823 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3170 (buf!3673 bs1!10))))))))

(assert (=> b!155418 (= lt!241823 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241828))))

(assert (=> b!155418 (= lt!241828 (bitIndex!0 (size!3170 (buf!3673 bs1!10)) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))))

(declare-fun res!130000 () Bool)

(assert (=> start!30356 (=> (not res!130000) (not e!104672))))

(assert (=> start!30356 (= res!130000 (= (size!3170 (buf!3673 bs1!10)) (size!3170 (buf!3673 bs2!18))))))

(assert (=> start!30356 e!104672))

(declare-fun inv!12 (BitStream!5598) Bool)

(assert (=> start!30356 (and (inv!12 bs1!10) e!104669)))

(declare-fun e!104668 () Bool)

(assert (=> start!30356 (and (inv!12 bs2!18) e!104668)))

(declare-fun b!155419 () Bool)

(assert (=> b!155419 (= e!104668 (array_inv!2959 (buf!3673 bs2!18)))))

(assert (= (and start!30356 res!130000) b!155418))

(assert (= (and b!155418 res!129995) b!155412))

(assert (= (and b!155412 res!130001) b!155414))

(assert (= (and b!155414 res!129999) b!155411))

(assert (= (and b!155411 res!129998) b!155413))

(assert (= (and b!155413 res!129996) b!155417))

(assert (= (and b!155417 res!129997) b!155415))

(assert (= start!30356 b!155416))

(assert (= start!30356 b!155419))

(declare-fun m!241423 () Bool)

(assert (=> b!155411 m!241423))

(declare-fun m!241425 () Bool)

(assert (=> b!155411 m!241425))

(declare-fun m!241427 () Bool)

(assert (=> b!155412 m!241427))

(declare-fun m!241429 () Bool)

(assert (=> b!155414 m!241429))

(declare-fun m!241431 () Bool)

(assert (=> b!155417 m!241431))

(declare-fun m!241433 () Bool)

(assert (=> b!155417 m!241433))

(declare-fun m!241435 () Bool)

(assert (=> b!155417 m!241435))

(declare-fun m!241437 () Bool)

(assert (=> b!155417 m!241437))

(declare-fun m!241439 () Bool)

(assert (=> b!155417 m!241439))

(declare-fun m!241441 () Bool)

(assert (=> start!30356 m!241441))

(declare-fun m!241443 () Bool)

(assert (=> start!30356 m!241443))

(declare-fun m!241445 () Bool)

(assert (=> b!155416 m!241445))

(declare-fun m!241447 () Bool)

(assert (=> b!155413 m!241447))

(declare-fun m!241449 () Bool)

(assert (=> b!155418 m!241449))

(declare-fun m!241451 () Bool)

(assert (=> b!155419 m!241451))

(check-sat (not b!155412) (not b!155417) (not b!155418) (not b!155419) (not b!155413) (not start!30356) (not b!155416) (not b!155411) (not b!155414))
(check-sat)
(get-model)

(declare-fun d!51298 () Bool)

(assert (=> d!51298 (= (array_inv!2959 (buf!3673 bs1!10)) (bvsge (size!3170 (buf!3673 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155416 d!51298))

(declare-fun d!51300 () Bool)

(declare-datatypes ((tuple2!13768 0))(
  ( (tuple2!13769 (_1!7301 (_ BitVec 8)) (_2!7301 BitStream!5598)) )
))
(declare-fun lt!241849 () tuple2!13768)

(declare-fun readByte!0 (BitStream!5598) tuple2!13768)

(assert (=> d!51300 (= lt!241849 (readByte!0 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))))))

(assert (=> d!51300 (= (readBytePure!0 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) (tuple2!13765 (_2!7301 lt!241849) (_1!7301 lt!241849)))))

(declare-fun bs!12551 () Bool)

(assert (= bs!12551 d!51300))

(declare-fun m!241483 () Bool)

(assert (=> bs!12551 m!241483))

(assert (=> b!155411 d!51300))

(declare-fun d!51302 () Bool)

(declare-fun lt!241850 () tuple2!13768)

(assert (=> d!51302 (= lt!241850 (readByte!0 bs1!10))))

(assert (=> d!51302 (= (readBytePure!0 bs1!10) (tuple2!13765 (_2!7301 lt!241850) (_1!7301 lt!241850)))))

(declare-fun bs!12552 () Bool)

(assert (= bs!12552 d!51302))

(declare-fun m!241485 () Bool)

(assert (=> bs!12552 m!241485))

(assert (=> b!155411 d!51302))

(declare-fun b!155461 () Bool)

(declare-fun e!104713 () Bool)

(declare-fun e!104712 () Bool)

(assert (=> b!155461 (= e!104713 e!104712)))

(declare-fun c!8268 () Bool)

(declare-datatypes ((tuple4!228 0))(
  ( (tuple4!229 (_1!7302 (_ BitVec 32)) (_2!7302 (_ BitVec 32)) (_3!417 (_ BitVec 32)) (_4!114 (_ BitVec 32))) )
))
(declare-fun lt!241857 () tuple4!228)

(assert (=> b!155461 (= c!8268 (= (_3!417 lt!241857) (_4!114 lt!241857)))))

(declare-fun lt!241858 () (_ BitVec 32))

(declare-fun e!104710 () Bool)

(declare-fun b!155462 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155462 (= e!104710 (byteRangesEq!0 (select (arr!3993 (buf!3673 bs1!10)) (_4!114 lt!241857)) (select (arr!3993 (buf!3673 bs2!18)) (_4!114 lt!241857)) #b00000000000000000000000000000000 lt!241858))))

(declare-fun b!155463 () Bool)

(declare-fun e!104711 () Bool)

(assert (=> b!155463 (= e!104711 e!104713)))

(declare-fun res!130036 () Bool)

(assert (=> b!155463 (=> (not res!130036) (not e!104713))))

(declare-fun e!104709 () Bool)

(assert (=> b!155463 (= res!130036 e!104709)))

(declare-fun res!130037 () Bool)

(assert (=> b!155463 (=> res!130037 e!104709)))

(assert (=> b!155463 (= res!130037 (bvsge (_1!7302 lt!241857) (_2!7302 lt!241857)))))

(assert (=> b!155463 (= lt!241858 ((_ extract 31 0) (bvsrem lt!241823 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!241859 () (_ BitVec 32))

(assert (=> b!155463 (= lt!241859 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!228)

(assert (=> b!155463 (= lt!241857 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241823))))

(declare-fun d!51304 () Bool)

(declare-fun res!130035 () Bool)

(assert (=> d!51304 (=> res!130035 e!104711)))

(assert (=> d!51304 (= res!130035 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241823))))

(assert (=> d!51304 (= (arrayBitRangesEq!0 (buf!3673 bs1!10) (buf!3673 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241823) e!104711)))

(declare-fun b!155464 () Bool)

(declare-fun e!104714 () Bool)

(assert (=> b!155464 (= e!104712 e!104714)))

(declare-fun res!130034 () Bool)

(declare-fun call!2252 () Bool)

(assert (=> b!155464 (= res!130034 call!2252)))

(assert (=> b!155464 (=> (not res!130034) (not e!104714))))

(declare-fun b!155465 () Bool)

(assert (=> b!155465 (= e!104712 call!2252)))

(declare-fun b!155466 () Bool)

(assert (=> b!155466 (= e!104709 (arrayRangesEq!408 (buf!3673 bs1!10) (buf!3673 bs2!18) (_1!7302 lt!241857) (_2!7302 lt!241857)))))

(declare-fun b!155467 () Bool)

(declare-fun res!130033 () Bool)

(assert (=> b!155467 (= res!130033 (= lt!241858 #b00000000000000000000000000000000))))

(assert (=> b!155467 (=> res!130033 e!104710)))

(assert (=> b!155467 (= e!104714 e!104710)))

(declare-fun bm!2249 () Bool)

(assert (=> bm!2249 (= call!2252 (byteRangesEq!0 (select (arr!3993 (buf!3673 bs1!10)) (_3!417 lt!241857)) (select (arr!3993 (buf!3673 bs2!18)) (_3!417 lt!241857)) lt!241859 (ite c!8268 lt!241858 #b00000000000000000000000000001000)))))

(assert (= (and d!51304 (not res!130035)) b!155463))

(assert (= (and b!155463 (not res!130037)) b!155466))

(assert (= (and b!155463 res!130036) b!155461))

(assert (= (and b!155461 c!8268) b!155465))

(assert (= (and b!155461 (not c!8268)) b!155464))

(assert (= (and b!155464 res!130034) b!155467))

(assert (= (and b!155467 (not res!130033)) b!155462))

(assert (= (or b!155465 b!155464) bm!2249))

(declare-fun m!241487 () Bool)

(assert (=> b!155462 m!241487))

(declare-fun m!241489 () Bool)

(assert (=> b!155462 m!241489))

(assert (=> b!155462 m!241487))

(assert (=> b!155462 m!241489))

(declare-fun m!241491 () Bool)

(assert (=> b!155462 m!241491))

(declare-fun m!241493 () Bool)

(assert (=> b!155463 m!241493))

(declare-fun m!241495 () Bool)

(assert (=> b!155466 m!241495))

(declare-fun m!241497 () Bool)

(assert (=> bm!2249 m!241497))

(declare-fun m!241499 () Bool)

(assert (=> bm!2249 m!241499))

(assert (=> bm!2249 m!241497))

(assert (=> bm!2249 m!241499))

(declare-fun m!241501 () Bool)

(assert (=> bm!2249 m!241501))

(assert (=> b!155414 d!51304))

(declare-fun d!51306 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51306 (= (inv!12 bs1!10) (invariant!0 (currentBit!6714 bs1!10) (currentByte!6719 bs1!10) (size!3170 (buf!3673 bs1!10))))))

(declare-fun bs!12553 () Bool)

(assert (= bs!12553 d!51306))

(declare-fun m!241503 () Bool)

(assert (=> bs!12553 m!241503))

(assert (=> start!30356 d!51306))

(declare-fun d!51308 () Bool)

(assert (=> d!51308 (= (inv!12 bs2!18) (invariant!0 (currentBit!6714 bs2!18) (currentByte!6719 bs2!18) (size!3170 (buf!3673 bs2!18))))))

(declare-fun bs!12554 () Bool)

(assert (= bs!12554 d!51308))

(declare-fun m!241505 () Bool)

(assert (=> bs!12554 m!241505))

(assert (=> start!30356 d!51308))

(declare-fun d!51310 () Bool)

(declare-fun e!104717 () Bool)

(assert (=> d!51310 e!104717))

(declare-fun res!130042 () Bool)

(assert (=> d!51310 (=> (not res!130042) (not e!104717))))

(declare-fun lt!241877 () (_ BitVec 64))

(declare-fun lt!241872 () (_ BitVec 64))

(declare-fun lt!241876 () (_ BitVec 64))

(assert (=> d!51310 (= res!130042 (= lt!241872 (bvsub lt!241876 lt!241877)))))

(assert (=> d!51310 (or (= (bvand lt!241876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241877 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241876 lt!241877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51310 (= lt!241877 (remainingBits!0 ((_ sign_extend 32) (size!3170 (buf!3673 bs1!10))) ((_ sign_extend 32) (currentByte!6719 bs1!10)) ((_ sign_extend 32) (currentBit!6714 bs1!10))))))

(declare-fun lt!241875 () (_ BitVec 64))

(declare-fun lt!241873 () (_ BitVec 64))

(assert (=> d!51310 (= lt!241876 (bvmul lt!241875 lt!241873))))

(assert (=> d!51310 (or (= lt!241875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241873 (bvsdiv (bvmul lt!241875 lt!241873) lt!241875)))))

(assert (=> d!51310 (= lt!241873 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51310 (= lt!241875 ((_ sign_extend 32) (size!3170 (buf!3673 bs1!10))))))

(assert (=> d!51310 (= lt!241872 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6719 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6714 bs1!10))))))

(assert (=> d!51310 (invariant!0 (currentBit!6714 bs1!10) (currentByte!6719 bs1!10) (size!3170 (buf!3673 bs1!10)))))

(assert (=> d!51310 (= (bitIndex!0 (size!3170 (buf!3673 bs1!10)) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)) lt!241872)))

(declare-fun b!155472 () Bool)

(declare-fun res!130043 () Bool)

(assert (=> b!155472 (=> (not res!130043) (not e!104717))))

(assert (=> b!155472 (= res!130043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241872))))

(declare-fun b!155473 () Bool)

(declare-fun lt!241874 () (_ BitVec 64))

(assert (=> b!155473 (= e!104717 (bvsle lt!241872 (bvmul lt!241874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155473 (or (= lt!241874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241874)))))

(assert (=> b!155473 (= lt!241874 ((_ sign_extend 32) (size!3170 (buf!3673 bs1!10))))))

(assert (= (and d!51310 res!130042) b!155472))

(assert (= (and b!155472 res!130043) b!155473))

(declare-fun m!241507 () Bool)

(assert (=> d!51310 m!241507))

(assert (=> d!51310 m!241503))

(assert (=> b!155418 d!51310))

(declare-fun d!51312 () Bool)

(declare-fun res!130048 () Bool)

(declare-fun e!104722 () Bool)

(assert (=> d!51312 (=> res!130048 e!104722)))

(assert (=> d!51312 (= res!130048 (= #b00000000000000000000000000000000 lt!241827))))

(assert (=> d!51312 (= (arrayRangesEq!408 (buf!3673 bs1!10) (buf!3673 bs2!18) #b00000000000000000000000000000000 lt!241827) e!104722)))

(declare-fun b!155478 () Bool)

(declare-fun e!104723 () Bool)

(assert (=> b!155478 (= e!104722 e!104723)))

(declare-fun res!130049 () Bool)

(assert (=> b!155478 (=> (not res!130049) (not e!104723))))

(assert (=> b!155478 (= res!130049 (= (select (arr!3993 (buf!3673 bs1!10)) #b00000000000000000000000000000000) (select (arr!3993 (buf!3673 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!155479 () Bool)

(assert (=> b!155479 (= e!104723 (arrayRangesEq!408 (buf!3673 bs1!10) (buf!3673 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241827))))

(assert (= (and d!51312 (not res!130048)) b!155478))

(assert (= (and b!155478 res!130049) b!155479))

(declare-fun m!241509 () Bool)

(assert (=> b!155478 m!241509))

(declare-fun m!241511 () Bool)

(assert (=> b!155478 m!241511))

(declare-fun m!241513 () Bool)

(assert (=> b!155479 m!241513))

(assert (=> b!155413 d!51312))

(declare-fun d!51314 () Bool)

(assert (=> d!51314 (= (array_inv!2959 (buf!3673 bs2!18)) (bvsge (size!3170 (buf!3673 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155419 d!51314))

(declare-fun d!51316 () Bool)

(declare-fun e!104724 () Bool)

(assert (=> d!51316 e!104724))

(declare-fun res!130050 () Bool)

(assert (=> d!51316 (=> (not res!130050) (not e!104724))))

(declare-fun lt!241883 () (_ BitVec 64))

(declare-fun lt!241882 () (_ BitVec 64))

(declare-fun lt!241878 () (_ BitVec 64))

(assert (=> d!51316 (= res!130050 (= lt!241878 (bvsub lt!241882 lt!241883)))))

(assert (=> d!51316 (or (= (bvand lt!241882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241883 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241882 lt!241883) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51316 (= lt!241883 (remainingBits!0 ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241825)))) ((_ sign_extend 32) (currentByte!6719 (_1!7299 lt!241825))) ((_ sign_extend 32) (currentBit!6714 (_1!7299 lt!241825)))))))

(declare-fun lt!241881 () (_ BitVec 64))

(declare-fun lt!241879 () (_ BitVec 64))

(assert (=> d!51316 (= lt!241882 (bvmul lt!241881 lt!241879))))

(assert (=> d!51316 (or (= lt!241881 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241879 (bvsdiv (bvmul lt!241881 lt!241879) lt!241881)))))

(assert (=> d!51316 (= lt!241879 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51316 (= lt!241881 ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241825)))))))

(assert (=> d!51316 (= lt!241878 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6719 (_1!7299 lt!241825))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6714 (_1!7299 lt!241825)))))))

(assert (=> d!51316 (invariant!0 (currentBit!6714 (_1!7299 lt!241825)) (currentByte!6719 (_1!7299 lt!241825)) (size!3170 (buf!3673 (_1!7299 lt!241825))))))

(assert (=> d!51316 (= (bitIndex!0 (size!3170 (buf!3673 (_1!7299 lt!241825))) (currentByte!6719 (_1!7299 lt!241825)) (currentBit!6714 (_1!7299 lt!241825))) lt!241878)))

(declare-fun b!155480 () Bool)

(declare-fun res!130051 () Bool)

(assert (=> b!155480 (=> (not res!130051) (not e!104724))))

(assert (=> b!155480 (= res!130051 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241878))))

(declare-fun b!155481 () Bool)

(declare-fun lt!241880 () (_ BitVec 64))

(assert (=> b!155481 (= e!104724 (bvsle lt!241878 (bvmul lt!241880 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155481 (or (= lt!241880 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241880 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241880)))))

(assert (=> b!155481 (= lt!241880 ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241825)))))))

(assert (= (and d!51316 res!130050) b!155480))

(assert (= (and b!155480 res!130051) b!155481))

(declare-fun m!241515 () Bool)

(assert (=> d!51316 m!241515))

(declare-fun m!241517 () Bool)

(assert (=> d!51316 m!241517))

(assert (=> b!155417 d!51316))

(declare-fun d!51318 () Bool)

(declare-fun e!104725 () Bool)

(assert (=> d!51318 e!104725))

(declare-fun res!130052 () Bool)

(assert (=> d!51318 (=> (not res!130052) (not e!104725))))

(declare-fun lt!241889 () (_ BitVec 64))

(declare-fun lt!241888 () (_ BitVec 64))

(declare-fun lt!241884 () (_ BitVec 64))

(assert (=> d!51318 (= res!130052 (= lt!241884 (bvsub lt!241888 lt!241889)))))

(assert (=> d!51318 (or (= (bvand lt!241888 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241889 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241888 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241888 lt!241889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51318 (= lt!241889 (remainingBits!0 ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241824)))) ((_ sign_extend 32) (currentByte!6719 (_1!7299 lt!241824))) ((_ sign_extend 32) (currentBit!6714 (_1!7299 lt!241824)))))))

(declare-fun lt!241887 () (_ BitVec 64))

(declare-fun lt!241885 () (_ BitVec 64))

(assert (=> d!51318 (= lt!241888 (bvmul lt!241887 lt!241885))))

(assert (=> d!51318 (or (= lt!241887 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241885 (bvsdiv (bvmul lt!241887 lt!241885) lt!241887)))))

(assert (=> d!51318 (= lt!241885 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51318 (= lt!241887 ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241824)))))))

(assert (=> d!51318 (= lt!241884 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6719 (_1!7299 lt!241824))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6714 (_1!7299 lt!241824)))))))

(assert (=> d!51318 (invariant!0 (currentBit!6714 (_1!7299 lt!241824)) (currentByte!6719 (_1!7299 lt!241824)) (size!3170 (buf!3673 (_1!7299 lt!241824))))))

(assert (=> d!51318 (= (bitIndex!0 (size!3170 (buf!3673 (_1!7299 lt!241824))) (currentByte!6719 (_1!7299 lt!241824)) (currentBit!6714 (_1!7299 lt!241824))) lt!241884)))

(declare-fun b!155482 () Bool)

(declare-fun res!130053 () Bool)

(assert (=> b!155482 (=> (not res!130053) (not e!104725))))

(assert (=> b!155482 (= res!130053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241884))))

(declare-fun b!155483 () Bool)

(declare-fun lt!241886 () (_ BitVec 64))

(assert (=> b!155483 (= e!104725 (bvsle lt!241884 (bvmul lt!241886 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155483 (or (= lt!241886 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241886 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241886)))))

(assert (=> b!155483 (= lt!241886 ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241824)))))))

(assert (= (and d!51318 res!130052) b!155482))

(assert (= (and b!155482 res!130053) b!155483))

(declare-fun m!241519 () Bool)

(assert (=> d!51318 m!241519))

(declare-fun m!241521 () Bool)

(assert (=> d!51318 m!241521))

(assert (=> b!155417 d!51318))

(declare-fun d!51322 () Bool)

(assert (=> d!51322 (and (bvsge (currentByte!6719 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6719 bs1!10) (size!3170 (buf!3673 bs1!10))) (bvslt (currentByte!6719 bs1!10) (size!3170 (buf!3673 bs2!18))) (= (select (arr!3993 (buf!3673 bs1!10)) (currentByte!6719 bs1!10)) (select (arr!3993 (buf!3673 bs2!18)) (currentByte!6719 bs1!10))))))

(declare-fun lt!241892 () Unit!9783)

(declare-fun choose!110 (array!7051 array!7051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9783)

(assert (=> d!51322 (= lt!241892 (choose!110 (buf!3673 bs1!10) (buf!3673 bs2!18) #b00000000000000000000000000000000 (currentByte!6719 bs1!10) lt!241827))))

(assert (=> d!51322 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!241827))))

(assert (=> d!51322 (= (arrayRangesEqImpliesEq!28 (buf!3673 bs1!10) (buf!3673 bs2!18) #b00000000000000000000000000000000 (currentByte!6719 bs1!10) lt!241827) lt!241892)))

(declare-fun bs!12555 () Bool)

(assert (= bs!12555 d!51322))

(assert (=> bs!12555 m!241437))

(assert (=> bs!12555 m!241431))

(declare-fun m!241523 () Bool)

(assert (=> bs!12555 m!241523))

(assert (=> b!155417 d!51322))

(declare-fun d!51324 () Bool)

(declare-fun e!104726 () Bool)

(assert (=> d!51324 e!104726))

(declare-fun res!130054 () Bool)

(assert (=> d!51324 (=> (not res!130054) (not e!104726))))

(declare-fun lt!241898 () (_ BitVec 64))

(declare-fun lt!241897 () (_ BitVec 64))

(declare-fun lt!241893 () (_ BitVec 64))

(assert (=> d!51324 (= res!130054 (= lt!241893 (bvsub lt!241897 lt!241898)))))

(assert (=> d!51324 (or (= (bvand lt!241897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241897 lt!241898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51324 (= lt!241898 (remainingBits!0 ((_ sign_extend 32) (size!3170 (buf!3673 bs2!18))) ((_ sign_extend 32) (currentByte!6719 bs2!18)) ((_ sign_extend 32) (currentBit!6714 bs2!18))))))

(declare-fun lt!241896 () (_ BitVec 64))

(declare-fun lt!241894 () (_ BitVec 64))

(assert (=> d!51324 (= lt!241897 (bvmul lt!241896 lt!241894))))

(assert (=> d!51324 (or (= lt!241896 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241894 (bvsdiv (bvmul lt!241896 lt!241894) lt!241896)))))

(assert (=> d!51324 (= lt!241894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51324 (= lt!241896 ((_ sign_extend 32) (size!3170 (buf!3673 bs2!18))))))

(assert (=> d!51324 (= lt!241893 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6719 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6714 bs2!18))))))

(assert (=> d!51324 (invariant!0 (currentBit!6714 bs2!18) (currentByte!6719 bs2!18) (size!3170 (buf!3673 bs2!18)))))

(assert (=> d!51324 (= (bitIndex!0 (size!3170 (buf!3673 bs2!18)) (currentByte!6719 bs2!18) (currentBit!6714 bs2!18)) lt!241893)))

(declare-fun b!155484 () Bool)

(declare-fun res!130055 () Bool)

(assert (=> b!155484 (=> (not res!130055) (not e!104726))))

(assert (=> b!155484 (= res!130055 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241893))))

(declare-fun b!155485 () Bool)

(declare-fun lt!241895 () (_ BitVec 64))

(assert (=> b!155485 (= e!104726 (bvsle lt!241893 (bvmul lt!241895 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155485 (or (= lt!241895 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241895 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241895)))))

(assert (=> b!155485 (= lt!241895 ((_ sign_extend 32) (size!3170 (buf!3673 bs2!18))))))

(assert (= (and d!51324 res!130054) b!155484))

(assert (= (and b!155484 res!130055) b!155485))

(declare-fun m!241525 () Bool)

(assert (=> d!51324 m!241525))

(assert (=> d!51324 m!241505))

(assert (=> b!155412 d!51324))

(check-sat (not bm!2249) (not d!51322) (not d!51316) (not d!51308) (not d!51302) (not b!155463) (not d!51300) (not b!155466) (not d!51310) (not b!155462) (not d!51318) (not d!51306) (not b!155479) (not d!51324))
(check-sat)
(get-model)

(declare-fun d!51376 () Bool)

(assert (=> d!51376 (= (byteRangesEq!0 (select (arr!3993 (buf!3673 bs1!10)) (_3!417 lt!241857)) (select (arr!3993 (buf!3673 bs2!18)) (_3!417 lt!241857)) lt!241859 (ite c!8268 lt!241858 #b00000000000000000000000000001000)) (or (= lt!241859 (ite c!8268 lt!241858 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3993 (buf!3673 bs1!10)) (_3!417 lt!241857))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8268 lt!241858 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241859)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3993 (buf!3673 bs2!18)) (_3!417 lt!241857))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8268 lt!241858 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241859)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12566 () Bool)

(assert (= bs!12566 d!51376))

(declare-fun m!241615 () Bool)

(assert (=> bs!12566 m!241615))

(declare-fun m!241617 () Bool)

(assert (=> bs!12566 m!241617))

(assert (=> bm!2249 d!51376))

(declare-fun d!51378 () Bool)

(assert (=> d!51378 (= (remainingBits!0 ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241825)))) ((_ sign_extend 32) (currentByte!6719 (_1!7299 lt!241825))) ((_ sign_extend 32) (currentBit!6714 (_1!7299 lt!241825)))) (bvsub (bvmul ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241825)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6719 (_1!7299 lt!241825))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6714 (_1!7299 lt!241825))))))))

(assert (=> d!51316 d!51378))

(declare-fun d!51380 () Bool)

(assert (=> d!51380 (= (invariant!0 (currentBit!6714 (_1!7299 lt!241825)) (currentByte!6719 (_1!7299 lt!241825)) (size!3170 (buf!3673 (_1!7299 lt!241825)))) (and (bvsge (currentBit!6714 (_1!7299 lt!241825)) #b00000000000000000000000000000000) (bvslt (currentBit!6714 (_1!7299 lt!241825)) #b00000000000000000000000000001000) (bvsge (currentByte!6719 (_1!7299 lt!241825)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6719 (_1!7299 lt!241825)) (size!3170 (buf!3673 (_1!7299 lt!241825)))) (and (= (currentBit!6714 (_1!7299 lt!241825)) #b00000000000000000000000000000000) (= (currentByte!6719 (_1!7299 lt!241825)) (size!3170 (buf!3673 (_1!7299 lt!241825))))))))))

(assert (=> d!51316 d!51380))

(declare-fun d!51382 () Bool)

(assert (=> d!51382 (= (remainingBits!0 ((_ sign_extend 32) (size!3170 (buf!3673 bs1!10))) ((_ sign_extend 32) (currentByte!6719 bs1!10)) ((_ sign_extend 32) (currentBit!6714 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3170 (buf!3673 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6719 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6714 bs1!10)))))))

(assert (=> d!51310 d!51382))

(declare-fun d!51384 () Bool)

(assert (=> d!51384 (= (invariant!0 (currentBit!6714 bs1!10) (currentByte!6719 bs1!10) (size!3170 (buf!3673 bs1!10))) (and (bvsge (currentBit!6714 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6714 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6719 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6719 bs1!10) (size!3170 (buf!3673 bs1!10))) (and (= (currentBit!6714 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6719 bs1!10) (size!3170 (buf!3673 bs1!10)))))))))

(assert (=> d!51310 d!51384))

(declare-fun d!51386 () Bool)

(assert (=> d!51386 (= (remainingBits!0 ((_ sign_extend 32) (size!3170 (buf!3673 bs2!18))) ((_ sign_extend 32) (currentByte!6719 bs2!18)) ((_ sign_extend 32) (currentBit!6714 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3170 (buf!3673 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6719 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6714 bs2!18)))))))

(assert (=> d!51324 d!51386))

(declare-fun d!51388 () Bool)

(assert (=> d!51388 (= (invariant!0 (currentBit!6714 bs2!18) (currentByte!6719 bs2!18) (size!3170 (buf!3673 bs2!18))) (and (bvsge (currentBit!6714 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6714 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6719 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6719 bs2!18) (size!3170 (buf!3673 bs2!18))) (and (= (currentBit!6714 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6719 bs2!18) (size!3170 (buf!3673 bs2!18)))))))))

(assert (=> d!51324 d!51388))

(declare-fun d!51390 () Bool)

(declare-fun res!130122 () Bool)

(declare-fun e!104787 () Bool)

(assert (=> d!51390 (=> res!130122 e!104787)))

(assert (=> d!51390 (= res!130122 (= (_1!7302 lt!241857) (_2!7302 lt!241857)))))

(assert (=> d!51390 (= (arrayRangesEq!408 (buf!3673 bs1!10) (buf!3673 bs2!18) (_1!7302 lt!241857) (_2!7302 lt!241857)) e!104787)))

(declare-fun b!155564 () Bool)

(declare-fun e!104788 () Bool)

(assert (=> b!155564 (= e!104787 e!104788)))

(declare-fun res!130123 () Bool)

(assert (=> b!155564 (=> (not res!130123) (not e!104788))))

(assert (=> b!155564 (= res!130123 (= (select (arr!3993 (buf!3673 bs1!10)) (_1!7302 lt!241857)) (select (arr!3993 (buf!3673 bs2!18)) (_1!7302 lt!241857))))))

(declare-fun b!155565 () Bool)

(assert (=> b!155565 (= e!104788 (arrayRangesEq!408 (buf!3673 bs1!10) (buf!3673 bs2!18) (bvadd (_1!7302 lt!241857) #b00000000000000000000000000000001) (_2!7302 lt!241857)))))

(assert (= (and d!51390 (not res!130122)) b!155564))

(assert (= (and b!155564 res!130123) b!155565))

(declare-fun m!241619 () Bool)

(assert (=> b!155564 m!241619))

(declare-fun m!241621 () Bool)

(assert (=> b!155564 m!241621))

(declare-fun m!241623 () Bool)

(assert (=> b!155565 m!241623))

(assert (=> b!155466 d!51390))

(declare-fun d!51392 () Bool)

(assert (=> d!51392 (= (remainingBits!0 ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241824)))) ((_ sign_extend 32) (currentByte!6719 (_1!7299 lt!241824))) ((_ sign_extend 32) (currentBit!6714 (_1!7299 lt!241824)))) (bvsub (bvmul ((_ sign_extend 32) (size!3170 (buf!3673 (_1!7299 lt!241824)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6719 (_1!7299 lt!241824))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6714 (_1!7299 lt!241824))))))))

(assert (=> d!51318 d!51392))

(declare-fun d!51394 () Bool)

(assert (=> d!51394 (= (invariant!0 (currentBit!6714 (_1!7299 lt!241824)) (currentByte!6719 (_1!7299 lt!241824)) (size!3170 (buf!3673 (_1!7299 lt!241824)))) (and (bvsge (currentBit!6714 (_1!7299 lt!241824)) #b00000000000000000000000000000000) (bvslt (currentBit!6714 (_1!7299 lt!241824)) #b00000000000000000000000000001000) (bvsge (currentByte!6719 (_1!7299 lt!241824)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6719 (_1!7299 lt!241824)) (size!3170 (buf!3673 (_1!7299 lt!241824)))) (and (= (currentBit!6714 (_1!7299 lt!241824)) #b00000000000000000000000000000000) (= (currentByte!6719 (_1!7299 lt!241824)) (size!3170 (buf!3673 (_1!7299 lt!241824))))))))))

(assert (=> d!51318 d!51394))

(assert (=> d!51306 d!51384))

(declare-fun d!51396 () Bool)

(assert (=> d!51396 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241823) (tuple4!229 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!241823 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!241823 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!155463 d!51396))

(declare-fun d!51398 () Bool)

(assert (=> d!51398 (= (select (arr!3993 (buf!3673 bs1!10)) (currentByte!6719 bs1!10)) (select (arr!3993 (buf!3673 bs2!18)) (currentByte!6719 bs1!10)))))

(assert (=> d!51398 true))

(declare-fun _$12!75 () Unit!9783)

(assert (=> d!51398 (= (choose!110 (buf!3673 bs1!10) (buf!3673 bs2!18) #b00000000000000000000000000000000 (currentByte!6719 bs1!10) lt!241827) _$12!75)))

(declare-fun bs!12567 () Bool)

(assert (= bs!12567 d!51398))

(assert (=> bs!12567 m!241437))

(assert (=> bs!12567 m!241431))

(assert (=> d!51322 d!51398))

(assert (=> d!51308 d!51388))

(declare-fun d!51400 () Bool)

(assert (=> d!51400 (= (byteRangesEq!0 (select (arr!3993 (buf!3673 bs1!10)) (_4!114 lt!241857)) (select (arr!3993 (buf!3673 bs2!18)) (_4!114 lt!241857)) #b00000000000000000000000000000000 lt!241858) (or (= #b00000000000000000000000000000000 lt!241858) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3993 (buf!3673 bs1!10)) (_4!114 lt!241857))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241858))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3993 (buf!3673 bs2!18)) (_4!114 lt!241857))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241858))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12568 () Bool)

(assert (= bs!12568 d!51400))

(declare-fun m!241625 () Bool)

(assert (=> bs!12568 m!241625))

(declare-fun m!241627 () Bool)

(assert (=> bs!12568 m!241627))

(assert (=> b!155462 d!51400))

(declare-fun d!51402 () Bool)

(declare-fun res!130124 () Bool)

(declare-fun e!104789 () Bool)

(assert (=> d!51402 (=> res!130124 e!104789)))

(assert (=> d!51402 (= res!130124 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241827))))

(assert (=> d!51402 (= (arrayRangesEq!408 (buf!3673 bs1!10) (buf!3673 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241827) e!104789)))

(declare-fun b!155566 () Bool)

(declare-fun e!104790 () Bool)

(assert (=> b!155566 (= e!104789 e!104790)))

(declare-fun res!130125 () Bool)

(assert (=> b!155566 (=> (not res!130125) (not e!104790))))

(assert (=> b!155566 (= res!130125 (= (select (arr!3993 (buf!3673 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3993 (buf!3673 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!155567 () Bool)

(assert (=> b!155567 (= e!104790 (arrayRangesEq!408 (buf!3673 bs1!10) (buf!3673 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!241827))))

(assert (= (and d!51402 (not res!130124)) b!155566))

(assert (= (and b!155566 res!130125) b!155567))

(declare-fun m!241629 () Bool)

(assert (=> b!155566 m!241629))

(declare-fun m!241631 () Bool)

(assert (=> b!155566 m!241631))

(declare-fun m!241633 () Bool)

(assert (=> b!155567 m!241633))

(assert (=> b!155479 d!51402))

(declare-fun lt!242018 () (_ BitVec 8))

(declare-fun lt!242017 () (_ BitVec 8))

(declare-fun d!51404 () Bool)

(assert (=> d!51404 (= lt!242018 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3993 (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))) (currentByte!6719 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))))) ((_ sign_extend 24) lt!242017))))))

(assert (=> d!51404 (= lt!242017 ((_ extract 7 0) (currentBit!6714 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))))))

(declare-fun e!104795 () Bool)

(assert (=> d!51404 e!104795))

(declare-fun res!130131 () Bool)

(assert (=> d!51404 (=> (not res!130131) (not e!104795))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51404 (= res!130131 (validate_offset_bits!1 ((_ sign_extend 32) (size!3170 (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))))) ((_ sign_extend 32) (currentByte!6719 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))) ((_ sign_extend 32) (currentBit!6714 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13774 0))(
  ( (tuple2!13775 (_1!7307 Unit!9783) (_2!7307 (_ BitVec 8))) )
))
(declare-fun Unit!9787 () Unit!9783)

(declare-fun Unit!9788 () Unit!9783)

(assert (=> d!51404 (= (readByte!0 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) (tuple2!13769 (_2!7307 (ite (bvsgt ((_ sign_extend 24) lt!242017) #b00000000000000000000000000000000) (tuple2!13775 Unit!9787 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242018) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3993 (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))) (bvadd (currentByte!6719 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242017)))))))) (tuple2!13775 Unit!9788 lt!242018))) (BitStream!5599 (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) (bvadd (currentByte!6719 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) #b00000000000000000000000000000001) (currentBit!6714 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))))))))

(declare-fun b!155572 () Bool)

(declare-fun e!104796 () Bool)

(assert (=> b!155572 (= e!104795 e!104796)))

(declare-fun res!130132 () Bool)

(assert (=> b!155572 (=> (not res!130132) (not e!104796))))

(declare-fun lt!242021 () tuple2!13768)

(assert (=> b!155572 (= res!130132 (= (buf!3673 (_2!7301 lt!242021)) (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))))))

(declare-fun lt!242023 () (_ BitVec 8))

(declare-fun lt!242022 () (_ BitVec 8))

(declare-fun Unit!9789 () Unit!9783)

(declare-fun Unit!9790 () Unit!9783)

(assert (=> b!155572 (= lt!242021 (tuple2!13769 (_2!7307 (ite (bvsgt ((_ sign_extend 24) lt!242023) #b00000000000000000000000000000000) (tuple2!13775 Unit!9789 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242022) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3993 (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))) (bvadd (currentByte!6719 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242023)))))))) (tuple2!13775 Unit!9790 lt!242022))) (BitStream!5599 (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) (bvadd (currentByte!6719 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) #b00000000000000000000000000000001) (currentBit!6714 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))))))))

(assert (=> b!155572 (= lt!242022 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3993 (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))) (currentByte!6719 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))))) ((_ sign_extend 24) lt!242023))))))

(assert (=> b!155572 (= lt!242023 ((_ extract 7 0) (currentBit!6714 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))))))

(declare-fun b!155573 () Bool)

(declare-fun lt!242019 () (_ BitVec 64))

(declare-fun lt!242020 () (_ BitVec 64))

(assert (=> b!155573 (= e!104796 (= (bitIndex!0 (size!3170 (buf!3673 (_2!7301 lt!242021))) (currentByte!6719 (_2!7301 lt!242021)) (currentBit!6714 (_2!7301 lt!242021))) (bvadd lt!242020 lt!242019)))))

(assert (=> b!155573 (or (not (= (bvand lt!242020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242019 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242020 lt!242019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155573 (= lt!242019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155573 (= lt!242020 (bitIndex!0 (size!3170 (buf!3673 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))) (currentByte!6719 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10))) (currentBit!6714 (BitStream!5599 (buf!3673 bs2!18) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))))))

(assert (= (and d!51404 res!130131) b!155572))

(assert (= (and b!155572 res!130132) b!155573))

(declare-fun m!241635 () Bool)

(assert (=> d!51404 m!241635))

(declare-fun m!241637 () Bool)

(assert (=> d!51404 m!241637))

(declare-fun m!241639 () Bool)

(assert (=> d!51404 m!241639))

(assert (=> b!155572 m!241639))

(assert (=> b!155572 m!241635))

(declare-fun m!241641 () Bool)

(assert (=> b!155573 m!241641))

(declare-fun m!241643 () Bool)

(assert (=> b!155573 m!241643))

(assert (=> d!51300 d!51404))

(declare-fun d!51406 () Bool)

(declare-fun lt!242025 () (_ BitVec 8))

(declare-fun lt!242024 () (_ BitVec 8))

(assert (=> d!51406 (= lt!242025 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3993 (buf!3673 bs1!10)) (currentByte!6719 bs1!10))) ((_ sign_extend 24) lt!242024))))))

(assert (=> d!51406 (= lt!242024 ((_ extract 7 0) (currentBit!6714 bs1!10)))))

(declare-fun e!104797 () Bool)

(assert (=> d!51406 e!104797))

(declare-fun res!130133 () Bool)

(assert (=> d!51406 (=> (not res!130133) (not e!104797))))

(assert (=> d!51406 (= res!130133 (validate_offset_bits!1 ((_ sign_extend 32) (size!3170 (buf!3673 bs1!10))) ((_ sign_extend 32) (currentByte!6719 bs1!10)) ((_ sign_extend 32) (currentBit!6714 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9791 () Unit!9783)

(declare-fun Unit!9792 () Unit!9783)

(assert (=> d!51406 (= (readByte!0 bs1!10) (tuple2!13769 (_2!7307 (ite (bvsgt ((_ sign_extend 24) lt!242024) #b00000000000000000000000000000000) (tuple2!13775 Unit!9791 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242025) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3993 (buf!3673 bs1!10)) (bvadd (currentByte!6719 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242024)))))))) (tuple2!13775 Unit!9792 lt!242025))) (BitStream!5599 (buf!3673 bs1!10) (bvadd (currentByte!6719 bs1!10) #b00000000000000000000000000000001) (currentBit!6714 bs1!10))))))

(declare-fun b!155574 () Bool)

(declare-fun e!104798 () Bool)

(assert (=> b!155574 (= e!104797 e!104798)))

(declare-fun res!130134 () Bool)

(assert (=> b!155574 (=> (not res!130134) (not e!104798))))

(declare-fun lt!242028 () tuple2!13768)

(assert (=> b!155574 (= res!130134 (= (buf!3673 (_2!7301 lt!242028)) (buf!3673 bs1!10)))))

(declare-fun lt!242029 () (_ BitVec 8))

(declare-fun lt!242030 () (_ BitVec 8))

(declare-fun Unit!9793 () Unit!9783)

(declare-fun Unit!9794 () Unit!9783)

(assert (=> b!155574 (= lt!242028 (tuple2!13769 (_2!7307 (ite (bvsgt ((_ sign_extend 24) lt!242030) #b00000000000000000000000000000000) (tuple2!13775 Unit!9793 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242029) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3993 (buf!3673 bs1!10)) (bvadd (currentByte!6719 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242030)))))))) (tuple2!13775 Unit!9794 lt!242029))) (BitStream!5599 (buf!3673 bs1!10) (bvadd (currentByte!6719 bs1!10) #b00000000000000000000000000000001) (currentBit!6714 bs1!10))))))

(assert (=> b!155574 (= lt!242029 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3993 (buf!3673 bs1!10)) (currentByte!6719 bs1!10))) ((_ sign_extend 24) lt!242030))))))

(assert (=> b!155574 (= lt!242030 ((_ extract 7 0) (currentBit!6714 bs1!10)))))

(declare-fun lt!242026 () (_ BitVec 64))

(declare-fun b!155575 () Bool)

(declare-fun lt!242027 () (_ BitVec 64))

(assert (=> b!155575 (= e!104798 (= (bitIndex!0 (size!3170 (buf!3673 (_2!7301 lt!242028))) (currentByte!6719 (_2!7301 lt!242028)) (currentBit!6714 (_2!7301 lt!242028))) (bvadd lt!242027 lt!242026)))))

(assert (=> b!155575 (or (not (= (bvand lt!242027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242026 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242027 lt!242026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155575 (= lt!242026 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155575 (= lt!242027 (bitIndex!0 (size!3170 (buf!3673 bs1!10)) (currentByte!6719 bs1!10) (currentBit!6714 bs1!10)))))

(assert (= (and d!51406 res!130133) b!155574))

(assert (= (and b!155574 res!130134) b!155575))

(assert (=> d!51406 m!241437))

(declare-fun m!241645 () Bool)

(assert (=> d!51406 m!241645))

(declare-fun m!241647 () Bool)

(assert (=> d!51406 m!241647))

(assert (=> b!155574 m!241647))

(assert (=> b!155574 m!241437))

(declare-fun m!241649 () Bool)

(assert (=> b!155575 m!241649))

(assert (=> b!155575 m!241449))

(assert (=> d!51302 d!51406))

(check-sat (not b!155567) (not b!155575) (not d!51404) (not b!155573) (not d!51406) (not b!155565))
(check-sat)

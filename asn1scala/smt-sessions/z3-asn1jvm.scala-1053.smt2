; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30168 () Bool)

(assert start!30168)

(declare-fun res!129456 () Bool)

(declare-fun e!104060 () Bool)

(assert (=> start!30168 (=> (not res!129456) (not e!104060))))

(declare-datatypes ((array!7009 0))(
  ( (array!7010 (arr!3978 (Array (_ BitVec 32) (_ BitVec 8))) (size!3155 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5568 0))(
  ( (BitStream!5569 (buf!3658 array!7009) (currentByte!6686 (_ BitVec 32)) (currentBit!6681 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5568)

(declare-fun bs2!18 () BitStream!5568)

(assert (=> start!30168 (= res!129456 (= (size!3155 (buf!3658 bs1!10)) (size!3155 (buf!3658 bs2!18))))))

(assert (=> start!30168 e!104060))

(declare-fun e!104058 () Bool)

(declare-fun inv!12 (BitStream!5568) Bool)

(assert (=> start!30168 (and (inv!12 bs1!10) e!104058)))

(declare-fun e!104059 () Bool)

(assert (=> start!30168 (and (inv!12 bs2!18) e!104059)))

(declare-fun b!154713 () Bool)

(declare-fun e!104056 () Bool)

(assert (=> b!154713 (= e!104060 e!104056)))

(declare-fun res!129457 () Bool)

(assert (=> b!154713 (=> (not res!129457) (not e!104056))))

(declare-fun lt!241090 () (_ BitVec 64))

(assert (=> b!154713 (= res!129457 (bvsle lt!241090 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3155 (buf!3658 bs1!10))))))))

(declare-fun lt!241089 () (_ BitVec 64))

(assert (=> b!154713 (= lt!241090 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241089))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154713 (= lt!241089 (bitIndex!0 (size!3155 (buf!3658 bs1!10)) (currentByte!6686 bs1!10) (currentBit!6681 bs1!10)))))

(declare-fun b!154714 () Bool)

(declare-fun array_inv!2944 (array!7009) Bool)

(assert (=> b!154714 (= e!104058 (array_inv!2944 (buf!3658 bs1!10)))))

(declare-fun b!154715 () Bool)

(assert (=> b!154715 (= e!104059 (array_inv!2944 (buf!3658 bs2!18)))))

(declare-fun b!154716 () Bool)

(assert (=> b!154716 (= e!104056 (bvsgt #b00000000000000000000000000000000 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241089 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-datatypes ((tuple2!13704 0))(
  ( (tuple2!13705 (_1!7257 BitStream!5568) (_2!7257 (_ BitVec 8))) )
))
(declare-fun lt!241088 () tuple2!13704)

(declare-fun readBytePure!0 (BitStream!5568) tuple2!13704)

(assert (=> b!154716 (= lt!241088 (readBytePure!0 (BitStream!5569 (buf!3658 bs2!18) (currentByte!6686 bs1!10) (currentBit!6681 bs1!10))))))

(declare-fun lt!241087 () tuple2!13704)

(assert (=> b!154716 (= lt!241087 (readBytePure!0 bs1!10))))

(declare-fun b!154717 () Bool)

(declare-fun res!129458 () Bool)

(assert (=> b!154717 (=> (not res!129458) (not e!104056))))

(assert (=> b!154717 (= res!129458 (bvsle lt!241090 (bitIndex!0 (size!3155 (buf!3658 bs2!18)) (currentByte!6686 bs2!18) (currentBit!6681 bs2!18))))))

(declare-fun b!154718 () Bool)

(declare-fun res!129459 () Bool)

(assert (=> b!154718 (=> (not res!129459) (not e!104056))))

(declare-fun arrayBitRangesEq!0 (array!7009 array!7009 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154718 (= res!129459 (arrayBitRangesEq!0 (buf!3658 bs1!10) (buf!3658 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241090))))

(assert (= (and start!30168 res!129456) b!154713))

(assert (= (and b!154713 res!129457) b!154717))

(assert (= (and b!154717 res!129458) b!154718))

(assert (= (and b!154718 res!129459) b!154716))

(assert (= start!30168 b!154714))

(assert (= start!30168 b!154715))

(declare-fun m!240673 () Bool)

(assert (=> b!154713 m!240673))

(declare-fun m!240675 () Bool)

(assert (=> b!154716 m!240675))

(declare-fun m!240677 () Bool)

(assert (=> b!154716 m!240677))

(declare-fun m!240679 () Bool)

(assert (=> b!154715 m!240679))

(declare-fun m!240681 () Bool)

(assert (=> b!154718 m!240681))

(declare-fun m!240683 () Bool)

(assert (=> start!30168 m!240683))

(declare-fun m!240685 () Bool)

(assert (=> start!30168 m!240685))

(declare-fun m!240687 () Bool)

(assert (=> b!154717 m!240687))

(declare-fun m!240689 () Bool)

(assert (=> b!154714 m!240689))

(check-sat (not b!154716) (not b!154713) (not b!154715) (not b!154718) (not b!154714) (not b!154717) (not start!30168))
(check-sat)
(get-model)

(declare-fun d!51002 () Bool)

(assert (=> d!51002 (= (array_inv!2944 (buf!3658 bs2!18)) (bvsge (size!3155 (buf!3658 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154715 d!51002))

(declare-fun d!51004 () Bool)

(declare-datatypes ((tuple2!13708 0))(
  ( (tuple2!13709 (_1!7259 (_ BitVec 8)) (_2!7259 BitStream!5568)) )
))
(declare-fun lt!241105 () tuple2!13708)

(declare-fun readByte!0 (BitStream!5568) tuple2!13708)

(assert (=> d!51004 (= lt!241105 (readByte!0 (BitStream!5569 (buf!3658 bs2!18) (currentByte!6686 bs1!10) (currentBit!6681 bs1!10))))))

(assert (=> d!51004 (= (readBytePure!0 (BitStream!5569 (buf!3658 bs2!18) (currentByte!6686 bs1!10) (currentBit!6681 bs1!10))) (tuple2!13705 (_2!7259 lt!241105) (_1!7259 lt!241105)))))

(declare-fun bs!12482 () Bool)

(assert (= bs!12482 d!51004))

(declare-fun m!240709 () Bool)

(assert (=> bs!12482 m!240709))

(assert (=> b!154716 d!51004))

(declare-fun d!51006 () Bool)

(declare-fun lt!241106 () tuple2!13708)

(assert (=> d!51006 (= lt!241106 (readByte!0 bs1!10))))

(assert (=> d!51006 (= (readBytePure!0 bs1!10) (tuple2!13705 (_2!7259 lt!241106) (_1!7259 lt!241106)))))

(declare-fun bs!12483 () Bool)

(assert (= bs!12483 d!51006))

(declare-fun m!240711 () Bool)

(assert (=> bs!12483 m!240711))

(assert (=> b!154716 d!51006))

(declare-fun d!51008 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51008 (= (inv!12 bs1!10) (invariant!0 (currentBit!6681 bs1!10) (currentByte!6686 bs1!10) (size!3155 (buf!3658 bs1!10))))))

(declare-fun bs!12484 () Bool)

(assert (= bs!12484 d!51008))

(declare-fun m!240713 () Bool)

(assert (=> bs!12484 m!240713))

(assert (=> start!30168 d!51008))

(declare-fun d!51010 () Bool)

(assert (=> d!51010 (= (inv!12 bs2!18) (invariant!0 (currentBit!6681 bs2!18) (currentByte!6686 bs2!18) (size!3155 (buf!3658 bs2!18))))))

(declare-fun bs!12485 () Bool)

(assert (= bs!12485 d!51010))

(declare-fun m!240715 () Bool)

(assert (=> bs!12485 m!240715))

(assert (=> start!30168 d!51010))

(declare-fun d!51012 () Bool)

(declare-fun e!104082 () Bool)

(assert (=> d!51012 e!104082))

(declare-fun res!129476 () Bool)

(assert (=> d!51012 (=> (not res!129476) (not e!104082))))

(declare-fun lt!241121 () (_ BitVec 64))

(declare-fun lt!241122 () (_ BitVec 64))

(declare-fun lt!241123 () (_ BitVec 64))

(assert (=> d!51012 (= res!129476 (= lt!241123 (bvsub lt!241121 lt!241122)))))

(assert (=> d!51012 (or (= (bvand lt!241121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241121 lt!241122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51012 (= lt!241122 (remainingBits!0 ((_ sign_extend 32) (size!3155 (buf!3658 bs2!18))) ((_ sign_extend 32) (currentByte!6686 bs2!18)) ((_ sign_extend 32) (currentBit!6681 bs2!18))))))

(declare-fun lt!241120 () (_ BitVec 64))

(declare-fun lt!241119 () (_ BitVec 64))

(assert (=> d!51012 (= lt!241121 (bvmul lt!241120 lt!241119))))

(assert (=> d!51012 (or (= lt!241120 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241119 (bvsdiv (bvmul lt!241120 lt!241119) lt!241120)))))

(assert (=> d!51012 (= lt!241119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51012 (= lt!241120 ((_ sign_extend 32) (size!3155 (buf!3658 bs2!18))))))

(assert (=> d!51012 (= lt!241123 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6686 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6681 bs2!18))))))

(assert (=> d!51012 (invariant!0 (currentBit!6681 bs2!18) (currentByte!6686 bs2!18) (size!3155 (buf!3658 bs2!18)))))

(assert (=> d!51012 (= (bitIndex!0 (size!3155 (buf!3658 bs2!18)) (currentByte!6686 bs2!18) (currentBit!6681 bs2!18)) lt!241123)))

(declare-fun b!154741 () Bool)

(declare-fun res!129477 () Bool)

(assert (=> b!154741 (=> (not res!129477) (not e!104082))))

(assert (=> b!154741 (= res!129477 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241123))))

(declare-fun b!154742 () Bool)

(declare-fun lt!241124 () (_ BitVec 64))

(assert (=> b!154742 (= e!104082 (bvsle lt!241123 (bvmul lt!241124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154742 (or (= lt!241124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241124)))))

(assert (=> b!154742 (= lt!241124 ((_ sign_extend 32) (size!3155 (buf!3658 bs2!18))))))

(assert (= (and d!51012 res!129476) b!154741))

(assert (= (and b!154741 res!129477) b!154742))

(declare-fun m!240717 () Bool)

(assert (=> d!51012 m!240717))

(assert (=> d!51012 m!240715))

(assert (=> b!154717 d!51012))

(declare-fun d!51018 () Bool)

(declare-fun res!129507 () Bool)

(declare-fun e!104113 () Bool)

(assert (=> d!51018 (=> res!129507 e!104113)))

(assert (=> d!51018 (= res!129507 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241090))))

(assert (=> d!51018 (= (arrayBitRangesEq!0 (buf!3658 bs1!10) (buf!3658 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241090) e!104113)))

(declare-fun b!154777 () Bool)

(declare-fun e!104115 () Bool)

(declare-fun e!104111 () Bool)

(assert (=> b!154777 (= e!104115 e!104111)))

(declare-fun c!8234 () Bool)

(declare-datatypes ((tuple4!204 0))(
  ( (tuple4!205 (_1!7260 (_ BitVec 32)) (_2!7260 (_ BitVec 32)) (_3!405 (_ BitVec 32)) (_4!102 (_ BitVec 32))) )
))
(declare-fun lt!241157 () tuple4!204)

(assert (=> b!154777 (= c!8234 (= (_3!405 lt!241157) (_4!102 lt!241157)))))

(declare-fun call!2218 () Bool)

(declare-fun bm!2215 () Bool)

(declare-fun lt!241155 () (_ BitVec 32))

(declare-fun lt!241156 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2215 (= call!2218 (byteRangesEq!0 (select (arr!3978 (buf!3658 bs1!10)) (_3!405 lt!241157)) (select (arr!3978 (buf!3658 bs2!18)) (_3!405 lt!241157)) lt!241155 (ite c!8234 lt!241156 #b00000000000000000000000000001000)))))

(declare-fun b!154778 () Bool)

(declare-fun res!129504 () Bool)

(assert (=> b!154778 (= res!129504 (= lt!241156 #b00000000000000000000000000000000))))

(declare-fun e!104114 () Bool)

(assert (=> b!154778 (=> res!129504 e!104114)))

(declare-fun e!104112 () Bool)

(assert (=> b!154778 (= e!104112 e!104114)))

(declare-fun b!154779 () Bool)

(assert (=> b!154779 (= e!104113 e!104115)))

(declare-fun res!129508 () Bool)

(assert (=> b!154779 (=> (not res!129508) (not e!104115))))

(declare-fun e!104110 () Bool)

(assert (=> b!154779 (= res!129508 e!104110)))

(declare-fun res!129505 () Bool)

(assert (=> b!154779 (=> res!129505 e!104110)))

(assert (=> b!154779 (= res!129505 (bvsge (_1!7260 lt!241157) (_2!7260 lt!241157)))))

(assert (=> b!154779 (= lt!241156 ((_ extract 31 0) (bvsrem lt!241090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154779 (= lt!241155 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!204)

(assert (=> b!154779 (= lt!241157 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241090))))

(declare-fun b!154780 () Bool)

(assert (=> b!154780 (= e!104111 call!2218)))

(declare-fun b!154781 () Bool)

(assert (=> b!154781 (= e!104114 (byteRangesEq!0 (select (arr!3978 (buf!3658 bs1!10)) (_4!102 lt!241157)) (select (arr!3978 (buf!3658 bs2!18)) (_4!102 lt!241157)) #b00000000000000000000000000000000 lt!241156))))

(declare-fun b!154782 () Bool)

(assert (=> b!154782 (= e!104111 e!104112)))

(declare-fun res!129506 () Bool)

(assert (=> b!154782 (= res!129506 call!2218)))

(assert (=> b!154782 (=> (not res!129506) (not e!104112))))

(declare-fun b!154783 () Bool)

(declare-fun arrayRangesEq!395 (array!7009 array!7009 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154783 (= e!104110 (arrayRangesEq!395 (buf!3658 bs1!10) (buf!3658 bs2!18) (_1!7260 lt!241157) (_2!7260 lt!241157)))))

(assert (= (and d!51018 (not res!129507)) b!154779))

(assert (= (and b!154779 (not res!129505)) b!154783))

(assert (= (and b!154779 res!129508) b!154777))

(assert (= (and b!154777 c!8234) b!154780))

(assert (= (and b!154777 (not c!8234)) b!154782))

(assert (= (and b!154782 res!129506) b!154778))

(assert (= (and b!154778 (not res!129504)) b!154781))

(assert (= (or b!154780 b!154782) bm!2215))

(declare-fun m!240723 () Bool)

(assert (=> bm!2215 m!240723))

(declare-fun m!240725 () Bool)

(assert (=> bm!2215 m!240725))

(assert (=> bm!2215 m!240723))

(assert (=> bm!2215 m!240725))

(declare-fun m!240727 () Bool)

(assert (=> bm!2215 m!240727))

(declare-fun m!240729 () Bool)

(assert (=> b!154779 m!240729))

(declare-fun m!240731 () Bool)

(assert (=> b!154781 m!240731))

(declare-fun m!240733 () Bool)

(assert (=> b!154781 m!240733))

(assert (=> b!154781 m!240731))

(assert (=> b!154781 m!240733))

(declare-fun m!240735 () Bool)

(assert (=> b!154781 m!240735))

(declare-fun m!240737 () Bool)

(assert (=> b!154783 m!240737))

(assert (=> b!154718 d!51018))

(declare-fun d!51024 () Bool)

(declare-fun e!104116 () Bool)

(assert (=> d!51024 e!104116))

(declare-fun res!129509 () Bool)

(assert (=> d!51024 (=> (not res!129509) (not e!104116))))

(declare-fun lt!241161 () (_ BitVec 64))

(declare-fun lt!241162 () (_ BitVec 64))

(declare-fun lt!241160 () (_ BitVec 64))

(assert (=> d!51024 (= res!129509 (= lt!241162 (bvsub lt!241160 lt!241161)))))

(assert (=> d!51024 (or (= (bvand lt!241160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241160 lt!241161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51024 (= lt!241161 (remainingBits!0 ((_ sign_extend 32) (size!3155 (buf!3658 bs1!10))) ((_ sign_extend 32) (currentByte!6686 bs1!10)) ((_ sign_extend 32) (currentBit!6681 bs1!10))))))

(declare-fun lt!241159 () (_ BitVec 64))

(declare-fun lt!241158 () (_ BitVec 64))

(assert (=> d!51024 (= lt!241160 (bvmul lt!241159 lt!241158))))

(assert (=> d!51024 (or (= lt!241159 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241158 (bvsdiv (bvmul lt!241159 lt!241158) lt!241159)))))

(assert (=> d!51024 (= lt!241158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51024 (= lt!241159 ((_ sign_extend 32) (size!3155 (buf!3658 bs1!10))))))

(assert (=> d!51024 (= lt!241162 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6686 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6681 bs1!10))))))

(assert (=> d!51024 (invariant!0 (currentBit!6681 bs1!10) (currentByte!6686 bs1!10) (size!3155 (buf!3658 bs1!10)))))

(assert (=> d!51024 (= (bitIndex!0 (size!3155 (buf!3658 bs1!10)) (currentByte!6686 bs1!10) (currentBit!6681 bs1!10)) lt!241162)))

(declare-fun b!154784 () Bool)

(declare-fun res!129510 () Bool)

(assert (=> b!154784 (=> (not res!129510) (not e!104116))))

(assert (=> b!154784 (= res!129510 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241162))))

(declare-fun b!154785 () Bool)

(declare-fun lt!241163 () (_ BitVec 64))

(assert (=> b!154785 (= e!104116 (bvsle lt!241162 (bvmul lt!241163 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154785 (or (= lt!241163 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241163 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241163)))))

(assert (=> b!154785 (= lt!241163 ((_ sign_extend 32) (size!3155 (buf!3658 bs1!10))))))

(assert (= (and d!51024 res!129509) b!154784))

(assert (= (and b!154784 res!129510) b!154785))

(declare-fun m!240739 () Bool)

(assert (=> d!51024 m!240739))

(assert (=> d!51024 m!240713))

(assert (=> b!154713 d!51024))

(declare-fun d!51026 () Bool)

(assert (=> d!51026 (= (array_inv!2944 (buf!3658 bs1!10)) (bvsge (size!3155 (buf!3658 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154714 d!51026))

(check-sat (not b!154781) (not d!51008) (not d!51012) (not b!154779) (not b!154783) (not d!51010) (not d!51024) (not d!51006) (not d!51004) (not bm!2215))

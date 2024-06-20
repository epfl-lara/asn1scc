; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30170 () Bool)

(assert start!30170)

(declare-fun b!154731 () Bool)

(declare-fun e!104076 () Bool)

(declare-datatypes ((array!7011 0))(
  ( (array!7012 (arr!3979 (Array (_ BitVec 32) (_ BitVec 8))) (size!3156 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5570 0))(
  ( (BitStream!5571 (buf!3659 array!7011) (currentByte!6687 (_ BitVec 32)) (currentBit!6682 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5570)

(declare-fun array_inv!2945 (array!7011) Bool)

(assert (=> b!154731 (= e!104076 (array_inv!2945 (buf!3659 bs2!18)))))

(declare-fun b!154732 () Bool)

(declare-fun e!104079 () Bool)

(declare-fun bs1!10 () BitStream!5570)

(assert (=> b!154732 (= e!104079 (array_inv!2945 (buf!3659 bs1!10)))))

(declare-fun b!154733 () Bool)

(declare-fun e!104077 () Bool)

(declare-fun lt!241102 () (_ BitVec 64))

(assert (=> b!154733 (= e!104077 (bvsgt #b00000000000000000000000000000000 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241102 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-datatypes ((tuple2!13706 0))(
  ( (tuple2!13707 (_1!7258 BitStream!5570) (_2!7258 (_ BitVec 8))) )
))
(declare-fun lt!241099 () tuple2!13706)

(declare-fun readBytePure!0 (BitStream!5570) tuple2!13706)

(assert (=> b!154733 (= lt!241099 (readBytePure!0 (BitStream!5571 (buf!3659 bs2!18) (currentByte!6687 bs1!10) (currentBit!6682 bs1!10))))))

(declare-fun lt!241101 () tuple2!13706)

(assert (=> b!154733 (= lt!241101 (readBytePure!0 bs1!10))))

(declare-fun b!154734 () Bool)

(declare-fun res!129469 () Bool)

(assert (=> b!154734 (=> (not res!129469) (not e!104077))))

(declare-fun lt!241100 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!7011 array!7011 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154734 (= res!129469 (arrayBitRangesEq!0 (buf!3659 bs1!10) (buf!3659 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241100))))

(declare-fun b!154735 () Bool)

(declare-fun res!129468 () Bool)

(assert (=> b!154735 (=> (not res!129468) (not e!104077))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154735 (= res!129468 (bvsle lt!241100 (bitIndex!0 (size!3156 (buf!3659 bs2!18)) (currentByte!6687 bs2!18) (currentBit!6682 bs2!18))))))

(declare-fun res!129471 () Bool)

(declare-fun e!104074 () Bool)

(assert (=> start!30170 (=> (not res!129471) (not e!104074))))

(assert (=> start!30170 (= res!129471 (= (size!3156 (buf!3659 bs1!10)) (size!3156 (buf!3659 bs2!18))))))

(assert (=> start!30170 e!104074))

(declare-fun inv!12 (BitStream!5570) Bool)

(assert (=> start!30170 (and (inv!12 bs1!10) e!104079)))

(assert (=> start!30170 (and (inv!12 bs2!18) e!104076)))

(declare-fun b!154736 () Bool)

(assert (=> b!154736 (= e!104074 e!104077)))

(declare-fun res!129470 () Bool)

(assert (=> b!154736 (=> (not res!129470) (not e!104077))))

(assert (=> b!154736 (= res!129470 (bvsle lt!241100 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3156 (buf!3659 bs1!10))))))))

(assert (=> b!154736 (= lt!241100 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241102))))

(assert (=> b!154736 (= lt!241102 (bitIndex!0 (size!3156 (buf!3659 bs1!10)) (currentByte!6687 bs1!10) (currentBit!6682 bs1!10)))))

(assert (= (and start!30170 res!129471) b!154736))

(assert (= (and b!154736 res!129470) b!154735))

(assert (= (and b!154735 res!129468) b!154734))

(assert (= (and b!154734 res!129469) b!154733))

(assert (= start!30170 b!154732))

(assert (= start!30170 b!154731))

(declare-fun m!240691 () Bool)

(assert (=> b!154733 m!240691))

(declare-fun m!240693 () Bool)

(assert (=> b!154733 m!240693))

(declare-fun m!240695 () Bool)

(assert (=> b!154735 m!240695))

(declare-fun m!240697 () Bool)

(assert (=> b!154732 m!240697))

(declare-fun m!240699 () Bool)

(assert (=> b!154736 m!240699))

(declare-fun m!240701 () Bool)

(assert (=> b!154731 m!240701))

(declare-fun m!240703 () Bool)

(assert (=> b!154734 m!240703))

(declare-fun m!240705 () Bool)

(assert (=> start!30170 m!240705))

(declare-fun m!240707 () Bool)

(assert (=> start!30170 m!240707))

(push 1)

(assert (not b!154736))

(assert (not b!154733))

(assert (not b!154735))

(assert (not start!30170))

(assert (not b!154731))

(assert (not b!154734))

(assert (not b!154732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51022 () Bool)

(declare-fun e!104126 () Bool)

(assert (=> d!51022 e!104126))

(declare-fun res!129522 () Bool)

(assert (=> d!51022 (=> (not res!129522) (not e!104126))))

(declare-fun lt!241189 () (_ BitVec 64))

(declare-fun lt!241186 () (_ BitVec 64))

(declare-fun lt!241185 () (_ BitVec 64))

(assert (=> d!51022 (= res!129522 (= lt!241185 (bvsub lt!241186 lt!241189)))))

(assert (=> d!51022 (or (= (bvand lt!241186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241189 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241186 lt!241189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51022 (= lt!241189 (remainingBits!0 ((_ sign_extend 32) (size!3156 (buf!3659 bs2!18))) ((_ sign_extend 32) (currentByte!6687 bs2!18)) ((_ sign_extend 32) (currentBit!6682 bs2!18))))))

(declare-fun lt!241188 () (_ BitVec 64))

(declare-fun lt!241190 () (_ BitVec 64))

(assert (=> d!51022 (= lt!241186 (bvmul lt!241188 lt!241190))))

(assert (=> d!51022 (or (= lt!241188 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241190 (bvsdiv (bvmul lt!241188 lt!241190) lt!241188)))))

(assert (=> d!51022 (= lt!241190 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51022 (= lt!241188 ((_ sign_extend 32) (size!3156 (buf!3659 bs2!18))))))

(assert (=> d!51022 (= lt!241185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6687 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6682 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51022 (invariant!0 (currentBit!6682 bs2!18) (currentByte!6687 bs2!18) (size!3156 (buf!3659 bs2!18)))))

(assert (=> d!51022 (= (bitIndex!0 (size!3156 (buf!3659 bs2!18)) (currentByte!6687 bs2!18) (currentBit!6682 bs2!18)) lt!241185)))

(declare-fun b!154799 () Bool)

(declare-fun res!129523 () Bool)

(assert (=> b!154799 (=> (not res!129523) (not e!104126))))

(assert (=> b!154799 (= res!129523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241185))))

(declare-fun b!154800 () Bool)

(declare-fun lt!241187 () (_ BitVec 64))

(assert (=> b!154800 (= e!104126 (bvsle lt!241185 (bvmul lt!241187 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154800 (or (= lt!241187 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241187 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241187)))))

(assert (=> b!154800 (= lt!241187 ((_ sign_extend 32) (size!3156 (buf!3659 bs2!18))))))

(assert (= (and d!51022 res!129522) b!154799))

(assert (= (and b!154799 res!129523) b!154800))

(declare-fun m!240761 () Bool)

(assert (=> d!51022 m!240761))

(declare-fun m!240763 () Bool)

(assert (=> d!51022 m!240763))

(assert (=> b!154735 d!51022))

(declare-fun d!51038 () Bool)

(declare-fun e!104127 () Bool)

(assert (=> d!51038 e!104127))

(declare-fun res!129524 () Bool)

(assert (=> d!51038 (=> (not res!129524) (not e!104127))))

(declare-fun lt!241195 () (_ BitVec 64))

(declare-fun lt!241192 () (_ BitVec 64))

(declare-fun lt!241191 () (_ BitVec 64))

(assert (=> d!51038 (= res!129524 (= lt!241191 (bvsub lt!241192 lt!241195)))))

(assert (=> d!51038 (or (= (bvand lt!241192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241192 lt!241195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51038 (= lt!241195 (remainingBits!0 ((_ sign_extend 32) (size!3156 (buf!3659 bs1!10))) ((_ sign_extend 32) (currentByte!6687 bs1!10)) ((_ sign_extend 32) (currentBit!6682 bs1!10))))))

(declare-fun lt!241194 () (_ BitVec 64))

(declare-fun lt!241196 () (_ BitVec 64))

(assert (=> d!51038 (= lt!241192 (bvmul lt!241194 lt!241196))))

(assert (=> d!51038 (or (= lt!241194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241196 (bvsdiv (bvmul lt!241194 lt!241196) lt!241194)))))

(assert (=> d!51038 (= lt!241196 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51038 (= lt!241194 ((_ sign_extend 32) (size!3156 (buf!3659 bs1!10))))))

(assert (=> d!51038 (= lt!241191 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6687 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6682 bs1!10))))))

(assert (=> d!51038 (invariant!0 (currentBit!6682 bs1!10) (currentByte!6687 bs1!10) (size!3156 (buf!3659 bs1!10)))))

(assert (=> d!51038 (= (bitIndex!0 (size!3156 (buf!3659 bs1!10)) (currentByte!6687 bs1!10) (currentBit!6682 bs1!10)) lt!241191)))

(declare-fun b!154801 () Bool)

(declare-fun res!129525 () Bool)

(assert (=> b!154801 (=> (not res!129525) (not e!104127))))

(assert (=> b!154801 (= res!129525 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241191))))

(declare-fun b!154802 () Bool)

(declare-fun lt!241193 () (_ BitVec 64))

(assert (=> b!154802 (= e!104127 (bvsle lt!241191 (bvmul lt!241193 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154802 (or (= lt!241193 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241193 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241193)))))

(assert (=> b!154802 (= lt!241193 ((_ sign_extend 32) (size!3156 (buf!3659 bs1!10))))))

(assert (= (and d!51038 res!129524) b!154801))

(assert (= (and b!154801 res!129525) b!154802))

(declare-fun m!240765 () Bool)

(assert (=> d!51038 m!240765))

(declare-fun m!240767 () Bool)

(assert (=> d!51038 m!240767))

(assert (=> b!154736 d!51038))

(declare-fun d!51040 () Bool)

(assert (=> d!51040 (= (array_inv!2945 (buf!3659 bs2!18)) (bvsge (size!3156 (buf!3659 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154731 d!51040))

(declare-fun d!51042 () Bool)

(assert (=> d!51042 (= (array_inv!2945 (buf!3659 bs1!10)) (bvsge (size!3156 (buf!3659 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154732 d!51042))

(declare-fun d!51044 () Bool)

(declare-datatypes ((tuple2!13712 0))(
  ( (tuple2!13713 (_1!7263 (_ BitVec 8)) (_2!7263 BitStream!5570)) )
))
(declare-fun lt!241203 () tuple2!13712)

(declare-fun readByte!0 (BitStream!5570) tuple2!13712)

(assert (=> d!51044 (= lt!241203 (readByte!0 (BitStream!5571 (buf!3659 bs2!18) (currentByte!6687 bs1!10) (currentBit!6682 bs1!10))))))

(assert (=> d!51044 (= (readBytePure!0 (BitStream!5571 (buf!3659 bs2!18) (currentByte!6687 bs1!10) (currentBit!6682 bs1!10))) (tuple2!13707 (_2!7263 lt!241203) (_1!7263 lt!241203)))))

(declare-fun bs!12490 () Bool)

(assert (= bs!12490 d!51044))

(declare-fun m!240773 () Bool)

(assert (=> bs!12490 m!240773))

(assert (=> b!154733 d!51044))

(declare-fun d!51048 () Bool)

(declare-fun lt!241204 () tuple2!13712)

(assert (=> d!51048 (= lt!241204 (readByte!0 bs1!10))))

(assert (=> d!51048 (= (readBytePure!0 bs1!10) (tuple2!13707 (_2!7263 lt!241204) (_1!7263 lt!241204)))))

(declare-fun bs!12491 () Bool)

(assert (= bs!12491 d!51048))

(declare-fun m!240775 () Bool)

(assert (=> bs!12491 m!240775))

(assert (=> b!154733 d!51048))

(declare-fun lt!241211 () (_ BitVec 32))

(declare-fun call!2222 () Bool)

(declare-fun c!8238 () Bool)

(declare-datatypes ((tuple4!208 0))(
  ( (tuple4!209 (_1!7264 (_ BitVec 32)) (_2!7264 (_ BitVec 32)) (_3!407 (_ BitVec 32)) (_4!104 (_ BitVec 32))) )
))
(declare-fun lt!241212 () tuple4!208)

(declare-fun lt!241213 () (_ BitVec 32))

(declare-fun bm!2219 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2219 (= call!2222 (byteRangesEq!0 (ite c!8238 (select (arr!3979 (buf!3659 bs1!10)) (_3!407 lt!241212)) (select (arr!3979 (buf!3659 bs1!10)) (_4!104 lt!241212))) (ite c!8238 (select (arr!3979 (buf!3659 bs2!18)) (_3!407 lt!241212)) (select (arr!3979 (buf!3659 bs2!18)) (_4!104 lt!241212))) (ite c!8238 lt!241213 #b00000000000000000000000000000000) lt!241211))))

(declare-fun b!154817 () Bool)

(declare-fun e!104140 () Bool)

(assert (=> b!154817 (= e!104140 call!2222)))

(declare-fun d!51050 () Bool)

(declare-fun res!129538 () Bool)

(declare-fun e!104141 () Bool)

(assert (=> d!51050 (=> res!129538 e!104141)))

(assert (=> d!51050 (= res!129538 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241100))))

(assert (=> d!51050 (= (arrayBitRangesEq!0 (buf!3659 bs1!10) (buf!3659 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241100) e!104141)))

(declare-fun b!154818 () Bool)

(declare-fun res!129536 () Bool)

(assert (=> b!154818 (= res!129536 (= lt!241211 #b00000000000000000000000000000000))))

(assert (=> b!154818 (=> res!129536 e!104140)))

(declare-fun e!104144 () Bool)

(assert (=> b!154818 (= e!104144 e!104140)))

(declare-fun e!104142 () Bool)

(declare-fun b!154819 () Bool)

(declare-fun arrayRangesEq!397 (array!7011 array!7011 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154819 (= e!104142 (arrayRangesEq!397 (buf!3659 bs1!10) (buf!3659 bs2!18) (_1!7264 lt!241212) (_2!7264 lt!241212)))))

(declare-fun b!154820 () Bool)

(declare-fun e!104143 () Bool)

(assert (=> b!154820 (= e!104143 e!104144)))

(declare-fun res!129537 () Bool)

(assert (=> b!154820 (= res!129537 (byteRangesEq!0 (select (arr!3979 (buf!3659 bs1!10)) (_3!407 lt!241212)) (select (arr!3979 (buf!3659 bs2!18)) (_3!407 lt!241212)) lt!241213 #b00000000000000000000000000001000))))

(assert (=> b!154820 (=> (not res!129537) (not e!104144))))

(declare-fun b!154821 () Bool)

(declare-fun e!104145 () Bool)

(assert (=> b!154821 (= e!104141 e!104145)))

(declare-fun res!129539 () Bool)

(assert (=> b!154821 (=> (not res!129539) (not e!104145))))

(assert (=> b!154821 (= res!129539 e!104142)))

(declare-fun res!129540 () Bool)

(assert (=> b!154821 (=> res!129540 e!104142)))

(assert (=> b!154821 (= res!129540 (bvsge (_1!7264 lt!241212) (_2!7264 lt!241212)))))

(assert (=> b!154821 (= lt!241211 ((_ extract 31 0) (bvsrem lt!241100 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154821 (= lt!241213 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!208)

(assert (=> b!154821 (= lt!241212 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241100))))

(declare-fun b!154822 () Bool)

(assert (=> b!154822 (= e!104145 e!104143)))

(assert (=> b!154822 (= c!8238 (= (_3!407 lt!241212) (_4!104 lt!241212)))))

(declare-fun b!154823 () Bool)

(assert (=> b!154823 (= e!104143 call!2222)))

(assert (= (and d!51050 (not res!129538)) b!154821))

(assert (= (and b!154821 (not res!129540)) b!154819))

(assert (= (and b!154821 res!129539) b!154822))

(assert (= (and b!154822 c!8238) b!154823))

(assert (= (and b!154822 (not c!8238)) b!154820))

(assert (= (and b!154820 res!129537) b!154818))

(assert (= (and b!154818 (not res!129536)) b!154817))

(assert (= (or b!154823 b!154817) bm!2219))

(declare-fun m!240777 () Bool)

(assert (=> bm!2219 m!240777))

(declare-fun m!240779 () Bool)

(assert (=> bm!2219 m!240779))

(declare-fun m!240781 () Bool)

(assert (=> bm!2219 m!240781))

(declare-fun m!240783 () Bool)

(assert (=> bm!2219 m!240783))

(declare-fun m!240785 () Bool)

(assert (=> bm!2219 m!240785))

(declare-fun m!240787 () Bool)

(assert (=> b!154819 m!240787))

(assert (=> b!154820 m!240783))

(assert (=> b!154820 m!240781))

(assert (=> b!154820 m!240783))

(assert (=> b!154820 m!240781))

(declare-fun m!240789 () Bool)

(assert (=> b!154820 m!240789))

(declare-fun m!240791 () Bool)

(assert (=> b!154821 m!240791))

(assert (=> b!154734 d!51050))

(declare-fun d!51052 () Bool)

(assert (=> d!51052 (= (inv!12 bs1!10) (invariant!0 (currentBit!6682 bs1!10) (currentByte!6687 bs1!10) (size!3156 (buf!3659 bs1!10))))))

(declare-fun bs!12492 () Bool)

(assert (= bs!12492 d!51052))

(assert (=> bs!12492 m!240767))

(assert (=> start!30170 d!51052))

(declare-fun d!51054 () Bool)

(assert (=> d!51054 (= (inv!12 bs2!18) (invariant!0 (currentBit!6682 bs2!18) (currentByte!6687 bs2!18) (size!3156 (buf!3659 bs2!18))))))

(declare-fun bs!12493 () Bool)

(assert (= bs!12493 d!51054))

(assert (=> bs!12493 m!240763))

(assert (=> start!30170 d!51054))

(push 1)

(assert (not d!51038))

(assert (not d!51022))

(assert (not bm!2219))

(assert (not b!154820))

(assert (not d!51048))

(assert (not d!51052))

(assert (not d!51054))

(assert (not d!51044))

(assert (not b!154819))

(assert (not b!154821))

(check-sat)

(pop 1)

(push 1)

(check-sat)


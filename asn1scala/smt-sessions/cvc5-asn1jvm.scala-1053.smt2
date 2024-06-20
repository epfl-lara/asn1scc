; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30166 () Bool)

(assert start!30166)

(declare-fun b!154695 () Bool)

(declare-fun e!104039 () Bool)

(declare-datatypes ((array!7007 0))(
  ( (array!7008 (arr!3977 (Array (_ BitVec 32) (_ BitVec 8))) (size!3154 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5566 0))(
  ( (BitStream!5567 (buf!3657 array!7007) (currentByte!6685 (_ BitVec 32)) (currentBit!6680 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5566)

(declare-fun array_inv!2943 (array!7007) Bool)

(assert (=> b!154695 (= e!104039 (array_inv!2943 (buf!3657 bs1!10)))))

(declare-fun b!154696 () Bool)

(declare-fun res!129447 () Bool)

(declare-fun e!104041 () Bool)

(assert (=> b!154696 (=> (not res!129447) (not e!104041))))

(declare-fun lt!241076 () (_ BitVec 64))

(declare-fun bs2!18 () BitStream!5566)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154696 (= res!129447 (bvsle lt!241076 (bitIndex!0 (size!3154 (buf!3657 bs2!18)) (currentByte!6685 bs2!18) (currentBit!6680 bs2!18))))))

(declare-fun b!154698 () Bool)

(declare-fun e!104040 () Bool)

(assert (=> b!154698 (= e!104040 (array_inv!2943 (buf!3657 bs2!18)))))

(declare-fun b!154697 () Bool)

(declare-fun res!129446 () Bool)

(assert (=> b!154697 (=> (not res!129446) (not e!104041))))

(declare-fun arrayBitRangesEq!0 (array!7007 array!7007 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154697 (= res!129446 (arrayBitRangesEq!0 (buf!3657 bs1!10) (buf!3657 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241076))))

(declare-fun res!129445 () Bool)

(declare-fun e!104042 () Bool)

(assert (=> start!30166 (=> (not res!129445) (not e!104042))))

(assert (=> start!30166 (= res!129445 (= (size!3154 (buf!3657 bs1!10)) (size!3154 (buf!3657 bs2!18))))))

(assert (=> start!30166 e!104042))

(declare-fun inv!12 (BitStream!5566) Bool)

(assert (=> start!30166 (and (inv!12 bs1!10) e!104039)))

(assert (=> start!30166 (and (inv!12 bs2!18) e!104040)))

(declare-fun b!154699 () Bool)

(assert (=> b!154699 (= e!104042 e!104041)))

(declare-fun res!129444 () Bool)

(assert (=> b!154699 (=> (not res!129444) (not e!104041))))

(assert (=> b!154699 (= res!129444 (bvsle lt!241076 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3154 (buf!3657 bs1!10))))))))

(declare-fun lt!241075 () (_ BitVec 64))

(assert (=> b!154699 (= lt!241076 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241075))))

(assert (=> b!154699 (= lt!241075 (bitIndex!0 (size!3154 (buf!3657 bs1!10)) (currentByte!6685 bs1!10) (currentBit!6680 bs1!10)))))

(declare-fun b!154700 () Bool)

(assert (=> b!154700 (= e!104041 (bvsgt #b00000000000000000000000000000000 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241075 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-datatypes ((tuple2!13702 0))(
  ( (tuple2!13703 (_1!7256 BitStream!5566) (_2!7256 (_ BitVec 8))) )
))
(declare-fun lt!241077 () tuple2!13702)

(declare-fun readBytePure!0 (BitStream!5566) tuple2!13702)

(assert (=> b!154700 (= lt!241077 (readBytePure!0 (BitStream!5567 (buf!3657 bs2!18) (currentByte!6685 bs1!10) (currentBit!6680 bs1!10))))))

(declare-fun lt!241078 () tuple2!13702)

(assert (=> b!154700 (= lt!241078 (readBytePure!0 bs1!10))))

(assert (= (and start!30166 res!129445) b!154699))

(assert (= (and b!154699 res!129444) b!154696))

(assert (= (and b!154696 res!129447) b!154697))

(assert (= (and b!154697 res!129446) b!154700))

(assert (= start!30166 b!154695))

(assert (= start!30166 b!154698))

(declare-fun m!240655 () Bool)

(assert (=> b!154697 m!240655))

(declare-fun m!240657 () Bool)

(assert (=> b!154700 m!240657))

(declare-fun m!240659 () Bool)

(assert (=> b!154700 m!240659))

(declare-fun m!240661 () Bool)

(assert (=> b!154696 m!240661))

(declare-fun m!240663 () Bool)

(assert (=> b!154698 m!240663))

(declare-fun m!240665 () Bool)

(assert (=> b!154699 m!240665))

(declare-fun m!240667 () Bool)

(assert (=> b!154695 m!240667))

(declare-fun m!240669 () Bool)

(assert (=> start!30166 m!240669))

(declare-fun m!240671 () Bool)

(assert (=> start!30166 m!240671))

(push 1)

(assert (not b!154696))

(assert (not b!154698))

(assert (not b!154699))

(assert (not b!154697))

(assert (not b!154695))

(assert (not b!154700))

(assert (not start!30166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51014 () Bool)

(assert (=> d!51014 (= (array_inv!2943 (buf!3657 bs1!10)) (bvsge (size!3154 (buf!3657 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154695 d!51014))

(declare-fun d!51016 () Bool)

(declare-fun e!104085 () Bool)

(assert (=> d!51016 e!104085))

(declare-fun res!129483 () Bool)

(assert (=> d!51016 (=> (not res!129483) (not e!104085))))

(declare-fun lt!241137 () (_ BitVec 64))

(declare-fun lt!241138 () (_ BitVec 64))

(declare-fun lt!241140 () (_ BitVec 64))

(assert (=> d!51016 (= res!129483 (= lt!241138 (bvsub lt!241137 lt!241140)))))

(assert (=> d!51016 (or (= (bvand lt!241137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241137 lt!241140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51016 (= lt!241140 (remainingBits!0 ((_ sign_extend 32) (size!3154 (buf!3657 bs2!18))) ((_ sign_extend 32) (currentByte!6685 bs2!18)) ((_ sign_extend 32) (currentBit!6680 bs2!18))))))

(declare-fun lt!241141 () (_ BitVec 64))

(declare-fun lt!241139 () (_ BitVec 64))

(assert (=> d!51016 (= lt!241137 (bvmul lt!241141 lt!241139))))

(assert (=> d!51016 (or (= lt!241141 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241139 (bvsdiv (bvmul lt!241141 lt!241139) lt!241141)))))

(assert (=> d!51016 (= lt!241139 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51016 (= lt!241141 ((_ sign_extend 32) (size!3154 (buf!3657 bs2!18))))))

(assert (=> d!51016 (= lt!241138 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6685 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6680 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51016 (invariant!0 (currentBit!6680 bs2!18) (currentByte!6685 bs2!18) (size!3154 (buf!3657 bs2!18)))))

(assert (=> d!51016 (= (bitIndex!0 (size!3154 (buf!3657 bs2!18)) (currentByte!6685 bs2!18) (currentBit!6680 bs2!18)) lt!241138)))

(declare-fun b!154747 () Bool)

(declare-fun res!129482 () Bool)

(assert (=> b!154747 (=> (not res!129482) (not e!104085))))

(assert (=> b!154747 (= res!129482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241138))))

(declare-fun b!154748 () Bool)

(declare-fun lt!241142 () (_ BitVec 64))

(assert (=> b!154748 (= e!104085 (bvsle lt!241138 (bvmul lt!241142 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154748 (or (= lt!241142 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241142 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241142)))))

(assert (=> b!154748 (= lt!241142 ((_ sign_extend 32) (size!3154 (buf!3657 bs2!18))))))

(assert (= (and d!51016 res!129483) b!154747))

(assert (= (and b!154747 res!129482) b!154748))

(declare-fun m!240719 () Bool)

(assert (=> d!51016 m!240719))

(declare-fun m!240721 () Bool)

(assert (=> d!51016 m!240721))

(assert (=> b!154696 d!51016))

(declare-fun b!154786 () Bool)

(declare-fun e!104117 () Bool)

(declare-fun call!2219 () Bool)

(assert (=> b!154786 (= e!104117 call!2219)))

(declare-fun b!154787 () Bool)

(declare-fun e!104118 () Bool)

(assert (=> b!154787 (= e!104118 e!104117)))

(declare-fun c!8235 () Bool)

(declare-datatypes ((tuple4!206 0))(
  ( (tuple4!207 (_1!7261 (_ BitVec 32)) (_2!7261 (_ BitVec 32)) (_3!406 (_ BitVec 32)) (_4!103 (_ BitVec 32))) )
))
(declare-fun lt!241164 () tuple4!206)

(assert (=> b!154787 (= c!8235 (= (_3!406 lt!241164) (_4!103 lt!241164)))))

(declare-fun d!51020 () Bool)

(declare-fun res!129511 () Bool)

(declare-fun e!104121 () Bool)

(assert (=> d!51020 (=> res!129511 e!104121)))

(assert (=> d!51020 (= res!129511 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241076))))

(assert (=> d!51020 (= (arrayBitRangesEq!0 (buf!3657 bs1!10) (buf!3657 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241076) e!104121)))

(declare-fun b!154788 () Bool)

(assert (=> b!154788 (= e!104121 e!104118)))

(declare-fun res!129514 () Bool)

(assert (=> b!154788 (=> (not res!129514) (not e!104118))))

(declare-fun e!104122 () Bool)

(assert (=> b!154788 (= res!129514 e!104122)))

(declare-fun res!129513 () Bool)

(assert (=> b!154788 (=> res!129513 e!104122)))

(assert (=> b!154788 (= res!129513 (bvsge (_1!7261 lt!241164) (_2!7261 lt!241164)))))

(declare-fun lt!241166 () (_ BitVec 32))

(assert (=> b!154788 (= lt!241166 ((_ extract 31 0) (bvsrem lt!241076 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!241165 () (_ BitVec 32))

(assert (=> b!154788 (= lt!241165 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!206)

(assert (=> b!154788 (= lt!241164 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241076))))

(declare-fun b!154789 () Bool)

(declare-fun e!104120 () Bool)

(assert (=> b!154789 (= e!104117 e!104120)))

(declare-fun res!129515 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154789 (= res!129515 (byteRangesEq!0 (select (arr!3977 (buf!3657 bs1!10)) (_3!406 lt!241164)) (select (arr!3977 (buf!3657 bs2!18)) (_3!406 lt!241164)) lt!241165 #b00000000000000000000000000001000))))

(assert (=> b!154789 (=> (not res!129515) (not e!104120))))

(declare-fun b!154790 () Bool)

(declare-fun arrayRangesEq!396 (array!7007 array!7007 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154790 (= e!104122 (arrayRangesEq!396 (buf!3657 bs1!10) (buf!3657 bs2!18) (_1!7261 lt!241164) (_2!7261 lt!241164)))))

(declare-fun b!154791 () Bool)

(declare-fun res!129512 () Bool)

(assert (=> b!154791 (= res!129512 (= lt!241166 #b00000000000000000000000000000000))))

(declare-fun e!104119 () Bool)

(assert (=> b!154791 (=> res!129512 e!104119)))

(assert (=> b!154791 (= e!104120 e!104119)))

(declare-fun b!154792 () Bool)

(assert (=> b!154792 (= e!104119 call!2219)))

(declare-fun bm!2216 () Bool)

(assert (=> bm!2216 (= call!2219 (byteRangesEq!0 (ite c!8235 (select (arr!3977 (buf!3657 bs1!10)) (_3!406 lt!241164)) (select (arr!3977 (buf!3657 bs1!10)) (_4!103 lt!241164))) (ite c!8235 (select (arr!3977 (buf!3657 bs2!18)) (_3!406 lt!241164)) (select (arr!3977 (buf!3657 bs2!18)) (_4!103 lt!241164))) (ite c!8235 lt!241165 #b00000000000000000000000000000000) lt!241166))))

(assert (= (and d!51020 (not res!129511)) b!154788))

(assert (= (and b!154788 (not res!129513)) b!154790))

(assert (= (and b!154788 res!129514) b!154787))

(assert (= (and b!154787 c!8235) b!154786))

(assert (= (and b!154787 (not c!8235)) b!154789))

(assert (= (and b!154789 res!129515) b!154791))

(assert (= (and b!154791 (not res!129512)) b!154792))

(assert (= (or b!154786 b!154792) bm!2216))

(declare-fun m!240741 () Bool)

(assert (=> b!154788 m!240741))

(declare-fun m!240743 () Bool)

(assert (=> b!154789 m!240743))

(declare-fun m!240745 () Bool)

(assert (=> b!154789 m!240745))

(assert (=> b!154789 m!240743))

(assert (=> b!154789 m!240745))

(declare-fun m!240747 () Bool)

(assert (=> b!154789 m!240747))

(declare-fun m!240749 () Bool)

(assert (=> b!154790 m!240749))

(assert (=> bm!2216 m!240745))

(declare-fun m!240751 () Bool)

(assert (=> bm!2216 m!240751))

(declare-fun m!240753 () Bool)

(assert (=> bm!2216 m!240753))

(assert (=> bm!2216 m!240743))

(declare-fun m!240755 () Bool)

(assert (=> bm!2216 m!240755))

(assert (=> b!154697 d!51020))

(declare-fun d!51028 () Bool)

(assert (=> d!51028 (= (array_inv!2943 (buf!3657 bs2!18)) (bvsge (size!3154 (buf!3657 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154698 d!51028))

(declare-fun d!51030 () Bool)

(assert (=> d!51030 (= (inv!12 bs1!10) (invariant!0 (currentBit!6680 bs1!10) (currentByte!6685 bs1!10) (size!3154 (buf!3657 bs1!10))))))

(declare-fun bs!12486 () Bool)

(assert (= bs!12486 d!51030))

(declare-fun m!240757 () Bool)

(assert (=> bs!12486 m!240757))

(assert (=> start!30166 d!51030))

(declare-fun d!51032 () Bool)

(assert (=> d!51032 (= (inv!12 bs2!18) (invariant!0 (currentBit!6680 bs2!18) (currentByte!6685 bs2!18) (size!3154 (buf!3657 bs2!18))))))

(declare-fun bs!12487 () Bool)

(assert (= bs!12487 d!51032))

(assert (=> bs!12487 m!240721))

(assert (=> start!30166 d!51032))

(declare-fun d!51034 () Bool)

(declare-fun e!104125 () Bool)

(assert (=> d!51034 e!104125))

(declare-fun res!129521 () Bool)

(assert (=> d!51034 (=> (not res!129521) (not e!104125))))

(declare-fun lt!241180 () (_ BitVec 64))

(declare-fun lt!241179 () (_ BitVec 64))

(declare-fun lt!241182 () (_ BitVec 64))

(assert (=> d!51034 (= res!129521 (= lt!241180 (bvsub lt!241179 lt!241182)))))

(assert (=> d!51034 (or (= (bvand lt!241179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241179 lt!241182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51034 (= lt!241182 (remainingBits!0 ((_ sign_extend 32) (size!3154 (buf!3657 bs1!10))) ((_ sign_extend 32) (currentByte!6685 bs1!10)) ((_ sign_extend 32) (currentBit!6680 bs1!10))))))

(declare-fun lt!241183 () (_ BitVec 64))

(declare-fun lt!241181 () (_ BitVec 64))

(assert (=> d!51034 (= lt!241179 (bvmul lt!241183 lt!241181))))

(assert (=> d!51034 (or (= lt!241183 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241181 (bvsdiv (bvmul lt!241183 lt!241181) lt!241183)))))

(assert (=> d!51034 (= lt!241181 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51034 (= lt!241183 ((_ sign_extend 32) (size!3154 (buf!3657 bs1!10))))))

(assert (=> d!51034 (= lt!241180 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6685 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6680 bs1!10))))))

(assert (=> d!51034 (invariant!0 (currentBit!6680 bs1!10) (currentByte!6685 bs1!10) (size!3154 (buf!3657 bs1!10)))))

(assert (=> d!51034 (= (bitIndex!0 (size!3154 (buf!3657 bs1!10)) (currentByte!6685 bs1!10) (currentBit!6680 bs1!10)) lt!241180)))

(declare-fun b!154797 () Bool)

(declare-fun res!129520 () Bool)

(assert (=> b!154797 (=> (not res!129520) (not e!104125))))

(assert (=> b!154797 (= res!129520 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241180))))

(declare-fun b!154798 () Bool)

(declare-fun lt!241184 () (_ BitVec 64))

(assert (=> b!154798 (= e!104125 (bvsle lt!241180 (bvmul lt!241184 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154798 (or (= lt!241184 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241184 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241184)))))

(assert (=> b!154798 (= lt!241184 ((_ sign_extend 32) (size!3154 (buf!3657 bs1!10))))))

(assert (= (and d!51034 res!129521) b!154797))

(assert (= (and b!154797 res!129520) b!154798))

(declare-fun m!240759 () Bool)

(assert (=> d!51034 m!240759))

(assert (=> d!51034 m!240757))

(assert (=> b!154699 d!51034))

(declare-fun d!51036 () Bool)

(declare-datatypes ((tuple2!13710 0))(
  ( (tuple2!13711 (_1!7262 (_ BitVec 8)) (_2!7262 BitStream!5566)) )
))
(declare-fun lt!241199 () tuple2!13710)

(declare-fun readByte!0 (BitStream!5566) tuple2!13710)

(assert (=> d!51036 (= lt!241199 (readByte!0 (BitStream!5567 (buf!3657 bs2!18) (currentByte!6685 bs1!10) (currentBit!6680 bs1!10))))))

(assert (=> d!51036 (= (readBytePure!0 (BitStream!5567 (buf!3657 bs2!18) (currentByte!6685 bs1!10) (currentBit!6680 bs1!10))) (tuple2!13703 (_2!7262 lt!241199) (_1!7262 lt!241199)))))

(declare-fun bs!12488 () Bool)

(assert (= bs!12488 d!51036))

(declare-fun m!240769 () Bool)

(assert (=> bs!12488 m!240769))

(assert (=> b!154700 d!51036))

(declare-fun d!51046 () Bool)

(declare-fun lt!241200 () tuple2!13710)

(assert (=> d!51046 (= lt!241200 (readByte!0 bs1!10))))

(assert (=> d!51046 (= (readBytePure!0 bs1!10) (tuple2!13703 (_2!7262 lt!241200) (_1!7262 lt!241200)))))

(declare-fun bs!12489 () Bool)

(assert (= bs!12489 d!51046))

(declare-fun m!240771 () Bool)

(assert (=> bs!12489 m!240771))

(assert (=> b!154700 d!51046))

(push 1)

(assert (not bm!2216))

(assert (not d!51046))

(assert (not d!51036))

(assert (not d!51032))

(assert (not d!51030))

(assert (not b!154790))

(assert (not d!51034))

(assert (not b!154788))

(assert (not b!154789))

(assert (not d!51016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


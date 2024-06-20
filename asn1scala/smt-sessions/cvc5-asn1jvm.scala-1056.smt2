; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30244 () Bool)

(assert start!30244)

(declare-fun b!155031 () Bool)

(declare-fun res!129692 () Bool)

(declare-fun e!104334 () Bool)

(assert (=> b!155031 (=> (not res!129692) (not e!104334))))

(declare-datatypes ((array!7031 0))(
  ( (array!7032 (arr!3986 (Array (_ BitVec 32) (_ BitVec 8))) (size!3163 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5584 0))(
  ( (BitStream!5585 (buf!3666 array!7031) (currentByte!6700 (_ BitVec 32)) (currentBit!6695 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5584)

(declare-fun lt!241409 () (_ BitVec 64))

(declare-fun bs1!10 () BitStream!5584)

(declare-fun arrayBitRangesEq!0 (array!7031 array!7031 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155031 (= res!129692 (arrayBitRangesEq!0 (buf!3666 bs1!10) (buf!3666 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241409))))

(declare-fun b!155032 () Bool)

(declare-fun lt!241410 () (_ BitVec 32))

(assert (=> b!155032 (= e!104334 (and (bvsle #b00000000000000000000000000000000 lt!241410) (bvsle lt!241410 (size!3163 (buf!3666 bs1!10))) (or (bvsgt #b00000000000000000000000000000000 (currentByte!6700 bs1!10)) (bvsge (currentByte!6700 bs1!10) lt!241410))))))

(declare-fun lt!241411 () (_ BitVec 64))

(assert (=> b!155032 (= lt!241410 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241411 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13732 0))(
  ( (tuple2!13733 (_1!7277 BitStream!5584) (_2!7277 (_ BitVec 8))) )
))
(declare-fun lt!241408 () tuple2!13732)

(declare-fun readBytePure!0 (BitStream!5584) tuple2!13732)

(assert (=> b!155032 (= lt!241408 (readBytePure!0 (BitStream!5585 (buf!3666 bs2!18) (currentByte!6700 bs1!10) (currentBit!6695 bs1!10))))))

(declare-fun lt!241407 () tuple2!13732)

(assert (=> b!155032 (= lt!241407 (readBytePure!0 bs1!10))))

(declare-fun res!129693 () Bool)

(declare-fun e!104336 () Bool)

(assert (=> start!30244 (=> (not res!129693) (not e!104336))))

(assert (=> start!30244 (= res!129693 (= (size!3163 (buf!3666 bs1!10)) (size!3163 (buf!3666 bs2!18))))))

(assert (=> start!30244 e!104336))

(declare-fun e!104335 () Bool)

(declare-fun inv!12 (BitStream!5584) Bool)

(assert (=> start!30244 (and (inv!12 bs1!10) e!104335)))

(declare-fun e!104337 () Bool)

(assert (=> start!30244 (and (inv!12 bs2!18) e!104337)))

(declare-fun b!155033 () Bool)

(declare-fun array_inv!2952 (array!7031) Bool)

(assert (=> b!155033 (= e!104335 (array_inv!2952 (buf!3666 bs1!10)))))

(declare-fun b!155034 () Bool)

(assert (=> b!155034 (= e!104337 (array_inv!2952 (buf!3666 bs2!18)))))

(declare-fun b!155035 () Bool)

(declare-fun res!129691 () Bool)

(assert (=> b!155035 (=> (not res!129691) (not e!104334))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155035 (= res!129691 (bvsle lt!241409 (bitIndex!0 (size!3163 (buf!3666 bs2!18)) (currentByte!6700 bs2!18) (currentBit!6695 bs2!18))))))

(declare-fun b!155036 () Bool)

(assert (=> b!155036 (= e!104336 e!104334)))

(declare-fun res!129690 () Bool)

(assert (=> b!155036 (=> (not res!129690) (not e!104334))))

(assert (=> b!155036 (= res!129690 (bvsle lt!241409 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3163 (buf!3666 bs1!10))))))))

(assert (=> b!155036 (= lt!241409 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241411))))

(assert (=> b!155036 (= lt!241411 (bitIndex!0 (size!3163 (buf!3666 bs1!10)) (currentByte!6700 bs1!10) (currentBit!6695 bs1!10)))))

(assert (= (and start!30244 res!129693) b!155036))

(assert (= (and b!155036 res!129690) b!155035))

(assert (= (and b!155035 res!129691) b!155031))

(assert (= (and b!155031 res!129692) b!155032))

(assert (= start!30244 b!155033))

(assert (= start!30244 b!155034))

(declare-fun m!240985 () Bool)

(assert (=> b!155036 m!240985))

(declare-fun m!240987 () Bool)

(assert (=> b!155031 m!240987))

(declare-fun m!240989 () Bool)

(assert (=> b!155034 m!240989))

(declare-fun m!240991 () Bool)

(assert (=> b!155035 m!240991))

(declare-fun m!240993 () Bool)

(assert (=> b!155033 m!240993))

(declare-fun m!240995 () Bool)

(assert (=> start!30244 m!240995))

(declare-fun m!240997 () Bool)

(assert (=> start!30244 m!240997))

(declare-fun m!240999 () Bool)

(assert (=> b!155032 m!240999))

(declare-fun m!241001 () Bool)

(assert (=> b!155032 m!241001))

(push 1)

(assert (not start!30244))

(assert (not b!155032))

(assert (not b!155033))

(assert (not b!155035))

(assert (not b!155031))

(assert (not b!155036))

(assert (not b!155034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51127 () Bool)

(assert (=> d!51127 (= (array_inv!2952 (buf!3666 bs2!18)) (bvsge (size!3163 (buf!3666 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155034 d!51127))

(declare-fun d!51130 () Bool)

(assert (=> d!51130 (= (array_inv!2952 (buf!3666 bs1!10)) (bvsge (size!3163 (buf!3666 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155033 d!51130))

(declare-fun d!51132 () Bool)

(declare-datatypes ((tuple2!13738 0))(
  ( (tuple2!13739 (_1!7280 (_ BitVec 8)) (_2!7280 BitStream!5584)) )
))
(declare-fun lt!241456 () tuple2!13738)

(declare-fun readByte!0 (BitStream!5584) tuple2!13738)

(assert (=> d!51132 (= lt!241456 (readByte!0 (BitStream!5585 (buf!3666 bs2!18) (currentByte!6700 bs1!10) (currentBit!6695 bs1!10))))))

(assert (=> d!51132 (= (readBytePure!0 (BitStream!5585 (buf!3666 bs2!18) (currentByte!6700 bs1!10) (currentBit!6695 bs1!10))) (tuple2!13733 (_2!7280 lt!241456) (_1!7280 lt!241456)))))

(declare-fun bs!12517 () Bool)

(assert (= bs!12517 d!51132))

(declare-fun m!241043 () Bool)

(assert (=> bs!12517 m!241043))

(assert (=> b!155032 d!51132))

(declare-fun d!51134 () Bool)

(declare-fun lt!241463 () tuple2!13738)

(assert (=> d!51134 (= lt!241463 (readByte!0 bs1!10))))

(assert (=> d!51134 (= (readBytePure!0 bs1!10) (tuple2!13733 (_2!7280 lt!241463) (_1!7280 lt!241463)))))

(declare-fun bs!12518 () Bool)

(assert (= bs!12518 d!51134))

(declare-fun m!241045 () Bool)

(assert (=> bs!12518 m!241045))

(assert (=> b!155032 d!51134))

(declare-fun d!51136 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51136 (= (inv!12 bs1!10) (invariant!0 (currentBit!6695 bs1!10) (currentByte!6700 bs1!10) (size!3163 (buf!3666 bs1!10))))))

(declare-fun bs!12519 () Bool)

(assert (= bs!12519 d!51136))

(declare-fun m!241049 () Bool)

(assert (=> bs!12519 m!241049))

(assert (=> start!30244 d!51136))

(declare-fun d!51140 () Bool)

(assert (=> d!51140 (= (inv!12 bs2!18) (invariant!0 (currentBit!6695 bs2!18) (currentByte!6700 bs2!18) (size!3163 (buf!3666 bs2!18))))))

(declare-fun bs!12520 () Bool)

(assert (= bs!12520 d!51140))

(declare-fun m!241053 () Bool)

(assert (=> bs!12520 m!241053))

(assert (=> start!30244 d!51140))

(declare-fun b!155115 () Bool)

(declare-fun e!104406 () Bool)

(declare-fun call!2236 () Bool)

(assert (=> b!155115 (= e!104406 call!2236)))

(declare-fun b!155116 () Bool)

(declare-fun e!104410 () Bool)

(assert (=> b!155116 (= e!104410 call!2236)))

(declare-fun c!8252 () Bool)

(declare-datatypes ((tuple4!216 0))(
  ( (tuple4!217 (_1!7281 (_ BitVec 32)) (_2!7281 (_ BitVec 32)) (_3!411 (_ BitVec 32)) (_4!108 (_ BitVec 32))) )
))
(declare-fun lt!241502 () tuple4!216)

(declare-fun bm!2233 () Bool)

(declare-fun lt!241500 () (_ BitVec 32))

(declare-fun lt!241501 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2233 (= call!2236 (byteRangesEq!0 (ite c!8252 (select (arr!3986 (buf!3666 bs1!10)) (_3!411 lt!241502)) (select (arr!3986 (buf!3666 bs1!10)) (_4!108 lt!241502))) (ite c!8252 (select (arr!3986 (buf!3666 bs2!18)) (_3!411 lt!241502)) (select (arr!3986 (buf!3666 bs2!18)) (_4!108 lt!241502))) (ite c!8252 lt!241501 #b00000000000000000000000000000000) lt!241500))))

(declare-fun d!51142 () Bool)

(declare-fun res!129754 () Bool)

(declare-fun e!104405 () Bool)

(assert (=> d!51142 (=> res!129754 e!104405)))

(assert (=> d!51142 (= res!129754 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241409))))

(assert (=> d!51142 (= (arrayBitRangesEq!0 (buf!3666 bs1!10) (buf!3666 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241409) e!104405)))

(declare-fun e!104409 () Bool)

(declare-fun b!155117 () Bool)

(declare-fun arrayRangesEq!401 (array!7031 array!7031 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155117 (= e!104409 (arrayRangesEq!401 (buf!3666 bs1!10) (buf!3666 bs2!18) (_1!7281 lt!241502) (_2!7281 lt!241502)))))

(declare-fun b!155118 () Bool)

(declare-fun res!129756 () Bool)

(assert (=> b!155118 (= res!129756 (= lt!241500 #b00000000000000000000000000000000))))

(assert (=> b!155118 (=> res!129756 e!104410)))

(declare-fun e!104407 () Bool)

(assert (=> b!155118 (= e!104407 e!104410)))

(declare-fun b!155119 () Bool)

(assert (=> b!155119 (= e!104406 e!104407)))

(declare-fun res!129752 () Bool)

(assert (=> b!155119 (= res!129752 (byteRangesEq!0 (select (arr!3986 (buf!3666 bs1!10)) (_3!411 lt!241502)) (select (arr!3986 (buf!3666 bs2!18)) (_3!411 lt!241502)) lt!241501 #b00000000000000000000000000001000))))

(assert (=> b!155119 (=> (not res!129752) (not e!104407))))

(declare-fun b!155120 () Bool)

(declare-fun e!104408 () Bool)

(assert (=> b!155120 (= e!104405 e!104408)))

(declare-fun res!129753 () Bool)

(assert (=> b!155120 (=> (not res!129753) (not e!104408))))

(assert (=> b!155120 (= res!129753 e!104409)))

(declare-fun res!129755 () Bool)

(assert (=> b!155120 (=> res!129755 e!104409)))

(assert (=> b!155120 (= res!129755 (bvsge (_1!7281 lt!241502) (_2!7281 lt!241502)))))

(assert (=> b!155120 (= lt!241500 ((_ extract 31 0) (bvsrem lt!241409 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155120 (= lt!241501 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!216)

(assert (=> b!155120 (= lt!241502 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241409))))

(declare-fun b!155121 () Bool)

(assert (=> b!155121 (= e!104408 e!104406)))

(assert (=> b!155121 (= c!8252 (= (_3!411 lt!241502) (_4!108 lt!241502)))))

(assert (= (and d!51142 (not res!129754)) b!155120))

(assert (= (and b!155120 (not res!129755)) b!155117))

(assert (= (and b!155120 res!129753) b!155121))

(assert (= (and b!155121 c!8252) b!155115))

(assert (= (and b!155121 (not c!8252)) b!155119))

(assert (= (and b!155119 res!129752) b!155118))

(assert (= (and b!155118 (not res!129756)) b!155116))

(assert (= (or b!155115 b!155116) bm!2233))

(declare-fun m!241061 () Bool)

(assert (=> bm!2233 m!241061))

(declare-fun m!241063 () Bool)

(assert (=> bm!2233 m!241063))

(declare-fun m!241065 () Bool)

(assert (=> bm!2233 m!241065))

(declare-fun m!241067 () Bool)

(assert (=> bm!2233 m!241067))

(declare-fun m!241069 () Bool)

(assert (=> bm!2233 m!241069))

(declare-fun m!241071 () Bool)

(assert (=> b!155117 m!241071))

(assert (=> b!155119 m!241063))

(assert (=> b!155119 m!241065))

(assert (=> b!155119 m!241063))

(assert (=> b!155119 m!241065))

(declare-fun m!241077 () Bool)

(assert (=> b!155119 m!241077))

(declare-fun m!241079 () Bool)

(assert (=> b!155120 m!241079))

(assert (=> b!155031 d!51142))

(declare-fun d!51154 () Bool)

(declare-fun e!104438 () Bool)

(assert (=> d!51154 e!104438))

(declare-fun res!129783 () Bool)

(assert (=> d!51154 (=> (not res!129783) (not e!104438))))

(declare-fun lt!241541 () (_ BitVec 64))

(declare-fun lt!241544 () (_ BitVec 64))

(declare-fun lt!241543 () (_ BitVec 64))

(assert (=> d!51154 (= res!129783 (= lt!241544 (bvsub lt!241543 lt!241541)))))

(assert (=> d!51154 (or (= (bvand lt!241543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241543 lt!241541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51154 (= lt!241541 (remainingBits!0 ((_ sign_extend 32) (size!3163 (buf!3666 bs1!10))) ((_ sign_extend 32) (currentByte!6700 bs1!10)) ((_ sign_extend 32) (currentBit!6695 bs1!10))))))

(declare-fun lt!241542 () (_ BitVec 64))

(declare-fun lt!241539 () (_ BitVec 64))

(assert (=> d!51154 (= lt!241543 (bvmul lt!241542 lt!241539))))

(assert (=> d!51154 (or (= lt!241542 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241539 (bvsdiv (bvmul lt!241542 lt!241539) lt!241542)))))

(assert (=> d!51154 (= lt!241539 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51154 (= lt!241542 ((_ sign_extend 32) (size!3163 (buf!3666 bs1!10))))))

(assert (=> d!51154 (= lt!241544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6700 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6695 bs1!10))))))

(assert (=> d!51154 (invariant!0 (currentBit!6695 bs1!10) (currentByte!6700 bs1!10) (size!3163 (buf!3666 bs1!10)))))

(assert (=> d!51154 (= (bitIndex!0 (size!3163 (buf!3666 bs1!10)) (currentByte!6700 bs1!10) (currentBit!6695 bs1!10)) lt!241544)))

(declare-fun b!155156 () Bool)

(declare-fun res!129784 () Bool)

(assert (=> b!155156 (=> (not res!129784) (not e!104438))))

(assert (=> b!155156 (= res!129784 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241544))))

(declare-fun b!155157 () Bool)

(declare-fun lt!241540 () (_ BitVec 64))

(assert (=> b!155157 (= e!104438 (bvsle lt!241544 (bvmul lt!241540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155157 (or (= lt!241540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241540)))))

(assert (=> b!155157 (= lt!241540 ((_ sign_extend 32) (size!3163 (buf!3666 bs1!10))))))

(assert (= (and d!51154 res!129783) b!155156))

(assert (= (and b!155156 res!129784) b!155157))

(declare-fun m!241119 () Bool)

(assert (=> d!51154 m!241119))

(assert (=> d!51154 m!241049))

(assert (=> b!155036 d!51154))

(declare-fun d!51168 () Bool)

(declare-fun e!104439 () Bool)

(assert (=> d!51168 e!104439))

(declare-fun res!129785 () Bool)

(assert (=> d!51168 (=> (not res!129785) (not e!104439))))

(declare-fun lt!241551 () (_ BitVec 64))

(declare-fun lt!241549 () (_ BitVec 64))

(declare-fun lt!241552 () (_ BitVec 64))

(assert (=> d!51168 (= res!129785 (= lt!241552 (bvsub lt!241551 lt!241549)))))

(assert (=> d!51168 (or (= (bvand lt!241551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241549 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241551 lt!241549) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51168 (= lt!241549 (remainingBits!0 ((_ sign_extend 32) (size!3163 (buf!3666 bs2!18))) ((_ sign_extend 32) (currentByte!6700 bs2!18)) ((_ sign_extend 32) (currentBit!6695 bs2!18))))))

(declare-fun lt!241550 () (_ BitVec 64))

(declare-fun lt!241547 () (_ BitVec 64))

(assert (=> d!51168 (= lt!241551 (bvmul lt!241550 lt!241547))))

(assert (=> d!51168 (or (= lt!241550 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241547 (bvsdiv (bvmul lt!241550 lt!241547) lt!241550)))))

(assert (=> d!51168 (= lt!241547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51168 (= lt!241550 ((_ sign_extend 32) (size!3163 (buf!3666 bs2!18))))))

(assert (=> d!51168 (= lt!241552 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6700 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6695 bs2!18))))))

(assert (=> d!51168 (invariant!0 (currentBit!6695 bs2!18) (currentByte!6700 bs2!18) (size!3163 (buf!3666 bs2!18)))))

(assert (=> d!51168 (= (bitIndex!0 (size!3163 (buf!3666 bs2!18)) (currentByte!6700 bs2!18) (currentBit!6695 bs2!18)) lt!241552)))

(declare-fun b!155158 () Bool)

(declare-fun res!129786 () Bool)

(assert (=> b!155158 (=> (not res!129786) (not e!104439))))

(assert (=> b!155158 (= res!129786 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241552))))

(declare-fun b!155159 () Bool)

(declare-fun lt!241548 () (_ BitVec 64))

(assert (=> b!155159 (= e!104439 (bvsle lt!241552 (bvmul lt!241548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155159 (or (= lt!241548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241548)))))

(assert (=> b!155159 (= lt!241548 ((_ sign_extend 32) (size!3163 (buf!3666 bs2!18))))))

(assert (= (and d!51168 res!129785) b!155158))

(assert (= (and b!155158 res!129786) b!155159))

(declare-fun m!241121 () Bool)

(assert (=> d!51168 m!241121))

(assert (=> d!51168 m!241053))

(assert (=> b!155035 d!51168))

(push 1)

(assert (not d!51132))

(assert (not bm!2233))

(assert (not b!155117))

(assert (not d!51136))

(assert (not d!51140))

(assert (not d!51168))

(assert (not b!155119))

(assert (not b!155120))

(assert (not d!51154))

(assert (not d!51134))

(check-sat)

(pop 1)

(push 1)

(check-sat)


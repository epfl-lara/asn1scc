; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58632 () Bool)

(assert start!58632)

(declare-datatypes ((array!15008 0))(
  ( (array!15009 (arr!7528 (Array (_ BitVec 32) (_ BitVec 8))) (size!6541 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11896 0))(
  ( (BitStream!11897 (buf!7009 array!15008) (currentByte!12945 (_ BitVec 32)) (currentBit!12940 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11896)

(declare-fun w2!587 () BitStream!11896)

(declare-fun w1!591 () BitStream!11896)

(declare-fun e!189137 () Bool)

(declare-fun b!269170 () Bool)

(assert (=> b!269170 (= e!189137 (and (bvsle #b00000000000000000000000000000000 (currentByte!12945 w1!591)) (bvsle (currentByte!12945 w1!591) (currentByte!12945 w2!587)) (bvsle (size!6541 (buf!7009 w1!591)) (size!6541 (buf!7009 w2!587))) (bvsle (size!6541 (buf!7009 w2!587)) (size!6541 (buf!7009 w3!25))) (or (bvsgt (currentByte!12945 w1!591) (size!6541 (buf!7009 w1!591))) (bvsgt (currentByte!12945 w2!587) (size!6541 (buf!7009 w2!587))))))))

(declare-fun b!269171 () Bool)

(declare-fun res!224403 () Bool)

(assert (=> b!269171 (=> (not res!224403) (not e!189137))))

(declare-fun isPrefixOf!0 (BitStream!11896 BitStream!11896) Bool)

(assert (=> b!269171 (= res!224403 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!224404 () Bool)

(assert (=> start!58632 (=> (not res!224404) (not e!189137))))

(assert (=> start!58632 (= res!224404 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58632 e!189137))

(declare-fun e!189141 () Bool)

(declare-fun inv!12 (BitStream!11896) Bool)

(assert (=> start!58632 (and (inv!12 w1!591) e!189141)))

(declare-fun e!189140 () Bool)

(assert (=> start!58632 (and (inv!12 w2!587) e!189140)))

(declare-fun e!189138 () Bool)

(assert (=> start!58632 (and (inv!12 w3!25) e!189138)))

(declare-fun b!269172 () Bool)

(declare-fun array_inv!6265 (array!15008) Bool)

(assert (=> b!269172 (= e!189141 (array_inv!6265 (buf!7009 w1!591)))))

(declare-fun b!269173 () Bool)

(assert (=> b!269173 (= e!189138 (array_inv!6265 (buf!7009 w3!25)))))

(declare-fun b!269174 () Bool)

(assert (=> b!269174 (= e!189140 (array_inv!6265 (buf!7009 w2!587)))))

(assert (= (and start!58632 res!224404) b!269171))

(assert (= (and b!269171 res!224403) b!269170))

(assert (= start!58632 b!269172))

(assert (= start!58632 b!269174))

(assert (= start!58632 b!269173))

(declare-fun m!400727 () Bool)

(assert (=> b!269173 m!400727))

(declare-fun m!400729 () Bool)

(assert (=> start!58632 m!400729))

(declare-fun m!400731 () Bool)

(assert (=> start!58632 m!400731))

(declare-fun m!400733 () Bool)

(assert (=> start!58632 m!400733))

(declare-fun m!400735 () Bool)

(assert (=> start!58632 m!400735))

(declare-fun m!400737 () Bool)

(assert (=> b!269174 m!400737))

(declare-fun m!400739 () Bool)

(assert (=> b!269172 m!400739))

(declare-fun m!400741 () Bool)

(assert (=> b!269171 m!400741))

(push 1)

(assert (not b!269171))

(assert (not b!269172))

(assert (not start!58632))

(assert (not b!269174))

(assert (not b!269173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91096 () Bool)

(assert (=> d!91096 (= (array_inv!6265 (buf!7009 w1!591)) (bvsge (size!6541 (buf!7009 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269172 d!91096))

(declare-fun d!91098 () Bool)

(assert (=> d!91098 (= (array_inv!6265 (buf!7009 w3!25)) (bvsge (size!6541 (buf!7009 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269173 d!91098))

(declare-fun d!91100 () Bool)

(declare-fun res!224436 () Bool)

(declare-fun e!189196 () Bool)

(assert (=> d!91100 (=> (not res!224436) (not e!189196))))

(assert (=> d!91100 (= res!224436 (= (size!6541 (buf!7009 w1!591)) (size!6541 (buf!7009 w2!587))))))

(assert (=> d!91100 (= (isPrefixOf!0 w1!591 w2!587) e!189196)))

(declare-fun b!269223 () Bool)

(declare-fun res!224435 () Bool)

(assert (=> b!269223 (=> (not res!224435) (not e!189196))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269223 (= res!224435 (bvsle (bitIndex!0 (size!6541 (buf!7009 w1!591)) (currentByte!12945 w1!591) (currentBit!12940 w1!591)) (bitIndex!0 (size!6541 (buf!7009 w2!587)) (currentByte!12945 w2!587) (currentBit!12940 w2!587))))))

(declare-fun b!269224 () Bool)

(declare-fun e!189197 () Bool)

(assert (=> b!269224 (= e!189196 e!189197)))

(declare-fun res!224437 () Bool)

(assert (=> b!269224 (=> res!224437 e!189197)))

(assert (=> b!269224 (= res!224437 (= (size!6541 (buf!7009 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269225 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15008 array!15008 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269225 (= e!189197 (arrayBitRangesEq!0 (buf!7009 w1!591) (buf!7009 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6541 (buf!7009 w1!591)) (currentByte!12945 w1!591) (currentBit!12940 w1!591))))))

(assert (= (and d!91100 res!224436) b!269223))

(assert (= (and b!269223 res!224435) b!269224))

(assert (= (and b!269224 (not res!224437)) b!269225))

(declare-fun m!400775 () Bool)

(assert (=> b!269223 m!400775))

(declare-fun m!400777 () Bool)

(assert (=> b!269223 m!400777))

(assert (=> b!269225 m!400775))

(assert (=> b!269225 m!400775))

(declare-fun m!400779 () Bool)

(assert (=> b!269225 m!400779))

(assert (=> start!58632 d!91100))

(declare-fun d!91110 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91110 (= (inv!12 w1!591) (invariant!0 (currentBit!12940 w1!591) (currentByte!12945 w1!591) (size!6541 (buf!7009 w1!591))))))

(declare-fun bs!23094 () Bool)

(assert (= bs!23094 d!91110))

(declare-fun m!400791 () Bool)

(assert (=> bs!23094 m!400791))

(assert (=> start!58632 d!91110))

(declare-fun d!91114 () Bool)

(assert (=> d!91114 (= (inv!12 w2!587) (invariant!0 (currentBit!12940 w2!587) (currentByte!12945 w2!587) (size!6541 (buf!7009 w2!587))))))

(declare-fun bs!23095 () Bool)

(assert (= bs!23095 d!91114))

(declare-fun m!400793 () Bool)

(assert (=> bs!23095 m!400793))

(assert (=> start!58632 d!91114))

(declare-fun d!91116 () Bool)

(assert (=> d!91116 (= (inv!12 w3!25) (invariant!0 (currentBit!12940 w3!25) (currentByte!12945 w3!25) (size!6541 (buf!7009 w3!25))))))

(declare-fun bs!23096 () Bool)

(assert (= bs!23096 d!91116))

(declare-fun m!400797 () Bool)

(assert (=> bs!23096 m!400797))

(assert (=> start!58632 d!91116))

(declare-fun d!91120 () Bool)

(assert (=> d!91120 (= (array_inv!6265 (buf!7009 w2!587)) (bvsge (size!6541 (buf!7009 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269174 d!91120))

(declare-fun d!91124 () Bool)

(declare-fun res!224448 () Bool)

(declare-fun e!189204 () Bool)

(assert (=> d!91124 (=> (not res!224448) (not e!189204))))

(assert (=> d!91124 (= res!224448 (= (size!6541 (buf!7009 w2!587)) (size!6541 (buf!7009 w3!25))))))

(assert (=> d!91124 (= (isPrefixOf!0 w2!587 w3!25) e!189204)))

(declare-fun b!269235 () Bool)

(declare-fun res!224447 () Bool)

(assert (=> b!269235 (=> (not res!224447) (not e!189204))))

(assert (=> b!269235 (= res!224447 (bvsle (bitIndex!0 (size!6541 (buf!7009 w2!587)) (currentByte!12945 w2!587) (currentBit!12940 w2!587)) (bitIndex!0 (size!6541 (buf!7009 w3!25)) (currentByte!12945 w3!25) (currentBit!12940 w3!25))))))

(declare-fun b!269236 () Bool)

(declare-fun e!189205 () Bool)

(assert (=> b!269236 (= e!189204 e!189205)))

(declare-fun res!224449 () Bool)

(assert (=> b!269236 (=> res!224449 e!189205)))

(assert (=> b!269236 (= res!224449 (= (size!6541 (buf!7009 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269237 () Bool)

(assert (=> b!269237 (= e!189205 (arrayBitRangesEq!0 (buf!7009 w2!587) (buf!7009 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6541 (buf!7009 w2!587)) (currentByte!12945 w2!587) (currentBit!12940 w2!587))))))

(assert (= (and d!91124 res!224448) b!269235))

(assert (= (and b!269235 res!224447) b!269236))

(assert (= (and b!269236 (not res!224449)) b!269237))

(assert (=> b!269235 m!400777))

(declare-fun m!400805 () Bool)

(assert (=> b!269235 m!400805))

(assert (=> b!269237 m!400777))

(assert (=> b!269237 m!400777))

(declare-fun m!400809 () Bool)

(assert (=> b!269237 m!400809))

(assert (=> b!269171 d!91124))

(push 1)

(assert (not b!269237))

(assert (not d!91116))

(assert (not b!269235))

(assert (not b!269223))

(assert (not d!91110))

(assert (not b!269225))

(assert (not d!91114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91140 () Bool)

(assert (=> d!91140 (= (invariant!0 (currentBit!12940 w2!587) (currentByte!12945 w2!587) (size!6541 (buf!7009 w2!587))) (and (bvsge (currentBit!12940 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12940 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12945 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12945 w2!587) (size!6541 (buf!7009 w2!587))) (and (= (currentBit!12940 w2!587) #b00000000000000000000000000000000) (= (currentByte!12945 w2!587) (size!6541 (buf!7009 w2!587)))))))))

(assert (=> d!91114 d!91140))

(declare-fun b!269276 () Bool)

(declare-fun res!224478 () Bool)

(declare-fun lt!408873 () (_ BitVec 32))

(assert (=> b!269276 (= res!224478 (= lt!408873 #b00000000000000000000000000000000))))

(declare-fun e!189239 () Bool)

(assert (=> b!269276 (=> res!224478 e!189239)))

(declare-fun e!189241 () Bool)

(assert (=> b!269276 (= e!189241 e!189239)))

(declare-fun b!269277 () Bool)

(declare-fun e!189243 () Bool)

(declare-fun e!189238 () Bool)

(assert (=> b!269277 (= e!189243 e!189238)))

(declare-fun res!224480 () Bool)

(assert (=> b!269277 (=> (not res!224480) (not e!189238))))

(declare-fun e!189240 () Bool)

(assert (=> b!269277 (= res!224480 e!189240)))

(declare-fun res!224479 () Bool)

(assert (=> b!269277 (=> res!224479 e!189240)))

(declare-datatypes ((tuple4!434 0))(
  ( (tuple4!435 (_1!12200 (_ BitVec 32)) (_2!12200 (_ BitVec 32)) (_3!997 (_ BitVec 32)) (_4!217 (_ BitVec 32))) )
))
(declare-fun lt!408875 () tuple4!434)

(assert (=> b!269277 (= res!224479 (bvsge (_1!12200 lt!408875) (_2!12200 lt!408875)))))

(assert (=> b!269277 (= lt!408873 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6541 (buf!7009 w2!587)) (currentByte!12945 w2!587) (currentBit!12940 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408874 () (_ BitVec 32))

(assert (=> b!269277 (= lt!408874 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!434)

(assert (=> b!269277 (= lt!408875 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6541 (buf!7009 w2!587)) (currentByte!12945 w2!587) (currentBit!12940 w2!587))))))

(declare-fun b!269278 () Bool)

(declare-fun e!189242 () Bool)

(declare-fun call!4277 () Bool)

(assert (=> b!269278 (= e!189242 call!4277)))

(declare-fun b!269279 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269279 (= e!189239 (byteRangesEq!0 (select (arr!7528 (buf!7009 w2!587)) (_4!217 lt!408875)) (select (arr!7528 (buf!7009 w3!25)) (_4!217 lt!408875)) #b00000000000000000000000000000000 lt!408873))))

(declare-fun b!269280 () Bool)

(assert (=> b!269280 (= e!189238 e!189242)))

(declare-fun c!12426 () Bool)

(assert (=> b!269280 (= c!12426 (= (_3!997 lt!408875) (_4!217 lt!408875)))))

(declare-fun bm!4274 () Bool)

(assert (=> bm!4274 (= call!4277 (byteRangesEq!0 (select (arr!7528 (buf!7009 w2!587)) (_3!997 lt!408875)) (select (arr!7528 (buf!7009 w3!25)) (_3!997 lt!408875)) lt!408874 (ite c!12426 lt!408873 #b00000000000000000000000000001000)))))

(declare-fun b!269281 () Bool)

(assert (=> b!269281 (= e!189242 e!189241)))

(declare-fun res!224481 () Bool)

(assert (=> b!269281 (= res!224481 call!4277)))

(assert (=> b!269281 (=> (not res!224481) (not e!189241))))

(declare-fun d!91142 () Bool)

(declare-fun res!224482 () Bool)

(assert (=> d!91142 (=> res!224482 e!189243)))

(assert (=> d!91142 (= res!224482 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6541 (buf!7009 w2!587)) (currentByte!12945 w2!587) (currentBit!12940 w2!587))))))

(assert (=> d!91142 (= (arrayBitRangesEq!0 (buf!7009 w2!587) (buf!7009 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6541 (buf!7009 w2!587)) (currentByte!12945 w2!587) (currentBit!12940 w2!587))) e!189243)))

(declare-fun b!269282 () Bool)

(declare-fun arrayRangesEq!1074 (array!15008 array!15008 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269282 (= e!189240 (arrayRangesEq!1074 (buf!7009 w2!587) (buf!7009 w3!25) (_1!12200 lt!408875) (_2!12200 lt!408875)))))

(assert (= (and d!91142 (not res!224482)) b!269277))

(assert (= (and b!269277 (not res!224479)) b!269282))

(assert (= (and b!269277 res!224480) b!269280))

(assert (= (and b!269280 c!12426) b!269278))

(assert (= (and b!269280 (not c!12426)) b!269281))

(assert (= (and b!269281 res!224481) b!269276))

(assert (= (and b!269276 (not res!224478)) b!269279))

(assert (= (or b!269278 b!269281) bm!4274))

(assert (=> b!269277 m!400777))

(declare-fun m!400839 () Bool)

(assert (=> b!269277 m!400839))

(declare-fun m!400841 () Bool)

(assert (=> b!269279 m!400841))

(declare-fun m!400843 () Bool)

(assert (=> b!269279 m!400843))

(assert (=> b!269279 m!400841))

(assert (=> b!269279 m!400843))

(declare-fun m!400845 () Bool)

(assert (=> b!269279 m!400845))

(declare-fun m!400847 () Bool)

(assert (=> bm!4274 m!400847))

(declare-fun m!400849 () Bool)

(assert (=> bm!4274 m!400849))

(assert (=> bm!4274 m!400847))

(assert (=> bm!4274 m!400849))

(declare-fun m!400851 () Bool)

(assert (=> bm!4274 m!400851))

(declare-fun m!400853 () Bool)

(assert (=> b!269282 m!400853))

(assert (=> b!269237 d!91142))

(declare-fun d!91148 () Bool)

(declare-fun e!189275 () Bool)

(assert (=> d!91148 e!189275))

(declare-fun res!224517 () Bool)

(assert (=> d!91148 (=> (not res!224517) (not e!189275))))

(declare-fun lt!408935 () (_ BitVec 64))

(declare-fun lt!408932 () (_ BitVec 64))

(declare-fun lt!408933 () (_ BitVec 64))

(assert (=> d!91148 (= res!224517 (= lt!408932 (bvsub lt!408933 lt!408935)))))

(assert (=> d!91148 (or (= (bvand lt!408933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408935 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408933 lt!408935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91148 (= lt!408935 (remainingBits!0 ((_ sign_extend 32) (size!6541 (buf!7009 w2!587))) ((_ sign_extend 32) (currentByte!12945 w2!587)) ((_ sign_extend 32) (currentBit!12940 w2!587))))))

(declare-fun lt!408931 () (_ BitVec 64))

(declare-fun lt!408934 () (_ BitVec 64))

(assert (=> d!91148 (= lt!408933 (bvmul lt!408931 lt!408934))))

(assert (=> d!91148 (or (= lt!408931 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408934 (bvsdiv (bvmul lt!408931 lt!408934) lt!408931)))))

(assert (=> d!91148 (= lt!408934 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91148 (= lt!408931 ((_ sign_extend 32) (size!6541 (buf!7009 w2!587))))))

(assert (=> d!91148 (= lt!408932 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12945 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12940 w2!587))))))

(assert (=> d!91148 (invariant!0 (currentBit!12940 w2!587) (currentByte!12945 w2!587) (size!6541 (buf!7009 w2!587)))))

(assert (=> d!91148 (= (bitIndex!0 (size!6541 (buf!7009 w2!587)) (currentByte!12945 w2!587) (currentBit!12940 w2!587)) lt!408932)))

(declare-fun b!269325 () Bool)

(declare-fun res!224518 () Bool)

(assert (=> b!269325 (=> (not res!224518) (not e!189275))))

(assert (=> b!269325 (= res!224518 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408932))))

(declare-fun b!269326 () Bool)

(declare-fun lt!408930 () (_ BitVec 64))

(assert (=> b!269326 (= e!189275 (bvsle lt!408932 (bvmul lt!408930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269326 (or (= lt!408930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408930)))))

(assert (=> b!269326 (= lt!408930 ((_ sign_extend 32) (size!6541 (buf!7009 w2!587))))))

(assert (= (and d!91148 res!224517) b!269325))

(assert (= (and b!269325 res!224518) b!269326))

(declare-fun m!400893 () Bool)

(assert (=> d!91148 m!400893))

(assert (=> d!91148 m!400793))

(assert (=> b!269237 d!91148))

(declare-fun d!91164 () Bool)

(declare-fun e!189276 () Bool)

(assert (=> d!91164 e!189276))

(declare-fun res!224519 () Bool)

(assert (=> d!91164 (=> (not res!224519) (not e!189276))))

(declare-fun lt!408938 () (_ BitVec 64))

(declare-fun lt!408941 () (_ BitVec 64))

(declare-fun lt!408939 () (_ BitVec 64))

(assert (=> d!91164 (= res!224519 (= lt!408938 (bvsub lt!408939 lt!408941)))))

(assert (=> d!91164 (or (= (bvand lt!408939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408939 lt!408941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91164 (= lt!408941 (remainingBits!0 ((_ sign_extend 32) (size!6541 (buf!7009 w1!591))) ((_ sign_extend 32) (currentByte!12945 w1!591)) ((_ sign_extend 32) (currentBit!12940 w1!591))))))

(declare-fun lt!408937 () (_ BitVec 64))

(declare-fun lt!408940 () (_ BitVec 64))

(assert (=> d!91164 (= lt!408939 (bvmul lt!408937 lt!408940))))

(assert (=> d!91164 (or (= lt!408937 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408940 (bvsdiv (bvmul lt!408937 lt!408940) lt!408937)))))

(assert (=> d!91164 (= lt!408940 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91164 (= lt!408937 ((_ sign_extend 32) (size!6541 (buf!7009 w1!591))))))

(assert (=> d!91164 (= lt!408938 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12945 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12940 w1!591))))))

(assert (=> d!91164 (invariant!0 (currentBit!12940 w1!591) (currentByte!12945 w1!591) (size!6541 (buf!7009 w1!591)))))

(assert (=> d!91164 (= (bitIndex!0 (size!6541 (buf!7009 w1!591)) (currentByte!12945 w1!591) (currentBit!12940 w1!591)) lt!408938)))

(declare-fun b!269327 () Bool)

(declare-fun res!224520 () Bool)

(assert (=> b!269327 (=> (not res!224520) (not e!189276))))

(assert (=> b!269327 (= res!224520 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408938))))

(declare-fun b!269328 () Bool)

(declare-fun lt!408936 () (_ BitVec 64))

(assert (=> b!269328 (= e!189276 (bvsle lt!408938 (bvmul lt!408936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269328 (or (= lt!408936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408936)))))

(assert (=> b!269328 (= lt!408936 ((_ sign_extend 32) (size!6541 (buf!7009 w1!591))))))

(assert (= (and d!91164 res!224519) b!269327))

(assert (= (and b!269327 res!224520) b!269328))

(declare-fun m!400895 () Bool)

(assert (=> d!91164 m!400895))

(assert (=> d!91164 m!400791))

(assert (=> b!269223 d!91164))

(assert (=> b!269223 d!91148))

(declare-fun d!91166 () Bool)

(assert (=> d!91166 (= (invariant!0 (currentBit!12940 w3!25) (currentByte!12945 w3!25) (size!6541 (buf!7009 w3!25))) (and (bvsge (currentBit!12940 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12940 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12945 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12945 w3!25) (size!6541 (buf!7009 w3!25))) (and (= (currentBit!12940 w3!25) #b00000000000000000000000000000000) (= (currentByte!12945 w3!25) (size!6541 (buf!7009 w3!25)))))))))

(assert (=> d!91116 d!91166))

(declare-fun d!91168 () Bool)

(assert (=> d!91168 (= (invariant!0 (currentBit!12940 w1!591) (currentByte!12945 w1!591) (size!6541 (buf!7009 w1!591))) (and (bvsge (currentBit!12940 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12940 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12945 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12945 w1!591) (size!6541 (buf!7009 w1!591))) (and (= (currentBit!12940 w1!591) #b00000000000000000000000000000000) (= (currentByte!12945 w1!591) (size!6541 (buf!7009 w1!591)))))))))

(assert (=> d!91110 d!91168))

(assert (=> b!269235 d!91148))

(declare-fun d!91170 () Bool)

(declare-fun e!189277 () Bool)

(assert (=> d!91170 e!189277))

(declare-fun res!224521 () Bool)

(assert (=> d!91170 (=> (not res!224521) (not e!189277))))

(declare-fun lt!408947 () (_ BitVec 64))

(declare-fun lt!408945 () (_ BitVec 64))

(declare-fun lt!408944 () (_ BitVec 64))

(assert (=> d!91170 (= res!224521 (= lt!408944 (bvsub lt!408945 lt!408947)))))

(assert (=> d!91170 (or (= (bvand lt!408945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408945 lt!408947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91170 (= lt!408947 (remainingBits!0 ((_ sign_extend 32) (size!6541 (buf!7009 w3!25))) ((_ sign_extend 32) (currentByte!12945 w3!25)) ((_ sign_extend 32) (currentBit!12940 w3!25))))))

(declare-fun lt!408943 () (_ BitVec 64))

(declare-fun lt!408946 () (_ BitVec 64))

(assert (=> d!91170 (= lt!408945 (bvmul lt!408943 lt!408946))))

(assert (=> d!91170 (or (= lt!408943 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408946 (bvsdiv (bvmul lt!408943 lt!408946) lt!408943)))))

(assert (=> d!91170 (= lt!408946 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91170 (= lt!408943 ((_ sign_extend 32) (size!6541 (buf!7009 w3!25))))))

(assert (=> d!91170 (= lt!408944 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12945 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12940 w3!25))))))

(assert (=> d!91170 (invariant!0 (currentBit!12940 w3!25) (currentByte!12945 w3!25) (size!6541 (buf!7009 w3!25)))))

(assert (=> d!91170 (= (bitIndex!0 (size!6541 (buf!7009 w3!25)) (currentByte!12945 w3!25) (currentBit!12940 w3!25)) lt!408944)))

(declare-fun b!269329 () Bool)

(declare-fun res!224522 () Bool)

(assert (=> b!269329 (=> (not res!224522) (not e!189277))))

(assert (=> b!269329 (= res!224522 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408944))))

(declare-fun b!269330 () Bool)

(declare-fun lt!408942 () (_ BitVec 64))

(assert (=> b!269330 (= e!189277 (bvsle lt!408944 (bvmul lt!408942 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269330 (or (= lt!408942 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408942 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408942)))))

(assert (=> b!269330 (= lt!408942 ((_ sign_extend 32) (size!6541 (buf!7009 w3!25))))))

(assert (= (and d!91170 res!224521) b!269329))

(assert (= (and b!269329 res!224522) b!269330))

(declare-fun m!400897 () Bool)

(assert (=> d!91170 m!400897))

(assert (=> d!91170 m!400797))

(assert (=> b!269235 d!91170))

(declare-fun b!269331 () Bool)

(declare-fun res!224523 () Bool)

(declare-fun lt!408948 () (_ BitVec 32))

(assert (=> b!269331 (= res!224523 (= lt!408948 #b00000000000000000000000000000000))))

(declare-fun e!189279 () Bool)

(assert (=> b!269331 (=> res!224523 e!189279)))

(declare-fun e!189281 () Bool)

(assert (=> b!269331 (= e!189281 e!189279)))

(declare-fun b!269332 () Bool)

(declare-fun e!189283 () Bool)

(declare-fun e!189278 () Bool)

(assert (=> b!269332 (= e!189283 e!189278)))

(declare-fun res!224525 () Bool)

(assert (=> b!269332 (=> (not res!224525) (not e!189278))))

(declare-fun e!189280 () Bool)

(assert (=> b!269332 (= res!224525 e!189280)))

(declare-fun res!224524 () Bool)

(assert (=> b!269332 (=> res!224524 e!189280)))

(declare-fun lt!408950 () tuple4!434)

(assert (=> b!269332 (= res!224524 (bvsge (_1!12200 lt!408950) (_2!12200 lt!408950)))))

(assert (=> b!269332 (= lt!408948 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6541 (buf!7009 w1!591)) (currentByte!12945 w1!591) (currentBit!12940 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408949 () (_ BitVec 32))

(assert (=> b!269332 (= lt!408949 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269332 (= lt!408950 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6541 (buf!7009 w1!591)) (currentByte!12945 w1!591) (currentBit!12940 w1!591))))))

(declare-fun b!269333 () Bool)

(declare-fun e!189282 () Bool)

(declare-fun call!4282 () Bool)

(assert (=> b!269333 (= e!189282 call!4282)))

(declare-fun b!269334 () Bool)

(assert (=> b!269334 (= e!189279 (byteRangesEq!0 (select (arr!7528 (buf!7009 w1!591)) (_4!217 lt!408950)) (select (arr!7528 (buf!7009 w2!587)) (_4!217 lt!408950)) #b00000000000000000000000000000000 lt!408948))))

(declare-fun b!269335 () Bool)

(assert (=> b!269335 (= e!189278 e!189282)))

(declare-fun c!12431 () Bool)

(assert (=> b!269335 (= c!12431 (= (_3!997 lt!408950) (_4!217 lt!408950)))))

(declare-fun bm!4279 () Bool)

(assert (=> bm!4279 (= call!4282 (byteRangesEq!0 (select (arr!7528 (buf!7009 w1!591)) (_3!997 lt!408950)) (select (arr!7528 (buf!7009 w2!587)) (_3!997 lt!408950)) lt!408949 (ite c!12431 lt!408948 #b00000000000000000000000000001000)))))

(declare-fun b!269336 () Bool)

(assert (=> b!269336 (= e!189282 e!189281)))

(declare-fun res!224526 () Bool)

(assert (=> b!269336 (= res!224526 call!4282)))

(assert (=> b!269336 (=> (not res!224526) (not e!189281))))

(declare-fun d!91172 () Bool)

(declare-fun res!224527 () Bool)

(assert (=> d!91172 (=> res!224527 e!189283)))

(assert (=> d!91172 (= res!224527 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6541 (buf!7009 w1!591)) (currentByte!12945 w1!591) (currentBit!12940 w1!591))))))

(assert (=> d!91172 (= (arrayBitRangesEq!0 (buf!7009 w1!591) (buf!7009 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6541 (buf!7009 w1!591)) (currentByte!12945 w1!591) (currentBit!12940 w1!591))) e!189283)))

(declare-fun b!269337 () Bool)

(assert (=> b!269337 (= e!189280 (arrayRangesEq!1074 (buf!7009 w1!591) (buf!7009 w2!587) (_1!12200 lt!408950) (_2!12200 lt!408950)))))

(assert (= (and d!91172 (not res!224527)) b!269332))

(assert (= (and b!269332 (not res!224524)) b!269337))

(assert (= (and b!269332 res!224525) b!269335))

(assert (= (and b!269335 c!12431) b!269333))

(assert (= (and b!269335 (not c!12431)) b!269336))

(assert (= (and b!269336 res!224526) b!269331))

(assert (= (and b!269331 (not res!224523)) b!269334))

(assert (= (or b!269333 b!269336) bm!4279))

(assert (=> b!269332 m!400775))

(declare-fun m!400899 () Bool)

(assert (=> b!269332 m!400899))

(declare-fun m!400901 () Bool)

(assert (=> b!269334 m!400901))

(declare-fun m!400903 () Bool)

(assert (=> b!269334 m!400903))

(assert (=> b!269334 m!400901))

(assert (=> b!269334 m!400903))

(declare-fun m!400905 () Bool)

(assert (=> b!269334 m!400905))

(declare-fun m!400907 () Bool)

(assert (=> bm!4279 m!400907))

(declare-fun m!400909 () Bool)

(assert (=> bm!4279 m!400909))

(assert (=> bm!4279 m!400907))

(assert (=> bm!4279 m!400909))

(declare-fun m!400911 () Bool)

(assert (=> bm!4279 m!400911))

(declare-fun m!400913 () Bool)

(assert (=> b!269337 m!400913))

(assert (=> b!269225 d!91172))

(assert (=> b!269225 d!91164))

(push 1)

(assert (not d!91170))

(assert (not b!269337))

(assert (not d!91164))

(assert (not bm!4274))

(assert (not b!269334))

(assert (not b!269282))

(assert (not d!91148))

(assert (not bm!4279))

(assert (not b!269277))

(assert (not b!269332))

(assert (not b!269279))

(check-sat)

(pop 1)

(push 1)

(check-sat)


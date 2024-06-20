; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61426 () Bool)

(assert start!61426)

(declare-fun b!276170 () Bool)

(declare-fun e!196130 () Bool)

(declare-datatypes ((array!15796 0))(
  ( (array!15797 (arr!7834 (Array (_ BitVec 32) (_ BitVec 8))) (size!6841 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12496 0))(
  ( (BitStream!12497 (buf!7309 array!15796) (currentByte!13511 (_ BitVec 32)) (currentBit!13506 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12496)

(declare-fun array_inv!6565 (array!15796) Bool)

(assert (=> b!276170 (= e!196130 (array_inv!6565 (buf!7309 bs2!19)))))

(declare-fun b!276171 () Bool)

(declare-fun res!229499 () Bool)

(declare-fun e!196128 () Bool)

(assert (=> b!276171 (=> (not res!229499) (not e!196128))))

(declare-fun bs1!11 () BitStream!12496)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276171 (= res!229499 (validate_offset_bit!0 ((_ sign_extend 32) (size!6841 (buf!7309 bs1!11))) ((_ sign_extend 32) (currentByte!13511 bs1!11)) ((_ sign_extend 32) (currentBit!13506 bs1!11))))))

(declare-fun b!276172 () Bool)

(declare-fun e!196125 () Bool)

(declare-fun lt!414351 () (_ BitVec 64))

(declare-fun lt!414354 () (_ BitVec 64))

(assert (=> b!276172 (= e!196125 (not (or (not (= lt!414351 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!414351 (bvand lt!414354 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!414352 () (_ BitVec 64))

(assert (=> b!276172 (= lt!414351 (bvand lt!414352 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!22512 0))(
  ( (tuple2!22513 (_1!12294 BitStream!12496) (_2!12294 Bool)) )
))
(declare-fun lt!414350 () tuple2!22512)

(declare-fun readBitPure!0 (BitStream!12496) tuple2!22512)

(assert (=> b!276172 (= lt!414350 (readBitPure!0 (BitStream!12497 (buf!7309 bs2!19) (currentByte!13511 bs1!11) (currentBit!13506 bs1!11))))))

(declare-fun lt!414353 () tuple2!22512)

(assert (=> b!276172 (= lt!414353 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276172 (invariant!0 (currentBit!13506 bs1!11) (currentByte!13511 bs1!11) (size!6841 (buf!7309 bs2!19)))))

(declare-fun res!229500 () Bool)

(assert (=> start!61426 (=> (not res!229500) (not e!196128))))

(assert (=> start!61426 (= res!229500 (= (size!6841 (buf!7309 bs1!11)) (size!6841 (buf!7309 bs2!19))))))

(assert (=> start!61426 e!196128))

(declare-fun e!196129 () Bool)

(declare-fun inv!12 (BitStream!12496) Bool)

(assert (=> start!61426 (and (inv!12 bs1!11) e!196129)))

(assert (=> start!61426 (and (inv!12 bs2!19) e!196130)))

(declare-fun b!276173 () Bool)

(assert (=> b!276173 (= e!196129 (array_inv!6565 (buf!7309 bs1!11)))))

(declare-fun b!276174 () Bool)

(assert (=> b!276174 (= e!196128 e!196125)))

(declare-fun res!229501 () Bool)

(assert (=> b!276174 (=> (not res!229501) (not e!196125))))

(declare-fun arrayBitRangesEq!0 (array!15796 array!15796 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276174 (= res!229501 (arrayBitRangesEq!0 (buf!7309 bs1!11) (buf!7309 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414354))))

(assert (=> b!276174 (= lt!414354 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414352))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276174 (= lt!414352 (bitIndex!0 (size!6841 (buf!7309 bs1!11)) (currentByte!13511 bs1!11) (currentBit!13506 bs1!11)))))

(assert (= (and start!61426 res!229500) b!276171))

(assert (= (and b!276171 res!229499) b!276174))

(assert (= (and b!276174 res!229501) b!276172))

(assert (= start!61426 b!276173))

(assert (= start!61426 b!276170))

(declare-fun m!409151 () Bool)

(assert (=> b!276173 m!409151))

(declare-fun m!409153 () Bool)

(assert (=> b!276171 m!409153))

(declare-fun m!409155 () Bool)

(assert (=> b!276172 m!409155))

(declare-fun m!409157 () Bool)

(assert (=> b!276172 m!409157))

(declare-fun m!409159 () Bool)

(assert (=> b!276172 m!409159))

(declare-fun m!409161 () Bool)

(assert (=> start!61426 m!409161))

(declare-fun m!409163 () Bool)

(assert (=> start!61426 m!409163))

(declare-fun m!409165 () Bool)

(assert (=> b!276174 m!409165))

(declare-fun m!409167 () Bool)

(assert (=> b!276174 m!409167))

(declare-fun m!409169 () Bool)

(assert (=> b!276170 m!409169))

(push 1)

(assert (not start!61426))

(assert (not b!276172))

(assert (not b!276173))

(assert (not b!276174))

(assert (not b!276171))

(assert (not b!276170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95084 () Bool)

(declare-datatypes ((tuple2!22518 0))(
  ( (tuple2!22519 (_1!12297 Bool) (_2!12297 BitStream!12496)) )
))
(declare-fun lt!414387 () tuple2!22518)

(declare-fun readBit!0 (BitStream!12496) tuple2!22518)

(assert (=> d!95084 (= lt!414387 (readBit!0 (BitStream!12497 (buf!7309 bs2!19) (currentByte!13511 bs1!11) (currentBit!13506 bs1!11))))))

(assert (=> d!95084 (= (readBitPure!0 (BitStream!12497 (buf!7309 bs2!19) (currentByte!13511 bs1!11) (currentBit!13506 bs1!11))) (tuple2!22513 (_2!12297 lt!414387) (_1!12297 lt!414387)))))

(declare-fun bs!23973 () Bool)

(assert (= bs!23973 d!95084))

(declare-fun m!409211 () Bool)

(assert (=> bs!23973 m!409211))

(assert (=> b!276172 d!95084))

(declare-fun d!95086 () Bool)

(declare-fun lt!414388 () tuple2!22518)

(assert (=> d!95086 (= lt!414388 (readBit!0 bs1!11))))

(assert (=> d!95086 (= (readBitPure!0 bs1!11) (tuple2!22513 (_2!12297 lt!414388) (_1!12297 lt!414388)))))

(declare-fun bs!23974 () Bool)

(assert (= bs!23974 d!95086))

(declare-fun m!409213 () Bool)

(assert (=> bs!23974 m!409213))

(assert (=> b!276172 d!95086))

(declare-fun d!95088 () Bool)

(assert (=> d!95088 (= (invariant!0 (currentBit!13506 bs1!11) (currentByte!13511 bs1!11) (size!6841 (buf!7309 bs2!19))) (and (bvsge (currentBit!13506 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13506 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13511 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13511 bs1!11) (size!6841 (buf!7309 bs2!19))) (and (= (currentBit!13506 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13511 bs1!11) (size!6841 (buf!7309 bs2!19)))))))))

(assert (=> b!276172 d!95088))

(declare-fun d!95090 () Bool)

(assert (=> d!95090 (= (array_inv!6565 (buf!7309 bs1!11)) (bvsge (size!6841 (buf!7309 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276173 d!95090))

(declare-datatypes ((tuple4!516 0))(
  ( (tuple4!517 (_1!12298 (_ BitVec 32)) (_2!12298 (_ BitVec 32)) (_3!1038 (_ BitVec 32)) (_4!258 (_ BitVec 32))) )
))
(declare-fun lt!414399 () tuple4!516)

(declare-fun bm!4427 () Bool)

(declare-fun lt!414401 () (_ BitVec 32))

(declare-fun c!12615 () Bool)

(declare-fun lt!414400 () (_ BitVec 32))

(declare-fun call!4430 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4427 (= call!4430 (byteRangesEq!0 (select (arr!7834 (buf!7309 bs1!11)) (_3!1038 lt!414399)) (select (arr!7834 (buf!7309 bs2!19)) (_3!1038 lt!414399)) lt!414401 (ite c!12615 lt!414400 #b00000000000000000000000000001000)))))

(declare-fun b!276219 () Bool)

(declare-fun e!196181 () Bool)

(assert (=> b!276219 (= e!196181 (byteRangesEq!0 (select (arr!7834 (buf!7309 bs1!11)) (_4!258 lt!414399)) (select (arr!7834 (buf!7309 bs2!19)) (_4!258 lt!414399)) #b00000000000000000000000000000000 lt!414400))))

(declare-fun b!276220 () Bool)

(declare-fun e!196179 () Bool)

(declare-fun e!196184 () Bool)

(assert (=> b!276220 (= e!196179 e!196184)))

(declare-fun res!229534 () Bool)

(assert (=> b!276220 (= res!229534 call!4430)))

(assert (=> b!276220 (=> (not res!229534) (not e!196184))))

(declare-fun b!276221 () Bool)

(declare-fun e!196183 () Bool)

(assert (=> b!276221 (= e!196183 e!196179)))

(assert (=> b!276221 (= c!12615 (= (_3!1038 lt!414399) (_4!258 lt!414399)))))

(declare-fun b!276222 () Bool)

(declare-fun e!196180 () Bool)

(declare-fun arrayRangesEq!1151 (array!15796 array!15796 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276222 (= e!196180 (arrayRangesEq!1151 (buf!7309 bs1!11) (buf!7309 bs2!19) (_1!12298 lt!414399) (_2!12298 lt!414399)))))

(declare-fun b!276223 () Bool)

(assert (=> b!276223 (= e!196179 call!4430)))

(declare-fun b!276224 () Bool)

(declare-fun e!196182 () Bool)

(assert (=> b!276224 (= e!196182 e!196183)))

(declare-fun res!229530 () Bool)

(assert (=> b!276224 (=> (not res!229530) (not e!196183))))

(assert (=> b!276224 (= res!229530 e!196180)))

(declare-fun res!229533 () Bool)

(assert (=> b!276224 (=> res!229533 e!196180)))

(assert (=> b!276224 (= res!229533 (bvsge (_1!12298 lt!414399) (_2!12298 lt!414399)))))

(assert (=> b!276224 (= lt!414400 ((_ extract 31 0) (bvsrem lt!414354 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276224 (= lt!414401 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!516)

(assert (=> b!276224 (= lt!414399 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414354))))

(declare-fun b!276225 () Bool)

(declare-fun res!229531 () Bool)

(assert (=> b!276225 (= res!229531 (= lt!414400 #b00000000000000000000000000000000))))

(assert (=> b!276225 (=> res!229531 e!196181)))

(assert (=> b!276225 (= e!196184 e!196181)))

(declare-fun d!95092 () Bool)

(declare-fun res!229532 () Bool)

(assert (=> d!95092 (=> res!229532 e!196182)))

(assert (=> d!95092 (= res!229532 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414354))))

(assert (=> d!95092 (= (arrayBitRangesEq!0 (buf!7309 bs1!11) (buf!7309 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414354) e!196182)))

(assert (= (and d!95092 (not res!229532)) b!276224))

(assert (= (and b!276224 (not res!229533)) b!276222))

(assert (= (and b!276224 res!229530) b!276221))

(assert (= (and b!276221 c!12615) b!276223))

(assert (= (and b!276221 (not c!12615)) b!276220))

(assert (= (and b!276220 res!229534) b!276225))

(assert (= (and b!276225 (not res!229531)) b!276219))

(assert (= (or b!276223 b!276220) bm!4427))

(declare-fun m!409223 () Bool)

(assert (=> bm!4427 m!409223))

(declare-fun m!409225 () Bool)

(assert (=> bm!4427 m!409225))

(assert (=> bm!4427 m!409223))

(assert (=> bm!4427 m!409225))

(declare-fun m!409227 () Bool)

(assert (=> bm!4427 m!409227))

(declare-fun m!409229 () Bool)

(assert (=> b!276219 m!409229))

(declare-fun m!409231 () Bool)

(assert (=> b!276219 m!409231))

(assert (=> b!276219 m!409229))

(assert (=> b!276219 m!409231))

(declare-fun m!409233 () Bool)

(assert (=> b!276219 m!409233))

(declare-fun m!409235 () Bool)

(assert (=> b!276222 m!409235))

(declare-fun m!409237 () Bool)

(assert (=> b!276224 m!409237))

(assert (=> b!276174 d!95092))

(declare-fun d!95110 () Bool)

(declare-fun e!196223 () Bool)

(assert (=> d!95110 e!196223))

(declare-fun res!229569 () Bool)

(assert (=> d!95110 (=> (not res!229569) (not e!196223))))

(declare-fun lt!414434 () (_ BitVec 64))

(declare-fun lt!414436 () (_ BitVec 64))

(declare-fun lt!414437 () (_ BitVec 64))

(assert (=> d!95110 (= res!229569 (= lt!414437 (bvsub lt!414436 lt!414434)))))

(assert (=> d!95110 (or (= (bvand lt!414436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414434 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414436 lt!414434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95110 (= lt!414434 (remainingBits!0 ((_ sign_extend 32) (size!6841 (buf!7309 bs1!11))) ((_ sign_extend 32) (currentByte!13511 bs1!11)) ((_ sign_extend 32) (currentBit!13506 bs1!11))))))

(declare-fun lt!414435 () (_ BitVec 64))

(declare-fun lt!414432 () (_ BitVec 64))

(assert (=> d!95110 (= lt!414436 (bvmul lt!414435 lt!414432))))

(assert (=> d!95110 (or (= lt!414435 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414432 (bvsdiv (bvmul lt!414435 lt!414432) lt!414435)))))

(assert (=> d!95110 (= lt!414432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95110 (= lt!414435 ((_ sign_extend 32) (size!6841 (buf!7309 bs1!11))))))

(assert (=> d!95110 (= lt!414437 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13511 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13506 bs1!11))))))

(assert (=> d!95110 (invariant!0 (currentBit!13506 bs1!11) (currentByte!13511 bs1!11) (size!6841 (buf!7309 bs1!11)))))

(assert (=> d!95110 (= (bitIndex!0 (size!6841 (buf!7309 bs1!11)) (currentByte!13511 bs1!11) (currentBit!13506 bs1!11)) lt!414437)))

(declare-fun b!276272 () Bool)

(declare-fun res!229570 () Bool)

(assert (=> b!276272 (=> (not res!229570) (not e!196223))))

(assert (=> b!276272 (= res!229570 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414437))))

(declare-fun b!276273 () Bool)

(declare-fun lt!414433 () (_ BitVec 64))

(assert (=> b!276273 (= e!196223 (bvsle lt!414437 (bvmul lt!414433 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276273 (or (= lt!414433 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414433 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414433)))))

(assert (=> b!276273 (= lt!414433 ((_ sign_extend 32) (size!6841 (buf!7309 bs1!11))))))

(assert (= (and d!95110 res!229569) b!276272))

(assert (= (and b!276272 res!229570) b!276273))

(declare-fun m!409271 () Bool)

(assert (=> d!95110 m!409271))

(declare-fun m!409273 () Bool)

(assert (=> d!95110 m!409273))

(assert (=> b!276174 d!95110))

(declare-fun d!95116 () Bool)

(assert (=> d!95116 (= (inv!12 bs1!11) (invariant!0 (currentBit!13506 bs1!11) (currentByte!13511 bs1!11) (size!6841 (buf!7309 bs1!11))))))

(declare-fun bs!23979 () Bool)

(assert (= bs!23979 d!95116))

(assert (=> bs!23979 m!409273))

(assert (=> start!61426 d!95116))

(declare-fun d!95118 () Bool)

(assert (=> d!95118 (= (inv!12 bs2!19) (invariant!0 (currentBit!13506 bs2!19) (currentByte!13511 bs2!19) (size!6841 (buf!7309 bs2!19))))))

(declare-fun bs!23980 () Bool)

(assert (= bs!23980 d!95118))

(declare-fun m!409275 () Bool)

(assert (=> bs!23980 m!409275))

(assert (=> start!61426 d!95118))

(declare-fun d!95120 () Bool)

(assert (=> d!95120 (= (array_inv!6565 (buf!7309 bs2!19)) (bvsge (size!6841 (buf!7309 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276170 d!95120))

(declare-fun d!95122 () Bool)

(assert (=> d!95122 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6841 (buf!7309 bs1!11))) ((_ sign_extend 32) (currentByte!13511 bs1!11)) ((_ sign_extend 32) (currentBit!13506 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6841 (buf!7309 bs1!11))) ((_ sign_extend 32) (currentByte!13511 bs1!11)) ((_ sign_extend 32) (currentBit!13506 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23981 () Bool)

(assert (= bs!23981 d!95122))

(assert (=> bs!23981 m!409271))

(assert (=> b!276171 d!95122))

(push 1)

(assert (not d!95084))

(assert (not bm!4427))

(assert (not b!276219))

(assert (not b!276222))

(assert (not d!95110))

(assert (not d!95086))

(assert (not b!276224))

(assert (not d!95122))

(assert (not d!95118))

(assert (not d!95116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


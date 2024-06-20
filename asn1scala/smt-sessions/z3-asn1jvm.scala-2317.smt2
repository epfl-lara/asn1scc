; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58870 () Bool)

(assert start!58870)

(declare-fun b!270088 () Bool)

(declare-fun e!189986 () Bool)

(declare-datatypes ((array!15055 0))(
  ( (array!15056 (arr!7544 (Array (_ BitVec 32) (_ BitVec 8))) (size!6557 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11928 0))(
  ( (BitStream!11929 (buf!7025 array!15055) (currentByte!12984 (_ BitVec 32)) (currentBit!12979 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11928)

(declare-fun array_inv!6281 (array!15055) Bool)

(assert (=> b!270088 (= e!189986 (array_inv!6281 (buf!7025 w1!591)))))

(declare-fun b!270089 () Bool)

(declare-fun e!189982 () Bool)

(declare-fun w2!587 () BitStream!11928)

(assert (=> b!270089 (= e!189982 (array_inv!6281 (buf!7025 w2!587)))))

(declare-fun w3!25 () BitStream!11928)

(declare-fun e!189987 () Bool)

(declare-fun b!270090 () Bool)

(assert (=> b!270090 (= e!189987 (not (or (bvsge (currentByte!12984 w1!591) (size!6557 (buf!7025 w1!591))) (bvsge (currentByte!12984 w1!591) (currentByte!12984 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12984 w2!587)) (bvsgt (size!6557 (buf!7025 w2!587)) (size!6557 (buf!7025 w3!25))) (bvsle (currentByte!12984 w2!587) (size!6557 (buf!7025 w2!587))))))))

(declare-fun arrayRangesEq!1089 (array!15055 array!15055 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270090 (arrayRangesEq!1089 (buf!7025 w1!591) (buf!7025 w3!25) #b00000000000000000000000000000000 (currentByte!12984 w1!591))))

(declare-datatypes ((Unit!19069 0))(
  ( (Unit!19070) )
))
(declare-fun lt!409274 () Unit!19069)

(declare-fun arrayRangesEqTransitive!352 (array!15055 array!15055 array!15055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19069)

(assert (=> b!270090 (= lt!409274 (arrayRangesEqTransitive!352 (buf!7025 w1!591) (buf!7025 w2!587) (buf!7025 w3!25) #b00000000000000000000000000000000 (currentByte!12984 w1!591) (currentByte!12984 w2!587)))))

(declare-fun res!225105 () Bool)

(assert (=> start!58870 (=> (not res!225105) (not e!189987))))

(declare-fun isPrefixOf!0 (BitStream!11928 BitStream!11928) Bool)

(assert (=> start!58870 (= res!225105 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58870 e!189987))

(declare-fun inv!12 (BitStream!11928) Bool)

(assert (=> start!58870 (and (inv!12 w1!591) e!189986)))

(assert (=> start!58870 (and (inv!12 w2!587) e!189982)))

(declare-fun e!189985 () Bool)

(assert (=> start!58870 (and (inv!12 w3!25) e!189985)))

(declare-fun b!270091 () Bool)

(assert (=> b!270091 (= e!189985 (array_inv!6281 (buf!7025 w3!25)))))

(declare-fun b!270092 () Bool)

(declare-fun res!225106 () Bool)

(assert (=> b!270092 (=> (not res!225106) (not e!189987))))

(assert (=> b!270092 (= res!225106 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58870 res!225105) b!270092))

(assert (= (and b!270092 res!225106) b!270090))

(assert (= start!58870 b!270088))

(assert (= start!58870 b!270089))

(assert (= start!58870 b!270091))

(declare-fun m!401909 () Bool)

(assert (=> b!270090 m!401909))

(declare-fun m!401911 () Bool)

(assert (=> b!270090 m!401911))

(declare-fun m!401913 () Bool)

(assert (=> b!270089 m!401913))

(declare-fun m!401915 () Bool)

(assert (=> start!58870 m!401915))

(declare-fun m!401917 () Bool)

(assert (=> start!58870 m!401917))

(declare-fun m!401919 () Bool)

(assert (=> start!58870 m!401919))

(declare-fun m!401921 () Bool)

(assert (=> start!58870 m!401921))

(declare-fun m!401923 () Bool)

(assert (=> b!270092 m!401923))

(declare-fun m!401925 () Bool)

(assert (=> b!270088 m!401925))

(declare-fun m!401927 () Bool)

(assert (=> b!270091 m!401927))

(check-sat (not b!270089) (not b!270088) (not b!270092) (not b!270090) (not start!58870) (not b!270091))
(check-sat)
(get-model)

(declare-fun d!91678 () Bool)

(declare-fun res!225157 () Bool)

(declare-fun e!190042 () Bool)

(assert (=> d!91678 (=> (not res!225157) (not e!190042))))

(assert (=> d!91678 (= res!225157 (= (size!6557 (buf!7025 w1!591)) (size!6557 (buf!7025 w2!587))))))

(assert (=> d!91678 (= (isPrefixOf!0 w1!591 w2!587) e!190042)))

(declare-fun b!270150 () Bool)

(declare-fun res!225156 () Bool)

(assert (=> b!270150 (=> (not res!225156) (not e!190042))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270150 (= res!225156 (bvsle (bitIndex!0 (size!6557 (buf!7025 w1!591)) (currentByte!12984 w1!591) (currentBit!12979 w1!591)) (bitIndex!0 (size!6557 (buf!7025 w2!587)) (currentByte!12984 w2!587) (currentBit!12979 w2!587))))))

(declare-fun b!270151 () Bool)

(declare-fun e!190043 () Bool)

(assert (=> b!270151 (= e!190042 e!190043)))

(declare-fun res!225155 () Bool)

(assert (=> b!270151 (=> res!225155 e!190043)))

(assert (=> b!270151 (= res!225155 (= (size!6557 (buf!7025 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270152 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15055 array!15055 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270152 (= e!190043 (arrayBitRangesEq!0 (buf!7025 w1!591) (buf!7025 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6557 (buf!7025 w1!591)) (currentByte!12984 w1!591) (currentBit!12979 w1!591))))))

(assert (= (and d!91678 res!225157) b!270150))

(assert (= (and b!270150 res!225156) b!270151))

(assert (= (and b!270151 (not res!225155)) b!270152))

(declare-fun m!401997 () Bool)

(assert (=> b!270150 m!401997))

(declare-fun m!401999 () Bool)

(assert (=> b!270150 m!401999))

(assert (=> b!270152 m!401997))

(assert (=> b!270152 m!401997))

(declare-fun m!402001 () Bool)

(assert (=> b!270152 m!402001))

(assert (=> start!58870 d!91678))

(declare-fun d!91698 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91698 (= (inv!12 w1!591) (invariant!0 (currentBit!12979 w1!591) (currentByte!12984 w1!591) (size!6557 (buf!7025 w1!591))))))

(declare-fun bs!23184 () Bool)

(assert (= bs!23184 d!91698))

(declare-fun m!402003 () Bool)

(assert (=> bs!23184 m!402003))

(assert (=> start!58870 d!91698))

(declare-fun d!91700 () Bool)

(assert (=> d!91700 (= (inv!12 w2!587) (invariant!0 (currentBit!12979 w2!587) (currentByte!12984 w2!587) (size!6557 (buf!7025 w2!587))))))

(declare-fun bs!23185 () Bool)

(assert (= bs!23185 d!91700))

(declare-fun m!402005 () Bool)

(assert (=> bs!23185 m!402005))

(assert (=> start!58870 d!91700))

(declare-fun d!91702 () Bool)

(assert (=> d!91702 (= (inv!12 w3!25) (invariant!0 (currentBit!12979 w3!25) (currentByte!12984 w3!25) (size!6557 (buf!7025 w3!25))))))

(declare-fun bs!23186 () Bool)

(assert (= bs!23186 d!91702))

(declare-fun m!402007 () Bool)

(assert (=> bs!23186 m!402007))

(assert (=> start!58870 d!91702))

(declare-fun d!91704 () Bool)

(declare-fun res!225162 () Bool)

(declare-fun e!190048 () Bool)

(assert (=> d!91704 (=> res!225162 e!190048)))

(assert (=> d!91704 (= res!225162 (= #b00000000000000000000000000000000 (currentByte!12984 w1!591)))))

(assert (=> d!91704 (= (arrayRangesEq!1089 (buf!7025 w1!591) (buf!7025 w3!25) #b00000000000000000000000000000000 (currentByte!12984 w1!591)) e!190048)))

(declare-fun b!270157 () Bool)

(declare-fun e!190049 () Bool)

(assert (=> b!270157 (= e!190048 e!190049)))

(declare-fun res!225163 () Bool)

(assert (=> b!270157 (=> (not res!225163) (not e!190049))))

(assert (=> b!270157 (= res!225163 (= (select (arr!7544 (buf!7025 w1!591)) #b00000000000000000000000000000000) (select (arr!7544 (buf!7025 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270158 () Bool)

(assert (=> b!270158 (= e!190049 (arrayRangesEq!1089 (buf!7025 w1!591) (buf!7025 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12984 w1!591)))))

(assert (= (and d!91704 (not res!225162)) b!270157))

(assert (= (and b!270157 res!225163) b!270158))

(declare-fun m!402009 () Bool)

(assert (=> b!270157 m!402009))

(declare-fun m!402011 () Bool)

(assert (=> b!270157 m!402011))

(declare-fun m!402013 () Bool)

(assert (=> b!270158 m!402013))

(assert (=> b!270090 d!91704))

(declare-fun d!91706 () Bool)

(assert (=> d!91706 (arrayRangesEq!1089 (buf!7025 w1!591) (buf!7025 w3!25) #b00000000000000000000000000000000 (currentByte!12984 w1!591))))

(declare-fun lt!409286 () Unit!19069)

(declare-fun choose!391 (array!15055 array!15055 array!15055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19069)

(assert (=> d!91706 (= lt!409286 (choose!391 (buf!7025 w1!591) (buf!7025 w2!587) (buf!7025 w3!25) #b00000000000000000000000000000000 (currentByte!12984 w1!591) (currentByte!12984 w2!587)))))

(assert (=> d!91706 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12984 w1!591)) (bvsle (currentByte!12984 w1!591) (currentByte!12984 w2!587)))))

(assert (=> d!91706 (= (arrayRangesEqTransitive!352 (buf!7025 w1!591) (buf!7025 w2!587) (buf!7025 w3!25) #b00000000000000000000000000000000 (currentByte!12984 w1!591) (currentByte!12984 w2!587)) lt!409286)))

(declare-fun bs!23187 () Bool)

(assert (= bs!23187 d!91706))

(assert (=> bs!23187 m!401909))

(declare-fun m!402015 () Bool)

(assert (=> bs!23187 m!402015))

(assert (=> b!270090 d!91706))

(declare-fun d!91708 () Bool)

(assert (=> d!91708 (= (array_inv!6281 (buf!7025 w1!591)) (bvsge (size!6557 (buf!7025 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270088 d!91708))

(declare-fun d!91710 () Bool)

(assert (=> d!91710 (= (array_inv!6281 (buf!7025 w2!587)) (bvsge (size!6557 (buf!7025 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270089 d!91710))

(declare-fun d!91712 () Bool)

(declare-fun res!225166 () Bool)

(declare-fun e!190050 () Bool)

(assert (=> d!91712 (=> (not res!225166) (not e!190050))))

(assert (=> d!91712 (= res!225166 (= (size!6557 (buf!7025 w2!587)) (size!6557 (buf!7025 w3!25))))))

(assert (=> d!91712 (= (isPrefixOf!0 w2!587 w3!25) e!190050)))

(declare-fun b!270159 () Bool)

(declare-fun res!225165 () Bool)

(assert (=> b!270159 (=> (not res!225165) (not e!190050))))

(assert (=> b!270159 (= res!225165 (bvsle (bitIndex!0 (size!6557 (buf!7025 w2!587)) (currentByte!12984 w2!587) (currentBit!12979 w2!587)) (bitIndex!0 (size!6557 (buf!7025 w3!25)) (currentByte!12984 w3!25) (currentBit!12979 w3!25))))))

(declare-fun b!270160 () Bool)

(declare-fun e!190051 () Bool)

(assert (=> b!270160 (= e!190050 e!190051)))

(declare-fun res!225164 () Bool)

(assert (=> b!270160 (=> res!225164 e!190051)))

(assert (=> b!270160 (= res!225164 (= (size!6557 (buf!7025 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270161 () Bool)

(assert (=> b!270161 (= e!190051 (arrayBitRangesEq!0 (buf!7025 w2!587) (buf!7025 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6557 (buf!7025 w2!587)) (currentByte!12984 w2!587) (currentBit!12979 w2!587))))))

(assert (= (and d!91712 res!225166) b!270159))

(assert (= (and b!270159 res!225165) b!270160))

(assert (= (and b!270160 (not res!225164)) b!270161))

(assert (=> b!270159 m!401999))

(declare-fun m!402017 () Bool)

(assert (=> b!270159 m!402017))

(assert (=> b!270161 m!401999))

(assert (=> b!270161 m!401999))

(declare-fun m!402019 () Bool)

(assert (=> b!270161 m!402019))

(assert (=> b!270092 d!91712))

(declare-fun d!91714 () Bool)

(assert (=> d!91714 (= (array_inv!6281 (buf!7025 w3!25)) (bvsge (size!6557 (buf!7025 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270091 d!91714))

(check-sat (not d!91698) (not b!270158) (not b!270159) (not d!91700) (not d!91706) (not b!270161) (not d!91702) (not b!270152) (not b!270150))
(check-sat)
(get-model)

(assert (=> d!91706 d!91704))

(declare-fun d!91722 () Bool)

(assert (=> d!91722 (arrayRangesEq!1089 (buf!7025 w1!591) (buf!7025 w3!25) #b00000000000000000000000000000000 (currentByte!12984 w1!591))))

(assert (=> d!91722 true))

(declare-fun _$16!125 () Unit!19069)

(assert (=> d!91722 (= (choose!391 (buf!7025 w1!591) (buf!7025 w2!587) (buf!7025 w3!25) #b00000000000000000000000000000000 (currentByte!12984 w1!591) (currentByte!12984 w2!587)) _$16!125)))

(declare-fun bs!23188 () Bool)

(assert (= bs!23188 d!91722))

(assert (=> bs!23188 m!401909))

(assert (=> d!91706 d!91722))

(declare-fun d!91724 () Bool)

(assert (=> d!91724 (= (invariant!0 (currentBit!12979 w2!587) (currentByte!12984 w2!587) (size!6557 (buf!7025 w2!587))) (and (bvsge (currentBit!12979 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12979 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12984 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12984 w2!587) (size!6557 (buf!7025 w2!587))) (and (= (currentBit!12979 w2!587) #b00000000000000000000000000000000) (= (currentByte!12984 w2!587) (size!6557 (buf!7025 w2!587)))))))))

(assert (=> d!91700 d!91724))

(declare-fun b!270197 () Bool)

(declare-fun e!190085 () Bool)

(declare-fun e!190083 () Bool)

(assert (=> b!270197 (= e!190085 e!190083)))

(declare-fun res!225193 () Bool)

(assert (=> b!270197 (=> (not res!225193) (not e!190083))))

(declare-fun e!190086 () Bool)

(assert (=> b!270197 (= res!225193 e!190086)))

(declare-fun res!225192 () Bool)

(assert (=> b!270197 (=> res!225192 e!190086)))

(declare-datatypes ((tuple4!452 0))(
  ( (tuple4!453 (_1!12209 (_ BitVec 32)) (_2!12209 (_ BitVec 32)) (_3!1006 (_ BitVec 32)) (_4!226 (_ BitVec 32))) )
))
(declare-fun lt!409303 () tuple4!452)

(assert (=> b!270197 (= res!225192 (bvsge (_1!12209 lt!409303) (_2!12209 lt!409303)))))

(declare-fun lt!409304 () (_ BitVec 32))

(assert (=> b!270197 (= lt!409304 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6557 (buf!7025 w1!591)) (currentByte!12984 w1!591) (currentBit!12979 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409302 () (_ BitVec 32))

(assert (=> b!270197 (= lt!409302 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!452)

(assert (=> b!270197 (= lt!409303 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6557 (buf!7025 w1!591)) (currentByte!12984 w1!591) (currentBit!12979 w1!591))))))

(declare-fun d!91726 () Bool)

(declare-fun res!225194 () Bool)

(assert (=> d!91726 (=> res!225194 e!190085)))

(assert (=> d!91726 (= res!225194 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6557 (buf!7025 w1!591)) (currentByte!12984 w1!591) (currentBit!12979 w1!591))))))

(assert (=> d!91726 (= (arrayBitRangesEq!0 (buf!7025 w1!591) (buf!7025 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6557 (buf!7025 w1!591)) (currentByte!12984 w1!591) (currentBit!12979 w1!591))) e!190085)))

(declare-fun b!270198 () Bool)

(declare-fun e!190087 () Bool)

(declare-fun e!190082 () Bool)

(assert (=> b!270198 (= e!190087 e!190082)))

(declare-fun res!225195 () Bool)

(declare-fun call!4313 () Bool)

(assert (=> b!270198 (= res!225195 call!4313)))

(assert (=> b!270198 (=> (not res!225195) (not e!190082))))

(declare-fun b!270199 () Bool)

(declare-fun res!225196 () Bool)

(assert (=> b!270199 (= res!225196 (= lt!409304 #b00000000000000000000000000000000))))

(declare-fun e!190084 () Bool)

(assert (=> b!270199 (=> res!225196 e!190084)))

(assert (=> b!270199 (= e!190082 e!190084)))

(declare-fun bm!4310 () Bool)

(declare-fun c!12462 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4310 (= call!4313 (byteRangesEq!0 (select (arr!7544 (buf!7025 w1!591)) (_3!1006 lt!409303)) (select (arr!7544 (buf!7025 w2!587)) (_3!1006 lt!409303)) lt!409302 (ite c!12462 lt!409304 #b00000000000000000000000000001000)))))

(declare-fun b!270200 () Bool)

(assert (=> b!270200 (= e!190083 e!190087)))

(assert (=> b!270200 (= c!12462 (= (_3!1006 lt!409303) (_4!226 lt!409303)))))

(declare-fun b!270201 () Bool)

(assert (=> b!270201 (= e!190087 call!4313)))

(declare-fun b!270202 () Bool)

(assert (=> b!270202 (= e!190084 (byteRangesEq!0 (select (arr!7544 (buf!7025 w1!591)) (_4!226 lt!409303)) (select (arr!7544 (buf!7025 w2!587)) (_4!226 lt!409303)) #b00000000000000000000000000000000 lt!409304))))

(declare-fun b!270203 () Bool)

(assert (=> b!270203 (= e!190086 (arrayRangesEq!1089 (buf!7025 w1!591) (buf!7025 w2!587) (_1!12209 lt!409303) (_2!12209 lt!409303)))))

(assert (= (and d!91726 (not res!225194)) b!270197))

(assert (= (and b!270197 (not res!225192)) b!270203))

(assert (= (and b!270197 res!225193) b!270200))

(assert (= (and b!270200 c!12462) b!270201))

(assert (= (and b!270200 (not c!12462)) b!270198))

(assert (= (and b!270198 res!225195) b!270199))

(assert (= (and b!270199 (not res!225196)) b!270202))

(assert (= (or b!270201 b!270198) bm!4310))

(assert (=> b!270197 m!401997))

(declare-fun m!402037 () Bool)

(assert (=> b!270197 m!402037))

(declare-fun m!402039 () Bool)

(assert (=> bm!4310 m!402039))

(declare-fun m!402041 () Bool)

(assert (=> bm!4310 m!402041))

(assert (=> bm!4310 m!402039))

(assert (=> bm!4310 m!402041))

(declare-fun m!402043 () Bool)

(assert (=> bm!4310 m!402043))

(declare-fun m!402045 () Bool)

(assert (=> b!270202 m!402045))

(declare-fun m!402047 () Bool)

(assert (=> b!270202 m!402047))

(assert (=> b!270202 m!402045))

(assert (=> b!270202 m!402047))

(declare-fun m!402049 () Bool)

(assert (=> b!270202 m!402049))

(declare-fun m!402051 () Bool)

(assert (=> b!270203 m!402051))

(assert (=> b!270152 d!91726))

(declare-fun d!91732 () Bool)

(declare-fun e!190104 () Bool)

(assert (=> d!91732 e!190104))

(declare-fun res!225222 () Bool)

(assert (=> d!91732 (=> (not res!225222) (not e!190104))))

(declare-fun lt!409371 () (_ BitVec 64))

(declare-fun lt!409372 () (_ BitVec 64))

(declare-fun lt!409370 () (_ BitVec 64))

(assert (=> d!91732 (= res!225222 (= lt!409372 (bvsub lt!409371 lt!409370)))))

(assert (=> d!91732 (or (= (bvand lt!409371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409370 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409371 lt!409370) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91732 (= lt!409370 (remainingBits!0 ((_ sign_extend 32) (size!6557 (buf!7025 w1!591))) ((_ sign_extend 32) (currentByte!12984 w1!591)) ((_ sign_extend 32) (currentBit!12979 w1!591))))))

(declare-fun lt!409373 () (_ BitVec 64))

(declare-fun lt!409369 () (_ BitVec 64))

(assert (=> d!91732 (= lt!409371 (bvmul lt!409373 lt!409369))))

(assert (=> d!91732 (or (= lt!409373 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409369 (bvsdiv (bvmul lt!409373 lt!409369) lt!409373)))))

(assert (=> d!91732 (= lt!409369 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91732 (= lt!409373 ((_ sign_extend 32) (size!6557 (buf!7025 w1!591))))))

(assert (=> d!91732 (= lt!409372 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12984 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12979 w1!591))))))

(assert (=> d!91732 (invariant!0 (currentBit!12979 w1!591) (currentByte!12984 w1!591) (size!6557 (buf!7025 w1!591)))))

(assert (=> d!91732 (= (bitIndex!0 (size!6557 (buf!7025 w1!591)) (currentByte!12984 w1!591) (currentBit!12979 w1!591)) lt!409372)))

(declare-fun b!270231 () Bool)

(declare-fun res!225223 () Bool)

(assert (=> b!270231 (=> (not res!225223) (not e!190104))))

(assert (=> b!270231 (= res!225223 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409372))))

(declare-fun b!270232 () Bool)

(declare-fun lt!409368 () (_ BitVec 64))

(assert (=> b!270232 (= e!190104 (bvsle lt!409372 (bvmul lt!409368 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270232 (or (= lt!409368 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409368 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409368)))))

(assert (=> b!270232 (= lt!409368 ((_ sign_extend 32) (size!6557 (buf!7025 w1!591))))))

(assert (= (and d!91732 res!225222) b!270231))

(assert (= (and b!270231 res!225223) b!270232))

(declare-fun m!402077 () Bool)

(assert (=> d!91732 m!402077))

(assert (=> d!91732 m!402003))

(assert (=> b!270152 d!91732))

(declare-fun d!91752 () Bool)

(assert (=> d!91752 (= (invariant!0 (currentBit!12979 w3!25) (currentByte!12984 w3!25) (size!6557 (buf!7025 w3!25))) (and (bvsge (currentBit!12979 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12979 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12984 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12984 w3!25) (size!6557 (buf!7025 w3!25))) (and (= (currentBit!12979 w3!25) #b00000000000000000000000000000000) (= (currentByte!12984 w3!25) (size!6557 (buf!7025 w3!25)))))))))

(assert (=> d!91702 d!91752))

(assert (=> b!270150 d!91732))

(declare-fun d!91754 () Bool)

(declare-fun e!190106 () Bool)

(assert (=> d!91754 e!190106))

(declare-fun res!225226 () Bool)

(assert (=> d!91754 (=> (not res!225226) (not e!190106))))

(declare-fun lt!409383 () (_ BitVec 64))

(declare-fun lt!409382 () (_ BitVec 64))

(declare-fun lt!409384 () (_ BitVec 64))

(assert (=> d!91754 (= res!225226 (= lt!409384 (bvsub lt!409383 lt!409382)))))

(assert (=> d!91754 (or (= (bvand lt!409383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409382 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409383 lt!409382) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91754 (= lt!409382 (remainingBits!0 ((_ sign_extend 32) (size!6557 (buf!7025 w2!587))) ((_ sign_extend 32) (currentByte!12984 w2!587)) ((_ sign_extend 32) (currentBit!12979 w2!587))))))

(declare-fun lt!409385 () (_ BitVec 64))

(declare-fun lt!409381 () (_ BitVec 64))

(assert (=> d!91754 (= lt!409383 (bvmul lt!409385 lt!409381))))

(assert (=> d!91754 (or (= lt!409385 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409381 (bvsdiv (bvmul lt!409385 lt!409381) lt!409385)))))

(assert (=> d!91754 (= lt!409381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91754 (= lt!409385 ((_ sign_extend 32) (size!6557 (buf!7025 w2!587))))))

(assert (=> d!91754 (= lt!409384 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12984 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12979 w2!587))))))

(assert (=> d!91754 (invariant!0 (currentBit!12979 w2!587) (currentByte!12984 w2!587) (size!6557 (buf!7025 w2!587)))))

(assert (=> d!91754 (= (bitIndex!0 (size!6557 (buf!7025 w2!587)) (currentByte!12984 w2!587) (currentBit!12979 w2!587)) lt!409384)))

(declare-fun b!270235 () Bool)

(declare-fun res!225227 () Bool)

(assert (=> b!270235 (=> (not res!225227) (not e!190106))))

(assert (=> b!270235 (= res!225227 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409384))))

(declare-fun b!270236 () Bool)

(declare-fun lt!409380 () (_ BitVec 64))

(assert (=> b!270236 (= e!190106 (bvsle lt!409384 (bvmul lt!409380 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270236 (or (= lt!409380 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409380 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409380)))))

(assert (=> b!270236 (= lt!409380 ((_ sign_extend 32) (size!6557 (buf!7025 w2!587))))))

(assert (= (and d!91754 res!225226) b!270235))

(assert (= (and b!270235 res!225227) b!270236))

(declare-fun m!402081 () Bool)

(assert (=> d!91754 m!402081))

(assert (=> d!91754 m!402005))

(assert (=> b!270150 d!91754))

(declare-fun b!270239 () Bool)

(declare-fun e!190112 () Bool)

(declare-fun e!190110 () Bool)

(assert (=> b!270239 (= e!190112 e!190110)))

(declare-fun res!225231 () Bool)

(assert (=> b!270239 (=> (not res!225231) (not e!190110))))

(declare-fun e!190113 () Bool)

(assert (=> b!270239 (= res!225231 e!190113)))

(declare-fun res!225230 () Bool)

(assert (=> b!270239 (=> res!225230 e!190113)))

(declare-fun lt!409387 () tuple4!452)

(assert (=> b!270239 (= res!225230 (bvsge (_1!12209 lt!409387) (_2!12209 lt!409387)))))

(declare-fun lt!409388 () (_ BitVec 32))

(assert (=> b!270239 (= lt!409388 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6557 (buf!7025 w2!587)) (currentByte!12984 w2!587) (currentBit!12979 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!409386 () (_ BitVec 32))

(assert (=> b!270239 (= lt!409386 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270239 (= lt!409387 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6557 (buf!7025 w2!587)) (currentByte!12984 w2!587) (currentBit!12979 w2!587))))))

(declare-fun d!91760 () Bool)

(declare-fun res!225232 () Bool)

(assert (=> d!91760 (=> res!225232 e!190112)))

(assert (=> d!91760 (= res!225232 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6557 (buf!7025 w2!587)) (currentByte!12984 w2!587) (currentBit!12979 w2!587))))))

(assert (=> d!91760 (= (arrayBitRangesEq!0 (buf!7025 w2!587) (buf!7025 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6557 (buf!7025 w2!587)) (currentByte!12984 w2!587) (currentBit!12979 w2!587))) e!190112)))

(declare-fun b!270240 () Bool)

(declare-fun e!190114 () Bool)

(declare-fun e!190109 () Bool)

(assert (=> b!270240 (= e!190114 e!190109)))

(declare-fun res!225233 () Bool)

(declare-fun call!4315 () Bool)

(assert (=> b!270240 (= res!225233 call!4315)))

(assert (=> b!270240 (=> (not res!225233) (not e!190109))))

(declare-fun b!270241 () Bool)

(declare-fun res!225234 () Bool)

(assert (=> b!270241 (= res!225234 (= lt!409388 #b00000000000000000000000000000000))))

(declare-fun e!190111 () Bool)

(assert (=> b!270241 (=> res!225234 e!190111)))

(assert (=> b!270241 (= e!190109 e!190111)))

(declare-fun bm!4312 () Bool)

(declare-fun c!12464 () Bool)

(assert (=> bm!4312 (= call!4315 (byteRangesEq!0 (select (arr!7544 (buf!7025 w2!587)) (_3!1006 lt!409387)) (select (arr!7544 (buf!7025 w3!25)) (_3!1006 lt!409387)) lt!409386 (ite c!12464 lt!409388 #b00000000000000000000000000001000)))))

(declare-fun b!270242 () Bool)

(assert (=> b!270242 (= e!190110 e!190114)))

(assert (=> b!270242 (= c!12464 (= (_3!1006 lt!409387) (_4!226 lt!409387)))))

(declare-fun b!270243 () Bool)

(assert (=> b!270243 (= e!190114 call!4315)))

(declare-fun b!270244 () Bool)

(assert (=> b!270244 (= e!190111 (byteRangesEq!0 (select (arr!7544 (buf!7025 w2!587)) (_4!226 lt!409387)) (select (arr!7544 (buf!7025 w3!25)) (_4!226 lt!409387)) #b00000000000000000000000000000000 lt!409388))))

(declare-fun b!270245 () Bool)

(assert (=> b!270245 (= e!190113 (arrayRangesEq!1089 (buf!7025 w2!587) (buf!7025 w3!25) (_1!12209 lt!409387) (_2!12209 lt!409387)))))

(assert (= (and d!91760 (not res!225232)) b!270239))

(assert (= (and b!270239 (not res!225230)) b!270245))

(assert (= (and b!270239 res!225231) b!270242))

(assert (= (and b!270242 c!12464) b!270243))

(assert (= (and b!270242 (not c!12464)) b!270240))

(assert (= (and b!270240 res!225233) b!270241))

(assert (= (and b!270241 (not res!225234)) b!270244))

(assert (= (or b!270243 b!270240) bm!4312))

(assert (=> b!270239 m!401999))

(declare-fun m!402089 () Bool)

(assert (=> b!270239 m!402089))

(declare-fun m!402091 () Bool)

(assert (=> bm!4312 m!402091))

(declare-fun m!402093 () Bool)

(assert (=> bm!4312 m!402093))

(assert (=> bm!4312 m!402091))

(assert (=> bm!4312 m!402093))

(declare-fun m!402095 () Bool)

(assert (=> bm!4312 m!402095))

(declare-fun m!402097 () Bool)

(assert (=> b!270244 m!402097))

(declare-fun m!402099 () Bool)

(assert (=> b!270244 m!402099))

(assert (=> b!270244 m!402097))

(assert (=> b!270244 m!402099))

(declare-fun m!402101 () Bool)

(assert (=> b!270244 m!402101))

(declare-fun m!402103 () Bool)

(assert (=> b!270245 m!402103))

(assert (=> b!270161 d!91760))

(assert (=> b!270161 d!91754))

(declare-fun d!91762 () Bool)

(declare-fun res!225235 () Bool)

(declare-fun e!190115 () Bool)

(assert (=> d!91762 (=> res!225235 e!190115)))

(assert (=> d!91762 (= res!225235 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12984 w1!591)))))

(assert (=> d!91762 (= (arrayRangesEq!1089 (buf!7025 w1!591) (buf!7025 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12984 w1!591)) e!190115)))

(declare-fun b!270246 () Bool)

(declare-fun e!190116 () Bool)

(assert (=> b!270246 (= e!190115 e!190116)))

(declare-fun res!225236 () Bool)

(assert (=> b!270246 (=> (not res!225236) (not e!190116))))

(assert (=> b!270246 (= res!225236 (= (select (arr!7544 (buf!7025 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7544 (buf!7025 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270247 () Bool)

(assert (=> b!270247 (= e!190116 (arrayRangesEq!1089 (buf!7025 w1!591) (buf!7025 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12984 w1!591)))))

(assert (= (and d!91762 (not res!225235)) b!270246))

(assert (= (and b!270246 res!225236) b!270247))

(declare-fun m!402105 () Bool)

(assert (=> b!270246 m!402105))

(declare-fun m!402107 () Bool)

(assert (=> b!270246 m!402107))

(declare-fun m!402109 () Bool)

(assert (=> b!270247 m!402109))

(assert (=> b!270158 d!91762))

(assert (=> b!270159 d!91754))

(declare-fun d!91764 () Bool)

(declare-fun e!190117 () Bool)

(assert (=> d!91764 e!190117))

(declare-fun res!225237 () Bool)

(assert (=> d!91764 (=> (not res!225237) (not e!190117))))

(declare-fun lt!409393 () (_ BitVec 64))

(declare-fun lt!409391 () (_ BitVec 64))

(declare-fun lt!409392 () (_ BitVec 64))

(assert (=> d!91764 (= res!225237 (= lt!409393 (bvsub lt!409392 lt!409391)))))

(assert (=> d!91764 (or (= (bvand lt!409392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409391 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409392 lt!409391) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91764 (= lt!409391 (remainingBits!0 ((_ sign_extend 32) (size!6557 (buf!7025 w3!25))) ((_ sign_extend 32) (currentByte!12984 w3!25)) ((_ sign_extend 32) (currentBit!12979 w3!25))))))

(declare-fun lt!409394 () (_ BitVec 64))

(declare-fun lt!409390 () (_ BitVec 64))

(assert (=> d!91764 (= lt!409392 (bvmul lt!409394 lt!409390))))

(assert (=> d!91764 (or (= lt!409394 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409390 (bvsdiv (bvmul lt!409394 lt!409390) lt!409394)))))

(assert (=> d!91764 (= lt!409390 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91764 (= lt!409394 ((_ sign_extend 32) (size!6557 (buf!7025 w3!25))))))

(assert (=> d!91764 (= lt!409393 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12984 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12979 w3!25))))))

(assert (=> d!91764 (invariant!0 (currentBit!12979 w3!25) (currentByte!12984 w3!25) (size!6557 (buf!7025 w3!25)))))

(assert (=> d!91764 (= (bitIndex!0 (size!6557 (buf!7025 w3!25)) (currentByte!12984 w3!25) (currentBit!12979 w3!25)) lt!409393)))

(declare-fun b!270248 () Bool)

(declare-fun res!225238 () Bool)

(assert (=> b!270248 (=> (not res!225238) (not e!190117))))

(assert (=> b!270248 (= res!225238 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409393))))

(declare-fun b!270249 () Bool)

(declare-fun lt!409389 () (_ BitVec 64))

(assert (=> b!270249 (= e!190117 (bvsle lt!409393 (bvmul lt!409389 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270249 (or (= lt!409389 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409389 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409389)))))

(assert (=> b!270249 (= lt!409389 ((_ sign_extend 32) (size!6557 (buf!7025 w3!25))))))

(assert (= (and d!91764 res!225237) b!270248))

(assert (= (and b!270248 res!225238) b!270249))

(declare-fun m!402111 () Bool)

(assert (=> d!91764 m!402111))

(assert (=> d!91764 m!402007))

(assert (=> b!270159 d!91764))

(declare-fun d!91766 () Bool)

(assert (=> d!91766 (= (invariant!0 (currentBit!12979 w1!591) (currentByte!12984 w1!591) (size!6557 (buf!7025 w1!591))) (and (bvsge (currentBit!12979 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12979 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12984 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12984 w1!591) (size!6557 (buf!7025 w1!591))) (and (= (currentBit!12979 w1!591) #b00000000000000000000000000000000) (= (currentByte!12984 w1!591) (size!6557 (buf!7025 w1!591)))))))))

(assert (=> d!91698 d!91766))

(check-sat (not b!270197) (not bm!4312) (not b!270202) (not b!270247) (not b!270203) (not b!270245) (not d!91722) (not d!91764) (not d!91732) (not b!270239) (not bm!4310) (not d!91754) (not b!270244))
(check-sat)

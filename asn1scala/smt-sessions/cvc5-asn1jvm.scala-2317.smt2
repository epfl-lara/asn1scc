; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58868 () Bool)

(assert start!58868)

(declare-fun b!270073 () Bool)

(declare-fun res!225099 () Bool)

(declare-fun e!189966 () Bool)

(assert (=> b!270073 (=> (not res!225099) (not e!189966))))

(declare-datatypes ((array!15053 0))(
  ( (array!15054 (arr!7543 (Array (_ BitVec 32) (_ BitVec 8))) (size!6556 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11926 0))(
  ( (BitStream!11927 (buf!7024 array!15053) (currentByte!12983 (_ BitVec 32)) (currentBit!12978 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11926)

(declare-fun w3!25 () BitStream!11926)

(declare-fun isPrefixOf!0 (BitStream!11926 BitStream!11926) Bool)

(assert (=> b!270073 (= res!225099 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270074 () Bool)

(declare-fun e!189961 () Bool)

(declare-fun array_inv!6280 (array!15053) Bool)

(assert (=> b!270074 (= e!189961 (array_inv!6280 (buf!7024 w2!587)))))

(declare-fun w1!591 () BitStream!11926)

(declare-fun b!270075 () Bool)

(assert (=> b!270075 (= e!189966 (not (or (bvsge (currentByte!12983 w1!591) (size!6556 (buf!7024 w1!591))) (bvsge (currentByte!12983 w1!591) (currentByte!12983 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12983 w2!587)) (bvsgt (size!6556 (buf!7024 w2!587)) (size!6556 (buf!7024 w3!25))) (bvsle (currentByte!12983 w2!587) (size!6556 (buf!7024 w2!587))))))))

(declare-fun arrayRangesEq!1088 (array!15053 array!15053 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270075 (arrayRangesEq!1088 (buf!7024 w1!591) (buf!7024 w3!25) #b00000000000000000000000000000000 (currentByte!12983 w1!591))))

(declare-datatypes ((Unit!19067 0))(
  ( (Unit!19068) )
))
(declare-fun lt!409271 () Unit!19067)

(declare-fun arrayRangesEqTransitive!351 (array!15053 array!15053 array!15053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19067)

(assert (=> b!270075 (= lt!409271 (arrayRangesEqTransitive!351 (buf!7024 w1!591) (buf!7024 w2!587) (buf!7024 w3!25) #b00000000000000000000000000000000 (currentByte!12983 w1!591) (currentByte!12983 w2!587)))))

(declare-fun res!225100 () Bool)

(assert (=> start!58868 (=> (not res!225100) (not e!189966))))

(assert (=> start!58868 (= res!225100 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58868 e!189966))

(declare-fun e!189965 () Bool)

(declare-fun inv!12 (BitStream!11926) Bool)

(assert (=> start!58868 (and (inv!12 w1!591) e!189965)))

(assert (=> start!58868 (and (inv!12 w2!587) e!189961)))

(declare-fun e!189964 () Bool)

(assert (=> start!58868 (and (inv!12 w3!25) e!189964)))

(declare-fun b!270076 () Bool)

(assert (=> b!270076 (= e!189964 (array_inv!6280 (buf!7024 w3!25)))))

(declare-fun b!270077 () Bool)

(assert (=> b!270077 (= e!189965 (array_inv!6280 (buf!7024 w1!591)))))

(assert (= (and start!58868 res!225100) b!270073))

(assert (= (and b!270073 res!225099) b!270075))

(assert (= start!58868 b!270077))

(assert (= start!58868 b!270074))

(assert (= start!58868 b!270076))

(declare-fun m!401889 () Bool)

(assert (=> start!58868 m!401889))

(declare-fun m!401891 () Bool)

(assert (=> start!58868 m!401891))

(declare-fun m!401893 () Bool)

(assert (=> start!58868 m!401893))

(declare-fun m!401895 () Bool)

(assert (=> start!58868 m!401895))

(declare-fun m!401897 () Bool)

(assert (=> b!270075 m!401897))

(declare-fun m!401899 () Bool)

(assert (=> b!270075 m!401899))

(declare-fun m!401901 () Bool)

(assert (=> b!270076 m!401901))

(declare-fun m!401903 () Bool)

(assert (=> b!270074 m!401903))

(declare-fun m!401905 () Bool)

(assert (=> b!270077 m!401905))

(declare-fun m!401907 () Bool)

(assert (=> b!270073 m!401907))

(push 1)

(assert (not b!270077))

(assert (not b!270075))

(assert (not b!270074))

(assert (not b!270073))

(assert (not start!58868))

(assert (not b!270076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91656 () Bool)

(assert (=> d!91656 (= (array_inv!6280 (buf!7024 w3!25)) (bvsge (size!6556 (buf!7024 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270076 d!91656))

(declare-fun d!91658 () Bool)

(assert (=> d!91658 (= (array_inv!6280 (buf!7024 w2!587)) (bvsge (size!6556 (buf!7024 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270074 d!91658))

(declare-fun d!91660 () Bool)

(declare-fun res!225121 () Bool)

(declare-fun e!190018 () Bool)

(assert (=> d!91660 (=> res!225121 e!190018)))

(assert (=> d!91660 (= res!225121 (= #b00000000000000000000000000000000 (currentByte!12983 w1!591)))))

(assert (=> d!91660 (= (arrayRangesEq!1088 (buf!7024 w1!591) (buf!7024 w3!25) #b00000000000000000000000000000000 (currentByte!12983 w1!591)) e!190018)))

(declare-fun b!270116 () Bool)

(declare-fun e!190019 () Bool)

(assert (=> b!270116 (= e!190018 e!190019)))

(declare-fun res!225122 () Bool)

(assert (=> b!270116 (=> (not res!225122) (not e!190019))))

(assert (=> b!270116 (= res!225122 (= (select (arr!7543 (buf!7024 w1!591)) #b00000000000000000000000000000000) (select (arr!7543 (buf!7024 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270117 () Bool)

(assert (=> b!270117 (= e!190019 (arrayRangesEq!1088 (buf!7024 w1!591) (buf!7024 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12983 w1!591)))))

(assert (= (and d!91660 (not res!225121)) b!270116))

(assert (= (and b!270116 res!225122) b!270117))

(declare-fun m!401949 () Bool)

(assert (=> b!270116 m!401949))

(declare-fun m!401951 () Bool)

(assert (=> b!270116 m!401951))

(declare-fun m!401953 () Bool)

(assert (=> b!270117 m!401953))

(assert (=> b!270075 d!91660))

(declare-fun d!91670 () Bool)

(assert (=> d!91670 (arrayRangesEq!1088 (buf!7024 w1!591) (buf!7024 w3!25) #b00000000000000000000000000000000 (currentByte!12983 w1!591))))

(declare-fun lt!409280 () Unit!19067)

(declare-fun choose!389 (array!15053 array!15053 array!15053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19067)

(assert (=> d!91670 (= lt!409280 (choose!389 (buf!7024 w1!591) (buf!7024 w2!587) (buf!7024 w3!25) #b00000000000000000000000000000000 (currentByte!12983 w1!591) (currentByte!12983 w2!587)))))

(assert (=> d!91670 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12983 w1!591)) (bvsle (currentByte!12983 w1!591) (currentByte!12983 w2!587)))))

(assert (=> d!91670 (= (arrayRangesEqTransitive!351 (buf!7024 w1!591) (buf!7024 w2!587) (buf!7024 w3!25) #b00000000000000000000000000000000 (currentByte!12983 w1!591) (currentByte!12983 w2!587)) lt!409280)))

(declare-fun bs!23176 () Bool)

(assert (= bs!23176 d!91670))

(assert (=> bs!23176 m!401897))

(declare-fun m!401961 () Bool)

(assert (=> bs!23176 m!401961))

(assert (=> b!270075 d!91670))

(declare-fun d!91674 () Bool)

(declare-fun res!225139 () Bool)

(declare-fun e!190031 () Bool)

(assert (=> d!91674 (=> (not res!225139) (not e!190031))))

(assert (=> d!91674 (= res!225139 (= (size!6556 (buf!7024 w1!591)) (size!6556 (buf!7024 w2!587))))))

(assert (=> d!91674 (= (isPrefixOf!0 w1!591 w2!587) e!190031)))

(declare-fun b!270132 () Bool)

(declare-fun res!225137 () Bool)

(assert (=> b!270132 (=> (not res!225137) (not e!190031))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270132 (= res!225137 (bvsle (bitIndex!0 (size!6556 (buf!7024 w1!591)) (currentByte!12983 w1!591) (currentBit!12978 w1!591)) (bitIndex!0 (size!6556 (buf!7024 w2!587)) (currentByte!12983 w2!587) (currentBit!12978 w2!587))))))

(declare-fun b!270133 () Bool)

(declare-fun e!190030 () Bool)

(assert (=> b!270133 (= e!190031 e!190030)))

(declare-fun res!225138 () Bool)

(assert (=> b!270133 (=> res!225138 e!190030)))

(assert (=> b!270133 (= res!225138 (= (size!6556 (buf!7024 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270134 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15053 array!15053 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270134 (= e!190030 (arrayBitRangesEq!0 (buf!7024 w1!591) (buf!7024 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6556 (buf!7024 w1!591)) (currentByte!12983 w1!591) (currentBit!12978 w1!591))))))

(assert (= (and d!91674 res!225139) b!270132))

(assert (= (and b!270132 res!225137) b!270133))

(assert (= (and b!270133 (not res!225138)) b!270134))

(declare-fun m!401965 () Bool)

(assert (=> b!270132 m!401965))

(declare-fun m!401967 () Bool)

(assert (=> b!270132 m!401967))

(assert (=> b!270134 m!401965))

(assert (=> b!270134 m!401965))

(declare-fun m!401969 () Bool)

(assert (=> b!270134 m!401969))

(assert (=> start!58868 d!91674))

(declare-fun d!91680 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91680 (= (inv!12 w1!591) (invariant!0 (currentBit!12978 w1!591) (currentByte!12983 w1!591) (size!6556 (buf!7024 w1!591))))))

(declare-fun bs!23178 () Bool)

(assert (= bs!23178 d!91680))

(declare-fun m!401977 () Bool)

(assert (=> bs!23178 m!401977))

(assert (=> start!58868 d!91680))

(declare-fun d!91684 () Bool)

(assert (=> d!91684 (= (inv!12 w2!587) (invariant!0 (currentBit!12978 w2!587) (currentByte!12983 w2!587) (size!6556 (buf!7024 w2!587))))))

(declare-fun bs!23179 () Bool)

(assert (= bs!23179 d!91684))

(declare-fun m!401981 () Bool)

(assert (=> bs!23179 m!401981))

(assert (=> start!58868 d!91684))

(declare-fun d!91686 () Bool)

(assert (=> d!91686 (= (inv!12 w3!25) (invariant!0 (currentBit!12978 w3!25) (currentByte!12983 w3!25) (size!6556 (buf!7024 w3!25))))))

(declare-fun bs!23180 () Bool)

(assert (= bs!23180 d!91686))

(declare-fun m!401985 () Bool)

(assert (=> bs!23180 m!401985))

(assert (=> start!58868 d!91686))

(declare-fun d!91690 () Bool)

(declare-fun res!225148 () Bool)

(declare-fun e!190037 () Bool)

(assert (=> d!91690 (=> (not res!225148) (not e!190037))))

(assert (=> d!91690 (= res!225148 (= (size!6556 (buf!7024 w2!587)) (size!6556 (buf!7024 w3!25))))))

(assert (=> d!91690 (= (isPrefixOf!0 w2!587 w3!25) e!190037)))

(declare-fun b!270141 () Bool)

(declare-fun res!225146 () Bool)

(assert (=> b!270141 (=> (not res!225146) (not e!190037))))

(assert (=> b!270141 (= res!225146 (bvsle (bitIndex!0 (size!6556 (buf!7024 w2!587)) (currentByte!12983 w2!587) (currentBit!12978 w2!587)) (bitIndex!0 (size!6556 (buf!7024 w3!25)) (currentByte!12983 w3!25) (currentBit!12978 w3!25))))))

(declare-fun b!270142 () Bool)

(declare-fun e!190036 () Bool)

(assert (=> b!270142 (= e!190037 e!190036)))

(declare-fun res!225147 () Bool)

(assert (=> b!270142 (=> res!225147 e!190036)))

(assert (=> b!270142 (= res!225147 (= (size!6556 (buf!7024 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270143 () Bool)

(assert (=> b!270143 (= e!190036 (arrayBitRangesEq!0 (buf!7024 w2!587) (buf!7024 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6556 (buf!7024 w2!587)) (currentByte!12983 w2!587) (currentBit!12978 w2!587))))))

(assert (= (and d!91690 res!225148) b!270141))

(assert (= (and b!270141 res!225146) b!270142))

(assert (= (and b!270142 (not res!225147)) b!270143))

(assert (=> b!270141 m!401967))

(declare-fun m!401987 () Bool)

(assert (=> b!270141 m!401987))

(assert (=> b!270143 m!401967))

(assert (=> b!270143 m!401967))

(declare-fun m!401989 () Bool)

(assert (=> b!270143 m!401989))

(assert (=> b!270073 d!91690))

(declare-fun d!91692 () Bool)

(assert (=> d!91692 (= (array_inv!6280 (buf!7024 w1!591)) (bvsge (size!6556 (buf!7024 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270077 d!91692))

(push 1)

(assert (not b!270141))

(assert (not d!91684))

(assert (not b!270143))

(assert (not d!91686))

(assert (not d!91670))

(assert (not d!91680))

(assert (not b!270132))

(assert (not b!270117))

(assert (not b!270134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91716 () Bool)

(assert (=> d!91716 (= (invariant!0 (currentBit!12978 w3!25) (currentByte!12983 w3!25) (size!6556 (buf!7024 w3!25))) (and (bvsge (currentBit!12978 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12978 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12983 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12983 w3!25) (size!6556 (buf!7024 w3!25))) (and (= (currentBit!12978 w3!25) #b00000000000000000000000000000000) (= (currentByte!12983 w3!25) (size!6556 (buf!7024 w3!25)))))))))

(assert (=> d!91686 d!91716))

(declare-fun d!91718 () Bool)

(assert (=> d!91718 (= (invariant!0 (currentBit!12978 w1!591) (currentByte!12983 w1!591) (size!6556 (buf!7024 w1!591))) (and (bvsge (currentBit!12978 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12978 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12983 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12983 w1!591) (size!6556 (buf!7024 w1!591))) (and (= (currentBit!12978 w1!591) #b00000000000000000000000000000000) (= (currentByte!12983 w1!591) (size!6556 (buf!7024 w1!591)))))))))

(assert (=> d!91680 d!91718))

(declare-fun b!270190 () Bool)

(declare-fun e!190078 () Bool)

(declare-fun e!190077 () Bool)

(assert (=> b!270190 (= e!190078 e!190077)))

(declare-fun res!225189 () Bool)

(declare-fun call!4310 () Bool)

(assert (=> b!270190 (= res!225189 call!4310)))

(assert (=> b!270190 (=> (not res!225189) (not e!190077))))

(declare-datatypes ((tuple4!450 0))(
  ( (tuple4!451 (_1!12208 (_ BitVec 32)) (_2!12208 (_ BitVec 32)) (_3!1005 (_ BitVec 32)) (_4!225 (_ BitVec 32))) )
))
(declare-fun lt!409301 () tuple4!450)

(declare-fun e!190079 () Bool)

(declare-fun b!270191 () Bool)

(assert (=> b!270191 (= e!190079 (arrayRangesEq!1088 (buf!7024 w1!591) (buf!7024 w2!587) (_1!12208 lt!409301) (_2!12208 lt!409301)))))

(declare-fun b!270192 () Bool)

(declare-fun e!190076 () Bool)

(assert (=> b!270192 (= e!190076 e!190078)))

(declare-fun c!12461 () Bool)

(assert (=> b!270192 (= c!12461 (= (_3!1005 lt!409301) (_4!225 lt!409301)))))

(declare-fun b!270193 () Bool)

(assert (=> b!270193 (= e!190078 call!4310)))

(declare-fun b!270194 () Bool)

(declare-fun res!225190 () Bool)

(declare-fun lt!409300 () (_ BitVec 32))

(assert (=> b!270194 (= res!225190 (= lt!409300 #b00000000000000000000000000000000))))

(declare-fun e!190081 () Bool)

(assert (=> b!270194 (=> res!225190 e!190081)))

(assert (=> b!270194 (= e!190077 e!190081)))

(declare-fun bm!4307 () Bool)

(declare-fun lt!409299 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4307 (= call!4310 (byteRangesEq!0 (select (arr!7543 (buf!7024 w1!591)) (_3!1005 lt!409301)) (select (arr!7543 (buf!7024 w2!587)) (_3!1005 lt!409301)) lt!409299 (ite c!12461 lt!409300 #b00000000000000000000000000001000)))))

(declare-fun d!91720 () Bool)

(declare-fun res!225191 () Bool)

(declare-fun e!190080 () Bool)

(assert (=> d!91720 (=> res!225191 e!190080)))

(assert (=> d!91720 (= res!225191 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6556 (buf!7024 w1!591)) (currentByte!12983 w1!591) (currentBit!12978 w1!591))))))

(assert (=> d!91720 (= (arrayBitRangesEq!0 (buf!7024 w1!591) (buf!7024 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6556 (buf!7024 w1!591)) (currentByte!12983 w1!591) (currentBit!12978 w1!591))) e!190080)))

(declare-fun b!270195 () Bool)

(assert (=> b!270195 (= e!190080 e!190076)))

(declare-fun res!225187 () Bool)

(assert (=> b!270195 (=> (not res!225187) (not e!190076))))

(assert (=> b!270195 (= res!225187 e!190079)))

(declare-fun res!225188 () Bool)

(assert (=> b!270195 (=> res!225188 e!190079)))

(assert (=> b!270195 (= res!225188 (bvsge (_1!12208 lt!409301) (_2!12208 lt!409301)))))

(assert (=> b!270195 (= lt!409300 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6556 (buf!7024 w1!591)) (currentByte!12983 w1!591) (currentBit!12978 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270195 (= lt!409299 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!450)

(assert (=> b!270195 (= lt!409301 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6556 (buf!7024 w1!591)) (currentByte!12983 w1!591) (currentBit!12978 w1!591))))))

(declare-fun b!270196 () Bool)

(assert (=> b!270196 (= e!190081 (byteRangesEq!0 (select (arr!7543 (buf!7024 w1!591)) (_4!225 lt!409301)) (select (arr!7543 (buf!7024 w2!587)) (_4!225 lt!409301)) #b00000000000000000000000000000000 lt!409300))))

(assert (= (and d!91720 (not res!225191)) b!270195))

(assert (= (and b!270195 (not res!225188)) b!270191))

(assert (= (and b!270195 res!225187) b!270192))

(assert (= (and b!270192 c!12461) b!270193))

(assert (= (and b!270192 (not c!12461)) b!270190))

(assert (= (and b!270190 res!225189) b!270194))

(assert (= (and b!270194 (not res!225190)) b!270196))

(assert (= (or b!270193 b!270190) bm!4307))

(declare-fun m!402021 () Bool)

(assert (=> b!270191 m!402021))

(declare-fun m!402023 () Bool)

(assert (=> bm!4307 m!402023))

(declare-fun m!402025 () Bool)

(assert (=> bm!4307 m!402025))

(assert (=> bm!4307 m!402023))

(assert (=> bm!4307 m!402025))

(declare-fun m!402027 () Bool)

(assert (=> bm!4307 m!402027))

(assert (=> b!270195 m!401965))

(declare-fun m!402029 () Bool)

(assert (=> b!270195 m!402029))

(declare-fun m!402031 () Bool)

(assert (=> b!270196 m!402031))

(declare-fun m!402033 () Bool)

(assert (=> b!270196 m!402033))

(assert (=> b!270196 m!402031))

(assert (=> b!270196 m!402033))

(declare-fun m!402035 () Bool)

(assert (=> b!270196 m!402035))

(assert (=> b!270134 d!91720))

(declare-fun d!91730 () Bool)

(declare-fun e!190094 () Bool)

(assert (=> d!91730 e!190094))

(declare-fun res!225210 () Bool)

(assert (=> d!91730 (=> (not res!225210) (not e!190094))))

(declare-fun lt!409341 () (_ BitVec 64))

(declare-fun lt!409344 () (_ BitVec 64))

(declare-fun lt!409346 () (_ BitVec 64))

(assert (=> d!91730 (= res!225210 (= lt!409346 (bvsub lt!409344 lt!409341)))))

(assert (=> d!91730 (or (= (bvand lt!409344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409341 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409344 lt!409341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91730 (= lt!409341 (remainingBits!0 ((_ sign_extend 32) (size!6556 (buf!7024 w1!591))) ((_ sign_extend 32) (currentByte!12983 w1!591)) ((_ sign_extend 32) (currentBit!12978 w1!591))))))

(declare-fun lt!409343 () (_ BitVec 64))

(declare-fun lt!409345 () (_ BitVec 64))

(assert (=> d!91730 (= lt!409344 (bvmul lt!409343 lt!409345))))

(assert (=> d!91730 (or (= lt!409343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409345 (bvsdiv (bvmul lt!409343 lt!409345) lt!409343)))))

(assert (=> d!91730 (= lt!409345 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91730 (= lt!409343 ((_ sign_extend 32) (size!6556 (buf!7024 w1!591))))))

(assert (=> d!91730 (= lt!409346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12983 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12978 w1!591))))))

(assert (=> d!91730 (invariant!0 (currentBit!12978 w1!591) (currentByte!12983 w1!591) (size!6556 (buf!7024 w1!591)))))

(assert (=> d!91730 (= (bitIndex!0 (size!6556 (buf!7024 w1!591)) (currentByte!12983 w1!591) (currentBit!12978 w1!591)) lt!409346)))

(declare-fun b!270216 () Bool)

(declare-fun res!225209 () Bool)

(assert (=> b!270216 (=> (not res!225209) (not e!190094))))

(assert (=> b!270216 (= res!225209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409346))))

(declare-fun b!270217 () Bool)

(declare-fun lt!409342 () (_ BitVec 64))

(assert (=> b!270217 (= e!190094 (bvsle lt!409346 (bvmul lt!409342 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270217 (or (= lt!409342 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409342 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409342)))))

(assert (=> b!270217 (= lt!409342 ((_ sign_extend 32) (size!6556 (buf!7024 w1!591))))))

(assert (= (and d!91730 res!225210) b!270216))

(assert (= (and b!270216 res!225209) b!270217))

(declare-fun m!402057 () Bool)

(assert (=> d!91730 m!402057))

(assert (=> d!91730 m!401977))

(assert (=> b!270134 d!91730))

(declare-fun b!270218 () Bool)

(declare-fun e!190097 () Bool)

(declare-fun e!190096 () Bool)

(assert (=> b!270218 (= e!190097 e!190096)))

(declare-fun res!225213 () Bool)

(declare-fun call!4314 () Bool)

(assert (=> b!270218 (= res!225213 call!4314)))

(assert (=> b!270218 (=> (not res!225213) (not e!190096))))

(declare-fun lt!409349 () tuple4!450)

(declare-fun b!270219 () Bool)

(declare-fun e!190098 () Bool)

(assert (=> b!270219 (= e!190098 (arrayRangesEq!1088 (buf!7024 w2!587) (buf!7024 w3!25) (_1!12208 lt!409349) (_2!12208 lt!409349)))))

(declare-fun b!270220 () Bool)

(declare-fun e!190095 () Bool)

(assert (=> b!270220 (= e!190095 e!190097)))

(declare-fun c!12463 () Bool)

(assert (=> b!270220 (= c!12463 (= (_3!1005 lt!409349) (_4!225 lt!409349)))))

(declare-fun b!270221 () Bool)

(assert (=> b!270221 (= e!190097 call!4314)))

(declare-fun b!270222 () Bool)

(declare-fun res!225214 () Bool)

(declare-fun lt!409348 () (_ BitVec 32))

(assert (=> b!270222 (= res!225214 (= lt!409348 #b00000000000000000000000000000000))))

(declare-fun e!190100 () Bool)

(assert (=> b!270222 (=> res!225214 e!190100)))

(assert (=> b!270222 (= e!190096 e!190100)))

(declare-fun bm!4311 () Bool)

(declare-fun lt!409347 () (_ BitVec 32))

(assert (=> bm!4311 (= call!4314 (byteRangesEq!0 (select (arr!7543 (buf!7024 w2!587)) (_3!1005 lt!409349)) (select (arr!7543 (buf!7024 w3!25)) (_3!1005 lt!409349)) lt!409347 (ite c!12463 lt!409348 #b00000000000000000000000000001000)))))

(declare-fun d!91744 () Bool)

(declare-fun res!225215 () Bool)

(declare-fun e!190099 () Bool)

(assert (=> d!91744 (=> res!225215 e!190099)))

(assert (=> d!91744 (= res!225215 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6556 (buf!7024 w2!587)) (currentByte!12983 w2!587) (currentBit!12978 w2!587))))))

(assert (=> d!91744 (= (arrayBitRangesEq!0 (buf!7024 w2!587) (buf!7024 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6556 (buf!7024 w2!587)) (currentByte!12983 w2!587) (currentBit!12978 w2!587))) e!190099)))

(declare-fun b!270223 () Bool)

(assert (=> b!270223 (= e!190099 e!190095)))

(declare-fun res!225211 () Bool)

(assert (=> b!270223 (=> (not res!225211) (not e!190095))))

(assert (=> b!270223 (= res!225211 e!190098)))

(declare-fun res!225212 () Bool)

(assert (=> b!270223 (=> res!225212 e!190098)))

(assert (=> b!270223 (= res!225212 (bvsge (_1!12208 lt!409349) (_2!12208 lt!409349)))))

(assert (=> b!270223 (= lt!409348 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6556 (buf!7024 w2!587)) (currentByte!12983 w2!587) (currentBit!12978 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270223 (= lt!409347 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270223 (= lt!409349 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6556 (buf!7024 w2!587)) (currentByte!12983 w2!587) (currentBit!12978 w2!587))))))

(declare-fun b!270224 () Bool)

(assert (=> b!270224 (= e!190100 (byteRangesEq!0 (select (arr!7543 (buf!7024 w2!587)) (_4!225 lt!409349)) (select (arr!7543 (buf!7024 w3!25)) (_4!225 lt!409349)) #b00000000000000000000000000000000 lt!409348))))

(assert (= (and d!91744 (not res!225215)) b!270223))

(assert (= (and b!270223 (not res!225212)) b!270219))

(assert (= (and b!270223 res!225211) b!270220))

(assert (= (and b!270220 c!12463) b!270221))

(assert (= (and b!270220 (not c!12463)) b!270218))

(assert (= (and b!270218 res!225213) b!270222))

(assert (= (and b!270222 (not res!225214)) b!270224))

(assert (= (or b!270221 b!270218) bm!4311))

(declare-fun m!402059 () Bool)

(assert (=> b!270219 m!402059))

(declare-fun m!402061 () Bool)

(assert (=> bm!4311 m!402061))

(declare-fun m!402063 () Bool)

(assert (=> bm!4311 m!402063))

(assert (=> bm!4311 m!402061))

(assert (=> bm!4311 m!402063))

(declare-fun m!402065 () Bool)

(assert (=> bm!4311 m!402065))

(assert (=> b!270223 m!401967))

(declare-fun m!402067 () Bool)

(assert (=> b!270223 m!402067))

(declare-fun m!402069 () Bool)

(assert (=> b!270224 m!402069))

(declare-fun m!402071 () Bool)

(assert (=> b!270224 m!402071))

(assert (=> b!270224 m!402069))

(assert (=> b!270224 m!402071))

(declare-fun m!402073 () Bool)

(assert (=> b!270224 m!402073))

(assert (=> b!270143 d!91744))

(declare-fun d!91746 () Bool)

(declare-fun e!190103 () Bool)

(assert (=> d!91746 e!190103))

(declare-fun res!225221 () Bool)

(assert (=> d!91746 (=> (not res!225221) (not e!190103))))

(declare-fun lt!409367 () (_ BitVec 64))

(declare-fun lt!409362 () (_ BitVec 64))

(declare-fun lt!409365 () (_ BitVec 64))

(assert (=> d!91746 (= res!225221 (= lt!409367 (bvsub lt!409365 lt!409362)))))

(assert (=> d!91746 (or (= (bvand lt!409365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409362 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409365 lt!409362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91746 (= lt!409362 (remainingBits!0 ((_ sign_extend 32) (size!6556 (buf!7024 w2!587))) ((_ sign_extend 32) (currentByte!12983 w2!587)) ((_ sign_extend 32) (currentBit!12978 w2!587))))))

(declare-fun lt!409364 () (_ BitVec 64))

(declare-fun lt!409366 () (_ BitVec 64))

(assert (=> d!91746 (= lt!409365 (bvmul lt!409364 lt!409366))))

(assert (=> d!91746 (or (= lt!409364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409366 (bvsdiv (bvmul lt!409364 lt!409366) lt!409364)))))

(assert (=> d!91746 (= lt!409366 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91746 (= lt!409364 ((_ sign_extend 32) (size!6556 (buf!7024 w2!587))))))

(assert (=> d!91746 (= lt!409367 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12983 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12978 w2!587))))))

(assert (=> d!91746 (invariant!0 (currentBit!12978 w2!587) (currentByte!12983 w2!587) (size!6556 (buf!7024 w2!587)))))

(assert (=> d!91746 (= (bitIndex!0 (size!6556 (buf!7024 w2!587)) (currentByte!12983 w2!587) (currentBit!12978 w2!587)) lt!409367)))

(declare-fun b!270229 () Bool)

(declare-fun res!225220 () Bool)

(assert (=> b!270229 (=> (not res!225220) (not e!190103))))

(assert (=> b!270229 (= res!225220 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409367))))

(declare-fun b!270230 () Bool)

(declare-fun lt!409363 () (_ BitVec 64))

(assert (=> b!270230 (= e!190103 (bvsle lt!409367 (bvmul lt!409363 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270230 (or (= lt!409363 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409363 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409363)))))

(assert (=> b!270230 (= lt!409363 ((_ sign_extend 32) (size!6556 (buf!7024 w2!587))))))

(assert (= (and d!91746 res!225221) b!270229))

(assert (= (and b!270229 res!225220) b!270230))

(declare-fun m!402075 () Bool)

(assert (=> d!91746 m!402075))

(assert (=> d!91746 m!401981))

(assert (=> b!270143 d!91746))

(assert (=> d!91670 d!91660))

(declare-fun d!91748 () Bool)

(assert (=> d!91748 (arrayRangesEq!1088 (buf!7024 w1!591) (buf!7024 w3!25) #b00000000000000000000000000000000 (currentByte!12983 w1!591))))

(assert (=> d!91748 true))

(declare-fun _$16!131 () Unit!19067)

(assert (=> d!91748 (= (choose!389 (buf!7024 w1!591) (buf!7024 w2!587) (buf!7024 w3!25) #b00000000000000000000000000000000 (currentByte!12983 w1!591) (currentByte!12983 w2!587)) _$16!131)))

(declare-fun bs!23190 () Bool)

(assert (= bs!23190 d!91748))

(assert (=> bs!23190 m!401897))

(assert (=> d!91670 d!91748))

(assert (=> b!270132 d!91730))

(assert (=> b!270132 d!91746))

(assert (=> b!270141 d!91746))

(declare-fun d!91750 () Bool)

(declare-fun e!190105 () Bool)

(assert (=> d!91750 e!190105))

(declare-fun res!225225 () Bool)

(assert (=> d!91750 (=> (not res!225225) (not e!190105))))

(declare-fun lt!409379 () (_ BitVec 64))

(declare-fun lt!409374 () (_ BitVec 64))

(declare-fun lt!409377 () (_ BitVec 64))

(assert (=> d!91750 (= res!225225 (= lt!409379 (bvsub lt!409377 lt!409374)))))

(assert (=> d!91750 (or (= (bvand lt!409377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409374 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409377 lt!409374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91750 (= lt!409374 (remainingBits!0 ((_ sign_extend 32) (size!6556 (buf!7024 w3!25))) ((_ sign_extend 32) (currentByte!12983 w3!25)) ((_ sign_extend 32) (currentBit!12978 w3!25))))))

(declare-fun lt!409376 () (_ BitVec 64))

(declare-fun lt!409378 () (_ BitVec 64))

(assert (=> d!91750 (= lt!409377 (bvmul lt!409376 lt!409378))))

(assert (=> d!91750 (or (= lt!409376 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409378 (bvsdiv (bvmul lt!409376 lt!409378) lt!409376)))))

(assert (=> d!91750 (= lt!409378 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91750 (= lt!409376 ((_ sign_extend 32) (size!6556 (buf!7024 w3!25))))))

(assert (=> d!91750 (= lt!409379 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12983 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12978 w3!25))))))

(assert (=> d!91750 (invariant!0 (currentBit!12978 w3!25) (currentByte!12983 w3!25) (size!6556 (buf!7024 w3!25)))))

(assert (=> d!91750 (= (bitIndex!0 (size!6556 (buf!7024 w3!25)) (currentByte!12983 w3!25) (currentBit!12978 w3!25)) lt!409379)))

(declare-fun b!270233 () Bool)

(declare-fun res!225224 () Bool)

(assert (=> b!270233 (=> (not res!225224) (not e!190105))))

(assert (=> b!270233 (= res!225224 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409379))))

(declare-fun b!270234 () Bool)

(declare-fun lt!409375 () (_ BitVec 64))

(assert (=> b!270234 (= e!190105 (bvsle lt!409379 (bvmul lt!409375 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270234 (or (= lt!409375 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409375 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409375)))))

(assert (=> b!270234 (= lt!409375 ((_ sign_extend 32) (size!6556 (buf!7024 w3!25))))))

(assert (= (and d!91750 res!225225) b!270233))

(assert (= (and b!270233 res!225224) b!270234))

(declare-fun m!402079 () Bool)

(assert (=> d!91750 m!402079))

(assert (=> d!91750 m!401985))

(assert (=> b!270141 d!91750))

(declare-fun d!91756 () Bool)

(assert (=> d!91756 (= (invariant!0 (currentBit!12978 w2!587) (currentByte!12983 w2!587) (size!6556 (buf!7024 w2!587))) (and (bvsge (currentBit!12978 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12978 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12983 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12983 w2!587) (size!6556 (buf!7024 w2!587))) (and (= (currentBit!12978 w2!587) #b00000000000000000000000000000000) (= (currentByte!12983 w2!587) (size!6556 (buf!7024 w2!587)))))))))

(assert (=> d!91684 d!91756))

(declare-fun d!91758 () Bool)

(declare-fun res!225228 () Bool)

(declare-fun e!190107 () Bool)

(assert (=> d!91758 (=> res!225228 e!190107)))

(assert (=> d!91758 (= res!225228 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12983 w1!591)))))

(assert (=> d!91758 (= (arrayRangesEq!1088 (buf!7024 w1!591) (buf!7024 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12983 w1!591)) e!190107)))

(declare-fun b!270237 () Bool)

(declare-fun e!190108 () Bool)

(assert (=> b!270237 (= e!190107 e!190108)))

(declare-fun res!225229 () Bool)

(assert (=> b!270237 (=> (not res!225229) (not e!190108))))

(assert (=> b!270237 (= res!225229 (= (select (arr!7543 (buf!7024 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7543 (buf!7024 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270238 () Bool)

(assert (=> b!270238 (= e!190108 (arrayRangesEq!1088 (buf!7024 w1!591) (buf!7024 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12983 w1!591)))))

(assert (= (and d!91758 (not res!225228)) b!270237))

(assert (= (and b!270237 res!225229) b!270238))

(declare-fun m!402083 () Bool)

(assert (=> b!270237 m!402083))

(declare-fun m!402085 () Bool)

(assert (=> b!270237 m!402085))

(declare-fun m!402087 () Bool)

(assert (=> b!270238 m!402087))

(assert (=> b!270117 d!91758))

(push 1)

(assert (not d!91746))

(assert (not b!270238))

(assert (not b!270191))

(assert (not b!270224))

(assert (not bm!4307))

(assert (not b!270219))

(assert (not d!91750))

(assert (not b!270195))

(assert (not d!91730))

(assert (not b!270223))

(assert (not d!91748))

(assert (not b!270196))

(assert (not bm!4311))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59170 () Bool)

(assert start!59170)

(declare-fun res!225807 () Bool)

(declare-fun e!190880 () Bool)

(assert (=> start!59170 (=> (not res!225807) (not e!190880))))

(declare-datatypes ((array!15109 0))(
  ( (array!15110 (arr!7562 (Array (_ BitVec 32) (_ BitVec 8))) (size!6575 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11964 0))(
  ( (BitStream!11965 (buf!7043 array!15109) (currentByte!13017 (_ BitVec 32)) (currentBit!13012 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11964)

(declare-fun w2!587 () BitStream!11964)

(declare-fun isPrefixOf!0 (BitStream!11964 BitStream!11964) Bool)

(assert (=> start!59170 (= res!225807 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59170 e!190880))

(declare-fun e!190876 () Bool)

(declare-fun inv!12 (BitStream!11964) Bool)

(assert (=> start!59170 (and (inv!12 w1!591) e!190876)))

(declare-fun e!190879 () Bool)

(assert (=> start!59170 (and (inv!12 w2!587) e!190879)))

(declare-fun w3!25 () BitStream!11964)

(declare-fun e!190881 () Bool)

(assert (=> start!59170 (and (inv!12 w3!25) e!190881)))

(declare-fun b!270999 () Bool)

(declare-fun e!190878 () Bool)

(assert (=> b!270999 (= e!190880 (not e!190878))))

(declare-fun res!225806 () Bool)

(assert (=> b!270999 (=> res!225806 e!190878)))

(assert (=> b!270999 (= res!225806 (or (bvsge (currentByte!13017 w1!591) (size!6575 (buf!7043 w1!591))) (bvsge (currentByte!13017 w1!591) (currentByte!13017 w2!587))))))

(declare-fun arrayRangesEq!1107 (array!15109 array!15109 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270999 (arrayRangesEq!1107 (buf!7043 w1!591) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591))))

(declare-datatypes ((Unit!19105 0))(
  ( (Unit!19106) )
))
(declare-fun lt!409694 () Unit!19105)

(declare-fun arrayRangesEqTransitive!370 (array!15109 array!15109 array!15109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19105)

(assert (=> b!270999 (= lt!409694 (arrayRangesEqTransitive!370 (buf!7043 w1!591) (buf!7043 w2!587) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591) (currentByte!13017 w2!587)))))

(declare-fun b!271000 () Bool)

(declare-fun res!225808 () Bool)

(assert (=> b!271000 (=> (not res!225808) (not e!190880))))

(assert (=> b!271000 (= res!225808 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271001 () Bool)

(assert (=> b!271001 (= e!190878 (or (not (= ((_ sign_extend 24) (select (arr!7562 (buf!7043 w2!587)) (currentByte!13017 w1!591))) ((_ sign_extend 24) (select (arr!7562 (buf!7043 w3!25)) (currentByte!13017 w1!591))))) (and (bvsge (currentByte!13017 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13017 w1!591) (size!6575 (buf!7043 w3!25))))))))

(assert (=> b!271001 (= (select (arr!7562 (buf!7043 w2!587)) (currentByte!13017 w1!591)) (select (arr!7562 (buf!7043 w3!25)) (currentByte!13017 w1!591)))))

(declare-fun lt!409693 () Unit!19105)

(declare-fun arrayRangesEqImpliesEq!167 (array!15109 array!15109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19105)

(assert (=> b!271001 (= lt!409693 (arrayRangesEqImpliesEq!167 (buf!7043 w2!587) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591) (currentByte!13017 w2!587)))))

(declare-fun b!271002 () Bool)

(declare-fun array_inv!6299 (array!15109) Bool)

(assert (=> b!271002 (= e!190879 (array_inv!6299 (buf!7043 w2!587)))))

(declare-fun b!271003 () Bool)

(assert (=> b!271003 (= e!190876 (array_inv!6299 (buf!7043 w1!591)))))

(declare-fun b!271004 () Bool)

(assert (=> b!271004 (= e!190881 (array_inv!6299 (buf!7043 w3!25)))))

(assert (= (and start!59170 res!225807) b!271000))

(assert (= (and b!271000 res!225808) b!270999))

(assert (= (and b!270999 (not res!225806)) b!271001))

(assert (= start!59170 b!271003))

(assert (= start!59170 b!271002))

(assert (= start!59170 b!271004))

(declare-fun m!403181 () Bool)

(assert (=> b!271004 m!403181))

(declare-fun m!403183 () Bool)

(assert (=> b!271003 m!403183))

(declare-fun m!403185 () Bool)

(assert (=> b!271000 m!403185))

(declare-fun m!403187 () Bool)

(assert (=> b!270999 m!403187))

(declare-fun m!403189 () Bool)

(assert (=> b!270999 m!403189))

(declare-fun m!403191 () Bool)

(assert (=> b!271001 m!403191))

(declare-fun m!403193 () Bool)

(assert (=> b!271001 m!403193))

(declare-fun m!403195 () Bool)

(assert (=> b!271001 m!403195))

(declare-fun m!403197 () Bool)

(assert (=> b!271002 m!403197))

(declare-fun m!403199 () Bool)

(assert (=> start!59170 m!403199))

(declare-fun m!403201 () Bool)

(assert (=> start!59170 m!403201))

(declare-fun m!403203 () Bool)

(assert (=> start!59170 m!403203))

(declare-fun m!403205 () Bool)

(assert (=> start!59170 m!403205))

(check-sat (not b!271004) (not b!271000) (not b!271002) (not b!271003) (not start!59170) (not b!271001) (not b!270999))
(check-sat)
(get-model)

(declare-fun d!92256 () Bool)

(assert (=> d!92256 (and (bvsge (currentByte!13017 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13017 w1!591) (size!6575 (buf!7043 w2!587))) (bvslt (currentByte!13017 w1!591) (size!6575 (buf!7043 w3!25))) (= (select (arr!7562 (buf!7043 w2!587)) (currentByte!13017 w1!591)) (select (arr!7562 (buf!7043 w3!25)) (currentByte!13017 w1!591))))))

(declare-fun lt!409706 () Unit!19105)

(declare-fun choose!413 (array!15109 array!15109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19105)

(assert (=> d!92256 (= lt!409706 (choose!413 (buf!7043 w2!587) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591) (currentByte!13017 w2!587)))))

(assert (=> d!92256 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13017 w2!587)))))

(assert (=> d!92256 (= (arrayRangesEqImpliesEq!167 (buf!7043 w2!587) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591) (currentByte!13017 w2!587)) lt!409706)))

(declare-fun bs!23294 () Bool)

(assert (= bs!23294 d!92256))

(assert (=> bs!23294 m!403191))

(assert (=> bs!23294 m!403193))

(declare-fun m!403241 () Bool)

(assert (=> bs!23294 m!403241))

(assert (=> b!271001 d!92256))

(declare-fun d!92270 () Bool)

(declare-fun res!225853 () Bool)

(declare-fun e!190931 () Bool)

(assert (=> d!92270 (=> (not res!225853) (not e!190931))))

(assert (=> d!92270 (= res!225853 (= (size!6575 (buf!7043 w1!591)) (size!6575 (buf!7043 w2!587))))))

(assert (=> d!92270 (= (isPrefixOf!0 w1!591 w2!587) e!190931)))

(declare-fun b!271056 () Bool)

(declare-fun res!225851 () Bool)

(assert (=> b!271056 (=> (not res!225851) (not e!190931))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271056 (= res!225851 (bvsle (bitIndex!0 (size!6575 (buf!7043 w1!591)) (currentByte!13017 w1!591) (currentBit!13012 w1!591)) (bitIndex!0 (size!6575 (buf!7043 w2!587)) (currentByte!13017 w2!587) (currentBit!13012 w2!587))))))

(declare-fun b!271057 () Bool)

(declare-fun e!190932 () Bool)

(assert (=> b!271057 (= e!190931 e!190932)))

(declare-fun res!225852 () Bool)

(assert (=> b!271057 (=> res!225852 e!190932)))

(assert (=> b!271057 (= res!225852 (= (size!6575 (buf!7043 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271058 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15109 array!15109 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271058 (= e!190932 (arrayBitRangesEq!0 (buf!7043 w1!591) (buf!7043 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6575 (buf!7043 w1!591)) (currentByte!13017 w1!591) (currentBit!13012 w1!591))))))

(assert (= (and d!92270 res!225853) b!271056))

(assert (= (and b!271056 res!225851) b!271057))

(assert (= (and b!271057 (not res!225852)) b!271058))

(declare-fun m!403267 () Bool)

(assert (=> b!271056 m!403267))

(declare-fun m!403271 () Bool)

(assert (=> b!271056 m!403271))

(assert (=> b!271058 m!403267))

(assert (=> b!271058 m!403267))

(declare-fun m!403273 () Bool)

(assert (=> b!271058 m!403273))

(assert (=> start!59170 d!92270))

(declare-fun d!92294 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92294 (= (inv!12 w1!591) (invariant!0 (currentBit!13012 w1!591) (currentByte!13017 w1!591) (size!6575 (buf!7043 w1!591))))))

(declare-fun bs!23300 () Bool)

(assert (= bs!23300 d!92294))

(declare-fun m!403279 () Bool)

(assert (=> bs!23300 m!403279))

(assert (=> start!59170 d!92294))

(declare-fun d!92298 () Bool)

(assert (=> d!92298 (= (inv!12 w2!587) (invariant!0 (currentBit!13012 w2!587) (currentByte!13017 w2!587) (size!6575 (buf!7043 w2!587))))))

(declare-fun bs!23301 () Bool)

(assert (= bs!23301 d!92298))

(declare-fun m!403281 () Bool)

(assert (=> bs!23301 m!403281))

(assert (=> start!59170 d!92298))

(declare-fun d!92300 () Bool)

(assert (=> d!92300 (= (inv!12 w3!25) (invariant!0 (currentBit!13012 w3!25) (currentByte!13017 w3!25) (size!6575 (buf!7043 w3!25))))))

(declare-fun bs!23302 () Bool)

(assert (= bs!23302 d!92300))

(declare-fun m!403283 () Bool)

(assert (=> bs!23302 m!403283))

(assert (=> start!59170 d!92300))

(declare-fun d!92302 () Bool)

(declare-fun res!225863 () Bool)

(declare-fun e!190939 () Bool)

(assert (=> d!92302 (=> (not res!225863) (not e!190939))))

(assert (=> d!92302 (= res!225863 (= (size!6575 (buf!7043 w2!587)) (size!6575 (buf!7043 w3!25))))))

(assert (=> d!92302 (= (isPrefixOf!0 w2!587 w3!25) e!190939)))

(declare-fun b!271066 () Bool)

(declare-fun res!225861 () Bool)

(assert (=> b!271066 (=> (not res!225861) (not e!190939))))

(assert (=> b!271066 (= res!225861 (bvsle (bitIndex!0 (size!6575 (buf!7043 w2!587)) (currentByte!13017 w2!587) (currentBit!13012 w2!587)) (bitIndex!0 (size!6575 (buf!7043 w3!25)) (currentByte!13017 w3!25) (currentBit!13012 w3!25))))))

(declare-fun b!271067 () Bool)

(declare-fun e!190940 () Bool)

(assert (=> b!271067 (= e!190939 e!190940)))

(declare-fun res!225862 () Bool)

(assert (=> b!271067 (=> res!225862 e!190940)))

(assert (=> b!271067 (= res!225862 (= (size!6575 (buf!7043 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271068 () Bool)

(assert (=> b!271068 (= e!190940 (arrayBitRangesEq!0 (buf!7043 w2!587) (buf!7043 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6575 (buf!7043 w2!587)) (currentByte!13017 w2!587) (currentBit!13012 w2!587))))))

(assert (= (and d!92302 res!225863) b!271066))

(assert (= (and b!271066 res!225861) b!271067))

(assert (= (and b!271067 (not res!225862)) b!271068))

(assert (=> b!271066 m!403271))

(declare-fun m!403285 () Bool)

(assert (=> b!271066 m!403285))

(assert (=> b!271068 m!403271))

(assert (=> b!271068 m!403271))

(declare-fun m!403287 () Bool)

(assert (=> b!271068 m!403287))

(assert (=> b!271000 d!92302))

(declare-fun d!92304 () Bool)

(declare-fun res!225870 () Bool)

(declare-fun e!190947 () Bool)

(assert (=> d!92304 (=> res!225870 e!190947)))

(assert (=> d!92304 (= res!225870 (= #b00000000000000000000000000000000 (currentByte!13017 w1!591)))))

(assert (=> d!92304 (= (arrayRangesEq!1107 (buf!7043 w1!591) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591)) e!190947)))

(declare-fun b!271075 () Bool)

(declare-fun e!190948 () Bool)

(assert (=> b!271075 (= e!190947 e!190948)))

(declare-fun res!225871 () Bool)

(assert (=> b!271075 (=> (not res!225871) (not e!190948))))

(assert (=> b!271075 (= res!225871 (= (select (arr!7562 (buf!7043 w1!591)) #b00000000000000000000000000000000) (select (arr!7562 (buf!7043 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271076 () Bool)

(assert (=> b!271076 (= e!190948 (arrayRangesEq!1107 (buf!7043 w1!591) (buf!7043 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13017 w1!591)))))

(assert (= (and d!92304 (not res!225870)) b!271075))

(assert (= (and b!271075 res!225871) b!271076))

(declare-fun m!403301 () Bool)

(assert (=> b!271075 m!403301))

(declare-fun m!403303 () Bool)

(assert (=> b!271075 m!403303))

(declare-fun m!403305 () Bool)

(assert (=> b!271076 m!403305))

(assert (=> b!270999 d!92304))

(declare-fun d!92314 () Bool)

(assert (=> d!92314 (arrayRangesEq!1107 (buf!7043 w1!591) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591))))

(declare-fun lt!409718 () Unit!19105)

(declare-fun choose!415 (array!15109 array!15109 array!15109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19105)

(assert (=> d!92314 (= lt!409718 (choose!415 (buf!7043 w1!591) (buf!7043 w2!587) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591) (currentByte!13017 w2!587)))))

(assert (=> d!92314 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13017 w1!591)) (bvsle (currentByte!13017 w1!591) (currentByte!13017 w2!587)))))

(assert (=> d!92314 (= (arrayRangesEqTransitive!370 (buf!7043 w1!591) (buf!7043 w2!587) (buf!7043 w3!25) #b00000000000000000000000000000000 (currentByte!13017 w1!591) (currentByte!13017 w2!587)) lt!409718)))

(declare-fun bs!23307 () Bool)

(assert (= bs!23307 d!92314))

(assert (=> bs!23307 m!403187))

(declare-fun m!403309 () Bool)

(assert (=> bs!23307 m!403309))

(assert (=> b!270999 d!92314))

(declare-fun d!92316 () Bool)

(assert (=> d!92316 (= (array_inv!6299 (buf!7043 w3!25)) (bvsge (size!6575 (buf!7043 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271004 d!92316))

(declare-fun d!92318 () Bool)

(assert (=> d!92318 (= (array_inv!6299 (buf!7043 w1!591)) (bvsge (size!6575 (buf!7043 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271003 d!92318))

(declare-fun d!92320 () Bool)

(assert (=> d!92320 (= (array_inv!6299 (buf!7043 w2!587)) (bvsge (size!6575 (buf!7043 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271002 d!92320))

(check-sat (not d!92314) (not b!271066) (not d!92298) (not b!271068) (not d!92256) (not b!271058) (not d!92294) (not d!92300) (not b!271076) (not b!271056))
(check-sat)

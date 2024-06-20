; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67090 () Bool)

(assert start!67090)

(declare-fun b!301054 () Bool)

(declare-datatypes ((Unit!21076 0))(
  ( (Unit!21077) )
))
(declare-fun e!216198 () Unit!21076)

(declare-fun Unit!21078 () Unit!21076)

(assert (=> b!301054 (= e!216198 Unit!21078)))

(declare-fun b!301055 () Bool)

(declare-fun e!216202 () Bool)

(declare-fun call!5423 () Bool)

(assert (=> b!301055 (= e!216202 call!5423)))

(declare-fun b!301056 () Bool)

(declare-fun e!216199 () Bool)

(assert (=> b!301056 (= e!216202 e!216199)))

(declare-datatypes ((array!18251 0))(
  ( (array!18252 (arr!9010 (Array (_ BitVec 32) (_ BitVec 8))) (size!7927 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18251)

(declare-fun a2!948 () array!18251)

(declare-fun lt!436451 () (_ BitVec 32))

(declare-datatypes ((tuple4!1062 0))(
  ( (tuple4!1063 (_1!13186 (_ BitVec 32)) (_2!13186 (_ BitVec 32)) (_3!1488 (_ BitVec 32)) (_4!531 (_ BitVec 32))) )
))
(declare-fun lt!436448 () tuple4!1062)

(declare-fun res!247992 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301056 (= res!247992 (byteRangesEq!0 (select (arr!9010 a1!948) (_3!1488 lt!436448)) (select (arr!9010 a2!948) (_3!1488 lt!436448)) lt!436451 #b00000000000000000000000000000111))))

(assert (=> b!301056 (=> (not res!247992) (not e!216199))))

(declare-fun b!301057 () Bool)

(declare-fun res!247994 () Bool)

(declare-fun e!216207 () Bool)

(assert (=> b!301057 (=> (not res!247994) (not e!216207))))

(declare-fun lt!436445 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301057 (= res!247994 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436445) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247988 () Bool)

(declare-fun e!216204 () Bool)

(assert (=> start!67090 (=> (not res!247988) (not e!216204))))

(assert (=> start!67090 (= res!247988 (and (bvsle (size!7927 a1!948) (size!7927 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67090 e!216204))

(assert (=> start!67090 true))

(declare-fun array_inv!7539 (array!18251) Bool)

(assert (=> start!67090 (array_inv!7539 a1!948)))

(assert (=> start!67090 (array_inv!7539 a2!948)))

(declare-fun b!301058 () Bool)

(assert (=> b!301058 (= e!216204 e!216207)))

(declare-fun res!247991 () Bool)

(assert (=> b!301058 (=> (not res!247991) (not e!216207))))

(assert (=> b!301058 (= res!247991 (and (bvsle toBit!258 lt!436445) (bvsle fromBit!258 lt!436445)))))

(assert (=> b!301058 (= lt!436445 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7927 a1!948))))))

(declare-fun b!301059 () Bool)

(declare-fun e!216200 () Unit!21076)

(declare-fun lt!436442 () Unit!21076)

(assert (=> b!301059 (= e!216200 lt!436442)))

(declare-fun lt!436452 () tuple4!1062)

(declare-fun arrayRangesEqSlicedLemma!199 (array!18251 array!18251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21076)

(assert (=> b!301059 (= lt!436442 (arrayRangesEqSlicedLemma!199 a1!948 a2!948 (_1!13186 lt!436448) (_2!13186 lt!436448) (_1!13186 lt!436452) (_2!13186 lt!436452)))))

(declare-fun arrayRangesEq!1589 (array!18251 array!18251 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301059 (arrayRangesEq!1589 a1!948 a2!948 (_1!13186 lt!436452) (_2!13186 lt!436452))))

(declare-fun b!301060 () Bool)

(declare-fun e!216203 () Unit!21076)

(declare-fun lt!436444 () Unit!21076)

(assert (=> b!301060 (= e!216203 lt!436444)))

(declare-fun arrayRangesEqImpliesEq!244 (array!18251 array!18251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21076)

(assert (=> b!301060 (= lt!436444 (arrayRangesEqImpliesEq!244 a1!948 a2!948 (_1!13186 lt!436448) (_3!1488 lt!436452) (_2!13186 lt!436448)))))

(assert (=> b!301060 (= (select (arr!9010 a1!948) (_3!1488 lt!436452)) (select (arr!9010 a2!948) (_3!1488 lt!436452)))))

(declare-fun b!301061 () Bool)

(declare-fun Unit!21079 () Unit!21076)

(assert (=> b!301061 (= e!216200 Unit!21079)))

(declare-fun b!301062 () Bool)

(declare-fun res!247989 () Bool)

(assert (=> b!301062 (=> (not res!247989) (not e!216207))))

(declare-fun arrayBitRangesEq!0 (array!18251 array!18251 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301062 (= res!247989 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun bm!5420 () Bool)

(declare-fun c!14118 () Bool)

(declare-fun lt!436446 () (_ BitVec 32))

(assert (=> bm!5420 (= call!5423 (byteRangesEq!0 (ite c!14118 (select (arr!9010 a1!948) (_3!1488 lt!436448)) (select (arr!9010 a1!948) (_4!531 lt!436448))) (ite c!14118 (select (arr!9010 a2!948) (_3!1488 lt!436448)) (select (arr!9010 a2!948) (_4!531 lt!436448))) (ite c!14118 lt!436451 #b00000000000000000000000000000000) lt!436446))))

(declare-fun b!301063 () Bool)

(declare-fun lt!436443 () Unit!21076)

(assert (=> b!301063 (= e!216198 lt!436443)))

(assert (=> b!301063 (= lt!436443 (arrayRangesEqImpliesEq!244 a1!948 a2!948 (_1!13186 lt!436448) (_4!531 lt!436452) (_2!13186 lt!436448)))))

(assert (=> b!301063 (= (select (arr!9010 a1!948) (_4!531 lt!436452)) (select (arr!9010 a2!948) (_4!531 lt!436452)))))

(declare-fun b!301064 () Bool)

(declare-fun Unit!21080 () Unit!21076)

(assert (=> b!301064 (= e!216203 Unit!21080)))

(declare-fun b!301065 () Bool)

(declare-fun e!216205 () Bool)

(assert (=> b!301065 (= e!216205 false)))

(declare-fun lt!436449 () Unit!21076)

(assert (=> b!301065 (= lt!436449 e!216198)))

(declare-fun c!14116 () Bool)

(assert (=> b!301065 (= c!14116 (and (bvslt (_4!531 lt!436452) (_4!531 lt!436448)) (bvslt (_3!1488 lt!436448) (_4!531 lt!436452))))))

(declare-fun lt!436447 () Unit!21076)

(assert (=> b!301065 (= lt!436447 e!216203)))

(declare-fun c!14117 () Bool)

(assert (=> b!301065 (= c!14117 (and (bvslt (_3!1488 lt!436448) (_3!1488 lt!436452)) (bvslt (_3!1488 lt!436452) (_4!531 lt!436448))))))

(declare-fun b!301066 () Bool)

(declare-fun res!247993 () Bool)

(assert (=> b!301066 (= res!247993 (= lt!436446 #b00000000000000000000000000000000))))

(declare-fun e!216197 () Bool)

(assert (=> b!301066 (=> res!247993 e!216197)))

(assert (=> b!301066 (= e!216199 e!216197)))

(declare-fun b!301067 () Bool)

(assert (=> b!301067 (= e!216197 call!5423)))

(declare-fun b!301068 () Bool)

(assert (=> b!301068 (= e!216207 e!216205)))

(declare-fun res!247990 () Bool)

(assert (=> b!301068 (=> (not res!247990) (not e!216205))))

(assert (=> b!301068 (= res!247990 e!216202)))

(assert (=> b!301068 (= c!14118 (= (_3!1488 lt!436448) (_4!531 lt!436448)))))

(declare-fun lt!436450 () Unit!21076)

(assert (=> b!301068 (= lt!436450 e!216200)))

(declare-fun c!14115 () Bool)

(assert (=> b!301068 (= c!14115 (bvslt (_1!13186 lt!436452) (_2!13186 lt!436452)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1062)

(assert (=> b!301068 (= lt!436452 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301068 (= lt!436446 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301068 (= lt!436451 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301068 (= lt!436448 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!67090 res!247988) b!301058))

(assert (= (and b!301058 res!247991) b!301062))

(assert (= (and b!301062 res!247989) b!301057))

(assert (= (and b!301057 res!247994) b!301068))

(assert (= (and b!301068 c!14115) b!301059))

(assert (= (and b!301068 (not c!14115)) b!301061))

(assert (= (and b!301068 c!14118) b!301055))

(assert (= (and b!301068 (not c!14118)) b!301056))

(assert (= (and b!301056 res!247992) b!301066))

(assert (= (and b!301066 (not res!247993)) b!301067))

(assert (= (or b!301055 b!301067) bm!5420))

(assert (= (and b!301068 res!247990) b!301065))

(assert (= (and b!301065 c!14117) b!301060))

(assert (= (and b!301065 (not c!14117)) b!301064))

(assert (= (and b!301065 c!14116) b!301063))

(assert (= (and b!301065 (not c!14116)) b!301054))

(declare-fun m!439939 () Bool)

(assert (=> b!301063 m!439939))

(declare-fun m!439941 () Bool)

(assert (=> b!301063 m!439941))

(declare-fun m!439943 () Bool)

(assert (=> b!301063 m!439943))

(declare-fun m!439945 () Bool)

(assert (=> start!67090 m!439945))

(declare-fun m!439947 () Bool)

(assert (=> start!67090 m!439947))

(declare-fun m!439949 () Bool)

(assert (=> b!301056 m!439949))

(declare-fun m!439951 () Bool)

(assert (=> b!301056 m!439951))

(assert (=> b!301056 m!439949))

(assert (=> b!301056 m!439951))

(declare-fun m!439953 () Bool)

(assert (=> b!301056 m!439953))

(declare-fun m!439955 () Bool)

(assert (=> b!301062 m!439955))

(declare-fun m!439957 () Bool)

(assert (=> b!301060 m!439957))

(declare-fun m!439959 () Bool)

(assert (=> b!301060 m!439959))

(declare-fun m!439961 () Bool)

(assert (=> b!301060 m!439961))

(declare-fun m!439963 () Bool)

(assert (=> b!301059 m!439963))

(declare-fun m!439965 () Bool)

(assert (=> b!301059 m!439965))

(declare-fun m!439967 () Bool)

(assert (=> bm!5420 m!439967))

(declare-fun m!439969 () Bool)

(assert (=> bm!5420 m!439969))

(assert (=> bm!5420 m!439951))

(declare-fun m!439971 () Bool)

(assert (=> bm!5420 m!439971))

(assert (=> bm!5420 m!439949))

(declare-fun m!439973 () Bool)

(assert (=> b!301068 m!439973))

(declare-fun m!439975 () Bool)

(assert (=> b!301068 m!439975))

(push 1)

(assert (not b!301062))

(assert (not b!301068))

(assert (not b!301056))

(assert (not start!67090))

(assert (not b!301063))

(assert (not b!301059))

(assert (not b!301060))

(assert (not bm!5420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67092 () Bool)

(assert start!67092)

(declare-fun b!301099 () Bool)

(declare-fun e!216234 () Bool)

(declare-fun e!216230 () Bool)

(assert (=> b!301099 (= e!216234 e!216230)))

(declare-fun res!248014 () Bool)

(assert (=> b!301099 (=> (not res!248014) (not e!216230))))

(declare-fun e!216235 () Bool)

(assert (=> b!301099 (= res!248014 e!216235)))

(declare-fun c!14128 () Bool)

(declare-datatypes ((tuple4!1064 0))(
  ( (tuple4!1065 (_1!13187 (_ BitVec 32)) (_2!13187 (_ BitVec 32)) (_3!1489 (_ BitVec 32)) (_4!532 (_ BitVec 32))) )
))
(declare-fun lt!436481 () tuple4!1064)

(assert (=> b!301099 (= c!14128 (= (_3!1489 lt!436481) (_4!532 lt!436481)))))

(declare-datatypes ((Unit!21081 0))(
  ( (Unit!21082) )
))
(declare-fun lt!436483 () Unit!21081)

(declare-fun e!216236 () Unit!21081)

(assert (=> b!301099 (= lt!436483 e!216236)))

(declare-fun c!14130 () Bool)

(declare-fun lt!436482 () tuple4!1064)

(assert (=> b!301099 (= c!14130 (bvslt (_1!13187 lt!436482) (_2!13187 lt!436482)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1064)

(assert (=> b!301099 (= lt!436482 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!436485 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!301099 (= lt!436485 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436475 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!301099 (= lt!436475 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301099 (= lt!436481 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!248015 () Bool)

(declare-fun e!216240 () Bool)

(assert (=> start!67092 (=> (not res!248015) (not e!216240))))

(declare-datatypes ((array!18253 0))(
  ( (array!18254 (arr!9011 (Array (_ BitVec 32) (_ BitVec 8))) (size!7928 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18253)

(declare-fun a1!948 () array!18253)

(assert (=> start!67092 (= res!248015 (and (bvsle (size!7928 a1!948) (size!7928 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67092 e!216240))

(assert (=> start!67092 true))

(declare-fun array_inv!7540 (array!18253) Bool)

(assert (=> start!67092 (array_inv!7540 a1!948)))

(assert (=> start!67092 (array_inv!7540 a2!948)))

(declare-fun b!301100 () Bool)

(assert (=> b!301100 (= e!216240 e!216234)))

(declare-fun res!248010 () Bool)

(assert (=> b!301100 (=> (not res!248010) (not e!216234))))

(declare-fun lt!436479 () (_ BitVec 64))

(assert (=> b!301100 (= res!248010 (and (bvsle toBit!258 lt!436479) (bvsle fromBit!258 lt!436479)))))

(assert (=> b!301100 (= lt!436479 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7928 a1!948))))))

(declare-fun b!301101 () Bool)

(declare-fun e!216239 () Bool)

(declare-fun call!5426 () Bool)

(assert (=> b!301101 (= e!216239 call!5426)))

(declare-fun b!301102 () Bool)

(assert (=> b!301102 (= e!216230 false)))

(declare-fun lt!436477 () Unit!21081)

(declare-fun e!216231 () Unit!21081)

(assert (=> b!301102 (= lt!436477 e!216231)))

(declare-fun c!14129 () Bool)

(assert (=> b!301102 (= c!14129 (and (bvslt (_4!532 lt!436482) (_4!532 lt!436481)) (bvslt (_3!1489 lt!436481) (_4!532 lt!436482))))))

(declare-fun lt!436480 () Unit!21081)

(declare-fun e!216233 () Unit!21081)

(assert (=> b!301102 (= lt!436480 e!216233)))

(declare-fun c!14127 () Bool)

(assert (=> b!301102 (= c!14127 (and (bvslt (_3!1489 lt!436481) (_3!1489 lt!436482)) (bvslt (_3!1489 lt!436482) (_4!532 lt!436481))))))

(declare-fun b!301103 () Bool)

(declare-fun Unit!21083 () Unit!21081)

(assert (=> b!301103 (= e!216236 Unit!21083)))

(declare-fun b!301104 () Bool)

(declare-fun lt!436478 () Unit!21081)

(assert (=> b!301104 (= e!216233 lt!436478)))

(declare-fun arrayRangesEqImpliesEq!245 (array!18253 array!18253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21081)

(assert (=> b!301104 (= lt!436478 (arrayRangesEqImpliesEq!245 a1!948 a2!948 (_1!13187 lt!436481) (_3!1489 lt!436482) (_2!13187 lt!436481)))))

(assert (=> b!301104 (= (select (arr!9011 a1!948) (_3!1489 lt!436482)) (select (arr!9011 a2!948) (_3!1489 lt!436482)))))

(declare-fun b!301105 () Bool)

(declare-fun res!248009 () Bool)

(assert (=> b!301105 (=> (not res!248009) (not e!216234))))

(assert (=> b!301105 (= res!248009 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436479) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301106 () Bool)

(declare-fun lt!436484 () Unit!21081)

(assert (=> b!301106 (= e!216236 lt!436484)))

(declare-fun arrayRangesEqSlicedLemma!200 (array!18253 array!18253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21081)

(assert (=> b!301106 (= lt!436484 (arrayRangesEqSlicedLemma!200 a1!948 a2!948 (_1!13187 lt!436481) (_2!13187 lt!436481) (_1!13187 lt!436482) (_2!13187 lt!436482)))))

(declare-fun arrayRangesEq!1590 (array!18253 array!18253 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301106 (arrayRangesEq!1590 a1!948 a2!948 (_1!13187 lt!436482) (_2!13187 lt!436482))))

(declare-fun bm!5423 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5423 (= call!5426 (byteRangesEq!0 (ite c!14128 (select (arr!9011 a1!948) (_3!1489 lt!436481)) (select (arr!9011 a1!948) (_4!532 lt!436481))) (ite c!14128 (select (arr!9011 a2!948) (_3!1489 lt!436481)) (select (arr!9011 a2!948) (_4!532 lt!436481))) (ite c!14128 lt!436475 #b00000000000000000000000000000000) lt!436485))))

(declare-fun b!301107 () Bool)

(assert (=> b!301107 (= e!216235 call!5426)))

(declare-fun b!301108 () Bool)

(declare-fun res!248012 () Bool)

(assert (=> b!301108 (= res!248012 (= lt!436485 #b00000000000000000000000000000000))))

(assert (=> b!301108 (=> res!248012 e!216239)))

(declare-fun e!216238 () Bool)

(assert (=> b!301108 (= e!216238 e!216239)))

(declare-fun b!301109 () Bool)

(declare-fun Unit!21084 () Unit!21081)

(assert (=> b!301109 (= e!216231 Unit!21084)))

(declare-fun b!301110 () Bool)

(declare-fun res!248011 () Bool)

(assert (=> b!301110 (=> (not res!248011) (not e!216234))))

(declare-fun arrayBitRangesEq!0 (array!18253 array!18253 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301110 (= res!248011 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301111 () Bool)

(assert (=> b!301111 (= e!216235 e!216238)))

(declare-fun res!248013 () Bool)

(assert (=> b!301111 (= res!248013 (byteRangesEq!0 (select (arr!9011 a1!948) (_3!1489 lt!436481)) (select (arr!9011 a2!948) (_3!1489 lt!436481)) lt!436475 #b00000000000000000000000000000111))))

(assert (=> b!301111 (=> (not res!248013) (not e!216238))))

(declare-fun b!301112 () Bool)

(declare-fun Unit!21085 () Unit!21081)

(assert (=> b!301112 (= e!216233 Unit!21085)))

(declare-fun b!301113 () Bool)

(declare-fun lt!436476 () Unit!21081)

(assert (=> b!301113 (= e!216231 lt!436476)))

(assert (=> b!301113 (= lt!436476 (arrayRangesEqImpliesEq!245 a1!948 a2!948 (_1!13187 lt!436481) (_4!532 lt!436482) (_2!13187 lt!436481)))))

(assert (=> b!301113 (= (select (arr!9011 a1!948) (_4!532 lt!436482)) (select (arr!9011 a2!948) (_4!532 lt!436482)))))

(assert (= (and start!67092 res!248015) b!301100))

(assert (= (and b!301100 res!248010) b!301110))

(assert (= (and b!301110 res!248011) b!301105))

(assert (= (and b!301105 res!248009) b!301099))

(assert (= (and b!301099 c!14130) b!301106))

(assert (= (and b!301099 (not c!14130)) b!301103))

(assert (= (and b!301099 c!14128) b!301107))

(assert (= (and b!301099 (not c!14128)) b!301111))

(assert (= (and b!301111 res!248013) b!301108))

(assert (= (and b!301108 (not res!248012)) b!301101))

(assert (= (or b!301107 b!301101) bm!5423))

(assert (= (and b!301099 res!248014) b!301102))

(assert (= (and b!301102 c!14127) b!301104))

(assert (= (and b!301102 (not c!14127)) b!301112))

(assert (= (and b!301102 c!14129) b!301113))

(assert (= (and b!301102 (not c!14129)) b!301109))

(declare-fun m!439977 () Bool)

(assert (=> b!301113 m!439977))

(declare-fun m!439979 () Bool)

(assert (=> b!301113 m!439979))

(declare-fun m!439981 () Bool)

(assert (=> b!301113 m!439981))

(declare-fun m!439983 () Bool)

(assert (=> start!67092 m!439983))

(declare-fun m!439985 () Bool)

(assert (=> start!67092 m!439985))

(declare-fun m!439987 () Bool)

(assert (=> b!301111 m!439987))

(declare-fun m!439989 () Bool)

(assert (=> b!301111 m!439989))

(assert (=> b!301111 m!439987))

(assert (=> b!301111 m!439989))

(declare-fun m!439991 () Bool)

(assert (=> b!301111 m!439991))

(declare-fun m!439993 () Bool)

(assert (=> bm!5423 m!439993))

(assert (=> bm!5423 m!439989))

(assert (=> bm!5423 m!439987))

(declare-fun m!439995 () Bool)

(assert (=> bm!5423 m!439995))

(declare-fun m!439997 () Bool)

(assert (=> bm!5423 m!439997))

(declare-fun m!439999 () Bool)

(assert (=> b!301099 m!439999))

(declare-fun m!440001 () Bool)

(assert (=> b!301099 m!440001))

(declare-fun m!440003 () Bool)

(assert (=> b!301110 m!440003))

(declare-fun m!440005 () Bool)

(assert (=> b!301104 m!440005))

(declare-fun m!440007 () Bool)

(assert (=> b!301104 m!440007))

(declare-fun m!440009 () Bool)

(assert (=> b!301104 m!440009))

(declare-fun m!440011 () Bool)

(assert (=> b!301106 m!440011))

(declare-fun m!440013 () Bool)

(assert (=> b!301106 m!440013))

(check-sat (not b!301113) (not start!67092) (not b!301099) (not b!301110) (not b!301104) (not bm!5423) (not b!301106) (not b!301111))
(check-sat)

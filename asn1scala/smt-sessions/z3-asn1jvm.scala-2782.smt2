; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67098 () Bool)

(assert start!67098)

(declare-datatypes ((tuple4!1070 0))(
  ( (tuple4!1071 (_1!13190 (_ BitVec 32)) (_2!13190 (_ BitVec 32)) (_3!1492 (_ BitVec 32)) (_4!535 (_ BitVec 32))) )
))
(declare-fun lt!436586 () tuple4!1070)

(declare-fun lt!436590 () (_ BitVec 32))

(declare-datatypes ((array!18259 0))(
  ( (array!18260 (arr!9014 (Array (_ BitVec 32) (_ BitVec 8))) (size!7931 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18259)

(declare-fun call!5435 () Bool)

(declare-fun lt!436583 () (_ BitVec 32))

(declare-fun a2!948 () array!18259)

(declare-fun c!14164 () Bool)

(declare-fun bm!5432 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5432 (= call!5435 (byteRangesEq!0 (select (arr!9014 a1!948) (_3!1492 lt!436586)) (select (arr!9014 a2!948) (_3!1492 lt!436586)) lt!436590 (ite c!14164 lt!436583 #b00000000000000000000000000000111)))))

(declare-fun b!301254 () Bool)

(declare-fun res!248095 () Bool)

(declare-fun e!216345 () Bool)

(assert (=> b!301254 (=> (not res!248095) (not e!216345))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18259 array!18259 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301254 (= res!248095 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301255 () Bool)

(declare-datatypes ((Unit!21096 0))(
  ( (Unit!21097) )
))
(declare-fun e!216349 () Unit!21096)

(declare-fun Unit!21098 () Unit!21096)

(assert (=> b!301255 (= e!216349 Unit!21098)))

(declare-fun b!301256 () Bool)

(declare-fun e!216341 () Bool)

(declare-fun e!216348 () Bool)

(assert (=> b!301256 (= e!216341 e!216348)))

(declare-fun res!248093 () Bool)

(assert (=> b!301256 (=> (not res!248093) (not e!216348))))

(declare-fun lt!436580 () tuple4!1070)

(assert (=> b!301256 (= res!248093 (not (= (_3!1492 lt!436580) (_4!535 lt!436580))))))

(declare-fun lt!436588 () Unit!21096)

(declare-fun e!216350 () Unit!21096)

(assert (=> b!301256 (= lt!436588 e!216350)))

(declare-fun c!14166 () Bool)

(assert (=> b!301256 (= c!14166 (and (bvslt (_4!535 lt!436580) (_4!535 lt!436586)) (bvslt (_3!1492 lt!436586) (_4!535 lt!436580))))))

(declare-fun lt!436582 () Unit!21096)

(assert (=> b!301256 (= lt!436582 e!216349)))

(declare-fun c!14165 () Bool)

(assert (=> b!301256 (= c!14165 (and (bvslt (_3!1492 lt!436586) (_3!1492 lt!436580)) (bvslt (_3!1492 lt!436580) (_4!535 lt!436586))))))

(declare-fun b!301257 () Bool)

(declare-fun res!248094 () Bool)

(assert (=> b!301257 (= res!248094 (= lt!436583 #b00000000000000000000000000000000))))

(declare-fun e!216351 () Bool)

(assert (=> b!301257 (=> res!248094 e!216351)))

(declare-fun e!216340 () Bool)

(assert (=> b!301257 (= e!216340 e!216351)))

(declare-fun b!301258 () Bool)

(assert (=> b!301258 (= e!216345 e!216341)))

(declare-fun res!248097 () Bool)

(assert (=> b!301258 (=> (not res!248097) (not e!216341))))

(declare-fun e!216346 () Bool)

(assert (=> b!301258 (= res!248097 e!216346)))

(assert (=> b!301258 (= c!14164 (= (_3!1492 lt!436586) (_4!535 lt!436586)))))

(declare-fun lt!436584 () Unit!21096)

(declare-fun e!216347 () Unit!21096)

(assert (=> b!301258 (= lt!436584 e!216347)))

(declare-fun c!14163 () Bool)

(assert (=> b!301258 (= c!14163 (bvslt (_1!13190 lt!436580) (_2!13190 lt!436580)))))

(declare-fun lt!436585 () (_ BitVec 32))

(declare-fun toSlice!52 () (_ BitVec 64))

(assert (=> b!301258 (= lt!436585 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1070)

(assert (=> b!301258 (= lt!436580 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301258 (= lt!436583 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301258 (= lt!436590 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301258 (= lt!436586 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301259 () Bool)

(declare-fun lt!436579 () Unit!21096)

(assert (=> b!301259 (= e!216350 lt!436579)))

(declare-fun arrayRangesEqImpliesEq!248 (array!18259 array!18259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21096)

(assert (=> b!301259 (= lt!436579 (arrayRangesEqImpliesEq!248 a1!948 a2!948 (_1!13190 lt!436586) (_4!535 lt!436580) (_2!13190 lt!436586)))))

(assert (=> b!301259 (= (select (arr!9014 a1!948) (_4!535 lt!436580)) (select (arr!9014 a2!948) (_4!535 lt!436580)))))

(declare-fun b!301260 () Bool)

(assert (=> b!301260 (= e!216346 call!5435)))

(declare-fun b!301261 () Bool)

(declare-fun res!248101 () Bool)

(assert (=> b!301261 (=> (not res!248101) (not e!216348))))

(declare-fun e!216342 () Bool)

(assert (=> b!301261 (= res!248101 e!216342)))

(declare-fun res!248100 () Bool)

(assert (=> b!301261 (=> res!248100 e!216342)))

(assert (=> b!301261 (= res!248100 (= lt!436585 #b00000000000000000000000000000000))))

(declare-fun b!301263 () Bool)

(declare-fun lt!436587 () (_ BitVec 64))

(assert (=> b!301263 (= e!216348 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!436587)))))

(declare-fun b!301264 () Bool)

(assert (=> b!301264 (= e!216351 (byteRangesEq!0 (select (arr!9014 a1!948) (_4!535 lt!436586)) (select (arr!9014 a2!948) (_4!535 lt!436586)) #b00000000000000000000000000000000 lt!436583))))

(declare-fun b!301265 () Bool)

(declare-fun Unit!21099 () Unit!21096)

(assert (=> b!301265 (= e!216347 Unit!21099)))

(declare-fun b!301266 () Bool)

(declare-fun Unit!21100 () Unit!21096)

(assert (=> b!301266 (= e!216350 Unit!21100)))

(declare-fun b!301267 () Bool)

(declare-fun lt!436589 () Unit!21096)

(assert (=> b!301267 (= e!216349 lt!436589)))

(assert (=> b!301267 (= lt!436589 (arrayRangesEqImpliesEq!248 a1!948 a2!948 (_1!13190 lt!436586) (_3!1492 lt!436580) (_2!13190 lt!436586)))))

(assert (=> b!301267 (= (select (arr!9014 a1!948) (_3!1492 lt!436580)) (select (arr!9014 a2!948) (_3!1492 lt!436580)))))

(declare-fun b!301268 () Bool)

(declare-fun lt!436581 () Unit!21096)

(assert (=> b!301268 (= e!216347 lt!436581)))

(declare-fun arrayRangesEqSlicedLemma!203 (array!18259 array!18259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21096)

(assert (=> b!301268 (= lt!436581 (arrayRangesEqSlicedLemma!203 a1!948 a2!948 (_1!13190 lt!436586) (_2!13190 lt!436586) (_1!13190 lt!436580) (_2!13190 lt!436580)))))

(declare-fun arrayRangesEq!1593 (array!18259 array!18259 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301268 (arrayRangesEq!1593 a1!948 a2!948 (_1!13190 lt!436580) (_2!13190 lt!436580))))

(declare-fun b!301269 () Bool)

(assert (=> b!301269 (= e!216342 (byteRangesEq!0 (select (arr!9014 a1!948) (_4!535 lt!436580)) (select (arr!9014 a2!948) (_4!535 lt!436580)) #b00000000000000000000000000000000 lt!436585))))

(declare-fun b!301270 () Bool)

(declare-fun res!248102 () Bool)

(assert (=> b!301270 (=> (not res!248102) (not e!216345))))

(assert (=> b!301270 (= res!248102 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436587) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301271 () Bool)

(assert (=> b!301271 (= e!216346 e!216340)))

(declare-fun res!248096 () Bool)

(assert (=> b!301271 (= res!248096 call!5435)))

(assert (=> b!301271 (=> (not res!248096) (not e!216340))))

(declare-fun b!301272 () Bool)

(declare-fun e!216339 () Bool)

(assert (=> b!301272 (= e!216339 e!216345)))

(declare-fun res!248098 () Bool)

(assert (=> b!301272 (=> (not res!248098) (not e!216345))))

(assert (=> b!301272 (= res!248098 (and (bvsle toBit!258 lt!436587) (bvsle fromBit!258 lt!436587)))))

(assert (=> b!301272 (= lt!436587 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7931 a1!948))))))

(declare-fun res!248092 () Bool)

(assert (=> start!67098 (=> (not res!248092) (not e!216339))))

(assert (=> start!67098 (= res!248092 (and (bvsle (size!7931 a1!948) (size!7931 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67098 e!216339))

(assert (=> start!67098 true))

(declare-fun array_inv!7543 (array!18259) Bool)

(assert (=> start!67098 (array_inv!7543 a1!948)))

(assert (=> start!67098 (array_inv!7543 a2!948)))

(declare-fun b!301262 () Bool)

(declare-fun res!248099 () Bool)

(assert (=> b!301262 (=> (not res!248099) (not e!216348))))

(assert (=> b!301262 (= res!248099 (byteRangesEq!0 (select (arr!9014 a1!948) (_3!1492 lt!436580)) (select (arr!9014 a2!948) (_3!1492 lt!436580)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(assert (= (and start!67098 res!248092) b!301272))

(assert (= (and b!301272 res!248098) b!301254))

(assert (= (and b!301254 res!248095) b!301270))

(assert (= (and b!301270 res!248102) b!301258))

(assert (= (and b!301258 c!14163) b!301268))

(assert (= (and b!301258 (not c!14163)) b!301265))

(assert (= (and b!301258 c!14164) b!301260))

(assert (= (and b!301258 (not c!14164)) b!301271))

(assert (= (and b!301271 res!248096) b!301257))

(assert (= (and b!301257 (not res!248094)) b!301264))

(assert (= (or b!301260 b!301271) bm!5432))

(assert (= (and b!301258 res!248097) b!301256))

(assert (= (and b!301256 c!14165) b!301267))

(assert (= (and b!301256 (not c!14165)) b!301255))

(assert (= (and b!301256 c!14166) b!301259))

(assert (= (and b!301256 (not c!14166)) b!301266))

(assert (= (and b!301256 res!248093) b!301262))

(assert (= (and b!301262 res!248099) b!301261))

(assert (= (and b!301261 (not res!248100)) b!301269))

(assert (= (and b!301261 res!248101) b!301263))

(declare-fun m!440095 () Bool)

(assert (=> b!301259 m!440095))

(declare-fun m!440097 () Bool)

(assert (=> b!301259 m!440097))

(declare-fun m!440099 () Bool)

(assert (=> b!301259 m!440099))

(declare-fun m!440101 () Bool)

(assert (=> b!301268 m!440101))

(declare-fun m!440103 () Bool)

(assert (=> b!301268 m!440103))

(declare-fun m!440105 () Bool)

(assert (=> b!301254 m!440105))

(declare-fun m!440107 () Bool)

(assert (=> b!301267 m!440107))

(declare-fun m!440109 () Bool)

(assert (=> b!301267 m!440109))

(declare-fun m!440111 () Bool)

(assert (=> b!301267 m!440111))

(declare-fun m!440113 () Bool)

(assert (=> b!301264 m!440113))

(declare-fun m!440115 () Bool)

(assert (=> b!301264 m!440115))

(assert (=> b!301264 m!440113))

(assert (=> b!301264 m!440115))

(declare-fun m!440117 () Bool)

(assert (=> b!301264 m!440117))

(declare-fun m!440119 () Bool)

(assert (=> bm!5432 m!440119))

(declare-fun m!440121 () Bool)

(assert (=> bm!5432 m!440121))

(assert (=> bm!5432 m!440119))

(assert (=> bm!5432 m!440121))

(declare-fun m!440123 () Bool)

(assert (=> bm!5432 m!440123))

(declare-fun m!440125 () Bool)

(assert (=> start!67098 m!440125))

(declare-fun m!440127 () Bool)

(assert (=> start!67098 m!440127))

(declare-fun m!440129 () Bool)

(assert (=> b!301258 m!440129))

(declare-fun m!440131 () Bool)

(assert (=> b!301258 m!440131))

(assert (=> b!301269 m!440097))

(assert (=> b!301269 m!440099))

(assert (=> b!301269 m!440097))

(assert (=> b!301269 m!440099))

(declare-fun m!440133 () Bool)

(assert (=> b!301269 m!440133))

(assert (=> b!301262 m!440109))

(assert (=> b!301262 m!440111))

(assert (=> b!301262 m!440109))

(assert (=> b!301262 m!440111))

(declare-fun m!440135 () Bool)

(assert (=> b!301262 m!440135))

(check-sat (not b!301264) (not b!301258) (not b!301269) (not bm!5432) (not b!301254) (not b!301259) (not b!301267) (not b!301262) (not start!67098) (not b!301268))
(check-sat)

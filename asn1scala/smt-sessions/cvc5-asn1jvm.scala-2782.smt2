; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67096 () Bool)

(assert start!67096)

(declare-fun b!301197 () Bool)

(declare-datatypes ((Unit!21091 0))(
  ( (Unit!21092) )
))
(declare-fun e!216310 () Unit!21091)

(declare-fun lt!436545 () Unit!21091)

(assert (=> b!301197 (= e!216310 lt!436545)))

(declare-datatypes ((tuple4!1068 0))(
  ( (tuple4!1069 (_1!13189 (_ BitVec 32)) (_2!13189 (_ BitVec 32)) (_3!1491 (_ BitVec 32)) (_4!534 (_ BitVec 32))) )
))
(declare-fun lt!436553 () tuple4!1068)

(declare-datatypes ((array!18257 0))(
  ( (array!18258 (arr!9013 (Array (_ BitVec 32) (_ BitVec 8))) (size!7930 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18257)

(declare-fun a2!948 () array!18257)

(declare-fun lt!436548 () tuple4!1068)

(declare-fun arrayRangesEqSlicedLemma!202 (array!18257 array!18257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21091)

(assert (=> b!301197 (= lt!436545 (arrayRangesEqSlicedLemma!202 a1!948 a2!948 (_1!13189 lt!436553) (_2!13189 lt!436553) (_1!13189 lt!436548) (_2!13189 lt!436548)))))

(declare-fun arrayRangesEq!1592 (array!18257 array!18257 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301197 (arrayRangesEq!1592 a1!948 a2!948 (_1!13189 lt!436548) (_2!13189 lt!436548))))

(declare-fun b!301198 () Bool)

(declare-fun e!216304 () Bool)

(declare-fun e!216302 () Bool)

(assert (=> b!301198 (= e!216304 e!216302)))

(declare-fun res!248059 () Bool)

(assert (=> b!301198 (=> (not res!248059) (not e!216302))))

(assert (=> b!301198 (= res!248059 (not (= (_3!1491 lt!436548) (_4!534 lt!436548))))))

(declare-fun lt!436543 () Unit!21091)

(declare-fun e!216300 () Unit!21091)

(assert (=> b!301198 (= lt!436543 e!216300)))

(declare-fun c!14151 () Bool)

(assert (=> b!301198 (= c!14151 (and (bvslt (_4!534 lt!436548) (_4!534 lt!436553)) (bvslt (_3!1491 lt!436553) (_4!534 lt!436548))))))

(declare-fun lt!436547 () Unit!21091)

(declare-fun e!216301 () Unit!21091)

(assert (=> b!301198 (= lt!436547 e!216301)))

(declare-fun c!14152 () Bool)

(assert (=> b!301198 (= c!14152 (and (bvslt (_3!1491 lt!436553) (_3!1491 lt!436548)) (bvslt (_3!1491 lt!436548) (_4!534 lt!436553))))))

(declare-fun b!301199 () Bool)

(declare-fun res!248060 () Bool)

(declare-fun e!216312 () Bool)

(assert (=> b!301199 (=> (not res!248060) (not e!216312))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18257 array!18257 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301199 (= res!248060 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301200 () Bool)

(declare-fun res!248065 () Bool)

(assert (=> b!301200 (=> (not res!248065) (not e!216302))))

(declare-fun e!216303 () Bool)

(assert (=> b!301200 (= res!248065 e!216303)))

(declare-fun res!248063 () Bool)

(assert (=> b!301200 (=> res!248063 e!216303)))

(declare-fun lt!436554 () (_ BitVec 32))

(assert (=> b!301200 (= res!248063 (= lt!436554 #b00000000000000000000000000000000))))

(declare-fun b!301201 () Bool)

(assert (=> b!301201 (= e!216312 e!216304)))

(declare-fun res!248064 () Bool)

(assert (=> b!301201 (=> (not res!248064) (not e!216304))))

(declare-fun e!216305 () Bool)

(assert (=> b!301201 (= res!248064 e!216305)))

(declare-fun c!14153 () Bool)

(assert (=> b!301201 (= c!14153 (= (_3!1491 lt!436553) (_4!534 lt!436553)))))

(declare-fun lt!436552 () Unit!21091)

(assert (=> b!301201 (= lt!436552 e!216310)))

(declare-fun c!14154 () Bool)

(assert (=> b!301201 (= c!14154 (bvslt (_1!13189 lt!436548) (_2!13189 lt!436548)))))

(declare-fun toSlice!52 () (_ BitVec 64))

(assert (=> b!301201 (= lt!436554 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1068)

(assert (=> b!301201 (= lt!436548 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!436544 () (_ BitVec 32))

(assert (=> b!301201 (= lt!436544 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436549 () (_ BitVec 32))

(assert (=> b!301201 (= lt!436549 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301201 (= lt!436553 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!248069 () Bool)

(declare-fun e!216307 () Bool)

(assert (=> start!67096 (=> (not res!248069) (not e!216307))))

(assert (=> start!67096 (= res!248069 (and (bvsle (size!7930 a1!948) (size!7930 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67096 e!216307))

(assert (=> start!67096 true))

(declare-fun array_inv!7542 (array!18257) Bool)

(assert (=> start!67096 (array_inv!7542 a1!948)))

(assert (=> start!67096 (array_inv!7542 a2!948)))

(declare-fun b!301202 () Bool)

(declare-fun lt!436551 () Unit!21091)

(assert (=> b!301202 (= e!216300 lt!436551)))

(declare-fun arrayRangesEqImpliesEq!247 (array!18257 array!18257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21091)

(assert (=> b!301202 (= lt!436551 (arrayRangesEqImpliesEq!247 a1!948 a2!948 (_1!13189 lt!436553) (_4!534 lt!436548) (_2!13189 lt!436553)))))

(assert (=> b!301202 (= (select (arr!9013 a1!948) (_4!534 lt!436548)) (select (arr!9013 a2!948) (_4!534 lt!436548)))))

(declare-fun call!5432 () Bool)

(declare-fun bm!5429 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5429 (= call!5432 (byteRangesEq!0 (ite c!14153 (select (arr!9013 a1!948) (_3!1491 lt!436553)) (select (arr!9013 a1!948) (_4!534 lt!436553))) (ite c!14153 (select (arr!9013 a2!948) (_3!1491 lt!436553)) (select (arr!9013 a2!948) (_4!534 lt!436553))) (ite c!14153 lt!436549 #b00000000000000000000000000000000) lt!436544))))

(declare-fun b!301203 () Bool)

(declare-fun res!248068 () Bool)

(assert (=> b!301203 (=> (not res!248068) (not e!216302))))

(assert (=> b!301203 (= res!248068 (byteRangesEq!0 (select (arr!9013 a1!948) (_3!1491 lt!436548)) (select (arr!9013 a2!948) (_3!1491 lt!436548)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!301204 () Bool)

(assert (=> b!301204 (= e!216303 (byteRangesEq!0 (select (arr!9013 a1!948) (_4!534 lt!436548)) (select (arr!9013 a2!948) (_4!534 lt!436548)) #b00000000000000000000000000000000 lt!436554))))

(declare-fun b!301205 () Bool)

(declare-fun e!216306 () Bool)

(assert (=> b!301205 (= e!216306 call!5432)))

(declare-fun b!301206 () Bool)

(declare-fun lt!436550 () Unit!21091)

(assert (=> b!301206 (= e!216301 lt!436550)))

(assert (=> b!301206 (= lt!436550 (arrayRangesEqImpliesEq!247 a1!948 a2!948 (_1!13189 lt!436553) (_3!1491 lt!436548) (_2!13189 lt!436553)))))

(assert (=> b!301206 (= (select (arr!9013 a1!948) (_3!1491 lt!436548)) (select (arr!9013 a2!948) (_3!1491 lt!436548)))))

(declare-fun b!301207 () Bool)

(declare-fun res!248061 () Bool)

(assert (=> b!301207 (=> (not res!248061) (not e!216312))))

(declare-fun lt!436546 () (_ BitVec 64))

(assert (=> b!301207 (= res!248061 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436546) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301208 () Bool)

(declare-fun Unit!21093 () Unit!21091)

(assert (=> b!301208 (= e!216301 Unit!21093)))

(declare-fun b!301209 () Bool)

(assert (=> b!301209 (= e!216305 call!5432)))

(declare-fun b!301210 () Bool)

(declare-fun res!248062 () Bool)

(assert (=> b!301210 (= res!248062 (= lt!436544 #b00000000000000000000000000000000))))

(assert (=> b!301210 (=> res!248062 e!216306)))

(declare-fun e!216308 () Bool)

(assert (=> b!301210 (= e!216308 e!216306)))

(declare-fun b!301211 () Bool)

(assert (=> b!301211 (= e!216305 e!216308)))

(declare-fun res!248066 () Bool)

(assert (=> b!301211 (= res!248066 (byteRangesEq!0 (select (arr!9013 a1!948) (_3!1491 lt!436553)) (select (arr!9013 a2!948) (_3!1491 lt!436553)) lt!436549 #b00000000000000000000000000000111))))

(assert (=> b!301211 (=> (not res!248066) (not e!216308))))

(declare-fun b!301212 () Bool)

(declare-fun Unit!21094 () Unit!21091)

(assert (=> b!301212 (= e!216310 Unit!21094)))

(declare-fun b!301213 () Bool)

(assert (=> b!301213 (= e!216307 e!216312)))

(declare-fun res!248067 () Bool)

(assert (=> b!301213 (=> (not res!248067) (not e!216312))))

(assert (=> b!301213 (= res!248067 (and (bvsle toBit!258 lt!436546) (bvsle fromBit!258 lt!436546)))))

(assert (=> b!301213 (= lt!436546 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7930 a1!948))))))

(declare-fun b!301214 () Bool)

(declare-fun Unit!21095 () Unit!21091)

(assert (=> b!301214 (= e!216300 Unit!21095)))

(declare-fun b!301215 () Bool)

(assert (=> b!301215 (= e!216302 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!436546)))))

(assert (= (and start!67096 res!248069) b!301213))

(assert (= (and b!301213 res!248067) b!301199))

(assert (= (and b!301199 res!248060) b!301207))

(assert (= (and b!301207 res!248061) b!301201))

(assert (= (and b!301201 c!14154) b!301197))

(assert (= (and b!301201 (not c!14154)) b!301212))

(assert (= (and b!301201 c!14153) b!301209))

(assert (= (and b!301201 (not c!14153)) b!301211))

(assert (= (and b!301211 res!248066) b!301210))

(assert (= (and b!301210 (not res!248062)) b!301205))

(assert (= (or b!301209 b!301205) bm!5429))

(assert (= (and b!301201 res!248064) b!301198))

(assert (= (and b!301198 c!14152) b!301206))

(assert (= (and b!301198 (not c!14152)) b!301208))

(assert (= (and b!301198 c!14151) b!301202))

(assert (= (and b!301198 (not c!14151)) b!301214))

(assert (= (and b!301198 res!248059) b!301203))

(assert (= (and b!301203 res!248068) b!301200))

(assert (= (and b!301200 (not res!248063)) b!301204))

(assert (= (and b!301200 res!248065) b!301215))

(declare-fun m!440053 () Bool)

(assert (=> b!301197 m!440053))

(declare-fun m!440055 () Bool)

(assert (=> b!301197 m!440055))

(declare-fun m!440057 () Bool)

(assert (=> b!301202 m!440057))

(declare-fun m!440059 () Bool)

(assert (=> b!301202 m!440059))

(declare-fun m!440061 () Bool)

(assert (=> b!301202 m!440061))

(assert (=> b!301204 m!440059))

(assert (=> b!301204 m!440061))

(assert (=> b!301204 m!440059))

(assert (=> b!301204 m!440061))

(declare-fun m!440063 () Bool)

(assert (=> b!301204 m!440063))

(declare-fun m!440065 () Bool)

(assert (=> b!301206 m!440065))

(declare-fun m!440067 () Bool)

(assert (=> b!301206 m!440067))

(declare-fun m!440069 () Bool)

(assert (=> b!301206 m!440069))

(declare-fun m!440071 () Bool)

(assert (=> bm!5429 m!440071))

(declare-fun m!440073 () Bool)

(assert (=> bm!5429 m!440073))

(declare-fun m!440075 () Bool)

(assert (=> bm!5429 m!440075))

(declare-fun m!440077 () Bool)

(assert (=> bm!5429 m!440077))

(declare-fun m!440079 () Bool)

(assert (=> bm!5429 m!440079))

(declare-fun m!440081 () Bool)

(assert (=> b!301201 m!440081))

(declare-fun m!440083 () Bool)

(assert (=> b!301201 m!440083))

(declare-fun m!440085 () Bool)

(assert (=> b!301199 m!440085))

(declare-fun m!440087 () Bool)

(assert (=> start!67096 m!440087))

(declare-fun m!440089 () Bool)

(assert (=> start!67096 m!440089))

(assert (=> b!301203 m!440067))

(assert (=> b!301203 m!440069))

(assert (=> b!301203 m!440067))

(assert (=> b!301203 m!440069))

(declare-fun m!440091 () Bool)

(assert (=> b!301203 m!440091))

(assert (=> b!301211 m!440071))

(assert (=> b!301211 m!440079))

(assert (=> b!301211 m!440071))

(assert (=> b!301211 m!440079))

(declare-fun m!440093 () Bool)

(assert (=> b!301211 m!440093))

(push 1)

(assert (not b!301201))

(assert (not bm!5429))

(assert (not b!301199))

(assert (not b!301211))

(assert (not b!301202))

(assert (not b!301204))

(assert (not b!301206))

(assert (not b!301197))

(assert (not start!67096))

(assert (not b!301203))

(check-sat)

(pop 1)

(push 1)

(check-sat)


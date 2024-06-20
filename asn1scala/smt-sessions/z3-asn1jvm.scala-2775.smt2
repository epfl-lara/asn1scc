; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67014 () Bool)

(assert start!67014)

(declare-fun res!247535 () Bool)

(declare-fun e!215556 () Bool)

(assert (=> start!67014 (=> (not res!247535) (not e!215556))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18214 0))(
  ( (array!18215 (arr!8993 (Array (_ BitVec 32) (_ BitVec 8))) (size!7910 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18214)

(declare-fun a2!948 () array!18214)

(assert (=> start!67014 (= res!247535 (and (bvsle (size!7910 a1!948) (size!7910 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67014 e!215556))

(assert (=> start!67014 true))

(declare-fun array_inv!7522 (array!18214) Bool)

(assert (=> start!67014 (array_inv!7522 a1!948)))

(assert (=> start!67014 (array_inv!7522 a2!948)))

(declare-fun b!300180 () Bool)

(declare-fun res!247534 () Bool)

(declare-fun e!215557 () Bool)

(assert (=> b!300180 (=> (not res!247534) (not e!215557))))

(declare-fun arrayBitRangesEq!0 (array!18214 array!18214 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300180 (= res!247534 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun lt!435811 () (_ BitVec 32))

(declare-fun c!13908 () Bool)

(declare-fun call!5363 () Bool)

(declare-datatypes ((tuple4!1028 0))(
  ( (tuple4!1029 (_1!13169 (_ BitVec 32)) (_2!13169 (_ BitVec 32)) (_3!1471 (_ BitVec 32)) (_4!514 (_ BitVec 32))) )
))
(declare-fun lt!435809 () tuple4!1028)

(declare-fun lt!435806 () (_ BitVec 32))

(declare-fun bm!5360 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5360 (= call!5363 (byteRangesEq!0 (ite c!13908 (select (arr!8993 a1!948) (_3!1471 lt!435809)) (select (arr!8993 a1!948) (_4!514 lt!435809))) (ite c!13908 (select (arr!8993 a2!948) (_3!1471 lt!435809)) (select (arr!8993 a2!948) (_4!514 lt!435809))) (ite c!13908 lt!435806 #b00000000000000000000000000000000) lt!435811))))

(declare-fun b!300181 () Bool)

(declare-fun e!215550 () Bool)

(assert (=> b!300181 (= e!215557 e!215550)))

(declare-fun res!247537 () Bool)

(assert (=> b!300181 (=> (not res!247537) (not e!215550))))

(declare-fun e!215558 () Bool)

(assert (=> b!300181 (= res!247537 e!215558)))

(assert (=> b!300181 (= c!13908 (= (_3!1471 lt!435809) (_4!514 lt!435809)))))

(declare-datatypes ((Unit!20993 0))(
  ( (Unit!20994) )
))
(declare-fun lt!435807 () Unit!20993)

(declare-fun e!215553 () Unit!20993)

(assert (=> b!300181 (= lt!435807 e!215553)))

(declare-fun c!13906 () Bool)

(declare-fun lt!435812 () tuple4!1028)

(assert (=> b!300181 (= c!13906 (bvslt (_1!13169 lt!435812) (_2!13169 lt!435812)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1028)

(assert (=> b!300181 (= lt!435812 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300181 (= lt!435811 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300181 (= lt!435806 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300181 (= lt!435809 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300182 () Bool)

(declare-fun res!247538 () Bool)

(assert (=> b!300182 (= res!247538 (= lt!435811 #b00000000000000000000000000000000))))

(declare-fun e!215551 () Bool)

(assert (=> b!300182 (=> res!247538 e!215551)))

(declare-fun e!215554 () Bool)

(assert (=> b!300182 (= e!215554 e!215551)))

(declare-fun b!300183 () Bool)

(assert (=> b!300183 (= e!215556 e!215557)))

(declare-fun res!247532 () Bool)

(assert (=> b!300183 (=> (not res!247532) (not e!215557))))

(declare-fun lt!435810 () (_ BitVec 64))

(assert (=> b!300183 (= res!247532 (and (bvsle toBit!258 lt!435810) (bvsle fromBit!258 lt!435810)))))

(assert (=> b!300183 (= lt!435810 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7910 a1!948))))))

(declare-fun b!300184 () Bool)

(declare-fun Unit!20995 () Unit!20993)

(assert (=> b!300184 (= e!215553 Unit!20995)))

(declare-fun b!300185 () Bool)

(declare-fun lt!435808 () Unit!20993)

(assert (=> b!300185 (= e!215553 lt!435808)))

(declare-fun arrayRangesEqSlicedLemma!182 (array!18214 array!18214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20993)

(assert (=> b!300185 (= lt!435808 (arrayRangesEqSlicedLemma!182 a1!948 a2!948 (_1!13169 lt!435809) (_2!13169 lt!435809) (_1!13169 lt!435812) (_2!13169 lt!435812)))))

(declare-fun arrayRangesEq!1572 (array!18214 array!18214 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300185 (arrayRangesEq!1572 a1!948 a2!948 (_1!13169 lt!435812) (_2!13169 lt!435812))))

(declare-fun b!300186 () Bool)

(declare-fun res!247533 () Bool)

(assert (=> b!300186 (=> (not res!247533) (not e!215557))))

(assert (=> b!300186 (= res!247533 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435810) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300187 () Bool)

(assert (=> b!300187 (= e!215551 call!5363)))

(declare-fun b!300188 () Bool)

(declare-fun e!215559 () Unit!20993)

(declare-fun Unit!20996 () Unit!20993)

(assert (=> b!300188 (= e!215559 Unit!20996)))

(declare-fun b!300189 () Bool)

(assert (=> b!300189 (= e!215550 false)))

(declare-fun lt!435805 () Unit!20993)

(assert (=> b!300189 (= lt!435805 e!215559)))

(declare-fun c!13907 () Bool)

(assert (=> b!300189 (= c!13907 (and (bvslt (_3!1471 lt!435809) (_3!1471 lt!435812)) (bvslt (_3!1471 lt!435812) (_4!514 lt!435809))))))

(declare-fun b!300190 () Bool)

(assert (=> b!300190 (= e!215558 e!215554)))

(declare-fun res!247536 () Bool)

(assert (=> b!300190 (= res!247536 (byteRangesEq!0 (select (arr!8993 a1!948) (_3!1471 lt!435809)) (select (arr!8993 a2!948) (_3!1471 lt!435809)) lt!435806 #b00000000000000000000000000000111))))

(assert (=> b!300190 (=> (not res!247536) (not e!215554))))

(declare-fun b!300191 () Bool)

(assert (=> b!300191 (= e!215558 call!5363)))

(declare-fun b!300192 () Bool)

(declare-fun lt!435813 () Unit!20993)

(assert (=> b!300192 (= e!215559 lt!435813)))

(declare-fun arrayRangesEqImpliesEq!227 (array!18214 array!18214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20993)

(assert (=> b!300192 (= lt!435813 (arrayRangesEqImpliesEq!227 a1!948 a2!948 (_1!13169 lt!435809) (_3!1471 lt!435812) (_2!13169 lt!435809)))))

(assert (=> b!300192 (= (select (arr!8993 a1!948) (_3!1471 lt!435812)) (select (arr!8993 a2!948) (_3!1471 lt!435812)))))

(assert (= (and start!67014 res!247535) b!300183))

(assert (= (and b!300183 res!247532) b!300180))

(assert (= (and b!300180 res!247534) b!300186))

(assert (= (and b!300186 res!247533) b!300181))

(assert (= (and b!300181 c!13906) b!300185))

(assert (= (and b!300181 (not c!13906)) b!300184))

(assert (= (and b!300181 c!13908) b!300191))

(assert (= (and b!300181 (not c!13908)) b!300190))

(assert (= (and b!300190 res!247536) b!300182))

(assert (= (and b!300182 (not res!247538)) b!300187))

(assert (= (or b!300191 b!300187) bm!5360))

(assert (= (and b!300181 res!247537) b!300189))

(assert (= (and b!300189 c!13907) b!300192))

(assert (= (and b!300189 (not c!13907)) b!300188))

(declare-fun m!439191 () Bool)

(assert (=> b!300180 m!439191))

(declare-fun m!439193 () Bool)

(assert (=> b!300181 m!439193))

(declare-fun m!439195 () Bool)

(assert (=> b!300181 m!439195))

(declare-fun m!439197 () Bool)

(assert (=> b!300185 m!439197))

(declare-fun m!439199 () Bool)

(assert (=> b!300185 m!439199))

(declare-fun m!439201 () Bool)

(assert (=> b!300192 m!439201))

(declare-fun m!439203 () Bool)

(assert (=> b!300192 m!439203))

(declare-fun m!439205 () Bool)

(assert (=> b!300192 m!439205))

(declare-fun m!439207 () Bool)

(assert (=> start!67014 m!439207))

(declare-fun m!439209 () Bool)

(assert (=> start!67014 m!439209))

(declare-fun m!439211 () Bool)

(assert (=> b!300190 m!439211))

(declare-fun m!439213 () Bool)

(assert (=> b!300190 m!439213))

(assert (=> b!300190 m!439211))

(assert (=> b!300190 m!439213))

(declare-fun m!439215 () Bool)

(assert (=> b!300190 m!439215))

(declare-fun m!439217 () Bool)

(assert (=> bm!5360 m!439217))

(declare-fun m!439219 () Bool)

(assert (=> bm!5360 m!439219))

(assert (=> bm!5360 m!439211))

(assert (=> bm!5360 m!439213))

(declare-fun m!439221 () Bool)

(assert (=> bm!5360 m!439221))

(check-sat (not b!300192) (not b!300181) (not bm!5360) (not start!67014) (not b!300180) (not b!300190) (not b!300185))
(check-sat)

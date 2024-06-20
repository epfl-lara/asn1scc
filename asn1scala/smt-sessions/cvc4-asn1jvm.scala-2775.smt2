; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67016 () Bool)

(assert start!67016)

(declare-fun b!300219 () Bool)

(declare-datatypes ((Unit!20997 0))(
  ( (Unit!20998) )
))
(declare-fun e!215584 () Unit!20997)

(declare-fun lt!435832 () Unit!20997)

(assert (=> b!300219 (= e!215584 lt!435832)))

(declare-datatypes ((tuple4!1030 0))(
  ( (tuple4!1031 (_1!13170 (_ BitVec 32)) (_2!13170 (_ BitVec 32)) (_3!1472 (_ BitVec 32)) (_4!515 (_ BitVec 32))) )
))
(declare-fun lt!435835 () tuple4!1030)

(declare-datatypes ((array!18216 0))(
  ( (array!18217 (arr!8994 (Array (_ BitVec 32) (_ BitVec 8))) (size!7911 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18216)

(declare-fun lt!435834 () tuple4!1030)

(declare-fun a2!948 () array!18216)

(declare-fun arrayRangesEqSlicedLemma!183 (array!18216 array!18216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20997)

(assert (=> b!300219 (= lt!435832 (arrayRangesEqSlicedLemma!183 a1!948 a2!948 (_1!13170 lt!435835) (_2!13170 lt!435835) (_1!13170 lt!435834) (_2!13170 lt!435834)))))

(declare-fun arrayRangesEq!1573 (array!18216 array!18216 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300219 (arrayRangesEq!1573 a1!948 a2!948 (_1!13170 lt!435834) (_2!13170 lt!435834))))

(declare-fun b!300220 () Bool)

(declare-fun e!215582 () Bool)

(declare-fun call!5366 () Bool)

(assert (=> b!300220 (= e!215582 call!5366)))

(declare-fun b!300221 () Bool)

(declare-fun res!247559 () Bool)

(declare-fun e!215580 () Bool)

(assert (=> b!300221 (=> (not res!247559) (not e!215580))))

(declare-fun lt!435838 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300221 (= res!247559 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435838) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300222 () Bool)

(declare-fun res!247556 () Bool)

(declare-fun lt!435833 () (_ BitVec 32))

(assert (=> b!300222 (= res!247556 (= lt!435833 #b00000000000000000000000000000000))))

(declare-fun e!215585 () Bool)

(assert (=> b!300222 (=> res!247556 e!215585)))

(declare-fun e!215586 () Bool)

(assert (=> b!300222 (= e!215586 e!215585)))

(declare-fun b!300223 () Bool)

(declare-fun e!215583 () Bool)

(assert (=> b!300223 (= e!215583 e!215580)))

(declare-fun res!247553 () Bool)

(assert (=> b!300223 (=> (not res!247553) (not e!215580))))

(assert (=> b!300223 (= res!247553 (and (bvsle toBit!258 lt!435838) (bvsle fromBit!258 lt!435838)))))

(assert (=> b!300223 (= lt!435838 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7911 a1!948))))))

(declare-fun b!300224 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300224 (= e!215585 (byteRangesEq!0 (select (arr!8994 a1!948) (_4!515 lt!435835)) (select (arr!8994 a2!948) (_4!515 lt!435835)) #b00000000000000000000000000000000 lt!435833))))

(declare-fun b!300225 () Bool)

(declare-fun res!247557 () Bool)

(assert (=> b!300225 (=> (not res!247557) (not e!215580))))

(declare-fun arrayBitRangesEq!0 (array!18216 array!18216 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300225 (= res!247557 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300226 () Bool)

(declare-fun e!215588 () Unit!20997)

(declare-fun lt!435836 () Unit!20997)

(assert (=> b!300226 (= e!215588 lt!435836)))

(declare-fun arrayRangesEqImpliesEq!228 (array!18216 array!18216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20997)

(assert (=> b!300226 (= lt!435836 (arrayRangesEqImpliesEq!228 a1!948 a2!948 (_1!13170 lt!435835) (_3!1472 lt!435834) (_2!13170 lt!435835)))))

(assert (=> b!300226 (= (select (arr!8994 a1!948) (_3!1472 lt!435834)) (select (arr!8994 a2!948) (_3!1472 lt!435834)))))

(declare-fun b!300227 () Bool)

(declare-fun Unit!20999 () Unit!20997)

(assert (=> b!300227 (= e!215584 Unit!20999)))

(declare-fun res!247558 () Bool)

(assert (=> start!67016 (=> (not res!247558) (not e!215583))))

(assert (=> start!67016 (= res!247558 (and (bvsle (size!7911 a1!948) (size!7911 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67016 e!215583))

(assert (=> start!67016 true))

(declare-fun array_inv!7523 (array!18216) Bool)

(assert (=> start!67016 (array_inv!7523 a1!948)))

(assert (=> start!67016 (array_inv!7523 a2!948)))

(declare-fun b!300228 () Bool)

(declare-fun e!215587 () Bool)

(assert (=> b!300228 (= e!215580 e!215587)))

(declare-fun res!247554 () Bool)

(assert (=> b!300228 (=> (not res!247554) (not e!215587))))

(assert (=> b!300228 (= res!247554 e!215582)))

(declare-fun c!13916 () Bool)

(assert (=> b!300228 (= c!13916 (= (_3!1472 lt!435835) (_4!515 lt!435835)))))

(declare-fun lt!435839 () Unit!20997)

(assert (=> b!300228 (= lt!435839 e!215584)))

(declare-fun c!13915 () Bool)

(assert (=> b!300228 (= c!13915 (bvslt (_1!13170 lt!435834) (_2!13170 lt!435834)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1030)

(assert (=> b!300228 (= lt!435834 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300228 (= lt!435833 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435840 () (_ BitVec 32))

(assert (=> b!300228 (= lt!435840 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300228 (= lt!435835 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300229 () Bool)

(assert (=> b!300229 (= e!215582 e!215586)))

(declare-fun res!247555 () Bool)

(assert (=> b!300229 (= res!247555 call!5366)))

(assert (=> b!300229 (=> (not res!247555) (not e!215586))))

(declare-fun bm!5363 () Bool)

(assert (=> bm!5363 (= call!5366 (byteRangesEq!0 (select (arr!8994 a1!948) (_3!1472 lt!435835)) (select (arr!8994 a2!948) (_3!1472 lt!435835)) lt!435840 (ite c!13916 lt!435833 #b00000000000000000000000000000111)))))

(declare-fun b!300230 () Bool)

(declare-fun Unit!21000 () Unit!20997)

(assert (=> b!300230 (= e!215588 Unit!21000)))

(declare-fun b!300231 () Bool)

(assert (=> b!300231 (= e!215587 false)))

(declare-fun lt!435837 () Unit!20997)

(assert (=> b!300231 (= lt!435837 e!215588)))

(declare-fun c!13917 () Bool)

(assert (=> b!300231 (= c!13917 (and (bvslt (_3!1472 lt!435835) (_3!1472 lt!435834)) (bvslt (_3!1472 lt!435834) (_4!515 lt!435835))))))

(assert (= (and start!67016 res!247558) b!300223))

(assert (= (and b!300223 res!247553) b!300225))

(assert (= (and b!300225 res!247557) b!300221))

(assert (= (and b!300221 res!247559) b!300228))

(assert (= (and b!300228 c!13915) b!300219))

(assert (= (and b!300228 (not c!13915)) b!300227))

(assert (= (and b!300228 c!13916) b!300220))

(assert (= (and b!300228 (not c!13916)) b!300229))

(assert (= (and b!300229 res!247555) b!300222))

(assert (= (and b!300222 (not res!247556)) b!300224))

(assert (= (or b!300220 b!300229) bm!5363))

(assert (= (and b!300228 res!247554) b!300231))

(assert (= (and b!300231 c!13917) b!300226))

(assert (= (and b!300231 (not c!13917)) b!300230))

(declare-fun m!439223 () Bool)

(assert (=> start!67016 m!439223))

(declare-fun m!439225 () Bool)

(assert (=> start!67016 m!439225))

(declare-fun m!439227 () Bool)

(assert (=> b!300225 m!439227))

(declare-fun m!439229 () Bool)

(assert (=> b!300228 m!439229))

(declare-fun m!439231 () Bool)

(assert (=> b!300228 m!439231))

(declare-fun m!439233 () Bool)

(assert (=> b!300219 m!439233))

(declare-fun m!439235 () Bool)

(assert (=> b!300219 m!439235))

(declare-fun m!439237 () Bool)

(assert (=> b!300224 m!439237))

(declare-fun m!439239 () Bool)

(assert (=> b!300224 m!439239))

(assert (=> b!300224 m!439237))

(assert (=> b!300224 m!439239))

(declare-fun m!439241 () Bool)

(assert (=> b!300224 m!439241))

(declare-fun m!439243 () Bool)

(assert (=> bm!5363 m!439243))

(declare-fun m!439245 () Bool)

(assert (=> bm!5363 m!439245))

(assert (=> bm!5363 m!439243))

(assert (=> bm!5363 m!439245))

(declare-fun m!439247 () Bool)

(assert (=> bm!5363 m!439247))

(declare-fun m!439249 () Bool)

(assert (=> b!300226 m!439249))

(declare-fun m!439251 () Bool)

(assert (=> b!300226 m!439251))

(declare-fun m!439253 () Bool)

(assert (=> b!300226 m!439253))

(push 1)


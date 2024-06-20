; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67006 () Bool)

(assert start!67006)

(declare-fun b!300024 () Bool)

(declare-fun e!215435 () Bool)

(declare-fun e!215430 () Bool)

(assert (=> b!300024 (= e!215435 e!215430)))

(declare-datatypes ((tuple4!1020 0))(
  ( (tuple4!1021 (_1!13165 (_ BitVec 32)) (_2!13165 (_ BitVec 32)) (_3!1467 (_ BitVec 32)) (_4!510 (_ BitVec 32))) )
))
(declare-fun lt!435702 () tuple4!1020)

(declare-datatypes ((array!18206 0))(
  ( (array!18207 (arr!8989 (Array (_ BitVec 32) (_ BitVec 8))) (size!7906 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18206)

(declare-fun lt!435704 () (_ BitVec 32))

(declare-fun a2!948 () array!18206)

(declare-fun res!247450 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300024 (= res!247450 (byteRangesEq!0 (select (arr!8989 a1!948) (_3!1467 lt!435702)) (select (arr!8989 a2!948) (_3!1467 lt!435702)) lt!435704 #b00000000000000000000000000000111))))

(assert (=> b!300024 (=> (not res!247450) (not e!215430))))

(declare-fun b!300025 () Bool)

(declare-datatypes ((Unit!20977 0))(
  ( (Unit!20978) )
))
(declare-fun e!215434 () Unit!20977)

(declare-fun lt!435701 () Unit!20977)

(assert (=> b!300025 (= e!215434 lt!435701)))

(declare-fun lt!435699 () tuple4!1020)

(declare-fun arrayRangesEqImpliesEq!223 (array!18206 array!18206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20977)

(assert (=> b!300025 (= lt!435701 (arrayRangesEqImpliesEq!223 a1!948 a2!948 (_1!13165 lt!435702) (_3!1467 lt!435699) (_2!13165 lt!435702)))))

(assert (=> b!300025 (= (select (arr!8989 a1!948) (_3!1467 lt!435699)) (select (arr!8989 a2!948) (_3!1467 lt!435699)))))

(declare-fun b!300026 () Bool)

(declare-fun e!215437 () Bool)

(declare-fun e!215438 () Bool)

(assert (=> b!300026 (= e!215437 e!215438)))

(declare-fun res!247452 () Bool)

(assert (=> b!300026 (=> (not res!247452) (not e!215438))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435700 () (_ BitVec 64))

(assert (=> b!300026 (= res!247452 (and (bvsle toBit!258 lt!435700) (bvsle fromBit!258 lt!435700)))))

(assert (=> b!300026 (= lt!435700 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7906 a1!948))))))

(declare-fun b!300027 () Bool)

(declare-fun res!247449 () Bool)

(assert (=> b!300027 (=> (not res!247449) (not e!215438))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300027 (= res!247449 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435700) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247453 () Bool)

(assert (=> start!67006 (=> (not res!247453) (not e!215437))))

(assert (=> start!67006 (= res!247453 (and (bvsle (size!7906 a1!948) (size!7906 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67006 e!215437))

(assert (=> start!67006 true))

(declare-fun array_inv!7518 (array!18206) Bool)

(assert (=> start!67006 (array_inv!7518 a1!948)))

(assert (=> start!67006 (array_inv!7518 a2!948)))

(declare-fun call!5351 () Bool)

(declare-fun bm!5348 () Bool)

(declare-fun lt!435697 () (_ BitVec 32))

(declare-fun c!13871 () Bool)

(assert (=> bm!5348 (= call!5351 (byteRangesEq!0 (ite c!13871 (select (arr!8989 a1!948) (_3!1467 lt!435702)) (select (arr!8989 a1!948) (_4!510 lt!435702))) (ite c!13871 (select (arr!8989 a2!948) (_3!1467 lt!435702)) (select (arr!8989 a2!948) (_4!510 lt!435702))) (ite c!13871 lt!435704 #b00000000000000000000000000000000) lt!435697))))

(declare-fun b!300028 () Bool)

(assert (=> b!300028 (= e!215435 call!5351)))

(declare-fun b!300029 () Bool)

(declare-fun Unit!20979 () Unit!20977)

(assert (=> b!300029 (= e!215434 Unit!20979)))

(declare-fun b!300030 () Bool)

(declare-fun e!215436 () Bool)

(assert (=> b!300030 (= e!215436 false)))

(declare-fun lt!435703 () Unit!20977)

(assert (=> b!300030 (= lt!435703 e!215434)))

(declare-fun c!13870 () Bool)

(assert (=> b!300030 (= c!13870 (and (bvslt (_3!1467 lt!435702) (_3!1467 lt!435699)) (bvslt (_3!1467 lt!435699) (_4!510 lt!435702))))))

(declare-fun b!300031 () Bool)

(declare-fun e!215431 () Bool)

(assert (=> b!300031 (= e!215431 call!5351)))

(declare-fun b!300032 () Bool)

(declare-fun e!215439 () Unit!20977)

(declare-fun lt!435698 () Unit!20977)

(assert (=> b!300032 (= e!215439 lt!435698)))

(declare-fun arrayRangesEqSlicedLemma!178 (array!18206 array!18206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20977)

(assert (=> b!300032 (= lt!435698 (arrayRangesEqSlicedLemma!178 a1!948 a2!948 (_1!13165 lt!435702) (_2!13165 lt!435702) (_1!13165 lt!435699) (_2!13165 lt!435699)))))

(declare-fun arrayRangesEq!1568 (array!18206 array!18206 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300032 (arrayRangesEq!1568 a1!948 a2!948 (_1!13165 lt!435699) (_2!13165 lt!435699))))

(declare-fun b!300033 () Bool)

(declare-fun Unit!20980 () Unit!20977)

(assert (=> b!300033 (= e!215439 Unit!20980)))

(declare-fun b!300034 () Bool)

(assert (=> b!300034 (= e!215438 e!215436)))

(declare-fun res!247451 () Bool)

(assert (=> b!300034 (=> (not res!247451) (not e!215436))))

(assert (=> b!300034 (= res!247451 e!215435)))

(assert (=> b!300034 (= c!13871 (= (_3!1467 lt!435702) (_4!510 lt!435702)))))

(declare-fun lt!435705 () Unit!20977)

(assert (=> b!300034 (= lt!435705 e!215439)))

(declare-fun c!13872 () Bool)

(assert (=> b!300034 (= c!13872 (bvslt (_1!13165 lt!435699) (_2!13165 lt!435699)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1020)

(assert (=> b!300034 (= lt!435699 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300034 (= lt!435697 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300034 (= lt!435704 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300034 (= lt!435702 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300035 () Bool)

(declare-fun res!247448 () Bool)

(assert (=> b!300035 (=> (not res!247448) (not e!215438))))

(declare-fun arrayBitRangesEq!0 (array!18206 array!18206 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300035 (= res!247448 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300036 () Bool)

(declare-fun res!247454 () Bool)

(assert (=> b!300036 (= res!247454 (= lt!435697 #b00000000000000000000000000000000))))

(assert (=> b!300036 (=> res!247454 e!215431)))

(assert (=> b!300036 (= e!215430 e!215431)))

(assert (= (and start!67006 res!247453) b!300026))

(assert (= (and b!300026 res!247452) b!300035))

(assert (= (and b!300035 res!247448) b!300027))

(assert (= (and b!300027 res!247449) b!300034))

(assert (= (and b!300034 c!13872) b!300032))

(assert (= (and b!300034 (not c!13872)) b!300033))

(assert (= (and b!300034 c!13871) b!300028))

(assert (= (and b!300034 (not c!13871)) b!300024))

(assert (= (and b!300024 res!247450) b!300036))

(assert (= (and b!300036 (not res!247454)) b!300031))

(assert (= (or b!300028 b!300031) bm!5348))

(assert (= (and b!300034 res!247451) b!300030))

(assert (= (and b!300030 c!13870) b!300025))

(assert (= (and b!300030 (not c!13870)) b!300029))

(declare-fun m!439063 () Bool)

(assert (=> b!300032 m!439063))

(declare-fun m!439065 () Bool)

(assert (=> b!300032 m!439065))

(declare-fun m!439067 () Bool)

(assert (=> b!300034 m!439067))

(declare-fun m!439069 () Bool)

(assert (=> b!300034 m!439069))

(declare-fun m!439071 () Bool)

(assert (=> b!300035 m!439071))

(declare-fun m!439073 () Bool)

(assert (=> b!300025 m!439073))

(declare-fun m!439075 () Bool)

(assert (=> b!300025 m!439075))

(declare-fun m!439077 () Bool)

(assert (=> b!300025 m!439077))

(declare-fun m!439079 () Bool)

(assert (=> bm!5348 m!439079))

(declare-fun m!439081 () Bool)

(assert (=> bm!5348 m!439081))

(declare-fun m!439083 () Bool)

(assert (=> bm!5348 m!439083))

(declare-fun m!439085 () Bool)

(assert (=> bm!5348 m!439085))

(declare-fun m!439087 () Bool)

(assert (=> bm!5348 m!439087))

(assert (=> b!300024 m!439081))

(assert (=> b!300024 m!439083))

(assert (=> b!300024 m!439081))

(assert (=> b!300024 m!439083))

(declare-fun m!439089 () Bool)

(assert (=> b!300024 m!439089))

(declare-fun m!439091 () Bool)

(assert (=> start!67006 m!439091))

(declare-fun m!439093 () Bool)

(assert (=> start!67006 m!439093))

(push 1)

(assert (not start!67006))

(assert (not b!300035))

(assert (not b!300034))

(assert (not bm!5348))

(assert (not b!300024))

(assert (not b!300025))

(assert (not b!300032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


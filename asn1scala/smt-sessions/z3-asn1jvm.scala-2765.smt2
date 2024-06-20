; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66954 () Bool)

(assert start!66954)

(declare-fun b!299345 () Bool)

(declare-fun e!214893 () Bool)

(declare-fun e!214895 () Bool)

(assert (=> b!299345 (= e!214893 e!214895)))

(declare-fun res!247042 () Bool)

(assert (=> b!299345 (=> (not res!247042) (not e!214895))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435187 () (_ BitVec 64))

(assert (=> b!299345 (= res!247042 (and (bvsle toBit!258 lt!435187) (bvsle fromBit!258 lt!435187)))))

(declare-datatypes ((array!18154 0))(
  ( (array!18155 (arr!8963 (Array (_ BitVec 32) (_ BitVec 8))) (size!7880 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18154)

(assert (=> b!299345 (= lt!435187 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7880 a1!948))))))

(declare-fun b!299346 () Bool)

(declare-fun e!214896 () Bool)

(declare-fun lt!435190 () (_ BitVec 32))

(assert (=> b!299346 (= e!214896 (and (not (= lt!435190 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!435190) (bvsgt lt!435190 #b00000000000000000000000000001000))))))

(declare-fun b!299347 () Bool)

(assert (=> b!299347 (= e!214895 e!214896)))

(declare-fun res!247044 () Bool)

(assert (=> b!299347 (=> (not res!247044) (not e!214896))))

(declare-datatypes ((tuple4!968 0))(
  ( (tuple4!969 (_1!13139 (_ BitVec 32)) (_2!13139 (_ BitVec 32)) (_3!1441 (_ BitVec 32)) (_4!484 (_ BitVec 32))) )
))
(declare-fun lt!435191 () tuple4!968)

(assert (=> b!299347 (= res!247044 (not (= (_3!1441 lt!435191) (_4!484 lt!435191))))))

(declare-datatypes ((Unit!20890 0))(
  ( (Unit!20891) )
))
(declare-fun lt!435189 () Unit!20890)

(declare-fun e!214894 () Unit!20890)

(assert (=> b!299347 (= lt!435189 e!214894)))

(declare-fun c!13734 () Bool)

(declare-fun lt!435188 () tuple4!968)

(assert (=> b!299347 (= c!13734 (bvslt (_1!13139 lt!435188) (_2!13139 lt!435188)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!968)

(assert (=> b!299347 (= lt!435188 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299347 (= lt!435190 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299347 (= lt!435191 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299348 () Bool)

(declare-fun res!247045 () Bool)

(assert (=> b!299348 (=> (not res!247045) (not e!214895))))

(assert (=> b!299348 (= res!247045 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435187) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299349 () Bool)

(declare-fun res!247043 () Bool)

(assert (=> b!299349 (=> (not res!247043) (not e!214895))))

(declare-fun a2!948 () array!18154)

(declare-fun arrayBitRangesEq!0 (array!18154 array!18154 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299349 (= res!247043 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299350 () Bool)

(declare-fun lt!435192 () Unit!20890)

(assert (=> b!299350 (= e!214894 lt!435192)))

(declare-fun arrayRangesEqSlicedLemma!152 (array!18154 array!18154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20890)

(assert (=> b!299350 (= lt!435192 (arrayRangesEqSlicedLemma!152 a1!948 a2!948 (_1!13139 lt!435191) (_2!13139 lt!435191) (_1!13139 lt!435188) (_2!13139 lt!435188)))))

(declare-fun arrayRangesEq!1542 (array!18154 array!18154 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299350 (arrayRangesEq!1542 a1!948 a2!948 (_1!13139 lt!435188) (_2!13139 lt!435188))))

(declare-fun res!247046 () Bool)

(assert (=> start!66954 (=> (not res!247046) (not e!214893))))

(assert (=> start!66954 (= res!247046 (and (bvsle (size!7880 a1!948) (size!7880 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66954 e!214893))

(assert (=> start!66954 true))

(declare-fun array_inv!7492 (array!18154) Bool)

(assert (=> start!66954 (array_inv!7492 a1!948)))

(assert (=> start!66954 (array_inv!7492 a2!948)))

(declare-fun b!299351 () Bool)

(declare-fun res!247041 () Bool)

(assert (=> b!299351 (=> (not res!247041) (not e!214896))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299351 (= res!247041 (byteRangesEq!0 (select (arr!8963 a1!948) (_3!1441 lt!435191)) (select (arr!8963 a2!948) (_3!1441 lt!435191)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!299352 () Bool)

(declare-fun Unit!20892 () Unit!20890)

(assert (=> b!299352 (= e!214894 Unit!20892)))

(assert (= (and start!66954 res!247046) b!299345))

(assert (= (and b!299345 res!247042) b!299349))

(assert (= (and b!299349 res!247043) b!299348))

(assert (= (and b!299348 res!247045) b!299347))

(assert (= (and b!299347 c!13734) b!299350))

(assert (= (and b!299347 (not c!13734)) b!299352))

(assert (= (and b!299347 res!247044) b!299351))

(assert (= (and b!299351 res!247041) b!299346))

(declare-fun m!438525 () Bool)

(assert (=> start!66954 m!438525))

(declare-fun m!438527 () Bool)

(assert (=> start!66954 m!438527))

(declare-fun m!438529 () Bool)

(assert (=> b!299350 m!438529))

(declare-fun m!438531 () Bool)

(assert (=> b!299350 m!438531))

(declare-fun m!438533 () Bool)

(assert (=> b!299347 m!438533))

(declare-fun m!438535 () Bool)

(assert (=> b!299347 m!438535))

(declare-fun m!438537 () Bool)

(assert (=> b!299351 m!438537))

(declare-fun m!438539 () Bool)

(assert (=> b!299351 m!438539))

(assert (=> b!299351 m!438537))

(assert (=> b!299351 m!438539))

(declare-fun m!438541 () Bool)

(assert (=> b!299351 m!438541))

(declare-fun m!438543 () Bool)

(assert (=> b!299349 m!438543))

(check-sat (not start!66954) (not b!299347) (not b!299350) (not b!299351) (not b!299349))
(check-sat)

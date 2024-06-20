; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66956 () Bool)

(assert start!66956)

(declare-fun b!299369 () Bool)

(declare-fun res!247062 () Bool)

(declare-fun e!214912 () Bool)

(assert (=> b!299369 (=> (not res!247062) (not e!214912))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18156 0))(
  ( (array!18157 (arr!8964 (Array (_ BitVec 32) (_ BitVec 8))) (size!7881 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18156)

(declare-fun a2!948 () array!18156)

(declare-fun arrayBitRangesEq!0 (array!18156 array!18156 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299369 (= res!247062 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299370 () Bool)

(declare-fun e!214909 () Bool)

(assert (=> b!299370 (= e!214909 e!214912)))

(declare-fun res!247061 () Bool)

(assert (=> b!299370 (=> (not res!247061) (not e!214912))))

(declare-fun lt!435208 () (_ BitVec 64))

(assert (=> b!299370 (= res!247061 (and (bvsle toBit!258 lt!435208) (bvsle fromBit!258 lt!435208)))))

(assert (=> b!299370 (= lt!435208 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7881 a1!948))))))

(declare-fun b!299371 () Bool)

(declare-fun e!214914 () Bool)

(declare-fun lt!435205 () (_ BitVec 32))

(assert (=> b!299371 (= e!214914 (and (not (= lt!435205 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!435205) (bvsgt lt!435205 #b00000000000000000000000000001000))))))

(declare-fun b!299372 () Bool)

(declare-fun res!247059 () Bool)

(assert (=> b!299372 (=> (not res!247059) (not e!214912))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299372 (= res!247059 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435208) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247063 () Bool)

(assert (=> start!66956 (=> (not res!247063) (not e!214909))))

(assert (=> start!66956 (= res!247063 (and (bvsle (size!7881 a1!948) (size!7881 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66956 e!214909))

(assert (=> start!66956 true))

(declare-fun array_inv!7493 (array!18156) Bool)

(assert (=> start!66956 (array_inv!7493 a1!948)))

(assert (=> start!66956 (array_inv!7493 a2!948)))

(declare-fun b!299373 () Bool)

(declare-datatypes ((Unit!20893 0))(
  ( (Unit!20894) )
))
(declare-fun e!214913 () Unit!20893)

(declare-fun Unit!20895 () Unit!20893)

(assert (=> b!299373 (= e!214913 Unit!20895)))

(declare-fun b!299374 () Bool)

(assert (=> b!299374 (= e!214912 e!214914)))

(declare-fun res!247060 () Bool)

(assert (=> b!299374 (=> (not res!247060) (not e!214914))))

(declare-datatypes ((tuple4!970 0))(
  ( (tuple4!971 (_1!13140 (_ BitVec 32)) (_2!13140 (_ BitVec 32)) (_3!1442 (_ BitVec 32)) (_4!485 (_ BitVec 32))) )
))
(declare-fun lt!435206 () tuple4!970)

(assert (=> b!299374 (= res!247060 (not (= (_3!1442 lt!435206) (_4!485 lt!435206))))))

(declare-fun lt!435209 () Unit!20893)

(assert (=> b!299374 (= lt!435209 e!214913)))

(declare-fun c!13737 () Bool)

(declare-fun lt!435210 () tuple4!970)

(assert (=> b!299374 (= c!13737 (bvslt (_1!13140 lt!435210) (_2!13140 lt!435210)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!970)

(assert (=> b!299374 (= lt!435210 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299374 (= lt!435205 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299374 (= lt!435206 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299375 () Bool)

(declare-fun res!247064 () Bool)

(assert (=> b!299375 (=> (not res!247064) (not e!214914))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299375 (= res!247064 (byteRangesEq!0 (select (arr!8964 a1!948) (_3!1442 lt!435206)) (select (arr!8964 a2!948) (_3!1442 lt!435206)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!299376 () Bool)

(declare-fun lt!435207 () Unit!20893)

(assert (=> b!299376 (= e!214913 lt!435207)))

(declare-fun arrayRangesEqSlicedLemma!153 (array!18156 array!18156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20893)

(assert (=> b!299376 (= lt!435207 (arrayRangesEqSlicedLemma!153 a1!948 a2!948 (_1!13140 lt!435206) (_2!13140 lt!435206) (_1!13140 lt!435210) (_2!13140 lt!435210)))))

(declare-fun arrayRangesEq!1543 (array!18156 array!18156 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299376 (arrayRangesEq!1543 a1!948 a2!948 (_1!13140 lt!435210) (_2!13140 lt!435210))))

(assert (= (and start!66956 res!247063) b!299370))

(assert (= (and b!299370 res!247061) b!299369))

(assert (= (and b!299369 res!247062) b!299372))

(assert (= (and b!299372 res!247059) b!299374))

(assert (= (and b!299374 c!13737) b!299376))

(assert (= (and b!299374 (not c!13737)) b!299373))

(assert (= (and b!299374 res!247060) b!299375))

(assert (= (and b!299375 res!247064) b!299371))

(declare-fun m!438545 () Bool)

(assert (=> start!66956 m!438545))

(declare-fun m!438547 () Bool)

(assert (=> start!66956 m!438547))

(declare-fun m!438549 () Bool)

(assert (=> b!299374 m!438549))

(declare-fun m!438551 () Bool)

(assert (=> b!299374 m!438551))

(declare-fun m!438553 () Bool)

(assert (=> b!299369 m!438553))

(declare-fun m!438555 () Bool)

(assert (=> b!299375 m!438555))

(declare-fun m!438557 () Bool)

(assert (=> b!299375 m!438557))

(assert (=> b!299375 m!438555))

(assert (=> b!299375 m!438557))

(declare-fun m!438559 () Bool)

(assert (=> b!299375 m!438559))

(declare-fun m!438561 () Bool)

(assert (=> b!299376 m!438561))

(declare-fun m!438563 () Bool)

(assert (=> b!299376 m!438563))

(push 1)

(assert (not start!66956))

(assert (not b!299375))

(assert (not b!299376))

(assert (not b!299374))

(assert (not b!299369))

(check-sat)

(pop 1)

(push 1)

(check-sat)


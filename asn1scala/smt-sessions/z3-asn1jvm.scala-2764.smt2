; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66948 () Bool)

(assert start!66948)

(declare-fun b!299281 () Bool)

(declare-datatypes ((Unit!20881 0))(
  ( (Unit!20882) )
))
(declare-fun e!214842 () Unit!20881)

(declare-fun Unit!20883 () Unit!20881)

(assert (=> b!299281 (= e!214842 Unit!20883)))

(declare-fun b!299282 () Bool)

(declare-fun e!214844 () Bool)

(declare-datatypes ((tuple4!962 0))(
  ( (tuple4!963 (_1!13136 (_ BitVec 32)) (_2!13136 (_ BitVec 32)) (_3!1438 (_ BitVec 32)) (_4!481 (_ BitVec 32))) )
))
(declare-fun lt!435138 () tuple4!962)

(declare-fun lt!435136 () (_ BitVec 32))

(assert (=> b!299282 (= e!214844 (and (not (= (_3!1438 lt!435138) (_4!481 lt!435138))) (or (bvsgt #b00000000000000000000000000000000 lt!435136) (bvsgt lt!435136 #b00000000000000000000000000000111))))))

(declare-fun lt!435133 () Unit!20881)

(assert (=> b!299282 (= lt!435133 e!214842)))

(declare-fun c!13725 () Bool)

(declare-fun lt!435134 () tuple4!962)

(assert (=> b!299282 (= c!13725 (bvslt (_1!13136 lt!435134) (_2!13136 lt!435134)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!962)

(assert (=> b!299282 (= lt!435134 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!299282 (= lt!435136 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299282 (= lt!435138 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299283 () Bool)

(declare-fun res!246995 () Bool)

(assert (=> b!299283 (=> (not res!246995) (not e!214844))))

(declare-datatypes ((array!18148 0))(
  ( (array!18149 (arr!8960 (Array (_ BitVec 32) (_ BitVec 8))) (size!7877 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18148)

(declare-fun a2!948 () array!18148)

(declare-fun arrayBitRangesEq!0 (array!18148 array!18148 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299283 (= res!246995 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299284 () Bool)

(declare-fun e!214843 () Bool)

(assert (=> b!299284 (= e!214843 e!214844)))

(declare-fun res!246996 () Bool)

(assert (=> b!299284 (=> (not res!246996) (not e!214844))))

(declare-fun lt!435137 () (_ BitVec 64))

(assert (=> b!299284 (= res!246996 (and (bvsle toBit!258 lt!435137) (bvsle fromBit!258 lt!435137)))))

(assert (=> b!299284 (= lt!435137 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7877 a1!948))))))

(declare-fun b!299286 () Bool)

(declare-fun res!246998 () Bool)

(assert (=> b!299286 (=> (not res!246998) (not e!214844))))

(assert (=> b!299286 (= res!246998 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435137) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!246997 () Bool)

(assert (=> start!66948 (=> (not res!246997) (not e!214843))))

(assert (=> start!66948 (= res!246997 (and (bvsle (size!7877 a1!948) (size!7877 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66948 e!214843))

(assert (=> start!66948 true))

(declare-fun array_inv!7489 (array!18148) Bool)

(assert (=> start!66948 (array_inv!7489 a1!948)))

(assert (=> start!66948 (array_inv!7489 a2!948)))

(declare-fun b!299285 () Bool)

(declare-fun lt!435135 () Unit!20881)

(assert (=> b!299285 (= e!214842 lt!435135)))

(declare-fun arrayRangesEqSlicedLemma!149 (array!18148 array!18148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20881)

(assert (=> b!299285 (= lt!435135 (arrayRangesEqSlicedLemma!149 a1!948 a2!948 (_1!13136 lt!435138) (_2!13136 lt!435138) (_1!13136 lt!435134) (_2!13136 lt!435134)))))

(declare-fun arrayRangesEq!1539 (array!18148 array!18148 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299285 (arrayRangesEq!1539 a1!948 a2!948 (_1!13136 lt!435134) (_2!13136 lt!435134))))

(assert (= (and start!66948 res!246997) b!299284))

(assert (= (and b!299284 res!246996) b!299283))

(assert (= (and b!299283 res!246995) b!299286))

(assert (= (and b!299286 res!246998) b!299282))

(assert (= (and b!299282 c!13725) b!299285))

(assert (= (and b!299282 (not c!13725)) b!299281))

(declare-fun m!438477 () Bool)

(assert (=> b!299282 m!438477))

(declare-fun m!438479 () Bool)

(assert (=> b!299282 m!438479))

(declare-fun m!438481 () Bool)

(assert (=> b!299283 m!438481))

(declare-fun m!438483 () Bool)

(assert (=> start!66948 m!438483))

(declare-fun m!438485 () Bool)

(assert (=> start!66948 m!438485))

(declare-fun m!438487 () Bool)

(assert (=> b!299285 m!438487))

(declare-fun m!438489 () Bool)

(assert (=> b!299285 m!438489))

(check-sat (not b!299285) (not start!66948) (not b!299282) (not b!299283))
(check-sat)

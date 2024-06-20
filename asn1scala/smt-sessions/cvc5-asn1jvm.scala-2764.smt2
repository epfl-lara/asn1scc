; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66946 () Bool)

(assert start!66946)

(declare-fun b!299263 () Bool)

(declare-fun e!214830 () Bool)

(declare-datatypes ((tuple4!960 0))(
  ( (tuple4!961 (_1!13135 (_ BitVec 32)) (_2!13135 (_ BitVec 32)) (_3!1437 (_ BitVec 32)) (_4!480 (_ BitVec 32))) )
))
(declare-fun lt!435119 () tuple4!960)

(declare-fun lt!435115 () (_ BitVec 32))

(assert (=> b!299263 (= e!214830 (and (not (= (_3!1437 lt!435119) (_4!480 lt!435119))) (or (bvsgt #b00000000000000000000000000000000 lt!435115) (bvsgt lt!435115 #b00000000000000000000000000000111))))))

(declare-datatypes ((Unit!20878 0))(
  ( (Unit!20879) )
))
(declare-fun lt!435117 () Unit!20878)

(declare-fun e!214826 () Unit!20878)

(assert (=> b!299263 (= lt!435117 e!214826)))

(declare-fun c!13722 () Bool)

(declare-fun lt!435120 () tuple4!960)

(assert (=> b!299263 (= c!13722 (bvslt (_1!13135 lt!435120) (_2!13135 lt!435120)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!960)

(assert (=> b!299263 (= lt!435120 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!299263 (= lt!435115 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299263 (= lt!435119 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!246983 () Bool)

(declare-fun e!214829 () Bool)

(assert (=> start!66946 (=> (not res!246983) (not e!214829))))

(declare-datatypes ((array!18146 0))(
  ( (array!18147 (arr!8959 (Array (_ BitVec 32) (_ BitVec 8))) (size!7876 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18146)

(declare-fun a2!948 () array!18146)

(assert (=> start!66946 (= res!246983 (and (bvsle (size!7876 a1!948) (size!7876 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66946 e!214829))

(assert (=> start!66946 true))

(declare-fun array_inv!7488 (array!18146) Bool)

(assert (=> start!66946 (array_inv!7488 a1!948)))

(assert (=> start!66946 (array_inv!7488 a2!948)))

(declare-fun b!299264 () Bool)

(declare-fun res!246984 () Bool)

(assert (=> b!299264 (=> (not res!246984) (not e!214830))))

(declare-fun lt!435116 () (_ BitVec 64))

(assert (=> b!299264 (= res!246984 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435116) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299265 () Bool)

(declare-fun Unit!20880 () Unit!20878)

(assert (=> b!299265 (= e!214826 Unit!20880)))

(declare-fun b!299266 () Bool)

(declare-fun lt!435118 () Unit!20878)

(assert (=> b!299266 (= e!214826 lt!435118)))

(declare-fun arrayRangesEqSlicedLemma!148 (array!18146 array!18146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20878)

(assert (=> b!299266 (= lt!435118 (arrayRangesEqSlicedLemma!148 a1!948 a2!948 (_1!13135 lt!435119) (_2!13135 lt!435119) (_1!13135 lt!435120) (_2!13135 lt!435120)))))

(declare-fun arrayRangesEq!1538 (array!18146 array!18146 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299266 (arrayRangesEq!1538 a1!948 a2!948 (_1!13135 lt!435120) (_2!13135 lt!435120))))

(declare-fun b!299267 () Bool)

(assert (=> b!299267 (= e!214829 e!214830)))

(declare-fun res!246986 () Bool)

(assert (=> b!299267 (=> (not res!246986) (not e!214830))))

(assert (=> b!299267 (= res!246986 (and (bvsle toBit!258 lt!435116) (bvsle fromBit!258 lt!435116)))))

(assert (=> b!299267 (= lt!435116 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7876 a1!948))))))

(declare-fun b!299268 () Bool)

(declare-fun res!246985 () Bool)

(assert (=> b!299268 (=> (not res!246985) (not e!214830))))

(declare-fun arrayBitRangesEq!0 (array!18146 array!18146 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299268 (= res!246985 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!66946 res!246983) b!299267))

(assert (= (and b!299267 res!246986) b!299268))

(assert (= (and b!299268 res!246985) b!299264))

(assert (= (and b!299264 res!246984) b!299263))

(assert (= (and b!299263 c!13722) b!299266))

(assert (= (and b!299263 (not c!13722)) b!299265))

(declare-fun m!438463 () Bool)

(assert (=> b!299263 m!438463))

(declare-fun m!438465 () Bool)

(assert (=> b!299263 m!438465))

(declare-fun m!438467 () Bool)

(assert (=> start!66946 m!438467))

(declare-fun m!438469 () Bool)

(assert (=> start!66946 m!438469))

(declare-fun m!438471 () Bool)

(assert (=> b!299266 m!438471))

(declare-fun m!438473 () Bool)

(assert (=> b!299266 m!438473))

(declare-fun m!438475 () Bool)

(assert (=> b!299268 m!438475))

(push 1)

(assert (not b!299263))

(assert (not b!299268))

(assert (not b!299266))

(assert (not start!66946))

(check-sat)

(pop 1)

(push 1)

(check-sat)


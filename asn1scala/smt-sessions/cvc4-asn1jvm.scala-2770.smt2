; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66986 () Bool)

(assert start!66986)

(declare-fun res!247243 () Bool)

(declare-fun e!215136 () Bool)

(assert (=> start!66986 (=> (not res!247243) (not e!215136))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18186 0))(
  ( (array!18187 (arr!8979 (Array (_ BitVec 32) (_ BitVec 8))) (size!7896 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18186)

(declare-fun a2!948 () array!18186)

(assert (=> start!66986 (= res!247243 (and (bvsle (size!7896 a1!948) (size!7896 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66986 e!215136))

(assert (=> start!66986 true))

(declare-fun array_inv!7508 (array!18186) Bool)

(assert (=> start!66986 (array_inv!7508 a1!948)))

(assert (=> start!66986 (array_inv!7508 a2!948)))

(declare-fun b!299641 () Bool)

(declare-datatypes ((Unit!20938 0))(
  ( (Unit!20939) )
))
(declare-fun e!215138 () Unit!20938)

(declare-fun lt!435432 () Unit!20938)

(assert (=> b!299641 (= e!215138 lt!435432)))

(declare-datatypes ((tuple4!1000 0))(
  ( (tuple4!1001 (_1!13155 (_ BitVec 32)) (_2!13155 (_ BitVec 32)) (_3!1457 (_ BitVec 32)) (_4!500 (_ BitVec 32))) )
))
(declare-fun lt!435433 () tuple4!1000)

(declare-fun lt!435434 () tuple4!1000)

(declare-fun arrayRangesEqSlicedLemma!168 (array!18186 array!18186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20938)

(assert (=> b!299641 (= lt!435432 (arrayRangesEqSlicedLemma!168 a1!948 a2!948 (_1!13155 lt!435433) (_2!13155 lt!435433) (_1!13155 lt!435434) (_2!13155 lt!435434)))))

(declare-fun arrayRangesEq!1558 (array!18186 array!18186 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299641 (arrayRangesEq!1558 a1!948 a2!948 (_1!13155 lt!435434) (_2!13155 lt!435434))))

(declare-fun b!299642 () Bool)

(declare-fun e!215137 () Bool)

(assert (=> b!299642 (= e!215137 false)))

(declare-fun lt!435431 () Unit!20938)

(assert (=> b!299642 (= lt!435431 e!215138)))

(declare-fun c!13782 () Bool)

(assert (=> b!299642 (= c!13782 (bvslt (_1!13155 lt!435434) (_2!13155 lt!435434)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1000)

(assert (=> b!299642 (= lt!435434 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299642 (= lt!435433 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299643 () Bool)

(declare-fun Unit!20940 () Unit!20938)

(assert (=> b!299643 (= e!215138 Unit!20940)))

(declare-fun b!299644 () Bool)

(declare-fun res!247241 () Bool)

(assert (=> b!299644 (=> (not res!247241) (not e!215137))))

(declare-fun lt!435435 () (_ BitVec 64))

(assert (=> b!299644 (= res!247241 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435435) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299645 () Bool)

(declare-fun res!247242 () Bool)

(assert (=> b!299645 (=> (not res!247242) (not e!215137))))

(declare-fun arrayBitRangesEq!0 (array!18186 array!18186 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299645 (= res!247242 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299646 () Bool)

(assert (=> b!299646 (= e!215136 e!215137)))

(declare-fun res!247244 () Bool)

(assert (=> b!299646 (=> (not res!247244) (not e!215137))))

(assert (=> b!299646 (= res!247244 (and (bvsle toBit!258 lt!435435) (bvsle fromBit!258 lt!435435)))))

(assert (=> b!299646 (= lt!435435 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7896 a1!948))))))

(assert (= (and start!66986 res!247243) b!299646))

(assert (= (and b!299646 res!247244) b!299645))

(assert (= (and b!299645 res!247242) b!299644))

(assert (= (and b!299644 res!247241) b!299642))

(assert (= (and b!299642 c!13782) b!299641))

(assert (= (and b!299642 (not c!13782)) b!299643))

(declare-fun m!438761 () Bool)

(assert (=> start!66986 m!438761))

(declare-fun m!438763 () Bool)

(assert (=> start!66986 m!438763))

(declare-fun m!438765 () Bool)

(assert (=> b!299641 m!438765))

(declare-fun m!438767 () Bool)

(assert (=> b!299641 m!438767))

(declare-fun m!438769 () Bool)

(assert (=> b!299642 m!438769))

(declare-fun m!438771 () Bool)

(assert (=> b!299642 m!438771))

(declare-fun m!438773 () Bool)

(assert (=> b!299645 m!438773))

(push 1)


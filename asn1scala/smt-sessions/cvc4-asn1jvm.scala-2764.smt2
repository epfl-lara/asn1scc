; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66950 () Bool)

(assert start!66950)

(declare-fun b!299299 () Bool)

(declare-datatypes ((Unit!20884 0))(
  ( (Unit!20885) )
))
(declare-fun e!214859 () Unit!20884)

(declare-fun lt!435151 () Unit!20884)

(assert (=> b!299299 (= e!214859 lt!435151)))

(declare-datatypes ((array!18150 0))(
  ( (array!18151 (arr!8961 (Array (_ BitVec 32) (_ BitVec 8))) (size!7878 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18150)

(declare-fun a2!948 () array!18150)

(declare-datatypes ((tuple4!964 0))(
  ( (tuple4!965 (_1!13137 (_ BitVec 32)) (_2!13137 (_ BitVec 32)) (_3!1439 (_ BitVec 32)) (_4!482 (_ BitVec 32))) )
))
(declare-fun lt!435155 () tuple4!964)

(declare-fun lt!435153 () tuple4!964)

(declare-fun arrayRangesEqSlicedLemma!150 (array!18150 array!18150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20884)

(assert (=> b!299299 (= lt!435151 (arrayRangesEqSlicedLemma!150 a1!948 a2!948 (_1!13137 lt!435155) (_2!13137 lt!435155) (_1!13137 lt!435153) (_2!13137 lt!435153)))))

(declare-fun arrayRangesEq!1540 (array!18150 array!18150 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299299 (arrayRangesEq!1540 a1!948 a2!948 (_1!13137 lt!435153) (_2!13137 lt!435153))))

(declare-fun b!299300 () Bool)

(declare-fun res!247009 () Bool)

(declare-fun e!214858 () Bool)

(assert (=> b!299300 (=> (not res!247009) (not e!214858))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435154 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299300 (= res!247009 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435154) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299301 () Bool)

(declare-fun Unit!20886 () Unit!20884)

(assert (=> b!299301 (= e!214859 Unit!20886)))

(declare-fun b!299302 () Bool)

(declare-fun e!214857 () Bool)

(assert (=> b!299302 (= e!214857 e!214858)))

(declare-fun res!247010 () Bool)

(assert (=> b!299302 (=> (not res!247010) (not e!214858))))

(assert (=> b!299302 (= res!247010 (and (bvsle toBit!258 lt!435154) (bvsle fromBit!258 lt!435154)))))

(assert (=> b!299302 (= lt!435154 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7878 a1!948))))))

(declare-fun b!299303 () Bool)

(declare-fun res!247008 () Bool)

(assert (=> b!299303 (=> (not res!247008) (not e!214858))))

(declare-fun arrayBitRangesEq!0 (array!18150 array!18150 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299303 (= res!247008 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299304 () Bool)

(declare-fun lt!435156 () (_ BitVec 32))

(assert (=> b!299304 (= e!214858 (and (not (= (_3!1439 lt!435155) (_4!482 lt!435155))) (or (bvsgt #b00000000000000000000000000000000 lt!435156) (bvsgt lt!435156 #b00000000000000000000000000000111))))))

(declare-fun lt!435152 () Unit!20884)

(assert (=> b!299304 (= lt!435152 e!214859)))

(declare-fun c!13728 () Bool)

(assert (=> b!299304 (= c!13728 (bvslt (_1!13137 lt!435153) (_2!13137 lt!435153)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!964)

(assert (=> b!299304 (= lt!435153 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299304 (= lt!435156 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299304 (= lt!435155 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!247007 () Bool)

(assert (=> start!66950 (=> (not res!247007) (not e!214857))))

(assert (=> start!66950 (= res!247007 (and (bvsle (size!7878 a1!948) (size!7878 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66950 e!214857))

(assert (=> start!66950 true))

(declare-fun array_inv!7490 (array!18150) Bool)

(assert (=> start!66950 (array_inv!7490 a1!948)))

(assert (=> start!66950 (array_inv!7490 a2!948)))

(assert (= (and start!66950 res!247007) b!299302))

(assert (= (and b!299302 res!247010) b!299303))

(assert (= (and b!299303 res!247008) b!299300))

(assert (= (and b!299300 res!247009) b!299304))

(assert (= (and b!299304 c!13728) b!299299))

(assert (= (and b!299304 (not c!13728)) b!299301))

(declare-fun m!438491 () Bool)

(assert (=> b!299299 m!438491))

(declare-fun m!438493 () Bool)

(assert (=> b!299299 m!438493))

(declare-fun m!438495 () Bool)

(assert (=> b!299303 m!438495))

(declare-fun m!438497 () Bool)

(assert (=> b!299304 m!438497))

(declare-fun m!438499 () Bool)

(assert (=> b!299304 m!438499))

(declare-fun m!438501 () Bool)

(assert (=> start!66950 m!438501))

(declare-fun m!438503 () Bool)

(assert (=> start!66950 m!438503))

(push 1)

(assert (not start!66950))

(assert (not b!299303))


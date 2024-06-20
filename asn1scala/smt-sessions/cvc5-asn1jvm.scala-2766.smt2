; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66958 () Bool)

(assert start!66958)

(declare-fun b!299390 () Bool)

(declare-fun res!247074 () Bool)

(declare-fun e!214928 () Bool)

(assert (=> b!299390 (=> (not res!247074) (not e!214928))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435224 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299390 (= res!247074 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435224) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299391 () Bool)

(declare-fun res!247076 () Bool)

(assert (=> b!299391 (=> (not res!247076) (not e!214928))))

(declare-datatypes ((array!18158 0))(
  ( (array!18159 (arr!8965 (Array (_ BitVec 32) (_ BitVec 8))) (size!7882 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18158)

(declare-fun a2!948 () array!18158)

(declare-fun arrayBitRangesEq!0 (array!18158 array!18158 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299391 (= res!247076 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299392 () Bool)

(assert (=> b!299392 (= e!214928 false)))

(declare-datatypes ((Unit!20896 0))(
  ( (Unit!20897) )
))
(declare-fun lt!435221 () Unit!20896)

(declare-fun e!214927 () Unit!20896)

(assert (=> b!299392 (= lt!435221 e!214927)))

(declare-fun c!13740 () Bool)

(declare-datatypes ((tuple4!972 0))(
  ( (tuple4!973 (_1!13141 (_ BitVec 32)) (_2!13141 (_ BitVec 32)) (_3!1443 (_ BitVec 32)) (_4!486 (_ BitVec 32))) )
))
(declare-fun lt!435225 () tuple4!972)

(assert (=> b!299392 (= c!13740 (bvslt (_1!13141 lt!435225) (_2!13141 lt!435225)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!972)

(assert (=> b!299392 (= lt!435225 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435223 () tuple4!972)

(assert (=> b!299392 (= lt!435223 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299393 () Bool)

(declare-fun Unit!20898 () Unit!20896)

(assert (=> b!299393 (= e!214927 Unit!20898)))

(declare-fun b!299394 () Bool)

(declare-fun e!214926 () Bool)

(assert (=> b!299394 (= e!214926 e!214928)))

(declare-fun res!247075 () Bool)

(assert (=> b!299394 (=> (not res!247075) (not e!214928))))

(assert (=> b!299394 (= res!247075 (and (bvsle toBit!258 lt!435224) (bvsle fromBit!258 lt!435224)))))

(assert (=> b!299394 (= lt!435224 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7882 a1!948))))))

(declare-fun b!299389 () Bool)

(declare-fun lt!435222 () Unit!20896)

(assert (=> b!299389 (= e!214927 lt!435222)))

(declare-fun arrayRangesEqSlicedLemma!154 (array!18158 array!18158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20896)

(assert (=> b!299389 (= lt!435222 (arrayRangesEqSlicedLemma!154 a1!948 a2!948 (_1!13141 lt!435223) (_2!13141 lt!435223) (_1!13141 lt!435225) (_2!13141 lt!435225)))))

(declare-fun arrayRangesEq!1544 (array!18158 array!18158 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299389 (arrayRangesEq!1544 a1!948 a2!948 (_1!13141 lt!435225) (_2!13141 lt!435225))))

(declare-fun res!247073 () Bool)

(assert (=> start!66958 (=> (not res!247073) (not e!214926))))

(assert (=> start!66958 (= res!247073 (and (bvsle (size!7882 a1!948) (size!7882 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66958 e!214926))

(assert (=> start!66958 true))

(declare-fun array_inv!7494 (array!18158) Bool)

(assert (=> start!66958 (array_inv!7494 a1!948)))

(assert (=> start!66958 (array_inv!7494 a2!948)))

(assert (= (and start!66958 res!247073) b!299394))

(assert (= (and b!299394 res!247075) b!299391))

(assert (= (and b!299391 res!247076) b!299390))

(assert (= (and b!299390 res!247074) b!299392))

(assert (= (and b!299392 c!13740) b!299389))

(assert (= (and b!299392 (not c!13740)) b!299393))

(declare-fun m!438565 () Bool)

(assert (=> b!299391 m!438565))

(declare-fun m!438567 () Bool)

(assert (=> b!299392 m!438567))

(declare-fun m!438569 () Bool)

(assert (=> b!299392 m!438569))

(declare-fun m!438571 () Bool)

(assert (=> b!299389 m!438571))

(declare-fun m!438573 () Bool)

(assert (=> b!299389 m!438573))

(declare-fun m!438575 () Bool)

(assert (=> start!66958 m!438575))

(declare-fun m!438577 () Bool)

(assert (=> start!66958 m!438577))

(push 1)

(assert (not b!299391))

(assert (not b!299392))

(assert (not start!66958))

(assert (not b!299389))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


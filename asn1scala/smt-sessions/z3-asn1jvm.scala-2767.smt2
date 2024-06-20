; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66966 () Bool)

(assert start!66966)

(declare-fun b!299461 () Bool)

(declare-fun e!214985 () Bool)

(assert (=> b!299461 (= e!214985 false)))

(declare-datatypes ((Unit!20908 0))(
  ( (Unit!20909) )
))
(declare-fun lt!435285 () Unit!20908)

(declare-fun e!214988 () Unit!20908)

(assert (=> b!299461 (= lt!435285 e!214988)))

(declare-fun c!13752 () Bool)

(declare-datatypes ((tuple4!980 0))(
  ( (tuple4!981 (_1!13145 (_ BitVec 32)) (_2!13145 (_ BitVec 32)) (_3!1447 (_ BitVec 32)) (_4!490 (_ BitVec 32))) )
))
(declare-fun lt!435281 () tuple4!980)

(assert (=> b!299461 (= c!13752 (bvslt (_1!13145 lt!435281) (_2!13145 lt!435281)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!980)

(assert (=> b!299461 (= lt!435281 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435284 () tuple4!980)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299461 (= lt!435284 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299462 () Bool)

(declare-fun e!214989 () Bool)

(assert (=> b!299462 (= e!214989 e!214985)))

(declare-fun res!247121 () Bool)

(assert (=> b!299462 (=> (not res!247121) (not e!214985))))

(declare-fun lt!435282 () (_ BitVec 64))

(assert (=> b!299462 (= res!247121 (and (bvsle toBit!258 lt!435282) (bvsle fromBit!258 lt!435282)))))

(declare-datatypes ((array!18166 0))(
  ( (array!18167 (arr!8969 (Array (_ BitVec 32) (_ BitVec 8))) (size!7886 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18166)

(assert (=> b!299462 (= lt!435282 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7886 a1!948))))))

(declare-fun res!247122 () Bool)

(assert (=> start!66966 (=> (not res!247122) (not e!214989))))

(declare-fun a2!948 () array!18166)

(assert (=> start!66966 (= res!247122 (and (bvsle (size!7886 a1!948) (size!7886 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66966 e!214989))

(assert (=> start!66966 true))

(declare-fun array_inv!7498 (array!18166) Bool)

(assert (=> start!66966 (array_inv!7498 a1!948)))

(assert (=> start!66966 (array_inv!7498 a2!948)))

(declare-fun b!299463 () Bool)

(declare-fun lt!435283 () Unit!20908)

(assert (=> b!299463 (= e!214988 lt!435283)))

(declare-fun arrayRangesEqSlicedLemma!158 (array!18166 array!18166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20908)

(assert (=> b!299463 (= lt!435283 (arrayRangesEqSlicedLemma!158 a1!948 a2!948 (_1!13145 lt!435284) (_2!13145 lt!435284) (_1!13145 lt!435281) (_2!13145 lt!435281)))))

(declare-fun arrayRangesEq!1548 (array!18166 array!18166 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299463 (arrayRangesEq!1548 a1!948 a2!948 (_1!13145 lt!435281) (_2!13145 lt!435281))))

(declare-fun b!299464 () Bool)

(declare-fun res!247124 () Bool)

(assert (=> b!299464 (=> (not res!247124) (not e!214985))))

(declare-fun arrayBitRangesEq!0 (array!18166 array!18166 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299464 (= res!247124 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299465 () Bool)

(declare-fun res!247123 () Bool)

(assert (=> b!299465 (=> (not res!247123) (not e!214985))))

(assert (=> b!299465 (= res!247123 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435282) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299466 () Bool)

(declare-fun Unit!20910 () Unit!20908)

(assert (=> b!299466 (= e!214988 Unit!20910)))

(assert (= (and start!66966 res!247122) b!299462))

(assert (= (and b!299462 res!247121) b!299464))

(assert (= (and b!299464 res!247124) b!299465))

(assert (= (and b!299465 res!247123) b!299461))

(assert (= (and b!299461 c!13752) b!299463))

(assert (= (and b!299461 (not c!13752)) b!299466))

(declare-fun m!438621 () Bool)

(assert (=> b!299461 m!438621))

(declare-fun m!438623 () Bool)

(assert (=> b!299461 m!438623))

(declare-fun m!438625 () Bool)

(assert (=> start!66966 m!438625))

(declare-fun m!438627 () Bool)

(assert (=> start!66966 m!438627))

(declare-fun m!438629 () Bool)

(assert (=> b!299463 m!438629))

(declare-fun m!438631 () Bool)

(assert (=> b!299463 m!438631))

(declare-fun m!438633 () Bool)

(assert (=> b!299464 m!438633))

(check-sat (not b!299463) (not b!299464) (not start!66966) (not b!299461))

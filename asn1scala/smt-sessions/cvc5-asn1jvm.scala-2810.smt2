; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67746 () Bool)

(assert start!67746)

(declare-fun b!304022 () Bool)

(declare-datatypes ((Unit!21223 0))(
  ( (Unit!21224) )
))
(declare-fun e!218819 () Unit!21223)

(declare-fun lt!438116 () Unit!21223)

(assert (=> b!304022 (= e!218819 lt!438116)))

(declare-datatypes ((tuple4!1170 0))(
  ( (tuple4!1171 (_1!13240 (_ BitVec 32)) (_2!13240 (_ BitVec 32)) (_3!1542 (_ BitVec 32)) (_4!585 (_ BitVec 32))) )
))
(declare-fun lt!438115 () tuple4!1170)

(declare-datatypes ((array!18473 0))(
  ( (array!18474 (arr!9097 (Array (_ BitVec 32) (_ BitVec 8))) (size!8014 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18473)

(declare-fun a2!948 () array!18473)

(declare-fun lt!438113 () tuple4!1170)

(declare-fun arrayRangesEqSlicedLemma!238 (array!18473 array!18473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21223)

(assert (=> b!304022 (= lt!438116 (arrayRangesEqSlicedLemma!238 a1!948 a2!948 (_1!13240 lt!438113) (_2!13240 lt!438113) (_1!13240 lt!438115) (_2!13240 lt!438115)))))

(declare-fun arrayRangesEq!1643 (array!18473 array!18473 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304022 (arrayRangesEq!1643 a1!948 a2!948 (_1!13240 lt!438115) (_2!13240 lt!438115))))

(declare-fun b!304023 () Bool)

(declare-fun e!218821 () Bool)

(declare-fun e!218820 () Bool)

(assert (=> b!304023 (= e!218821 e!218820)))

(declare-fun res!250137 () Bool)

(assert (=> b!304023 (=> (not res!250137) (not e!218820))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438114 () (_ BitVec 64))

(assert (=> b!304023 (= res!250137 (and (bvsle toBit!258 lt!438114) (bvsle fromBit!258 lt!438114)))))

(assert (=> b!304023 (= lt!438114 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8014 a1!948))))))

(declare-fun b!304024 () Bool)

(declare-fun res!250135 () Bool)

(assert (=> b!304024 (=> (not res!250135) (not e!218820))))

(declare-fun arrayBitRangesEq!0 (array!18473 array!18473 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304024 (= res!250135 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304025 () Bool)

(assert (=> b!304025 (= e!218820 false)))

(declare-fun lt!438117 () Unit!21223)

(assert (=> b!304025 (= lt!438117 e!218819)))

(declare-fun c!14526 () Bool)

(assert (=> b!304025 (= c!14526 (bvslt (_1!13240 lt!438115) (_2!13240 lt!438115)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1170)

(assert (=> b!304025 (= lt!438115 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304025 (= lt!438113 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!250134 () Bool)

(assert (=> start!67746 (=> (not res!250134) (not e!218821))))

(assert (=> start!67746 (= res!250134 (and (bvsle (size!8014 a1!948) (size!8014 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67746 e!218821))

(assert (=> start!67746 true))

(declare-fun array_inv!7626 (array!18473) Bool)

(assert (=> start!67746 (array_inv!7626 a1!948)))

(assert (=> start!67746 (array_inv!7626 a2!948)))

(declare-fun b!304026 () Bool)

(declare-fun res!250136 () Bool)

(assert (=> b!304026 (=> (not res!250136) (not e!218820))))

(assert (=> b!304026 (= res!250136 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438114) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304027 () Bool)

(declare-fun Unit!21225 () Unit!21223)

(assert (=> b!304027 (= e!218819 Unit!21225)))

(assert (= (and start!67746 res!250134) b!304023))

(assert (= (and b!304023 res!250137) b!304024))

(assert (= (and b!304024 res!250135) b!304026))

(assert (= (and b!304026 res!250136) b!304025))

(assert (= (and b!304025 c!14526) b!304022))

(assert (= (and b!304025 (not c!14526)) b!304027))

(declare-fun m!442569 () Bool)

(assert (=> b!304022 m!442569))

(declare-fun m!442571 () Bool)

(assert (=> b!304022 m!442571))

(declare-fun m!442573 () Bool)

(assert (=> b!304024 m!442573))

(declare-fun m!442575 () Bool)

(assert (=> b!304025 m!442575))

(declare-fun m!442577 () Bool)

(assert (=> b!304025 m!442577))

(declare-fun m!442579 () Bool)

(assert (=> start!67746 m!442579))

(declare-fun m!442581 () Bool)

(assert (=> start!67746 m!442581))

(push 1)

(assert (not b!304025))

(assert (not b!304022))

(assert (not start!67746))

(assert (not b!304024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


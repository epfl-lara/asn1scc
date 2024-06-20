; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66984 () Bool)

(assert start!66984)

(declare-fun b!299623 () Bool)

(declare-fun res!247230 () Bool)

(declare-fun e!215121 () Bool)

(assert (=> b!299623 (=> (not res!247230) (not e!215121))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435418 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299623 (= res!247230 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435418) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299624 () Bool)

(declare-datatypes ((Unit!20935 0))(
  ( (Unit!20936) )
))
(declare-fun e!215123 () Unit!20935)

(declare-fun lt!435420 () Unit!20935)

(assert (=> b!299624 (= e!215123 lt!435420)))

(declare-datatypes ((tuple4!998 0))(
  ( (tuple4!999 (_1!13154 (_ BitVec 32)) (_2!13154 (_ BitVec 32)) (_3!1456 (_ BitVec 32)) (_4!499 (_ BitVec 32))) )
))
(declare-fun lt!435416 () tuple4!998)

(declare-datatypes ((array!18184 0))(
  ( (array!18185 (arr!8978 (Array (_ BitVec 32) (_ BitVec 8))) (size!7895 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18184)

(declare-fun a2!948 () array!18184)

(declare-fun lt!435417 () tuple4!998)

(declare-fun arrayRangesEqSlicedLemma!167 (array!18184 array!18184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20935)

(assert (=> b!299624 (= lt!435420 (arrayRangesEqSlicedLemma!167 a1!948 a2!948 (_1!13154 lt!435417) (_2!13154 lt!435417) (_1!13154 lt!435416) (_2!13154 lt!435416)))))

(declare-fun arrayRangesEq!1557 (array!18184 array!18184 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299624 (arrayRangesEq!1557 a1!948 a2!948 (_1!13154 lt!435416) (_2!13154 lt!435416))))

(declare-fun b!299625 () Bool)

(declare-fun Unit!20937 () Unit!20935)

(assert (=> b!299625 (= e!215123 Unit!20937)))

(declare-fun b!299626 () Bool)

(assert (=> b!299626 (= e!215121 false)))

(declare-fun lt!435419 () Unit!20935)

(assert (=> b!299626 (= lt!435419 e!215123)))

(declare-fun c!13779 () Bool)

(assert (=> b!299626 (= c!13779 (bvslt (_1!13154 lt!435416) (_2!13154 lt!435416)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!998)

(assert (=> b!299626 (= lt!435416 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299626 (= lt!435417 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!247231 () Bool)

(declare-fun e!215120 () Bool)

(assert (=> start!66984 (=> (not res!247231) (not e!215120))))

(assert (=> start!66984 (= res!247231 (and (bvsle (size!7895 a1!948) (size!7895 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66984 e!215120))

(assert (=> start!66984 true))

(declare-fun array_inv!7507 (array!18184) Bool)

(assert (=> start!66984 (array_inv!7507 a1!948)))

(assert (=> start!66984 (array_inv!7507 a2!948)))

(declare-fun b!299627 () Bool)

(declare-fun res!247232 () Bool)

(assert (=> b!299627 (=> (not res!247232) (not e!215121))))

(declare-fun arrayBitRangesEq!0 (array!18184 array!18184 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299627 (= res!247232 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299628 () Bool)

(assert (=> b!299628 (= e!215120 e!215121)))

(declare-fun res!247229 () Bool)

(assert (=> b!299628 (=> (not res!247229) (not e!215121))))

(assert (=> b!299628 (= res!247229 (and (bvsle toBit!258 lt!435418) (bvsle fromBit!258 lt!435418)))))

(assert (=> b!299628 (= lt!435418 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7895 a1!948))))))

(assert (= (and start!66984 res!247231) b!299628))

(assert (= (and b!299628 res!247229) b!299627))

(assert (= (and b!299627 res!247232) b!299623))

(assert (= (and b!299623 res!247230) b!299626))

(assert (= (and b!299626 c!13779) b!299624))

(assert (= (and b!299626 (not c!13779)) b!299625))

(declare-fun m!438747 () Bool)

(assert (=> b!299624 m!438747))

(declare-fun m!438749 () Bool)

(assert (=> b!299624 m!438749))

(declare-fun m!438751 () Bool)

(assert (=> b!299626 m!438751))

(declare-fun m!438753 () Bool)

(assert (=> b!299626 m!438753))

(declare-fun m!438755 () Bool)

(assert (=> start!66984 m!438755))

(declare-fun m!438757 () Bool)

(assert (=> start!66984 m!438757))

(declare-fun m!438759 () Bool)

(assert (=> b!299627 m!438759))

(check-sat (not b!299624) (not start!66984) (not b!299627) (not b!299626))

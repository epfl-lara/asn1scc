; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66970 () Bool)

(assert start!66970)

(declare-fun b!299497 () Bool)

(declare-fun e!215015 () Bool)

(declare-fun e!215019 () Bool)

(assert (=> b!299497 (= e!215015 e!215019)))

(declare-fun res!247145 () Bool)

(assert (=> b!299497 (=> (not res!247145) (not e!215019))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435312 () (_ BitVec 64))

(assert (=> b!299497 (= res!247145 (and (bvsle toBit!258 lt!435312) (bvsle fromBit!258 lt!435312)))))

(declare-datatypes ((array!18170 0))(
  ( (array!18171 (arr!8971 (Array (_ BitVec 32) (_ BitVec 8))) (size!7888 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18170)

(assert (=> b!299497 (= lt!435312 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7888 a1!948))))))

(declare-fun b!299498 () Bool)

(assert (=> b!299498 (= e!215019 false)))

(declare-datatypes ((Unit!20914 0))(
  ( (Unit!20915) )
))
(declare-fun lt!435314 () Unit!20914)

(declare-fun e!215016 () Unit!20914)

(assert (=> b!299498 (= lt!435314 e!215016)))

(declare-fun c!13758 () Bool)

(declare-datatypes ((tuple4!984 0))(
  ( (tuple4!985 (_1!13147 (_ BitVec 32)) (_2!13147 (_ BitVec 32)) (_3!1449 (_ BitVec 32)) (_4!492 (_ BitVec 32))) )
))
(declare-fun lt!435311 () tuple4!984)

(assert (=> b!299498 (= c!13758 (bvslt (_1!13147 lt!435311) (_2!13147 lt!435311)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!984)

(assert (=> b!299498 (= lt!435311 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435313 () tuple4!984)

(assert (=> b!299498 (= lt!435313 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299499 () Bool)

(declare-fun res!247146 () Bool)

(assert (=> b!299499 (=> (not res!247146) (not e!215019))))

(declare-fun a2!948 () array!18170)

(declare-fun arrayBitRangesEq!0 (array!18170 array!18170 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299499 (= res!247146 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!247148 () Bool)

(assert (=> start!66970 (=> (not res!247148) (not e!215015))))

(assert (=> start!66970 (= res!247148 (and (bvsle (size!7888 a1!948) (size!7888 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66970 e!215015))

(assert (=> start!66970 true))

(declare-fun array_inv!7500 (array!18170) Bool)

(assert (=> start!66970 (array_inv!7500 a1!948)))

(assert (=> start!66970 (array_inv!7500 a2!948)))

(declare-fun b!299500 () Bool)

(declare-fun Unit!20916 () Unit!20914)

(assert (=> b!299500 (= e!215016 Unit!20916)))

(declare-fun b!299501 () Bool)

(declare-fun res!247147 () Bool)

(assert (=> b!299501 (=> (not res!247147) (not e!215019))))

(assert (=> b!299501 (= res!247147 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435312) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299502 () Bool)

(declare-fun lt!435315 () Unit!20914)

(assert (=> b!299502 (= e!215016 lt!435315)))

(declare-fun arrayRangesEqSlicedLemma!160 (array!18170 array!18170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20914)

(assert (=> b!299502 (= lt!435315 (arrayRangesEqSlicedLemma!160 a1!948 a2!948 (_1!13147 lt!435313) (_2!13147 lt!435313) (_1!13147 lt!435311) (_2!13147 lt!435311)))))

(declare-fun arrayRangesEq!1550 (array!18170 array!18170 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299502 (arrayRangesEq!1550 a1!948 a2!948 (_1!13147 lt!435311) (_2!13147 lt!435311))))

(assert (= (and start!66970 res!247148) b!299497))

(assert (= (and b!299497 res!247145) b!299499))

(assert (= (and b!299499 res!247146) b!299501))

(assert (= (and b!299501 res!247147) b!299498))

(assert (= (and b!299498 c!13758) b!299502))

(assert (= (and b!299498 (not c!13758)) b!299500))

(declare-fun m!438649 () Bool)

(assert (=> b!299498 m!438649))

(declare-fun m!438651 () Bool)

(assert (=> b!299498 m!438651))

(declare-fun m!438653 () Bool)

(assert (=> b!299499 m!438653))

(declare-fun m!438655 () Bool)

(assert (=> start!66970 m!438655))

(declare-fun m!438657 () Bool)

(assert (=> start!66970 m!438657))

(declare-fun m!438659 () Bool)

(assert (=> b!299502 m!438659))

(declare-fun m!438661 () Bool)

(assert (=> b!299502 m!438661))

(push 1)

(assert (not b!299502))

(assert (not b!299499))

(assert (not start!66970))

(assert (not b!299498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73748 () Bool)

(assert start!73748)

(declare-fun res!267952 () Bool)

(declare-fun e!235535 () Bool)

(assert (=> start!73748 (=> (not res!267952) (not e!235535))))

(declare-datatypes ((array!21185 0))(
  ( (array!21186 (arr!10287 (Array (_ BitVec 32) (_ BitVec 8))) (size!9195 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21185)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21185)

(assert (=> start!73748 (= res!267952 (and (bvsle (size!9195 a1!688) (size!9195 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9195 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73748 e!235535))

(declare-fun array_inv!8747 (array!21185) Bool)

(assert (=> start!73748 (array_inv!8747 a1!688)))

(assert (=> start!73748 (array_inv!8747 a2!688)))

(assert (=> start!73748 true))

(declare-fun b!326380 () Bool)

(declare-fun e!235536 () Bool)

(assert (=> b!326380 (= e!235535 e!235536)))

(declare-fun res!267953 () Bool)

(assert (=> b!326380 (=> (not res!267953) (not e!235536))))

(declare-fun e!235538 () Bool)

(assert (=> b!326380 (= res!267953 e!235538)))

(declare-fun res!267954 () Bool)

(assert (=> b!326380 (=> res!267954 e!235538)))

(declare-datatypes ((tuple4!1372 0))(
  ( (tuple4!1373 (_1!13527 (_ BitVec 32)) (_2!13527 (_ BitVec 32)) (_3!1643 (_ BitVec 32)) (_4!686 (_ BitVec 32))) )
))
(declare-fun lt!448550 () tuple4!1372)

(assert (=> b!326380 (= res!267954 (bvsge (_1!13527 lt!448550) (_2!13527 lt!448550)))))

(declare-fun lt!448549 () (_ BitVec 32))

(assert (=> b!326380 (= lt!448549 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1372)

(assert (=> b!326380 (= lt!448550 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326381 () Bool)

(declare-fun arrayRangesEq!1834 (array!21185 array!21185 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326381 (= e!235538 (arrayRangesEq!1834 a1!688 a2!688 (_1!13527 lt!448550) (_2!13527 lt!448550)))))

(declare-fun b!326382 () Bool)

(assert (=> b!326382 (= e!235536 (and (not (= (_3!1643 lt!448550) (_4!686 lt!448550))) (or (bvsgt #b00000000000000000000000000000000 lt!448549) (bvsgt lt!448549 #b00000000000000000000000000001000))))))

(assert (= (and start!73748 res!267952) b!326380))

(assert (= (and b!326380 (not res!267954)) b!326381))

(assert (= (and b!326380 res!267953) b!326382))

(declare-fun m!464163 () Bool)

(assert (=> start!73748 m!464163))

(declare-fun m!464165 () Bool)

(assert (=> start!73748 m!464165))

(declare-fun m!464167 () Bool)

(assert (=> b!326380 m!464167))

(declare-fun m!464169 () Bool)

(assert (=> b!326381 m!464169))

(push 1)

(assert (not start!73748))

(assert (not b!326380))

(assert (not b!326381))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62224 () Bool)

(assert start!62224)

(declare-fun b!279097 () Bool)

(declare-fun e!198905 () Bool)

(assert (=> b!279097 (= e!198905 (not true))))

(declare-datatypes ((array!16103 0))(
  ( (array!16104 (arr!7965 (Array (_ BitVec 32) (_ BitVec 8))) (size!6969 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16103)

(declare-fun a2!699 () array!16103)

(declare-datatypes ((tuple4!688 0))(
  ( (tuple4!689 (_1!12419 (_ BitVec 32)) (_2!12419 (_ BitVec 32)) (_3!1124 (_ BitVec 32)) (_4!344 (_ BitVec 32))) )
))
(declare-fun lt!416208 () tuple4!688)

(declare-fun arrayRangesEq!1237 (array!16103 array!16103 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279097 (arrayRangesEq!1237 a1!699 a2!699 (_1!12419 lt!416208) (_2!12419 lt!416208))))

(declare-fun res!231764 () Bool)

(declare-fun e!198903 () Bool)

(assert (=> start!62224 (=> (not res!231764) (not e!198903))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62224 (= res!231764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6969 a1!699) (size!6969 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6969 a1!699))))))))

(assert (=> start!62224 e!198903))

(assert (=> start!62224 true))

(declare-fun array_inv!6693 (array!16103) Bool)

(assert (=> start!62224 (array_inv!6693 a1!699)))

(assert (=> start!62224 (array_inv!6693 a2!699)))

(declare-fun b!279094 () Bool)

(declare-fun res!231763 () Bool)

(assert (=> b!279094 (=> (not res!231763) (not e!198903))))

(declare-fun arrayBitRangesEq!0 (array!16103 array!16103 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279094 (= res!231763 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279095 () Bool)

(declare-fun res!231762 () Bool)

(assert (=> b!279095 (=> (not res!231762) (not e!198903))))

(assert (=> b!279095 (= res!231762 (bvslt from!822 to!789))))

(declare-fun b!279096 () Bool)

(assert (=> b!279096 (= e!198903 e!198905)))

(declare-fun res!231761 () Bool)

(assert (=> b!279096 (=> (not res!231761) (not e!198905))))

(assert (=> b!279096 (= res!231761 (bvslt (_1!12419 lt!416208) (_2!12419 lt!416208)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!688)

(assert (=> b!279096 (= lt!416208 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62224 res!231764) b!279094))

(assert (= (and b!279094 res!231763) b!279095))

(assert (= (and b!279095 res!231762) b!279096))

(assert (= (and b!279096 res!231761) b!279097))

(declare-fun m!412155 () Bool)

(assert (=> b!279097 m!412155))

(declare-fun m!412157 () Bool)

(assert (=> start!62224 m!412157))

(declare-fun m!412159 () Bool)

(assert (=> start!62224 m!412159))

(declare-fun m!412161 () Bool)

(assert (=> b!279094 m!412161))

(declare-fun m!412163 () Bool)

(assert (=> b!279096 m!412163))

(push 1)

(assert (not start!62224))

(assert (not b!279097))

(assert (not b!279096))

(assert (not b!279094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


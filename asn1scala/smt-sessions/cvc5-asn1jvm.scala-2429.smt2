; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61900 () Bool)

(assert start!61900)

(declare-fun b!277429 () Bool)

(declare-fun res!230420 () Bool)

(declare-fun e!197383 () Bool)

(assert (=> b!277429 (=> (not res!230420) (not e!197383))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277429 (= res!230420 (bvslt from!822 to!789))))

(declare-fun b!277428 () Bool)

(declare-fun res!230422 () Bool)

(assert (=> b!277428 (=> (not res!230422) (not e!197383))))

(declare-datatypes ((array!15931 0))(
  ( (array!15932 (arr!7888 (Array (_ BitVec 32) (_ BitVec 8))) (size!6892 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15931)

(declare-fun a2!699 () array!15931)

(declare-fun arrayBitRangesEq!0 (array!15931 array!15931 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277428 (= res!230422 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!230421 () Bool)

(assert (=> start!61900 (=> (not res!230421) (not e!197383))))

(assert (=> start!61900 (= res!230421 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6892 a1!699) (size!6892 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6892 a1!699))))))))

(assert (=> start!61900 e!197383))

(assert (=> start!61900 true))

(declare-fun array_inv!6616 (array!15931) Bool)

(assert (=> start!61900 (array_inv!6616 a1!699)))

(assert (=> start!61900 (array_inv!6616 a2!699)))

(declare-fun b!277430 () Bool)

(declare-fun e!197381 () Bool)

(assert (=> b!277430 (= e!197383 e!197381)))

(declare-fun res!230419 () Bool)

(assert (=> b!277430 (=> (not res!230419) (not e!197381))))

(declare-datatypes ((tuple4!570 0))(
  ( (tuple4!571 (_1!12360 (_ BitVec 32)) (_2!12360 (_ BitVec 32)) (_3!1065 (_ BitVec 32)) (_4!285 (_ BitVec 32))) )
))
(declare-fun lt!415413 () tuple4!570)

(assert (=> b!277430 (= res!230419 (bvslt (_1!12360 lt!415413) (_2!12360 lt!415413)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!570)

(assert (=> b!277430 (= lt!415413 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277431 () Bool)

(assert (=> b!277431 (= e!197381 (not true))))

(declare-fun arrayRangesEq!1178 (array!15931 array!15931 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277431 (arrayRangesEq!1178 a1!699 a2!699 (_1!12360 lt!415413) (_2!12360 lt!415413))))

(assert (= (and start!61900 res!230421) b!277428))

(assert (= (and b!277428 res!230422) b!277429))

(assert (= (and b!277429 res!230420) b!277430))

(assert (= (and b!277430 res!230419) b!277431))

(declare-fun m!410579 () Bool)

(assert (=> b!277428 m!410579))

(declare-fun m!410581 () Bool)

(assert (=> start!61900 m!410581))

(declare-fun m!410583 () Bool)

(assert (=> start!61900 m!410583))

(declare-fun m!410585 () Bool)

(assert (=> b!277430 m!410585))

(declare-fun m!410587 () Bool)

(assert (=> b!277431 m!410587))

(push 1)

(assert (not b!277431))

(assert (not b!277430))

(assert (not start!61900))

(assert (not b!277428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


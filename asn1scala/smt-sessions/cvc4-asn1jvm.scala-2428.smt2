; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61898 () Bool)

(assert start!61898)

(declare-fun b!277417 () Bool)

(declare-fun res!230408 () Bool)

(declare-fun e!197369 () Bool)

(assert (=> b!277417 (=> (not res!230408) (not e!197369))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277417 (= res!230408 (bvslt from!822 to!789))))

(declare-fun b!277418 () Bool)

(declare-fun e!197371 () Bool)

(assert (=> b!277418 (= e!197369 e!197371)))

(declare-fun res!230409 () Bool)

(assert (=> b!277418 (=> (not res!230409) (not e!197371))))

(declare-datatypes ((tuple4!568 0))(
  ( (tuple4!569 (_1!12359 (_ BitVec 32)) (_2!12359 (_ BitVec 32)) (_3!1064 (_ BitVec 32)) (_4!284 (_ BitVec 32))) )
))
(declare-fun lt!415410 () tuple4!568)

(assert (=> b!277418 (= res!230409 (bvslt (_1!12359 lt!415410) (_2!12359 lt!415410)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!568)

(assert (=> b!277418 (= lt!415410 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277416 () Bool)

(declare-fun res!230410 () Bool)

(assert (=> b!277416 (=> (not res!230410) (not e!197369))))

(declare-datatypes ((array!15929 0))(
  ( (array!15930 (arr!7887 (Array (_ BitVec 32) (_ BitVec 8))) (size!6891 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15929)

(declare-fun a2!699 () array!15929)

(declare-fun arrayBitRangesEq!0 (array!15929 array!15929 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277416 (= res!230410 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!230407 () Bool)

(assert (=> start!61898 (=> (not res!230407) (not e!197369))))

(assert (=> start!61898 (= res!230407 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6891 a1!699) (size!6891 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6891 a1!699))))))))

(assert (=> start!61898 e!197369))

(assert (=> start!61898 true))

(declare-fun array_inv!6615 (array!15929) Bool)

(assert (=> start!61898 (array_inv!6615 a1!699)))

(assert (=> start!61898 (array_inv!6615 a2!699)))

(declare-fun b!277419 () Bool)

(assert (=> b!277419 (= e!197371 (not true))))

(declare-fun arrayRangesEq!1177 (array!15929 array!15929 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277419 (arrayRangesEq!1177 a1!699 a2!699 (_1!12359 lt!415410) (_2!12359 lt!415410))))

(assert (= (and start!61898 res!230407) b!277416))

(assert (= (and b!277416 res!230410) b!277417))

(assert (= (and b!277417 res!230408) b!277418))

(assert (= (and b!277418 res!230409) b!277419))

(declare-fun m!410569 () Bool)

(assert (=> b!277418 m!410569))

(declare-fun m!410571 () Bool)

(assert (=> b!277416 m!410571))

(declare-fun m!410573 () Bool)

(assert (=> start!61898 m!410573))

(declare-fun m!410575 () Bool)

(assert (=> start!61898 m!410575))

(declare-fun m!410577 () Bool)

(assert (=> b!277419 m!410577))

(push 1)

(assert (not b!277416))

(assert (not b!277419))


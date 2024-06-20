; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61894 () Bool)

(assert start!61894)

(declare-fun b!277393 () Bool)

(declare-fun res!230383 () Bool)

(declare-fun e!197347 () Bool)

(assert (=> b!277393 (=> (not res!230383) (not e!197347))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277393 (= res!230383 (bvslt from!822 to!789))))

(declare-fun b!277392 () Bool)

(declare-fun res!230384 () Bool)

(assert (=> b!277392 (=> (not res!230384) (not e!197347))))

(declare-datatypes ((array!15925 0))(
  ( (array!15926 (arr!7885 (Array (_ BitVec 32) (_ BitVec 8))) (size!6889 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15925)

(declare-fun a2!699 () array!15925)

(declare-fun arrayBitRangesEq!0 (array!15925 array!15925 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277392 (= res!230384 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277394 () Bool)

(declare-fun e!197346 () Bool)

(assert (=> b!277394 (= e!197347 e!197346)))

(declare-fun res!230385 () Bool)

(assert (=> b!277394 (=> (not res!230385) (not e!197346))))

(declare-datatypes ((tuple4!564 0))(
  ( (tuple4!565 (_1!12357 (_ BitVec 32)) (_2!12357 (_ BitVec 32)) (_3!1062 (_ BitVec 32)) (_4!282 (_ BitVec 32))) )
))
(declare-fun lt!415404 () tuple4!564)

(assert (=> b!277394 (= res!230385 (bvslt (_1!12357 lt!415404) (_2!12357 lt!415404)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!564)

(assert (=> b!277394 (= lt!415404 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!230386 () Bool)

(assert (=> start!61894 (=> (not res!230386) (not e!197347))))

(assert (=> start!61894 (= res!230386 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6889 a1!699) (size!6889 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6889 a1!699))))))))

(assert (=> start!61894 e!197347))

(assert (=> start!61894 true))

(declare-fun array_inv!6613 (array!15925) Bool)

(assert (=> start!61894 (array_inv!6613 a1!699)))

(assert (=> start!61894 (array_inv!6613 a2!699)))

(declare-fun b!277395 () Bool)

(assert (=> b!277395 (= e!197346 (not true))))

(declare-fun arrayRangesEq!1175 (array!15925 array!15925 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277395 (arrayRangesEq!1175 a1!699 a2!699 (_1!12357 lt!415404) (_2!12357 lt!415404))))

(assert (= (and start!61894 res!230386) b!277392))

(assert (= (and b!277392 res!230384) b!277393))

(assert (= (and b!277393 res!230383) b!277394))

(assert (= (and b!277394 res!230385) b!277395))

(declare-fun m!410549 () Bool)

(assert (=> b!277392 m!410549))

(declare-fun m!410551 () Bool)

(assert (=> b!277394 m!410551))

(declare-fun m!410553 () Bool)

(assert (=> start!61894 m!410553))

(declare-fun m!410555 () Bool)

(assert (=> start!61894 m!410555))

(declare-fun m!410557 () Bool)

(assert (=> b!277395 m!410557))

(push 1)

(assert (not b!277395))

(assert (not b!277394))

(assert (not start!61894))

(assert (not b!277392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


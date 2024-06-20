; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61942 () Bool)

(assert start!61942)

(declare-fun b!277610 () Bool)

(declare-fun res!230583 () Bool)

(declare-fun e!197555 () Bool)

(assert (=> b!277610 (=> (not res!230583) (not e!197555))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277610 (= res!230583 (bvslt from!822 to!789))))

(declare-fun b!277611 () Bool)

(declare-fun e!197556 () Bool)

(assert (=> b!277611 (= e!197555 e!197556)))

(declare-fun res!230582 () Bool)

(assert (=> b!277611 (=> (not res!230582) (not e!197556))))

(declare-datatypes ((tuple4!586 0))(
  ( (tuple4!587 (_1!12368 (_ BitVec 32)) (_2!12368 (_ BitVec 32)) (_3!1073 (_ BitVec 32)) (_4!293 (_ BitVec 32))) )
))
(declare-fun lt!415487 () tuple4!586)

(assert (=> b!277611 (= res!230582 (bvslt (_1!12368 lt!415487) (_2!12368 lt!415487)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!586)

(assert (=> b!277611 (= lt!415487 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277609 () Bool)

(declare-fun res!230584 () Bool)

(assert (=> b!277609 (=> (not res!230584) (not e!197555))))

(declare-datatypes ((array!15950 0))(
  ( (array!15951 (arr!7896 (Array (_ BitVec 32) (_ BitVec 8))) (size!6900 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15950)

(declare-fun a2!699 () array!15950)

(declare-fun arrayBitRangesEq!0 (array!15950 array!15950 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277609 (= res!230584 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!230585 () Bool)

(assert (=> start!61942 (=> (not res!230585) (not e!197555))))

(assert (=> start!61942 (= res!230585 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6900 a1!699) (size!6900 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6900 a1!699))))))))

(assert (=> start!61942 e!197555))

(assert (=> start!61942 true))

(declare-fun array_inv!6624 (array!15950) Bool)

(assert (=> start!61942 (array_inv!6624 a1!699)))

(assert (=> start!61942 (array_inv!6624 a2!699)))

(declare-fun b!277612 () Bool)

(assert (=> b!277612 (= e!197556 (not (or (bvsgt #b00000000000000000000000000000000 (_1!12368 lt!415487)) (bvsgt (_1!12368 lt!415487) (_2!12368 lt!415487)) (bvsle (size!6900 a2!699) (size!6900 a1!699)))))))

(declare-fun arrayRangesEq!1186 (array!15950 array!15950 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277612 (arrayRangesEq!1186 a2!699 a1!699 (_1!12368 lt!415487) (_2!12368 lt!415487))))

(declare-datatypes ((Unit!19399 0))(
  ( (Unit!19400) )
))
(declare-fun lt!415488 () Unit!19399)

(declare-fun arrayRangesEqSymmetricLemma!105 (array!15950 array!15950 (_ BitVec 32) (_ BitVec 32)) Unit!19399)

(assert (=> b!277612 (= lt!415488 (arrayRangesEqSymmetricLemma!105 a1!699 a2!699 (_1!12368 lt!415487) (_2!12368 lt!415487)))))

(assert (=> b!277612 (arrayRangesEq!1186 a1!699 a2!699 (_1!12368 lt!415487) (_2!12368 lt!415487))))

(assert (= (and start!61942 res!230585) b!277609))

(assert (= (and b!277609 res!230584) b!277610))

(assert (= (and b!277610 res!230583) b!277611))

(assert (= (and b!277611 res!230582) b!277612))

(declare-fun m!410741 () Bool)

(assert (=> b!277611 m!410741))

(declare-fun m!410743 () Bool)

(assert (=> b!277609 m!410743))

(declare-fun m!410745 () Bool)

(assert (=> start!61942 m!410745))

(declare-fun m!410747 () Bool)

(assert (=> start!61942 m!410747))

(declare-fun m!410749 () Bool)

(assert (=> b!277612 m!410749))

(declare-fun m!410751 () Bool)

(assert (=> b!277612 m!410751))

(declare-fun m!410753 () Bool)

(assert (=> b!277612 m!410753))

(push 1)

(assert (not b!277609))

(assert (not start!61942))

(assert (not b!277612))

(assert (not b!277611))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61910 () Bool)

(assert start!61910)

(declare-fun b!277488 () Bool)

(declare-fun res!230482 () Bool)

(declare-fun e!197443 () Bool)

(assert (=> b!277488 (=> (not res!230482) (not e!197443))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15941 0))(
  ( (array!15942 (arr!7893 (Array (_ BitVec 32) (_ BitVec 8))) (size!6897 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15941)

(declare-fun a2!699 () array!15941)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!15941 array!15941 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277488 (= res!230482 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277491 () Bool)

(declare-fun e!197441 () Bool)

(declare-datatypes ((tuple4!580 0))(
  ( (tuple4!581 (_1!12365 (_ BitVec 32)) (_2!12365 (_ BitVec 32)) (_3!1070 (_ BitVec 32)) (_4!290 (_ BitVec 32))) )
))
(declare-fun lt!415437 () tuple4!580)

(assert (=> b!277491 (= e!197441 (not (and (bvsle #b00000000000000000000000000000000 (_1!12365 lt!415437)) (bvsle (_1!12365 lt!415437) (_2!12365 lt!415437)))))))

(declare-fun arrayRangesEq!1183 (array!15941 array!15941 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277491 (arrayRangesEq!1183 a2!699 a1!699 (_1!12365 lt!415437) (_2!12365 lt!415437))))

(declare-datatypes ((Unit!19393 0))(
  ( (Unit!19394) )
))
(declare-fun lt!415436 () Unit!19393)

(declare-fun arrayRangesEqSymmetricLemma!102 (array!15941 array!15941 (_ BitVec 32) (_ BitVec 32)) Unit!19393)

(assert (=> b!277491 (= lt!415436 (arrayRangesEqSymmetricLemma!102 a1!699 a2!699 (_1!12365 lt!415437) (_2!12365 lt!415437)))))

(assert (=> b!277491 (arrayRangesEq!1183 a1!699 a2!699 (_1!12365 lt!415437) (_2!12365 lt!415437))))

(declare-fun res!230479 () Bool)

(assert (=> start!61910 (=> (not res!230479) (not e!197443))))

(assert (=> start!61910 (= res!230479 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6897 a1!699) (size!6897 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6897 a1!699))))))))

(assert (=> start!61910 e!197443))

(assert (=> start!61910 true))

(declare-fun array_inv!6621 (array!15941) Bool)

(assert (=> start!61910 (array_inv!6621 a1!699)))

(assert (=> start!61910 (array_inv!6621 a2!699)))

(declare-fun b!277489 () Bool)

(declare-fun res!230480 () Bool)

(assert (=> b!277489 (=> (not res!230480) (not e!197443))))

(assert (=> b!277489 (= res!230480 (bvslt from!822 to!789))))

(declare-fun b!277490 () Bool)

(assert (=> b!277490 (= e!197443 e!197441)))

(declare-fun res!230481 () Bool)

(assert (=> b!277490 (=> (not res!230481) (not e!197441))))

(assert (=> b!277490 (= res!230481 (bvslt (_1!12365 lt!415437) (_2!12365 lt!415437)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!580)

(assert (=> b!277490 (= lt!415437 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!61910 res!230479) b!277488))

(assert (= (and b!277488 res!230482) b!277489))

(assert (= (and b!277489 res!230480) b!277490))

(assert (= (and b!277490 res!230481) b!277491))

(declare-fun m!410637 () Bool)

(assert (=> b!277488 m!410637))

(declare-fun m!410639 () Bool)

(assert (=> b!277491 m!410639))

(declare-fun m!410641 () Bool)

(assert (=> b!277491 m!410641))

(declare-fun m!410643 () Bool)

(assert (=> b!277491 m!410643))

(declare-fun m!410645 () Bool)

(assert (=> start!61910 m!410645))

(declare-fun m!410647 () Bool)

(assert (=> start!61910 m!410647))

(declare-fun m!410649 () Bool)

(assert (=> b!277490 m!410649))

(push 1)

(assert (not b!277488))

(assert (not start!61910))

(assert (not b!277491))

(assert (not b!277490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)


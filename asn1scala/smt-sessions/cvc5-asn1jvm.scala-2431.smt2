; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61938 () Bool)

(assert start!61938)

(declare-fun b!277587 () Bool)

(declare-fun e!197529 () Bool)

(declare-fun e!197532 () Bool)

(assert (=> b!277587 (= e!197529 e!197532)))

(declare-fun res!230560 () Bool)

(assert (=> b!277587 (=> (not res!230560) (not e!197532))))

(declare-datatypes ((tuple4!582 0))(
  ( (tuple4!583 (_1!12366 (_ BitVec 32)) (_2!12366 (_ BitVec 32)) (_3!1071 (_ BitVec 32)) (_4!291 (_ BitVec 32))) )
))
(declare-fun lt!415475 () tuple4!582)

(assert (=> b!277587 (= res!230560 (bvslt (_1!12366 lt!415475) (_2!12366 lt!415475)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!582)

(assert (=> b!277587 (= lt!415475 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277588 () Bool)

(declare-datatypes ((array!15946 0))(
  ( (array!15947 (arr!7894 (Array (_ BitVec 32) (_ BitVec 8))) (size!6898 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15946)

(declare-fun a2!699 () array!15946)

(assert (=> b!277588 (= e!197532 (not (or (bvsgt #b00000000000000000000000000000000 (_1!12366 lt!415475)) (bvsgt (_1!12366 lt!415475) (_2!12366 lt!415475)) (bvsle (size!6898 a2!699) (size!6898 a1!699)))))))

(declare-fun arrayRangesEq!1184 (array!15946 array!15946 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277588 (arrayRangesEq!1184 a2!699 a1!699 (_1!12366 lt!415475) (_2!12366 lt!415475))))

(declare-datatypes ((Unit!19395 0))(
  ( (Unit!19396) )
))
(declare-fun lt!415476 () Unit!19395)

(declare-fun arrayRangesEqSymmetricLemma!103 (array!15946 array!15946 (_ BitVec 32) (_ BitVec 32)) Unit!19395)

(assert (=> b!277588 (= lt!415476 (arrayRangesEqSymmetricLemma!103 a1!699 a2!699 (_1!12366 lt!415475) (_2!12366 lt!415475)))))

(assert (=> b!277588 (arrayRangesEq!1184 a1!699 a2!699 (_1!12366 lt!415475) (_2!12366 lt!415475))))

(declare-fun b!277586 () Bool)

(declare-fun res!230561 () Bool)

(assert (=> b!277586 (=> (not res!230561) (not e!197529))))

(assert (=> b!277586 (= res!230561 (bvslt from!822 to!789))))

(declare-fun b!277585 () Bool)

(declare-fun res!230558 () Bool)

(assert (=> b!277585 (=> (not res!230558) (not e!197529))))

(declare-fun arrayBitRangesEq!0 (array!15946 array!15946 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277585 (= res!230558 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!230559 () Bool)

(assert (=> start!61938 (=> (not res!230559) (not e!197529))))

(assert (=> start!61938 (= res!230559 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6898 a1!699) (size!6898 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6898 a1!699))))))))

(assert (=> start!61938 e!197529))

(assert (=> start!61938 true))

(declare-fun array_inv!6622 (array!15946) Bool)

(assert (=> start!61938 (array_inv!6622 a1!699)))

(assert (=> start!61938 (array_inv!6622 a2!699)))

(assert (= (and start!61938 res!230559) b!277585))

(assert (= (and b!277585 res!230558) b!277586))

(assert (= (and b!277586 res!230561) b!277587))

(assert (= (and b!277587 res!230560) b!277588))

(declare-fun m!410713 () Bool)

(assert (=> b!277587 m!410713))

(declare-fun m!410715 () Bool)

(assert (=> b!277588 m!410715))

(declare-fun m!410717 () Bool)

(assert (=> b!277588 m!410717))

(declare-fun m!410719 () Bool)

(assert (=> b!277588 m!410719))

(declare-fun m!410721 () Bool)

(assert (=> b!277585 m!410721))

(declare-fun m!410723 () Bool)

(assert (=> start!61938 m!410723))

(declare-fun m!410725 () Bool)

(assert (=> start!61938 m!410725))

(push 1)

(assert (not start!61938))

(assert (not b!277588))

(assert (not b!277587))

(assert (not b!277585))

(check-sat)

(pop 1)

(push 1)

(check-sat)


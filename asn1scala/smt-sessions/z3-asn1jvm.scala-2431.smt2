; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61940 () Bool)

(assert start!61940)

(declare-fun res!230571 () Bool)

(declare-fun e!197541 () Bool)

(assert (=> start!61940 (=> (not res!230571) (not e!197541))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15948 0))(
  ( (array!15949 (arr!7895 (Array (_ BitVec 32) (_ BitVec 8))) (size!6899 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15948)

(declare-fun a2!699 () array!15948)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!61940 (= res!230571 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6899 a1!699) (size!6899 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6899 a1!699))))))))

(assert (=> start!61940 e!197541))

(assert (=> start!61940 true))

(declare-fun array_inv!6623 (array!15948) Bool)

(assert (=> start!61940 (array_inv!6623 a1!699)))

(assert (=> start!61940 (array_inv!6623 a2!699)))

(declare-fun b!277599 () Bool)

(declare-fun e!197542 () Bool)

(assert (=> b!277599 (= e!197541 e!197542)))

(declare-fun res!230572 () Bool)

(assert (=> b!277599 (=> (not res!230572) (not e!197542))))

(declare-datatypes ((tuple4!584 0))(
  ( (tuple4!585 (_1!12367 (_ BitVec 32)) (_2!12367 (_ BitVec 32)) (_3!1072 (_ BitVec 32)) (_4!292 (_ BitVec 32))) )
))
(declare-fun lt!415481 () tuple4!584)

(assert (=> b!277599 (= res!230572 (bvslt (_1!12367 lt!415481) (_2!12367 lt!415481)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!584)

(assert (=> b!277599 (= lt!415481 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277600 () Bool)

(assert (=> b!277600 (= e!197542 (not (or (bvsgt #b00000000000000000000000000000000 (_1!12367 lt!415481)) (bvsgt (_1!12367 lt!415481) (_2!12367 lt!415481)) (bvsle (size!6899 a2!699) (size!6899 a1!699)))))))

(declare-fun arrayRangesEq!1185 (array!15948 array!15948 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277600 (arrayRangesEq!1185 a2!699 a1!699 (_1!12367 lt!415481) (_2!12367 lt!415481))))

(declare-datatypes ((Unit!19397 0))(
  ( (Unit!19398) )
))
(declare-fun lt!415482 () Unit!19397)

(declare-fun arrayRangesEqSymmetricLemma!104 (array!15948 array!15948 (_ BitVec 32) (_ BitVec 32)) Unit!19397)

(assert (=> b!277600 (= lt!415482 (arrayRangesEqSymmetricLemma!104 a1!699 a2!699 (_1!12367 lt!415481) (_2!12367 lt!415481)))))

(assert (=> b!277600 (arrayRangesEq!1185 a1!699 a2!699 (_1!12367 lt!415481) (_2!12367 lt!415481))))

(declare-fun b!277597 () Bool)

(declare-fun res!230573 () Bool)

(assert (=> b!277597 (=> (not res!230573) (not e!197541))))

(declare-fun arrayBitRangesEq!0 (array!15948 array!15948 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277597 (= res!230573 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277598 () Bool)

(declare-fun res!230570 () Bool)

(assert (=> b!277598 (=> (not res!230570) (not e!197541))))

(assert (=> b!277598 (= res!230570 (bvslt from!822 to!789))))

(assert (= (and start!61940 res!230571) b!277597))

(assert (= (and b!277597 res!230573) b!277598))

(assert (= (and b!277598 res!230570) b!277599))

(assert (= (and b!277599 res!230572) b!277600))

(declare-fun m!410727 () Bool)

(assert (=> start!61940 m!410727))

(declare-fun m!410729 () Bool)

(assert (=> start!61940 m!410729))

(declare-fun m!410731 () Bool)

(assert (=> b!277599 m!410731))

(declare-fun m!410733 () Bool)

(assert (=> b!277600 m!410733))

(declare-fun m!410735 () Bool)

(assert (=> b!277600 m!410735))

(declare-fun m!410737 () Bool)

(assert (=> b!277600 m!410737))

(declare-fun m!410739 () Bool)

(assert (=> b!277597 m!410739))

(check-sat (not b!277597) (not start!61940) (not b!277600) (not b!277599))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61902 () Bool)

(assert start!61902)

(declare-fun b!277441 () Bool)

(declare-fun res!230431 () Bool)

(declare-fun e!197394 () Bool)

(assert (=> b!277441 (=> (not res!230431) (not e!197394))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277441 (= res!230431 (bvslt from!822 to!789))))

(declare-fun res!230433 () Bool)

(assert (=> start!61902 (=> (not res!230433) (not e!197394))))

(declare-datatypes ((array!15933 0))(
  ( (array!15934 (arr!7889 (Array (_ BitVec 32) (_ BitVec 8))) (size!6893 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15933)

(declare-fun a2!699 () array!15933)

(assert (=> start!61902 (= res!230433 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6893 a1!699) (size!6893 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6893 a1!699))))))))

(assert (=> start!61902 e!197394))

(assert (=> start!61902 true))

(declare-fun array_inv!6617 (array!15933) Bool)

(assert (=> start!61902 (array_inv!6617 a1!699)))

(assert (=> start!61902 (array_inv!6617 a2!699)))

(declare-fun b!277442 () Bool)

(declare-fun e!197395 () Bool)

(assert (=> b!277442 (= e!197394 e!197395)))

(declare-fun res!230434 () Bool)

(assert (=> b!277442 (=> (not res!230434) (not e!197395))))

(declare-datatypes ((tuple4!572 0))(
  ( (tuple4!573 (_1!12361 (_ BitVec 32)) (_2!12361 (_ BitVec 32)) (_3!1066 (_ BitVec 32)) (_4!286 (_ BitVec 32))) )
))
(declare-fun lt!415416 () tuple4!572)

(assert (=> b!277442 (= res!230434 (bvslt (_1!12361 lt!415416) (_2!12361 lt!415416)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!572)

(assert (=> b!277442 (= lt!415416 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277440 () Bool)

(declare-fun res!230432 () Bool)

(assert (=> b!277440 (=> (not res!230432) (not e!197394))))

(declare-fun arrayBitRangesEq!0 (array!15933 array!15933 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277440 (= res!230432 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277443 () Bool)

(assert (=> b!277443 (= e!197395 (not true))))

(declare-fun arrayRangesEq!1179 (array!15933 array!15933 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277443 (arrayRangesEq!1179 a1!699 a2!699 (_1!12361 lt!415416) (_2!12361 lt!415416))))

(assert (= (and start!61902 res!230433) b!277440))

(assert (= (and b!277440 res!230432) b!277441))

(assert (= (and b!277441 res!230431) b!277442))

(assert (= (and b!277442 res!230434) b!277443))

(declare-fun m!410589 () Bool)

(assert (=> start!61902 m!410589))

(declare-fun m!410591 () Bool)

(assert (=> start!61902 m!410591))

(declare-fun m!410593 () Bool)

(assert (=> b!277442 m!410593))

(declare-fun m!410595 () Bool)

(assert (=> b!277440 m!410595))

(declare-fun m!410597 () Bool)

(assert (=> b!277443 m!410597))

(check-sat (not b!277440) (not b!277443) (not b!277442) (not start!61902))

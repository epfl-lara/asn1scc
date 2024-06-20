; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61892 () Bool)

(assert start!61892)

(declare-fun b!277381 () Bool)

(declare-fun res!230373 () Bool)

(declare-fun e!197334 () Bool)

(assert (=> b!277381 (=> (not res!230373) (not e!197334))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277381 (= res!230373 (bvslt from!822 to!789))))

(declare-fun res!230371 () Bool)

(assert (=> start!61892 (=> (not res!230371) (not e!197334))))

(declare-datatypes ((array!15923 0))(
  ( (array!15924 (arr!7884 (Array (_ BitVec 32) (_ BitVec 8))) (size!6888 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15923)

(declare-fun a2!699 () array!15923)

(assert (=> start!61892 (= res!230371 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6888 a1!699) (size!6888 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6888 a1!699))))))))

(assert (=> start!61892 e!197334))

(assert (=> start!61892 true))

(declare-fun array_inv!6612 (array!15923) Bool)

(assert (=> start!61892 (array_inv!6612 a1!699)))

(assert (=> start!61892 (array_inv!6612 a2!699)))

(declare-fun b!277383 () Bool)

(declare-fun e!197333 () Bool)

(assert (=> b!277383 (= e!197333 (not true))))

(declare-datatypes ((tuple4!562 0))(
  ( (tuple4!563 (_1!12356 (_ BitVec 32)) (_2!12356 (_ BitVec 32)) (_3!1061 (_ BitVec 32)) (_4!281 (_ BitVec 32))) )
))
(declare-fun lt!415401 () tuple4!562)

(declare-fun arrayRangesEq!1174 (array!15923 array!15923 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277383 (arrayRangesEq!1174 a1!699 a2!699 (_1!12356 lt!415401) (_2!12356 lt!415401))))

(declare-fun b!277380 () Bool)

(declare-fun res!230374 () Bool)

(assert (=> b!277380 (=> (not res!230374) (not e!197334))))

(declare-fun arrayBitRangesEq!0 (array!15923 array!15923 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277380 (= res!230374 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277382 () Bool)

(assert (=> b!277382 (= e!197334 e!197333)))

(declare-fun res!230372 () Bool)

(assert (=> b!277382 (=> (not res!230372) (not e!197333))))

(assert (=> b!277382 (= res!230372 (bvslt (_1!12356 lt!415401) (_2!12356 lt!415401)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!562)

(assert (=> b!277382 (= lt!415401 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!61892 res!230371) b!277380))

(assert (= (and b!277380 res!230374) b!277381))

(assert (= (and b!277381 res!230373) b!277382))

(assert (= (and b!277382 res!230372) b!277383))

(declare-fun m!410539 () Bool)

(assert (=> start!61892 m!410539))

(declare-fun m!410541 () Bool)

(assert (=> start!61892 m!410541))

(declare-fun m!410543 () Bool)

(assert (=> b!277383 m!410543))

(declare-fun m!410545 () Bool)

(assert (=> b!277380 m!410545))

(declare-fun m!410547 () Bool)

(assert (=> b!277382 m!410547))

(push 1)

(assert (not b!277383))

(assert (not b!277382))

(assert (not start!61892))

(assert (not b!277380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


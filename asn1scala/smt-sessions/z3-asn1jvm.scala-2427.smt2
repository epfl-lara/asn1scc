; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61890 () Bool)

(assert start!61890)

(declare-fun b!277368 () Bool)

(declare-fun res!230359 () Bool)

(declare-fun e!197324 () Bool)

(assert (=> b!277368 (=> (not res!230359) (not e!197324))))

(declare-datatypes ((array!15921 0))(
  ( (array!15922 (arr!7883 (Array (_ BitVec 32) (_ BitVec 8))) (size!6887 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15921)

(declare-fun a2!699 () array!15921)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!15921 array!15921 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277368 (= res!230359 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277369 () Bool)

(declare-fun res!230361 () Bool)

(assert (=> b!277369 (=> (not res!230361) (not e!197324))))

(assert (=> b!277369 (= res!230361 (bvslt from!822 to!789))))

(declare-fun res!230362 () Bool)

(assert (=> start!61890 (=> (not res!230362) (not e!197324))))

(assert (=> start!61890 (= res!230362 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6887 a1!699) (size!6887 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6887 a1!699))))))))

(assert (=> start!61890 e!197324))

(assert (=> start!61890 true))

(declare-fun array_inv!6611 (array!15921) Bool)

(assert (=> start!61890 (array_inv!6611 a1!699)))

(assert (=> start!61890 (array_inv!6611 a2!699)))

(declare-fun b!277370 () Bool)

(declare-fun e!197322 () Bool)

(assert (=> b!277370 (= e!197324 e!197322)))

(declare-fun res!230360 () Bool)

(assert (=> b!277370 (=> (not res!230360) (not e!197322))))

(declare-datatypes ((tuple4!560 0))(
  ( (tuple4!561 (_1!12355 (_ BitVec 32)) (_2!12355 (_ BitVec 32)) (_3!1060 (_ BitVec 32)) (_4!280 (_ BitVec 32))) )
))
(declare-fun lt!415398 () tuple4!560)

(assert (=> b!277370 (= res!230360 (bvslt (_1!12355 lt!415398) (_2!12355 lt!415398)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!560)

(assert (=> b!277370 (= lt!415398 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277371 () Bool)

(assert (=> b!277371 (= e!197322 (not true))))

(declare-fun arrayRangesEq!1173 (array!15921 array!15921 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277371 (arrayRangesEq!1173 a1!699 a2!699 (_1!12355 lt!415398) (_2!12355 lt!415398))))

(assert (= (and start!61890 res!230362) b!277368))

(assert (= (and b!277368 res!230359) b!277369))

(assert (= (and b!277369 res!230361) b!277370))

(assert (= (and b!277370 res!230360) b!277371))

(declare-fun m!410529 () Bool)

(assert (=> b!277368 m!410529))

(declare-fun m!410531 () Bool)

(assert (=> start!61890 m!410531))

(declare-fun m!410533 () Bool)

(assert (=> start!61890 m!410533))

(declare-fun m!410535 () Bool)

(assert (=> b!277370 m!410535))

(declare-fun m!410537 () Bool)

(assert (=> b!277371 m!410537))

(check-sat (not b!277371) (not b!277368) (not start!61890) (not b!277370))

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61904 () Bool)

(assert start!61904)

(declare-fun b!277455 () Bool)

(declare-fun e!197406 () Bool)

(assert (=> b!277455 (= e!197406 (not true))))

(declare-datatypes ((array!15935 0))(
  ( (array!15936 (arr!7890 (Array (_ BitVec 32) (_ BitVec 8))) (size!6894 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15935)

(declare-fun a2!699 () array!15935)

(declare-datatypes ((tuple4!574 0))(
  ( (tuple4!575 (_1!12362 (_ BitVec 32)) (_2!12362 (_ BitVec 32)) (_3!1067 (_ BitVec 32)) (_4!287 (_ BitVec 32))) )
))
(declare-fun lt!415419 () tuple4!574)

(declare-fun arrayRangesEq!1180 (array!15935 array!15935 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277455 (arrayRangesEq!1180 a1!699 a2!699 (_1!12362 lt!415419) (_2!12362 lt!415419))))

(declare-fun b!277454 () Bool)

(declare-fun e!197408 () Bool)

(assert (=> b!277454 (= e!197408 e!197406)))

(declare-fun res!230443 () Bool)

(assert (=> b!277454 (=> (not res!230443) (not e!197406))))

(assert (=> b!277454 (= res!230443 (bvslt (_1!12362 lt!415419) (_2!12362 lt!415419)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!574)

(assert (=> b!277454 (= lt!415419 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!230444 () Bool)

(assert (=> start!61904 (=> (not res!230444) (not e!197408))))

(assert (=> start!61904 (= res!230444 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6894 a1!699) (size!6894 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6894 a1!699))))))))

(assert (=> start!61904 e!197408))

(assert (=> start!61904 true))

(declare-fun array_inv!6618 (array!15935) Bool)

(assert (=> start!61904 (array_inv!6618 a1!699)))

(assert (=> start!61904 (array_inv!6618 a2!699)))

(declare-fun b!277452 () Bool)

(declare-fun res!230445 () Bool)

(assert (=> b!277452 (=> (not res!230445) (not e!197408))))

(declare-fun arrayBitRangesEq!0 (array!15935 array!15935 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277452 (= res!230445 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277453 () Bool)

(declare-fun res!230446 () Bool)

(assert (=> b!277453 (=> (not res!230446) (not e!197408))))

(assert (=> b!277453 (= res!230446 (bvslt from!822 to!789))))

(assert (= (and start!61904 res!230444) b!277452))

(assert (= (and b!277452 res!230445) b!277453))

(assert (= (and b!277453 res!230446) b!277454))

(assert (= (and b!277454 res!230443) b!277455))

(declare-fun m!410599 () Bool)

(assert (=> b!277455 m!410599))

(declare-fun m!410601 () Bool)

(assert (=> b!277454 m!410601))

(declare-fun m!410603 () Bool)

(assert (=> start!61904 m!410603))

(declare-fun m!410605 () Bool)

(assert (=> start!61904 m!410605))

(declare-fun m!410607 () Bool)

(assert (=> b!277452 m!410607))

(push 1)

(assert (not start!61904))

(assert (not b!277452))

(assert (not b!277455))

(assert (not b!277454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


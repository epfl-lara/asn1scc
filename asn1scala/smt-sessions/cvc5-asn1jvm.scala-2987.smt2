; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70156 () Bool)

(assert start!70156)

(declare-fun b!317507 () Bool)

(declare-fun res!260588 () Bool)

(declare-fun e!228104 () Bool)

(assert (=> b!317507 (=> (not res!260588) (not e!228104))))

(declare-fun i!999 () (_ BitVec 64))

(declare-datatypes ((array!19654 0))(
  ( (array!19655 (arr!9634 (Array (_ BitVec 32) (_ BitVec 8))) (size!8548 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19654)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19654)

(declare-fun arrayBitRangesEq!0 (array!19654 array!19654 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317507 (= res!260588 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260589 () Bool)

(assert (=> start!70156 (=> (not res!260589) (not e!228104))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> start!70156 (= res!260589 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8548 a1!748) (size!8548 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8548 a1!748))))))))

(assert (=> start!70156 e!228104))

(assert (=> start!70156 true))

(declare-fun array_inv!8100 (array!19654) Bool)

(assert (=> start!70156 (array_inv!8100 a2!748)))

(assert (=> start!70156 (array_inv!8100 a1!748)))

(declare-fun b!317508 () Bool)

(assert (=> b!317508 (= e!228104 (bvslt i!999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317509 () Bool)

(declare-fun res!260590 () Bool)

(assert (=> b!317509 (=> (not res!260590) (not e!228104))))

(assert (=> b!317509 (= res!260590 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317510 () Bool)

(declare-fun res!260591 () Bool)

(assert (=> b!317510 (=> (not res!260591) (not e!228104))))

(declare-fun bitAt!0 (array!19654 (_ BitVec 64)) Bool)

(assert (=> b!317510 (= res!260591 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317511 () Bool)

(declare-fun res!260587 () Bool)

(assert (=> b!317511 (=> (not res!260587) (not e!228104))))

(assert (=> b!317511 (= res!260587 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(assert (= (and start!70156 res!260589) b!317509))

(assert (= (and b!317509 res!260590) b!317510))

(assert (= (and b!317510 res!260591) b!317511))

(assert (= (and b!317511 res!260587) b!317507))

(assert (= (and b!317507 res!260588) b!317508))

(declare-fun m!455561 () Bool)

(assert (=> b!317507 m!455561))

(declare-fun m!455563 () Bool)

(assert (=> start!70156 m!455563))

(declare-fun m!455565 () Bool)

(assert (=> start!70156 m!455565))

(declare-fun m!455567 () Bool)

(assert (=> b!317509 m!455567))

(declare-fun m!455569 () Bool)

(assert (=> b!317510 m!455569))

(declare-fun m!455571 () Bool)

(assert (=> b!317510 m!455571))

(push 1)

(assert (not start!70156))

(assert (not b!317510))

(assert (not b!317509))

(assert (not b!317507))

(check-sat)

(pop 1)

(push 1)

(check-sat)


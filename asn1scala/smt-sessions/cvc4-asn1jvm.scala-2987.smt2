; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70160 () Bool)

(assert start!70160)

(declare-fun b!317537 () Bool)

(declare-fun res!260619 () Bool)

(declare-fun e!228123 () Bool)

(assert (=> b!317537 (=> (not res!260619) (not e!228123))))

(declare-datatypes ((array!19658 0))(
  ( (array!19659 (arr!9636 (Array (_ BitVec 32) (_ BitVec 8))) (size!8550 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19658)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19658)

(declare-fun arrayBitRangesEq!0 (array!19658 array!19658 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317537 (= res!260619 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317538 () Bool)

(declare-fun res!260620 () Bool)

(assert (=> b!317538 (=> (not res!260620) (not e!228123))))

(declare-fun bitAt!0 (array!19658 (_ BitVec 64)) Bool)

(assert (=> b!317538 (= res!260620 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317539 () Bool)

(declare-fun res!260617 () Bool)

(assert (=> b!317539 (=> (not res!260617) (not e!228123))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317539 (= res!260617 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317540 () Bool)

(declare-fun res!260618 () Bool)

(assert (=> b!317540 (=> (not res!260618) (not e!228123))))

(assert (=> b!317540 (= res!260618 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317541 () Bool)

(assert (=> b!317541 (= e!228123 (bvslt i!999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!260621 () Bool)

(assert (=> start!70160 (=> (not res!260621) (not e!228123))))

(assert (=> start!70160 (= res!260621 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8550 a1!748) (size!8550 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8550 a1!748))))))))

(assert (=> start!70160 e!228123))

(assert (=> start!70160 true))

(declare-fun array_inv!8102 (array!19658) Bool)

(assert (=> start!70160 (array_inv!8102 a2!748)))

(assert (=> start!70160 (array_inv!8102 a1!748)))

(assert (= (and start!70160 res!260621) b!317537))

(assert (= (and b!317537 res!260619) b!317538))

(assert (= (and b!317538 res!260620) b!317540))

(assert (= (and b!317540 res!260618) b!317539))

(assert (= (and b!317539 res!260617) b!317541))

(declare-fun m!455585 () Bool)

(assert (=> b!317537 m!455585))

(declare-fun m!455587 () Bool)

(assert (=> b!317538 m!455587))

(declare-fun m!455589 () Bool)

(assert (=> b!317538 m!455589))

(declare-fun m!455591 () Bool)

(assert (=> b!317539 m!455591))

(declare-fun m!455593 () Bool)

(assert (=> start!70160 m!455593))

(declare-fun m!455595 () Bool)

(assert (=> start!70160 m!455595))

(push 1)

(assert (not b!317537))

(assert (not start!70160))

(assert (not b!317538))

(assert (not b!317539))

(check-sat)

(pop 1)

(push 1)

(check-sat)


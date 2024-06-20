; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70170 () Bool)

(assert start!70170)

(declare-fun res!260701 () Bool)

(declare-fun e!228169 () Bool)

(assert (=> start!70170 (=> (not res!260701) (not e!228169))))

(declare-datatypes ((array!19668 0))(
  ( (array!19669 (arr!9641 (Array (_ BitVec 32) (_ BitVec 8))) (size!8555 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19668)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19668)

(assert (=> start!70170 (= res!260701 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8555 a1!748) (size!8555 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8555 a1!748))))))))

(assert (=> start!70170 e!228169))

(assert (=> start!70170 true))

(declare-fun array_inv!8107 (array!19668) Bool)

(assert (=> start!70170 (array_inv!8107 a2!748)))

(assert (=> start!70170 (array_inv!8107 a1!748)))

(declare-fun b!317617 () Bool)

(declare-fun res!260697 () Bool)

(assert (=> b!317617 (=> (not res!260697) (not e!228169))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317617 (= res!260697 (bvsle i!999 to!822))))

(declare-fun b!317618 () Bool)

(declare-fun res!260702 () Bool)

(assert (=> b!317618 (=> (not res!260702) (not e!228169))))

(declare-fun arrayBitRangesEq!0 (array!19668 array!19668 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317618 (= res!260702 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317619 () Bool)

(declare-fun res!260700 () Bool)

(assert (=> b!317619 (=> (not res!260700) (not e!228169))))

(declare-fun bitAt!0 (array!19668 (_ BitVec 64)) Bool)

(assert (=> b!317619 (= res!260700 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317620 () Bool)

(declare-fun res!260698 () Bool)

(assert (=> b!317620 (=> (not res!260698) (not e!228169))))

(assert (=> b!317620 (= res!260698 (= i!999 from!855))))

(declare-fun b!317621 () Bool)

(assert (=> b!317621 (= e!228169 (not (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))))

(declare-fun b!317622 () Bool)

(declare-fun res!260699 () Bool)

(assert (=> b!317622 (=> (not res!260699) (not e!228169))))

(assert (=> b!317622 (= res!260699 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70170 res!260701) b!317618))

(assert (= (and b!317618 res!260702) b!317619))

(assert (= (and b!317619 res!260700) b!317617))

(assert (= (and b!317617 res!260697) b!317622))

(assert (= (and b!317622 res!260699) b!317620))

(assert (= (and b!317620 res!260698) b!317621))

(declare-fun m!455647 () Bool)

(assert (=> b!317622 m!455647))

(declare-fun m!455649 () Bool)

(assert (=> b!317621 m!455649))

(declare-fun m!455651 () Bool)

(assert (=> b!317619 m!455651))

(declare-fun m!455653 () Bool)

(assert (=> b!317619 m!455653))

(declare-fun m!455655 () Bool)

(assert (=> b!317618 m!455655))

(declare-fun m!455657 () Bool)

(assert (=> start!70170 m!455657))

(declare-fun m!455659 () Bool)

(assert (=> start!70170 m!455659))

(check-sat (not b!317618) (not b!317622) (not start!70170) (not b!317619) (not b!317621))

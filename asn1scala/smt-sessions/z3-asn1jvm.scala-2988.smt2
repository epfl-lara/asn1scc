; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70164 () Bool)

(assert start!70164)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun b!317567 () Bool)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun e!228141 () Bool)

(assert (=> b!317567 (= e!228141 (and (= i!999 from!855) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!317568 () Bool)

(declare-fun res!260650 () Bool)

(assert (=> b!317568 (=> (not res!260650) (not e!228141))))

(declare-datatypes ((array!19662 0))(
  ( (array!19663 (arr!9638 (Array (_ BitVec 32) (_ BitVec 8))) (size!8552 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19662)

(declare-fun a1!748 () array!19662)

(declare-fun arrayBitRangesEq!0 (array!19662 array!19662 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317568 (= res!260650 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260648 () Bool)

(assert (=> start!70164 (=> (not res!260648) (not e!228141))))

(assert (=> start!70164 (= res!260648 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8552 a1!748) (size!8552 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8552 a1!748))))))))

(assert (=> start!70164 e!228141))

(assert (=> start!70164 true))

(declare-fun array_inv!8104 (array!19662) Bool)

(assert (=> start!70164 (array_inv!8104 a2!748)))

(assert (=> start!70164 (array_inv!8104 a1!748)))

(declare-fun b!317569 () Bool)

(declare-fun res!260651 () Bool)

(assert (=> b!317569 (=> (not res!260651) (not e!228141))))

(assert (=> b!317569 (= res!260651 (bvsle i!999 to!822))))

(declare-fun b!317570 () Bool)

(declare-fun res!260649 () Bool)

(assert (=> b!317570 (=> (not res!260649) (not e!228141))))

(declare-fun bitAt!0 (array!19662 (_ BitVec 64)) Bool)

(assert (=> b!317570 (= res!260649 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317571 () Bool)

(declare-fun res!260647 () Bool)

(assert (=> b!317571 (=> (not res!260647) (not e!228141))))

(assert (=> b!317571 (= res!260647 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70164 res!260648) b!317571))

(assert (= (and b!317571 res!260647) b!317570))

(assert (= (and b!317570 res!260649) b!317569))

(assert (= (and b!317569 res!260651) b!317568))

(assert (= (and b!317568 res!260650) b!317567))

(declare-fun m!455609 () Bool)

(assert (=> b!317568 m!455609))

(declare-fun m!455611 () Bool)

(assert (=> start!70164 m!455611))

(declare-fun m!455613 () Bool)

(assert (=> start!70164 m!455613))

(declare-fun m!455615 () Bool)

(assert (=> b!317570 m!455615))

(declare-fun m!455617 () Bool)

(assert (=> b!317570 m!455617))

(declare-fun m!455619 () Bool)

(assert (=> b!317571 m!455619))

(check-sat (not start!70164) (not b!317568) (not b!317570) (not b!317571))
(check-sat)

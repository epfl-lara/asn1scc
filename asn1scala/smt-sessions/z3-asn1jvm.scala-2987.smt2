; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70158 () Bool)

(assert start!70158)

(declare-fun b!317522 () Bool)

(declare-fun res!260603 () Bool)

(declare-fun e!228113 () Bool)

(assert (=> b!317522 (=> (not res!260603) (not e!228113))))

(declare-datatypes ((array!19656 0))(
  ( (array!19657 (arr!9635 (Array (_ BitVec 32) (_ BitVec 8))) (size!8549 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19656)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19656)

(declare-fun arrayBitRangesEq!0 (array!19656 array!19656 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317522 (= res!260603 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!260602 () Bool)

(assert (=> start!70158 (=> (not res!260602) (not e!228113))))

(assert (=> start!70158 (= res!260602 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8549 a1!748) (size!8549 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8549 a1!748))))))))

(assert (=> start!70158 e!228113))

(assert (=> start!70158 true))

(declare-fun array_inv!8101 (array!19656) Bool)

(assert (=> start!70158 (array_inv!8101 a2!748)))

(assert (=> start!70158 (array_inv!8101 a1!748)))

(declare-fun b!317523 () Bool)

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317523 (= e!228113 (bvslt i!999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317524 () Bool)

(declare-fun res!260604 () Bool)

(assert (=> b!317524 (=> (not res!260604) (not e!228113))))

(assert (=> b!317524 (= res!260604 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317525 () Bool)

(declare-fun res!260606 () Bool)

(assert (=> b!317525 (=> (not res!260606) (not e!228113))))

(declare-fun bitAt!0 (array!19656 (_ BitVec 64)) Bool)

(assert (=> b!317525 (= res!260606 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317526 () Bool)

(declare-fun res!260605 () Bool)

(assert (=> b!317526 (=> (not res!260605) (not e!228113))))

(assert (=> b!317526 (= res!260605 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70158 res!260602) b!317522))

(assert (= (and b!317522 res!260603) b!317525))

(assert (= (and b!317525 res!260606) b!317524))

(assert (= (and b!317524 res!260604) b!317526))

(assert (= (and b!317526 res!260605) b!317523))

(declare-fun m!455573 () Bool)

(assert (=> b!317522 m!455573))

(declare-fun m!455575 () Bool)

(assert (=> start!70158 m!455575))

(declare-fun m!455577 () Bool)

(assert (=> start!70158 m!455577))

(declare-fun m!455579 () Bool)

(assert (=> b!317525 m!455579))

(declare-fun m!455581 () Bool)

(assert (=> b!317525 m!455581))

(declare-fun m!455583 () Bool)

(assert (=> b!317526 m!455583))

(check-sat (not b!317522) (not b!317525) (not b!317526) (not start!70158))
(check-sat)

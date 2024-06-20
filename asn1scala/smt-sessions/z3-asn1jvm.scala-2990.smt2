; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70176 () Bool)

(assert start!70176)

(declare-fun res!260748 () Bool)

(declare-fun e!228196 () Bool)

(assert (=> start!70176 (=> (not res!260748) (not e!228196))))

(declare-datatypes ((array!19674 0))(
  ( (array!19675 (arr!9644 (Array (_ BitVec 32) (_ BitVec 8))) (size!8558 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19674)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19674)

(assert (=> start!70176 (= res!260748 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8558 a1!748) (size!8558 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8558 a1!748))))))))

(assert (=> start!70176 e!228196))

(assert (=> start!70176 true))

(declare-fun array_inv!8110 (array!19674) Bool)

(assert (=> start!70176 (array_inv!8110 a2!748)))

(assert (=> start!70176 (array_inv!8110 a1!748)))

(declare-fun b!317666 () Bool)

(declare-fun res!260749 () Bool)

(assert (=> b!317666 (=> (not res!260749) (not e!228196))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19674 array!19674 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317666 (= res!260749 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317667 () Bool)

(declare-fun res!260746 () Bool)

(assert (=> b!317667 (=> (not res!260746) (not e!228196))))

(assert (=> b!317667 (= res!260746 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317668 () Bool)

(declare-fun res!260747 () Bool)

(assert (=> b!317668 (=> (not res!260747) (not e!228196))))

(declare-fun bitAt!0 (array!19674 (_ BitVec 64)) Bool)

(assert (=> b!317668 (= res!260747 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317669 () Bool)

(assert (=> b!317669 (= e!228196 (and (not (= i!999 from!855)) (not (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!317670 () Bool)

(declare-fun res!260750 () Bool)

(assert (=> b!317670 (=> (not res!260750) (not e!228196))))

(assert (=> b!317670 (= res!260750 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70176 res!260748) b!317670))

(assert (= (and b!317670 res!260750) b!317668))

(assert (= (and b!317668 res!260747) b!317667))

(assert (= (and b!317667 res!260746) b!317666))

(assert (= (and b!317666 res!260749) b!317669))

(declare-fun m!455687 () Bool)

(assert (=> start!70176 m!455687))

(declare-fun m!455689 () Bool)

(assert (=> start!70176 m!455689))

(declare-fun m!455691 () Bool)

(assert (=> b!317666 m!455691))

(declare-fun m!455693 () Bool)

(assert (=> b!317668 m!455693))

(declare-fun m!455695 () Bool)

(assert (=> b!317668 m!455695))

(declare-fun m!455697 () Bool)

(assert (=> b!317670 m!455697))

(check-sat (not b!317666) (not b!317670) (not b!317668) (not start!70176))
(check-sat)

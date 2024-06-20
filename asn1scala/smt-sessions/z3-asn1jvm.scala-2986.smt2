; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70152 () Bool)

(assert start!70152)

(declare-fun res!260567 () Bool)

(declare-fun e!228086 () Bool)

(assert (=> start!70152 (=> (not res!260567) (not e!228086))))

(declare-datatypes ((array!19650 0))(
  ( (array!19651 (arr!9632 (Array (_ BitVec 32) (_ BitVec 8))) (size!8546 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19650)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19650)

(assert (=> start!70152 (= res!260567 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8546 a1!748) (size!8546 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8546 a1!748))))))))

(assert (=> start!70152 e!228086))

(assert (=> start!70152 true))

(declare-fun array_inv!8098 (array!19650) Bool)

(assert (=> start!70152 (array_inv!8098 a2!748)))

(assert (=> start!70152 (array_inv!8098 a1!748)))

(declare-fun b!317485 () Bool)

(declare-fun res!260565 () Bool)

(assert (=> b!317485 (=> (not res!260565) (not e!228086))))

(declare-fun arrayBitRangesEq!0 (array!19650 array!19650 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317485 (= res!260565 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317486 () Bool)

(declare-fun res!260566 () Bool)

(assert (=> b!317486 (=> (not res!260566) (not e!228086))))

(declare-fun bitAt!0 (array!19650 (_ BitVec 64)) Bool)

(assert (=> b!317486 (= res!260566 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun b!317487 () Bool)

(assert (=> b!317487 (= e!228086 (and (bvsle from!855 i!999) (bvsle i!999 to!822) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70152 res!260567) b!317485))

(assert (= (and b!317485 res!260565) b!317486))

(assert (= (and b!317486 res!260566) b!317487))

(declare-fun m!455541 () Bool)

(assert (=> start!70152 m!455541))

(declare-fun m!455543 () Bool)

(assert (=> start!70152 m!455543))

(declare-fun m!455545 () Bool)

(assert (=> b!317485 m!455545))

(declare-fun m!455547 () Bool)

(assert (=> b!317486 m!455547))

(declare-fun m!455549 () Bool)

(assert (=> b!317486 m!455549))

(check-sat (not b!317485) (not b!317486) (not start!70152))
(check-sat)

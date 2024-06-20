; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70122 () Bool)

(assert start!70122)

(declare-fun b!317212 () Bool)

(declare-fun res!260296 () Bool)

(declare-fun e!227933 () Bool)

(assert (=> b!317212 (=> (not res!260296) (not e!227933))))

(declare-datatypes ((array!19620 0))(
  ( (array!19621 (arr!9617 (Array (_ BitVec 32) (_ BitVec 8))) (size!8531 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19620)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19620)

(declare-fun arrayBitRangesEq!0 (array!19620 array!19620 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317212 (= res!260296 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!260295 () Bool)

(assert (=> start!70122 (=> (not res!260295) (not e!227933))))

(assert (=> start!70122 (= res!260295 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8531 a1!748) (size!8531 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8531 a1!748))))))))

(assert (=> start!70122 e!227933))

(assert (=> start!70122 true))

(declare-fun array_inv!8083 (array!19620) Bool)

(assert (=> start!70122 (array_inv!8083 a2!748)))

(assert (=> start!70122 (array_inv!8083 a1!748)))

(declare-fun b!317213 () Bool)

(declare-fun res!260293 () Bool)

(assert (=> b!317213 (=> (not res!260293) (not e!227933))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317213 (= res!260293 (not (= i!999 from!855)))))

(declare-fun b!317214 () Bool)

(assert (=> b!317214 (= e!227933 (not true))))

(declare-fun bitAt!0 (array!19620 (_ BitVec 64)) Bool)

(assert (=> b!317214 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21775 0))(
  ( (Unit!21776) )
))
(declare-fun lt!443111 () Unit!21775)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19620 array!19620 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21775)

(assert (=> b!317214 (= lt!443111 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317215 () Bool)

(declare-fun res!260292 () Bool)

(assert (=> b!317215 (=> (not res!260292) (not e!227933))))

(assert (=> b!317215 (= res!260292 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317216 () Bool)

(declare-fun res!260297 () Bool)

(assert (=> b!317216 (=> (not res!260297) (not e!227933))))

(assert (=> b!317216 (= res!260297 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317217 () Bool)

(declare-fun res!260294 () Bool)

(assert (=> b!317217 (=> (not res!260294) (not e!227933))))

(assert (=> b!317217 (= res!260294 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70122 res!260295) b!317212))

(assert (= (and b!317212 res!260296) b!317217))

(assert (= (and b!317217 res!260294) b!317216))

(assert (= (and b!317216 res!260297) b!317215))

(assert (= (and b!317215 res!260292) b!317213))

(assert (= (and b!317213 res!260293) b!317214))

(declare-fun m!455207 () Bool)

(assert (=> start!70122 m!455207))

(declare-fun m!455209 () Bool)

(assert (=> start!70122 m!455209))

(declare-fun m!455211 () Bool)

(assert (=> b!317215 m!455211))

(declare-fun m!455213 () Bool)

(assert (=> b!317212 m!455213))

(declare-fun m!455215 () Bool)

(assert (=> b!317214 m!455215))

(declare-fun m!455217 () Bool)

(assert (=> b!317214 m!455217))

(declare-fun m!455219 () Bool)

(assert (=> b!317214 m!455219))

(declare-fun m!455221 () Bool)

(assert (=> b!317217 m!455221))

(declare-fun m!455223 () Bool)

(assert (=> b!317217 m!455223))

(check-sat (not b!317212) (not b!317215) (not b!317217) (not b!317214) (not start!70122))

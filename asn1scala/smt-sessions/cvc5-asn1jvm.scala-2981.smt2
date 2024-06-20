; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70120 () Bool)

(assert start!70120)

(declare-fun b!317194 () Bool)

(declare-fun e!227924 () Bool)

(assert (=> b!317194 (= e!227924 (not true))))

(declare-datatypes ((array!19618 0))(
  ( (array!19619 (arr!9616 (Array (_ BitVec 32) (_ BitVec 8))) (size!8530 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19618)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun a2!748 () array!19618)

(declare-fun bitAt!0 (array!19618 (_ BitVec 64)) Bool)

(assert (=> b!317194 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((Unit!21773 0))(
  ( (Unit!21774) )
))
(declare-fun lt!443108 () Unit!21773)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19618 array!19618 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21773)

(assert (=> b!317194 (= lt!443108 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!260279 () Bool)

(assert (=> start!70120 (=> (not res!260279) (not e!227924))))

(assert (=> start!70120 (= res!260279 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8530 a1!748) (size!8530 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8530 a1!748))))))))

(assert (=> start!70120 e!227924))

(assert (=> start!70120 true))

(declare-fun array_inv!8082 (array!19618) Bool)

(assert (=> start!70120 (array_inv!8082 a2!748)))

(assert (=> start!70120 (array_inv!8082 a1!748)))

(declare-fun b!317195 () Bool)

(declare-fun res!260274 () Bool)

(assert (=> b!317195 (=> (not res!260274) (not e!227924))))

(declare-fun arrayBitRangesEq!0 (array!19618 array!19618 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317195 (= res!260274 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317196 () Bool)

(declare-fun res!260275 () Bool)

(assert (=> b!317196 (=> (not res!260275) (not e!227924))))

(assert (=> b!317196 (= res!260275 (not (= i!999 from!855)))))

(declare-fun b!317197 () Bool)

(declare-fun res!260278 () Bool)

(assert (=> b!317197 (=> (not res!260278) (not e!227924))))

(assert (=> b!317197 (= res!260278 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317198 () Bool)

(declare-fun res!260277 () Bool)

(assert (=> b!317198 (=> (not res!260277) (not e!227924))))

(assert (=> b!317198 (= res!260277 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317199 () Bool)

(declare-fun res!260276 () Bool)

(assert (=> b!317199 (=> (not res!260276) (not e!227924))))

(assert (=> b!317199 (= res!260276 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70120 res!260279) b!317198))

(assert (= (and b!317198 res!260277) b!317199))

(assert (= (and b!317199 res!260276) b!317197))

(assert (= (and b!317197 res!260278) b!317195))

(assert (= (and b!317195 res!260274) b!317196))

(assert (= (and b!317196 res!260275) b!317194))

(declare-fun m!455189 () Bool)

(assert (=> b!317199 m!455189))

(declare-fun m!455191 () Bool)

(assert (=> b!317199 m!455191))

(declare-fun m!455193 () Bool)

(assert (=> start!70120 m!455193))

(declare-fun m!455195 () Bool)

(assert (=> start!70120 m!455195))

(declare-fun m!455197 () Bool)

(assert (=> b!317198 m!455197))

(declare-fun m!455199 () Bool)

(assert (=> b!317195 m!455199))

(declare-fun m!455201 () Bool)

(assert (=> b!317194 m!455201))

(declare-fun m!455203 () Bool)

(assert (=> b!317194 m!455203))

(declare-fun m!455205 () Bool)

(assert (=> b!317194 m!455205))

(push 1)

(assert (not b!317194))

(assert (not b!317195))

(assert (not start!70120))

(assert (not b!317198))

(assert (not b!317199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


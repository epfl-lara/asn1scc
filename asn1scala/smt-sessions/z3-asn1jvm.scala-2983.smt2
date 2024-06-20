; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70134 () Bool)

(assert start!70134)

(declare-fun b!317320 () Bool)

(declare-fun res!260400 () Bool)

(declare-fun e!227989 () Bool)

(assert (=> b!317320 (=> (not res!260400) (not e!227989))))

(declare-fun i!999 () (_ BitVec 64))

(declare-datatypes ((array!19632 0))(
  ( (array!19633 (arr!9623 (Array (_ BitVec 32) (_ BitVec 8))) (size!8537 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19632)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19632)

(declare-fun arrayBitRangesEq!0 (array!19632 array!19632 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317320 (= res!260400 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317321 () Bool)

(declare-fun res!260404 () Bool)

(assert (=> b!317321 (=> (not res!260404) (not e!227989))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317321 (= res!260404 (not (= i!999 from!855)))))

(declare-fun b!317322 () Bool)

(declare-fun res!260401 () Bool)

(assert (=> b!317322 (=> (not res!260401) (not e!227989))))

(assert (=> b!317322 (= res!260401 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317323 () Bool)

(declare-fun res!260402 () Bool)

(assert (=> b!317323 (=> (not res!260402) (not e!227989))))

(assert (=> b!317323 (= res!260402 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317324 () Bool)

(assert (=> b!317324 (= e!227989 (not true))))

(assert (=> b!317324 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21787 0))(
  ( (Unit!21788) )
))
(declare-fun lt!443143 () Unit!21787)

(declare-fun arrayBitRangesEqPrepend!0 (array!19632 array!19632 (_ BitVec 64) (_ BitVec 64)) Unit!21787)

(assert (=> b!317324 (= lt!443143 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19632 (_ BitVec 64)) Bool)

(assert (=> b!317324 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443144 () Unit!21787)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19632 array!19632 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21787)

(assert (=> b!317324 (= lt!443144 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!260403 () Bool)

(assert (=> start!70134 (=> (not res!260403) (not e!227989))))

(assert (=> start!70134 (= res!260403 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8537 a1!748) (size!8537 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8537 a1!748))))))))

(assert (=> start!70134 e!227989))

(assert (=> start!70134 true))

(declare-fun array_inv!8089 (array!19632) Bool)

(assert (=> start!70134 (array_inv!8089 a2!748)))

(assert (=> start!70134 (array_inv!8089 a1!748)))

(declare-fun b!317325 () Bool)

(declare-fun res!260405 () Bool)

(assert (=> b!317325 (=> (not res!260405) (not e!227989))))

(assert (=> b!317325 (= res!260405 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70134 res!260403) b!317322))

(assert (= (and b!317322 res!260401) b!317325))

(assert (= (and b!317325 res!260405) b!317323))

(assert (= (and b!317323 res!260402) b!317320))

(assert (= (and b!317320 res!260400) b!317321))

(assert (= (and b!317321 res!260404) b!317324))

(declare-fun m!455331 () Bool)

(assert (=> b!317324 m!455331))

(declare-fun m!455333 () Bool)

(assert (=> b!317324 m!455333))

(declare-fun m!455335 () Bool)

(assert (=> b!317324 m!455335))

(declare-fun m!455337 () Bool)

(assert (=> b!317324 m!455337))

(declare-fun m!455339 () Bool)

(assert (=> b!317324 m!455339))

(declare-fun m!455341 () Bool)

(assert (=> b!317320 m!455341))

(declare-fun m!455343 () Bool)

(assert (=> start!70134 m!455343))

(declare-fun m!455345 () Bool)

(assert (=> start!70134 m!455345))

(declare-fun m!455347 () Bool)

(assert (=> b!317325 m!455347))

(declare-fun m!455349 () Bool)

(assert (=> b!317325 m!455349))

(declare-fun m!455351 () Bool)

(assert (=> b!317322 m!455351))

(check-sat (not b!317324) (not start!70134) (not b!317322) (not b!317325) (not b!317320))

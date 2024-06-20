; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70214 () Bool)

(assert start!70214)

(declare-fun b!317986 () Bool)

(declare-fun res!261068 () Bool)

(declare-fun e!228367 () Bool)

(assert (=> b!317986 (=> (not res!261068) (not e!228367))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((array!19712 0))(
  ( (array!19713 (arr!9663 (Array (_ BitVec 32) (_ BitVec 8))) (size!8577 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19712)

(declare-fun a2!748 () array!19712)

(declare-fun arrayBitRangesEq!0 (array!19712 array!19712 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317986 (= res!261068 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317987 () Bool)

(declare-fun res!261066 () Bool)

(assert (=> b!317987 (=> (not res!261066) (not e!228367))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317987 (= res!261066 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317988 () Bool)

(declare-fun res!261071 () Bool)

(assert (=> b!317988 (=> (not res!261071) (not e!228367))))

(assert (=> b!317988 (= res!261071 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317989 () Bool)

(declare-fun res!261067 () Bool)

(assert (=> b!317989 (=> (not res!261067) (not e!228367))))

(declare-fun bitAt!0 (array!19712 (_ BitVec 64)) Bool)

(assert (=> b!317989 (= res!261067 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317990 () Bool)

(assert (=> b!317990 (= e!228367 (not true))))

(assert (=> b!317990 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21825 0))(
  ( (Unit!21826) )
))
(declare-fun lt!443240 () Unit!21825)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19712 array!19712 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21825)

(assert (=> b!317990 (= lt!443240 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!261069 () Bool)

(assert (=> start!70214 (=> (not res!261069) (not e!228367))))

(assert (=> start!70214 (= res!261069 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8577 a1!748) (size!8577 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8577 a1!748))))))))

(assert (=> start!70214 e!228367))

(assert (=> start!70214 true))

(declare-fun array_inv!8129 (array!19712) Bool)

(assert (=> start!70214 (array_inv!8129 a2!748)))

(assert (=> start!70214 (array_inv!8129 a1!748)))

(declare-fun b!317991 () Bool)

(declare-fun res!261070 () Bool)

(assert (=> b!317991 (=> (not res!261070) (not e!228367))))

(assert (=> b!317991 (= res!261070 (not (= i!999 from!855)))))

(assert (= (and start!70214 res!261069) b!317986))

(assert (= (and b!317986 res!261068) b!317989))

(assert (= (and b!317989 res!261067) b!317988))

(assert (= (and b!317988 res!261071) b!317987))

(assert (= (and b!317987 res!261066) b!317991))

(assert (= (and b!317991 res!261070) b!317990))

(declare-fun m!455981 () Bool)

(assert (=> b!317990 m!455981))

(declare-fun m!455983 () Bool)

(assert (=> b!317990 m!455983))

(declare-fun m!455985 () Bool)

(assert (=> b!317990 m!455985))

(declare-fun m!455987 () Bool)

(assert (=> b!317987 m!455987))

(declare-fun m!455989 () Bool)

(assert (=> start!70214 m!455989))

(declare-fun m!455991 () Bool)

(assert (=> start!70214 m!455991))

(declare-fun m!455993 () Bool)

(assert (=> b!317989 m!455993))

(declare-fun m!455995 () Bool)

(assert (=> b!317989 m!455995))

(declare-fun m!455997 () Bool)

(assert (=> b!317986 m!455997))

(push 1)

(assert (not b!317989))

(assert (not b!317990))


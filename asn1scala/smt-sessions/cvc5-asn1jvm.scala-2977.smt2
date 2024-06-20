; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70096 () Bool)

(assert start!70096)

(declare-fun b!316978 () Bool)

(declare-fun res!260058 () Bool)

(declare-fun e!227816 () Bool)

(assert (=> b!316978 (=> (not res!260058) (not e!227816))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!316978 (= res!260058 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!316979 () Bool)

(declare-fun res!260060 () Bool)

(assert (=> b!316979 (=> (not res!260060) (not e!227816))))

(declare-datatypes ((array!19594 0))(
  ( (array!19595 (arr!9604 (Array (_ BitVec 32) (_ BitVec 8))) (size!8518 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19594)

(declare-fun a1!748 () array!19594)

(declare-fun arrayBitRangesEq!0 (array!19594 array!19594 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316979 (= res!260060 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260059 () Bool)

(assert (=> start!70096 (=> (not res!260059) (not e!227816))))

(assert (=> start!70096 (= res!260059 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8518 a1!748) (size!8518 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8518 a1!748))))))))

(assert (=> start!70096 e!227816))

(assert (=> start!70096 true))

(declare-fun array_inv!8070 (array!19594) Bool)

(assert (=> start!70096 (array_inv!8070 a2!748)))

(assert (=> start!70096 (array_inv!8070 a1!748)))

(declare-fun b!316980 () Bool)

(assert (=> b!316980 (= e!227816 (not true))))

(declare-fun bitAt!0 (array!19594 (_ BitVec 64)) Bool)

(assert (=> b!316980 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21749 0))(
  ( (Unit!21750) )
))
(declare-fun lt!443072 () Unit!21749)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19594 array!19594 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21749)

(assert (=> b!316980 (= lt!443072 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!316981 () Bool)

(declare-fun res!260062 () Bool)

(assert (=> b!316981 (=> (not res!260062) (not e!227816))))

(assert (=> b!316981 (= res!260062 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!316982 () Bool)

(declare-fun res!260061 () Bool)

(assert (=> b!316982 (=> (not res!260061) (not e!227816))))

(assert (=> b!316982 (= res!260061 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!316983 () Bool)

(declare-fun res!260063 () Bool)

(assert (=> b!316983 (=> (not res!260063) (not e!227816))))

(assert (=> b!316983 (= res!260063 (not (= i!999 from!855)))))

(assert (= (and start!70096 res!260059) b!316982))

(assert (= (and b!316982 res!260061) b!316981))

(assert (= (and b!316981 res!260062) b!316978))

(assert (= (and b!316978 res!260058) b!316979))

(assert (= (and b!316979 res!260060) b!316983))

(assert (= (and b!316983 res!260063) b!316980))

(declare-fun m!454973 () Bool)

(assert (=> b!316981 m!454973))

(declare-fun m!454975 () Bool)

(assert (=> b!316981 m!454975))

(declare-fun m!454977 () Bool)

(assert (=> b!316979 m!454977))

(declare-fun m!454979 () Bool)

(assert (=> b!316982 m!454979))

(declare-fun m!454981 () Bool)

(assert (=> b!316980 m!454981))

(declare-fun m!454983 () Bool)

(assert (=> b!316980 m!454983))

(declare-fun m!454985 () Bool)

(assert (=> b!316980 m!454985))

(declare-fun m!454987 () Bool)

(assert (=> start!70096 m!454987))

(declare-fun m!454989 () Bool)

(assert (=> start!70096 m!454989))

(push 1)

(assert (not start!70096))

(assert (not b!316979))

(assert (not b!316982))

(assert (not b!316980))

(assert (not b!316981))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70126 () Bool)

(assert start!70126)

(declare-fun b!317248 () Bool)

(declare-fun res!260333 () Bool)

(declare-fun e!227953 () Bool)

(assert (=> b!317248 (=> (not res!260333) (not e!227953))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317248 (= res!260333 (not (= i!999 from!855)))))

(declare-fun b!317249 () Bool)

(assert (=> b!317249 (= e!227953 (not true))))

(declare-datatypes ((array!19624 0))(
  ( (array!19625 (arr!9619 (Array (_ BitVec 32) (_ BitVec 8))) (size!8533 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19624)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19624)

(declare-fun arrayBitRangesEq!0 (array!19624 array!19624 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317249 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21779 0))(
  ( (Unit!21780) )
))
(declare-fun lt!443119 () Unit!21779)

(declare-fun arrayBitRangesEqPrepend!0 (array!19624 array!19624 (_ BitVec 64) (_ BitVec 64)) Unit!21779)

(assert (=> b!317249 (= lt!443119 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19624 (_ BitVec 64)) Bool)

(assert (=> b!317249 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443120 () Unit!21779)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19624 array!19624 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21779)

(assert (=> b!317249 (= lt!443120 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317250 () Bool)

(declare-fun res!260328 () Bool)

(assert (=> b!317250 (=> (not res!260328) (not e!227953))))

(assert (=> b!317250 (= res!260328 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!260329 () Bool)

(assert (=> start!70126 (=> (not res!260329) (not e!227953))))

(assert (=> start!70126 (= res!260329 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8533 a1!748) (size!8533 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8533 a1!748))))))))

(assert (=> start!70126 e!227953))

(assert (=> start!70126 true))

(declare-fun array_inv!8085 (array!19624) Bool)

(assert (=> start!70126 (array_inv!8085 a2!748)))

(assert (=> start!70126 (array_inv!8085 a1!748)))

(declare-fun b!317251 () Bool)

(declare-fun res!260331 () Bool)

(assert (=> b!317251 (=> (not res!260331) (not e!227953))))

(assert (=> b!317251 (= res!260331 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317252 () Bool)

(declare-fun res!260330 () Bool)

(assert (=> b!317252 (=> (not res!260330) (not e!227953))))

(assert (=> b!317252 (= res!260330 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317253 () Bool)

(declare-fun res!260332 () Bool)

(assert (=> b!317253 (=> (not res!260332) (not e!227953))))

(assert (=> b!317253 (= res!260332 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70126 res!260329) b!317250))

(assert (= (and b!317250 res!260328) b!317253))

(assert (= (and b!317253 res!260332) b!317252))

(assert (= (and b!317252 res!260330) b!317251))

(assert (= (and b!317251 res!260331) b!317248))

(assert (= (and b!317248 res!260333) b!317249))

(declare-fun m!455243 () Bool)

(assert (=> start!70126 m!455243))

(declare-fun m!455245 () Bool)

(assert (=> start!70126 m!455245))

(declare-fun m!455247 () Bool)

(assert (=> b!317253 m!455247))

(declare-fun m!455249 () Bool)

(assert (=> b!317253 m!455249))

(declare-fun m!455251 () Bool)

(assert (=> b!317250 m!455251))

(declare-fun m!455253 () Bool)

(assert (=> b!317251 m!455253))

(declare-fun m!455255 () Bool)

(assert (=> b!317249 m!455255))

(declare-fun m!455257 () Bool)

(assert (=> b!317249 m!455257))

(declare-fun m!455259 () Bool)

(assert (=> b!317249 m!455259))

(declare-fun m!455261 () Bool)

(assert (=> b!317249 m!455261))

(declare-fun m!455263 () Bool)

(assert (=> b!317249 m!455263))

(push 1)

(assert (not start!70126))

(assert (not b!317253))

(assert (not b!317249))

(assert (not b!317250))

(assert (not b!317251))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


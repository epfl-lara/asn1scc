; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70244 () Bool)

(assert start!70244)

(declare-fun b!318256 () Bool)

(declare-fun res!261341 () Bool)

(declare-fun e!228501 () Bool)

(assert (=> b!318256 (=> (not res!261341) (not e!228501))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!318256 (= res!261341 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318257 () Bool)

(assert (=> b!318257 (= e!228501 (not true))))

(declare-datatypes ((array!19742 0))(
  ( (array!19743 (arr!9678 (Array (_ BitVec 32) (_ BitVec 8))) (size!8592 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19742)

(declare-fun a1!748 () array!19742)

(declare-fun arrayBitRangesEq!0 (array!19742 array!19742 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318257 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21855 0))(
  ( (Unit!21856) )
))
(declare-fun lt!443312 () Unit!21855)

(declare-fun arrayBitRangesEqPrepend!0 (array!19742 array!19742 (_ BitVec 64) (_ BitVec 64)) Unit!21855)

(assert (=> b!318257 (= lt!443312 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19742 (_ BitVec 64)) Bool)

(assert (=> b!318257 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443311 () Unit!21855)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19742 array!19742 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21855)

(assert (=> b!318257 (= lt!443311 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318258 () Bool)

(declare-fun res!261336 () Bool)

(assert (=> b!318258 (=> (not res!261336) (not e!228501))))

(assert (=> b!318258 (= res!261336 (not (= i!999 from!855)))))

(declare-fun b!318260 () Bool)

(declare-fun res!261337 () Bool)

(assert (=> b!318260 (=> (not res!261337) (not e!228501))))

(assert (=> b!318260 (= res!261337 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318261 () Bool)

(declare-fun res!261339 () Bool)

(assert (=> b!318261 (=> (not res!261339) (not e!228501))))

(assert (=> b!318261 (= res!261339 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun res!261340 () Bool)

(assert (=> start!70244 (=> (not res!261340) (not e!228501))))

(assert (=> start!70244 (= res!261340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8592 a1!748) (size!8592 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8592 a1!748))))))))

(assert (=> start!70244 e!228501))

(assert (=> start!70244 true))

(declare-fun array_inv!8144 (array!19742) Bool)

(assert (=> start!70244 (array_inv!8144 a2!748)))

(assert (=> start!70244 (array_inv!8144 a1!748)))

(declare-fun b!318259 () Bool)

(declare-fun res!261338 () Bool)

(assert (=> b!318259 (=> (not res!261338) (not e!228501))))

(assert (=> b!318259 (= res!261338 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70244 res!261340) b!318259))

(assert (= (and b!318259 res!261338) b!318261))

(assert (= (and b!318261 res!261339) b!318256))

(assert (= (and b!318256 res!261341) b!318260))

(assert (= (and b!318260 res!261337) b!318258))

(assert (= (and b!318258 res!261336) b!318257))

(declare-fun m!456283 () Bool)

(assert (=> b!318260 m!456283))

(declare-fun m!456285 () Bool)

(assert (=> b!318257 m!456285))

(declare-fun m!456287 () Bool)

(assert (=> b!318257 m!456287))

(declare-fun m!456289 () Bool)

(assert (=> b!318257 m!456289))

(declare-fun m!456291 () Bool)

(assert (=> b!318257 m!456291))

(declare-fun m!456293 () Bool)

(assert (=> b!318257 m!456293))

(declare-fun m!456295 () Bool)

(assert (=> b!318261 m!456295))

(declare-fun m!456297 () Bool)

(assert (=> b!318261 m!456297))

(declare-fun m!456299 () Bool)

(assert (=> start!70244 m!456299))

(declare-fun m!456301 () Bool)

(assert (=> start!70244 m!456301))

(declare-fun m!456303 () Bool)

(assert (=> b!318259 m!456303))

(push 1)

(assert (not b!318261))

(assert (not b!318257))

(assert (not start!70244))

(assert (not b!318260))

(assert (not b!318259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


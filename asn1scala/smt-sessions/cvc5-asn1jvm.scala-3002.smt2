; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70246 () Bool)

(assert start!70246)

(declare-fun b!318274 () Bool)

(declare-fun res!261355 () Bool)

(declare-fun e!228510 () Bool)

(assert (=> b!318274 (=> (not res!261355) (not e!228510))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!318274 (= res!261355 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318275 () Bool)

(declare-fun res!261356 () Bool)

(assert (=> b!318275 (=> (not res!261356) (not e!228510))))

(declare-datatypes ((array!19744 0))(
  ( (array!19745 (arr!9679 (Array (_ BitVec 32) (_ BitVec 8))) (size!8593 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19744)

(declare-fun a1!748 () array!19744)

(declare-fun arrayBitRangesEq!0 (array!19744 array!19744 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318275 (= res!261356 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318277 () Bool)

(declare-fun res!261357 () Bool)

(assert (=> b!318277 (=> (not res!261357) (not e!228510))))

(assert (=> b!318277 (= res!261357 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318276 () Bool)

(declare-fun res!261359 () Bool)

(assert (=> b!318276 (=> (not res!261359) (not e!228510))))

(declare-fun bitAt!0 (array!19744 (_ BitVec 64)) Bool)

(assert (=> b!318276 (= res!261359 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun res!261354 () Bool)

(assert (=> start!70246 (=> (not res!261354) (not e!228510))))

(assert (=> start!70246 (= res!261354 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8593 a1!748) (size!8593 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8593 a1!748))))))))

(assert (=> start!70246 e!228510))

(assert (=> start!70246 true))

(declare-fun array_inv!8145 (array!19744) Bool)

(assert (=> start!70246 (array_inv!8145 a2!748)))

(assert (=> start!70246 (array_inv!8145 a1!748)))

(declare-fun b!318278 () Bool)

(assert (=> b!318278 (= e!228510 (not (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822) (bvslt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) i!999))))))

(assert (=> b!318278 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21857 0))(
  ( (Unit!21858) )
))
(declare-fun lt!443317 () Unit!21857)

(declare-fun arrayBitRangesEqPrepend!0 (array!19744 array!19744 (_ BitVec 64) (_ BitVec 64)) Unit!21857)

(assert (=> b!318278 (= lt!443317 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318278 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443318 () Unit!21857)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19744 array!19744 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21857)

(assert (=> b!318278 (= lt!443318 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318279 () Bool)

(declare-fun res!261358 () Bool)

(assert (=> b!318279 (=> (not res!261358) (not e!228510))))

(assert (=> b!318279 (= res!261358 (not (= i!999 from!855)))))

(assert (= (and start!70246 res!261354) b!318277))

(assert (= (and b!318277 res!261357) b!318276))

(assert (= (and b!318276 res!261359) b!318274))

(assert (= (and b!318274 res!261355) b!318275))

(assert (= (and b!318275 res!261356) b!318279))

(assert (= (and b!318279 res!261358) b!318278))

(declare-fun m!456305 () Bool)

(assert (=> b!318276 m!456305))

(declare-fun m!456307 () Bool)

(assert (=> b!318276 m!456307))

(declare-fun m!456309 () Bool)

(assert (=> b!318275 m!456309))

(declare-fun m!456311 () Bool)

(assert (=> start!70246 m!456311))

(declare-fun m!456313 () Bool)

(assert (=> start!70246 m!456313))

(declare-fun m!456315 () Bool)

(assert (=> b!318278 m!456315))

(declare-fun m!456317 () Bool)

(assert (=> b!318278 m!456317))

(declare-fun m!456319 () Bool)

(assert (=> b!318278 m!456319))

(declare-fun m!456321 () Bool)

(assert (=> b!318278 m!456321))

(declare-fun m!456323 () Bool)

(assert (=> b!318278 m!456323))

(declare-fun m!456325 () Bool)

(assert (=> b!318277 m!456325))

(push 1)

(assert (not b!318276))

(assert (not b!318275))

(assert (not b!318278))

(assert (not start!70246))

(assert (not b!318277))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70252 () Bool)

(assert start!70252)

(declare-fun b!318330 () Bool)

(declare-fun res!261412 () Bool)

(declare-fun e!228540 () Bool)

(assert (=> b!318330 (=> (not res!261412) (not e!228540))))

(declare-datatypes ((array!19750 0))(
  ( (array!19751 (arr!9682 (Array (_ BitVec 32) (_ BitVec 8))) (size!8596 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19750)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19750)

(declare-fun bitAt!0 (array!19750 (_ BitVec 64)) Bool)

(assert (=> b!318330 (= res!261412 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318332 () Bool)

(declare-fun e!228538 () Bool)

(assert (=> b!318332 (= e!228538 (or (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19750 array!19750 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318332 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun i!999 () (_ BitVec 64))

(declare-datatypes ((Unit!21863 0))(
  ( (Unit!21864) )
))
(declare-fun lt!443337 () Unit!21863)

(declare-fun rec!18 (array!19750 array!19750 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21863)

(assert (=> b!318332 (= lt!443337 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!318333 () Bool)

(declare-fun res!261414 () Bool)

(assert (=> b!318333 (=> (not res!261414) (not e!228540))))

(assert (=> b!318333 (= res!261414 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318334 () Bool)

(declare-fun res!261416 () Bool)

(assert (=> b!318334 (=> (not res!261416) (not e!228540))))

(assert (=> b!318334 (= res!261416 (not (= i!999 from!855)))))

(declare-fun b!318335 () Bool)

(declare-fun res!261411 () Bool)

(assert (=> b!318335 (=> (not res!261411) (not e!228540))))

(assert (=> b!318335 (= res!261411 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318336 () Bool)

(declare-fun res!261410 () Bool)

(assert (=> b!318336 (=> (not res!261410) (not e!228540))))

(assert (=> b!318336 (= res!261410 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!261413 () Bool)

(assert (=> start!70252 (=> (not res!261413) (not e!228540))))

(assert (=> start!70252 (= res!261413 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8596 a1!748) (size!8596 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8596 a1!748))))))))

(assert (=> start!70252 e!228540))

(assert (=> start!70252 true))

(declare-fun array_inv!8148 (array!19750) Bool)

(assert (=> start!70252 (array_inv!8148 a2!748)))

(assert (=> start!70252 (array_inv!8148 a1!748)))

(declare-fun b!318331 () Bool)

(assert (=> b!318331 (= e!228540 (not e!228538))))

(declare-fun res!261415 () Bool)

(assert (=> b!318331 (=> res!261415 e!228538)))

(assert (=> b!318331 (= res!261415 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!318331 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443339 () Unit!21863)

(declare-fun arrayBitRangesEqPrepend!0 (array!19750 array!19750 (_ BitVec 64) (_ BitVec 64)) Unit!21863)

(assert (=> b!318331 (= lt!443339 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318331 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443338 () Unit!21863)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19750 array!19750 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21863)

(assert (=> b!318331 (= lt!443338 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70252 res!261413) b!318335))

(assert (= (and b!318335 res!261411) b!318330))

(assert (= (and b!318330 res!261412) b!318333))

(assert (= (and b!318333 res!261414) b!318336))

(assert (= (and b!318336 res!261410) b!318334))

(assert (= (and b!318334 res!261416) b!318331))

(assert (= (and b!318331 (not res!261415)) b!318332))

(declare-fun m!456371 () Bool)

(assert (=> start!70252 m!456371))

(declare-fun m!456373 () Bool)

(assert (=> start!70252 m!456373))

(declare-fun m!456375 () Bool)

(assert (=> b!318332 m!456375))

(declare-fun m!456377 () Bool)

(assert (=> b!318332 m!456377))

(declare-fun m!456379 () Bool)

(assert (=> b!318335 m!456379))

(declare-fun m!456381 () Bool)

(assert (=> b!318331 m!456381))

(declare-fun m!456383 () Bool)

(assert (=> b!318331 m!456383))

(declare-fun m!456385 () Bool)

(assert (=> b!318331 m!456385))

(declare-fun m!456387 () Bool)

(assert (=> b!318331 m!456387))

(declare-fun m!456389 () Bool)

(assert (=> b!318331 m!456389))

(declare-fun m!456391 () Bool)

(assert (=> b!318336 m!456391))

(declare-fun m!456393 () Bool)

(assert (=> b!318330 m!456393))

(declare-fun m!456395 () Bool)

(assert (=> b!318330 m!456395))

(push 1)

(assert (not b!318330))

(assert (not start!70252))

(assert (not b!318332))

(assert (not b!318335))

(assert (not b!318336))

(assert (not b!318331))

(check-sat)

(pop 1)

(push 1)

(check-sat)


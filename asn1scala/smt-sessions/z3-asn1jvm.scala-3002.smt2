; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70248 () Bool)

(assert start!70248)

(declare-fun b!318292 () Bool)

(declare-fun res!261376 () Bool)

(declare-fun e!228518 () Bool)

(assert (=> b!318292 (=> (not res!261376) (not e!228518))))

(declare-datatypes ((array!19746 0))(
  ( (array!19747 (arr!9680 (Array (_ BitVec 32) (_ BitVec 8))) (size!8594 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19746)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19746)

(declare-fun arrayBitRangesEq!0 (array!19746 array!19746 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318292 (= res!261376 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318293 () Bool)

(declare-fun res!261375 () Bool)

(assert (=> b!318293 (=> (not res!261375) (not e!228518))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318293 (= res!261375 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318294 () Bool)

(declare-fun res!261374 () Bool)

(assert (=> b!318294 (=> (not res!261374) (not e!228518))))

(assert (=> b!318294 (= res!261374 (not (= i!999 from!855)))))

(declare-fun res!261377 () Bool)

(assert (=> start!70248 (=> (not res!261377) (not e!228518))))

(assert (=> start!70248 (= res!261377 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8594 a1!748) (size!8594 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8594 a1!748))))))))

(assert (=> start!70248 e!228518))

(assert (=> start!70248 true))

(declare-fun array_inv!8146 (array!19746) Bool)

(assert (=> start!70248 (array_inv!8146 a2!748)))

(assert (=> start!70248 (array_inv!8146 a1!748)))

(declare-fun b!318295 () Bool)

(declare-fun res!261372 () Bool)

(assert (=> b!318295 (=> (not res!261372) (not e!228518))))

(assert (=> b!318295 (= res!261372 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318296 () Bool)

(declare-fun res!261373 () Bool)

(assert (=> b!318296 (=> (not res!261373) (not e!228518))))

(declare-fun bitAt!0 (array!19746 (_ BitVec 64)) Bool)

(assert (=> b!318296 (= res!261373 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318297 () Bool)

(assert (=> b!318297 (= e!228518 (not (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822) (bvslt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) i!999))))))

(assert (=> b!318297 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21859 0))(
  ( (Unit!21860) )
))
(declare-fun lt!443323 () Unit!21859)

(declare-fun arrayBitRangesEqPrepend!0 (array!19746 array!19746 (_ BitVec 64) (_ BitVec 64)) Unit!21859)

(assert (=> b!318297 (= lt!443323 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318297 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443324 () Unit!21859)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19746 array!19746 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21859)

(assert (=> b!318297 (= lt!443324 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70248 res!261377) b!318292))

(assert (= (and b!318292 res!261376) b!318296))

(assert (= (and b!318296 res!261373) b!318293))

(assert (= (and b!318293 res!261375) b!318295))

(assert (= (and b!318295 res!261372) b!318294))

(assert (= (and b!318294 res!261374) b!318297))

(declare-fun m!456327 () Bool)

(assert (=> start!70248 m!456327))

(declare-fun m!456329 () Bool)

(assert (=> start!70248 m!456329))

(declare-fun m!456331 () Bool)

(assert (=> b!318292 m!456331))

(declare-fun m!456333 () Bool)

(assert (=> b!318297 m!456333))

(declare-fun m!456335 () Bool)

(assert (=> b!318297 m!456335))

(declare-fun m!456337 () Bool)

(assert (=> b!318297 m!456337))

(declare-fun m!456339 () Bool)

(assert (=> b!318297 m!456339))

(declare-fun m!456341 () Bool)

(assert (=> b!318297 m!456341))

(declare-fun m!456343 () Bool)

(assert (=> b!318295 m!456343))

(declare-fun m!456345 () Bool)

(assert (=> b!318296 m!456345))

(declare-fun m!456347 () Bool)

(assert (=> b!318296 m!456347))

(check-sat (not start!70248) (not b!318296) (not b!318295) (not b!318292) (not b!318297))
(check-sat)

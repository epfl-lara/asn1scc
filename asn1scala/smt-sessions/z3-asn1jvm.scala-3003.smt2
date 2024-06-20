; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70254 () Bool)

(assert start!70254)

(declare-fun b!318351 () Bool)

(declare-fun res!261435 () Bool)

(declare-fun e!228550 () Bool)

(assert (=> b!318351 (=> (not res!261435) (not e!228550))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!318351 (= res!261435 (not (= i!999 from!855)))))

(declare-fun b!318352 () Bool)

(declare-fun res!261433 () Bool)

(assert (=> b!318352 (=> (not res!261433) (not e!228550))))

(declare-datatypes ((array!19752 0))(
  ( (array!19753 (arr!9683 (Array (_ BitVec 32) (_ BitVec 8))) (size!8597 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19752)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19752)

(declare-fun arrayBitRangesEq!0 (array!19752 array!19752 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318352 (= res!261433 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318353 () Bool)

(declare-fun res!261434 () Bool)

(assert (=> b!318353 (=> (not res!261434) (not e!228550))))

(assert (=> b!318353 (= res!261434 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318354 () Bool)

(declare-fun e!228551 () Bool)

(assert (=> b!318354 (= e!228550 (not e!228551))))

(declare-fun res!261436 () Bool)

(assert (=> b!318354 (=> res!261436 e!228551)))

(assert (=> b!318354 (= res!261436 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!318354 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21865 0))(
  ( (Unit!21866) )
))
(declare-fun lt!443348 () Unit!21865)

(declare-fun arrayBitRangesEqPrepend!0 (array!19752 array!19752 (_ BitVec 64) (_ BitVec 64)) Unit!21865)

(assert (=> b!318354 (= lt!443348 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19752 (_ BitVec 64)) Bool)

(assert (=> b!318354 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443347 () Unit!21865)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19752 array!19752 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21865)

(assert (=> b!318354 (= lt!443347 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!261437 () Bool)

(assert (=> start!70254 (=> (not res!261437) (not e!228550))))

(assert (=> start!70254 (= res!261437 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8597 a1!748) (size!8597 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8597 a1!748))))))))

(assert (=> start!70254 e!228550))

(assert (=> start!70254 true))

(declare-fun array_inv!8149 (array!19752) Bool)

(assert (=> start!70254 (array_inv!8149 a2!748)))

(assert (=> start!70254 (array_inv!8149 a1!748)))

(declare-fun b!318355 () Bool)

(assert (=> b!318355 (= e!228551 (or (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!318355 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443346 () Unit!21865)

(declare-fun rec!18 (array!19752 array!19752 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21865)

(assert (=> b!318355 (= lt!443346 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!318356 () Bool)

(declare-fun res!261431 () Bool)

(assert (=> b!318356 (=> (not res!261431) (not e!228550))))

(assert (=> b!318356 (= res!261431 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318357 () Bool)

(declare-fun res!261432 () Bool)

(assert (=> b!318357 (=> (not res!261432) (not e!228550))))

(assert (=> b!318357 (= res!261432 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70254 res!261437) b!318352))

(assert (= (and b!318352 res!261433) b!318356))

(assert (= (and b!318356 res!261431) b!318353))

(assert (= (and b!318353 res!261434) b!318357))

(assert (= (and b!318357 res!261432) b!318351))

(assert (= (and b!318351 res!261435) b!318354))

(assert (= (and b!318354 (not res!261436)) b!318355))

(declare-fun m!456397 () Bool)

(assert (=> b!318352 m!456397))

(declare-fun m!456399 () Bool)

(assert (=> start!70254 m!456399))

(declare-fun m!456401 () Bool)

(assert (=> start!70254 m!456401))

(declare-fun m!456403 () Bool)

(assert (=> b!318356 m!456403))

(declare-fun m!456405 () Bool)

(assert (=> b!318356 m!456405))

(declare-fun m!456407 () Bool)

(assert (=> b!318355 m!456407))

(declare-fun m!456409 () Bool)

(assert (=> b!318355 m!456409))

(declare-fun m!456411 () Bool)

(assert (=> b!318357 m!456411))

(declare-fun m!456413 () Bool)

(assert (=> b!318354 m!456413))

(declare-fun m!456415 () Bool)

(assert (=> b!318354 m!456415))

(declare-fun m!456417 () Bool)

(assert (=> b!318354 m!456417))

(declare-fun m!456419 () Bool)

(assert (=> b!318354 m!456419))

(declare-fun m!456421 () Bool)

(assert (=> b!318354 m!456421))

(check-sat (not b!318357) (not b!318352) (not b!318356) (not b!318355) (not start!70254) (not b!318354))
(check-sat)

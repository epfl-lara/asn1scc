; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70128 () Bool)

(assert start!70128)

(declare-fun b!317266 () Bool)

(declare-fun res!260348 () Bool)

(declare-fun e!227962 () Bool)

(assert (=> b!317266 (=> (not res!260348) (not e!227962))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317266 (= res!260348 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317267 () Bool)

(assert (=> b!317267 (= e!227962 (not true))))

(declare-datatypes ((array!19626 0))(
  ( (array!19627 (arr!9620 (Array (_ BitVec 32) (_ BitVec 8))) (size!8534 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19626)

(declare-fun a1!748 () array!19626)

(declare-fun arrayBitRangesEq!0 (array!19626 array!19626 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317267 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21781 0))(
  ( (Unit!21782) )
))
(declare-fun lt!443125 () Unit!21781)

(declare-fun arrayBitRangesEqPrepend!0 (array!19626 array!19626 (_ BitVec 64) (_ BitVec 64)) Unit!21781)

(assert (=> b!317267 (= lt!443125 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19626 (_ BitVec 64)) Bool)

(assert (=> b!317267 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443126 () Unit!21781)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19626 array!19626 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21781)

(assert (=> b!317267 (= lt!443126 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317268 () Bool)

(declare-fun res!260346 () Bool)

(assert (=> b!317268 (=> (not res!260346) (not e!227962))))

(assert (=> b!317268 (= res!260346 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317269 () Bool)

(declare-fun res!260350 () Bool)

(assert (=> b!317269 (=> (not res!260350) (not e!227962))))

(assert (=> b!317269 (= res!260350 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317270 () Bool)

(declare-fun res!260347 () Bool)

(assert (=> b!317270 (=> (not res!260347) (not e!227962))))

(assert (=> b!317270 (= res!260347 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317271 () Bool)

(declare-fun res!260349 () Bool)

(assert (=> b!317271 (=> (not res!260349) (not e!227962))))

(assert (=> b!317271 (= res!260349 (not (= i!999 from!855)))))

(declare-fun res!260351 () Bool)

(assert (=> start!70128 (=> (not res!260351) (not e!227962))))

(assert (=> start!70128 (= res!260351 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8534 a1!748) (size!8534 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8534 a1!748))))))))

(assert (=> start!70128 e!227962))

(assert (=> start!70128 true))

(declare-fun array_inv!8086 (array!19626) Bool)

(assert (=> start!70128 (array_inv!8086 a2!748)))

(assert (=> start!70128 (array_inv!8086 a1!748)))

(assert (= (and start!70128 res!260351) b!317268))

(assert (= (and b!317268 res!260346) b!317269))

(assert (= (and b!317269 res!260350) b!317266))

(assert (= (and b!317266 res!260348) b!317270))

(assert (= (and b!317270 res!260347) b!317271))

(assert (= (and b!317271 res!260349) b!317267))

(declare-fun m!455265 () Bool)

(assert (=> b!317270 m!455265))

(declare-fun m!455267 () Bool)

(assert (=> b!317268 m!455267))

(declare-fun m!455269 () Bool)

(assert (=> b!317269 m!455269))

(declare-fun m!455271 () Bool)

(assert (=> b!317269 m!455271))

(declare-fun m!455273 () Bool)

(assert (=> b!317267 m!455273))

(declare-fun m!455275 () Bool)

(assert (=> b!317267 m!455275))

(declare-fun m!455277 () Bool)

(assert (=> b!317267 m!455277))

(declare-fun m!455279 () Bool)

(assert (=> b!317267 m!455279))

(declare-fun m!455281 () Bool)

(assert (=> b!317267 m!455281))

(declare-fun m!455283 () Bool)

(assert (=> start!70128 m!455283))

(declare-fun m!455285 () Bool)

(assert (=> start!70128 m!455285))

(check-sat (not b!317268) (not b!317269) (not b!317267) (not b!317270) (not start!70128))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70242 () Bool)

(assert start!70242)

(declare-fun res!261319 () Bool)

(declare-fun e!228493 () Bool)

(assert (=> start!70242 (=> (not res!261319) (not e!228493))))

(declare-datatypes ((array!19740 0))(
  ( (array!19741 (arr!9677 (Array (_ BitVec 32) (_ BitVec 8))) (size!8591 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19740)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19740)

(assert (=> start!70242 (= res!261319 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8591 a1!748) (size!8591 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8591 a1!748))))))))

(assert (=> start!70242 e!228493))

(assert (=> start!70242 true))

(declare-fun array_inv!8143 (array!19740) Bool)

(assert (=> start!70242 (array_inv!8143 a2!748)))

(assert (=> start!70242 (array_inv!8143 a1!748)))

(declare-fun b!318238 () Bool)

(declare-fun res!261323 () Bool)

(assert (=> b!318238 (=> (not res!261323) (not e!228493))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19740 array!19740 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318238 (= res!261323 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318239 () Bool)

(assert (=> b!318239 (= e!228493 (not true))))

(assert (=> b!318239 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21853 0))(
  ( (Unit!21854) )
))
(declare-fun lt!443305 () Unit!21853)

(declare-fun arrayBitRangesEqPrepend!0 (array!19740 array!19740 (_ BitVec 64) (_ BitVec 64)) Unit!21853)

(assert (=> b!318239 (= lt!443305 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19740 (_ BitVec 64)) Bool)

(assert (=> b!318239 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443306 () Unit!21853)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19740 array!19740 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21853)

(assert (=> b!318239 (= lt!443306 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318240 () Bool)

(declare-fun res!261320 () Bool)

(assert (=> b!318240 (=> (not res!261320) (not e!228493))))

(assert (=> b!318240 (= res!261320 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318241 () Bool)

(declare-fun res!261321 () Bool)

(assert (=> b!318241 (=> (not res!261321) (not e!228493))))

(assert (=> b!318241 (= res!261321 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318242 () Bool)

(declare-fun res!261322 () Bool)

(assert (=> b!318242 (=> (not res!261322) (not e!228493))))

(assert (=> b!318242 (= res!261322 (not (= i!999 from!855)))))

(declare-fun b!318243 () Bool)

(declare-fun res!261318 () Bool)

(assert (=> b!318243 (=> (not res!261318) (not e!228493))))

(assert (=> b!318243 (= res!261318 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70242 res!261319) b!318240))

(assert (= (and b!318240 res!261320) b!318243))

(assert (= (and b!318243 res!261318) b!318241))

(assert (= (and b!318241 res!261321) b!318238))

(assert (= (and b!318238 res!261323) b!318242))

(assert (= (and b!318242 res!261322) b!318239))

(declare-fun m!456261 () Bool)

(assert (=> start!70242 m!456261))

(declare-fun m!456263 () Bool)

(assert (=> start!70242 m!456263))

(declare-fun m!456265 () Bool)

(assert (=> b!318243 m!456265))

(declare-fun m!456267 () Bool)

(assert (=> b!318243 m!456267))

(declare-fun m!456269 () Bool)

(assert (=> b!318240 m!456269))

(declare-fun m!456271 () Bool)

(assert (=> b!318239 m!456271))

(declare-fun m!456273 () Bool)

(assert (=> b!318239 m!456273))

(declare-fun m!456275 () Bool)

(assert (=> b!318239 m!456275))

(declare-fun m!456277 () Bool)

(assert (=> b!318239 m!456277))

(declare-fun m!456279 () Bool)

(assert (=> b!318239 m!456279))

(declare-fun m!456281 () Bool)

(assert (=> b!318238 m!456281))

(check-sat (not b!318243) (not b!318239) (not b!318240) (not b!318238) (not start!70242))

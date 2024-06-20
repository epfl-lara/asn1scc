; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70230 () Bool)

(assert start!70230)

(declare-fun b!318130 () Bool)

(declare-fun res!261210 () Bool)

(declare-fun e!228438 () Bool)

(assert (=> b!318130 (=> (not res!261210) (not e!228438))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!318130 (= res!261210 (not (= i!999 from!855)))))

(declare-fun b!318131 () Bool)

(declare-fun res!261214 () Bool)

(assert (=> b!318131 (=> (not res!261214) (not e!228438))))

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((array!19728 0))(
  ( (array!19729 (arr!9671 (Array (_ BitVec 32) (_ BitVec 8))) (size!8585 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19728)

(declare-fun a2!748 () array!19728)

(declare-fun bitAt!0 (array!19728 (_ BitVec 64)) Bool)

(assert (=> b!318131 (= res!261214 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318132 () Bool)

(declare-fun res!261211 () Bool)

(assert (=> b!318132 (=> (not res!261211) (not e!228438))))

(declare-fun arrayBitRangesEq!0 (array!19728 array!19728 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318132 (= res!261211 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318133 () Bool)

(declare-fun res!261215 () Bool)

(assert (=> b!318133 (=> (not res!261215) (not e!228438))))

(assert (=> b!318133 (= res!261215 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318135 () Bool)

(declare-fun res!261212 () Bool)

(assert (=> b!318135 (=> (not res!261212) (not e!228438))))

(assert (=> b!318135 (= res!261212 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318134 () Bool)

(assert (=> b!318134 (= e!228438 (not (or (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!318134 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21841 0))(
  ( (Unit!21842) )
))
(declare-fun lt!443269 () Unit!21841)

(declare-fun arrayBitRangesEqPrepend!0 (array!19728 array!19728 (_ BitVec 64) (_ BitVec 64)) Unit!21841)

(assert (=> b!318134 (= lt!443269 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318134 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443270 () Unit!21841)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19728 array!19728 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21841)

(assert (=> b!318134 (= lt!443270 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!261213 () Bool)

(assert (=> start!70230 (=> (not res!261213) (not e!228438))))

(assert (=> start!70230 (= res!261213 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8585 a1!748) (size!8585 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8585 a1!748))))))))

(assert (=> start!70230 e!228438))

(assert (=> start!70230 true))

(declare-fun array_inv!8137 (array!19728) Bool)

(assert (=> start!70230 (array_inv!8137 a2!748)))

(assert (=> start!70230 (array_inv!8137 a1!748)))

(assert (= (and start!70230 res!261213) b!318133))

(assert (= (and b!318133 res!261215) b!318131))

(assert (= (and b!318131 res!261214) b!318135))

(assert (= (and b!318135 res!261212) b!318132))

(assert (= (and b!318132 res!261211) b!318130))

(assert (= (and b!318130 res!261210) b!318134))

(declare-fun m!456129 () Bool)

(assert (=> b!318132 m!456129))

(declare-fun m!456131 () Bool)

(assert (=> b!318131 m!456131))

(declare-fun m!456133 () Bool)

(assert (=> b!318131 m!456133))

(declare-fun m!456135 () Bool)

(assert (=> b!318134 m!456135))

(declare-fun m!456137 () Bool)

(assert (=> b!318134 m!456137))

(declare-fun m!456139 () Bool)

(assert (=> b!318134 m!456139))

(declare-fun m!456141 () Bool)

(assert (=> b!318134 m!456141))

(declare-fun m!456143 () Bool)

(assert (=> b!318134 m!456143))

(declare-fun m!456145 () Bool)

(assert (=> start!70230 m!456145))

(declare-fun m!456147 () Bool)

(assert (=> start!70230 m!456147))

(declare-fun m!456149 () Bool)

(assert (=> b!318133 m!456149))

(check-sat (not start!70230) (not b!318131) (not b!318134) (not b!318132) (not b!318133))
(check-sat)

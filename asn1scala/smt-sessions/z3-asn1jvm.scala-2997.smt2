; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70218 () Bool)

(assert start!70218)

(declare-fun b!318022 () Bool)

(declare-fun res!261103 () Bool)

(declare-fun e!228383 () Bool)

(assert (=> b!318022 (=> (not res!261103) (not e!228383))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!318022 (= res!261103 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318023 () Bool)

(assert (=> b!318023 (= e!228383 (not true))))

(declare-datatypes ((array!19716 0))(
  ( (array!19717 (arr!9665 (Array (_ BitVec 32) (_ BitVec 8))) (size!8579 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19716)

(declare-fun a2!748 () array!19716)

(declare-fun bitAt!0 (array!19716 (_ BitVec 64)) Bool)

(assert (=> b!318023 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21829 0))(
  ( (Unit!21830) )
))
(declare-fun lt!443246 () Unit!21829)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19716 array!19716 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21829)

(assert (=> b!318023 (= lt!443246 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318024 () Bool)

(declare-fun res!261104 () Bool)

(assert (=> b!318024 (=> (not res!261104) (not e!228383))))

(assert (=> b!318024 (= res!261104 (not (= i!999 from!855)))))

(declare-fun b!318025 () Bool)

(declare-fun res!261102 () Bool)

(assert (=> b!318025 (=> (not res!261102) (not e!228383))))

(declare-fun arrayBitRangesEq!0 (array!19716 array!19716 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318025 (= res!261102 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!261106 () Bool)

(assert (=> start!70218 (=> (not res!261106) (not e!228383))))

(assert (=> start!70218 (= res!261106 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8579 a1!748) (size!8579 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8579 a1!748))))))))

(assert (=> start!70218 e!228383))

(assert (=> start!70218 true))

(declare-fun array_inv!8131 (array!19716) Bool)

(assert (=> start!70218 (array_inv!8131 a2!748)))

(assert (=> start!70218 (array_inv!8131 a1!748)))

(declare-fun b!318026 () Bool)

(declare-fun res!261107 () Bool)

(assert (=> b!318026 (=> (not res!261107) (not e!228383))))

(assert (=> b!318026 (= res!261107 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318027 () Bool)

(declare-fun res!261105 () Bool)

(assert (=> b!318027 (=> (not res!261105) (not e!228383))))

(assert (=> b!318027 (= res!261105 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70218 res!261106) b!318025))

(assert (= (and b!318025 res!261102) b!318026))

(assert (= (and b!318026 res!261107) b!318022))

(assert (= (and b!318022 res!261103) b!318027))

(assert (= (and b!318027 res!261105) b!318024))

(assert (= (and b!318024 res!261104) b!318023))

(declare-fun m!456017 () Bool)

(assert (=> b!318027 m!456017))

(declare-fun m!456019 () Bool)

(assert (=> b!318025 m!456019))

(declare-fun m!456021 () Bool)

(assert (=> start!70218 m!456021))

(declare-fun m!456023 () Bool)

(assert (=> start!70218 m!456023))

(declare-fun m!456025 () Bool)

(assert (=> b!318023 m!456025))

(declare-fun m!456027 () Bool)

(assert (=> b!318023 m!456027))

(declare-fun m!456029 () Bool)

(assert (=> b!318023 m!456029))

(declare-fun m!456031 () Bool)

(assert (=> b!318026 m!456031))

(declare-fun m!456033 () Bool)

(assert (=> b!318026 m!456033))

(check-sat (not b!318023) (not b!318026) (not b!318027) (not start!70218) (not b!318025))

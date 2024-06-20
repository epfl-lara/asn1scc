; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70224 () Bool)

(assert start!70224)

(declare-fun res!261157 () Bool)

(declare-fun e!228411 () Bool)

(assert (=> start!70224 (=> (not res!261157) (not e!228411))))

(declare-datatypes ((array!19722 0))(
  ( (array!19723 (arr!9668 (Array (_ BitVec 32) (_ BitVec 8))) (size!8582 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19722)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19722)

(assert (=> start!70224 (= res!261157 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8582 a1!748) (size!8582 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8582 a1!748))))))))

(assert (=> start!70224 e!228411))

(assert (=> start!70224 true))

(declare-fun array_inv!8134 (array!19722) Bool)

(assert (=> start!70224 (array_inv!8134 a2!748)))

(assert (=> start!70224 (array_inv!8134 a1!748)))

(declare-fun b!318076 () Bool)

(assert (=> b!318076 (= e!228411 (not true))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun bitAt!0 (array!19722 (_ BitVec 64)) Bool)

(assert (=> b!318076 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21835 0))(
  ( (Unit!21836) )
))
(declare-fun lt!443255 () Unit!21835)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19722 array!19722 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21835)

(assert (=> b!318076 (= lt!443255 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318077 () Bool)

(declare-fun res!261156 () Bool)

(assert (=> b!318077 (=> (not res!261156) (not e!228411))))

(assert (=> b!318077 (= res!261156 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318078 () Bool)

(declare-fun res!261160 () Bool)

(assert (=> b!318078 (=> (not res!261160) (not e!228411))))

(declare-fun arrayBitRangesEq!0 (array!19722 array!19722 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318078 (= res!261160 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318079 () Bool)

(declare-fun res!261159 () Bool)

(assert (=> b!318079 (=> (not res!261159) (not e!228411))))

(assert (=> b!318079 (= res!261159 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318080 () Bool)

(declare-fun res!261158 () Bool)

(assert (=> b!318080 (=> (not res!261158) (not e!228411))))

(assert (=> b!318080 (= res!261158 (not (= i!999 from!855)))))

(declare-fun b!318081 () Bool)

(declare-fun res!261161 () Bool)

(assert (=> b!318081 (=> (not res!261161) (not e!228411))))

(assert (=> b!318081 (= res!261161 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(assert (= (and start!70224 res!261157) b!318079))

(assert (= (and b!318079 res!261159) b!318077))

(assert (= (and b!318077 res!261156) b!318081))

(assert (= (and b!318081 res!261161) b!318078))

(assert (= (and b!318078 res!261160) b!318080))

(assert (= (and b!318080 res!261158) b!318076))

(declare-fun m!456071 () Bool)

(assert (=> start!70224 m!456071))

(declare-fun m!456073 () Bool)

(assert (=> start!70224 m!456073))

(declare-fun m!456075 () Bool)

(assert (=> b!318077 m!456075))

(declare-fun m!456077 () Bool)

(assert (=> b!318077 m!456077))

(declare-fun m!456079 () Bool)

(assert (=> b!318078 m!456079))

(declare-fun m!456081 () Bool)

(assert (=> b!318079 m!456081))

(declare-fun m!456083 () Bool)

(assert (=> b!318076 m!456083))

(declare-fun m!456085 () Bool)

(assert (=> b!318076 m!456085))

(declare-fun m!456087 () Bool)

(assert (=> b!318076 m!456087))

(check-sat (not b!318076) (not b!318079) (not b!318078) (not start!70224) (not b!318077))

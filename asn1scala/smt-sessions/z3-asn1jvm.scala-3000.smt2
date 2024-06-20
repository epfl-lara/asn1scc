; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70236 () Bool)

(assert start!70236)

(declare-fun res!261268 () Bool)

(declare-fun e!228465 () Bool)

(assert (=> start!70236 (=> (not res!261268) (not e!228465))))

(declare-datatypes ((array!19734 0))(
  ( (array!19735 (arr!9674 (Array (_ BitVec 32) (_ BitVec 8))) (size!8588 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19734)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19734)

(assert (=> start!70236 (= res!261268 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8588 a1!748) (size!8588 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8588 a1!748))))))))

(assert (=> start!70236 e!228465))

(assert (=> start!70236 true))

(declare-fun array_inv!8140 (array!19734) Bool)

(assert (=> start!70236 (array_inv!8140 a2!748)))

(assert (=> start!70236 (array_inv!8140 a1!748)))

(declare-fun b!318184 () Bool)

(declare-fun res!261267 () Bool)

(assert (=> b!318184 (=> (not res!261267) (not e!228465))))

(declare-fun arrayBitRangesEq!0 (array!19734 array!19734 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318184 (= res!261267 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318185 () Bool)

(declare-fun res!261265 () Bool)

(assert (=> b!318185 (=> (not res!261265) (not e!228465))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318185 (= res!261265 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318186 () Bool)

(assert (=> b!318186 (= e!228465 (not (and (bvsle from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))))

(assert (=> b!318186 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21847 0))(
  ( (Unit!21848) )
))
(declare-fun lt!443287 () Unit!21847)

(declare-fun arrayBitRangesEqPrepend!0 (array!19734 array!19734 (_ BitVec 64) (_ BitVec 64)) Unit!21847)

(assert (=> b!318186 (= lt!443287 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19734 (_ BitVec 64)) Bool)

(assert (=> b!318186 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443288 () Unit!21847)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19734 array!19734 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21847)

(assert (=> b!318186 (= lt!443288 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318187 () Bool)

(declare-fun res!261264 () Bool)

(assert (=> b!318187 (=> (not res!261264) (not e!228465))))

(assert (=> b!318187 (= res!261264 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318188 () Bool)

(declare-fun res!261269 () Bool)

(assert (=> b!318188 (=> (not res!261269) (not e!228465))))

(assert (=> b!318188 (= res!261269 (not (= i!999 from!855)))))

(declare-fun b!318189 () Bool)

(declare-fun res!261266 () Bool)

(assert (=> b!318189 (=> (not res!261266) (not e!228465))))

(assert (=> b!318189 (= res!261266 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70236 res!261268) b!318184))

(assert (= (and b!318184 res!261267) b!318189))

(assert (= (and b!318189 res!261266) b!318185))

(assert (= (and b!318185 res!261265) b!318187))

(assert (= (and b!318187 res!261264) b!318188))

(assert (= (and b!318188 res!261269) b!318186))

(declare-fun m!456195 () Bool)

(assert (=> b!318189 m!456195))

(declare-fun m!456197 () Bool)

(assert (=> b!318189 m!456197))

(declare-fun m!456199 () Bool)

(assert (=> start!70236 m!456199))

(declare-fun m!456201 () Bool)

(assert (=> start!70236 m!456201))

(declare-fun m!456203 () Bool)

(assert (=> b!318187 m!456203))

(declare-fun m!456205 () Bool)

(assert (=> b!318184 m!456205))

(declare-fun m!456207 () Bool)

(assert (=> b!318186 m!456207))

(declare-fun m!456209 () Bool)

(assert (=> b!318186 m!456209))

(declare-fun m!456211 () Bool)

(assert (=> b!318186 m!456211))

(declare-fun m!456213 () Bool)

(assert (=> b!318186 m!456213))

(declare-fun m!456215 () Bool)

(assert (=> b!318186 m!456215))

(check-sat (not b!318187) (not b!318186) (not b!318189) (not b!318184) (not start!70236))
(check-sat)

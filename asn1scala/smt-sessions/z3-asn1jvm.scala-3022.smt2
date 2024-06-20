; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70404 () Bool)

(assert start!70404)

(declare-fun b!318957 () Bool)

(declare-fun e!229172 () Bool)

(declare-fun at!309 () (_ BitVec 64))

(declare-datatypes ((array!19869 0))(
  ( (array!19870 (arr!9743 (Array (_ BitVec 32) (_ BitVec 8))) (size!8654 (_ BitVec 32))) )
))
(declare-fun a2!909 () array!19869)

(assert (=> b!318957 (= e!229172 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvslt at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8654 a2!909)))))))))

(declare-fun a1!909 () array!19869)

(declare-fun bitAt!0 (array!19869 (_ BitVec 64)) Bool)

(assert (=> b!318957 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((Unit!21901 0))(
  ( (Unit!21902) )
))
(declare-fun lt!443480 () Unit!21901)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun rec!22 (array!19869 array!19869 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21901)

(assert (=> b!318957 (= lt!443480 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(declare-fun b!318958 () Bool)

(declare-fun res!262015 () Bool)

(assert (=> b!318958 (=> (not res!262015) (not e!229172))))

(assert (=> b!318958 (= res!262015 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!318959 () Bool)

(declare-fun res!262017 () Bool)

(assert (=> b!318959 (=> (not res!262017) (not e!229172))))

(declare-fun arrayBitRangesEq!0 (array!19869 array!19869 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318959 (= res!262017 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun res!262013 () Bool)

(assert (=> start!70404 (=> (not res!262013) (not e!229172))))

(assert (=> start!70404 (= res!262013 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8654 a1!909) (size!8654 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8654 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70404 e!229172))

(assert (=> start!70404 true))

(declare-fun array_inv!8206 (array!19869) Bool)

(assert (=> start!70404 (array_inv!8206 a1!909)))

(assert (=> start!70404 (array_inv!8206 a2!909)))

(declare-fun b!318960 () Bool)

(declare-fun res!262018 () Bool)

(assert (=> b!318960 (=> (not res!262018) (not e!229172))))

(assert (=> b!318960 (= res!262018 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!318961 () Bool)

(declare-fun res!262016 () Bool)

(assert (=> b!318961 (=> (not res!262016) (not e!229172))))

(assert (=> b!318961 (= res!262016 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun b!318962 () Bool)

(declare-fun res!262014 () Bool)

(assert (=> b!318962 (=> (not res!262014) (not e!229172))))

(assert (=> b!318962 (= res!262014 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(assert (= (and start!70404 res!262013) b!318960))

(assert (= (and b!318960 res!262018) b!318958))

(assert (= (and b!318958 res!262015) b!318959))

(assert (= (and b!318959 res!262017) b!318962))

(assert (= (and b!318962 res!262014) b!318961))

(assert (= (and b!318961 res!262016) b!318957))

(declare-fun m!457185 () Bool)

(assert (=> b!318961 m!457185))

(declare-fun m!457187 () Bool)

(assert (=> b!318960 m!457187))

(declare-fun m!457189 () Bool)

(assert (=> b!318957 m!457189))

(declare-fun m!457191 () Bool)

(assert (=> b!318957 m!457191))

(declare-fun m!457193 () Bool)

(assert (=> b!318957 m!457193))

(declare-fun m!457195 () Bool)

(assert (=> start!70404 m!457195))

(declare-fun m!457197 () Bool)

(assert (=> start!70404 m!457197))

(declare-fun m!457199 () Bool)

(assert (=> b!318959 m!457199))

(check-sat (not b!318961) (not b!318957) (not b!318960) (not b!318959) (not start!70404))
(check-sat)

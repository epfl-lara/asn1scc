; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70398 () Bool)

(assert start!70398)

(declare-fun b!318903 () Bool)

(declare-fun res!261964 () Bool)

(declare-fun e!229144 () Bool)

(assert (=> b!318903 (=> (not res!261964) (not e!229144))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((array!19863 0))(
  ( (array!19864 (arr!9740 (Array (_ BitVec 32) (_ BitVec 8))) (size!8651 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19863)

(declare-fun a2!909 () array!19863)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19863 array!19863 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318903 (= res!261964 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun b!318904 () Bool)

(declare-fun res!261960 () Bool)

(assert (=> b!318904 (=> (not res!261960) (not e!229144))))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!318904 (= res!261960 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun res!261959 () Bool)

(assert (=> start!70398 (=> (not res!261959) (not e!229144))))

(assert (=> start!70398 (= res!261959 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8651 a1!909) (size!8651 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8651 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70398 e!229144))

(assert (=> start!70398 true))

(declare-fun array_inv!8203 (array!19863) Bool)

(assert (=> start!70398 (array_inv!8203 a1!909)))

(assert (=> start!70398 (array_inv!8203 a2!909)))

(declare-fun b!318905 () Bool)

(assert (=> b!318905 (= e!229144 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvslt at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8651 a1!909)))))))))

(declare-fun bitAt!0 (array!19863 (_ BitVec 64)) Bool)

(assert (=> b!318905 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-datatypes ((Unit!21895 0))(
  ( (Unit!21896) )
))
(declare-fun lt!443471 () Unit!21895)

(declare-fun rec!22 (array!19863 array!19863 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21895)

(assert (=> b!318905 (= lt!443471 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(declare-fun b!318906 () Bool)

(declare-fun res!261963 () Bool)

(assert (=> b!318906 (=> (not res!261963) (not e!229144))))

(assert (=> b!318906 (= res!261963 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318907 () Bool)

(declare-fun res!261962 () Bool)

(assert (=> b!318907 (=> (not res!261962) (not e!229144))))

(assert (=> b!318907 (= res!261962 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!318908 () Bool)

(declare-fun res!261961 () Bool)

(assert (=> b!318908 (=> (not res!261961) (not e!229144))))

(assert (=> b!318908 (= res!261961 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(assert (= (and start!70398 res!261959) b!318907))

(assert (= (and b!318907 res!261962) b!318904))

(assert (= (and b!318904 res!261960) b!318906))

(assert (= (and b!318906 res!261963) b!318908))

(assert (= (and b!318908 res!261961) b!318903))

(assert (= (and b!318903 res!261964) b!318905))

(declare-fun m!457137 () Bool)

(assert (=> b!318903 m!457137))

(declare-fun m!457139 () Bool)

(assert (=> start!70398 m!457139))

(declare-fun m!457141 () Bool)

(assert (=> start!70398 m!457141))

(declare-fun m!457143 () Bool)

(assert (=> b!318905 m!457143))

(declare-fun m!457145 () Bool)

(assert (=> b!318905 m!457145))

(declare-fun m!457147 () Bool)

(assert (=> b!318905 m!457147))

(declare-fun m!457149 () Bool)

(assert (=> b!318906 m!457149))

(declare-fun m!457151 () Bool)

(assert (=> b!318907 m!457151))

(check-sat (not b!318903) (not b!318905) (not b!318907) (not b!318906) (not start!70398))
(check-sat)

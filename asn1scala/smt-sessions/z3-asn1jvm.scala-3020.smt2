; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70392 () Bool)

(assert start!70392)

(declare-fun b!318858 () Bool)

(declare-fun res!261913 () Bool)

(declare-fun e!229119 () Bool)

(assert (=> b!318858 (=> (not res!261913) (not e!229119))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!318858 (= res!261913 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!318859 () Bool)

(declare-fun res!261914 () Bool)

(assert (=> b!318859 (=> (not res!261914) (not e!229119))))

(declare-datatypes ((array!19857 0))(
  ( (array!19858 (arr!9737 (Array (_ BitVec 32) (_ BitVec 8))) (size!8648 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19857)

(declare-fun a2!909 () array!19857)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19857 array!19857 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318859 (= res!261914 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318860 () Bool)

(assert (=> b!318860 (= e!229119 (and (= i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvsge at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8648 a2!909)))))))))

(declare-fun res!261916 () Bool)

(assert (=> start!70392 (=> (not res!261916) (not e!229119))))

(assert (=> start!70392 (= res!261916 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8648 a1!909) (size!8648 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8648 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70392 e!229119))

(assert (=> start!70392 true))

(declare-fun array_inv!8200 (array!19857) Bool)

(assert (=> start!70392 (array_inv!8200 a1!909)))

(assert (=> start!70392 (array_inv!8200 a2!909)))

(declare-fun b!318857 () Bool)

(declare-fun res!261915 () Bool)

(assert (=> b!318857 (=> (not res!261915) (not e!229119))))

(assert (=> b!318857 (= res!261915 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(assert (= (and start!70392 res!261916) b!318857))

(assert (= (and b!318857 res!261915) b!318858))

(assert (= (and b!318858 res!261913) b!318859))

(assert (= (and b!318859 res!261914) b!318860))

(declare-fun m!457105 () Bool)

(assert (=> b!318859 m!457105))

(declare-fun m!457107 () Bool)

(assert (=> start!70392 m!457107))

(declare-fun m!457109 () Bool)

(assert (=> start!70392 m!457109))

(declare-fun m!457111 () Bool)

(assert (=> b!318857 m!457111))

(check-sat (not start!70392) (not b!318859) (not b!318857))
(check-sat)

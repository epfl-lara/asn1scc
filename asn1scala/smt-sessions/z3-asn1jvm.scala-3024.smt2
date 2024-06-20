; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70416 () Bool)

(assert start!70416)

(declare-fun res!262094 () Bool)

(declare-fun e!229226 () Bool)

(assert (=> start!70416 (=> (not res!262094) (not e!229226))))

(declare-datatypes ((array!19881 0))(
  ( (array!19882 (arr!9749 (Array (_ BitVec 32) (_ BitVec 8))) (size!8660 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19881)

(declare-fun a2!909 () array!19881)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70416 (= res!262094 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8660 a1!909) (size!8660 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8660 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70416 e!229226))

(assert (=> start!70416 true))

(declare-fun array_inv!8212 (array!19881) Bool)

(assert (=> start!70416 (array_inv!8212 a1!909)))

(assert (=> start!70416 (array_inv!8212 a2!909)))

(declare-fun b!319037 () Bool)

(declare-fun res!262096 () Bool)

(assert (=> b!319037 (=> (not res!262096) (not e!229226))))

(declare-fun arrayBitRangesEq!0 (array!19881 array!19881 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319037 (= res!262096 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319039 () Bool)

(declare-fun res!262093 () Bool)

(assert (=> b!319039 (=> (not res!262093) (not e!229226))))

(declare-fun i!1041 () (_ BitVec 64))

(assert (=> b!319039 (= res!262093 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319038 () Bool)

(declare-fun res!262095 () Bool)

(assert (=> b!319038 (=> (not res!262095) (not e!229226))))

(assert (=> b!319038 (= res!262095 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319040 () Bool)

(assert (=> b!319040 (= e!229226 (bvslt (bvsub to!869 i!1041) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!70416 res!262094) b!319037))

(assert (= (and b!319037 res!262096) b!319038))

(assert (= (and b!319038 res!262095) b!319039))

(assert (= (and b!319039 res!262093) b!319040))

(declare-fun m!457249 () Bool)

(assert (=> start!70416 m!457249))

(declare-fun m!457251 () Bool)

(assert (=> start!70416 m!457251))

(declare-fun m!457253 () Bool)

(assert (=> b!319037 m!457253))

(declare-fun m!457255 () Bool)

(assert (=> b!319039 m!457255))

(check-sat (not start!70416) (not b!319039) (not b!319037))
(check-sat)

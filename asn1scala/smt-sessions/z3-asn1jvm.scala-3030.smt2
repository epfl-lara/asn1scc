; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70518 () Bool)

(assert start!70518)

(declare-fun b!319542 () Bool)

(declare-fun res!262545 () Bool)

(declare-fun e!229604 () Bool)

(assert (=> b!319542 (=> (not res!262545) (not e!229604))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((array!19923 0))(
  ( (array!19924 (arr!9770 (Array (_ BitVec 32) (_ BitVec 8))) (size!8678 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19923)

(declare-fun a2!909 () array!19923)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19923 array!19923 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319542 (= res!262545 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319543 () Bool)

(declare-fun res!262549 () Bool)

(assert (=> b!319543 (=> (not res!262549) (not e!229604))))

(assert (=> b!319543 (= res!262549 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun b!319544 () Bool)

(assert (=> b!319544 (= e!229604 (not true))))

(declare-fun at!309 () (_ BitVec 64))

(declare-fun bitAt!0 (array!19923 (_ BitVec 64)) Bool)

(assert (=> b!319544 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-fun from!902 () (_ BitVec 64))

(declare-datatypes ((Unit!21907 0))(
  ( (Unit!21908) )
))
(declare-fun lt!443570 () Unit!21907)

(declare-fun rec!22 (array!19923 array!19923 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21907)

(assert (=> b!319544 (= lt!443570 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(declare-fun b!319545 () Bool)

(declare-fun res!262548 () Bool)

(assert (=> b!319545 (=> (not res!262548) (not e!229604))))

(assert (=> b!319545 (= res!262548 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!319546 () Bool)

(declare-fun res!262544 () Bool)

(assert (=> b!319546 (=> (not res!262544) (not e!229604))))

(assert (=> b!319546 (= res!262544 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun res!262546 () Bool)

(assert (=> start!70518 (=> (not res!262546) (not e!229604))))

(assert (=> start!70518 (= res!262546 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8678 a1!909) (size!8678 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8678 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70518 e!229604))

(assert (=> start!70518 true))

(declare-fun array_inv!8230 (array!19923) Bool)

(assert (=> start!70518 (array_inv!8230 a1!909)))

(assert (=> start!70518 (array_inv!8230 a2!909)))

(declare-fun b!319547 () Bool)

(declare-fun res!262547 () Bool)

(assert (=> b!319547 (=> (not res!262547) (not e!229604))))

(assert (=> b!319547 (= res!262547 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(assert (= (and start!70518 res!262546) b!319546))

(assert (= (and b!319546 res!262544) b!319547))

(assert (= (and b!319547 res!262547) b!319542))

(assert (= (and b!319542 res!262545) b!319545))

(assert (= (and b!319545 res!262548) b!319543))

(assert (= (and b!319543 res!262549) b!319544))

(declare-fun m!457875 () Bool)

(assert (=> b!319542 m!457875))

(declare-fun m!457877 () Bool)

(assert (=> start!70518 m!457877))

(declare-fun m!457879 () Bool)

(assert (=> start!70518 m!457879))

(declare-fun m!457881 () Bool)

(assert (=> b!319546 m!457881))

(declare-fun m!457883 () Bool)

(assert (=> b!319544 m!457883))

(declare-fun m!457885 () Bool)

(assert (=> b!319544 m!457885))

(declare-fun m!457887 () Bool)

(assert (=> b!319544 m!457887))

(declare-fun m!457889 () Bool)

(assert (=> b!319543 m!457889))

(check-sat (not start!70518) (not b!319542) (not b!319544) (not b!319543) (not b!319546))

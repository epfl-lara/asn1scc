; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70410 () Bool)

(assert start!70410)

(declare-fun b!319004 () Bool)

(declare-fun e!229198 () Bool)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun i!1041 () (_ BitVec 64))

(assert (=> b!319004 (= e!229198 (and (not (= (bvand to!869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!869 i!1041) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!319002 () Bool)

(declare-fun res!262060 () Bool)

(assert (=> b!319002 (=> (not res!262060) (not e!229198))))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!319002 (= res!262060 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun res!262057 () Bool)

(assert (=> start!70410 (=> (not res!262057) (not e!229198))))

(declare-datatypes ((array!19875 0))(
  ( (array!19876 (arr!9746 (Array (_ BitVec 32) (_ BitVec 8))) (size!8657 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19875)

(declare-fun a2!909 () array!19875)

(assert (=> start!70410 (= res!262057 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8657 a1!909) (size!8657 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8657 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70410 e!229198))

(assert (=> start!70410 true))

(declare-fun array_inv!8209 (array!19875) Bool)

(assert (=> start!70410 (array_inv!8209 a1!909)))

(assert (=> start!70410 (array_inv!8209 a2!909)))

(declare-fun b!319003 () Bool)

(declare-fun res!262059 () Bool)

(assert (=> b!319003 (=> (not res!262059) (not e!229198))))

(declare-fun arrayBitRangesEq!0 (array!19875 array!19875 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319003 (= res!262059 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319001 () Bool)

(declare-fun res!262058 () Bool)

(assert (=> b!319001 (=> (not res!262058) (not e!229198))))

(assert (=> b!319001 (= res!262058 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(assert (= (and start!70410 res!262057) b!319001))

(assert (= (and b!319001 res!262058) b!319002))

(assert (= (and b!319002 res!262060) b!319003))

(assert (= (and b!319003 res!262059) b!319004))

(declare-fun m!457225 () Bool)

(assert (=> start!70410 m!457225))

(declare-fun m!457227 () Bool)

(assert (=> start!70410 m!457227))

(declare-fun m!457229 () Bool)

(assert (=> b!319003 m!457229))

(declare-fun m!457231 () Bool)

(assert (=> b!319001 m!457231))

(check-sat (not b!319003) (not start!70410) (not b!319001))
(check-sat)

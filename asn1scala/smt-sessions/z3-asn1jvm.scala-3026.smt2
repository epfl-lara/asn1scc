; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70464 () Bool)

(assert start!70464)

(declare-fun b!319228 () Bool)

(declare-fun res!262258 () Bool)

(declare-fun e!229375 () Bool)

(assert (=> b!319228 (=> (not res!262258) (not e!229375))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((array!19896 0))(
  ( (array!19897 (arr!9758 (Array (_ BitVec 32) (_ BitVec 8))) (size!8666 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19896)

(declare-fun a2!909 () array!19896)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19896 array!19896 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319228 (= res!262258 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun res!262261 () Bool)

(assert (=> start!70464 (=> (not res!262261) (not e!229375))))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70464 (= res!262261 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8666 a1!909) (size!8666 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8666 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70464 e!229375))

(assert (=> start!70464 true))

(declare-fun array_inv!8218 (array!19896) Bool)

(assert (=> start!70464 (array_inv!8218 a1!909)))

(assert (=> start!70464 (array_inv!8218 a2!909)))

(declare-fun b!319227 () Bool)

(declare-fun res!262259 () Bool)

(assert (=> b!319227 (=> (not res!262259) (not e!229375))))

(assert (=> b!319227 (= res!262259 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319229 () Bool)

(assert (=> b!319229 (= e!229375 (and (not (= i!1041 at!309)) (= (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!319226 () Bool)

(declare-fun res!262260 () Bool)

(assert (=> b!319226 (=> (not res!262260) (not e!229375))))

(assert (=> b!319226 (= res!262260 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(assert (= (and start!70464 res!262261) b!319226))

(assert (= (and b!319226 res!262260) b!319227))

(assert (= (and b!319227 res!262259) b!319228))

(assert (= (and b!319228 res!262258) b!319229))

(declare-fun m!457501 () Bool)

(assert (=> b!319228 m!457501))

(declare-fun m!457503 () Bool)

(assert (=> start!70464 m!457503))

(declare-fun m!457505 () Bool)

(assert (=> start!70464 m!457505))

(declare-fun m!457507 () Bool)

(assert (=> b!319226 m!457507))

(check-sat (not b!319228) (not start!70464) (not b!319226))
(check-sat)

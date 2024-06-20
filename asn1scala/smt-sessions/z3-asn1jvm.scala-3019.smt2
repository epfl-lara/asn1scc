; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70386 () Bool)

(assert start!70386)

(declare-fun res!261877 () Bool)

(declare-fun e!229092 () Bool)

(assert (=> start!70386 (=> (not res!261877) (not e!229092))))

(declare-datatypes ((array!19851 0))(
  ( (array!19852 (arr!9734 (Array (_ BitVec 32) (_ BitVec 8))) (size!8645 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19851)

(declare-fun a2!909 () array!19851)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70386 (= res!261877 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8645 a1!909) (size!8645 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8645 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70386 e!229092))

(assert (=> start!70386 true))

(declare-fun array_inv!8197 (array!19851) Bool)

(assert (=> start!70386 (array_inv!8197 a1!909)))

(assert (=> start!70386 (array_inv!8197 a2!909)))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun b!318824 () Bool)

(assert (=> b!318824 (= e!229092 (and (= i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvsge at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8645 a1!909)))))))))

(declare-fun b!318823 () Bool)

(declare-fun res!261880 () Bool)

(assert (=> b!318823 (=> (not res!261880) (not e!229092))))

(declare-fun arrayBitRangesEq!0 (array!19851 array!19851 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318823 (= res!261880 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318821 () Bool)

(declare-fun res!261879 () Bool)

(assert (=> b!318821 (=> (not res!261879) (not e!229092))))

(assert (=> b!318821 (= res!261879 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!318822 () Bool)

(declare-fun res!261878 () Bool)

(assert (=> b!318822 (=> (not res!261878) (not e!229092))))

(assert (=> b!318822 (= res!261878 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(assert (= (and start!70386 res!261877) b!318821))

(assert (= (and b!318821 res!261879) b!318822))

(assert (= (and b!318822 res!261878) b!318823))

(assert (= (and b!318823 res!261880) b!318824))

(declare-fun m!457081 () Bool)

(assert (=> start!70386 m!457081))

(declare-fun m!457083 () Bool)

(assert (=> start!70386 m!457083))

(declare-fun m!457085 () Bool)

(assert (=> b!318823 m!457085))

(declare-fun m!457087 () Bool)

(assert (=> b!318821 m!457087))

(check-sat (not b!318823) (not start!70386) (not b!318821))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69732 () Bool)

(assert start!69732)

(declare-fun b!313738 () Bool)

(declare-fun res!256888 () Bool)

(declare-fun e!225892 () Bool)

(assert (=> b!313738 (=> (not res!256888) (not e!225892))))

(declare-datatypes ((array!19296 0))(
  ( (array!19297 (arr!9452 (Array (_ BitVec 32) (_ BitVec 8))) (size!8372 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19296)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19296)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19296 array!19296 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313738 (= res!256888 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313739 () Bool)

(declare-fun res!256889 () Bool)

(assert (=> b!313739 (=> (not res!256889) (not e!225892))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!313739 (= res!256889 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313740 () Bool)

(declare-fun a1!825 () array!19296)

(assert (=> b!313740 (= e!225892 (bvsgt (size!8372 a1!825) (size!8372 a3!79)))))

(declare-fun b!313741 () Bool)

(declare-fun res!256887 () Bool)

(assert (=> b!313741 (=> (not res!256887) (not e!225892))))

(assert (=> b!313741 (= res!256887 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!256885 () Bool)

(assert (=> start!69732 (=> (not res!256885) (not e!225892))))

(assert (=> start!69732 (= res!256885 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8372 a1!825) (size!8372 a2!825)) (= (size!8372 a2!825) (size!8372 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8372 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8372 a2!825))))))))

(assert (=> start!69732 e!225892))

(assert (=> start!69732 true))

(declare-fun array_inv!7924 (array!19296) Bool)

(assert (=> start!69732 (array_inv!7924 a1!825)))

(assert (=> start!69732 (array_inv!7924 a3!79)))

(assert (=> start!69732 (array_inv!7924 a2!825)))

(declare-fun b!313742 () Bool)

(declare-fun res!256884 () Bool)

(assert (=> b!313742 (=> (not res!256884) (not e!225892))))

(assert (=> b!313742 (= res!256884 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313743 () Bool)

(declare-fun res!256886 () Bool)

(assert (=> b!313743 (=> (not res!256886) (not e!225892))))

(assert (=> b!313743 (= res!256886 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69732 res!256885) b!313741))

(assert (= (and b!313741 res!256887) b!313742))

(assert (= (and b!313742 res!256884) b!313739))

(assert (= (and b!313739 res!256889) b!313743))

(assert (= (and b!313743 res!256886) b!313738))

(assert (= (and b!313738 res!256888) b!313740))

(declare-fun m!451375 () Bool)

(assert (=> b!313738 m!451375))

(declare-fun m!451377 () Bool)

(assert (=> b!313742 m!451377))

(declare-fun m!451379 () Bool)

(assert (=> b!313741 m!451379))

(declare-fun m!451381 () Bool)

(assert (=> start!69732 m!451381))

(declare-fun m!451383 () Bool)

(assert (=> start!69732 m!451383))

(declare-fun m!451385 () Bool)

(assert (=> start!69732 m!451385))

(declare-fun m!451387 () Bool)

(assert (=> b!313743 m!451387))

(check-sat (not b!313742) (not start!69732) (not b!313738) (not b!313741) (not b!313743))
(check-sat)

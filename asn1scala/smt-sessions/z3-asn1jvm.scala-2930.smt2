; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69744 () Bool)

(assert start!69744)

(declare-fun b!313851 () Bool)

(declare-fun res!257003 () Bool)

(declare-fun e!225966 () Bool)

(assert (=> b!313851 (=> (not res!257003) (not e!225966))))

(declare-datatypes ((array!19308 0))(
  ( (array!19309 (arr!9458 (Array (_ BitVec 32) (_ BitVec 8))) (size!8378 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19308)

(declare-fun a3!79 () array!19308)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19308 array!19308 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313851 (= res!257003 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!313852 () Bool)

(declare-fun res!256997 () Bool)

(assert (=> b!313852 (=> (not res!256997) (not e!225966))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a2!825 () array!19308)

(assert (=> b!313852 (= res!256997 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!257002 () Bool)

(assert (=> start!69744 (=> (not res!257002) (not e!225966))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69744 (= res!257002 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8378 a1!825) (size!8378 a2!825)) (= (size!8378 a2!825) (size!8378 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8378 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8378 a2!825))))))))

(assert (=> start!69744 e!225966))

(assert (=> start!69744 true))

(declare-fun array_inv!7930 (array!19308) Bool)

(assert (=> start!69744 (array_inv!7930 a1!825)))

(assert (=> start!69744 (array_inv!7930 a3!79)))

(assert (=> start!69744 (array_inv!7930 a2!825)))

(declare-fun b!313853 () Bool)

(declare-fun res!256998 () Bool)

(assert (=> b!313853 (=> (not res!256998) (not e!225966))))

(assert (=> b!313853 (= res!256998 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313854 () Bool)

(declare-fun res!257000 () Bool)

(assert (=> b!313854 (=> (not res!257000) (not e!225966))))

(assert (=> b!313854 (= res!257000 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313855 () Bool)

(declare-fun res!256999 () Bool)

(assert (=> b!313855 (=> (not res!256999) (not e!225966))))

(assert (=> b!313855 (= res!256999 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313856 () Bool)

(assert (=> b!313856 (= e!225966 (and (= i!1020 mid!82) (bvsgt (size!8378 a1!825) (size!8378 a3!79))))))

(declare-fun b!313857 () Bool)

(declare-fun res!257001 () Bool)

(assert (=> b!313857 (=> (not res!257001) (not e!225966))))

(assert (=> b!313857 (= res!257001 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69744 res!257002) b!313853))

(assert (= (and b!313853 res!256998) b!313855))

(assert (= (and b!313855 res!256999) b!313857))

(assert (= (and b!313857 res!257001) b!313852))

(assert (= (and b!313852 res!256997) b!313854))

(assert (= (and b!313854 res!257000) b!313851))

(assert (= (and b!313851 res!257003) b!313856))

(declare-fun m!451461 () Bool)

(assert (=> b!313853 m!451461))

(declare-fun m!451463 () Bool)

(assert (=> b!313852 m!451463))

(declare-fun m!451465 () Bool)

(assert (=> b!313854 m!451465))

(declare-fun m!451467 () Bool)

(assert (=> start!69744 m!451467))

(declare-fun m!451469 () Bool)

(assert (=> start!69744 m!451469))

(declare-fun m!451471 () Bool)

(assert (=> start!69744 m!451471))

(declare-fun m!451473 () Bool)

(assert (=> b!313855 m!451473))

(declare-fun m!451475 () Bool)

(assert (=> b!313851 m!451475))

(check-sat (not b!313853) (not b!313851) (not start!69744) (not b!313852) (not b!313854) (not b!313855))
(check-sat)

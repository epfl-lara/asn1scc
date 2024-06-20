; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69746 () Bool)

(assert start!69746)

(declare-fun b!313872 () Bool)

(declare-fun res!257023 () Bool)

(declare-fun e!225978 () Bool)

(assert (=> b!313872 (=> (not res!257023) (not e!225978))))

(declare-datatypes ((array!19310 0))(
  ( (array!19311 (arr!9459 (Array (_ BitVec 32) (_ BitVec 8))) (size!8379 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19310)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19310)

(declare-fun arrayBitRangesEq!0 (array!19310 array!19310 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313872 (= res!257023 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19310)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun b!313873 () Bool)

(assert (=> b!313873 (= e!225978 (and (= i!1020 mid!82) (bvsgt (size!8379 a1!825) (size!8379 a3!79))))))

(declare-fun b!313875 () Bool)

(declare-fun res!257019 () Bool)

(assert (=> b!313875 (=> (not res!257019) (not e!225978))))

(assert (=> b!313875 (= res!257019 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313876 () Bool)

(declare-fun res!257018 () Bool)

(assert (=> b!313876 (=> (not res!257018) (not e!225978))))

(assert (=> b!313876 (= res!257018 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313877 () Bool)

(declare-fun res!257020 () Bool)

(assert (=> b!313877 (=> (not res!257020) (not e!225978))))

(assert (=> b!313877 (= res!257020 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313878 () Bool)

(declare-fun res!257021 () Bool)

(assert (=> b!313878 (=> (not res!257021) (not e!225978))))

(assert (=> b!313878 (= res!257021 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!257024 () Bool)

(assert (=> start!69746 (=> (not res!257024) (not e!225978))))

(assert (=> start!69746 (= res!257024 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8379 a1!825) (size!8379 a2!825)) (= (size!8379 a2!825) (size!8379 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8379 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8379 a2!825))))))))

(assert (=> start!69746 e!225978))

(assert (=> start!69746 true))

(declare-fun array_inv!7931 (array!19310) Bool)

(assert (=> start!69746 (array_inv!7931 a1!825)))

(assert (=> start!69746 (array_inv!7931 a3!79)))

(assert (=> start!69746 (array_inv!7931 a2!825)))

(declare-fun b!313874 () Bool)

(declare-fun res!257022 () Bool)

(assert (=> b!313874 (=> (not res!257022) (not e!225978))))

(assert (=> b!313874 (= res!257022 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69746 res!257024) b!313877))

(assert (= (and b!313877 res!257020) b!313872))

(assert (= (and b!313872 res!257023) b!313875))

(assert (= (and b!313875 res!257019) b!313876))

(assert (= (and b!313876 res!257018) b!313878))

(assert (= (and b!313878 res!257021) b!313874))

(assert (= (and b!313874 res!257022) b!313873))

(declare-fun m!451477 () Bool)

(assert (=> b!313874 m!451477))

(declare-fun m!451479 () Bool)

(assert (=> b!313878 m!451479))

(declare-fun m!451481 () Bool)

(assert (=> b!313876 m!451481))

(declare-fun m!451483 () Bool)

(assert (=> start!69746 m!451483))

(declare-fun m!451485 () Bool)

(assert (=> start!69746 m!451485))

(declare-fun m!451487 () Bool)

(assert (=> start!69746 m!451487))

(declare-fun m!451489 () Bool)

(assert (=> b!313872 m!451489))

(declare-fun m!451491 () Bool)

(assert (=> b!313877 m!451491))

(push 1)

(assert (not b!313876))

(assert (not b!313872))

(assert (not b!313878))

(assert (not b!313874))

(assert (not start!69746))

(assert (not b!313877))

(check-sat)

(pop 1)

(push 1)

(check-sat)


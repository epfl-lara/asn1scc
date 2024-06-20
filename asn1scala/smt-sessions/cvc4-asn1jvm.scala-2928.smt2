; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69734 () Bool)

(assert start!69734)

(declare-fun b!313756 () Bool)

(declare-fun res!256903 () Bool)

(declare-fun e!225907 () Bool)

(assert (=> b!313756 (=> (not res!256903) (not e!225907))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!313756 (= res!256903 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!256905 () Bool)

(assert (=> start!69734 (=> (not res!256905) (not e!225907))))

(declare-datatypes ((array!19298 0))(
  ( (array!19299 (arr!9453 (Array (_ BitVec 32) (_ BitVec 8))) (size!8373 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19298)

(declare-fun a3!79 () array!19298)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19298)

(assert (=> start!69734 (= res!256905 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8373 a1!825) (size!8373 a2!825)) (= (size!8373 a2!825) (size!8373 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8373 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8373 a2!825))))))))

(assert (=> start!69734 e!225907))

(assert (=> start!69734 true))

(declare-fun array_inv!7925 (array!19298) Bool)

(assert (=> start!69734 (array_inv!7925 a1!825)))

(assert (=> start!69734 (array_inv!7925 a3!79)))

(assert (=> start!69734 (array_inv!7925 a2!825)))

(declare-fun b!313757 () Bool)

(assert (=> b!313757 (= e!225907 (bvsgt (size!8373 a1!825) (size!8373 a3!79)))))

(declare-fun b!313758 () Bool)

(declare-fun res!256902 () Bool)

(assert (=> b!313758 (=> (not res!256902) (not e!225907))))

(declare-fun arrayBitRangesEq!0 (array!19298 array!19298 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313758 (= res!256902 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313759 () Bool)

(declare-fun res!256904 () Bool)

(assert (=> b!313759 (=> (not res!256904) (not e!225907))))

(assert (=> b!313759 (= res!256904 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313760 () Bool)

(declare-fun res!256906 () Bool)

(assert (=> b!313760 (=> (not res!256906) (not e!225907))))

(assert (=> b!313760 (= res!256906 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313761 () Bool)

(declare-fun res!256907 () Bool)

(assert (=> b!313761 (=> (not res!256907) (not e!225907))))

(assert (=> b!313761 (= res!256907 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69734 res!256905) b!313758))

(assert (= (and b!313758 res!256902) b!313761))

(assert (= (and b!313761 res!256907) b!313756))

(assert (= (and b!313756 res!256903) b!313759))

(assert (= (and b!313759 res!256904) b!313760))

(assert (= (and b!313760 res!256906) b!313757))

(declare-fun m!451389 () Bool)

(assert (=> b!313760 m!451389))

(declare-fun m!451391 () Bool)

(assert (=> b!313758 m!451391))

(declare-fun m!451393 () Bool)

(assert (=> b!313759 m!451393))

(declare-fun m!451395 () Bool)

(assert (=> b!313761 m!451395))

(declare-fun m!451397 () Bool)

(assert (=> start!69734 m!451397))

(declare-fun m!451399 () Bool)

(assert (=> start!69734 m!451399))

(declare-fun m!451401 () Bool)

(assert (=> start!69734 m!451401))

(push 1)

(assert (not b!313761))

(assert (not start!69734))

(assert (not b!313759))

(assert (not b!313758))

(assert (not b!313760))

(check-sat)

(pop 1)

(push 1)

(check-sat)


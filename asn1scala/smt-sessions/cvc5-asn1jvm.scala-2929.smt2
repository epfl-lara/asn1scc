; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69736 () Bool)

(assert start!69736)

(declare-fun b!313774 () Bool)

(declare-fun res!256925 () Bool)

(declare-fun e!225919 () Bool)

(assert (=> b!313774 (=> (not res!256925) (not e!225919))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19300 0))(
  ( (array!19301 (arr!9454 (Array (_ BitVec 32) (_ BitVec 8))) (size!8374 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19300)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19300)

(declare-fun arrayBitRangesEq!0 (array!19300 array!19300 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313774 (= res!256925 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!256920 () Bool)

(assert (=> start!69736 (=> (not res!256920) (not e!225919))))

(declare-fun a3!79 () array!19300)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> start!69736 (= res!256920 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8374 a1!825) (size!8374 a2!825)) (= (size!8374 a2!825) (size!8374 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8374 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8374 a2!825))))))))

(assert (=> start!69736 e!225919))

(assert (=> start!69736 true))

(declare-fun array_inv!7926 (array!19300) Bool)

(assert (=> start!69736 (array_inv!7926 a1!825)))

(assert (=> start!69736 (array_inv!7926 a3!79)))

(assert (=> start!69736 (array_inv!7926 a2!825)))

(declare-fun b!313775 () Bool)

(declare-fun res!256923 () Bool)

(assert (=> b!313775 (=> (not res!256923) (not e!225919))))

(assert (=> b!313775 (= res!256923 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313776 () Bool)

(declare-fun res!256924 () Bool)

(assert (=> b!313776 (=> (not res!256924) (not e!225919))))

(assert (=> b!313776 (= res!256924 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313777 () Bool)

(declare-fun res!256921 () Bool)

(assert (=> b!313777 (=> (not res!256921) (not e!225919))))

(assert (=> b!313777 (= res!256921 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313778 () Bool)

(assert (=> b!313778 (= e!225919 (and (bvsle (size!8374 a1!825) (size!8374 a3!79)) (bvsgt i!1020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8374 a1!825))))))))

(declare-fun b!313779 () Bool)

(declare-fun res!256922 () Bool)

(assert (=> b!313779 (=> (not res!256922) (not e!225919))))

(assert (=> b!313779 (= res!256922 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69736 res!256920) b!313777))

(assert (= (and b!313777 res!256921) b!313776))

(assert (= (and b!313776 res!256924) b!313775))

(assert (= (and b!313775 res!256923) b!313774))

(assert (= (and b!313774 res!256925) b!313779))

(assert (= (and b!313779 res!256922) b!313778))

(declare-fun m!451403 () Bool)

(assert (=> b!313776 m!451403))

(declare-fun m!451405 () Bool)

(assert (=> b!313777 m!451405))

(declare-fun m!451407 () Bool)

(assert (=> b!313774 m!451407))

(declare-fun m!451409 () Bool)

(assert (=> start!69736 m!451409))

(declare-fun m!451411 () Bool)

(assert (=> start!69736 m!451411))

(declare-fun m!451413 () Bool)

(assert (=> start!69736 m!451413))

(declare-fun m!451415 () Bool)

(assert (=> b!313779 m!451415))

(push 1)

(assert (not b!313776))

(assert (not b!313774))

(assert (not b!313779))

(assert (not start!69736))

(assert (not b!313777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


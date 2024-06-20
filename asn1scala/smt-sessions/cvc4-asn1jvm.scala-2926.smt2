; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69722 () Bool)

(assert start!69722)

(declare-fun res!256808 () Bool)

(declare-fun e!225832 () Bool)

(assert (=> start!69722 (=> (not res!256808) (not e!225832))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19286 0))(
  ( (array!19287 (arr!9447 (Array (_ BitVec 32) (_ BitVec 8))) (size!8367 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19286)

(declare-fun a3!79 () array!19286)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19286)

(assert (=> start!69722 (= res!256808 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8367 a1!825) (size!8367 a2!825)) (= (size!8367 a2!825) (size!8367 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8367 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8367 a2!825))))))))

(assert (=> start!69722 e!225832))

(assert (=> start!69722 true))

(declare-fun array_inv!7919 (array!19286) Bool)

(assert (=> start!69722 (array_inv!7919 a1!825)))

(assert (=> start!69722 (array_inv!7919 a3!79)))

(assert (=> start!69722 (array_inv!7919 a2!825)))

(declare-fun b!313660 () Bool)

(declare-fun res!256807 () Bool)

(assert (=> b!313660 (=> (not res!256807) (not e!225832))))

(declare-fun arrayBitRangesEq!0 (array!19286 array!19286 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313660 (= res!256807 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313661 () Bool)

(declare-fun res!256806 () Bool)

(assert (=> b!313661 (=> (not res!256806) (not e!225832))))

(assert (=> b!313661 (= res!256806 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313662 () Bool)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!313662 (= e!225832 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1020)))))

(assert (= (and start!69722 res!256808) b!313660))

(assert (= (and b!313660 res!256807) b!313661))

(assert (= (and b!313661 res!256806) b!313662))

(declare-fun m!451315 () Bool)

(assert (=> start!69722 m!451315))

(declare-fun m!451317 () Bool)

(assert (=> start!69722 m!451317))

(declare-fun m!451319 () Bool)

(assert (=> start!69722 m!451319))

(declare-fun m!451321 () Bool)

(assert (=> b!313660 m!451321))

(declare-fun m!451323 () Bool)

(assert (=> b!313661 m!451323))

(push 1)

(assert (not b!313660))

(assert (not b!313661))

(assert (not start!69722))

(check-sat)

(pop 1)

(push 1)

(check-sat)


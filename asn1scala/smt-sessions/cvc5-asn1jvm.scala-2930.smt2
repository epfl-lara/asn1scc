; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69742 () Bool)

(assert start!69742)

(declare-fun res!256977 () Bool)

(declare-fun e!225952 () Bool)

(assert (=> start!69742 (=> (not res!256977) (not e!225952))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19306 0))(
  ( (array!19307 (arr!9457 (Array (_ BitVec 32) (_ BitVec 8))) (size!8377 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19306)

(declare-fun a3!79 () array!19306)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19306)

(assert (=> start!69742 (= res!256977 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8377 a1!825) (size!8377 a2!825)) (= (size!8377 a2!825) (size!8377 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8377 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8377 a2!825))))))))

(assert (=> start!69742 e!225952))

(assert (=> start!69742 true))

(declare-fun array_inv!7929 (array!19306) Bool)

(assert (=> start!69742 (array_inv!7929 a1!825)))

(assert (=> start!69742 (array_inv!7929 a3!79)))

(assert (=> start!69742 (array_inv!7929 a2!825)))

(declare-fun b!313830 () Bool)

(declare-fun res!256981 () Bool)

(assert (=> b!313830 (=> (not res!256981) (not e!225952))))

(declare-fun arrayBitRangesEq!0 (array!19306 array!19306 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313830 (= res!256981 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313831 () Bool)

(declare-fun res!256980 () Bool)

(assert (=> b!313831 (=> (not res!256980) (not e!225952))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!313831 (= res!256980 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!313832 () Bool)

(declare-fun res!256979 () Bool)

(assert (=> b!313832 (=> (not res!256979) (not e!225952))))

(assert (=> b!313832 (= res!256979 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313833 () Bool)

(assert (=> b!313833 (= e!225952 (and (= i!1020 mid!82) (bvsgt (size!8377 a1!825) (size!8377 a3!79))))))

(declare-fun b!313834 () Bool)

(declare-fun res!256978 () Bool)

(assert (=> b!313834 (=> (not res!256978) (not e!225952))))

(assert (=> b!313834 (= res!256978 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313835 () Bool)

(declare-fun res!256982 () Bool)

(assert (=> b!313835 (=> (not res!256982) (not e!225952))))

(assert (=> b!313835 (= res!256982 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313836 () Bool)

(declare-fun res!256976 () Bool)

(assert (=> b!313836 (=> (not res!256976) (not e!225952))))

(assert (=> b!313836 (= res!256976 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69742 res!256977) b!313830))

(assert (= (and b!313830 res!256981) b!313836))

(assert (= (and b!313836 res!256976) b!313834))

(assert (= (and b!313834 res!256978) b!313835))

(assert (= (and b!313835 res!256982) b!313832))

(assert (= (and b!313832 res!256979) b!313831))

(assert (= (and b!313831 res!256980) b!313833))

(declare-fun m!451445 () Bool)

(assert (=> b!313831 m!451445))

(declare-fun m!451447 () Bool)

(assert (=> b!313836 m!451447))

(declare-fun m!451449 () Bool)

(assert (=> b!313832 m!451449))

(declare-fun m!451451 () Bool)

(assert (=> b!313830 m!451451))

(declare-fun m!451453 () Bool)

(assert (=> b!313835 m!451453))

(declare-fun m!451455 () Bool)

(assert (=> start!69742 m!451455))

(declare-fun m!451457 () Bool)

(assert (=> start!69742 m!451457))

(declare-fun m!451459 () Bool)

(assert (=> start!69742 m!451459))

(push 1)

(assert (not b!313832))

(assert (not start!69742))

(assert (not b!313830))

(assert (not b!313835))

(assert (not b!313836))

(assert (not b!313831))

(check-sat)

(pop 1)

(push 1)

(check-sat)


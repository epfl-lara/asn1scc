; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69740 () Bool)

(assert start!69740)

(declare-fun res!256956 () Bool)

(declare-fun e!225943 () Bool)

(assert (=> start!69740 (=> (not res!256956) (not e!225943))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19304 0))(
  ( (array!19305 (arr!9456 (Array (_ BitVec 32) (_ BitVec 8))) (size!8376 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19304)

(declare-fun a3!79 () array!19304)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19304)

(assert (=> start!69740 (= res!256956 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8376 a1!825) (size!8376 a2!825)) (= (size!8376 a2!825) (size!8376 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8376 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8376 a2!825))))))))

(assert (=> start!69740 e!225943))

(assert (=> start!69740 true))

(declare-fun array_inv!7928 (array!19304) Bool)

(assert (=> start!69740 (array_inv!7928 a1!825)))

(assert (=> start!69740 (array_inv!7928 a3!79)))

(assert (=> start!69740 (array_inv!7928 a2!825)))

(declare-fun b!313810 () Bool)

(declare-fun res!256957 () Bool)

(assert (=> b!313810 (=> (not res!256957) (not e!225943))))

(declare-fun arrayBitRangesEq!0 (array!19304 array!19304 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313810 (= res!256957 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun b!313811 () Bool)

(assert (=> b!313811 (= e!225943 (and (bvsle (size!8376 a1!825) (size!8376 a3!79)) (bvsgt i!1020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8376 a1!825))))))))

(declare-fun b!313812 () Bool)

(declare-fun res!256961 () Bool)

(assert (=> b!313812 (=> (not res!256961) (not e!225943))))

(assert (=> b!313812 (= res!256961 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313813 () Bool)

(declare-fun res!256960 () Bool)

(assert (=> b!313813 (=> (not res!256960) (not e!225943))))

(assert (=> b!313813 (= res!256960 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313814 () Bool)

(declare-fun res!256958 () Bool)

(assert (=> b!313814 (=> (not res!256958) (not e!225943))))

(assert (=> b!313814 (= res!256958 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313815 () Bool)

(declare-fun res!256959 () Bool)

(assert (=> b!313815 (=> (not res!256959) (not e!225943))))

(assert (=> b!313815 (= res!256959 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69740 res!256956) b!313812))

(assert (= (and b!313812 res!256961) b!313810))

(assert (= (and b!313810 res!256957) b!313814))

(assert (= (and b!313814 res!256958) b!313813))

(assert (= (and b!313813 res!256960) b!313815))

(assert (= (and b!313815 res!256959) b!313811))

(declare-fun m!451431 () Bool)

(assert (=> b!313812 m!451431))

(declare-fun m!451433 () Bool)

(assert (=> b!313815 m!451433))

(declare-fun m!451435 () Bool)

(assert (=> start!69740 m!451435))

(declare-fun m!451437 () Bool)

(assert (=> start!69740 m!451437))

(declare-fun m!451439 () Bool)

(assert (=> start!69740 m!451439))

(declare-fun m!451441 () Bool)

(assert (=> b!313813 m!451441))

(declare-fun m!451443 () Bool)

(assert (=> b!313810 m!451443))

(push 1)

(assert (not b!313810))

(assert (not b!313812))

(assert (not start!69740))

(assert (not b!313815))

(assert (not b!313813))

(check-sat)

(pop 1)

(push 1)

(check-sat)


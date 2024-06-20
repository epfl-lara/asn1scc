; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69720 () Bool)

(assert start!69720)

(declare-fun res!256798 () Bool)

(declare-fun e!225821 () Bool)

(assert (=> start!69720 (=> (not res!256798) (not e!225821))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19284 0))(
  ( (array!19285 (arr!9446 (Array (_ BitVec 32) (_ BitVec 8))) (size!8366 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19284)

(declare-fun a3!79 () array!19284)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19284)

(assert (=> start!69720 (= res!256798 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8366 a1!825) (size!8366 a2!825)) (= (size!8366 a2!825) (size!8366 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8366 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8366 a2!825))))))))

(assert (=> start!69720 e!225821))

(assert (=> start!69720 true))

(declare-fun array_inv!7918 (array!19284) Bool)

(assert (=> start!69720 (array_inv!7918 a1!825)))

(assert (=> start!69720 (array_inv!7918 a3!79)))

(assert (=> start!69720 (array_inv!7918 a2!825)))

(declare-fun b!313651 () Bool)

(declare-fun res!256797 () Bool)

(assert (=> b!313651 (=> (not res!256797) (not e!225821))))

(declare-fun arrayBitRangesEq!0 (array!19284 array!19284 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313651 (= res!256797 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313652 () Bool)

(declare-fun res!256799 () Bool)

(assert (=> b!313652 (=> (not res!256799) (not e!225821))))

(assert (=> b!313652 (= res!256799 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun b!313653 () Bool)

(assert (=> b!313653 (= e!225821 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1020)))))

(assert (= (and start!69720 res!256798) b!313651))

(assert (= (and b!313651 res!256797) b!313652))

(assert (= (and b!313652 res!256799) b!313653))

(declare-fun m!451305 () Bool)

(assert (=> start!69720 m!451305))

(declare-fun m!451307 () Bool)

(assert (=> start!69720 m!451307))

(declare-fun m!451309 () Bool)

(assert (=> start!69720 m!451309))

(declare-fun m!451311 () Bool)

(assert (=> b!313651 m!451311))

(declare-fun m!451313 () Bool)

(assert (=> b!313652 m!451313))

(check-sat (not b!313652) (not b!313651) (not start!69720))
(check-sat)

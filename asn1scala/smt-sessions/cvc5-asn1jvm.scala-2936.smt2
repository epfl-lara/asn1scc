; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69778 () Bool)

(assert start!69778)

(declare-fun b!314255 () Bool)

(declare-fun res!257403 () Bool)

(declare-fun e!226171 () Bool)

(assert (=> b!314255 (=> (not res!257403) (not e!226171))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314255 (= res!257403 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314256 () Bool)

(declare-fun res!257404 () Bool)

(assert (=> b!314256 (=> (not res!257404) (not e!226171))))

(declare-datatypes ((array!19342 0))(
  ( (array!19343 (arr!9475 (Array (_ BitVec 32) (_ BitVec 8))) (size!8395 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19342)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19342)

(declare-fun arrayBitRangesEq!0 (array!19342 array!19342 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314256 (= res!257404 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314257 () Bool)

(declare-fun res!257408 () Bool)

(assert (=> b!314257 (=> (not res!257408) (not e!226171))))

(assert (=> b!314257 (= res!257408 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314258 () Bool)

(declare-fun res!257406 () Bool)

(assert (=> b!314258 (=> (not res!257406) (not e!226171))))

(assert (=> b!314258 (= res!257406 (not (= i!1020 mid!82)))))

(declare-fun b!314259 () Bool)

(declare-fun res!257407 () Bool)

(assert (=> b!314259 (=> (not res!257407) (not e!226171))))

(declare-fun a1!825 () array!19342)

(assert (=> b!314259 (= res!257407 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314260 () Bool)

(declare-fun res!257401 () Bool)

(assert (=> b!314260 (=> (not res!257401) (not e!226171))))

(assert (=> b!314260 (= res!257401 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314261 () Bool)

(declare-fun res!257402 () Bool)

(assert (=> b!314261 (=> (not res!257402) (not e!226171))))

(assert (=> b!314261 (= res!257402 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314262 () Bool)

(assert (=> b!314262 (= e!226171 (not true))))

(assert (=> b!314262 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21581 0))(
  ( (Unit!21582) )
))
(declare-fun lt!442400 () Unit!21581)

(declare-fun arrayBitRangesEqDrop1!0 (array!19342 array!19342 (_ BitVec 64) (_ BitVec 64)) Unit!21581)

(assert (=> b!314262 (= lt!442400 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314262 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442399 () Unit!21581)

(declare-fun arrayBitRangesEqAppend!0 (array!19342 array!19342 (_ BitVec 64) (_ BitVec 64)) Unit!21581)

(assert (=> b!314262 (= lt!442399 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257405 () Bool)

(assert (=> start!69778 (=> (not res!257405) (not e!226171))))

(assert (=> start!69778 (= res!257405 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8395 a1!825) (size!8395 a2!825)) (= (size!8395 a2!825) (size!8395 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8395 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8395 a2!825))))))))

(assert (=> start!69778 e!226171))

(assert (=> start!69778 true))

(declare-fun array_inv!7947 (array!19342) Bool)

(assert (=> start!69778 (array_inv!7947 a1!825)))

(assert (=> start!69778 (array_inv!7947 a3!79)))

(assert (=> start!69778 (array_inv!7947 a2!825)))

(assert (= (and start!69778 res!257405) b!314259))

(assert (= (and b!314259 res!257407) b!314256))

(assert (= (and b!314256 res!257404) b!314255))

(assert (= (and b!314255 res!257403) b!314261))

(assert (= (and b!314261 res!257402) b!314257))

(assert (= (and b!314257 res!257408) b!314260))

(assert (= (and b!314260 res!257401) b!314258))

(assert (= (and b!314258 res!257406) b!314262))

(declare-fun m!451805 () Bool)

(assert (=> b!314256 m!451805))

(declare-fun m!451807 () Bool)

(assert (=> b!314262 m!451807))

(declare-fun m!451809 () Bool)

(assert (=> b!314262 m!451809))

(declare-fun m!451811 () Bool)

(assert (=> b!314262 m!451811))

(declare-fun m!451813 () Bool)

(assert (=> b!314262 m!451813))

(declare-fun m!451815 () Bool)

(assert (=> b!314257 m!451815))

(declare-fun m!451817 () Bool)

(assert (=> b!314260 m!451817))

(declare-fun m!451819 () Bool)

(assert (=> b!314259 m!451819))

(declare-fun m!451821 () Bool)

(assert (=> b!314261 m!451821))

(declare-fun m!451823 () Bool)

(assert (=> start!69778 m!451823))

(declare-fun m!451825 () Bool)

(assert (=> start!69778 m!451825))

(declare-fun m!451827 () Bool)

(assert (=> start!69778 m!451827))

(push 1)

(assert (not b!314260))

(assert (not b!314256))

(assert (not b!314261))

(assert (not start!69778))

(assert (not b!314259))

(assert (not b!314262))

(assert (not b!314257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


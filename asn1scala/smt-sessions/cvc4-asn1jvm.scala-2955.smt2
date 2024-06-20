; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69932 () Bool)

(assert start!69932)

(declare-fun res!258946 () Bool)

(declare-fun e!227064 () Bool)

(assert (=> start!69932 (=> (not res!258946) (not e!227064))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19463 0))(
  ( (array!19464 (arr!9537 (Array (_ BitVec 32) (_ BitVec 8))) (size!8454 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19463)

(declare-fun a3!79 () array!19463)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19463)

(assert (=> start!69932 (= res!258946 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8454 a1!825) (size!8454 a2!825)) (= (size!8454 a2!825) (size!8454 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8454 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8454 a2!825))))))))

(assert (=> start!69932 e!227064))

(assert (=> start!69932 true))

(declare-fun array_inv!8006 (array!19463) Bool)

(assert (=> start!69932 (array_inv!8006 a1!825)))

(assert (=> start!69932 (array_inv!8006 a3!79)))

(assert (=> start!69932 (array_inv!8006 a2!825)))

(declare-fun b!315842 () Bool)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315842 (= e!227064 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvslt i!1020 to!845))))))

(declare-fun arrayBitRangesEq!0 (array!19463 array!19463 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315842 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21663 0))(
  ( (Unit!21664) )
))
(declare-fun lt!442744 () Unit!21663)

(declare-fun arrayBitRangesEqDrop1!0 (array!19463 array!19463 (_ BitVec 64) (_ BitVec 64)) Unit!21663)

(assert (=> b!315842 (= lt!442744 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!315842 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442745 () Unit!21663)

(declare-fun arrayBitRangesEqAppend!0 (array!19463 array!19463 (_ BitVec 64) (_ BitVec 64)) Unit!21663)

(assert (=> b!315842 (= lt!442745 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315843 () Bool)

(declare-fun res!258948 () Bool)

(assert (=> b!315843 (=> (not res!258948) (not e!227064))))

(assert (=> b!315843 (= res!258948 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315844 () Bool)

(declare-fun res!258952 () Bool)

(assert (=> b!315844 (=> (not res!258952) (not e!227064))))

(assert (=> b!315844 (= res!258952 (not (= i!1020 mid!82)))))

(declare-fun b!315845 () Bool)

(declare-fun res!258950 () Bool)

(assert (=> b!315845 (=> (not res!258950) (not e!227064))))

(assert (=> b!315845 (= res!258950 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315846 () Bool)

(declare-fun res!258949 () Bool)

(assert (=> b!315846 (=> (not res!258949) (not e!227064))))

(assert (=> b!315846 (= res!258949 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315847 () Bool)

(declare-fun res!258947 () Bool)

(assert (=> b!315847 (=> (not res!258947) (not e!227064))))

(assert (=> b!315847 (= res!258947 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315848 () Bool)

(declare-fun res!258953 () Bool)

(assert (=> b!315848 (=> (not res!258953) (not e!227064))))

(assert (=> b!315848 (= res!258953 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315849 () Bool)

(declare-fun res!258951 () Bool)

(assert (=> b!315849 (=> (not res!258951) (not e!227064))))

(assert (=> b!315849 (= res!258951 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69932 res!258946) b!315846))

(assert (= (and b!315846 res!258949) b!315843))

(assert (= (and b!315843 res!258948) b!315849))

(assert (= (and b!315849 res!258951) b!315847))

(assert (= (and b!315847 res!258947) b!315848))

(assert (= (and b!315848 res!258953) b!315845))

(assert (= (and b!315845 res!258950) b!315844))

(assert (= (and b!315844 res!258952) b!315842))

(declare-fun m!453587 () Bool)

(assert (=> b!315845 m!453587))

(declare-fun m!453589 () Bool)

(assert (=> b!315847 m!453589))

(declare-fun m!453591 () Bool)

(assert (=> b!315848 m!453591))

(declare-fun m!453593 () Bool)

(assert (=> b!315843 m!453593))

(declare-fun m!453595 () Bool)

(assert (=> b!315842 m!453595))

(declare-fun m!453597 () Bool)

(assert (=> b!315842 m!453597))

(declare-fun m!453599 () Bool)

(assert (=> b!315842 m!453599))

(declare-fun m!453601 () Bool)

(assert (=> b!315842 m!453601))

(declare-fun m!453603 () Bool)

(assert (=> start!69932 m!453603))

(declare-fun m!453605 () Bool)

(assert (=> start!69932 m!453605))

(declare-fun m!453607 () Bool)

(assert (=> start!69932 m!453607))

(declare-fun m!453609 () Bool)

(assert (=> b!315846 m!453609))

(push 1)

(assert (not b!315847))

(assert (not b!315846))

(assert (not b!315848))

(assert (not b!315845))

(assert (not b!315842))

(assert (not b!315843))

(assert (not start!69932))

(check-sat)

(pop 1)

(push 1)

(check-sat)


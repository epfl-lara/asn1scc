; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69946 () Bool)

(assert start!69946)

(declare-fun b!316010 () Bool)

(declare-fun e!227146 () Bool)

(assert (=> b!316010 (= e!227146 (not true))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19477 0))(
  ( (array!19478 (arr!9544 (Array (_ BitVec 32) (_ BitVec 8))) (size!8461 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19477)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19477)

(declare-fun arrayBitRangesEq!0 (array!19477 array!19477 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316010 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21677 0))(
  ( (Unit!21678) )
))
(declare-fun lt!442786 () Unit!21677)

(declare-fun arrayBitRangesEqDrop1!0 (array!19477 array!19477 (_ BitVec 64) (_ BitVec 64)) Unit!21677)

(assert (=> b!316010 (= lt!442786 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun a3!79 () array!19477)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316010 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442787 () Unit!21677)

(declare-fun arrayBitRangesEqAppend!0 (array!19477 array!19477 (_ BitVec 64) (_ BitVec 64)) Unit!21677)

(assert (=> b!316010 (= lt!442787 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316011 () Bool)

(declare-fun res!259115 () Bool)

(assert (=> b!316011 (=> (not res!259115) (not e!227146))))

(assert (=> b!316011 (= res!259115 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316012 () Bool)

(declare-fun res!259120 () Bool)

(assert (=> b!316012 (=> (not res!259120) (not e!227146))))

(assert (=> b!316012 (= res!259120 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316013 () Bool)

(declare-fun res!259121 () Bool)

(assert (=> b!316013 (=> (not res!259121) (not e!227146))))

(assert (=> b!316013 (= res!259121 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!259116 () Bool)

(assert (=> start!69946 (=> (not res!259116) (not e!227146))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69946 (= res!259116 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8461 a1!825) (size!8461 a2!825)) (= (size!8461 a2!825) (size!8461 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8461 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8461 a2!825))))))))

(assert (=> start!69946 e!227146))

(assert (=> start!69946 true))

(declare-fun array_inv!8013 (array!19477) Bool)

(assert (=> start!69946 (array_inv!8013 a1!825)))

(assert (=> start!69946 (array_inv!8013 a3!79)))

(assert (=> start!69946 (array_inv!8013 a2!825)))

(declare-fun b!316014 () Bool)

(declare-fun res!259117 () Bool)

(assert (=> b!316014 (=> (not res!259117) (not e!227146))))

(assert (=> b!316014 (= res!259117 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316015 () Bool)

(declare-fun res!259118 () Bool)

(assert (=> b!316015 (=> (not res!259118) (not e!227146))))

(assert (=> b!316015 (= res!259118 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316016 () Bool)

(declare-fun res!259114 () Bool)

(assert (=> b!316016 (=> (not res!259114) (not e!227146))))

(assert (=> b!316016 (= res!259114 (not (= i!1020 mid!82)))))

(declare-fun b!316017 () Bool)

(declare-fun res!259119 () Bool)

(assert (=> b!316017 (=> (not res!259119) (not e!227146))))

(assert (=> b!316017 (= res!259119 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69946 res!259116) b!316014))

(assert (= (and b!316014 res!259117) b!316017))

(assert (= (and b!316017 res!259119) b!316012))

(assert (= (and b!316012 res!259120) b!316013))

(assert (= (and b!316013 res!259121) b!316015))

(assert (= (and b!316015 res!259118) b!316011))

(assert (= (and b!316011 res!259115) b!316016))

(assert (= (and b!316016 res!259114) b!316010))

(declare-fun m!453755 () Bool)

(assert (=> b!316014 m!453755))

(declare-fun m!453757 () Bool)

(assert (=> b!316011 m!453757))

(declare-fun m!453759 () Bool)

(assert (=> b!316015 m!453759))

(declare-fun m!453761 () Bool)

(assert (=> b!316010 m!453761))

(declare-fun m!453763 () Bool)

(assert (=> b!316010 m!453763))

(declare-fun m!453765 () Bool)

(assert (=> b!316010 m!453765))

(declare-fun m!453767 () Bool)

(assert (=> b!316010 m!453767))

(declare-fun m!453769 () Bool)

(assert (=> b!316013 m!453769))

(declare-fun m!453771 () Bool)

(assert (=> start!69946 m!453771))

(declare-fun m!453773 () Bool)

(assert (=> start!69946 m!453773))

(declare-fun m!453775 () Bool)

(assert (=> start!69946 m!453775))

(declare-fun m!453777 () Bool)

(assert (=> b!316017 m!453777))

(push 1)

(assert (not b!316010))

(assert (not b!316015))

(assert (not start!69946))

(assert (not b!316013))

(assert (not b!316011))

(assert (not b!316017))

(assert (not b!316014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69806 () Bool)

(assert start!69806)

(declare-fun b!314591 () Bool)

(declare-fun res!257740 () Bool)

(declare-fun e!226339 () Bool)

(assert (=> b!314591 (=> (not res!257740) (not e!226339))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314591 (= res!257740 (not (= i!1020 mid!82)))))

(declare-fun b!314592 () Bool)

(declare-fun res!257737 () Bool)

(assert (=> b!314592 (=> (not res!257737) (not e!226339))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314592 (= res!257737 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314593 () Bool)

(declare-fun res!257742 () Bool)

(assert (=> b!314593 (=> (not res!257742) (not e!226339))))

(declare-datatypes ((array!19370 0))(
  ( (array!19371 (arr!9489 (Array (_ BitVec 32) (_ BitVec 8))) (size!8409 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19370)

(declare-fun a2!825 () array!19370)

(declare-fun arrayBitRangesEq!0 (array!19370 array!19370 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314593 (= res!257742 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314594 () Bool)

(declare-fun res!257738 () Bool)

(assert (=> b!314594 (=> (not res!257738) (not e!226339))))

(declare-fun a3!79 () array!19370)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314594 (= res!257738 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314595 () Bool)

(assert (=> b!314595 (= e!226339 (not true))))

(assert (=> b!314595 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21609 0))(
  ( (Unit!21610) )
))
(declare-fun lt!442502 () Unit!21609)

(declare-fun arrayBitRangesEqDrop1!0 (array!19370 array!19370 (_ BitVec 64) (_ BitVec 64)) Unit!21609)

(assert (=> b!314595 (= lt!442502 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314595 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442501 () Unit!21609)

(assert (=> b!314595 (= lt!442501 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314595 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442500 () Unit!21609)

(declare-fun arrayBitRangesEqAppend!0 (array!19370 array!19370 (_ BitVec 64) (_ BitVec 64)) Unit!21609)

(assert (=> b!314595 (= lt!442500 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257739 () Bool)

(assert (=> start!69806 (=> (not res!257739) (not e!226339))))

(assert (=> start!69806 (= res!257739 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8409 a1!825) (size!8409 a2!825)) (= (size!8409 a2!825) (size!8409 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8409 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8409 a2!825))))))))

(assert (=> start!69806 e!226339))

(assert (=> start!69806 true))

(declare-fun array_inv!7961 (array!19370) Bool)

(assert (=> start!69806 (array_inv!7961 a1!825)))

(assert (=> start!69806 (array_inv!7961 a3!79)))

(assert (=> start!69806 (array_inv!7961 a2!825)))

(declare-fun b!314596 () Bool)

(declare-fun res!257743 () Bool)

(assert (=> b!314596 (=> (not res!257743) (not e!226339))))

(assert (=> b!314596 (= res!257743 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314597 () Bool)

(declare-fun res!257744 () Bool)

(assert (=> b!314597 (=> (not res!257744) (not e!226339))))

(assert (=> b!314597 (= res!257744 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314598 () Bool)

(declare-fun res!257741 () Bool)

(assert (=> b!314598 (=> (not res!257741) (not e!226339))))

(assert (=> b!314598 (= res!257741 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69806 res!257739) b!314598))

(assert (= (and b!314598 res!257741) b!314594))

(assert (= (and b!314594 res!257738) b!314592))

(assert (= (and b!314592 res!257737) b!314593))

(assert (= (and b!314593 res!257742) b!314597))

(assert (= (and b!314597 res!257744) b!314596))

(assert (= (and b!314596 res!257743) b!314591))

(assert (= (and b!314591 res!257740) b!314595))

(declare-fun m!452161 () Bool)

(assert (=> b!314596 m!452161))

(declare-fun m!452163 () Bool)

(assert (=> b!314598 m!452163))

(declare-fun m!452165 () Bool)

(assert (=> b!314593 m!452165))

(declare-fun m!452167 () Bool)

(assert (=> b!314597 m!452167))

(declare-fun m!452169 () Bool)

(assert (=> b!314595 m!452169))

(declare-fun m!452171 () Bool)

(assert (=> b!314595 m!452171))

(declare-fun m!452173 () Bool)

(assert (=> b!314595 m!452173))

(declare-fun m!452175 () Bool)

(assert (=> b!314595 m!452175))

(declare-fun m!452177 () Bool)

(assert (=> b!314595 m!452177))

(declare-fun m!452179 () Bool)

(assert (=> b!314595 m!452179))

(declare-fun m!452181 () Bool)

(assert (=> b!314594 m!452181))

(declare-fun m!452183 () Bool)

(assert (=> start!69806 m!452183))

(declare-fun m!452185 () Bool)

(assert (=> start!69806 m!452185))

(declare-fun m!452187 () Bool)

(assert (=> start!69806 m!452187))

(push 1)

(assert (not b!314593))

(assert (not b!314596))

(assert (not b!314597))

(assert (not b!314594))

(assert (not b!314595))

(assert (not b!314598))

(assert (not start!69806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


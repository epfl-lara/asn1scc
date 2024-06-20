; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69814 () Bool)

(assert start!69814)

(declare-fun b!314687 () Bool)

(declare-fun res!257836 () Bool)

(declare-fun e!226385 () Bool)

(assert (=> b!314687 (=> (not res!257836) (not e!226385))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314687 (= res!257836 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314688 () Bool)

(declare-fun res!257834 () Bool)

(assert (=> b!314688 (=> (not res!257834) (not e!226385))))

(declare-datatypes ((array!19378 0))(
  ( (array!19379 (arr!9493 (Array (_ BitVec 32) (_ BitVec 8))) (size!8413 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19378)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19378)

(declare-fun arrayBitRangesEq!0 (array!19378 array!19378 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314688 (= res!257834 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314689 () Bool)

(assert (=> b!314689 (= e!226385 (not true))))

(assert (=> b!314689 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21617 0))(
  ( (Unit!21618) )
))
(declare-fun lt!442536 () Unit!21617)

(declare-fun arrayBitRangesEqDrop1!0 (array!19378 array!19378 (_ BitVec 64) (_ BitVec 64)) Unit!21617)

(assert (=> b!314689 (= lt!442536 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun a1!825 () array!19378)

(assert (=> b!314689 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442537 () Unit!21617)

(assert (=> b!314689 (= lt!442537 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314689 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442538 () Unit!21617)

(declare-fun arrayBitRangesEqAppend!0 (array!19378 array!19378 (_ BitVec 64) (_ BitVec 64)) Unit!21617)

(assert (=> b!314689 (= lt!442538 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314690 () Bool)

(declare-fun res!257840 () Bool)

(assert (=> b!314690 (=> (not res!257840) (not e!226385))))

(assert (=> b!314690 (= res!257840 (not (= i!1020 mid!82)))))

(declare-fun b!314691 () Bool)

(declare-fun res!257838 () Bool)

(assert (=> b!314691 (=> (not res!257838) (not e!226385))))

(assert (=> b!314691 (= res!257838 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314692 () Bool)

(declare-fun res!257833 () Bool)

(assert (=> b!314692 (=> (not res!257833) (not e!226385))))

(assert (=> b!314692 (= res!257833 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314693 () Bool)

(declare-fun res!257839 () Bool)

(assert (=> b!314693 (=> (not res!257839) (not e!226385))))

(assert (=> b!314693 (= res!257839 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314694 () Bool)

(declare-fun res!257837 () Bool)

(assert (=> b!314694 (=> (not res!257837) (not e!226385))))

(assert (=> b!314694 (= res!257837 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!257835 () Bool)

(assert (=> start!69814 (=> (not res!257835) (not e!226385))))

(assert (=> start!69814 (= res!257835 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8413 a1!825) (size!8413 a2!825)) (= (size!8413 a2!825) (size!8413 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8413 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8413 a2!825))))))))

(assert (=> start!69814 e!226385))

(assert (=> start!69814 true))

(declare-fun array_inv!7965 (array!19378) Bool)

(assert (=> start!69814 (array_inv!7965 a1!825)))

(assert (=> start!69814 (array_inv!7965 a3!79)))

(assert (=> start!69814 (array_inv!7965 a2!825)))

(assert (= (and start!69814 res!257835) b!314694))

(assert (= (and b!314694 res!257837) b!314688))

(assert (= (and b!314688 res!257834) b!314687))

(assert (= (and b!314687 res!257836) b!314691))

(assert (= (and b!314691 res!257838) b!314693))

(assert (= (and b!314693 res!257839) b!314692))

(assert (= (and b!314692 res!257833) b!314690))

(assert (= (and b!314690 res!257840) b!314689))

(declare-fun m!452273 () Bool)

(assert (=> b!314691 m!452273))

(declare-fun m!452275 () Bool)

(assert (=> b!314692 m!452275))

(declare-fun m!452277 () Bool)

(assert (=> b!314693 m!452277))

(declare-fun m!452279 () Bool)

(assert (=> start!69814 m!452279))

(declare-fun m!452281 () Bool)

(assert (=> start!69814 m!452281))

(declare-fun m!452283 () Bool)

(assert (=> start!69814 m!452283))

(declare-fun m!452285 () Bool)

(assert (=> b!314689 m!452285))

(declare-fun m!452287 () Bool)

(assert (=> b!314689 m!452287))

(declare-fun m!452289 () Bool)

(assert (=> b!314689 m!452289))

(declare-fun m!452291 () Bool)

(assert (=> b!314689 m!452291))

(declare-fun m!452293 () Bool)

(assert (=> b!314689 m!452293))

(declare-fun m!452295 () Bool)

(assert (=> b!314689 m!452295))

(declare-fun m!452297 () Bool)

(assert (=> b!314694 m!452297))

(declare-fun m!452299 () Bool)

(assert (=> b!314688 m!452299))

(push 1)

(assert (not start!69814))

(assert (not b!314694))

(assert (not b!314693))

(assert (not b!314691))

(assert (not b!314688))

(assert (not b!314692))

(assert (not b!314689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


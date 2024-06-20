; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69798 () Bool)

(assert start!69798)

(declare-fun res!257643 () Bool)

(declare-fun e!226290 () Bool)

(assert (=> start!69798 (=> (not res!257643) (not e!226290))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19362 0))(
  ( (array!19363 (arr!9485 (Array (_ BitVec 32) (_ BitVec 8))) (size!8405 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19362)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a3!79 () array!19362)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19362)

(assert (=> start!69798 (= res!257643 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8405 a1!825) (size!8405 a2!825)) (= (size!8405 a2!825) (size!8405 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8405 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8405 a2!825))))))))

(assert (=> start!69798 e!226290))

(assert (=> start!69798 true))

(declare-fun array_inv!7957 (array!19362) Bool)

(assert (=> start!69798 (array_inv!7957 a1!825)))

(assert (=> start!69798 (array_inv!7957 a3!79)))

(assert (=> start!69798 (array_inv!7957 a2!825)))

(declare-fun b!314495 () Bool)

(declare-fun res!257641 () Bool)

(assert (=> b!314495 (=> (not res!257641) (not e!226290))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19362 array!19362 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314495 (= res!257641 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314496 () Bool)

(declare-fun res!257642 () Bool)

(assert (=> b!314496 (=> (not res!257642) (not e!226290))))

(assert (=> b!314496 (= res!257642 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314497 () Bool)

(declare-fun res!257646 () Bool)

(assert (=> b!314497 (=> (not res!257646) (not e!226290))))

(assert (=> b!314497 (= res!257646 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314498 () Bool)

(declare-fun res!257645 () Bool)

(assert (=> b!314498 (=> (not res!257645) (not e!226290))))

(assert (=> b!314498 (= res!257645 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314499 () Bool)

(declare-fun res!257648 () Bool)

(assert (=> b!314499 (=> (not res!257648) (not e!226290))))

(assert (=> b!314499 (= res!257648 (not (= i!1020 mid!82)))))

(declare-fun b!314500 () Bool)

(declare-fun res!257644 () Bool)

(assert (=> b!314500 (=> (not res!257644) (not e!226290))))

(assert (=> b!314500 (= res!257644 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314501 () Bool)

(assert (=> b!314501 (= e!226290 (not true))))

(assert (=> b!314501 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21601 0))(
  ( (Unit!21602) )
))
(declare-fun lt!442464 () Unit!21601)

(declare-fun arrayBitRangesEqDrop1!0 (array!19362 array!19362 (_ BitVec 64) (_ BitVec 64)) Unit!21601)

(assert (=> b!314501 (= lt!442464 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314501 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442466 () Unit!21601)

(assert (=> b!314501 (= lt!442466 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314501 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442465 () Unit!21601)

(declare-fun arrayBitRangesEqAppend!0 (array!19362 array!19362 (_ BitVec 64) (_ BitVec 64)) Unit!21601)

(assert (=> b!314501 (= lt!442465 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314502 () Bool)

(declare-fun res!257647 () Bool)

(assert (=> b!314502 (=> (not res!257647) (not e!226290))))

(assert (=> b!314502 (= res!257647 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69798 res!257643) b!314502))

(assert (= (and b!314502 res!257647) b!314496))

(assert (= (and b!314496 res!257642) b!314498))

(assert (= (and b!314498 res!257645) b!314495))

(assert (= (and b!314495 res!257641) b!314497))

(assert (= (and b!314497 res!257646) b!314500))

(assert (= (and b!314500 res!257644) b!314499))

(assert (= (and b!314499 res!257648) b!314501))

(declare-fun m!452049 () Bool)

(assert (=> b!314501 m!452049))

(declare-fun m!452051 () Bool)

(assert (=> b!314501 m!452051))

(declare-fun m!452053 () Bool)

(assert (=> b!314501 m!452053))

(declare-fun m!452055 () Bool)

(assert (=> b!314501 m!452055))

(declare-fun m!452057 () Bool)

(assert (=> b!314501 m!452057))

(declare-fun m!452059 () Bool)

(assert (=> b!314501 m!452059))

(declare-fun m!452061 () Bool)

(assert (=> b!314497 m!452061))

(declare-fun m!452063 () Bool)

(assert (=> b!314502 m!452063))

(declare-fun m!452065 () Bool)

(assert (=> start!69798 m!452065))

(declare-fun m!452067 () Bool)

(assert (=> start!69798 m!452067))

(declare-fun m!452069 () Bool)

(assert (=> start!69798 m!452069))

(declare-fun m!452071 () Bool)

(assert (=> b!314500 m!452071))

(declare-fun m!452073 () Bool)

(assert (=> b!314495 m!452073))

(declare-fun m!452075 () Bool)

(assert (=> b!314496 m!452075))

(check-sat (not b!314496) (not b!314501) (not start!69798) (not b!314502) (not b!314497) (not b!314500) (not b!314495))

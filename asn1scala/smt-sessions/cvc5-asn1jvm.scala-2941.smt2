; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69808 () Bool)

(assert start!69808)

(declare-fun b!314615 () Bool)

(declare-fun e!226349 () Bool)

(assert (=> b!314615 (= e!226349 (not true))))

(declare-datatypes ((array!19372 0))(
  ( (array!19373 (arr!9490 (Array (_ BitVec 32) (_ BitVec 8))) (size!8410 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19372)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19372)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19372 array!19372 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314615 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21611 0))(
  ( (Unit!21612) )
))
(declare-fun lt!442510 () Unit!21611)

(declare-fun arrayBitRangesEqDrop1!0 (array!19372 array!19372 (_ BitVec 64) (_ BitVec 64)) Unit!21611)

(assert (=> b!314615 (= lt!442510 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19372)

(assert (=> b!314615 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442509 () Unit!21611)

(assert (=> b!314615 (= lt!442509 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314615 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442511 () Unit!21611)

(declare-fun arrayBitRangesEqAppend!0 (array!19372 array!19372 (_ BitVec 64) (_ BitVec 64)) Unit!21611)

(assert (=> b!314615 (= lt!442511 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314616 () Bool)

(declare-fun res!257763 () Bool)

(assert (=> b!314616 (=> (not res!257763) (not e!226349))))

(assert (=> b!314616 (= res!257763 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314617 () Bool)

(declare-fun res!257765 () Bool)

(assert (=> b!314617 (=> (not res!257765) (not e!226349))))

(assert (=> b!314617 (= res!257765 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314618 () Bool)

(declare-fun res!257768 () Bool)

(assert (=> b!314618 (=> (not res!257768) (not e!226349))))

(assert (=> b!314618 (= res!257768 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!257761 () Bool)

(assert (=> start!69808 (=> (not res!257761) (not e!226349))))

(assert (=> start!69808 (= res!257761 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8410 a1!825) (size!8410 a2!825)) (= (size!8410 a2!825) (size!8410 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8410 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8410 a2!825))))))))

(assert (=> start!69808 e!226349))

(assert (=> start!69808 true))

(declare-fun array_inv!7962 (array!19372) Bool)

(assert (=> start!69808 (array_inv!7962 a1!825)))

(assert (=> start!69808 (array_inv!7962 a3!79)))

(assert (=> start!69808 (array_inv!7962 a2!825)))

(declare-fun b!314619 () Bool)

(declare-fun res!257767 () Bool)

(assert (=> b!314619 (=> (not res!257767) (not e!226349))))

(assert (=> b!314619 (= res!257767 (not (= i!1020 mid!82)))))

(declare-fun b!314620 () Bool)

(declare-fun res!257764 () Bool)

(assert (=> b!314620 (=> (not res!257764) (not e!226349))))

(assert (=> b!314620 (= res!257764 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314621 () Bool)

(declare-fun res!257766 () Bool)

(assert (=> b!314621 (=> (not res!257766) (not e!226349))))

(assert (=> b!314621 (= res!257766 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314622 () Bool)

(declare-fun res!257762 () Bool)

(assert (=> b!314622 (=> (not res!257762) (not e!226349))))

(assert (=> b!314622 (= res!257762 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69808 res!257761) b!314616))

(assert (= (and b!314616 res!257763) b!314617))

(assert (= (and b!314617 res!257765) b!314618))

(assert (= (and b!314618 res!257768) b!314622))

(assert (= (and b!314622 res!257762) b!314621))

(assert (= (and b!314621 res!257766) b!314620))

(assert (= (and b!314620 res!257764) b!314619))

(assert (= (and b!314619 res!257767) b!314615))

(declare-fun m!452189 () Bool)

(assert (=> b!314616 m!452189))

(declare-fun m!452191 () Bool)

(assert (=> b!314620 m!452191))

(declare-fun m!452193 () Bool)

(assert (=> start!69808 m!452193))

(declare-fun m!452195 () Bool)

(assert (=> start!69808 m!452195))

(declare-fun m!452197 () Bool)

(assert (=> start!69808 m!452197))

(declare-fun m!452199 () Bool)

(assert (=> b!314615 m!452199))

(declare-fun m!452201 () Bool)

(assert (=> b!314615 m!452201))

(declare-fun m!452203 () Bool)

(assert (=> b!314615 m!452203))

(declare-fun m!452205 () Bool)

(assert (=> b!314615 m!452205))

(declare-fun m!452207 () Bool)

(assert (=> b!314615 m!452207))

(declare-fun m!452209 () Bool)

(assert (=> b!314615 m!452209))

(declare-fun m!452211 () Bool)

(assert (=> b!314621 m!452211))

(declare-fun m!452213 () Bool)

(assert (=> b!314617 m!452213))

(declare-fun m!452215 () Bool)

(assert (=> b!314622 m!452215))

(push 1)

(assert (not b!314615))

(assert (not b!314616))

(assert (not b!314620))

(assert (not start!69808))

(assert (not b!314622))

(assert (not b!314621))

(assert (not b!314617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


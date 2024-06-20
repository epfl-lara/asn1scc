; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69786 () Bool)

(assert start!69786)

(declare-fun b!314351 () Bool)

(declare-fun e!226217 () Bool)

(assert (=> b!314351 (= e!226217 (not true))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19350 0))(
  ( (array!19351 (arr!9479 (Array (_ BitVec 32) (_ BitVec 8))) (size!8399 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19350)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19350)

(declare-fun arrayBitRangesEq!0 (array!19350 array!19350 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314351 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21589 0))(
  ( (Unit!21590) )
))
(declare-fun lt!442424 () Unit!21589)

(declare-fun arrayBitRangesEqDrop1!0 (array!19350 array!19350 (_ BitVec 64) (_ BitVec 64)) Unit!21589)

(assert (=> b!314351 (= lt!442424 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun a3!79 () array!19350)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314351 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442423 () Unit!21589)

(declare-fun arrayBitRangesEqAppend!0 (array!19350 array!19350 (_ BitVec 64) (_ BitVec 64)) Unit!21589)

(assert (=> b!314351 (= lt!442423 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314352 () Bool)

(declare-fun res!257498 () Bool)

(assert (=> b!314352 (=> (not res!257498) (not e!226217))))

(assert (=> b!314352 (= res!257498 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314353 () Bool)

(declare-fun res!257504 () Bool)

(assert (=> b!314353 (=> (not res!257504) (not e!226217))))

(assert (=> b!314353 (= res!257504 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314354 () Bool)

(declare-fun res!257503 () Bool)

(assert (=> b!314354 (=> (not res!257503) (not e!226217))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314354 (= res!257503 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314356 () Bool)

(declare-fun res!257502 () Bool)

(assert (=> b!314356 (=> (not res!257502) (not e!226217))))

(assert (=> b!314356 (= res!257502 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314357 () Bool)

(declare-fun res!257499 () Bool)

(assert (=> b!314357 (=> (not res!257499) (not e!226217))))

(assert (=> b!314357 (= res!257499 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314358 () Bool)

(declare-fun res!257501 () Bool)

(assert (=> b!314358 (=> (not res!257501) (not e!226217))))

(assert (=> b!314358 (= res!257501 (not (= i!1020 mid!82)))))

(declare-fun b!314355 () Bool)

(declare-fun res!257500 () Bool)

(assert (=> b!314355 (=> (not res!257500) (not e!226217))))

(assert (=> b!314355 (= res!257500 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!257497 () Bool)

(assert (=> start!69786 (=> (not res!257497) (not e!226217))))

(assert (=> start!69786 (= res!257497 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8399 a1!825) (size!8399 a2!825)) (= (size!8399 a2!825) (size!8399 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8399 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8399 a2!825))))))))

(assert (=> start!69786 e!226217))

(assert (=> start!69786 true))

(declare-fun array_inv!7951 (array!19350) Bool)

(assert (=> start!69786 (array_inv!7951 a1!825)))

(assert (=> start!69786 (array_inv!7951 a3!79)))

(assert (=> start!69786 (array_inv!7951 a2!825)))

(assert (= (and start!69786 res!257497) b!314352))

(assert (= (and b!314352 res!257498) b!314354))

(assert (= (and b!314354 res!257503) b!314353))

(assert (= (and b!314353 res!257504) b!314357))

(assert (= (and b!314357 res!257499) b!314355))

(assert (= (and b!314355 res!257500) b!314356))

(assert (= (and b!314356 res!257502) b!314358))

(assert (= (and b!314358 res!257501) b!314351))

(declare-fun m!451901 () Bool)

(assert (=> b!314356 m!451901))

(declare-fun m!451903 () Bool)

(assert (=> b!314352 m!451903))

(declare-fun m!451905 () Bool)

(assert (=> b!314354 m!451905))

(declare-fun m!451907 () Bool)

(assert (=> b!314357 m!451907))

(declare-fun m!451909 () Bool)

(assert (=> b!314351 m!451909))

(declare-fun m!451911 () Bool)

(assert (=> b!314351 m!451911))

(declare-fun m!451913 () Bool)

(assert (=> b!314351 m!451913))

(declare-fun m!451915 () Bool)

(assert (=> b!314351 m!451915))

(declare-fun m!451917 () Bool)

(assert (=> b!314355 m!451917))

(declare-fun m!451919 () Bool)

(assert (=> start!69786 m!451919))

(declare-fun m!451921 () Bool)

(assert (=> start!69786 m!451921))

(declare-fun m!451923 () Bool)

(assert (=> start!69786 m!451923))

(check-sat (not b!314356) (not b!314351) (not b!314354) (not start!69786) (not b!314352) (not b!314357) (not b!314355))

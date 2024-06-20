; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69794 () Bool)

(assert start!69794)

(declare-fun b!314447 () Bool)

(declare-fun res!257597 () Bool)

(declare-fun e!226267 () Bool)

(assert (=> b!314447 (=> (not res!257597) (not e!226267))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19358 0))(
  ( (array!19359 (arr!9483 (Array (_ BitVec 32) (_ BitVec 8))) (size!8403 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19358)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19358)

(declare-fun arrayBitRangesEq!0 (array!19358 array!19358 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314447 (= res!257597 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314448 () Bool)

(declare-fun res!257595 () Bool)

(assert (=> b!314448 (=> (not res!257595) (not e!226267))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314448 (= res!257595 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314449 () Bool)

(assert (=> b!314449 (= e!226267 (not true))))

(assert (=> b!314449 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21597 0))(
  ( (Unit!21598) )
))
(declare-fun lt!442448 () Unit!21597)

(declare-fun arrayBitRangesEqDrop1!0 (array!19358 array!19358 (_ BitVec 64) (_ BitVec 64)) Unit!21597)

(assert (=> b!314449 (= lt!442448 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun a3!79 () array!19358)

(assert (=> b!314449 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442447 () Unit!21597)

(declare-fun arrayBitRangesEqAppend!0 (array!19358 array!19358 (_ BitVec 64) (_ BitVec 64)) Unit!21597)

(assert (=> b!314449 (= lt!442447 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314450 () Bool)

(declare-fun res!257596 () Bool)

(assert (=> b!314450 (=> (not res!257596) (not e!226267))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314450 (= res!257596 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314451 () Bool)

(declare-fun res!257598 () Bool)

(assert (=> b!314451 (=> (not res!257598) (not e!226267))))

(assert (=> b!314451 (= res!257598 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257599 () Bool)

(assert (=> start!69794 (=> (not res!257599) (not e!226267))))

(assert (=> start!69794 (= res!257599 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8403 a1!825) (size!8403 a2!825)) (= (size!8403 a2!825) (size!8403 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8403 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8403 a2!825))))))))

(assert (=> start!69794 e!226267))

(assert (=> start!69794 true))

(declare-fun array_inv!7955 (array!19358) Bool)

(assert (=> start!69794 (array_inv!7955 a1!825)))

(assert (=> start!69794 (array_inv!7955 a3!79)))

(assert (=> start!69794 (array_inv!7955 a2!825)))

(declare-fun b!314452 () Bool)

(declare-fun res!257600 () Bool)

(assert (=> b!314452 (=> (not res!257600) (not e!226267))))

(assert (=> b!314452 (= res!257600 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314453 () Bool)

(declare-fun res!257594 () Bool)

(assert (=> b!314453 (=> (not res!257594) (not e!226267))))

(assert (=> b!314453 (= res!257594 (not (= i!1020 mid!82)))))

(declare-fun b!314454 () Bool)

(declare-fun res!257593 () Bool)

(assert (=> b!314454 (=> (not res!257593) (not e!226267))))

(assert (=> b!314454 (= res!257593 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69794 res!257599) b!314452))

(assert (= (and b!314452 res!257600) b!314454))

(assert (= (and b!314454 res!257593) b!314448))

(assert (= (and b!314448 res!257595) b!314447))

(assert (= (and b!314447 res!257597) b!314450))

(assert (= (and b!314450 res!257596) b!314451))

(assert (= (and b!314451 res!257598) b!314453))

(assert (= (and b!314453 res!257594) b!314449))

(declare-fun m!451997 () Bool)

(assert (=> start!69794 m!451997))

(declare-fun m!451999 () Bool)

(assert (=> start!69794 m!451999))

(declare-fun m!452001 () Bool)

(assert (=> start!69794 m!452001))

(declare-fun m!452003 () Bool)

(assert (=> b!314449 m!452003))

(declare-fun m!452005 () Bool)

(assert (=> b!314449 m!452005))

(declare-fun m!452007 () Bool)

(assert (=> b!314449 m!452007))

(declare-fun m!452009 () Bool)

(assert (=> b!314449 m!452009))

(declare-fun m!452011 () Bool)

(assert (=> b!314452 m!452011))

(declare-fun m!452013 () Bool)

(assert (=> b!314451 m!452013))

(declare-fun m!452015 () Bool)

(assert (=> b!314454 m!452015))

(declare-fun m!452017 () Bool)

(assert (=> b!314450 m!452017))

(declare-fun m!452019 () Bool)

(assert (=> b!314447 m!452019))

(push 1)

(assert (not b!314452))

(assert (not b!314454))

(assert (not b!314449))

(assert (not b!314447))

(assert (not start!69794))

(assert (not b!314451))

(assert (not b!314450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


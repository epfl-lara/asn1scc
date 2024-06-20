; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69822 () Bool)

(assert start!69822)

(declare-fun b!314788 () Bool)

(declare-fun e!226438 () Bool)

(declare-datatypes ((array!19386 0))(
  ( (array!19387 (arr!9497 (Array (_ BitVec 32) (_ BitVec 8))) (size!8417 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19386)

(declare-fun a3!79 () array!19386)

(assert (=> b!314788 (= e!226438 (bvsle (size!8417 a1!825) (size!8417 a3!79)))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19386 array!19386 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314788 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-datatypes ((Unit!21625 0))(
  ( (Unit!21626) )
))
(declare-fun lt!442578 () Unit!21625)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19386)

(declare-fun rec!20 (array!19386 array!19386 array!19386 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21625)

(assert (=> b!314788 (= lt!442578 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun b!314789 () Bool)

(declare-fun res!257934 () Bool)

(declare-fun e!226437 () Bool)

(assert (=> b!314789 (=> (not res!257934) (not e!226437))))

(assert (=> b!314789 (= res!257934 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314790 () Bool)

(declare-fun res!257938 () Bool)

(assert (=> b!314790 (=> (not res!257938) (not e!226437))))

(assert (=> b!314790 (= res!257938 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314791 () Bool)

(declare-fun res!257939 () Bool)

(assert (=> b!314791 (=> (not res!257939) (not e!226437))))

(assert (=> b!314791 (= res!257939 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314792 () Bool)

(assert (=> b!314792 (= e!226437 (not e!226438))))

(declare-fun res!257940 () Bool)

(assert (=> b!314792 (=> res!257940 e!226438)))

(assert (=> b!314792 (= res!257940 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(assert (=> b!314792 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-fun lt!442579 () Unit!21625)

(declare-fun arrayBitRangesEqDrop1!0 (array!19386 array!19386 (_ BitVec 64) (_ BitVec 64)) Unit!21625)

(assert (=> b!314792 (= lt!442579 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314792 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442580 () Unit!21625)

(assert (=> b!314792 (= lt!442580 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314792 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442577 () Unit!21625)

(declare-fun arrayBitRangesEqAppend!0 (array!19386 array!19386 (_ BitVec 64) (_ BitVec 64)) Unit!21625)

(assert (=> b!314792 (= lt!442577 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314793 () Bool)

(declare-fun res!257936 () Bool)

(assert (=> b!314793 (=> (not res!257936) (not e!226437))))

(assert (=> b!314793 (= res!257936 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314794 () Bool)

(declare-fun res!257942 () Bool)

(assert (=> b!314794 (=> (not res!257942) (not e!226437))))

(assert (=> b!314794 (= res!257942 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314795 () Bool)

(declare-fun res!257941 () Bool)

(assert (=> b!314795 (=> (not res!257941) (not e!226437))))

(assert (=> b!314795 (= res!257941 (not (= i!1020 mid!82)))))

(declare-fun b!314796 () Bool)

(declare-fun res!257935 () Bool)

(assert (=> b!314796 (=> (not res!257935) (not e!226437))))

(assert (=> b!314796 (= res!257935 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!257937 () Bool)

(assert (=> start!69822 (=> (not res!257937) (not e!226437))))

(assert (=> start!69822 (= res!257937 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8417 a1!825) (size!8417 a2!825)) (= (size!8417 a2!825) (size!8417 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8417 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8417 a2!825))))))))

(assert (=> start!69822 e!226437))

(assert (=> start!69822 true))

(declare-fun array_inv!7969 (array!19386) Bool)

(assert (=> start!69822 (array_inv!7969 a1!825)))

(assert (=> start!69822 (array_inv!7969 a3!79)))

(assert (=> start!69822 (array_inv!7969 a2!825)))

(assert (= (and start!69822 res!257937) b!314793))

(assert (= (and b!314793 res!257936) b!314791))

(assert (= (and b!314791 res!257939) b!314794))

(assert (= (and b!314794 res!257942) b!314796))

(assert (= (and b!314796 res!257935) b!314789))

(assert (= (and b!314789 res!257934) b!314790))

(assert (= (and b!314790 res!257938) b!314795))

(assert (= (and b!314795 res!257941) b!314792))

(assert (= (and b!314792 (not res!257940)) b!314788))

(declare-fun m!452389 () Bool)

(assert (=> b!314793 m!452389))

(declare-fun m!452391 () Bool)

(assert (=> b!314791 m!452391))

(declare-fun m!452393 () Bool)

(assert (=> start!69822 m!452393))

(declare-fun m!452395 () Bool)

(assert (=> start!69822 m!452395))

(declare-fun m!452397 () Bool)

(assert (=> start!69822 m!452397))

(declare-fun m!452399 () Bool)

(assert (=> b!314796 m!452399))

(declare-fun m!452401 () Bool)

(assert (=> b!314788 m!452401))

(declare-fun m!452403 () Bool)

(assert (=> b!314788 m!452403))

(declare-fun m!452405 () Bool)

(assert (=> b!314792 m!452405))

(declare-fun m!452407 () Bool)

(assert (=> b!314792 m!452407))

(declare-fun m!452409 () Bool)

(assert (=> b!314792 m!452409))

(declare-fun m!452411 () Bool)

(assert (=> b!314792 m!452411))

(declare-fun m!452413 () Bool)

(assert (=> b!314792 m!452413))

(declare-fun m!452415 () Bool)

(assert (=> b!314792 m!452415))

(declare-fun m!452417 () Bool)

(assert (=> b!314789 m!452417))

(declare-fun m!452419 () Bool)

(assert (=> b!314790 m!452419))

(check-sat (not b!314791) (not b!314793) (not start!69822) (not b!314792) (not b!314788) (not b!314790) (not b!314796) (not b!314789))
(check-sat)

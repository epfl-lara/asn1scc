; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69750 () Bool)

(assert start!69750)

(declare-fun b!313919 () Bool)

(declare-fun res!257068 () Bool)

(declare-fun e!226001 () Bool)

(assert (=> b!313919 (=> (not res!257068) (not e!226001))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19314 0))(
  ( (array!19315 (arr!9461 (Array (_ BitVec 32) (_ BitVec 8))) (size!8381 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19314)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19314)

(declare-fun arrayBitRangesEq!0 (array!19314 array!19314 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313919 (= res!257068 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313920 () Bool)

(declare-fun res!257067 () Bool)

(assert (=> b!313920 (=> (not res!257067) (not e!226001))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!313920 (= res!257067 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313922 () Bool)

(declare-fun res!257072 () Bool)

(assert (=> b!313922 (=> (not res!257072) (not e!226001))))

(assert (=> b!313922 (= res!257072 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313923 () Bool)

(declare-fun res!257069 () Bool)

(assert (=> b!313923 (=> (not res!257069) (not e!226001))))

(assert (=> b!313923 (= res!257069 (not (= i!1020 mid!82)))))

(declare-fun b!313924 () Bool)

(assert (=> b!313924 (= e!226001 (not true))))

(declare-fun a3!79 () array!19314)

(assert (=> b!313924 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21553 0))(
  ( (Unit!21554) )
))
(declare-fun lt!442346 () Unit!21553)

(declare-fun arrayBitRangesEqAppend!0 (array!19314 array!19314 (_ BitVec 64) (_ BitVec 64)) Unit!21553)

(assert (=> b!313924 (= lt!442346 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257065 () Bool)

(assert (=> start!69750 (=> (not res!257065) (not e!226001))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69750 (= res!257065 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8381 a1!825) (size!8381 a2!825)) (= (size!8381 a2!825) (size!8381 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8381 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8381 a2!825))))))))

(assert (=> start!69750 e!226001))

(assert (=> start!69750 true))

(declare-fun array_inv!7933 (array!19314) Bool)

(assert (=> start!69750 (array_inv!7933 a1!825)))

(assert (=> start!69750 (array_inv!7933 a3!79)))

(assert (=> start!69750 (array_inv!7933 a2!825)))

(declare-fun b!313921 () Bool)

(declare-fun res!257066 () Bool)

(assert (=> b!313921 (=> (not res!257066) (not e!226001))))

(assert (=> b!313921 (= res!257066 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313925 () Bool)

(declare-fun res!257071 () Bool)

(assert (=> b!313925 (=> (not res!257071) (not e!226001))))

(assert (=> b!313925 (= res!257071 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313926 () Bool)

(declare-fun res!257070 () Bool)

(assert (=> b!313926 (=> (not res!257070) (not e!226001))))

(assert (=> b!313926 (= res!257070 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69750 res!257065) b!313920))

(assert (= (and b!313920 res!257067) b!313921))

(assert (= (and b!313921 res!257066) b!313922))

(assert (= (and b!313922 res!257072) b!313919))

(assert (= (and b!313919 res!257068) b!313925))

(assert (= (and b!313925 res!257071) b!313926))

(assert (= (and b!313926 res!257070) b!313923))

(assert (= (and b!313923 res!257069) b!313924))

(declare-fun m!451513 () Bool)

(assert (=> b!313920 m!451513))

(declare-fun m!451515 () Bool)

(assert (=> b!313921 m!451515))

(declare-fun m!451517 () Bool)

(assert (=> b!313925 m!451517))

(declare-fun m!451519 () Bool)

(assert (=> b!313924 m!451519))

(declare-fun m!451521 () Bool)

(assert (=> b!313924 m!451521))

(declare-fun m!451523 () Bool)

(assert (=> b!313919 m!451523))

(declare-fun m!451525 () Bool)

(assert (=> start!69750 m!451525))

(declare-fun m!451527 () Bool)

(assert (=> start!69750 m!451527))

(declare-fun m!451529 () Bool)

(assert (=> start!69750 m!451529))

(declare-fun m!451531 () Bool)

(assert (=> b!313926 m!451531))

(check-sat (not start!69750) (not b!313924) (not b!313925) (not b!313919) (not b!313921) (not b!313920) (not b!313926))

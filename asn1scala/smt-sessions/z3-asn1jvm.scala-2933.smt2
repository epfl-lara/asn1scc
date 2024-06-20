; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69762 () Bool)

(assert start!69762)

(declare-fun b!314063 () Bool)

(declare-fun res!257212 () Bool)

(declare-fun e!226075 () Bool)

(assert (=> b!314063 (=> (not res!257212) (not e!226075))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19326 0))(
  ( (array!19327 (arr!9467 (Array (_ BitVec 32) (_ BitVec 8))) (size!8387 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19326)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19326)

(declare-fun arrayBitRangesEq!0 (array!19326 array!19326 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314063 (= res!257212 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314064 () Bool)

(declare-fun res!257213 () Bool)

(assert (=> b!314064 (=> (not res!257213) (not e!226075))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!314064 (= res!257213 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314065 () Bool)

(assert (=> b!314065 (= e!226075 (not true))))

(declare-fun a3!79 () array!19326)

(assert (=> b!314065 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21565 0))(
  ( (Unit!21566) )
))
(declare-fun lt!442364 () Unit!21565)

(declare-fun arrayBitRangesEqAppend!0 (array!19326 array!19326 (_ BitVec 64) (_ BitVec 64)) Unit!21565)

(assert (=> b!314065 (= lt!442364 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314066 () Bool)

(declare-fun res!257211 () Bool)

(assert (=> b!314066 (=> (not res!257211) (not e!226075))))

(assert (=> b!314066 (= res!257211 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257214 () Bool)

(assert (=> start!69762 (=> (not res!257214) (not e!226075))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69762 (= res!257214 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8387 a1!825) (size!8387 a2!825)) (= (size!8387 a2!825) (size!8387 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8387 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8387 a2!825))))))))

(assert (=> start!69762 e!226075))

(assert (=> start!69762 true))

(declare-fun array_inv!7939 (array!19326) Bool)

(assert (=> start!69762 (array_inv!7939 a1!825)))

(assert (=> start!69762 (array_inv!7939 a3!79)))

(assert (=> start!69762 (array_inv!7939 a2!825)))

(declare-fun b!314067 () Bool)

(declare-fun res!257215 () Bool)

(assert (=> b!314067 (=> (not res!257215) (not e!226075))))

(assert (=> b!314067 (= res!257215 (not (= i!1020 mid!82)))))

(declare-fun b!314068 () Bool)

(declare-fun res!257210 () Bool)

(assert (=> b!314068 (=> (not res!257210) (not e!226075))))

(assert (=> b!314068 (= res!257210 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314069 () Bool)

(declare-fun res!257216 () Bool)

(assert (=> b!314069 (=> (not res!257216) (not e!226075))))

(assert (=> b!314069 (= res!257216 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314070 () Bool)

(declare-fun res!257209 () Bool)

(assert (=> b!314070 (=> (not res!257209) (not e!226075))))

(assert (=> b!314070 (= res!257209 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69762 res!257214) b!314063))

(assert (= (and b!314063 res!257212) b!314069))

(assert (= (and b!314069 res!257216) b!314064))

(assert (= (and b!314064 res!257213) b!314070))

(assert (= (and b!314070 res!257209) b!314068))

(assert (= (and b!314068 res!257210) b!314066))

(assert (= (and b!314066 res!257211) b!314067))

(assert (= (and b!314067 res!257215) b!314065))

(declare-fun m!451633 () Bool)

(assert (=> b!314070 m!451633))

(declare-fun m!451635 () Bool)

(assert (=> start!69762 m!451635))

(declare-fun m!451637 () Bool)

(assert (=> start!69762 m!451637))

(declare-fun m!451639 () Bool)

(assert (=> start!69762 m!451639))

(declare-fun m!451641 () Bool)

(assert (=> b!314069 m!451641))

(declare-fun m!451643 () Bool)

(assert (=> b!314068 m!451643))

(declare-fun m!451645 () Bool)

(assert (=> b!314063 m!451645))

(declare-fun m!451647 () Bool)

(assert (=> b!314065 m!451647))

(declare-fun m!451649 () Bool)

(assert (=> b!314065 m!451649))

(declare-fun m!451651 () Bool)

(assert (=> b!314066 m!451651))

(check-sat (not b!314070) (not start!69762) (not b!314066) (not b!314069) (not b!314068) (not b!314063) (not b!314065))

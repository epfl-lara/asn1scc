; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69754 () Bool)

(assert start!69754)

(declare-fun b!313967 () Bool)

(declare-fun res!257114 () Bool)

(declare-fun e!226027 () Bool)

(assert (=> b!313967 (=> (not res!257114) (not e!226027))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19318 0))(
  ( (array!19319 (arr!9463 (Array (_ BitVec 32) (_ BitVec 8))) (size!8383 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19318)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19318)

(declare-fun arrayBitRangesEq!0 (array!19318 array!19318 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313967 (= res!257114 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313968 () Bool)

(declare-fun res!257119 () Bool)

(assert (=> b!313968 (=> (not res!257119) (not e!226027))))

(declare-fun a3!79 () array!19318)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!313968 (= res!257119 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313969 () Bool)

(declare-fun res!257113 () Bool)

(assert (=> b!313969 (=> (not res!257113) (not e!226027))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!313969 (= res!257113 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313970 () Bool)

(assert (=> b!313970 (= e!226027 (not true))))

(assert (=> b!313970 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21557 0))(
  ( (Unit!21558) )
))
(declare-fun lt!442352 () Unit!21557)

(declare-fun arrayBitRangesEqAppend!0 (array!19318 array!19318 (_ BitVec 64) (_ BitVec 64)) Unit!21557)

(assert (=> b!313970 (= lt!442352 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!313971 () Bool)

(declare-fun res!257120 () Bool)

(assert (=> b!313971 (=> (not res!257120) (not e!226027))))

(assert (=> b!313971 (= res!257120 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!313972 () Bool)

(declare-fun res!257116 () Bool)

(assert (=> b!313972 (=> (not res!257116) (not e!226027))))

(assert (=> b!313972 (= res!257116 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!257115 () Bool)

(assert (=> start!69754 (=> (not res!257115) (not e!226027))))

(assert (=> start!69754 (= res!257115 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8383 a1!825) (size!8383 a2!825)) (= (size!8383 a2!825) (size!8383 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8383 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8383 a2!825))))))))

(assert (=> start!69754 e!226027))

(assert (=> start!69754 true))

(declare-fun array_inv!7935 (array!19318) Bool)

(assert (=> start!69754 (array_inv!7935 a1!825)))

(assert (=> start!69754 (array_inv!7935 a3!79)))

(assert (=> start!69754 (array_inv!7935 a2!825)))

(declare-fun b!313973 () Bool)

(declare-fun res!257118 () Bool)

(assert (=> b!313973 (=> (not res!257118) (not e!226027))))

(assert (=> b!313973 (= res!257118 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313974 () Bool)

(declare-fun res!257117 () Bool)

(assert (=> b!313974 (=> (not res!257117) (not e!226027))))

(assert (=> b!313974 (= res!257117 (not (= i!1020 mid!82)))))

(assert (= (and start!69754 res!257115) b!313967))

(assert (= (and b!313967 res!257114) b!313968))

(assert (= (and b!313968 res!257119) b!313972))

(assert (= (and b!313972 res!257116) b!313973))

(assert (= (and b!313973 res!257118) b!313969))

(assert (= (and b!313969 res!257113) b!313971))

(assert (= (and b!313971 res!257120) b!313974))

(assert (= (and b!313974 res!257117) b!313970))

(declare-fun m!451553 () Bool)

(assert (=> b!313970 m!451553))

(declare-fun m!451555 () Bool)

(assert (=> b!313970 m!451555))

(declare-fun m!451557 () Bool)

(assert (=> b!313971 m!451557))

(declare-fun m!451559 () Bool)

(assert (=> b!313969 m!451559))

(declare-fun m!451561 () Bool)

(assert (=> start!69754 m!451561))

(declare-fun m!451563 () Bool)

(assert (=> start!69754 m!451563))

(declare-fun m!451565 () Bool)

(assert (=> start!69754 m!451565))

(declare-fun m!451567 () Bool)

(assert (=> b!313973 m!451567))

(declare-fun m!451569 () Bool)

(assert (=> b!313968 m!451569))

(declare-fun m!451571 () Bool)

(assert (=> b!313967 m!451571))

(push 1)

(assert (not start!69754))

(assert (not b!313967))

(assert (not b!313971))

(assert (not b!313969))

(assert (not b!313970))

(assert (not b!313973))

(assert (not b!313968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69790 () Bool)

(assert start!69790)

(declare-fun b!314399 () Bool)

(declare-fun res!257547 () Bool)

(declare-fun e!226242 () Bool)

(assert (=> b!314399 (=> (not res!257547) (not e!226242))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19354 0))(
  ( (array!19355 (arr!9481 (Array (_ BitVec 32) (_ BitVec 8))) (size!8401 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19354)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19354)

(declare-fun arrayBitRangesEq!0 (array!19354 array!19354 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314399 (= res!257547 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!257550 () Bool)

(assert (=> start!69790 (=> (not res!257550) (not e!226242))))

(declare-fun a3!79 () array!19354)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> start!69790 (= res!257550 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8401 a1!825) (size!8401 a2!825)) (= (size!8401 a2!825) (size!8401 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8401 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8401 a2!825))))))))

(assert (=> start!69790 e!226242))

(assert (=> start!69790 true))

(declare-fun array_inv!7953 (array!19354) Bool)

(assert (=> start!69790 (array_inv!7953 a1!825)))

(assert (=> start!69790 (array_inv!7953 a3!79)))

(assert (=> start!69790 (array_inv!7953 a2!825)))

(declare-fun b!314400 () Bool)

(declare-fun res!257546 () Bool)

(assert (=> b!314400 (=> (not res!257546) (not e!226242))))

(assert (=> b!314400 (= res!257546 (not (= i!1020 mid!82)))))

(declare-fun b!314401 () Bool)

(assert (=> b!314401 (= e!226242 (not true))))

(assert (=> b!314401 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21593 0))(
  ( (Unit!21594) )
))
(declare-fun lt!442435 () Unit!21593)

(declare-fun arrayBitRangesEqDrop1!0 (array!19354 array!19354 (_ BitVec 64) (_ BitVec 64)) Unit!21593)

(assert (=> b!314401 (= lt!442435 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314401 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442436 () Unit!21593)

(declare-fun arrayBitRangesEqAppend!0 (array!19354 array!19354 (_ BitVec 64) (_ BitVec 64)) Unit!21593)

(assert (=> b!314401 (= lt!442436 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314402 () Bool)

(declare-fun res!257545 () Bool)

(assert (=> b!314402 (=> (not res!257545) (not e!226242))))

(assert (=> b!314402 (= res!257545 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314403 () Bool)

(declare-fun res!257552 () Bool)

(assert (=> b!314403 (=> (not res!257552) (not e!226242))))

(assert (=> b!314403 (= res!257552 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314404 () Bool)

(declare-fun res!257549 () Bool)

(assert (=> b!314404 (=> (not res!257549) (not e!226242))))

(assert (=> b!314404 (= res!257549 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314405 () Bool)

(declare-fun res!257548 () Bool)

(assert (=> b!314405 (=> (not res!257548) (not e!226242))))

(assert (=> b!314405 (= res!257548 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314406 () Bool)

(declare-fun res!257551 () Bool)

(assert (=> b!314406 (=> (not res!257551) (not e!226242))))

(assert (=> b!314406 (= res!257551 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69790 res!257550) b!314403))

(assert (= (and b!314403 res!257552) b!314405))

(assert (= (and b!314405 res!257548) b!314404))

(assert (= (and b!314404 res!257549) b!314399))

(assert (= (and b!314399 res!257547) b!314402))

(assert (= (and b!314402 res!257545) b!314406))

(assert (= (and b!314406 res!257551) b!314400))

(assert (= (and b!314400 res!257546) b!314401))

(declare-fun m!451949 () Bool)

(assert (=> b!314399 m!451949))

(declare-fun m!451951 () Bool)

(assert (=> start!69790 m!451951))

(declare-fun m!451953 () Bool)

(assert (=> start!69790 m!451953))

(declare-fun m!451955 () Bool)

(assert (=> start!69790 m!451955))

(declare-fun m!451957 () Bool)

(assert (=> b!314405 m!451957))

(declare-fun m!451959 () Bool)

(assert (=> b!314402 m!451959))

(declare-fun m!451961 () Bool)

(assert (=> b!314406 m!451961))

(declare-fun m!451963 () Bool)

(assert (=> b!314401 m!451963))

(declare-fun m!451965 () Bool)

(assert (=> b!314401 m!451965))

(declare-fun m!451967 () Bool)

(assert (=> b!314401 m!451967))

(declare-fun m!451969 () Bool)

(assert (=> b!314401 m!451969))

(declare-fun m!451971 () Bool)

(assert (=> b!314403 m!451971))

(push 1)

(assert (not b!314401))

(assert (not b!314403))

(assert (not b!314406))

(assert (not b!314399))

(assert (not b!314405))

(assert (not b!314402))

(assert (not start!69790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


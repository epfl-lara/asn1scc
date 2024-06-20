; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69784 () Bool)

(assert start!69784)

(declare-fun b!314327 () Bool)

(declare-fun res!257478 () Bool)

(declare-fun e!226207 () Bool)

(assert (=> b!314327 (=> (not res!257478) (not e!226207))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314327 (= res!257478 (not (= i!1020 mid!82)))))

(declare-fun b!314328 () Bool)

(declare-fun res!257477 () Bool)

(assert (=> b!314328 (=> (not res!257477) (not e!226207))))

(declare-datatypes ((array!19348 0))(
  ( (array!19349 (arr!9478 (Array (_ BitVec 32) (_ BitVec 8))) (size!8398 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19348)

(declare-fun a3!79 () array!19348)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19348 array!19348 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314328 (= res!257477 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314329 () Bool)

(declare-fun res!257474 () Bool)

(assert (=> b!314329 (=> (not res!257474) (not e!226207))))

(declare-fun a2!825 () array!19348)

(assert (=> b!314329 (= res!257474 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314330 () Bool)

(declare-fun res!257473 () Bool)

(assert (=> b!314330 (=> (not res!257473) (not e!226207))))

(assert (=> b!314330 (= res!257473 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314332 () Bool)

(declare-fun res!257475 () Bool)

(assert (=> b!314332 (=> (not res!257475) (not e!226207))))

(assert (=> b!314332 (= res!257475 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314333 () Bool)

(assert (=> b!314333 (= e!226207 (not true))))

(assert (=> b!314333 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21587 0))(
  ( (Unit!21588) )
))
(declare-fun lt!442418 () Unit!21587)

(declare-fun arrayBitRangesEqDrop1!0 (array!19348 array!19348 (_ BitVec 64) (_ BitVec 64)) Unit!21587)

(assert (=> b!314333 (= lt!442418 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314333 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442417 () Unit!21587)

(declare-fun arrayBitRangesEqAppend!0 (array!19348 array!19348 (_ BitVec 64) (_ BitVec 64)) Unit!21587)

(assert (=> b!314333 (= lt!442417 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314334 () Bool)

(declare-fun res!257479 () Bool)

(assert (=> b!314334 (=> (not res!257479) (not e!226207))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314334 (= res!257479 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314331 () Bool)

(declare-fun res!257476 () Bool)

(assert (=> b!314331 (=> (not res!257476) (not e!226207))))

(assert (=> b!314331 (= res!257476 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!257480 () Bool)

(assert (=> start!69784 (=> (not res!257480) (not e!226207))))

(assert (=> start!69784 (= res!257480 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8398 a1!825) (size!8398 a2!825)) (= (size!8398 a2!825) (size!8398 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8398 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8398 a2!825))))))))

(assert (=> start!69784 e!226207))

(assert (=> start!69784 true))

(declare-fun array_inv!7950 (array!19348) Bool)

(assert (=> start!69784 (array_inv!7950 a1!825)))

(assert (=> start!69784 (array_inv!7950 a3!79)))

(assert (=> start!69784 (array_inv!7950 a2!825)))

(assert (= (and start!69784 res!257480) b!314329))

(assert (= (and b!314329 res!257474) b!314331))

(assert (= (and b!314331 res!257476) b!314330))

(assert (= (and b!314330 res!257473) b!314332))

(assert (= (and b!314332 res!257475) b!314334))

(assert (= (and b!314334 res!257479) b!314328))

(assert (= (and b!314328 res!257477) b!314327))

(assert (= (and b!314327 res!257478) b!314333))

(declare-fun m!451877 () Bool)

(assert (=> b!314329 m!451877))

(declare-fun m!451879 () Bool)

(assert (=> b!314328 m!451879))

(declare-fun m!451881 () Bool)

(assert (=> b!314334 m!451881))

(declare-fun m!451883 () Bool)

(assert (=> b!314332 m!451883))

(declare-fun m!451885 () Bool)

(assert (=> b!314331 m!451885))

(declare-fun m!451887 () Bool)

(assert (=> b!314333 m!451887))

(declare-fun m!451889 () Bool)

(assert (=> b!314333 m!451889))

(declare-fun m!451891 () Bool)

(assert (=> b!314333 m!451891))

(declare-fun m!451893 () Bool)

(assert (=> b!314333 m!451893))

(declare-fun m!451895 () Bool)

(assert (=> start!69784 m!451895))

(declare-fun m!451897 () Bool)

(assert (=> start!69784 m!451897))

(declare-fun m!451899 () Bool)

(assert (=> start!69784 m!451899))

(push 1)

(assert (not start!69784))

(assert (not b!314328))

(assert (not b!314331))

(assert (not b!314329))

(assert (not b!314332))

(assert (not b!314334))

(assert (not b!314333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


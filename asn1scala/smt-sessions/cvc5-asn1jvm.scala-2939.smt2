; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69796 () Bool)

(assert start!69796)

(declare-fun b!314471 () Bool)

(declare-fun e!226279 () Bool)

(assert (=> b!314471 (= e!226279 (not true))))

(declare-datatypes ((array!19360 0))(
  ( (array!19361 (arr!9484 (Array (_ BitVec 32) (_ BitVec 8))) (size!8404 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19360)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19360)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19360 array!19360 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314471 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21599 0))(
  ( (Unit!21600) )
))
(declare-fun lt!442457 () Unit!21599)

(declare-fun arrayBitRangesEqDrop1!0 (array!19360 array!19360 (_ BitVec 64) (_ BitVec 64)) Unit!21599)

(assert (=> b!314471 (= lt!442457 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19360)

(assert (=> b!314471 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442455 () Unit!21599)

(assert (=> b!314471 (= lt!442455 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314471 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442456 () Unit!21599)

(declare-fun arrayBitRangesEqAppend!0 (array!19360 array!19360 (_ BitVec 64) (_ BitVec 64)) Unit!21599)

(assert (=> b!314471 (= lt!442456 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257624 () Bool)

(assert (=> start!69796 (=> (not res!257624) (not e!226279))))

(assert (=> start!69796 (= res!257624 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8404 a1!825) (size!8404 a2!825)) (= (size!8404 a2!825) (size!8404 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8404 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8404 a2!825))))))))

(assert (=> start!69796 e!226279))

(assert (=> start!69796 true))

(declare-fun array_inv!7956 (array!19360) Bool)

(assert (=> start!69796 (array_inv!7956 a1!825)))

(assert (=> start!69796 (array_inv!7956 a3!79)))

(assert (=> start!69796 (array_inv!7956 a2!825)))

(declare-fun b!314472 () Bool)

(declare-fun res!257622 () Bool)

(assert (=> b!314472 (=> (not res!257622) (not e!226279))))

(assert (=> b!314472 (= res!257622 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314473 () Bool)

(declare-fun res!257621 () Bool)

(assert (=> b!314473 (=> (not res!257621) (not e!226279))))

(assert (=> b!314473 (= res!257621 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314474 () Bool)

(declare-fun res!257617 () Bool)

(assert (=> b!314474 (=> (not res!257617) (not e!226279))))

(assert (=> b!314474 (= res!257617 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314475 () Bool)

(declare-fun res!257619 () Bool)

(assert (=> b!314475 (=> (not res!257619) (not e!226279))))

(assert (=> b!314475 (= res!257619 (not (= i!1020 mid!82)))))

(declare-fun b!314476 () Bool)

(declare-fun res!257620 () Bool)

(assert (=> b!314476 (=> (not res!257620) (not e!226279))))

(assert (=> b!314476 (= res!257620 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314477 () Bool)

(declare-fun res!257623 () Bool)

(assert (=> b!314477 (=> (not res!257623) (not e!226279))))

(assert (=> b!314477 (= res!257623 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314478 () Bool)

(declare-fun res!257618 () Bool)

(assert (=> b!314478 (=> (not res!257618) (not e!226279))))

(assert (=> b!314478 (= res!257618 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69796 res!257624) b!314472))

(assert (= (and b!314472 res!257622) b!314478))

(assert (= (and b!314478 res!257618) b!314474))

(assert (= (and b!314474 res!257617) b!314476))

(assert (= (and b!314476 res!257620) b!314477))

(assert (= (and b!314477 res!257623) b!314473))

(assert (= (and b!314473 res!257621) b!314475))

(assert (= (and b!314475 res!257619) b!314471))

(declare-fun m!452021 () Bool)

(assert (=> start!69796 m!452021))

(declare-fun m!452023 () Bool)

(assert (=> start!69796 m!452023))

(declare-fun m!452025 () Bool)

(assert (=> start!69796 m!452025))

(declare-fun m!452027 () Bool)

(assert (=> b!314472 m!452027))

(declare-fun m!452029 () Bool)

(assert (=> b!314478 m!452029))

(declare-fun m!452031 () Bool)

(assert (=> b!314471 m!452031))

(declare-fun m!452033 () Bool)

(assert (=> b!314471 m!452033))

(declare-fun m!452035 () Bool)

(assert (=> b!314471 m!452035))

(declare-fun m!452037 () Bool)

(assert (=> b!314471 m!452037))

(declare-fun m!452039 () Bool)

(assert (=> b!314471 m!452039))

(declare-fun m!452041 () Bool)

(assert (=> b!314471 m!452041))

(declare-fun m!452043 () Bool)

(assert (=> b!314476 m!452043))

(declare-fun m!452045 () Bool)

(assert (=> b!314473 m!452045))

(declare-fun m!452047 () Bool)

(assert (=> b!314477 m!452047))

(push 1)

(assert (not b!314476))

(assert (not b!314471))

(assert (not b!314473))

(assert (not b!314472))

(assert (not start!69796))

(assert (not b!314477))

(assert (not b!314478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


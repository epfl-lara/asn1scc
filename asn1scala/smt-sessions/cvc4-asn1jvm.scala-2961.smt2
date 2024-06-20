; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69968 () Bool)

(assert start!69968)

(declare-fun b!316274 () Bool)

(declare-fun res!259384 () Bool)

(declare-fun e!227278 () Bool)

(assert (=> b!316274 (=> (not res!259384) (not e!227278))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19499 0))(
  ( (array!19500 (arr!9555 (Array (_ BitVec 32) (_ BitVec 8))) (size!8472 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19499)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19499)

(declare-fun arrayBitRangesEq!0 (array!19499 array!19499 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316274 (= res!259384 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316275 () Bool)

(declare-fun res!259382 () Bool)

(assert (=> b!316275 (=> (not res!259382) (not e!227278))))

(declare-fun a3!79 () array!19499)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316275 (= res!259382 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316276 () Bool)

(declare-fun res!259378 () Bool)

(assert (=> b!316276 (=> (not res!259378) (not e!227278))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316276 (= res!259378 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316277 () Bool)

(declare-fun res!259380 () Bool)

(assert (=> b!316277 (=> (not res!259380) (not e!227278))))

(assert (=> b!316277 (= res!259380 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!259381 () Bool)

(assert (=> start!69968 (=> (not res!259381) (not e!227278))))

(assert (=> start!69968 (= res!259381 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8472 a1!825) (size!8472 a2!825)) (= (size!8472 a2!825) (size!8472 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8472 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8472 a2!825))))))))

(assert (=> start!69968 e!227278))

(assert (=> start!69968 true))

(declare-fun array_inv!8024 (array!19499) Bool)

(assert (=> start!69968 (array_inv!8024 a1!825)))

(assert (=> start!69968 (array_inv!8024 a3!79)))

(assert (=> start!69968 (array_inv!8024 a2!825)))

(declare-fun b!316278 () Bool)

(assert (=> b!316278 (= e!227278 (not true))))

(assert (=> b!316278 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21699 0))(
  ( (Unit!21700) )
))
(declare-fun lt!442878 () Unit!21699)

(declare-fun arrayBitRangesEqDrop1!0 (array!19499 array!19499 (_ BitVec 64) (_ BitVec 64)) Unit!21699)

(assert (=> b!316278 (= lt!442878 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316278 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442880 () Unit!21699)

(assert (=> b!316278 (= lt!442880 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316278 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442879 () Unit!21699)

(declare-fun arrayBitRangesEqAppend!0 (array!19499 array!19499 (_ BitVec 64) (_ BitVec 64)) Unit!21699)

(assert (=> b!316278 (= lt!442879 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316279 () Bool)

(declare-fun res!259385 () Bool)

(assert (=> b!316279 (=> (not res!259385) (not e!227278))))

(assert (=> b!316279 (= res!259385 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316280 () Bool)

(declare-fun res!259383 () Bool)

(assert (=> b!316280 (=> (not res!259383) (not e!227278))))

(assert (=> b!316280 (= res!259383 (not (= i!1020 mid!82)))))

(declare-fun b!316281 () Bool)

(declare-fun res!259379 () Bool)

(assert (=> b!316281 (=> (not res!259379) (not e!227278))))

(assert (=> b!316281 (= res!259379 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69968 res!259381) b!316279))

(assert (= (and b!316279 res!259385) b!316276))

(assert (= (and b!316276 res!259378) b!316281))

(assert (= (and b!316281 res!259379) b!316274))

(assert (= (and b!316274 res!259384) b!316275))

(assert (= (and b!316275 res!259382) b!316277))

(assert (= (and b!316277 res!259380) b!316280))

(assert (= (and b!316280 res!259383) b!316278))

(declare-fun m!454051 () Bool)

(assert (=> b!316274 m!454051))

(declare-fun m!454053 () Bool)

(assert (=> b!316279 m!454053))

(declare-fun m!454055 () Bool)

(assert (=> start!69968 m!454055))

(declare-fun m!454057 () Bool)

(assert (=> start!69968 m!454057))

(declare-fun m!454059 () Bool)

(assert (=> start!69968 m!454059))

(declare-fun m!454061 () Bool)

(assert (=> b!316276 m!454061))

(declare-fun m!454063 () Bool)

(assert (=> b!316278 m!454063))

(declare-fun m!454065 () Bool)

(assert (=> b!316278 m!454065))

(declare-fun m!454067 () Bool)

(assert (=> b!316278 m!454067))

(declare-fun m!454069 () Bool)

(assert (=> b!316278 m!454069))

(declare-fun m!454071 () Bool)

(assert (=> b!316278 m!454071))

(declare-fun m!454073 () Bool)

(assert (=> b!316278 m!454073))

(declare-fun m!454075 () Bool)

(assert (=> b!316275 m!454075))

(declare-fun m!454077 () Bool)

(assert (=> b!316277 m!454077))

(push 1)

(assert (not b!316276))

(assert (not start!69968))

(assert (not b!316279))

(assert (not b!316275))

(assert (not b!316274))

(assert (not b!316277))

(assert (not b!316278))

(check-sat)

(pop 1)


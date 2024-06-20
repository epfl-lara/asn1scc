; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69776 () Bool)

(assert start!69776)

(declare-fun b!314231 () Bool)

(declare-fun res!257377 () Bool)

(declare-fun e!226156 () Bool)

(assert (=> b!314231 (=> (not res!257377) (not e!226156))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314231 (= res!257377 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314232 () Bool)

(declare-fun res!257382 () Bool)

(assert (=> b!314232 (=> (not res!257382) (not e!226156))))

(assert (=> b!314232 (= res!257382 (not (= i!1020 mid!82)))))

(declare-fun b!314233 () Bool)

(declare-fun res!257383 () Bool)

(assert (=> b!314233 (=> (not res!257383) (not e!226156))))

(declare-datatypes ((array!19340 0))(
  ( (array!19341 (arr!9474 (Array (_ BitVec 32) (_ BitVec 8))) (size!8394 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19340)

(declare-fun a2!825 () array!19340)

(declare-fun arrayBitRangesEq!0 (array!19340 array!19340 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314233 (= res!257383 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314234 () Bool)

(declare-fun res!257378 () Bool)

(assert (=> b!314234 (=> (not res!257378) (not e!226156))))

(declare-fun a3!79 () array!19340)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314234 (= res!257378 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!257384 () Bool)

(assert (=> start!69776 (=> (not res!257384) (not e!226156))))

(assert (=> start!69776 (= res!257384 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8394 a1!825) (size!8394 a2!825)) (= (size!8394 a2!825) (size!8394 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8394 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8394 a2!825))))))))

(assert (=> start!69776 e!226156))

(assert (=> start!69776 true))

(declare-fun array_inv!7946 (array!19340) Bool)

(assert (=> start!69776 (array_inv!7946 a1!825)))

(assert (=> start!69776 (array_inv!7946 a3!79)))

(assert (=> start!69776 (array_inv!7946 a2!825)))

(declare-fun b!314235 () Bool)

(declare-fun res!257381 () Bool)

(assert (=> b!314235 (=> (not res!257381) (not e!226156))))

(assert (=> b!314235 (= res!257381 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314236 () Bool)

(assert (=> b!314236 (= e!226156 (not true))))

(assert (=> b!314236 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21579 0))(
  ( (Unit!21580) )
))
(declare-fun lt!442394 () Unit!21579)

(declare-fun arrayBitRangesEqDrop1!0 (array!19340 array!19340 (_ BitVec 64) (_ BitVec 64)) Unit!21579)

(assert (=> b!314236 (= lt!442394 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314236 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442393 () Unit!21579)

(declare-fun arrayBitRangesEqAppend!0 (array!19340 array!19340 (_ BitVec 64) (_ BitVec 64)) Unit!21579)

(assert (=> b!314236 (= lt!442393 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314237 () Bool)

(declare-fun res!257379 () Bool)

(assert (=> b!314237 (=> (not res!257379) (not e!226156))))

(assert (=> b!314237 (= res!257379 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314238 () Bool)

(declare-fun res!257380 () Bool)

(assert (=> b!314238 (=> (not res!257380) (not e!226156))))

(assert (=> b!314238 (= res!257380 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69776 res!257384) b!314233))

(assert (= (and b!314233 res!257383) b!314234))

(assert (= (and b!314234 res!257378) b!314231))

(assert (= (and b!314231 res!257377) b!314237))

(assert (= (and b!314237 res!257379) b!314238))

(assert (= (and b!314238 res!257380) b!314235))

(assert (= (and b!314235 res!257381) b!314232))

(assert (= (and b!314232 res!257382) b!314236))

(declare-fun m!451781 () Bool)

(assert (=> b!314233 m!451781))

(declare-fun m!451783 () Bool)

(assert (=> start!69776 m!451783))

(declare-fun m!451785 () Bool)

(assert (=> start!69776 m!451785))

(declare-fun m!451787 () Bool)

(assert (=> start!69776 m!451787))

(declare-fun m!451789 () Bool)

(assert (=> b!314237 m!451789))

(declare-fun m!451791 () Bool)

(assert (=> b!314238 m!451791))

(declare-fun m!451793 () Bool)

(assert (=> b!314234 m!451793))

(declare-fun m!451795 () Bool)

(assert (=> b!314236 m!451795))

(declare-fun m!451797 () Bool)

(assert (=> b!314236 m!451797))

(declare-fun m!451799 () Bool)

(assert (=> b!314236 m!451799))

(declare-fun m!451801 () Bool)

(assert (=> b!314236 m!451801))

(declare-fun m!451803 () Bool)

(assert (=> b!314235 m!451803))

(push 1)

(assert (not start!69776))


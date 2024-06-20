; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69926 () Bool)

(assert start!69926)

(declare-fun b!315770 () Bool)

(declare-fun res!258880 () Bool)

(declare-fun e!227028 () Bool)

(assert (=> b!315770 (=> (not res!258880) (not e!227028))))

(declare-datatypes ((array!19457 0))(
  ( (array!19458 (arr!9534 (Array (_ BitVec 32) (_ BitVec 8))) (size!8451 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19457)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19457)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19457 array!19457 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315770 (= res!258880 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315771 () Bool)

(declare-fun res!258879 () Bool)

(assert (=> b!315771 (=> (not res!258879) (not e!227028))))

(declare-fun a1!825 () array!19457)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315771 (= res!258879 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315772 () Bool)

(declare-fun res!258874 () Bool)

(assert (=> b!315772 (=> (not res!258874) (not e!227028))))

(assert (=> b!315772 (= res!258874 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315773 () Bool)

(declare-fun res!258875 () Bool)

(assert (=> b!315773 (=> (not res!258875) (not e!227028))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!315773 (= res!258875 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258881 () Bool)

(assert (=> start!69926 (=> (not res!258881) (not e!227028))))

(assert (=> start!69926 (= res!258881 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8451 a1!825) (size!8451 a2!825)) (= (size!8451 a2!825) (size!8451 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8451 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8451 a2!825))))))))

(assert (=> start!69926 e!227028))

(assert (=> start!69926 true))

(declare-fun array_inv!8003 (array!19457) Bool)

(assert (=> start!69926 (array_inv!8003 a1!825)))

(assert (=> start!69926 (array_inv!8003 a3!79)))

(assert (=> start!69926 (array_inv!8003 a2!825)))

(declare-fun b!315774 () Bool)

(declare-fun res!258877 () Bool)

(assert (=> b!315774 (=> (not res!258877) (not e!227028))))

(assert (=> b!315774 (= res!258877 (not (= i!1020 mid!82)))))

(declare-fun b!315775 () Bool)

(declare-fun res!258876 () Bool)

(assert (=> b!315775 (=> (not res!258876) (not e!227028))))

(assert (=> b!315775 (= res!258876 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315776 () Bool)

(declare-fun res!258878 () Bool)

(assert (=> b!315776 (=> (not res!258878) (not e!227028))))

(assert (=> b!315776 (= res!258878 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315777 () Bool)

(assert (=> b!315777 (= e!227028 (not true))))

(assert (=> b!315777 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21657 0))(
  ( (Unit!21658) )
))
(declare-fun lt!442727 () Unit!21657)

(declare-fun arrayBitRangesEqAppend!0 (array!19457 array!19457 (_ BitVec 64) (_ BitVec 64)) Unit!21657)

(assert (=> b!315777 (= lt!442727 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69926 res!258881) b!315776))

(assert (= (and b!315776 res!258878) b!315772))

(assert (= (and b!315772 res!258874) b!315773))

(assert (= (and b!315773 res!258875) b!315775))

(assert (= (and b!315775 res!258876) b!315770))

(assert (= (and b!315770 res!258880) b!315771))

(assert (= (and b!315771 res!258879) b!315774))

(assert (= (and b!315774 res!258877) b!315777))

(declare-fun m!453519 () Bool)

(assert (=> start!69926 m!453519))

(declare-fun m!453521 () Bool)

(assert (=> start!69926 m!453521))

(declare-fun m!453523 () Bool)

(assert (=> start!69926 m!453523))

(declare-fun m!453525 () Bool)

(assert (=> b!315776 m!453525))

(declare-fun m!453527 () Bool)

(assert (=> b!315772 m!453527))

(declare-fun m!453529 () Bool)

(assert (=> b!315777 m!453529))

(declare-fun m!453531 () Bool)

(assert (=> b!315777 m!453531))

(declare-fun m!453533 () Bool)

(assert (=> b!315775 m!453533))

(declare-fun m!453535 () Bool)

(assert (=> b!315770 m!453535))

(declare-fun m!453537 () Bool)

(assert (=> b!315771 m!453537))

(push 1)

(assert (not b!315776))

(assert (not b!315775))


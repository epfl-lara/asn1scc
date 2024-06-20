; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69920 () Bool)

(assert start!69920)

(declare-fun b!315698 () Bool)

(declare-fun res!258809 () Bool)

(declare-fun e!226992 () Bool)

(assert (=> b!315698 (=> (not res!258809) (not e!226992))))

(declare-datatypes ((array!19451 0))(
  ( (array!19452 (arr!9531 (Array (_ BitVec 32) (_ BitVec 8))) (size!8448 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19451)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19451)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19451 array!19451 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315698 (= res!258809 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315699 () Bool)

(declare-fun res!258806 () Bool)

(assert (=> b!315699 (=> (not res!258806) (not e!226992))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315699 (= res!258806 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258805 () Bool)

(assert (=> start!69920 (=> (not res!258805) (not e!226992))))

(declare-fun a1!825 () array!19451)

(assert (=> start!69920 (= res!258805 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8448 a1!825) (size!8448 a2!825)) (= (size!8448 a2!825) (size!8448 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8448 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8448 a2!825))))))))

(assert (=> start!69920 e!226992))

(assert (=> start!69920 true))

(declare-fun array_inv!8000 (array!19451) Bool)

(assert (=> start!69920 (array_inv!8000 a1!825)))

(assert (=> start!69920 (array_inv!8000 a3!79)))

(assert (=> start!69920 (array_inv!8000 a2!825)))

(declare-fun b!315700 () Bool)

(declare-fun res!258808 () Bool)

(assert (=> b!315700 (=> (not res!258808) (not e!226992))))

(assert (=> b!315700 (= res!258808 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315701 () Bool)

(declare-fun res!258807 () Bool)

(assert (=> b!315701 (=> (not res!258807) (not e!226992))))

(assert (=> b!315701 (= res!258807 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315702 () Bool)

(declare-fun res!258804 () Bool)

(assert (=> b!315702 (=> (not res!258804) (not e!226992))))

(assert (=> b!315702 (= res!258804 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315703 () Bool)

(declare-fun res!258803 () Bool)

(assert (=> b!315703 (=> (not res!258803) (not e!226992))))

(assert (=> b!315703 (= res!258803 (not (= i!1020 mid!82)))))

(declare-fun b!315704 () Bool)

(declare-fun res!258802 () Bool)

(assert (=> b!315704 (=> (not res!258802) (not e!226992))))

(assert (=> b!315704 (= res!258802 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315705 () Bool)

(assert (=> b!315705 (= e!226992 (not true))))

(assert (=> b!315705 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21651 0))(
  ( (Unit!21652) )
))
(declare-fun lt!442718 () Unit!21651)

(declare-fun arrayBitRangesEqAppend!0 (array!19451 array!19451 (_ BitVec 64) (_ BitVec 64)) Unit!21651)

(assert (=> b!315705 (= lt!442718 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69920 res!258805) b!315701))

(assert (= (and b!315701 res!258807) b!315704))

(assert (= (and b!315704 res!258802) b!315699))

(assert (= (and b!315699 res!258806) b!315700))

(assert (= (and b!315700 res!258808) b!315698))

(assert (= (and b!315698 res!258809) b!315702))

(assert (= (and b!315702 res!258804) b!315703))

(assert (= (and b!315703 res!258803) b!315705))

(declare-fun m!453459 () Bool)

(assert (=> b!315704 m!453459))

(declare-fun m!453461 () Bool)

(assert (=> b!315701 m!453461))

(declare-fun m!453463 () Bool)

(assert (=> b!315698 m!453463))

(declare-fun m!453465 () Bool)

(assert (=> b!315705 m!453465))

(declare-fun m!453467 () Bool)

(assert (=> b!315705 m!453467))

(declare-fun m!453469 () Bool)

(assert (=> start!69920 m!453469))

(declare-fun m!453471 () Bool)

(assert (=> start!69920 m!453471))

(declare-fun m!453473 () Bool)

(assert (=> start!69920 m!453473))

(declare-fun m!453475 () Bool)

(assert (=> b!315702 m!453475))

(declare-fun m!453477 () Bool)

(assert (=> b!315700 m!453477))

(push 1)

(assert (not b!315704))

(assert (not b!315700))

(assert (not b!315705))

(assert (not start!69920))

(assert (not b!315702))

(assert (not b!315698))

(assert (not b!315701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


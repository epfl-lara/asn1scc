; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69908 () Bool)

(assert start!69908)

(declare-fun b!315554 () Bool)

(declare-fun res!258662 () Bool)

(declare-fun e!226921 () Bool)

(assert (=> b!315554 (=> (not res!258662) (not e!226921))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!315554 (= res!258662 (not (= i!1020 mid!82)))))

(declare-fun b!315555 () Bool)

(declare-fun res!258663 () Bool)

(assert (=> b!315555 (=> (not res!258663) (not e!226921))))

(declare-datatypes ((array!19439 0))(
  ( (array!19440 (arr!9525 (Array (_ BitVec 32) (_ BitVec 8))) (size!8442 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19439)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19439)

(declare-fun arrayBitRangesEq!0 (array!19439 array!19439 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315555 (= res!258663 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315556 () Bool)

(declare-fun res!258664 () Bool)

(assert (=> b!315556 (=> (not res!258664) (not e!226921))))

(assert (=> b!315556 (= res!258664 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315557 () Bool)

(declare-fun res!258661 () Bool)

(assert (=> b!315557 (=> (not res!258661) (not e!226921))))

(declare-fun a3!79 () array!19439)

(assert (=> b!315557 (= res!258661 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315558 () Bool)

(declare-fun res!258665 () Bool)

(assert (=> b!315558 (=> (not res!258665) (not e!226921))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315558 (= res!258665 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315559 () Bool)

(assert (=> b!315559 (= e!226921 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvslt i!1020 mid!82))))))

(assert (=> b!315559 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21639 0))(
  ( (Unit!21640) )
))
(declare-fun lt!442700 () Unit!21639)

(declare-fun arrayBitRangesEqAppend!0 (array!19439 array!19439 (_ BitVec 64) (_ BitVec 64)) Unit!21639)

(assert (=> b!315559 (= lt!442700 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315560 () Bool)

(declare-fun res!258658 () Bool)

(assert (=> b!315560 (=> (not res!258658) (not e!226921))))

(assert (=> b!315560 (= res!258658 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315561 () Bool)

(declare-fun res!258660 () Bool)

(assert (=> b!315561 (=> (not res!258660) (not e!226921))))

(assert (=> b!315561 (= res!258660 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!258659 () Bool)

(assert (=> start!69908 (=> (not res!258659) (not e!226921))))

(assert (=> start!69908 (= res!258659 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8442 a1!825) (size!8442 a2!825)) (= (size!8442 a2!825) (size!8442 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8442 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8442 a2!825))))))))

(assert (=> start!69908 e!226921))

(assert (=> start!69908 true))

(declare-fun array_inv!7994 (array!19439) Bool)

(assert (=> start!69908 (array_inv!7994 a1!825)))

(assert (=> start!69908 (array_inv!7994 a3!79)))

(assert (=> start!69908 (array_inv!7994 a2!825)))

(assert (= (and start!69908 res!258659) b!315555))

(assert (= (and b!315555 res!258663) b!315561))

(assert (= (and b!315561 res!258660) b!315556))

(assert (= (and b!315556 res!258664) b!315560))

(assert (= (and b!315560 res!258658) b!315558))

(assert (= (and b!315558 res!258665) b!315557))

(assert (= (and b!315557 res!258661) b!315554))

(assert (= (and b!315554 res!258662) b!315559))

(declare-fun m!453339 () Bool)

(assert (=> b!315557 m!453339))

(declare-fun m!453341 () Bool)

(assert (=> b!315561 m!453341))

(declare-fun m!453343 () Bool)

(assert (=> start!69908 m!453343))

(declare-fun m!453345 () Bool)

(assert (=> start!69908 m!453345))

(declare-fun m!453347 () Bool)

(assert (=> start!69908 m!453347))

(declare-fun m!453349 () Bool)

(assert (=> b!315555 m!453349))

(declare-fun m!453351 () Bool)

(assert (=> b!315559 m!453351))

(declare-fun m!453353 () Bool)

(assert (=> b!315559 m!453353))

(declare-fun m!453355 () Bool)

(assert (=> b!315558 m!453355))

(declare-fun m!453357 () Bool)

(assert (=> b!315560 m!453357))

(push 1)

(assert (not b!315555))

(assert (not b!315560))

(assert (not b!315559))

(assert (not b!315557))

(assert (not b!315561))

(assert (not start!69908))

(assert (not b!315558))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69922 () Bool)

(assert start!69922)

(declare-fun b!315722 () Bool)

(declare-fun res!258832 () Bool)

(declare-fun e!227002 () Bool)

(assert (=> b!315722 (=> (not res!258832) (not e!227002))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19453 0))(
  ( (array!19454 (arr!9532 (Array (_ BitVec 32) (_ BitVec 8))) (size!8449 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19453)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19453)

(declare-fun arrayBitRangesEq!0 (array!19453 array!19453 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315722 (= res!258832 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315723 () Bool)

(declare-fun res!258826 () Bool)

(assert (=> b!315723 (=> (not res!258826) (not e!227002))))

(declare-fun a3!79 () array!19453)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315723 (= res!258826 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315724 () Bool)

(declare-fun res!258829 () Bool)

(assert (=> b!315724 (=> (not res!258829) (not e!227002))))

(assert (=> b!315724 (= res!258829 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315725 () Bool)

(declare-fun res!258828 () Bool)

(assert (=> b!315725 (=> (not res!258828) (not e!227002))))

(assert (=> b!315725 (= res!258828 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258833 () Bool)

(assert (=> start!69922 (=> (not res!258833) (not e!227002))))

(assert (=> start!69922 (= res!258833 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8449 a1!825) (size!8449 a2!825)) (= (size!8449 a2!825) (size!8449 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8449 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8449 a2!825))))))))

(assert (=> start!69922 e!227002))

(assert (=> start!69922 true))

(declare-fun array_inv!8001 (array!19453) Bool)

(assert (=> start!69922 (array_inv!8001 a1!825)))

(assert (=> start!69922 (array_inv!8001 a3!79)))

(assert (=> start!69922 (array_inv!8001 a2!825)))

(declare-fun b!315726 () Bool)

(declare-fun res!258830 () Bool)

(assert (=> b!315726 (=> (not res!258830) (not e!227002))))

(assert (=> b!315726 (= res!258830 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315727 () Bool)

(declare-fun res!258831 () Bool)

(assert (=> b!315727 (=> (not res!258831) (not e!227002))))

(assert (=> b!315727 (= res!258831 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315728 () Bool)

(assert (=> b!315728 (= e!227002 (not true))))

(assert (=> b!315728 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21653 0))(
  ( (Unit!21654) )
))
(declare-fun lt!442721 () Unit!21653)

(declare-fun arrayBitRangesEqAppend!0 (array!19453 array!19453 (_ BitVec 64) (_ BitVec 64)) Unit!21653)

(assert (=> b!315728 (= lt!442721 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315729 () Bool)

(declare-fun res!258827 () Bool)

(assert (=> b!315729 (=> (not res!258827) (not e!227002))))

(assert (=> b!315729 (= res!258827 (not (= i!1020 mid!82)))))

(assert (= (and start!69922 res!258833) b!315726))

(assert (= (and b!315726 res!258830) b!315723))

(assert (= (and b!315723 res!258826) b!315725))

(assert (= (and b!315725 res!258828) b!315722))

(assert (= (and b!315722 res!258832) b!315727))

(assert (= (and b!315727 res!258831) b!315724))

(assert (= (and b!315724 res!258829) b!315729))

(assert (= (and b!315729 res!258827) b!315728))

(declare-fun m!453479 () Bool)

(assert (=> b!315727 m!453479))

(declare-fun m!453481 () Bool)

(assert (=> b!315726 m!453481))

(declare-fun m!453483 () Bool)

(assert (=> start!69922 m!453483))

(declare-fun m!453485 () Bool)

(assert (=> start!69922 m!453485))

(declare-fun m!453487 () Bool)

(assert (=> start!69922 m!453487))

(declare-fun m!453489 () Bool)

(assert (=> b!315724 m!453489))

(declare-fun m!453491 () Bool)

(assert (=> b!315723 m!453491))

(declare-fun m!453493 () Bool)

(assert (=> b!315722 m!453493))

(declare-fun m!453495 () Bool)

(assert (=> b!315728 m!453495))

(declare-fun m!453497 () Bool)

(assert (=> b!315728 m!453497))

(push 1)

(assert (not b!315724))

(assert (not b!315723))

(assert (not b!315722))

(assert (not start!69922))

(assert (not b!315728))

(assert (not b!315726))

(assert (not b!315727))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69976 () Bool)

(assert start!69976)

(declare-fun b!316370 () Bool)

(declare-fun res!259481 () Bool)

(declare-fun e!227326 () Bool)

(assert (=> b!316370 (=> (not res!259481) (not e!227326))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316370 (= res!259481 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316371 () Bool)

(declare-fun res!259477 () Bool)

(assert (=> b!316371 (=> (not res!259477) (not e!227326))))

(declare-datatypes ((array!19507 0))(
  ( (array!19508 (arr!9559 (Array (_ BitVec 32) (_ BitVec 8))) (size!8476 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19507)

(declare-fun a2!825 () array!19507)

(declare-fun arrayBitRangesEq!0 (array!19507 array!19507 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316371 (= res!259477 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316372 () Bool)

(declare-fun res!259478 () Bool)

(assert (=> b!316372 (=> (not res!259478) (not e!227326))))

(declare-fun a3!79 () array!19507)

(assert (=> b!316372 (= res!259478 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!259476 () Bool)

(assert (=> start!69976 (=> (not res!259476) (not e!227326))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69976 (= res!259476 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8476 a1!825) (size!8476 a2!825)) (= (size!8476 a2!825) (size!8476 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8476 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8476 a2!825))))))))

(assert (=> start!69976 e!227326))

(assert (=> start!69976 true))

(declare-fun array_inv!8028 (array!19507) Bool)

(assert (=> start!69976 (array_inv!8028 a1!825)))

(assert (=> start!69976 (array_inv!8028 a3!79)))

(assert (=> start!69976 (array_inv!8028 a2!825)))

(declare-fun b!316373 () Bool)

(declare-fun res!259480 () Bool)

(assert (=> b!316373 (=> (not res!259480) (not e!227326))))

(assert (=> b!316373 (= res!259480 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316374 () Bool)

(declare-fun res!259474 () Bool)

(assert (=> b!316374 (=> (not res!259474) (not e!227326))))

(assert (=> b!316374 (= res!259474 (not (= i!1020 mid!82)))))

(declare-fun b!316375 () Bool)

(declare-fun res!259475 () Bool)

(assert (=> b!316375 (=> (not res!259475) (not e!227326))))

(assert (=> b!316375 (= res!259475 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316376 () Bool)

(declare-fun res!259479 () Bool)

(assert (=> b!316376 (=> (not res!259479) (not e!227326))))

(assert (=> b!316376 (= res!259479 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316377 () Bool)

(assert (=> b!316377 (= e!227326 (not true))))

(assert (=> b!316377 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21707 0))(
  ( (Unit!21708) )
))
(declare-fun lt!442915 () Unit!21707)

(declare-fun arrayBitRangesEqDrop1!0 (array!19507 array!19507 (_ BitVec 64) (_ BitVec 64)) Unit!21707)

(assert (=> b!316377 (= lt!442915 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316377 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442916 () Unit!21707)

(assert (=> b!316377 (= lt!442916 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316377 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442914 () Unit!21707)

(declare-fun arrayBitRangesEqAppend!0 (array!19507 array!19507 (_ BitVec 64) (_ BitVec 64)) Unit!21707)

(assert (=> b!316377 (= lt!442914 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69976 res!259476) b!316371))

(assert (= (and b!316371 res!259477) b!316375))

(assert (= (and b!316375 res!259475) b!316370))

(assert (= (and b!316370 res!259481) b!316376))

(assert (= (and b!316376 res!259479) b!316373))

(assert (= (and b!316373 res!259480) b!316372))

(assert (= (and b!316372 res!259478) b!316374))

(assert (= (and b!316374 res!259474) b!316377))

(declare-fun m!454163 () Bool)

(assert (=> b!316372 m!454163))

(declare-fun m!454165 () Bool)

(assert (=> b!316371 m!454165))

(declare-fun m!454167 () Bool)

(assert (=> b!316377 m!454167))

(declare-fun m!454169 () Bool)

(assert (=> b!316377 m!454169))

(declare-fun m!454171 () Bool)

(assert (=> b!316377 m!454171))

(declare-fun m!454173 () Bool)

(assert (=> b!316377 m!454173))

(declare-fun m!454175 () Bool)

(assert (=> b!316377 m!454175))

(declare-fun m!454177 () Bool)

(assert (=> b!316377 m!454177))

(declare-fun m!454179 () Bool)

(assert (=> start!69976 m!454179))

(declare-fun m!454181 () Bool)

(assert (=> start!69976 m!454181))

(declare-fun m!454183 () Bool)

(assert (=> start!69976 m!454183))

(declare-fun m!454185 () Bool)

(assert (=> b!316373 m!454185))

(declare-fun m!454187 () Bool)

(assert (=> b!316376 m!454187))

(declare-fun m!454189 () Bool)

(assert (=> b!316375 m!454189))

(push 1)

(assert (not b!316375))

(assert (not b!316377))

(assert (not b!316371))

(assert (not b!316373))

(assert (not start!69976))

(assert (not b!316376))

(assert (not b!316372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


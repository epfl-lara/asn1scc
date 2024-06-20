; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69848 () Bool)

(assert start!69848)

(declare-fun b!315095 () Bool)

(declare-fun res!258244 () Bool)

(declare-fun e!226609 () Bool)

(assert (=> b!315095 (=> (not res!258244) (not e!226609))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19412 0))(
  ( (array!19413 (arr!9510 (Array (_ BitVec 32) (_ BitVec 8))) (size!8430 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19412)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19412)

(declare-fun arrayBitRangesEq!0 (array!19412 array!19412 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315095 (= res!258244 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315096 () Bool)

(declare-fun res!258248 () Bool)

(assert (=> b!315096 (=> (not res!258248) (not e!226609))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315096 (= res!258248 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!258245 () Bool)

(assert (=> start!69848 (=> (not res!258245) (not e!226609))))

(declare-fun a3!79 () array!19412)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69848 (= res!258245 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8430 a1!825) (size!8430 a2!825)) (= (size!8430 a2!825) (size!8430 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8430 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8430 a2!825))))))))

(assert (=> start!69848 e!226609))

(assert (=> start!69848 true))

(declare-fun array_inv!7982 (array!19412) Bool)

(assert (=> start!69848 (array_inv!7982 a1!825)))

(assert (=> start!69848 (array_inv!7982 a3!79)))

(assert (=> start!69848 (array_inv!7982 a2!825)))

(declare-fun b!315097 () Bool)

(declare-fun res!258241 () Bool)

(assert (=> b!315097 (=> (not res!258241) (not e!226609))))

(assert (=> b!315097 (= res!258241 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315098 () Bool)

(declare-fun res!258247 () Bool)

(assert (=> b!315098 (=> (not res!258247) (not e!226609))))

(assert (=> b!315098 (= res!258247 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315099 () Bool)

(assert (=> b!315099 (= e!226609 (not (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))))

(declare-fun b!315100 () Bool)

(declare-fun res!258243 () Bool)

(assert (=> b!315100 (=> (not res!258243) (not e!226609))))

(assert (=> b!315100 (= res!258243 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315101 () Bool)

(declare-fun res!258242 () Bool)

(assert (=> b!315101 (=> (not res!258242) (not e!226609))))

(assert (=> b!315101 (= res!258242 (= i!1020 mid!82))))

(declare-fun b!315102 () Bool)

(declare-fun res!258246 () Bool)

(assert (=> b!315102 (=> (not res!258246) (not e!226609))))

(assert (=> b!315102 (= res!258246 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69848 res!258245) b!315095))

(assert (= (and b!315095 res!258244) b!315100))

(assert (= (and b!315100 res!258243) b!315098))

(assert (= (and b!315098 res!258247) b!315096))

(assert (= (and b!315096 res!258248) b!315097))

(assert (= (and b!315097 res!258241) b!315102))

(assert (= (and b!315102 res!258246) b!315101))

(assert (= (and b!315101 res!258242) b!315099))

(declare-fun m!452681 () Bool)

(assert (=> b!315095 m!452681))

(declare-fun m!452683 () Bool)

(assert (=> b!315099 m!452683))

(declare-fun m!452685 () Bool)

(assert (=> start!69848 m!452685))

(declare-fun m!452687 () Bool)

(assert (=> start!69848 m!452687))

(declare-fun m!452689 () Bool)

(assert (=> start!69848 m!452689))

(declare-fun m!452691 () Bool)

(assert (=> b!315096 m!452691))

(declare-fun m!452693 () Bool)

(assert (=> b!315097 m!452693))

(declare-fun m!452695 () Bool)

(assert (=> b!315100 m!452695))

(declare-fun m!452697 () Bool)

(assert (=> b!315102 m!452697))

(push 1)

(assert (not b!315102))

(assert (not start!69848))

(assert (not b!315095))

(assert (not b!315099))

(assert (not b!315100))

(assert (not b!315096))


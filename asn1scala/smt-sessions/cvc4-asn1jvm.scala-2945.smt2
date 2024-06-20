; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69836 () Bool)

(assert start!69836)

(declare-fun b!314961 () Bool)

(declare-fun res!258109 () Bool)

(declare-fun e!226534 () Bool)

(assert (=> b!314961 (=> (not res!258109) (not e!226534))))

(declare-datatypes ((array!19400 0))(
  ( (array!19401 (arr!9504 (Array (_ BitVec 32) (_ BitVec 8))) (size!8424 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19400)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19400)

(declare-fun arrayBitRangesEq!0 (array!19400 array!19400 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314961 (= res!258109 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!258112 () Bool)

(assert (=> start!69836 (=> (not res!258112) (not e!226534))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19400)

(assert (=> start!69836 (= res!258112 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8424 a1!825) (size!8424 a2!825)) (= (size!8424 a2!825) (size!8424 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8424 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8424 a2!825))))))))

(assert (=> start!69836 e!226534))

(assert (=> start!69836 true))

(declare-fun array_inv!7976 (array!19400) Bool)

(assert (=> start!69836 (array_inv!7976 a1!825)))

(assert (=> start!69836 (array_inv!7976 a3!79)))

(assert (=> start!69836 (array_inv!7976 a2!825)))

(declare-fun b!314962 () Bool)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!314962 (= e!226534 (and (not (= (bvand to!845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!845 i!1020) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!314963 () Bool)

(declare-fun res!258113 () Bool)

(assert (=> b!314963 (=> (not res!258113) (not e!226534))))

(assert (=> b!314963 (= res!258113 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314964 () Bool)

(declare-fun res!258111 () Bool)

(assert (=> b!314964 (=> (not res!258111) (not e!226534))))

(assert (=> b!314964 (= res!258111 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314965 () Bool)

(declare-fun res!258110 () Bool)

(assert (=> b!314965 (=> (not res!258110) (not e!226534))))

(assert (=> b!314965 (= res!258110 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314966 () Bool)

(declare-fun res!258107 () Bool)

(assert (=> b!314966 (=> (not res!258107) (not e!226534))))

(assert (=> b!314966 (= res!258107 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314967 () Bool)

(declare-fun res!258108 () Bool)

(assert (=> b!314967 (=> (not res!258108) (not e!226534))))

(assert (=> b!314967 (= res!258108 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69836 res!258112) b!314963))

(assert (= (and b!314963 res!258113) b!314961))

(assert (= (and b!314961 res!258109) b!314964))

(assert (= (and b!314964 res!258111) b!314966))

(assert (= (and b!314966 res!258107) b!314967))

(assert (= (and b!314967 res!258108) b!314965))

(assert (= (and b!314965 res!258110) b!314962))

(declare-fun m!452581 () Bool)

(assert (=> b!314965 m!452581))

(declare-fun m!452583 () Bool)

(assert (=> b!314963 m!452583))

(declare-fun m!452585 () Bool)

(assert (=> start!69836 m!452585))

(declare-fun m!452587 () Bool)

(assert (=> start!69836 m!452587))

(declare-fun m!452589 () Bool)

(assert (=> start!69836 m!452589))

(declare-fun m!452591 () Bool)

(assert (=> b!314967 m!452591))

(declare-fun m!452593 () Bool)

(assert (=> b!314961 m!452593))

(declare-fun m!452595 () Bool)

(assert (=> b!314966 m!452595))

(push 1)

(assert (not start!69836))

(assert (not b!314967))

(assert (not b!314961))

(assert (not b!314963))

(assert (not b!314965))

(assert (not b!314966))

(check-sat)

(pop 1)

(push 1)

(check-sat)


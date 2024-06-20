; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69832 () Bool)

(assert start!69832)

(declare-fun res!258068 () Bool)

(declare-fun e!226512 () Bool)

(assert (=> start!69832 (=> (not res!258068) (not e!226512))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19396 0))(
  ( (array!19397 (arr!9502 (Array (_ BitVec 32) (_ BitVec 8))) (size!8422 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19396)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a3!79 () array!19396)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19396)

(assert (=> start!69832 (= res!258068 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8422 a1!825) (size!8422 a2!825)) (= (size!8422 a2!825) (size!8422 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8422 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8422 a2!825))))))))

(assert (=> start!69832 e!226512))

(assert (=> start!69832 true))

(declare-fun array_inv!7974 (array!19396) Bool)

(assert (=> start!69832 (array_inv!7974 a1!825)))

(assert (=> start!69832 (array_inv!7974 a3!79)))

(assert (=> start!69832 (array_inv!7974 a2!825)))

(declare-fun b!314919 () Bool)

(declare-fun res!258066 () Bool)

(assert (=> b!314919 (=> (not res!258066) (not e!226512))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19396 array!19396 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314919 (= res!258066 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314920 () Bool)

(declare-fun res!258069 () Bool)

(assert (=> b!314920 (=> (not res!258069) (not e!226512))))

(assert (=> b!314920 (= res!258069 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314921 () Bool)

(declare-fun res!258070 () Bool)

(assert (=> b!314921 (=> (not res!258070) (not e!226512))))

(assert (=> b!314921 (= res!258070 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314922 () Bool)

(assert (=> b!314922 (= e!226512 (and (not (= (bvand to!845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!845 i!1020) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!314923 () Bool)

(declare-fun res!258071 () Bool)

(assert (=> b!314923 (=> (not res!258071) (not e!226512))))

(assert (=> b!314923 (= res!258071 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314924 () Bool)

(declare-fun res!258065 () Bool)

(assert (=> b!314924 (=> (not res!258065) (not e!226512))))

(assert (=> b!314924 (= res!258065 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314925 () Bool)

(declare-fun res!258067 () Bool)

(assert (=> b!314925 (=> (not res!258067) (not e!226512))))

(assert (=> b!314925 (= res!258067 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69832 res!258068) b!314925))

(assert (= (and b!314925 res!258067) b!314920))

(assert (= (and b!314920 res!258069) b!314924))

(assert (= (and b!314924 res!258065) b!314923))

(assert (= (and b!314923 res!258071) b!314919))

(assert (= (and b!314919 res!258066) b!314921))

(assert (= (and b!314921 res!258070) b!314922))

(declare-fun m!452549 () Bool)

(assert (=> b!314919 m!452549))

(declare-fun m!452551 () Bool)

(assert (=> b!314921 m!452551))

(declare-fun m!452553 () Bool)

(assert (=> b!314925 m!452553))

(declare-fun m!452555 () Bool)

(assert (=> b!314920 m!452555))

(declare-fun m!452557 () Bool)

(assert (=> b!314923 m!452557))

(declare-fun m!452559 () Bool)

(assert (=> start!69832 m!452559))

(declare-fun m!452561 () Bool)

(assert (=> start!69832 m!452561))

(declare-fun m!452563 () Bool)

(assert (=> start!69832 m!452563))

(push 1)

(assert (not b!314925))

(assert (not b!314919))

(assert (not b!314920))

(assert (not b!314923))

(assert (not start!69832))

(assert (not b!314921))

(check-sat)

(pop 1)

(push 1)

(check-sat)


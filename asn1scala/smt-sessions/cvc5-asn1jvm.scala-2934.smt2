; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69766 () Bool)

(assert start!69766)

(declare-fun b!314111 () Bool)

(declare-fun res!257257 () Bool)

(declare-fun e!226098 () Bool)

(assert (=> b!314111 (=> (not res!257257) (not e!226098))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19330 0))(
  ( (array!19331 (arr!9469 (Array (_ BitVec 32) (_ BitVec 8))) (size!8389 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19330)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19330)

(declare-fun arrayBitRangesEq!0 (array!19330 array!19330 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314111 (= res!257257 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314112 () Bool)

(declare-fun res!257260 () Bool)

(assert (=> b!314112 (=> (not res!257260) (not e!226098))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!314112 (= res!257260 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!257259 () Bool)

(assert (=> start!69766 (=> (not res!257259) (not e!226098))))

(declare-fun a3!79 () array!19330)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69766 (= res!257259 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8389 a1!825) (size!8389 a2!825)) (= (size!8389 a2!825) (size!8389 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8389 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8389 a2!825))))))))

(assert (=> start!69766 e!226098))

(assert (=> start!69766 true))

(declare-fun array_inv!7941 (array!19330) Bool)

(assert (=> start!69766 (array_inv!7941 a1!825)))

(assert (=> start!69766 (array_inv!7941 a3!79)))

(assert (=> start!69766 (array_inv!7941 a2!825)))

(declare-fun b!314113 () Bool)

(declare-fun res!257262 () Bool)

(assert (=> b!314113 (=> (not res!257262) (not e!226098))))

(assert (=> b!314113 (= res!257262 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314114 () Bool)

(declare-fun res!257261 () Bool)

(assert (=> b!314114 (=> (not res!257261) (not e!226098))))

(assert (=> b!314114 (= res!257261 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314115 () Bool)

(declare-fun res!257264 () Bool)

(assert (=> b!314115 (=> (not res!257264) (not e!226098))))

(assert (=> b!314115 (= res!257264 (not (= i!1020 mid!82)))))

(declare-fun b!314116 () Bool)

(assert (=> b!314116 (= e!226098 (not true))))

(assert (=> b!314116 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21569 0))(
  ( (Unit!21570) )
))
(declare-fun lt!442370 () Unit!21569)

(declare-fun arrayBitRangesEqAppend!0 (array!19330 array!19330 (_ BitVec 64) (_ BitVec 64)) Unit!21569)

(assert (=> b!314116 (= lt!442370 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314117 () Bool)

(declare-fun res!257258 () Bool)

(assert (=> b!314117 (=> (not res!257258) (not e!226098))))

(assert (=> b!314117 (= res!257258 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314118 () Bool)

(declare-fun res!257263 () Bool)

(assert (=> b!314118 (=> (not res!257263) (not e!226098))))

(assert (=> b!314118 (= res!257263 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69766 res!257259) b!314111))

(assert (= (and b!314111 res!257257) b!314118))

(assert (= (and b!314118 res!257263) b!314112))

(assert (= (and b!314112 res!257260) b!314114))

(assert (= (and b!314114 res!257261) b!314113))

(assert (= (and b!314113 res!257262) b!314117))

(assert (= (and b!314117 res!257258) b!314115))

(assert (= (and b!314115 res!257264) b!314116))

(declare-fun m!451673 () Bool)

(assert (=> b!314113 m!451673))

(declare-fun m!451675 () Bool)

(assert (=> b!314111 m!451675))

(declare-fun m!451677 () Bool)

(assert (=> b!314114 m!451677))

(declare-fun m!451679 () Bool)

(assert (=> b!314116 m!451679))

(declare-fun m!451681 () Bool)

(assert (=> b!314116 m!451681))

(declare-fun m!451683 () Bool)

(assert (=> b!314118 m!451683))

(declare-fun m!451685 () Bool)

(assert (=> start!69766 m!451685))

(declare-fun m!451687 () Bool)

(assert (=> start!69766 m!451687))

(declare-fun m!451689 () Bool)

(assert (=> start!69766 m!451689))

(declare-fun m!451691 () Bool)

(assert (=> b!314117 m!451691))

(push 1)

(assert (not start!69766))

(assert (not b!314111))

(assert (not b!314116))

(assert (not b!314113))

(assert (not b!314118))

(assert (not b!314114))

(assert (not b!314117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


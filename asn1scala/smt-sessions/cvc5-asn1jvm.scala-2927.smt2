; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69724 () Bool)

(assert start!69724)

(declare-fun b!313673 () Bool)

(declare-fun res!256819 () Bool)

(declare-fun e!225847 () Bool)

(assert (=> b!313673 (=> (not res!256819) (not e!225847))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!313673 (= res!256819 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313674 () Bool)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!313674 (= e!225847 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvsgt i!1020 to!845)))))

(declare-fun res!256822 () Bool)

(assert (=> start!69724 (=> (not res!256822) (not e!225847))))

(declare-datatypes ((array!19288 0))(
  ( (array!19289 (arr!9448 (Array (_ BitVec 32) (_ BitVec 8))) (size!8368 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19288)

(declare-fun a3!79 () array!19288)

(declare-fun a2!825 () array!19288)

(assert (=> start!69724 (= res!256822 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8368 a1!825) (size!8368 a2!825)) (= (size!8368 a2!825) (size!8368 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8368 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8368 a2!825))))))))

(assert (=> start!69724 e!225847))

(assert (=> start!69724 true))

(declare-fun array_inv!7920 (array!19288) Bool)

(assert (=> start!69724 (array_inv!7920 a1!825)))

(assert (=> start!69724 (array_inv!7920 a3!79)))

(assert (=> start!69724 (array_inv!7920 a2!825)))

(declare-fun b!313675 () Bool)

(declare-fun res!256821 () Bool)

(assert (=> b!313675 (=> (not res!256821) (not e!225847))))

(declare-fun arrayBitRangesEq!0 (array!19288 array!19288 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313675 (= res!256821 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313676 () Bool)

(declare-fun res!256820 () Bool)

(assert (=> b!313676 (=> (not res!256820) (not e!225847))))

(assert (=> b!313676 (= res!256820 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313677 () Bool)

(declare-fun res!256823 () Bool)

(assert (=> b!313677 (=> (not res!256823) (not e!225847))))

(assert (=> b!313677 (= res!256823 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69724 res!256822) b!313676))

(assert (= (and b!313676 res!256820) b!313677))

(assert (= (and b!313677 res!256823) b!313673))

(assert (= (and b!313673 res!256819) b!313675))

(assert (= (and b!313675 res!256821) b!313674))

(declare-fun m!451325 () Bool)

(assert (=> start!69724 m!451325))

(declare-fun m!451327 () Bool)

(assert (=> start!69724 m!451327))

(declare-fun m!451329 () Bool)

(assert (=> start!69724 m!451329))

(declare-fun m!451331 () Bool)

(assert (=> b!313675 m!451331))

(declare-fun m!451333 () Bool)

(assert (=> b!313676 m!451333))

(declare-fun m!451335 () Bool)

(assert (=> b!313677 m!451335))

(push 1)

(assert (not b!313677))

(assert (not start!69724))

(assert (not b!313676))

(assert (not b!313675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


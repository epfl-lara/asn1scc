; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69728 () Bool)

(assert start!69728)

(declare-fun b!313703 () Bool)

(declare-fun res!256851 () Bool)

(declare-fun e!225869 () Bool)

(assert (=> b!313703 (=> (not res!256851) (not e!225869))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19292 0))(
  ( (array!19293 (arr!9450 (Array (_ BitVec 32) (_ BitVec 8))) (size!8370 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19292)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19292)

(declare-fun arrayBitRangesEq!0 (array!19292 array!19292 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313703 (= res!256851 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!256849 () Bool)

(assert (=> start!69728 (=> (not res!256849) (not e!225869))))

(declare-fun a3!79 () array!19292)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69728 (= res!256849 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8370 a1!825) (size!8370 a2!825)) (= (size!8370 a2!825) (size!8370 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8370 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8370 a2!825))))))))

(assert (=> start!69728 e!225869))

(assert (=> start!69728 true))

(declare-fun array_inv!7922 (array!19292) Bool)

(assert (=> start!69728 (array_inv!7922 a1!825)))

(assert (=> start!69728 (array_inv!7922 a3!79)))

(assert (=> start!69728 (array_inv!7922 a2!825)))

(declare-fun b!313704 () Bool)

(declare-fun res!256852 () Bool)

(assert (=> b!313704 (=> (not res!256852) (not e!225869))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!313704 (= res!256852 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313705 () Bool)

(declare-fun res!256853 () Bool)

(assert (=> b!313705 (=> (not res!256853) (not e!225869))))

(assert (=> b!313705 (= res!256853 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313706 () Bool)

(declare-fun res!256850 () Bool)

(assert (=> b!313706 (=> (not res!256850) (not e!225869))))

(assert (=> b!313706 (= res!256850 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313707 () Bool)

(assert (=> b!313707 (= e!225869 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvsgt i!1020 to!845)))))

(assert (= (and start!69728 res!256849) b!313703))

(assert (= (and b!313703 res!256851) b!313705))

(assert (= (and b!313705 res!256853) b!313706))

(assert (= (and b!313706 res!256850) b!313704))

(assert (= (and b!313704 res!256852) b!313707))

(declare-fun m!451349 () Bool)

(assert (=> b!313703 m!451349))

(declare-fun m!451351 () Bool)

(assert (=> start!69728 m!451351))

(declare-fun m!451353 () Bool)

(assert (=> start!69728 m!451353))

(declare-fun m!451355 () Bool)

(assert (=> start!69728 m!451355))

(declare-fun m!451357 () Bool)

(assert (=> b!313704 m!451357))

(declare-fun m!451359 () Bool)

(assert (=> b!313705 m!451359))

(push 1)

(assert (not b!313704))

(assert (not start!69728))

(assert (not b!313703))

(assert (not b!313705))

(check-sat)

(pop 1)

(push 1)

(check-sat)


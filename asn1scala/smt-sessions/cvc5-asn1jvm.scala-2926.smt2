; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69718 () Bool)

(assert start!69718)

(declare-fun res!256788 () Bool)

(declare-fun e!225811 () Bool)

(assert (=> start!69718 (=> (not res!256788) (not e!225811))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19282 0))(
  ( (array!19283 (arr!9445 (Array (_ BitVec 32) (_ BitVec 8))) (size!8365 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19282)

(declare-fun a3!79 () array!19282)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19282)

(assert (=> start!69718 (= res!256788 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8365 a1!825) (size!8365 a2!825)) (= (size!8365 a2!825) (size!8365 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8365 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8365 a2!825))))))))

(assert (=> start!69718 e!225811))

(assert (=> start!69718 true))

(declare-fun array_inv!7917 (array!19282) Bool)

(assert (=> start!69718 (array_inv!7917 a1!825)))

(assert (=> start!69718 (array_inv!7917 a3!79)))

(assert (=> start!69718 (array_inv!7917 a2!825)))

(declare-fun b!313642 () Bool)

(declare-fun res!256789 () Bool)

(assert (=> b!313642 (=> (not res!256789) (not e!225811))))

(declare-fun arrayBitRangesEq!0 (array!19282 array!19282 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313642 (= res!256789 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313643 () Bool)

(declare-fun res!256790 () Bool)

(assert (=> b!313643 (=> (not res!256790) (not e!225811))))

(assert (=> b!313643 (= res!256790 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun b!313644 () Bool)

(assert (=> b!313644 (= e!225811 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1020)))))

(assert (= (and start!69718 res!256788) b!313642))

(assert (= (and b!313642 res!256789) b!313643))

(assert (= (and b!313643 res!256790) b!313644))

(declare-fun m!451295 () Bool)

(assert (=> start!69718 m!451295))

(declare-fun m!451297 () Bool)

(assert (=> start!69718 m!451297))

(declare-fun m!451299 () Bool)

(assert (=> start!69718 m!451299))

(declare-fun m!451301 () Bool)

(assert (=> b!313642 m!451301))

(declare-fun m!451303 () Bool)

(assert (=> b!313643 m!451303))

(push 1)

(assert (not b!313643))

(assert (not b!313642))

(assert (not start!69718))

(check-sat)

(pop 1)

(push 1)

(check-sat)


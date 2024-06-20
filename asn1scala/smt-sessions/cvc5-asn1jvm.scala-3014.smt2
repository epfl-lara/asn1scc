; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70354 () Bool)

(assert start!70354)

(declare-fun res!261782 () Bool)

(declare-fun e!228948 () Bool)

(assert (=> start!70354 (=> (not res!261782) (not e!228948))))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19819 0))(
  ( (array!19820 (arr!9718 (Array (_ BitVec 32) (_ BitVec 8))) (size!8629 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19819)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19819)

(assert (=> start!70354 (= res!261782 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8629 a1!898) (size!8629 a2!898))))))

(assert (=> start!70354 e!228948))

(assert (=> start!70354 true))

(declare-fun array_inv!8181 (array!19819) Bool)

(assert (=> start!70354 (array_inv!8181 a1!898)))

(assert (=> start!70354 (array_inv!8181 a2!898)))

(declare-fun b!318726 () Bool)

(declare-fun e!228949 () Bool)

(assert (=> b!318726 (= e!228948 e!228949)))

(declare-fun res!261783 () Bool)

(assert (=> b!318726 (=> (not res!261783) (not e!228949))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun lt!443434 () (_ BitVec 64))

(assert (=> b!318726 (= res!261783 (and (bvsle to!864 lt!443434) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> b!318726 (= lt!443434 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8629 a1!898))))))

(declare-fun b!318727 () Bool)

(declare-fun res!261784 () Bool)

(assert (=> b!318727 (=> (not res!261784) (not e!228949))))

(declare-fun arrayBitRangesEq!0 (array!19819 array!19819 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318727 (= res!261784 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318728 () Bool)

(assert (=> b!318728 (= e!228949 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!296) (bvslt at!296 lt!443434))))))

(declare-fun bitAt!0 (array!19819 (_ BitVec 64)) Bool)

(assert (=> b!318728 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21875 0))(
  ( (Unit!21876) )
))
(declare-fun lt!443435 () Unit!21875)

(declare-fun rec!22 (array!19819 array!19819 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21875)

(assert (=> b!318728 (= lt!443435 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70354 res!261782) b!318726))

(assert (= (and b!318726 res!261783) b!318727))

(assert (= (and b!318727 res!261784) b!318728))

(declare-fun m!456935 () Bool)

(assert (=> start!70354 m!456935))

(declare-fun m!456937 () Bool)

(assert (=> start!70354 m!456937))

(declare-fun m!456939 () Bool)

(assert (=> b!318727 m!456939))

(declare-fun m!456941 () Bool)

(assert (=> b!318728 m!456941))

(declare-fun m!456943 () Bool)

(assert (=> b!318728 m!456943))

(declare-fun m!456945 () Bool)

(assert (=> b!318728 m!456945))

(push 1)

(assert (not b!318728))

(assert (not b!318727))

(assert (not start!70354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


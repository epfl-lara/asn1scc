; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4588 () Bool)

(assert start!4588)

(declare-datatypes ((array!1238 0))(
  ( (array!1239 (arr!961 (Array (_ BitVec 32) (_ BitVec 8))) (size!520 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1238)

(declare-fun a1!923 () array!1238)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4588 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!520 a1!923) (size!520 a2!923)) (not (= ((_ sign_extend 32) (size!520 a1!923)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!520 a1!923))) ((_ sign_extend 32) (size!520 a1!923))))))))

(assert (=> start!4588 true))

(declare-fun array_inv!490 (array!1238) Bool)

(assert (=> start!4588 (array_inv!490 a1!923)))

(assert (=> start!4588 (array_inv!490 a2!923)))

(declare-fun bs!1734 () Bool)

(assert (= bs!1734 start!4588))

(declare-fun m!24985 () Bool)

(assert (=> bs!1734 m!24985))

(declare-fun m!24987 () Bool)

(assert (=> bs!1734 m!24987))

(push 1)

(assert (not start!4588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


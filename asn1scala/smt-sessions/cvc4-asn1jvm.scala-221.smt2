; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4592 () Bool)

(assert start!4592)

(declare-datatypes ((array!1242 0))(
  ( (array!1243 (arr!963 (Array (_ BitVec 32) (_ BitVec 8))) (size!522 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1242)

(declare-fun a1!923 () array!1242)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4592 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!522 a1!923) (size!522 a2!923)) (not (= ((_ sign_extend 32) (size!522 a1!923)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!522 a1!923))) ((_ sign_extend 32) (size!522 a1!923))))))))

(assert (=> start!4592 true))

(declare-fun array_inv!492 (array!1242) Bool)

(assert (=> start!4592 (array_inv!492 a1!923)))

(assert (=> start!4592 (array_inv!492 a2!923)))

(declare-fun bs!1736 () Bool)

(assert (= bs!1736 start!4592))

(declare-fun m!24993 () Bool)

(assert (=> bs!1736 m!24993))

(declare-fun m!24995 () Bool)

(assert (=> bs!1736 m!24995))

(push 1)

(assert (not start!4592))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4598 () Bool)

(assert start!4598)

(declare-datatypes ((array!1248 0))(
  ( (array!1249 (arr!966 (Array (_ BitVec 32) (_ BitVec 8))) (size!525 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1248)

(declare-fun a1!923 () array!1248)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4598 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!525 a1!923) (size!525 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!525 a1!923)))) (= (bvand from!908 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!4598 true))

(declare-fun array_inv!495 (array!1248) Bool)

(assert (=> start!4598 (array_inv!495 a1!923)))

(assert (=> start!4598 (array_inv!495 a2!923)))

(declare-fun bs!1742 () Bool)

(assert (= bs!1742 start!4598))

(declare-fun m!25005 () Bool)

(assert (=> bs!1742 m!25005))

(declare-fun m!25007 () Bool)

(assert (=> bs!1742 m!25007))

(push 1)

(assert (not start!4598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4594 () Bool)

(assert start!4594)

(declare-datatypes ((array!1244 0))(
  ( (array!1245 (arr!964 (Array (_ BitVec 32) (_ BitVec 8))) (size!523 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1244)

(declare-fun a1!923 () array!1244)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!523 a1!923) (size!523 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!523 a1!923)))) (= (bvand from!908 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!4594 true))

(declare-fun array_inv!493 (array!1244) Bool)

(assert (=> start!4594 (array_inv!493 a1!923)))

(assert (=> start!4594 (array_inv!493 a2!923)))

(declare-fun bs!1740 () Bool)

(assert (= bs!1740 start!4594))

(declare-fun m!24997 () Bool)

(assert (=> bs!1740 m!24997))

(declare-fun m!24999 () Bool)

(assert (=> bs!1740 m!24999))

(push 1)

(assert (not start!4594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


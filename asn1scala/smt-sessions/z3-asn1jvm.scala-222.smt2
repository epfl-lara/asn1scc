; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4596 () Bool)

(assert start!4596)

(declare-datatypes ((array!1246 0))(
  ( (array!1247 (arr!965 (Array (_ BitVec 32) (_ BitVec 8))) (size!524 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1246)

(declare-fun a1!923 () array!1246)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4596 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!524 a1!923) (size!524 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!524 a1!923)))) (= (bvand from!908 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!4596 true))

(declare-fun array_inv!494 (array!1246) Bool)

(assert (=> start!4596 (array_inv!494 a1!923)))

(assert (=> start!4596 (array_inv!494 a2!923)))

(declare-fun bs!1741 () Bool)

(assert (= bs!1741 start!4596))

(declare-fun m!25001 () Bool)

(assert (=> bs!1741 m!25001))

(declare-fun m!25003 () Bool)

(assert (=> bs!1741 m!25003))

(check-sat (not start!4596))
(check-sat)

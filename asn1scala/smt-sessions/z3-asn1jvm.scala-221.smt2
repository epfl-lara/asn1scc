; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4590 () Bool)

(assert start!4590)

(declare-datatypes ((array!1240 0))(
  ( (array!1241 (arr!962 (Array (_ BitVec 32) (_ BitVec 8))) (size!521 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1240)

(declare-fun a1!923 () array!1240)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4590 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!521 a1!923) (size!521 a2!923)) (not (= ((_ sign_extend 32) (size!521 a1!923)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!521 a1!923))) ((_ sign_extend 32) (size!521 a1!923))))))))

(assert (=> start!4590 true))

(declare-fun array_inv!491 (array!1240) Bool)

(assert (=> start!4590 (array_inv!491 a1!923)))

(assert (=> start!4590 (array_inv!491 a2!923)))

(declare-fun bs!1735 () Bool)

(assert (= bs!1735 start!4590))

(declare-fun m!24989 () Bool)

(assert (=> bs!1735 m!24989))

(declare-fun m!24991 () Bool)

(assert (=> bs!1735 m!24991))

(check-sat (not start!4590))
(check-sat)

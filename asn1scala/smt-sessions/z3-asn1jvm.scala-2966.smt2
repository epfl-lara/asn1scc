; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69996 () Bool)

(assert start!69996)

(declare-datatypes ((array!19527 0))(
  ( (array!19528 (arr!9569 (Array (_ BitVec 32) (_ BitVec 8))) (size!8486 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19527)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19527)

(assert (=> start!69996 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8486 a1!731) (size!8486 a2!731)) (let ((bdg!18722 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8486 a1!731))))) (and (bvslt to!815 bdg!18722) (bvsgt to!815 bdg!18722))))))

(assert (=> start!69996 true))

(declare-fun array_inv!8038 (array!19527) Bool)

(assert (=> start!69996 (array_inv!8038 a1!731)))

(assert (=> start!69996 (array_inv!8038 a2!731)))

(declare-fun bs!27099 () Bool)

(assert (= bs!27099 start!69996))

(declare-fun m!454431 () Bool)

(assert (=> bs!27099 m!454431))

(declare-fun m!454433 () Bool)

(assert (=> bs!27099 m!454433))

(check-sat (not start!69996))
(check-sat)

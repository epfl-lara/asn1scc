; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69998 () Bool)

(assert start!69998)

(declare-datatypes ((array!19529 0))(
  ( (array!19530 (arr!9570 (Array (_ BitVec 32) (_ BitVec 8))) (size!8487 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19529)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19529)

(assert (=> start!69998 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8487 a1!731) (size!8487 a2!731)) (let ((bdg!18722 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8487 a1!731))))) (and (bvslt to!815 bdg!18722) (bvsgt to!815 bdg!18722))))))

(assert (=> start!69998 true))

(declare-fun array_inv!8039 (array!19529) Bool)

(assert (=> start!69998 (array_inv!8039 a1!731)))

(assert (=> start!69998 (array_inv!8039 a2!731)))

(declare-fun bs!27100 () Bool)

(assert (= bs!27100 start!69998))

(declare-fun m!454435 () Bool)

(assert (=> bs!27100 m!454435))

(declare-fun m!454437 () Bool)

(assert (=> bs!27100 m!454437))

(push 1)

(assert (not start!69998))

(check-sat)

(pop 1)

(push 1)

(check-sat)


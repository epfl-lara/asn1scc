; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69994 () Bool)

(assert start!69994)

(declare-datatypes ((array!19525 0))(
  ( (array!19526 (arr!9568 (Array (_ BitVec 32) (_ BitVec 8))) (size!8485 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19525)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19525)

(assert (=> start!69994 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8485 a1!731) (size!8485 a2!731)) (let ((bdg!18722 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8485 a1!731))))) (and (bvslt to!815 bdg!18722) (bvsgt to!815 bdg!18722))))))

(assert (=> start!69994 true))

(declare-fun array_inv!8037 (array!19525) Bool)

(assert (=> start!69994 (array_inv!8037 a1!731)))

(assert (=> start!69994 (array_inv!8037 a2!731)))

(declare-fun bs!27098 () Bool)

(assert (= bs!27098 start!69994))

(declare-fun m!454427 () Bool)

(assert (=> bs!27098 m!454427))

(declare-fun m!454429 () Bool)

(assert (=> bs!27098 m!454429))

(push 1)

(assert (not start!69994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


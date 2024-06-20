; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70028 () Bool)

(assert start!70028)

(declare-datatypes ((array!19559 0))(
  ( (array!19560 (arr!9585 (Array (_ BitVec 32) (_ BitVec 8))) (size!8502 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19559)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19559)

(assert (=> start!70028 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8502 a1!731) (size!8502 a2!731)) (not (= ((_ sign_extend 32) (size!8502 a1!731)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8502 a1!731))) ((_ sign_extend 32) (size!8502 a1!731))))))))

(assert (=> start!70028 true))

(declare-fun array_inv!8054 (array!19559) Bool)

(assert (=> start!70028 (array_inv!8054 a1!731)))

(assert (=> start!70028 (array_inv!8054 a2!731)))

(declare-fun bs!27118 () Bool)

(assert (= bs!27118 start!70028))

(declare-fun m!454579 () Bool)

(assert (=> bs!27118 m!454579))

(declare-fun m!454581 () Bool)

(assert (=> bs!27118 m!454581))

(push 1)

(assert (not start!70028))

(check-sat)

(pop 1)

(push 1)

(check-sat)


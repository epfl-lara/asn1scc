; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70024 () Bool)

(assert start!70024)

(declare-datatypes ((array!19555 0))(
  ( (array!19556 (arr!9583 (Array (_ BitVec 32) (_ BitVec 8))) (size!8500 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19555)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19555)

(assert (=> start!70024 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8500 a1!731) (size!8500 a2!731)) (not (= ((_ sign_extend 32) (size!8500 a1!731)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8500 a1!731))) ((_ sign_extend 32) (size!8500 a1!731))))))))

(assert (=> start!70024 true))

(declare-fun array_inv!8052 (array!19555) Bool)

(assert (=> start!70024 (array_inv!8052 a1!731)))

(assert (=> start!70024 (array_inv!8052 a2!731)))

(declare-fun bs!27116 () Bool)

(assert (= bs!27116 start!70024))

(declare-fun m!454571 () Bool)

(assert (=> bs!27116 m!454571))

(declare-fun m!454573 () Bool)

(assert (=> bs!27116 m!454573))

(push 1)

(assert (not start!70024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


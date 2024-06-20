; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10374 () Bool)

(assert start!10374)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((array!2395 0))(
  ( (array!2396 (arr!1628 (Array (_ BitVec 32) (_ BitVec 8))) (size!1092 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2395)

(assert (=> start!10374 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (not (= ((_ sign_extend 32) (size!1092 srcBuffer!2)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1092 srcBuffer!2))) ((_ sign_extend 32) (size!1092 srcBuffer!2))))))))

(assert (=> start!10374 true))

(declare-fun array_inv!997 (array!2395) Bool)

(assert (=> start!10374 (array_inv!997 srcBuffer!2)))

(declare-fun bs!4170 () Bool)

(assert (= bs!4170 start!10374))

(declare-fun m!82405 () Bool)

(assert (=> bs!4170 m!82405))

(push 1)

(assert (not start!10374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


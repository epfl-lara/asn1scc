; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10378 () Bool)

(assert start!10378)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((array!2399 0))(
  ( (array!2400 (arr!1630 (Array (_ BitVec 32) (_ BitVec 8))) (size!1094 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2399)

(assert (=> start!10378 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (not (= ((_ sign_extend 32) (size!1094 srcBuffer!2)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1094 srcBuffer!2))) ((_ sign_extend 32) (size!1094 srcBuffer!2))))))))

(assert (=> start!10378 true))

(declare-fun array_inv!999 (array!2399) Bool)

(assert (=> start!10378 (array_inv!999 srcBuffer!2)))

(declare-fun bs!4172 () Bool)

(assert (= bs!4172 start!10378))

(declare-fun m!82409 () Bool)

(assert (=> bs!4172 m!82409))

(push 1)

(assert (not start!10378))

(check-sat)

(pop 1)

(push 1)

(check-sat)


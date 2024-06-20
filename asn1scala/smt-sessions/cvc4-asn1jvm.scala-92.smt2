; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2196 () Bool)

(assert start!2196)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!601 0))(
  ( (array!602 (arr!675 (Array (_ BitVec 32) (_ BitVec 8))) (size!258 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!601)

(assert (=> start!2196 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (not (= ((_ sign_extend 32) (size!258 srcBuffer!6)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!258 srcBuffer!6))) ((_ sign_extend 32) (size!258 srcBuffer!6))))))))

(assert (=> start!2196 true))

(declare-fun array_inv!250 (array!601) Bool)

(assert (=> start!2196 (array_inv!250 srcBuffer!6)))

(declare-fun bs!973 () Bool)

(assert (= bs!973 start!2196))

(declare-fun m!15003 () Bool)

(assert (=> bs!973 m!15003))

(push 1)

(assert (not start!2196))

(check-sat)

(pop 1)

(push 1)

(check-sat)


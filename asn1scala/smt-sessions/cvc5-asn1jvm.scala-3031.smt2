; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70522 () Bool)

(assert start!70522)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19927 0))(
  ( (array!19928 (arr!9772 (Array (_ BitVec 32) (_ BitVec 8))) (size!8680 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19927)

(assert (=> start!70522 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (not (= ((_ sign_extend 32) (size!8680 arr!335)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8680 arr!335))) ((_ sign_extend 32) (size!8680 arr!335))))))))

(assert (=> start!70522 true))

(declare-fun array_inv!8232 (array!19927) Bool)

(assert (=> start!70522 (array_inv!8232 arr!335)))

(declare-fun bs!27380 () Bool)

(assert (= bs!27380 start!70522))

(declare-fun m!457907 () Bool)

(assert (=> bs!27380 m!457907))

(push 1)

(assert (not start!70522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


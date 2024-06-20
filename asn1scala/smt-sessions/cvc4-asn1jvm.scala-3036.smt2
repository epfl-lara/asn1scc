; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70556 () Bool)

(assert start!70556)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19961 0))(
  ( (array!19962 (arr!9789 (Array (_ BitVec 32) (_ BitVec 8))) (size!8697 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19961)

(assert (=> start!70556 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8697 arr!335)))) (let ((bdg!18770 ((_ extract 31 0) (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!18770 #b00000000000000000000000000000000) (bvsge bdg!18770 (size!8697 arr!335)))))))

(assert (=> start!70556 true))

(declare-fun array_inv!8249 (array!19961) Bool)

(assert (=> start!70556 (array_inv!8249 arr!335)))

(declare-fun bs!27412 () Bool)

(assert (= bs!27412 start!70556))

(declare-fun m!457941 () Bool)

(assert (=> bs!27412 m!457941))

(push 1)

(assert (not start!70556))

(check-sat)

(pop 1)

(push 1)

(check-sat)


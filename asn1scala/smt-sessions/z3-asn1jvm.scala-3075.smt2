; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70912 () Bool)

(assert start!70912)

(declare-datatypes ((array!20195 0))(
  ( (array!20196 (arr!9896 (Array (_ BitVec 32) (_ BitVec 8))) (size!8804 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20195)

(assert (=> start!70912 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8804 a!440))))))

(declare-fun array_inv!8356 (array!20195) Bool)

(assert (=> start!70912 (array_inv!8356 a!440)))

(declare-fun bs!27591 () Bool)

(assert (= bs!27591 start!70912))

(declare-fun m!458961 () Bool)

(assert (=> bs!27591 m!458961))

(check-sat (not start!70912))
(check-sat)
(get-model)

(declare-fun d!104974 () Bool)

(assert (=> d!104974 (= (array_inv!8356 a!440) (bvsge (size!8804 a!440) #b00000000000000000000000000000000))))

(assert (=> start!70912 d!104974))

(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70624 () Bool)

(assert start!70624)

(declare-datatypes ((array!20002 0))(
  ( (array!20003 (arr!9808 (Array (_ BitVec 32) (_ BitVec 8))) (size!8716 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20002)

(assert (=> start!70624 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8716 a!422))))))

(declare-fun array_inv!8268 (array!20002) Bool)

(assert (=> start!70624 (array_inv!8268 a!422)))

(declare-fun bs!27455 () Bool)

(assert (= bs!27455 start!70624))

(declare-fun m!458207 () Bool)

(assert (=> bs!27455 m!458207))

(push 1)

(assert (not start!70624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104760 () Bool)

(assert (=> d!104760 (= (array_inv!8268 a!422) (bvsge (size!8716 a!422) #b00000000000000000000000000000000))))

(assert (=> start!70624 d!104760))

(push 1)

(check-sat)

(pop 1)


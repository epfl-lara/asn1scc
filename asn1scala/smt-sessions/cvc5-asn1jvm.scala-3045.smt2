; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70650 () Bool)

(assert start!70650)

(declare-datatypes ((Unit!21911 0))(
  ( (Unit!21912) )
))
(declare-fun lt!443648 () Unit!21911)

(declare-datatypes ((array!20018 0))(
  ( (array!20019 (arr!9814 (Array (_ BitVec 32) (_ BitVec 8))) (size!8722 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20018)

(declare-fun rec!17 (array!20018 (_ BitVec 64)) Unit!21911)

(assert (=> start!70650 (= lt!443648 (rec!17 a!422 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8722 a!422)))))))

(assert (=> start!70650 false))

(declare-fun array_inv!8274 (array!20018) Bool)

(assert (=> start!70650 (array_inv!8274 a!422)))

(declare-fun bs!27464 () Bool)

(assert (= bs!27464 start!70650))

(declare-fun m!458261 () Bool)

(assert (=> bs!27464 m!458261))

(declare-fun m!458263 () Bool)

(assert (=> bs!27464 m!458263))

(push 1)

(assert (not start!70650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


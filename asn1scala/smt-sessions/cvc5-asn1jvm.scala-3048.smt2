; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70680 () Bool)

(assert start!70680)

(declare-datatypes ((Unit!21926 0))(
  ( (Unit!21927) )
))
(declare-fun lt!443696 () Unit!21926)

(declare-datatypes ((array!20039 0))(
  ( (array!20040 (arr!9823 (Array (_ BitVec 32) (_ BitVec 8))) (size!8731 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20039)

(declare-fun lt!443695 () (_ BitVec 64))

(declare-fun rec!17 (array!20039 (_ BitVec 64)) Unit!21926)

(assert (=> start!70680 (= lt!443696 (rec!17 a!422 lt!443695))))

(assert (=> start!70680 (= lt!443695 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8731 a!422))))))

(assert (=> start!70680 (and (not (= ((_ sign_extend 32) (size!8731 a!422)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443695 ((_ sign_extend 32) (size!8731 a!422))))))))

(declare-fun array_inv!8283 (array!20039) Bool)

(assert (=> start!70680 (array_inv!8283 a!422)))

(declare-fun bs!27482 () Bool)

(assert (= bs!27482 start!70680))

(declare-fun m!458303 () Bool)

(assert (=> bs!27482 m!458303))

(declare-fun m!458305 () Bool)

(assert (=> bs!27482 m!458305))

(push 1)

(assert (not start!70680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


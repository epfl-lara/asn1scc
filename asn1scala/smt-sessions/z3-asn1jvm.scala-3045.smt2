; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70652 () Bool)

(assert start!70652)

(declare-datatypes ((Unit!21913 0))(
  ( (Unit!21914) )
))
(declare-fun lt!443651 () Unit!21913)

(declare-datatypes ((array!20020 0))(
  ( (array!20021 (arr!9815 (Array (_ BitVec 32) (_ BitVec 8))) (size!8723 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20020)

(declare-fun rec!17 (array!20020 (_ BitVec 64)) Unit!21913)

(assert (=> start!70652 (= lt!443651 (rec!17 a!422 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8723 a!422)))))))

(assert (=> start!70652 false))

(declare-fun array_inv!8275 (array!20020) Bool)

(assert (=> start!70652 (array_inv!8275 a!422)))

(declare-fun bs!27465 () Bool)

(assert (= bs!27465 start!70652))

(declare-fun m!458265 () Bool)

(assert (=> bs!27465 m!458265))

(declare-fun m!458267 () Bool)

(assert (=> bs!27465 m!458267))

(check-sat (not start!70652))

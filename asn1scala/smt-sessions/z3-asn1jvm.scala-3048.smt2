; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70682 () Bool)

(assert start!70682)

(declare-datatypes ((Unit!21928 0))(
  ( (Unit!21929) )
))
(declare-fun lt!443702 () Unit!21928)

(declare-datatypes ((array!20041 0))(
  ( (array!20042 (arr!9824 (Array (_ BitVec 32) (_ BitVec 8))) (size!8732 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20041)

(declare-fun lt!443701 () (_ BitVec 64))

(declare-fun rec!17 (array!20041 (_ BitVec 64)) Unit!21928)

(assert (=> start!70682 (= lt!443702 (rec!17 a!422 lt!443701))))

(assert (=> start!70682 (= lt!443701 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8732 a!422))))))

(assert (=> start!70682 (and (not (= ((_ sign_extend 32) (size!8732 a!422)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443701 ((_ sign_extend 32) (size!8732 a!422))))))))

(declare-fun array_inv!8284 (array!20041) Bool)

(assert (=> start!70682 (array_inv!8284 a!422)))

(declare-fun bs!27483 () Bool)

(assert (= bs!27483 start!70682))

(declare-fun m!458307 () Bool)

(assert (=> bs!27483 m!458307))

(declare-fun m!458309 () Bool)

(assert (=> bs!27483 m!458309))

(check-sat (not start!70682))
(check-sat)

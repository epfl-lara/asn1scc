; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73596 () Bool)

(assert start!73596)

(declare-fun i!1031 () (_ BitVec 64))

(declare-datatypes ((array!21088 0))(
  ( (array!21089 (arr!10244 (Array (_ BitVec 32) (_ BitVec 8))) (size!9152 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21088)

(assert (=> start!73596 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031) (not (= ((_ sign_extend 32) (size!9152 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9152 a!445))) ((_ sign_extend 32) (size!9152 a!445))))))))

(assert (=> start!73596 true))

(declare-fun array_inv!8704 (array!21088) Bool)

(assert (=> start!73596 (array_inv!8704 a!445)))

(declare-fun bs!28323 () Bool)

(assert (= bs!28323 start!73596))

(declare-fun m!463749 () Bool)

(assert (=> bs!28323 m!463749))

(check-sat (not start!73596))
(check-sat)

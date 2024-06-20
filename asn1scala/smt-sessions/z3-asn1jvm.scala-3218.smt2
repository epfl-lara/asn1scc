; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73602 () Bool)

(assert start!73602)

(declare-fun i!1031 () (_ BitVec 64))

(declare-datatypes ((array!21094 0))(
  ( (array!21095 (arr!10247 (Array (_ BitVec 32) (_ BitVec 8))) (size!9155 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21094)

(assert (=> start!73602 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031) (let ((bdg!18918 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9155 a!445))))) (and (bvsle i!1031 bdg!18918) (not (= ((_ sign_extend 32) (size!9155 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18918 ((_ sign_extend 32) (size!9155 a!445))))))))))

(assert (=> start!73602 true))

(declare-fun array_inv!8707 (array!21094) Bool)

(assert (=> start!73602 (array_inv!8707 a!445)))

(declare-fun bs!28329 () Bool)

(assert (= bs!28329 start!73602))

(declare-fun m!463755 () Bool)

(assert (=> bs!28329 m!463755))

(check-sat (not start!73602))
(check-sat)

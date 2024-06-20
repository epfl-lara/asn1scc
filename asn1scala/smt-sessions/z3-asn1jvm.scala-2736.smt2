; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66708 () Bool)

(assert start!66708)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17971 0))(
  ( (array!17972 (arr!8876 (Array (_ BitVec 32) (_ BitVec 8))) (size!7793 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17971)

(assert (=> start!66708 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (not (= ((_ sign_extend 32) (size!7793 a!429)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7793 a!429))) ((_ sign_extend 32) (size!7793 a!429))))))))

(assert (=> start!66708 true))

(declare-fun array_inv!7405 (array!17971) Bool)

(assert (=> start!66708 (array_inv!7405 a!429)))

(declare-fun bs!25786 () Bool)

(assert (= bs!25786 start!66708))

(declare-fun m!437451 () Bool)

(assert (=> bs!25786 m!437451))

(check-sat (not start!66708))
(check-sat)

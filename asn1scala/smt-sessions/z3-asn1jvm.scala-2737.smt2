; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66714 () Bool)

(assert start!66714)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17977 0))(
  ( (array!17978 (arr!8879 (Array (_ BitVec 32) (_ BitVec 8))) (size!7796 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17977)

(assert (=> start!66714 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7796 a!429)))) (bvsge (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66714 true))

(declare-fun array_inv!7408 (array!17977) Bool)

(assert (=> start!66714 (array_inv!7408 a!429)))

(declare-fun bs!25792 () Bool)

(assert (= bs!25792 start!66714))

(declare-fun m!437457 () Bool)

(assert (=> bs!25792 m!437457))

(check-sat (not start!66714))
(check-sat)

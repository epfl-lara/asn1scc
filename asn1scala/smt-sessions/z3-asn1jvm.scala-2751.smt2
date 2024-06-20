; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66810 () Bool)

(assert start!66810)

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18064 0))(
  ( (array!18065 (arr!8921 (Array (_ BitVec 32) (_ BitVec 8))) (size!7838 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18064)

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> start!66810 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7838 a!434)))) (let ((bdg!17884 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286) (or (bvslt bdg!17884 #b00000000000000000000000000000000) (bvsge bdg!17884 (size!7838 a!434))))))))

(assert (=> start!66810 true))

(declare-fun array_inv!7450 (array!18064) Bool)

(assert (=> start!66810 (array_inv!7450 a!434)))

(declare-fun bs!25858 () Bool)

(assert (= bs!25858 start!66810))

(declare-fun m!437793 () Bool)

(assert (=> bs!25858 m!437793))

(check-sat (not start!66810))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66786 () Bool)

(assert start!66786)

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18040 0))(
  ( (array!18041 (arr!8909 (Array (_ BitVec 32) (_ BitVec 8))) (size!7826 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18040)

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> start!66786 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (let ((bdg!17868 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7826 a!434))))) (and (bvslt at!286 bdg!17868) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286) (bvsgt at!286 bdg!17868))))))

(assert (=> start!66786 true))

(declare-fun array_inv!7438 (array!18040) Bool)

(assert (=> start!66786 (array_inv!7438 a!434)))

(declare-fun bs!25843 () Bool)

(assert (= bs!25843 start!66786))

(declare-fun m!437661 () Bool)

(assert (=> bs!25843 m!437661))

(check-sat (not start!66786))
(check-sat)

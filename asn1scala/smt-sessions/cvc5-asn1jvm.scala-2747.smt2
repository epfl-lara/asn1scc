; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66784 () Bool)

(assert start!66784)

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18038 0))(
  ( (array!18039 (arr!8908 (Array (_ BitVec 32) (_ BitVec 8))) (size!7825 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18038)

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> start!66784 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (let ((bdg!17868 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7825 a!434))))) (and (bvslt at!286 bdg!17868) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286) (bvsgt at!286 bdg!17868))))))

(assert (=> start!66784 true))

(declare-fun array_inv!7437 (array!18038) Bool)

(assert (=> start!66784 (array_inv!7437 a!434)))

(declare-fun bs!25842 () Bool)

(assert (= bs!25842 start!66784))

(declare-fun m!437659 () Bool)

(assert (=> bs!25842 m!437659))

(push 1)

(assert (not start!66784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


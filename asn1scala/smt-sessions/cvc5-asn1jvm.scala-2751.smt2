; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66808 () Bool)

(assert start!66808)

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18062 0))(
  ( (array!18063 (arr!8920 (Array (_ BitVec 32) (_ BitVec 8))) (size!7837 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18062)

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> start!66808 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7837 a!434)))) (let ((bdg!17884 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286) (or (bvslt bdg!17884 #b00000000000000000000000000000000) (bvsge bdg!17884 (size!7837 a!434))))))))

(assert (=> start!66808 true))

(declare-fun array_inv!7449 (array!18062) Bool)

(assert (=> start!66808 (array_inv!7449 a!434)))

(declare-fun bs!25857 () Bool)

(assert (= bs!25857 start!66808))

(declare-fun m!437791 () Bool)

(assert (=> bs!25857 m!437791))

(push 1)

(assert (not start!66808))

(check-sat)

(pop 1)

(push 1)

(check-sat)


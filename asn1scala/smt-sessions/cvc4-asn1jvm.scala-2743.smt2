; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66752 () Bool)

(assert start!66752)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18015 0))(
  ( (array!18016 (arr!8898 (Array (_ BitVec 32) (_ BitVec 8))) (size!7815 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18015)

(assert (=> start!66752 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7815 a!429)))) (let ((bdg!17854 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17854 #b00000000000000000000000000000000) (bvsge bdg!17854 #b00000000000000000000000000001000))))))

(assert (=> start!66752 true))

(declare-fun array_inv!7427 (array!18015) Bool)

(assert (=> start!66752 (array_inv!7427 a!429)))

(declare-fun bs!25829 () Bool)

(assert (= bs!25829 start!66752))

(declare-fun m!437495 () Bool)

(assert (=> bs!25829 m!437495))

(push 1)


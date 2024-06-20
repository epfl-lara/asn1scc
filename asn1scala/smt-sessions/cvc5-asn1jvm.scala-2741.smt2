; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66736 () Bool)

(assert start!66736)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17999 0))(
  ( (array!18000 (arr!8890 (Array (_ BitVec 32) (_ BitVec 8))) (size!7807 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17999)

(declare-fun b!315 () Bool)

(assert (=> start!66736 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7807 a!429)))) (let ((bdg!17852 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and b!315 (or (bvslt bdg!17852 #b00000000000000000000000000000000) (bvsge bdg!17852 #b00000000000000000000000000001000)))))))

(assert (=> start!66736 true))

(declare-fun array_inv!7419 (array!17999) Bool)

(assert (=> start!66736 (array_inv!7419 a!429)))

(declare-fun bs!25815 () Bool)

(assert (= bs!25815 start!66736))

(declare-fun m!437479 () Bool)

(assert (=> bs!25815 m!437479))

(push 1)

(assert (not start!66736))

(check-sat)

(pop 1)

(push 1)

(check-sat)


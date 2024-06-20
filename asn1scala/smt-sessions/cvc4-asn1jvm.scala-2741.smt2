; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66740 () Bool)

(assert start!66740)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18003 0))(
  ( (array!18004 (arr!8892 (Array (_ BitVec 32) (_ BitVec 8))) (size!7809 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18003)

(declare-fun b!315 () Bool)

(assert (=> start!66740 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7809 a!429)))) (let ((bdg!17852 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and b!315 (or (bvslt bdg!17852 #b00000000000000000000000000000000) (bvsge bdg!17852 #b00000000000000000000000000001000)))))))

(assert (=> start!66740 true))

(declare-fun array_inv!7421 (array!18003) Bool)

(assert (=> start!66740 (array_inv!7421 a!429)))

(declare-fun bs!25817 () Bool)

(assert (= bs!25817 start!66740))

(declare-fun m!437483 () Bool)

(assert (=> bs!25817 m!437483))

(push 1)


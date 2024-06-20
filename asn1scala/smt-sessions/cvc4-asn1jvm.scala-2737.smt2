; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66716 () Bool)

(assert start!66716)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17979 0))(
  ( (array!17980 (arr!8880 (Array (_ BitVec 32) (_ BitVec 8))) (size!7797 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17979)

(assert (=> start!66716 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7797 a!429)))) (bvsge (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66716 true))

(declare-fun array_inv!7409 (array!17979) Bool)

(assert (=> start!66716 (array_inv!7409 a!429)))

(declare-fun bs!25793 () Bool)

(assert (= bs!25793 start!66716))

(declare-fun m!437459 () Bool)

(assert (=> bs!25793 m!437459))

(push 1)

(assert (not start!66716))

(check-sat)

(pop 1)

(push 1)

(check-sat)


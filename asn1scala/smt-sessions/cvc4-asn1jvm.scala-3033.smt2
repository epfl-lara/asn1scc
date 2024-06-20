; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70538 () Bool)

(assert start!70538)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19943 0))(
  ( (array!19944 (arr!9780 (Array (_ BitVec 32) (_ BitVec 8))) (size!8688 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19943)

(assert (=> start!70538 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8688 arr!335)))) (bvslt (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!70538 true))

(declare-fun array_inv!8240 (array!19943) Bool)

(assert (=> start!70538 (array_inv!8240 arr!335)))

(declare-fun bs!27394 () Bool)

(assert (= bs!27394 start!70538))

(declare-fun m!457923 () Bool)

(assert (=> bs!27394 m!457923))

(push 1)

(assert (not start!70538))

(check-sat)

(pop 1)

(push 1)

(check-sat)


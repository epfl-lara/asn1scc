; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66610 () Bool)

(assert start!66610)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17885 0))(
  ( (array!17886 (arr!8833 (Array (_ BitVec 32) (_ BitVec 8))) (size!7750 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17885)

(assert (=> start!66610 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7750 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!66610 true))

(declare-fun array_inv!7362 (array!17885) Bool)

(assert (=> start!66610 (array_inv!7362 arr!219)))

(declare-fun bs!25701 () Bool)

(assert (= bs!25701 start!66610))

(declare-fun m!437293 () Bool)

(assert (=> bs!25701 m!437293))

(push 1)

(assert (not start!66610))

(check-sat)

(pop 1)

(push 1)

(check-sat)


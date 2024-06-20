; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66688 () Bool)

(assert start!66688)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17951 0))(
  ( (array!17952 (arr!8866 (Array (_ BitVec 32) (_ BitVec 8))) (size!7783 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17951)

(assert (=> start!66688 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7783 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsub nBits!491 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!491))))

(assert (=> start!66688 true))

(declare-fun array_inv!7395 (array!17951) Bool)

(assert (=> start!66688 (array_inv!7395 arr!219)))

(declare-fun bs!25773 () Bool)

(assert (= bs!25773 start!66688))

(declare-fun m!437359 () Bool)

(assert (=> bs!25773 m!437359))

(push 1)

(assert (not start!66688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


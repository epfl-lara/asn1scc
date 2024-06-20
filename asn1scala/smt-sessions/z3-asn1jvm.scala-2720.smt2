; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66612 () Bool)

(assert start!66612)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17887 0))(
  ( (array!17888 (arr!8834 (Array (_ BitVec 32) (_ BitVec 8))) (size!7751 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17887)

(assert (=> start!66612 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7751 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!66612 true))

(declare-fun array_inv!7363 (array!17887) Bool)

(assert (=> start!66612 (array_inv!7363 arr!219)))

(declare-fun bs!25702 () Bool)

(assert (= bs!25702 start!66612))

(declare-fun m!437295 () Bool)

(assert (=> bs!25702 m!437295))

(check-sat (not start!66612))
(check-sat)

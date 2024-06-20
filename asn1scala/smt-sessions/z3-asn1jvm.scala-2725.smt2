; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66642 () Bool)

(assert start!66642)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17905 0))(
  ( (array!17906 (arr!8843 (Array (_ BitVec 32) (_ BitVec 8))) (size!7760 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17905)

(assert (=> start!66642 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7760 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsrem from!377 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66642 true))

(declare-fun array_inv!7372 (array!17905) Bool)

(assert (=> start!66642 (array_inv!7372 arr!219)))

(declare-fun bs!25726 () Bool)

(assert (= bs!25726 start!66642))

(declare-fun m!437313 () Bool)

(assert (=> bs!25726 m!437313))

(check-sat (not start!66642))
(check-sat)

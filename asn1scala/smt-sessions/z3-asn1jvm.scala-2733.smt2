; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66690 () Bool)

(assert start!66690)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17953 0))(
  ( (array!17954 (arr!8867 (Array (_ BitVec 32) (_ BitVec 8))) (size!7784 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17953)

(assert (=> start!66690 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7784 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsub nBits!491 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!491))))

(assert (=> start!66690 true))

(declare-fun array_inv!7396 (array!17953) Bool)

(assert (=> start!66690 (array_inv!7396 arr!219)))

(declare-fun bs!25774 () Bool)

(assert (= bs!25774 start!66690))

(declare-fun m!437361 () Bool)

(assert (=> bs!25774 m!437361))

(check-sat (not start!66690))
(check-sat)

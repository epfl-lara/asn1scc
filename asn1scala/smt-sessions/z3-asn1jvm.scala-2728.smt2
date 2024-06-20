; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66660 () Bool)

(assert start!66660)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17923 0))(
  ( (array!17924 (arr!8852 (Array (_ BitVec 32) (_ BitVec 8))) (size!7769 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17923)

(assert (=> start!66660 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7769 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsdiv from!377 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66660 true))

(declare-fun array_inv!7381 (array!17923) Bool)

(assert (=> start!66660 (array_inv!7381 arr!219)))

(declare-fun bs!25744 () Bool)

(assert (= bs!25744 start!66660))

(declare-fun m!437331 () Bool)

(assert (=> bs!25744 m!437331))

(check-sat (not start!66660))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70536 () Bool)

(assert start!70536)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19941 0))(
  ( (array!19942 (arr!9779 (Array (_ BitVec 32) (_ BitVec 8))) (size!8687 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19941)

(assert (=> start!70536 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (bvslt at!206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8687 arr!335)))) (bvslt (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv at!206 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!70536 true))

(declare-fun array_inv!8239 (array!19941) Bool)

(assert (=> start!70536 (array_inv!8239 arr!335)))

(declare-fun bs!27393 () Bool)

(assert (= bs!27393 start!70536))

(declare-fun m!457921 () Bool)

(assert (=> bs!27393 m!457921))

(check-sat (not start!70536))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70290 () Bool)

(assert start!70290)

(declare-datatypes ((array!19788 0))(
  ( (array!19789 (arr!9701 (Array (_ BitVec 32) (_ BitVec 8))) (size!8615 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19788)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19788)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70290 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8615 a1!721) (size!8615 a2!721)) (not (= ((_ sign_extend 32) (size!8615 a1!721)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8615 a1!721))) ((_ sign_extend 32) (size!8615 a1!721))))))))

(assert (=> start!70290 true))

(declare-fun array_inv!8167 (array!19788) Bool)

(assert (=> start!70290 (array_inv!8167 a1!721)))

(assert (=> start!70290 (array_inv!8167 a2!721)))

(declare-fun bs!27255 () Bool)

(assert (= bs!27255 start!70290))

(declare-fun m!456609 () Bool)

(assert (=> bs!27255 m!456609))

(declare-fun m!456611 () Bool)

(assert (=> bs!27255 m!456611))

(check-sat (not start!70290))
(check-sat)

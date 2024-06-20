; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70368 () Bool)

(assert start!70368)

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19833 0))(
  ( (array!19834 (arr!9725 (Array (_ BitVec 32) (_ BitVec 8))) (size!8636 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19833)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19833)

(assert (=> start!70368 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8636 a1!898) (size!8636 a2!898)) (not (= ((_ sign_extend 32) (size!8636 a1!898)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8636 a1!898))) ((_ sign_extend 32) (size!8636 a1!898))))))))

(assert (=> start!70368 true))

(declare-fun array_inv!8188 (array!19833) Bool)

(assert (=> start!70368 (array_inv!8188 a1!898)))

(assert (=> start!70368 (array_inv!8188 a2!898)))

(declare-fun bs!27297 () Bool)

(assert (= bs!27297 start!70368))

(declare-fun m!457011 () Bool)

(assert (=> bs!27297 m!457011))

(declare-fun m!457013 () Bool)

(assert (=> bs!27297 m!457013))

(check-sat (not start!70368))
(check-sat)

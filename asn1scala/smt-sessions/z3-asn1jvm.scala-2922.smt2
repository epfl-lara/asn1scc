; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69684 () Bool)

(assert start!69684)

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19257 0))(
  ( (array!19258 (arr!9434 (Array (_ BitVec 32) (_ BitVec 8))) (size!8354 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19257)

(declare-fun a2!799 () array!19257)

(declare-fun a3!74 () array!19257)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69684 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8354 a1!799) (size!8354 a2!799)) (= (size!8354 a2!799) (size!8354 a3!74)) (not (= ((_ sign_extend 32) (size!8354 a1!799)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8354 a1!799))) ((_ sign_extend 32) (size!8354 a1!799))))))))

(assert (=> start!69684 true))

(declare-fun array_inv!7906 (array!19257) Bool)

(assert (=> start!69684 (array_inv!7906 a1!799)))

(assert (=> start!69684 (array_inv!7906 a2!799)))

(assert (=> start!69684 (array_inv!7906 a3!74)))

(declare-fun bs!26925 () Bool)

(assert (= bs!26925 start!69684))

(declare-fun m!451037 () Bool)

(assert (=> bs!26925 m!451037))

(declare-fun m!451039 () Bool)

(assert (=> bs!26925 m!451039))

(declare-fun m!451041 () Bool)

(assert (=> bs!26925 m!451041))

(check-sat (not start!69684))
(check-sat)

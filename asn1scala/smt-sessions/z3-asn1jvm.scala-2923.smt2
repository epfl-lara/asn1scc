; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69690 () Bool)

(assert start!69690)

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19263 0))(
  ( (array!19264 (arr!9437 (Array (_ BitVec 32) (_ BitVec 8))) (size!8357 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19263)

(declare-fun a2!799 () array!19263)

(declare-fun a3!74 () array!19263)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69690 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8357 a1!799) (size!8357 a2!799)) (= (size!8357 a2!799) (size!8357 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8357 a1!799)))) (not (= ((_ sign_extend 32) (size!8357 a2!799)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8357 a2!799))) ((_ sign_extend 32) (size!8357 a2!799))))))))

(assert (=> start!69690 true))

(declare-fun array_inv!7909 (array!19263) Bool)

(assert (=> start!69690 (array_inv!7909 a1!799)))

(assert (=> start!69690 (array_inv!7909 a2!799)))

(assert (=> start!69690 (array_inv!7909 a3!74)))

(declare-fun bs!26931 () Bool)

(assert (= bs!26931 start!69690))

(declare-fun m!451055 () Bool)

(assert (=> bs!26931 m!451055))

(declare-fun m!451057 () Bool)

(assert (=> bs!26931 m!451057))

(declare-fun m!451059 () Bool)

(assert (=> bs!26931 m!451059))

(check-sat (not start!69690))
(check-sat)

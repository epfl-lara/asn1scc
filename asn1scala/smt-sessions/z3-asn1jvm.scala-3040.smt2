; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70578 () Bool)

(assert start!70578)

(declare-datatypes ((array!19983 0))(
  ( (array!19984 (arr!9800 (Array (_ BitVec 32) (_ BitVec 8))) (size!8708 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19983)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19983)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70578 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8708 a1!726) (size!8708 a2!726)) (not (= ((_ sign_extend 32) (size!8708 a1!726)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8708 a1!726))) ((_ sign_extend 32) (size!8708 a1!726))))))))

(assert (=> start!70578 true))

(declare-fun array_inv!8260 (array!19983) Bool)

(assert (=> start!70578 (array_inv!8260 a1!726)))

(assert (=> start!70578 (array_inv!8260 a2!726)))

(declare-fun bs!27432 () Bool)

(assert (= bs!27432 start!70578))

(declare-fun m!457983 () Bool)

(assert (=> bs!27432 m!457983))

(declare-fun m!457985 () Bool)

(assert (=> bs!27432 m!457985))

(check-sat (not start!70578))
(check-sat)

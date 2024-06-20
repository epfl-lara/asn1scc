; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27284 () Bool)

(assert start!27284)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6377 0))(
  ( (array!6378 (arr!3592 (Array (_ BitVec 32) (_ BitVec 8))) (size!2885 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6377)

(assert (=> start!27284 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2885 arr!237)) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(assert (=> start!27284 true))

(declare-fun array_inv!2674 (array!6377) Bool)

(assert (=> start!27284 (array_inv!2674 arr!237)))

(declare-fun bs!11082 () Bool)

(assert (= bs!11082 start!27284))

(declare-fun m!215935 () Bool)

(assert (=> bs!11082 m!215935))

(check-sat (not start!27284))
(check-sat)

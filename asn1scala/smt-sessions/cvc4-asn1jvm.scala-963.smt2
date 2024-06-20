; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27286 () Bool)

(assert start!27286)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6379 0))(
  ( (array!6380 (arr!3593 (Array (_ BitVec 32) (_ BitVec 8))) (size!2886 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6379)

(assert (=> start!27286 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2886 arr!237)) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(assert (=> start!27286 true))

(declare-fun array_inv!2675 (array!6379) Bool)

(assert (=> start!27286 (array_inv!2675 arr!237)))

(declare-fun bs!11083 () Bool)

(assert (= bs!11083 start!27286))

(declare-fun m!215937 () Bool)

(assert (=> bs!11083 m!215937))

(push 1)

(assert (not start!27286))

(check-sat)

(pop 1)

(push 1)

(check-sat)


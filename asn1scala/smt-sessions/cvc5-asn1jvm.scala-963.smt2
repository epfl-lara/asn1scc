; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27282 () Bool)

(assert start!27282)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6375 0))(
  ( (array!6376 (arr!3591 (Array (_ BitVec 32) (_ BitVec 8))) (size!2884 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6375)

(assert (=> start!27282 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2884 arr!237)) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(assert (=> start!27282 true))

(declare-fun array_inv!2673 (array!6375) Bool)

(assert (=> start!27282 (array_inv!2673 arr!237)))

(declare-fun bs!11081 () Bool)

(assert (= bs!11081 start!27282))

(declare-fun m!215933 () Bool)

(assert (=> bs!11081 m!215933))

(push 1)

(assert (not start!27282))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65294 () Bool)

(assert start!65294)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17442 0))(
  ( (array!17443 (arr!8580 (Array (_ BitVec 32) (_ BitVec 8))) (size!7554 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17442)

(assert (=> start!65294 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7554 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!65294 true))

(declare-fun array_inv!7166 (array!17442) Bool)

(assert (=> start!65294 (array_inv!7166 arr!273)))

(declare-fun bs!25277 () Bool)

(assert (= bs!25277 start!65294))

(declare-fun m!428489 () Bool)

(assert (=> bs!25277 m!428489))

(push 1)

(assert (not start!65294))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65290 () Bool)

(assert start!65290)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17438 0))(
  ( (array!17439 (arr!8578 (Array (_ BitVec 32) (_ BitVec 8))) (size!7552 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17438)

(assert (=> start!65290 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7552 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!65290 true))

(declare-fun array_inv!7164 (array!17438) Bool)

(assert (=> start!65290 (array_inv!7164 arr!273)))

(declare-fun bs!25275 () Bool)

(assert (= bs!25275 start!65290))

(declare-fun m!428485 () Bool)

(assert (=> bs!25275 m!428485))

(push 1)

(assert (not start!65290))

(check-sat)

(pop 1)

(push 1)

(check-sat)


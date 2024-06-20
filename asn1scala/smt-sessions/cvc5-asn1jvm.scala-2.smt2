; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40 () Bool)

(assert start!40)

(declare-fun at!205 () (_ BitVec 32))

(assert (=> start!40 (and (bvsle #b00000000000000000000000000000000 at!205) (bvsle at!205 #b00000000000000000000000000000111) (not (= #b00000000000000000000000000000000 (bvand at!205 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000000111 at!205) #b10000000000000000000000000000000))))))

(assert (=> start!40 true))

(push 1)

(check-sat)

(pop 1)


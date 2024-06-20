; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50 () Bool)

(assert start!50)

(declare-fun at!205 () (_ BitVec 32))

(assert (=> start!50 (and (bvsle #b00000000000000000000000000000000 at!205) (bvsle at!205 #b00000000000000000000000000000111) (bvsgt (bvsub #b00000000000000000000000000000111 at!205) #b00000000000000000000000000100000))))

(assert (=> start!50 true))

(push 1)

(check-sat)

(pop 1)


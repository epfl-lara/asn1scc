; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2184 () Bool)

(assert start!2184)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(assert (=> start!2184 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvand (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!2184 true))

(push 1)

(check-sat)

(pop 1)


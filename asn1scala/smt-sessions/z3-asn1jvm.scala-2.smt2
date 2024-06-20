; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42 () Bool)

(assert start!42)

(declare-fun at!205 () (_ BitVec 32))

(assert (=> start!42 (and (bvsle #b00000000000000000000000000000000 at!205) (bvsle at!205 #b00000000000000000000000000000111) (not (= #b00000000000000000000000000000000 (bvand at!205 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000000111 at!205) #b10000000000000000000000000000000))))))

(assert (=> start!42 true))

(check-sat)

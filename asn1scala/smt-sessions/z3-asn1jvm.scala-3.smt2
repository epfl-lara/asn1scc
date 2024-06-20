; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48 () Bool)

(assert start!48)

(declare-fun at!205 () (_ BitVec 32))

(assert (=> start!48 (and (bvsle #b00000000000000000000000000000000 at!205) (bvsle at!205 #b00000000000000000000000000000111) (bvsgt (bvsub #b00000000000000000000000000000111 at!205) #b00000000000000000000000000100000))))

(assert (=> start!48 true))

(check-sat)

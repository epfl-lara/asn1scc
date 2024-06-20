; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73950 () Bool)

(assert start!73950)

(declare-fun fromBit!80 () (_ BitVec 64))

(declare-fun toBit!80 () (_ BitVec 64))

(assert (=> start!73950 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!80) (bvsle fromBit!80 toBit!80) (bvsle toBit!80 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge (bvsdiv toBit!80 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!73950 true))

(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73964 () Bool)

(assert start!73964)

(declare-fun fromBit!80 () (_ BitVec 64))

(declare-fun toBit!80 () (_ BitVec 64))

(assert (=> start!73964 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!80) (bvsle fromBit!80 toBit!80) (bvsle toBit!80 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge (bvsdiv fromBit!80 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!73964 true))

(push 1)

(check-sat)


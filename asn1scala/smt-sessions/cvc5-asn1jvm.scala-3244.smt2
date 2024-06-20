; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73930 () Bool)

(assert start!73930)

(declare-fun fromBit!80 () (_ BitVec 64))

(declare-fun toBit!80 () (_ BitVec 64))

(assert (=> start!73930 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!80) (bvsle fromBit!80 toBit!80) (bvsle toBit!80 #b0000000000000000000000000000001111111111111111111111111111111000) (let ((bdg!18966 ((_ sign_extend 32) (ite (= (bvsrem fromBit!80 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) (let ((bdg!18967 (bvand (bvsdiv fromBit!80 #b0000000000000000000000000000000000000000000000000000000000001000) #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18967 (bvand bdg!18966 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18967 (bvand (bvadd (bvsdiv fromBit!80 #b0000000000000000000000000000000000000000000000000000000000001000) bdg!18966) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> start!73930 true))

(push 1)

(check-sat)


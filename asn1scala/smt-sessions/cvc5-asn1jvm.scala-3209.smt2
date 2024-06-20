; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73546 () Bool)

(assert start!73546)

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(assert (=> start!73546 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt bufLength!6 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!73546 true))

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70878 () Bool)

(assert start!70878)

(declare-fun bufLength!13 () (_ BitVec 64))

(declare-fun currentByte!33 () (_ BitVec 64))

(declare-fun currentBit!28 () (_ BitVec 64))

(assert (=> start!70878 (and (bvsle bufLength!13 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!33 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!28 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!13 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!33 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!28 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt currentBit!28 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!70878 true))

(push 1)

(check-sat)

(pop 1)


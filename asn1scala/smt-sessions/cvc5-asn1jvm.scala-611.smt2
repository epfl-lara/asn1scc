; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17414 () Bool)

(assert start!17414)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3951 0))(
  ( (array!3952 (arr!2427 (Array (_ BitVec 32) (_ BitVec 8))) (size!1790 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3142 0))(
  ( (BitStream!3143 (buf!2180 array!3951) (currentByte!4335 (_ BitVec 32)) (currentBit!4330 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3142)

(assert (=> start!17414 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!1790 (buf!2180 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4335 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4330 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!17414 true))

(declare-fun e!56171 () Bool)

(declare-fun inv!12 (BitStream!3142) Bool)

(assert (=> start!17414 (and (inv!12 thiss!1136) e!56171)))

(declare-fun b!84079 () Bool)

(declare-fun array_inv!1636 (array!3951) Bool)

(assert (=> b!84079 (= e!56171 (array_inv!1636 (buf!2180 thiss!1136)))))

(assert (= start!17414 b!84079))

(declare-fun m!130779 () Bool)

(assert (=> start!17414 m!130779))

(declare-fun m!130781 () Bool)

(assert (=> b!84079 m!130781))

(push 1)

(assert (not start!17414))

(assert (not b!84079))

(check-sat)

(pop 1)

(push 1)

(check-sat)


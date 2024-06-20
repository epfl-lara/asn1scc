; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17418 () Bool)

(assert start!17418)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3955 0))(
  ( (array!3956 (arr!2429 (Array (_ BitVec 32) (_ BitVec 8))) (size!1792 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3146 0))(
  ( (BitStream!3147 (buf!2182 array!3955) (currentByte!4337 (_ BitVec 32)) (currentBit!4332 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3146)

(assert (=> start!17418 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!1792 (buf!2182 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4337 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4332 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!17418 true))

(declare-fun e!56183 () Bool)

(declare-fun inv!12 (BitStream!3146) Bool)

(assert (=> start!17418 (and (inv!12 thiss!1136) e!56183)))

(declare-fun b!84085 () Bool)

(declare-fun array_inv!1638 (array!3955) Bool)

(assert (=> b!84085 (= e!56183 (array_inv!1638 (buf!2182 thiss!1136)))))

(assert (= start!17418 b!84085))

(declare-fun m!130787 () Bool)

(assert (=> start!17418 m!130787))

(declare-fun m!130789 () Bool)

(assert (=> b!84085 m!130789))

(push 1)

(assert (not b!84085))

(assert (not start!17418))

(check-sat)

(pop 1)

(push 1)

(check-sat)


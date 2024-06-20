; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54834 () Bool)

(assert start!54834)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-datatypes ((array!13877 0))(
  ( (array!13878 (arr!7077 (Array (_ BitVec 32) (_ BitVec 8))) (size!6090 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11102 0))(
  ( (BitStream!11103 (buf!6612 array!13877) (currentByte!12098 (_ BitVec 32)) (currentBit!12093 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11102)

(assert (=> start!54834 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (bvsle ((_ sign_extend 32) (size!6090 (buf!6612 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12098 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12093 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6090 (buf!6612 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12098 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12093 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54834 true))

(declare-fun e!177930 () Bool)

(declare-fun inv!12 (BitStream!11102) Bool)

(assert (=> start!54834 (and (inv!12 thiss!1754) e!177930)))

(declare-fun b!256708 () Bool)

(declare-fun array_inv!5831 (array!13877) Bool)

(assert (=> b!256708 (= e!177930 (array_inv!5831 (buf!6612 thiss!1754)))))

(assert (= start!54834 b!256708))

(declare-fun m!386313 () Bool)

(assert (=> start!54834 m!386313))

(declare-fun m!386315 () Bool)

(assert (=> b!256708 m!386315))

(push 1)

(assert (not b!256708))

(assert (not start!54834))

(check-sat)

(pop 1)

(push 1)

(check-sat)


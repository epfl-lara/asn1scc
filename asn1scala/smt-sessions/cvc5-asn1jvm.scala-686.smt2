; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19352 () Bool)

(assert start!19352)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4500 0))(
  ( (array!4501 (arr!2652 (Array (_ BitVec 32) (_ BitVec 8))) (size!2059 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3592 0))(
  ( (BitStream!3593 (buf!2405 array!4500) (currentByte!4808 (_ BitVec 32)) (currentBit!4803 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3592)

(assert (=> start!19352 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!2059 (buf!2405 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4808 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4803 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!19352 true))

(declare-fun e!63419 () Bool)

(declare-fun inv!12 (BitStream!3592) Bool)

(assert (=> start!19352 (and (inv!12 thiss!1288) e!63419)))

(declare-fun b!96819 () Bool)

(declare-fun array_inv!1861 (array!4500) Bool)

(assert (=> b!96819 (= e!63419 (array_inv!1861 (buf!2405 thiss!1288)))))

(assert (= start!19352 b!96819))

(declare-fun m!140461 () Bool)

(assert (=> start!19352 m!140461))

(declare-fun m!140463 () Bool)

(assert (=> b!96819 m!140463))

(push 1)

(assert (not b!96819))

(assert (not start!19352))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4670 () Bool)

(assert start!4670)

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1278 0))(
  ( (array!1279 (arr!981 (Array (_ BitVec 32) (_ BitVec 8))) (size!540 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!914 0))(
  ( (BitStream!915 (buf!840 array!1278) (currentByte!2103 (_ BitVec 32)) (currentBit!2098 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!914)

(assert (=> start!4670 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (or (bvsgt ((_ sign_extend 32) (size!540 (buf!840 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!2103 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!2098 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4670 true))

(declare-fun e!12056 () Bool)

(declare-fun inv!12 (BitStream!914) Bool)

(assert (=> start!4670 (and (inv!12 thiss!912) e!12056)))

(declare-fun b!18725 () Bool)

(declare-fun array_inv!510 (array!1278) Bool)

(assert (=> b!18725 (= e!12056 (array_inv!510 (buf!840 thiss!912)))))

(assert (= start!4670 b!18725))

(declare-fun m!25143 () Bool)

(assert (=> start!4670 m!25143))

(declare-fun m!25145 () Bool)

(assert (=> b!18725 m!25145))

(push 1)

(assert (not b!18725))

(assert (not start!4670))

(check-sat)

(pop 1)

(push 1)

(check-sat)


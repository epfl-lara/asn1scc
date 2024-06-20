; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4692 () Bool)

(assert start!4692)

(declare-fun res!16436 () Bool)

(declare-fun e!12082 () Bool)

(assert (=> start!4692 (=> (not res!16436) (not e!12082))))

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1289 0))(
  ( (array!1290 (arr!985 (Array (_ BitVec 32) (_ BitVec 8))) (size!544 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!922 0))(
  ( (BitStream!923 (buf!844 array!1289) (currentByte!2108 (_ BitVec 32)) (currentBit!2103 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!922)

(assert (=> start!4692 (= res!16436 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (bvsle ((_ sign_extend 32) (size!544 (buf!844 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2108 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2103 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!544 (buf!844 thiss!912))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!2108 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!2103 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4692 e!12082))

(assert (=> start!4692 true))

(declare-fun e!12083 () Bool)

(declare-fun inv!12 (BitStream!922) Bool)

(assert (=> start!4692 (and (inv!12 thiss!912) e!12083)))

(declare-fun b!18739 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18739 (= e!12082 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2103 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2108 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (size!544 (buf!844 thiss!912)))))))))

(declare-fun b!18740 () Bool)

(declare-fun array_inv!514 (array!1289) Bool)

(assert (=> b!18740 (= e!12083 (array_inv!514 (buf!844 thiss!912)))))

(assert (= (and start!4692 res!16436) b!18739))

(assert (= start!4692 b!18740))

(declare-fun m!25163 () Bool)

(assert (=> start!4692 m!25163))

(declare-fun m!25165 () Bool)

(assert (=> b!18739 m!25165))

(declare-fun m!25167 () Bool)

(assert (=> b!18740 m!25167))

(push 1)

(assert (not b!18739))

(assert (not b!18740))

(assert (not start!4692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)


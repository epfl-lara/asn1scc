; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4696 () Bool)

(assert start!4696)

(declare-fun res!16442 () Bool)

(declare-fun e!12100 () Bool)

(assert (=> start!4696 (=> (not res!16442) (not e!12100))))

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1293 0))(
  ( (array!1294 (arr!987 (Array (_ BitVec 32) (_ BitVec 8))) (size!546 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!926 0))(
  ( (BitStream!927 (buf!846 array!1293) (currentByte!2110 (_ BitVec 32)) (currentBit!2105 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!926)

(assert (=> start!4696 (= res!16442 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (bvsle ((_ sign_extend 32) (size!546 (buf!846 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2110 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2105 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!546 (buf!846 thiss!912))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!2110 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!2105 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4696 e!12100))

(assert (=> start!4696 true))

(declare-fun e!12101 () Bool)

(declare-fun inv!12 (BitStream!926) Bool)

(assert (=> start!4696 (and (inv!12 thiss!912) e!12101)))

(declare-fun b!18751 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18751 (= e!12100 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2105 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2110 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (size!546 (buf!846 thiss!912)))))))))

(declare-fun b!18752 () Bool)

(declare-fun array_inv!516 (array!1293) Bool)

(assert (=> b!18752 (= e!12101 (array_inv!516 (buf!846 thiss!912)))))

(assert (= (and start!4696 res!16442) b!18751))

(assert (= start!4696 b!18752))

(declare-fun m!25175 () Bool)

(assert (=> start!4696 m!25175))

(declare-fun m!25177 () Bool)

(assert (=> b!18751 m!25177))

(declare-fun m!25179 () Bool)

(assert (=> b!18752 m!25179))

(push 1)

(assert (not start!4696))

(assert (not b!18751))

(assert (not b!18752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)


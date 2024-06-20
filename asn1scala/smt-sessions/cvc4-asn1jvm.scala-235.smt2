; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4676 () Bool)

(assert start!4676)

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1284 0))(
  ( (array!1285 (arr!984 (Array (_ BitVec 32) (_ BitVec 8))) (size!543 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!920 0))(
  ( (BitStream!921 (buf!843 array!1284) (currentByte!2106 (_ BitVec 32)) (currentBit!2101 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!920)

(assert (=> start!4676 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (bvsle ((_ sign_extend 32) (size!543 (buf!843 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2106 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2101 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!543 (buf!843 thiss!912))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!2106 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!2101 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4676 true))

(declare-fun e!12074 () Bool)

(declare-fun inv!12 (BitStream!920) Bool)

(assert (=> start!4676 (and (inv!12 thiss!912) e!12074)))

(declare-fun b!18734 () Bool)

(declare-fun array_inv!513 (array!1284) Bool)

(assert (=> b!18734 (= e!12074 (array_inv!513 (buf!843 thiss!912)))))

(assert (= start!4676 b!18734))

(declare-fun m!25155 () Bool)

(assert (=> start!4676 m!25155))

(declare-fun m!25157 () Bool)

(assert (=> b!18734 m!25157))

(push 1)

(assert (not b!18734))

(assert (not start!4676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)


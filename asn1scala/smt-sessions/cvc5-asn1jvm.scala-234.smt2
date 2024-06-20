; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4666 () Bool)

(assert start!4666)

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1274 0))(
  ( (array!1275 (arr!979 (Array (_ BitVec 32) (_ BitVec 8))) (size!538 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!910 0))(
  ( (BitStream!911 (buf!838 array!1274) (currentByte!2101 (_ BitVec 32)) (currentBit!2096 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!910)

(assert (=> start!4666 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (or (bvsgt ((_ sign_extend 32) (size!538 (buf!838 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!2101 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!2096 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4666 true))

(declare-fun e!12044 () Bool)

(declare-fun inv!12 (BitStream!910) Bool)

(assert (=> start!4666 (and (inv!12 thiss!912) e!12044)))

(declare-fun b!18719 () Bool)

(declare-fun array_inv!508 (array!1274) Bool)

(assert (=> b!18719 (= e!12044 (array_inv!508 (buf!838 thiss!912)))))

(assert (= start!4666 b!18719))

(declare-fun m!25135 () Bool)

(assert (=> start!4666 m!25135))

(declare-fun m!25137 () Bool)

(assert (=> b!18719 m!25137))

(push 1)

(assert (not start!4666))

(assert (not b!18719))

(check-sat)

(pop 1)

(push 1)

(check-sat)


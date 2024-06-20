; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17424 () Bool)

(assert start!17424)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3961 0))(
  ( (array!3962 (arr!2432 (Array (_ BitVec 32) (_ BitVec 8))) (size!1795 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3152 0))(
  ( (BitStream!3153 (buf!2185 array!3961) (currentByte!4340 (_ BitVec 32)) (currentBit!4335 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3152)

(assert (=> start!17424 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1795 (buf!2185 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4340 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4335 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1795 (buf!2185 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4340 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4335 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17424 true))

(declare-fun e!56201 () Bool)

(declare-fun inv!12 (BitStream!3152) Bool)

(assert (=> start!17424 (and (inv!12 thiss!1136) e!56201)))

(declare-fun b!84094 () Bool)

(declare-fun array_inv!1641 (array!3961) Bool)

(assert (=> b!84094 (= e!56201 (array_inv!1641 (buf!2185 thiss!1136)))))

(assert (= start!17424 b!84094))

(declare-fun m!130799 () Bool)

(assert (=> start!17424 m!130799))

(declare-fun m!130801 () Bool)

(assert (=> b!84094 m!130801))

(push 1)

(assert (not b!84094))

(assert (not start!17424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27080 () Bool)


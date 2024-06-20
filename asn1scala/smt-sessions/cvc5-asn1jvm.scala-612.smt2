; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17420 () Bool)

(assert start!17420)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3957 0))(
  ( (array!3958 (arr!2430 (Array (_ BitVec 32) (_ BitVec 8))) (size!1793 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3148 0))(
  ( (BitStream!3149 (buf!2183 array!3957) (currentByte!4338 (_ BitVec 32)) (currentBit!4333 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3148)

(assert (=> start!17420 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1793 (buf!2183 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4338 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4333 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1793 (buf!2183 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4338 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4333 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17420 true))

(declare-fun e!56189 () Bool)

(declare-fun inv!12 (BitStream!3148) Bool)

(assert (=> start!17420 (and (inv!12 thiss!1136) e!56189)))

(declare-fun b!84088 () Bool)

(declare-fun array_inv!1639 (array!3957) Bool)

(assert (=> b!84088 (= e!56189 (array_inv!1639 (buf!2183 thiss!1136)))))

(assert (= start!17420 b!84088))

(declare-fun m!130791 () Bool)

(assert (=> start!17420 m!130791))

(declare-fun m!130793 () Bool)

(assert (=> b!84088 m!130793))

(push 1)

(assert (not start!17420))

(assert (not b!84088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27076 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!27076 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4333 thiss!1136) (currentByte!4338 thiss!1136) (size!1793 (buf!2183 thiss!1136))))))

(declare-fun bs!6692 () Bool)

(assert (= bs!6692 d!27076))

(declare-fun m!130805 () Bool)

(assert (=> bs!6692 m!130805))

(assert (=> start!17420 d!27076))

(declare-fun d!27078 () Bool)

(assert (=> d!27078 (= (array_inv!1639 (buf!2183 thiss!1136)) (bvsge (size!1793 (buf!2183 thiss!1136)) #b00000000000000000000000000000000))))


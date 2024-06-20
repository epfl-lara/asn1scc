; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4672 () Bool)

(assert start!4672)

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1280 0))(
  ( (array!1281 (arr!982 (Array (_ BitVec 32) (_ BitVec 8))) (size!541 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!916 0))(
  ( (BitStream!917 (buf!841 array!1280) (currentByte!2104 (_ BitVec 32)) (currentBit!2099 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!916)

(assert (=> start!4672 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (bvsle ((_ sign_extend 32) (size!541 (buf!841 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2104 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2099 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!541 (buf!841 thiss!912))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!2104 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!2099 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4672 true))

(declare-fun e!12062 () Bool)

(declare-fun inv!12 (BitStream!916) Bool)

(assert (=> start!4672 (and (inv!12 thiss!912) e!12062)))

(declare-fun b!18728 () Bool)

(declare-fun array_inv!511 (array!1280) Bool)

(assert (=> b!18728 (= e!12062 (array_inv!511 (buf!841 thiss!912)))))

(assert (= start!4672 b!18728))

(declare-fun m!25147 () Bool)

(assert (=> start!4672 m!25147))

(declare-fun m!25149 () Bool)

(assert (=> b!18728 m!25149))

(push 1)

(assert (not b!18728))

(assert (not start!4672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6192 () Bool)

(assert (=> d!6192 (= (array_inv!511 (buf!841 thiss!912)) (bvsge (size!541 (buf!841 thiss!912)) #b00000000000000000000000000000000))))

(assert (=> b!18728 d!6192))

(declare-fun d!6196 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6196 (= (inv!12 thiss!912) (invariant!0 (currentBit!2099 thiss!912) (currentByte!2104 thiss!912) (size!541 (buf!841 thiss!912))))))

(declare-fun bs!1783 () Bool)

(assert (= bs!1783 d!6196))

(declare-fun m!25161 () Bool)

(assert (=> bs!1783 m!25161))


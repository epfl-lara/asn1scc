; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31870 () Bool)

(assert start!31870)

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7439 0))(
  ( (array!7440 (arr!4294 (Array (_ BitVec 32) (_ BitVec 8))) (size!3373 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5914 0))(
  ( (BitStream!5915 (buf!3831 array!7439) (currentByte!7037 (_ BitVec 32)) (currentBit!7032 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5914)

(assert (=> start!31870 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3373 (buf!3831 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7037 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7032 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3373 (buf!3831 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7037 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7032 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31870 true))

(declare-fun e!107996 () Bool)

(declare-fun inv!12 (BitStream!5914) Bool)

(assert (=> start!31870 (and (inv!12 thiss!1825) e!107996)))

(declare-fun b!158661 () Bool)

(declare-fun array_inv!3120 (array!7439) Bool)

(assert (=> b!158661 (= e!107996 (array_inv!3120 (buf!3831 thiss!1825)))))

(assert (= start!31870 b!158661))

(declare-fun m!249197 () Bool)

(assert (=> start!31870 m!249197))

(declare-fun m!249199 () Bool)

(assert (=> b!158661 m!249199))

(push 1)

(assert (not b!158661))

(assert (not start!31870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53283 () Bool)

(assert (=> d!53283 (= (array_inv!3120 (buf!3831 thiss!1825)) (bvsge (size!3373 (buf!3831 thiss!1825)) #b00000000000000000000000000000000))))

(assert (=> b!158661 d!53283))

(declare-fun d!53285 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53285 (= (inv!12 thiss!1825) (invariant!0 (currentBit!7032 thiss!1825) (currentByte!7037 thiss!1825) (size!3373 (buf!3831 thiss!1825))))))

(declare-fun bs!13152 () Bool)

(assert (= bs!13152 d!53285))


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31982 () Bool)

(assert start!31982)

(declare-datatypes ((array!7471 0))(
  ( (array!7472 (arr!4308 (Array (_ BitVec 32) (_ BitVec 8))) (size!3387 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5942 0))(
  ( (BitStream!5943 (buf!3845 array!7471) (currentByte!7055 (_ BitVec 32)) (currentBit!7050 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5942)

(assert (=> start!31982 (and (bvsle ((_ sign_extend 32) (size!3387 (buf!3845 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7055 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7050 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3387 (buf!3845 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7055 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7050 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!108098 () Bool)

(declare-fun inv!12 (BitStream!5942) Bool)

(assert (=> start!31982 (and (inv!12 thiss!1602) e!108098)))

(declare-fun b!158730 () Bool)

(declare-fun array_inv!3134 (array!7471) Bool)

(assert (=> b!158730 (= e!108098 (array_inv!3134 (buf!3845 thiss!1602)))))

(assert (= start!31982 b!158730))

(declare-fun m!249285 () Bool)

(assert (=> start!31982 m!249285))

(declare-fun m!249287 () Bool)

(assert (=> b!158730 m!249287))

(push 1)

(assert (not b!158730))

(assert (not start!31982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53347 () Bool)

(assert (=> d!53347 (= (array_inv!3134 (buf!3845 thiss!1602)) (bvsge (size!3387 (buf!3845 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158730 d!53347))

(declare-fun d!53349 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)


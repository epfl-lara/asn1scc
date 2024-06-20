; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31978 () Bool)

(assert start!31978)

(declare-datatypes ((array!7467 0))(
  ( (array!7468 (arr!4306 (Array (_ BitVec 32) (_ BitVec 8))) (size!3385 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5938 0))(
  ( (BitStream!5939 (buf!3843 array!7467) (currentByte!7053 (_ BitVec 32)) (currentBit!7048 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5938)

(assert (=> start!31978 (and (bvsle ((_ sign_extend 32) (size!3385 (buf!3843 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7053 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7048 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3385 (buf!3843 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7053 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7048 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!108086 () Bool)

(declare-fun inv!12 (BitStream!5938) Bool)

(assert (=> start!31978 (and (inv!12 thiss!1602) e!108086)))

(declare-fun b!158724 () Bool)

(declare-fun array_inv!3132 (array!7467) Bool)

(assert (=> b!158724 (= e!108086 (array_inv!3132 (buf!3843 thiss!1602)))))

(assert (= start!31978 b!158724))

(declare-fun m!249277 () Bool)

(assert (=> start!31978 m!249277))

(declare-fun m!249279 () Bool)

(assert (=> b!158724 m!249279))

(push 1)

(assert (not b!158724))

(assert (not start!31978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53341 () Bool)

(assert (=> d!53341 (= (array_inv!3132 (buf!3843 thiss!1602)) (bvsge (size!3385 (buf!3843 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158724 d!53341))

(declare-fun d!53345 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53345 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7048 thiss!1602) (currentByte!7053 thiss!1602) (size!3385 (buf!3843 thiss!1602))))))

(declare-fun bs!13198 () Bool)

(assert (= bs!13198 d!53345))

(declare-fun m!249291 () Bool)

(assert (=> bs!13198 m!249291))

(assert (=> start!31978 d!53345))

(push 1)

(assert (not d!53345))

(check-sat)

(pop 1)

(push 1)

(check-sat)


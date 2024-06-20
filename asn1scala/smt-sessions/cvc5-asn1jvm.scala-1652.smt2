; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46140 () Bool)

(assert start!46140)

(declare-datatypes ((array!10849 0))(
  ( (array!10850 (arr!5692 (Array (_ BitVec 32) (_ BitVec 8))) (size!4762 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8632 0))(
  ( (BitStream!8633 (buf!5309 array!10849) (currentByte!9968 (_ BitVec 32)) (currentBit!9963 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8632)

(declare-fun arr!318 () array!10849)

(declare-fun to!537 () (_ BitVec 32))

(declare-fun i!769 () (_ BitVec 32))

(assert (=> start!46140 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4762 arr!318)) (bvsle ((_ sign_extend 32) (size!4762 (buf!5309 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9968 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9963 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4762 (buf!5309 thiss!1888))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9968 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9963 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46140 true))

(declare-fun array_inv!4503 (array!10849) Bool)

(assert (=> start!46140 (array_inv!4503 arr!318)))

(declare-fun e!151186 () Bool)

(declare-fun inv!12 (BitStream!8632) Bool)

(assert (=> start!46140 (and (inv!12 thiss!1888) e!151186)))

(declare-fun b!222501 () Bool)

(assert (=> b!222501 (= e!151186 (array_inv!4503 (buf!5309 thiss!1888)))))

(assert (= start!46140 b!222501))

(declare-fun m!340747 () Bool)

(assert (=> start!46140 m!340747))

(declare-fun m!340749 () Bool)

(assert (=> start!46140 m!340749))

(declare-fun m!340751 () Bool)

(assert (=> b!222501 m!340751))

(push 1)

(assert (not start!46140))

(assert (not b!222501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75283 () Bool)

(assert (=> d!75283 (= (array_inv!4503 arr!318) (bvsge (size!4762 arr!318) #b00000000000000000000000000000000))))

(assert (=> start!46140 d!75283))

(declare-fun d!75285 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75285 (= (inv!12 thiss!1888) (invariant!0 (currentBit!9963 thiss!1888) (currentByte!9968 thiss!1888) (size!4762 (buf!5309 thiss!1888))))))

(declare-fun bs!18350 () Bool)

(assert (= bs!18350 d!75285))

(declare-fun m!340767 () Bool)

(assert (=> bs!18350 m!340767))

(assert (=> start!46140 d!75285))

(declare-fun d!75287 () Bool)

(assert (=> d!75287 (= (array_inv!4503 (buf!5309 thiss!1888)) (bvsge (size!4762 (buf!5309 thiss!1888)) #b00000000000000000000000000000000))))

(assert (=> b!222501 d!75287))

(push 1)

(assert (not d!75285))

(check-sat)

(pop 1)

(push 1)

(check-sat)


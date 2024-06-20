; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38346 () Bool)

(assert start!38346)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9237 0))(
  ( (array!9238 (arr!5008 (Array (_ BitVec 32) (_ BitVec 8))) (size!4078 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7264 0))(
  ( (BitStream!7265 (buf!4506 array!9237) (currentByte!8573 (_ BitVec 32)) (currentBit!8568 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7264)

(assert (=> start!38346 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4078 (buf!4506 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8573 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8568 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4078 (buf!4506 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8573 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8568 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38346 true))

(declare-fun e!120390 () Bool)

(declare-fun inv!12 (BitStream!7264) Bool)

(assert (=> start!38346 (and (inv!12 thiss!1187) e!120390)))

(declare-fun b!172314 () Bool)

(declare-fun array_inv!3819 (array!9237) Bool)

(assert (=> b!172314 (= e!120390 (array_inv!3819 (buf!4506 thiss!1187)))))

(assert (= start!38346 b!172314))

(declare-fun m!271451 () Bool)

(assert (=> start!38346 m!271451))

(declare-fun m!271453 () Bool)

(assert (=> b!172314 m!271453))

(push 1)

(assert (not b!172314))

(assert (not start!38346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61077 () Bool)

(assert (=> d!61077 (= (array_inv!3819 (buf!4506 thiss!1187)) (bvsge (size!4078 (buf!4506 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!172314 d!61077))

(declare-fun d!61079 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61079 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8568 thiss!1187) (currentByte!8573 thiss!1187) (size!4078 (buf!4506 thiss!1187))))))

(declare-fun bs!15193 () Bool)

(assert (= bs!15193 d!61079))

(declare-fun m!271465 () Bool)

(assert (=> bs!15193 m!271465))

(assert (=> start!38346 d!61079))

(push 1)

(assert (not d!61079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61087 () Bool)

(assert (=> d!61087 (= (invariant!0 (currentBit!8568 thiss!1187) (currentByte!8573 thiss!1187) (size!4078 (buf!4506 thiss!1187))) (and (bvsge (currentBit!8568 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8568 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8573 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8573 thiss!1187) (size!4078 (buf!4506 thiss!1187))) (and (= (currentBit!8568 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8573 thiss!1187) (size!4078 (buf!4506 thiss!1187)))))))))

(assert (=> d!61079 d!61087))

(push 1)

(check-sat)


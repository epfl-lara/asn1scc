; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38586 () Bool)

(assert start!38586)

(declare-fun res!143820 () Bool)

(declare-fun e!121181 () Bool)

(assert (=> start!38586 (=> (not res!143820) (not e!121181))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38586 (= res!143820 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38586 e!121181))

(assert (=> start!38586 true))

(declare-datatypes ((array!9341 0))(
  ( (array!9342 (arr!5053 (Array (_ BitVec 32) (_ BitVec 8))) (size!4123 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7354 0))(
  ( (BitStream!7355 (buf!4554 array!9341) (currentByte!8647 (_ BitVec 32)) (currentBit!8642 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7354)

(declare-fun e!121182 () Bool)

(declare-fun inv!12 (BitStream!7354) Bool)

(assert (=> start!38586 (and (inv!12 thiss!1187) e!121182)))

(declare-fun b!173644 () Bool)

(declare-fun res!143819 () Bool)

(assert (=> b!173644 (=> (not res!143819) (not e!121181))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173644 (= res!143819 (validate_offset_bits!1 ((_ sign_extend 32) (size!4123 (buf!4554 thiss!1187))) ((_ sign_extend 32) (currentByte!8647 thiss!1187)) ((_ sign_extend 32) (currentBit!8642 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173645 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173645 (= e!121181 (not (invariant!0 (currentBit!8642 thiss!1187) (currentByte!8647 thiss!1187) (size!4123 (buf!4554 thiss!1187)))))))

(declare-fun b!173646 () Bool)

(declare-fun array_inv!3864 (array!9341) Bool)

(assert (=> b!173646 (= e!121182 (array_inv!3864 (buf!4554 thiss!1187)))))

(assert (= (and start!38586 res!143820) b!173644))

(assert (= (and b!173644 res!143819) b!173645))

(assert (= start!38586 b!173646))

(declare-fun m!272913 () Bool)

(assert (=> start!38586 m!272913))

(declare-fun m!272915 () Bool)

(assert (=> b!173644 m!272915))

(declare-fun m!272917 () Bool)

(assert (=> b!173645 m!272917))

(declare-fun m!272919 () Bool)

(assert (=> b!173646 m!272919))

(push 1)

(assert (not b!173646))

(assert (not b!173645))

(assert (not b!173644))

(assert (not start!38586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61291 () Bool)

(assert (=> d!61291 (= (array_inv!3864 (buf!4554 thiss!1187)) (bvsge (size!4123 (buf!4554 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173646 d!61291))

(declare-fun d!61295 () Bool)

(assert (=> d!61295 (= (invariant!0 (currentBit!8642 thiss!1187) (currentByte!8647 thiss!1187) (size!4123 (buf!4554 thiss!1187))) (and (bvsge (currentBit!8642 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8642 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8647 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8647 thiss!1187) (size!4123 (buf!4554 thiss!1187))) (and (= (currentBit!8642 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8647 thiss!1187) (size!4123 (buf!4554 thiss!1187)))))))))

(assert (=> b!173645 d!61295))

(declare-fun d!61299 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61299 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4123 (buf!4554 thiss!1187))) ((_ sign_extend 32) (currentByte!8647 thiss!1187)) ((_ sign_extend 32) (currentBit!8642 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4123 (buf!4554 thiss!1187))) ((_ sign_extend 32) (currentByte!8647 thiss!1187)) ((_ sign_extend 32) (currentBit!8642 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15269 () Bool)

(assert (= bs!15269 d!61299))

(declare-fun m!272939 () Bool)

(assert (=> bs!15269 m!272939))

(assert (=> b!173644 d!61299))

(declare-fun d!61305 () Bool)

(assert (=> d!61305 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8642 thiss!1187) (currentByte!8647 thiss!1187) (size!4123 (buf!4554 thiss!1187))))))

(declare-fun bs!15271 () Bool)

(assert (= bs!15271 d!61305))

(assert (=> bs!15271 m!272917))

(assert (=> start!38586 d!61305))

(push 1)

(assert (not d!61299))

(assert (not d!61305))

(check-sat)

(pop 1)


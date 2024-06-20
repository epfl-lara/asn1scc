; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38348 () Bool)

(assert start!38348)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9239 0))(
  ( (array!9240 (arr!5009 (Array (_ BitVec 32) (_ BitVec 8))) (size!4079 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7266 0))(
  ( (BitStream!7267 (buf!4507 array!9239) (currentByte!8574 (_ BitVec 32)) (currentBit!8569 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7266)

(assert (=> start!38348 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4079 (buf!4507 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8574 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8569 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4079 (buf!4507 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8574 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8569 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38348 true))

(declare-fun e!120396 () Bool)

(declare-fun inv!12 (BitStream!7266) Bool)

(assert (=> start!38348 (and (inv!12 thiss!1187) e!120396)))

(declare-fun b!172317 () Bool)

(declare-fun array_inv!3820 (array!9239) Bool)

(assert (=> b!172317 (= e!120396 (array_inv!3820 (buf!4507 thiss!1187)))))

(assert (= start!38348 b!172317))

(declare-fun m!271455 () Bool)

(assert (=> start!38348 m!271455))

(declare-fun m!271457 () Bool)

(assert (=> b!172317 m!271457))

(check-sat (not start!38348) (not b!172317))
(check-sat)
(get-model)

(declare-fun d!61075 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61075 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8569 thiss!1187) (currentByte!8574 thiss!1187) (size!4079 (buf!4507 thiss!1187))))))

(declare-fun bs!15192 () Bool)

(assert (= bs!15192 d!61075))

(declare-fun m!271463 () Bool)

(assert (=> bs!15192 m!271463))

(assert (=> start!38348 d!61075))

(declare-fun d!61081 () Bool)

(assert (=> d!61081 (= (array_inv!3820 (buf!4507 thiss!1187)) (bvsge (size!4079 (buf!4507 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!172317 d!61081))

(check-sat (not d!61075))
(check-sat)
(get-model)

(declare-fun d!61089 () Bool)

(assert (=> d!61089 (= (invariant!0 (currentBit!8569 thiss!1187) (currentByte!8574 thiss!1187) (size!4079 (buf!4507 thiss!1187))) (and (bvsge (currentBit!8569 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8569 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8574 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8574 thiss!1187) (size!4079 (buf!4507 thiss!1187))) (and (= (currentBit!8569 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8574 thiss!1187) (size!4079 (buf!4507 thiss!1187)))))))))

(assert (=> d!61075 d!61089))

(check-sat)

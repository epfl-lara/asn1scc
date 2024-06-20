; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46142 () Bool)

(assert start!46142)

(declare-datatypes ((array!10851 0))(
  ( (array!10852 (arr!5693 (Array (_ BitVec 32) (_ BitVec 8))) (size!4763 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8634 0))(
  ( (BitStream!8635 (buf!5310 array!10851) (currentByte!9969 (_ BitVec 32)) (currentBit!9964 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8634)

(declare-fun arr!318 () array!10851)

(declare-fun to!537 () (_ BitVec 32))

(declare-fun i!769 () (_ BitVec 32))

(assert (=> start!46142 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4763 arr!318)) (bvsle ((_ sign_extend 32) (size!4763 (buf!5310 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9969 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9964 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4763 (buf!5310 thiss!1888))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9969 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9964 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46142 true))

(declare-fun array_inv!4504 (array!10851) Bool)

(assert (=> start!46142 (array_inv!4504 arr!318)))

(declare-fun e!151195 () Bool)

(declare-fun inv!12 (BitStream!8634) Bool)

(assert (=> start!46142 (and (inv!12 thiss!1888) e!151195)))

(declare-fun b!222504 () Bool)

(assert (=> b!222504 (= e!151195 (array_inv!4504 (buf!5310 thiss!1888)))))

(assert (= start!46142 b!222504))

(declare-fun m!340753 () Bool)

(assert (=> start!46142 m!340753))

(declare-fun m!340755 () Bool)

(assert (=> start!46142 m!340755))

(declare-fun m!340757 () Bool)

(assert (=> b!222504 m!340757))

(check-sat (not start!46142) (not b!222504))
(check-sat)
(get-model)

(declare-fun d!75277 () Bool)

(assert (=> d!75277 (= (array_inv!4504 arr!318) (bvsge (size!4763 arr!318) #b00000000000000000000000000000000))))

(assert (=> start!46142 d!75277))

(declare-fun d!75279 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75279 (= (inv!12 thiss!1888) (invariant!0 (currentBit!9964 thiss!1888) (currentByte!9969 thiss!1888) (size!4763 (buf!5310 thiss!1888))))))

(declare-fun bs!18349 () Bool)

(assert (= bs!18349 d!75279))

(declare-fun m!340765 () Bool)

(assert (=> bs!18349 m!340765))

(assert (=> start!46142 d!75279))

(declare-fun d!75281 () Bool)

(assert (=> d!75281 (= (array_inv!4504 (buf!5310 thiss!1888)) (bvsge (size!4763 (buf!5310 thiss!1888)) #b00000000000000000000000000000000))))

(assert (=> b!222504 d!75281))

(check-sat (not d!75279))
(check-sat)
(get-model)

(declare-fun d!75289 () Bool)

(assert (=> d!75289 (= (invariant!0 (currentBit!9964 thiss!1888) (currentByte!9969 thiss!1888) (size!4763 (buf!5310 thiss!1888))) (and (bvsge (currentBit!9964 thiss!1888) #b00000000000000000000000000000000) (bvslt (currentBit!9964 thiss!1888) #b00000000000000000000000000001000) (bvsge (currentByte!9969 thiss!1888) #b00000000000000000000000000000000) (or (bvslt (currentByte!9969 thiss!1888) (size!4763 (buf!5310 thiss!1888))) (and (= (currentBit!9964 thiss!1888) #b00000000000000000000000000000000) (= (currentByte!9969 thiss!1888) (size!4763 (buf!5310 thiss!1888)))))))))

(assert (=> d!75279 d!75289))

(check-sat)

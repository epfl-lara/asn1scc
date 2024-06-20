; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46186 () Bool)

(assert start!46186)

(declare-datatypes ((array!10880 0))(
  ( (array!10881 (arr!5705 (Array (_ BitVec 32) (_ BitVec 8))) (size!4775 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10880)

(declare-datatypes ((BitStream!8652 0))(
  ( (BitStream!8653 (buf!5319 array!10880) (currentByte!9980 (_ BitVec 32)) (currentBit!9975 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8652)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46186 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4775 arr!308)) (bvsle ((_ sign_extend 32) (size!4775 (buf!5319 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9980 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9975 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4775 (buf!5319 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9980 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9975 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46186 true))

(declare-fun array_inv!4516 (array!10880) Bool)

(assert (=> start!46186 (array_inv!4516 arr!308)))

(declare-fun e!151294 () Bool)

(declare-fun inv!12 (BitStream!8652) Bool)

(assert (=> start!46186 (and (inv!12 thiss!1870) e!151294)))

(declare-fun b!222540 () Bool)

(assert (=> b!222540 (= e!151294 (array_inv!4516 (buf!5319 thiss!1870)))))

(assert (= start!46186 b!222540))

(declare-fun m!340825 () Bool)

(assert (=> start!46186 m!340825))

(declare-fun m!340827 () Bool)

(assert (=> start!46186 m!340827))

(declare-fun m!340829 () Bool)

(assert (=> b!222540 m!340829))

(check-sat (not b!222540) (not start!46186))
(check-sat)
(get-model)

(declare-fun d!75311 () Bool)

(assert (=> d!75311 (= (array_inv!4516 (buf!5319 thiss!1870)) (bvsge (size!4775 (buf!5319 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222540 d!75311))

(declare-fun d!75313 () Bool)

(assert (=> d!75313 (= (array_inv!4516 arr!308) (bvsge (size!4775 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46186 d!75313))

(declare-fun d!75315 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75315 (= (inv!12 thiss!1870) (invariant!0 (currentBit!9975 thiss!1870) (currentByte!9980 thiss!1870) (size!4775 (buf!5319 thiss!1870))))))

(declare-fun bs!18367 () Bool)

(assert (= bs!18367 d!75315))

(declare-fun m!340837 () Bool)

(assert (=> bs!18367 m!340837))

(assert (=> start!46186 d!75315))

(check-sat (not d!75315))
(check-sat)
(get-model)

(declare-fun d!75323 () Bool)

(assert (=> d!75323 (= (invariant!0 (currentBit!9975 thiss!1870) (currentByte!9980 thiss!1870) (size!4775 (buf!5319 thiss!1870))) (and (bvsge (currentBit!9975 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!9975 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!9980 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!9980 thiss!1870) (size!4775 (buf!5319 thiss!1870))) (and (= (currentBit!9975 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!9980 thiss!1870) (size!4775 (buf!5319 thiss!1870)))))))))

(assert (=> d!75315 d!75323))

(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46184 () Bool)

(assert start!46184)

(declare-datatypes ((array!10878 0))(
  ( (array!10879 (arr!5704 (Array (_ BitVec 32) (_ BitVec 8))) (size!4774 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10878)

(declare-datatypes ((BitStream!8650 0))(
  ( (BitStream!8651 (buf!5318 array!10878) (currentByte!9979 (_ BitVec 32)) (currentBit!9974 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8650)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46184 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4774 arr!308)) (bvsle ((_ sign_extend 32) (size!4774 (buf!5318 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9979 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9974 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4774 (buf!5318 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9979 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9974 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46184 true))

(declare-fun array_inv!4515 (array!10878) Bool)

(assert (=> start!46184 (array_inv!4515 arr!308)))

(declare-fun e!151285 () Bool)

(declare-fun inv!12 (BitStream!8650) Bool)

(assert (=> start!46184 (and (inv!12 thiss!1870) e!151285)))

(declare-fun b!222537 () Bool)

(assert (=> b!222537 (= e!151285 (array_inv!4515 (buf!5318 thiss!1870)))))

(assert (= start!46184 b!222537))

(declare-fun m!340819 () Bool)

(assert (=> start!46184 m!340819))

(declare-fun m!340821 () Bool)

(assert (=> start!46184 m!340821))

(declare-fun m!340823 () Bool)

(assert (=> b!222537 m!340823))

(push 1)

(assert (not start!46184))

(assert (not b!222537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75317 () Bool)

(assert (=> d!75317 (= (array_inv!4515 arr!308) (bvsge (size!4774 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46184 d!75317))

(declare-fun d!75319 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75319 (= (inv!12 thiss!1870) (invariant!0 (currentBit!9974 thiss!1870) (currentByte!9979 thiss!1870) (size!4774 (buf!5318 thiss!1870))))))

(declare-fun bs!18368 () Bool)

(assert (= bs!18368 d!75319))

(declare-fun m!340839 () Bool)

(assert (=> bs!18368 m!340839))

(assert (=> start!46184 d!75319))

(declare-fun d!75321 () Bool)

(assert (=> d!75321 (= (array_inv!4515 (buf!5318 thiss!1870)) (bvsge (size!4774 (buf!5318 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222537 d!75321))

(push 1)

(assert (not d!75319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)


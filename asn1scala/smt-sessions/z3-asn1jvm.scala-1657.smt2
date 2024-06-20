; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46202 () Bool)

(assert start!46202)

(declare-fun res!186849 () Bool)

(declare-fun e!151327 () Bool)

(assert (=> start!46202 (=> (not res!186849) (not e!151327))))

(declare-datatypes ((array!10888 0))(
  ( (array!10889 (arr!5708 (Array (_ BitVec 32) (_ BitVec 8))) (size!4778 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10888)

(declare-datatypes ((BitStream!8658 0))(
  ( (BitStream!8659 (buf!5322 array!10888) (currentByte!9984 (_ BitVec 32)) (currentBit!9979 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8658)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46202 (= res!186849 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4778 arr!308)) (bvsle ((_ sign_extend 32) (size!4778 (buf!5322 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9984 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9979 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4778 (buf!5322 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9984 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9979 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46202 e!151327))

(assert (=> start!46202 true))

(declare-fun array_inv!4519 (array!10888) Bool)

(assert (=> start!46202 (array_inv!4519 arr!308)))

(declare-fun e!151328 () Bool)

(declare-fun inv!12 (BitStream!8658) Bool)

(assert (=> start!46202 (and (inv!12 thiss!1870) e!151328)))

(declare-fun b!222554 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222554 (= e!151327 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9979 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9984 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (size!4778 (buf!5322 thiss!1870)))))))))

(declare-fun b!222555 () Bool)

(assert (=> b!222555 (= e!151328 (array_inv!4519 (buf!5322 thiss!1870)))))

(assert (= (and start!46202 res!186849) b!222554))

(assert (= start!46202 b!222555))

(declare-fun m!340849 () Bool)

(assert (=> start!46202 m!340849))

(declare-fun m!340851 () Bool)

(assert (=> start!46202 m!340851))

(declare-fun m!340853 () Bool)

(assert (=> b!222554 m!340853))

(declare-fun m!340855 () Bool)

(assert (=> b!222555 m!340855))

(check-sat (not b!222554) (not b!222555) (not start!46202))
(check-sat)
(get-model)

(declare-fun d!75327 () Bool)

(assert (=> d!75327 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9979 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9984 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (size!4778 (buf!5322 thiss!1870))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9979 thiss!1870))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9979 thiss!1870))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9984 thiss!1870))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9984 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (size!4778 (buf!5322 thiss!1870))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9979 thiss!1870))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9984 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (size!4778 (buf!5322 thiss!1870)))))))))))

(assert (=> b!222554 d!75327))

(declare-fun d!75329 () Bool)

(assert (=> d!75329 (= (array_inv!4519 (buf!5322 thiss!1870)) (bvsge (size!4778 (buf!5322 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222555 d!75329))

(declare-fun d!75331 () Bool)

(assert (=> d!75331 (= (array_inv!4519 arr!308) (bvsge (size!4778 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46202 d!75331))

(declare-fun d!75333 () Bool)

(assert (=> d!75333 (= (inv!12 thiss!1870) (invariant!0 (currentBit!9979 thiss!1870) (currentByte!9984 thiss!1870) (size!4778 (buf!5322 thiss!1870))))))

(declare-fun bs!18372 () Bool)

(assert (= bs!18372 d!75333))

(declare-fun m!340865 () Bool)

(assert (=> bs!18372 m!340865))

(assert (=> start!46202 d!75333))

(check-sat (not d!75333))
(check-sat)

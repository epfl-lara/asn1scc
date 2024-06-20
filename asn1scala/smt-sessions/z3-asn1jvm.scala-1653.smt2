; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46160 () Bool)

(assert start!46160)

(declare-fun res!186840 () Bool)

(declare-fun e!151228 () Bool)

(assert (=> start!46160 (=> (not res!186840) (not e!151228))))

(declare-datatypes ((array!10860 0))(
  ( (array!10861 (arr!5696 (Array (_ BitVec 32) (_ BitVec 8))) (size!4766 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8640 0))(
  ( (BitStream!8641 (buf!5313 array!10860) (currentByte!9973 (_ BitVec 32)) (currentBit!9968 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8640)

(declare-fun arr!318 () array!10860)

(declare-fun to!537 () (_ BitVec 32))

(declare-fun i!769 () (_ BitVec 32))

(assert (=> start!46160 (= res!186840 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4766 arr!318)) (bvsle ((_ sign_extend 32) (size!4766 (buf!5313 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9973 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9968 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4766 (buf!5313 thiss!1888))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9973 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9968 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46160 e!151228))

(assert (=> start!46160 true))

(declare-fun array_inv!4507 (array!10860) Bool)

(assert (=> start!46160 (array_inv!4507 arr!318)))

(declare-fun e!151227 () Bool)

(declare-fun inv!12 (BitStream!8640) Bool)

(assert (=> start!46160 (and (inv!12 thiss!1888) e!151227)))

(declare-fun b!222518 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222518 (= e!151228 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9968 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9973 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (size!4766 (buf!5313 thiss!1888)))))))))

(declare-fun b!222519 () Bool)

(assert (=> b!222519 (= e!151227 (array_inv!4507 (buf!5313 thiss!1888)))))

(assert (= (and start!46160 res!186840) b!222518))

(assert (= start!46160 b!222519))

(declare-fun m!340777 () Bool)

(assert (=> start!46160 m!340777))

(declare-fun m!340779 () Bool)

(assert (=> start!46160 m!340779))

(declare-fun m!340781 () Bool)

(assert (=> b!222518 m!340781))

(declare-fun m!340783 () Bool)

(assert (=> b!222519 m!340783))

(check-sat (not b!222518) (not start!46160) (not b!222519))
(check-sat)
(get-model)

(declare-fun d!75295 () Bool)

(assert (=> d!75295 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9968 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9973 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (size!4766 (buf!5313 thiss!1888))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9968 thiss!1888))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9968 thiss!1888))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9973 thiss!1888))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9973 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (size!4766 (buf!5313 thiss!1888))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9968 thiss!1888))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9973 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (size!4766 (buf!5313 thiss!1888)))))))))))

(assert (=> b!222518 d!75295))

(declare-fun d!75297 () Bool)

(assert (=> d!75297 (= (array_inv!4507 arr!318) (bvsge (size!4766 arr!318) #b00000000000000000000000000000000))))

(assert (=> start!46160 d!75297))

(declare-fun d!75299 () Bool)

(assert (=> d!75299 (= (inv!12 thiss!1888) (invariant!0 (currentBit!9968 thiss!1888) (currentByte!9973 thiss!1888) (size!4766 (buf!5313 thiss!1888))))))

(declare-fun bs!18354 () Bool)

(assert (= bs!18354 d!75299))

(declare-fun m!340793 () Bool)

(assert (=> bs!18354 m!340793))

(assert (=> start!46160 d!75299))

(declare-fun d!75301 () Bool)

(assert (=> d!75301 (= (array_inv!4507 (buf!5313 thiss!1888)) (bvsge (size!4766 (buf!5313 thiss!1888)) #b00000000000000000000000000000000))))

(assert (=> b!222519 d!75301))

(check-sat (not d!75299))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38372 () Bool)

(assert start!38372)

(declare-fun res!142755 () Bool)

(declare-fun e!120419 () Bool)

(assert (=> start!38372 (=> (not res!142755) (not e!120419))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9248 0))(
  ( (array!9249 (arr!5012 (Array (_ BitVec 32) (_ BitVec 8))) (size!4082 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7272 0))(
  ( (BitStream!7273 (buf!4510 array!9248) (currentByte!8580 (_ BitVec 32)) (currentBit!8575 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7272)

(assert (=> start!38372 (= res!142755 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4082 (buf!4510 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8580 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8575 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4082 (buf!4510 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8580 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8575 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38372 e!120419))

(assert (=> start!38372 true))

(declare-fun e!120420 () Bool)

(declare-fun inv!12 (BitStream!7272) Bool)

(assert (=> start!38372 (and (inv!12 thiss!1187) e!120420)))

(declare-fun b!172331 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172331 (= e!120419 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8575 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8580 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4082 (buf!4510 thiss!1187)))))))))

(declare-fun b!172332 () Bool)

(declare-fun array_inv!3823 (array!9248) Bool)

(assert (=> b!172332 (= e!120420 (array_inv!3823 (buf!4510 thiss!1187)))))

(assert (= (and start!38372 res!142755) b!172331))

(assert (= start!38372 b!172332))

(declare-fun m!271475 () Bool)

(assert (=> start!38372 m!271475))

(declare-fun m!271477 () Bool)

(assert (=> b!172331 m!271477))

(declare-fun m!271479 () Bool)

(assert (=> b!172332 m!271479))

(check-sat (not b!172332) (not b!172331) (not start!38372))
(check-sat)
(get-model)

(declare-fun d!61095 () Bool)

(assert (=> d!61095 (= (array_inv!3823 (buf!4510 thiss!1187)) (bvsge (size!4082 (buf!4510 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!172332 d!61095))

(declare-fun d!61097 () Bool)

(assert (=> d!61097 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8575 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8580 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4082 (buf!4510 thiss!1187))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8575 thiss!1187))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8575 thiss!1187))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8580 thiss!1187))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8580 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4082 (buf!4510 thiss!1187))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8575 thiss!1187))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8580 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4082 (buf!4510 thiss!1187)))))))))))

(assert (=> b!172331 d!61097))

(declare-fun d!61099 () Bool)

(assert (=> d!61099 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8575 thiss!1187) (currentByte!8580 thiss!1187) (size!4082 (buf!4510 thiss!1187))))))

(declare-fun bs!15198 () Bool)

(assert (= bs!15198 d!61099))

(declare-fun m!271487 () Bool)

(assert (=> bs!15198 m!271487))

(assert (=> start!38372 d!61099))

(check-sat (not d!61099))
(check-sat)

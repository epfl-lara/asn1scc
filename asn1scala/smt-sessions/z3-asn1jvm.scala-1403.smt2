; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38588 () Bool)

(assert start!38588)

(declare-fun res!143825 () Bool)

(declare-fun e!121192 () Bool)

(assert (=> start!38588 (=> (not res!143825) (not e!121192))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38588 (= res!143825 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38588 e!121192))

(assert (=> start!38588 true))

(declare-datatypes ((array!9343 0))(
  ( (array!9344 (arr!5054 (Array (_ BitVec 32) (_ BitVec 8))) (size!4124 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7356 0))(
  ( (BitStream!7357 (buf!4555 array!9343) (currentByte!8648 (_ BitVec 32)) (currentBit!8643 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7356)

(declare-fun e!121191 () Bool)

(declare-fun inv!12 (BitStream!7356) Bool)

(assert (=> start!38588 (and (inv!12 thiss!1187) e!121191)))

(declare-fun b!173653 () Bool)

(declare-fun res!143826 () Bool)

(assert (=> b!173653 (=> (not res!143826) (not e!121192))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173653 (= res!143826 (validate_offset_bits!1 ((_ sign_extend 32) (size!4124 (buf!4555 thiss!1187))) ((_ sign_extend 32) (currentByte!8648 thiss!1187)) ((_ sign_extend 32) (currentBit!8643 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173654 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173654 (= e!121192 (not (invariant!0 (currentBit!8643 thiss!1187) (currentByte!8648 thiss!1187) (size!4124 (buf!4555 thiss!1187)))))))

(declare-fun b!173655 () Bool)

(declare-fun array_inv!3865 (array!9343) Bool)

(assert (=> b!173655 (= e!121191 (array_inv!3865 (buf!4555 thiss!1187)))))

(assert (= (and start!38588 res!143825) b!173653))

(assert (= (and b!173653 res!143826) b!173654))

(assert (= start!38588 b!173655))

(declare-fun m!272921 () Bool)

(assert (=> start!38588 m!272921))

(declare-fun m!272923 () Bool)

(assert (=> b!173653 m!272923))

(declare-fun m!272925 () Bool)

(assert (=> b!173654 m!272925))

(declare-fun m!272927 () Bool)

(assert (=> b!173655 m!272927))

(check-sat (not b!173655) (not b!173654) (not b!173653) (not start!38588))
(check-sat)
(get-model)

(declare-fun d!61289 () Bool)

(assert (=> d!61289 (= (array_inv!3865 (buf!4555 thiss!1187)) (bvsge (size!4124 (buf!4555 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173655 d!61289))

(declare-fun d!61293 () Bool)

(assert (=> d!61293 (= (invariant!0 (currentBit!8643 thiss!1187) (currentByte!8648 thiss!1187) (size!4124 (buf!4555 thiss!1187))) (and (bvsge (currentBit!8643 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8643 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8648 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8648 thiss!1187) (size!4124 (buf!4555 thiss!1187))) (and (= (currentBit!8643 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8648 thiss!1187) (size!4124 (buf!4555 thiss!1187)))))))))

(assert (=> b!173654 d!61293))

(declare-fun d!61297 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61297 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4124 (buf!4555 thiss!1187))) ((_ sign_extend 32) (currentByte!8648 thiss!1187)) ((_ sign_extend 32) (currentBit!8643 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4124 (buf!4555 thiss!1187))) ((_ sign_extend 32) (currentByte!8648 thiss!1187)) ((_ sign_extend 32) (currentBit!8643 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15268 () Bool)

(assert (= bs!15268 d!61297))

(declare-fun m!272937 () Bool)

(assert (=> bs!15268 m!272937))

(assert (=> b!173653 d!61297))

(declare-fun d!61303 () Bool)

(assert (=> d!61303 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8643 thiss!1187) (currentByte!8648 thiss!1187) (size!4124 (buf!4555 thiss!1187))))))

(declare-fun bs!15270 () Bool)

(assert (= bs!15270 d!61303))

(assert (=> bs!15270 m!272925))

(assert (=> start!38588 d!61303))

(check-sat (not d!61297) (not d!61303))
(check-sat)

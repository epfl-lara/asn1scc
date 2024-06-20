; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38110 () Bool)

(assert start!38110)

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9167 0))(
  ( (array!9168 (arr!4982 (Array (_ BitVec 32) (_ BitVec 8))) (size!4052 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7212 0))(
  ( (BitStream!7213 (buf!4480 array!9167) (currentByte!8512 (_ BitVec 32)) (currentBit!8507 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7212)

(assert (=> start!38110 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4052 (buf!4480 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8512 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8507 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4052 (buf!4480 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8512 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8507 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38110 true))

(declare-fun e!119982 () Bool)

(declare-fun inv!12 (BitStream!7212) Bool)

(assert (=> start!38110 (and (inv!12 thiss!1817) e!119982)))

(declare-fun b!171735 () Bool)

(declare-fun array_inv!3793 (array!9167) Bool)

(assert (=> b!171735 (= e!119982 (array_inv!3793 (buf!4480 thiss!1817)))))

(assert (= start!38110 b!171735))

(declare-fun m!270983 () Bool)

(assert (=> start!38110 m!270983))

(declare-fun m!270985 () Bool)

(assert (=> b!171735 m!270985))

(check-sat (not start!38110) (not b!171735))
(check-sat)
(get-model)

(declare-fun d!60849 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60849 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8507 thiss!1817) (currentByte!8512 thiss!1817) (size!4052 (buf!4480 thiss!1817))))))

(declare-fun bs!15133 () Bool)

(assert (= bs!15133 d!60849))

(declare-fun m!270991 () Bool)

(assert (=> bs!15133 m!270991))

(assert (=> start!38110 d!60849))

(declare-fun d!60851 () Bool)

(assert (=> d!60851 (= (array_inv!3793 (buf!4480 thiss!1817)) (bvsge (size!4052 (buf!4480 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!171735 d!60851))

(check-sat (not d!60849))
(check-sat)
(get-model)

(declare-fun d!60857 () Bool)

(assert (=> d!60857 (= (invariant!0 (currentBit!8507 thiss!1817) (currentByte!8512 thiss!1817) (size!4052 (buf!4480 thiss!1817))) (and (bvsge (currentBit!8507 thiss!1817) #b00000000000000000000000000000000) (bvslt (currentBit!8507 thiss!1817) #b00000000000000000000000000001000) (bvsge (currentByte!8512 thiss!1817) #b00000000000000000000000000000000) (or (bvslt (currentByte!8512 thiss!1817) (size!4052 (buf!4480 thiss!1817))) (and (= (currentBit!8507 thiss!1817) #b00000000000000000000000000000000) (= (currentByte!8512 thiss!1817) (size!4052 (buf!4480 thiss!1817)))))))))

(assert (=> d!60849 d!60857))

(check-sat)

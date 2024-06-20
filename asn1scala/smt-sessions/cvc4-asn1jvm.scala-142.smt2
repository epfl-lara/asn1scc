; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3332 () Bool)

(assert start!3332)

(declare-fun res!13724 () Bool)

(declare-fun e!9196 () Bool)

(assert (=> start!3332 (=> (not res!13724) (not e!9196))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!868 0))(
  ( (array!869 (arr!798 (Array (_ BitVec 32) (_ BitVec 8))) (size!369 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!698 0))(
  ( (BitStream!699 (buf!720 array!868) (currentByte!1868 (_ BitVec 32)) (currentBit!1863 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!698)

(assert (=> start!3332 (= res!13724 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!369 (buf!720 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1868 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1863 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!369 (buf!720 thiss!1073))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1868 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1863 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3332 e!9196))

(assert (=> start!3332 true))

(declare-fun e!9197 () Bool)

(declare-fun inv!12 (BitStream!698) Bool)

(assert (=> start!3332 (and (inv!12 thiss!1073) e!9197)))

(declare-fun b!14677 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14677 (= e!9196 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1863 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1868 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!369 (buf!720 thiss!1073)))))))))

(declare-fun b!14678 () Bool)

(declare-fun array_inv!358 (array!868) Bool)

(assert (=> b!14678 (= e!9197 (array_inv!358 (buf!720 thiss!1073)))))

(assert (= (and start!3332 res!13724) b!14677))

(assert (= start!3332 b!14678))

(declare-fun m!21117 () Bool)

(assert (=> start!3332 m!21117))

(declare-fun m!21119 () Bool)

(assert (=> b!14677 m!21119))

(declare-fun m!21121 () Bool)

(assert (=> b!14678 m!21121))

(push 1)

(assert (not b!14678))

(assert (not b!14677))

(assert (not start!3332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4827 () Bool)

(assert (=> d!4827 (= (array_inv!358 (buf!720 thiss!1073)) (bvsge (size!369 (buf!720 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14678 d!4827))

(declare-fun d!4833 () Bool)

(assert (=> d!4833 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1863 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1868 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!369 (buf!720 thiss!1073))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1863 thiss!1073))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1863 thiss!1073))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1868 thiss!1073))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1868 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!369 (buf!720 thiss!1073))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1863 thiss!1073))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1868 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!369 (buf!720 thiss!1073)))))))))))

(assert (=> b!14677 d!4833))

(declare-fun d!4838 () Bool)

(assert (=> d!4838 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1863 thiss!1073) (currentByte!1868 thiss!1073) (size!369 (buf!720 thiss!1073))))))

(declare-fun bs!1335 () Bool)

(assert (= bs!1335 d!4838))

(declare-fun m!21125 () Bool)

(assert (=> bs!1335 m!21125))

(assert (=> start!3332 d!4838))

(push 1)

(assert (not d!4838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


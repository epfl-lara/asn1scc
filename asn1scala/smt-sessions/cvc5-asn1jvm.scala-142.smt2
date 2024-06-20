; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3328 () Bool)

(assert start!3328)

(declare-fun res!13718 () Bool)

(declare-fun e!9178 () Bool)

(assert (=> start!3328 (=> (not res!13718) (not e!9178))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!864 0))(
  ( (array!865 (arr!796 (Array (_ BitVec 32) (_ BitVec 8))) (size!367 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!694 0))(
  ( (BitStream!695 (buf!718 array!864) (currentByte!1866 (_ BitVec 32)) (currentBit!1861 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!694)

(assert (=> start!3328 (= res!13718 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!367 (buf!718 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1866 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1861 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!367 (buf!718 thiss!1073))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1866 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1861 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3328 e!9178))

(assert (=> start!3328 true))

(declare-fun e!9179 () Bool)

(declare-fun inv!12 (BitStream!694) Bool)

(assert (=> start!3328 (and (inv!12 thiss!1073) e!9179)))

(declare-fun b!14665 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14665 (= e!9178 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1861 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1866 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!367 (buf!718 thiss!1073)))))))))

(declare-fun b!14666 () Bool)

(declare-fun array_inv!356 (array!864) Bool)

(assert (=> b!14666 (= e!9179 (array_inv!356 (buf!718 thiss!1073)))))

(assert (= (and start!3328 res!13718) b!14665))

(assert (= start!3328 b!14666))

(declare-fun m!21105 () Bool)

(assert (=> start!3328 m!21105))

(declare-fun m!21107 () Bool)

(assert (=> b!14665 m!21107))

(declare-fun m!21109 () Bool)

(assert (=> b!14666 m!21109))

(push 1)

(assert (not b!14666))

(assert (not b!14665))

(assert (not start!3328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4828 () Bool)

(assert (=> d!4828 (= (array_inv!356 (buf!718 thiss!1073)) (bvsge (size!367 (buf!718 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14666 d!4828))

(declare-fun d!4834 () Bool)

(assert (=> d!4834 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1861 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1866 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!367 (buf!718 thiss!1073))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1861 thiss!1073))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1861 thiss!1073))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1866 thiss!1073))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1866 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!367 (buf!718 thiss!1073))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1861 thiss!1073))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1866 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!367 (buf!718 thiss!1073)))))))))))

(assert (=> b!14665 d!4834))

(declare-fun d!4837 () Bool)

(assert (=> d!4837 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1861 thiss!1073) (currentByte!1866 thiss!1073) (size!367 (buf!718 thiss!1073))))))

(declare-fun bs!1336 () Bool)

(assert (= bs!1336 d!4837))

(declare-fun m!21123 () Bool)

(assert (=> bs!1336 m!21123))

(assert (=> start!3328 d!4837))

(push 1)

(assert (not d!4837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


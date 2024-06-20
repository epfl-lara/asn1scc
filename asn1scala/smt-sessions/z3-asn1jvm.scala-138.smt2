; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3276 () Bool)

(assert start!3276)

(declare-fun res!13694 () Bool)

(declare-fun e!9097 () Bool)

(assert (=> start!3276 (=> (not res!13694) (not e!9097))))

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!836 0))(
  ( (array!837 (arr!785 (Array (_ BitVec 32) (_ BitVec 8))) (size!356 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!672 0))(
  ( (BitStream!673 (buf!707 array!836) (currentByte!1850 (_ BitVec 32)) (currentBit!1845 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!672)

(assert (=> start!3276 (= res!13694 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!356 (buf!707 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1850 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1845 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!356 (buf!707 thiss!1862))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1850 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1845 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3276 e!9097))

(assert (=> start!3276 true))

(declare-fun e!9098 () Bool)

(declare-fun inv!12 (BitStream!672) Bool)

(assert (=> start!3276 (and (inv!12 thiss!1862) e!9098)))

(declare-fun b!14608 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14608 (= e!9097 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1845 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1850 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (size!356 (buf!707 thiss!1862)))))))))

(declare-fun b!14609 () Bool)

(declare-fun array_inv!345 (array!836) Bool)

(assert (=> b!14609 (= e!9098 (array_inv!345 (buf!707 thiss!1862)))))

(assert (= (and start!3276 res!13694) b!14608))

(assert (= start!3276 b!14609))

(declare-fun m!21043 () Bool)

(assert (=> start!3276 m!21043))

(declare-fun m!21045 () Bool)

(assert (=> b!14608 m!21045))

(declare-fun m!21047 () Bool)

(assert (=> b!14609 m!21047))

(check-sat (not start!3276) (not b!14608) (not b!14609))
(check-sat)
(get-model)

(declare-fun d!4788 () Bool)

(assert (=> d!4788 (= (inv!12 thiss!1862) (invariant!0 (currentBit!1845 thiss!1862) (currentByte!1850 thiss!1862) (size!356 (buf!707 thiss!1862))))))

(declare-fun bs!1319 () Bool)

(assert (= bs!1319 d!4788))

(declare-fun m!21055 () Bool)

(assert (=> bs!1319 m!21055))

(assert (=> start!3276 d!4788))

(declare-fun d!4790 () Bool)

(assert (=> d!4790 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1845 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1850 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (size!356 (buf!707 thiss!1862))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1845 thiss!1862))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1845 thiss!1862))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1850 thiss!1862))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1850 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (size!356 (buf!707 thiss!1862))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1845 thiss!1862))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1850 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (size!356 (buf!707 thiss!1862)))))))))))

(assert (=> b!14608 d!4790))

(declare-fun d!4792 () Bool)

(assert (=> d!4792 (= (array_inv!345 (buf!707 thiss!1862)) (bvsge (size!356 (buf!707 thiss!1862)) #b00000000000000000000000000000000))))

(assert (=> b!14609 d!4792))

(check-sat (not d!4788))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34170 () Bool)

(assert start!34170)

(declare-fun res!135706 () Bool)

(declare-fun e!112425 () Bool)

(assert (=> start!34170 (=> (not res!135706) (not e!112425))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8069 0))(
  ( (array!8070 (arr!4538 (Array (_ BitVec 32) (_ BitVec 8))) (size!3617 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6390 0))(
  ( (BitStream!6391 (buf!4069 array!8069) (currentByte!7585 (_ BitVec 32)) (currentBit!7580 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6390)

(assert (=> start!34170 (= res!135706 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3617 (buf!4069 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7585 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7580 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3617 (buf!4069 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7585 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7580 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34170 e!112425))

(assert (=> start!34170 true))

(declare-fun e!112426 () Bool)

(declare-fun inv!12 (BitStream!6390) Bool)

(assert (=> start!34170 (and (inv!12 thiss!1577) e!112426)))

(declare-fun b!162883 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162883 (= e!112425 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7580 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7585 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3617 (buf!4069 thiss!1577)))))))))

(declare-fun b!162884 () Bool)

(declare-fun array_inv!3358 (array!8069) Bool)

(assert (=> b!162884 (= e!112426 (array_inv!3358 (buf!4069 thiss!1577)))))

(assert (= (and start!34170 res!135706) b!162883))

(assert (= start!34170 b!162884))

(declare-fun m!258657 () Bool)

(assert (=> start!34170 m!258657))

(declare-fun m!258659 () Bool)

(assert (=> b!162883 m!258659))

(declare-fun m!258661 () Bool)

(assert (=> b!162884 m!258661))

(check-sat (not b!162883) (not b!162884) (not start!34170))
(check-sat)
(get-model)

(declare-fun d!56141 () Bool)

(assert (=> d!56141 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7580 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7585 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3617 (buf!4069 thiss!1577))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7580 thiss!1577))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7580 thiss!1577))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7585 thiss!1577))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7585 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3617 (buf!4069 thiss!1577))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7580 thiss!1577))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7585 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3617 (buf!4069 thiss!1577)))))))))))

(assert (=> b!162883 d!56141))

(declare-fun d!56143 () Bool)

(assert (=> d!56143 (= (array_inv!3358 (buf!4069 thiss!1577)) (bvsge (size!3617 (buf!4069 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!162884 d!56143))

(declare-fun d!56145 () Bool)

(assert (=> d!56145 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7580 thiss!1577) (currentByte!7585 thiss!1577) (size!3617 (buf!4069 thiss!1577))))))

(declare-fun bs!13905 () Bool)

(assert (= bs!13905 d!56145))

(declare-fun m!258669 () Bool)

(assert (=> bs!13905 m!258669))

(assert (=> start!34170 d!56145))

(check-sat (not d!56145))
(check-sat)

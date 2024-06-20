; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36590 () Bool)

(assert start!36590)

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8701 0))(
  ( (array!8702 (arr!4784 (Array (_ BitVec 32) (_ BitVec 8))) (size!3863 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6882 0))(
  ( (BitStream!6883 (buf!4315 array!8701) (currentByte!8172 (_ BitVec 32)) (currentBit!8167 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6882)

(assert (=> start!36590 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3863 (buf!4315 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8172 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8167 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3863 (buf!4315 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8172 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8167 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36590 true))

(declare-fun e!116771 () Bool)

(declare-fun inv!12 (BitStream!6882) Bool)

(assert (=> start!36590 (and (inv!12 thiss!1909) e!116771)))

(declare-fun b!168189 () Bool)

(declare-fun array_inv!3604 (array!8701) Bool)

(assert (=> b!168189 (= e!116771 (array_inv!3604 (buf!4315 thiss!1909)))))

(assert (= start!36590 b!168189))

(declare-fun m!267823 () Bool)

(assert (=> start!36590 m!267823))

(declare-fun m!267825 () Bool)

(assert (=> b!168189 m!267825))

(check-sat (not b!168189) (not start!36590))
(check-sat)
(get-model)

(declare-fun d!59195 () Bool)

(assert (=> d!59195 (= (array_inv!3604 (buf!4315 thiss!1909)) (bvsge (size!3863 (buf!4315 thiss!1909)) #b00000000000000000000000000000000))))

(assert (=> b!168189 d!59195))

(declare-fun d!59197 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59197 (= (inv!12 thiss!1909) (invariant!0 (currentBit!8167 thiss!1909) (currentByte!8172 thiss!1909) (size!3863 (buf!4315 thiss!1909))))))

(declare-fun bs!14658 () Bool)

(assert (= bs!14658 d!59197))

(declare-fun m!267831 () Bool)

(assert (=> bs!14658 m!267831))

(assert (=> start!36590 d!59197))

(check-sat (not d!59197))
(check-sat)
(get-model)

(declare-fun d!59203 () Bool)

(assert (=> d!59203 (= (invariant!0 (currentBit!8167 thiss!1909) (currentByte!8172 thiss!1909) (size!3863 (buf!4315 thiss!1909))) (and (bvsge (currentBit!8167 thiss!1909) #b00000000000000000000000000000000) (bvslt (currentBit!8167 thiss!1909) #b00000000000000000000000000001000) (bvsge (currentByte!8172 thiss!1909) #b00000000000000000000000000000000) (or (bvslt (currentByte!8172 thiss!1909) (size!3863 (buf!4315 thiss!1909))) (and (= (currentBit!8167 thiss!1909) #b00000000000000000000000000000000) (= (currentByte!8172 thiss!1909) (size!3863 (buf!4315 thiss!1909)))))))))

(assert (=> d!59197 d!59203))

(check-sat)

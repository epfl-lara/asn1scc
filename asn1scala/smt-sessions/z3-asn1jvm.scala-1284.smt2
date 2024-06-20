; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36610 () Bool)

(assert start!36610)

(declare-fun res!140027 () Bool)

(declare-fun e!116794 () Bool)

(assert (=> start!36610 (=> (not res!140027) (not e!116794))))

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8709 0))(
  ( (array!8710 (arr!4787 (Array (_ BitVec 32) (_ BitVec 8))) (size!3866 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6888 0))(
  ( (BitStream!6889 (buf!4318 array!8709) (currentByte!8177 (_ BitVec 32)) (currentBit!8172 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6888)

(assert (=> start!36610 (= res!140027 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3866 (buf!4318 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8177 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8172 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3866 (buf!4318 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8177 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8172 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36610 e!116794))

(assert (=> start!36610 true))

(declare-fun e!116795 () Bool)

(declare-fun inv!12 (BitStream!6888) Bool)

(assert (=> start!36610 (and (inv!12 thiss!1909) e!116795)))

(declare-fun b!168203 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168203 (= e!116794 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8172 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8177 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3866 (buf!4318 thiss!1909)))))))))

(declare-fun b!168204 () Bool)

(declare-fun array_inv!3607 (array!8709) Bool)

(assert (=> b!168204 (= e!116795 (array_inv!3607 (buf!4318 thiss!1909)))))

(assert (= (and start!36610 res!140027) b!168203))

(assert (= start!36610 b!168204))

(declare-fun m!267841 () Bool)

(assert (=> start!36610 m!267841))

(declare-fun m!267843 () Bool)

(assert (=> b!168203 m!267843))

(declare-fun m!267845 () Bool)

(assert (=> b!168204 m!267845))

(check-sat (not b!168204) (not b!168203) (not start!36610))
(check-sat)
(get-model)

(declare-fun d!59211 () Bool)

(assert (=> d!59211 (= (array_inv!3607 (buf!4318 thiss!1909)) (bvsge (size!3866 (buf!4318 thiss!1909)) #b00000000000000000000000000000000))))

(assert (=> b!168204 d!59211))

(declare-fun d!59213 () Bool)

(assert (=> d!59213 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8172 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8177 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3866 (buf!4318 thiss!1909))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8172 thiss!1909))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8172 thiss!1909))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8177 thiss!1909))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8177 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3866 (buf!4318 thiss!1909))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8172 thiss!1909))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8177 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3866 (buf!4318 thiss!1909)))))))))))

(assert (=> b!168203 d!59213))

(declare-fun d!59215 () Bool)

(assert (=> d!59215 (= (inv!12 thiss!1909) (invariant!0 (currentBit!8172 thiss!1909) (currentByte!8177 thiss!1909) (size!3866 (buf!4318 thiss!1909))))))

(declare-fun bs!14663 () Bool)

(assert (= bs!14663 d!59215))

(declare-fun m!267853 () Bool)

(assert (=> bs!14663 m!267853))

(assert (=> start!36610 d!59215))

(check-sat (not d!59215))
(check-sat)

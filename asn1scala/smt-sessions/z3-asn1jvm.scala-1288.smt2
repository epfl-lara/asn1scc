; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36656 () Bool)

(assert start!36656)

(declare-fun res!140054 () Bool)

(declare-fun e!116884 () Bool)

(assert (=> start!36656 (=> (not res!140054) (not e!116884))))

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8736 0))(
  ( (array!8737 (arr!4799 (Array (_ BitVec 32) (_ BitVec 8))) (size!3878 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6912 0))(
  ( (BitStream!6913 (buf!4330 array!8736) (currentByte!8192 (_ BitVec 32)) (currentBit!8187 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6912)

(assert (=> start!36656 (= res!140054 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3878 (buf!4330 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8192 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8187 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3878 (buf!4330 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8192 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8187 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36656 e!116884))

(assert (=> start!36656 true))

(declare-fun e!116885 () Bool)

(declare-fun inv!12 (BitStream!6912) Bool)

(assert (=> start!36656 (and (inv!12 thiss!1894) e!116885)))

(declare-fun b!168266 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168266 (= e!116884 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8187 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8192 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3878 (buf!4330 thiss!1894)))))))))

(declare-fun b!168267 () Bool)

(declare-fun array_inv!3619 (array!8736) Bool)

(assert (=> b!168267 (= e!116885 (array_inv!3619 (buf!4330 thiss!1894)))))

(assert (= (and start!36656 res!140054) b!168266))

(assert (= start!36656 b!168267))

(declare-fun m!267907 () Bool)

(assert (=> start!36656 m!267907))

(declare-fun m!267909 () Bool)

(assert (=> b!168266 m!267909))

(declare-fun m!267911 () Bool)

(assert (=> b!168267 m!267911))

(check-sat (not b!168267) (not b!168266) (not start!36656))
(check-sat)
(get-model)

(declare-fun d!59241 () Bool)

(assert (=> d!59241 (= (array_inv!3619 (buf!4330 thiss!1894)) (bvsge (size!3878 (buf!4330 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168267 d!59241))

(declare-fun d!59243 () Bool)

(assert (=> d!59243 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8187 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8192 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3878 (buf!4330 thiss!1894))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8187 thiss!1894))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8187 thiss!1894))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8192 thiss!1894))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8192 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3878 (buf!4330 thiss!1894))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8187 thiss!1894))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8192 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3878 (buf!4330 thiss!1894)))))))))))

(assert (=> b!168266 d!59243))

(declare-fun d!59245 () Bool)

(assert (=> d!59245 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8187 thiss!1894) (currentByte!8192 thiss!1894) (size!3878 (buf!4330 thiss!1894))))))

(declare-fun bs!14678 () Bool)

(assert (= bs!14678 d!59245))

(declare-fun m!267919 () Bool)

(assert (=> bs!14678 m!267919))

(assert (=> start!36656 d!59245))

(check-sat (not d!59245))
(check-sat)

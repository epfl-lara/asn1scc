; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36588 () Bool)

(assert start!36588)

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8699 0))(
  ( (array!8700 (arr!4783 (Array (_ BitVec 32) (_ BitVec 8))) (size!3862 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6880 0))(
  ( (BitStream!6881 (buf!4314 array!8699) (currentByte!8171 (_ BitVec 32)) (currentBit!8166 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6880)

(assert (=> start!36588 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3862 (buf!4314 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8171 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8166 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3862 (buf!4314 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8171 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8166 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36588 true))

(declare-fun e!116765 () Bool)

(declare-fun inv!12 (BitStream!6880) Bool)

(assert (=> start!36588 (and (inv!12 thiss!1909) e!116765)))

(declare-fun b!168186 () Bool)

(declare-fun array_inv!3603 (array!8699) Bool)

(assert (=> b!168186 (= e!116765 (array_inv!3603 (buf!4314 thiss!1909)))))

(assert (= start!36588 b!168186))

(declare-fun m!267819 () Bool)

(assert (=> start!36588 m!267819))

(declare-fun m!267821 () Bool)

(assert (=> b!168186 m!267821))

(push 1)

(assert (not start!36588))

(assert (not b!168186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59199 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59199 (= (inv!12 thiss!1909) (invariant!0 (currentBit!8166 thiss!1909) (currentByte!8171 thiss!1909) (size!3862 (buf!4314 thiss!1909))))))

(declare-fun bs!14659 () Bool)

(assert (= bs!14659 d!59199))

(declare-fun m!267833 () Bool)

(assert (=> bs!14659 m!267833))

(assert (=> start!36588 d!59199))

(declare-fun d!59201 () Bool)

(assert (=> d!59201 (= (array_inv!3603 (buf!4314 thiss!1909)) (bvsge (size!3862 (buf!4314 thiss!1909)) #b00000000000000000000000000000000))))

(assert (=> b!168186 d!59201))

(push 1)

(assert (not d!59199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59205 () Bool)

(assert (=> d!59205 (= (invariant!0 (currentBit!8166 thiss!1909) (currentByte!8171 thiss!1909) (size!3862 (buf!4314 thiss!1909))) (and (bvsge (currentBit!8166 thiss!1909) #b00000000000000000000000000000000) (bvslt (currentBit!8166 thiss!1909) #b00000000000000000000000000001000) (bvsge (currentByte!8171 thiss!1909) #b00000000000000000000000000000000) (or (bvslt (currentByte!8171 thiss!1909) (size!3862 (buf!4314 thiss!1909))) (and (= (currentBit!8166 thiss!1909) #b00000000000000000000000000000000) (= (currentByte!8171 thiss!1909) (size!3862 (buf!4314 thiss!1909)))))))))

(assert (=> d!59199 d!59205))

(push 1)

(check-sat)


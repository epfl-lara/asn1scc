; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4150 () Bool)

(assert start!4150)

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1133 0))(
  ( (array!1134 (arr!913 (Array (_ BitVec 32) (_ BitVec 8))) (size!484 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!838 0))(
  ( (BitStream!839 (buf!802 array!1133) (currentByte!1990 (_ BitVec 32)) (currentBit!1985 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!838)

(assert (=> start!4150 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!484 (buf!802 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1990 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1985 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!484 (buf!802 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1990 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1985 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4150 true))

(declare-fun e!11183 () Bool)

(declare-fun inv!12 (BitStream!838) Bool)

(assert (=> start!4150 (and (inv!12 thiss!1917) e!11183)))

(declare-fun b!17465 () Bool)

(declare-fun array_inv!454 (array!1133) Bool)

(assert (=> b!17465 (= e!11183 (array_inv!454 (buf!802 thiss!1917)))))

(assert (= start!4150 b!17465))

(declare-fun m!23767 () Bool)

(assert (=> start!4150 m!23767))

(declare-fun m!23769 () Bool)

(assert (=> b!17465 m!23769))

(push 1)

(assert (not start!4150))

(assert (not b!17465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5686 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5686 (= (inv!12 thiss!1917) (invariant!0 (currentBit!1985 thiss!1917) (currentByte!1990 thiss!1917) (size!484 (buf!802 thiss!1917))))))

(declare-fun bs!1626 () Bool)

(assert (= bs!1626 d!5686))

(declare-fun m!23779 () Bool)

(assert (=> bs!1626 m!23779))

(assert (=> start!4150 d!5686))

(declare-fun d!5690 () Bool)

(assert (=> d!5690 (= (array_inv!454 (buf!802 thiss!1917)) (bvsge (size!484 (buf!802 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17465 d!5690))

(push 1)

(assert (not d!5686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5698 () Bool)

(assert (=> d!5698 (= (invariant!0 (currentBit!1985 thiss!1917) (currentByte!1990 thiss!1917) (size!484 (buf!802 thiss!1917))) (and (bvsge (currentBit!1985 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!1985 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!1990 thiss!1917) #b00000000000000000000000000000000) (or (bvslt (currentByte!1990 thiss!1917) (size!484 (buf!802 thiss!1917))) (and (= (currentBit!1985 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!1990 thiss!1917) (size!484 (buf!802 thiss!1917)))))))))

(assert (=> d!5686 d!5698))

(push 1)

(check-sat)

(pop 1)


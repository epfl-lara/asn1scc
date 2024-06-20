; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4154 () Bool)

(assert start!4154)

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1137 0))(
  ( (array!1138 (arr!915 (Array (_ BitVec 32) (_ BitVec 8))) (size!486 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!842 0))(
  ( (BitStream!843 (buf!804 array!1137) (currentByte!1992 (_ BitVec 32)) (currentBit!1987 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!842)

(assert (=> start!4154 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!486 (buf!804 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1992 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1987 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!486 (buf!804 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1992 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1987 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4154 true))

(declare-fun e!11195 () Bool)

(declare-fun inv!12 (BitStream!842) Bool)

(assert (=> start!4154 (and (inv!12 thiss!1917) e!11195)))

(declare-fun b!17471 () Bool)

(declare-fun array_inv!456 (array!1137) Bool)

(assert (=> b!17471 (= e!11195 (array_inv!456 (buf!804 thiss!1917)))))

(assert (= start!4154 b!17471))

(declare-fun m!23775 () Bool)

(assert (=> start!4154 m!23775))

(declare-fun m!23777 () Bool)

(assert (=> b!17471 m!23777))

(push 1)

(assert (not start!4154))

(assert (not b!17471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5692 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5692 (= (inv!12 thiss!1917) (invariant!0 (currentBit!1987 thiss!1917) (currentByte!1992 thiss!1917) (size!486 (buf!804 thiss!1917))))))

(declare-fun bs!1627 () Bool)

(assert (= bs!1627 d!5692))

(declare-fun m!23781 () Bool)

(assert (=> bs!1627 m!23781))

(assert (=> start!4154 d!5692))

(declare-fun d!5696 () Bool)

(assert (=> d!5696 (= (array_inv!456 (buf!804 thiss!1917)) (bvsge (size!486 (buf!804 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17471 d!5696))

(push 1)

(assert (not d!5692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5700 () Bool)

(assert (=> d!5700 (= (invariant!0 (currentBit!1987 thiss!1917) (currentByte!1992 thiss!1917) (size!486 (buf!804 thiss!1917))) (and (bvsge (currentBit!1987 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!1987 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!1992 thiss!1917) #b00000000000000000000000000000000) (or (bvslt (currentByte!1992 thiss!1917) (size!486 (buf!804 thiss!1917))) (and (= (currentBit!1987 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!1992 thiss!1917) (size!486 (buf!804 thiss!1917)))))))))

(assert (=> d!5692 d!5700))

(push 1)


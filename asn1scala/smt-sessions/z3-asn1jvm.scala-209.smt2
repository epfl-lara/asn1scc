; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4152 () Bool)

(assert start!4152)

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1135 0))(
  ( (array!1136 (arr!914 (Array (_ BitVec 32) (_ BitVec 8))) (size!485 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!840 0))(
  ( (BitStream!841 (buf!803 array!1135) (currentByte!1991 (_ BitVec 32)) (currentBit!1986 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!840)

(assert (=> start!4152 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!485 (buf!803 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1991 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1986 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!485 (buf!803 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1991 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1986 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4152 true))

(declare-fun e!11189 () Bool)

(declare-fun inv!12 (BitStream!840) Bool)

(assert (=> start!4152 (and (inv!12 thiss!1917) e!11189)))

(declare-fun b!17468 () Bool)

(declare-fun array_inv!455 (array!1135) Bool)

(assert (=> b!17468 (= e!11189 (array_inv!455 (buf!803 thiss!1917)))))

(assert (= start!4152 b!17468))

(declare-fun m!23771 () Bool)

(assert (=> start!4152 m!23771))

(declare-fun m!23773 () Bool)

(assert (=> b!17468 m!23773))

(check-sat (not b!17468) (not start!4152))
(check-sat)
(get-model)

(declare-fun d!5688 () Bool)

(assert (=> d!5688 (= (array_inv!455 (buf!803 thiss!1917)) (bvsge (size!485 (buf!803 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17468 d!5688))

(declare-fun d!5694 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5694 (= (inv!12 thiss!1917) (invariant!0 (currentBit!1986 thiss!1917) (currentByte!1991 thiss!1917) (size!485 (buf!803 thiss!1917))))))

(declare-fun bs!1628 () Bool)

(assert (= bs!1628 d!5694))

(declare-fun m!23783 () Bool)

(assert (=> bs!1628 m!23783))

(assert (=> start!4152 d!5694))

(check-sat (not d!5694))
(check-sat)
(get-model)

(declare-fun d!5702 () Bool)

(assert (=> d!5702 (= (invariant!0 (currentBit!1986 thiss!1917) (currentByte!1991 thiss!1917) (size!485 (buf!803 thiss!1917))) (and (bvsge (currentBit!1986 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!1986 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!1991 thiss!1917) #b00000000000000000000000000000000) (or (bvslt (currentByte!1991 thiss!1917) (size!485 (buf!803 thiss!1917))) (and (= (currentBit!1986 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!1991 thiss!1917) (size!485 (buf!803 thiss!1917)))))))))


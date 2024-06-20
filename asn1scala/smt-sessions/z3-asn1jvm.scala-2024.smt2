; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51780 () Bool)

(assert start!51780)

(declare-datatypes ((array!12989 0))(
  ( (array!12990 (arr!6680 (Array (_ BitVec 32) (_ BitVec 8))) (size!5693 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10308 0))(
  ( (BitStream!10309 (buf!6147 array!12989) (currentByte!11453 (_ BitVec 32)) (currentBit!11448 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10308)

(assert (=> start!51780 (and (bvsle ((_ sign_extend 32) (size!5693 (buf!6147 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11453 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11448 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5693 (buf!6147 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11453 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11448 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165865 () Bool)

(declare-fun inv!12 (BitStream!10308) Bool)

(assert (=> start!51780 (and (inv!12 thiss!1948) e!165865)))

(declare-fun b!239510 () Bool)

(declare-fun array_inv!5434 (array!12989) Bool)

(assert (=> b!239510 (= e!165865 (array_inv!5434 (buf!6147 thiss!1948)))))

(assert (= start!51780 b!239510))

(declare-fun m!361733 () Bool)

(assert (=> start!51780 m!361733))

(declare-fun m!361735 () Bool)

(assert (=> b!239510 m!361735))

(check-sat (not start!51780) (not b!239510))
(check-sat)
(get-model)

(declare-fun d!80902 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80902 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11448 thiss!1948) (currentByte!11453 thiss!1948) (size!5693 (buf!6147 thiss!1948))))))

(declare-fun bs!20362 () Bool)

(assert (= bs!20362 d!80902))

(declare-fun m!361741 () Bool)

(assert (=> bs!20362 m!361741))

(assert (=> start!51780 d!80902))

(declare-fun d!80904 () Bool)

(assert (=> d!80904 (= (array_inv!5434 (buf!6147 thiss!1948)) (bvsge (size!5693 (buf!6147 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239510 d!80904))

(check-sat (not d!80902))
(check-sat)
(get-model)

(declare-fun d!80908 () Bool)

(assert (=> d!80908 (= (invariant!0 (currentBit!11448 thiss!1948) (currentByte!11453 thiss!1948) (size!5693 (buf!6147 thiss!1948))) (and (bvsge (currentBit!11448 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11448 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11453 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11453 thiss!1948) (size!5693 (buf!6147 thiss!1948))) (and (= (currentBit!11448 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11453 thiss!1948) (size!5693 (buf!6147 thiss!1948)))))))))

(assert (=> d!80902 d!80908))

(check-sat)

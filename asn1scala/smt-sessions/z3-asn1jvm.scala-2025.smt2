; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51796 () Bool)

(assert start!51796)

(declare-fun res!200028 () Bool)

(declare-fun e!165888 () Bool)

(assert (=> start!51796 (=> (not res!200028) (not e!165888))))

(declare-datatypes ((array!12997 0))(
  ( (array!12998 (arr!6683 (Array (_ BitVec 32) (_ BitVec 8))) (size!5696 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10314 0))(
  ( (BitStream!10315 (buf!6150 array!12997) (currentByte!11457 (_ BitVec 32)) (currentBit!11452 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10314)

(assert (=> start!51796 (= res!200028 (and (bvsle ((_ sign_extend 32) (size!5696 (buf!6150 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11457 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11452 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5696 (buf!6150 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11457 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11452 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51796 e!165888))

(declare-fun e!165889 () Bool)

(declare-fun inv!12 (BitStream!10314) Bool)

(assert (=> start!51796 (and (inv!12 thiss!1948) e!165889)))

(declare-fun b!239524 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239524 (= e!165888 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11452 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11457 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5696 (buf!6150 thiss!1948)))))))))

(declare-fun b!239525 () Bool)

(declare-fun array_inv!5437 (array!12997) Bool)

(assert (=> b!239525 (= e!165889 (array_inv!5437 (buf!6150 thiss!1948)))))

(assert (= (and start!51796 res!200028) b!239524))

(assert (= start!51796 b!239525))

(declare-fun m!361751 () Bool)

(assert (=> start!51796 m!361751))

(declare-fun m!361753 () Bool)

(assert (=> b!239524 m!361753))

(declare-fun m!361755 () Bool)

(assert (=> b!239525 m!361755))

(check-sat (not b!239525) (not b!239524) (not start!51796))
(check-sat)
(get-model)

(declare-fun d!80914 () Bool)

(assert (=> d!80914 (= (array_inv!5437 (buf!6150 thiss!1948)) (bvsge (size!5696 (buf!6150 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239525 d!80914))

(declare-fun d!80916 () Bool)

(assert (=> d!80916 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11452 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11457 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5696 (buf!6150 thiss!1948))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11452 thiss!1948))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11452 thiss!1948))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11457 thiss!1948))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11457 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5696 (buf!6150 thiss!1948))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11452 thiss!1948))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11457 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5696 (buf!6150 thiss!1948)))))))))))

(assert (=> b!239524 d!80916))

(declare-fun d!80918 () Bool)

(assert (=> d!80918 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11452 thiss!1948) (currentByte!11457 thiss!1948) (size!5696 (buf!6150 thiss!1948))))))

(declare-fun bs!20367 () Bool)

(assert (= bs!20367 d!80918))

(declare-fun m!361763 () Bool)

(assert (=> bs!20367 m!361763))

(assert (=> start!51796 d!80918))

(check-sat (not d!80918))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52386 () Bool)

(assert start!52386)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13215 0))(
  ( (array!13216 (arr!6776 (Array (_ BitVec 32) (_ BitVec 8))) (size!5789 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10500 0))(
  ( (BitStream!10501 (buf!6255 array!13215) (currentByte!11615 (_ BitVec 32)) (currentBit!11610 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10500)

(assert (=> start!52386 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (bvsle ((_ sign_extend 32) (size!5789 (buf!6255 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11615 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11610 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5789 (buf!6255 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11615 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11610 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52386 true))

(declare-fun e!167116 () Bool)

(declare-fun inv!12 (BitStream!10500) Bool)

(assert (=> start!52386 (and (inv!12 thiss!1005) e!167116)))

(declare-fun b!241157 () Bool)

(declare-fun array_inv!5530 (array!13215) Bool)

(assert (=> b!241157 (= e!167116 (array_inv!5530 (buf!6255 thiss!1005)))))

(assert (= start!52386 b!241157))

(declare-fun m!363877 () Bool)

(assert (=> start!52386 m!363877))

(declare-fun m!363879 () Bool)

(assert (=> b!241157 m!363879))

(check-sat (not start!52386) (not b!241157))
(check-sat)
(get-model)

(declare-fun d!81468 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81468 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11610 thiss!1005) (currentByte!11615 thiss!1005) (size!5789 (buf!6255 thiss!1005))))))

(declare-fun bs!20570 () Bool)

(assert (= bs!20570 d!81468))

(declare-fun m!363885 () Bool)

(assert (=> bs!20570 m!363885))

(assert (=> start!52386 d!81468))

(declare-fun d!81470 () Bool)

(assert (=> d!81470 (= (array_inv!5530 (buf!6255 thiss!1005)) (bvsge (size!5789 (buf!6255 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!241157 d!81470))

(check-sat (not d!81468))
(check-sat)
(get-model)

(declare-fun d!81476 () Bool)

(assert (=> d!81476 (= (invariant!0 (currentBit!11610 thiss!1005) (currentByte!11615 thiss!1005) (size!5789 (buf!6255 thiss!1005))) (and (bvsge (currentBit!11610 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11610 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11615 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11615 thiss!1005) (size!5789 (buf!6255 thiss!1005))) (and (= (currentBit!11610 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11615 thiss!1005) (size!5789 (buf!6255 thiss!1005)))))))))

(assert (=> d!81468 d!81476))

(check-sat)

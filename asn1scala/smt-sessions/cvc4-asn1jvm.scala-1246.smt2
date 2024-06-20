; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35292 () Bool)

(assert start!35292)

(declare-fun b!165272 () Bool)

(declare-fun e!114372 () Bool)

(declare-datatypes ((array!8405 0))(
  ( (array!8406 (arr!4674 (Array (_ BitVec 32) (_ BitVec 8))) (size!3753 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6662 0))(
  ( (BitStream!6663 (buf!4205 array!8405) (currentByte!7879 (_ BitVec 32)) (currentBit!7874 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6662)

(assert (=> b!165272 (= e!114372 (not (and (bvsge (currentByte!7879 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7879 thiss!1577) (size!3753 (buf!4205 thiss!1577))))))))

(declare-fun lt!258561 () (_ BitVec 8))

(declare-fun arrayRangesEq!633 (array!8405 array!8405 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165272 (arrayRangesEq!633 (buf!4205 thiss!1577) (array!8406 (store (arr!4674 (buf!4205 thiss!1577)) (currentByte!7879 thiss!1577) lt!258561) (size!3753 (buf!4205 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7879 thiss!1577))))

(declare-datatypes ((Unit!11478 0))(
  ( (Unit!11479) )
))
(declare-fun lt!258559 () Unit!11478)

(declare-fun arrayUpdatedAtPrefixLemma!241 (array!8405 (_ BitVec 32) (_ BitVec 8)) Unit!11478)

(assert (=> b!165272 (= lt!258559 (arrayUpdatedAtPrefixLemma!241 (buf!4205 thiss!1577) (currentByte!7879 thiss!1577) lt!258561))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun lt!258560 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165272 (= lt!258561 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4674 (buf!4205 thiss!1577)) (currentByte!7879 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7874 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258560)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258560))))))

(assert (=> b!165272 (= lt!258560 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7874 thiss!1577) nBits!511)))))

(declare-fun b!165271 () Bool)

(declare-fun res!137643 () Bool)

(assert (=> b!165271 (=> (not res!137643) (not e!114372))))

(assert (=> b!165271 (= res!137643 (bvsle (bvadd (currentBit!7874 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!137644 () Bool)

(assert (=> start!35292 (=> (not res!137644) (not e!114372))))

(assert (=> start!35292 (= res!137644 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35292 e!114372))

(assert (=> start!35292 true))

(declare-fun e!114371 () Bool)

(declare-fun inv!12 (BitStream!6662) Bool)

(assert (=> start!35292 (and (inv!12 thiss!1577) e!114371)))

(declare-fun b!165273 () Bool)

(declare-fun array_inv!3494 (array!8405) Bool)

(assert (=> b!165273 (= e!114371 (array_inv!3494 (buf!4205 thiss!1577)))))

(declare-fun b!165270 () Bool)

(declare-fun res!137645 () Bool)

(assert (=> b!165270 (=> (not res!137645) (not e!114372))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165270 (= res!137645 (validate_offset_bits!1 ((_ sign_extend 32) (size!3753 (buf!4205 thiss!1577))) ((_ sign_extend 32) (currentByte!7879 thiss!1577)) ((_ sign_extend 32) (currentBit!7874 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!35292 res!137644) b!165270))

(assert (= (and b!165270 res!137645) b!165271))

(assert (= (and b!165271 res!137643) b!165272))

(assert (= start!35292 b!165273))

(declare-fun m!262679 () Bool)

(assert (=> b!165272 m!262679))

(declare-fun m!262681 () Bool)

(assert (=> b!165272 m!262681))

(declare-fun m!262683 () Bool)

(assert (=> b!165272 m!262683))

(declare-fun m!262685 () Bool)

(assert (=> b!165272 m!262685))

(declare-fun m!262687 () Bool)

(assert (=> b!165272 m!262687))

(declare-fun m!262689 () Bool)

(assert (=> b!165272 m!262689))

(declare-fun m!262691 () Bool)

(assert (=> b!165272 m!262691))

(declare-fun m!262693 () Bool)

(assert (=> start!35292 m!262693))

(declare-fun m!262695 () Bool)

(assert (=> b!165273 m!262695))

(declare-fun m!262697 () Bool)

(assert (=> b!165270 m!262697))

(push 1)

(assert (not b!165273))

(assert (not b!165270))

(assert (not start!35292))

(assert (not b!165272))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34794 () Bool)

(assert start!34794)

(declare-fun b!164596 () Bool)

(declare-fun res!137162 () Bool)

(declare-fun e!113734 () Bool)

(assert (=> b!164596 (=> (not res!137162) (not e!113734))))

(declare-datatypes ((array!8241 0))(
  ( (array!8242 (arr!4610 (Array (_ BitVec 32) (_ BitVec 8))) (size!3689 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6534 0))(
  ( (BitStream!6535 (buf!4141 array!8241) (currentByte!7720 (_ BitVec 32)) (currentBit!7715 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6534)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!164596 (= res!137162 (bvsle (bvadd (currentBit!7715 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164595 () Bool)

(declare-fun res!137160 () Bool)

(assert (=> b!164595 (=> (not res!137160) (not e!113734))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164595 (= res!137160 (validate_offset_bits!1 ((_ sign_extend 32) (size!3689 (buf!4141 thiss!1577))) ((_ sign_extend 32) (currentByte!7720 thiss!1577)) ((_ sign_extend 32) (currentBit!7715 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164597 () Bool)

(assert (=> b!164597 (= e!113734 (not true))))

(declare-fun lt!258353 () (_ BitVec 8))

(declare-fun arrayRangesEq!623 (array!8241 array!8241 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164597 (arrayRangesEq!623 (buf!4141 thiss!1577) (array!8242 (store (arr!4610 (buf!4141 thiss!1577)) (currentByte!7720 thiss!1577) lt!258353) (size!3689 (buf!4141 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7720 thiss!1577))))

(declare-datatypes ((Unit!11458 0))(
  ( (Unit!11459) )
))
(declare-fun lt!258352 () Unit!11458)

(declare-fun arrayUpdatedAtPrefixLemma!231 (array!8241 (_ BitVec 32) (_ BitVec 8)) Unit!11458)

(assert (=> b!164597 (= lt!258352 (arrayUpdatedAtPrefixLemma!231 (buf!4141 thiss!1577) (currentByte!7720 thiss!1577) lt!258353))))

(declare-fun lt!258354 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164597 (= lt!258353 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4610 (buf!4141 thiss!1577)) (currentByte!7720 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7715 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258354)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258354))))))

(assert (=> b!164597 (= lt!258354 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7715 thiss!1577) nBits!511)))))

(declare-fun res!137161 () Bool)

(assert (=> start!34794 (=> (not res!137161) (not e!113734))))

(assert (=> start!34794 (= res!137161 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34794 e!113734))

(assert (=> start!34794 true))

(declare-fun e!113736 () Bool)

(declare-fun inv!12 (BitStream!6534) Bool)

(assert (=> start!34794 (and (inv!12 thiss!1577) e!113736)))

(declare-fun b!164598 () Bool)

(declare-fun array_inv!3430 (array!8241) Bool)

(assert (=> b!164598 (= e!113736 (array_inv!3430 (buf!4141 thiss!1577)))))

(assert (= (and start!34794 res!137161) b!164595))

(assert (= (and b!164595 res!137160) b!164596))

(assert (= (and b!164596 res!137162) b!164597))

(assert (= start!34794 b!164598))

(declare-fun m!261757 () Bool)

(assert (=> b!164595 m!261757))

(declare-fun m!261759 () Bool)

(assert (=> b!164597 m!261759))

(declare-fun m!261761 () Bool)

(assert (=> b!164597 m!261761))

(declare-fun m!261763 () Bool)

(assert (=> b!164597 m!261763))

(declare-fun m!261765 () Bool)

(assert (=> b!164597 m!261765))

(declare-fun m!261767 () Bool)

(assert (=> b!164597 m!261767))

(declare-fun m!261769 () Bool)

(assert (=> b!164597 m!261769))

(declare-fun m!261771 () Bool)

(assert (=> b!164597 m!261771))

(declare-fun m!261773 () Bool)

(assert (=> start!34794 m!261773))

(declare-fun m!261775 () Bool)

(assert (=> b!164598 m!261775))

(check-sat (not b!164598) (not b!164595) (not start!34794) (not b!164597))

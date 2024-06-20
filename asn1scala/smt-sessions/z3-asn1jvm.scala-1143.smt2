; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32310 () Bool)

(assert start!32310)

(declare-fun res!133201 () Bool)

(declare-fun e!109031 () Bool)

(assert (=> start!32310 (=> (not res!133201) (not e!109031))))

(declare-datatypes ((array!7604 0))(
  ( (array!7605 (arr!4364 (Array (_ BitVec 32) (_ BitVec 8))) (size!3443 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6054 0))(
  ( (BitStream!6055 (buf!3901 array!7604) (currentByte!7135 (_ BitVec 32)) (currentBit!7130 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6054)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32310 (= res!133201 (validate_offset_byte!0 ((_ sign_extend 32) (size!3443 (buf!3901 thiss!1602))) ((_ sign_extend 32) (currentByte!7135 thiss!1602)) ((_ sign_extend 32) (currentBit!7130 thiss!1602))))))

(assert (=> start!32310 e!109031))

(declare-fun e!109028 () Bool)

(declare-fun inv!12 (BitStream!6054) Bool)

(assert (=> start!32310 (and (inv!12 thiss!1602) e!109028)))

(assert (=> start!32310 true))

(declare-fun b!159575 () Bool)

(declare-fun lt!251920 () Bool)

(declare-fun e!109032 () Bool)

(declare-datatypes ((Unit!10863 0))(
  ( (Unit!10864) )
))
(declare-datatypes ((tuple3!788 0))(
  ( (tuple3!789 (_1!7742 Unit!10863) (_2!7742 (_ BitVec 8)) (_3!511 BitStream!6054)) )
))
(declare-fun lt!251919 () tuple3!788)

(assert (=> b!159575 (= e!109032 (or lt!251920 (bvsgt #b00000000000000000000000000000000 (currentByte!7135 thiss!1602)) (bvsgt (size!3443 (buf!3901 thiss!1602)) (size!3443 (buf!3901 (_3!511 lt!251919)))) (bvsle (currentByte!7135 thiss!1602) (size!3443 (buf!3901 thiss!1602)))))))

(declare-fun b!159576 () Bool)

(declare-fun array_inv!3190 (array!7604) Bool)

(assert (=> b!159576 (= e!109028 (array_inv!3190 (buf!3901 thiss!1602)))))

(declare-fun b!159574 () Bool)

(declare-fun e!109030 () Bool)

(declare-fun lt!251921 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159574 (= e!109030 (byteRangesEq!0 (select (arr!4364 (buf!3901 thiss!1602)) (currentByte!7135 thiss!1602)) lt!251921 #b00000000000000000000000000000000 (currentBit!7130 thiss!1602)))))

(declare-fun b!159573 () Bool)

(assert (=> b!159573 (= e!109031 (not e!109032))))

(declare-fun res!133202 () Bool)

(assert (=> b!159573 (=> res!133202 e!109032)))

(declare-fun lt!251925 () array!7604)

(declare-fun arrayRangesEq!494 (array!7604 array!7604 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159573 (= res!133202 (not (arrayRangesEq!494 (buf!3901 thiss!1602) lt!251925 #b00000000000000000000000000000000 (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001))))))

(declare-fun lt!251924 () (_ BitVec 8))

(assert (=> b!159573 (arrayRangesEq!494 (buf!3901 thiss!1602) (array!7605 (store (arr!4364 (buf!3901 thiss!1602)) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) lt!251924) (size!3443 (buf!3901 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001))))

(declare-fun lt!251918 () Unit!10863)

(declare-fun arrayUpdatedAtPrefixLemma!102 (array!7604 (_ BitVec 32) (_ BitVec 8)) Unit!10863)

(assert (=> b!159573 (= lt!251918 (arrayUpdatedAtPrefixLemma!102 (buf!3901 thiss!1602) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) lt!251924))))

(assert (=> b!159573 (= lt!251924 (select (arr!4364 (buf!3901 (_3!511 lt!251919))) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251916 () (_ BitVec 32))

(declare-fun lt!251917 () (_ BitVec 8))

(declare-fun lt!251923 () (_ BitVec 32))

(declare-fun lt!251922 () (_ BitVec 8))

(declare-fun Unit!10865 () Unit!10863)

(declare-fun Unit!10866 () Unit!10863)

(assert (=> b!159573 (= lt!251919 (ite lt!251920 (let ((bdg!9407 ((_ extract 7 0) (bvnot lt!251923)))) (let ((bdg!9408 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4364 (buf!3901 thiss!1602)) (currentByte!7135 thiss!1602) lt!251922) (currentByte!7135 thiss!1602) lt!251921) (bvadd #b00000000000000000000000000000001 (currentByte!7135 thiss!1602)))) ((_ sign_extend 24) bdg!9407))))) (tuple3!789 Unit!10865 bdg!9407 (BitStream!6055 (array!7605 (store (arr!4364 (array!7605 (store (arr!4364 lt!251925) (bvadd #b00000000000000000000000000000001 (currentByte!7135 thiss!1602)) bdg!9408) (size!3443 lt!251925))) (bvadd #b00000000000000000000000000000001 (currentByte!7135 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9408) (bvshl ((_ sign_extend 24) v!222) lt!251916)))) (size!3443 (array!7605 (store (arr!4364 lt!251925) (bvadd #b00000000000000000000000000000001 (currentByte!7135 thiss!1602)) bdg!9408) (size!3443 lt!251925)))) (bvadd #b00000000000000000000000000000001 (currentByte!7135 thiss!1602)) (currentBit!7130 thiss!1602))))) (tuple3!789 Unit!10866 lt!251917 (BitStream!6055 lt!251925 (bvadd #b00000000000000000000000000000001 (currentByte!7135 thiss!1602)) (currentBit!7130 thiss!1602)))))))

(declare-fun lt!251915 () (_ BitVec 32))

(assert (=> b!159573 (= lt!251920 (bvsgt lt!251915 #b00000000000000000000000000000000))))

(assert (=> b!159573 e!109030))

(declare-fun res!133200 () Bool)

(assert (=> b!159573 (=> res!133200 e!109030)))

(assert (=> b!159573 (= res!133200 (bvsge (currentByte!7135 thiss!1602) (size!3443 (buf!3901 thiss!1602))))))

(assert (=> b!159573 (= lt!251925 (array!7605 (store (store (arr!4364 (buf!3901 thiss!1602)) (currentByte!7135 thiss!1602) lt!251922) (currentByte!7135 thiss!1602) lt!251921) (size!3443 (buf!3901 thiss!1602))))))

(assert (=> b!159573 (= lt!251921 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251922) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251915))))))

(assert (=> b!159573 (= lt!251922 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4364 (buf!3901 thiss!1602)) (currentByte!7135 thiss!1602))) lt!251923)))))

(assert (=> b!159573 (= lt!251923 ((_ sign_extend 24) lt!251917))))

(assert (=> b!159573 (= lt!251917 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251916)))))))

(assert (=> b!159573 (= lt!251916 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251915))))))

(assert (=> b!159573 (= lt!251915 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7130 thiss!1602))))))

(assert (= (and start!32310 res!133201) b!159573))

(assert (= (and b!159573 (not res!133200)) b!159574))

(assert (= (and b!159573 (not res!133202)) b!159575))

(assert (= start!32310 b!159576))

(declare-fun m!251583 () Bool)

(assert (=> start!32310 m!251583))

(declare-fun m!251585 () Bool)

(assert (=> start!32310 m!251585))

(declare-fun m!251587 () Bool)

(assert (=> b!159576 m!251587))

(declare-fun m!251589 () Bool)

(assert (=> b!159574 m!251589))

(assert (=> b!159574 m!251589))

(declare-fun m!251591 () Bool)

(assert (=> b!159574 m!251591))

(declare-fun m!251593 () Bool)

(assert (=> b!159573 m!251593))

(declare-fun m!251595 () Bool)

(assert (=> b!159573 m!251595))

(declare-fun m!251597 () Bool)

(assert (=> b!159573 m!251597))

(declare-fun m!251599 () Bool)

(assert (=> b!159573 m!251599))

(declare-fun m!251601 () Bool)

(assert (=> b!159573 m!251601))

(declare-fun m!251603 () Bool)

(assert (=> b!159573 m!251603))

(declare-fun m!251605 () Bool)

(assert (=> b!159573 m!251605))

(declare-fun m!251607 () Bool)

(assert (=> b!159573 m!251607))

(declare-fun m!251609 () Bool)

(assert (=> b!159573 m!251609))

(declare-fun m!251611 () Bool)

(assert (=> b!159573 m!251611))

(assert (=> b!159573 m!251589))

(declare-fun m!251613 () Bool)

(assert (=> b!159573 m!251613))

(check-sat (not start!32310) (not b!159576) (not b!159574) (not b!159573))
(check-sat)
(get-model)

(declare-fun d!53677 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53677 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3443 (buf!3901 thiss!1602))) ((_ sign_extend 32) (currentByte!7135 thiss!1602)) ((_ sign_extend 32) (currentBit!7130 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3443 (buf!3901 thiss!1602))) ((_ sign_extend 32) (currentByte!7135 thiss!1602)) ((_ sign_extend 32) (currentBit!7130 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13307 () Bool)

(assert (= bs!13307 d!53677))

(declare-fun m!251651 () Bool)

(assert (=> bs!13307 m!251651))

(assert (=> start!32310 d!53677))

(declare-fun d!53679 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53679 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7130 thiss!1602) (currentByte!7135 thiss!1602) (size!3443 (buf!3901 thiss!1602))))))

(declare-fun bs!13308 () Bool)

(assert (= bs!13308 d!53679))

(declare-fun m!251673 () Bool)

(assert (=> bs!13308 m!251673))

(assert (=> start!32310 d!53679))

(declare-fun d!53689 () Bool)

(assert (=> d!53689 (= (array_inv!3190 (buf!3901 thiss!1602)) (bvsge (size!3443 (buf!3901 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159576 d!53689))

(declare-fun d!53691 () Bool)

(assert (=> d!53691 (= (byteRangesEq!0 (select (arr!4364 (buf!3901 thiss!1602)) (currentByte!7135 thiss!1602)) lt!251921 #b00000000000000000000000000000000 (currentBit!7130 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7130 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4364 (buf!3901 thiss!1602)) (currentByte!7135 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7130 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251921) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7130 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13311 () Bool)

(assert (= bs!13311 d!53691))

(declare-fun m!251683 () Bool)

(assert (=> bs!13311 m!251683))

(declare-fun m!251685 () Bool)

(assert (=> bs!13311 m!251685))

(assert (=> b!159574 d!53691))

(declare-fun d!53701 () Bool)

(declare-fun res!133238 () Bool)

(declare-fun e!109074 () Bool)

(assert (=> d!53701 (=> res!133238 e!109074)))

(assert (=> d!53701 (= res!133238 (= #b00000000000000000000000000000000 (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)))))

(assert (=> d!53701 (= (arrayRangesEq!494 (buf!3901 thiss!1602) lt!251925 #b00000000000000000000000000000000 (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)) e!109074)))

(declare-fun b!159615 () Bool)

(declare-fun e!109075 () Bool)

(assert (=> b!159615 (= e!109074 e!109075)))

(declare-fun res!133239 () Bool)

(assert (=> b!159615 (=> (not res!133239) (not e!109075))))

(assert (=> b!159615 (= res!133239 (= (select (arr!4364 (buf!3901 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4364 lt!251925) #b00000000000000000000000000000000)))))

(declare-fun b!159616 () Bool)

(assert (=> b!159616 (= e!109075 (arrayRangesEq!494 (buf!3901 thiss!1602) lt!251925 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)))))

(assert (= (and d!53701 (not res!133238)) b!159615))

(assert (= (and b!159615 res!133239) b!159616))

(declare-fun m!251691 () Bool)

(assert (=> b!159615 m!251691))

(declare-fun m!251693 () Bool)

(assert (=> b!159615 m!251693))

(declare-fun m!251695 () Bool)

(assert (=> b!159616 m!251695))

(assert (=> b!159573 d!53701))

(declare-fun d!53707 () Bool)

(declare-fun res!133240 () Bool)

(declare-fun e!109076 () Bool)

(assert (=> d!53707 (=> res!133240 e!109076)))

(assert (=> d!53707 (= res!133240 (= #b00000000000000000000000000000000 (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)))))

(assert (=> d!53707 (= (arrayRangesEq!494 (buf!3901 thiss!1602) (array!7605 (store (arr!4364 (buf!3901 thiss!1602)) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) lt!251924) (size!3443 (buf!3901 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)) e!109076)))

(declare-fun b!159617 () Bool)

(declare-fun e!109077 () Bool)

(assert (=> b!159617 (= e!109076 e!109077)))

(declare-fun res!133241 () Bool)

(assert (=> b!159617 (=> (not res!133241) (not e!109077))))

(assert (=> b!159617 (= res!133241 (= (select (arr!4364 (buf!3901 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4364 (array!7605 (store (arr!4364 (buf!3901 thiss!1602)) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) lt!251924) (size!3443 (buf!3901 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159618 () Bool)

(assert (=> b!159618 (= e!109077 (arrayRangesEq!494 (buf!3901 thiss!1602) (array!7605 (store (arr!4364 (buf!3901 thiss!1602)) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) lt!251924) (size!3443 (buf!3901 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)))))

(assert (= (and d!53707 (not res!133240)) b!159617))

(assert (= (and b!159617 res!133241) b!159618))

(assert (=> b!159617 m!251691))

(declare-fun m!251697 () Bool)

(assert (=> b!159617 m!251697))

(declare-fun m!251699 () Bool)

(assert (=> b!159618 m!251699))

(assert (=> b!159573 d!53707))

(declare-fun d!53709 () Bool)

(declare-fun e!109080 () Bool)

(assert (=> d!53709 e!109080))

(declare-fun res!133244 () Bool)

(assert (=> d!53709 (=> (not res!133244) (not e!109080))))

(assert (=> d!53709 (= res!133244 (and (bvsge (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) (size!3443 (buf!3901 thiss!1602)))))))

(declare-fun lt!251967 () Unit!10863)

(declare-fun choose!136 (array!7604 (_ BitVec 32) (_ BitVec 8)) Unit!10863)

(assert (=> d!53709 (= lt!251967 (choose!136 (buf!3901 thiss!1602) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) lt!251924))))

(assert (=> d!53709 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) (size!3443 (buf!3901 thiss!1602))))))

(assert (=> d!53709 (= (arrayUpdatedAtPrefixLemma!102 (buf!3901 thiss!1602) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) lt!251924) lt!251967)))

(declare-fun b!159621 () Bool)

(assert (=> b!159621 (= e!109080 (arrayRangesEq!494 (buf!3901 thiss!1602) (array!7605 (store (arr!4364 (buf!3901 thiss!1602)) (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001) lt!251924) (size!3443 (buf!3901 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7135 (_3!511 lt!251919)) #b00000000000000000000000000000001)))))

(assert (= (and d!53709 res!133244) b!159621))

(declare-fun m!251705 () Bool)

(assert (=> d!53709 m!251705))

(assert (=> b!159621 m!251605))

(assert (=> b!159621 m!251593))

(assert (=> b!159573 d!53709))

(check-sat (not b!159618) (not b!159616) (not d!53679) (not d!53709) (not b!159621) (not d!53677))
(check-sat)

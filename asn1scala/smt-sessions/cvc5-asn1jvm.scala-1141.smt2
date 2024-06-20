; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32260 () Bool)

(assert start!32260)

(declare-fun b!159456 () Bool)

(declare-fun e!108894 () Bool)

(declare-fun e!108891 () Bool)

(assert (=> b!159456 (= e!108894 (not e!108891))))

(declare-fun res!133105 () Bool)

(assert (=> b!159456 (=> res!133105 e!108891)))

(declare-datatypes ((array!7587 0))(
  ( (array!7588 (arr!4357 (Array (_ BitVec 32) (_ BitVec 8))) (size!3436 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6040 0))(
  ( (BitStream!6041 (buf!3894 array!7587) (currentByte!7125 (_ BitVec 32)) (currentBit!7120 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10835 0))(
  ( (Unit!10836) )
))
(declare-datatypes ((tuple3!774 0))(
  ( (tuple3!775 (_1!7735 Unit!10835) (_2!7735 (_ BitVec 8)) (_3!504 BitStream!6040)) )
))
(declare-fun lt!251685 () tuple3!774)

(declare-fun thiss!1602 () BitStream!6040)

(declare-fun lt!251675 () array!7587)

(declare-fun arrayRangesEq!487 (array!7587 array!7587 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159456 (= res!133105 (not (arrayRangesEq!487 (buf!3894 thiss!1602) lt!251675 #b00000000000000000000000000000000 (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001))))))

(declare-fun lt!251680 () (_ BitVec 8))

(assert (=> b!159456 (arrayRangesEq!487 (buf!3894 thiss!1602) (array!7588 (store (arr!4357 (buf!3894 thiss!1602)) (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001) lt!251680) (size!3436 (buf!3894 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001))))

(declare-fun lt!251678 () Unit!10835)

(declare-fun arrayUpdatedAtPrefixLemma!95 (array!7587 (_ BitVec 32) (_ BitVec 8)) Unit!10835)

(assert (=> b!159456 (= lt!251678 (arrayUpdatedAtPrefixLemma!95 (buf!3894 thiss!1602) (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001) lt!251680))))

(assert (=> b!159456 (= lt!251680 (select (arr!4357 (buf!3894 (_3!504 lt!251685))) (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001)))))

(declare-fun lt!251683 () Bool)

(declare-fun lt!251679 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251682 () (_ BitVec 8))

(declare-fun lt!251684 () (_ BitVec 32))

(declare-fun lt!251681 () (_ BitVec 8))

(declare-fun lt!251677 () (_ BitVec 8))

(declare-fun Unit!10837 () Unit!10835)

(declare-fun Unit!10838 () Unit!10835)

(assert (=> b!159456 (= lt!251685 (ite lt!251683 (let ((bdg!9381 ((_ extract 7 0) (bvnot lt!251684)))) (let ((bdg!9382 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4357 (buf!3894 thiss!1602)) (currentByte!7125 thiss!1602) lt!251681) (currentByte!7125 thiss!1602) lt!251677) (bvadd #b00000000000000000000000000000001 (currentByte!7125 thiss!1602)))) ((_ sign_extend 24) bdg!9381))))) (tuple3!775 Unit!10837 bdg!9381 (BitStream!6041 (array!7588 (store (arr!4357 (array!7588 (store (arr!4357 lt!251675) (bvadd #b00000000000000000000000000000001 (currentByte!7125 thiss!1602)) bdg!9382) (size!3436 lt!251675))) (bvadd #b00000000000000000000000000000001 (currentByte!7125 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9382) (bvshl ((_ sign_extend 24) v!222) lt!251679)))) (size!3436 (array!7588 (store (arr!4357 lt!251675) (bvadd #b00000000000000000000000000000001 (currentByte!7125 thiss!1602)) bdg!9382) (size!3436 lt!251675)))) (bvadd #b00000000000000000000000000000001 (currentByte!7125 thiss!1602)) (currentBit!7120 thiss!1602))))) (tuple3!775 Unit!10838 lt!251682 (BitStream!6041 lt!251675 (bvadd #b00000000000000000000000000000001 (currentByte!7125 thiss!1602)) (currentBit!7120 thiss!1602)))))))

(declare-fun lt!251676 () (_ BitVec 32))

(assert (=> b!159456 (= lt!251683 (bvsgt lt!251676 #b00000000000000000000000000000000))))

(declare-fun e!108892 () Bool)

(assert (=> b!159456 e!108892))

(declare-fun res!133104 () Bool)

(assert (=> b!159456 (=> res!133104 e!108892)))

(assert (=> b!159456 (= res!133104 (bvsge (currentByte!7125 thiss!1602) (size!3436 (buf!3894 thiss!1602))))))

(assert (=> b!159456 (= lt!251675 (array!7588 (store (store (arr!4357 (buf!3894 thiss!1602)) (currentByte!7125 thiss!1602) lt!251681) (currentByte!7125 thiss!1602) lt!251677) (size!3436 (buf!3894 thiss!1602))))))

(assert (=> b!159456 (= lt!251677 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251681) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251676))))))

(assert (=> b!159456 (= lt!251681 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4357 (buf!3894 thiss!1602)) (currentByte!7125 thiss!1602))) lt!251684)))))

(assert (=> b!159456 (= lt!251684 ((_ sign_extend 24) lt!251682))))

(assert (=> b!159456 (= lt!251682 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251679)))))))

(assert (=> b!159456 (= lt!251679 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251676))))))

(assert (=> b!159456 (= lt!251676 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7120 thiss!1602))))))

(declare-fun b!159458 () Bool)

(assert (=> b!159458 (= e!108891 (or lt!251683 (bvsle #b00000000000000000000000000000000 (currentByte!7125 thiss!1602))))))

(declare-fun b!159459 () Bool)

(declare-fun e!108893 () Bool)

(declare-fun array_inv!3183 (array!7587) Bool)

(assert (=> b!159459 (= e!108893 (array_inv!3183 (buf!3894 thiss!1602)))))

(declare-fun res!133106 () Bool)

(assert (=> start!32260 (=> (not res!133106) (not e!108894))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32260 (= res!133106 (validate_offset_byte!0 ((_ sign_extend 32) (size!3436 (buf!3894 thiss!1602))) ((_ sign_extend 32) (currentByte!7125 thiss!1602)) ((_ sign_extend 32) (currentBit!7120 thiss!1602))))))

(assert (=> start!32260 e!108894))

(declare-fun inv!12 (BitStream!6040) Bool)

(assert (=> start!32260 (and (inv!12 thiss!1602) e!108893)))

(assert (=> start!32260 true))

(declare-fun b!159457 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159457 (= e!108892 (byteRangesEq!0 (select (arr!4357 (buf!3894 thiss!1602)) (currentByte!7125 thiss!1602)) lt!251677 #b00000000000000000000000000000000 (currentBit!7120 thiss!1602)))))

(assert (= (and start!32260 res!133106) b!159456))

(assert (= (and b!159456 (not res!133104)) b!159457))

(assert (= (and b!159456 (not res!133105)) b!159458))

(assert (= start!32260 b!159459))

(declare-fun m!251299 () Bool)

(assert (=> b!159456 m!251299))

(declare-fun m!251301 () Bool)

(assert (=> b!159456 m!251301))

(declare-fun m!251303 () Bool)

(assert (=> b!159456 m!251303))

(declare-fun m!251305 () Bool)

(assert (=> b!159456 m!251305))

(declare-fun m!251307 () Bool)

(assert (=> b!159456 m!251307))

(declare-fun m!251309 () Bool)

(assert (=> b!159456 m!251309))

(declare-fun m!251311 () Bool)

(assert (=> b!159456 m!251311))

(declare-fun m!251313 () Bool)

(assert (=> b!159456 m!251313))

(declare-fun m!251315 () Bool)

(assert (=> b!159456 m!251315))

(declare-fun m!251317 () Bool)

(assert (=> b!159456 m!251317))

(declare-fun m!251319 () Bool)

(assert (=> b!159456 m!251319))

(declare-fun m!251321 () Bool)

(assert (=> b!159456 m!251321))

(declare-fun m!251323 () Bool)

(assert (=> b!159459 m!251323))

(declare-fun m!251325 () Bool)

(assert (=> start!32260 m!251325))

(declare-fun m!251327 () Bool)

(assert (=> start!32260 m!251327))

(assert (=> b!159457 m!251319))

(assert (=> b!159457 m!251319))

(declare-fun m!251329 () Bool)

(assert (=> b!159457 m!251329))

(push 1)

(assert (not b!159456))

(assert (not start!32260))

(assert (not b!159459))

(assert (not b!159457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53641 () Bool)

(declare-fun res!133146 () Bool)

(declare-fun e!108946 () Bool)

(assert (=> d!53641 (=> res!133146 e!108946)))

(assert (=> d!53641 (= res!133146 (= #b00000000000000000000000000000000 (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001)))))

(assert (=> d!53641 (= (arrayRangesEq!487 (buf!3894 thiss!1602) lt!251675 #b00000000000000000000000000000000 (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001)) e!108946)))

(declare-fun b!159505 () Bool)

(declare-fun e!108947 () Bool)

(assert (=> b!159505 (= e!108946 e!108947)))

(declare-fun res!133147 () Bool)

(assert (=> b!159505 (=> (not res!133147) (not e!108947))))

(assert (=> b!159505 (= res!133147 (= (select (arr!4357 (buf!3894 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4357 lt!251675) #b00000000000000000000000000000000)))))

(declare-fun b!159506 () Bool)

(assert (=> b!159506 (= e!108947 (arrayRangesEq!487 (buf!3894 thiss!1602) lt!251675 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001)))))

(assert (= (and d!53641 (not res!133146)) b!159505))

(assert (= (and b!159505 res!133147) b!159506))

(declare-fun m!251425 () Bool)

(assert (=> b!159505 m!251425))

(declare-fun m!251427 () Bool)

(assert (=> b!159505 m!251427))

(declare-fun m!251429 () Bool)

(assert (=> b!159506 m!251429))

(assert (=> b!159456 d!53641))

(declare-fun d!53645 () Bool)

(declare-fun res!133150 () Bool)

(declare-fun e!108950 () Bool)

(assert (=> d!53645 (=> res!133150 e!108950)))

(assert (=> d!53645 (= res!133150 (= #b00000000000000000000000000000000 (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001)))))

(assert (=> d!53645 (= (arrayRangesEq!487 (buf!3894 thiss!1602) (array!7588 (store (arr!4357 (buf!3894 thiss!1602)) (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001) lt!251680) (size!3436 (buf!3894 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7125 (_3!504 lt!251685)) #b00000000000000000000000000000001)) e!108950)))

(declare-fun b!159509 () Bool)

(declare-fun e!108951 () Bool)


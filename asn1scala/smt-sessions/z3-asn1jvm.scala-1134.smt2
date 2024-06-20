; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32136 () Bool)

(assert start!32136)

(declare-fun b!159044 () Bool)

(declare-fun e!108480 () Bool)

(declare-datatypes ((array!7541 0))(
  ( (array!7542 (arr!4337 (Array (_ BitVec 32) (_ BitVec 8))) (size!3416 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6000 0))(
  ( (BitStream!6001 (buf!3874 array!7541) (currentByte!7099 (_ BitVec 32)) (currentBit!7094 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6000)

(declare-fun lt!250888 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159044 (= e!108480 (byteRangesEq!0 (select (arr!4337 (buf!3874 thiss!1602)) (currentByte!7099 thiss!1602)) lt!250888 #b00000000000000000000000000000000 (currentBit!7094 thiss!1602)))))

(declare-fun b!159045 () Bool)

(declare-fun e!108478 () Bool)

(declare-fun array_inv!3163 (array!7541) Bool)

(assert (=> b!159045 (= e!108478 (array_inv!3163 (buf!3874 thiss!1602)))))

(declare-fun b!159046 () Bool)

(declare-fun res!132752 () Bool)

(declare-fun e!108477 () Bool)

(assert (=> b!159046 (=> res!132752 e!108477)))

(declare-fun lt!250893 () (_ BitVec 32))

(assert (=> b!159046 (= res!132752 (bvsle lt!250893 #b00000000000000000000000000000000))))

(declare-fun b!159047 () Bool)

(assert (=> b!159047 (= e!108477 true)))

(declare-fun lt!250891 () array!7541)

(declare-datatypes ((Unit!10755 0))(
  ( (Unit!10756) )
))
(declare-datatypes ((tuple3!734 0))(
  ( (tuple3!735 (_1!7715 Unit!10755) (_2!7715 (_ BitVec 8)) (_3!484 BitStream!6000)) )
))
(declare-fun lt!250883 () tuple3!734)

(declare-fun lt!250885 () (_ BitVec 8))

(declare-fun arrayRangesEq!467 (array!7541 array!7541 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159047 (arrayRangesEq!467 lt!250891 (array!7542 (store (store (store (arr!4337 (buf!3874 thiss!1602)) (currentByte!7099 thiss!1602) lt!250885) (currentByte!7099 thiss!1602) lt!250888) (currentByte!7099 (_3!484 lt!250883)) (select (arr!4337 (buf!3874 (_3!484 lt!250883))) (currentByte!7099 (_3!484 lt!250883)))) (size!3416 (buf!3874 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7099 (_3!484 lt!250883)))))

(declare-fun lt!250889 () Unit!10755)

(declare-fun arrayUpdatedAtPrefixLemma!75 (array!7541 (_ BitVec 32) (_ BitVec 8)) Unit!10755)

(assert (=> b!159047 (= lt!250889 (arrayUpdatedAtPrefixLemma!75 lt!250891 (currentByte!7099 (_3!484 lt!250883)) (select (arr!4337 (buf!3874 (_3!484 lt!250883))) (currentByte!7099 (_3!484 lt!250883)))))))

(assert (=> b!159047 (arrayRangesEq!467 (buf!3874 thiss!1602) (array!7542 (store (arr!4337 (buf!3874 thiss!1602)) (currentByte!7099 (_3!484 lt!250883)) (select (arr!4337 (buf!3874 (_3!484 lt!250883))) (currentByte!7099 (_3!484 lt!250883)))) (size!3416 (buf!3874 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7099 (_3!484 lt!250883)))))

(declare-fun lt!250884 () Unit!10755)

(assert (=> b!159047 (= lt!250884 (arrayUpdatedAtPrefixLemma!75 (buf!3874 thiss!1602) (currentByte!7099 (_3!484 lt!250883)) (select (arr!4337 (buf!3874 (_3!484 lt!250883))) (currentByte!7099 (_3!484 lt!250883)))))))

(declare-fun res!132755 () Bool)

(declare-fun e!108479 () Bool)

(assert (=> start!32136 (=> (not res!132755) (not e!108479))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32136 (= res!132755 (validate_offset_byte!0 ((_ sign_extend 32) (size!3416 (buf!3874 thiss!1602))) ((_ sign_extend 32) (currentByte!7099 thiss!1602)) ((_ sign_extend 32) (currentBit!7094 thiss!1602))))))

(assert (=> start!32136 e!108479))

(declare-fun inv!12 (BitStream!6000) Bool)

(assert (=> start!32136 (and (inv!12 thiss!1602) e!108478)))

(assert (=> start!32136 true))

(declare-fun b!159048 () Bool)

(assert (=> b!159048 (= e!108479 (not e!108477))))

(declare-fun res!132753 () Bool)

(assert (=> b!159048 (=> res!132753 e!108477)))

(assert (=> b!159048 (= res!132753 (not (arrayRangesEq!467 (buf!3874 thiss!1602) lt!250891 #b00000000000000000000000000000000 (bvsub (currentByte!7099 (_3!484 lt!250883)) #b00000000000000000000000000000001))))))

(declare-fun lt!250886 () (_ BitVec 8))

(assert (=> b!159048 (arrayRangesEq!467 (buf!3874 thiss!1602) (array!7542 (store (arr!4337 (buf!3874 thiss!1602)) (bvsub (currentByte!7099 (_3!484 lt!250883)) #b00000000000000000000000000000001) lt!250886) (size!3416 (buf!3874 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7099 (_3!484 lt!250883)) #b00000000000000000000000000000001))))

(declare-fun lt!250887 () Unit!10755)

(assert (=> b!159048 (= lt!250887 (arrayUpdatedAtPrefixLemma!75 (buf!3874 thiss!1602) (bvsub (currentByte!7099 (_3!484 lt!250883)) #b00000000000000000000000000000001) lt!250886))))

(assert (=> b!159048 (= lt!250886 (select (arr!4337 (buf!3874 (_3!484 lt!250883))) (bvsub (currentByte!7099 (_3!484 lt!250883)) #b00000000000000000000000000000001)))))

(declare-fun lt!250890 () (_ BitVec 8))

(declare-fun lt!250892 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250882 () (_ BitVec 32))

(declare-fun Unit!10757 () Unit!10755)

(declare-fun Unit!10758 () Unit!10755)

(assert (=> b!159048 (= lt!250883 (ite (bvsgt lt!250893 #b00000000000000000000000000000000) (let ((bdg!9279 ((_ extract 7 0) (bvnot lt!250892)))) (let ((bdg!9280 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4337 (buf!3874 thiss!1602)) (currentByte!7099 thiss!1602) lt!250885) (currentByte!7099 thiss!1602) lt!250888) (bvadd #b00000000000000000000000000000001 (currentByte!7099 thiss!1602)))) ((_ sign_extend 24) bdg!9279))))) (tuple3!735 Unit!10757 bdg!9279 (BitStream!6001 (array!7542 (store (arr!4337 (array!7542 (store (arr!4337 lt!250891) (bvadd #b00000000000000000000000000000001 (currentByte!7099 thiss!1602)) bdg!9280) (size!3416 lt!250891))) (bvadd #b00000000000000000000000000000001 (currentByte!7099 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9280) (bvshl ((_ sign_extend 24) v!222) lt!250882)))) (size!3416 (array!7542 (store (arr!4337 lt!250891) (bvadd #b00000000000000000000000000000001 (currentByte!7099 thiss!1602)) bdg!9280) (size!3416 lt!250891)))) (bvadd #b00000000000000000000000000000001 (currentByte!7099 thiss!1602)) (currentBit!7094 thiss!1602))))) (tuple3!735 Unit!10758 lt!250890 (BitStream!6001 lt!250891 (bvadd #b00000000000000000000000000000001 (currentByte!7099 thiss!1602)) (currentBit!7094 thiss!1602)))))))

(assert (=> b!159048 e!108480))

(declare-fun res!132754 () Bool)

(assert (=> b!159048 (=> res!132754 e!108480)))

(assert (=> b!159048 (= res!132754 (bvsge (currentByte!7099 thiss!1602) (size!3416 (buf!3874 thiss!1602))))))

(assert (=> b!159048 (= lt!250891 (array!7542 (store (store (arr!4337 (buf!3874 thiss!1602)) (currentByte!7099 thiss!1602) lt!250885) (currentByte!7099 thiss!1602) lt!250888) (size!3416 (buf!3874 thiss!1602))))))

(assert (=> b!159048 (= lt!250888 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250885) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250893))))))

(assert (=> b!159048 (= lt!250885 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4337 (buf!3874 thiss!1602)) (currentByte!7099 thiss!1602))) lt!250892)))))

(assert (=> b!159048 (= lt!250892 ((_ sign_extend 24) lt!250890))))

(assert (=> b!159048 (= lt!250890 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250882)))))))

(assert (=> b!159048 (= lt!250882 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250893))))))

(assert (=> b!159048 (= lt!250893 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7094 thiss!1602))))))

(assert (= (and start!32136 res!132755) b!159048))

(assert (= (and b!159048 (not res!132754)) b!159044))

(assert (= (and b!159048 (not res!132753)) b!159046))

(assert (= (and b!159046 (not res!132752)) b!159047))

(assert (= start!32136 b!159045))

(declare-fun m!250091 () Bool)

(assert (=> b!159047 m!250091))

(declare-fun m!250093 () Bool)

(assert (=> b!159047 m!250093))

(declare-fun m!250095 () Bool)

(assert (=> b!159047 m!250095))

(declare-fun m!250097 () Bool)

(assert (=> b!159047 m!250097))

(assert (=> b!159047 m!250095))

(declare-fun m!250099 () Bool)

(assert (=> b!159047 m!250099))

(declare-fun m!250101 () Bool)

(assert (=> b!159047 m!250101))

(declare-fun m!250103 () Bool)

(assert (=> b!159047 m!250103))

(declare-fun m!250105 () Bool)

(assert (=> b!159047 m!250105))

(assert (=> b!159047 m!250095))

(declare-fun m!250107 () Bool)

(assert (=> b!159047 m!250107))

(declare-fun m!250109 () Bool)

(assert (=> b!159048 m!250109))

(declare-fun m!250111 () Bool)

(assert (=> b!159048 m!250111))

(assert (=> b!159048 m!250093))

(declare-fun m!250113 () Bool)

(assert (=> b!159048 m!250113))

(declare-fun m!250115 () Bool)

(assert (=> b!159048 m!250115))

(declare-fun m!250117 () Bool)

(assert (=> b!159048 m!250117))

(declare-fun m!250119 () Bool)

(assert (=> b!159048 m!250119))

(declare-fun m!250121 () Bool)

(assert (=> b!159048 m!250121))

(assert (=> b!159048 m!250103))

(declare-fun m!250123 () Bool)

(assert (=> b!159048 m!250123))

(declare-fun m!250125 () Bool)

(assert (=> b!159048 m!250125))

(declare-fun m!250127 () Bool)

(assert (=> b!159048 m!250127))

(declare-fun m!250129 () Bool)

(assert (=> b!159045 m!250129))

(assert (=> b!159044 m!250127))

(assert (=> b!159044 m!250127))

(declare-fun m!250131 () Bool)

(assert (=> b!159044 m!250131))

(declare-fun m!250133 () Bool)

(assert (=> start!32136 m!250133))

(declare-fun m!250135 () Bool)

(assert (=> start!32136 m!250135))

(check-sat (not b!159044) (not b!159045) (not b!159047) (not b!159048) (not start!32136))

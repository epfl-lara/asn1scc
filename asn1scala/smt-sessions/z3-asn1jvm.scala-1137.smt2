; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32154 () Bool)

(assert start!32154)

(declare-fun b!159179 () Bool)

(declare-fun e!108612 () Bool)

(assert (=> b!159179 (= e!108612 true)))

(declare-datatypes ((array!7559 0))(
  ( (array!7560 (arr!4346 (Array (_ BitVec 32) (_ BitVec 8))) (size!3425 (_ BitVec 32))) )
))
(declare-fun lt!251211 () array!7559)

(declare-fun lt!251217 () (_ BitVec 8))

(declare-datatypes ((BitStream!6018 0))(
  ( (BitStream!6019 (buf!3883 array!7559) (currentByte!7108 (_ BitVec 32)) (currentBit!7103 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6018)

(declare-fun lt!251212 () (_ BitVec 8))

(declare-datatypes ((Unit!10791 0))(
  ( (Unit!10792) )
))
(declare-datatypes ((tuple3!752 0))(
  ( (tuple3!753 (_1!7724 Unit!10791) (_2!7724 (_ BitVec 8)) (_3!493 BitStream!6018)) )
))
(declare-fun lt!251206 () tuple3!752)

(declare-fun arrayRangesEq!476 (array!7559 array!7559 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159179 (arrayRangesEq!476 lt!251211 (array!7560 (store (store (store (arr!4346 (buf!3883 thiss!1602)) (currentByte!7108 thiss!1602) lt!251217) (currentByte!7108 thiss!1602) lt!251212) (currentByte!7108 (_3!493 lt!251206)) (select (arr!4346 (buf!3883 (_3!493 lt!251206))) (currentByte!7108 (_3!493 lt!251206)))) (size!3425 (buf!3883 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7108 (_3!493 lt!251206)))))

(declare-fun lt!251210 () Unit!10791)

(declare-fun arrayUpdatedAtPrefixLemma!84 (array!7559 (_ BitVec 32) (_ BitVec 8)) Unit!10791)

(assert (=> b!159179 (= lt!251210 (arrayUpdatedAtPrefixLemma!84 lt!251211 (currentByte!7108 (_3!493 lt!251206)) (select (arr!4346 (buf!3883 (_3!493 lt!251206))) (currentByte!7108 (_3!493 lt!251206)))))))

(assert (=> b!159179 (arrayRangesEq!476 (buf!3883 thiss!1602) (array!7560 (store (arr!4346 (buf!3883 thiss!1602)) (currentByte!7108 (_3!493 lt!251206)) (select (arr!4346 (buf!3883 (_3!493 lt!251206))) (currentByte!7108 (_3!493 lt!251206)))) (size!3425 (buf!3883 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7108 (_3!493 lt!251206)))))

(declare-fun lt!251216 () Unit!10791)

(assert (=> b!159179 (= lt!251216 (arrayUpdatedAtPrefixLemma!84 (buf!3883 thiss!1602) (currentByte!7108 (_3!493 lt!251206)) (select (arr!4346 (buf!3883 (_3!493 lt!251206))) (currentByte!7108 (_3!493 lt!251206)))))))

(declare-fun b!159180 () Bool)

(declare-fun e!108611 () Bool)

(declare-fun array_inv!3172 (array!7559) Bool)

(assert (=> b!159180 (= e!108611 (array_inv!3172 (buf!3883 thiss!1602)))))

(declare-fun res!132860 () Bool)

(declare-fun e!108615 () Bool)

(assert (=> start!32154 (=> (not res!132860) (not e!108615))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32154 (= res!132860 (validate_offset_byte!0 ((_ sign_extend 32) (size!3425 (buf!3883 thiss!1602))) ((_ sign_extend 32) (currentByte!7108 thiss!1602)) ((_ sign_extend 32) (currentBit!7103 thiss!1602))))))

(assert (=> start!32154 e!108615))

(declare-fun inv!12 (BitStream!6018) Bool)

(assert (=> start!32154 (and (inv!12 thiss!1602) e!108611)))

(assert (=> start!32154 true))

(declare-fun b!159181 () Bool)

(assert (=> b!159181 (= e!108615 (not e!108612))))

(declare-fun res!132862 () Bool)

(assert (=> b!159181 (=> res!132862 e!108612)))

(assert (=> b!159181 (= res!132862 (not (arrayRangesEq!476 (buf!3883 thiss!1602) lt!251211 #b00000000000000000000000000000000 (bvsub (currentByte!7108 (_3!493 lt!251206)) #b00000000000000000000000000000001))))))

(declare-fun lt!251214 () (_ BitVec 8))

(assert (=> b!159181 (arrayRangesEq!476 (buf!3883 thiss!1602) (array!7560 (store (arr!4346 (buf!3883 thiss!1602)) (bvsub (currentByte!7108 (_3!493 lt!251206)) #b00000000000000000000000000000001) lt!251214) (size!3425 (buf!3883 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7108 (_3!493 lt!251206)) #b00000000000000000000000000000001))))

(declare-fun lt!251215 () Unit!10791)

(assert (=> b!159181 (= lt!251215 (arrayUpdatedAtPrefixLemma!84 (buf!3883 thiss!1602) (bvsub (currentByte!7108 (_3!493 lt!251206)) #b00000000000000000000000000000001) lt!251214))))

(assert (=> b!159181 (= lt!251214 (select (arr!4346 (buf!3883 (_3!493 lt!251206))) (bvsub (currentByte!7108 (_3!493 lt!251206)) #b00000000000000000000000000000001)))))

(declare-fun lt!251213 () (_ BitVec 32))

(declare-fun lt!251207 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251208 () (_ BitVec 8))

(declare-fun lt!251209 () (_ BitVec 32))

(declare-fun Unit!10793 () Unit!10791)

(declare-fun Unit!10794 () Unit!10791)

(assert (=> b!159181 (= lt!251206 (ite (bvsgt lt!251209 #b00000000000000000000000000000000) (let ((bdg!9321 ((_ extract 7 0) (bvnot lt!251213)))) (let ((bdg!9322 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4346 (buf!3883 thiss!1602)) (currentByte!7108 thiss!1602) lt!251217) (currentByte!7108 thiss!1602) lt!251212) (bvadd #b00000000000000000000000000000001 (currentByte!7108 thiss!1602)))) ((_ sign_extend 24) bdg!9321))))) (tuple3!753 Unit!10793 bdg!9321 (BitStream!6019 (array!7560 (store (arr!4346 (array!7560 (store (arr!4346 lt!251211) (bvadd #b00000000000000000000000000000001 (currentByte!7108 thiss!1602)) bdg!9322) (size!3425 lt!251211))) (bvadd #b00000000000000000000000000000001 (currentByte!7108 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9322) (bvshl ((_ sign_extend 24) v!222) lt!251207)))) (size!3425 (array!7560 (store (arr!4346 lt!251211) (bvadd #b00000000000000000000000000000001 (currentByte!7108 thiss!1602)) bdg!9322) (size!3425 lt!251211)))) (bvadd #b00000000000000000000000000000001 (currentByte!7108 thiss!1602)) (currentBit!7103 thiss!1602))))) (tuple3!753 Unit!10794 lt!251208 (BitStream!6019 lt!251211 (bvadd #b00000000000000000000000000000001 (currentByte!7108 thiss!1602)) (currentBit!7103 thiss!1602)))))))

(declare-fun e!108613 () Bool)

(assert (=> b!159181 e!108613))

(declare-fun res!132863 () Bool)

(assert (=> b!159181 (=> res!132863 e!108613)))

(assert (=> b!159181 (= res!132863 (bvsge (currentByte!7108 thiss!1602) (size!3425 (buf!3883 thiss!1602))))))

(assert (=> b!159181 (= lt!251211 (array!7560 (store (store (arr!4346 (buf!3883 thiss!1602)) (currentByte!7108 thiss!1602) lt!251217) (currentByte!7108 thiss!1602) lt!251212) (size!3425 (buf!3883 thiss!1602))))))

(assert (=> b!159181 (= lt!251212 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251217) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251209))))))

(assert (=> b!159181 (= lt!251217 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4346 (buf!3883 thiss!1602)) (currentByte!7108 thiss!1602))) lt!251213)))))

(assert (=> b!159181 (= lt!251213 ((_ sign_extend 24) lt!251208))))

(assert (=> b!159181 (= lt!251208 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251207)))))))

(assert (=> b!159181 (= lt!251207 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251209))))))

(assert (=> b!159181 (= lt!251209 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7103 thiss!1602))))))

(declare-fun b!159182 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159182 (= e!108613 (byteRangesEq!0 (select (arr!4346 (buf!3883 thiss!1602)) (currentByte!7108 thiss!1602)) lt!251212 #b00000000000000000000000000000000 (currentBit!7103 thiss!1602)))))

(declare-fun b!159183 () Bool)

(declare-fun res!132861 () Bool)

(assert (=> b!159183 (=> res!132861 e!108612)))

(assert (=> b!159183 (= res!132861 (bvsle lt!251209 #b00000000000000000000000000000000))))

(assert (= (and start!32154 res!132860) b!159181))

(assert (= (and b!159181 (not res!132863)) b!159182))

(assert (= (and b!159181 (not res!132862)) b!159183))

(assert (= (and b!159183 (not res!132861)) b!159179))

(assert (= start!32154 b!159180))

(declare-fun m!250505 () Bool)

(assert (=> b!159181 m!250505))

(declare-fun m!250507 () Bool)

(assert (=> b!159181 m!250507))

(declare-fun m!250509 () Bool)

(assert (=> b!159181 m!250509))

(declare-fun m!250511 () Bool)

(assert (=> b!159181 m!250511))

(declare-fun m!250513 () Bool)

(assert (=> b!159181 m!250513))

(declare-fun m!250515 () Bool)

(assert (=> b!159181 m!250515))

(declare-fun m!250517 () Bool)

(assert (=> b!159181 m!250517))

(declare-fun m!250519 () Bool)

(assert (=> b!159181 m!250519))

(declare-fun m!250521 () Bool)

(assert (=> b!159181 m!250521))

(declare-fun m!250523 () Bool)

(assert (=> b!159181 m!250523))

(declare-fun m!250525 () Bool)

(assert (=> b!159181 m!250525))

(declare-fun m!250527 () Bool)

(assert (=> b!159181 m!250527))

(declare-fun m!250529 () Bool)

(assert (=> b!159179 m!250529))

(declare-fun m!250531 () Bool)

(assert (=> b!159179 m!250531))

(declare-fun m!250533 () Bool)

(assert (=> b!159179 m!250533))

(declare-fun m!250535 () Bool)

(assert (=> b!159179 m!250535))

(assert (=> b!159179 m!250531))

(assert (=> b!159179 m!250531))

(declare-fun m!250537 () Bool)

(assert (=> b!159179 m!250537))

(assert (=> b!159179 m!250509))

(assert (=> b!159179 m!250521))

(declare-fun m!250539 () Bool)

(assert (=> b!159179 m!250539))

(declare-fun m!250541 () Bool)

(assert (=> b!159179 m!250541))

(assert (=> b!159182 m!250527))

(assert (=> b!159182 m!250527))

(declare-fun m!250543 () Bool)

(assert (=> b!159182 m!250543))

(declare-fun m!250545 () Bool)

(assert (=> start!32154 m!250545))

(declare-fun m!250547 () Bool)

(assert (=> start!32154 m!250547))

(declare-fun m!250549 () Bool)

(assert (=> b!159180 m!250549))

(check-sat (not start!32154) (not b!159180) (not b!159181) (not b!159179) (not b!159182))

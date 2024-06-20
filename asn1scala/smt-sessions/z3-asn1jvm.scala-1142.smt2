; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32304 () Bool)

(assert start!32304)

(declare-fun lt!251819 () Bool)

(declare-datatypes ((array!7598 0))(
  ( (array!7599 (arr!4361 (Array (_ BitVec 32) (_ BitVec 8))) (size!3440 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6048 0))(
  ( (BitStream!6049 (buf!3898 array!7598) (currentByte!7132 (_ BitVec 32)) (currentBit!7127 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10851 0))(
  ( (Unit!10852) )
))
(declare-datatypes ((tuple3!782 0))(
  ( (tuple3!783 (_1!7739 Unit!10851) (_2!7739 (_ BitVec 8)) (_3!508 BitStream!6048)) )
))
(declare-fun lt!251820 () tuple3!782)

(declare-fun thiss!1602 () BitStream!6048)

(declare-fun b!159539 () Bool)

(declare-fun e!108984 () Bool)

(assert (=> b!159539 (= e!108984 (or lt!251819 (bvsgt #b00000000000000000000000000000000 (currentByte!7132 thiss!1602)) (bvsle (size!3440 (buf!3898 thiss!1602)) (size!3440 (buf!3898 (_3!508 lt!251820))))))))

(declare-fun b!159540 () Bool)

(declare-fun e!108986 () Bool)

(declare-fun array_inv!3187 (array!7598) Bool)

(assert (=> b!159540 (= e!108986 (array_inv!3187 (buf!3898 thiss!1602)))))

(declare-fun b!159538 () Bool)

(declare-fun e!108983 () Bool)

(declare-fun lt!251821 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159538 (= e!108983 (byteRangesEq!0 (select (arr!4361 (buf!3898 thiss!1602)) (currentByte!7132 thiss!1602)) lt!251821 #b00000000000000000000000000000000 (currentBit!7127 thiss!1602)))))

(declare-fun res!133173 () Bool)

(declare-fun e!108987 () Bool)

(assert (=> start!32304 (=> (not res!133173) (not e!108987))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32304 (= res!133173 (validate_offset_byte!0 ((_ sign_extend 32) (size!3440 (buf!3898 thiss!1602))) ((_ sign_extend 32) (currentByte!7132 thiss!1602)) ((_ sign_extend 32) (currentBit!7127 thiss!1602))))))

(assert (=> start!32304 e!108987))

(declare-fun inv!12 (BitStream!6048) Bool)

(assert (=> start!32304 (and (inv!12 thiss!1602) e!108986)))

(assert (=> start!32304 true))

(declare-fun b!159537 () Bool)

(assert (=> b!159537 (= e!108987 (not e!108984))))

(declare-fun res!133174 () Bool)

(assert (=> b!159537 (=> res!133174 e!108984)))

(declare-fun lt!251818 () array!7598)

(declare-fun arrayRangesEq!491 (array!7598 array!7598 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159537 (= res!133174 (not (arrayRangesEq!491 (buf!3898 thiss!1602) lt!251818 #b00000000000000000000000000000000 (bvsub (currentByte!7132 (_3!508 lt!251820)) #b00000000000000000000000000000001))))))

(declare-fun lt!251816 () (_ BitVec 8))

(assert (=> b!159537 (arrayRangesEq!491 (buf!3898 thiss!1602) (array!7599 (store (arr!4361 (buf!3898 thiss!1602)) (bvsub (currentByte!7132 (_3!508 lt!251820)) #b00000000000000000000000000000001) lt!251816) (size!3440 (buf!3898 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7132 (_3!508 lt!251820)) #b00000000000000000000000000000001))))

(declare-fun lt!251823 () Unit!10851)

(declare-fun arrayUpdatedAtPrefixLemma!99 (array!7598 (_ BitVec 32) (_ BitVec 8)) Unit!10851)

(assert (=> b!159537 (= lt!251823 (arrayUpdatedAtPrefixLemma!99 (buf!3898 thiss!1602) (bvsub (currentByte!7132 (_3!508 lt!251820)) #b00000000000000000000000000000001) lt!251816))))

(assert (=> b!159537 (= lt!251816 (select (arr!4361 (buf!3898 (_3!508 lt!251820))) (bvsub (currentByte!7132 (_3!508 lt!251820)) #b00000000000000000000000000000001)))))

(declare-fun lt!251825 () (_ BitVec 32))

(declare-fun lt!251822 () (_ BitVec 32))

(declare-fun lt!251826 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251824 () (_ BitVec 8))

(declare-fun Unit!10853 () Unit!10851)

(declare-fun Unit!10854 () Unit!10851)

(assert (=> b!159537 (= lt!251820 (ite lt!251819 (let ((bdg!9394 ((_ extract 7 0) (bvnot lt!251822)))) (let ((bdg!9395 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4361 (buf!3898 thiss!1602)) (currentByte!7132 thiss!1602) lt!251824) (currentByte!7132 thiss!1602) lt!251821) (bvadd #b00000000000000000000000000000001 (currentByte!7132 thiss!1602)))) ((_ sign_extend 24) bdg!9394))))) (tuple3!783 Unit!10853 bdg!9394 (BitStream!6049 (array!7599 (store (arr!4361 (array!7599 (store (arr!4361 lt!251818) (bvadd #b00000000000000000000000000000001 (currentByte!7132 thiss!1602)) bdg!9395) (size!3440 lt!251818))) (bvadd #b00000000000000000000000000000001 (currentByte!7132 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9395) (bvshl ((_ sign_extend 24) v!222) lt!251825)))) (size!3440 (array!7599 (store (arr!4361 lt!251818) (bvadd #b00000000000000000000000000000001 (currentByte!7132 thiss!1602)) bdg!9395) (size!3440 lt!251818)))) (bvadd #b00000000000000000000000000000001 (currentByte!7132 thiss!1602)) (currentBit!7127 thiss!1602))))) (tuple3!783 Unit!10854 lt!251826 (BitStream!6049 lt!251818 (bvadd #b00000000000000000000000000000001 (currentByte!7132 thiss!1602)) (currentBit!7127 thiss!1602)))))))

(declare-fun lt!251817 () (_ BitVec 32))

(assert (=> b!159537 (= lt!251819 (bvsgt lt!251817 #b00000000000000000000000000000000))))

(assert (=> b!159537 e!108983))

(declare-fun res!133175 () Bool)

(assert (=> b!159537 (=> res!133175 e!108983)))

(assert (=> b!159537 (= res!133175 (bvsge (currentByte!7132 thiss!1602) (size!3440 (buf!3898 thiss!1602))))))

(assert (=> b!159537 (= lt!251818 (array!7599 (store (store (arr!4361 (buf!3898 thiss!1602)) (currentByte!7132 thiss!1602) lt!251824) (currentByte!7132 thiss!1602) lt!251821) (size!3440 (buf!3898 thiss!1602))))))

(assert (=> b!159537 (= lt!251821 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251824) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251817))))))

(assert (=> b!159537 (= lt!251824 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4361 (buf!3898 thiss!1602)) (currentByte!7132 thiss!1602))) lt!251822)))))

(assert (=> b!159537 (= lt!251822 ((_ sign_extend 24) lt!251826))))

(assert (=> b!159537 (= lt!251826 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251825)))))))

(assert (=> b!159537 (= lt!251825 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251817))))))

(assert (=> b!159537 (= lt!251817 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7127 thiss!1602))))))

(assert (= (and start!32304 res!133173) b!159537))

(assert (= (and b!159537 (not res!133175)) b!159538))

(assert (= (and b!159537 (not res!133174)) b!159539))

(assert (= start!32304 b!159540))

(declare-fun m!251487 () Bool)

(assert (=> b!159540 m!251487))

(declare-fun m!251489 () Bool)

(assert (=> b!159538 m!251489))

(assert (=> b!159538 m!251489))

(declare-fun m!251491 () Bool)

(assert (=> b!159538 m!251491))

(declare-fun m!251493 () Bool)

(assert (=> start!32304 m!251493))

(declare-fun m!251495 () Bool)

(assert (=> start!32304 m!251495))

(declare-fun m!251497 () Bool)

(assert (=> b!159537 m!251497))

(declare-fun m!251499 () Bool)

(assert (=> b!159537 m!251499))

(declare-fun m!251501 () Bool)

(assert (=> b!159537 m!251501))

(declare-fun m!251503 () Bool)

(assert (=> b!159537 m!251503))

(declare-fun m!251505 () Bool)

(assert (=> b!159537 m!251505))

(declare-fun m!251507 () Bool)

(assert (=> b!159537 m!251507))

(declare-fun m!251509 () Bool)

(assert (=> b!159537 m!251509))

(assert (=> b!159537 m!251489))

(declare-fun m!251511 () Bool)

(assert (=> b!159537 m!251511))

(declare-fun m!251513 () Bool)

(assert (=> b!159537 m!251513))

(declare-fun m!251515 () Bool)

(assert (=> b!159537 m!251515))

(declare-fun m!251517 () Bool)

(assert (=> b!159537 m!251517))

(check-sat (not b!159540) (not start!32304) (not b!159538) (not b!159537))
(check-sat)

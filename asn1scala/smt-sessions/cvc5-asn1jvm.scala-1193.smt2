; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33872 () Bool)

(assert start!33872)

(declare-fun b!161783 () Bool)

(declare-fun e!111503 () Bool)

(declare-datatypes ((array!8010 0))(
  ( (array!8011 (arr!4513 (Array (_ BitVec 32) (_ BitVec 8))) (size!3592 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6352 0))(
  ( (BitStream!6353 (buf!4050 array!8010) (currentByte!7544 (_ BitVec 32)) (currentBit!7539 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6352)

(declare-fun lt!254709 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161783 (= e!111503 (byteRangesEq!0 (select (arr!4513 (buf!4050 thiss!1602)) (currentByte!7544 thiss!1602)) lt!254709 #b00000000000000000000000000000000 (currentBit!7539 thiss!1602)))))

(declare-fun b!161784 () Bool)

(declare-fun e!111502 () Bool)

(declare-fun array_inv!3339 (array!8010) Bool)

(assert (=> b!161784 (= e!111502 (array_inv!3339 (buf!4050 thiss!1602)))))

(declare-fun res!134873 () Bool)

(declare-fun e!111501 () Bool)

(assert (=> start!33872 (=> (not res!134873) (not e!111501))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33872 (= res!134873 (validate_offset_byte!0 ((_ sign_extend 32) (size!3592 (buf!4050 thiss!1602))) ((_ sign_extend 32) (currentByte!7544 thiss!1602)) ((_ sign_extend 32) (currentBit!7539 thiss!1602))))))

(assert (=> start!33872 e!111501))

(declare-fun inv!12 (BitStream!6352) Bool)

(assert (=> start!33872 (and (inv!12 thiss!1602) e!111502)))

(assert (=> start!33872 true))

(declare-fun b!161785 () Bool)

(declare-fun e!111500 () Bool)

(assert (=> b!161785 (= e!111501 (not e!111500))))

(declare-fun res!134874 () Bool)

(assert (=> b!161785 (=> res!134874 e!111500)))

(declare-fun lt!254715 () array!8010)

(declare-datatypes ((Unit!11138 0))(
  ( (Unit!11139) )
))
(declare-datatypes ((tuple3!912 0))(
  ( (tuple3!913 (_1!7807 Unit!11138) (_2!7807 (_ BitVec 8)) (_3!573 BitStream!6352)) )
))
(declare-fun lt!254707 () tuple3!912)

(declare-fun arrayRangesEq!544 (array!8010 array!8010 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161785 (= res!134874 (not (arrayRangesEq!544 (buf!4050 thiss!1602) lt!254715 #b00000000000000000000000000000000 (bvsub (currentByte!7544 (_3!573 lt!254707)) #b00000000000000000000000000000001))))))

(declare-fun lt!254712 () (_ BitVec 8))

(assert (=> b!161785 (arrayRangesEq!544 (buf!4050 thiss!1602) (array!8011 (store (arr!4513 (buf!4050 thiss!1602)) (bvsub (currentByte!7544 (_3!573 lt!254707)) #b00000000000000000000000000000001) lt!254712) (size!3592 (buf!4050 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7544 (_3!573 lt!254707)) #b00000000000000000000000000000001))))

(declare-fun lt!254718 () Unit!11138)

(declare-fun arrayUpdatedAtPrefixLemma!152 (array!8010 (_ BitVec 32) (_ BitVec 8)) Unit!11138)

(assert (=> b!161785 (= lt!254718 (arrayUpdatedAtPrefixLemma!152 (buf!4050 thiss!1602) (bvsub (currentByte!7544 (_3!573 lt!254707)) #b00000000000000000000000000000001) lt!254712))))

(assert (=> b!161785 (= lt!254712 (select (arr!4513 (buf!4050 (_3!573 lt!254707))) (bvsub (currentByte!7544 (_3!573 lt!254707)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254714 () (_ BitVec 32))

(declare-fun lt!254716 () (_ BitVec 8))

(declare-fun lt!254713 () (_ BitVec 32))

(declare-fun lt!254717 () (_ BitVec 8))

(declare-fun lt!254711 () (_ BitVec 32))

(declare-fun Unit!11140 () Unit!11138)

(declare-fun Unit!11141 () Unit!11138)

(assert (=> b!161785 (= lt!254707 (ite (bvsgt lt!254711 #b00000000000000000000000000000000) (let ((bdg!9719 ((_ extract 7 0) (bvnot lt!254714)))) (let ((bdg!9720 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4513 (buf!4050 thiss!1602)) (currentByte!7544 thiss!1602) lt!254717) (currentByte!7544 thiss!1602) lt!254709) (bvadd #b00000000000000000000000000000001 (currentByte!7544 thiss!1602)))) ((_ sign_extend 24) bdg!9719))))) (tuple3!913 Unit!11140 bdg!9719 (BitStream!6353 (array!8011 (store (arr!4513 (array!8011 (store (arr!4513 lt!254715) (bvadd #b00000000000000000000000000000001 (currentByte!7544 thiss!1602)) bdg!9720) (size!3592 lt!254715))) (bvadd #b00000000000000000000000000000001 (currentByte!7544 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9720) (bvshl ((_ sign_extend 24) v!222) lt!254713)))) (size!3592 (array!8011 (store (arr!4513 lt!254715) (bvadd #b00000000000000000000000000000001 (currentByte!7544 thiss!1602)) bdg!9720) (size!3592 lt!254715)))) (bvadd #b00000000000000000000000000000001 (currentByte!7544 thiss!1602)) (currentBit!7539 thiss!1602))))) (tuple3!913 Unit!11141 lt!254716 (BitStream!6353 lt!254715 (bvadd #b00000000000000000000000000000001 (currentByte!7544 thiss!1602)) (currentBit!7539 thiss!1602)))))))

(assert (=> b!161785 e!111503))

(declare-fun res!134875 () Bool)

(assert (=> b!161785 (=> res!134875 e!111503)))

(assert (=> b!161785 (= res!134875 (bvsge (currentByte!7544 thiss!1602) (size!3592 (buf!4050 thiss!1602))))))

(assert (=> b!161785 (= lt!254715 (array!8011 (store (store (arr!4513 (buf!4050 thiss!1602)) (currentByte!7544 thiss!1602) lt!254717) (currentByte!7544 thiss!1602) lt!254709) (size!3592 (buf!4050 thiss!1602))))))

(assert (=> b!161785 (= lt!254709 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254717) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254711))))))

(assert (=> b!161785 (= lt!254717 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4513 (buf!4050 thiss!1602)) (currentByte!7544 thiss!1602))) lt!254714)))))

(assert (=> b!161785 (= lt!254714 ((_ sign_extend 24) lt!254716))))

(assert (=> b!161785 (= lt!254716 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254713)))))))

(assert (=> b!161785 (= lt!254713 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254711))))))

(assert (=> b!161785 (= lt!254711 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7539 thiss!1602))))))

(declare-fun b!161786 () Bool)

(assert (=> b!161786 (= e!111500 (arrayRangesEq!544 (buf!4050 thiss!1602) (buf!4050 (_3!573 lt!254707)) #b00000000000000000000000000000000 (currentByte!7544 thiss!1602)))))

(assert (=> b!161786 (arrayRangesEq!544 (buf!4050 thiss!1602) (buf!4050 (_3!573 lt!254707)) #b00000000000000000000000000000000 (bvsub (currentByte!7544 (_3!573 lt!254707)) #b00000000000000000000000000000001))))

(declare-fun lt!254710 () Unit!11138)

(declare-fun arrayRangesEqTransitive!142 (array!8010 array!8010 array!8010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11138)

(assert (=> b!161786 (= lt!254710 (arrayRangesEqTransitive!142 (buf!4050 thiss!1602) lt!254715 (buf!4050 (_3!573 lt!254707)) #b00000000000000000000000000000000 (bvsub (currentByte!7544 (_3!573 lt!254707)) #b00000000000000000000000000000001) (currentByte!7544 (_3!573 lt!254707))))))

(assert (=> b!161786 (arrayRangesEq!544 lt!254715 (array!8011 (store (store (store (arr!4513 (buf!4050 thiss!1602)) (currentByte!7544 thiss!1602) lt!254717) (currentByte!7544 thiss!1602) lt!254709) (currentByte!7544 (_3!573 lt!254707)) (select (arr!4513 (buf!4050 (_3!573 lt!254707))) (currentByte!7544 (_3!573 lt!254707)))) (size!3592 (buf!4050 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7544 (_3!573 lt!254707)))))

(declare-fun lt!254708 () Unit!11138)

(assert (=> b!161786 (= lt!254708 (arrayUpdatedAtPrefixLemma!152 lt!254715 (currentByte!7544 (_3!573 lt!254707)) (select (arr!4513 (buf!4050 (_3!573 lt!254707))) (currentByte!7544 (_3!573 lt!254707)))))))

(assert (=> b!161786 (arrayRangesEq!544 (buf!4050 thiss!1602) (array!8011 (store (arr!4513 (buf!4050 thiss!1602)) (currentByte!7544 (_3!573 lt!254707)) (select (arr!4513 (buf!4050 (_3!573 lt!254707))) (currentByte!7544 (_3!573 lt!254707)))) (size!3592 (buf!4050 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7544 (_3!573 lt!254707)))))

(declare-fun lt!254706 () Unit!11138)

(assert (=> b!161786 (= lt!254706 (arrayUpdatedAtPrefixLemma!152 (buf!4050 thiss!1602) (currentByte!7544 (_3!573 lt!254707)) (select (arr!4513 (buf!4050 (_3!573 lt!254707))) (currentByte!7544 (_3!573 lt!254707)))))))

(declare-fun b!161787 () Bool)

(declare-fun res!134876 () Bool)

(assert (=> b!161787 (=> res!134876 e!111500)))

(assert (=> b!161787 (= res!134876 (bvsle lt!254711 #b00000000000000000000000000000000))))

(assert (= (and start!33872 res!134873) b!161785))

(assert (= (and b!161785 (not res!134875)) b!161783))

(assert (= (and b!161785 (not res!134874)) b!161787))

(assert (= (and b!161787 (not res!134876)) b!161786))

(assert (= start!33872 b!161784))

(declare-fun m!256587 () Bool)

(assert (=> b!161786 m!256587))

(declare-fun m!256589 () Bool)

(assert (=> b!161786 m!256589))

(declare-fun m!256591 () Bool)

(assert (=> b!161786 m!256591))

(declare-fun m!256593 () Bool)

(assert (=> b!161786 m!256593))

(declare-fun m!256595 () Bool)

(assert (=> b!161786 m!256595))

(declare-fun m!256597 () Bool)

(assert (=> b!161786 m!256597))

(declare-fun m!256599 () Bool)

(assert (=> b!161786 m!256599))

(assert (=> b!161786 m!256587))

(declare-fun m!256601 () Bool)

(assert (=> b!161786 m!256601))

(declare-fun m!256603 () Bool)

(assert (=> b!161786 m!256603))

(assert (=> b!161786 m!256587))

(declare-fun m!256605 () Bool)

(assert (=> b!161786 m!256605))

(declare-fun m!256607 () Bool)

(assert (=> b!161786 m!256607))

(declare-fun m!256609 () Bool)

(assert (=> b!161786 m!256609))

(declare-fun m!256611 () Bool)

(assert (=> start!33872 m!256611))

(declare-fun m!256613 () Bool)

(assert (=> start!33872 m!256613))

(declare-fun m!256615 () Bool)

(assert (=> b!161784 m!256615))

(declare-fun m!256617 () Bool)

(assert (=> b!161785 m!256617))

(declare-fun m!256619 () Bool)

(assert (=> b!161785 m!256619))

(assert (=> b!161785 m!256597))

(declare-fun m!256621 () Bool)

(assert (=> b!161785 m!256621))

(declare-fun m!256623 () Bool)

(assert (=> b!161785 m!256623))

(assert (=> b!161785 m!256603))

(declare-fun m!256625 () Bool)

(assert (=> b!161785 m!256625))

(declare-fun m!256627 () Bool)

(assert (=> b!161785 m!256627))

(declare-fun m!256629 () Bool)

(assert (=> b!161785 m!256629))

(declare-fun m!256631 () Bool)

(assert (=> b!161785 m!256631))

(declare-fun m!256633 () Bool)

(assert (=> b!161785 m!256633))

(declare-fun m!256635 () Bool)

(assert (=> b!161785 m!256635))

(assert (=> b!161783 m!256625))

(assert (=> b!161783 m!256625))

(declare-fun m!256637 () Bool)

(assert (=> b!161783 m!256637))

(push 1)

(assert (not b!161785))

(assert (not b!161786))

(assert (not b!161784))

(assert (not b!161783))

(assert (not start!33872))

(check-sat)

(pop 1)

(push 1)

(check-sat)


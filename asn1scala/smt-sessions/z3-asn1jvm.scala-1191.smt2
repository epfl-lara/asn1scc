; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33862 () Bool)

(assert start!33862)

(declare-fun b!161699 () Bool)

(declare-fun e!111416 () Bool)

(assert (=> b!161699 (= e!111416 true)))

(declare-fun lt!254534 () (_ BitVec 8))

(declare-datatypes ((array!8000 0))(
  ( (array!8001 (arr!4508 (Array (_ BitVec 32) (_ BitVec 8))) (size!3587 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6342 0))(
  ( (BitStream!6343 (buf!4045 array!8000) (currentByte!7539 (_ BitVec 32)) (currentBit!7534 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11118 0))(
  ( (Unit!11119) )
))
(declare-datatypes ((tuple3!902 0))(
  ( (tuple3!903 (_1!7802 Unit!11118) (_2!7802 (_ BitVec 8)) (_3!568 BitStream!6342)) )
))
(declare-fun lt!254530 () tuple3!902)

(declare-fun lt!254527 () (_ BitVec 8))

(declare-fun thiss!1602 () BitStream!6342)

(declare-fun lt!254533 () array!8000)

(declare-fun arrayRangesEq!539 (array!8000 array!8000 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161699 (arrayRangesEq!539 lt!254533 (array!8001 (store (store (store (arr!4508 (buf!4045 thiss!1602)) (currentByte!7539 thiss!1602) lt!254527) (currentByte!7539 thiss!1602) lt!254534) (currentByte!7539 (_3!568 lt!254530)) (select (arr!4508 (buf!4045 (_3!568 lt!254530))) (currentByte!7539 (_3!568 lt!254530)))) (size!3587 (buf!4045 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7539 (_3!568 lt!254530)))))

(declare-fun lt!254535 () Unit!11118)

(declare-fun arrayUpdatedAtPrefixLemma!147 (array!8000 (_ BitVec 32) (_ BitVec 8)) Unit!11118)

(assert (=> b!161699 (= lt!254535 (arrayUpdatedAtPrefixLemma!147 lt!254533 (currentByte!7539 (_3!568 lt!254530)) (select (arr!4508 (buf!4045 (_3!568 lt!254530))) (currentByte!7539 (_3!568 lt!254530)))))))

(assert (=> b!161699 (arrayRangesEq!539 (buf!4045 thiss!1602) (array!8001 (store (arr!4508 (buf!4045 thiss!1602)) (currentByte!7539 (_3!568 lt!254530)) (select (arr!4508 (buf!4045 (_3!568 lt!254530))) (currentByte!7539 (_3!568 lt!254530)))) (size!3587 (buf!4045 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7539 (_3!568 lt!254530)))))

(declare-fun lt!254532 () Unit!11118)

(assert (=> b!161699 (= lt!254532 (arrayUpdatedAtPrefixLemma!147 (buf!4045 thiss!1602) (currentByte!7539 (_3!568 lt!254530)) (select (arr!4508 (buf!4045 (_3!568 lt!254530))) (currentByte!7539 (_3!568 lt!254530)))))))

(declare-fun res!134807 () Bool)

(declare-fun e!111417 () Bool)

(assert (=> start!33862 (=> (not res!134807) (not e!111417))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33862 (= res!134807 (validate_offset_byte!0 ((_ sign_extend 32) (size!3587 (buf!4045 thiss!1602))) ((_ sign_extend 32) (currentByte!7539 thiss!1602)) ((_ sign_extend 32) (currentBit!7534 thiss!1602))))))

(assert (=> start!33862 e!111417))

(declare-fun e!111418 () Bool)

(declare-fun inv!12 (BitStream!6342) Bool)

(assert (=> start!33862 (and (inv!12 thiss!1602) e!111418)))

(assert (=> start!33862 true))

(declare-fun b!161700 () Bool)

(declare-fun res!134804 () Bool)

(assert (=> b!161700 (=> res!134804 e!111416)))

(declare-fun lt!254525 () (_ BitVec 32))

(assert (=> b!161700 (= res!134804 (bvsle lt!254525 #b00000000000000000000000000000000))))

(declare-fun b!161701 () Bool)

(assert (=> b!161701 (= e!111417 (not e!111416))))

(declare-fun res!134805 () Bool)

(assert (=> b!161701 (=> res!134805 e!111416)))

(assert (=> b!161701 (= res!134805 (not (arrayRangesEq!539 (buf!4045 thiss!1602) lt!254533 #b00000000000000000000000000000000 (bvsub (currentByte!7539 (_3!568 lt!254530)) #b00000000000000000000000000000001))))))

(declare-fun lt!254526 () (_ BitVec 8))

(assert (=> b!161701 (arrayRangesEq!539 (buf!4045 thiss!1602) (array!8001 (store (arr!4508 (buf!4045 thiss!1602)) (bvsub (currentByte!7539 (_3!568 lt!254530)) #b00000000000000000000000000000001) lt!254526) (size!3587 (buf!4045 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7539 (_3!568 lt!254530)) #b00000000000000000000000000000001))))

(declare-fun lt!254524 () Unit!11118)

(assert (=> b!161701 (= lt!254524 (arrayUpdatedAtPrefixLemma!147 (buf!4045 thiss!1602) (bvsub (currentByte!7539 (_3!568 lt!254530)) #b00000000000000000000000000000001) lt!254526))))

(assert (=> b!161701 (= lt!254526 (select (arr!4508 (buf!4045 (_3!568 lt!254530))) (bvsub (currentByte!7539 (_3!568 lt!254530)) #b00000000000000000000000000000001)))))

(declare-fun lt!254528 () (_ BitVec 32))

(declare-fun lt!254529 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254531 () (_ BitVec 8))

(declare-fun Unit!11120 () Unit!11118)

(declare-fun Unit!11121 () Unit!11118)

(assert (=> b!161701 (= lt!254530 (ite (bvsgt lt!254525 #b00000000000000000000000000000000) (let ((bdg!9691 ((_ extract 7 0) (bvnot lt!254528)))) (let ((bdg!9692 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4508 (buf!4045 thiss!1602)) (currentByte!7539 thiss!1602) lt!254527) (currentByte!7539 thiss!1602) lt!254534) (bvadd #b00000000000000000000000000000001 (currentByte!7539 thiss!1602)))) ((_ sign_extend 24) bdg!9691))))) (tuple3!903 Unit!11120 bdg!9691 (BitStream!6343 (array!8001 (store (arr!4508 (array!8001 (store (arr!4508 lt!254533) (bvadd #b00000000000000000000000000000001 (currentByte!7539 thiss!1602)) bdg!9692) (size!3587 lt!254533))) (bvadd #b00000000000000000000000000000001 (currentByte!7539 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9692) (bvshl ((_ sign_extend 24) v!222) lt!254529)))) (size!3587 (array!8001 (store (arr!4508 lt!254533) (bvadd #b00000000000000000000000000000001 (currentByte!7539 thiss!1602)) bdg!9692) (size!3587 lt!254533)))) (bvadd #b00000000000000000000000000000001 (currentByte!7539 thiss!1602)) (currentBit!7534 thiss!1602))))) (tuple3!903 Unit!11121 lt!254531 (BitStream!6343 lt!254533 (bvadd #b00000000000000000000000000000001 (currentByte!7539 thiss!1602)) (currentBit!7534 thiss!1602)))))))

(declare-fun e!111419 () Bool)

(assert (=> b!161701 e!111419))

(declare-fun res!134806 () Bool)

(assert (=> b!161701 (=> res!134806 e!111419)))

(assert (=> b!161701 (= res!134806 (bvsge (currentByte!7539 thiss!1602) (size!3587 (buf!4045 thiss!1602))))))

(assert (=> b!161701 (= lt!254533 (array!8001 (store (store (arr!4508 (buf!4045 thiss!1602)) (currentByte!7539 thiss!1602) lt!254527) (currentByte!7539 thiss!1602) lt!254534) (size!3587 (buf!4045 thiss!1602))))))

(assert (=> b!161701 (= lt!254534 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254527) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254525))))))

(assert (=> b!161701 (= lt!254527 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4508 (buf!4045 thiss!1602)) (currentByte!7539 thiss!1602))) lt!254528)))))

(assert (=> b!161701 (= lt!254528 ((_ sign_extend 24) lt!254531))))

(assert (=> b!161701 (= lt!254531 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254529)))))))

(assert (=> b!161701 (= lt!254529 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254525))))))

(assert (=> b!161701 (= lt!254525 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7534 thiss!1602))))))

(declare-fun b!161702 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161702 (= e!111419 (byteRangesEq!0 (select (arr!4508 (buf!4045 thiss!1602)) (currentByte!7539 thiss!1602)) lt!254534 #b00000000000000000000000000000000 (currentBit!7534 thiss!1602)))))

(declare-fun b!161703 () Bool)

(declare-fun array_inv!3334 (array!8000) Bool)

(assert (=> b!161703 (= e!111418 (array_inv!3334 (buf!4045 thiss!1602)))))

(assert (= (and start!33862 res!134807) b!161701))

(assert (= (and b!161701 (not res!134806)) b!161702))

(assert (= (and b!161701 (not res!134805)) b!161700))

(assert (= (and b!161700 (not res!134804)) b!161699))

(assert (= start!33862 b!161703))

(declare-fun m!256351 () Bool)

(assert (=> b!161703 m!256351))

(declare-fun m!256353 () Bool)

(assert (=> b!161702 m!256353))

(assert (=> b!161702 m!256353))

(declare-fun m!256355 () Bool)

(assert (=> b!161702 m!256355))

(declare-fun m!256357 () Bool)

(assert (=> start!33862 m!256357))

(declare-fun m!256359 () Bool)

(assert (=> start!33862 m!256359))

(declare-fun m!256361 () Bool)

(assert (=> b!161699 m!256361))

(declare-fun m!256363 () Bool)

(assert (=> b!161699 m!256363))

(declare-fun m!256365 () Bool)

(assert (=> b!161699 m!256365))

(declare-fun m!256367 () Bool)

(assert (=> b!161699 m!256367))

(declare-fun m!256369 () Bool)

(assert (=> b!161699 m!256369))

(assert (=> b!161699 m!256361))

(declare-fun m!256371 () Bool)

(assert (=> b!161699 m!256371))

(declare-fun m!256373 () Bool)

(assert (=> b!161699 m!256373))

(assert (=> b!161699 m!256361))

(declare-fun m!256375 () Bool)

(assert (=> b!161699 m!256375))

(declare-fun m!256377 () Bool)

(assert (=> b!161699 m!256377))

(declare-fun m!256379 () Bool)

(assert (=> b!161701 m!256379))

(declare-fun m!256381 () Bool)

(assert (=> b!161701 m!256381))

(declare-fun m!256383 () Bool)

(assert (=> b!161701 m!256383))

(assert (=> b!161701 m!256367))

(assert (=> b!161701 m!256353))

(declare-fun m!256385 () Bool)

(assert (=> b!161701 m!256385))

(declare-fun m!256387 () Bool)

(assert (=> b!161701 m!256387))

(declare-fun m!256389 () Bool)

(assert (=> b!161701 m!256389))

(assert (=> b!161701 m!256377))

(declare-fun m!256391 () Bool)

(assert (=> b!161701 m!256391))

(declare-fun m!256393 () Bool)

(assert (=> b!161701 m!256393))

(declare-fun m!256395 () Bool)

(assert (=> b!161701 m!256395))

(check-sat (not b!161703) (not b!161701) (not b!161702) (not start!33862) (not b!161699))

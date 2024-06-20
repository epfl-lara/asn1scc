; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33866 () Bool)

(assert start!33866)

(declare-fun b!161731 () Bool)

(declare-fun e!111452 () Bool)

(declare-fun e!111451 () Bool)

(assert (=> b!161731 (= e!111452 e!111451)))

(declare-fun res!134832 () Bool)

(assert (=> b!161731 (=> res!134832 e!111451)))

(declare-datatypes ((array!8004 0))(
  ( (array!8005 (arr!4510 (Array (_ BitVec 32) (_ BitVec 8))) (size!3589 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6346 0))(
  ( (BitStream!6347 (buf!4047 array!8004) (currentByte!7541 (_ BitVec 32)) (currentBit!7536 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11126 0))(
  ( (Unit!11127) )
))
(declare-datatypes ((tuple3!906 0))(
  ( (tuple3!907 (_1!7804 Unit!11126) (_2!7804 (_ BitVec 8)) (_3!570 BitStream!6346)) )
))
(declare-fun lt!254606 () tuple3!906)

(declare-fun thiss!1602 () BitStream!6346)

(assert (=> b!161731 (= res!134832 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7541 (_3!570 lt!254606)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7541 (_3!570 lt!254606)) #b00000000000000000000000000000001) (currentByte!7541 (_3!570 lt!254606))) (bvsgt (size!3589 (buf!4047 thiss!1602)) (size!3589 (buf!4047 (_3!570 lt!254606)))) (bvsgt (bvsub (currentByte!7541 (_3!570 lt!254606)) #b00000000000000000000000000000001) (size!3589 (buf!4047 thiss!1602))) (bvsgt (currentByte!7541 (_3!570 lt!254606)) (size!3589 (buf!4047 thiss!1602)))))))

(declare-fun lt!254599 () array!8004)

(declare-fun lt!254607 () (_ BitVec 8))

(declare-fun lt!254605 () (_ BitVec 8))

(declare-fun arrayRangesEq!541 (array!8004 array!8004 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161731 (arrayRangesEq!541 lt!254599 (array!8005 (store (store (store (arr!4510 (buf!4047 thiss!1602)) (currentByte!7541 thiss!1602) lt!254607) (currentByte!7541 thiss!1602) lt!254605) (currentByte!7541 (_3!570 lt!254606)) (select (arr!4510 (buf!4047 (_3!570 lt!254606))) (currentByte!7541 (_3!570 lt!254606)))) (size!3589 (buf!4047 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7541 (_3!570 lt!254606)))))

(declare-fun lt!254596 () Unit!11126)

(declare-fun arrayUpdatedAtPrefixLemma!149 (array!8004 (_ BitVec 32) (_ BitVec 8)) Unit!11126)

(assert (=> b!161731 (= lt!254596 (arrayUpdatedAtPrefixLemma!149 lt!254599 (currentByte!7541 (_3!570 lt!254606)) (select (arr!4510 (buf!4047 (_3!570 lt!254606))) (currentByte!7541 (_3!570 lt!254606)))))))

(assert (=> b!161731 (arrayRangesEq!541 (buf!4047 thiss!1602) (array!8005 (store (arr!4510 (buf!4047 thiss!1602)) (currentByte!7541 (_3!570 lt!254606)) (select (arr!4510 (buf!4047 (_3!570 lt!254606))) (currentByte!7541 (_3!570 lt!254606)))) (size!3589 (buf!4047 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7541 (_3!570 lt!254606)))))

(declare-fun lt!254602 () Unit!11126)

(assert (=> b!161731 (= lt!254602 (arrayUpdatedAtPrefixLemma!149 (buf!4047 thiss!1602) (currentByte!7541 (_3!570 lt!254606)) (select (arr!4510 (buf!4047 (_3!570 lt!254606))) (currentByte!7541 (_3!570 lt!254606)))))))

(declare-fun b!161732 () Bool)

(assert (=> b!161732 (= e!111451 (arrayRangesEq!541 lt!254599 (buf!4047 (_3!570 lt!254606)) #b00000000000000000000000000000000 (currentByte!7541 (_3!570 lt!254606))))))

(declare-fun b!161733 () Bool)

(declare-fun e!111448 () Bool)

(assert (=> b!161733 (= e!111448 (not e!111452))))

(declare-fun res!134833 () Bool)

(assert (=> b!161733 (=> res!134833 e!111452)))

(assert (=> b!161733 (= res!134833 (not (arrayRangesEq!541 (buf!4047 thiss!1602) lt!254599 #b00000000000000000000000000000000 (bvsub (currentByte!7541 (_3!570 lt!254606)) #b00000000000000000000000000000001))))))

(declare-fun lt!254598 () (_ BitVec 8))

(assert (=> b!161733 (arrayRangesEq!541 (buf!4047 thiss!1602) (array!8005 (store (arr!4510 (buf!4047 thiss!1602)) (bvsub (currentByte!7541 (_3!570 lt!254606)) #b00000000000000000000000000000001) lt!254598) (size!3589 (buf!4047 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7541 (_3!570 lt!254606)) #b00000000000000000000000000000001))))

(declare-fun lt!254604 () Unit!11126)

(assert (=> b!161733 (= lt!254604 (arrayUpdatedAtPrefixLemma!149 (buf!4047 thiss!1602) (bvsub (currentByte!7541 (_3!570 lt!254606)) #b00000000000000000000000000000001) lt!254598))))

(assert (=> b!161733 (= lt!254598 (select (arr!4510 (buf!4047 (_3!570 lt!254606))) (bvsub (currentByte!7541 (_3!570 lt!254606)) #b00000000000000000000000000000001)))))

(declare-fun lt!254600 () (_ BitVec 32))

(declare-fun lt!254603 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254601 () (_ BitVec 8))

(declare-fun lt!254597 () (_ BitVec 32))

(declare-fun Unit!11128 () Unit!11126)

(declare-fun Unit!11129 () Unit!11126)

(assert (=> b!161733 (= lt!254606 (ite (bvsgt lt!254603 #b00000000000000000000000000000000) (let ((bdg!9705 ((_ extract 7 0) (bvnot lt!254600)))) (let ((bdg!9706 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4510 (buf!4047 thiss!1602)) (currentByte!7541 thiss!1602) lt!254607) (currentByte!7541 thiss!1602) lt!254605) (bvadd #b00000000000000000000000000000001 (currentByte!7541 thiss!1602)))) ((_ sign_extend 24) bdg!9705))))) (tuple3!907 Unit!11128 bdg!9705 (BitStream!6347 (array!8005 (store (arr!4510 (array!8005 (store (arr!4510 lt!254599) (bvadd #b00000000000000000000000000000001 (currentByte!7541 thiss!1602)) bdg!9706) (size!3589 lt!254599))) (bvadd #b00000000000000000000000000000001 (currentByte!7541 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9706) (bvshl ((_ sign_extend 24) v!222) lt!254597)))) (size!3589 (array!8005 (store (arr!4510 lt!254599) (bvadd #b00000000000000000000000000000001 (currentByte!7541 thiss!1602)) bdg!9706) (size!3589 lt!254599)))) (bvadd #b00000000000000000000000000000001 (currentByte!7541 thiss!1602)) (currentBit!7536 thiss!1602))))) (tuple3!907 Unit!11129 lt!254601 (BitStream!6347 lt!254599 (bvadd #b00000000000000000000000000000001 (currentByte!7541 thiss!1602)) (currentBit!7536 thiss!1602)))))))

(declare-fun e!111453 () Bool)

(assert (=> b!161733 e!111453))

(declare-fun res!134830 () Bool)

(assert (=> b!161733 (=> res!134830 e!111453)))

(assert (=> b!161733 (= res!134830 (bvsge (currentByte!7541 thiss!1602) (size!3589 (buf!4047 thiss!1602))))))

(assert (=> b!161733 (= lt!254599 (array!8005 (store (store (arr!4510 (buf!4047 thiss!1602)) (currentByte!7541 thiss!1602) lt!254607) (currentByte!7541 thiss!1602) lt!254605) (size!3589 (buf!4047 thiss!1602))))))

(assert (=> b!161733 (= lt!254605 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254607) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254603))))))

(assert (=> b!161733 (= lt!254607 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4510 (buf!4047 thiss!1602)) (currentByte!7541 thiss!1602))) lt!254600)))))

(assert (=> b!161733 (= lt!254600 ((_ sign_extend 24) lt!254601))))

(assert (=> b!161733 (= lt!254601 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254597)))))))

(assert (=> b!161733 (= lt!254597 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254603))))))

(assert (=> b!161733 (= lt!254603 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7536 thiss!1602))))))

(declare-fun b!161734 () Bool)

(declare-fun res!134831 () Bool)

(assert (=> b!161734 (=> res!134831 e!111452)))

(assert (=> b!161734 (= res!134831 (bvsle lt!254603 #b00000000000000000000000000000000))))

(declare-fun b!161735 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161735 (= e!111453 (byteRangesEq!0 (select (arr!4510 (buf!4047 thiss!1602)) (currentByte!7541 thiss!1602)) lt!254605 #b00000000000000000000000000000000 (currentBit!7536 thiss!1602)))))

(declare-fun b!161736 () Bool)

(declare-fun e!111450 () Bool)

(declare-fun array_inv!3336 (array!8004) Bool)

(assert (=> b!161736 (= e!111450 (array_inv!3336 (buf!4047 thiss!1602)))))

(declare-fun res!134834 () Bool)

(assert (=> start!33866 (=> (not res!134834) (not e!111448))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33866 (= res!134834 (validate_offset_byte!0 ((_ sign_extend 32) (size!3589 (buf!4047 thiss!1602))) ((_ sign_extend 32) (currentByte!7541 thiss!1602)) ((_ sign_extend 32) (currentBit!7536 thiss!1602))))))

(assert (=> start!33866 e!111448))

(declare-fun inv!12 (BitStream!6346) Bool)

(assert (=> start!33866 (and (inv!12 thiss!1602) e!111450)))

(assert (=> start!33866 true))

(assert (= (and start!33866 res!134834) b!161733))

(assert (= (and b!161733 (not res!134830)) b!161735))

(assert (= (and b!161733 (not res!134833)) b!161734))

(assert (= (and b!161734 (not res!134831)) b!161731))

(assert (= (and b!161731 (not res!134832)) b!161732))

(assert (= start!33866 b!161736))

(declare-fun m!256443 () Bool)

(assert (=> start!33866 m!256443))

(declare-fun m!256445 () Bool)

(assert (=> start!33866 m!256445))

(declare-fun m!256447 () Bool)

(assert (=> b!161732 m!256447))

(declare-fun m!256449 () Bool)

(assert (=> b!161735 m!256449))

(assert (=> b!161735 m!256449))

(declare-fun m!256451 () Bool)

(assert (=> b!161735 m!256451))

(declare-fun m!256453 () Bool)

(assert (=> b!161731 m!256453))

(declare-fun m!256455 () Bool)

(assert (=> b!161731 m!256455))

(declare-fun m!256457 () Bool)

(assert (=> b!161731 m!256457))

(declare-fun m!256459 () Bool)

(assert (=> b!161731 m!256459))

(assert (=> b!161731 m!256457))

(declare-fun m!256461 () Bool)

(assert (=> b!161731 m!256461))

(assert (=> b!161731 m!256457))

(declare-fun m!256463 () Bool)

(assert (=> b!161731 m!256463))

(declare-fun m!256465 () Bool)

(assert (=> b!161731 m!256465))

(declare-fun m!256467 () Bool)

(assert (=> b!161731 m!256467))

(declare-fun m!256469 () Bool)

(assert (=> b!161731 m!256469))

(declare-fun m!256471 () Bool)

(assert (=> b!161736 m!256471))

(assert (=> b!161733 m!256467))

(declare-fun m!256473 () Bool)

(assert (=> b!161733 m!256473))

(declare-fun m!256475 () Bool)

(assert (=> b!161733 m!256475))

(declare-fun m!256477 () Bool)

(assert (=> b!161733 m!256477))

(declare-fun m!256479 () Bool)

(assert (=> b!161733 m!256479))

(declare-fun m!256481 () Bool)

(assert (=> b!161733 m!256481))

(declare-fun m!256483 () Bool)

(assert (=> b!161733 m!256483))

(declare-fun m!256485 () Bool)

(assert (=> b!161733 m!256485))

(declare-fun m!256487 () Bool)

(assert (=> b!161733 m!256487))

(assert (=> b!161733 m!256449))

(assert (=> b!161733 m!256463))

(declare-fun m!256489 () Bool)

(assert (=> b!161733 m!256489))

(push 1)


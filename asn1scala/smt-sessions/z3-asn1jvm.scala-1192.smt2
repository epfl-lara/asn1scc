; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33868 () Bool)

(assert start!33868)

(declare-fun b!161749 () Bool)

(declare-fun e!111469 () Bool)

(declare-fun e!111467 () Bool)

(assert (=> b!161749 (= e!111469 e!111467)))

(declare-fun res!134849 () Bool)

(assert (=> b!161749 (=> res!134849 e!111467)))

(declare-datatypes ((array!8006 0))(
  ( (array!8007 (arr!4511 (Array (_ BitVec 32) (_ BitVec 8))) (size!3590 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6348 0))(
  ( (BitStream!6349 (buf!4048 array!8006) (currentByte!7542 (_ BitVec 32)) (currentBit!7537 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11130 0))(
  ( (Unit!11131) )
))
(declare-datatypes ((tuple3!908 0))(
  ( (tuple3!909 (_1!7805 Unit!11130) (_2!7805 (_ BitVec 8)) (_3!571 BitStream!6348)) )
))
(declare-fun lt!254638 () tuple3!908)

(declare-fun thiss!1602 () BitStream!6348)

(assert (=> b!161749 (= res!134849 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7542 (_3!571 lt!254638)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7542 (_3!571 lt!254638)) #b00000000000000000000000000000001) (currentByte!7542 (_3!571 lt!254638))) (bvsgt (size!3590 (buf!4048 thiss!1602)) (size!3590 (buf!4048 (_3!571 lt!254638)))) (bvsgt (bvsub (currentByte!7542 (_3!571 lt!254638)) #b00000000000000000000000000000001) (size!3590 (buf!4048 thiss!1602))) (bvsgt (currentByte!7542 (_3!571 lt!254638)) (size!3590 (buf!4048 thiss!1602)))))))

(declare-fun lt!254636 () (_ BitVec 8))

(declare-fun lt!254634 () (_ BitVec 8))

(declare-fun lt!254641 () array!8006)

(declare-fun arrayRangesEq!542 (array!8006 array!8006 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161749 (arrayRangesEq!542 lt!254641 (array!8007 (store (store (store (arr!4511 (buf!4048 thiss!1602)) (currentByte!7542 thiss!1602) lt!254636) (currentByte!7542 thiss!1602) lt!254634) (currentByte!7542 (_3!571 lt!254638)) (select (arr!4511 (buf!4048 (_3!571 lt!254638))) (currentByte!7542 (_3!571 lt!254638)))) (size!3590 (buf!4048 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7542 (_3!571 lt!254638)))))

(declare-fun lt!254642 () Unit!11130)

(declare-fun arrayUpdatedAtPrefixLemma!150 (array!8006 (_ BitVec 32) (_ BitVec 8)) Unit!11130)

(assert (=> b!161749 (= lt!254642 (arrayUpdatedAtPrefixLemma!150 lt!254641 (currentByte!7542 (_3!571 lt!254638)) (select (arr!4511 (buf!4048 (_3!571 lt!254638))) (currentByte!7542 (_3!571 lt!254638)))))))

(assert (=> b!161749 (arrayRangesEq!542 (buf!4048 thiss!1602) (array!8007 (store (arr!4511 (buf!4048 thiss!1602)) (currentByte!7542 (_3!571 lt!254638)) (select (arr!4511 (buf!4048 (_3!571 lt!254638))) (currentByte!7542 (_3!571 lt!254638)))) (size!3590 (buf!4048 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7542 (_3!571 lt!254638)))))

(declare-fun lt!254643 () Unit!11130)

(assert (=> b!161749 (= lt!254643 (arrayUpdatedAtPrefixLemma!150 (buf!4048 thiss!1602) (currentByte!7542 (_3!571 lt!254638)) (select (arr!4511 (buf!4048 (_3!571 lt!254638))) (currentByte!7542 (_3!571 lt!254638)))))))

(declare-fun b!161750 () Bool)

(declare-fun e!111468 () Bool)

(declare-fun array_inv!3337 (array!8006) Bool)

(assert (=> b!161750 (= e!111468 (array_inv!3337 (buf!4048 thiss!1602)))))

(declare-fun b!161751 () Bool)

(assert (=> b!161751 (= e!111467 (arrayRangesEq!542 lt!254641 (buf!4048 (_3!571 lt!254638)) #b00000000000000000000000000000000 (currentByte!7542 (_3!571 lt!254638))))))

(declare-fun b!161752 () Bool)

(declare-fun e!111466 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161752 (= e!111466 (byteRangesEq!0 (select (arr!4511 (buf!4048 thiss!1602)) (currentByte!7542 thiss!1602)) lt!254634 #b00000000000000000000000000000000 (currentBit!7537 thiss!1602)))))

(declare-fun b!161753 () Bool)

(declare-fun res!134845 () Bool)

(assert (=> b!161753 (=> res!134845 e!111469)))

(declare-fun lt!254635 () (_ BitVec 32))

(assert (=> b!161753 (= res!134845 (bvsle lt!254635 #b00000000000000000000000000000000))))

(declare-fun b!161754 () Bool)

(declare-fun e!111471 () Bool)

(assert (=> b!161754 (= e!111471 (not e!111469))))

(declare-fun res!134847 () Bool)

(assert (=> b!161754 (=> res!134847 e!111469)))

(assert (=> b!161754 (= res!134847 (not (arrayRangesEq!542 (buf!4048 thiss!1602) lt!254641 #b00000000000000000000000000000000 (bvsub (currentByte!7542 (_3!571 lt!254638)) #b00000000000000000000000000000001))))))

(declare-fun lt!254633 () (_ BitVec 8))

(assert (=> b!161754 (arrayRangesEq!542 (buf!4048 thiss!1602) (array!8007 (store (arr!4511 (buf!4048 thiss!1602)) (bvsub (currentByte!7542 (_3!571 lt!254638)) #b00000000000000000000000000000001) lt!254633) (size!3590 (buf!4048 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7542 (_3!571 lt!254638)) #b00000000000000000000000000000001))))

(declare-fun lt!254639 () Unit!11130)

(assert (=> b!161754 (= lt!254639 (arrayUpdatedAtPrefixLemma!150 (buf!4048 thiss!1602) (bvsub (currentByte!7542 (_3!571 lt!254638)) #b00000000000000000000000000000001) lt!254633))))

(assert (=> b!161754 (= lt!254633 (select (arr!4511 (buf!4048 (_3!571 lt!254638))) (bvsub (currentByte!7542 (_3!571 lt!254638)) #b00000000000000000000000000000001)))))

(declare-fun lt!254632 () (_ BitVec 32))

(declare-fun lt!254640 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254637 () (_ BitVec 32))

(declare-fun Unit!11132 () Unit!11130)

(declare-fun Unit!11133 () Unit!11130)

(assert (=> b!161754 (= lt!254638 (ite (bvsgt lt!254635 #b00000000000000000000000000000000) (let ((bdg!9705 ((_ extract 7 0) (bvnot lt!254637)))) (let ((bdg!9706 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4511 (buf!4048 thiss!1602)) (currentByte!7542 thiss!1602) lt!254636) (currentByte!7542 thiss!1602) lt!254634) (bvadd #b00000000000000000000000000000001 (currentByte!7542 thiss!1602)))) ((_ sign_extend 24) bdg!9705))))) (tuple3!909 Unit!11132 bdg!9705 (BitStream!6349 (array!8007 (store (arr!4511 (array!8007 (store (arr!4511 lt!254641) (bvadd #b00000000000000000000000000000001 (currentByte!7542 thiss!1602)) bdg!9706) (size!3590 lt!254641))) (bvadd #b00000000000000000000000000000001 (currentByte!7542 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9706) (bvshl ((_ sign_extend 24) v!222) lt!254632)))) (size!3590 (array!8007 (store (arr!4511 lt!254641) (bvadd #b00000000000000000000000000000001 (currentByte!7542 thiss!1602)) bdg!9706) (size!3590 lt!254641)))) (bvadd #b00000000000000000000000000000001 (currentByte!7542 thiss!1602)) (currentBit!7537 thiss!1602))))) (tuple3!909 Unit!11133 lt!254640 (BitStream!6349 lt!254641 (bvadd #b00000000000000000000000000000001 (currentByte!7542 thiss!1602)) (currentBit!7537 thiss!1602)))))))

(assert (=> b!161754 e!111466))

(declare-fun res!134848 () Bool)

(assert (=> b!161754 (=> res!134848 e!111466)))

(assert (=> b!161754 (= res!134848 (bvsge (currentByte!7542 thiss!1602) (size!3590 (buf!4048 thiss!1602))))))

(assert (=> b!161754 (= lt!254641 (array!8007 (store (store (arr!4511 (buf!4048 thiss!1602)) (currentByte!7542 thiss!1602) lt!254636) (currentByte!7542 thiss!1602) lt!254634) (size!3590 (buf!4048 thiss!1602))))))

(assert (=> b!161754 (= lt!254634 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254636) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254635))))))

(assert (=> b!161754 (= lt!254636 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4511 (buf!4048 thiss!1602)) (currentByte!7542 thiss!1602))) lt!254637)))))

(assert (=> b!161754 (= lt!254637 ((_ sign_extend 24) lt!254640))))

(assert (=> b!161754 (= lt!254640 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254632)))))))

(assert (=> b!161754 (= lt!254632 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254635))))))

(assert (=> b!161754 (= lt!254635 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7537 thiss!1602))))))

(declare-fun res!134846 () Bool)

(assert (=> start!33868 (=> (not res!134846) (not e!111471))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33868 (= res!134846 (validate_offset_byte!0 ((_ sign_extend 32) (size!3590 (buf!4048 thiss!1602))) ((_ sign_extend 32) (currentByte!7542 thiss!1602)) ((_ sign_extend 32) (currentBit!7537 thiss!1602))))))

(assert (=> start!33868 e!111471))

(declare-fun inv!12 (BitStream!6348) Bool)

(assert (=> start!33868 (and (inv!12 thiss!1602) e!111468)))

(assert (=> start!33868 true))

(assert (= (and start!33868 res!134846) b!161754))

(assert (= (and b!161754 (not res!134848)) b!161752))

(assert (= (and b!161754 (not res!134847)) b!161753))

(assert (= (and b!161753 (not res!134845)) b!161749))

(assert (= (and b!161749 (not res!134849)) b!161751))

(assert (= start!33868 b!161750))

(declare-fun m!256491 () Bool)

(assert (=> b!161752 m!256491))

(assert (=> b!161752 m!256491))

(declare-fun m!256493 () Bool)

(assert (=> b!161752 m!256493))

(declare-fun m!256495 () Bool)

(assert (=> b!161750 m!256495))

(declare-fun m!256497 () Bool)

(assert (=> start!33868 m!256497))

(declare-fun m!256499 () Bool)

(assert (=> start!33868 m!256499))

(declare-fun m!256501 () Bool)

(assert (=> b!161751 m!256501))

(declare-fun m!256503 () Bool)

(assert (=> b!161749 m!256503))

(declare-fun m!256505 () Bool)

(assert (=> b!161749 m!256505))

(declare-fun m!256507 () Bool)

(assert (=> b!161749 m!256507))

(declare-fun m!256509 () Bool)

(assert (=> b!161749 m!256509))

(declare-fun m!256511 () Bool)

(assert (=> b!161749 m!256511))

(declare-fun m!256513 () Bool)

(assert (=> b!161749 m!256513))

(declare-fun m!256515 () Bool)

(assert (=> b!161749 m!256515))

(declare-fun m!256517 () Bool)

(assert (=> b!161749 m!256517))

(assert (=> b!161749 m!256503))

(assert (=> b!161749 m!256503))

(declare-fun m!256519 () Bool)

(assert (=> b!161749 m!256519))

(declare-fun m!256521 () Bool)

(assert (=> b!161754 m!256521))

(declare-fun m!256523 () Bool)

(assert (=> b!161754 m!256523))

(declare-fun m!256525 () Bool)

(assert (=> b!161754 m!256525))

(assert (=> b!161754 m!256511))

(assert (=> b!161754 m!256491))

(declare-fun m!256527 () Bool)

(assert (=> b!161754 m!256527))

(declare-fun m!256529 () Bool)

(assert (=> b!161754 m!256529))

(declare-fun m!256531 () Bool)

(assert (=> b!161754 m!256531))

(declare-fun m!256533 () Bool)

(assert (=> b!161754 m!256533))

(declare-fun m!256535 () Bool)

(assert (=> b!161754 m!256535))

(declare-fun m!256537 () Bool)

(assert (=> b!161754 m!256537))

(assert (=> b!161754 m!256515))

(check-sat (not b!161752) (not start!33868) (not b!161750) (not b!161749) (not b!161754) (not b!161751))
(check-sat)

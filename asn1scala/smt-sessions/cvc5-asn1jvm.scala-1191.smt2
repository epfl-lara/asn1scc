; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33860 () Bool)

(assert start!33860)

(declare-fun res!134795 () Bool)

(declare-fun e!111405 () Bool)

(assert (=> start!33860 (=> (not res!134795) (not e!111405))))

(declare-datatypes ((array!7998 0))(
  ( (array!7999 (arr!4507 (Array (_ BitVec 32) (_ BitVec 8))) (size!3586 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6340 0))(
  ( (BitStream!6341 (buf!4044 array!7998) (currentByte!7538 (_ BitVec 32)) (currentBit!7533 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6340)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33860 (= res!134795 (validate_offset_byte!0 ((_ sign_extend 32) (size!3586 (buf!4044 thiss!1602))) ((_ sign_extend 32) (currentByte!7538 thiss!1602)) ((_ sign_extend 32) (currentBit!7533 thiss!1602))))))

(assert (=> start!33860 e!111405))

(declare-fun e!111404 () Bool)

(declare-fun inv!12 (BitStream!6340) Bool)

(assert (=> start!33860 (and (inv!12 thiss!1602) e!111404)))

(assert (=> start!33860 true))

(declare-fun b!161684 () Bool)

(declare-fun e!111403 () Bool)

(assert (=> b!161684 (= e!111405 (not e!111403))))

(declare-fun res!134794 () Bool)

(assert (=> b!161684 (=> res!134794 e!111403)))

(declare-fun lt!254490 () array!7998)

(declare-datatypes ((Unit!11114 0))(
  ( (Unit!11115) )
))
(declare-datatypes ((tuple3!900 0))(
  ( (tuple3!901 (_1!7801 Unit!11114) (_2!7801 (_ BitVec 8)) (_3!567 BitStream!6340)) )
))
(declare-fun lt!254498 () tuple3!900)

(declare-fun arrayRangesEq!538 (array!7998 array!7998 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161684 (= res!134794 (not (arrayRangesEq!538 (buf!4044 thiss!1602) lt!254490 #b00000000000000000000000000000000 (bvsub (currentByte!7538 (_3!567 lt!254498)) #b00000000000000000000000000000001))))))

(declare-fun lt!254493 () (_ BitVec 8))

(assert (=> b!161684 (arrayRangesEq!538 (buf!4044 thiss!1602) (array!7999 (store (arr!4507 (buf!4044 thiss!1602)) (bvsub (currentByte!7538 (_3!567 lt!254498)) #b00000000000000000000000000000001) lt!254493) (size!3586 (buf!4044 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7538 (_3!567 lt!254498)) #b00000000000000000000000000000001))))

(declare-fun lt!254494 () Unit!11114)

(declare-fun arrayUpdatedAtPrefixLemma!146 (array!7998 (_ BitVec 32) (_ BitVec 8)) Unit!11114)

(assert (=> b!161684 (= lt!254494 (arrayUpdatedAtPrefixLemma!146 (buf!4044 thiss!1602) (bvsub (currentByte!7538 (_3!567 lt!254498)) #b00000000000000000000000000000001) lt!254493))))

(assert (=> b!161684 (= lt!254493 (select (arr!4507 (buf!4044 (_3!567 lt!254498))) (bvsub (currentByte!7538 (_3!567 lt!254498)) #b00000000000000000000000000000001)))))

(declare-fun lt!254495 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254488 () (_ BitVec 8))

(declare-fun lt!254491 () (_ BitVec 32))

(declare-fun lt!254497 () (_ BitVec 8))

(declare-fun lt!254499 () (_ BitVec 8))

(declare-fun lt!254492 () (_ BitVec 32))

(declare-fun Unit!11116 () Unit!11114)

(declare-fun Unit!11117 () Unit!11114)

(assert (=> b!161684 (= lt!254498 (ite (bvsgt lt!254492 #b00000000000000000000000000000000) (let ((bdg!9691 ((_ extract 7 0) (bvnot lt!254491)))) (let ((bdg!9692 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4507 (buf!4044 thiss!1602)) (currentByte!7538 thiss!1602) lt!254488) (currentByte!7538 thiss!1602) lt!254497) (bvadd #b00000000000000000000000000000001 (currentByte!7538 thiss!1602)))) ((_ sign_extend 24) bdg!9691))))) (tuple3!901 Unit!11116 bdg!9691 (BitStream!6341 (array!7999 (store (arr!4507 (array!7999 (store (arr!4507 lt!254490) (bvadd #b00000000000000000000000000000001 (currentByte!7538 thiss!1602)) bdg!9692) (size!3586 lt!254490))) (bvadd #b00000000000000000000000000000001 (currentByte!7538 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9692) (bvshl ((_ sign_extend 24) v!222) lt!254495)))) (size!3586 (array!7999 (store (arr!4507 lt!254490) (bvadd #b00000000000000000000000000000001 (currentByte!7538 thiss!1602)) bdg!9692) (size!3586 lt!254490)))) (bvadd #b00000000000000000000000000000001 (currentByte!7538 thiss!1602)) (currentBit!7533 thiss!1602))))) (tuple3!901 Unit!11117 lt!254499 (BitStream!6341 lt!254490 (bvadd #b00000000000000000000000000000001 (currentByte!7538 thiss!1602)) (currentBit!7533 thiss!1602)))))))

(declare-fun e!111402 () Bool)

(assert (=> b!161684 e!111402))

(declare-fun res!134793 () Bool)

(assert (=> b!161684 (=> res!134793 e!111402)))

(assert (=> b!161684 (= res!134793 (bvsge (currentByte!7538 thiss!1602) (size!3586 (buf!4044 thiss!1602))))))

(assert (=> b!161684 (= lt!254490 (array!7999 (store (store (arr!4507 (buf!4044 thiss!1602)) (currentByte!7538 thiss!1602) lt!254488) (currentByte!7538 thiss!1602) lt!254497) (size!3586 (buf!4044 thiss!1602))))))

(assert (=> b!161684 (= lt!254497 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254488) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254492))))))

(assert (=> b!161684 (= lt!254488 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4507 (buf!4044 thiss!1602)) (currentByte!7538 thiss!1602))) lt!254491)))))

(assert (=> b!161684 (= lt!254491 ((_ sign_extend 24) lt!254499))))

(assert (=> b!161684 (= lt!254499 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254495)))))))

(assert (=> b!161684 (= lt!254495 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254492))))))

(assert (=> b!161684 (= lt!254492 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7533 thiss!1602))))))

(declare-fun b!161685 () Bool)

(declare-fun res!134792 () Bool)

(assert (=> b!161685 (=> res!134792 e!111403)))

(assert (=> b!161685 (= res!134792 (bvsle lt!254492 #b00000000000000000000000000000000))))

(declare-fun b!161686 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161686 (= e!111402 (byteRangesEq!0 (select (arr!4507 (buf!4044 thiss!1602)) (currentByte!7538 thiss!1602)) lt!254497 #b00000000000000000000000000000000 (currentBit!7533 thiss!1602)))))

(declare-fun b!161687 () Bool)

(declare-fun array_inv!3333 (array!7998) Bool)

(assert (=> b!161687 (= e!111404 (array_inv!3333 (buf!4044 thiss!1602)))))

(declare-fun b!161688 () Bool)

(assert (=> b!161688 (= e!111403 true)))

(assert (=> b!161688 (arrayRangesEq!538 lt!254490 (array!7999 (store (store (store (arr!4507 (buf!4044 thiss!1602)) (currentByte!7538 thiss!1602) lt!254488) (currentByte!7538 thiss!1602) lt!254497) (currentByte!7538 (_3!567 lt!254498)) (select (arr!4507 (buf!4044 (_3!567 lt!254498))) (currentByte!7538 (_3!567 lt!254498)))) (size!3586 (buf!4044 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7538 (_3!567 lt!254498)))))

(declare-fun lt!254496 () Unit!11114)

(assert (=> b!161688 (= lt!254496 (arrayUpdatedAtPrefixLemma!146 lt!254490 (currentByte!7538 (_3!567 lt!254498)) (select (arr!4507 (buf!4044 (_3!567 lt!254498))) (currentByte!7538 (_3!567 lt!254498)))))))

(assert (=> b!161688 (arrayRangesEq!538 (buf!4044 thiss!1602) (array!7999 (store (arr!4507 (buf!4044 thiss!1602)) (currentByte!7538 (_3!567 lt!254498)) (select (arr!4507 (buf!4044 (_3!567 lt!254498))) (currentByte!7538 (_3!567 lt!254498)))) (size!3586 (buf!4044 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7538 (_3!567 lt!254498)))))

(declare-fun lt!254489 () Unit!11114)

(assert (=> b!161688 (= lt!254489 (arrayUpdatedAtPrefixLemma!146 (buf!4044 thiss!1602) (currentByte!7538 (_3!567 lt!254498)) (select (arr!4507 (buf!4044 (_3!567 lt!254498))) (currentByte!7538 (_3!567 lt!254498)))))))

(assert (= (and start!33860 res!134795) b!161684))

(assert (= (and b!161684 (not res!134793)) b!161686))

(assert (= (and b!161684 (not res!134794)) b!161685))

(assert (= (and b!161685 (not res!134792)) b!161688))

(assert (= start!33860 b!161687))

(declare-fun m!256305 () Bool)

(assert (=> b!161688 m!256305))

(declare-fun m!256307 () Bool)

(assert (=> b!161688 m!256307))

(declare-fun m!256309 () Bool)

(assert (=> b!161688 m!256309))

(declare-fun m!256311 () Bool)

(assert (=> b!161688 m!256311))

(assert (=> b!161688 m!256305))

(declare-fun m!256313 () Bool)

(assert (=> b!161688 m!256313))

(declare-fun m!256315 () Bool)

(assert (=> b!161688 m!256315))

(assert (=> b!161688 m!256305))

(declare-fun m!256317 () Bool)

(assert (=> b!161688 m!256317))

(declare-fun m!256319 () Bool)

(assert (=> b!161688 m!256319))

(declare-fun m!256321 () Bool)

(assert (=> b!161688 m!256321))

(declare-fun m!256323 () Bool)

(assert (=> b!161684 m!256323))

(declare-fun m!256325 () Bool)

(assert (=> b!161684 m!256325))

(assert (=> b!161684 m!256311))

(declare-fun m!256327 () Bool)

(assert (=> b!161684 m!256327))

(declare-fun m!256329 () Bool)

(assert (=> b!161684 m!256329))

(declare-fun m!256331 () Bool)

(assert (=> b!161684 m!256331))

(declare-fun m!256333 () Bool)

(assert (=> b!161684 m!256333))

(declare-fun m!256335 () Bool)

(assert (=> b!161684 m!256335))

(declare-fun m!256337 () Bool)

(assert (=> b!161684 m!256337))

(declare-fun m!256339 () Bool)

(assert (=> b!161684 m!256339))

(assert (=> b!161684 m!256309))

(declare-fun m!256341 () Bool)

(assert (=> b!161684 m!256341))

(declare-fun m!256343 () Bool)

(assert (=> start!33860 m!256343))

(declare-fun m!256345 () Bool)

(assert (=> start!33860 m!256345))

(assert (=> b!161686 m!256335))

(assert (=> b!161686 m!256335))

(declare-fun m!256347 () Bool)

(assert (=> b!161686 m!256347))

(declare-fun m!256349 () Bool)

(assert (=> b!161687 m!256349))

(push 1)

(assert (not b!161688))

(assert (not b!161684))

(assert (not b!161687))

(assert (not start!33860))

(assert (not b!161686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33508 () Bool)

(assert start!33508)

(declare-fun res!134183 () Bool)

(declare-fun e!110686 () Bool)

(assert (=> start!33508 (=> (not res!134183) (not e!110686))))

(declare-datatypes ((array!7922 0))(
  ( (array!7923 (arr!4480 (Array (_ BitVec 32) (_ BitVec 8))) (size!3559 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6286 0))(
  ( (BitStream!6287 (buf!4017 array!7922) (currentByte!7477 (_ BitVec 32)) (currentBit!7472 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6286)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33508 (= res!134183 (validate_offset_byte!0 ((_ sign_extend 32) (size!3559 (buf!4017 thiss!1602))) ((_ sign_extend 32) (currentByte!7477 thiss!1602)) ((_ sign_extend 32) (currentBit!7472 thiss!1602))))))

(assert (=> start!33508 e!110686))

(declare-fun e!110687 () Bool)

(declare-fun inv!12 (BitStream!6286) Bool)

(assert (=> start!33508 (and (inv!12 thiss!1602) e!110687)))

(assert (=> start!33508 true))

(declare-fun b!160993 () Bool)

(declare-datatypes ((Unit!11006 0))(
  ( (Unit!11007) )
))
(declare-datatypes ((tuple3!846 0))(
  ( (tuple3!847 (_1!7774 Unit!11006) (_2!7774 (_ BitVec 8)) (_3!540 BitStream!6286)) )
))
(declare-fun lt!253508 () tuple3!846)

(assert (=> b!160993 (= e!110686 (not (or (= (bvand (currentByte!7477 (_3!540 lt!253508)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7477 (_3!540 lt!253508)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun lt!253507 () (_ BitVec 8))

(declare-fun arrayRangesEq!511 (array!7922 array!7922 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160993 (arrayRangesEq!511 (buf!4017 thiss!1602) (array!7923 (store (arr!4480 (buf!4017 thiss!1602)) (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001) lt!253507) (size!3559 (buf!4017 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001))))

(declare-fun lt!253504 () Unit!11006)

(declare-fun arrayUpdatedAtPrefixLemma!119 (array!7922 (_ BitVec 32) (_ BitVec 8)) Unit!11006)

(assert (=> b!160993 (= lt!253504 (arrayUpdatedAtPrefixLemma!119 (buf!4017 thiss!1602) (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001) lt!253507))))

(assert (=> b!160993 (= lt!253507 (select (arr!4480 (buf!4017 (_3!540 lt!253508))) (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253500 () (_ BitVec 32))

(declare-fun lt!253502 () (_ BitVec 8))

(declare-fun lt!253501 () array!7922)

(declare-fun lt!253505 () (_ BitVec 8))

(declare-fun lt!253506 () (_ BitVec 32))

(declare-fun lt!253503 () (_ BitVec 32))

(declare-fun lt!253509 () (_ BitVec 8))

(declare-fun Unit!11008 () Unit!11006)

(declare-fun Unit!11009 () Unit!11006)

(assert (=> b!160993 (= lt!253508 (ite (bvsgt lt!253503 #b00000000000000000000000000000000) (let ((bdg!9573 ((_ extract 7 0) (bvnot lt!253500)))) (let ((bdg!9574 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4480 (buf!4017 thiss!1602)) (currentByte!7477 thiss!1602) lt!253502) (currentByte!7477 thiss!1602) lt!253509) (bvadd #b00000000000000000000000000000001 (currentByte!7477 thiss!1602)))) ((_ sign_extend 24) bdg!9573))))) (tuple3!847 Unit!11008 bdg!9573 (BitStream!6287 (array!7923 (store (arr!4480 (array!7923 (store (arr!4480 lt!253501) (bvadd #b00000000000000000000000000000001 (currentByte!7477 thiss!1602)) bdg!9574) (size!3559 lt!253501))) (bvadd #b00000000000000000000000000000001 (currentByte!7477 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9574) (bvshl ((_ sign_extend 24) v!222) lt!253506)))) (size!3559 (array!7923 (store (arr!4480 lt!253501) (bvadd #b00000000000000000000000000000001 (currentByte!7477 thiss!1602)) bdg!9574) (size!3559 lt!253501)))) (bvadd #b00000000000000000000000000000001 (currentByte!7477 thiss!1602)) (currentBit!7472 thiss!1602))))) (tuple3!847 Unit!11009 lt!253505 (BitStream!6287 lt!253501 (bvadd #b00000000000000000000000000000001 (currentByte!7477 thiss!1602)) (currentBit!7472 thiss!1602)))))))

(declare-fun e!110688 () Bool)

(assert (=> b!160993 e!110688))

(declare-fun res!134182 () Bool)

(assert (=> b!160993 (=> res!134182 e!110688)))

(assert (=> b!160993 (= res!134182 (bvsge (currentByte!7477 thiss!1602) (size!3559 (buf!4017 thiss!1602))))))

(assert (=> b!160993 (= lt!253501 (array!7923 (store (store (arr!4480 (buf!4017 thiss!1602)) (currentByte!7477 thiss!1602) lt!253502) (currentByte!7477 thiss!1602) lt!253509) (size!3559 (buf!4017 thiss!1602))))))

(assert (=> b!160993 (= lt!253509 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253502) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253503))))))

(assert (=> b!160993 (= lt!253502 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4480 (buf!4017 thiss!1602)) (currentByte!7477 thiss!1602))) lt!253500)))))

(assert (=> b!160993 (= lt!253500 ((_ sign_extend 24) lt!253505))))

(assert (=> b!160993 (= lt!253505 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253506)))))))

(assert (=> b!160993 (= lt!253506 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253503))))))

(assert (=> b!160993 (= lt!253503 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7472 thiss!1602))))))

(declare-fun b!160994 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160994 (= e!110688 (byteRangesEq!0 (select (arr!4480 (buf!4017 thiss!1602)) (currentByte!7477 thiss!1602)) lt!253509 #b00000000000000000000000000000000 (currentBit!7472 thiss!1602)))))

(declare-fun b!160995 () Bool)

(declare-fun array_inv!3306 (array!7922) Bool)

(assert (=> b!160995 (= e!110687 (array_inv!3306 (buf!4017 thiss!1602)))))

(assert (= (and start!33508 res!134183) b!160993))

(assert (= (and b!160993 (not res!134182)) b!160994))

(assert (= start!33508 b!160995))

(declare-fun m!254593 () Bool)

(assert (=> start!33508 m!254593))

(declare-fun m!254595 () Bool)

(assert (=> start!33508 m!254595))

(declare-fun m!254597 () Bool)

(assert (=> b!160993 m!254597))

(declare-fun m!254599 () Bool)

(assert (=> b!160993 m!254599))

(declare-fun m!254601 () Bool)

(assert (=> b!160993 m!254601))

(declare-fun m!254603 () Bool)

(assert (=> b!160993 m!254603))

(declare-fun m!254605 () Bool)

(assert (=> b!160993 m!254605))

(declare-fun m!254607 () Bool)

(assert (=> b!160993 m!254607))

(declare-fun m!254609 () Bool)

(assert (=> b!160993 m!254609))

(declare-fun m!254611 () Bool)

(assert (=> b!160993 m!254611))

(declare-fun m!254613 () Bool)

(assert (=> b!160993 m!254613))

(declare-fun m!254615 () Bool)

(assert (=> b!160993 m!254615))

(declare-fun m!254617 () Bool)

(assert (=> b!160993 m!254617))

(assert (=> b!160994 m!254607))

(assert (=> b!160994 m!254607))

(declare-fun m!254619 () Bool)

(assert (=> b!160994 m!254619))

(declare-fun m!254621 () Bool)

(assert (=> b!160995 m!254621))

(push 1)

(assert (not b!160993))

(assert (not b!160994))

(assert (not b!160995))

(assert (not start!33508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54941 () Bool)

(declare-fun res!134218 () Bool)

(declare-fun e!110735 () Bool)

(assert (=> d!54941 (=> res!134218 e!110735)))

(assert (=> d!54941 (= res!134218 (= #b00000000000000000000000000000000 (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001)))))

(assert (=> d!54941 (= (arrayRangesEq!511 (buf!4017 thiss!1602) (array!7923 (store (arr!4480 (buf!4017 thiss!1602)) (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001) lt!253507) (size!3559 (buf!4017 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001)) e!110735)))

(declare-fun b!161036 () Bool)

(declare-fun e!110736 () Bool)

(assert (=> b!161036 (= e!110735 e!110736)))

(declare-fun res!134219 () Bool)

(assert (=> b!161036 (=> (not res!134219) (not e!110736))))

(assert (=> b!161036 (= res!134219 (= (select (arr!4480 (buf!4017 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4480 (array!7923 (store (arr!4480 (buf!4017 thiss!1602)) (bvsub (currentByte!7477 (_3!540 lt!253508)) #b00000000000000000000000000000001) lt!253507) (size!3559 (buf!4017 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161037 () Bool)


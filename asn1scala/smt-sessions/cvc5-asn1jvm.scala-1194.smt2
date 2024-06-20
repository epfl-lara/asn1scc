; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33878 () Bool)

(assert start!33878)

(declare-fun b!161828 () Bool)

(declare-fun e!111547 () Bool)

(declare-datatypes ((array!8016 0))(
  ( (array!8017 (arr!4516 (Array (_ BitVec 32) (_ BitVec 8))) (size!3595 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6358 0))(
  ( (BitStream!6359 (buf!4053 array!8016) (currentByte!7547 (_ BitVec 32)) (currentBit!7542 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6358)

(declare-fun array_inv!3342 (array!8016) Bool)

(assert (=> b!161828 (= e!111547 (array_inv!3342 (buf!4053 thiss!1602)))))

(declare-fun b!161829 () Bool)

(declare-fun e!111546 () Bool)

(declare-fun lt!254829 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161829 (= e!111546 (byteRangesEq!0 (select (arr!4516 (buf!4053 thiss!1602)) (currentByte!7547 thiss!1602)) lt!254829 #b00000000000000000000000000000000 (currentBit!7542 thiss!1602)))))

(declare-fun b!161830 () Bool)

(declare-fun e!111545 () Bool)

(declare-fun e!111549 () Bool)

(assert (=> b!161830 (= e!111545 (not e!111549))))

(declare-fun res!134911 () Bool)

(assert (=> b!161830 (=> res!134911 e!111549)))

(declare-datatypes ((Unit!11150 0))(
  ( (Unit!11151) )
))
(declare-datatypes ((tuple3!918 0))(
  ( (tuple3!919 (_1!7810 Unit!11150) (_2!7810 (_ BitVec 8)) (_3!576 BitStream!6358)) )
))
(declare-fun lt!254823 () tuple3!918)

(declare-fun lt!254826 () array!8016)

(declare-fun arrayRangesEq!547 (array!8016 array!8016 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161830 (= res!134911 (not (arrayRangesEq!547 (buf!4053 thiss!1602) lt!254826 #b00000000000000000000000000000000 (bvsub (currentByte!7547 (_3!576 lt!254823)) #b00000000000000000000000000000001))))))

(declare-fun lt!254821 () (_ BitVec 8))

(assert (=> b!161830 (arrayRangesEq!547 (buf!4053 thiss!1602) (array!8017 (store (arr!4516 (buf!4053 thiss!1602)) (bvsub (currentByte!7547 (_3!576 lt!254823)) #b00000000000000000000000000000001) lt!254821) (size!3595 (buf!4053 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7547 (_3!576 lt!254823)) #b00000000000000000000000000000001))))

(declare-fun lt!254820 () Unit!11150)

(declare-fun arrayUpdatedAtPrefixLemma!155 (array!8016 (_ BitVec 32) (_ BitVec 8)) Unit!11150)

(assert (=> b!161830 (= lt!254820 (arrayUpdatedAtPrefixLemma!155 (buf!4053 thiss!1602) (bvsub (currentByte!7547 (_3!576 lt!254823)) #b00000000000000000000000000000001) lt!254821))))

(assert (=> b!161830 (= lt!254821 (select (arr!4516 (buf!4053 (_3!576 lt!254823))) (bvsub (currentByte!7547 (_3!576 lt!254823)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254824 () (_ BitVec 8))

(declare-fun lt!254827 () (_ BitVec 32))

(declare-fun lt!254825 () Bool)

(declare-fun lt!254828 () (_ BitVec 8))

(declare-fun lt!254822 () (_ BitVec 32))

(declare-fun Unit!11152 () Unit!11150)

(declare-fun Unit!11153 () Unit!11150)

(assert (=> b!161830 (= lt!254823 (ite lt!254825 (let ((bdg!9735 ((_ extract 7 0) (bvnot lt!254822)))) (let ((bdg!9736 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4516 (buf!4053 thiss!1602)) (currentByte!7547 thiss!1602) lt!254824) (currentByte!7547 thiss!1602) lt!254829) (bvadd #b00000000000000000000000000000001 (currentByte!7547 thiss!1602)))) ((_ sign_extend 24) bdg!9735))))) (tuple3!919 Unit!11152 bdg!9735 (BitStream!6359 (array!8017 (store (arr!4516 (array!8017 (store (arr!4516 lt!254826) (bvadd #b00000000000000000000000000000001 (currentByte!7547 thiss!1602)) bdg!9736) (size!3595 lt!254826))) (bvadd #b00000000000000000000000000000001 (currentByte!7547 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9736) (bvshl ((_ sign_extend 24) v!222) lt!254827)))) (size!3595 (array!8017 (store (arr!4516 lt!254826) (bvadd #b00000000000000000000000000000001 (currentByte!7547 thiss!1602)) bdg!9736) (size!3595 lt!254826)))) (bvadd #b00000000000000000000000000000001 (currentByte!7547 thiss!1602)) (currentBit!7542 thiss!1602))))) (tuple3!919 Unit!11153 lt!254828 (BitStream!6359 lt!254826 (bvadd #b00000000000000000000000000000001 (currentByte!7547 thiss!1602)) (currentBit!7542 thiss!1602)))))))

(declare-fun lt!254819 () (_ BitVec 32))

(assert (=> b!161830 (= lt!254825 (bvsgt lt!254819 #b00000000000000000000000000000000))))

(assert (=> b!161830 e!111546))

(declare-fun res!134910 () Bool)

(assert (=> b!161830 (=> res!134910 e!111546)))

(assert (=> b!161830 (= res!134910 (bvsge (currentByte!7547 thiss!1602) (size!3595 (buf!4053 thiss!1602))))))

(assert (=> b!161830 (= lt!254826 (array!8017 (store (store (arr!4516 (buf!4053 thiss!1602)) (currentByte!7547 thiss!1602) lt!254824) (currentByte!7547 thiss!1602) lt!254829) (size!3595 (buf!4053 thiss!1602))))))

(assert (=> b!161830 (= lt!254829 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254824) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254819))))))

(assert (=> b!161830 (= lt!254824 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4516 (buf!4053 thiss!1602)) (currentByte!7547 thiss!1602))) lt!254822)))))

(assert (=> b!161830 (= lt!254822 ((_ sign_extend 24) lt!254828))))

(assert (=> b!161830 (= lt!254828 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254827)))))))

(assert (=> b!161830 (= lt!254827 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254819))))))

(assert (=> b!161830 (= lt!254819 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7542 thiss!1602))))))

(declare-fun res!134909 () Bool)

(assert (=> start!33878 (=> (not res!134909) (not e!111545))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33878 (= res!134909 (validate_offset_byte!0 ((_ sign_extend 32) (size!3595 (buf!4053 thiss!1602))) ((_ sign_extend 32) (currentByte!7547 thiss!1602)) ((_ sign_extend 32) (currentBit!7542 thiss!1602))))))

(assert (=> start!33878 e!111545))

(declare-fun inv!12 (BitStream!6358) Bool)

(assert (=> start!33878 (and (inv!12 thiss!1602) e!111547)))

(assert (=> start!33878 true))

(declare-fun b!161831 () Bool)

(assert (=> b!161831 (= e!111549 (arrayRangesEq!547 (buf!4053 thiss!1602) (buf!4053 (_3!576 lt!254823)) #b00000000000000000000000000000000 (currentByte!7547 thiss!1602)))))

(declare-fun b!161832 () Bool)

(declare-fun res!134912 () Bool)

(assert (=> b!161832 (=> res!134912 e!111549)))

(assert (=> b!161832 (= res!134912 lt!254825)))

(assert (= (and start!33878 res!134909) b!161830))

(assert (= (and b!161830 (not res!134910)) b!161829))

(assert (= (and b!161830 (not res!134911)) b!161832))

(assert (= (and b!161832 (not res!134912)) b!161831))

(assert (= start!33878 b!161828))

(declare-fun m!256743 () Bool)

(assert (=> b!161828 m!256743))

(declare-fun m!256745 () Bool)

(assert (=> start!33878 m!256745))

(declare-fun m!256747 () Bool)

(assert (=> start!33878 m!256747))

(declare-fun m!256749 () Bool)

(assert (=> b!161829 m!256749))

(assert (=> b!161829 m!256749))

(declare-fun m!256751 () Bool)

(assert (=> b!161829 m!256751))

(declare-fun m!256753 () Bool)

(assert (=> b!161830 m!256753))

(declare-fun m!256755 () Bool)

(assert (=> b!161830 m!256755))

(declare-fun m!256757 () Bool)

(assert (=> b!161830 m!256757))

(declare-fun m!256759 () Bool)

(assert (=> b!161830 m!256759))

(declare-fun m!256761 () Bool)

(assert (=> b!161830 m!256761))

(declare-fun m!256763 () Bool)

(assert (=> b!161830 m!256763))

(declare-fun m!256765 () Bool)

(assert (=> b!161830 m!256765))

(assert (=> b!161830 m!256749))

(declare-fun m!256767 () Bool)

(assert (=> b!161830 m!256767))

(declare-fun m!256769 () Bool)

(assert (=> b!161830 m!256769))

(declare-fun m!256771 () Bool)

(assert (=> b!161830 m!256771))

(declare-fun m!256773 () Bool)

(assert (=> b!161830 m!256773))

(declare-fun m!256775 () Bool)

(assert (=> b!161831 m!256775))

(push 1)

(assert (not b!161830))

(assert (not start!33878))

(assert (not b!161828))

(assert (not b!161831))

(assert (not b!161829))

(check-sat)

(pop 1)

(push 1)

(check-sat)


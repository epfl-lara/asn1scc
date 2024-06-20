; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33880 () Bool)

(assert start!33880)

(declare-fun b!161844 () Bool)

(declare-fun res!134923 () Bool)

(declare-fun e!111561 () Bool)

(assert (=> b!161844 (=> res!134923 e!111561)))

(declare-fun lt!254857 () Bool)

(assert (=> b!161844 (= res!134923 lt!254857)))

(declare-fun b!161845 () Bool)

(declare-datatypes ((array!8018 0))(
  ( (array!8019 (arr!4517 (Array (_ BitVec 32) (_ BitVec 8))) (size!3596 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6360 0))(
  ( (BitStream!6361 (buf!4054 array!8018) (currentByte!7548 (_ BitVec 32)) (currentBit!7543 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6360)

(declare-datatypes ((Unit!11154 0))(
  ( (Unit!11155) )
))
(declare-datatypes ((tuple3!920 0))(
  ( (tuple3!921 (_1!7811 Unit!11154) (_2!7811 (_ BitVec 8)) (_3!577 BitStream!6360)) )
))
(declare-fun lt!254852 () tuple3!920)

(declare-fun arrayRangesEq!548 (array!8018 array!8018 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161845 (= e!111561 (arrayRangesEq!548 (buf!4054 thiss!1602) (buf!4054 (_3!577 lt!254852)) #b00000000000000000000000000000000 (currentByte!7548 thiss!1602)))))

(declare-fun b!161846 () Bool)

(declare-fun e!111562 () Bool)

(assert (=> b!161846 (= e!111562 (not e!111561))))

(declare-fun res!134924 () Bool)

(assert (=> b!161846 (=> res!134924 e!111561)))

(declare-fun lt!254862 () array!8018)

(assert (=> b!161846 (= res!134924 (not (arrayRangesEq!548 (buf!4054 thiss!1602) lt!254862 #b00000000000000000000000000000000 (bvsub (currentByte!7548 (_3!577 lt!254852)) #b00000000000000000000000000000001))))))

(declare-fun lt!254860 () (_ BitVec 8))

(assert (=> b!161846 (arrayRangesEq!548 (buf!4054 thiss!1602) (array!8019 (store (arr!4517 (buf!4054 thiss!1602)) (bvsub (currentByte!7548 (_3!577 lt!254852)) #b00000000000000000000000000000001) lt!254860) (size!3596 (buf!4054 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7548 (_3!577 lt!254852)) #b00000000000000000000000000000001))))

(declare-fun lt!254853 () Unit!11154)

(declare-fun arrayUpdatedAtPrefixLemma!156 (array!8018 (_ BitVec 32) (_ BitVec 8)) Unit!11154)

(assert (=> b!161846 (= lt!254853 (arrayUpdatedAtPrefixLemma!156 (buf!4054 thiss!1602) (bvsub (currentByte!7548 (_3!577 lt!254852)) #b00000000000000000000000000000001) lt!254860))))

(assert (=> b!161846 (= lt!254860 (select (arr!4517 (buf!4054 (_3!577 lt!254852))) (bvsub (currentByte!7548 (_3!577 lt!254852)) #b00000000000000000000000000000001)))))

(declare-fun lt!254855 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254854 () (_ BitVec 8))

(declare-fun lt!254858 () (_ BitVec 8))

(declare-fun lt!254861 () (_ BitVec 32))

(declare-fun lt!254856 () (_ BitVec 32))

(declare-fun Unit!11156 () Unit!11154)

(declare-fun Unit!11157 () Unit!11154)

(assert (=> b!161846 (= lt!254852 (ite lt!254857 (let ((bdg!9735 ((_ extract 7 0) (bvnot lt!254861)))) (let ((bdg!9736 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4517 (buf!4054 thiss!1602)) (currentByte!7548 thiss!1602) lt!254855) (currentByte!7548 thiss!1602) lt!254854) (bvadd #b00000000000000000000000000000001 (currentByte!7548 thiss!1602)))) ((_ sign_extend 24) bdg!9735))))) (tuple3!921 Unit!11156 bdg!9735 (BitStream!6361 (array!8019 (store (arr!4517 (array!8019 (store (arr!4517 lt!254862) (bvadd #b00000000000000000000000000000001 (currentByte!7548 thiss!1602)) bdg!9736) (size!3596 lt!254862))) (bvadd #b00000000000000000000000000000001 (currentByte!7548 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9736) (bvshl ((_ sign_extend 24) v!222) lt!254856)))) (size!3596 (array!8019 (store (arr!4517 lt!254862) (bvadd #b00000000000000000000000000000001 (currentByte!7548 thiss!1602)) bdg!9736) (size!3596 lt!254862)))) (bvadd #b00000000000000000000000000000001 (currentByte!7548 thiss!1602)) (currentBit!7543 thiss!1602))))) (tuple3!921 Unit!11157 lt!254858 (BitStream!6361 lt!254862 (bvadd #b00000000000000000000000000000001 (currentByte!7548 thiss!1602)) (currentBit!7543 thiss!1602)))))))

(declare-fun lt!254859 () (_ BitVec 32))

(assert (=> b!161846 (= lt!254857 (bvsgt lt!254859 #b00000000000000000000000000000000))))

(declare-fun e!111564 () Bool)

(assert (=> b!161846 e!111564))

(declare-fun res!134922 () Bool)

(assert (=> b!161846 (=> res!134922 e!111564)))

(assert (=> b!161846 (= res!134922 (bvsge (currentByte!7548 thiss!1602) (size!3596 (buf!4054 thiss!1602))))))

(assert (=> b!161846 (= lt!254862 (array!8019 (store (store (arr!4517 (buf!4054 thiss!1602)) (currentByte!7548 thiss!1602) lt!254855) (currentByte!7548 thiss!1602) lt!254854) (size!3596 (buf!4054 thiss!1602))))))

(assert (=> b!161846 (= lt!254854 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254855) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254859))))))

(assert (=> b!161846 (= lt!254855 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4517 (buf!4054 thiss!1602)) (currentByte!7548 thiss!1602))) lt!254861)))))

(assert (=> b!161846 (= lt!254861 ((_ sign_extend 24) lt!254858))))

(assert (=> b!161846 (= lt!254858 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254856)))))))

(assert (=> b!161846 (= lt!254856 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254859))))))

(assert (=> b!161846 (= lt!254859 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7543 thiss!1602))))))

(declare-fun b!161847 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161847 (= e!111564 (byteRangesEq!0 (select (arr!4517 (buf!4054 thiss!1602)) (currentByte!7548 thiss!1602)) lt!254854 #b00000000000000000000000000000000 (currentBit!7543 thiss!1602)))))

(declare-fun res!134921 () Bool)

(assert (=> start!33880 (=> (not res!134921) (not e!111562))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33880 (= res!134921 (validate_offset_byte!0 ((_ sign_extend 32) (size!3596 (buf!4054 thiss!1602))) ((_ sign_extend 32) (currentByte!7548 thiss!1602)) ((_ sign_extend 32) (currentBit!7543 thiss!1602))))))

(assert (=> start!33880 e!111562))

(declare-fun e!111563 () Bool)

(declare-fun inv!12 (BitStream!6360) Bool)

(assert (=> start!33880 (and (inv!12 thiss!1602) e!111563)))

(assert (=> start!33880 true))

(declare-fun b!161843 () Bool)

(declare-fun array_inv!3343 (array!8018) Bool)

(assert (=> b!161843 (= e!111563 (array_inv!3343 (buf!4054 thiss!1602)))))

(assert (= (and start!33880 res!134921) b!161846))

(assert (= (and b!161846 (not res!134922)) b!161847))

(assert (= (and b!161846 (not res!134924)) b!161844))

(assert (= (and b!161844 (not res!134923)) b!161845))

(assert (= start!33880 b!161843))

(declare-fun m!256777 () Bool)

(assert (=> b!161843 m!256777))

(declare-fun m!256779 () Bool)

(assert (=> b!161845 m!256779))

(declare-fun m!256781 () Bool)

(assert (=> start!33880 m!256781))

(declare-fun m!256783 () Bool)

(assert (=> start!33880 m!256783))

(declare-fun m!256785 () Bool)

(assert (=> b!161847 m!256785))

(assert (=> b!161847 m!256785))

(declare-fun m!256787 () Bool)

(assert (=> b!161847 m!256787))

(declare-fun m!256789 () Bool)

(assert (=> b!161846 m!256789))

(declare-fun m!256791 () Bool)

(assert (=> b!161846 m!256791))

(declare-fun m!256793 () Bool)

(assert (=> b!161846 m!256793))

(declare-fun m!256795 () Bool)

(assert (=> b!161846 m!256795))

(assert (=> b!161846 m!256785))

(declare-fun m!256797 () Bool)

(assert (=> b!161846 m!256797))

(declare-fun m!256799 () Bool)

(assert (=> b!161846 m!256799))

(declare-fun m!256801 () Bool)

(assert (=> b!161846 m!256801))

(declare-fun m!256803 () Bool)

(assert (=> b!161846 m!256803))

(declare-fun m!256805 () Bool)

(assert (=> b!161846 m!256805))

(declare-fun m!256807 () Bool)

(assert (=> b!161846 m!256807))

(declare-fun m!256809 () Bool)

(assert (=> b!161846 m!256809))

(check-sat (not b!161845) (not b!161847) (not start!33880) (not b!161846) (not b!161843))
(check-sat)

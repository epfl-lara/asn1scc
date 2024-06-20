; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32124 () Bool)

(assert start!32124)

(declare-fun res!132682 () Bool)

(declare-fun e!108387 () Bool)

(assert (=> start!32124 (=> (not res!132682) (not e!108387))))

(declare-datatypes ((array!7529 0))(
  ( (array!7530 (arr!4331 (Array (_ BitVec 32) (_ BitVec 8))) (size!3410 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5988 0))(
  ( (BitStream!5989 (buf!3868 array!7529) (currentByte!7093 (_ BitVec 32)) (currentBit!7088 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5988)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32124 (= res!132682 (validate_offset_byte!0 ((_ sign_extend 32) (size!3410 (buf!3868 thiss!1602))) ((_ sign_extend 32) (currentByte!7093 thiss!1602)) ((_ sign_extend 32) (currentBit!7088 thiss!1602))))))

(assert (=> start!32124 e!108387))

(declare-fun e!108390 () Bool)

(declare-fun inv!12 (BitStream!5988) Bool)

(assert (=> start!32124 (and (inv!12 thiss!1602) e!108390)))

(assert (=> start!32124 true))

(declare-fun b!158954 () Bool)

(declare-fun e!108388 () Bool)

(declare-fun lt!250673 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158954 (= e!108388 (byteRangesEq!0 (select (arr!4331 (buf!3868 thiss!1602)) (currentByte!7093 thiss!1602)) lt!250673 #b00000000000000000000000000000000 (currentBit!7088 thiss!1602)))))

(declare-fun b!158955 () Bool)

(declare-fun e!108386 () Bool)

(assert (=> b!158955 (= e!108387 (not e!108386))))

(declare-fun res!132683 () Bool)

(assert (=> b!158955 (=> res!132683 e!108386)))

(declare-fun lt!250679 () array!7529)

(declare-datatypes ((Unit!10731 0))(
  ( (Unit!10732) )
))
(declare-datatypes ((tuple3!722 0))(
  ( (tuple3!723 (_1!7709 Unit!10731) (_2!7709 (_ BitVec 8)) (_3!478 BitStream!5988)) )
))
(declare-fun lt!250680 () tuple3!722)

(declare-fun arrayRangesEq!461 (array!7529 array!7529 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158955 (= res!132683 (not (arrayRangesEq!461 (buf!3868 thiss!1602) lt!250679 #b00000000000000000000000000000000 (bvsub (currentByte!7093 (_3!478 lt!250680)) #b00000000000000000000000000000001))))))

(declare-fun lt!250671 () (_ BitVec 8))

(assert (=> b!158955 (arrayRangesEq!461 (buf!3868 thiss!1602) (array!7530 (store (arr!4331 (buf!3868 thiss!1602)) (bvsub (currentByte!7093 (_3!478 lt!250680)) #b00000000000000000000000000000001) lt!250671) (size!3410 (buf!3868 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7093 (_3!478 lt!250680)) #b00000000000000000000000000000001))))

(declare-fun lt!250674 () Unit!10731)

(declare-fun arrayUpdatedAtPrefixLemma!69 (array!7529 (_ BitVec 32) (_ BitVec 8)) Unit!10731)

(assert (=> b!158955 (= lt!250674 (arrayUpdatedAtPrefixLemma!69 (buf!3868 thiss!1602) (bvsub (currentByte!7093 (_3!478 lt!250680)) #b00000000000000000000000000000001) lt!250671))))

(assert (=> b!158955 (= lt!250671 (select (arr!4331 (buf!3868 (_3!478 lt!250680))) (bvsub (currentByte!7093 (_3!478 lt!250680)) #b00000000000000000000000000000001)))))

(declare-fun lt!250672 () (_ BitVec 32))

(declare-fun lt!250678 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250676 () (_ BitVec 8))

(declare-fun lt!250670 () (_ BitVec 32))

(declare-fun lt!250677 () (_ BitVec 32))

(declare-fun Unit!10733 () Unit!10731)

(declare-fun Unit!10734 () Unit!10731)

(assert (=> b!158955 (= lt!250680 (ite (bvsgt lt!250677 #b00000000000000000000000000000000) (let ((bdg!9252 ((_ extract 7 0) (bvnot lt!250672)))) (let ((bdg!9253 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4331 (buf!3868 thiss!1602)) (currentByte!7093 thiss!1602) lt!250676) (currentByte!7093 thiss!1602) lt!250673) (bvadd #b00000000000000000000000000000001 (currentByte!7093 thiss!1602)))) ((_ sign_extend 24) bdg!9252))))) (tuple3!723 Unit!10733 bdg!9252 (BitStream!5989 (array!7530 (store (arr!4331 (array!7530 (store (arr!4331 lt!250679) (bvadd #b00000000000000000000000000000001 (currentByte!7093 thiss!1602)) bdg!9253) (size!3410 lt!250679))) (bvadd #b00000000000000000000000000000001 (currentByte!7093 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9253) (bvshl ((_ sign_extend 24) v!222) lt!250670)))) (size!3410 (array!7530 (store (arr!4331 lt!250679) (bvadd #b00000000000000000000000000000001 (currentByte!7093 thiss!1602)) bdg!9253) (size!3410 lt!250679)))) (bvadd #b00000000000000000000000000000001 (currentByte!7093 thiss!1602)) (currentBit!7088 thiss!1602))))) (tuple3!723 Unit!10734 lt!250678 (BitStream!5989 lt!250679 (bvadd #b00000000000000000000000000000001 (currentByte!7093 thiss!1602)) (currentBit!7088 thiss!1602)))))))

(assert (=> b!158955 e!108388))

(declare-fun res!132680 () Bool)

(assert (=> b!158955 (=> res!132680 e!108388)))

(assert (=> b!158955 (= res!132680 (bvsge (currentByte!7093 thiss!1602) (size!3410 (buf!3868 thiss!1602))))))

(assert (=> b!158955 (= lt!250679 (array!7530 (store (store (arr!4331 (buf!3868 thiss!1602)) (currentByte!7093 thiss!1602) lt!250676) (currentByte!7093 thiss!1602) lt!250673) (size!3410 (buf!3868 thiss!1602))))))

(assert (=> b!158955 (= lt!250673 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250676) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250677))))))

(assert (=> b!158955 (= lt!250676 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4331 (buf!3868 thiss!1602)) (currentByte!7093 thiss!1602))) lt!250672)))))

(assert (=> b!158955 (= lt!250672 ((_ sign_extend 24) lt!250678))))

(assert (=> b!158955 (= lt!250678 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250670)))))))

(assert (=> b!158955 (= lt!250670 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250677))))))

(assert (=> b!158955 (= lt!250677 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7088 thiss!1602))))))

(declare-fun b!158956 () Bool)

(assert (=> b!158956 (= e!108386 true)))

(assert (=> b!158956 (arrayRangesEq!461 (buf!3868 thiss!1602) (array!7530 (store (arr!4331 (buf!3868 thiss!1602)) (currentByte!7093 (_3!478 lt!250680)) (select (arr!4331 (buf!3868 (_3!478 lt!250680))) (currentByte!7093 (_3!478 lt!250680)))) (size!3410 (buf!3868 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7093 (_3!478 lt!250680)))))

(declare-fun lt!250675 () Unit!10731)

(assert (=> b!158956 (= lt!250675 (arrayUpdatedAtPrefixLemma!69 (buf!3868 thiss!1602) (currentByte!7093 (_3!478 lt!250680)) (select (arr!4331 (buf!3868 (_3!478 lt!250680))) (currentByte!7093 (_3!478 lt!250680)))))))

(declare-fun b!158957 () Bool)

(declare-fun res!132681 () Bool)

(assert (=> b!158957 (=> res!132681 e!108386)))

(assert (=> b!158957 (= res!132681 (bvsle lt!250677 #b00000000000000000000000000000000))))

(declare-fun b!158958 () Bool)

(declare-fun array_inv!3157 (array!7529) Bool)

(assert (=> b!158958 (= e!108390 (array_inv!3157 (buf!3868 thiss!1602)))))

(assert (= (and start!32124 res!132682) b!158955))

(assert (= (and b!158955 (not res!132680)) b!158954))

(assert (= (and b!158955 (not res!132683)) b!158957))

(assert (= (and b!158957 (not res!132681)) b!158956))

(assert (= start!32124 b!158958))

(declare-fun m!249827 () Bool)

(assert (=> b!158955 m!249827))

(declare-fun m!249829 () Bool)

(assert (=> b!158955 m!249829))

(declare-fun m!249831 () Bool)

(assert (=> b!158955 m!249831))

(declare-fun m!249833 () Bool)

(assert (=> b!158955 m!249833))

(declare-fun m!249835 () Bool)

(assert (=> b!158955 m!249835))

(declare-fun m!249837 () Bool)

(assert (=> b!158955 m!249837))

(declare-fun m!249839 () Bool)

(assert (=> b!158955 m!249839))

(declare-fun m!249841 () Bool)

(assert (=> b!158955 m!249841))

(declare-fun m!249843 () Bool)

(assert (=> b!158955 m!249843))

(declare-fun m!249845 () Bool)

(assert (=> b!158955 m!249845))

(declare-fun m!249847 () Bool)

(assert (=> b!158955 m!249847))

(declare-fun m!249849 () Bool)

(assert (=> b!158955 m!249849))

(declare-fun m!249851 () Bool)

(assert (=> b!158956 m!249851))

(declare-fun m!249853 () Bool)

(assert (=> b!158956 m!249853))

(declare-fun m!249855 () Bool)

(assert (=> b!158956 m!249855))

(assert (=> b!158956 m!249851))

(declare-fun m!249857 () Bool)

(assert (=> b!158956 m!249857))

(declare-fun m!249859 () Bool)

(assert (=> b!158958 m!249859))

(declare-fun m!249861 () Bool)

(assert (=> start!32124 m!249861))

(declare-fun m!249863 () Bool)

(assert (=> start!32124 m!249863))

(assert (=> b!158954 m!249847))

(assert (=> b!158954 m!249847))

(declare-fun m!249865 () Bool)

(assert (=> b!158954 m!249865))

(check-sat (not b!158954) (not b!158958) (not b!158956) (not b!158955) (not start!32124))

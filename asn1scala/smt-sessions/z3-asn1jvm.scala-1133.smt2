; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32130 () Bool)

(assert start!32130)

(declare-fun b!158999 () Bool)

(declare-fun e!108431 () Bool)

(declare-datatypes ((array!7535 0))(
  ( (array!7536 (arr!4334 (Array (_ BitVec 32) (_ BitVec 8))) (size!3413 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5994 0))(
  ( (BitStream!5995 (buf!3871 array!7535) (currentByte!7096 (_ BitVec 32)) (currentBit!7091 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5994)

(declare-fun lt!250774 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158999 (= e!108431 (byteRangesEq!0 (select (arr!4334 (buf!3871 thiss!1602)) (currentByte!7096 thiss!1602)) lt!250774 #b00000000000000000000000000000000 (currentBit!7091 thiss!1602)))))

(declare-fun b!159000 () Bool)

(declare-fun e!108432 () Bool)

(declare-fun e!108433 () Bool)

(assert (=> b!159000 (= e!108432 (not e!108433))))

(declare-fun res!132717 () Bool)

(assert (=> b!159000 (=> res!132717 e!108433)))

(declare-datatypes ((Unit!10743 0))(
  ( (Unit!10744) )
))
(declare-datatypes ((tuple3!728 0))(
  ( (tuple3!729 (_1!7712 Unit!10743) (_2!7712 (_ BitVec 8)) (_3!481 BitStream!5994)) )
))
(declare-fun lt!250784 () tuple3!728)

(declare-fun lt!250785 () array!7535)

(declare-fun arrayRangesEq!464 (array!7535 array!7535 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159000 (= res!132717 (not (arrayRangesEq!464 (buf!3871 thiss!1602) lt!250785 #b00000000000000000000000000000000 (bvsub (currentByte!7096 (_3!481 lt!250784)) #b00000000000000000000000000000001))))))

(declare-fun lt!250775 () (_ BitVec 8))

(assert (=> b!159000 (arrayRangesEq!464 (buf!3871 thiss!1602) (array!7536 (store (arr!4334 (buf!3871 thiss!1602)) (bvsub (currentByte!7096 (_3!481 lt!250784)) #b00000000000000000000000000000001) lt!250775) (size!3413 (buf!3871 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7096 (_3!481 lt!250784)) #b00000000000000000000000000000001))))

(declare-fun lt!250782 () Unit!10743)

(declare-fun arrayUpdatedAtPrefixLemma!72 (array!7535 (_ BitVec 32) (_ BitVec 8)) Unit!10743)

(assert (=> b!159000 (= lt!250782 (arrayUpdatedAtPrefixLemma!72 (buf!3871 thiss!1602) (bvsub (currentByte!7096 (_3!481 lt!250784)) #b00000000000000000000000000000001) lt!250775))))

(assert (=> b!159000 (= lt!250775 (select (arr!4334 (buf!3871 (_3!481 lt!250784))) (bvsub (currentByte!7096 (_3!481 lt!250784)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250777 () (_ BitVec 32))

(declare-fun lt!250779 () (_ BitVec 8))

(declare-fun lt!250781 () (_ BitVec 32))

(declare-fun lt!250778 () (_ BitVec 32))

(declare-fun lt!250780 () (_ BitVec 8))

(declare-fun Unit!10745 () Unit!10743)

(declare-fun Unit!10746 () Unit!10743)

(assert (=> b!159000 (= lt!250784 (ite (bvsgt lt!250781 #b00000000000000000000000000000000) (let ((bdg!9265 ((_ extract 7 0) (bvnot lt!250777)))) (let ((bdg!9266 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4334 (buf!3871 thiss!1602)) (currentByte!7096 thiss!1602) lt!250779) (currentByte!7096 thiss!1602) lt!250774) (bvadd #b00000000000000000000000000000001 (currentByte!7096 thiss!1602)))) ((_ sign_extend 24) bdg!9265))))) (tuple3!729 Unit!10745 bdg!9265 (BitStream!5995 (array!7536 (store (arr!4334 (array!7536 (store (arr!4334 lt!250785) (bvadd #b00000000000000000000000000000001 (currentByte!7096 thiss!1602)) bdg!9266) (size!3413 lt!250785))) (bvadd #b00000000000000000000000000000001 (currentByte!7096 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9266) (bvshl ((_ sign_extend 24) v!222) lt!250778)))) (size!3413 (array!7536 (store (arr!4334 lt!250785) (bvadd #b00000000000000000000000000000001 (currentByte!7096 thiss!1602)) bdg!9266) (size!3413 lt!250785)))) (bvadd #b00000000000000000000000000000001 (currentByte!7096 thiss!1602)) (currentBit!7091 thiss!1602))))) (tuple3!729 Unit!10746 lt!250780 (BitStream!5995 lt!250785 (bvadd #b00000000000000000000000000000001 (currentByte!7096 thiss!1602)) (currentBit!7091 thiss!1602)))))))

(assert (=> b!159000 e!108431))

(declare-fun res!132718 () Bool)

(assert (=> b!159000 (=> res!132718 e!108431)))

(assert (=> b!159000 (= res!132718 (bvsge (currentByte!7096 thiss!1602) (size!3413 (buf!3871 thiss!1602))))))

(assert (=> b!159000 (= lt!250785 (array!7536 (store (store (arr!4334 (buf!3871 thiss!1602)) (currentByte!7096 thiss!1602) lt!250779) (currentByte!7096 thiss!1602) lt!250774) (size!3413 (buf!3871 thiss!1602))))))

(assert (=> b!159000 (= lt!250774 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250779) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250781))))))

(assert (=> b!159000 (= lt!250779 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4334 (buf!3871 thiss!1602)) (currentByte!7096 thiss!1602))) lt!250777)))))

(assert (=> b!159000 (= lt!250777 ((_ sign_extend 24) lt!250780))))

(assert (=> b!159000 (= lt!250780 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250778)))))))

(assert (=> b!159000 (= lt!250778 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250781))))))

(assert (=> b!159000 (= lt!250781 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7091 thiss!1602))))))

(declare-fun b!159001 () Bool)

(declare-fun res!132716 () Bool)

(assert (=> b!159001 (=> res!132716 e!108433)))

(assert (=> b!159001 (= res!132716 (bvsle lt!250781 #b00000000000000000000000000000000))))

(declare-fun res!132719 () Bool)

(assert (=> start!32130 (=> (not res!132719) (not e!108432))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32130 (= res!132719 (validate_offset_byte!0 ((_ sign_extend 32) (size!3413 (buf!3871 thiss!1602))) ((_ sign_extend 32) (currentByte!7096 thiss!1602)) ((_ sign_extend 32) (currentBit!7091 thiss!1602))))))

(assert (=> start!32130 e!108432))

(declare-fun e!108435 () Bool)

(declare-fun inv!12 (BitStream!5994) Bool)

(assert (=> start!32130 (and (inv!12 thiss!1602) e!108435)))

(assert (=> start!32130 true))

(declare-fun b!159002 () Bool)

(declare-fun array_inv!3160 (array!7535) Bool)

(assert (=> b!159002 (= e!108435 (array_inv!3160 (buf!3871 thiss!1602)))))

(declare-fun b!159003 () Bool)

(assert (=> b!159003 (= e!108433 true)))

(assert (=> b!159003 (arrayRangesEq!464 lt!250785 (array!7536 (store (store (store (arr!4334 (buf!3871 thiss!1602)) (currentByte!7096 thiss!1602) lt!250779) (currentByte!7096 thiss!1602) lt!250774) (currentByte!7096 (_3!481 lt!250784)) (select (arr!4334 (buf!3871 (_3!481 lt!250784))) (currentByte!7096 (_3!481 lt!250784)))) (size!3413 (buf!3871 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7096 (_3!481 lt!250784)))))

(declare-fun lt!250783 () Unit!10743)

(assert (=> b!159003 (= lt!250783 (arrayUpdatedAtPrefixLemma!72 lt!250785 (currentByte!7096 (_3!481 lt!250784)) (select (arr!4334 (buf!3871 (_3!481 lt!250784))) (currentByte!7096 (_3!481 lt!250784)))))))

(assert (=> b!159003 (arrayRangesEq!464 (buf!3871 thiss!1602) (array!7536 (store (arr!4334 (buf!3871 thiss!1602)) (currentByte!7096 (_3!481 lt!250784)) (select (arr!4334 (buf!3871 (_3!481 lt!250784))) (currentByte!7096 (_3!481 lt!250784)))) (size!3413 (buf!3871 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7096 (_3!481 lt!250784)))))

(declare-fun lt!250776 () Unit!10743)

(assert (=> b!159003 (= lt!250776 (arrayUpdatedAtPrefixLemma!72 (buf!3871 thiss!1602) (currentByte!7096 (_3!481 lt!250784)) (select (arr!4334 (buf!3871 (_3!481 lt!250784))) (currentByte!7096 (_3!481 lt!250784)))))))

(assert (= (and start!32130 res!132719) b!159000))

(assert (= (and b!159000 (not res!132718)) b!158999))

(assert (= (and b!159000 (not res!132717)) b!159001))

(assert (= (and b!159001 (not res!132716)) b!159003))

(assert (= start!32130 b!159002))

(declare-fun m!249953 () Bool)

(assert (=> b!158999 m!249953))

(assert (=> b!158999 m!249953))

(declare-fun m!249955 () Bool)

(assert (=> b!158999 m!249955))

(declare-fun m!249957 () Bool)

(assert (=> b!159002 m!249957))

(declare-fun m!249959 () Bool)

(assert (=> b!159003 m!249959))

(declare-fun m!249961 () Bool)

(assert (=> b!159003 m!249961))

(declare-fun m!249963 () Bool)

(assert (=> b!159003 m!249963))

(declare-fun m!249965 () Bool)

(assert (=> b!159003 m!249965))

(assert (=> b!159003 m!249963))

(declare-fun m!249967 () Bool)

(assert (=> b!159003 m!249967))

(declare-fun m!249969 () Bool)

(assert (=> b!159003 m!249969))

(assert (=> b!159003 m!249963))

(declare-fun m!249971 () Bool)

(assert (=> b!159003 m!249971))

(declare-fun m!249973 () Bool)

(assert (=> b!159003 m!249973))

(declare-fun m!249975 () Bool)

(assert (=> b!159003 m!249975))

(declare-fun m!249977 () Bool)

(assert (=> start!32130 m!249977))

(declare-fun m!249979 () Bool)

(assert (=> start!32130 m!249979))

(declare-fun m!249981 () Bool)

(assert (=> b!159000 m!249981))

(declare-fun m!249983 () Bool)

(assert (=> b!159000 m!249983))

(assert (=> b!159000 m!249953))

(declare-fun m!249985 () Bool)

(assert (=> b!159000 m!249985))

(declare-fun m!249987 () Bool)

(assert (=> b!159000 m!249987))

(declare-fun m!249989 () Bool)

(assert (=> b!159000 m!249989))

(assert (=> b!159000 m!249975))

(declare-fun m!249991 () Bool)

(assert (=> b!159000 m!249991))

(declare-fun m!249993 () Bool)

(assert (=> b!159000 m!249993))

(declare-fun m!249995 () Bool)

(assert (=> b!159000 m!249995))

(assert (=> b!159000 m!249961))

(declare-fun m!249997 () Bool)

(assert (=> b!159000 m!249997))

(check-sat (not b!158999) (not b!159003) (not b!159000) (not b!159002) (not start!32130))

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32132 () Bool)

(assert start!32132)

(declare-fun res!132731 () Bool)

(declare-fun e!108450 () Bool)

(assert (=> start!32132 (=> (not res!132731) (not e!108450))))

(declare-datatypes ((array!7537 0))(
  ( (array!7538 (arr!4335 (Array (_ BitVec 32) (_ BitVec 8))) (size!3414 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5996 0))(
  ( (BitStream!5997 (buf!3872 array!7537) (currentByte!7097 (_ BitVec 32)) (currentBit!7092 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5996)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32132 (= res!132731 (validate_offset_byte!0 ((_ sign_extend 32) (size!3414 (buf!3872 thiss!1602))) ((_ sign_extend 32) (currentByte!7097 thiss!1602)) ((_ sign_extend 32) (currentBit!7092 thiss!1602))))))

(assert (=> start!32132 e!108450))

(declare-fun e!108446 () Bool)

(declare-fun inv!12 (BitStream!5996) Bool)

(assert (=> start!32132 (and (inv!12 thiss!1602) e!108446)))

(assert (=> start!32132 true))

(declare-fun b!159014 () Bool)

(declare-fun array_inv!3161 (array!7537) Bool)

(assert (=> b!159014 (= e!108446 (array_inv!3161 (buf!3872 thiss!1602)))))

(declare-fun b!159015 () Bool)

(declare-fun e!108449 () Bool)

(declare-fun lt!250810 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159015 (= e!108449 (byteRangesEq!0 (select (arr!4335 (buf!3872 thiss!1602)) (currentByte!7097 thiss!1602)) lt!250810 #b00000000000000000000000000000000 (currentBit!7092 thiss!1602)))))

(declare-fun b!159016 () Bool)

(declare-fun res!132730 () Bool)

(declare-fun e!108448 () Bool)

(assert (=> b!159016 (=> res!132730 e!108448)))

(declare-fun lt!250821 () (_ BitVec 32))

(assert (=> b!159016 (= res!132730 (bvsle lt!250821 #b00000000000000000000000000000000))))

(declare-fun b!159017 () Bool)

(assert (=> b!159017 (= e!108448 true)))

(declare-datatypes ((Unit!10747 0))(
  ( (Unit!10748) )
))
(declare-datatypes ((tuple3!730 0))(
  ( (tuple3!731 (_1!7713 Unit!10747) (_2!7713 (_ BitVec 8)) (_3!482 BitStream!5996)) )
))
(declare-fun lt!250820 () tuple3!730)

(declare-fun lt!250813 () array!7537)

(declare-fun lt!250811 () (_ BitVec 8))

(declare-fun arrayRangesEq!465 (array!7537 array!7537 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159017 (arrayRangesEq!465 lt!250813 (array!7538 (store (store (store (arr!4335 (buf!3872 thiss!1602)) (currentByte!7097 thiss!1602) lt!250811) (currentByte!7097 thiss!1602) lt!250810) (currentByte!7097 (_3!482 lt!250820)) (select (arr!4335 (buf!3872 (_3!482 lt!250820))) (currentByte!7097 (_3!482 lt!250820)))) (size!3414 (buf!3872 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7097 (_3!482 lt!250820)))))

(declare-fun lt!250816 () Unit!10747)

(declare-fun arrayUpdatedAtPrefixLemma!73 (array!7537 (_ BitVec 32) (_ BitVec 8)) Unit!10747)

(assert (=> b!159017 (= lt!250816 (arrayUpdatedAtPrefixLemma!73 lt!250813 (currentByte!7097 (_3!482 lt!250820)) (select (arr!4335 (buf!3872 (_3!482 lt!250820))) (currentByte!7097 (_3!482 lt!250820)))))))

(assert (=> b!159017 (arrayRangesEq!465 (buf!3872 thiss!1602) (array!7538 (store (arr!4335 (buf!3872 thiss!1602)) (currentByte!7097 (_3!482 lt!250820)) (select (arr!4335 (buf!3872 (_3!482 lt!250820))) (currentByte!7097 (_3!482 lt!250820)))) (size!3414 (buf!3872 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7097 (_3!482 lt!250820)))))

(declare-fun lt!250817 () Unit!10747)

(assert (=> b!159017 (= lt!250817 (arrayUpdatedAtPrefixLemma!73 (buf!3872 thiss!1602) (currentByte!7097 (_3!482 lt!250820)) (select (arr!4335 (buf!3872 (_3!482 lt!250820))) (currentByte!7097 (_3!482 lt!250820)))))))

(declare-fun b!159018 () Bool)

(assert (=> b!159018 (= e!108450 (not e!108448))))

(declare-fun res!132728 () Bool)

(assert (=> b!159018 (=> res!132728 e!108448)))

(assert (=> b!159018 (= res!132728 (not (arrayRangesEq!465 (buf!3872 thiss!1602) lt!250813 #b00000000000000000000000000000000 (bvsub (currentByte!7097 (_3!482 lt!250820)) #b00000000000000000000000000000001))))))

(declare-fun lt!250815 () (_ BitVec 8))

(assert (=> b!159018 (arrayRangesEq!465 (buf!3872 thiss!1602) (array!7538 (store (arr!4335 (buf!3872 thiss!1602)) (bvsub (currentByte!7097 (_3!482 lt!250820)) #b00000000000000000000000000000001) lt!250815) (size!3414 (buf!3872 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7097 (_3!482 lt!250820)) #b00000000000000000000000000000001))))

(declare-fun lt!250814 () Unit!10747)

(assert (=> b!159018 (= lt!250814 (arrayUpdatedAtPrefixLemma!73 (buf!3872 thiss!1602) (bvsub (currentByte!7097 (_3!482 lt!250820)) #b00000000000000000000000000000001) lt!250815))))

(assert (=> b!159018 (= lt!250815 (select (arr!4335 (buf!3872 (_3!482 lt!250820))) (bvsub (currentByte!7097 (_3!482 lt!250820)) #b00000000000000000000000000000001)))))

(declare-fun lt!250812 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250818 () (_ BitVec 8))

(declare-fun lt!250819 () (_ BitVec 32))

(declare-fun Unit!10749 () Unit!10747)

(declare-fun Unit!10750 () Unit!10747)

(assert (=> b!159018 (= lt!250820 (ite (bvsgt lt!250821 #b00000000000000000000000000000000) (let ((bdg!9265 ((_ extract 7 0) (bvnot lt!250812)))) (let ((bdg!9266 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4335 (buf!3872 thiss!1602)) (currentByte!7097 thiss!1602) lt!250811) (currentByte!7097 thiss!1602) lt!250810) (bvadd #b00000000000000000000000000000001 (currentByte!7097 thiss!1602)))) ((_ sign_extend 24) bdg!9265))))) (tuple3!731 Unit!10749 bdg!9265 (BitStream!5997 (array!7538 (store (arr!4335 (array!7538 (store (arr!4335 lt!250813) (bvadd #b00000000000000000000000000000001 (currentByte!7097 thiss!1602)) bdg!9266) (size!3414 lt!250813))) (bvadd #b00000000000000000000000000000001 (currentByte!7097 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9266) (bvshl ((_ sign_extend 24) v!222) lt!250819)))) (size!3414 (array!7538 (store (arr!4335 lt!250813) (bvadd #b00000000000000000000000000000001 (currentByte!7097 thiss!1602)) bdg!9266) (size!3414 lt!250813)))) (bvadd #b00000000000000000000000000000001 (currentByte!7097 thiss!1602)) (currentBit!7092 thiss!1602))))) (tuple3!731 Unit!10750 lt!250818 (BitStream!5997 lt!250813 (bvadd #b00000000000000000000000000000001 (currentByte!7097 thiss!1602)) (currentBit!7092 thiss!1602)))))))

(assert (=> b!159018 e!108449))

(declare-fun res!132729 () Bool)

(assert (=> b!159018 (=> res!132729 e!108449)))

(assert (=> b!159018 (= res!132729 (bvsge (currentByte!7097 thiss!1602) (size!3414 (buf!3872 thiss!1602))))))

(assert (=> b!159018 (= lt!250813 (array!7538 (store (store (arr!4335 (buf!3872 thiss!1602)) (currentByte!7097 thiss!1602) lt!250811) (currentByte!7097 thiss!1602) lt!250810) (size!3414 (buf!3872 thiss!1602))))))

(assert (=> b!159018 (= lt!250810 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250811) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250821))))))

(assert (=> b!159018 (= lt!250811 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4335 (buf!3872 thiss!1602)) (currentByte!7097 thiss!1602))) lt!250812)))))

(assert (=> b!159018 (= lt!250812 ((_ sign_extend 24) lt!250818))))

(assert (=> b!159018 (= lt!250818 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250819)))))))

(assert (=> b!159018 (= lt!250819 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250821))))))

(assert (=> b!159018 (= lt!250821 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7092 thiss!1602))))))

(assert (= (and start!32132 res!132731) b!159018))

(assert (= (and b!159018 (not res!132729)) b!159015))

(assert (= (and b!159018 (not res!132728)) b!159016))

(assert (= (and b!159016 (not res!132730)) b!159017))

(assert (= start!32132 b!159014))

(declare-fun m!249999 () Bool)

(assert (=> b!159014 m!249999))

(declare-fun m!250001 () Bool)

(assert (=> b!159017 m!250001))

(declare-fun m!250003 () Bool)

(assert (=> b!159017 m!250003))

(declare-fun m!250005 () Bool)

(assert (=> b!159017 m!250005))

(declare-fun m!250007 () Bool)

(assert (=> b!159017 m!250007))

(declare-fun m!250009 () Bool)

(assert (=> b!159017 m!250009))

(declare-fun m!250011 () Bool)

(assert (=> b!159017 m!250011))

(declare-fun m!250013 () Bool)

(assert (=> b!159017 m!250013))

(assert (=> b!159017 m!250007))

(declare-fun m!250015 () Bool)

(assert (=> b!159017 m!250015))

(assert (=> b!159017 m!250007))

(declare-fun m!250017 () Bool)

(assert (=> b!159017 m!250017))

(declare-fun m!250019 () Bool)

(assert (=> b!159015 m!250019))

(assert (=> b!159015 m!250019))

(declare-fun m!250021 () Bool)

(assert (=> b!159015 m!250021))

(declare-fun m!250023 () Bool)

(assert (=> start!32132 m!250023))

(declare-fun m!250025 () Bool)

(assert (=> start!32132 m!250025))

(assert (=> b!159018 m!250001))

(declare-fun m!250027 () Bool)

(assert (=> b!159018 m!250027))

(declare-fun m!250029 () Bool)

(assert (=> b!159018 m!250029))

(declare-fun m!250031 () Bool)

(assert (=> b!159018 m!250031))

(assert (=> b!159018 m!250011))

(declare-fun m!250033 () Bool)

(assert (=> b!159018 m!250033))

(declare-fun m!250035 () Bool)

(assert (=> b!159018 m!250035))

(declare-fun m!250037 () Bool)

(assert (=> b!159018 m!250037))

(declare-fun m!250039 () Bool)

(assert (=> b!159018 m!250039))

(assert (=> b!159018 m!250019))

(declare-fun m!250041 () Bool)

(assert (=> b!159018 m!250041))

(declare-fun m!250043 () Bool)

(assert (=> b!159018 m!250043))

(push 1)

(assert (not b!159018))

(assert (not b!159015))

(assert (not b!159017))

(assert (not start!32132))

(assert (not b!159014))

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33674 () Bool)

(assert start!33674)

(declare-fun b!161243 () Bool)

(declare-fun res!134401 () Bool)

(declare-fun e!110964 () Bool)

(assert (=> b!161243 (=> res!134401 e!110964)))

(declare-fun lt!253865 () (_ BitVec 32))

(assert (=> b!161243 (= res!134401 (bvsle lt!253865 #b00000000000000000000000000000000))))

(declare-fun b!161244 () Bool)

(declare-fun e!110961 () Bool)

(declare-datatypes ((array!7953 0))(
  ( (array!7954 (arr!4491 (Array (_ BitVec 32) (_ BitVec 8))) (size!3570 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6308 0))(
  ( (BitStream!6309 (buf!4028 array!7953) (currentByte!7509 (_ BitVec 32)) (currentBit!7504 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6308)

(declare-fun array_inv!3317 (array!7953) Bool)

(assert (=> b!161244 (= e!110961 (array_inv!3317 (buf!4028 thiss!1602)))))

(declare-fun b!161246 () Bool)

(declare-fun e!110963 () Bool)

(assert (=> b!161246 (= e!110963 (not e!110964))))

(declare-fun res!134400 () Bool)

(assert (=> b!161246 (=> res!134400 e!110964)))

(declare-fun lt!253869 () array!7953)

(declare-datatypes ((Unit!11050 0))(
  ( (Unit!11051) )
))
(declare-datatypes ((tuple3!868 0))(
  ( (tuple3!869 (_1!7785 Unit!11050) (_2!7785 (_ BitVec 8)) (_3!551 BitStream!6308)) )
))
(declare-fun lt!253868 () tuple3!868)

(declare-fun arrayRangesEq!522 (array!7953 array!7953 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161246 (= res!134400 (not (arrayRangesEq!522 (buf!4028 thiss!1602) lt!253869 #b00000000000000000000000000000000 (bvsub (currentByte!7509 (_3!551 lt!253868)) #b00000000000000000000000000000001))))))

(declare-fun lt!253871 () (_ BitVec 8))

(assert (=> b!161246 (arrayRangesEq!522 (buf!4028 thiss!1602) (array!7954 (store (arr!4491 (buf!4028 thiss!1602)) (bvsub (currentByte!7509 (_3!551 lt!253868)) #b00000000000000000000000000000001) lt!253871) (size!3570 (buf!4028 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7509 (_3!551 lt!253868)) #b00000000000000000000000000000001))))

(declare-fun lt!253872 () Unit!11050)

(declare-fun arrayUpdatedAtPrefixLemma!130 (array!7953 (_ BitVec 32) (_ BitVec 8)) Unit!11050)

(assert (=> b!161246 (= lt!253872 (arrayUpdatedAtPrefixLemma!130 (buf!4028 thiss!1602) (bvsub (currentByte!7509 (_3!551 lt!253868)) #b00000000000000000000000000000001) lt!253871))))

(assert (=> b!161246 (= lt!253871 (select (arr!4491 (buf!4028 (_3!551 lt!253868))) (bvsub (currentByte!7509 (_3!551 lt!253868)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253875 () (_ BitVec 8))

(declare-fun lt!253867 () (_ BitVec 32))

(declare-fun lt!253874 () (_ BitVec 32))

(declare-fun lt!253866 () (_ BitVec 8))

(declare-fun lt!253873 () (_ BitVec 8))

(declare-fun Unit!11052 () Unit!11050)

(declare-fun Unit!11053 () Unit!11050)

(assert (=> b!161246 (= lt!253868 (ite (bvsgt lt!253865 #b00000000000000000000000000000000) (let ((bdg!9609 ((_ extract 7 0) (bvnot lt!253874)))) (let ((bdg!9610 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4491 (buf!4028 thiss!1602)) (currentByte!7509 thiss!1602) lt!253873) (currentByte!7509 thiss!1602) lt!253875) (bvadd #b00000000000000000000000000000001 (currentByte!7509 thiss!1602)))) ((_ sign_extend 24) bdg!9609))))) (tuple3!869 Unit!11052 bdg!9609 (BitStream!6309 (array!7954 (store (arr!4491 (array!7954 (store (arr!4491 lt!253869) (bvadd #b00000000000000000000000000000001 (currentByte!7509 thiss!1602)) bdg!9610) (size!3570 lt!253869))) (bvadd #b00000000000000000000000000000001 (currentByte!7509 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9610) (bvshl ((_ sign_extend 24) v!222) lt!253867)))) (size!3570 (array!7954 (store (arr!4491 lt!253869) (bvadd #b00000000000000000000000000000001 (currentByte!7509 thiss!1602)) bdg!9610) (size!3570 lt!253869)))) (bvadd #b00000000000000000000000000000001 (currentByte!7509 thiss!1602)) (currentBit!7504 thiss!1602))))) (tuple3!869 Unit!11053 lt!253866 (BitStream!6309 lt!253869 (bvadd #b00000000000000000000000000000001 (currentByte!7509 thiss!1602)) (currentBit!7504 thiss!1602)))))))

(declare-fun e!110962 () Bool)

(assert (=> b!161246 e!110962))

(declare-fun res!134402 () Bool)

(assert (=> b!161246 (=> res!134402 e!110962)))

(assert (=> b!161246 (= res!134402 (bvsge (currentByte!7509 thiss!1602) (size!3570 (buf!4028 thiss!1602))))))

(assert (=> b!161246 (= lt!253869 (array!7954 (store (store (arr!4491 (buf!4028 thiss!1602)) (currentByte!7509 thiss!1602) lt!253873) (currentByte!7509 thiss!1602) lt!253875) (size!3570 (buf!4028 thiss!1602))))))

(assert (=> b!161246 (= lt!253875 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253873) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253865))))))

(assert (=> b!161246 (= lt!253873 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4491 (buf!4028 thiss!1602)) (currentByte!7509 thiss!1602))) lt!253874)))))

(assert (=> b!161246 (= lt!253874 ((_ sign_extend 24) lt!253866))))

(assert (=> b!161246 (= lt!253866 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253867)))))))

(assert (=> b!161246 (= lt!253867 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253865))))))

(assert (=> b!161246 (= lt!253865 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7504 thiss!1602))))))

(declare-fun b!161247 () Bool)

(assert (=> b!161247 (= e!110964 (and (bvsge (currentByte!7509 (_3!551 lt!253868)) #b00000000000000000000000000000000) (bvslt (currentByte!7509 (_3!551 lt!253868)) (size!3570 (buf!4028 (_3!551 lt!253868))))))))

(assert (=> b!161247 (arrayRangesEq!522 (buf!4028 thiss!1602) (array!7954 (store (arr!4491 (buf!4028 thiss!1602)) (currentByte!7509 (_3!551 lt!253868)) (select (arr!4491 (buf!4028 (_3!551 lt!253868))) (currentByte!7509 (_3!551 lt!253868)))) (size!3570 (buf!4028 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7509 (_3!551 lt!253868)))))

(declare-fun lt!253870 () Unit!11050)

(assert (=> b!161247 (= lt!253870 (arrayUpdatedAtPrefixLemma!130 (buf!4028 thiss!1602) (currentByte!7509 (_3!551 lt!253868)) (select (arr!4491 (buf!4028 (_3!551 lt!253868))) (currentByte!7509 (_3!551 lt!253868)))))))

(declare-fun b!161245 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161245 (= e!110962 (byteRangesEq!0 (select (arr!4491 (buf!4028 thiss!1602)) (currentByte!7509 thiss!1602)) lt!253875 #b00000000000000000000000000000000 (currentBit!7504 thiss!1602)))))

(declare-fun res!134399 () Bool)

(assert (=> start!33674 (=> (not res!134399) (not e!110963))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33674 (= res!134399 (validate_offset_byte!0 ((_ sign_extend 32) (size!3570 (buf!4028 thiss!1602))) ((_ sign_extend 32) (currentByte!7509 thiss!1602)) ((_ sign_extend 32) (currentBit!7504 thiss!1602))))))

(assert (=> start!33674 e!110963))

(declare-fun inv!12 (BitStream!6308) Bool)

(assert (=> start!33674 (and (inv!12 thiss!1602) e!110961)))

(assert (=> start!33674 true))

(assert (= (and start!33674 res!134399) b!161246))

(assert (= (and b!161246 (not res!134402)) b!161245))

(assert (= (and b!161246 (not res!134400)) b!161243))

(assert (= (and b!161243 (not res!134401)) b!161247))

(assert (= start!33674 b!161244))

(declare-fun m!255183 () Bool)

(assert (=> b!161247 m!255183))

(declare-fun m!255185 () Bool)

(assert (=> b!161247 m!255185))

(declare-fun m!255187 () Bool)

(assert (=> b!161247 m!255187))

(assert (=> b!161247 m!255183))

(declare-fun m!255189 () Bool)

(assert (=> b!161247 m!255189))

(declare-fun m!255191 () Bool)

(assert (=> b!161244 m!255191))

(declare-fun m!255193 () Bool)

(assert (=> b!161246 m!255193))

(declare-fun m!255195 () Bool)

(assert (=> b!161246 m!255195))

(declare-fun m!255197 () Bool)

(assert (=> b!161246 m!255197))

(declare-fun m!255199 () Bool)

(assert (=> b!161246 m!255199))

(declare-fun m!255201 () Bool)

(assert (=> b!161246 m!255201))

(declare-fun m!255203 () Bool)

(assert (=> b!161246 m!255203))

(declare-fun m!255205 () Bool)

(assert (=> b!161246 m!255205))

(declare-fun m!255207 () Bool)

(assert (=> b!161246 m!255207))

(declare-fun m!255209 () Bool)

(assert (=> b!161246 m!255209))

(declare-fun m!255211 () Bool)

(assert (=> b!161246 m!255211))

(declare-fun m!255213 () Bool)

(assert (=> b!161246 m!255213))

(declare-fun m!255215 () Bool)

(assert (=> b!161246 m!255215))

(assert (=> b!161245 m!255213))

(assert (=> b!161245 m!255213))

(declare-fun m!255217 () Bool)

(assert (=> b!161245 m!255217))

(declare-fun m!255219 () Bool)

(assert (=> start!33674 m!255219))

(declare-fun m!255221 () Bool)

(assert (=> start!33674 m!255221))

(push 1)

(assert (not b!161246))

(assert (not b!161245))

(assert (not b!161244))

(assert (not start!33674))

(assert (not b!161247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55123 () Bool)

(declare-fun res!134421 () Bool)

(declare-fun e!110983 () Bool)

(assert (=> d!55123 (=> res!134421 e!110983)))

(assert (=> d!55123 (= res!134421 (= #b00000000000000000000000000000000 (bvsub (currentByte!7509 (_3!551 lt!253868)) #b00000000000000000000000000000001)))))

(assert (=> d!55123 (= (arrayRangesEq!522 (buf!4028 thiss!1602) lt!253869 #b00000000000000000000000000000000 (bvsub (currentByte!7509 (_3!551 lt!253868)) #b00000000000000000000000000000001)) e!110983)))

(declare-fun b!161266 () Bool)

(declare-fun e!110984 () Bool)

(assert (=> b!161266 (= e!110983 e!110984)))

(declare-fun res!134422 () Bool)

(assert (=> b!161266 (=> (not res!134422) (not e!110984))))


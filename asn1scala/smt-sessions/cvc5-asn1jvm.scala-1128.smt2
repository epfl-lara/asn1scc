; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32062 () Bool)

(assert start!32062)

(declare-fun res!132566 () Bool)

(declare-fun e!108198 () Bool)

(assert (=> start!32062 (=> (not res!132566) (not e!108198))))

(declare-datatypes ((array!7499 0))(
  ( (array!7500 (arr!4318 (Array (_ BitVec 32) (_ BitVec 8))) (size!3397 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5962 0))(
  ( (BitStream!5963 (buf!3855 array!7499) (currentByte!7078 (_ BitVec 32)) (currentBit!7073 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5962)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32062 (= res!132566 (validate_offset_byte!0 ((_ sign_extend 32) (size!3397 (buf!3855 thiss!1602))) ((_ sign_extend 32) (currentByte!7078 thiss!1602)) ((_ sign_extend 32) (currentBit!7073 thiss!1602))))))

(assert (=> start!32062 e!108198))

(declare-fun e!108199 () Bool)

(declare-fun inv!12 (BitStream!5962) Bool)

(assert (=> start!32062 (and (inv!12 thiss!1602) e!108199)))

(assert (=> start!32062 true))

(declare-fun b!158800 () Bool)

(declare-datatypes ((Unit!10679 0))(
  ( (Unit!10680) )
))
(declare-datatypes ((tuple3!696 0))(
  ( (tuple3!697 (_1!7696 Unit!10679) (_2!7696 (_ BitVec 8)) (_3!465 BitStream!5962)) )
))
(declare-fun lt!250274 () tuple3!696)

(assert (=> b!158800 (= e!108198 (not (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7078 (_3!465 lt!250274)) #b00000000000000000000000000000001))))))

(declare-fun lt!250267 () (_ BitVec 8))

(declare-fun arrayRangesEq!448 (array!7499 array!7499 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158800 (arrayRangesEq!448 (buf!3855 thiss!1602) (array!7500 (store (arr!4318 (buf!3855 thiss!1602)) (bvsub (currentByte!7078 (_3!465 lt!250274)) #b00000000000000000000000000000001) lt!250267) (size!3397 (buf!3855 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7078 (_3!465 lt!250274)) #b00000000000000000000000000000001))))

(declare-fun lt!250270 () Unit!10679)

(declare-fun arrayUpdatedAtPrefixLemma!56 (array!7499 (_ BitVec 32) (_ BitVec 8)) Unit!10679)

(assert (=> b!158800 (= lt!250270 (arrayUpdatedAtPrefixLemma!56 (buf!3855 thiss!1602) (bvsub (currentByte!7078 (_3!465 lt!250274)) #b00000000000000000000000000000001) lt!250267))))

(assert (=> b!158800 (= lt!250267 (select (arr!4318 (buf!3855 (_3!465 lt!250274))) (bvsub (currentByte!7078 (_3!465 lt!250274)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250271 () array!7499)

(declare-fun lt!250273 () (_ BitVec 8))

(declare-fun lt!250269 () (_ BitVec 8))

(declare-fun lt!250272 () (_ BitVec 32))

(declare-fun lt!250268 () (_ BitVec 32))

(declare-fun lt!250266 () (_ BitVec 32))

(declare-fun lt!250275 () (_ BitVec 8))

(declare-fun Unit!10681 () Unit!10679)

(declare-fun Unit!10682 () Unit!10679)

(assert (=> b!158800 (= lt!250274 (ite (bvsgt lt!250272 #b00000000000000000000000000000000) (let ((bdg!9204 ((_ extract 7 0) (bvnot lt!250268)))) (let ((bdg!9205 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4318 (buf!3855 thiss!1602)) (currentByte!7078 thiss!1602) lt!250275) (currentByte!7078 thiss!1602) lt!250269) (bvadd #b00000000000000000000000000000001 (currentByte!7078 thiss!1602)))) ((_ sign_extend 24) bdg!9204))))) (tuple3!697 Unit!10681 bdg!9204 (BitStream!5963 (array!7500 (store (arr!4318 (array!7500 (store (arr!4318 lt!250271) (bvadd #b00000000000000000000000000000001 (currentByte!7078 thiss!1602)) bdg!9205) (size!3397 lt!250271))) (bvadd #b00000000000000000000000000000001 (currentByte!7078 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9205) (bvshl ((_ sign_extend 24) v!222) lt!250266)))) (size!3397 (array!7500 (store (arr!4318 lt!250271) (bvadd #b00000000000000000000000000000001 (currentByte!7078 thiss!1602)) bdg!9205) (size!3397 lt!250271)))) (bvadd #b00000000000000000000000000000001 (currentByte!7078 thiss!1602)) (currentBit!7073 thiss!1602))))) (tuple3!697 Unit!10682 lt!250273 (BitStream!5963 lt!250271 (bvadd #b00000000000000000000000000000001 (currentByte!7078 thiss!1602)) (currentBit!7073 thiss!1602)))))))

(declare-fun e!108200 () Bool)

(assert (=> b!158800 e!108200))

(declare-fun res!132565 () Bool)

(assert (=> b!158800 (=> res!132565 e!108200)))

(assert (=> b!158800 (= res!132565 (bvsge (currentByte!7078 thiss!1602) (size!3397 (buf!3855 thiss!1602))))))

(assert (=> b!158800 (= lt!250271 (array!7500 (store (store (arr!4318 (buf!3855 thiss!1602)) (currentByte!7078 thiss!1602) lt!250275) (currentByte!7078 thiss!1602) lt!250269) (size!3397 (buf!3855 thiss!1602))))))

(assert (=> b!158800 (= lt!250269 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250275) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250272))))))

(assert (=> b!158800 (= lt!250275 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4318 (buf!3855 thiss!1602)) (currentByte!7078 thiss!1602))) lt!250268)))))

(assert (=> b!158800 (= lt!250268 ((_ sign_extend 24) lt!250273))))

(assert (=> b!158800 (= lt!250273 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250266)))))))

(assert (=> b!158800 (= lt!250266 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250272))))))

(assert (=> b!158800 (= lt!250272 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7073 thiss!1602))))))

(declare-fun b!158801 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158801 (= e!108200 (byteRangesEq!0 (select (arr!4318 (buf!3855 thiss!1602)) (currentByte!7078 thiss!1602)) lt!250269 #b00000000000000000000000000000000 (currentBit!7073 thiss!1602)))))

(declare-fun b!158802 () Bool)

(declare-fun array_inv!3144 (array!7499) Bool)

(assert (=> b!158802 (= e!108199 (array_inv!3144 (buf!3855 thiss!1602)))))

(assert (= (and start!32062 res!132566) b!158800))

(assert (= (and b!158800 (not res!132565)) b!158801))

(assert (= start!32062 b!158802))

(declare-fun m!249385 () Bool)

(assert (=> start!32062 m!249385))

(declare-fun m!249387 () Bool)

(assert (=> start!32062 m!249387))

(declare-fun m!249389 () Bool)

(assert (=> b!158800 m!249389))

(declare-fun m!249391 () Bool)

(assert (=> b!158800 m!249391))

(declare-fun m!249393 () Bool)

(assert (=> b!158800 m!249393))

(declare-fun m!249395 () Bool)

(assert (=> b!158800 m!249395))

(declare-fun m!249397 () Bool)

(assert (=> b!158800 m!249397))

(declare-fun m!249399 () Bool)

(assert (=> b!158800 m!249399))

(declare-fun m!249401 () Bool)

(assert (=> b!158800 m!249401))

(declare-fun m!249403 () Bool)

(assert (=> b!158800 m!249403))

(declare-fun m!249405 () Bool)

(assert (=> b!158800 m!249405))

(declare-fun m!249407 () Bool)

(assert (=> b!158800 m!249407))

(declare-fun m!249409 () Bool)

(assert (=> b!158800 m!249409))

(assert (=> b!158801 m!249397))

(assert (=> b!158801 m!249397))

(declare-fun m!249411 () Bool)

(assert (=> b!158801 m!249411))

(declare-fun m!249413 () Bool)

(assert (=> b!158802 m!249413))

(push 1)

(assert (not b!158802))

(assert (not b!158801))

(assert (not b!158800))

(assert (not start!32062))

(check-sat)

(pop 1)

(push 1)

(check-sat)


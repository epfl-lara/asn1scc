; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33702 () Bool)

(assert start!33702)

(declare-fun b!161301 () Bool)

(declare-fun res!134454 () Bool)

(declare-fun e!111022 () Bool)

(assert (=> b!161301 (=> res!134454 e!111022)))

(declare-fun lt!253945 () (_ BitVec 32))

(assert (=> b!161301 (= res!134454 (bvsle lt!253945 #b00000000000000000000000000000000))))

(declare-fun b!161302 () Bool)

(declare-fun e!111019 () Bool)

(assert (=> b!161302 (= e!111019 (not e!111022))))

(declare-fun res!134452 () Bool)

(assert (=> b!161302 (=> res!134452 e!111022)))

(declare-datatypes ((array!7959 0))(
  ( (array!7960 (arr!4493 (Array (_ BitVec 32) (_ BitVec 8))) (size!3572 (_ BitVec 32))) )
))
(declare-fun lt!253947 () array!7959)

(declare-datatypes ((BitStream!6312 0))(
  ( (BitStream!6313 (buf!4030 array!7959) (currentByte!7513 (_ BitVec 32)) (currentBit!7508 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11058 0))(
  ( (Unit!11059) )
))
(declare-datatypes ((tuple3!872 0))(
  ( (tuple3!873 (_1!7787 Unit!11058) (_2!7787 (_ BitVec 8)) (_3!553 BitStream!6312)) )
))
(declare-fun lt!253948 () tuple3!872)

(declare-fun thiss!1602 () BitStream!6312)

(declare-fun arrayRangesEq!524 (array!7959 array!7959 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161302 (= res!134452 (not (arrayRangesEq!524 (buf!4030 thiss!1602) lt!253947 #b00000000000000000000000000000000 (bvsub (currentByte!7513 (_3!553 lt!253948)) #b00000000000000000000000000000001))))))

(declare-fun lt!253946 () (_ BitVec 8))

(assert (=> b!161302 (arrayRangesEq!524 (buf!4030 thiss!1602) (array!7960 (store (arr!4493 (buf!4030 thiss!1602)) (bvsub (currentByte!7513 (_3!553 lt!253948)) #b00000000000000000000000000000001) lt!253946) (size!3572 (buf!4030 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7513 (_3!553 lt!253948)) #b00000000000000000000000000000001))))

(declare-fun lt!253939 () Unit!11058)

(declare-fun arrayUpdatedAtPrefixLemma!132 (array!7959 (_ BitVec 32) (_ BitVec 8)) Unit!11058)

(assert (=> b!161302 (= lt!253939 (arrayUpdatedAtPrefixLemma!132 (buf!4030 thiss!1602) (bvsub (currentByte!7513 (_3!553 lt!253948)) #b00000000000000000000000000000001) lt!253946))))

(assert (=> b!161302 (= lt!253946 (select (arr!4493 (buf!4030 (_3!553 lt!253948))) (bvsub (currentByte!7513 (_3!553 lt!253948)) #b00000000000000000000000000000001)))))

(declare-fun lt!253941 () (_ BitVec 32))

(declare-fun lt!253944 () (_ BitVec 32))

(declare-fun lt!253943 () (_ BitVec 8))

(declare-fun lt!253949 () (_ BitVec 8))

(declare-fun lt!253942 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun Unit!11060 () Unit!11058)

(declare-fun Unit!11061 () Unit!11058)

(assert (=> b!161302 (= lt!253948 (ite (bvsgt lt!253945 #b00000000000000000000000000000000) (let ((bdg!9622 ((_ extract 7 0) (bvnot lt!253944)))) (let ((bdg!9623 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4493 (buf!4030 thiss!1602)) (currentByte!7513 thiss!1602) lt!253949) (currentByte!7513 thiss!1602) lt!253942) (bvadd #b00000000000000000000000000000001 (currentByte!7513 thiss!1602)))) ((_ sign_extend 24) bdg!9622))))) (tuple3!873 Unit!11060 bdg!9622 (BitStream!6313 (array!7960 (store (arr!4493 (array!7960 (store (arr!4493 lt!253947) (bvadd #b00000000000000000000000000000001 (currentByte!7513 thiss!1602)) bdg!9623) (size!3572 lt!253947))) (bvadd #b00000000000000000000000000000001 (currentByte!7513 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9623) (bvshl ((_ sign_extend 24) v!222) lt!253941)))) (size!3572 (array!7960 (store (arr!4493 lt!253947) (bvadd #b00000000000000000000000000000001 (currentByte!7513 thiss!1602)) bdg!9623) (size!3572 lt!253947)))) (bvadd #b00000000000000000000000000000001 (currentByte!7513 thiss!1602)) (currentBit!7508 thiss!1602))))) (tuple3!873 Unit!11061 lt!253943 (BitStream!6313 lt!253947 (bvadd #b00000000000000000000000000000001 (currentByte!7513 thiss!1602)) (currentBit!7508 thiss!1602)))))))

(declare-fun e!111021 () Bool)

(assert (=> b!161302 e!111021))

(declare-fun res!134451 () Bool)

(assert (=> b!161302 (=> res!134451 e!111021)))

(assert (=> b!161302 (= res!134451 (bvsge (currentByte!7513 thiss!1602) (size!3572 (buf!4030 thiss!1602))))))

(assert (=> b!161302 (= lt!253947 (array!7960 (store (store (arr!4493 (buf!4030 thiss!1602)) (currentByte!7513 thiss!1602) lt!253949) (currentByte!7513 thiss!1602) lt!253942) (size!3572 (buf!4030 thiss!1602))))))

(assert (=> b!161302 (= lt!253942 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253949) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253945))))))

(assert (=> b!161302 (= lt!253949 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4493 (buf!4030 thiss!1602)) (currentByte!7513 thiss!1602))) lt!253944)))))

(assert (=> b!161302 (= lt!253944 ((_ sign_extend 24) lt!253943))))

(assert (=> b!161302 (= lt!253943 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253941)))))))

(assert (=> b!161302 (= lt!253941 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253945))))))

(assert (=> b!161302 (= lt!253945 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7508 thiss!1602))))))

(declare-fun b!161303 () Bool)

(assert (=> b!161303 (= e!111022 (and (bvsle #b00000000000000000000000000000000 (currentByte!7513 (_3!553 lt!253948))) (bvslt (currentByte!7513 (_3!553 lt!253948)) (size!3572 (buf!4030 thiss!1602)))))))

(assert (=> b!161303 (arrayRangesEq!524 (buf!4030 thiss!1602) (array!7960 (store (arr!4493 (buf!4030 thiss!1602)) (currentByte!7513 (_3!553 lt!253948)) (select (arr!4493 (buf!4030 (_3!553 lt!253948))) (currentByte!7513 (_3!553 lt!253948)))) (size!3572 (buf!4030 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7513 (_3!553 lt!253948)))))

(declare-fun lt!253940 () Unit!11058)

(assert (=> b!161303 (= lt!253940 (arrayUpdatedAtPrefixLemma!132 (buf!4030 thiss!1602) (currentByte!7513 (_3!553 lt!253948)) (select (arr!4493 (buf!4030 (_3!553 lt!253948))) (currentByte!7513 (_3!553 lt!253948)))))))

(declare-fun b!161305 () Bool)

(declare-fun e!111020 () Bool)

(declare-fun array_inv!3319 (array!7959) Bool)

(assert (=> b!161305 (= e!111020 (array_inv!3319 (buf!4030 thiss!1602)))))

(declare-fun b!161304 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161304 (= e!111021 (byteRangesEq!0 (select (arr!4493 (buf!4030 thiss!1602)) (currentByte!7513 thiss!1602)) lt!253942 #b00000000000000000000000000000000 (currentBit!7508 thiss!1602)))))

(declare-fun res!134453 () Bool)

(assert (=> start!33702 (=> (not res!134453) (not e!111019))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33702 (= res!134453 (validate_offset_byte!0 ((_ sign_extend 32) (size!3572 (buf!4030 thiss!1602))) ((_ sign_extend 32) (currentByte!7513 thiss!1602)) ((_ sign_extend 32) (currentBit!7508 thiss!1602))))))

(assert (=> start!33702 e!111019))

(declare-fun inv!12 (BitStream!6312) Bool)

(assert (=> start!33702 (and (inv!12 thiss!1602) e!111020)))

(assert (=> start!33702 true))

(assert (= (and start!33702 res!134453) b!161302))

(assert (= (and b!161302 (not res!134451)) b!161304))

(assert (= (and b!161302 (not res!134452)) b!161301))

(assert (= (and b!161301 (not res!134454)) b!161303))

(assert (= start!33702 b!161305))

(declare-fun m!255315 () Bool)

(assert (=> b!161305 m!255315))

(declare-fun m!255317 () Bool)

(assert (=> b!161303 m!255317))

(declare-fun m!255319 () Bool)

(assert (=> b!161303 m!255319))

(declare-fun m!255321 () Bool)

(assert (=> b!161303 m!255321))

(assert (=> b!161303 m!255317))

(declare-fun m!255323 () Bool)

(assert (=> b!161303 m!255323))

(declare-fun m!255325 () Bool)

(assert (=> b!161302 m!255325))

(declare-fun m!255327 () Bool)

(assert (=> b!161302 m!255327))

(declare-fun m!255329 () Bool)

(assert (=> b!161302 m!255329))

(declare-fun m!255331 () Bool)

(assert (=> b!161302 m!255331))

(declare-fun m!255333 () Bool)

(assert (=> b!161302 m!255333))

(declare-fun m!255335 () Bool)

(assert (=> b!161302 m!255335))

(declare-fun m!255337 () Bool)

(assert (=> b!161302 m!255337))

(declare-fun m!255339 () Bool)

(assert (=> b!161302 m!255339))

(declare-fun m!255341 () Bool)

(assert (=> b!161302 m!255341))

(declare-fun m!255343 () Bool)

(assert (=> b!161302 m!255343))

(declare-fun m!255345 () Bool)

(assert (=> b!161302 m!255345))

(declare-fun m!255347 () Bool)

(assert (=> b!161302 m!255347))

(assert (=> b!161304 m!255335))

(assert (=> b!161304 m!255335))

(declare-fun m!255349 () Bool)

(assert (=> b!161304 m!255349))

(declare-fun m!255351 () Bool)

(assert (=> start!33702 m!255351))

(declare-fun m!255353 () Bool)

(assert (=> start!33702 m!255353))

(check-sat (not b!161304) (not b!161303) (not start!33702) (not b!161305) (not b!161302))
(check-sat)
(get-model)


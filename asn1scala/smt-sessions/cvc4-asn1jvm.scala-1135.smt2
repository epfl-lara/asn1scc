; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32144 () Bool)

(assert start!32144)

(declare-fun b!159104 () Bool)

(declare-fun e!108540 () Bool)

(assert (=> b!159104 (= e!108540 true)))

(declare-fun lt!251031 () (_ BitVec 8))

(declare-datatypes ((array!7549 0))(
  ( (array!7550 (arr!4341 (Array (_ BitVec 32) (_ BitVec 8))) (size!3420 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6008 0))(
  ( (BitStream!6009 (buf!3878 array!7549) (currentByte!7103 (_ BitVec 32)) (currentBit!7098 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10771 0))(
  ( (Unit!10772) )
))
(declare-datatypes ((tuple3!742 0))(
  ( (tuple3!743 (_1!7719 Unit!10771) (_2!7719 (_ BitVec 8)) (_3!488 BitStream!6008)) )
))
(declare-fun lt!251026 () tuple3!742)

(declare-fun thiss!1602 () BitStream!6008)

(declare-fun lt!251030 () array!7549)

(declare-fun lt!251027 () (_ BitVec 8))

(declare-fun arrayRangesEq!471 (array!7549 array!7549 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159104 (arrayRangesEq!471 lt!251030 (array!7550 (store (store (store (arr!4341 (buf!3878 thiss!1602)) (currentByte!7103 thiss!1602) lt!251031) (currentByte!7103 thiss!1602) lt!251027) (currentByte!7103 (_3!488 lt!251026)) (select (arr!4341 (buf!3878 (_3!488 lt!251026))) (currentByte!7103 (_3!488 lt!251026)))) (size!3420 (buf!3878 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7103 (_3!488 lt!251026)))))

(declare-fun lt!251035 () Unit!10771)

(declare-fun arrayUpdatedAtPrefixLemma!79 (array!7549 (_ BitVec 32) (_ BitVec 8)) Unit!10771)

(assert (=> b!159104 (= lt!251035 (arrayUpdatedAtPrefixLemma!79 lt!251030 (currentByte!7103 (_3!488 lt!251026)) (select (arr!4341 (buf!3878 (_3!488 lt!251026))) (currentByte!7103 (_3!488 lt!251026)))))))

(assert (=> b!159104 (arrayRangesEq!471 (buf!3878 thiss!1602) (array!7550 (store (arr!4341 (buf!3878 thiss!1602)) (currentByte!7103 (_3!488 lt!251026)) (select (arr!4341 (buf!3878 (_3!488 lt!251026))) (currentByte!7103 (_3!488 lt!251026)))) (size!3420 (buf!3878 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7103 (_3!488 lt!251026)))))

(declare-fun lt!251034 () Unit!10771)

(assert (=> b!159104 (= lt!251034 (arrayUpdatedAtPrefixLemma!79 (buf!3878 thiss!1602) (currentByte!7103 (_3!488 lt!251026)) (select (arr!4341 (buf!3878 (_3!488 lt!251026))) (currentByte!7103 (_3!488 lt!251026)))))))

(declare-fun res!132801 () Bool)

(declare-fun e!108536 () Bool)

(assert (=> start!32144 (=> (not res!132801) (not e!108536))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32144 (= res!132801 (validate_offset_byte!0 ((_ sign_extend 32) (size!3420 (buf!3878 thiss!1602))) ((_ sign_extend 32) (currentByte!7103 thiss!1602)) ((_ sign_extend 32) (currentBit!7098 thiss!1602))))))

(assert (=> start!32144 e!108536))

(declare-fun e!108538 () Bool)

(declare-fun inv!12 (BitStream!6008) Bool)

(assert (=> start!32144 (and (inv!12 thiss!1602) e!108538)))

(assert (=> start!32144 true))

(declare-fun b!159105 () Bool)

(declare-fun array_inv!3167 (array!7549) Bool)

(assert (=> b!159105 (= e!108538 (array_inv!3167 (buf!3878 thiss!1602)))))

(declare-fun b!159106 () Bool)

(declare-fun e!108537 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159106 (= e!108537 (byteRangesEq!0 (select (arr!4341 (buf!3878 thiss!1602)) (currentByte!7103 thiss!1602)) lt!251027 #b00000000000000000000000000000000 (currentBit!7098 thiss!1602)))))

(declare-fun b!159107 () Bool)

(declare-fun res!132802 () Bool)

(assert (=> b!159107 (=> res!132802 e!108540)))

(declare-fun lt!251036 () (_ BitVec 32))

(assert (=> b!159107 (= res!132802 (bvsle lt!251036 #b00000000000000000000000000000000))))

(declare-fun b!159108 () Bool)

(assert (=> b!159108 (= e!108536 (not e!108540))))

(declare-fun res!132803 () Bool)

(assert (=> b!159108 (=> res!132803 e!108540)))

(assert (=> b!159108 (= res!132803 (not (arrayRangesEq!471 (buf!3878 thiss!1602) lt!251030 #b00000000000000000000000000000000 (bvsub (currentByte!7103 (_3!488 lt!251026)) #b00000000000000000000000000000001))))))

(declare-fun lt!251037 () (_ BitVec 8))

(assert (=> b!159108 (arrayRangesEq!471 (buf!3878 thiss!1602) (array!7550 (store (arr!4341 (buf!3878 thiss!1602)) (bvsub (currentByte!7103 (_3!488 lt!251026)) #b00000000000000000000000000000001) lt!251037) (size!3420 (buf!3878 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7103 (_3!488 lt!251026)) #b00000000000000000000000000000001))))

(declare-fun lt!251033 () Unit!10771)

(assert (=> b!159108 (= lt!251033 (arrayUpdatedAtPrefixLemma!79 (buf!3878 thiss!1602) (bvsub (currentByte!7103 (_3!488 lt!251026)) #b00000000000000000000000000000001) lt!251037))))

(assert (=> b!159108 (= lt!251037 (select (arr!4341 (buf!3878 (_3!488 lt!251026))) (bvsub (currentByte!7103 (_3!488 lt!251026)) #b00000000000000000000000000000001)))))

(declare-fun lt!251029 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251032 () (_ BitVec 32))

(declare-fun lt!251028 () (_ BitVec 8))

(declare-fun Unit!10773 () Unit!10771)

(declare-fun Unit!10774 () Unit!10771)

(assert (=> b!159108 (= lt!251026 (ite (bvsgt lt!251036 #b00000000000000000000000000000000) (let ((bdg!9293 ((_ extract 7 0) (bvnot lt!251029)))) (let ((bdg!9294 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4341 (buf!3878 thiss!1602)) (currentByte!7103 thiss!1602) lt!251031) (currentByte!7103 thiss!1602) lt!251027) (bvadd #b00000000000000000000000000000001 (currentByte!7103 thiss!1602)))) ((_ sign_extend 24) bdg!9293))))) (tuple3!743 Unit!10773 bdg!9293 (BitStream!6009 (array!7550 (store (arr!4341 (array!7550 (store (arr!4341 lt!251030) (bvadd #b00000000000000000000000000000001 (currentByte!7103 thiss!1602)) bdg!9294) (size!3420 lt!251030))) (bvadd #b00000000000000000000000000000001 (currentByte!7103 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9294) (bvshl ((_ sign_extend 24) v!222) lt!251032)))) (size!3420 (array!7550 (store (arr!4341 lt!251030) (bvadd #b00000000000000000000000000000001 (currentByte!7103 thiss!1602)) bdg!9294) (size!3420 lt!251030)))) (bvadd #b00000000000000000000000000000001 (currentByte!7103 thiss!1602)) (currentBit!7098 thiss!1602))))) (tuple3!743 Unit!10774 lt!251028 (BitStream!6009 lt!251030 (bvadd #b00000000000000000000000000000001 (currentByte!7103 thiss!1602)) (currentBit!7098 thiss!1602)))))))

(assert (=> b!159108 e!108537))

(declare-fun res!132800 () Bool)

(assert (=> b!159108 (=> res!132800 e!108537)))

(assert (=> b!159108 (= res!132800 (bvsge (currentByte!7103 thiss!1602) (size!3420 (buf!3878 thiss!1602))))))

(assert (=> b!159108 (= lt!251030 (array!7550 (store (store (arr!4341 (buf!3878 thiss!1602)) (currentByte!7103 thiss!1602) lt!251031) (currentByte!7103 thiss!1602) lt!251027) (size!3420 (buf!3878 thiss!1602))))))

(assert (=> b!159108 (= lt!251027 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251031) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251036))))))

(assert (=> b!159108 (= lt!251031 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4341 (buf!3878 thiss!1602)) (currentByte!7103 thiss!1602))) lt!251029)))))

(assert (=> b!159108 (= lt!251029 ((_ sign_extend 24) lt!251028))))

(assert (=> b!159108 (= lt!251028 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251032)))))))

(assert (=> b!159108 (= lt!251032 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251036))))))

(assert (=> b!159108 (= lt!251036 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7098 thiss!1602))))))

(assert (= (and start!32144 res!132801) b!159108))

(assert (= (and b!159108 (not res!132800)) b!159106))

(assert (= (and b!159108 (not res!132803)) b!159107))

(assert (= (and b!159107 (not res!132802)) b!159104))

(assert (= start!32144 b!159105))

(declare-fun m!250275 () Bool)

(assert (=> b!159104 m!250275))

(declare-fun m!250277 () Bool)

(assert (=> b!159104 m!250277))

(declare-fun m!250279 () Bool)

(assert (=> b!159104 m!250279))

(declare-fun m!250281 () Bool)

(assert (=> b!159104 m!250281))

(declare-fun m!250283 () Bool)

(assert (=> b!159104 m!250283))

(declare-fun m!250285 () Bool)

(assert (=> b!159104 m!250285))

(assert (=> b!159104 m!250275))

(assert (=> b!159104 m!250275))

(declare-fun m!250287 () Bool)

(assert (=> b!159104 m!250287))

(declare-fun m!250289 () Bool)

(assert (=> b!159104 m!250289))

(declare-fun m!250291 () Bool)

(assert (=> b!159104 m!250291))

(declare-fun m!250293 () Bool)

(assert (=> b!159105 m!250293))

(declare-fun m!250295 () Bool)

(assert (=> b!159106 m!250295))

(assert (=> b!159106 m!250295))

(declare-fun m!250297 () Bool)

(assert (=> b!159106 m!250297))

(declare-fun m!250299 () Bool)

(assert (=> start!32144 m!250299))

(declare-fun m!250301 () Bool)

(assert (=> start!32144 m!250301))

(declare-fun m!250303 () Bool)

(assert (=> b!159108 m!250303))

(declare-fun m!250305 () Bool)

(assert (=> b!159108 m!250305))

(declare-fun m!250307 () Bool)

(assert (=> b!159108 m!250307))

(declare-fun m!250309 () Bool)

(assert (=> b!159108 m!250309))

(assert (=> b!159108 m!250289))

(assert (=> b!159108 m!250295))

(declare-fun m!250311 () Bool)

(assert (=> b!159108 m!250311))

(declare-fun m!250313 () Bool)

(assert (=> b!159108 m!250313))

(assert (=> b!159108 m!250291))

(declare-fun m!250315 () Bool)

(assert (=> b!159108 m!250315))

(declare-fun m!250317 () Bool)

(assert (=> b!159108 m!250317))

(declare-fun m!250319 () Bool)

(assert (=> b!159108 m!250319))

(push 1)

(assert (not b!159106))

(assert (not b!159108))

(assert (not b!159105))

(assert (not b!159104))

(assert (not start!32144))

(check-sat)

(pop 1)


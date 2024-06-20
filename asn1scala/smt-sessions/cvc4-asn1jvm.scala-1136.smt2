; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32150 () Bool)

(assert start!32150)

(declare-fun b!159149 () Bool)

(declare-fun e!108584 () Bool)

(declare-datatypes ((array!7555 0))(
  ( (array!7556 (arr!4344 (Array (_ BitVec 32) (_ BitVec 8))) (size!3423 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6014 0))(
  ( (BitStream!6015 (buf!3881 array!7555) (currentByte!7106 (_ BitVec 32)) (currentBit!7101 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6014)

(declare-fun array_inv!3170 (array!7555) Bool)

(assert (=> b!159149 (= e!108584 (array_inv!3170 (buf!3881 thiss!1602)))))

(declare-fun b!159151 () Bool)

(declare-fun e!108581 () Bool)

(assert (=> b!159151 (= e!108581 true)))

(declare-datatypes ((Unit!10783 0))(
  ( (Unit!10784) )
))
(declare-datatypes ((tuple3!748 0))(
  ( (tuple3!749 (_1!7722 Unit!10783) (_2!7722 (_ BitVec 8)) (_3!491 BitStream!6014)) )
))
(declare-fun lt!251139 () tuple3!748)

(declare-fun lt!251141 () (_ BitVec 8))

(declare-fun lt!251145 () array!7555)

(declare-fun lt!251142 () (_ BitVec 8))

(declare-fun arrayRangesEq!474 (array!7555 array!7555 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159151 (arrayRangesEq!474 lt!251145 (array!7556 (store (store (store (arr!4344 (buf!3881 thiss!1602)) (currentByte!7106 thiss!1602) lt!251142) (currentByte!7106 thiss!1602) lt!251141) (currentByte!7106 (_3!491 lt!251139)) (select (arr!4344 (buf!3881 (_3!491 lt!251139))) (currentByte!7106 (_3!491 lt!251139)))) (size!3423 (buf!3881 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7106 (_3!491 lt!251139)))))

(declare-fun lt!251138 () Unit!10783)

(declare-fun arrayUpdatedAtPrefixLemma!82 (array!7555 (_ BitVec 32) (_ BitVec 8)) Unit!10783)

(assert (=> b!159151 (= lt!251138 (arrayUpdatedAtPrefixLemma!82 lt!251145 (currentByte!7106 (_3!491 lt!251139)) (select (arr!4344 (buf!3881 (_3!491 lt!251139))) (currentByte!7106 (_3!491 lt!251139)))))))

(assert (=> b!159151 (arrayRangesEq!474 (buf!3881 thiss!1602) (array!7556 (store (arr!4344 (buf!3881 thiss!1602)) (currentByte!7106 (_3!491 lt!251139)) (select (arr!4344 (buf!3881 (_3!491 lt!251139))) (currentByte!7106 (_3!491 lt!251139)))) (size!3423 (buf!3881 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7106 (_3!491 lt!251139)))))

(declare-fun lt!251134 () Unit!10783)

(assert (=> b!159151 (= lt!251134 (arrayUpdatedAtPrefixLemma!82 (buf!3881 thiss!1602) (currentByte!7106 (_3!491 lt!251139)) (select (arr!4344 (buf!3881 (_3!491 lt!251139))) (currentByte!7106 (_3!491 lt!251139)))))))

(declare-fun b!159150 () Bool)

(declare-fun e!108583 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159150 (= e!108583 (byteRangesEq!0 (select (arr!4344 (buf!3881 thiss!1602)) (currentByte!7106 thiss!1602)) lt!251141 #b00000000000000000000000000000000 (currentBit!7101 thiss!1602)))))

(declare-fun res!132838 () Bool)

(declare-fun e!108582 () Bool)

(assert (=> start!32150 (=> (not res!132838) (not e!108582))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32150 (= res!132838 (validate_offset_byte!0 ((_ sign_extend 32) (size!3423 (buf!3881 thiss!1602))) ((_ sign_extend 32) (currentByte!7106 thiss!1602)) ((_ sign_extend 32) (currentBit!7101 thiss!1602))))))

(assert (=> start!32150 e!108582))

(declare-fun inv!12 (BitStream!6014) Bool)

(assert (=> start!32150 (and (inv!12 thiss!1602) e!108584)))

(assert (=> start!32150 true))

(declare-fun b!159152 () Bool)

(assert (=> b!159152 (= e!108582 (not e!108581))))

(declare-fun res!132837 () Bool)

(assert (=> b!159152 (=> res!132837 e!108581)))

(assert (=> b!159152 (= res!132837 (not (arrayRangesEq!474 (buf!3881 thiss!1602) lt!251145 #b00000000000000000000000000000000 (bvsub (currentByte!7106 (_3!491 lt!251139)) #b00000000000000000000000000000001))))))

(declare-fun lt!251143 () (_ BitVec 8))

(assert (=> b!159152 (arrayRangesEq!474 (buf!3881 thiss!1602) (array!7556 (store (arr!4344 (buf!3881 thiss!1602)) (bvsub (currentByte!7106 (_3!491 lt!251139)) #b00000000000000000000000000000001) lt!251143) (size!3423 (buf!3881 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7106 (_3!491 lt!251139)) #b00000000000000000000000000000001))))

(declare-fun lt!251140 () Unit!10783)

(assert (=> b!159152 (= lt!251140 (arrayUpdatedAtPrefixLemma!82 (buf!3881 thiss!1602) (bvsub (currentByte!7106 (_3!491 lt!251139)) #b00000000000000000000000000000001) lt!251143))))

(assert (=> b!159152 (= lt!251143 (select (arr!4344 (buf!3881 (_3!491 lt!251139))) (bvsub (currentByte!7106 (_3!491 lt!251139)) #b00000000000000000000000000000001)))))

(declare-fun lt!251135 () (_ BitVec 8))

(declare-fun lt!251144 () (_ BitVec 32))

(declare-fun lt!251137 () (_ BitVec 32))

(declare-fun lt!251136 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun Unit!10785 () Unit!10783)

(declare-fun Unit!10786 () Unit!10783)

(assert (=> b!159152 (= lt!251139 (ite (bvsgt lt!251136 #b00000000000000000000000000000000) (let ((bdg!9307 ((_ extract 7 0) (bvnot lt!251144)))) (let ((bdg!9308 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4344 (buf!3881 thiss!1602)) (currentByte!7106 thiss!1602) lt!251142) (currentByte!7106 thiss!1602) lt!251141) (bvadd #b00000000000000000000000000000001 (currentByte!7106 thiss!1602)))) ((_ sign_extend 24) bdg!9307))))) (tuple3!749 Unit!10785 bdg!9307 (BitStream!6015 (array!7556 (store (arr!4344 (array!7556 (store (arr!4344 lt!251145) (bvadd #b00000000000000000000000000000001 (currentByte!7106 thiss!1602)) bdg!9308) (size!3423 lt!251145))) (bvadd #b00000000000000000000000000000001 (currentByte!7106 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9308) (bvshl ((_ sign_extend 24) v!222) lt!251137)))) (size!3423 (array!7556 (store (arr!4344 lt!251145) (bvadd #b00000000000000000000000000000001 (currentByte!7106 thiss!1602)) bdg!9308) (size!3423 lt!251145)))) (bvadd #b00000000000000000000000000000001 (currentByte!7106 thiss!1602)) (currentBit!7101 thiss!1602))))) (tuple3!749 Unit!10786 lt!251135 (BitStream!6015 lt!251145 (bvadd #b00000000000000000000000000000001 (currentByte!7106 thiss!1602)) (currentBit!7101 thiss!1602)))))))

(assert (=> b!159152 e!108583))

(declare-fun res!132839 () Bool)

(assert (=> b!159152 (=> res!132839 e!108583)))

(assert (=> b!159152 (= res!132839 (bvsge (currentByte!7106 thiss!1602) (size!3423 (buf!3881 thiss!1602))))))

(assert (=> b!159152 (= lt!251145 (array!7556 (store (store (arr!4344 (buf!3881 thiss!1602)) (currentByte!7106 thiss!1602) lt!251142) (currentByte!7106 thiss!1602) lt!251141) (size!3423 (buf!3881 thiss!1602))))))

(assert (=> b!159152 (= lt!251141 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251142) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251136))))))

(assert (=> b!159152 (= lt!251142 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4344 (buf!3881 thiss!1602)) (currentByte!7106 thiss!1602))) lt!251144)))))

(assert (=> b!159152 (= lt!251144 ((_ sign_extend 24) lt!251135))))

(assert (=> b!159152 (= lt!251135 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251137)))))))

(assert (=> b!159152 (= lt!251137 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251136))))))

(assert (=> b!159152 (= lt!251136 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7101 thiss!1602))))))

(declare-fun b!159153 () Bool)

(declare-fun res!132836 () Bool)

(assert (=> b!159153 (=> res!132836 e!108581)))

(assert (=> b!159153 (= res!132836 (bvsle lt!251136 #b00000000000000000000000000000000))))

(assert (= (and start!32150 res!132838) b!159152))

(assert (= (and b!159152 (not res!132839)) b!159150))

(assert (= (and b!159152 (not res!132837)) b!159153))

(assert (= (and b!159153 (not res!132836)) b!159151))

(assert (= start!32150 b!159149))

(declare-fun m!250413 () Bool)

(assert (=> b!159150 m!250413))

(assert (=> b!159150 m!250413))

(declare-fun m!250415 () Bool)

(assert (=> b!159150 m!250415))

(declare-fun m!250417 () Bool)

(assert (=> b!159151 m!250417))

(declare-fun m!250419 () Bool)

(assert (=> b!159151 m!250419))

(declare-fun m!250421 () Bool)

(assert (=> b!159151 m!250421))

(declare-fun m!250423 () Bool)

(assert (=> b!159151 m!250423))

(assert (=> b!159151 m!250417))

(declare-fun m!250425 () Bool)

(assert (=> b!159151 m!250425))

(assert (=> b!159151 m!250417))

(declare-fun m!250427 () Bool)

(assert (=> b!159151 m!250427))

(declare-fun m!250429 () Bool)

(assert (=> b!159151 m!250429))

(declare-fun m!250431 () Bool)

(assert (=> b!159151 m!250431))

(declare-fun m!250433 () Bool)

(assert (=> b!159151 m!250433))

(declare-fun m!250435 () Bool)

(assert (=> b!159149 m!250435))

(declare-fun m!250437 () Bool)

(assert (=> b!159152 m!250437))

(declare-fun m!250439 () Bool)

(assert (=> b!159152 m!250439))

(assert (=> b!159152 m!250423))

(declare-fun m!250441 () Bool)

(assert (=> b!159152 m!250441))

(declare-fun m!250443 () Bool)

(assert (=> b!159152 m!250443))

(declare-fun m!250445 () Bool)

(assert (=> b!159152 m!250445))

(declare-fun m!250447 () Bool)

(assert (=> b!159152 m!250447))

(declare-fun m!250449 () Bool)

(assert (=> b!159152 m!250449))

(assert (=> b!159152 m!250413))

(assert (=> b!159152 m!250431))

(declare-fun m!250451 () Bool)

(assert (=> b!159152 m!250451))

(declare-fun m!250453 () Bool)

(assert (=> b!159152 m!250453))

(declare-fun m!250455 () Bool)

(assert (=> start!32150 m!250455))

(declare-fun m!250457 () Bool)

(assert (=> start!32150 m!250457))

(push 1)

(assert (not b!159150))

(assert (not b!159149))

(assert (not b!159152))

(assert (not b!159151))

(assert (not start!32150))

(check-sat)

(pop 1)


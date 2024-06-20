; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32118 () Bool)

(assert start!32118)

(declare-fun res!132653 () Bool)

(declare-fun e!108348 () Bool)

(assert (=> start!32118 (=> (not res!132653) (not e!108348))))

(declare-datatypes ((array!7523 0))(
  ( (array!7524 (arr!4328 (Array (_ BitVec 32) (_ BitVec 8))) (size!3407 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5982 0))(
  ( (BitStream!5983 (buf!3865 array!7523) (currentByte!7090 (_ BitVec 32)) (currentBit!7085 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5982)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32118 (= res!132653 (validate_offset_byte!0 ((_ sign_extend 32) (size!3407 (buf!3865 thiss!1602))) ((_ sign_extend 32) (currentByte!7090 thiss!1602)) ((_ sign_extend 32) (currentBit!7085 thiss!1602))))))

(assert (=> start!32118 e!108348))

(declare-fun e!108346 () Bool)

(declare-fun inv!12 (BitStream!5982) Bool)

(assert (=> start!32118 (and (inv!12 thiss!1602) e!108346)))

(assert (=> start!32118 true))

(declare-fun b!158917 () Bool)

(assert (=> b!158917 (= e!108348 (not true))))

(declare-datatypes ((Unit!10719 0))(
  ( (Unit!10720) )
))
(declare-datatypes ((tuple3!716 0))(
  ( (tuple3!717 (_1!7706 Unit!10719) (_2!7706 (_ BitVec 8)) (_3!475 BitStream!5982)) )
))
(declare-fun lt!250575 () tuple3!716)

(declare-fun lt!250579 () (_ BitVec 8))

(declare-fun arrayRangesEq!458 (array!7523 array!7523 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158917 (arrayRangesEq!458 (buf!3865 thiss!1602) (array!7524 (store (arr!4328 (buf!3865 thiss!1602)) (bvsub (currentByte!7090 (_3!475 lt!250575)) #b00000000000000000000000000000001) lt!250579) (size!3407 (buf!3865 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7090 (_3!475 lt!250575)) #b00000000000000000000000000000001))))

(declare-fun lt!250578 () Unit!10719)

(declare-fun arrayUpdatedAtPrefixLemma!66 (array!7523 (_ BitVec 32) (_ BitVec 8)) Unit!10719)

(assert (=> b!158917 (= lt!250578 (arrayUpdatedAtPrefixLemma!66 (buf!3865 thiss!1602) (bvsub (currentByte!7090 (_3!475 lt!250575)) #b00000000000000000000000000000001) lt!250579))))

(assert (=> b!158917 (= lt!250579 (select (arr!4328 (buf!3865 (_3!475 lt!250575))) (bvsub (currentByte!7090 (_3!475 lt!250575)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250583 () (_ BitVec 32))

(declare-fun lt!250580 () (_ BitVec 32))

(declare-fun lt!250576 () (_ BitVec 32))

(declare-fun lt!250584 () (_ BitVec 8))

(declare-fun lt!250581 () (_ BitVec 8))

(declare-fun lt!250577 () array!7523)

(declare-fun lt!250582 () (_ BitVec 8))

(declare-fun Unit!10721 () Unit!10719)

(declare-fun Unit!10722 () Unit!10719)

(assert (=> b!158917 (= lt!250575 (ite (bvsgt lt!250583 #b00000000000000000000000000000000) (let ((bdg!9240 ((_ extract 7 0) (bvnot lt!250576)))) (let ((bdg!9241 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4328 (buf!3865 thiss!1602)) (currentByte!7090 thiss!1602) lt!250581) (currentByte!7090 thiss!1602) lt!250584) (bvadd #b00000000000000000000000000000001 (currentByte!7090 thiss!1602)))) ((_ sign_extend 24) bdg!9240))))) (tuple3!717 Unit!10721 bdg!9240 (BitStream!5983 (array!7524 (store (arr!4328 (array!7524 (store (arr!4328 lt!250577) (bvadd #b00000000000000000000000000000001 (currentByte!7090 thiss!1602)) bdg!9241) (size!3407 lt!250577))) (bvadd #b00000000000000000000000000000001 (currentByte!7090 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9241) (bvshl ((_ sign_extend 24) v!222) lt!250580)))) (size!3407 (array!7524 (store (arr!4328 lt!250577) (bvadd #b00000000000000000000000000000001 (currentByte!7090 thiss!1602)) bdg!9241) (size!3407 lt!250577)))) (bvadd #b00000000000000000000000000000001 (currentByte!7090 thiss!1602)) (currentBit!7085 thiss!1602))))) (tuple3!717 Unit!10722 lt!250582 (BitStream!5983 lt!250577 (bvadd #b00000000000000000000000000000001 (currentByte!7090 thiss!1602)) (currentBit!7085 thiss!1602)))))))

(declare-fun e!108347 () Bool)

(assert (=> b!158917 e!108347))

(declare-fun res!132652 () Bool)

(assert (=> b!158917 (=> res!132652 e!108347)))

(assert (=> b!158917 (= res!132652 (bvsge (currentByte!7090 thiss!1602) (size!3407 (buf!3865 thiss!1602))))))

(assert (=> b!158917 (= lt!250577 (array!7524 (store (store (arr!4328 (buf!3865 thiss!1602)) (currentByte!7090 thiss!1602) lt!250581) (currentByte!7090 thiss!1602) lt!250584) (size!3407 (buf!3865 thiss!1602))))))

(assert (=> b!158917 (= lt!250584 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250581) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250583))))))

(assert (=> b!158917 (= lt!250581 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4328 (buf!3865 thiss!1602)) (currentByte!7090 thiss!1602))) lt!250576)))))

(assert (=> b!158917 (= lt!250576 ((_ sign_extend 24) lt!250582))))

(assert (=> b!158917 (= lt!250582 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250580)))))))

(assert (=> b!158917 (= lt!250580 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250583))))))

(assert (=> b!158917 (= lt!250583 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7085 thiss!1602))))))

(declare-fun b!158918 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158918 (= e!108347 (byteRangesEq!0 (select (arr!4328 (buf!3865 thiss!1602)) (currentByte!7090 thiss!1602)) lt!250584 #b00000000000000000000000000000000 (currentBit!7085 thiss!1602)))))

(declare-fun b!158919 () Bool)

(declare-fun array_inv!3154 (array!7523) Bool)

(assert (=> b!158919 (= e!108346 (array_inv!3154 (buf!3865 thiss!1602)))))

(assert (= (and start!32118 res!132653) b!158917))

(assert (= (and b!158917 (not res!132652)) b!158918))

(assert (= start!32118 b!158919))

(declare-fun m!249727 () Bool)

(assert (=> start!32118 m!249727))

(declare-fun m!249729 () Bool)

(assert (=> start!32118 m!249729))

(declare-fun m!249731 () Bool)

(assert (=> b!158917 m!249731))

(declare-fun m!249733 () Bool)

(assert (=> b!158917 m!249733))

(declare-fun m!249735 () Bool)

(assert (=> b!158917 m!249735))

(declare-fun m!249737 () Bool)

(assert (=> b!158917 m!249737))

(declare-fun m!249739 () Bool)

(assert (=> b!158917 m!249739))

(declare-fun m!249741 () Bool)

(assert (=> b!158917 m!249741))

(declare-fun m!249743 () Bool)

(assert (=> b!158917 m!249743))

(declare-fun m!249745 () Bool)

(assert (=> b!158917 m!249745))

(declare-fun m!249747 () Bool)

(assert (=> b!158917 m!249747))

(declare-fun m!249749 () Bool)

(assert (=> b!158917 m!249749))

(declare-fun m!249751 () Bool)

(assert (=> b!158917 m!249751))

(assert (=> b!158918 m!249749))

(assert (=> b!158918 m!249749))

(declare-fun m!249753 () Bool)

(assert (=> b!158918 m!249753))

(declare-fun m!249755 () Bool)

(assert (=> b!158919 m!249755))

(check-sat (not b!158917) (not start!32118) (not b!158918) (not b!158919))

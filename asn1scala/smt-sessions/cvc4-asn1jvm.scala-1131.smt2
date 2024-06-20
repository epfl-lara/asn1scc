; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32120 () Bool)

(assert start!32120)

(declare-fun res!132658 () Bool)

(declare-fun e!108359 () Bool)

(assert (=> start!32120 (=> (not res!132658) (not e!108359))))

(declare-datatypes ((array!7525 0))(
  ( (array!7526 (arr!4329 (Array (_ BitVec 32) (_ BitVec 8))) (size!3408 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5984 0))(
  ( (BitStream!5985 (buf!3866 array!7525) (currentByte!7091 (_ BitVec 32)) (currentBit!7086 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5984)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32120 (= res!132658 (validate_offset_byte!0 ((_ sign_extend 32) (size!3408 (buf!3866 thiss!1602))) ((_ sign_extend 32) (currentByte!7091 thiss!1602)) ((_ sign_extend 32) (currentBit!7086 thiss!1602))))))

(assert (=> start!32120 e!108359))

(declare-fun e!108360 () Bool)

(declare-fun inv!12 (BitStream!5984) Bool)

(assert (=> start!32120 (and (inv!12 thiss!1602) e!108360)))

(assert (=> start!32120 true))

(declare-fun b!158926 () Bool)

(assert (=> b!158926 (= e!108359 (not true))))

(declare-datatypes ((Unit!10723 0))(
  ( (Unit!10724) )
))
(declare-datatypes ((tuple3!718 0))(
  ( (tuple3!719 (_1!7707 Unit!10723) (_2!7707 (_ BitVec 8)) (_3!476 BitStream!5984)) )
))
(declare-fun lt!250607 () tuple3!718)

(declare-fun lt!250605 () (_ BitVec 8))

(declare-fun arrayRangesEq!459 (array!7525 array!7525 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158926 (arrayRangesEq!459 (buf!3866 thiss!1602) (array!7526 (store (arr!4329 (buf!3866 thiss!1602)) (bvsub (currentByte!7091 (_3!476 lt!250607)) #b00000000000000000000000000000001) lt!250605) (size!3408 (buf!3866 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7091 (_3!476 lt!250607)) #b00000000000000000000000000000001))))

(declare-fun lt!250611 () Unit!10723)

(declare-fun arrayUpdatedAtPrefixLemma!67 (array!7525 (_ BitVec 32) (_ BitVec 8)) Unit!10723)

(assert (=> b!158926 (= lt!250611 (arrayUpdatedAtPrefixLemma!67 (buf!3866 thiss!1602) (bvsub (currentByte!7091 (_3!476 lt!250607)) #b00000000000000000000000000000001) lt!250605))))

(assert (=> b!158926 (= lt!250605 (select (arr!4329 (buf!3866 (_3!476 lt!250607))) (bvsub (currentByte!7091 (_3!476 lt!250607)) #b00000000000000000000000000000001)))))

(declare-fun lt!250608 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250612 () (_ BitVec 8))

(declare-fun lt!250609 () (_ BitVec 8))

(declare-fun lt!250614 () array!7525)

(declare-fun lt!250606 () (_ BitVec 32))

(declare-fun lt!250610 () (_ BitVec 32))

(declare-fun lt!250613 () (_ BitVec 32))

(declare-fun Unit!10725 () Unit!10723)

(declare-fun Unit!10726 () Unit!10723)

(assert (=> b!158926 (= lt!250607 (ite (bvsgt lt!250610 #b00000000000000000000000000000000) (let ((bdg!9240 ((_ extract 7 0) (bvnot lt!250606)))) (let ((bdg!9241 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4329 (buf!3866 thiss!1602)) (currentByte!7091 thiss!1602) lt!250612) (currentByte!7091 thiss!1602) lt!250608) (bvadd #b00000000000000000000000000000001 (currentByte!7091 thiss!1602)))) ((_ sign_extend 24) bdg!9240))))) (tuple3!719 Unit!10725 bdg!9240 (BitStream!5985 (array!7526 (store (arr!4329 (array!7526 (store (arr!4329 lt!250614) (bvadd #b00000000000000000000000000000001 (currentByte!7091 thiss!1602)) bdg!9241) (size!3408 lt!250614))) (bvadd #b00000000000000000000000000000001 (currentByte!7091 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9241) (bvshl ((_ sign_extend 24) v!222) lt!250613)))) (size!3408 (array!7526 (store (arr!4329 lt!250614) (bvadd #b00000000000000000000000000000001 (currentByte!7091 thiss!1602)) bdg!9241) (size!3408 lt!250614)))) (bvadd #b00000000000000000000000000000001 (currentByte!7091 thiss!1602)) (currentBit!7086 thiss!1602))))) (tuple3!719 Unit!10726 lt!250609 (BitStream!5985 lt!250614 (bvadd #b00000000000000000000000000000001 (currentByte!7091 thiss!1602)) (currentBit!7086 thiss!1602)))))))

(declare-fun e!108357 () Bool)

(assert (=> b!158926 e!108357))

(declare-fun res!132659 () Bool)

(assert (=> b!158926 (=> res!132659 e!108357)))

(assert (=> b!158926 (= res!132659 (bvsge (currentByte!7091 thiss!1602) (size!3408 (buf!3866 thiss!1602))))))

(assert (=> b!158926 (= lt!250614 (array!7526 (store (store (arr!4329 (buf!3866 thiss!1602)) (currentByte!7091 thiss!1602) lt!250612) (currentByte!7091 thiss!1602) lt!250608) (size!3408 (buf!3866 thiss!1602))))))

(assert (=> b!158926 (= lt!250608 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250612) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250610))))))

(assert (=> b!158926 (= lt!250612 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4329 (buf!3866 thiss!1602)) (currentByte!7091 thiss!1602))) lt!250606)))))

(assert (=> b!158926 (= lt!250606 ((_ sign_extend 24) lt!250609))))

(assert (=> b!158926 (= lt!250609 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250613)))))))

(assert (=> b!158926 (= lt!250613 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250610))))))

(assert (=> b!158926 (= lt!250610 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7086 thiss!1602))))))

(declare-fun b!158927 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158927 (= e!108357 (byteRangesEq!0 (select (arr!4329 (buf!3866 thiss!1602)) (currentByte!7091 thiss!1602)) lt!250608 #b00000000000000000000000000000000 (currentBit!7086 thiss!1602)))))

(declare-fun b!158928 () Bool)

(declare-fun array_inv!3155 (array!7525) Bool)

(assert (=> b!158928 (= e!108360 (array_inv!3155 (buf!3866 thiss!1602)))))

(assert (= (and start!32120 res!132658) b!158926))

(assert (= (and b!158926 (not res!132659)) b!158927))

(assert (= start!32120 b!158928))

(declare-fun m!249757 () Bool)

(assert (=> start!32120 m!249757))

(declare-fun m!249759 () Bool)

(assert (=> start!32120 m!249759))

(declare-fun m!249761 () Bool)

(assert (=> b!158926 m!249761))

(declare-fun m!249763 () Bool)

(assert (=> b!158926 m!249763))

(declare-fun m!249765 () Bool)

(assert (=> b!158926 m!249765))

(declare-fun m!249767 () Bool)

(assert (=> b!158926 m!249767))

(declare-fun m!249769 () Bool)

(assert (=> b!158926 m!249769))

(declare-fun m!249771 () Bool)

(assert (=> b!158926 m!249771))

(declare-fun m!249773 () Bool)

(assert (=> b!158926 m!249773))

(declare-fun m!249775 () Bool)

(assert (=> b!158926 m!249775))

(declare-fun m!249777 () Bool)

(assert (=> b!158926 m!249777))

(declare-fun m!249779 () Bool)

(assert (=> b!158926 m!249779))

(declare-fun m!249781 () Bool)

(assert (=> b!158926 m!249781))

(assert (=> b!158927 m!249771))

(assert (=> b!158927 m!249771))

(declare-fun m!249783 () Bool)

(assert (=> b!158927 m!249783))

(declare-fun m!249785 () Bool)

(assert (=> b!158928 m!249785))

(push 1)

(assert (not b!158928))

(assert (not b!158927))

(assert (not b!158926))

(assert (not start!32120))

(check-sat)

(pop 1)

(push 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32116 () Bool)

(assert start!32116)

(declare-fun res!132646 () Bool)

(declare-fun e!108335 () Bool)

(assert (=> start!32116 (=> (not res!132646) (not e!108335))))

(declare-datatypes ((array!7521 0))(
  ( (array!7522 (arr!4327 (Array (_ BitVec 32) (_ BitVec 8))) (size!3406 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5980 0))(
  ( (BitStream!5981 (buf!3864 array!7521) (currentByte!7089 (_ BitVec 32)) (currentBit!7084 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5980)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32116 (= res!132646 (validate_offset_byte!0 ((_ sign_extend 32) (size!3406 (buf!3864 thiss!1602))) ((_ sign_extend 32) (currentByte!7089 thiss!1602)) ((_ sign_extend 32) (currentBit!7084 thiss!1602))))))

(assert (=> start!32116 e!108335))

(declare-fun e!108336 () Bool)

(declare-fun inv!12 (BitStream!5980) Bool)

(assert (=> start!32116 (and (inv!12 thiss!1602) e!108336)))

(assert (=> start!32116 true))

(declare-fun b!158908 () Bool)

(assert (=> b!158908 (= e!108335 (not true))))

(declare-datatypes ((Unit!10715 0))(
  ( (Unit!10716) )
))
(declare-datatypes ((tuple3!714 0))(
  ( (tuple3!715 (_1!7705 Unit!10715) (_2!7705 (_ BitVec 8)) (_3!474 BitStream!5980)) )
))
(declare-fun lt!250550 () tuple3!714)

(declare-fun lt!250551 () (_ BitVec 8))

(declare-fun arrayRangesEq!457 (array!7521 array!7521 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158908 (arrayRangesEq!457 (buf!3864 thiss!1602) (array!7522 (store (arr!4327 (buf!3864 thiss!1602)) (bvsub (currentByte!7089 (_3!474 lt!250550)) #b00000000000000000000000000000001) lt!250551) (size!3406 (buf!3864 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7089 (_3!474 lt!250550)) #b00000000000000000000000000000001))))

(declare-fun lt!250554 () Unit!10715)

(declare-fun arrayUpdatedAtPrefixLemma!65 (array!7521 (_ BitVec 32) (_ BitVec 8)) Unit!10715)

(assert (=> b!158908 (= lt!250554 (arrayUpdatedAtPrefixLemma!65 (buf!3864 thiss!1602) (bvsub (currentByte!7089 (_3!474 lt!250550)) #b00000000000000000000000000000001) lt!250551))))

(assert (=> b!158908 (= lt!250551 (select (arr!4327 (buf!3864 (_3!474 lt!250550))) (bvsub (currentByte!7089 (_3!474 lt!250550)) #b00000000000000000000000000000001)))))

(declare-fun lt!250549 () (_ BitVec 32))

(declare-fun lt!250545 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250553 () array!7521)

(declare-fun lt!250546 () (_ BitVec 32))

(declare-fun lt!250552 () (_ BitVec 8))

(declare-fun lt!250547 () (_ BitVec 8))

(declare-fun lt!250548 () (_ BitVec 32))

(declare-fun Unit!10717 () Unit!10715)

(declare-fun Unit!10718 () Unit!10715)

(assert (=> b!158908 (= lt!250550 (ite (bvsgt lt!250549 #b00000000000000000000000000000000) (let ((bdg!9240 ((_ extract 7 0) (bvnot lt!250548)))) (let ((bdg!9241 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4327 (buf!3864 thiss!1602)) (currentByte!7089 thiss!1602) lt!250552) (currentByte!7089 thiss!1602) lt!250547) (bvadd #b00000000000000000000000000000001 (currentByte!7089 thiss!1602)))) ((_ sign_extend 24) bdg!9240))))) (tuple3!715 Unit!10717 bdg!9240 (BitStream!5981 (array!7522 (store (arr!4327 (array!7522 (store (arr!4327 lt!250553) (bvadd #b00000000000000000000000000000001 (currentByte!7089 thiss!1602)) bdg!9241) (size!3406 lt!250553))) (bvadd #b00000000000000000000000000000001 (currentByte!7089 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9241) (bvshl ((_ sign_extend 24) v!222) lt!250546)))) (size!3406 (array!7522 (store (arr!4327 lt!250553) (bvadd #b00000000000000000000000000000001 (currentByte!7089 thiss!1602)) bdg!9241) (size!3406 lt!250553)))) (bvadd #b00000000000000000000000000000001 (currentByte!7089 thiss!1602)) (currentBit!7084 thiss!1602))))) (tuple3!715 Unit!10718 lt!250545 (BitStream!5981 lt!250553 (bvadd #b00000000000000000000000000000001 (currentByte!7089 thiss!1602)) (currentBit!7084 thiss!1602)))))))

(declare-fun e!108333 () Bool)

(assert (=> b!158908 e!108333))

(declare-fun res!132647 () Bool)

(assert (=> b!158908 (=> res!132647 e!108333)))

(assert (=> b!158908 (= res!132647 (bvsge (currentByte!7089 thiss!1602) (size!3406 (buf!3864 thiss!1602))))))

(assert (=> b!158908 (= lt!250553 (array!7522 (store (store (arr!4327 (buf!3864 thiss!1602)) (currentByte!7089 thiss!1602) lt!250552) (currentByte!7089 thiss!1602) lt!250547) (size!3406 (buf!3864 thiss!1602))))))

(assert (=> b!158908 (= lt!250547 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250552) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250549))))))

(assert (=> b!158908 (= lt!250552 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4327 (buf!3864 thiss!1602)) (currentByte!7089 thiss!1602))) lt!250548)))))

(assert (=> b!158908 (= lt!250548 ((_ sign_extend 24) lt!250545))))

(assert (=> b!158908 (= lt!250545 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250546)))))))

(assert (=> b!158908 (= lt!250546 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250549))))))

(assert (=> b!158908 (= lt!250549 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7084 thiss!1602))))))

(declare-fun b!158909 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158909 (= e!108333 (byteRangesEq!0 (select (arr!4327 (buf!3864 thiss!1602)) (currentByte!7089 thiss!1602)) lt!250547 #b00000000000000000000000000000000 (currentBit!7084 thiss!1602)))))

(declare-fun b!158910 () Bool)

(declare-fun array_inv!3153 (array!7521) Bool)

(assert (=> b!158910 (= e!108336 (array_inv!3153 (buf!3864 thiss!1602)))))

(assert (= (and start!32116 res!132646) b!158908))

(assert (= (and b!158908 (not res!132647)) b!158909))

(assert (= start!32116 b!158910))

(declare-fun m!249697 () Bool)

(assert (=> start!32116 m!249697))

(declare-fun m!249699 () Bool)

(assert (=> start!32116 m!249699))

(declare-fun m!249701 () Bool)

(assert (=> b!158908 m!249701))

(declare-fun m!249703 () Bool)

(assert (=> b!158908 m!249703))

(declare-fun m!249705 () Bool)

(assert (=> b!158908 m!249705))

(declare-fun m!249707 () Bool)

(assert (=> b!158908 m!249707))

(declare-fun m!249709 () Bool)

(assert (=> b!158908 m!249709))

(declare-fun m!249711 () Bool)

(assert (=> b!158908 m!249711))

(declare-fun m!249713 () Bool)

(assert (=> b!158908 m!249713))

(declare-fun m!249715 () Bool)

(assert (=> b!158908 m!249715))

(declare-fun m!249717 () Bool)

(assert (=> b!158908 m!249717))

(declare-fun m!249719 () Bool)

(assert (=> b!158908 m!249719))

(declare-fun m!249721 () Bool)

(assert (=> b!158908 m!249721))

(assert (=> b!158909 m!249713))

(assert (=> b!158909 m!249713))

(declare-fun m!249723 () Bool)

(assert (=> b!158909 m!249723))

(declare-fun m!249725 () Bool)

(assert (=> b!158910 m!249725))

(push 1)

(assert (not start!32116))

(assert (not b!158910))

(assert (not b!158909))

(assert (not b!158908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


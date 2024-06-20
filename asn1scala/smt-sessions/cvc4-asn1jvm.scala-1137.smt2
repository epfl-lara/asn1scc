; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32156 () Bool)

(assert start!32156)

(declare-fun b!159194 () Bool)

(declare-fun e!108629 () Bool)

(declare-datatypes ((array!7561 0))(
  ( (array!7562 (arr!4347 (Array (_ BitVec 32) (_ BitVec 8))) (size!3426 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6020 0))(
  ( (BitStream!6021 (buf!3884 array!7561) (currentByte!7109 (_ BitVec 32)) (currentBit!7104 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6020)

(declare-fun lt!251250 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159194 (= e!108629 (byteRangesEq!0 (select (arr!4347 (buf!3884 thiss!1602)) (currentByte!7109 thiss!1602)) lt!251250 #b00000000000000000000000000000000 (currentBit!7104 thiss!1602)))))

(declare-fun b!159195 () Bool)

(declare-fun res!132875 () Bool)

(declare-fun e!108626 () Bool)

(assert (=> b!159195 (=> res!132875 e!108626)))

(declare-fun lt!251253 () (_ BitVec 32))

(assert (=> b!159195 (= res!132875 (bvsle lt!251253 #b00000000000000000000000000000000))))

(declare-fun b!159196 () Bool)

(declare-fun e!108630 () Bool)

(assert (=> b!159196 (= e!108630 (not e!108626))))

(declare-fun res!132874 () Bool)

(assert (=> b!159196 (=> res!132874 e!108626)))

(declare-datatypes ((Unit!10795 0))(
  ( (Unit!10796) )
))
(declare-datatypes ((tuple3!754 0))(
  ( (tuple3!755 (_1!7725 Unit!10795) (_2!7725 (_ BitVec 8)) (_3!494 BitStream!6020)) )
))
(declare-fun lt!251251 () tuple3!754)

(declare-fun lt!251247 () array!7561)

(declare-fun arrayRangesEq!477 (array!7561 array!7561 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159196 (= res!132874 (not (arrayRangesEq!477 (buf!3884 thiss!1602) lt!251247 #b00000000000000000000000000000000 (bvsub (currentByte!7109 (_3!494 lt!251251)) #b00000000000000000000000000000001))))))

(declare-fun lt!251246 () (_ BitVec 8))

(assert (=> b!159196 (arrayRangesEq!477 (buf!3884 thiss!1602) (array!7562 (store (arr!4347 (buf!3884 thiss!1602)) (bvsub (currentByte!7109 (_3!494 lt!251251)) #b00000000000000000000000000000001) lt!251246) (size!3426 (buf!3884 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7109 (_3!494 lt!251251)) #b00000000000000000000000000000001))))

(declare-fun lt!251242 () Unit!10795)

(declare-fun arrayUpdatedAtPrefixLemma!85 (array!7561 (_ BitVec 32) (_ BitVec 8)) Unit!10795)

(assert (=> b!159196 (= lt!251242 (arrayUpdatedAtPrefixLemma!85 (buf!3884 thiss!1602) (bvsub (currentByte!7109 (_3!494 lt!251251)) #b00000000000000000000000000000001) lt!251246))))

(assert (=> b!159196 (= lt!251246 (select (arr!4347 (buf!3884 (_3!494 lt!251251))) (bvsub (currentByte!7109 (_3!494 lt!251251)) #b00000000000000000000000000000001)))))

(declare-fun lt!251243 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251245 () (_ BitVec 8))

(declare-fun lt!251252 () (_ BitVec 32))

(declare-fun lt!251248 () (_ BitVec 32))

(declare-fun Unit!10797 () Unit!10795)

(declare-fun Unit!10798 () Unit!10795)

(assert (=> b!159196 (= lt!251251 (ite (bvsgt lt!251253 #b00000000000000000000000000000000) (let ((bdg!9321 ((_ extract 7 0) (bvnot lt!251252)))) (let ((bdg!9322 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4347 (buf!3884 thiss!1602)) (currentByte!7109 thiss!1602) lt!251245) (currentByte!7109 thiss!1602) lt!251250) (bvadd #b00000000000000000000000000000001 (currentByte!7109 thiss!1602)))) ((_ sign_extend 24) bdg!9321))))) (tuple3!755 Unit!10797 bdg!9321 (BitStream!6021 (array!7562 (store (arr!4347 (array!7562 (store (arr!4347 lt!251247) (bvadd #b00000000000000000000000000000001 (currentByte!7109 thiss!1602)) bdg!9322) (size!3426 lt!251247))) (bvadd #b00000000000000000000000000000001 (currentByte!7109 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9322) (bvshl ((_ sign_extend 24) v!222) lt!251248)))) (size!3426 (array!7562 (store (arr!4347 lt!251247) (bvadd #b00000000000000000000000000000001 (currentByte!7109 thiss!1602)) bdg!9322) (size!3426 lt!251247)))) (bvadd #b00000000000000000000000000000001 (currentByte!7109 thiss!1602)) (currentBit!7104 thiss!1602))))) (tuple3!755 Unit!10798 lt!251243 (BitStream!6021 lt!251247 (bvadd #b00000000000000000000000000000001 (currentByte!7109 thiss!1602)) (currentBit!7104 thiss!1602)))))))

(assert (=> b!159196 e!108629))

(declare-fun res!132872 () Bool)

(assert (=> b!159196 (=> res!132872 e!108629)))

(assert (=> b!159196 (= res!132872 (bvsge (currentByte!7109 thiss!1602) (size!3426 (buf!3884 thiss!1602))))))

(assert (=> b!159196 (= lt!251247 (array!7562 (store (store (arr!4347 (buf!3884 thiss!1602)) (currentByte!7109 thiss!1602) lt!251245) (currentByte!7109 thiss!1602) lt!251250) (size!3426 (buf!3884 thiss!1602))))))

(assert (=> b!159196 (= lt!251250 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251245) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251253))))))

(assert (=> b!159196 (= lt!251245 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4347 (buf!3884 thiss!1602)) (currentByte!7109 thiss!1602))) lt!251252)))))

(assert (=> b!159196 (= lt!251252 ((_ sign_extend 24) lt!251243))))

(assert (=> b!159196 (= lt!251243 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251248)))))))

(assert (=> b!159196 (= lt!251248 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251253))))))

(assert (=> b!159196 (= lt!251253 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7104 thiss!1602))))))

(declare-fun res!132873 () Bool)

(assert (=> start!32156 (=> (not res!132873) (not e!108630))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32156 (= res!132873 (validate_offset_byte!0 ((_ sign_extend 32) (size!3426 (buf!3884 thiss!1602))) ((_ sign_extend 32) (currentByte!7109 thiss!1602)) ((_ sign_extend 32) (currentBit!7104 thiss!1602))))))

(assert (=> start!32156 e!108630))

(declare-fun e!108627 () Bool)

(declare-fun inv!12 (BitStream!6020) Bool)

(assert (=> start!32156 (and (inv!12 thiss!1602) e!108627)))

(assert (=> start!32156 true))

(declare-fun b!159197 () Bool)

(assert (=> b!159197 (= e!108626 true)))

(assert (=> b!159197 (arrayRangesEq!477 lt!251247 (array!7562 (store (store (store (arr!4347 (buf!3884 thiss!1602)) (currentByte!7109 thiss!1602) lt!251245) (currentByte!7109 thiss!1602) lt!251250) (currentByte!7109 (_3!494 lt!251251)) (select (arr!4347 (buf!3884 (_3!494 lt!251251))) (currentByte!7109 (_3!494 lt!251251)))) (size!3426 (buf!3884 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7109 (_3!494 lt!251251)))))

(declare-fun lt!251244 () Unit!10795)

(assert (=> b!159197 (= lt!251244 (arrayUpdatedAtPrefixLemma!85 lt!251247 (currentByte!7109 (_3!494 lt!251251)) (select (arr!4347 (buf!3884 (_3!494 lt!251251))) (currentByte!7109 (_3!494 lt!251251)))))))

(assert (=> b!159197 (arrayRangesEq!477 (buf!3884 thiss!1602) (array!7562 (store (arr!4347 (buf!3884 thiss!1602)) (currentByte!7109 (_3!494 lt!251251)) (select (arr!4347 (buf!3884 (_3!494 lt!251251))) (currentByte!7109 (_3!494 lt!251251)))) (size!3426 (buf!3884 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7109 (_3!494 lt!251251)))))

(declare-fun lt!251249 () Unit!10795)

(assert (=> b!159197 (= lt!251249 (arrayUpdatedAtPrefixLemma!85 (buf!3884 thiss!1602) (currentByte!7109 (_3!494 lt!251251)) (select (arr!4347 (buf!3884 (_3!494 lt!251251))) (currentByte!7109 (_3!494 lt!251251)))))))

(declare-fun b!159198 () Bool)

(declare-fun array_inv!3173 (array!7561) Bool)

(assert (=> b!159198 (= e!108627 (array_inv!3173 (buf!3884 thiss!1602)))))

(assert (= (and start!32156 res!132873) b!159196))

(assert (= (and b!159196 (not res!132872)) b!159194))

(assert (= (and b!159196 (not res!132874)) b!159195))

(assert (= (and b!159195 (not res!132875)) b!159197))

(assert (= start!32156 b!159198))

(declare-fun m!250551 () Bool)

(assert (=> b!159198 m!250551))

(declare-fun m!250553 () Bool)

(assert (=> b!159196 m!250553))

(declare-fun m!250555 () Bool)

(assert (=> b!159196 m!250555))

(declare-fun m!250557 () Bool)

(assert (=> b!159196 m!250557))

(declare-fun m!250559 () Bool)

(assert (=> b!159196 m!250559))

(declare-fun m!250561 () Bool)

(assert (=> b!159196 m!250561))

(declare-fun m!250563 () Bool)

(assert (=> b!159196 m!250563))

(declare-fun m!250565 () Bool)

(assert (=> b!159196 m!250565))

(declare-fun m!250567 () Bool)

(assert (=> b!159196 m!250567))

(declare-fun m!250569 () Bool)

(assert (=> b!159196 m!250569))

(declare-fun m!250571 () Bool)

(assert (=> b!159196 m!250571))

(declare-fun m!250573 () Bool)

(assert (=> b!159196 m!250573))

(declare-fun m!250575 () Bool)

(assert (=> b!159196 m!250575))

(declare-fun m!250577 () Bool)

(assert (=> b!159197 m!250577))

(declare-fun m!250579 () Bool)

(assert (=> b!159197 m!250579))

(assert (=> b!159197 m!250559))

(declare-fun m!250581 () Bool)

(assert (=> b!159197 m!250581))

(declare-fun m!250583 () Bool)

(assert (=> b!159197 m!250583))

(declare-fun m!250585 () Bool)

(assert (=> b!159197 m!250585))

(assert (=> b!159197 m!250567))

(assert (=> b!159197 m!250583))

(declare-fun m!250587 () Bool)

(assert (=> b!159197 m!250587))

(assert (=> b!159197 m!250583))

(declare-fun m!250589 () Bool)

(assert (=> b!159197 m!250589))

(declare-fun m!250591 () Bool)

(assert (=> start!32156 m!250591))

(declare-fun m!250593 () Bool)

(assert (=> start!32156 m!250593))

(assert (=> b!159194 m!250569))

(assert (=> b!159194 m!250569))

(declare-fun m!250595 () Bool)

(assert (=> b!159194 m!250595))

(push 1)

(assert (not b!159197))

(assert (not start!32156))

(assert (not b!159198))

(assert (not b!159194))

(assert (not b!159196))

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33870 () Bool)

(assert start!33870)

(declare-fun b!161767 () Bool)

(declare-fun e!111487 () Bool)

(declare-datatypes ((array!8008 0))(
  ( (array!8009 (arr!4512 (Array (_ BitVec 32) (_ BitVec 8))) (size!3591 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6350 0))(
  ( (BitStream!6351 (buf!4049 array!8008) (currentByte!7543 (_ BitVec 32)) (currentBit!7538 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6350)

(declare-fun array_inv!3338 (array!8008) Bool)

(assert (=> b!161767 (= e!111487 (array_inv!3338 (buf!4049 thiss!1602)))))

(declare-fun b!161768 () Bool)

(declare-fun e!111488 () Bool)

(declare-fun lt!254679 () array!8008)

(declare-datatypes ((Unit!11134 0))(
  ( (Unit!11135) )
))
(declare-datatypes ((tuple3!910 0))(
  ( (tuple3!911 (_1!7806 Unit!11134) (_2!7806 (_ BitVec 8)) (_3!572 BitStream!6350)) )
))
(declare-fun lt!254670 () tuple3!910)

(declare-fun arrayRangesEq!543 (array!8008 array!8008 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161768 (= e!111488 (arrayRangesEq!543 lt!254679 (buf!4049 (_3!572 lt!254670)) #b00000000000000000000000000000000 (currentByte!7543 (_3!572 lt!254670))))))

(declare-fun res!134862 () Bool)

(declare-fun e!111485 () Bool)

(assert (=> start!33870 (=> (not res!134862) (not e!111485))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33870 (= res!134862 (validate_offset_byte!0 ((_ sign_extend 32) (size!3591 (buf!4049 thiss!1602))) ((_ sign_extend 32) (currentByte!7543 thiss!1602)) ((_ sign_extend 32) (currentBit!7538 thiss!1602))))))

(assert (=> start!33870 e!111485))

(declare-fun inv!12 (BitStream!6350) Bool)

(assert (=> start!33870 (and (inv!12 thiss!1602) e!111487)))

(assert (=> start!33870 true))

(declare-fun b!161769 () Bool)

(declare-fun e!111484 () Bool)

(declare-fun lt!254673 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161769 (= e!111484 (byteRangesEq!0 (select (arr!4512 (buf!4049 thiss!1602)) (currentByte!7543 thiss!1602)) lt!254673 #b00000000000000000000000000000000 (currentBit!7538 thiss!1602)))))

(declare-fun b!161770 () Bool)

(declare-fun e!111486 () Bool)

(assert (=> b!161770 (= e!111485 (not e!111486))))

(declare-fun res!134860 () Bool)

(assert (=> b!161770 (=> res!134860 e!111486)))

(assert (=> b!161770 (= res!134860 (not (arrayRangesEq!543 (buf!4049 thiss!1602) lt!254679 #b00000000000000000000000000000000 (bvsub (currentByte!7543 (_3!572 lt!254670)) #b00000000000000000000000000000001))))))

(declare-fun lt!254668 () (_ BitVec 8))

(assert (=> b!161770 (arrayRangesEq!543 (buf!4049 thiss!1602) (array!8009 (store (arr!4512 (buf!4049 thiss!1602)) (bvsub (currentByte!7543 (_3!572 lt!254670)) #b00000000000000000000000000000001) lt!254668) (size!3591 (buf!4049 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7543 (_3!572 lt!254670)) #b00000000000000000000000000000001))))

(declare-fun lt!254669 () Unit!11134)

(declare-fun arrayUpdatedAtPrefixLemma!151 (array!8008 (_ BitVec 32) (_ BitVec 8)) Unit!11134)

(assert (=> b!161770 (= lt!254669 (arrayUpdatedAtPrefixLemma!151 (buf!4049 thiss!1602) (bvsub (currentByte!7543 (_3!572 lt!254670)) #b00000000000000000000000000000001) lt!254668))))

(assert (=> b!161770 (= lt!254668 (select (arr!4512 (buf!4049 (_3!572 lt!254670))) (bvsub (currentByte!7543 (_3!572 lt!254670)) #b00000000000000000000000000000001)))))

(declare-fun lt!254672 () (_ BitVec 8))

(declare-fun lt!254675 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254678 () (_ BitVec 32))

(declare-fun lt!254676 () (_ BitVec 32))

(declare-fun lt!254671 () (_ BitVec 8))

(declare-fun Unit!11136 () Unit!11134)

(declare-fun Unit!11137 () Unit!11134)

(assert (=> b!161770 (= lt!254670 (ite (bvsgt lt!254676 #b00000000000000000000000000000000) (let ((bdg!9705 ((_ extract 7 0) (bvnot lt!254678)))) (let ((bdg!9706 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4512 (buf!4049 thiss!1602)) (currentByte!7543 thiss!1602) lt!254672) (currentByte!7543 thiss!1602) lt!254673) (bvadd #b00000000000000000000000000000001 (currentByte!7543 thiss!1602)))) ((_ sign_extend 24) bdg!9705))))) (tuple3!911 Unit!11136 bdg!9705 (BitStream!6351 (array!8009 (store (arr!4512 (array!8009 (store (arr!4512 lt!254679) (bvadd #b00000000000000000000000000000001 (currentByte!7543 thiss!1602)) bdg!9706) (size!3591 lt!254679))) (bvadd #b00000000000000000000000000000001 (currentByte!7543 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9706) (bvshl ((_ sign_extend 24) v!222) lt!254675)))) (size!3591 (array!8009 (store (arr!4512 lt!254679) (bvadd #b00000000000000000000000000000001 (currentByte!7543 thiss!1602)) bdg!9706) (size!3591 lt!254679)))) (bvadd #b00000000000000000000000000000001 (currentByte!7543 thiss!1602)) (currentBit!7538 thiss!1602))))) (tuple3!911 Unit!11137 lt!254671 (BitStream!6351 lt!254679 (bvadd #b00000000000000000000000000000001 (currentByte!7543 thiss!1602)) (currentBit!7538 thiss!1602)))))))

(assert (=> b!161770 e!111484))

(declare-fun res!134861 () Bool)

(assert (=> b!161770 (=> res!134861 e!111484)))

(assert (=> b!161770 (= res!134861 (bvsge (currentByte!7543 thiss!1602) (size!3591 (buf!4049 thiss!1602))))))

(assert (=> b!161770 (= lt!254679 (array!8009 (store (store (arr!4512 (buf!4049 thiss!1602)) (currentByte!7543 thiss!1602) lt!254672) (currentByte!7543 thiss!1602) lt!254673) (size!3591 (buf!4049 thiss!1602))))))

(assert (=> b!161770 (= lt!254673 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254672) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254676))))))

(assert (=> b!161770 (= lt!254672 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4512 (buf!4049 thiss!1602)) (currentByte!7543 thiss!1602))) lt!254678)))))

(assert (=> b!161770 (= lt!254678 ((_ sign_extend 24) lt!254671))))

(assert (=> b!161770 (= lt!254671 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254675)))))))

(assert (=> b!161770 (= lt!254675 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254676))))))

(assert (=> b!161770 (= lt!254676 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7538 thiss!1602))))))

(declare-fun b!161771 () Bool)

(declare-fun res!134864 () Bool)

(assert (=> b!161771 (=> res!134864 e!111486)))

(assert (=> b!161771 (= res!134864 (bvsle lt!254676 #b00000000000000000000000000000000))))

(declare-fun b!161772 () Bool)

(assert (=> b!161772 (= e!111486 e!111488)))

(declare-fun res!134863 () Bool)

(assert (=> b!161772 (=> res!134863 e!111488)))

(assert (=> b!161772 (= res!134863 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7543 (_3!572 lt!254670)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7543 (_3!572 lt!254670)) #b00000000000000000000000000000001) (currentByte!7543 (_3!572 lt!254670))) (bvsgt (size!3591 (buf!4049 thiss!1602)) (size!3591 (buf!4049 (_3!572 lt!254670)))) (bvsgt (bvsub (currentByte!7543 (_3!572 lt!254670)) #b00000000000000000000000000000001) (size!3591 (buf!4049 thiss!1602))) (bvsgt (currentByte!7543 (_3!572 lt!254670)) (size!3591 (buf!4049 thiss!1602)))))))

(assert (=> b!161772 (arrayRangesEq!543 lt!254679 (array!8009 (store (store (store (arr!4512 (buf!4049 thiss!1602)) (currentByte!7543 thiss!1602) lt!254672) (currentByte!7543 thiss!1602) lt!254673) (currentByte!7543 (_3!572 lt!254670)) (select (arr!4512 (buf!4049 (_3!572 lt!254670))) (currentByte!7543 (_3!572 lt!254670)))) (size!3591 (buf!4049 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7543 (_3!572 lt!254670)))))

(declare-fun lt!254677 () Unit!11134)

(assert (=> b!161772 (= lt!254677 (arrayUpdatedAtPrefixLemma!151 lt!254679 (currentByte!7543 (_3!572 lt!254670)) (select (arr!4512 (buf!4049 (_3!572 lt!254670))) (currentByte!7543 (_3!572 lt!254670)))))))

(assert (=> b!161772 (arrayRangesEq!543 (buf!4049 thiss!1602) (array!8009 (store (arr!4512 (buf!4049 thiss!1602)) (currentByte!7543 (_3!572 lt!254670)) (select (arr!4512 (buf!4049 (_3!572 lt!254670))) (currentByte!7543 (_3!572 lt!254670)))) (size!3591 (buf!4049 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7543 (_3!572 lt!254670)))))

(declare-fun lt!254674 () Unit!11134)

(assert (=> b!161772 (= lt!254674 (arrayUpdatedAtPrefixLemma!151 (buf!4049 thiss!1602) (currentByte!7543 (_3!572 lt!254670)) (select (arr!4512 (buf!4049 (_3!572 lt!254670))) (currentByte!7543 (_3!572 lt!254670)))))))

(assert (= (and start!33870 res!134862) b!161770))

(assert (= (and b!161770 (not res!134861)) b!161769))

(assert (= (and b!161770 (not res!134860)) b!161771))

(assert (= (and b!161771 (not res!134864)) b!161772))

(assert (= (and b!161772 (not res!134863)) b!161768))

(assert (= start!33870 b!161767))

(declare-fun m!256539 () Bool)

(assert (=> b!161769 m!256539))

(assert (=> b!161769 m!256539))

(declare-fun m!256541 () Bool)

(assert (=> b!161769 m!256541))

(declare-fun m!256543 () Bool)

(assert (=> b!161770 m!256543))

(declare-fun m!256545 () Bool)

(assert (=> b!161770 m!256545))

(declare-fun m!256547 () Bool)

(assert (=> b!161770 m!256547))

(assert (=> b!161770 m!256539))

(declare-fun m!256549 () Bool)

(assert (=> b!161770 m!256549))

(declare-fun m!256551 () Bool)

(assert (=> b!161770 m!256551))

(declare-fun m!256553 () Bool)

(assert (=> b!161770 m!256553))

(declare-fun m!256555 () Bool)

(assert (=> b!161770 m!256555))

(declare-fun m!256557 () Bool)

(assert (=> b!161770 m!256557))

(declare-fun m!256559 () Bool)

(assert (=> b!161770 m!256559))

(declare-fun m!256561 () Bool)

(assert (=> b!161770 m!256561))

(declare-fun m!256563 () Bool)

(assert (=> b!161770 m!256563))

(declare-fun m!256565 () Bool)

(assert (=> start!33870 m!256565))

(declare-fun m!256567 () Bool)

(assert (=> start!33870 m!256567))

(assert (=> b!161772 m!256543))

(declare-fun m!256569 () Bool)

(assert (=> b!161772 m!256569))

(declare-fun m!256571 () Bool)

(assert (=> b!161772 m!256571))

(declare-fun m!256573 () Bool)

(assert (=> b!161772 m!256573))

(assert (=> b!161772 m!256573))

(declare-fun m!256575 () Bool)

(assert (=> b!161772 m!256575))

(declare-fun m!256577 () Bool)

(assert (=> b!161772 m!256577))

(declare-fun m!256579 () Bool)

(assert (=> b!161772 m!256579))

(assert (=> b!161772 m!256561))

(assert (=> b!161772 m!256573))

(declare-fun m!256581 () Bool)

(assert (=> b!161772 m!256581))

(declare-fun m!256583 () Bool)

(assert (=> b!161768 m!256583))

(declare-fun m!256585 () Bool)

(assert (=> b!161767 m!256585))

(push 1)

(assert (not b!161770))

(assert (not start!33870))

(assert (not b!161772))

(assert (not b!161769))


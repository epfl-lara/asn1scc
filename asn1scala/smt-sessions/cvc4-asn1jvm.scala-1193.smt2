; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33876 () Bool)

(assert start!33876)

(declare-fun b!161813 () Bool)

(declare-fun e!111533 () Bool)

(declare-datatypes ((array!8014 0))(
  ( (array!8015 (arr!4515 (Array (_ BitVec 32) (_ BitVec 8))) (size!3594 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6356 0))(
  ( (BitStream!6357 (buf!4052 array!8014) (currentByte!7546 (_ BitVec 32)) (currentBit!7541 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6356)

(declare-fun array_inv!3341 (array!8014) Bool)

(assert (=> b!161813 (= e!111533 (array_inv!3341 (buf!4052 thiss!1602)))))

(declare-fun b!161814 () Bool)

(declare-fun res!134898 () Bool)

(declare-fun e!111532 () Bool)

(assert (=> b!161814 (=> res!134898 e!111532)))

(declare-fun lt!254788 () (_ BitVec 32))

(assert (=> b!161814 (= res!134898 (bvsle lt!254788 #b00000000000000000000000000000000))))

(declare-fun res!134899 () Bool)

(declare-fun e!111530 () Bool)

(assert (=> start!33876 (=> (not res!134899) (not e!111530))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33876 (= res!134899 (validate_offset_byte!0 ((_ sign_extend 32) (size!3594 (buf!4052 thiss!1602))) ((_ sign_extend 32) (currentByte!7546 thiss!1602)) ((_ sign_extend 32) (currentBit!7541 thiss!1602))))))

(assert (=> start!33876 e!111530))

(declare-fun inv!12 (BitStream!6356) Bool)

(assert (=> start!33876 (and (inv!12 thiss!1602) e!111533)))

(assert (=> start!33876 true))

(declare-fun b!161815 () Bool)

(declare-fun e!111534 () Bool)

(declare-fun lt!254796 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161815 (= e!111534 (byteRangesEq!0 (select (arr!4515 (buf!4052 thiss!1602)) (currentByte!7546 thiss!1602)) lt!254796 #b00000000000000000000000000000000 (currentBit!7541 thiss!1602)))))

(declare-fun b!161816 () Bool)

(declare-datatypes ((Unit!11146 0))(
  ( (Unit!11147) )
))
(declare-datatypes ((tuple3!916 0))(
  ( (tuple3!917 (_1!7809 Unit!11146) (_2!7809 (_ BitVec 8)) (_3!575 BitStream!6356)) )
))
(declare-fun lt!254790 () tuple3!916)

(declare-fun arrayRangesEq!546 (array!8014 array!8014 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161816 (= e!111532 (arrayRangesEq!546 (buf!4052 thiss!1602) (buf!4052 (_3!575 lt!254790)) #b00000000000000000000000000000000 (currentByte!7546 thiss!1602)))))

(assert (=> b!161816 (arrayRangesEq!546 (buf!4052 thiss!1602) (buf!4052 (_3!575 lt!254790)) #b00000000000000000000000000000000 (bvsub (currentByte!7546 (_3!575 lt!254790)) #b00000000000000000000000000000001))))

(declare-fun lt!254794 () array!8014)

(declare-fun lt!254784 () Unit!11146)

(declare-fun arrayRangesEqTransitive!144 (array!8014 array!8014 array!8014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11146)

(assert (=> b!161816 (= lt!254784 (arrayRangesEqTransitive!144 (buf!4052 thiss!1602) lt!254794 (buf!4052 (_3!575 lt!254790)) #b00000000000000000000000000000000 (bvsub (currentByte!7546 (_3!575 lt!254790)) #b00000000000000000000000000000001) (currentByte!7546 (_3!575 lt!254790))))))

(declare-fun lt!254786 () (_ BitVec 8))

(assert (=> b!161816 (arrayRangesEq!546 lt!254794 (array!8015 (store (store (store (arr!4515 (buf!4052 thiss!1602)) (currentByte!7546 thiss!1602) lt!254786) (currentByte!7546 thiss!1602) lt!254796) (currentByte!7546 (_3!575 lt!254790)) (select (arr!4515 (buf!4052 (_3!575 lt!254790))) (currentByte!7546 (_3!575 lt!254790)))) (size!3594 (buf!4052 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7546 (_3!575 lt!254790)))))

(declare-fun lt!254785 () Unit!11146)

(declare-fun arrayUpdatedAtPrefixLemma!154 (array!8014 (_ BitVec 32) (_ BitVec 8)) Unit!11146)

(assert (=> b!161816 (= lt!254785 (arrayUpdatedAtPrefixLemma!154 lt!254794 (currentByte!7546 (_3!575 lt!254790)) (select (arr!4515 (buf!4052 (_3!575 lt!254790))) (currentByte!7546 (_3!575 lt!254790)))))))

(assert (=> b!161816 (arrayRangesEq!546 (buf!4052 thiss!1602) (array!8015 (store (arr!4515 (buf!4052 thiss!1602)) (currentByte!7546 (_3!575 lt!254790)) (select (arr!4515 (buf!4052 (_3!575 lt!254790))) (currentByte!7546 (_3!575 lt!254790)))) (size!3594 (buf!4052 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7546 (_3!575 lt!254790)))))

(declare-fun lt!254791 () Unit!11146)

(assert (=> b!161816 (= lt!254791 (arrayUpdatedAtPrefixLemma!154 (buf!4052 thiss!1602) (currentByte!7546 (_3!575 lt!254790)) (select (arr!4515 (buf!4052 (_3!575 lt!254790))) (currentByte!7546 (_3!575 lt!254790)))))))

(declare-fun b!161817 () Bool)

(assert (=> b!161817 (= e!111530 (not e!111532))))

(declare-fun res!134897 () Bool)

(assert (=> b!161817 (=> res!134897 e!111532)))

(assert (=> b!161817 (= res!134897 (not (arrayRangesEq!546 (buf!4052 thiss!1602) lt!254794 #b00000000000000000000000000000000 (bvsub (currentByte!7546 (_3!575 lt!254790)) #b00000000000000000000000000000001))))))

(declare-fun lt!254787 () (_ BitVec 8))

(assert (=> b!161817 (arrayRangesEq!546 (buf!4052 thiss!1602) (array!8015 (store (arr!4515 (buf!4052 thiss!1602)) (bvsub (currentByte!7546 (_3!575 lt!254790)) #b00000000000000000000000000000001) lt!254787) (size!3594 (buf!4052 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7546 (_3!575 lt!254790)) #b00000000000000000000000000000001))))

(declare-fun lt!254793 () Unit!11146)

(assert (=> b!161817 (= lt!254793 (arrayUpdatedAtPrefixLemma!154 (buf!4052 thiss!1602) (bvsub (currentByte!7546 (_3!575 lt!254790)) #b00000000000000000000000000000001) lt!254787))))

(assert (=> b!161817 (= lt!254787 (select (arr!4515 (buf!4052 (_3!575 lt!254790))) (bvsub (currentByte!7546 (_3!575 lt!254790)) #b00000000000000000000000000000001)))))

(declare-fun lt!254792 () (_ BitVec 8))

(declare-fun lt!254795 () (_ BitVec 32))

(declare-fun lt!254789 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun Unit!11148 () Unit!11146)

(declare-fun Unit!11149 () Unit!11146)

(assert (=> b!161817 (= lt!254790 (ite (bvsgt lt!254788 #b00000000000000000000000000000000) (let ((bdg!9719 ((_ extract 7 0) (bvnot lt!254789)))) (let ((bdg!9720 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4515 (buf!4052 thiss!1602)) (currentByte!7546 thiss!1602) lt!254786) (currentByte!7546 thiss!1602) lt!254796) (bvadd #b00000000000000000000000000000001 (currentByte!7546 thiss!1602)))) ((_ sign_extend 24) bdg!9719))))) (tuple3!917 Unit!11148 bdg!9719 (BitStream!6357 (array!8015 (store (arr!4515 (array!8015 (store (arr!4515 lt!254794) (bvadd #b00000000000000000000000000000001 (currentByte!7546 thiss!1602)) bdg!9720) (size!3594 lt!254794))) (bvadd #b00000000000000000000000000000001 (currentByte!7546 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9720) (bvshl ((_ sign_extend 24) v!222) lt!254795)))) (size!3594 (array!8015 (store (arr!4515 lt!254794) (bvadd #b00000000000000000000000000000001 (currentByte!7546 thiss!1602)) bdg!9720) (size!3594 lt!254794)))) (bvadd #b00000000000000000000000000000001 (currentByte!7546 thiss!1602)) (currentBit!7541 thiss!1602))))) (tuple3!917 Unit!11149 lt!254792 (BitStream!6357 lt!254794 (bvadd #b00000000000000000000000000000001 (currentByte!7546 thiss!1602)) (currentBit!7541 thiss!1602)))))))

(assert (=> b!161817 e!111534))

(declare-fun res!134900 () Bool)

(assert (=> b!161817 (=> res!134900 e!111534)))

(assert (=> b!161817 (= res!134900 (bvsge (currentByte!7546 thiss!1602) (size!3594 (buf!4052 thiss!1602))))))

(assert (=> b!161817 (= lt!254794 (array!8015 (store (store (arr!4515 (buf!4052 thiss!1602)) (currentByte!7546 thiss!1602) lt!254786) (currentByte!7546 thiss!1602) lt!254796) (size!3594 (buf!4052 thiss!1602))))))

(assert (=> b!161817 (= lt!254796 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254786) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254788))))))

(assert (=> b!161817 (= lt!254786 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4515 (buf!4052 thiss!1602)) (currentByte!7546 thiss!1602))) lt!254789)))))

(assert (=> b!161817 (= lt!254789 ((_ sign_extend 24) lt!254792))))

(assert (=> b!161817 (= lt!254792 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254795)))))))

(assert (=> b!161817 (= lt!254795 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254788))))))

(assert (=> b!161817 (= lt!254788 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7541 thiss!1602))))))

(assert (= (and start!33876 res!134899) b!161817))

(assert (= (and b!161817 (not res!134900)) b!161815))

(assert (= (and b!161817 (not res!134897)) b!161814))

(assert (= (and b!161814 (not res!134898)) b!161816))

(assert (= start!33876 b!161813))

(declare-fun m!256691 () Bool)

(assert (=> b!161813 m!256691))

(declare-fun m!256693 () Bool)

(assert (=> start!33876 m!256693))

(declare-fun m!256695 () Bool)

(assert (=> start!33876 m!256695))

(declare-fun m!256697 () Bool)

(assert (=> b!161817 m!256697))

(declare-fun m!256699 () Bool)

(assert (=> b!161817 m!256699))

(declare-fun m!256701 () Bool)

(assert (=> b!161817 m!256701))

(declare-fun m!256703 () Bool)

(assert (=> b!161817 m!256703))

(declare-fun m!256705 () Bool)

(assert (=> b!161817 m!256705))

(declare-fun m!256707 () Bool)

(assert (=> b!161817 m!256707))

(declare-fun m!256709 () Bool)

(assert (=> b!161817 m!256709))

(declare-fun m!256711 () Bool)

(assert (=> b!161817 m!256711))

(declare-fun m!256713 () Bool)

(assert (=> b!161817 m!256713))

(declare-fun m!256715 () Bool)

(assert (=> b!161817 m!256715))

(declare-fun m!256717 () Bool)

(assert (=> b!161817 m!256717))

(declare-fun m!256719 () Bool)

(assert (=> b!161817 m!256719))

(declare-fun m!256721 () Bool)

(assert (=> b!161816 m!256721))

(declare-fun m!256723 () Bool)

(assert (=> b!161816 m!256723))

(declare-fun m!256725 () Bool)

(assert (=> b!161816 m!256725))

(declare-fun m!256727 () Bool)

(assert (=> b!161816 m!256727))

(declare-fun m!256729 () Bool)

(assert (=> b!161816 m!256729))

(declare-fun m!256731 () Bool)

(assert (=> b!161816 m!256731))

(declare-fun m!256733 () Bool)

(assert (=> b!161816 m!256733))

(assert (=> b!161816 m!256719))

(declare-fun m!256735 () Bool)

(assert (=> b!161816 m!256735))

(assert (=> b!161816 m!256721))

(declare-fun m!256737 () Bool)

(assert (=> b!161816 m!256737))

(declare-fun m!256739 () Bool)

(assert (=> b!161816 m!256739))

(assert (=> b!161816 m!256721))

(assert (=> b!161816 m!256705))

(assert (=> b!161815 m!256715))

(assert (=> b!161815 m!256715))

(declare-fun m!256741 () Bool)

(assert (=> b!161815 m!256741))

(push 1)

(assert (not b!161817))

(assert (not b!161816))

(assert (not b!161813))

(assert (not start!33876))

(assert (not b!161815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


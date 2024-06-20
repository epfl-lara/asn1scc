; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33874 () Bool)

(assert start!33874)

(declare-fun b!161798 () Bool)

(declare-fun e!111519 () Bool)

(declare-datatypes ((array!8012 0))(
  ( (array!8013 (arr!4514 (Array (_ BitVec 32) (_ BitVec 8))) (size!3593 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6354 0))(
  ( (BitStream!6355 (buf!4051 array!8012) (currentByte!7545 (_ BitVec 32)) (currentBit!7540 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6354)

(declare-datatypes ((Unit!11142 0))(
  ( (Unit!11143) )
))
(declare-datatypes ((tuple3!914 0))(
  ( (tuple3!915 (_1!7808 Unit!11142) (_2!7808 (_ BitVec 8)) (_3!574 BitStream!6354)) )
))
(declare-fun lt!254754 () tuple3!914)

(declare-fun arrayRangesEq!545 (array!8012 array!8012 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161798 (= e!111519 (arrayRangesEq!545 (buf!4051 thiss!1602) (buf!4051 (_3!574 lt!254754)) #b00000000000000000000000000000000 (currentByte!7545 thiss!1602)))))

(assert (=> b!161798 (arrayRangesEq!545 (buf!4051 thiss!1602) (buf!4051 (_3!574 lt!254754)) #b00000000000000000000000000000000 (bvsub (currentByte!7545 (_3!574 lt!254754)) #b00000000000000000000000000000001))))

(declare-fun lt!254757 () Unit!11142)

(declare-fun lt!254748 () array!8012)

(declare-fun arrayRangesEqTransitive!143 (array!8012 array!8012 array!8012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11142)

(assert (=> b!161798 (= lt!254757 (arrayRangesEqTransitive!143 (buf!4051 thiss!1602) lt!254748 (buf!4051 (_3!574 lt!254754)) #b00000000000000000000000000000000 (bvsub (currentByte!7545 (_3!574 lt!254754)) #b00000000000000000000000000000001) (currentByte!7545 (_3!574 lt!254754))))))

(declare-fun lt!254745 () (_ BitVec 8))

(declare-fun lt!254753 () (_ BitVec 8))

(assert (=> b!161798 (arrayRangesEq!545 lt!254748 (array!8013 (store (store (store (arr!4514 (buf!4051 thiss!1602)) (currentByte!7545 thiss!1602) lt!254753) (currentByte!7545 thiss!1602) lt!254745) (currentByte!7545 (_3!574 lt!254754)) (select (arr!4514 (buf!4051 (_3!574 lt!254754))) (currentByte!7545 (_3!574 lt!254754)))) (size!3593 (buf!4051 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7545 (_3!574 lt!254754)))))

(declare-fun lt!254747 () Unit!11142)

(declare-fun arrayUpdatedAtPrefixLemma!153 (array!8012 (_ BitVec 32) (_ BitVec 8)) Unit!11142)

(assert (=> b!161798 (= lt!254747 (arrayUpdatedAtPrefixLemma!153 lt!254748 (currentByte!7545 (_3!574 lt!254754)) (select (arr!4514 (buf!4051 (_3!574 lt!254754))) (currentByte!7545 (_3!574 lt!254754)))))))

(assert (=> b!161798 (arrayRangesEq!545 (buf!4051 thiss!1602) (array!8013 (store (arr!4514 (buf!4051 thiss!1602)) (currentByte!7545 (_3!574 lt!254754)) (select (arr!4514 (buf!4051 (_3!574 lt!254754))) (currentByte!7545 (_3!574 lt!254754)))) (size!3593 (buf!4051 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7545 (_3!574 lt!254754)))))

(declare-fun lt!254746 () Unit!11142)

(assert (=> b!161798 (= lt!254746 (arrayUpdatedAtPrefixLemma!153 (buf!4051 thiss!1602) (currentByte!7545 (_3!574 lt!254754)) (select (arr!4514 (buf!4051 (_3!574 lt!254754))) (currentByte!7545 (_3!574 lt!254754)))))))

(declare-fun b!161800 () Bool)

(declare-fun e!111518 () Bool)

(assert (=> b!161800 (= e!111518 (not e!111519))))

(declare-fun res!134886 () Bool)

(assert (=> b!161800 (=> res!134886 e!111519)))

(assert (=> b!161800 (= res!134886 (not (arrayRangesEq!545 (buf!4051 thiss!1602) lt!254748 #b00000000000000000000000000000000 (bvsub (currentByte!7545 (_3!574 lt!254754)) #b00000000000000000000000000000001))))))

(declare-fun lt!254750 () (_ BitVec 8))

(assert (=> b!161800 (arrayRangesEq!545 (buf!4051 thiss!1602) (array!8013 (store (arr!4514 (buf!4051 thiss!1602)) (bvsub (currentByte!7545 (_3!574 lt!254754)) #b00000000000000000000000000000001) lt!254750) (size!3593 (buf!4051 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7545 (_3!574 lt!254754)) #b00000000000000000000000000000001))))

(declare-fun lt!254755 () Unit!11142)

(assert (=> b!161800 (= lt!254755 (arrayUpdatedAtPrefixLemma!153 (buf!4051 thiss!1602) (bvsub (currentByte!7545 (_3!574 lt!254754)) #b00000000000000000000000000000001) lt!254750))))

(assert (=> b!161800 (= lt!254750 (select (arr!4514 (buf!4051 (_3!574 lt!254754))) (bvsub (currentByte!7545 (_3!574 lt!254754)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254749 () (_ BitVec 8))

(declare-fun lt!254756 () (_ BitVec 32))

(declare-fun lt!254752 () (_ BitVec 32))

(declare-fun lt!254751 () (_ BitVec 32))

(declare-fun Unit!11144 () Unit!11142)

(declare-fun Unit!11145 () Unit!11142)

(assert (=> b!161800 (= lt!254754 (ite (bvsgt lt!254751 #b00000000000000000000000000000000) (let ((bdg!9719 ((_ extract 7 0) (bvnot lt!254756)))) (let ((bdg!9720 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4514 (buf!4051 thiss!1602)) (currentByte!7545 thiss!1602) lt!254753) (currentByte!7545 thiss!1602) lt!254745) (bvadd #b00000000000000000000000000000001 (currentByte!7545 thiss!1602)))) ((_ sign_extend 24) bdg!9719))))) (tuple3!915 Unit!11144 bdg!9719 (BitStream!6355 (array!8013 (store (arr!4514 (array!8013 (store (arr!4514 lt!254748) (bvadd #b00000000000000000000000000000001 (currentByte!7545 thiss!1602)) bdg!9720) (size!3593 lt!254748))) (bvadd #b00000000000000000000000000000001 (currentByte!7545 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9720) (bvshl ((_ sign_extend 24) v!222) lt!254752)))) (size!3593 (array!8013 (store (arr!4514 lt!254748) (bvadd #b00000000000000000000000000000001 (currentByte!7545 thiss!1602)) bdg!9720) (size!3593 lt!254748)))) (bvadd #b00000000000000000000000000000001 (currentByte!7545 thiss!1602)) (currentBit!7540 thiss!1602))))) (tuple3!915 Unit!11145 lt!254749 (BitStream!6355 lt!254748 (bvadd #b00000000000000000000000000000001 (currentByte!7545 thiss!1602)) (currentBit!7540 thiss!1602)))))))

(declare-fun e!111515 () Bool)

(assert (=> b!161800 e!111515))

(declare-fun res!134887 () Bool)

(assert (=> b!161800 (=> res!134887 e!111515)))

(assert (=> b!161800 (= res!134887 (bvsge (currentByte!7545 thiss!1602) (size!3593 (buf!4051 thiss!1602))))))

(assert (=> b!161800 (= lt!254748 (array!8013 (store (store (arr!4514 (buf!4051 thiss!1602)) (currentByte!7545 thiss!1602) lt!254753) (currentByte!7545 thiss!1602) lt!254745) (size!3593 (buf!4051 thiss!1602))))))

(assert (=> b!161800 (= lt!254745 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254753) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254751))))))

(assert (=> b!161800 (= lt!254753 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4514 (buf!4051 thiss!1602)) (currentByte!7545 thiss!1602))) lt!254756)))))

(assert (=> b!161800 (= lt!254756 ((_ sign_extend 24) lt!254749))))

(assert (=> b!161800 (= lt!254749 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254752)))))))

(assert (=> b!161800 (= lt!254752 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254751))))))

(assert (=> b!161800 (= lt!254751 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7540 thiss!1602))))))

(declare-fun b!161801 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161801 (= e!111515 (byteRangesEq!0 (select (arr!4514 (buf!4051 thiss!1602)) (currentByte!7545 thiss!1602)) lt!254745 #b00000000000000000000000000000000 (currentBit!7540 thiss!1602)))))

(declare-fun b!161802 () Bool)

(declare-fun e!111516 () Bool)

(declare-fun array_inv!3340 (array!8012) Bool)

(assert (=> b!161802 (= e!111516 (array_inv!3340 (buf!4051 thiss!1602)))))

(declare-fun res!134885 () Bool)

(assert (=> start!33874 (=> (not res!134885) (not e!111518))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33874 (= res!134885 (validate_offset_byte!0 ((_ sign_extend 32) (size!3593 (buf!4051 thiss!1602))) ((_ sign_extend 32) (currentByte!7545 thiss!1602)) ((_ sign_extend 32) (currentBit!7540 thiss!1602))))))

(assert (=> start!33874 e!111518))

(declare-fun inv!12 (BitStream!6354) Bool)

(assert (=> start!33874 (and (inv!12 thiss!1602) e!111516)))

(assert (=> start!33874 true))

(declare-fun b!161799 () Bool)

(declare-fun res!134888 () Bool)

(assert (=> b!161799 (=> res!134888 e!111519)))

(assert (=> b!161799 (= res!134888 (bvsle lt!254751 #b00000000000000000000000000000000))))

(assert (= (and start!33874 res!134885) b!161800))

(assert (= (and b!161800 (not res!134887)) b!161801))

(assert (= (and b!161800 (not res!134886)) b!161799))

(assert (= (and b!161799 (not res!134888)) b!161798))

(assert (= start!33874 b!161802))

(declare-fun m!256639 () Bool)

(assert (=> b!161801 m!256639))

(assert (=> b!161801 m!256639))

(declare-fun m!256641 () Bool)

(assert (=> b!161801 m!256641))

(declare-fun m!256643 () Bool)

(assert (=> start!33874 m!256643))

(declare-fun m!256645 () Bool)

(assert (=> start!33874 m!256645))

(declare-fun m!256647 () Bool)

(assert (=> b!161802 m!256647))

(declare-fun m!256649 () Bool)

(assert (=> b!161800 m!256649))

(declare-fun m!256651 () Bool)

(assert (=> b!161800 m!256651))

(declare-fun m!256653 () Bool)

(assert (=> b!161800 m!256653))

(declare-fun m!256655 () Bool)

(assert (=> b!161800 m!256655))

(declare-fun m!256657 () Bool)

(assert (=> b!161800 m!256657))

(assert (=> b!161800 m!256639))

(declare-fun m!256659 () Bool)

(assert (=> b!161800 m!256659))

(declare-fun m!256661 () Bool)

(assert (=> b!161800 m!256661))

(declare-fun m!256663 () Bool)

(assert (=> b!161800 m!256663))

(declare-fun m!256665 () Bool)

(assert (=> b!161800 m!256665))

(declare-fun m!256667 () Bool)

(assert (=> b!161800 m!256667))

(declare-fun m!256669 () Bool)

(assert (=> b!161800 m!256669))

(assert (=> b!161798 m!256669))

(declare-fun m!256671 () Bool)

(assert (=> b!161798 m!256671))

(declare-fun m!256673 () Bool)

(assert (=> b!161798 m!256673))

(declare-fun m!256675 () Bool)

(assert (=> b!161798 m!256675))

(assert (=> b!161798 m!256671))

(declare-fun m!256677 () Bool)

(assert (=> b!161798 m!256677))

(assert (=> b!161798 m!256671))

(declare-fun m!256679 () Bool)

(assert (=> b!161798 m!256679))

(declare-fun m!256681 () Bool)

(assert (=> b!161798 m!256681))

(declare-fun m!256683 () Bool)

(assert (=> b!161798 m!256683))

(declare-fun m!256685 () Bool)

(assert (=> b!161798 m!256685))

(declare-fun m!256687 () Bool)

(assert (=> b!161798 m!256687))

(assert (=> b!161798 m!256655))

(declare-fun m!256689 () Bool)

(assert (=> b!161798 m!256689))

(check-sat (not start!33874) (not b!161800) (not b!161798) (not b!161802) (not b!161801))
(check-sat)

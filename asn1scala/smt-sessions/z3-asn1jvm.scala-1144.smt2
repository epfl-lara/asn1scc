; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32352 () Bool)

(assert start!32352)

(declare-fun b!159662 () Bool)

(declare-datatypes ((Unit!10877 0))(
  ( (Unit!10878) )
))
(declare-fun e!109125 () Unit!10877)

(declare-fun Unit!10879 () Unit!10877)

(assert (=> b!159662 (= e!109125 Unit!10879)))

(declare-fun lt!252057 () Unit!10877)

(declare-datatypes ((array!7613 0))(
  ( (array!7614 (arr!4367 (Array (_ BitVec 32) (_ BitVec 8))) (size!3446 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6060 0))(
  ( (BitStream!6061 (buf!3904 array!7613) (currentByte!7141 (_ BitVec 32)) (currentBit!7136 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6060)

(declare-datatypes ((tuple3!794 0))(
  ( (tuple3!795 (_1!7745 Unit!10877) (_2!7745 (_ BitVec 8)) (_3!514 BitStream!6060)) )
))
(declare-fun lt!252043 () tuple3!794)

(declare-fun arrayUpdatedAtPrefixLemma!105 (array!7613 (_ BitVec 32) (_ BitVec 8)) Unit!10877)

(assert (=> b!159662 (= lt!252057 (arrayUpdatedAtPrefixLemma!105 (buf!3904 thiss!1602) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))))))

(declare-fun arrayRangesEq!497 (array!7613 array!7613 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159662 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043)))))

(declare-fun lt!252046 () Unit!10877)

(declare-fun lt!252047 () array!7613)

(assert (=> b!159662 (= lt!252046 (arrayUpdatedAtPrefixLemma!105 lt!252047 (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))))))

(declare-fun lt!252055 () (_ BitVec 8))

(declare-fun lt!252048 () (_ BitVec 8))

(assert (=> b!159662 (arrayRangesEq!497 lt!252047 (array!7614 (store (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043)))))

(declare-fun lt!252049 () Unit!10877)

(declare-fun arrayRangesEqTransitive!131 (array!7613 array!7613 array!7613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10877)

(assert (=> b!159662 (= lt!252049 (arrayRangesEqTransitive!131 (buf!3904 thiss!1602) lt!252047 (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(declare-fun res!133273 () Bool)

(assert (=> b!159662 (= res!133273 (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(declare-fun e!109122 () Bool)

(assert (=> b!159662 (=> (not res!133273) (not e!109122))))

(assert (=> b!159662 e!109122))

(declare-fun b!159663 () Bool)

(declare-fun e!109121 () Bool)

(declare-fun e!109123 () Bool)

(assert (=> b!159663 (= e!109121 e!109123)))

(declare-fun res!133272 () Bool)

(assert (=> b!159663 (=> res!133272 e!109123)))

(assert (=> b!159663 (= res!133272 (not (= (size!3446 (buf!3904 thiss!1602)) (size!3446 (buf!3904 (_3!514 lt!252043))))))))

(declare-fun lt!252050 () Unit!10877)

(assert (=> b!159663 (= lt!252050 e!109125)))

(declare-fun c!8423 () Bool)

(declare-fun lt!252044 () Bool)

(assert (=> b!159663 (= c!8423 lt!252044)))

(declare-fun b!159664 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159664 (= e!109123 (invariant!0 (currentBit!7136 (_3!514 lt!252043)) (currentByte!7141 (_3!514 lt!252043)) (size!3446 (buf!3904 (_3!514 lt!252043)))))))

(declare-fun res!133270 () Bool)

(declare-fun e!109126 () Bool)

(assert (=> start!32352 (=> (not res!133270) (not e!109126))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32352 (= res!133270 (validate_offset_byte!0 ((_ sign_extend 32) (size!3446 (buf!3904 thiss!1602))) ((_ sign_extend 32) (currentByte!7141 thiss!1602)) ((_ sign_extend 32) (currentBit!7136 thiss!1602))))))

(assert (=> start!32352 e!109126))

(declare-fun e!109124 () Bool)

(declare-fun inv!12 (BitStream!6060) Bool)

(assert (=> start!32352 (and (inv!12 thiss!1602) e!109124)))

(assert (=> start!32352 true))

(declare-fun b!159665 () Bool)

(declare-fun array_inv!3193 (array!7613) Bool)

(assert (=> b!159665 (= e!109124 (array_inv!3193 (buf!3904 thiss!1602)))))

(declare-fun b!159666 () Bool)

(assert (=> b!159666 (= e!109126 (not e!109121))))

(declare-fun res!133274 () Bool)

(assert (=> b!159666 (=> res!133274 e!109121)))

(assert (=> b!159666 (= res!133274 (not (arrayRangesEq!497 (buf!3904 thiss!1602) lt!252047 #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001))))))

(declare-fun lt!252056 () (_ BitVec 8))

(assert (=> b!159666 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001))))

(declare-fun lt!252053 () Unit!10877)

(assert (=> b!159666 (= lt!252053 (arrayUpdatedAtPrefixLemma!105 (buf!3904 thiss!1602) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056))))

(assert (=> b!159666 (= lt!252056 (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(declare-fun lt!252051 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252045 () (_ BitVec 8))

(declare-fun lt!252054 () (_ BitVec 32))

(declare-fun Unit!10880 () Unit!10877)

(declare-fun Unit!10881 () Unit!10877)

(assert (=> b!159666 (= lt!252043 (ite lt!252044 (let ((bdg!9420 ((_ extract 7 0) (bvnot lt!252054)))) (let ((bdg!9421 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (bvadd #b00000000000000000000000000000001 (currentByte!7141 thiss!1602)))) ((_ sign_extend 24) bdg!9420))))) (tuple3!795 Unit!10880 bdg!9420 (BitStream!6061 (array!7614 (store (arr!4367 (array!7614 (store (arr!4367 lt!252047) (bvadd #b00000000000000000000000000000001 (currentByte!7141 thiss!1602)) bdg!9421) (size!3446 lt!252047))) (bvadd #b00000000000000000000000000000001 (currentByte!7141 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9421) (bvshl ((_ sign_extend 24) v!222) lt!252051)))) (size!3446 (array!7614 (store (arr!4367 lt!252047) (bvadd #b00000000000000000000000000000001 (currentByte!7141 thiss!1602)) bdg!9421) (size!3446 lt!252047)))) (bvadd #b00000000000000000000000000000001 (currentByte!7141 thiss!1602)) (currentBit!7136 thiss!1602))))) (tuple3!795 Unit!10881 lt!252045 (BitStream!6061 lt!252047 (bvadd #b00000000000000000000000000000001 (currentByte!7141 thiss!1602)) (currentBit!7136 thiss!1602)))))))

(declare-fun lt!252052 () (_ BitVec 32))

(assert (=> b!159666 (= lt!252044 (bvsgt lt!252052 #b00000000000000000000000000000000))))

(declare-fun e!109128 () Bool)

(assert (=> b!159666 e!109128))

(declare-fun res!133271 () Bool)

(assert (=> b!159666 (=> res!133271 e!109128)))

(assert (=> b!159666 (= res!133271 (bvsge (currentByte!7141 thiss!1602) (size!3446 (buf!3904 thiss!1602))))))

(assert (=> b!159666 (= lt!252047 (array!7614 (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (size!3446 (buf!3904 thiss!1602))))))

(assert (=> b!159666 (= lt!252055 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252048) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252052))))))

(assert (=> b!159666 (= lt!252048 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602))) lt!252054)))))

(assert (=> b!159666 (= lt!252054 ((_ sign_extend 24) lt!252045))))

(assert (=> b!159666 (= lt!252045 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252051)))))))

(assert (=> b!159666 (= lt!252051 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252052))))))

(assert (=> b!159666 (= lt!252052 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7136 thiss!1602))))))

(declare-fun b!159667 () Bool)

(declare-fun call!2693 () Bool)

(assert (=> b!159667 (= e!109122 call!2693)))

(declare-fun b!159668 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159668 (= e!109128 (byteRangesEq!0 (select (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602)) lt!252055 #b00000000000000000000000000000000 (currentBit!7136 thiss!1602)))))

(declare-fun b!159669 () Bool)

(declare-fun Unit!10882 () Unit!10877)

(assert (=> b!159669 (= e!109125 Unit!10882)))

(assert (=> b!159669 call!2693))

(declare-fun bm!2690 () Bool)

(assert (=> bm!2690 (= call!2693 (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (currentByte!7141 thiss!1602)))))

(assert (= (and start!32352 res!133270) b!159666))

(assert (= (and b!159666 (not res!133271)) b!159668))

(assert (= (and b!159666 (not res!133274)) b!159663))

(assert (= (and b!159663 c!8423) b!159662))

(assert (= (and b!159663 (not c!8423)) b!159669))

(assert (= (and b!159662 res!133273) b!159667))

(assert (= (or b!159667 b!159669) bm!2690))

(assert (= (and b!159663 (not res!133272)) b!159664))

(assert (= start!32352 b!159665))

(declare-fun m!251761 () Bool)

(assert (=> start!32352 m!251761))

(declare-fun m!251763 () Bool)

(assert (=> start!32352 m!251763))

(declare-fun m!251765 () Bool)

(assert (=> bm!2690 m!251765))

(declare-fun m!251767 () Bool)

(assert (=> b!159666 m!251767))

(declare-fun m!251769 () Bool)

(assert (=> b!159666 m!251769))

(declare-fun m!251771 () Bool)

(assert (=> b!159666 m!251771))

(declare-fun m!251773 () Bool)

(assert (=> b!159666 m!251773))

(declare-fun m!251775 () Bool)

(assert (=> b!159666 m!251775))

(declare-fun m!251777 () Bool)

(assert (=> b!159666 m!251777))

(declare-fun m!251779 () Bool)

(assert (=> b!159666 m!251779))

(declare-fun m!251781 () Bool)

(assert (=> b!159666 m!251781))

(declare-fun m!251783 () Bool)

(assert (=> b!159666 m!251783))

(declare-fun m!251785 () Bool)

(assert (=> b!159666 m!251785))

(declare-fun m!251787 () Bool)

(assert (=> b!159666 m!251787))

(declare-fun m!251789 () Bool)

(assert (=> b!159666 m!251789))

(declare-fun m!251791 () Bool)

(assert (=> b!159662 m!251791))

(declare-fun m!251793 () Bool)

(assert (=> b!159662 m!251793))

(assert (=> b!159662 m!251775))

(declare-fun m!251795 () Bool)

(assert (=> b!159662 m!251795))

(declare-fun m!251797 () Bool)

(assert (=> b!159662 m!251797))

(declare-fun m!251799 () Bool)

(assert (=> b!159662 m!251799))

(assert (=> b!159662 m!251797))

(assert (=> b!159662 m!251781))

(declare-fun m!251801 () Bool)

(assert (=> b!159662 m!251801))

(assert (=> b!159662 m!251797))

(declare-fun m!251803 () Bool)

(assert (=> b!159662 m!251803))

(declare-fun m!251805 () Bool)

(assert (=> b!159662 m!251805))

(declare-fun m!251807 () Bool)

(assert (=> b!159662 m!251807))

(assert (=> b!159668 m!251789))

(assert (=> b!159668 m!251789))

(declare-fun m!251809 () Bool)

(assert (=> b!159668 m!251809))

(declare-fun m!251811 () Bool)

(assert (=> b!159664 m!251811))

(declare-fun m!251813 () Bool)

(assert (=> b!159665 m!251813))

(check-sat (not b!159668) (not b!159664) (not b!159662) (not b!159665) (not start!32352) (not b!159666) (not bm!2690))
(check-sat)
(get-model)

(declare-fun d!53713 () Bool)

(declare-fun res!133294 () Bool)

(declare-fun e!109157 () Bool)

(assert (=> d!53713 (=> res!133294 e!109157)))

(assert (=> d!53713 (= res!133294 (= #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))))))

(assert (=> d!53713 (= (arrayRangesEq!497 lt!252047 (array!7614 (store (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))) e!109157)))

(declare-fun b!159698 () Bool)

(declare-fun e!109158 () Bool)

(assert (=> b!159698 (= e!109157 e!109158)))

(declare-fun res!133295 () Bool)

(assert (=> b!159698 (=> (not res!133295) (not e!109158))))

(assert (=> b!159698 (= res!133295 (= (select (arr!4367 lt!252047) #b00000000000000000000000000000000) (select (arr!4367 (array!7614 (store (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159699 () Bool)

(assert (=> b!159699 (= e!109158 (arrayRangesEq!497 lt!252047 (array!7614 (store (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (= (and d!53713 (not res!133294)) b!159698))

(assert (= (and b!159698 res!133295) b!159699))

(declare-fun m!251869 () Bool)

(assert (=> b!159698 m!251869))

(declare-fun m!251871 () Bool)

(assert (=> b!159698 m!251871))

(declare-fun m!251873 () Bool)

(assert (=> b!159699 m!251873))

(assert (=> b!159662 d!53713))

(declare-fun d!53715 () Bool)

(declare-fun res!133296 () Bool)

(declare-fun e!109159 () Bool)

(assert (=> d!53715 (=> res!133296 e!109159)))

(assert (=> d!53715 (= res!133296 (= #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (=> d!53715 (= (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)) e!109159)))

(declare-fun b!159700 () Bool)

(declare-fun e!109160 () Bool)

(assert (=> b!159700 (= e!109159 e!109160)))

(declare-fun res!133297 () Bool)

(assert (=> b!159700 (=> (not res!133297) (not e!109160))))

(assert (=> b!159700 (= res!133297 (= (select (arr!4367 (buf!3904 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) #b00000000000000000000000000000000)))))

(declare-fun b!159701 () Bool)

(assert (=> b!159701 (= e!109160 (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (= (and d!53715 (not res!133296)) b!159700))

(assert (= (and b!159700 res!133297) b!159701))

(declare-fun m!251875 () Bool)

(assert (=> b!159700 m!251875))

(declare-fun m!251877 () Bool)

(assert (=> b!159700 m!251877))

(declare-fun m!251879 () Bool)

(assert (=> b!159701 m!251879))

(assert (=> b!159662 d!53715))

(declare-fun d!53717 () Bool)

(declare-fun e!109163 () Bool)

(assert (=> d!53717 e!109163))

(declare-fun res!133300 () Bool)

(assert (=> d!53717 (=> (not res!133300) (not e!109163))))

(assert (=> d!53717 (= res!133300 (and (bvsge (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000000) (bvslt (currentByte!7141 (_3!514 lt!252043)) (size!3446 lt!252047))))))

(declare-fun lt!252105 () Unit!10877)

(declare-fun choose!137 (array!7613 (_ BitVec 32) (_ BitVec 8)) Unit!10877)

(assert (=> d!53717 (= lt!252105 (choose!137 lt!252047 (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))))))

(assert (=> d!53717 (and (bvsle #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))) (bvslt (currentByte!7141 (_3!514 lt!252043)) (size!3446 lt!252047)))))

(assert (=> d!53717 (= (arrayUpdatedAtPrefixLemma!105 lt!252047 (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) lt!252105)))

(declare-fun b!159704 () Bool)

(assert (=> b!159704 (= e!109163 (arrayRangesEq!497 lt!252047 (array!7614 (store (arr!4367 lt!252047) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 lt!252047)) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))))))

(assert (= (and d!53717 res!133300) b!159704))

(assert (=> d!53717 m!251797))

(declare-fun m!251881 () Bool)

(assert (=> d!53717 m!251881))

(declare-fun m!251883 () Bool)

(assert (=> b!159704 m!251883))

(declare-fun m!251885 () Bool)

(assert (=> b!159704 m!251885))

(assert (=> b!159662 d!53717))

(declare-fun d!53719 () Bool)

(declare-fun e!109164 () Bool)

(assert (=> d!53719 e!109164))

(declare-fun res!133301 () Bool)

(assert (=> d!53719 (=> (not res!133301) (not e!109164))))

(assert (=> d!53719 (= res!133301 (and (bvsge (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000000) (bvslt (currentByte!7141 (_3!514 lt!252043)) (size!3446 (buf!3904 thiss!1602)))))))

(declare-fun lt!252106 () Unit!10877)

(assert (=> d!53719 (= lt!252106 (choose!137 (buf!3904 thiss!1602) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))))))

(assert (=> d!53719 (and (bvsle #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))) (bvslt (currentByte!7141 (_3!514 lt!252043)) (size!3446 (buf!3904 thiss!1602))))))

(assert (=> d!53719 (= (arrayUpdatedAtPrefixLemma!105 (buf!3904 thiss!1602) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) lt!252106)))

(declare-fun b!159705 () Bool)

(assert (=> b!159705 (= e!109164 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))))))

(assert (= (and d!53719 res!133301) b!159705))

(assert (=> d!53719 m!251797))

(declare-fun m!251887 () Bool)

(assert (=> d!53719 m!251887))

(assert (=> b!159705 m!251795))

(assert (=> b!159705 m!251793))

(assert (=> b!159662 d!53719))

(declare-fun d!53721 () Bool)

(declare-fun res!133302 () Bool)

(declare-fun e!109165 () Bool)

(assert (=> d!53721 (=> res!133302 e!109165)))

(assert (=> d!53721 (= res!133302 (= #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))))))

(assert (=> d!53721 (= (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))) e!109165)))

(declare-fun b!159706 () Bool)

(declare-fun e!109166 () Bool)

(assert (=> b!159706 (= e!109165 e!109166)))

(declare-fun res!133303 () Bool)

(assert (=> b!159706 (=> (not res!133303) (not e!109166))))

(assert (=> b!159706 (= res!133303 (= (select (arr!4367 (buf!3904 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4367 (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159707 () Bool)

(assert (=> b!159707 (= e!109166 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (= (and d!53721 (not res!133302)) b!159706))

(assert (= (and b!159706 res!133303) b!159707))

(assert (=> b!159706 m!251875))

(declare-fun m!251889 () Bool)

(assert (=> b!159706 m!251889))

(declare-fun m!251891 () Bool)

(assert (=> b!159707 m!251891))

(assert (=> b!159662 d!53721))

(declare-fun d!53723 () Bool)

(assert (=> d!53723 (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001))))

(declare-fun lt!252109 () Unit!10877)

(declare-fun choose!138 (array!7613 array!7613 array!7613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10877)

(assert (=> d!53723 (= lt!252109 (choose!138 (buf!3904 thiss!1602) lt!252047 (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (=> d!53723 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (=> d!53723 (= (arrayRangesEqTransitive!131 (buf!3904 thiss!1602) lt!252047 (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))) lt!252109)))

(declare-fun bs!13318 () Bool)

(assert (= bs!13318 d!53723))

(assert (=> bs!13318 m!251805))

(declare-fun m!251893 () Bool)

(assert (=> bs!13318 m!251893))

(assert (=> b!159662 d!53723))

(declare-fun d!53725 () Bool)

(declare-fun res!133304 () Bool)

(declare-fun e!109167 () Bool)

(assert (=> d!53725 (=> res!133304 e!109167)))

(assert (=> d!53725 (= res!133304 (= #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (=> d!53725 (= (arrayRangesEq!497 (buf!3904 thiss!1602) lt!252047 #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)) e!109167)))

(declare-fun b!159708 () Bool)

(declare-fun e!109168 () Bool)

(assert (=> b!159708 (= e!109167 e!109168)))

(declare-fun res!133305 () Bool)

(assert (=> b!159708 (=> (not res!133305) (not e!109168))))

(assert (=> b!159708 (= res!133305 (= (select (arr!4367 (buf!3904 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4367 lt!252047) #b00000000000000000000000000000000)))))

(declare-fun b!159709 () Bool)

(assert (=> b!159709 (= e!109168 (arrayRangesEq!497 (buf!3904 thiss!1602) lt!252047 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (= (and d!53725 (not res!133304)) b!159708))

(assert (= (and b!159708 res!133305) b!159709))

(assert (=> b!159708 m!251875))

(assert (=> b!159708 m!251869))

(declare-fun m!251895 () Bool)

(assert (=> b!159709 m!251895))

(assert (=> b!159666 d!53725))

(declare-fun d!53727 () Bool)

(declare-fun res!133306 () Bool)

(declare-fun e!109169 () Bool)

(assert (=> d!53727 (=> res!133306 e!109169)))

(assert (=> d!53727 (= res!133306 (= #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (=> d!53727 (= (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)) e!109169)))

(declare-fun b!159710 () Bool)

(declare-fun e!109170 () Bool)

(assert (=> b!159710 (= e!109169 e!109170)))

(declare-fun res!133307 () Bool)

(assert (=> b!159710 (=> (not res!133307) (not e!109170))))

(assert (=> b!159710 (= res!133307 (= (select (arr!4367 (buf!3904 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4367 (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159711 () Bool)

(assert (=> b!159711 (= e!109170 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (= (and d!53727 (not res!133306)) b!159710))

(assert (= (and b!159710 res!133307) b!159711))

(assert (=> b!159710 m!251875))

(declare-fun m!251897 () Bool)

(assert (=> b!159710 m!251897))

(declare-fun m!251899 () Bool)

(assert (=> b!159711 m!251899))

(assert (=> b!159666 d!53727))

(declare-fun d!53729 () Bool)

(declare-fun e!109171 () Bool)

(assert (=> d!53729 e!109171))

(declare-fun res!133308 () Bool)

(assert (=> d!53729 (=> (not res!133308) (not e!109171))))

(assert (=> d!53729 (= res!133308 (and (bvsge (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) (size!3446 (buf!3904 thiss!1602)))))))

(declare-fun lt!252110 () Unit!10877)

(assert (=> d!53729 (= lt!252110 (choose!137 (buf!3904 thiss!1602) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056))))

(assert (=> d!53729 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) (size!3446 (buf!3904 thiss!1602))))))

(assert (=> d!53729 (= (arrayUpdatedAtPrefixLemma!105 (buf!3904 thiss!1602) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) lt!252110)))

(declare-fun b!159712 () Bool)

(assert (=> b!159712 (= e!109171 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (= (and d!53729 res!133308) b!159712))

(declare-fun m!251901 () Bool)

(assert (=> d!53729 m!251901))

(assert (=> b!159712 m!251787))

(assert (=> b!159712 m!251769))

(assert (=> b!159666 d!53729))

(declare-fun d!53731 () Bool)

(assert (=> d!53731 (= (invariant!0 (currentBit!7136 (_3!514 lt!252043)) (currentByte!7141 (_3!514 lt!252043)) (size!3446 (buf!3904 (_3!514 lt!252043)))) (and (bvsge (currentBit!7136 (_3!514 lt!252043)) #b00000000000000000000000000000000) (bvslt (currentBit!7136 (_3!514 lt!252043)) #b00000000000000000000000000001000) (bvsge (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7141 (_3!514 lt!252043)) (size!3446 (buf!3904 (_3!514 lt!252043)))) (and (= (currentBit!7136 (_3!514 lt!252043)) #b00000000000000000000000000000000) (= (currentByte!7141 (_3!514 lt!252043)) (size!3446 (buf!3904 (_3!514 lt!252043))))))))))

(assert (=> b!159664 d!53731))

(declare-fun d!53733 () Bool)

(declare-fun res!133309 () Bool)

(declare-fun e!109172 () Bool)

(assert (=> d!53733 (=> res!133309 e!109172)))

(assert (=> d!53733 (= res!133309 (= #b00000000000000000000000000000000 (currentByte!7141 thiss!1602)))))

(assert (=> d!53733 (= (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (currentByte!7141 thiss!1602)) e!109172)))

(declare-fun b!159713 () Bool)

(declare-fun e!109173 () Bool)

(assert (=> b!159713 (= e!109172 e!109173)))

(declare-fun res!133310 () Bool)

(assert (=> b!159713 (=> (not res!133310) (not e!109173))))

(assert (=> b!159713 (= res!133310 (= (select (arr!4367 (buf!3904 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) #b00000000000000000000000000000000)))))

(declare-fun b!159714 () Bool)

(assert (=> b!159714 (= e!109173 (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 thiss!1602)))))

(assert (= (and d!53733 (not res!133309)) b!159713))

(assert (= (and b!159713 res!133310) b!159714))

(assert (=> b!159713 m!251875))

(assert (=> b!159713 m!251877))

(declare-fun m!251903 () Bool)

(assert (=> b!159714 m!251903))

(assert (=> bm!2690 d!53733))

(declare-fun d!53735 () Bool)

(assert (=> d!53735 (= (array_inv!3193 (buf!3904 thiss!1602)) (bvsge (size!3446 (buf!3904 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159665 d!53735))

(declare-fun d!53737 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53737 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3446 (buf!3904 thiss!1602))) ((_ sign_extend 32) (currentByte!7141 thiss!1602)) ((_ sign_extend 32) (currentBit!7136 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3446 (buf!3904 thiss!1602))) ((_ sign_extend 32) (currentByte!7141 thiss!1602)) ((_ sign_extend 32) (currentBit!7136 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13319 () Bool)

(assert (= bs!13319 d!53737))

(declare-fun m!251905 () Bool)

(assert (=> bs!13319 m!251905))

(assert (=> start!32352 d!53737))

(declare-fun d!53739 () Bool)

(assert (=> d!53739 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7136 thiss!1602) (currentByte!7141 thiss!1602) (size!3446 (buf!3904 thiss!1602))))))

(declare-fun bs!13320 () Bool)

(assert (= bs!13320 d!53739))

(declare-fun m!251907 () Bool)

(assert (=> bs!13320 m!251907))

(assert (=> start!32352 d!53739))

(declare-fun d!53741 () Bool)

(assert (=> d!53741 (= (byteRangesEq!0 (select (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602)) lt!252055 #b00000000000000000000000000000000 (currentBit!7136 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7136 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7136 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!252055) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7136 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13321 () Bool)

(assert (= bs!13321 d!53741))

(declare-fun m!251909 () Bool)

(assert (=> bs!13321 m!251909))

(declare-fun m!251911 () Bool)

(assert (=> bs!13321 m!251911))

(assert (=> b!159668 d!53741))

(check-sat (not b!159712) (not b!159699) (not b!159709) (not b!159711) (not d!53737) (not b!159701) (not d!53717) (not b!159704) (not b!159714) (not d!53729) (not d!53723) (not b!159705) (not b!159707) (not d!53719) (not d!53739))
(check-sat)
(get-model)

(declare-fun d!53779 () Bool)

(assert (=> d!53779 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043)))))

(assert (=> d!53779 true))

(declare-fun _$8!105 () Unit!10877)

(assert (=> d!53779 (= (choose!137 (buf!3904 thiss!1602) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) _$8!105)))

(declare-fun bs!13326 () Bool)

(assert (= bs!13326 d!53779))

(assert (=> bs!13326 m!251795))

(assert (=> bs!13326 m!251793))

(assert (=> d!53719 d!53779))

(declare-fun d!53781 () Bool)

(declare-fun res!133338 () Bool)

(declare-fun e!109201 () Bool)

(assert (=> d!53781 (=> res!133338 e!109201)))

(assert (=> d!53781 (= res!133338 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (=> d!53781 (= (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)) e!109201)))

(declare-fun b!159742 () Bool)

(declare-fun e!109202 () Bool)

(assert (=> b!159742 (= e!109201 e!109202)))

(declare-fun res!133339 () Bool)

(assert (=> b!159742 (=> (not res!133339) (not e!109202))))

(assert (=> b!159742 (= res!133339 (= (select (arr!4367 (buf!3904 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4367 (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!159743 () Bool)

(assert (=> b!159743 (= e!109202 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (= (and d!53781 (not res!133338)) b!159742))

(assert (= (and b!159742 res!133339) b!159743))

(declare-fun m!251965 () Bool)

(assert (=> b!159742 m!251965))

(declare-fun m!251967 () Bool)

(assert (=> b!159742 m!251967))

(declare-fun m!251969 () Bool)

(assert (=> b!159743 m!251969))

(assert (=> b!159711 d!53781))

(assert (=> d!53723 d!53715))

(declare-fun d!53783 () Bool)

(assert (=> d!53783 (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001))))

(assert (=> d!53783 true))

(declare-fun _$16!56 () Unit!10877)

(assert (=> d!53783 (= (choose!138 (buf!3904 thiss!1602) lt!252047 (buf!3904 (_3!514 lt!252043)) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))) _$16!56)))

(declare-fun bs!13327 () Bool)

(assert (= bs!13327 d!53783))

(assert (=> bs!13327 m!251805))

(assert (=> d!53723 d!53783))

(declare-fun d!53785 () Bool)

(declare-fun res!133340 () Bool)

(declare-fun e!109203 () Bool)

(assert (=> d!53785 (=> res!133340 e!109203)))

(assert (=> d!53785 (= res!133340 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (=> d!53785 (= (arrayRangesEq!497 (buf!3904 thiss!1602) lt!252047 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)) e!109203)))

(declare-fun b!159744 () Bool)

(declare-fun e!109204 () Bool)

(assert (=> b!159744 (= e!109203 e!109204)))

(declare-fun res!133341 () Bool)

(assert (=> b!159744 (=> (not res!133341) (not e!109204))))

(assert (=> b!159744 (= res!133341 (= (select (arr!4367 (buf!3904 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4367 lt!252047) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!159745 () Bool)

(assert (=> b!159745 (= e!109204 (arrayRangesEq!497 (buf!3904 thiss!1602) lt!252047 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (= (and d!53785 (not res!133340)) b!159744))

(assert (= (and b!159744 res!133341) b!159745))

(assert (=> b!159744 m!251965))

(declare-fun m!251971 () Bool)

(assert (=> b!159744 m!251971))

(declare-fun m!251973 () Bool)

(assert (=> b!159745 m!251973))

(assert (=> b!159709 d!53785))

(declare-fun d!53787 () Bool)

(assert (=> d!53787 (= (remainingBits!0 ((_ sign_extend 32) (size!3446 (buf!3904 thiss!1602))) ((_ sign_extend 32) (currentByte!7141 thiss!1602)) ((_ sign_extend 32) (currentBit!7136 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3446 (buf!3904 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7141 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7136 thiss!1602)))))))

(assert (=> d!53737 d!53787))

(declare-fun d!53791 () Bool)

(declare-fun res!133342 () Bool)

(declare-fun e!109205 () Bool)

(assert (=> d!53791 (=> res!133342 e!109205)))

(assert (=> d!53791 (= res!133342 (= #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))))))

(assert (=> d!53791 (= (arrayRangesEq!497 lt!252047 (array!7614 (store (arr!4367 lt!252047) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 lt!252047)) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043))) e!109205)))

(declare-fun b!159746 () Bool)

(declare-fun e!109206 () Bool)

(assert (=> b!159746 (= e!109205 e!109206)))

(declare-fun res!133343 () Bool)

(assert (=> b!159746 (=> (not res!133343) (not e!109206))))

(assert (=> b!159746 (= res!133343 (= (select (arr!4367 lt!252047) #b00000000000000000000000000000000) (select (arr!4367 (array!7614 (store (arr!4367 lt!252047) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 lt!252047))) #b00000000000000000000000000000000)))))

(declare-fun b!159747 () Bool)

(assert (=> b!159747 (= e!109206 (arrayRangesEq!497 lt!252047 (array!7614 (store (arr!4367 lt!252047) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 lt!252047)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (= (and d!53791 (not res!133342)) b!159746))

(assert (= (and b!159746 res!133343) b!159747))

(assert (=> b!159746 m!251869))

(declare-fun m!251981 () Bool)

(assert (=> b!159746 m!251981))

(declare-fun m!251983 () Bool)

(assert (=> b!159747 m!251983))

(assert (=> b!159704 d!53791))

(declare-fun d!53795 () Bool)

(declare-fun res!133344 () Bool)

(declare-fun e!109207 () Bool)

(assert (=> d!53795 (=> res!133344 e!109207)))

(assert (=> d!53795 (= res!133344 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (=> d!53795 (= (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))) e!109207)))

(declare-fun b!159748 () Bool)

(declare-fun e!109208 () Bool)

(assert (=> b!159748 (= e!109207 e!109208)))

(declare-fun res!133345 () Bool)

(assert (=> b!159748 (=> (not res!133345) (not e!109208))))

(assert (=> b!159748 (= res!133345 (= (select (arr!4367 (buf!3904 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4367 (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!159749 () Bool)

(assert (=> b!159749 (= e!109208 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (= (and d!53795 (not res!133344)) b!159748))

(assert (= (and b!159748 res!133345) b!159749))

(assert (=> b!159748 m!251965))

(declare-fun m!251987 () Bool)

(assert (=> b!159748 m!251987))

(declare-fun m!251989 () Bool)

(assert (=> b!159749 m!251989))

(assert (=> b!159707 d!53795))

(declare-fun d!53799 () Bool)

(assert (=> d!53799 (= (invariant!0 (currentBit!7136 thiss!1602) (currentByte!7141 thiss!1602) (size!3446 (buf!3904 thiss!1602))) (and (bvsge (currentBit!7136 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7136 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7141 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7141 thiss!1602) (size!3446 (buf!3904 thiss!1602))) (and (= (currentBit!7136 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7141 thiss!1602) (size!3446 (buf!3904 thiss!1602)))))))))

(assert (=> d!53739 d!53799))

(declare-fun d!53801 () Bool)

(declare-fun res!133346 () Bool)

(declare-fun e!109209 () Bool)

(assert (=> d!53801 (=> res!133346 e!109209)))

(assert (=> d!53801 (= res!133346 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (=> d!53801 (= (arrayRangesEq!497 lt!252047 (array!7614 (store (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))) e!109209)))

(declare-fun b!159750 () Bool)

(declare-fun e!109210 () Bool)

(assert (=> b!159750 (= e!109209 e!109210)))

(declare-fun res!133347 () Bool)

(assert (=> b!159750 (=> (not res!133347) (not e!109210))))

(assert (=> b!159750 (= res!133347 (= (select (arr!4367 lt!252047) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4367 (array!7614 (store (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!159751 () Bool)

(assert (=> b!159751 (= e!109210 (arrayRangesEq!497 lt!252047 (array!7614 (store (store (store (arr!4367 (buf!3904 thiss!1602)) (currentByte!7141 thiss!1602) lt!252048) (currentByte!7141 thiss!1602) lt!252055) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 (buf!3904 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7141 (_3!514 lt!252043))))))

(assert (= (and d!53801 (not res!133346)) b!159750))

(assert (= (and b!159750 res!133347) b!159751))

(assert (=> b!159750 m!251971))

(declare-fun m!251991 () Bool)

(assert (=> b!159750 m!251991))

(declare-fun m!251993 () Bool)

(assert (=> b!159751 m!251993))

(assert (=> b!159699 d!53801))

(declare-fun d!53803 () Bool)

(assert (=> d!53803 (arrayRangesEq!497 lt!252047 (array!7614 (store (arr!4367 lt!252047) (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) (size!3446 lt!252047)) #b00000000000000000000000000000000 (currentByte!7141 (_3!514 lt!252043)))))

(assert (=> d!53803 true))

(declare-fun _$8!106 () Unit!10877)

(assert (=> d!53803 (= (choose!137 lt!252047 (currentByte!7141 (_3!514 lt!252043)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (currentByte!7141 (_3!514 lt!252043)))) _$8!106)))

(declare-fun bs!13331 () Bool)

(assert (= bs!13331 d!53803))

(assert (=> bs!13331 m!251883))

(assert (=> bs!13331 m!251885))

(assert (=> d!53717 d!53803))

(assert (=> b!159705 d!53721))

(declare-fun d!53805 () Bool)

(declare-fun res!133348 () Bool)

(declare-fun e!109211 () Bool)

(assert (=> d!53805 (=> res!133348 e!109211)))

(assert (=> d!53805 (= res!133348 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 thiss!1602)))))

(assert (=> d!53805 (= (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7141 thiss!1602)) e!109211)))

(declare-fun b!159752 () Bool)

(declare-fun e!109212 () Bool)

(assert (=> b!159752 (= e!109211 e!109212)))

(declare-fun res!133349 () Bool)

(assert (=> b!159752 (=> (not res!133349) (not e!109212))))

(assert (=> b!159752 (= res!133349 (= (select (arr!4367 (buf!3904 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!159753 () Bool)

(assert (=> b!159753 (= e!109212 (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7141 thiss!1602)))))

(assert (= (and d!53805 (not res!133348)) b!159752))

(assert (= (and b!159752 res!133349) b!159753))

(assert (=> b!159752 m!251965))

(declare-fun m!251995 () Bool)

(assert (=> b!159752 m!251995))

(declare-fun m!251997 () Bool)

(assert (=> b!159753 m!251997))

(assert (=> b!159714 d!53805))

(declare-fun d!53807 () Bool)

(assert (=> d!53807 (arrayRangesEq!497 (buf!3904 thiss!1602) (array!7614 (store (arr!4367 (buf!3904 thiss!1602)) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) (size!3446 (buf!3904 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001))))

(assert (=> d!53807 true))

(declare-fun _$8!107 () Unit!10877)

(assert (=> d!53807 (= (choose!137 (buf!3904 thiss!1602) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001) lt!252056) _$8!107)))

(declare-fun bs!13332 () Bool)

(assert (= bs!13332 d!53807))

(assert (=> bs!13332 m!251787))

(assert (=> bs!13332 m!251769))

(assert (=> d!53729 d!53807))

(assert (=> b!159712 d!53727))

(declare-fun d!53809 () Bool)

(declare-fun res!133350 () Bool)

(declare-fun e!109213 () Bool)

(assert (=> d!53809 (=> res!133350 e!109213)))

(assert (=> d!53809 (= res!133350 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (=> d!53809 (= (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)) e!109213)))

(declare-fun b!159754 () Bool)

(declare-fun e!109214 () Bool)

(assert (=> b!159754 (= e!109213 e!109214)))

(declare-fun res!133351 () Bool)

(assert (=> b!159754 (=> (not res!133351) (not e!109214))))

(assert (=> b!159754 (= res!133351 (= (select (arr!4367 (buf!3904 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4367 (buf!3904 (_3!514 lt!252043))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!159755 () Bool)

(assert (=> b!159755 (= e!109214 (arrayRangesEq!497 (buf!3904 thiss!1602) (buf!3904 (_3!514 lt!252043)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7141 (_3!514 lt!252043)) #b00000000000000000000000000000001)))))

(assert (= (and d!53809 (not res!133350)) b!159754))

(assert (= (and b!159754 res!133351) b!159755))

(assert (=> b!159754 m!251965))

(assert (=> b!159754 m!251995))

(declare-fun m!251999 () Bool)

(assert (=> b!159755 m!251999))

(assert (=> b!159701 d!53809))

(check-sat (not b!159749) (not b!159743) (not d!53803) (not d!53779) (not d!53783) (not b!159747) (not b!159751) (not d!53807) (not b!159745) (not b!159755) (not b!159753))
(check-sat)

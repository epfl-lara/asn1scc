; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32160 () Bool)

(assert start!32160)

(declare-fun b!159224 () Bool)

(declare-fun e!108660 () Bool)

(declare-fun e!108659 () Bool)

(assert (=> b!159224 (= e!108660 (not e!108659))))

(declare-fun res!132896 () Bool)

(assert (=> b!159224 (=> res!132896 e!108659)))

(declare-datatypes ((array!7565 0))(
  ( (array!7566 (arr!4349 (Array (_ BitVec 32) (_ BitVec 8))) (size!3428 (_ BitVec 32))) )
))
(declare-fun lt!251330 () array!7565)

(declare-datatypes ((BitStream!6024 0))(
  ( (BitStream!6025 (buf!3886 array!7565) (currentByte!7111 (_ BitVec 32)) (currentBit!7106 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10803 0))(
  ( (Unit!10804) )
))
(declare-datatypes ((tuple3!758 0))(
  ( (tuple3!759 (_1!7727 Unit!10803) (_2!7727 (_ BitVec 8)) (_3!496 BitStream!6024)) )
))
(declare-fun lt!251322 () tuple3!758)

(declare-fun thiss!1602 () BitStream!6024)

(declare-fun arrayRangesEq!479 (array!7565 array!7565 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159224 (= res!132896 (not (arrayRangesEq!479 (buf!3886 thiss!1602) lt!251330 #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001))))))

(declare-fun lt!251320 () (_ BitVec 8))

(assert (=> b!159224 (arrayRangesEq!479 (buf!3886 thiss!1602) (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) lt!251320) (size!3428 (buf!3886 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001))))

(declare-fun lt!251327 () Unit!10803)

(declare-fun arrayUpdatedAtPrefixLemma!87 (array!7565 (_ BitVec 32) (_ BitVec 8)) Unit!10803)

(assert (=> b!159224 (= lt!251327 (arrayUpdatedAtPrefixLemma!87 (buf!3886 thiss!1602) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) lt!251320))))

(assert (=> b!159224 (= lt!251320 (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251328 () (_ BitVec 8))

(declare-fun lt!251319 () (_ BitVec 8))

(declare-fun lt!251329 () (_ BitVec 32))

(declare-fun lt!251326 () (_ BitVec 32))

(declare-fun lt!251331 () (_ BitVec 32))

(declare-fun lt!251321 () (_ BitVec 8))

(declare-fun Unit!10805 () Unit!10803)

(declare-fun Unit!10806 () Unit!10803)

(assert (=> b!159224 (= lt!251322 (ite (bvsgt lt!251331 #b00000000000000000000000000000000) (let ((bdg!9335 ((_ extract 7 0) (bvnot lt!251329)))) (let ((bdg!9336 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 thiss!1602) lt!251321) (currentByte!7111 thiss!1602) lt!251328) (bvadd #b00000000000000000000000000000001 (currentByte!7111 thiss!1602)))) ((_ sign_extend 24) bdg!9335))))) (tuple3!759 Unit!10805 bdg!9335 (BitStream!6025 (array!7566 (store (arr!4349 (array!7566 (store (arr!4349 lt!251330) (bvadd #b00000000000000000000000000000001 (currentByte!7111 thiss!1602)) bdg!9336) (size!3428 lt!251330))) (bvadd #b00000000000000000000000000000001 (currentByte!7111 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9336) (bvshl ((_ sign_extend 24) v!222) lt!251326)))) (size!3428 (array!7566 (store (arr!4349 lt!251330) (bvadd #b00000000000000000000000000000001 (currentByte!7111 thiss!1602)) bdg!9336) (size!3428 lt!251330)))) (bvadd #b00000000000000000000000000000001 (currentByte!7111 thiss!1602)) (currentBit!7106 thiss!1602))))) (tuple3!759 Unit!10806 lt!251319 (BitStream!6025 lt!251330 (bvadd #b00000000000000000000000000000001 (currentByte!7111 thiss!1602)) (currentBit!7106 thiss!1602)))))))

(declare-fun e!108657 () Bool)

(assert (=> b!159224 e!108657))

(declare-fun res!132899 () Bool)

(assert (=> b!159224 (=> res!132899 e!108657)))

(assert (=> b!159224 (= res!132899 (bvsge (currentByte!7111 thiss!1602) (size!3428 (buf!3886 thiss!1602))))))

(assert (=> b!159224 (= lt!251330 (array!7566 (store (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 thiss!1602) lt!251321) (currentByte!7111 thiss!1602) lt!251328) (size!3428 (buf!3886 thiss!1602))))))

(assert (=> b!159224 (= lt!251328 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251321) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251331))))))

(assert (=> b!159224 (= lt!251321 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 thiss!1602))) lt!251329)))))

(assert (=> b!159224 (= lt!251329 ((_ sign_extend 24) lt!251319))))

(assert (=> b!159224 (= lt!251319 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251326)))))))

(assert (=> b!159224 (= lt!251326 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251331))))))

(assert (=> b!159224 (= lt!251331 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7106 thiss!1602))))))

(declare-fun res!132898 () Bool)

(assert (=> start!32160 (=> (not res!132898) (not e!108660))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32160 (= res!132898 (validate_offset_byte!0 ((_ sign_extend 32) (size!3428 (buf!3886 thiss!1602))) ((_ sign_extend 32) (currentByte!7111 thiss!1602)) ((_ sign_extend 32) (currentBit!7106 thiss!1602))))))

(assert (=> start!32160 e!108660))

(declare-fun e!108658 () Bool)

(declare-fun inv!12 (BitStream!6024) Bool)

(assert (=> start!32160 (and (inv!12 thiss!1602) e!108658)))

(assert (=> start!32160 true))

(declare-fun b!159225 () Bool)

(assert (=> b!159225 (= e!108659 (bvsle #b00000000000000000000000000000000 (currentByte!7111 thiss!1602)))))

(assert (=> b!159225 (arrayRangesEq!479 (buf!3886 thiss!1602) (buf!3886 (_3!496 lt!251322)) #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001))))

(declare-fun lt!251324 () Unit!10803)

(declare-fun arrayRangesEqTransitive!122 (array!7565 array!7565 array!7565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10803)

(assert (=> b!159225 (= lt!251324 (arrayRangesEqTransitive!122 (buf!3886 thiss!1602) lt!251330 (buf!3886 (_3!496 lt!251322)) #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) (currentByte!7111 (_3!496 lt!251322))))))

(assert (=> b!159225 (arrayRangesEq!479 lt!251330 (array!7566 (store (store (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 thiss!1602) lt!251321) (currentByte!7111 thiss!1602) lt!251328) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322)))))

(declare-fun lt!251325 () Unit!10803)

(assert (=> b!159225 (= lt!251325 (arrayUpdatedAtPrefixLemma!87 lt!251330 (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))))))

(assert (=> b!159225 (arrayRangesEq!479 (buf!3886 thiss!1602) (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322)))))

(declare-fun lt!251323 () Unit!10803)

(assert (=> b!159225 (= lt!251323 (arrayUpdatedAtPrefixLemma!87 (buf!3886 thiss!1602) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))))))

(declare-fun b!159226 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159226 (= e!108657 (byteRangesEq!0 (select (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 thiss!1602)) lt!251328 #b00000000000000000000000000000000 (currentBit!7106 thiss!1602)))))

(declare-fun b!159227 () Bool)

(declare-fun array_inv!3175 (array!7565) Bool)

(assert (=> b!159227 (= e!108658 (array_inv!3175 (buf!3886 thiss!1602)))))

(declare-fun b!159228 () Bool)

(declare-fun res!132897 () Bool)

(assert (=> b!159228 (=> res!132897 e!108659)))

(assert (=> b!159228 (= res!132897 (bvsle lt!251331 #b00000000000000000000000000000000))))

(assert (= (and start!32160 res!132898) b!159224))

(assert (= (and b!159224 (not res!132899)) b!159226))

(assert (= (and b!159224 (not res!132896)) b!159228))

(assert (= (and b!159228 (not res!132897)) b!159225))

(assert (= start!32160 b!159227))

(declare-fun m!250647 () Bool)

(assert (=> b!159226 m!250647))

(assert (=> b!159226 m!250647))

(declare-fun m!250649 () Bool)

(assert (=> b!159226 m!250649))

(declare-fun m!250651 () Bool)

(assert (=> b!159225 m!250651))

(declare-fun m!250653 () Bool)

(assert (=> b!159225 m!250653))

(assert (=> b!159225 m!250651))

(declare-fun m!250655 () Bool)

(assert (=> b!159225 m!250655))

(declare-fun m!250657 () Bool)

(assert (=> b!159225 m!250657))

(declare-fun m!250659 () Bool)

(assert (=> b!159225 m!250659))

(declare-fun m!250661 () Bool)

(assert (=> b!159225 m!250661))

(assert (=> b!159225 m!250651))

(declare-fun m!250663 () Bool)

(assert (=> b!159225 m!250663))

(declare-fun m!250665 () Bool)

(assert (=> b!159225 m!250665))

(declare-fun m!250667 () Bool)

(assert (=> b!159225 m!250667))

(declare-fun m!250669 () Bool)

(assert (=> b!159225 m!250669))

(declare-fun m!250671 () Bool)

(assert (=> b!159225 m!250671))

(declare-fun m!250673 () Bool)

(assert (=> start!32160 m!250673))

(declare-fun m!250675 () Bool)

(assert (=> start!32160 m!250675))

(declare-fun m!250677 () Bool)

(assert (=> b!159224 m!250677))

(declare-fun m!250679 () Bool)

(assert (=> b!159224 m!250679))

(assert (=> b!159224 m!250659))

(declare-fun m!250681 () Bool)

(assert (=> b!159224 m!250681))

(declare-fun m!250683 () Bool)

(assert (=> b!159224 m!250683))

(declare-fun m!250685 () Bool)

(assert (=> b!159224 m!250685))

(assert (=> b!159224 m!250647))

(declare-fun m!250687 () Bool)

(assert (=> b!159224 m!250687))

(declare-fun m!250689 () Bool)

(assert (=> b!159224 m!250689))

(declare-fun m!250691 () Bool)

(assert (=> b!159224 m!250691))

(assert (=> b!159224 m!250667))

(declare-fun m!250693 () Bool)

(assert (=> b!159224 m!250693))

(declare-fun m!250695 () Bool)

(assert (=> b!159227 m!250695))

(check-sat (not b!159225) (not b!159226) (not start!32160) (not b!159227) (not b!159224))
(check-sat)
(get-model)

(declare-fun d!53513 () Bool)

(declare-fun res!132954 () Bool)

(declare-fun e!108718 () Bool)

(assert (=> d!53513 (=> res!132954 e!108718)))

(assert (=> d!53513 (= res!132954 (= #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)))))

(assert (=> d!53513 (= (arrayRangesEq!479 (buf!3886 thiss!1602) lt!251330 #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)) e!108718)))

(declare-fun b!159286 () Bool)

(declare-fun e!108719 () Bool)

(assert (=> b!159286 (= e!108718 e!108719)))

(declare-fun res!132955 () Bool)

(assert (=> b!159286 (=> (not res!132955) (not e!108719))))

(assert (=> b!159286 (= res!132955 (= (select (arr!4349 (buf!3886 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4349 lt!251330) #b00000000000000000000000000000000)))))

(declare-fun b!159287 () Bool)

(assert (=> b!159287 (= e!108719 (arrayRangesEq!479 (buf!3886 thiss!1602) lt!251330 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)))))

(assert (= (and d!53513 (not res!132954)) b!159286))

(assert (= (and b!159286 res!132955) b!159287))

(declare-fun m!250831 () Bool)

(assert (=> b!159286 m!250831))

(declare-fun m!250833 () Bool)

(assert (=> b!159286 m!250833))

(declare-fun m!250835 () Bool)

(assert (=> b!159287 m!250835))

(assert (=> b!159224 d!53513))

(declare-fun d!53515 () Bool)

(declare-fun res!132956 () Bool)

(declare-fun e!108720 () Bool)

(assert (=> d!53515 (=> res!132956 e!108720)))

(assert (=> d!53515 (= res!132956 (= #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)))))

(assert (=> d!53515 (= (arrayRangesEq!479 (buf!3886 thiss!1602) (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) lt!251320) (size!3428 (buf!3886 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)) e!108720)))

(declare-fun b!159288 () Bool)

(declare-fun e!108721 () Bool)

(assert (=> b!159288 (= e!108720 e!108721)))

(declare-fun res!132957 () Bool)

(assert (=> b!159288 (=> (not res!132957) (not e!108721))))

(assert (=> b!159288 (= res!132957 (= (select (arr!4349 (buf!3886 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4349 (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) lt!251320) (size!3428 (buf!3886 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159289 () Bool)

(assert (=> b!159289 (= e!108721 (arrayRangesEq!479 (buf!3886 thiss!1602) (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) lt!251320) (size!3428 (buf!3886 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)))))

(assert (= (and d!53515 (not res!132956)) b!159288))

(assert (= (and b!159288 res!132957) b!159289))

(assert (=> b!159288 m!250831))

(declare-fun m!250837 () Bool)

(assert (=> b!159288 m!250837))

(declare-fun m!250839 () Bool)

(assert (=> b!159289 m!250839))

(assert (=> b!159224 d!53515))

(declare-fun d!53517 () Bool)

(declare-fun e!108724 () Bool)

(assert (=> d!53517 e!108724))

(declare-fun res!132960 () Bool)

(assert (=> d!53517 (=> (not res!132960) (not e!108724))))

(assert (=> d!53517 (= res!132960 (and (bvsge (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) (size!3428 (buf!3886 thiss!1602)))))))

(declare-fun lt!251389 () Unit!10803)

(declare-fun choose!125 (array!7565 (_ BitVec 32) (_ BitVec 8)) Unit!10803)

(assert (=> d!53517 (= lt!251389 (choose!125 (buf!3886 thiss!1602) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) lt!251320))))

(assert (=> d!53517 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) (size!3428 (buf!3886 thiss!1602))))))

(assert (=> d!53517 (= (arrayUpdatedAtPrefixLemma!87 (buf!3886 thiss!1602) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) lt!251320) lt!251389)))

(declare-fun b!159292 () Bool)

(assert (=> b!159292 (= e!108724 (arrayRangesEq!479 (buf!3886 thiss!1602) (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) lt!251320) (size!3428 (buf!3886 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)))))

(assert (= (and d!53517 res!132960) b!159292))

(declare-fun m!250841 () Bool)

(assert (=> d!53517 m!250841))

(assert (=> b!159292 m!250681))

(assert (=> b!159292 m!250683))

(assert (=> b!159224 d!53517))

(declare-fun d!53519 () Bool)

(declare-fun e!108725 () Bool)

(assert (=> d!53519 e!108725))

(declare-fun res!132961 () Bool)

(assert (=> d!53519 (=> (not res!132961) (not e!108725))))

(assert (=> d!53519 (= res!132961 (and (bvsge (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000000) (bvslt (currentByte!7111 (_3!496 lt!251322)) (size!3428 (buf!3886 thiss!1602)))))))

(declare-fun lt!251390 () Unit!10803)

(assert (=> d!53519 (= lt!251390 (choose!125 (buf!3886 thiss!1602) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))))))

(assert (=> d!53519 (and (bvsle #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322))) (bvslt (currentByte!7111 (_3!496 lt!251322)) (size!3428 (buf!3886 thiss!1602))))))

(assert (=> d!53519 (= (arrayUpdatedAtPrefixLemma!87 (buf!3886 thiss!1602) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) lt!251390)))

(declare-fun b!159293 () Bool)

(assert (=> b!159293 (= e!108725 (arrayRangesEq!479 (buf!3886 thiss!1602) (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322))))))

(assert (= (and d!53519 res!132961) b!159293))

(assert (=> d!53519 m!250651))

(declare-fun m!250843 () Bool)

(assert (=> d!53519 m!250843))

(assert (=> b!159293 m!250671))

(assert (=> b!159293 m!250669))

(assert (=> b!159225 d!53519))

(declare-fun d!53521 () Bool)

(assert (=> d!53521 (arrayRangesEq!479 (buf!3886 thiss!1602) (buf!3886 (_3!496 lt!251322)) #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001))))

(declare-fun lt!251393 () Unit!10803)

(declare-fun choose!126 (array!7565 array!7565 array!7565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10803)

(assert (=> d!53521 (= lt!251393 (choose!126 (buf!3886 thiss!1602) lt!251330 (buf!3886 (_3!496 lt!251322)) #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) (currentByte!7111 (_3!496 lt!251322))))))

(assert (=> d!53521 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) (currentByte!7111 (_3!496 lt!251322))))))

(assert (=> d!53521 (= (arrayRangesEqTransitive!122 (buf!3886 thiss!1602) lt!251330 (buf!3886 (_3!496 lt!251322)) #b00000000000000000000000000000000 (bvsub (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000001) (currentByte!7111 (_3!496 lt!251322))) lt!251393)))

(declare-fun bs!13266 () Bool)

(assert (= bs!13266 d!53521))

(assert (=> bs!13266 m!250665))

(declare-fun m!250845 () Bool)

(assert (=> bs!13266 m!250845))

(assert (=> b!159225 d!53521))

(declare-fun d!53523 () Bool)

(declare-fun res!132962 () Bool)

(declare-fun e!108726 () Bool)

(assert (=> d!53523 (=> res!132962 e!108726)))

(assert (=> d!53523 (= res!132962 (= #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322))))))

(assert (=> d!53523 (= (arrayRangesEq!479 lt!251330 (array!7566 (store (store (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 thiss!1602) lt!251321) (currentByte!7111 thiss!1602) lt!251328) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322))) e!108726)))

(declare-fun b!159294 () Bool)

(declare-fun e!108727 () Bool)

(assert (=> b!159294 (= e!108726 e!108727)))

(declare-fun res!132963 () Bool)

(assert (=> b!159294 (=> (not res!132963) (not e!108727))))

(assert (=> b!159294 (= res!132963 (= (select (arr!4349 lt!251330) #b00000000000000000000000000000000) (select (arr!4349 (array!7566 (store (store (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 thiss!1602) lt!251321) (currentByte!7111 thiss!1602) lt!251328) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159295 () Bool)

(assert (=> b!159295 (= e!108727 (arrayRangesEq!479 lt!251330 (array!7566 (store (store (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 thiss!1602) lt!251321) (currentByte!7111 thiss!1602) lt!251328) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7111 (_3!496 lt!251322))))))

(assert (= (and d!53523 (not res!132962)) b!159294))

(assert (= (and b!159294 res!132963) b!159295))

(assert (=> b!159294 m!250833))

(declare-fun m!250847 () Bool)

(assert (=> b!159294 m!250847))

(declare-fun m!250849 () Bool)

(assert (=> b!159295 m!250849))

(assert (=> b!159225 d!53523))

(declare-fun d!53525 () Bool)

(declare-fun e!108728 () Bool)

(assert (=> d!53525 e!108728))

(declare-fun res!132964 () Bool)

(assert (=> d!53525 (=> (not res!132964) (not e!108728))))

(assert (=> d!53525 (= res!132964 (and (bvsge (currentByte!7111 (_3!496 lt!251322)) #b00000000000000000000000000000000) (bvslt (currentByte!7111 (_3!496 lt!251322)) (size!3428 lt!251330))))))

(declare-fun lt!251394 () Unit!10803)

(assert (=> d!53525 (= lt!251394 (choose!125 lt!251330 (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))))))

(assert (=> d!53525 (and (bvsle #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322))) (bvslt (currentByte!7111 (_3!496 lt!251322)) (size!3428 lt!251330)))))

(assert (=> d!53525 (= (arrayUpdatedAtPrefixLemma!87 lt!251330 (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) lt!251394)))

(declare-fun b!159296 () Bool)

(assert (=> b!159296 (= e!108728 (arrayRangesEq!479 lt!251330 (array!7566 (store (arr!4349 lt!251330) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 lt!251330)) #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322))))))

(assert (= (and d!53525 res!132964) b!159296))

(assert (=> d!53525 m!250651))

(declare-fun m!250851 () Bool)

(assert (=> d!53525 m!250851))

(declare-fun m!250853 () Bool)

(assert (=> b!159296 m!250853))

(declare-fun m!250855 () Bool)

(assert (=> b!159296 m!250855))

(assert (=> b!159225 d!53525))

(declare-fun d!53527 () Bool)

(declare-fun res!132965 () Bool)

(declare-fun e!108729 () Bool)

(assert (=> d!53527 (=> res!132965 e!108729)))

(assert (=> d!53527 (= res!132965 (= #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322))))))

(assert (=> d!53527 (= (arrayRangesEq!479 (buf!3886 thiss!1602) (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7111 (_3!496 lt!251322))) e!108729)))

(declare-fun b!159297 () Bool)

(declare-fun e!108730 () Bool)

(assert (=> b!159297 (= e!108729 e!108730)))

(declare-fun res!132966 () Bool)

(assert (=> b!159297 (=> (not res!132966) (not e!108730))))

(assert (=> b!159297 (= res!132966 (= (select (arr!4349 (buf!3886 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4349 (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159298 () Bool)

(assert (=> b!159298 (= e!108730 (arrayRangesEq!479 (buf!3886 thiss!1602) (array!7566 (store (arr!4349 (buf!3886 thiss!1602)) (currentByte!7111 (_3!496 lt!251322)) (select (arr!4349 (buf!3886 (_3!496 lt!251322))) (currentByte!7111 (_3!496 lt!251322)))) (size!3428 (buf!3886 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7111 (_3!496 lt!251322))))))

(assert (= (and d!53527 (not res!132965)) b!159297))

(assert (= (and b!159297 res!132966) b!159298))

(assert (=> b!159297 m!250831))

(declare-fun m!250857 () Bool)

(assert (=> b!159297 m!250857))

(declare-fun m!250859 () Bool)

(assert (=> b!159298 m!250859))

(assert (=> b!159225 d!53527))

(declare-fun d!53529 () Bool)


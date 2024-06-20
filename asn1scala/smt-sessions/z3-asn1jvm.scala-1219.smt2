; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34580 () Bool)

(assert start!34580)

(declare-fun b!164044 () Bool)

(declare-fun res!136683 () Bool)

(declare-fun e!113314 () Bool)

(assert (=> b!164044 (=> (not res!136683) (not e!113314))))

(declare-datatypes ((array!8195 0))(
  ( (array!8196 (arr!4592 (Array (_ BitVec 32) (_ BitVec 8))) (size!3671 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6498 0))(
  ( (BitStream!6499 (buf!4123 array!8195) (currentByte!7682 (_ BitVec 32)) (currentBit!7677 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6498)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164044 (= res!136683 (validate_offset_bits!1 ((_ sign_extend 32) (size!3671 (buf!4123 thiss!1577))) ((_ sign_extend 32) (currentByte!7682 thiss!1577)) ((_ sign_extend 32) (currentBit!7677 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164046 () Bool)

(declare-fun lt!257487 () (_ BitVec 32))

(assert (=> b!164046 (= e!113314 (not (and (bvsle #b00000000000000000000000000000000 lt!257487) (bvsle lt!257487 #b00000000000000000000000000001000))))))

(declare-fun lt!257485 () array!8195)

(declare-fun arrayRangesEq!605 (array!8195 array!8195 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164046 (arrayRangesEq!605 (buf!4123 thiss!1577) lt!257485 #b00000000000000000000000000000000 (currentByte!7682 thiss!1577))))

(declare-fun lt!257486 () array!8195)

(declare-datatypes ((Unit!11419 0))(
  ( (Unit!11420) )
))
(declare-fun lt!257488 () Unit!11419)

(declare-fun arrayRangesEqTransitive!152 (array!8195 array!8195 array!8195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11419)

(assert (=> b!164046 (= lt!257488 (arrayRangesEqTransitive!152 (buf!4123 thiss!1577) lt!257486 lt!257485 #b00000000000000000000000000000000 (currentByte!7682 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (=> b!164046 (arrayRangesEq!605 lt!257486 lt!257485 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)))))

(declare-fun lt!257482 () (_ BitVec 8))

(declare-fun lt!257481 () Unit!11419)

(declare-fun arrayUpdatedAtPrefixLemma!213 (array!8195 (_ BitVec 32) (_ BitVec 8)) Unit!11419)

(assert (=> b!164046 (= lt!257481 (arrayUpdatedAtPrefixLemma!213 lt!257486 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482))))

(declare-fun lt!257483 () (_ BitVec 8))

(assert (=> b!164046 (arrayRangesEq!605 (buf!4123 thiss!1577) (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7682 thiss!1577))))

(declare-fun lt!257490 () Unit!11419)

(assert (=> b!164046 (= lt!257490 (arrayUpdatedAtPrefixLemma!213 (buf!4123 thiss!1577) (currentByte!7682 thiss!1577) lt!257483))))

(declare-fun lt!257489 () (_ BitVec 32))

(assert (=> b!164046 (= lt!257483 (select (store (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7677 thiss!1577)))))))) (bvlshr (bvand lt!257489 #b00000000000000000000000011111111) lt!257487)))) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) (currentByte!7682 thiss!1577)))))

(assert (=> b!164046 (= lt!257485 (array!8196 (store (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7677 thiss!1577)))))))) (bvlshr (bvand lt!257489 #b00000000000000000000000011111111) lt!257487)))) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) (size!3671 (buf!4123 thiss!1577))))))

(declare-fun lt!257484 () (_ BitVec 32))

(assert (=> b!164046 (= lt!257482 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7677 thiss!1577)))))))) (bvlshr (bvand lt!257489 #b00000000000000000000000011111111) lt!257487)))) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257484))) (bvshl lt!257489 lt!257484))))))

(assert (=> b!164046 (= lt!257484 (bvsub #b00000000000000000000000000001000 lt!257487))))

(assert (=> b!164046 (= lt!257486 (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7677 thiss!1577)))))))) (bvlshr (bvand lt!257489 #b00000000000000000000000011111111) lt!257487)))) (size!3671 (buf!4123 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164046 (= lt!257489 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164046 (= lt!257487 (bvsub (bvadd (currentBit!7677 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164045 () Bool)

(declare-fun res!136681 () Bool)

(assert (=> b!164045 (=> (not res!136681) (not e!113314))))

(assert (=> b!164045 (= res!136681 (bvsgt (bvadd (currentBit!7677 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136682 () Bool)

(assert (=> start!34580 (=> (not res!136682) (not e!113314))))

(assert (=> start!34580 (= res!136682 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34580 e!113314))

(assert (=> start!34580 true))

(declare-fun e!113312 () Bool)

(declare-fun inv!12 (BitStream!6498) Bool)

(assert (=> start!34580 (and (inv!12 thiss!1577) e!113312)))

(declare-fun b!164047 () Bool)

(declare-fun array_inv!3412 (array!8195) Bool)

(assert (=> b!164047 (= e!113312 (array_inv!3412 (buf!4123 thiss!1577)))))

(assert (= (and start!34580 res!136682) b!164044))

(assert (= (and b!164044 res!136683) b!164045))

(assert (= (and b!164045 res!136681) b!164046))

(assert (= start!34580 b!164047))

(declare-fun m!260577 () Bool)

(assert (=> b!164044 m!260577))

(declare-fun m!260579 () Bool)

(assert (=> b!164046 m!260579))

(declare-fun m!260581 () Bool)

(assert (=> b!164046 m!260581))

(declare-fun m!260583 () Bool)

(assert (=> b!164046 m!260583))

(declare-fun m!260585 () Bool)

(assert (=> b!164046 m!260585))

(declare-fun m!260587 () Bool)

(assert (=> b!164046 m!260587))

(declare-fun m!260589 () Bool)

(assert (=> b!164046 m!260589))

(declare-fun m!260591 () Bool)

(assert (=> b!164046 m!260591))

(declare-fun m!260593 () Bool)

(assert (=> b!164046 m!260593))

(declare-fun m!260595 () Bool)

(assert (=> b!164046 m!260595))

(declare-fun m!260597 () Bool)

(assert (=> b!164046 m!260597))

(declare-fun m!260599 () Bool)

(assert (=> b!164046 m!260599))

(declare-fun m!260601 () Bool)

(assert (=> b!164046 m!260601))

(declare-fun m!260603 () Bool)

(assert (=> b!164046 m!260603))

(declare-fun m!260605 () Bool)

(assert (=> b!164046 m!260605))

(declare-fun m!260607 () Bool)

(assert (=> b!164046 m!260607))

(declare-fun m!260609 () Bool)

(assert (=> start!34580 m!260609))

(declare-fun m!260611 () Bool)

(assert (=> b!164047 m!260611))

(check-sat (not b!164047) (not start!34580) (not b!164046) (not b!164044))
(check-sat)
(get-model)

(declare-fun d!56547 () Bool)

(assert (=> d!56547 (= (array_inv!3412 (buf!4123 thiss!1577)) (bvsge (size!3671 (buf!4123 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164047 d!56547))

(declare-fun d!56549 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56549 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7677 thiss!1577) (currentByte!7682 thiss!1577) (size!3671 (buf!4123 thiss!1577))))))

(declare-fun bs!14015 () Bool)

(assert (= bs!14015 d!56549))

(declare-fun m!260649 () Bool)

(assert (=> bs!14015 m!260649))

(assert (=> start!34580 d!56549))

(declare-fun d!56551 () Bool)

(declare-fun res!136697 () Bool)

(declare-fun e!113328 () Bool)

(assert (=> d!56551 (=> res!136697 e!113328)))

(assert (=> d!56551 (= res!136697 (= #b00000000000000000000000000000000 (currentByte!7682 thiss!1577)))))

(assert (=> d!56551 (= (arrayRangesEq!605 (buf!4123 thiss!1577) (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7682 thiss!1577)) e!113328)))

(declare-fun b!164064 () Bool)

(declare-fun e!113329 () Bool)

(assert (=> b!164064 (= e!113328 e!113329)))

(declare-fun res!136698 () Bool)

(assert (=> b!164064 (=> (not res!136698) (not e!113329))))

(assert (=> b!164064 (= res!136698 (= (select (arr!4592 (buf!4123 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4592 (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164065 () Bool)

(assert (=> b!164065 (= e!113329 (arrayRangesEq!605 (buf!4123 thiss!1577) (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7682 thiss!1577)))))

(assert (= (and d!56551 (not res!136697)) b!164064))

(assert (= (and b!164064 res!136698) b!164065))

(declare-fun m!260651 () Bool)

(assert (=> b!164064 m!260651))

(declare-fun m!260653 () Bool)

(assert (=> b!164064 m!260653))

(declare-fun m!260655 () Bool)

(assert (=> b!164065 m!260655))

(assert (=> b!164046 d!56551))

(declare-fun d!56553 () Bool)

(declare-fun res!136699 () Bool)

(declare-fun e!113330 () Bool)

(assert (=> d!56553 (=> res!136699 e!113330)))

(assert (=> d!56553 (= res!136699 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (=> d!56553 (= (arrayRangesEq!605 lt!257486 lt!257485 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))) e!113330)))

(declare-fun b!164066 () Bool)

(declare-fun e!113331 () Bool)

(assert (=> b!164066 (= e!113330 e!113331)))

(declare-fun res!136700 () Bool)

(assert (=> b!164066 (=> (not res!136700) (not e!113331))))

(assert (=> b!164066 (= res!136700 (= (select (arr!4592 lt!257486) #b00000000000000000000000000000000) (select (arr!4592 lt!257485) #b00000000000000000000000000000000)))))

(declare-fun b!164067 () Bool)

(assert (=> b!164067 (= e!113331 (arrayRangesEq!605 lt!257486 lt!257485 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (= (and d!56553 (not res!136699)) b!164066))

(assert (= (and b!164066 res!136700) b!164067))

(declare-fun m!260657 () Bool)

(assert (=> b!164066 m!260657))

(declare-fun m!260659 () Bool)

(assert (=> b!164066 m!260659))

(declare-fun m!260661 () Bool)

(assert (=> b!164067 m!260661))

(assert (=> b!164046 d!56553))

(declare-fun d!56555 () Bool)

(declare-fun res!136701 () Bool)

(declare-fun e!113332 () Bool)

(assert (=> d!56555 (=> res!136701 e!113332)))

(assert (=> d!56555 (= res!136701 (= #b00000000000000000000000000000000 (currentByte!7682 thiss!1577)))))

(assert (=> d!56555 (= (arrayRangesEq!605 (buf!4123 thiss!1577) lt!257485 #b00000000000000000000000000000000 (currentByte!7682 thiss!1577)) e!113332)))

(declare-fun b!164068 () Bool)

(declare-fun e!113333 () Bool)

(assert (=> b!164068 (= e!113332 e!113333)))

(declare-fun res!136702 () Bool)

(assert (=> b!164068 (=> (not res!136702) (not e!113333))))

(assert (=> b!164068 (= res!136702 (= (select (arr!4592 (buf!4123 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4592 lt!257485) #b00000000000000000000000000000000)))))

(declare-fun b!164069 () Bool)

(assert (=> b!164069 (= e!113333 (arrayRangesEq!605 (buf!4123 thiss!1577) lt!257485 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7682 thiss!1577)))))

(assert (= (and d!56555 (not res!136701)) b!164068))

(assert (= (and b!164068 res!136702) b!164069))

(assert (=> b!164068 m!260651))

(assert (=> b!164068 m!260659))

(declare-fun m!260663 () Bool)

(assert (=> b!164069 m!260663))

(assert (=> b!164046 d!56555))

(declare-fun d!56557 () Bool)

(declare-fun e!113336 () Bool)

(assert (=> d!56557 e!113336))

(declare-fun res!136705 () Bool)

(assert (=> d!56557 (=> (not res!136705) (not e!113336))))

(assert (=> d!56557 (= res!136705 (and (bvsge (currentByte!7682 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7682 thiss!1577) (size!3671 (buf!4123 thiss!1577)))))))

(declare-fun lt!257523 () Unit!11419)

(declare-fun choose!195 (array!8195 (_ BitVec 32) (_ BitVec 8)) Unit!11419)

(assert (=> d!56557 (= lt!257523 (choose!195 (buf!4123 thiss!1577) (currentByte!7682 thiss!1577) lt!257483))))

(assert (=> d!56557 (and (bvsle #b00000000000000000000000000000000 (currentByte!7682 thiss!1577)) (bvslt (currentByte!7682 thiss!1577) (size!3671 (buf!4123 thiss!1577))))))

(assert (=> d!56557 (= (arrayUpdatedAtPrefixLemma!213 (buf!4123 thiss!1577) (currentByte!7682 thiss!1577) lt!257483) lt!257523)))

(declare-fun b!164072 () Bool)

(assert (=> b!164072 (= e!113336 (arrayRangesEq!605 (buf!4123 thiss!1577) (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7682 thiss!1577)))))

(assert (= (and d!56557 res!136705) b!164072))

(declare-fun m!260665 () Bool)

(assert (=> d!56557 m!260665))

(assert (=> b!164072 m!260595))

(assert (=> b!164072 m!260587))

(assert (=> b!164046 d!56557))

(declare-fun d!56559 () Bool)

(declare-fun e!113337 () Bool)

(assert (=> d!56559 e!113337))

(declare-fun res!136706 () Bool)

(assert (=> d!56559 (=> (not res!136706) (not e!113337))))

(assert (=> d!56559 (= res!136706 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) (size!3671 lt!257486))))))

(declare-fun lt!257524 () Unit!11419)

(assert (=> d!56559 (= lt!257524 (choose!195 lt!257486 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482))))

(assert (=> d!56559 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) (size!3671 lt!257486)))))

(assert (=> d!56559 (= (arrayUpdatedAtPrefixLemma!213 lt!257486 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) lt!257524)))

(declare-fun b!164073 () Bool)

(assert (=> b!164073 (= e!113337 (arrayRangesEq!605 lt!257486 (array!8196 (store (arr!4592 lt!257486) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) (size!3671 lt!257486)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (= (and d!56559 res!136706) b!164073))

(declare-fun m!260667 () Bool)

(assert (=> d!56559 m!260667))

(declare-fun m!260669 () Bool)

(assert (=> b!164073 m!260669))

(declare-fun m!260671 () Bool)

(assert (=> b!164073 m!260671))

(assert (=> b!164046 d!56559))

(declare-fun d!56561 () Bool)

(assert (=> d!56561 (arrayRangesEq!605 (buf!4123 thiss!1577) lt!257485 #b00000000000000000000000000000000 (currentByte!7682 thiss!1577))))

(declare-fun lt!257527 () Unit!11419)

(declare-fun choose!196 (array!8195 array!8195 array!8195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11419)

(assert (=> d!56561 (= lt!257527 (choose!196 (buf!4123 thiss!1577) lt!257486 lt!257485 #b00000000000000000000000000000000 (currentByte!7682 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (=> d!56561 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7682 thiss!1577)) (bvsle (currentByte!7682 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (=> d!56561 (= (arrayRangesEqTransitive!152 (buf!4123 thiss!1577) lt!257486 lt!257485 #b00000000000000000000000000000000 (currentByte!7682 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))) lt!257527)))

(declare-fun bs!14016 () Bool)

(assert (= bs!14016 d!56561))

(assert (=> bs!14016 m!260585))

(declare-fun m!260673 () Bool)

(assert (=> bs!14016 m!260673))

(assert (=> b!164046 d!56561))

(declare-fun d!56563 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56563 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3671 (buf!4123 thiss!1577))) ((_ sign_extend 32) (currentByte!7682 thiss!1577)) ((_ sign_extend 32) (currentBit!7677 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3671 (buf!4123 thiss!1577))) ((_ sign_extend 32) (currentByte!7682 thiss!1577)) ((_ sign_extend 32) (currentBit!7677 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14017 () Bool)

(assert (= bs!14017 d!56563))

(declare-fun m!260675 () Bool)

(assert (=> bs!14017 m!260675))

(assert (=> b!164044 d!56563))

(check-sat (not b!164067) (not d!56563) (not b!164072) (not b!164073) (not d!56549) (not b!164069) (not d!56559) (not b!164065) (not d!56557) (not d!56561))
(check-sat)
(get-model)

(declare-fun d!56565 () Bool)

(assert (=> d!56565 (arrayRangesEq!605 lt!257486 (array!8196 (store (arr!4592 lt!257486) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) (size!3671 lt!257486)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)))))

(assert (=> d!56565 true))

(declare-fun _$8!169 () Unit!11419)

(assert (=> d!56565 (= (choose!195 lt!257486 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) _$8!169)))

(declare-fun bs!14018 () Bool)

(assert (= bs!14018 d!56565))

(assert (=> bs!14018 m!260669))

(assert (=> bs!14018 m!260671))

(assert (=> d!56559 d!56565))

(declare-fun d!56567 () Bool)

(assert (=> d!56567 (arrayRangesEq!605 (buf!4123 thiss!1577) (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7682 thiss!1577))))

(assert (=> d!56567 true))

(declare-fun _$8!170 () Unit!11419)

(assert (=> d!56567 (= (choose!195 (buf!4123 thiss!1577) (currentByte!7682 thiss!1577) lt!257483) _$8!170)))

(declare-fun bs!14019 () Bool)

(assert (= bs!14019 d!56567))

(assert (=> bs!14019 m!260595))

(assert (=> bs!14019 m!260587))

(assert (=> d!56557 d!56567))

(declare-fun d!56569 () Bool)

(declare-fun res!136707 () Bool)

(declare-fun e!113338 () Bool)

(assert (=> d!56569 (=> res!136707 e!113338)))

(assert (=> d!56569 (= res!136707 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7682 thiss!1577)))))

(assert (=> d!56569 (= (arrayRangesEq!605 (buf!4123 thiss!1577) (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7682 thiss!1577)) e!113338)))

(declare-fun b!164074 () Bool)

(declare-fun e!113339 () Bool)

(assert (=> b!164074 (= e!113338 e!113339)))

(declare-fun res!136708 () Bool)

(assert (=> b!164074 (=> (not res!136708) (not e!113339))))

(assert (=> b!164074 (= res!136708 (= (select (arr!4592 (buf!4123 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4592 (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!164075 () Bool)

(assert (=> b!164075 (= e!113339 (arrayRangesEq!605 (buf!4123 thiss!1577) (array!8196 (store (arr!4592 (buf!4123 thiss!1577)) (currentByte!7682 thiss!1577) lt!257483) (size!3671 (buf!4123 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7682 thiss!1577)))))

(assert (= (and d!56569 (not res!136707)) b!164074))

(assert (= (and b!164074 res!136708) b!164075))

(declare-fun m!260677 () Bool)

(assert (=> b!164074 m!260677))

(declare-fun m!260679 () Bool)

(assert (=> b!164074 m!260679))

(declare-fun m!260681 () Bool)

(assert (=> b!164075 m!260681))

(assert (=> b!164065 d!56569))

(declare-fun d!56571 () Bool)

(assert (=> d!56571 (= (invariant!0 (currentBit!7677 thiss!1577) (currentByte!7682 thiss!1577) (size!3671 (buf!4123 thiss!1577))) (and (bvsge (currentBit!7677 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7677 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7682 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7682 thiss!1577) (size!3671 (buf!4123 thiss!1577))) (and (= (currentBit!7677 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7682 thiss!1577) (size!3671 (buf!4123 thiss!1577)))))))))

(assert (=> d!56549 d!56571))

(declare-fun d!56573 () Bool)

(declare-fun res!136709 () Bool)

(declare-fun e!113340 () Bool)

(assert (=> d!56573 (=> res!136709 e!113340)))

(assert (=> d!56573 (= res!136709 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (=> d!56573 (= (arrayRangesEq!605 lt!257486 (array!8196 (store (arr!4592 lt!257486) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) (size!3671 lt!257486)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))) e!113340)))

(declare-fun b!164076 () Bool)

(declare-fun e!113341 () Bool)

(assert (=> b!164076 (= e!113340 e!113341)))

(declare-fun res!136710 () Bool)

(assert (=> b!164076 (=> (not res!136710) (not e!113341))))

(assert (=> b!164076 (= res!136710 (= (select (arr!4592 lt!257486) #b00000000000000000000000000000000) (select (arr!4592 (array!8196 (store (arr!4592 lt!257486) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) (size!3671 lt!257486))) #b00000000000000000000000000000000)))))

(declare-fun b!164077 () Bool)

(assert (=> b!164077 (= e!113341 (arrayRangesEq!605 lt!257486 (array!8196 (store (arr!4592 lt!257486) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577)) lt!257482) (size!3671 lt!257486)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (= (and d!56573 (not res!136709)) b!164076))

(assert (= (and b!164076 res!136710) b!164077))

(assert (=> b!164076 m!260657))

(declare-fun m!260683 () Bool)

(assert (=> b!164076 m!260683))

(declare-fun m!260685 () Bool)

(assert (=> b!164077 m!260685))

(assert (=> b!164073 d!56573))

(declare-fun d!56575 () Bool)

(declare-fun res!136711 () Bool)

(declare-fun e!113342 () Bool)

(assert (=> d!56575 (=> res!136711 e!113342)))

(assert (=> d!56575 (= res!136711 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (=> d!56575 (= (arrayRangesEq!605 lt!257486 lt!257485 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))) e!113342)))

(declare-fun b!164078 () Bool)

(declare-fun e!113343 () Bool)

(assert (=> b!164078 (= e!113342 e!113343)))

(declare-fun res!136712 () Bool)

(assert (=> b!164078 (=> (not res!136712) (not e!113343))))

(assert (=> b!164078 (= res!136712 (= (select (arr!4592 lt!257486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4592 lt!257485) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!164079 () Bool)

(assert (=> b!164079 (= e!113343 (arrayRangesEq!605 lt!257486 lt!257485 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))))))

(assert (= (and d!56575 (not res!136711)) b!164078))

(assert (= (and b!164078 res!136712) b!164079))

(declare-fun m!260687 () Bool)

(assert (=> b!164078 m!260687))

(declare-fun m!260689 () Bool)

(assert (=> b!164078 m!260689))

(declare-fun m!260691 () Bool)

(assert (=> b!164079 m!260691))

(assert (=> b!164067 d!56575))

(assert (=> b!164072 d!56551))

(assert (=> d!56561 d!56555))

(declare-fun d!56577 () Bool)

(assert (=> d!56577 (arrayRangesEq!605 (buf!4123 thiss!1577) lt!257485 #b00000000000000000000000000000000 (currentByte!7682 thiss!1577))))

(assert (=> d!56577 true))

(declare-fun _$16!71 () Unit!11419)

(assert (=> d!56577 (= (choose!196 (buf!4123 thiss!1577) lt!257486 lt!257485 #b00000000000000000000000000000000 (currentByte!7682 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7682 thiss!1577))) _$16!71)))

(declare-fun bs!14020 () Bool)

(assert (= bs!14020 d!56577))

(assert (=> bs!14020 m!260585))

(assert (=> d!56561 d!56577))

(declare-fun d!56579 () Bool)

(assert (=> d!56579 (= (remainingBits!0 ((_ sign_extend 32) (size!3671 (buf!4123 thiss!1577))) ((_ sign_extend 32) (currentByte!7682 thiss!1577)) ((_ sign_extend 32) (currentBit!7677 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3671 (buf!4123 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7682 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7677 thiss!1577)))))))

(assert (=> d!56563 d!56579))

(declare-fun d!56581 () Bool)

(declare-fun res!136713 () Bool)

(declare-fun e!113344 () Bool)

(assert (=> d!56581 (=> res!136713 e!113344)))

(assert (=> d!56581 (= res!136713 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7682 thiss!1577)))))

(assert (=> d!56581 (= (arrayRangesEq!605 (buf!4123 thiss!1577) lt!257485 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7682 thiss!1577)) e!113344)))

(declare-fun b!164080 () Bool)

(declare-fun e!113345 () Bool)

(assert (=> b!164080 (= e!113344 e!113345)))

(declare-fun res!136714 () Bool)

(assert (=> b!164080 (=> (not res!136714) (not e!113345))))

(assert (=> b!164080 (= res!136714 (= (select (arr!4592 (buf!4123 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4592 lt!257485) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!164081 () Bool)

(assert (=> b!164081 (= e!113345 (arrayRangesEq!605 (buf!4123 thiss!1577) lt!257485 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7682 thiss!1577)))))

(assert (= (and d!56581 (not res!136713)) b!164080))

(assert (= (and b!164080 res!136714) b!164081))

(assert (=> b!164080 m!260677))

(assert (=> b!164080 m!260689))

(declare-fun m!260693 () Bool)

(assert (=> b!164081 m!260693))

(assert (=> b!164069 d!56581))

(check-sat (not b!164081) (not d!56577) (not d!56567) (not b!164075) (not d!56565) (not b!164079) (not b!164077))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32088 () Bool)

(assert start!32088)

(declare-fun res!132617 () Bool)

(declare-fun e!108294 () Bool)

(assert (=> start!32088 (=> (not res!132617) (not e!108294))))

(declare-datatypes ((array!7514 0))(
  ( (array!7515 (arr!4325 (Array (_ BitVec 32) (_ BitVec 8))) (size!3404 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5976 0))(
  ( (BitStream!5977 (buf!3862 array!7514) (currentByte!7086 (_ BitVec 32)) (currentBit!7081 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5976)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32088 (= res!132617 (validate_offset_byte!0 ((_ sign_extend 32) (size!3404 (buf!3862 thiss!1602))) ((_ sign_extend 32) (currentByte!7086 thiss!1602)) ((_ sign_extend 32) (currentBit!7081 thiss!1602))))))

(assert (=> start!32088 e!108294))

(declare-fun e!108291 () Bool)

(declare-fun inv!12 (BitStream!5976) Bool)

(assert (=> start!32088 (and (inv!12 thiss!1602) e!108291)))

(assert (=> start!32088 true))

(declare-fun b!158872 () Bool)

(declare-datatypes ((Unit!10707 0))(
  ( (Unit!10708) )
))
(declare-datatypes ((tuple3!710 0))(
  ( (tuple3!711 (_1!7703 Unit!10707) (_2!7703 (_ BitVec 8)) (_3!472 BitStream!5976)) )
))
(declare-fun lt!250480 () tuple3!710)

(assert (=> b!158872 (= e!108294 (not (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) (size!3404 (buf!3862 thiss!1602))))))))

(declare-fun lt!250483 () (_ BitVec 8))

(declare-fun arrayRangesEq!455 (array!7514 array!7514 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158872 (arrayRangesEq!455 (buf!3862 thiss!1602) (array!7515 (store (arr!4325 (buf!3862 thiss!1602)) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) lt!250483) (size!3404 (buf!3862 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001))))

(declare-fun lt!250481 () Unit!10707)

(declare-fun arrayUpdatedAtPrefixLemma!63 (array!7514 (_ BitVec 32) (_ BitVec 8)) Unit!10707)

(assert (=> b!158872 (= lt!250481 (arrayUpdatedAtPrefixLemma!63 (buf!3862 thiss!1602) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) lt!250483))))

(assert (=> b!158872 (= lt!250483 (select (arr!4325 (buf!3862 (_3!472 lt!250480))) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001)))))

(declare-fun lt!250479 () (_ BitVec 32))

(declare-fun lt!250487 () (_ BitVec 32))

(declare-fun lt!250486 () (_ BitVec 32))

(declare-fun lt!250488 () array!7514)

(declare-fun lt!250484 () (_ BitVec 8))

(declare-fun lt!250485 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250482 () (_ BitVec 8))

(declare-fun Unit!10709 () Unit!10707)

(declare-fun Unit!10710 () Unit!10707)

(assert (=> b!158872 (= lt!250480 (ite (bvsgt lt!250479 #b00000000000000000000000000000000) (let ((bdg!9228 ((_ extract 7 0) (bvnot lt!250486)))) (let ((bdg!9229 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4325 (buf!3862 thiss!1602)) (currentByte!7086 thiss!1602) lt!250485) (currentByte!7086 thiss!1602) lt!250484) (bvadd #b00000000000000000000000000000001 (currentByte!7086 thiss!1602)))) ((_ sign_extend 24) bdg!9228))))) (tuple3!711 Unit!10709 bdg!9228 (BitStream!5977 (array!7515 (store (arr!4325 (array!7515 (store (arr!4325 lt!250488) (bvadd #b00000000000000000000000000000001 (currentByte!7086 thiss!1602)) bdg!9229) (size!3404 lt!250488))) (bvadd #b00000000000000000000000000000001 (currentByte!7086 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9229) (bvshl ((_ sign_extend 24) v!222) lt!250487)))) (size!3404 (array!7515 (store (arr!4325 lt!250488) (bvadd #b00000000000000000000000000000001 (currentByte!7086 thiss!1602)) bdg!9229) (size!3404 lt!250488)))) (bvadd #b00000000000000000000000000000001 (currentByte!7086 thiss!1602)) (currentBit!7081 thiss!1602))))) (tuple3!711 Unit!10710 lt!250482 (BitStream!5977 lt!250488 (bvadd #b00000000000000000000000000000001 (currentByte!7086 thiss!1602)) (currentBit!7081 thiss!1602)))))))

(declare-fun e!108293 () Bool)

(assert (=> b!158872 e!108293))

(declare-fun res!132616 () Bool)

(assert (=> b!158872 (=> res!132616 e!108293)))

(assert (=> b!158872 (= res!132616 (bvsge (currentByte!7086 thiss!1602) (size!3404 (buf!3862 thiss!1602))))))

(assert (=> b!158872 (= lt!250488 (array!7515 (store (store (arr!4325 (buf!3862 thiss!1602)) (currentByte!7086 thiss!1602) lt!250485) (currentByte!7086 thiss!1602) lt!250484) (size!3404 (buf!3862 thiss!1602))))))

(assert (=> b!158872 (= lt!250484 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250485) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250479))))))

(assert (=> b!158872 (= lt!250485 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4325 (buf!3862 thiss!1602)) (currentByte!7086 thiss!1602))) lt!250486)))))

(assert (=> b!158872 (= lt!250486 ((_ sign_extend 24) lt!250482))))

(assert (=> b!158872 (= lt!250482 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250487)))))))

(assert (=> b!158872 (= lt!250487 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250479))))))

(assert (=> b!158872 (= lt!250479 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7081 thiss!1602))))))

(declare-fun b!158873 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158873 (= e!108293 (byteRangesEq!0 (select (arr!4325 (buf!3862 thiss!1602)) (currentByte!7086 thiss!1602)) lt!250484 #b00000000000000000000000000000000 (currentBit!7081 thiss!1602)))))

(declare-fun b!158874 () Bool)

(declare-fun array_inv!3151 (array!7514) Bool)

(assert (=> b!158874 (= e!108291 (array_inv!3151 (buf!3862 thiss!1602)))))

(assert (= (and start!32088 res!132617) b!158872))

(assert (= (and b!158872 (not res!132616)) b!158873))

(assert (= start!32088 b!158874))

(declare-fun m!249611 () Bool)

(assert (=> start!32088 m!249611))

(declare-fun m!249613 () Bool)

(assert (=> start!32088 m!249613))

(declare-fun m!249615 () Bool)

(assert (=> b!158872 m!249615))

(declare-fun m!249617 () Bool)

(assert (=> b!158872 m!249617))

(declare-fun m!249619 () Bool)

(assert (=> b!158872 m!249619))

(declare-fun m!249621 () Bool)

(assert (=> b!158872 m!249621))

(declare-fun m!249623 () Bool)

(assert (=> b!158872 m!249623))

(declare-fun m!249625 () Bool)

(assert (=> b!158872 m!249625))

(declare-fun m!249627 () Bool)

(assert (=> b!158872 m!249627))

(declare-fun m!249629 () Bool)

(assert (=> b!158872 m!249629))

(declare-fun m!249631 () Bool)

(assert (=> b!158872 m!249631))

(declare-fun m!249633 () Bool)

(assert (=> b!158872 m!249633))

(declare-fun m!249635 () Bool)

(assert (=> b!158872 m!249635))

(assert (=> b!158873 m!249623))

(assert (=> b!158873 m!249623))

(declare-fun m!249637 () Bool)

(assert (=> b!158873 m!249637))

(declare-fun m!249639 () Bool)

(assert (=> b!158874 m!249639))

(check-sat (not b!158872) (not start!32088) (not b!158874) (not b!158873))
(check-sat)
(get-model)

(declare-fun d!53421 () Bool)

(declare-fun res!132628 () Bool)

(declare-fun e!108311 () Bool)

(assert (=> d!53421 (=> res!132628 e!108311)))

(assert (=> d!53421 (= res!132628 (= #b00000000000000000000000000000000 (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001)))))

(assert (=> d!53421 (= (arrayRangesEq!455 (buf!3862 thiss!1602) (array!7515 (store (arr!4325 (buf!3862 thiss!1602)) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) lt!250483) (size!3404 (buf!3862 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001)) e!108311)))

(declare-fun b!158888 () Bool)

(declare-fun e!108312 () Bool)

(assert (=> b!158888 (= e!108311 e!108312)))

(declare-fun res!132629 () Bool)

(assert (=> b!158888 (=> (not res!132629) (not e!108312))))

(assert (=> b!158888 (= res!132629 (= (select (arr!4325 (buf!3862 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4325 (array!7515 (store (arr!4325 (buf!3862 thiss!1602)) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) lt!250483) (size!3404 (buf!3862 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!158889 () Bool)

(assert (=> b!158889 (= e!108312 (arrayRangesEq!455 (buf!3862 thiss!1602) (array!7515 (store (arr!4325 (buf!3862 thiss!1602)) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) lt!250483) (size!3404 (buf!3862 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001)))))

(assert (= (and d!53421 (not res!132628)) b!158888))

(assert (= (and b!158888 res!132629) b!158889))

(declare-fun m!249671 () Bool)

(assert (=> b!158888 m!249671))

(declare-fun m!249673 () Bool)

(assert (=> b!158888 m!249673))

(declare-fun m!249675 () Bool)

(assert (=> b!158889 m!249675))

(assert (=> b!158872 d!53421))

(declare-fun d!53423 () Bool)

(declare-fun e!108315 () Bool)

(assert (=> d!53423 e!108315))

(declare-fun res!132632 () Bool)

(assert (=> d!53423 (=> (not res!132632) (not e!108315))))

(assert (=> d!53423 (= res!132632 (and (bvsge (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) (size!3404 (buf!3862 thiss!1602)))))))

(declare-fun lt!250521 () Unit!10707)

(declare-fun choose!120 (array!7514 (_ BitVec 32) (_ BitVec 8)) Unit!10707)

(assert (=> d!53423 (= lt!250521 (choose!120 (buf!3862 thiss!1602) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) lt!250483))))

(assert (=> d!53423 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) (size!3404 (buf!3862 thiss!1602))))))

(assert (=> d!53423 (= (arrayUpdatedAtPrefixLemma!63 (buf!3862 thiss!1602) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) lt!250483) lt!250521)))

(declare-fun b!158892 () Bool)

(assert (=> b!158892 (= e!108315 (arrayRangesEq!455 (buf!3862 thiss!1602) (array!7515 (store (arr!4325 (buf!3862 thiss!1602)) (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001) lt!250483) (size!3404 (buf!3862 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7086 (_3!472 lt!250480)) #b00000000000000000000000000000001)))))

(assert (= (and d!53423 res!132632) b!158892))

(declare-fun m!249677 () Bool)

(assert (=> d!53423 m!249677))

(assert (=> b!158892 m!249625))

(assert (=> b!158892 m!249629))

(assert (=> b!158872 d!53423))

(declare-fun d!53425 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53425 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3404 (buf!3862 thiss!1602))) ((_ sign_extend 32) (currentByte!7086 thiss!1602)) ((_ sign_extend 32) (currentBit!7081 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3404 (buf!3862 thiss!1602))) ((_ sign_extend 32) (currentByte!7086 thiss!1602)) ((_ sign_extend 32) (currentBit!7081 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13230 () Bool)

(assert (= bs!13230 d!53425))

(declare-fun m!249679 () Bool)

(assert (=> bs!13230 m!249679))

(assert (=> start!32088 d!53425))

(declare-fun d!53427 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53427 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7081 thiss!1602) (currentByte!7086 thiss!1602) (size!3404 (buf!3862 thiss!1602))))))

(declare-fun bs!13231 () Bool)

(assert (= bs!13231 d!53427))

(declare-fun m!249681 () Bool)

(assert (=> bs!13231 m!249681))

(assert (=> start!32088 d!53427))

(declare-fun d!53429 () Bool)

(assert (=> d!53429 (= (array_inv!3151 (buf!3862 thiss!1602)) (bvsge (size!3404 (buf!3862 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158874 d!53429))

(declare-fun d!53431 () Bool)

(assert (=> d!53431 (= (byteRangesEq!0 (select (arr!4325 (buf!3862 thiss!1602)) (currentByte!7086 thiss!1602)) lt!250484 #b00000000000000000000000000000000 (currentBit!7081 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7081 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4325 (buf!3862 thiss!1602)) (currentByte!7086 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7081 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!250484) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7081 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13232 () Bool)

(assert (= bs!13232 d!53431))

(declare-fun m!249683 () Bool)

(assert (=> bs!13232 m!249683))

(declare-fun m!249685 () Bool)

(assert (=> bs!13232 m!249685))

(assert (=> b!158873 d!53431))

(check-sat (not b!158889) (not d!53425) (not d!53423) (not b!158892) (not d!53427))
(check-sat)

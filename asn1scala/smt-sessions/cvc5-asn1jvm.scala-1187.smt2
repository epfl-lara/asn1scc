; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33728 () Bool)

(assert start!33728)

(declare-fun res!134497 () Bool)

(declare-fun e!111072 () Bool)

(assert (=> start!33728 (=> (not res!134497) (not e!111072))))

(declare-datatypes ((array!7965 0))(
  ( (array!7966 (arr!4495 (Array (_ BitVec 32) (_ BitVec 8))) (size!3574 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6316 0))(
  ( (BitStream!6317 (buf!4032 array!7965) (currentByte!7517 (_ BitVec 32)) (currentBit!7512 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6316)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33728 (= res!134497 (validate_offset_byte!0 ((_ sign_extend 32) (size!3574 (buf!4032 thiss!1602))) ((_ sign_extend 32) (currentByte!7517 thiss!1602)) ((_ sign_extend 32) (currentBit!7512 thiss!1602))))))

(assert (=> start!33728 e!111072))

(declare-fun e!111069 () Bool)

(declare-fun inv!12 (BitStream!6316) Bool)

(assert (=> start!33728 (and (inv!12 thiss!1602) e!111069)))

(assert (=> start!33728 true))

(declare-fun b!161351 () Bool)

(declare-fun e!111071 () Bool)

(declare-datatypes ((Unit!11066 0))(
  ( (Unit!11067) )
))
(declare-datatypes ((tuple3!876 0))(
  ( (tuple3!877 (_1!7789 Unit!11066) (_2!7789 (_ BitVec 8)) (_3!555 BitStream!6316)) )
))
(declare-fun lt!254021 () tuple3!876)

(assert (=> b!161351 (= e!111071 (or (= (bvand (currentByte!7517 (_3!555 lt!254021)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7517 (_3!555 lt!254021)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(declare-fun lt!254014 () array!7965)

(declare-fun lt!254013 () (_ BitVec 8))

(declare-fun lt!254017 () (_ BitVec 8))

(declare-fun arrayRangesEq!526 (array!7965 array!7965 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161351 (arrayRangesEq!526 lt!254014 (array!7966 (store (store (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602) lt!254017) (currentByte!7517 thiss!1602) lt!254013) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021)))))

(declare-fun lt!254015 () Unit!11066)

(declare-fun arrayUpdatedAtPrefixLemma!134 (array!7965 (_ BitVec 32) (_ BitVec 8)) Unit!11066)

(assert (=> b!161351 (= lt!254015 (arrayUpdatedAtPrefixLemma!134 lt!254014 (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))))))

(assert (=> b!161351 (arrayRangesEq!526 (buf!4032 thiss!1602) (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021)))))

(declare-fun lt!254020 () Unit!11066)

(assert (=> b!161351 (= lt!254020 (arrayUpdatedAtPrefixLemma!134 (buf!4032 thiss!1602) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))))))

(declare-fun b!161352 () Bool)

(declare-fun res!134498 () Bool)

(assert (=> b!161352 (=> res!134498 e!111071)))

(declare-fun lt!254022 () (_ BitVec 32))

(assert (=> b!161352 (= res!134498 (bvsle lt!254022 #b00000000000000000000000000000000))))

(declare-fun b!161353 () Bool)

(assert (=> b!161353 (= e!111072 (not e!111071))))

(declare-fun res!134495 () Bool)

(assert (=> b!161353 (=> res!134495 e!111071)))

(assert (=> b!161353 (= res!134495 (not (arrayRangesEq!526 (buf!4032 thiss!1602) lt!254014 #b00000000000000000000000000000000 (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001))))))

(declare-fun lt!254016 () (_ BitVec 8))

(assert (=> b!161353 (arrayRangesEq!526 (buf!4032 thiss!1602) (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) lt!254016) (size!3574 (buf!4032 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001))))

(declare-fun lt!254019 () Unit!11066)

(assert (=> b!161353 (= lt!254019 (arrayUpdatedAtPrefixLemma!134 (buf!4032 thiss!1602) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) lt!254016))))

(assert (=> b!161353 (= lt!254016 (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)))))

(declare-fun lt!254012 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254011 () (_ BitVec 32))

(declare-fun lt!254018 () (_ BitVec 32))

(declare-fun Unit!11068 () Unit!11066)

(declare-fun Unit!11069 () Unit!11066)

(assert (=> b!161353 (= lt!254021 (ite (bvsgt lt!254022 #b00000000000000000000000000000000) (let ((bdg!9635 ((_ extract 7 0) (bvnot lt!254011)))) (let ((bdg!9636 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602) lt!254017) (currentByte!7517 thiss!1602) lt!254013) (bvadd #b00000000000000000000000000000001 (currentByte!7517 thiss!1602)))) ((_ sign_extend 24) bdg!9635))))) (tuple3!877 Unit!11068 bdg!9635 (BitStream!6317 (array!7966 (store (arr!4495 (array!7966 (store (arr!4495 lt!254014) (bvadd #b00000000000000000000000000000001 (currentByte!7517 thiss!1602)) bdg!9636) (size!3574 lt!254014))) (bvadd #b00000000000000000000000000000001 (currentByte!7517 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9636) (bvshl ((_ sign_extend 24) v!222) lt!254018)))) (size!3574 (array!7966 (store (arr!4495 lt!254014) (bvadd #b00000000000000000000000000000001 (currentByte!7517 thiss!1602)) bdg!9636) (size!3574 lt!254014)))) (bvadd #b00000000000000000000000000000001 (currentByte!7517 thiss!1602)) (currentBit!7512 thiss!1602))))) (tuple3!877 Unit!11069 lt!254012 (BitStream!6317 lt!254014 (bvadd #b00000000000000000000000000000001 (currentByte!7517 thiss!1602)) (currentBit!7512 thiss!1602)))))))

(declare-fun e!111068 () Bool)

(assert (=> b!161353 e!111068))

(declare-fun res!134496 () Bool)

(assert (=> b!161353 (=> res!134496 e!111068)))

(assert (=> b!161353 (= res!134496 (bvsge (currentByte!7517 thiss!1602) (size!3574 (buf!4032 thiss!1602))))))

(assert (=> b!161353 (= lt!254014 (array!7966 (store (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602) lt!254017) (currentByte!7517 thiss!1602) lt!254013) (size!3574 (buf!4032 thiss!1602))))))

(assert (=> b!161353 (= lt!254013 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254017) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254022))))))

(assert (=> b!161353 (= lt!254017 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602))) lt!254011)))))

(assert (=> b!161353 (= lt!254011 ((_ sign_extend 24) lt!254012))))

(assert (=> b!161353 (= lt!254012 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254018)))))))

(assert (=> b!161353 (= lt!254018 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254022))))))

(assert (=> b!161353 (= lt!254022 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7512 thiss!1602))))))

(declare-fun b!161354 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161354 (= e!111068 (byteRangesEq!0 (select (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602)) lt!254013 #b00000000000000000000000000000000 (currentBit!7512 thiss!1602)))))

(declare-fun b!161355 () Bool)

(declare-fun array_inv!3321 (array!7965) Bool)

(assert (=> b!161355 (= e!111069 (array_inv!3321 (buf!4032 thiss!1602)))))

(assert (= (and start!33728 res!134497) b!161353))

(assert (= (and b!161353 (not res!134496)) b!161354))

(assert (= (and b!161353 (not res!134495)) b!161352))

(assert (= (and b!161352 (not res!134498)) b!161351))

(assert (= start!33728 b!161355))

(declare-fun m!255429 () Bool)

(assert (=> b!161353 m!255429))

(declare-fun m!255431 () Bool)

(assert (=> b!161353 m!255431))

(declare-fun m!255433 () Bool)

(assert (=> b!161353 m!255433))

(declare-fun m!255435 () Bool)

(assert (=> b!161353 m!255435))

(declare-fun m!255437 () Bool)

(assert (=> b!161353 m!255437))

(declare-fun m!255439 () Bool)

(assert (=> b!161353 m!255439))

(declare-fun m!255441 () Bool)

(assert (=> b!161353 m!255441))

(declare-fun m!255443 () Bool)

(assert (=> b!161353 m!255443))

(declare-fun m!255445 () Bool)

(assert (=> b!161353 m!255445))

(declare-fun m!255447 () Bool)

(assert (=> b!161353 m!255447))

(declare-fun m!255449 () Bool)

(assert (=> b!161353 m!255449))

(declare-fun m!255451 () Bool)

(assert (=> b!161353 m!255451))

(assert (=> b!161354 m!255439))

(assert (=> b!161354 m!255439))

(declare-fun m!255453 () Bool)

(assert (=> b!161354 m!255453))

(declare-fun m!255455 () Bool)

(assert (=> start!33728 m!255455))

(declare-fun m!255457 () Bool)

(assert (=> start!33728 m!255457))

(declare-fun m!255459 () Bool)

(assert (=> b!161355 m!255459))

(declare-fun m!255461 () Bool)

(assert (=> b!161351 m!255461))

(declare-fun m!255463 () Bool)

(assert (=> b!161351 m!255463))

(declare-fun m!255465 () Bool)

(assert (=> b!161351 m!255465))

(declare-fun m!255467 () Bool)

(assert (=> b!161351 m!255467))

(assert (=> b!161351 m!255451))

(declare-fun m!255469 () Bool)

(assert (=> b!161351 m!255469))

(assert (=> b!161351 m!255465))

(assert (=> b!161351 m!255465))

(declare-fun m!255471 () Bool)

(assert (=> b!161351 m!255471))

(declare-fun m!255473 () Bool)

(assert (=> b!161351 m!255473))

(assert (=> b!161351 m!255447))

(push 1)

(assert (not b!161353))

(assert (not b!161351))

(assert (not b!161355))

(assert (not b!161354))

(assert (not start!33728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55179 () Bool)

(assert (=> d!55179 (= (array_inv!3321 (buf!4032 thiss!1602)) (bvsge (size!3574 (buf!4032 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161355 d!55179))

(declare-fun d!55181 () Bool)

(assert (=> d!55181 (= (byteRangesEq!0 (select (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602)) lt!254013 #b00000000000000000000000000000000 (currentBit!7512 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7512 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7512 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254013) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7512 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13732 () Bool)

(assert (= bs!13732 d!55181))

(declare-fun m!255577 () Bool)

(assert (=> bs!13732 m!255577))

(declare-fun m!255579 () Bool)

(assert (=> bs!13732 m!255579))

(assert (=> b!161354 d!55181))

(declare-fun d!55183 () Bool)

(declare-fun res!134538 () Bool)

(declare-fun e!111118 () Bool)

(assert (=> d!55183 (=> res!134538 e!111118)))

(assert (=> d!55183 (= res!134538 (= #b00000000000000000000000000000000 (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)))))

(assert (=> d!55183 (= (arrayRangesEq!526 (buf!4032 thiss!1602) lt!254014 #b00000000000000000000000000000000 (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)) e!111118)))

(declare-fun b!161401 () Bool)

(declare-fun e!111119 () Bool)

(assert (=> b!161401 (= e!111118 e!111119)))

(declare-fun res!134539 () Bool)

(assert (=> b!161401 (=> (not res!134539) (not e!111119))))

(assert (=> b!161401 (= res!134539 (= (select (arr!4495 (buf!4032 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4495 lt!254014) #b00000000000000000000000000000000)))))

(declare-fun b!161402 () Bool)

(assert (=> b!161402 (= e!111119 (arrayRangesEq!526 (buf!4032 thiss!1602) lt!254014 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)))))

(assert (= (and d!55183 (not res!134538)) b!161401))

(assert (= (and b!161401 res!134539) b!161402))

(declare-fun m!255583 () Bool)

(assert (=> b!161401 m!255583))

(declare-fun m!255585 () Bool)

(assert (=> b!161401 m!255585))

(declare-fun m!255587 () Bool)

(assert (=> b!161402 m!255587))

(assert (=> b!161353 d!55183))

(declare-fun d!55187 () Bool)

(declare-fun res!134540 () Bool)

(declare-fun e!111120 () Bool)

(assert (=> d!55187 (=> res!134540 e!111120)))

(assert (=> d!55187 (= res!134540 (= #b00000000000000000000000000000000 (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)))))

(assert (=> d!55187 (= (arrayRangesEq!526 (buf!4032 thiss!1602) (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) lt!254016) (size!3574 (buf!4032 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)) e!111120)))

(declare-fun b!161403 () Bool)

(declare-fun e!111121 () Bool)

(assert (=> b!161403 (= e!111120 e!111121)))

(declare-fun res!134541 () Bool)

(assert (=> b!161403 (=> (not res!134541) (not e!111121))))

(assert (=> b!161403 (= res!134541 (= (select (arr!4495 (buf!4032 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4495 (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) lt!254016) (size!3574 (buf!4032 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161404 () Bool)

(assert (=> b!161404 (= e!111121 (arrayRangesEq!526 (buf!4032 thiss!1602) (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) lt!254016) (size!3574 (buf!4032 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)))))

(assert (= (and d!55187 (not res!134540)) b!161403))

(assert (= (and b!161403 res!134541) b!161404))

(assert (=> b!161403 m!255583))

(declare-fun m!255589 () Bool)

(assert (=> b!161403 m!255589))

(declare-fun m!255591 () Bool)

(assert (=> b!161404 m!255591))

(assert (=> b!161353 d!55187))

(declare-fun d!55189 () Bool)

(declare-fun e!111134 () Bool)

(assert (=> d!55189 e!111134))

(declare-fun res!134554 () Bool)

(assert (=> d!55189 (=> (not res!134554) (not e!111134))))

(assert (=> d!55189 (= res!134554 (and (bvsge (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) (size!3574 (buf!4032 thiss!1602)))))))

(declare-fun lt!254102 () Unit!11066)

(declare-fun choose!162 (array!7965 (_ BitVec 32) (_ BitVec 8)) Unit!11066)

(assert (=> d!55189 (= lt!254102 (choose!162 (buf!4032 thiss!1602) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) lt!254016))))

(assert (=> d!55189 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) (size!3574 (buf!4032 thiss!1602))))))

(assert (=> d!55189 (= (arrayUpdatedAtPrefixLemma!134 (buf!4032 thiss!1602) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) lt!254016) lt!254102)))

(declare-fun b!161417 () Bool)

(assert (=> b!161417 (= e!111134 (arrayRangesEq!526 (buf!4032 thiss!1602) (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001) lt!254016) (size!3574 (buf!4032 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000001)))))

(assert (= (and d!55189 res!134554) b!161417))

(declare-fun m!255615 () Bool)

(assert (=> d!55189 m!255615))

(assert (=> b!161417 m!255429))

(assert (=> b!161417 m!255435))

(assert (=> b!161353 d!55189))

(declare-fun d!55207 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55207 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3574 (buf!4032 thiss!1602))) ((_ sign_extend 32) (currentByte!7517 thiss!1602)) ((_ sign_extend 32) (currentBit!7512 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3574 (buf!4032 thiss!1602))) ((_ sign_extend 32) (currentByte!7517 thiss!1602)) ((_ sign_extend 32) (currentBit!7512 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13735 () Bool)

(assert (= bs!13735 d!55207))

(declare-fun m!255625 () Bool)

(assert (=> bs!13735 m!255625))

(assert (=> start!33728 d!55207))

(declare-fun d!55211 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55211 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7512 thiss!1602) (currentByte!7517 thiss!1602) (size!3574 (buf!4032 thiss!1602))))))

(declare-fun bs!13736 () Bool)

(assert (= bs!13736 d!55211))

(declare-fun m!255627 () Bool)

(assert (=> bs!13736 m!255627))

(assert (=> start!33728 d!55211))

(declare-fun d!55213 () Bool)

(declare-fun res!134559 () Bool)

(declare-fun e!111139 () Bool)

(assert (=> d!55213 (=> res!134559 e!111139)))

(assert (=> d!55213 (= res!134559 (= #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021))))))

(assert (=> d!55213 (= (arrayRangesEq!526 lt!254014 (array!7966 (store (store (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602) lt!254017) (currentByte!7517 thiss!1602) lt!254013) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021))) e!111139)))

(declare-fun b!161422 () Bool)

(declare-fun e!111140 () Bool)

(assert (=> b!161422 (= e!111139 e!111140)))

(declare-fun res!134560 () Bool)

(assert (=> b!161422 (=> (not res!134560) (not e!111140))))

(assert (=> b!161422 (= res!134560 (= (select (arr!4495 lt!254014) #b00000000000000000000000000000000) (select (arr!4495 (array!7966 (store (store (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602) lt!254017) (currentByte!7517 thiss!1602) lt!254013) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161423 () Bool)

(assert (=> b!161423 (= e!111140 (arrayRangesEq!526 lt!254014 (array!7966 (store (store (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 thiss!1602) lt!254017) (currentByte!7517 thiss!1602) lt!254013) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7517 (_3!555 lt!254021))))))

(assert (= (and d!55213 (not res!134559)) b!161422))

(assert (= (and b!161422 res!134560) b!161423))

(assert (=> b!161422 m!255585))

(declare-fun m!255629 () Bool)

(assert (=> b!161422 m!255629))

(declare-fun m!255631 () Bool)

(assert (=> b!161423 m!255631))

(assert (=> b!161351 d!55213))

(declare-fun d!55215 () Bool)

(declare-fun e!111141 () Bool)

(assert (=> d!55215 e!111141))

(declare-fun res!134561 () Bool)

(assert (=> d!55215 (=> (not res!134561) (not e!111141))))

(assert (=> d!55215 (= res!134561 (and (bvsge (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000000) (bvslt (currentByte!7517 (_3!555 lt!254021)) (size!3574 lt!254014))))))

(declare-fun lt!254103 () Unit!11066)

(assert (=> d!55215 (= lt!254103 (choose!162 lt!254014 (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))))))

(assert (=> d!55215 (and (bvsle #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021))) (bvslt (currentByte!7517 (_3!555 lt!254021)) (size!3574 lt!254014)))))

(assert (=> d!55215 (= (arrayUpdatedAtPrefixLemma!134 lt!254014 (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) lt!254103)))

(declare-fun b!161424 () Bool)

(assert (=> b!161424 (= e!111141 (arrayRangesEq!526 lt!254014 (array!7966 (store (arr!4495 lt!254014) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 lt!254014)) #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021))))))

(assert (= (and d!55215 res!134561) b!161424))

(assert (=> d!55215 m!255465))

(declare-fun m!255633 () Bool)

(assert (=> d!55215 m!255633))

(declare-fun m!255635 () Bool)

(assert (=> b!161424 m!255635))

(declare-fun m!255637 () Bool)

(assert (=> b!161424 m!255637))

(assert (=> b!161351 d!55215))

(declare-fun d!55217 () Bool)

(declare-fun res!134564 () Bool)

(declare-fun e!111144 () Bool)

(assert (=> d!55217 (=> res!134564 e!111144)))

(assert (=> d!55217 (= res!134564 (= #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021))))))

(assert (=> d!55217 (= (arrayRangesEq!526 (buf!4032 thiss!1602) (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021))) e!111144)))

(declare-fun b!161425 () Bool)

(declare-fun e!111145 () Bool)

(assert (=> b!161425 (= e!111144 e!111145)))

(declare-fun res!134565 () Bool)

(assert (=> b!161425 (=> (not res!134565) (not e!111145))))

(assert (=> b!161425 (= res!134565 (= (select (arr!4495 (buf!4032 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4495 (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161426 () Bool)

(assert (=> b!161426 (= e!111145 (arrayRangesEq!526 (buf!4032 thiss!1602) (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7517 (_3!555 lt!254021))))))

(assert (= (and d!55217 (not res!134564)) b!161425))

(assert (= (and b!161425 res!134565) b!161426))

(assert (=> b!161425 m!255583))

(declare-fun m!255639 () Bool)

(assert (=> b!161425 m!255639))

(declare-fun m!255641 () Bool)

(assert (=> b!161426 m!255641))

(assert (=> b!161351 d!55217))

(declare-fun d!55219 () Bool)

(declare-fun e!111146 () Bool)

(assert (=> d!55219 e!111146))

(declare-fun res!134566 () Bool)

(assert (=> d!55219 (=> (not res!134566) (not e!111146))))

(assert (=> d!55219 (= res!134566 (and (bvsge (currentByte!7517 (_3!555 lt!254021)) #b00000000000000000000000000000000) (bvslt (currentByte!7517 (_3!555 lt!254021)) (size!3574 (buf!4032 thiss!1602)))))))

(declare-fun lt!254106 () Unit!11066)

(assert (=> d!55219 (= lt!254106 (choose!162 (buf!4032 thiss!1602) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))))))

(assert (=> d!55219 (and (bvsle #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021))) (bvslt (currentByte!7517 (_3!555 lt!254021)) (size!3574 (buf!4032 thiss!1602))))))

(assert (=> d!55219 (= (arrayUpdatedAtPrefixLemma!134 (buf!4032 thiss!1602) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) lt!254106)))

(declare-fun b!161429 () Bool)

(assert (=> b!161429 (= e!111146 (arrayRangesEq!526 (buf!4032 thiss!1602) (array!7966 (store (arr!4495 (buf!4032 thiss!1602)) (currentByte!7517 (_3!555 lt!254021)) (select (arr!4495 (buf!4032 (_3!555 lt!254021))) (currentByte!7517 (_3!555 lt!254021)))) (size!3574 (buf!4032 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7517 (_3!555 lt!254021))))))

(assert (= (and d!55219 res!134566) b!161429))

(assert (=> d!55219 m!255465))

(declare-fun m!255643 () Bool)

(assert (=> d!55219 m!255643))

(assert (=> b!161429 m!255463))

(assert (=> b!161429 m!255461))

(assert (=> b!161351 d!55219))

(push 1)


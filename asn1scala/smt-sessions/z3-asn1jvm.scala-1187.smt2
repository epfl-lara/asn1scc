; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33730 () Bool)

(assert start!33730)

(declare-fun b!161366 () Bool)

(declare-fun e!111085 () Bool)

(declare-datatypes ((array!7967 0))(
  ( (array!7968 (arr!4496 (Array (_ BitVec 32) (_ BitVec 8))) (size!3575 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6318 0))(
  ( (BitStream!6319 (buf!4033 array!7967) (currentByte!7518 (_ BitVec 32)) (currentBit!7513 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11070 0))(
  ( (Unit!11071) )
))
(declare-datatypes ((tuple3!878 0))(
  ( (tuple3!879 (_1!7790 Unit!11070) (_2!7790 (_ BitVec 8)) (_3!556 BitStream!6318)) )
))
(declare-fun lt!254047 () tuple3!878)

(assert (=> b!161366 (= e!111085 (or (= (bvand (currentByte!7518 (_3!556 lt!254047)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7518 (_3!556 lt!254047)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(declare-fun lt!254056 () array!7967)

(declare-fun lt!254050 () (_ BitVec 8))

(declare-fun thiss!1602 () BitStream!6318)

(declare-fun lt!254058 () (_ BitVec 8))

(declare-fun arrayRangesEq!527 (array!7967 array!7967 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161366 (arrayRangesEq!527 lt!254056 (array!7968 (store (store (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602) lt!254058) (currentByte!7518 thiss!1602) lt!254050) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047)))))

(declare-fun lt!254049 () Unit!11070)

(declare-fun arrayUpdatedAtPrefixLemma!135 (array!7967 (_ BitVec 32) (_ BitVec 8)) Unit!11070)

(assert (=> b!161366 (= lt!254049 (arrayUpdatedAtPrefixLemma!135 lt!254056 (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))))))

(assert (=> b!161366 (arrayRangesEq!527 (buf!4033 thiss!1602) (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047)))))

(declare-fun lt!254052 () Unit!11070)

(assert (=> b!161366 (= lt!254052 (arrayUpdatedAtPrefixLemma!135 (buf!4033 thiss!1602) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))))))

(declare-fun b!161367 () Bool)

(declare-fun res!134507 () Bool)

(assert (=> b!161367 (=> res!134507 e!111085)))

(declare-fun lt!254048 () (_ BitVec 32))

(assert (=> b!161367 (= res!134507 (bvsle lt!254048 #b00000000000000000000000000000000))))

(declare-fun b!161368 () Bool)

(declare-fun e!111086 () Bool)

(assert (=> b!161368 (= e!111086 (not e!111085))))

(declare-fun res!134509 () Bool)

(assert (=> b!161368 (=> res!134509 e!111085)))

(assert (=> b!161368 (= res!134509 (not (arrayRangesEq!527 (buf!4033 thiss!1602) lt!254056 #b00000000000000000000000000000000 (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001))))))

(declare-fun lt!254057 () (_ BitVec 8))

(assert (=> b!161368 (arrayRangesEq!527 (buf!4033 thiss!1602) (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) lt!254057) (size!3575 (buf!4033 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001))))

(declare-fun lt!254051 () Unit!11070)

(assert (=> b!161368 (= lt!254051 (arrayUpdatedAtPrefixLemma!135 (buf!4033 thiss!1602) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) lt!254057))))

(assert (=> b!161368 (= lt!254057 (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254055 () (_ BitVec 32))

(declare-fun lt!254053 () (_ BitVec 8))

(declare-fun lt!254054 () (_ BitVec 32))

(declare-fun Unit!11072 () Unit!11070)

(declare-fun Unit!11073 () Unit!11070)

(assert (=> b!161368 (= lt!254047 (ite (bvsgt lt!254048 #b00000000000000000000000000000000) (let ((bdg!9635 ((_ extract 7 0) (bvnot lt!254054)))) (let ((bdg!9636 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602) lt!254058) (currentByte!7518 thiss!1602) lt!254050) (bvadd #b00000000000000000000000000000001 (currentByte!7518 thiss!1602)))) ((_ sign_extend 24) bdg!9635))))) (tuple3!879 Unit!11072 bdg!9635 (BitStream!6319 (array!7968 (store (arr!4496 (array!7968 (store (arr!4496 lt!254056) (bvadd #b00000000000000000000000000000001 (currentByte!7518 thiss!1602)) bdg!9636) (size!3575 lt!254056))) (bvadd #b00000000000000000000000000000001 (currentByte!7518 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9636) (bvshl ((_ sign_extend 24) v!222) lt!254055)))) (size!3575 (array!7968 (store (arr!4496 lt!254056) (bvadd #b00000000000000000000000000000001 (currentByte!7518 thiss!1602)) bdg!9636) (size!3575 lt!254056)))) (bvadd #b00000000000000000000000000000001 (currentByte!7518 thiss!1602)) (currentBit!7513 thiss!1602))))) (tuple3!879 Unit!11073 lt!254053 (BitStream!6319 lt!254056 (bvadd #b00000000000000000000000000000001 (currentByte!7518 thiss!1602)) (currentBit!7513 thiss!1602)))))))

(declare-fun e!111084 () Bool)

(assert (=> b!161368 e!111084))

(declare-fun res!134508 () Bool)

(assert (=> b!161368 (=> res!134508 e!111084)))

(assert (=> b!161368 (= res!134508 (bvsge (currentByte!7518 thiss!1602) (size!3575 (buf!4033 thiss!1602))))))

(assert (=> b!161368 (= lt!254056 (array!7968 (store (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602) lt!254058) (currentByte!7518 thiss!1602) lt!254050) (size!3575 (buf!4033 thiss!1602))))))

(assert (=> b!161368 (= lt!254050 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254058) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254048))))))

(assert (=> b!161368 (= lt!254058 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602))) lt!254054)))))

(assert (=> b!161368 (= lt!254054 ((_ sign_extend 24) lt!254053))))

(assert (=> b!161368 (= lt!254053 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254055)))))))

(assert (=> b!161368 (= lt!254055 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254048))))))

(assert (=> b!161368 (= lt!254048 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7513 thiss!1602))))))

(declare-fun res!134510 () Bool)

(assert (=> start!33730 (=> (not res!134510) (not e!111086))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33730 (= res!134510 (validate_offset_byte!0 ((_ sign_extend 32) (size!3575 (buf!4033 thiss!1602))) ((_ sign_extend 32) (currentByte!7518 thiss!1602)) ((_ sign_extend 32) (currentBit!7513 thiss!1602))))))

(assert (=> start!33730 e!111086))

(declare-fun e!111083 () Bool)

(declare-fun inv!12 (BitStream!6318) Bool)

(assert (=> start!33730 (and (inv!12 thiss!1602) e!111083)))

(assert (=> start!33730 true))

(declare-fun b!161369 () Bool)

(declare-fun array_inv!3322 (array!7967) Bool)

(assert (=> b!161369 (= e!111083 (array_inv!3322 (buf!4033 thiss!1602)))))

(declare-fun b!161370 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161370 (= e!111084 (byteRangesEq!0 (select (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602)) lt!254050 #b00000000000000000000000000000000 (currentBit!7513 thiss!1602)))))

(assert (= (and start!33730 res!134510) b!161368))

(assert (= (and b!161368 (not res!134508)) b!161370))

(assert (= (and b!161368 (not res!134509)) b!161367))

(assert (= (and b!161367 (not res!134507)) b!161366))

(assert (= start!33730 b!161369))

(declare-fun m!255475 () Bool)

(assert (=> b!161366 m!255475))

(declare-fun m!255477 () Bool)

(assert (=> b!161366 m!255477))

(declare-fun m!255479 () Bool)

(assert (=> b!161366 m!255479))

(declare-fun m!255481 () Bool)

(assert (=> b!161366 m!255481))

(assert (=> b!161366 m!255479))

(declare-fun m!255483 () Bool)

(assert (=> b!161366 m!255483))

(declare-fun m!255485 () Bool)

(assert (=> b!161366 m!255485))

(declare-fun m!255487 () Bool)

(assert (=> b!161366 m!255487))

(declare-fun m!255489 () Bool)

(assert (=> b!161366 m!255489))

(assert (=> b!161366 m!255479))

(declare-fun m!255491 () Bool)

(assert (=> b!161366 m!255491))

(declare-fun m!255493 () Bool)

(assert (=> start!33730 m!255493))

(declare-fun m!255495 () Bool)

(assert (=> start!33730 m!255495))

(declare-fun m!255497 () Bool)

(assert (=> b!161369 m!255497))

(declare-fun m!255499 () Bool)

(assert (=> b!161368 m!255499))

(declare-fun m!255501 () Bool)

(assert (=> b!161368 m!255501))

(assert (=> b!161368 m!255477))

(declare-fun m!255503 () Bool)

(assert (=> b!161368 m!255503))

(declare-fun m!255505 () Bool)

(assert (=> b!161368 m!255505))

(declare-fun m!255507 () Bool)

(assert (=> b!161368 m!255507))

(declare-fun m!255509 () Bool)

(assert (=> b!161368 m!255509))

(declare-fun m!255511 () Bool)

(assert (=> b!161368 m!255511))

(declare-fun m!255513 () Bool)

(assert (=> b!161368 m!255513))

(declare-fun m!255515 () Bool)

(assert (=> b!161368 m!255515))

(declare-fun m!255517 () Bool)

(assert (=> b!161368 m!255517))

(assert (=> b!161368 m!255485))

(assert (=> b!161370 m!255507))

(assert (=> b!161370 m!255507))

(declare-fun m!255519 () Bool)

(assert (=> b!161370 m!255519))

(check-sat (not start!33730) (not b!161370) (not b!161366) (not b!161369) (not b!161368))
(check-sat)
(get-model)

(declare-fun d!55173 () Bool)

(declare-fun res!134527 () Bool)

(declare-fun e!111107 () Bool)

(assert (=> d!55173 (=> res!134527 e!111107)))

(assert (=> d!55173 (= res!134527 (= #b00000000000000000000000000000000 (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)))))

(assert (=> d!55173 (= (arrayRangesEq!527 (buf!4033 thiss!1602) lt!254056 #b00000000000000000000000000000000 (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)) e!111107)))

(declare-fun b!161390 () Bool)

(declare-fun e!111108 () Bool)

(assert (=> b!161390 (= e!111107 e!111108)))

(declare-fun res!134528 () Bool)

(assert (=> b!161390 (=> (not res!134528) (not e!111108))))

(assert (=> b!161390 (= res!134528 (= (select (arr!4496 (buf!4033 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4496 lt!254056) #b00000000000000000000000000000000)))))

(declare-fun b!161391 () Bool)

(assert (=> b!161391 (= e!111108 (arrayRangesEq!527 (buf!4033 thiss!1602) lt!254056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)))))

(assert (= (and d!55173 (not res!134527)) b!161390))

(assert (= (and b!161390 res!134528) b!161391))

(declare-fun m!255567 () Bool)

(assert (=> b!161390 m!255567))

(declare-fun m!255569 () Bool)

(assert (=> b!161390 m!255569))

(declare-fun m!255571 () Bool)

(assert (=> b!161391 m!255571))

(assert (=> b!161368 d!55173))

(declare-fun d!55175 () Bool)

(declare-fun res!134529 () Bool)

(declare-fun e!111109 () Bool)

(assert (=> d!55175 (=> res!134529 e!111109)))

(assert (=> d!55175 (= res!134529 (= #b00000000000000000000000000000000 (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)))))

(assert (=> d!55175 (= (arrayRangesEq!527 (buf!4033 thiss!1602) (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) lt!254057) (size!3575 (buf!4033 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)) e!111109)))

(declare-fun b!161392 () Bool)

(declare-fun e!111110 () Bool)

(assert (=> b!161392 (= e!111109 e!111110)))

(declare-fun res!134530 () Bool)

(assert (=> b!161392 (=> (not res!134530) (not e!111110))))

(assert (=> b!161392 (= res!134530 (= (select (arr!4496 (buf!4033 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4496 (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) lt!254057) (size!3575 (buf!4033 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161393 () Bool)

(assert (=> b!161393 (= e!111110 (arrayRangesEq!527 (buf!4033 thiss!1602) (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) lt!254057) (size!3575 (buf!4033 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)))))

(assert (= (and d!55175 (not res!134529)) b!161392))

(assert (= (and b!161392 res!134530) b!161393))

(assert (=> b!161392 m!255567))

(declare-fun m!255573 () Bool)

(assert (=> b!161392 m!255573))

(declare-fun m!255575 () Bool)

(assert (=> b!161393 m!255575))

(assert (=> b!161368 d!55175))

(declare-fun d!55177 () Bool)

(declare-fun e!111113 () Bool)

(assert (=> d!55177 e!111113))

(declare-fun res!134533 () Bool)

(assert (=> d!55177 (=> (not res!134533) (not e!111113))))

(assert (=> d!55177 (= res!134533 (and (bvsge (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) (size!3575 (buf!4033 thiss!1602)))))))

(declare-fun lt!254097 () Unit!11070)

(declare-fun choose!161 (array!7967 (_ BitVec 32) (_ BitVec 8)) Unit!11070)

(assert (=> d!55177 (= lt!254097 (choose!161 (buf!4033 thiss!1602) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) lt!254057))))

(assert (=> d!55177 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) (size!3575 (buf!4033 thiss!1602))))))

(assert (=> d!55177 (= (arrayUpdatedAtPrefixLemma!135 (buf!4033 thiss!1602) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) lt!254057) lt!254097)))

(declare-fun b!161396 () Bool)

(assert (=> b!161396 (= e!111113 (arrayRangesEq!527 (buf!4033 thiss!1602) (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001) lt!254057) (size!3575 (buf!4033 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000001)))))

(assert (= (and d!55177 res!134533) b!161396))

(declare-fun m!255581 () Bool)

(assert (=> d!55177 m!255581))

(assert (=> b!161396 m!255505))

(assert (=> b!161396 m!255513))

(assert (=> b!161368 d!55177))

(declare-fun d!55185 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55185 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3575 (buf!4033 thiss!1602))) ((_ sign_extend 32) (currentByte!7518 thiss!1602)) ((_ sign_extend 32) (currentBit!7513 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3575 (buf!4033 thiss!1602))) ((_ sign_extend 32) (currentByte!7518 thiss!1602)) ((_ sign_extend 32) (currentBit!7513 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13733 () Bool)

(assert (= bs!13733 d!55185))

(declare-fun m!255593 () Bool)

(assert (=> bs!13733 m!255593))

(assert (=> start!33730 d!55185))

(declare-fun d!55191 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55191 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7513 thiss!1602) (currentByte!7518 thiss!1602) (size!3575 (buf!4033 thiss!1602))))))

(declare-fun bs!13734 () Bool)

(assert (= bs!13734 d!55191))

(declare-fun m!255595 () Bool)

(assert (=> bs!13734 m!255595))

(assert (=> start!33730 d!55191))

(declare-fun d!55195 () Bool)

(declare-fun res!134542 () Bool)

(declare-fun e!111122 () Bool)

(assert (=> d!55195 (=> res!134542 e!111122)))

(assert (=> d!55195 (= res!134542 (= #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047))))))

(assert (=> d!55195 (= (arrayRangesEq!527 lt!254056 (array!7968 (store (store (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602) lt!254058) (currentByte!7518 thiss!1602) lt!254050) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047))) e!111122)))

(declare-fun b!161405 () Bool)

(declare-fun e!111123 () Bool)

(assert (=> b!161405 (= e!111122 e!111123)))

(declare-fun res!134543 () Bool)

(assert (=> b!161405 (=> (not res!134543) (not e!111123))))

(assert (=> b!161405 (= res!134543 (= (select (arr!4496 lt!254056) #b00000000000000000000000000000000) (select (arr!4496 (array!7968 (store (store (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602) lt!254058) (currentByte!7518 thiss!1602) lt!254050) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161406 () Bool)

(assert (=> b!161406 (= e!111123 (arrayRangesEq!527 lt!254056 (array!7968 (store (store (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602) lt!254058) (currentByte!7518 thiss!1602) lt!254050) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7518 (_3!556 lt!254047))))))

(assert (= (and d!55195 (not res!134542)) b!161405))

(assert (= (and b!161405 res!134543) b!161406))

(assert (=> b!161405 m!255569))

(declare-fun m!255597 () Bool)

(assert (=> b!161405 m!255597))

(declare-fun m!255599 () Bool)

(assert (=> b!161406 m!255599))

(assert (=> b!161366 d!55195))

(declare-fun d!55197 () Bool)

(declare-fun e!111124 () Bool)

(assert (=> d!55197 e!111124))

(declare-fun res!134544 () Bool)

(assert (=> d!55197 (=> (not res!134544) (not e!111124))))

(assert (=> d!55197 (= res!134544 (and (bvsge (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000000) (bvslt (currentByte!7518 (_3!556 lt!254047)) (size!3575 lt!254056))))))

(declare-fun lt!254098 () Unit!11070)

(assert (=> d!55197 (= lt!254098 (choose!161 lt!254056 (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))))))

(assert (=> d!55197 (and (bvsle #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047))) (bvslt (currentByte!7518 (_3!556 lt!254047)) (size!3575 lt!254056)))))

(assert (=> d!55197 (= (arrayUpdatedAtPrefixLemma!135 lt!254056 (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) lt!254098)))

(declare-fun b!161407 () Bool)

(assert (=> b!161407 (= e!111124 (arrayRangesEq!527 lt!254056 (array!7968 (store (arr!4496 lt!254056) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 lt!254056)) #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047))))))

(assert (= (and d!55197 res!134544) b!161407))

(assert (=> d!55197 m!255479))

(declare-fun m!255601 () Bool)

(assert (=> d!55197 m!255601))

(declare-fun m!255603 () Bool)

(assert (=> b!161407 m!255603))

(declare-fun m!255605 () Bool)

(assert (=> b!161407 m!255605))

(assert (=> b!161366 d!55197))

(declare-fun d!55199 () Bool)

(declare-fun res!134549 () Bool)

(declare-fun e!111129 () Bool)

(assert (=> d!55199 (=> res!134549 e!111129)))

(assert (=> d!55199 (= res!134549 (= #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047))))))

(assert (=> d!55199 (= (arrayRangesEq!527 (buf!4033 thiss!1602) (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047))) e!111129)))

(declare-fun b!161410 () Bool)

(declare-fun e!111130 () Bool)

(assert (=> b!161410 (= e!111129 e!111130)))

(declare-fun res!134550 () Bool)

(assert (=> b!161410 (=> (not res!134550) (not e!111130))))

(assert (=> b!161410 (= res!134550 (= (select (arr!4496 (buf!4033 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4496 (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161411 () Bool)

(assert (=> b!161411 (= e!111130 (arrayRangesEq!527 (buf!4033 thiss!1602) (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7518 (_3!556 lt!254047))))))

(assert (= (and d!55199 (not res!134549)) b!161410))

(assert (= (and b!161410 res!134550) b!161411))

(assert (=> b!161410 m!255567))

(declare-fun m!255607 () Bool)

(assert (=> b!161410 m!255607))

(declare-fun m!255609 () Bool)

(assert (=> b!161411 m!255609))

(assert (=> b!161366 d!55199))

(declare-fun d!55201 () Bool)

(declare-fun e!111133 () Bool)

(assert (=> d!55201 e!111133))

(declare-fun res!134553 () Bool)

(assert (=> d!55201 (=> (not res!134553) (not e!111133))))

(assert (=> d!55201 (= res!134553 (and (bvsge (currentByte!7518 (_3!556 lt!254047)) #b00000000000000000000000000000000) (bvslt (currentByte!7518 (_3!556 lt!254047)) (size!3575 (buf!4033 thiss!1602)))))))

(declare-fun lt!254101 () Unit!11070)

(assert (=> d!55201 (= lt!254101 (choose!161 (buf!4033 thiss!1602) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))))))

(assert (=> d!55201 (and (bvsle #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047))) (bvslt (currentByte!7518 (_3!556 lt!254047)) (size!3575 (buf!4033 thiss!1602))))))

(assert (=> d!55201 (= (arrayUpdatedAtPrefixLemma!135 (buf!4033 thiss!1602) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) lt!254101)))

(declare-fun b!161416 () Bool)

(assert (=> b!161416 (= e!111133 (arrayRangesEq!527 (buf!4033 thiss!1602) (array!7968 (store (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 (_3!556 lt!254047)) (select (arr!4496 (buf!4033 (_3!556 lt!254047))) (currentByte!7518 (_3!556 lt!254047)))) (size!3575 (buf!4033 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7518 (_3!556 lt!254047))))))

(assert (= (and d!55201 res!134553) b!161416))

(assert (=> d!55201 m!255479))

(declare-fun m!255611 () Bool)

(assert (=> d!55201 m!255611))

(assert (=> b!161416 m!255475))

(assert (=> b!161416 m!255487))

(assert (=> b!161366 d!55201))

(declare-fun d!55203 () Bool)

(assert (=> d!55203 (= (byteRangesEq!0 (select (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602)) lt!254050 #b00000000000000000000000000000000 (currentBit!7513 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7513 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4496 (buf!4033 thiss!1602)) (currentByte!7518 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7513 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254050) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7513 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13737 () Bool)

(assert (= bs!13737 d!55203))

(declare-fun m!255647 () Bool)

(assert (=> bs!13737 m!255647))

(declare-fun m!255649 () Bool)

(assert (=> bs!13737 m!255649))

(assert (=> b!161370 d!55203))

(declare-fun d!55225 () Bool)

(assert (=> d!55225 (= (array_inv!3322 (buf!4033 thiss!1602)) (bvsge (size!3575 (buf!4033 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161369 d!55225))

(check-sat (not b!161411) (not d!55197) (not b!161396) (not b!161406) (not d!55177) (not d!55185) (not d!55191) (not b!161391) (not b!161393) (not b!161416) (not d!55201) (not b!161407))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33732 () Bool)

(assert start!33732)

(declare-fun b!161381 () Bool)

(declare-fun e!111100 () Bool)

(declare-datatypes ((array!7969 0))(
  ( (array!7970 (arr!4497 (Array (_ BitVec 32) (_ BitVec 8))) (size!3576 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6320 0))(
  ( (BitStream!6321 (buf!4034 array!7969) (currentByte!7519 (_ BitVec 32)) (currentBit!7514 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11074 0))(
  ( (Unit!11075) )
))
(declare-datatypes ((tuple3!880 0))(
  ( (tuple3!881 (_1!7791 Unit!11074) (_2!7791 (_ BitVec 8)) (_3!557 BitStream!6320)) )
))
(declare-fun lt!254087 () tuple3!880)

(assert (=> b!161381 (= e!111100 (or (= (bvand (currentByte!7519 (_3!557 lt!254087)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7519 (_3!557 lt!254087)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(declare-fun thiss!1602 () BitStream!6320)

(declare-fun lt!254088 () array!7969)

(declare-fun lt!254085 () (_ BitVec 8))

(declare-fun lt!254084 () (_ BitVec 8))

(declare-fun arrayRangesEq!528 (array!7969 array!7969 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161381 (arrayRangesEq!528 lt!254088 (array!7970 (store (store (store (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602) lt!254085) (currentByte!7519 thiss!1602) lt!254084) (currentByte!7519 (_3!557 lt!254087)) (select (arr!4497 (buf!4034 (_3!557 lt!254087))) (currentByte!7519 (_3!557 lt!254087)))) (size!3576 (buf!4034 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7519 (_3!557 lt!254087)))))

(declare-fun lt!254091 () Unit!11074)

(declare-fun arrayUpdatedAtPrefixLemma!136 (array!7969 (_ BitVec 32) (_ BitVec 8)) Unit!11074)

(assert (=> b!161381 (= lt!254091 (arrayUpdatedAtPrefixLemma!136 lt!254088 (currentByte!7519 (_3!557 lt!254087)) (select (arr!4497 (buf!4034 (_3!557 lt!254087))) (currentByte!7519 (_3!557 lt!254087)))))))

(assert (=> b!161381 (arrayRangesEq!528 (buf!4034 thiss!1602) (array!7970 (store (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 (_3!557 lt!254087)) (select (arr!4497 (buf!4034 (_3!557 lt!254087))) (currentByte!7519 (_3!557 lt!254087)))) (size!3576 (buf!4034 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7519 (_3!557 lt!254087)))))

(declare-fun lt!254089 () Unit!11074)

(assert (=> b!161381 (= lt!254089 (arrayUpdatedAtPrefixLemma!136 (buf!4034 thiss!1602) (currentByte!7519 (_3!557 lt!254087)) (select (arr!4497 (buf!4034 (_3!557 lt!254087))) (currentByte!7519 (_3!557 lt!254087)))))))

(declare-fun res!134519 () Bool)

(declare-fun e!111098 () Bool)

(assert (=> start!33732 (=> (not res!134519) (not e!111098))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33732 (= res!134519 (validate_offset_byte!0 ((_ sign_extend 32) (size!3576 (buf!4034 thiss!1602))) ((_ sign_extend 32) (currentByte!7519 thiss!1602)) ((_ sign_extend 32) (currentBit!7514 thiss!1602))))))

(assert (=> start!33732 e!111098))

(declare-fun e!111102 () Bool)

(declare-fun inv!12 (BitStream!6320) Bool)

(assert (=> start!33732 (and (inv!12 thiss!1602) e!111102)))

(assert (=> start!33732 true))

(declare-fun b!161382 () Bool)

(declare-fun e!111101 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161382 (= e!111101 (byteRangesEq!0 (select (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602)) lt!254084 #b00000000000000000000000000000000 (currentBit!7514 thiss!1602)))))

(declare-fun b!161383 () Bool)

(declare-fun array_inv!3323 (array!7969) Bool)

(assert (=> b!161383 (= e!111102 (array_inv!3323 (buf!4034 thiss!1602)))))

(declare-fun b!161384 () Bool)

(assert (=> b!161384 (= e!111098 (not e!111100))))

(declare-fun res!134522 () Bool)

(assert (=> b!161384 (=> res!134522 e!111100)))

(assert (=> b!161384 (= res!134522 (not (arrayRangesEq!528 (buf!4034 thiss!1602) lt!254088 #b00000000000000000000000000000000 (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001))))))

(declare-fun lt!254094 () (_ BitVec 8))

(assert (=> b!161384 (arrayRangesEq!528 (buf!4034 thiss!1602) (array!7970 (store (arr!4497 (buf!4034 thiss!1602)) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) lt!254094) (size!3576 (buf!4034 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001))))

(declare-fun lt!254092 () Unit!11074)

(assert (=> b!161384 (= lt!254092 (arrayUpdatedAtPrefixLemma!136 (buf!4034 thiss!1602) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) lt!254094))))

(assert (=> b!161384 (= lt!254094 (select (arr!4497 (buf!4034 (_3!557 lt!254087))) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254093 () (_ BitVec 8))

(declare-fun lt!254090 () (_ BitVec 32))

(declare-fun lt!254086 () (_ BitVec 32))

(declare-fun lt!254083 () (_ BitVec 32))

(declare-fun Unit!11076 () Unit!11074)

(declare-fun Unit!11077 () Unit!11074)

(assert (=> b!161384 (= lt!254087 (ite (bvsgt lt!254090 #b00000000000000000000000000000000) (let ((bdg!9635 ((_ extract 7 0) (bvnot lt!254083)))) (let ((bdg!9636 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602) lt!254085) (currentByte!7519 thiss!1602) lt!254084) (bvadd #b00000000000000000000000000000001 (currentByte!7519 thiss!1602)))) ((_ sign_extend 24) bdg!9635))))) (tuple3!881 Unit!11076 bdg!9635 (BitStream!6321 (array!7970 (store (arr!4497 (array!7970 (store (arr!4497 lt!254088) (bvadd #b00000000000000000000000000000001 (currentByte!7519 thiss!1602)) bdg!9636) (size!3576 lt!254088))) (bvadd #b00000000000000000000000000000001 (currentByte!7519 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9636) (bvshl ((_ sign_extend 24) v!222) lt!254086)))) (size!3576 (array!7970 (store (arr!4497 lt!254088) (bvadd #b00000000000000000000000000000001 (currentByte!7519 thiss!1602)) bdg!9636) (size!3576 lt!254088)))) (bvadd #b00000000000000000000000000000001 (currentByte!7519 thiss!1602)) (currentBit!7514 thiss!1602))))) (tuple3!881 Unit!11077 lt!254093 (BitStream!6321 lt!254088 (bvadd #b00000000000000000000000000000001 (currentByte!7519 thiss!1602)) (currentBit!7514 thiss!1602)))))))

(assert (=> b!161384 e!111101))

(declare-fun res!134521 () Bool)

(assert (=> b!161384 (=> res!134521 e!111101)))

(assert (=> b!161384 (= res!134521 (bvsge (currentByte!7519 thiss!1602) (size!3576 (buf!4034 thiss!1602))))))

(assert (=> b!161384 (= lt!254088 (array!7970 (store (store (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602) lt!254085) (currentByte!7519 thiss!1602) lt!254084) (size!3576 (buf!4034 thiss!1602))))))

(assert (=> b!161384 (= lt!254084 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254085) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254090))))))

(assert (=> b!161384 (= lt!254085 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602))) lt!254083)))))

(assert (=> b!161384 (= lt!254083 ((_ sign_extend 24) lt!254093))))

(assert (=> b!161384 (= lt!254093 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254086)))))))

(assert (=> b!161384 (= lt!254086 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254090))))))

(assert (=> b!161384 (= lt!254090 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7514 thiss!1602))))))

(declare-fun b!161385 () Bool)

(declare-fun res!134520 () Bool)

(assert (=> b!161385 (=> res!134520 e!111100)))

(assert (=> b!161385 (= res!134520 (bvsle lt!254090 #b00000000000000000000000000000000))))

(assert (= (and start!33732 res!134519) b!161384))

(assert (= (and b!161384 (not res!134521)) b!161382))

(assert (= (and b!161384 (not res!134522)) b!161385))

(assert (= (and b!161385 (not res!134520)) b!161381))

(assert (= start!33732 b!161383))

(declare-fun m!255521 () Bool)

(assert (=> start!33732 m!255521))

(declare-fun m!255523 () Bool)

(assert (=> start!33732 m!255523))

(declare-fun m!255525 () Bool)

(assert (=> b!161383 m!255525))

(declare-fun m!255527 () Bool)

(assert (=> b!161384 m!255527))

(declare-fun m!255529 () Bool)

(assert (=> b!161384 m!255529))

(declare-fun m!255531 () Bool)

(assert (=> b!161384 m!255531))

(declare-fun m!255533 () Bool)

(assert (=> b!161384 m!255533))

(declare-fun m!255535 () Bool)

(assert (=> b!161384 m!255535))

(declare-fun m!255537 () Bool)

(assert (=> b!161384 m!255537))

(declare-fun m!255539 () Bool)

(assert (=> b!161384 m!255539))

(declare-fun m!255541 () Bool)

(assert (=> b!161384 m!255541))

(declare-fun m!255543 () Bool)

(assert (=> b!161384 m!255543))

(declare-fun m!255545 () Bool)

(assert (=> b!161384 m!255545))

(declare-fun m!255547 () Bool)

(assert (=> b!161384 m!255547))

(declare-fun m!255549 () Bool)

(assert (=> b!161384 m!255549))

(declare-fun m!255551 () Bool)

(assert (=> b!161381 m!255551))

(assert (=> b!161381 m!255531))

(declare-fun m!255553 () Bool)

(assert (=> b!161381 m!255553))

(assert (=> b!161381 m!255543))

(assert (=> b!161381 m!255551))

(declare-fun m!255555 () Bool)

(assert (=> b!161381 m!255555))

(assert (=> b!161381 m!255551))

(declare-fun m!255557 () Bool)

(assert (=> b!161381 m!255557))

(declare-fun m!255559 () Bool)

(assert (=> b!161381 m!255559))

(declare-fun m!255561 () Bool)

(assert (=> b!161381 m!255561))

(declare-fun m!255563 () Bool)

(assert (=> b!161381 m!255563))

(assert (=> b!161382 m!255541))

(assert (=> b!161382 m!255541))

(declare-fun m!255565 () Bool)

(assert (=> b!161382 m!255565))

(push 1)

(assert (not b!161381))

(assert (not start!33732))

(assert (not b!161383))

(assert (not b!161382))

(assert (not b!161384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55193 () Bool)

(declare-fun res!134555 () Bool)

(declare-fun e!111135 () Bool)

(assert (=> d!55193 (=> res!134555 e!111135)))

(assert (=> d!55193 (= res!134555 (= #b00000000000000000000000000000000 (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)))))

(assert (=> d!55193 (= (arrayRangesEq!528 (buf!4034 thiss!1602) lt!254088 #b00000000000000000000000000000000 (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)) e!111135)))

(declare-fun b!161418 () Bool)

(declare-fun e!111136 () Bool)

(assert (=> b!161418 (= e!111135 e!111136)))

(declare-fun res!134556 () Bool)

(assert (=> b!161418 (=> (not res!134556) (not e!111136))))

(assert (=> b!161418 (= res!134556 (= (select (arr!4497 (buf!4034 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4497 lt!254088) #b00000000000000000000000000000000)))))

(declare-fun b!161419 () Bool)

(assert (=> b!161419 (= e!111136 (arrayRangesEq!528 (buf!4034 thiss!1602) lt!254088 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)))))

(assert (= (and d!55193 (not res!134555)) b!161418))

(assert (= (and b!161418 res!134556) b!161419))

(declare-fun m!255613 () Bool)

(assert (=> b!161418 m!255613))

(declare-fun m!255617 () Bool)

(assert (=> b!161418 m!255617))

(declare-fun m!255619 () Bool)

(assert (=> b!161419 m!255619))

(assert (=> b!161384 d!55193))

(declare-fun d!55205 () Bool)

(declare-fun res!134557 () Bool)

(declare-fun e!111137 () Bool)

(assert (=> d!55205 (=> res!134557 e!111137)))

(assert (=> d!55205 (= res!134557 (= #b00000000000000000000000000000000 (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)))))

(assert (=> d!55205 (= (arrayRangesEq!528 (buf!4034 thiss!1602) (array!7970 (store (arr!4497 (buf!4034 thiss!1602)) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) lt!254094) (size!3576 (buf!4034 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)) e!111137)))

(declare-fun b!161420 () Bool)

(declare-fun e!111138 () Bool)

(assert (=> b!161420 (= e!111137 e!111138)))

(declare-fun res!134558 () Bool)

(assert (=> b!161420 (=> (not res!134558) (not e!111138))))

(assert (=> b!161420 (= res!134558 (= (select (arr!4497 (buf!4034 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4497 (array!7970 (store (arr!4497 (buf!4034 thiss!1602)) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) lt!254094) (size!3576 (buf!4034 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161421 () Bool)

(assert (=> b!161421 (= e!111138 (arrayRangesEq!528 (buf!4034 thiss!1602) (array!7970 (store (arr!4497 (buf!4034 thiss!1602)) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) lt!254094) (size!3576 (buf!4034 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)))))

(assert (= (and d!55205 (not res!134557)) b!161420))

(assert (= (and b!161420 res!134558) b!161421))

(assert (=> b!161420 m!255613))

(declare-fun m!255621 () Bool)

(assert (=> b!161420 m!255621))

(declare-fun m!255623 () Bool)

(assert (=> b!161421 m!255623))

(assert (=> b!161384 d!55205))

(declare-fun d!55209 () Bool)

(declare-fun e!111147 () Bool)

(assert (=> d!55209 e!111147))

(declare-fun res!134567 () Bool)

(assert (=> d!55209 (=> (not res!134567) (not e!111147))))

(assert (=> d!55209 (= res!134567 (and (bvsge (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) (size!3576 (buf!4034 thiss!1602)))))))

(declare-fun lt!254107 () Unit!11074)

(declare-fun choose!163 (array!7969 (_ BitVec 32) (_ BitVec 8)) Unit!11074)

(assert (=> d!55209 (= lt!254107 (choose!163 (buf!4034 thiss!1602) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) lt!254094))))

(assert (=> d!55209 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) (size!3576 (buf!4034 thiss!1602))))))

(assert (=> d!55209 (= (arrayUpdatedAtPrefixLemma!136 (buf!4034 thiss!1602) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) lt!254094) lt!254107)))

(declare-fun b!161430 () Bool)

(assert (=> b!161430 (= e!111147 (arrayRangesEq!528 (buf!4034 thiss!1602) (array!7970 (store (arr!4497 (buf!4034 thiss!1602)) (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001) lt!254094) (size!3576 (buf!4034 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7519 (_3!557 lt!254087)) #b00000000000000000000000000000001)))))

(assert (= (and d!55209 res!134567) b!161430))

(declare-fun m!255645 () Bool)

(assert (=> d!55209 m!255645))

(assert (=> b!161430 m!255527))

(assert (=> b!161430 m!255529))

(assert (=> b!161384 d!55209))

(declare-fun d!55221 () Bool)

(assert (=> d!55221 (= (array_inv!3323 (buf!4034 thiss!1602)) (bvsge (size!3576 (buf!4034 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161383 d!55221))

(declare-fun d!55223 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55223 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3576 (buf!4034 thiss!1602))) ((_ sign_extend 32) (currentByte!7519 thiss!1602)) ((_ sign_extend 32) (currentBit!7514 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3576 (buf!4034 thiss!1602))) ((_ sign_extend 32) (currentByte!7519 thiss!1602)) ((_ sign_extend 32) (currentBit!7514 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13738 () Bool)

(assert (= bs!13738 d!55223))

(declare-fun m!255651 () Bool)

(assert (=> bs!13738 m!255651))

(assert (=> start!33732 d!55223))

(declare-fun d!55227 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55227 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7514 thiss!1602) (currentByte!7519 thiss!1602) (size!3576 (buf!4034 thiss!1602))))))

(declare-fun bs!13739 () Bool)

(assert (= bs!13739 d!55227))

(declare-fun m!255653 () Bool)

(assert (=> bs!13739 m!255653))

(assert (=> start!33732 d!55227))

(declare-fun d!55229 () Bool)

(assert (=> d!55229 (= (byteRangesEq!0 (select (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602)) lt!254084 #b00000000000000000000000000000000 (currentBit!7514 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7514 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7514 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254084) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7514 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13740 () Bool)

(assert (= bs!13740 d!55229))

(declare-fun m!255655 () Bool)

(assert (=> bs!13740 m!255655))

(declare-fun m!255657 () Bool)

(assert (=> bs!13740 m!255657))

(assert (=> b!161382 d!55229))

(declare-fun d!55231 () Bool)

(declare-fun res!134568 () Bool)

(declare-fun e!111148 () Bool)

(assert (=> d!55231 (=> res!134568 e!111148)))

(assert (=> d!55231 (= res!134568 (= #b00000000000000000000000000000000 (currentByte!7519 (_3!557 lt!254087))))))

(assert (=> d!55231 (= (arrayRangesEq!528 lt!254088 (array!7970 (store (store (store (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602) lt!254085) (currentByte!7519 thiss!1602) lt!254084) (currentByte!7519 (_3!557 lt!254087)) (select (arr!4497 (buf!4034 (_3!557 lt!254087))) (currentByte!7519 (_3!557 lt!254087)))) (size!3576 (buf!4034 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7519 (_3!557 lt!254087))) e!111148)))

(declare-fun b!161431 () Bool)

(declare-fun e!111149 () Bool)

(assert (=> b!161431 (= e!111148 e!111149)))

(declare-fun res!134569 () Bool)

(assert (=> b!161431 (=> (not res!134569) (not e!111149))))

(assert (=> b!161431 (= res!134569 (= (select (arr!4497 lt!254088) #b00000000000000000000000000000000) (select (arr!4497 (array!7970 (store (store (store (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602) lt!254085) (currentByte!7519 thiss!1602) lt!254084) (currentByte!7519 (_3!557 lt!254087)) (select (arr!4497 (buf!4034 (_3!557 lt!254087))) (currentByte!7519 (_3!557 lt!254087)))) (size!3576 (buf!4034 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161432 () Bool)

(assert (=> b!161432 (= e!111149 (arrayRangesEq!528 lt!254088 (array!7970 (store (store (store (arr!4497 (buf!4034 thiss!1602)) (currentByte!7519 thiss!1602) lt!254085) (currentByte!7519 thiss!1602) lt!254084) (currentByte!7519 (_3!557 lt!254087)) (select (arr!4497 (buf!4034 (_3!557 lt!254087))) (currentByte!7519 (_3!557 lt!254087)))) (size!3576 (buf!4034 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7519 (_3!557 lt!254087))))))


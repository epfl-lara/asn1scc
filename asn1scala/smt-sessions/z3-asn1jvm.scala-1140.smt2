; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32214 () Bool)

(assert start!32214)

(declare-fun b!159371 () Bool)

(declare-fun e!108807 () Bool)

(declare-datatypes ((array!7580 0))(
  ( (array!7581 (arr!4355 (Array (_ BitVec 32) (_ BitVec 8))) (size!3434 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6036 0))(
  ( (BitStream!6037 (buf!3892 array!7580) (currentByte!7120 (_ BitVec 32)) (currentBit!7115 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6036)

(declare-datatypes ((Unit!10827 0))(
  ( (Unit!10828) )
))
(declare-datatypes ((tuple3!770 0))(
  ( (tuple3!771 (_1!7733 Unit!10827) (_2!7733 (_ BitVec 8)) (_3!502 BitStream!6036)) )
))
(declare-fun lt!251584 () tuple3!770)

(assert (=> b!159371 (= e!108807 (or (bvsgt #b00000000000000000000000000000000 (currentByte!7120 thiss!1602)) (bvsgt (size!3434 (buf!3892 thiss!1602)) (size!3434 (buf!3892 (_3!502 lt!251584)))) (bvsle (currentByte!7120 thiss!1602) (size!3434 (buf!3892 thiss!1602)))))))

(declare-fun arrayRangesEq!485 (array!7580 array!7580 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159371 (arrayRangesEq!485 (buf!3892 thiss!1602) (buf!3892 (_3!502 lt!251584)) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001))))

(declare-fun lt!251579 () Unit!10827)

(declare-fun lt!251588 () array!7580)

(declare-fun arrayRangesEqTransitive!128 (array!7580 array!7580 array!7580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10827)

(assert (=> b!159371 (= lt!251579 (arrayRangesEqTransitive!128 (buf!3892 thiss!1602) lt!251588 (buf!3892 (_3!502 lt!251584)) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) (currentByte!7120 (_3!502 lt!251584))))))

(declare-fun lt!251582 () (_ BitVec 8))

(declare-fun lt!251585 () (_ BitVec 8))

(assert (=> b!159371 (arrayRangesEq!485 lt!251588 (array!7581 (store (store (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602) lt!251582) (currentByte!7120 thiss!1602) lt!251585) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584)))))

(declare-fun lt!251580 () Unit!10827)

(declare-fun arrayUpdatedAtPrefixLemma!93 (array!7580 (_ BitVec 32) (_ BitVec 8)) Unit!10827)

(assert (=> b!159371 (= lt!251580 (arrayUpdatedAtPrefixLemma!93 lt!251588 (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))))))

(assert (=> b!159371 (arrayRangesEq!485 (buf!3892 thiss!1602) (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584)))))

(declare-fun lt!251583 () Unit!10827)

(assert (=> b!159371 (= lt!251583 (arrayUpdatedAtPrefixLemma!93 (buf!3892 thiss!1602) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))))))

(declare-fun b!159372 () Bool)

(declare-fun res!133028 () Bool)

(assert (=> b!159372 (=> res!133028 e!108807)))

(declare-fun lt!251586 () (_ BitVec 32))

(assert (=> b!159372 (= res!133028 (bvsle lt!251586 #b00000000000000000000000000000000))))

(declare-fun b!159374 () Bool)

(declare-fun e!108806 () Bool)

(declare-fun array_inv!3181 (array!7580) Bool)

(assert (=> b!159374 (= e!108806 (array_inv!3181 (buf!3892 thiss!1602)))))

(declare-fun b!159375 () Bool)

(declare-fun e!108803 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159375 (= e!108803 (byteRangesEq!0 (select (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602)) lt!251585 #b00000000000000000000000000000000 (currentBit!7115 thiss!1602)))))

(declare-fun b!159373 () Bool)

(declare-fun e!108805 () Bool)

(assert (=> b!159373 (= e!108805 (not e!108807))))

(declare-fun res!133025 () Bool)

(assert (=> b!159373 (=> res!133025 e!108807)))

(assert (=> b!159373 (= res!133025 (not (arrayRangesEq!485 (buf!3892 thiss!1602) lt!251588 #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001))))))

(declare-fun lt!251587 () (_ BitVec 8))

(assert (=> b!159373 (arrayRangesEq!485 (buf!3892 thiss!1602) (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) lt!251587) (size!3434 (buf!3892 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001))))

(declare-fun lt!251589 () Unit!10827)

(assert (=> b!159373 (= lt!251589 (arrayUpdatedAtPrefixLemma!93 (buf!3892 thiss!1602) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) lt!251587))))

(assert (=> b!159373 (= lt!251587 (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)))))

(declare-fun lt!251581 () (_ BitVec 32))

(declare-fun lt!251577 () (_ BitVec 32))

(declare-fun lt!251578 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun Unit!10829 () Unit!10827)

(declare-fun Unit!10830 () Unit!10827)

(assert (=> b!159373 (= lt!251584 (ite (bvsgt lt!251586 #b00000000000000000000000000000000) (let ((bdg!9365 ((_ extract 7 0) (bvnot lt!251581)))) (let ((bdg!9366 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602) lt!251582) (currentByte!7120 thiss!1602) lt!251585) (bvadd #b00000000000000000000000000000001 (currentByte!7120 thiss!1602)))) ((_ sign_extend 24) bdg!9365))))) (tuple3!771 Unit!10829 bdg!9365 (BitStream!6037 (array!7581 (store (arr!4355 (array!7581 (store (arr!4355 lt!251588) (bvadd #b00000000000000000000000000000001 (currentByte!7120 thiss!1602)) bdg!9366) (size!3434 lt!251588))) (bvadd #b00000000000000000000000000000001 (currentByte!7120 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9366) (bvshl ((_ sign_extend 24) v!222) lt!251577)))) (size!3434 (array!7581 (store (arr!4355 lt!251588) (bvadd #b00000000000000000000000000000001 (currentByte!7120 thiss!1602)) bdg!9366) (size!3434 lt!251588)))) (bvadd #b00000000000000000000000000000001 (currentByte!7120 thiss!1602)) (currentBit!7115 thiss!1602))))) (tuple3!771 Unit!10830 lt!251578 (BitStream!6037 lt!251588 (bvadd #b00000000000000000000000000000001 (currentByte!7120 thiss!1602)) (currentBit!7115 thiss!1602)))))))

(assert (=> b!159373 e!108803))

(declare-fun res!133027 () Bool)

(assert (=> b!159373 (=> res!133027 e!108803)))

(assert (=> b!159373 (= res!133027 (bvsge (currentByte!7120 thiss!1602) (size!3434 (buf!3892 thiss!1602))))))

(assert (=> b!159373 (= lt!251588 (array!7581 (store (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602) lt!251582) (currentByte!7120 thiss!1602) lt!251585) (size!3434 (buf!3892 thiss!1602))))))

(assert (=> b!159373 (= lt!251585 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251582) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251586))))))

(assert (=> b!159373 (= lt!251582 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602))) lt!251581)))))

(assert (=> b!159373 (= lt!251581 ((_ sign_extend 24) lt!251578))))

(assert (=> b!159373 (= lt!251578 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251577)))))))

(assert (=> b!159373 (= lt!251577 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251586))))))

(assert (=> b!159373 (= lt!251586 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7115 thiss!1602))))))

(declare-fun res!133026 () Bool)

(assert (=> start!32214 (=> (not res!133026) (not e!108805))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32214 (= res!133026 (validate_offset_byte!0 ((_ sign_extend 32) (size!3434 (buf!3892 thiss!1602))) ((_ sign_extend 32) (currentByte!7120 thiss!1602)) ((_ sign_extend 32) (currentBit!7115 thiss!1602))))))

(assert (=> start!32214 e!108805))

(declare-fun inv!12 (BitStream!6036) Bool)

(assert (=> start!32214 (and (inv!12 thiss!1602) e!108806)))

(assert (=> start!32214 true))

(assert (= (and start!32214 res!133026) b!159373))

(assert (= (and b!159373 (not res!133027)) b!159375))

(assert (= (and b!159373 (not res!133025)) b!159372))

(assert (= (and b!159372 (not res!133028)) b!159371))

(assert (= start!32214 b!159374))

(declare-fun m!251073 () Bool)

(assert (=> b!159374 m!251073))

(declare-fun m!251075 () Bool)

(assert (=> b!159371 m!251075))

(declare-fun m!251077 () Bool)

(assert (=> b!159371 m!251077))

(declare-fun m!251079 () Bool)

(assert (=> b!159371 m!251079))

(assert (=> b!159371 m!251079))

(declare-fun m!251081 () Bool)

(assert (=> b!159371 m!251081))

(declare-fun m!251083 () Bool)

(assert (=> b!159371 m!251083))

(declare-fun m!251085 () Bool)

(assert (=> b!159371 m!251085))

(assert (=> b!159371 m!251079))

(declare-fun m!251087 () Bool)

(assert (=> b!159371 m!251087))

(declare-fun m!251089 () Bool)

(assert (=> b!159371 m!251089))

(declare-fun m!251091 () Bool)

(assert (=> b!159371 m!251091))

(declare-fun m!251093 () Bool)

(assert (=> b!159371 m!251093))

(declare-fun m!251095 () Bool)

(assert (=> b!159371 m!251095))

(declare-fun m!251097 () Bool)

(assert (=> start!32214 m!251097))

(declare-fun m!251099 () Bool)

(assert (=> start!32214 m!251099))

(declare-fun m!251101 () Bool)

(assert (=> b!159373 m!251101))

(declare-fun m!251103 () Bool)

(assert (=> b!159373 m!251103))

(declare-fun m!251105 () Bool)

(assert (=> b!159373 m!251105))

(declare-fun m!251107 () Bool)

(assert (=> b!159373 m!251107))

(declare-fun m!251109 () Bool)

(assert (=> b!159373 m!251109))

(assert (=> b!159373 m!251085))

(declare-fun m!251111 () Bool)

(assert (=> b!159373 m!251111))

(declare-fun m!251113 () Bool)

(assert (=> b!159373 m!251113))

(declare-fun m!251115 () Bool)

(assert (=> b!159373 m!251115))

(declare-fun m!251117 () Bool)

(assert (=> b!159373 m!251117))

(declare-fun m!251119 () Bool)

(assert (=> b!159373 m!251119))

(assert (=> b!159373 m!251095))

(assert (=> b!159375 m!251119))

(assert (=> b!159375 m!251119))

(declare-fun m!251121 () Bool)

(assert (=> b!159375 m!251121))

(check-sat (not b!159373) (not b!159371) (not b!159375) (not start!32214) (not b!159374))
(check-sat)
(get-model)

(declare-fun d!53589 () Bool)

(assert (=> d!53589 (= (byteRangesEq!0 (select (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602)) lt!251585 #b00000000000000000000000000000000 (currentBit!7115 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7115 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7115 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251585) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7115 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13284 () Bool)

(assert (= bs!13284 d!53589))

(declare-fun m!251257 () Bool)

(assert (=> bs!13284 m!251257))

(declare-fun m!251259 () Bool)

(assert (=> bs!13284 m!251259))

(assert (=> b!159375 d!53589))

(declare-fun d!53597 () Bool)

(declare-fun res!133083 () Bool)

(declare-fun e!108865 () Bool)

(assert (=> d!53597 (=> res!133083 e!108865)))

(assert (=> d!53597 (= res!133083 (= #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584))))))

(assert (=> d!53597 (= (arrayRangesEq!485 (buf!3892 thiss!1602) (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584))) e!108865)))

(declare-fun b!159433 () Bool)

(declare-fun e!108866 () Bool)

(assert (=> b!159433 (= e!108865 e!108866)))

(declare-fun res!133084 () Bool)

(assert (=> b!159433 (=> (not res!133084) (not e!108866))))

(assert (=> b!159433 (= res!133084 (= (select (arr!4355 (buf!3892 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4355 (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159434 () Bool)

(assert (=> b!159434 (= e!108866 (arrayRangesEq!485 (buf!3892 thiss!1602) (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7120 (_3!502 lt!251584))))))

(assert (= (and d!53597 (not res!133083)) b!159433))

(assert (= (and b!159433 res!133084) b!159434))

(declare-fun m!251261 () Bool)

(assert (=> b!159433 m!251261))

(declare-fun m!251263 () Bool)

(assert (=> b!159433 m!251263))

(declare-fun m!251265 () Bool)

(assert (=> b!159434 m!251265))

(assert (=> b!159371 d!53597))

(declare-fun d!53599 () Bool)

(declare-fun e!108869 () Bool)

(assert (=> d!53599 e!108869))

(declare-fun res!133087 () Bool)

(assert (=> d!53599 (=> (not res!133087) (not e!108869))))

(assert (=> d!53599 (= res!133087 (and (bvsge (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000000) (bvslt (currentByte!7120 (_3!502 lt!251584)) (size!3434 lt!251588))))))

(declare-fun lt!251647 () Unit!10827)

(declare-fun choose!130 (array!7580 (_ BitVec 32) (_ BitVec 8)) Unit!10827)

(assert (=> d!53599 (= lt!251647 (choose!130 lt!251588 (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))))))

(assert (=> d!53599 (and (bvsle #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584))) (bvslt (currentByte!7120 (_3!502 lt!251584)) (size!3434 lt!251588)))))

(assert (=> d!53599 (= (arrayUpdatedAtPrefixLemma!93 lt!251588 (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) lt!251647)))

(declare-fun b!159437 () Bool)

(assert (=> b!159437 (= e!108869 (arrayRangesEq!485 lt!251588 (array!7581 (store (arr!4355 lt!251588) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 lt!251588)) #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584))))))

(assert (= (and d!53599 res!133087) b!159437))

(assert (=> d!53599 m!251079))

(declare-fun m!251267 () Bool)

(assert (=> d!53599 m!251267))

(declare-fun m!251269 () Bool)

(assert (=> b!159437 m!251269))

(declare-fun m!251271 () Bool)

(assert (=> b!159437 m!251271))

(assert (=> b!159371 d!53599))

(declare-fun d!53601 () Bool)

(declare-fun e!108870 () Bool)

(assert (=> d!53601 e!108870))

(declare-fun res!133088 () Bool)

(assert (=> d!53601 (=> (not res!133088) (not e!108870))))

(assert (=> d!53601 (= res!133088 (and (bvsge (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000000) (bvslt (currentByte!7120 (_3!502 lt!251584)) (size!3434 (buf!3892 thiss!1602)))))))

(declare-fun lt!251648 () Unit!10827)

(assert (=> d!53601 (= lt!251648 (choose!130 (buf!3892 thiss!1602) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))))))

(assert (=> d!53601 (and (bvsle #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584))) (bvslt (currentByte!7120 (_3!502 lt!251584)) (size!3434 (buf!3892 thiss!1602))))))

(assert (=> d!53601 (= (arrayUpdatedAtPrefixLemma!93 (buf!3892 thiss!1602) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) lt!251648)))

(declare-fun b!159438 () Bool)

(assert (=> b!159438 (= e!108870 (arrayRangesEq!485 (buf!3892 thiss!1602) (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584))))))

(assert (= (and d!53601 res!133088) b!159438))

(assert (=> d!53601 m!251079))

(declare-fun m!251273 () Bool)

(assert (=> d!53601 m!251273))

(assert (=> b!159438 m!251089))

(assert (=> b!159438 m!251093))

(assert (=> b!159371 d!53601))

(declare-fun d!53603 () Bool)

(declare-fun res!133089 () Bool)

(declare-fun e!108871 () Bool)

(assert (=> d!53603 (=> res!133089 e!108871)))

(assert (=> d!53603 (= res!133089 (= #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)))))

(assert (=> d!53603 (= (arrayRangesEq!485 (buf!3892 thiss!1602) (buf!3892 (_3!502 lt!251584)) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)) e!108871)))

(declare-fun b!159439 () Bool)

(declare-fun e!108872 () Bool)

(assert (=> b!159439 (= e!108871 e!108872)))

(declare-fun res!133090 () Bool)

(assert (=> b!159439 (=> (not res!133090) (not e!108872))))

(assert (=> b!159439 (= res!133090 (= (select (arr!4355 (buf!3892 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) #b00000000000000000000000000000000)))))

(declare-fun b!159440 () Bool)

(assert (=> b!159440 (= e!108872 (arrayRangesEq!485 (buf!3892 thiss!1602) (buf!3892 (_3!502 lt!251584)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)))))

(assert (= (and d!53603 (not res!133089)) b!159439))

(assert (= (and b!159439 res!133090) b!159440))

(assert (=> b!159439 m!251261))

(declare-fun m!251275 () Bool)

(assert (=> b!159439 m!251275))

(declare-fun m!251277 () Bool)

(assert (=> b!159440 m!251277))

(assert (=> b!159371 d!53603))

(declare-fun d!53605 () Bool)

(assert (=> d!53605 (arrayRangesEq!485 (buf!3892 thiss!1602) (buf!3892 (_3!502 lt!251584)) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001))))

(declare-fun lt!251651 () Unit!10827)

(declare-fun choose!132 (array!7580 array!7580 array!7580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10827)

(assert (=> d!53605 (= lt!251651 (choose!132 (buf!3892 thiss!1602) lt!251588 (buf!3892 (_3!502 lt!251584)) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) (currentByte!7120 (_3!502 lt!251584))))))

(assert (=> d!53605 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) (currentByte!7120 (_3!502 lt!251584))))))

(assert (=> d!53605 (= (arrayRangesEqTransitive!128 (buf!3892 thiss!1602) lt!251588 (buf!3892 (_3!502 lt!251584)) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) (currentByte!7120 (_3!502 lt!251584))) lt!251651)))

(declare-fun bs!13285 () Bool)

(assert (= bs!13285 d!53605))

(assert (=> bs!13285 m!251083))

(declare-fun m!251279 () Bool)

(assert (=> bs!13285 m!251279))

(assert (=> b!159371 d!53605))

(declare-fun d!53607 () Bool)

(declare-fun res!133091 () Bool)

(declare-fun e!108873 () Bool)

(assert (=> d!53607 (=> res!133091 e!108873)))

(assert (=> d!53607 (= res!133091 (= #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584))))))

(assert (=> d!53607 (= (arrayRangesEq!485 lt!251588 (array!7581 (store (store (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602) lt!251582) (currentByte!7120 thiss!1602) lt!251585) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7120 (_3!502 lt!251584))) e!108873)))

(declare-fun b!159441 () Bool)

(declare-fun e!108874 () Bool)

(assert (=> b!159441 (= e!108873 e!108874)))

(declare-fun res!133092 () Bool)

(assert (=> b!159441 (=> (not res!133092) (not e!108874))))

(assert (=> b!159441 (= res!133092 (= (select (arr!4355 lt!251588) #b00000000000000000000000000000000) (select (arr!4355 (array!7581 (store (store (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602) lt!251582) (currentByte!7120 thiss!1602) lt!251585) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159442 () Bool)

(assert (=> b!159442 (= e!108874 (arrayRangesEq!485 lt!251588 (array!7581 (store (store (store (arr!4355 (buf!3892 thiss!1602)) (currentByte!7120 thiss!1602) lt!251582) (currentByte!7120 thiss!1602) lt!251585) (currentByte!7120 (_3!502 lt!251584)) (select (arr!4355 (buf!3892 (_3!502 lt!251584))) (currentByte!7120 (_3!502 lt!251584)))) (size!3434 (buf!3892 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7120 (_3!502 lt!251584))))))

(assert (= (and d!53607 (not res!133091)) b!159441))

(assert (= (and b!159441 res!133092) b!159442))

(declare-fun m!251281 () Bool)

(assert (=> b!159441 m!251281))

(declare-fun m!251283 () Bool)

(assert (=> b!159441 m!251283))

(declare-fun m!251285 () Bool)

(assert (=> b!159442 m!251285))

(assert (=> b!159371 d!53607))

(declare-fun d!53609 () Bool)

(declare-fun res!133093 () Bool)

(declare-fun e!108875 () Bool)

(assert (=> d!53609 (=> res!133093 e!108875)))

(assert (=> d!53609 (= res!133093 (= #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)))))

(assert (=> d!53609 (= (arrayRangesEq!485 (buf!3892 thiss!1602) lt!251588 #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)) e!108875)))

(declare-fun b!159443 () Bool)

(declare-fun e!108876 () Bool)

(assert (=> b!159443 (= e!108875 e!108876)))

(declare-fun res!133094 () Bool)

(assert (=> b!159443 (=> (not res!133094) (not e!108876))))

(assert (=> b!159443 (= res!133094 (= (select (arr!4355 (buf!3892 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4355 lt!251588) #b00000000000000000000000000000000)))))

(declare-fun b!159444 () Bool)

(assert (=> b!159444 (= e!108876 (arrayRangesEq!485 (buf!3892 thiss!1602) lt!251588 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)))))

(assert (= (and d!53609 (not res!133093)) b!159443))

(assert (= (and b!159443 res!133094) b!159444))

(assert (=> b!159443 m!251261))

(assert (=> b!159443 m!251281))

(declare-fun m!251287 () Bool)

(assert (=> b!159444 m!251287))

(assert (=> b!159373 d!53609))

(declare-fun d!53611 () Bool)

(declare-fun res!133095 () Bool)

(declare-fun e!108877 () Bool)

(assert (=> d!53611 (=> res!133095 e!108877)))

(assert (=> d!53611 (= res!133095 (= #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)))))

(assert (=> d!53611 (= (arrayRangesEq!485 (buf!3892 thiss!1602) (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) lt!251587) (size!3434 (buf!3892 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)) e!108877)))

(declare-fun b!159445 () Bool)

(declare-fun e!108878 () Bool)

(assert (=> b!159445 (= e!108877 e!108878)))

(declare-fun res!133096 () Bool)

(assert (=> b!159445 (=> (not res!133096) (not e!108878))))

(assert (=> b!159445 (= res!133096 (= (select (arr!4355 (buf!3892 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4355 (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) lt!251587) (size!3434 (buf!3892 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159446 () Bool)

(assert (=> b!159446 (= e!108878 (arrayRangesEq!485 (buf!3892 thiss!1602) (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) lt!251587) (size!3434 (buf!3892 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)))))

(assert (= (and d!53611 (not res!133095)) b!159445))

(assert (= (and b!159445 res!133096) b!159446))

(assert (=> b!159445 m!251261))

(declare-fun m!251289 () Bool)

(assert (=> b!159445 m!251289))

(declare-fun m!251291 () Bool)

(assert (=> b!159446 m!251291))

(assert (=> b!159373 d!53611))

(declare-fun d!53613 () Bool)

(declare-fun e!108879 () Bool)

(assert (=> d!53613 e!108879))

(declare-fun res!133097 () Bool)

(assert (=> d!53613 (=> (not res!133097) (not e!108879))))

(assert (=> d!53613 (= res!133097 (and (bvsge (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) (size!3434 (buf!3892 thiss!1602)))))))

(declare-fun lt!251652 () Unit!10827)

(assert (=> d!53613 (= lt!251652 (choose!130 (buf!3892 thiss!1602) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) lt!251587))))

(assert (=> d!53613 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) (size!3434 (buf!3892 thiss!1602))))))

(assert (=> d!53613 (= (arrayUpdatedAtPrefixLemma!93 (buf!3892 thiss!1602) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) lt!251587) lt!251652)))

(declare-fun b!159447 () Bool)

(assert (=> b!159447 (= e!108879 (arrayRangesEq!485 (buf!3892 thiss!1602) (array!7581 (store (arr!4355 (buf!3892 thiss!1602)) (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001) lt!251587) (size!3434 (buf!3892 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7120 (_3!502 lt!251584)) #b00000000000000000000000000000001)))))

(assert (= (and d!53613 res!133097) b!159447))

(declare-fun m!251293 () Bool)

(assert (=> d!53613 m!251293))

(assert (=> b!159447 m!251115))

(assert (=> b!159447 m!251113))

(assert (=> b!159373 d!53613))

(declare-fun d!53615 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53615 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3434 (buf!3892 thiss!1602))) ((_ sign_extend 32) (currentByte!7120 thiss!1602)) ((_ sign_extend 32) (currentBit!7115 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3434 (buf!3892 thiss!1602))) ((_ sign_extend 32) (currentByte!7120 thiss!1602)) ((_ sign_extend 32) (currentBit!7115 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13286 () Bool)

(assert (= bs!13286 d!53615))

(declare-fun m!251295 () Bool)

(assert (=> bs!13286 m!251295))

(assert (=> start!32214 d!53615))

(declare-fun d!53617 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53617 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7115 thiss!1602) (currentByte!7120 thiss!1602) (size!3434 (buf!3892 thiss!1602))))))

(declare-fun bs!13287 () Bool)

(assert (= bs!13287 d!53617))

(declare-fun m!251297 () Bool)

(assert (=> bs!13287 m!251297))

(assert (=> start!32214 d!53617))

(declare-fun d!53619 () Bool)

(assert (=> d!53619 (= (array_inv!3181 (buf!3892 thiss!1602)) (bvsge (size!3434 (buf!3892 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159374 d!53619))

(check-sat (not b!159438) (not b!159440) (not d!53617) (not b!159434) (not d!53605) (not d!53613) (not b!159446) (not d!53599) (not d!53601) (not b!159437) (not b!159444) (not b!159442) (not d!53615) (not b!159447))
(check-sat)

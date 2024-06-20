; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33510 () Bool)

(assert start!33510)

(declare-fun res!134188 () Bool)

(declare-fun e!110700 () Bool)

(assert (=> start!33510 (=> (not res!134188) (not e!110700))))

(declare-datatypes ((array!7924 0))(
  ( (array!7925 (arr!4481 (Array (_ BitVec 32) (_ BitVec 8))) (size!3560 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6288 0))(
  ( (BitStream!6289 (buf!4018 array!7924) (currentByte!7478 (_ BitVec 32)) (currentBit!7473 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6288)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33510 (= res!134188 (validate_offset_byte!0 ((_ sign_extend 32) (size!3560 (buf!4018 thiss!1602))) ((_ sign_extend 32) (currentByte!7478 thiss!1602)) ((_ sign_extend 32) (currentBit!7473 thiss!1602))))))

(assert (=> start!33510 e!110700))

(declare-fun e!110698 () Bool)

(declare-fun inv!12 (BitStream!6288) Bool)

(assert (=> start!33510 (and (inv!12 thiss!1602) e!110698)))

(assert (=> start!33510 true))

(declare-fun b!161002 () Bool)

(declare-datatypes ((Unit!11010 0))(
  ( (Unit!11011) )
))
(declare-datatypes ((tuple3!848 0))(
  ( (tuple3!849 (_1!7775 Unit!11010) (_2!7775 (_ BitVec 8)) (_3!541 BitStream!6288)) )
))
(declare-fun lt!253538 () tuple3!848)

(assert (=> b!161002 (= e!110700 (not (or (= (bvand (currentByte!7478 (_3!541 lt!253538)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7478 (_3!541 lt!253538)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun lt!253532 () (_ BitVec 8))

(declare-fun arrayRangesEq!512 (array!7924 array!7924 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161002 (arrayRangesEq!512 (buf!4018 thiss!1602) (array!7925 (store (arr!4481 (buf!4018 thiss!1602)) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) lt!253532) (size!3560 (buf!4018 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001))))

(declare-fun lt!253530 () Unit!11010)

(declare-fun arrayUpdatedAtPrefixLemma!120 (array!7924 (_ BitVec 32) (_ BitVec 8)) Unit!11010)

(assert (=> b!161002 (= lt!253530 (arrayUpdatedAtPrefixLemma!120 (buf!4018 thiss!1602) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) lt!253532))))

(assert (=> b!161002 (= lt!253532 (select (arr!4481 (buf!4018 (_3!541 lt!253538))) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001)))))

(declare-fun lt!253533 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253534 () (_ BitVec 32))

(declare-fun lt!253536 () array!7924)

(declare-fun lt!253535 () (_ BitVec 32))

(declare-fun lt!253537 () (_ BitVec 32))

(declare-fun lt!253539 () (_ BitVec 8))

(declare-fun lt!253531 () (_ BitVec 8))

(declare-fun Unit!11012 () Unit!11010)

(declare-fun Unit!11013 () Unit!11010)

(assert (=> b!161002 (= lt!253538 (ite (bvsgt lt!253537 #b00000000000000000000000000000000) (let ((bdg!9573 ((_ extract 7 0) (bvnot lt!253534)))) (let ((bdg!9574 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4481 (buf!4018 thiss!1602)) (currentByte!7478 thiss!1602) lt!253539) (currentByte!7478 thiss!1602) lt!253533) (bvadd #b00000000000000000000000000000001 (currentByte!7478 thiss!1602)))) ((_ sign_extend 24) bdg!9573))))) (tuple3!849 Unit!11012 bdg!9573 (BitStream!6289 (array!7925 (store (arr!4481 (array!7925 (store (arr!4481 lt!253536) (bvadd #b00000000000000000000000000000001 (currentByte!7478 thiss!1602)) bdg!9574) (size!3560 lt!253536))) (bvadd #b00000000000000000000000000000001 (currentByte!7478 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9574) (bvshl ((_ sign_extend 24) v!222) lt!253535)))) (size!3560 (array!7925 (store (arr!4481 lt!253536) (bvadd #b00000000000000000000000000000001 (currentByte!7478 thiss!1602)) bdg!9574) (size!3560 lt!253536)))) (bvadd #b00000000000000000000000000000001 (currentByte!7478 thiss!1602)) (currentBit!7473 thiss!1602))))) (tuple3!849 Unit!11013 lt!253531 (BitStream!6289 lt!253536 (bvadd #b00000000000000000000000000000001 (currentByte!7478 thiss!1602)) (currentBit!7473 thiss!1602)))))))

(declare-fun e!110697 () Bool)

(assert (=> b!161002 e!110697))

(declare-fun res!134189 () Bool)

(assert (=> b!161002 (=> res!134189 e!110697)))

(assert (=> b!161002 (= res!134189 (bvsge (currentByte!7478 thiss!1602) (size!3560 (buf!4018 thiss!1602))))))

(assert (=> b!161002 (= lt!253536 (array!7925 (store (store (arr!4481 (buf!4018 thiss!1602)) (currentByte!7478 thiss!1602) lt!253539) (currentByte!7478 thiss!1602) lt!253533) (size!3560 (buf!4018 thiss!1602))))))

(assert (=> b!161002 (= lt!253533 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253539) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253537))))))

(assert (=> b!161002 (= lt!253539 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4481 (buf!4018 thiss!1602)) (currentByte!7478 thiss!1602))) lt!253534)))))

(assert (=> b!161002 (= lt!253534 ((_ sign_extend 24) lt!253531))))

(assert (=> b!161002 (= lt!253531 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253535)))))))

(assert (=> b!161002 (= lt!253535 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253537))))))

(assert (=> b!161002 (= lt!253537 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7473 thiss!1602))))))

(declare-fun b!161003 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161003 (= e!110697 (byteRangesEq!0 (select (arr!4481 (buf!4018 thiss!1602)) (currentByte!7478 thiss!1602)) lt!253533 #b00000000000000000000000000000000 (currentBit!7473 thiss!1602)))))

(declare-fun b!161004 () Bool)

(declare-fun array_inv!3307 (array!7924) Bool)

(assert (=> b!161004 (= e!110698 (array_inv!3307 (buf!4018 thiss!1602)))))

(assert (= (and start!33510 res!134188) b!161002))

(assert (= (and b!161002 (not res!134189)) b!161003))

(assert (= start!33510 b!161004))

(declare-fun m!254623 () Bool)

(assert (=> start!33510 m!254623))

(declare-fun m!254625 () Bool)

(assert (=> start!33510 m!254625))

(declare-fun m!254627 () Bool)

(assert (=> b!161002 m!254627))

(declare-fun m!254629 () Bool)

(assert (=> b!161002 m!254629))

(declare-fun m!254631 () Bool)

(assert (=> b!161002 m!254631))

(declare-fun m!254633 () Bool)

(assert (=> b!161002 m!254633))

(declare-fun m!254635 () Bool)

(assert (=> b!161002 m!254635))

(declare-fun m!254637 () Bool)

(assert (=> b!161002 m!254637))

(declare-fun m!254639 () Bool)

(assert (=> b!161002 m!254639))

(declare-fun m!254641 () Bool)

(assert (=> b!161002 m!254641))

(declare-fun m!254643 () Bool)

(assert (=> b!161002 m!254643))

(declare-fun m!254645 () Bool)

(assert (=> b!161002 m!254645))

(declare-fun m!254647 () Bool)

(assert (=> b!161002 m!254647))

(assert (=> b!161003 m!254639))

(assert (=> b!161003 m!254639))

(declare-fun m!254649 () Bool)

(assert (=> b!161003 m!254649))

(declare-fun m!254651 () Bool)

(assert (=> b!161004 m!254651))

(check-sat (not b!161004) (not b!161003) (not start!33510) (not b!161002))
(check-sat)
(get-model)

(declare-fun d!54919 () Bool)

(assert (=> d!54919 (= (array_inv!3307 (buf!4018 thiss!1602)) (bvsge (size!3560 (buf!4018 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161004 d!54919))

(declare-fun d!54921 () Bool)

(assert (=> d!54921 (= (byteRangesEq!0 (select (arr!4481 (buf!4018 thiss!1602)) (currentByte!7478 thiss!1602)) lt!253533 #b00000000000000000000000000000000 (currentBit!7473 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7473 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4481 (buf!4018 thiss!1602)) (currentByte!7478 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7473 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253533) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7473 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13672 () Bool)

(assert (= bs!13672 d!54921))

(declare-fun m!254683 () Bool)

(assert (=> bs!13672 m!254683))

(declare-fun m!254687 () Bool)

(assert (=> bs!13672 m!254687))

(assert (=> b!161003 d!54921))

(declare-fun d!54927 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54927 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3560 (buf!4018 thiss!1602))) ((_ sign_extend 32) (currentByte!7478 thiss!1602)) ((_ sign_extend 32) (currentBit!7473 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3560 (buf!4018 thiss!1602))) ((_ sign_extend 32) (currentByte!7478 thiss!1602)) ((_ sign_extend 32) (currentBit!7473 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13675 () Bool)

(assert (= bs!13675 d!54927))

(declare-fun m!254691 () Bool)

(assert (=> bs!13675 m!254691))

(assert (=> start!33510 d!54927))

(declare-fun d!54931 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54931 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7473 thiss!1602) (currentByte!7478 thiss!1602) (size!3560 (buf!4018 thiss!1602))))))

(declare-fun bs!13676 () Bool)

(assert (= bs!13676 d!54931))

(declare-fun m!254699 () Bool)

(assert (=> bs!13676 m!254699))

(assert (=> start!33510 d!54931))

(declare-fun d!54935 () Bool)

(declare-fun res!134206 () Bool)

(declare-fun e!110723 () Bool)

(assert (=> d!54935 (=> res!134206 e!110723)))

(assert (=> d!54935 (= res!134206 (= #b00000000000000000000000000000000 (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001)))))

(assert (=> d!54935 (= (arrayRangesEq!512 (buf!4018 thiss!1602) (array!7925 (store (arr!4481 (buf!4018 thiss!1602)) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) lt!253532) (size!3560 (buf!4018 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001)) e!110723)))

(declare-fun b!161024 () Bool)

(declare-fun e!110724 () Bool)

(assert (=> b!161024 (= e!110723 e!110724)))

(declare-fun res!134207 () Bool)

(assert (=> b!161024 (=> (not res!134207) (not e!110724))))

(assert (=> b!161024 (= res!134207 (= (select (arr!4481 (buf!4018 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4481 (array!7925 (store (arr!4481 (buf!4018 thiss!1602)) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) lt!253532) (size!3560 (buf!4018 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161025 () Bool)

(assert (=> b!161025 (= e!110724 (arrayRangesEq!512 (buf!4018 thiss!1602) (array!7925 (store (arr!4481 (buf!4018 thiss!1602)) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) lt!253532) (size!3560 (buf!4018 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001)))))

(assert (= (and d!54935 (not res!134206)) b!161024))

(assert (= (and b!161024 res!134207) b!161025))

(declare-fun m!254701 () Bool)

(assert (=> b!161024 m!254701))

(declare-fun m!254703 () Bool)

(assert (=> b!161024 m!254703))

(declare-fun m!254705 () Bool)

(assert (=> b!161025 m!254705))

(assert (=> b!161002 d!54935))

(declare-fun d!54937 () Bool)

(declare-fun e!110730 () Bool)

(assert (=> d!54937 e!110730))

(declare-fun res!134213 () Bool)

(assert (=> d!54937 (=> (not res!134213) (not e!110730))))

(assert (=> d!54937 (= res!134213 (and (bvsge (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) (size!3560 (buf!4018 thiss!1602)))))))

(declare-fun lt!253575 () Unit!11010)

(declare-fun choose!151 (array!7924 (_ BitVec 32) (_ BitVec 8)) Unit!11010)

(assert (=> d!54937 (= lt!253575 (choose!151 (buf!4018 thiss!1602) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) lt!253532))))

(assert (=> d!54937 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) (size!3560 (buf!4018 thiss!1602))))))

(assert (=> d!54937 (= (arrayUpdatedAtPrefixLemma!120 (buf!4018 thiss!1602) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) lt!253532) lt!253575)))

(declare-fun b!161031 () Bool)

(assert (=> b!161031 (= e!110730 (arrayRangesEq!512 (buf!4018 thiss!1602) (array!7925 (store (arr!4481 (buf!4018 thiss!1602)) (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001) lt!253532) (size!3560 (buf!4018 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7478 (_3!541 lt!253538)) #b00000000000000000000000000000001)))))

(assert (= (and d!54937 res!134213) b!161031))

(declare-fun m!254709 () Bool)

(assert (=> d!54937 m!254709))

(assert (=> b!161031 m!254641))

(assert (=> b!161031 m!254647))

(assert (=> b!161002 d!54937))

(check-sat (not d!54927) (not d!54931) (not b!161025) (not d!54937) (not b!161031))
(check-sat)

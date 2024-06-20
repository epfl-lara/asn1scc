; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34476 () Bool)

(assert start!34476)

(declare-fun b!163611 () Bool)

(declare-fun e!113008 () Bool)

(declare-datatypes ((array!8148 0))(
  ( (array!8149 (arr!4570 (Array (_ BitVec 32) (_ BitVec 8))) (size!3649 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6454 0))(
  ( (BitStream!6455 (buf!4101 array!8148) (currentByte!7654 (_ BitVec 32)) (currentBit!7649 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14528 0))(
  ( (tuple2!14529 (_1!7855 BitStream!6454) (_2!7855 BitStream!6454)) )
))
(declare-fun lt!256727 () tuple2!14528)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163611 (= e!113008 (validate_offset_bits!1 ((_ sign_extend 32) (size!3649 (buf!4101 (_1!7855 lt!256727)))) ((_ sign_extend 32) (currentByte!7654 (_1!7855 lt!256727))) ((_ sign_extend 32) (currentBit!7649 (_1!7855 lt!256727))) ((_ sign_extend 32) nBits!511)))))

(declare-fun thiss!1577 () BitStream!6454)

(declare-datatypes ((Unit!11354 0))(
  ( (Unit!11355) )
))
(declare-datatypes ((tuple2!14530 0))(
  ( (tuple2!14531 (_1!7856 Unit!11354) (_2!7856 BitStream!6454)) )
))
(declare-fun lt!256723 () tuple2!14530)

(declare-fun reader!0 (BitStream!6454 BitStream!6454) tuple2!14528)

(assert (=> b!163611 (= lt!256727 (reader!0 thiss!1577 (_2!7856 lt!256723)))))

(declare-fun res!136338 () Bool)

(declare-fun e!113010 () Bool)

(assert (=> start!34476 (=> (not res!136338) (not e!113010))))

(assert (=> start!34476 (= res!136338 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34476 e!113010))

(assert (=> start!34476 true))

(declare-fun e!113009 () Bool)

(declare-fun inv!12 (BitStream!6454) Bool)

(assert (=> start!34476 (and (inv!12 thiss!1577) e!113009)))

(declare-fun b!163612 () Bool)

(declare-fun e!113007 () Bool)

(assert (=> b!163612 (= e!113010 (not e!113007))))

(declare-fun res!136337 () Bool)

(assert (=> b!163612 (=> res!136337 e!113007)))

(declare-fun lt!256726 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163612 (= res!136337 (not (byteRangesEq!0 (select (arr!4570 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577)) lt!256726 #b00000000000000000000000000000000 (currentBit!7649 thiss!1577))))))

(declare-fun lt!256724 () array!8148)

(declare-fun arrayRangesEq!583 (array!8148 array!8148 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163612 (arrayRangesEq!583 (buf!4101 thiss!1577) lt!256724 #b00000000000000000000000000000000 (currentByte!7654 thiss!1577))))

(declare-fun lt!256725 () Unit!11354)

(declare-fun arrayUpdatedAtPrefixLemma!191 (array!8148 (_ BitVec 32) (_ BitVec 8)) Unit!11354)

(assert (=> b!163612 (= lt!256725 (arrayUpdatedAtPrefixLemma!191 (buf!4101 thiss!1577) (currentByte!7654 thiss!1577) lt!256726))))

(assert (=> b!163612 (= lt!256724 (array!8149 (store (arr!4570 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577) lt!256726) (size!3649 (buf!4101 thiss!1577))))))

(declare-fun lt!256728 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163612 (= lt!256726 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4570 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7649 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256728)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256728))))))

(assert (=> b!163612 (= lt!256728 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7649 thiss!1577) nBits!511)))))

(declare-fun b!163613 () Bool)

(declare-fun array_inv!3390 (array!8148) Bool)

(assert (=> b!163613 (= e!113009 (array_inv!3390 (buf!4101 thiss!1577)))))

(declare-fun b!163614 () Bool)

(assert (=> b!163614 (= e!113007 e!113008)))

(declare-fun res!136336 () Bool)

(assert (=> b!163614 (=> res!136336 e!113008)))

(assert (=> b!163614 (= res!136336 (not (= (size!3649 (buf!4101 thiss!1577)) (size!3649 (buf!4101 (_2!7856 lt!256723))))))))

(declare-fun moveBitIndex!0 (BitStream!6454 (_ BitVec 64)) tuple2!14530)

(assert (=> b!163614 (= lt!256723 (moveBitIndex!0 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163615 () Bool)

(declare-fun res!136335 () Bool)

(assert (=> b!163615 (=> (not res!136335) (not e!113010))))

(assert (=> b!163615 (= res!136335 (validate_offset_bits!1 ((_ sign_extend 32) (size!3649 (buf!4101 thiss!1577))) ((_ sign_extend 32) (currentByte!7654 thiss!1577)) ((_ sign_extend 32) (currentBit!7649 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163616 () Bool)

(declare-fun res!136333 () Bool)

(assert (=> b!163616 (=> res!136333 e!113008)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163616 (= res!136333 (not (= (bitIndex!0 (size!3649 (buf!4101 (_2!7856 lt!256723))) (currentByte!7654 (_2!7856 lt!256723)) (currentBit!7649 (_2!7856 lt!256723))) (bvadd (bitIndex!0 (size!3649 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!163617 () Bool)

(declare-fun res!136332 () Bool)

(assert (=> b!163617 (=> (not res!136332) (not e!113010))))

(assert (=> b!163617 (= res!136332 (bvsle (bvadd (currentBit!7649 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163618 () Bool)

(declare-fun res!136334 () Bool)

(assert (=> b!163618 (=> res!136334 e!113008)))

(declare-fun isPrefixOf!0 (BitStream!6454 BitStream!6454) Bool)

(assert (=> b!163618 (= res!136334 (not (isPrefixOf!0 thiss!1577 (_2!7856 lt!256723))))))

(assert (= (and start!34476 res!136338) b!163615))

(assert (= (and b!163615 res!136335) b!163617))

(assert (= (and b!163617 res!136332) b!163612))

(assert (= (and b!163612 (not res!136337)) b!163614))

(assert (= (and b!163614 (not res!136336)) b!163616))

(assert (= (and b!163616 (not res!136333)) b!163618))

(assert (= (and b!163618 (not res!136334)) b!163611))

(assert (= start!34476 b!163613))

(declare-fun m!259689 () Bool)

(assert (=> b!163616 m!259689))

(declare-fun m!259691 () Bool)

(assert (=> b!163616 m!259691))

(declare-fun m!259693 () Bool)

(assert (=> start!34476 m!259693))

(declare-fun m!259695 () Bool)

(assert (=> b!163618 m!259695))

(declare-fun m!259697 () Bool)

(assert (=> b!163615 m!259697))

(declare-fun m!259699 () Bool)

(assert (=> b!163613 m!259699))

(declare-fun m!259701 () Bool)

(assert (=> b!163614 m!259701))

(declare-fun m!259703 () Bool)

(assert (=> b!163612 m!259703))

(declare-fun m!259705 () Bool)

(assert (=> b!163612 m!259705))

(declare-fun m!259707 () Bool)

(assert (=> b!163612 m!259707))

(declare-fun m!259709 () Bool)

(assert (=> b!163612 m!259709))

(declare-fun m!259711 () Bool)

(assert (=> b!163612 m!259711))

(declare-fun m!259713 () Bool)

(assert (=> b!163612 m!259713))

(declare-fun m!259715 () Bool)

(assert (=> b!163612 m!259715))

(assert (=> b!163612 m!259707))

(declare-fun m!259717 () Bool)

(assert (=> b!163612 m!259717))

(declare-fun m!259719 () Bool)

(assert (=> b!163611 m!259719))

(declare-fun m!259721 () Bool)

(assert (=> b!163611 m!259721))

(push 1)

(assert (not b!163614))

(assert (not b!163616))

(assert (not start!34476))

(assert (not b!163612))

(assert (not b!163611))

(assert (not b!163615))

(assert (not b!163618))

(assert (not b!163613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56455 () Bool)

(declare-fun res!136389 () Bool)

(declare-fun e!113046 () Bool)

(assert (=> d!56455 (=> (not res!136389) (not e!113046))))

(assert (=> d!56455 (= res!136389 (= (size!3649 (buf!4101 thiss!1577)) (size!3649 (buf!4101 (_2!7856 lt!256723)))))))

(assert (=> d!56455 (= (isPrefixOf!0 thiss!1577 (_2!7856 lt!256723)) e!113046)))

(declare-fun b!163673 () Bool)

(declare-fun res!136388 () Bool)

(assert (=> b!163673 (=> (not res!136388) (not e!113046))))

(assert (=> b!163673 (= res!136388 (bvsle (bitIndex!0 (size!3649 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)) (bitIndex!0 (size!3649 (buf!4101 (_2!7856 lt!256723))) (currentByte!7654 (_2!7856 lt!256723)) (currentBit!7649 (_2!7856 lt!256723)))))))

(declare-fun b!163674 () Bool)

(declare-fun e!113047 () Bool)

(assert (=> b!163674 (= e!113046 e!113047)))

(declare-fun res!136387 () Bool)

(assert (=> b!163674 (=> res!136387 e!113047)))

(assert (=> b!163674 (= res!136387 (= (size!3649 (buf!4101 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!163675 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8148 array!8148 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163675 (= e!113047 (arrayBitRangesEq!0 (buf!4101 thiss!1577) (buf!4101 (_2!7856 lt!256723)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3649 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))))))

(assert (= (and d!56455 res!136389) b!163673))

(assert (= (and b!163673 res!136388) b!163674))

(assert (= (and b!163674 (not res!136387)) b!163675))

(assert (=> b!163673 m!259691))

(assert (=> b!163673 m!259689))

(assert (=> b!163675 m!259691))

(assert (=> b!163675 m!259691))

(declare-fun m!259791 () Bool)

(assert (=> b!163675 m!259791))

(assert (=> b!163618 d!56455))

(declare-fun d!56457 () Bool)

(assert (=> d!56457 (= (array_inv!3390 (buf!4101 thiss!1577)) (bvsge (size!3649 (buf!4101 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163613 d!56457))

(declare-fun d!56459 () Bool)

(assert (=> d!56459 (= (byteRangesEq!0 (select (arr!4570 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577)) lt!256726 #b00000000000000000000000000000000 (currentBit!7649 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7649 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4570 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7649 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256726) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7649 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13982 () Bool)

(assert (= bs!13982 d!56459))

(declare-fun m!259793 () Bool)

(assert (=> bs!13982 m!259793))

(declare-fun m!259795 () Bool)

(assert (=> bs!13982 m!259795))

(assert (=> b!163612 d!56459))

(declare-fun d!56461 () Bool)

(declare-fun res!136394 () Bool)

(declare-fun e!113052 () Bool)

(assert (=> d!56461 (=> res!136394 e!113052)))

(assert (=> d!56461 (= res!136394 (= #b00000000000000000000000000000000 (currentByte!7654 thiss!1577)))))

(assert (=> d!56461 (= (arrayRangesEq!583 (buf!4101 thiss!1577) lt!256724 #b00000000000000000000000000000000 (currentByte!7654 thiss!1577)) e!113052)))

(declare-fun b!163680 () Bool)

(declare-fun e!113053 () Bool)

(assert (=> b!163680 (= e!113052 e!113053)))

(declare-fun res!136395 () Bool)

(assert (=> b!163680 (=> (not res!136395) (not e!113053))))

(assert (=> b!163680 (= res!136395 (= (select (arr!4570 (buf!4101 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4570 lt!256724) #b00000000000000000000000000000000)))))

(declare-fun b!163681 () Bool)

(assert (=> b!163681 (= e!113053 (arrayRangesEq!583 (buf!4101 thiss!1577) lt!256724 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7654 thiss!1577)))))

(assert (= (and d!56461 (not res!136394)) b!163680))

(assert (= (and b!163680 res!136395) b!163681))

(declare-fun m!259797 () Bool)

(assert (=> b!163680 m!259797))

(declare-fun m!259799 () Bool)

(assert (=> b!163680 m!259799))

(declare-fun m!259801 () Bool)

(assert (=> b!163681 m!259801))

(assert (=> b!163612 d!56461))

(declare-fun d!56463 () Bool)

(declare-fun e!113056 () Bool)

(assert (=> d!56463 e!113056))

(declare-fun res!136398 () Bool)

(assert (=> d!56463 (=> (not res!136398) (not e!113056))))

(assert (=> d!56463 (= res!136398 (and (bvsge (currentByte!7654 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7654 thiss!1577) (size!3649 (buf!4101 thiss!1577)))))))

(declare-fun lt!256767 () Unit!11354)

(declare-fun choose!192 (array!8148 (_ BitVec 32) (_ BitVec 8)) Unit!11354)

(assert (=> d!56463 (= lt!256767 (choose!192 (buf!4101 thiss!1577) (currentByte!7654 thiss!1577) lt!256726))))

(assert (=> d!56463 (and (bvsle #b00000000000000000000000000000000 (currentByte!7654 thiss!1577)) (bvslt (currentByte!7654 thiss!1577) (size!3649 (buf!4101 thiss!1577))))))

(assert (=> d!56463 (= (arrayUpdatedAtPrefixLemma!191 (buf!4101 thiss!1577) (currentByte!7654 thiss!1577) lt!256726) lt!256767)))

(declare-fun b!163684 () Bool)

(assert (=> b!163684 (= e!113056 (arrayRangesEq!583 (buf!4101 thiss!1577) (array!8149 (store (arr!4570 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577) lt!256726) (size!3649 (buf!4101 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7654 thiss!1577)))))

(assert (= (and d!56463 res!136398) b!163684))

(declare-fun m!259805 () Bool)

(assert (=> d!56463 m!259805))

(assert (=> b!163684 m!259715))

(declare-fun m!259807 () Bool)

(assert (=> b!163684 m!259807))

(assert (=> b!163612 d!56463))

(declare-fun d!56469 () Bool)

(declare-fun lt!256783 () (_ BitVec 32))

(assert (=> d!56469 (= lt!256783 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!256782 () (_ BitVec 32))

(assert (=> d!56469 (= lt!256782 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!113062 () Bool)

(assert (=> d!56469 e!113062))

(declare-fun res!136404 () Bool)

(assert (=> d!56469 (=> (not res!136404) (not e!113062))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6454 (_ BitVec 64)) Bool)

(assert (=> d!56469 (= res!136404 (moveBitIndexPrecond!0 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11360 () Unit!11354)

(declare-fun Unit!11361 () Unit!11354)

(declare-fun Unit!11362 () Unit!11354)

(assert (=> d!56469 (= (moveBitIndex!0 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256783) #b00000000000000000000000000000000) (tuple2!14531 Unit!11360 (BitStream!6455 (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) (bvsub (bvadd (currentByte!7654 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256782) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256783 (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256783) #b00000000000000000000000000001000) (tuple2!14531 Unit!11361 (BitStream!6455 (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) (bvadd (currentByte!7654 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256782 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256783) #b00000000000000000000000000001000))) (tuple2!14531 Unit!11362 (BitStream!6455 (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) (bvadd (currentByte!7654 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256782) (bvadd (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256783))))))))

(declare-fun b!163689 () Bool)

(declare-fun e!113061 () Bool)

(assert (=> b!163689 (= e!113062 e!113061)))

(declare-fun res!136403 () Bool)

(assert (=> b!163689 (=> (not res!136403) (not e!113061))))

(declare-fun lt!256781 () tuple2!14530)

(declare-fun lt!256784 () (_ BitVec 64))

(assert (=> b!163689 (= res!136403 (= (bvadd lt!256784 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3649 (buf!4101 (_2!7856 lt!256781))) (currentByte!7654 (_2!7856 lt!256781)) (currentBit!7649 (_2!7856 lt!256781)))))))

(assert (=> b!163689 (or (not (= (bvand lt!256784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!256784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!256784 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163689 (= lt!256784 (bitIndex!0 (size!3649 (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)))) (currentByte!7654 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)))))))

(declare-fun lt!256780 () (_ BitVec 32))

(declare-fun lt!256785 () (_ BitVec 32))

(declare-fun Unit!11363 () Unit!11354)

(declare-fun Unit!11364 () Unit!11354)

(declare-fun Unit!11365 () Unit!11354)

(assert (=> b!163689 (= lt!256781 (ite (bvslt (bvadd (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256785) #b00000000000000000000000000000000) (tuple2!14531 Unit!11363 (BitStream!6455 (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) (bvsub (bvadd (currentByte!7654 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256780) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256785 (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256785) #b00000000000000000000000000001000) (tuple2!14531 Unit!11364 (BitStream!6455 (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) (bvadd (currentByte!7654 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256780 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256785) #b00000000000000000000000000001000))) (tuple2!14531 Unit!11365 (BitStream!6455 (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) (bvadd (currentByte!7654 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256780) (bvadd (currentBit!7649 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) lt!256785))))))))

(assert (=> b!163689 (= lt!256785 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163689 (= lt!256780 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!163690 () Bool)

(assert (=> b!163690 (= e!113061 (and (= (size!3649 (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)))) (size!3649 (buf!4101 (_2!7856 lt!256781)))) (= (buf!4101 (BitStream!6455 lt!256724 (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577))) (buf!4101 (_2!7856 lt!256781)))))))

(assert (= (and d!56469 res!136404) b!163689))

(assert (= (and b!163689 res!136403) b!163690))

(declare-fun m!259811 () Bool)

(assert (=> d!56469 m!259811))

(declare-fun m!259815 () Bool)

(assert (=> b!163689 m!259815))

(declare-fun m!259817 () Bool)

(assert (=> b!163689 m!259817))

(assert (=> b!163614 d!56469))

(declare-fun d!56481 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56481 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7649 thiss!1577) (currentByte!7654 thiss!1577) (size!3649 (buf!4101 thiss!1577))))))

(declare-fun bs!13986 () Bool)

(assert (= bs!13986 d!56481))

(declare-fun m!259821 () Bool)

(assert (=> bs!13986 m!259821))

(assert (=> start!34476 d!56481))

(declare-fun d!56485 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56485 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3649 (buf!4101 thiss!1577))) ((_ sign_extend 32) (currentByte!7654 thiss!1577)) ((_ sign_extend 32) (currentBit!7649 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3649 (buf!4101 thiss!1577))) ((_ sign_extend 32) (currentByte!7654 thiss!1577)) ((_ sign_extend 32) (currentBit!7649 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13987 () Bool)

(assert (= bs!13987 d!56485))

(declare-fun m!259823 () Bool)

(assert (=> bs!13987 m!259823))

(assert (=> b!163615 d!56485))

(declare-fun d!56487 () Bool)

(declare-fun e!113084 () Bool)

(assert (=> d!56487 e!113084))

(declare-fun res!136430 () Bool)

(assert (=> d!56487 (=> (not res!136430) (not e!113084))))

(declare-fun lt!256823 () (_ BitVec 64))

(declare-fun lt!256820 () (_ BitVec 64))

(declare-fun lt!256821 () (_ BitVec 64))

(assert (=> d!56487 (= res!136430 (= lt!256821 (bvsub lt!256823 lt!256820)))))

(assert (=> d!56487 (or (= (bvand lt!256823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256823 lt!256820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56487 (= lt!256820 (remainingBits!0 ((_ sign_extend 32) (size!3649 (buf!4101 (_2!7856 lt!256723)))) ((_ sign_extend 32) (currentByte!7654 (_2!7856 lt!256723))) ((_ sign_extend 32) (currentBit!7649 (_2!7856 lt!256723)))))))

(declare-fun lt!256819 () (_ BitVec 64))

(declare-fun lt!256824 () (_ BitVec 64))

(assert (=> d!56487 (= lt!256823 (bvmul lt!256819 lt!256824))))

(assert (=> d!56487 (or (= lt!256819 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256824 (bvsdiv (bvmul lt!256819 lt!256824) lt!256819)))))

(assert (=> d!56487 (= lt!256824 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56487 (= lt!256819 ((_ sign_extend 32) (size!3649 (buf!4101 (_2!7856 lt!256723)))))))

(assert (=> d!56487 (= lt!256821 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7654 (_2!7856 lt!256723))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7649 (_2!7856 lt!256723)))))))

(assert (=> d!56487 (invariant!0 (currentBit!7649 (_2!7856 lt!256723)) (currentByte!7654 (_2!7856 lt!256723)) (size!3649 (buf!4101 (_2!7856 lt!256723))))))

(assert (=> d!56487 (= (bitIndex!0 (size!3649 (buf!4101 (_2!7856 lt!256723))) (currentByte!7654 (_2!7856 lt!256723)) (currentBit!7649 (_2!7856 lt!256723))) lt!256821)))

(declare-fun b!163716 () Bool)

(declare-fun res!136431 () Bool)

(assert (=> b!163716 (=> (not res!136431) (not e!113084))))

(assert (=> b!163716 (= res!136431 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256821))))

(declare-fun b!163717 () Bool)

(declare-fun lt!256822 () (_ BitVec 64))

(assert (=> b!163717 (= e!113084 (bvsle lt!256821 (bvmul lt!256822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163717 (or (= lt!256822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256822)))))

(assert (=> b!163717 (= lt!256822 ((_ sign_extend 32) (size!3649 (buf!4101 (_2!7856 lt!256723)))))))

(assert (= (and d!56487 res!136430) b!163716))

(assert (= (and b!163716 res!136431) b!163717))

(declare-fun m!259843 () Bool)

(assert (=> d!56487 m!259843))

(declare-fun m!259845 () Bool)

(assert (=> d!56487 m!259845))

(assert (=> b!163616 d!56487))

(declare-fun d!56499 () Bool)

(declare-fun e!113085 () Bool)

(assert (=> d!56499 e!113085))

(declare-fun res!136432 () Bool)

(assert (=> d!56499 (=> (not res!136432) (not e!113085))))

(declare-fun lt!256829 () (_ BitVec 64))

(declare-fun lt!256827 () (_ BitVec 64))

(declare-fun lt!256826 () (_ BitVec 64))

(assert (=> d!56499 (= res!136432 (= lt!256827 (bvsub lt!256829 lt!256826)))))

(assert (=> d!56499 (or (= (bvand lt!256829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256826 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256829 lt!256826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56499 (= lt!256826 (remainingBits!0 ((_ sign_extend 32) (size!3649 (buf!4101 thiss!1577))) ((_ sign_extend 32) (currentByte!7654 thiss!1577)) ((_ sign_extend 32) (currentBit!7649 thiss!1577))))))

(declare-fun lt!256825 () (_ BitVec 64))

(declare-fun lt!256830 () (_ BitVec 64))

(assert (=> d!56499 (= lt!256829 (bvmul lt!256825 lt!256830))))

(assert (=> d!56499 (or (= lt!256825 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256830 (bvsdiv (bvmul lt!256825 lt!256830) lt!256825)))))

(assert (=> d!56499 (= lt!256830 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56499 (= lt!256825 ((_ sign_extend 32) (size!3649 (buf!4101 thiss!1577))))))

(assert (=> d!56499 (= lt!256827 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7654 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7649 thiss!1577))))))

(assert (=> d!56499 (invariant!0 (currentBit!7649 thiss!1577) (currentByte!7654 thiss!1577) (size!3649 (buf!4101 thiss!1577)))))

(assert (=> d!56499 (= (bitIndex!0 (size!3649 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)) lt!256827)))

(declare-fun b!163718 () Bool)

(declare-fun res!136433 () Bool)

(assert (=> b!163718 (=> (not res!136433) (not e!113085))))

(assert (=> b!163718 (= res!136433 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256827))))

(declare-fun b!163719 () Bool)

(declare-fun lt!256828 () (_ BitVec 64))

(assert (=> b!163719 (= e!113085 (bvsle lt!256827 (bvmul lt!256828 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163719 (or (= lt!256828 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256828 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256828)))))

(assert (=> b!163719 (= lt!256828 ((_ sign_extend 32) (size!3649 (buf!4101 thiss!1577))))))

(assert (= (and d!56499 res!136432) b!163718))

(assert (= (and b!163718 res!136433) b!163719))

(assert (=> d!56499 m!259823))

(assert (=> d!56499 m!259821))

(assert (=> b!163616 d!56499))

(declare-fun d!56501 () Bool)

(assert (=> d!56501 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3649 (buf!4101 (_1!7855 lt!256727)))) ((_ sign_extend 32) (currentByte!7654 (_1!7855 lt!256727))) ((_ sign_extend 32) (currentBit!7649 (_1!7855 lt!256727))) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3649 (buf!4101 (_1!7855 lt!256727)))) ((_ sign_extend 32) (currentByte!7654 (_1!7855 lt!256727))) ((_ sign_extend 32) (currentBit!7649 (_1!7855 lt!256727)))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13989 () Bool)

(assert (= bs!13989 d!56501))

(declare-fun m!259847 () Bool)

(assert (=> bs!13989 m!259847))

(assert (=> b!163611 d!56501))

(declare-fun b!163756 () Bool)

(declare-fun e!113112 () Unit!11354)

(declare-fun lt!256921 () Unit!11354)

(assert (=> b!163756 (= e!113112 lt!256921)))

(declare-fun lt!256931 () (_ BitVec 64))

(assert (=> b!163756 (= lt!256931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!256920 () (_ BitVec 64))

(assert (=> b!163756 (= lt!256920 (bitIndex!0 (size!3649 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8148 array!8148 (_ BitVec 64) (_ BitVec 64)) Unit!11354)

(assert (=> b!163756 (= lt!256921 (arrayBitRangesEqSymmetric!0 (buf!4101 thiss!1577) (buf!4101 (_2!7856 lt!256723)) lt!256931 lt!256920))))

(assert (=> b!163756 (arrayBitRangesEq!0 (buf!4101 (_2!7856 lt!256723)) (buf!4101 thiss!1577) lt!256931 lt!256920)))

(declare-fun b!163757 () Bool)

(declare-fun res!136466 () Bool)

(declare-fun e!113111 () Bool)

(assert (=> b!163757 (=> (not res!136466) (not e!113111))))

(declare-fun lt!256926 () tuple2!14528)

(assert (=> b!163757 (= res!136466 (isPrefixOf!0 (_1!7855 lt!256926) thiss!1577))))

(declare-fun lt!256916 () (_ BitVec 64))

(declare-fun b!163758 () Bool)

(declare-fun lt!256934 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6454 (_ BitVec 64)) BitStream!6454)

(assert (=> b!163758 (= e!113111 (= (_1!7855 lt!256926) (withMovedBitIndex!0 (_2!7855 lt!256926) (bvsub lt!256934 lt!256916))))))

(assert (=> b!163758 (or (= (bvand lt!256934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256916 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256934 lt!256916) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163758 (= lt!256916 (bitIndex!0 (size!3649 (buf!4101 (_2!7856 lt!256723))) (currentByte!7654 (_2!7856 lt!256723)) (currentBit!7649 (_2!7856 lt!256723))))))

(assert (=> b!163758 (= lt!256934 (bitIndex!0 (size!3649 (buf!4101 thiss!1577)) (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)))))

(declare-fun b!163759 () Bool)

(declare-fun Unit!11366 () Unit!11354)

(assert (=> b!163759 (= e!113112 Unit!11366)))

(declare-fun d!56503 () Bool)

(assert (=> d!56503 e!113111))

(declare-fun res!136468 () Bool)

(assert (=> d!56503 (=> (not res!136468) (not e!113111))))

(assert (=> d!56503 (= res!136468 (isPrefixOf!0 (_1!7855 lt!256926) (_2!7855 lt!256926)))))

(declare-fun lt!256927 () BitStream!6454)

(assert (=> d!56503 (= lt!256926 (tuple2!14529 lt!256927 (_2!7856 lt!256723)))))

(declare-fun lt!256917 () Unit!11354)

(declare-fun lt!256933 () Unit!11354)

(assert (=> d!56503 (= lt!256917 lt!256933)))

(assert (=> d!56503 (isPrefixOf!0 lt!256927 (_2!7856 lt!256723))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6454 BitStream!6454 BitStream!6454) Unit!11354)

(assert (=> d!56503 (= lt!256933 (lemmaIsPrefixTransitive!0 lt!256927 (_2!7856 lt!256723) (_2!7856 lt!256723)))))

(declare-fun lt!256928 () Unit!11354)

(declare-fun lt!256935 () Unit!11354)

(assert (=> d!56503 (= lt!256928 lt!256935)))

(assert (=> d!56503 (isPrefixOf!0 lt!256927 (_2!7856 lt!256723))))

(assert (=> d!56503 (= lt!256935 (lemmaIsPrefixTransitive!0 lt!256927 thiss!1577 (_2!7856 lt!256723)))))

(declare-fun lt!256918 () Unit!11354)

(assert (=> d!56503 (= lt!256918 e!113112)))

(declare-fun c!8570 () Bool)

(assert (=> d!56503 (= c!8570 (not (= (size!3649 (buf!4101 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!256929 () Unit!11354)

(declare-fun lt!256924 () Unit!11354)

(assert (=> d!56503 (= lt!256929 lt!256924)))

(assert (=> d!56503 (isPrefixOf!0 (_2!7856 lt!256723) (_2!7856 lt!256723))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6454) Unit!11354)

(assert (=> d!56503 (= lt!256924 (lemmaIsPrefixRefl!0 (_2!7856 lt!256723)))))

(declare-fun lt!256930 () Unit!11354)

(declare-fun lt!256932 () Unit!11354)

(assert (=> d!56503 (= lt!256930 lt!256932)))

(assert (=> d!56503 (= lt!256932 (lemmaIsPrefixRefl!0 (_2!7856 lt!256723)))))

(declare-fun lt!256919 () Unit!11354)

(declare-fun lt!256923 () Unit!11354)

(assert (=> d!56503 (= lt!256919 lt!256923)))

(assert (=> d!56503 (isPrefixOf!0 lt!256927 lt!256927)))

(assert (=> d!56503 (= lt!256923 (lemmaIsPrefixRefl!0 lt!256927))))

(declare-fun lt!256922 () Unit!11354)

(declare-fun lt!256925 () Unit!11354)

(assert (=> d!56503 (= lt!256922 lt!256925)))

(assert (=> d!56503 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!56503 (= lt!256925 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!56503 (= lt!256927 (BitStream!6455 (buf!4101 (_2!7856 lt!256723)) (currentByte!7654 thiss!1577) (currentBit!7649 thiss!1577)))))

(assert (=> d!56503 (isPrefixOf!0 thiss!1577 (_2!7856 lt!256723))))

(assert (=> d!56503 (= (reader!0 thiss!1577 (_2!7856 lt!256723)) lt!256926)))

(declare-fun b!163760 () Bool)

(declare-fun res!136467 () Bool)

(assert (=> b!163760 (=> (not res!136467) (not e!113111))))

(assert (=> b!163760 (= res!136467 (isPrefixOf!0 (_2!7855 lt!256926) (_2!7856 lt!256723)))))

(assert (= (and d!56503 c!8570) b!163756))

(assert (= (and d!56503 (not c!8570)) b!163759))

(assert (= (and d!56503 res!136468) b!163757))

(assert (= (and b!163757 res!136466) b!163760))

(assert (= (and b!163760 res!136467) b!163758))

(assert (=> b!163756 m!259691))

(declare-fun m!259881 () Bool)

(assert (=> b!163756 m!259881))

(declare-fun m!259883 () Bool)

(assert (=> b!163756 m!259883))

(declare-fun m!259885 () Bool)

(assert (=> b!163758 m!259885))

(assert (=> b!163758 m!259689))

(assert (=> b!163758 m!259691))

(declare-fun m!259887 () Bool)

(assert (=> d!56503 m!259887))

(declare-fun m!259889 () Bool)

(assert (=> d!56503 m!259889))

(assert (=> d!56503 m!259695))

(declare-fun m!259891 () Bool)

(assert (=> d!56503 m!259891))

(declare-fun m!259893 () Bool)

(assert (=> d!56503 m!259893))

(declare-fun m!259895 () Bool)

(assert (=> d!56503 m!259895))

(declare-fun m!259897 () Bool)

(assert (=> d!56503 m!259897))

(declare-fun m!259899 () Bool)

(assert (=> d!56503 m!259899))

(declare-fun m!259901 () Bool)

(assert (=> d!56503 m!259901))

(declare-fun m!259903 () Bool)

(assert (=> d!56503 m!259903))

(declare-fun m!259905 () Bool)

(assert (=> d!56503 m!259905))

(declare-fun m!259907 () Bool)

(assert (=> b!163760 m!259907))

(declare-fun m!259909 () Bool)

(assert (=> b!163757 m!259909))

(assert (=> b!163611 d!56503))

(push 1)

(assert (not b!163756))

(assert (not d!56503))

(assert (not b!163758))

(assert (not b!163689))

(assert (not d!56487))

(assert (not b!163681))

(assert (not d!56481))

(assert (not d!56463))

(assert (not b!163684))

(assert (not b!163675))

(assert (not b!163673))

(assert (not d!56501))

(assert (not d!56485))

(assert (not d!56469))

(assert (not b!163757))

(assert (not b!163760))

(assert (not d!56499))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32064 () Bool)

(assert start!32064)

(declare-fun res!132571 () Bool)

(declare-fun e!108211 () Bool)

(assert (=> start!32064 (=> (not res!132571) (not e!108211))))

(declare-datatypes ((array!7501 0))(
  ( (array!7502 (arr!4319 (Array (_ BitVec 32) (_ BitVec 8))) (size!3398 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5964 0))(
  ( (BitStream!5965 (buf!3856 array!7501) (currentByte!7079 (_ BitVec 32)) (currentBit!7074 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5964)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32064 (= res!132571 (validate_offset_byte!0 ((_ sign_extend 32) (size!3398 (buf!3856 thiss!1602))) ((_ sign_extend 32) (currentByte!7079 thiss!1602)) ((_ sign_extend 32) (currentBit!7074 thiss!1602))))))

(assert (=> start!32064 e!108211))

(declare-fun e!108213 () Bool)

(declare-fun inv!12 (BitStream!5964) Bool)

(assert (=> start!32064 (and (inv!12 thiss!1602) e!108213)))

(assert (=> start!32064 true))

(declare-fun b!158809 () Bool)

(declare-datatypes ((Unit!10683 0))(
  ( (Unit!10684) )
))
(declare-datatypes ((tuple3!698 0))(
  ( (tuple3!699 (_1!7697 Unit!10683) (_2!7697 (_ BitVec 8)) (_3!466 BitStream!5964)) )
))
(declare-fun lt!250296 () tuple3!698)

(assert (=> b!158809 (= e!108211 (not (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001))))))

(declare-fun lt!250300 () (_ BitVec 8))

(declare-fun arrayRangesEq!449 (array!7501 array!7501 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158809 (arrayRangesEq!449 (buf!3856 thiss!1602) (array!7502 (store (arr!4319 (buf!3856 thiss!1602)) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) lt!250300) (size!3398 (buf!3856 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001))))

(declare-fun lt!250302 () Unit!10683)

(declare-fun arrayUpdatedAtPrefixLemma!57 (array!7501 (_ BitVec 32) (_ BitVec 8)) Unit!10683)

(assert (=> b!158809 (= lt!250302 (arrayUpdatedAtPrefixLemma!57 (buf!3856 thiss!1602) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) lt!250300))))

(assert (=> b!158809 (= lt!250300 (select (arr!4319 (buf!3856 (_3!466 lt!250296))) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250299 () (_ BitVec 8))

(declare-fun lt!250305 () (_ BitVec 32))

(declare-fun lt!250297 () (_ BitVec 32))

(declare-fun lt!250298 () array!7501)

(declare-fun lt!250301 () (_ BitVec 8))

(declare-fun lt!250304 () (_ BitVec 32))

(declare-fun lt!250303 () (_ BitVec 8))

(declare-fun Unit!10685 () Unit!10683)

(declare-fun Unit!10686 () Unit!10683)

(assert (=> b!158809 (= lt!250296 (ite (bvsgt lt!250305 #b00000000000000000000000000000000) (let ((bdg!9204 ((_ extract 7 0) (bvnot lt!250304)))) (let ((bdg!9205 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4319 (buf!3856 thiss!1602)) (currentByte!7079 thiss!1602) lt!250299) (currentByte!7079 thiss!1602) lt!250301) (bvadd #b00000000000000000000000000000001 (currentByte!7079 thiss!1602)))) ((_ sign_extend 24) bdg!9204))))) (tuple3!699 Unit!10685 bdg!9204 (BitStream!5965 (array!7502 (store (arr!4319 (array!7502 (store (arr!4319 lt!250298) (bvadd #b00000000000000000000000000000001 (currentByte!7079 thiss!1602)) bdg!9205) (size!3398 lt!250298))) (bvadd #b00000000000000000000000000000001 (currentByte!7079 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9205) (bvshl ((_ sign_extend 24) v!222) lt!250297)))) (size!3398 (array!7502 (store (arr!4319 lt!250298) (bvadd #b00000000000000000000000000000001 (currentByte!7079 thiss!1602)) bdg!9205) (size!3398 lt!250298)))) (bvadd #b00000000000000000000000000000001 (currentByte!7079 thiss!1602)) (currentBit!7074 thiss!1602))))) (tuple3!699 Unit!10686 lt!250303 (BitStream!5965 lt!250298 (bvadd #b00000000000000000000000000000001 (currentByte!7079 thiss!1602)) (currentBit!7074 thiss!1602)))))))

(declare-fun e!108212 () Bool)

(assert (=> b!158809 e!108212))

(declare-fun res!132572 () Bool)

(assert (=> b!158809 (=> res!132572 e!108212)))

(assert (=> b!158809 (= res!132572 (bvsge (currentByte!7079 thiss!1602) (size!3398 (buf!3856 thiss!1602))))))

(assert (=> b!158809 (= lt!250298 (array!7502 (store (store (arr!4319 (buf!3856 thiss!1602)) (currentByte!7079 thiss!1602) lt!250299) (currentByte!7079 thiss!1602) lt!250301) (size!3398 (buf!3856 thiss!1602))))))

(assert (=> b!158809 (= lt!250301 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250299) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250305))))))

(assert (=> b!158809 (= lt!250299 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4319 (buf!3856 thiss!1602)) (currentByte!7079 thiss!1602))) lt!250304)))))

(assert (=> b!158809 (= lt!250304 ((_ sign_extend 24) lt!250303))))

(assert (=> b!158809 (= lt!250303 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250297)))))))

(assert (=> b!158809 (= lt!250297 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250305))))))

(assert (=> b!158809 (= lt!250305 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7074 thiss!1602))))))

(declare-fun b!158810 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158810 (= e!108212 (byteRangesEq!0 (select (arr!4319 (buf!3856 thiss!1602)) (currentByte!7079 thiss!1602)) lt!250301 #b00000000000000000000000000000000 (currentBit!7074 thiss!1602)))))

(declare-fun b!158811 () Bool)

(declare-fun array_inv!3145 (array!7501) Bool)

(assert (=> b!158811 (= e!108213 (array_inv!3145 (buf!3856 thiss!1602)))))

(assert (= (and start!32064 res!132571) b!158809))

(assert (= (and b!158809 (not res!132572)) b!158810))

(assert (= start!32064 b!158811))

(declare-fun m!249415 () Bool)

(assert (=> start!32064 m!249415))

(declare-fun m!249417 () Bool)

(assert (=> start!32064 m!249417))

(declare-fun m!249419 () Bool)

(assert (=> b!158809 m!249419))

(declare-fun m!249421 () Bool)

(assert (=> b!158809 m!249421))

(declare-fun m!249423 () Bool)

(assert (=> b!158809 m!249423))

(declare-fun m!249425 () Bool)

(assert (=> b!158809 m!249425))

(declare-fun m!249427 () Bool)

(assert (=> b!158809 m!249427))

(declare-fun m!249429 () Bool)

(assert (=> b!158809 m!249429))

(declare-fun m!249431 () Bool)

(assert (=> b!158809 m!249431))

(declare-fun m!249433 () Bool)

(assert (=> b!158809 m!249433))

(declare-fun m!249435 () Bool)

(assert (=> b!158809 m!249435))

(declare-fun m!249437 () Bool)

(assert (=> b!158809 m!249437))

(declare-fun m!249439 () Bool)

(assert (=> b!158809 m!249439))

(assert (=> b!158810 m!249439))

(assert (=> b!158810 m!249439))

(declare-fun m!249441 () Bool)

(assert (=> b!158810 m!249441))

(declare-fun m!249443 () Bool)

(assert (=> b!158811 m!249443))

(check-sat (not start!32064) (not b!158811) (not b!158810) (not b!158809))
(check-sat)
(get-model)

(declare-fun d!53405 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53405 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3398 (buf!3856 thiss!1602))) ((_ sign_extend 32) (currentByte!7079 thiss!1602)) ((_ sign_extend 32) (currentBit!7074 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3398 (buf!3856 thiss!1602))) ((_ sign_extend 32) (currentByte!7079 thiss!1602)) ((_ sign_extend 32) (currentBit!7074 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13221 () Bool)

(assert (= bs!13221 d!53405))

(declare-fun m!249475 () Bool)

(assert (=> bs!13221 m!249475))

(assert (=> start!32064 d!53405))

(declare-fun d!53407 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53407 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7074 thiss!1602) (currentByte!7079 thiss!1602) (size!3398 (buf!3856 thiss!1602))))))

(declare-fun bs!13222 () Bool)

(assert (= bs!13222 d!53407))

(declare-fun m!249477 () Bool)

(assert (=> bs!13222 m!249477))

(assert (=> start!32064 d!53407))

(declare-fun d!53409 () Bool)

(assert (=> d!53409 (= (array_inv!3145 (buf!3856 thiss!1602)) (bvsge (size!3398 (buf!3856 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158811 d!53409))

(declare-fun d!53411 () Bool)

(assert (=> d!53411 (= (byteRangesEq!0 (select (arr!4319 (buf!3856 thiss!1602)) (currentByte!7079 thiss!1602)) lt!250301 #b00000000000000000000000000000000 (currentBit!7074 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7074 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4319 (buf!3856 thiss!1602)) (currentByte!7079 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7074 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!250301) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7074 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13223 () Bool)

(assert (= bs!13223 d!53411))

(declare-fun m!249479 () Bool)

(assert (=> bs!13223 m!249479))

(declare-fun m!249481 () Bool)

(assert (=> bs!13223 m!249481))

(assert (=> b!158810 d!53411))

(declare-fun d!53413 () Bool)

(declare-fun res!132583 () Bool)

(declare-fun e!108230 () Bool)

(assert (=> d!53413 (=> res!132583 e!108230)))

(assert (=> d!53413 (= res!132583 (= #b00000000000000000000000000000000 (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001)))))

(assert (=> d!53413 (= (arrayRangesEq!449 (buf!3856 thiss!1602) (array!7502 (store (arr!4319 (buf!3856 thiss!1602)) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) lt!250300) (size!3398 (buf!3856 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001)) e!108230)))

(declare-fun b!158825 () Bool)

(declare-fun e!108231 () Bool)

(assert (=> b!158825 (= e!108230 e!108231)))

(declare-fun res!132584 () Bool)

(assert (=> b!158825 (=> (not res!132584) (not e!108231))))

(assert (=> b!158825 (= res!132584 (= (select (arr!4319 (buf!3856 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4319 (array!7502 (store (arr!4319 (buf!3856 thiss!1602)) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) lt!250300) (size!3398 (buf!3856 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!158826 () Bool)

(assert (=> b!158826 (= e!108231 (arrayRangesEq!449 (buf!3856 thiss!1602) (array!7502 (store (arr!4319 (buf!3856 thiss!1602)) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) lt!250300) (size!3398 (buf!3856 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001)))))

(assert (= (and d!53413 (not res!132583)) b!158825))

(assert (= (and b!158825 res!132584) b!158826))

(declare-fun m!249483 () Bool)

(assert (=> b!158825 m!249483))

(declare-fun m!249485 () Bool)

(assert (=> b!158825 m!249485))

(declare-fun m!249487 () Bool)

(assert (=> b!158826 m!249487))

(assert (=> b!158809 d!53413))

(declare-fun d!53415 () Bool)

(declare-fun e!108234 () Bool)

(assert (=> d!53415 e!108234))

(declare-fun res!132587 () Bool)

(assert (=> d!53415 (=> (not res!132587) (not e!108234))))

(assert (=> d!53415 (= res!132587 (and (bvsge (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) (size!3398 (buf!3856 thiss!1602)))))))

(declare-fun lt!250338 () Unit!10683)

(declare-fun choose!119 (array!7501 (_ BitVec 32) (_ BitVec 8)) Unit!10683)

(assert (=> d!53415 (= lt!250338 (choose!119 (buf!3856 thiss!1602) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) lt!250300))))

(assert (=> d!53415 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) (size!3398 (buf!3856 thiss!1602))))))

(assert (=> d!53415 (= (arrayUpdatedAtPrefixLemma!57 (buf!3856 thiss!1602) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) lt!250300) lt!250338)))

(declare-fun b!158829 () Bool)

(assert (=> b!158829 (= e!108234 (arrayRangesEq!449 (buf!3856 thiss!1602) (array!7502 (store (arr!4319 (buf!3856 thiss!1602)) (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001) lt!250300) (size!3398 (buf!3856 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7079 (_3!466 lt!250296)) #b00000000000000000000000000000001)))))

(assert (= (and d!53415 res!132587) b!158829))

(declare-fun m!249489 () Bool)

(assert (=> d!53415 m!249489))

(assert (=> b!158829 m!249437))

(assert (=> b!158829 m!249421))

(assert (=> b!158809 d!53415))

(check-sat (not b!158826) (not d!53407) (not b!158829) (not d!53415) (not d!53405))
(check-sat)

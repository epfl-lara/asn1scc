; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32262 () Bool)

(assert start!32262)

(declare-fun b!159470 () Bool)

(declare-fun e!108905 () Bool)

(declare-fun lt!251710 () Bool)

(declare-datatypes ((array!7589 0))(
  ( (array!7590 (arr!4358 (Array (_ BitVec 32) (_ BitVec 8))) (size!3437 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6042 0))(
  ( (BitStream!6043 (buf!3895 array!7589) (currentByte!7126 (_ BitVec 32)) (currentBit!7121 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6042)

(assert (=> b!159470 (= e!108905 (or lt!251710 (bvsle #b00000000000000000000000000000000 (currentByte!7126 thiss!1602))))))

(declare-fun b!159471 () Bool)

(declare-fun e!108906 () Bool)

(declare-fun array_inv!3184 (array!7589) Bool)

(assert (=> b!159471 (= e!108906 (array_inv!3184 (buf!3895 thiss!1602)))))

(declare-fun res!133114 () Bool)

(declare-fun e!108907 () Bool)

(assert (=> start!32262 (=> (not res!133114) (not e!108907))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32262 (= res!133114 (validate_offset_byte!0 ((_ sign_extend 32) (size!3437 (buf!3895 thiss!1602))) ((_ sign_extend 32) (currentByte!7126 thiss!1602)) ((_ sign_extend 32) (currentBit!7121 thiss!1602))))))

(assert (=> start!32262 e!108907))

(declare-fun inv!12 (BitStream!6042) Bool)

(assert (=> start!32262 (and (inv!12 thiss!1602) e!108906)))

(assert (=> start!32262 true))

(declare-fun b!159469 () Bool)

(declare-fun e!108908 () Bool)

(declare-fun lt!251717 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159469 (= e!108908 (byteRangesEq!0 (select (arr!4358 (buf!3895 thiss!1602)) (currentByte!7126 thiss!1602)) lt!251717 #b00000000000000000000000000000000 (currentBit!7121 thiss!1602)))))

(declare-fun b!159468 () Bool)

(assert (=> b!159468 (= e!108907 (not e!108905))))

(declare-fun res!133113 () Bool)

(assert (=> b!159468 (=> res!133113 e!108905)))

(declare-datatypes ((Unit!10839 0))(
  ( (Unit!10840) )
))
(declare-datatypes ((tuple3!776 0))(
  ( (tuple3!777 (_1!7736 Unit!10839) (_2!7736 (_ BitVec 8)) (_3!505 BitStream!6042)) )
))
(declare-fun lt!251714 () tuple3!776)

(declare-fun lt!251709 () array!7589)

(declare-fun arrayRangesEq!488 (array!7589 array!7589 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159468 (= res!133113 (not (arrayRangesEq!488 (buf!3895 thiss!1602) lt!251709 #b00000000000000000000000000000000 (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001))))))

(declare-fun lt!251711 () (_ BitVec 8))

(assert (=> b!159468 (arrayRangesEq!488 (buf!3895 thiss!1602) (array!7590 (store (arr!4358 (buf!3895 thiss!1602)) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) lt!251711) (size!3437 (buf!3895 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001))))

(declare-fun lt!251708 () Unit!10839)

(declare-fun arrayUpdatedAtPrefixLemma!96 (array!7589 (_ BitVec 32) (_ BitVec 8)) Unit!10839)

(assert (=> b!159468 (= lt!251708 (arrayUpdatedAtPrefixLemma!96 (buf!3895 thiss!1602) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) lt!251711))))

(assert (=> b!159468 (= lt!251711 (select (arr!4358 (buf!3895 (_3!505 lt!251714))) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)))))

(declare-fun lt!251712 () (_ BitVec 32))

(declare-fun lt!251713 () (_ BitVec 8))

(declare-fun lt!251718 () (_ BitVec 8))

(declare-fun lt!251716 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun Unit!10841 () Unit!10839)

(declare-fun Unit!10842 () Unit!10839)

(assert (=> b!159468 (= lt!251714 (ite lt!251710 (let ((bdg!9381 ((_ extract 7 0) (bvnot lt!251716)))) (let ((bdg!9382 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4358 (buf!3895 thiss!1602)) (currentByte!7126 thiss!1602) lt!251718) (currentByte!7126 thiss!1602) lt!251717) (bvadd #b00000000000000000000000000000001 (currentByte!7126 thiss!1602)))) ((_ sign_extend 24) bdg!9381))))) (tuple3!777 Unit!10841 bdg!9381 (BitStream!6043 (array!7590 (store (arr!4358 (array!7590 (store (arr!4358 lt!251709) (bvadd #b00000000000000000000000000000001 (currentByte!7126 thiss!1602)) bdg!9382) (size!3437 lt!251709))) (bvadd #b00000000000000000000000000000001 (currentByte!7126 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9382) (bvshl ((_ sign_extend 24) v!222) lt!251712)))) (size!3437 (array!7590 (store (arr!4358 lt!251709) (bvadd #b00000000000000000000000000000001 (currentByte!7126 thiss!1602)) bdg!9382) (size!3437 lt!251709)))) (bvadd #b00000000000000000000000000000001 (currentByte!7126 thiss!1602)) (currentBit!7121 thiss!1602))))) (tuple3!777 Unit!10842 lt!251713 (BitStream!6043 lt!251709 (bvadd #b00000000000000000000000000000001 (currentByte!7126 thiss!1602)) (currentBit!7121 thiss!1602)))))))

(declare-fun lt!251715 () (_ BitVec 32))

(assert (=> b!159468 (= lt!251710 (bvsgt lt!251715 #b00000000000000000000000000000000))))

(assert (=> b!159468 e!108908))

(declare-fun res!133115 () Bool)

(assert (=> b!159468 (=> res!133115 e!108908)))

(assert (=> b!159468 (= res!133115 (bvsge (currentByte!7126 thiss!1602) (size!3437 (buf!3895 thiss!1602))))))

(assert (=> b!159468 (= lt!251709 (array!7590 (store (store (arr!4358 (buf!3895 thiss!1602)) (currentByte!7126 thiss!1602) lt!251718) (currentByte!7126 thiss!1602) lt!251717) (size!3437 (buf!3895 thiss!1602))))))

(assert (=> b!159468 (= lt!251717 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251718) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251715))))))

(assert (=> b!159468 (= lt!251718 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4358 (buf!3895 thiss!1602)) (currentByte!7126 thiss!1602))) lt!251716)))))

(assert (=> b!159468 (= lt!251716 ((_ sign_extend 24) lt!251713))))

(assert (=> b!159468 (= lt!251713 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251712)))))))

(assert (=> b!159468 (= lt!251712 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251715))))))

(assert (=> b!159468 (= lt!251715 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7121 thiss!1602))))))

(assert (= (and start!32262 res!133114) b!159468))

(assert (= (and b!159468 (not res!133115)) b!159469))

(assert (= (and b!159468 (not res!133113)) b!159470))

(assert (= start!32262 b!159471))

(declare-fun m!251331 () Bool)

(assert (=> b!159471 m!251331))

(declare-fun m!251333 () Bool)

(assert (=> start!32262 m!251333))

(declare-fun m!251335 () Bool)

(assert (=> start!32262 m!251335))

(declare-fun m!251337 () Bool)

(assert (=> b!159469 m!251337))

(assert (=> b!159469 m!251337))

(declare-fun m!251339 () Bool)

(assert (=> b!159469 m!251339))

(declare-fun m!251341 () Bool)

(assert (=> b!159468 m!251341))

(declare-fun m!251343 () Bool)

(assert (=> b!159468 m!251343))

(declare-fun m!251345 () Bool)

(assert (=> b!159468 m!251345))

(declare-fun m!251347 () Bool)

(assert (=> b!159468 m!251347))

(declare-fun m!251349 () Bool)

(assert (=> b!159468 m!251349))

(declare-fun m!251351 () Bool)

(assert (=> b!159468 m!251351))

(assert (=> b!159468 m!251337))

(declare-fun m!251353 () Bool)

(assert (=> b!159468 m!251353))

(declare-fun m!251355 () Bool)

(assert (=> b!159468 m!251355))

(declare-fun m!251357 () Bool)

(assert (=> b!159468 m!251357))

(declare-fun m!251359 () Bool)

(assert (=> b!159468 m!251359))

(declare-fun m!251361 () Bool)

(assert (=> b!159468 m!251361))

(check-sat (not start!32262) (not b!159471) (not b!159469) (not b!159468))
(check-sat)
(get-model)

(declare-fun d!53623 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53623 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3437 (buf!3895 thiss!1602))) ((_ sign_extend 32) (currentByte!7126 thiss!1602)) ((_ sign_extend 32) (currentBit!7121 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3437 (buf!3895 thiss!1602))) ((_ sign_extend 32) (currentByte!7126 thiss!1602)) ((_ sign_extend 32) (currentBit!7121 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13291 () Bool)

(assert (= bs!13291 d!53623))

(declare-fun m!251395 () Bool)

(assert (=> bs!13291 m!251395))

(assert (=> start!32262 d!53623))

(declare-fun d!53625 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53625 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7121 thiss!1602) (currentByte!7126 thiss!1602) (size!3437 (buf!3895 thiss!1602))))))

(declare-fun bs!13292 () Bool)

(assert (= bs!13292 d!53625))

(declare-fun m!251397 () Bool)

(assert (=> bs!13292 m!251397))

(assert (=> start!32262 d!53625))

(declare-fun d!53627 () Bool)

(assert (=> d!53627 (= (array_inv!3184 (buf!3895 thiss!1602)) (bvsge (size!3437 (buf!3895 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159471 d!53627))

(declare-fun d!53629 () Bool)

(assert (=> d!53629 (= (byteRangesEq!0 (select (arr!4358 (buf!3895 thiss!1602)) (currentByte!7126 thiss!1602)) lt!251717 #b00000000000000000000000000000000 (currentBit!7121 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7121 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4358 (buf!3895 thiss!1602)) (currentByte!7126 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7121 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251717) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7121 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13293 () Bool)

(assert (= bs!13293 d!53629))

(declare-fun m!251399 () Bool)

(assert (=> bs!13293 m!251399))

(declare-fun m!251401 () Bool)

(assert (=> bs!13293 m!251401))

(assert (=> b!159469 d!53629))

(declare-fun d!53633 () Bool)

(declare-fun res!133129 () Bool)

(declare-fun e!108929 () Bool)

(assert (=> d!53633 (=> res!133129 e!108929)))

(assert (=> d!53633 (= res!133129 (= #b00000000000000000000000000000000 (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)))))

(assert (=> d!53633 (= (arrayRangesEq!488 (buf!3895 thiss!1602) lt!251709 #b00000000000000000000000000000000 (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)) e!108929)))

(declare-fun b!159488 () Bool)

(declare-fun e!108930 () Bool)

(assert (=> b!159488 (= e!108929 e!108930)))

(declare-fun res!133130 () Bool)

(assert (=> b!159488 (=> (not res!133130) (not e!108930))))

(assert (=> b!159488 (= res!133130 (= (select (arr!4358 (buf!3895 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4358 lt!251709) #b00000000000000000000000000000000)))))

(declare-fun b!159489 () Bool)

(assert (=> b!159489 (= e!108930 (arrayRangesEq!488 (buf!3895 thiss!1602) lt!251709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)))))

(assert (= (and d!53633 (not res!133129)) b!159488))

(assert (= (and b!159488 res!133130) b!159489))

(declare-fun m!251403 () Bool)

(assert (=> b!159488 m!251403))

(declare-fun m!251405 () Bool)

(assert (=> b!159488 m!251405))

(declare-fun m!251407 () Bool)

(assert (=> b!159489 m!251407))

(assert (=> b!159468 d!53633))

(declare-fun d!53635 () Bool)

(declare-fun res!133131 () Bool)

(declare-fun e!108931 () Bool)

(assert (=> d!53635 (=> res!133131 e!108931)))

(assert (=> d!53635 (= res!133131 (= #b00000000000000000000000000000000 (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)))))

(assert (=> d!53635 (= (arrayRangesEq!488 (buf!3895 thiss!1602) (array!7590 (store (arr!4358 (buf!3895 thiss!1602)) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) lt!251711) (size!3437 (buf!3895 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)) e!108931)))

(declare-fun b!159490 () Bool)

(declare-fun e!108932 () Bool)

(assert (=> b!159490 (= e!108931 e!108932)))

(declare-fun res!133132 () Bool)

(assert (=> b!159490 (=> (not res!133132) (not e!108932))))

(assert (=> b!159490 (= res!133132 (= (select (arr!4358 (buf!3895 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4358 (array!7590 (store (arr!4358 (buf!3895 thiss!1602)) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) lt!251711) (size!3437 (buf!3895 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159491 () Bool)

(assert (=> b!159491 (= e!108932 (arrayRangesEq!488 (buf!3895 thiss!1602) (array!7590 (store (arr!4358 (buf!3895 thiss!1602)) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) lt!251711) (size!3437 (buf!3895 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)))))

(assert (= (and d!53635 (not res!133131)) b!159490))

(assert (= (and b!159490 res!133132) b!159491))

(assert (=> b!159490 m!251403))

(declare-fun m!251409 () Bool)

(assert (=> b!159490 m!251409))

(declare-fun m!251411 () Bool)

(assert (=> b!159491 m!251411))

(assert (=> b!159468 d!53635))

(declare-fun d!53637 () Bool)

(declare-fun e!108939 () Bool)

(assert (=> d!53637 e!108939))

(declare-fun res!133139 () Bool)

(assert (=> d!53637 (=> (not res!133139) (not e!108939))))

(assert (=> d!53637 (= res!133139 (and (bvsge (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) (size!3437 (buf!3895 thiss!1602)))))))

(declare-fun lt!251754 () Unit!10839)

(declare-fun choose!133 (array!7589 (_ BitVec 32) (_ BitVec 8)) Unit!10839)

(assert (=> d!53637 (= lt!251754 (choose!133 (buf!3895 thiss!1602) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) lt!251711))))

(assert (=> d!53637 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) (size!3437 (buf!3895 thiss!1602))))))

(assert (=> d!53637 (= (arrayUpdatedAtPrefixLemma!96 (buf!3895 thiss!1602) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) lt!251711) lt!251754)))

(declare-fun b!159498 () Bool)

(assert (=> b!159498 (= e!108939 (arrayRangesEq!488 (buf!3895 thiss!1602) (array!7590 (store (arr!4358 (buf!3895 thiss!1602)) (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001) lt!251711) (size!3437 (buf!3895 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7126 (_3!505 lt!251714)) #b00000000000000000000000000000001)))))

(assert (= (and d!53637 res!133139) b!159498))

(declare-fun m!251417 () Bool)

(assert (=> d!53637 m!251417))

(assert (=> b!159498 m!251355))

(assert (=> b!159498 m!251343))

(assert (=> b!159468 d!53637))

(check-sat (not d!53625) (not d!53623) (not b!159498) (not b!159489) (not d!53637) (not b!159491))
(check-sat)

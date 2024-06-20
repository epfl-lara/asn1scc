; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32458 () Bool)

(assert start!32458)

(declare-fun b!159993 () Bool)

(declare-fun e!109444 () Bool)

(declare-datatypes ((array!7633 0))(
  ( (array!7634 (arr!4375 (Array (_ BitVec 32) (_ BitVec 8))) (size!3454 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6076 0))(
  ( (BitStream!6077 (buf!3912 array!7633) (currentByte!7161 (_ BitVec 32)) (currentBit!7156 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14462 0))(
  ( (tuple2!14463 (_1!7753 BitStream!6076) (_2!7753 BitStream!6076)) )
))
(declare-fun lt!252456 () tuple2!14462)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!159993 (= e!109444 (validate_offset_byte!0 ((_ sign_extend 32) (size!3454 (buf!3912 (_1!7753 lt!252456)))) ((_ sign_extend 32) (currentByte!7161 (_1!7753 lt!252456))) ((_ sign_extend 32) (currentBit!7156 (_1!7753 lt!252456)))))))

(declare-fun thiss!1602 () BitStream!6076)

(declare-datatypes ((Unit!10925 0))(
  ( (Unit!10926) )
))
(declare-datatypes ((tuple3!810 0))(
  ( (tuple3!811 (_1!7754 Unit!10925) (_2!7754 (_ BitVec 8)) (_3!522 BitStream!6076)) )
))
(declare-fun lt!252462 () tuple3!810)

(declare-fun reader!0 (BitStream!6076 BitStream!6076) tuple2!14462)

(assert (=> b!159993 (= lt!252456 (reader!0 thiss!1602 (_3!522 lt!252462)))))

(declare-fun b!159994 () Bool)

(declare-fun res!133530 () Bool)

(assert (=> b!159994 (=> res!133530 e!109444)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!159994 (= res!133530 (not (= (bitIndex!0 (size!3454 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)) (currentBit!7156 (_3!522 lt!252462))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3454 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) (currentBit!7156 thiss!1602))))))))

(declare-fun bm!2714 () Bool)

(declare-fun c!8447 () Bool)

(declare-fun call!2717 () Bool)

(declare-fun arrayRangesEq!505 (array!7633 array!7633 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2714 (= call!2717 (arrayRangesEq!505 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) #b00000000000000000000000000000000 (ite c!8447 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (currentByte!7161 thiss!1602))))))

(declare-fun b!159995 () Bool)

(declare-fun e!109442 () Bool)

(declare-fun lt!252461 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159995 (= e!109442 (byteRangesEq!0 (select (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602)) lt!252461 #b00000000000000000000000000000000 (currentBit!7156 thiss!1602)))))

(declare-fun b!159996 () Bool)

(declare-fun e!109446 () Unit!10925)

(declare-fun Unit!10927 () Unit!10925)

(assert (=> b!159996 (= e!109446 Unit!10927)))

(declare-fun lt!252458 () Unit!10925)

(declare-fun arrayUpdatedAtPrefixLemma!113 (array!7633 (_ BitVec 32) (_ BitVec 8)) Unit!10925)

(assert (=> b!159996 (= lt!252458 (arrayUpdatedAtPrefixLemma!113 (buf!3912 thiss!1602) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))))))

(assert (=> b!159996 (arrayRangesEq!505 (buf!3912 thiss!1602) (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462)))))

(declare-fun lt!252465 () Unit!10925)

(declare-fun lt!252455 () array!7633)

(assert (=> b!159996 (= lt!252465 (arrayUpdatedAtPrefixLemma!113 lt!252455 (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))))))

(declare-fun lt!252453 () (_ BitVec 8))

(assert (=> b!159996 (arrayRangesEq!505 lt!252455 (array!7634 (store (store (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) lt!252453) (currentByte!7161 thiss!1602) lt!252461) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462)))))

(declare-fun lt!252463 () Unit!10925)

(declare-fun arrayRangesEqTransitive!139 (array!7633 array!7633 array!7633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10925)

(assert (=> b!159996 (= lt!252463 (arrayRangesEqTransitive!139 (buf!3912 thiss!1602) lt!252455 (buf!3912 (_3!522 lt!252462)) #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (currentByte!7161 (_3!522 lt!252462))))))

(declare-fun res!133533 () Bool)

(assert (=> b!159996 (= res!133533 call!2717)))

(declare-fun e!109441 () Bool)

(assert (=> b!159996 (=> (not res!133533) (not e!109441))))

(assert (=> b!159996 e!109441))

(declare-fun res!133532 () Bool)

(declare-fun e!109439 () Bool)

(assert (=> start!32458 (=> (not res!133532) (not e!109439))))

(assert (=> start!32458 (= res!133532 (validate_offset_byte!0 ((_ sign_extend 32) (size!3454 (buf!3912 thiss!1602))) ((_ sign_extend 32) (currentByte!7161 thiss!1602)) ((_ sign_extend 32) (currentBit!7156 thiss!1602))))))

(assert (=> start!32458 e!109439))

(declare-fun e!109440 () Bool)

(declare-fun inv!12 (BitStream!6076) Bool)

(assert (=> start!32458 (and (inv!12 thiss!1602) e!109440)))

(assert (=> start!32458 true))

(declare-fun b!159997 () Bool)

(assert (=> b!159997 (= e!109441 (arrayRangesEq!505 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) #b00000000000000000000000000000000 (currentByte!7161 thiss!1602)))))

(declare-fun b!159998 () Bool)

(declare-fun e!109445 () Bool)

(assert (=> b!159998 (= e!109439 (not e!109445))))

(declare-fun res!133535 () Bool)

(assert (=> b!159998 (=> res!133535 e!109445)))

(assert (=> b!159998 (= res!133535 (not (arrayRangesEq!505 (buf!3912 thiss!1602) lt!252455 #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001))))))

(declare-fun lt!252460 () (_ BitVec 8))

(assert (=> b!159998 (arrayRangesEq!505 (buf!3912 thiss!1602) (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) lt!252460) (size!3454 (buf!3912 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001))))

(declare-fun lt!252459 () Unit!10925)

(assert (=> b!159998 (= lt!252459 (arrayUpdatedAtPrefixLemma!113 (buf!3912 thiss!1602) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) lt!252460))))

(assert (=> b!159998 (= lt!252460 (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)))))

(declare-fun lt!252467 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252468 () Bool)

(declare-fun lt!252457 () (_ BitVec 32))

(declare-fun lt!252466 () (_ BitVec 8))

(declare-fun Unit!10928 () Unit!10925)

(declare-fun Unit!10929 () Unit!10925)

(assert (=> b!159998 (= lt!252462 (ite lt!252468 (let ((bdg!9472 ((_ extract 7 0) (bvnot lt!252457)))) (let ((bdg!9473 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) lt!252453) (currentByte!7161 thiss!1602) lt!252461) (bvadd #b00000000000000000000000000000001 (currentByte!7161 thiss!1602)))) ((_ sign_extend 24) bdg!9472))))) (tuple3!811 Unit!10928 bdg!9472 (BitStream!6077 (array!7634 (store (arr!4375 (array!7634 (store (arr!4375 lt!252455) (bvadd #b00000000000000000000000000000001 (currentByte!7161 thiss!1602)) bdg!9473) (size!3454 lt!252455))) (bvadd #b00000000000000000000000000000001 (currentByte!7161 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9473) (bvshl ((_ sign_extend 24) v!222) lt!252467)))) (size!3454 (array!7634 (store (arr!4375 lt!252455) (bvadd #b00000000000000000000000000000001 (currentByte!7161 thiss!1602)) bdg!9473) (size!3454 lt!252455)))) (bvadd #b00000000000000000000000000000001 (currentByte!7161 thiss!1602)) (currentBit!7156 thiss!1602))))) (tuple3!811 Unit!10929 lt!252466 (BitStream!6077 lt!252455 (bvadd #b00000000000000000000000000000001 (currentByte!7161 thiss!1602)) (currentBit!7156 thiss!1602)))))))

(declare-fun lt!252464 () (_ BitVec 32))

(assert (=> b!159998 (= lt!252468 (bvsgt lt!252464 #b00000000000000000000000000000000))))

(assert (=> b!159998 e!109442))

(declare-fun res!133534 () Bool)

(assert (=> b!159998 (=> res!133534 e!109442)))

(assert (=> b!159998 (= res!133534 (bvsge (currentByte!7161 thiss!1602) (size!3454 (buf!3912 thiss!1602))))))

(assert (=> b!159998 (= lt!252455 (array!7634 (store (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) lt!252453) (currentByte!7161 thiss!1602) lt!252461) (size!3454 (buf!3912 thiss!1602))))))

(assert (=> b!159998 (= lt!252461 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252453) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252464))))))

(assert (=> b!159998 (= lt!252453 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602))) lt!252457)))))

(assert (=> b!159998 (= lt!252457 ((_ sign_extend 24) lt!252466))))

(assert (=> b!159998 (= lt!252466 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252467)))))))

(assert (=> b!159998 (= lt!252467 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252464))))))

(assert (=> b!159998 (= lt!252464 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7156 thiss!1602))))))

(declare-fun b!159999 () Bool)

(declare-fun Unit!10930 () Unit!10925)

(assert (=> b!159999 (= e!109446 Unit!10930)))

(assert (=> b!159999 call!2717))

(declare-fun b!160000 () Bool)

(assert (=> b!160000 (= e!109445 e!109444)))

(declare-fun res!133531 () Bool)

(assert (=> b!160000 (=> res!133531 e!109444)))

(assert (=> b!160000 (= res!133531 (not (= (size!3454 (buf!3912 thiss!1602)) (size!3454 (buf!3912 (_3!522 lt!252462))))))))

(declare-fun lt!252454 () Unit!10925)

(assert (=> b!160000 (= lt!252454 e!109446)))

(assert (=> b!160000 (= c!8447 lt!252468)))

(declare-fun b!160001 () Bool)

(declare-fun res!133529 () Bool)

(assert (=> b!160001 (=> res!133529 e!109444)))

(declare-fun isPrefixOf!0 (BitStream!6076 BitStream!6076) Bool)

(assert (=> b!160001 (= res!133529 (not (isPrefixOf!0 thiss!1602 (_3!522 lt!252462))))))

(declare-fun b!160002 () Bool)

(declare-fun array_inv!3201 (array!7633) Bool)

(assert (=> b!160002 (= e!109440 (array_inv!3201 (buf!3912 thiss!1602)))))

(assert (= (and start!32458 res!133532) b!159998))

(assert (= (and b!159998 (not res!133534)) b!159995))

(assert (= (and b!159998 (not res!133535)) b!160000))

(assert (= (and b!160000 c!8447) b!159996))

(assert (= (and b!160000 (not c!8447)) b!159999))

(assert (= (and b!159996 res!133533) b!159997))

(assert (= (or b!159996 b!159999) bm!2714))

(assert (= (and b!160000 (not res!133531)) b!159994))

(assert (= (and b!159994 (not res!133530)) b!160001))

(assert (= (and b!160001 (not res!133529)) b!159993))

(assert (= start!32458 b!160002))

(declare-fun m!252469 () Bool)

(assert (=> b!159996 m!252469))

(declare-fun m!252471 () Bool)

(assert (=> b!159996 m!252471))

(assert (=> b!159996 m!252469))

(declare-fun m!252473 () Bool)

(assert (=> b!159996 m!252473))

(declare-fun m!252475 () Bool)

(assert (=> b!159996 m!252475))

(declare-fun m!252477 () Bool)

(assert (=> b!159996 m!252477))

(declare-fun m!252479 () Bool)

(assert (=> b!159996 m!252479))

(declare-fun m!252481 () Bool)

(assert (=> b!159996 m!252481))

(assert (=> b!159996 m!252469))

(declare-fun m!252483 () Bool)

(assert (=> b!159996 m!252483))

(declare-fun m!252485 () Bool)

(assert (=> b!159996 m!252485))

(declare-fun m!252487 () Bool)

(assert (=> b!159996 m!252487))

(declare-fun m!252489 () Bool)

(assert (=> b!160001 m!252489))

(declare-fun m!252491 () Bool)

(assert (=> b!160002 m!252491))

(declare-fun m!252493 () Bool)

(assert (=> b!159994 m!252493))

(declare-fun m!252495 () Bool)

(assert (=> b!159994 m!252495))

(declare-fun m!252497 () Bool)

(assert (=> b!159997 m!252497))

(declare-fun m!252499 () Bool)

(assert (=> start!32458 m!252499))

(declare-fun m!252501 () Bool)

(assert (=> start!32458 m!252501))

(declare-fun m!252503 () Bool)

(assert (=> b!159998 m!252503))

(declare-fun m!252505 () Bool)

(assert (=> b!159998 m!252505))

(declare-fun m!252507 () Bool)

(assert (=> b!159998 m!252507))

(declare-fun m!252509 () Bool)

(assert (=> b!159998 m!252509))

(declare-fun m!252511 () Bool)

(assert (=> b!159998 m!252511))

(declare-fun m!252513 () Bool)

(assert (=> b!159998 m!252513))

(declare-fun m!252515 () Bool)

(assert (=> b!159998 m!252515))

(assert (=> b!159998 m!252473))

(declare-fun m!252517 () Bool)

(assert (=> b!159998 m!252517))

(declare-fun m!252519 () Bool)

(assert (=> b!159998 m!252519))

(assert (=> b!159998 m!252477))

(declare-fun m!252521 () Bool)

(assert (=> b!159998 m!252521))

(assert (=> b!159995 m!252517))

(assert (=> b!159995 m!252517))

(declare-fun m!252523 () Bool)

(assert (=> b!159995 m!252523))

(declare-fun m!252525 () Bool)

(assert (=> bm!2714 m!252525))

(declare-fun m!252527 () Bool)

(assert (=> b!159993 m!252527))

(declare-fun m!252529 () Bool)

(assert (=> b!159993 m!252529))

(push 1)

(assert (not b!160001))

(assert (not b!159998))

(assert (not b!159997))

(assert (not b!160002))

(assert (not start!32458))

(assert (not bm!2714))

(assert (not b!159995))

(assert (not b!159994))

(assert (not b!159996))

(assert (not b!159993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53965 () Bool)

(declare-fun res!133642 () Bool)

(declare-fun e!109549 () Bool)

(assert (=> d!53965 (=> res!133642 e!109549)))

(assert (=> d!53965 (= res!133642 (= #b00000000000000000000000000000000 (ite c!8447 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (currentByte!7161 thiss!1602))))))

(assert (=> d!53965 (= (arrayRangesEq!505 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) #b00000000000000000000000000000000 (ite c!8447 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (currentByte!7161 thiss!1602))) e!109549)))

(declare-fun b!160133 () Bool)

(declare-fun e!109550 () Bool)

(assert (=> b!160133 (= e!109549 e!109550)))

(declare-fun res!133643 () Bool)

(assert (=> b!160133 (=> (not res!133643) (not e!109550))))

(assert (=> b!160133 (= res!133643 (= (select (arr!4375 (buf!3912 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) #b00000000000000000000000000000000)))))

(declare-fun b!160134 () Bool)

(assert (=> b!160134 (= e!109550 (arrayRangesEq!505 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8447 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (currentByte!7161 thiss!1602))))))

(assert (= (and d!53965 (not res!133642)) b!160133))

(assert (= (and b!160133 res!133643) b!160134))

(declare-fun m!252761 () Bool)

(assert (=> b!160133 m!252761))

(declare-fun m!252763 () Bool)

(assert (=> b!160133 m!252763))

(declare-fun m!252765 () Bool)

(assert (=> b!160134 m!252765))

(assert (=> bm!2714 d!53965))

(declare-fun d!53967 () Bool)

(assert (=> d!53967 (= (byteRangesEq!0 (select (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602)) lt!252461 #b00000000000000000000000000000000 (currentBit!7156 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7156 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7156 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!252461) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7156 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13361 () Bool)

(assert (= bs!13361 d!53967))

(declare-fun m!252767 () Bool)

(assert (=> bs!13361 m!252767))

(declare-fun m!252769 () Bool)

(assert (=> bs!13361 m!252769))

(assert (=> b!159995 d!53967))

(declare-fun d!53969 () Bool)

(declare-fun res!133663 () Bool)

(declare-fun e!109565 () Bool)

(assert (=> d!53969 (=> (not res!133663) (not e!109565))))

(assert (=> d!53969 (= res!133663 (= (size!3454 (buf!3912 thiss!1602)) (size!3454 (buf!3912 (_3!522 lt!252462)))))))

(assert (=> d!53969 (= (isPrefixOf!0 thiss!1602 (_3!522 lt!252462)) e!109565)))

(declare-fun b!160159 () Bool)

(declare-fun res!133662 () Bool)

(assert (=> b!160159 (=> (not res!133662) (not e!109565))))

(assert (=> b!160159 (= res!133662 (bvsle (bitIndex!0 (size!3454 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) (currentBit!7156 thiss!1602)) (bitIndex!0 (size!3454 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)) (currentBit!7156 (_3!522 lt!252462)))))))

(declare-fun b!160160 () Bool)

(declare-fun e!109564 () Bool)

(assert (=> b!160160 (= e!109565 e!109564)))

(declare-fun res!133664 () Bool)

(assert (=> b!160160 (=> res!133664 e!109564)))

(assert (=> b!160160 (= res!133664 (= (size!3454 (buf!3912 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!160161 () Bool)

(declare-fun arrayBitRangesEq!0 (array!7633 array!7633 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!160161 (= e!109564 (arrayBitRangesEq!0 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3454 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) (currentBit!7156 thiss!1602))))))

(assert (= (and d!53969 res!133663) b!160159))

(assert (= (and b!160159 res!133662) b!160160))

(assert (= (and b!160160 (not res!133664)) b!160161))

(assert (=> b!160159 m!252495))

(assert (=> b!160159 m!252493))

(assert (=> b!160161 m!252495))

(assert (=> b!160161 m!252495))

(declare-fun m!252809 () Bool)

(assert (=> b!160161 m!252809))

(assert (=> b!160001 d!53969))

(declare-fun d!53977 () Bool)

(declare-fun res!133665 () Bool)

(declare-fun e!109566 () Bool)

(assert (=> d!53977 (=> res!133665 e!109566)))

(assert (=> d!53977 (= res!133665 (= #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462))))))

(assert (=> d!53977 (= (arrayRangesEq!505 (buf!3912 thiss!1602) (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462))) e!109566)))

(declare-fun b!160162 () Bool)

(declare-fun e!109567 () Bool)

(assert (=> b!160162 (= e!109566 e!109567)))

(declare-fun res!133666 () Bool)

(assert (=> b!160162 (=> (not res!133666) (not e!109567))))

(assert (=> b!160162 (= res!133666 (= (select (arr!4375 (buf!3912 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4375 (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!160163 () Bool)

(assert (=> b!160163 (= e!109567 (arrayRangesEq!505 (buf!3912 thiss!1602) (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7161 (_3!522 lt!252462))))))

(assert (= (and d!53977 (not res!133665)) b!160162))

(assert (= (and b!160162 res!133666) b!160163))

(assert (=> b!160162 m!252761))

(declare-fun m!252811 () Bool)

(assert (=> b!160162 m!252811))

(declare-fun m!252813 () Bool)

(assert (=> b!160163 m!252813))

(assert (=> b!159996 d!53977))

(declare-fun d!53979 () Bool)

(assert (=> d!53979 (arrayRangesEq!505 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001))))

(declare-fun lt!252727 () Unit!10925)

(declare-fun choose!149 (array!7633 array!7633 array!7633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10925)

(assert (=> d!53979 (= lt!252727 (choose!149 (buf!3912 thiss!1602) lt!252455 (buf!3912 (_3!522 lt!252462)) #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (currentByte!7161 (_3!522 lt!252462))))))

(assert (=> d!53979 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (currentByte!7161 (_3!522 lt!252462))))))

(assert (=> d!53979 (= (arrayRangesEqTransitive!139 (buf!3912 thiss!1602) lt!252455 (buf!3912 (_3!522 lt!252462)) #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (currentByte!7161 (_3!522 lt!252462))) lt!252727)))

(declare-fun bs!13363 () Bool)

(assert (= bs!13363 d!53979))

(declare-fun m!252825 () Bool)

(assert (=> bs!13363 m!252825))

(declare-fun m!252827 () Bool)

(assert (=> bs!13363 m!252827))

(assert (=> b!159996 d!53979))

(declare-fun d!53987 () Bool)

(declare-fun e!109573 () Bool)

(assert (=> d!53987 e!109573))

(declare-fun res!133672 () Bool)

(assert (=> d!53987 (=> (not res!133672) (not e!109573))))

(assert (=> d!53987 (= res!133672 (and (bvsge (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000000) (bvslt (currentByte!7161 (_3!522 lt!252462)) (size!3454 (buf!3912 thiss!1602)))))))

(declare-fun lt!252730 () Unit!10925)

(declare-fun choose!150 (array!7633 (_ BitVec 32) (_ BitVec 8)) Unit!10925)

(assert (=> d!53987 (= lt!252730 (choose!150 (buf!3912 thiss!1602) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))))))

(assert (=> d!53987 (and (bvsle #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462))) (bvslt (currentByte!7161 (_3!522 lt!252462)) (size!3454 (buf!3912 thiss!1602))))))

(assert (=> d!53987 (= (arrayUpdatedAtPrefixLemma!113 (buf!3912 thiss!1602) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) lt!252730)))

(declare-fun b!160169 () Bool)

(assert (=> b!160169 (= e!109573 (arrayRangesEq!505 (buf!3912 thiss!1602) (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462))))))

(assert (= (and d!53987 res!133672) b!160169))

(assert (=> d!53987 m!252469))

(declare-fun m!252829 () Bool)

(assert (=> d!53987 m!252829))

(assert (=> b!160169 m!252475))

(assert (=> b!160169 m!252479))

(assert (=> b!159996 d!53987))

(declare-fun d!53989 () Bool)

(declare-fun e!109574 () Bool)

(assert (=> d!53989 e!109574))

(declare-fun res!133673 () Bool)

(assert (=> d!53989 (=> (not res!133673) (not e!109574))))

(assert (=> d!53989 (= res!133673 (and (bvsge (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000000) (bvslt (currentByte!7161 (_3!522 lt!252462)) (size!3454 lt!252455))))))

(declare-fun lt!252731 () Unit!10925)

(assert (=> d!53989 (= lt!252731 (choose!150 lt!252455 (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))))))

(assert (=> d!53989 (and (bvsle #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462))) (bvslt (currentByte!7161 (_3!522 lt!252462)) (size!3454 lt!252455)))))

(assert (=> d!53989 (= (arrayUpdatedAtPrefixLemma!113 lt!252455 (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) lt!252731)))

(declare-fun b!160170 () Bool)

(assert (=> b!160170 (= e!109574 (arrayRangesEq!505 lt!252455 (array!7634 (store (arr!4375 lt!252455) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 lt!252455)) #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462))))))

(assert (= (and d!53989 res!133673) b!160170))

(assert (=> d!53989 m!252469))

(declare-fun m!252831 () Bool)

(assert (=> d!53989 m!252831))

(declare-fun m!252833 () Bool)

(assert (=> b!160170 m!252833))

(declare-fun m!252835 () Bool)

(assert (=> b!160170 m!252835))

(assert (=> b!159996 d!53989))

(declare-fun d!53991 () Bool)

(declare-fun res!133674 () Bool)

(declare-fun e!109575 () Bool)

(assert (=> d!53991 (=> res!133674 e!109575)))

(assert (=> d!53991 (= res!133674 (= #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462))))))

(assert (=> d!53991 (= (arrayRangesEq!505 lt!252455 (array!7634 (store (store (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) lt!252453) (currentByte!7161 thiss!1602) lt!252461) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7161 (_3!522 lt!252462))) e!109575)))

(declare-fun b!160171 () Bool)

(declare-fun e!109576 () Bool)

(assert (=> b!160171 (= e!109575 e!109576)))

(declare-fun res!133675 () Bool)

(assert (=> b!160171 (=> (not res!133675) (not e!109576))))

(assert (=> b!160171 (= res!133675 (= (select (arr!4375 lt!252455) #b00000000000000000000000000000000) (select (arr!4375 (array!7634 (store (store (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) lt!252453) (currentByte!7161 thiss!1602) lt!252461) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!160172 () Bool)

(assert (=> b!160172 (= e!109576 (arrayRangesEq!505 lt!252455 (array!7634 (store (store (store (arr!4375 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) lt!252453) (currentByte!7161 thiss!1602) lt!252461) (currentByte!7161 (_3!522 lt!252462)) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)))) (size!3454 (buf!3912 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7161 (_3!522 lt!252462))))))

(assert (= (and d!53991 (not res!133674)) b!160171))

(assert (= (and b!160171 res!133675) b!160172))

(declare-fun m!252837 () Bool)

(assert (=> b!160171 m!252837))

(declare-fun m!252839 () Bool)

(assert (=> b!160171 m!252839))

(declare-fun m!252841 () Bool)

(assert (=> b!160172 m!252841))

(assert (=> b!159996 d!53991))

(declare-fun d!53993 () Bool)

(declare-fun res!133676 () Bool)

(declare-fun e!109577 () Bool)

(assert (=> d!53993 (=> res!133676 e!109577)))

(assert (=> d!53993 (= res!133676 (= #b00000000000000000000000000000000 (currentByte!7161 thiss!1602)))))

(assert (=> d!53993 (= (arrayRangesEq!505 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) #b00000000000000000000000000000000 (currentByte!7161 thiss!1602)) e!109577)))

(declare-fun b!160173 () Bool)

(declare-fun e!109578 () Bool)

(assert (=> b!160173 (= e!109577 e!109578)))

(declare-fun res!133677 () Bool)

(assert (=> b!160173 (=> (not res!133677) (not e!109578))))

(assert (=> b!160173 (= res!133677 (= (select (arr!4375 (buf!3912 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4375 (buf!3912 (_3!522 lt!252462))) #b00000000000000000000000000000000)))))

(declare-fun b!160174 () Bool)

(assert (=> b!160174 (= e!109578 (arrayRangesEq!505 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7161 thiss!1602)))))

(assert (= (and d!53993 (not res!133676)) b!160173))

(assert (= (and b!160173 res!133677) b!160174))

(assert (=> b!160173 m!252761))

(assert (=> b!160173 m!252763))

(declare-fun m!252843 () Bool)

(assert (=> b!160174 m!252843))

(assert (=> b!159997 d!53993))

(declare-fun d!53995 () Bool)

(assert (=> d!53995 (= (array_inv!3201 (buf!3912 thiss!1602)) (bvsge (size!3454 (buf!3912 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160002 d!53995))

(declare-fun d!53997 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53997 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3454 (buf!3912 (_1!7753 lt!252456)))) ((_ sign_extend 32) (currentByte!7161 (_1!7753 lt!252456))) ((_ sign_extend 32) (currentBit!7156 (_1!7753 lt!252456)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3454 (buf!3912 (_1!7753 lt!252456)))) ((_ sign_extend 32) (currentByte!7161 (_1!7753 lt!252456))) ((_ sign_extend 32) (currentBit!7156 (_1!7753 lt!252456)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13364 () Bool)

(assert (= bs!13364 d!53997))

(declare-fun m!252845 () Bool)

(assert (=> bs!13364 m!252845))

(assert (=> b!159993 d!53997))

(declare-fun b!160204 () Bool)

(declare-fun res!133705 () Bool)

(declare-fun e!109596 () Bool)

(assert (=> b!160204 (=> (not res!133705) (not e!109596))))

(declare-fun lt!252798 () tuple2!14462)

(assert (=> b!160204 (= res!133705 (isPrefixOf!0 (_2!7753 lt!252798) (_3!522 lt!252462)))))

(declare-fun d!53999 () Bool)

(assert (=> d!53999 e!109596))

(declare-fun res!133703 () Bool)

(assert (=> d!53999 (=> (not res!133703) (not e!109596))))

(assert (=> d!53999 (= res!133703 (isPrefixOf!0 (_1!7753 lt!252798) (_2!7753 lt!252798)))))

(declare-fun lt!252797 () BitStream!6076)

(assert (=> d!53999 (= lt!252798 (tuple2!14463 lt!252797 (_3!522 lt!252462)))))

(declare-fun lt!252805 () Unit!10925)

(declare-fun lt!252813 () Unit!10925)

(assert (=> d!53999 (= lt!252805 lt!252813)))

(assert (=> d!53999 (isPrefixOf!0 lt!252797 (_3!522 lt!252462))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6076 BitStream!6076 BitStream!6076) Unit!10925)

(assert (=> d!53999 (= lt!252813 (lemmaIsPrefixTransitive!0 lt!252797 (_3!522 lt!252462) (_3!522 lt!252462)))))

(declare-fun lt!252799 () Unit!10925)

(declare-fun lt!252810 () Unit!10925)

(assert (=> d!53999 (= lt!252799 lt!252810)))

(assert (=> d!53999 (isPrefixOf!0 lt!252797 (_3!522 lt!252462))))

(assert (=> d!53999 (= lt!252810 (lemmaIsPrefixTransitive!0 lt!252797 thiss!1602 (_3!522 lt!252462)))))

(declare-fun lt!252807 () Unit!10925)

(declare-fun e!109595 () Unit!10925)

(assert (=> d!53999 (= lt!252807 e!109595)))

(declare-fun c!8462 () Bool)

(assert (=> d!53999 (= c!8462 (not (= (size!3454 (buf!3912 thiss!1602)) #b00000000000000000000000000000000)))))

(declare-fun lt!252803 () Unit!10925)

(declare-fun lt!252802 () Unit!10925)

(assert (=> d!53999 (= lt!252803 lt!252802)))

(assert (=> d!53999 (isPrefixOf!0 (_3!522 lt!252462) (_3!522 lt!252462))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6076) Unit!10925)

(assert (=> d!53999 (= lt!252802 (lemmaIsPrefixRefl!0 (_3!522 lt!252462)))))

(declare-fun lt!252804 () Unit!10925)

(declare-fun lt!252815 () Unit!10925)

(assert (=> d!53999 (= lt!252804 lt!252815)))

(assert (=> d!53999 (= lt!252815 (lemmaIsPrefixRefl!0 (_3!522 lt!252462)))))

(declare-fun lt!252811 () Unit!10925)

(declare-fun lt!252809 () Unit!10925)

(assert (=> d!53999 (= lt!252811 lt!252809)))

(assert (=> d!53999 (isPrefixOf!0 lt!252797 lt!252797)))

(assert (=> d!53999 (= lt!252809 (lemmaIsPrefixRefl!0 lt!252797))))

(declare-fun lt!252812 () Unit!10925)

(declare-fun lt!252801 () Unit!10925)

(assert (=> d!53999 (= lt!252812 lt!252801)))

(assert (=> d!53999 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!53999 (= lt!252801 (lemmaIsPrefixRefl!0 thiss!1602))))

(assert (=> d!53999 (= lt!252797 (BitStream!6077 (buf!3912 (_3!522 lt!252462)) (currentByte!7161 thiss!1602) (currentBit!7156 thiss!1602)))))

(assert (=> d!53999 (isPrefixOf!0 thiss!1602 (_3!522 lt!252462))))

(assert (=> d!53999 (= (reader!0 thiss!1602 (_3!522 lt!252462)) lt!252798)))

(declare-fun b!160205 () Bool)

(declare-fun Unit!10945 () Unit!10925)

(assert (=> b!160205 (= e!109595 Unit!10945)))

(declare-fun b!160206 () Bool)

(declare-fun lt!252808 () (_ BitVec 64))

(declare-fun lt!252796 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6076 (_ BitVec 64)) BitStream!6076)

(assert (=> b!160206 (= e!109596 (= (_1!7753 lt!252798) (withMovedBitIndex!0 (_2!7753 lt!252798) (bvsub lt!252796 lt!252808))))))

(assert (=> b!160206 (or (= (bvand lt!252796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252808 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252796 lt!252808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!160206 (= lt!252808 (bitIndex!0 (size!3454 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)) (currentBit!7156 (_3!522 lt!252462))))))

(assert (=> b!160206 (= lt!252796 (bitIndex!0 (size!3454 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) (currentBit!7156 thiss!1602)))))

(declare-fun b!160207 () Bool)

(declare-fun res!133704 () Bool)

(assert (=> b!160207 (=> (not res!133704) (not e!109596))))

(assert (=> b!160207 (= res!133704 (isPrefixOf!0 (_1!7753 lt!252798) thiss!1602))))

(declare-fun b!160208 () Bool)

(declare-fun lt!252800 () Unit!10925)

(assert (=> b!160208 (= e!109595 lt!252800)))

(declare-fun lt!252814 () (_ BitVec 64))

(assert (=> b!160208 (= lt!252814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!252806 () (_ BitVec 64))

(assert (=> b!160208 (= lt!252806 (bitIndex!0 (size!3454 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) (currentBit!7156 thiss!1602)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!7633 array!7633 (_ BitVec 64) (_ BitVec 64)) Unit!10925)

(assert (=> b!160208 (= lt!252800 (arrayBitRangesEqSymmetric!0 (buf!3912 thiss!1602) (buf!3912 (_3!522 lt!252462)) lt!252814 lt!252806))))

(assert (=> b!160208 (arrayBitRangesEq!0 (buf!3912 (_3!522 lt!252462)) (buf!3912 thiss!1602) lt!252814 lt!252806)))

(assert (= (and d!53999 c!8462) b!160208))

(assert (= (and d!53999 (not c!8462)) b!160205))

(assert (= (and d!53999 res!133703) b!160207))

(assert (= (and b!160207 res!133704) b!160204))

(assert (= (and b!160204 res!133705) b!160206))

(assert (=> b!160208 m!252495))

(declare-fun m!252861 () Bool)

(assert (=> b!160208 m!252861))

(declare-fun m!252863 () Bool)

(assert (=> b!160208 m!252863))

(declare-fun m!252865 () Bool)

(assert (=> b!160204 m!252865))

(declare-fun m!252867 () Bool)

(assert (=> d!53999 m!252867))

(declare-fun m!252869 () Bool)

(assert (=> d!53999 m!252869))

(declare-fun m!252871 () Bool)

(assert (=> d!53999 m!252871))

(declare-fun m!252873 () Bool)

(assert (=> d!53999 m!252873))

(declare-fun m!252875 () Bool)

(assert (=> d!53999 m!252875))

(declare-fun m!252877 () Bool)

(assert (=> d!53999 m!252877))

(declare-fun m!252879 () Bool)

(assert (=> d!53999 m!252879))

(declare-fun m!252881 () Bool)

(assert (=> d!53999 m!252881))

(declare-fun m!252883 () Bool)

(assert (=> d!53999 m!252883))

(declare-fun m!252885 () Bool)

(assert (=> d!53999 m!252885))

(assert (=> d!53999 m!252489))

(declare-fun m!252887 () Bool)

(assert (=> b!160207 m!252887))

(declare-fun m!252889 () Bool)

(assert (=> b!160206 m!252889))

(assert (=> b!160206 m!252493))

(assert (=> b!160206 m!252495))

(assert (=> b!159993 d!53999))

(declare-fun d!54011 () Bool)

(declare-fun e!109599 () Bool)

(assert (=> d!54011 e!109599))

(declare-fun res!133710 () Bool)

(assert (=> d!54011 (=> (not res!133710) (not e!109599))))

(declare-fun lt!252831 () (_ BitVec 64))

(declare-fun lt!252829 () (_ BitVec 64))

(declare-fun lt!252832 () (_ BitVec 64))

(assert (=> d!54011 (= res!133710 (= lt!252829 (bvsub lt!252831 lt!252832)))))

(assert (=> d!54011 (or (= (bvand lt!252831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252832 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252831 lt!252832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54011 (= lt!252832 (remainingBits!0 ((_ sign_extend 32) (size!3454 (buf!3912 (_3!522 lt!252462)))) ((_ sign_extend 32) (currentByte!7161 (_3!522 lt!252462))) ((_ sign_extend 32) (currentBit!7156 (_3!522 lt!252462)))))))

(declare-fun lt!252833 () (_ BitVec 64))

(declare-fun lt!252830 () (_ BitVec 64))

(assert (=> d!54011 (= lt!252831 (bvmul lt!252833 lt!252830))))

(assert (=> d!54011 (or (= lt!252833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!252830 (bvsdiv (bvmul lt!252833 lt!252830) lt!252833)))))

(assert (=> d!54011 (= lt!252830 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!54011 (= lt!252833 ((_ sign_extend 32) (size!3454 (buf!3912 (_3!522 lt!252462)))))))

(assert (=> d!54011 (= lt!252829 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7161 (_3!522 lt!252462))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7156 (_3!522 lt!252462)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54011 (invariant!0 (currentBit!7156 (_3!522 lt!252462)) (currentByte!7161 (_3!522 lt!252462)) (size!3454 (buf!3912 (_3!522 lt!252462))))))

(assert (=> d!54011 (= (bitIndex!0 (size!3454 (buf!3912 (_3!522 lt!252462))) (currentByte!7161 (_3!522 lt!252462)) (currentBit!7156 (_3!522 lt!252462))) lt!252829)))

(declare-fun b!160213 () Bool)

(declare-fun res!133711 () Bool)

(assert (=> b!160213 (=> (not res!133711) (not e!109599))))

(assert (=> b!160213 (= res!133711 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!252829))))

(declare-fun b!160214 () Bool)

(declare-fun lt!252828 () (_ BitVec 64))

(assert (=> b!160214 (= e!109599 (bvsle lt!252829 (bvmul lt!252828 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!160214 (or (= lt!252828 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!252828 #b0000000000000000000000000000000000000000000000000000000000001000) lt!252828)))))

(assert (=> b!160214 (= lt!252828 ((_ sign_extend 32) (size!3454 (buf!3912 (_3!522 lt!252462)))))))

(assert (= (and d!54011 res!133710) b!160213))

(assert (= (and b!160213 res!133711) b!160214))

(declare-fun m!252891 () Bool)

(assert (=> d!54011 m!252891))

(declare-fun m!252893 () Bool)

(assert (=> d!54011 m!252893))

(assert (=> b!159994 d!54011))

(declare-fun d!54013 () Bool)

(declare-fun e!109600 () Bool)

(assert (=> d!54013 e!109600))

(declare-fun res!133712 () Bool)

(assert (=> d!54013 (=> (not res!133712) (not e!109600))))

(declare-fun lt!252835 () (_ BitVec 64))

(declare-fun lt!252837 () (_ BitVec 64))

(declare-fun lt!252838 () (_ BitVec 64))

(assert (=> d!54013 (= res!133712 (= lt!252835 (bvsub lt!252837 lt!252838)))))

(assert (=> d!54013 (or (= (bvand lt!252837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252838 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252837 lt!252838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54013 (= lt!252838 (remainingBits!0 ((_ sign_extend 32) (size!3454 (buf!3912 thiss!1602))) ((_ sign_extend 32) (currentByte!7161 thiss!1602)) ((_ sign_extend 32) (currentBit!7156 thiss!1602))))))

(declare-fun lt!252839 () (_ BitVec 64))

(declare-fun lt!252836 () (_ BitVec 64))

(assert (=> d!54013 (= lt!252837 (bvmul lt!252839 lt!252836))))

(assert (=> d!54013 (or (= lt!252839 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!252836 (bvsdiv (bvmul lt!252839 lt!252836) lt!252839)))))

(assert (=> d!54013 (= lt!252836 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!54013 (= lt!252839 ((_ sign_extend 32) (size!3454 (buf!3912 thiss!1602))))))

(assert (=> d!54013 (= lt!252835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7161 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7156 thiss!1602))))))

(assert (=> d!54013 (invariant!0 (currentBit!7156 thiss!1602) (currentByte!7161 thiss!1602) (size!3454 (buf!3912 thiss!1602)))))

(assert (=> d!54013 (= (bitIndex!0 (size!3454 (buf!3912 thiss!1602)) (currentByte!7161 thiss!1602) (currentBit!7156 thiss!1602)) lt!252835)))

(declare-fun b!160215 () Bool)

(declare-fun res!133713 () Bool)

(assert (=> b!160215 (=> (not res!133713) (not e!109600))))

(assert (=> b!160215 (= res!133713 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!252835))))

(declare-fun b!160216 () Bool)

(declare-fun lt!252834 () (_ BitVec 64))

(assert (=> b!160216 (= e!109600 (bvsle lt!252835 (bvmul lt!252834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!160216 (or (= lt!252834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!252834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!252834)))))

(assert (=> b!160216 (= lt!252834 ((_ sign_extend 32) (size!3454 (buf!3912 thiss!1602))))))

(assert (= (and d!54013 res!133712) b!160215))

(assert (= (and b!160215 res!133713) b!160216))

(declare-fun m!252895 () Bool)

(assert (=> d!54013 m!252895))

(declare-fun m!252897 () Bool)

(assert (=> d!54013 m!252897))

(assert (=> b!159994 d!54013))

(declare-fun d!54015 () Bool)

(declare-fun res!133714 () Bool)

(declare-fun e!109601 () Bool)

(assert (=> d!54015 (=> res!133714 e!109601)))

(assert (=> d!54015 (= res!133714 (= #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)))))

(assert (=> d!54015 (= (arrayRangesEq!505 (buf!3912 thiss!1602) lt!252455 #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)) e!109601)))

(declare-fun b!160217 () Bool)

(declare-fun e!109602 () Bool)

(assert (=> b!160217 (= e!109601 e!109602)))

(declare-fun res!133715 () Bool)

(assert (=> b!160217 (=> (not res!133715) (not e!109602))))

(assert (=> b!160217 (= res!133715 (= (select (arr!4375 (buf!3912 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4375 lt!252455) #b00000000000000000000000000000000)))))

(declare-fun b!160218 () Bool)

(assert (=> b!160218 (= e!109602 (arrayRangesEq!505 (buf!3912 thiss!1602) lt!252455 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)))))

(assert (= (and d!54015 (not res!133714)) b!160217))

(assert (= (and b!160217 res!133715) b!160218))

(assert (=> b!160217 m!252761))

(assert (=> b!160217 m!252837))

(declare-fun m!252899 () Bool)

(assert (=> b!160218 m!252899))

(assert (=> b!159998 d!54015))

(declare-fun d!54017 () Bool)

(declare-fun res!133716 () Bool)

(declare-fun e!109603 () Bool)

(assert (=> d!54017 (=> res!133716 e!109603)))

(assert (=> d!54017 (= res!133716 (= #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)))))

(assert (=> d!54017 (= (arrayRangesEq!505 (buf!3912 thiss!1602) (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) lt!252460) (size!3454 (buf!3912 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)) e!109603)))

(declare-fun b!160219 () Bool)

(declare-fun e!109604 () Bool)

(assert (=> b!160219 (= e!109603 e!109604)))

(declare-fun res!133717 () Bool)

(assert (=> b!160219 (=> (not res!133717) (not e!109604))))

(assert (=> b!160219 (= res!133717 (= (select (arr!4375 (buf!3912 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4375 (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) lt!252460) (size!3454 (buf!3912 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!160220 () Bool)

(assert (=> b!160220 (= e!109604 (arrayRangesEq!505 (buf!3912 thiss!1602) (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) lt!252460) (size!3454 (buf!3912 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)))))

(assert (= (and d!54017 (not res!133716)) b!160219))

(assert (= (and b!160219 res!133717) b!160220))

(assert (=> b!160219 m!252761))

(declare-fun m!252901 () Bool)

(assert (=> b!160219 m!252901))

(declare-fun m!252903 () Bool)

(assert (=> b!160220 m!252903))

(assert (=> b!159998 d!54017))

(declare-fun d!54019 () Bool)

(declare-fun e!109605 () Bool)

(assert (=> d!54019 e!109605))

(declare-fun res!133718 () Bool)

(assert (=> d!54019 (=> (not res!133718) (not e!109605))))

(assert (=> d!54019 (= res!133718 (and (bvsge (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (size!3454 (buf!3912 thiss!1602)))))))

(declare-fun lt!252840 () Unit!10925)

(assert (=> d!54019 (= lt!252840 (choose!150 (buf!3912 thiss!1602) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) lt!252460))))

(assert (=> d!54019 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) (size!3454 (buf!3912 thiss!1602))))))

(assert (=> d!54019 (= (arrayUpdatedAtPrefixLemma!113 (buf!3912 thiss!1602) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) lt!252460) lt!252840)))

(declare-fun b!160221 () Bool)

(assert (=> b!160221 (= e!109605 (arrayRangesEq!505 (buf!3912 thiss!1602) (array!7634 (store (arr!4375 (buf!3912 thiss!1602)) (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001) lt!252460) (size!3454 (buf!3912 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7161 (_3!522 lt!252462)) #b00000000000000000000000000000001)))))

(assert (= (and d!54019 res!133718) b!160221))

(declare-fun m!252905 () Bool)

(assert (=> d!54019 m!252905))

(assert (=> b!160221 m!252507))

(assert (=> b!160221 m!252519))

(assert (=> b!159998 d!54019))

(declare-fun d!54021 () Bool)

(assert (=> d!54021 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3454 (buf!3912 thiss!1602))) ((_ sign_extend 32) (currentByte!7161 thiss!1602)) ((_ sign_extend 32) (currentBit!7156 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3454 (buf!3912 thiss!1602))) ((_ sign_extend 32) (currentByte!7161 thiss!1602)) ((_ sign_extend 32) (currentBit!7156 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13367 () Bool)

(assert (= bs!13367 d!54021))

(assert (=> bs!13367 m!252895))

(assert (=> start!32458 d!54021))

(declare-fun d!54023 () Bool)

(assert (=> d!54023 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7156 thiss!1602) (currentByte!7161 thiss!1602) (size!3454 (buf!3912 thiss!1602))))))

(declare-fun bs!13368 () Bool)

(assert (= bs!13368 d!54023))

(assert (=> bs!13368 m!252897))

(assert (=> start!32458 d!54023))

(push 1)

(assert (not d!53989))

(assert (not d!54023))

(assert (not d!53987))

(assert (not b!160134))

(assert (not b!160174))

(assert (not b!160159))

(assert (not d!53979))

(assert (not d!54021))

(assert (not b!160163))

(assert (not d!54019))

(assert (not b!160170))

(assert (not d!53999))

(assert (not d!54011))

(assert (not b!160206))

(assert (not b!160204))

(assert (not b!160218))

(assert (not b!160172))

(assert (not b!160221))

(assert (not b!160169))

(assert (not b!160161))

(assert (not b!160207))

(assert (not d!54013))

(assert (not b!160208))

(assert (not d!53997))

(assert (not b!160220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


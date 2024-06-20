; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67148 () Bool)

(assert start!67148)

(declare-fun b!301585 () Bool)

(declare-datatypes ((Unit!21120 0))(
  ( (Unit!21121) )
))
(declare-fun e!216604 () Unit!21120)

(declare-fun Unit!21122 () Unit!21120)

(assert (=> b!301585 (= e!216604 Unit!21122)))

(declare-fun b!301586 () Bool)

(declare-fun res!248301 () Bool)

(declare-fun e!216610 () Bool)

(assert (=> b!301586 (=> (not res!248301) (not e!216610))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun lt!436790 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301586 (= res!248301 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436790) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301587 () Bool)

(declare-fun e!216608 () Unit!21120)

(declare-fun Unit!21123 () Unit!21120)

(assert (=> b!301587 (= e!216608 Unit!21123)))

(declare-fun b!301588 () Bool)

(declare-fun e!216603 () Bool)

(declare-fun call!5462 () Bool)

(assert (=> b!301588 (= e!216603 call!5462)))

(declare-fun b!301589 () Bool)

(declare-fun lt!436787 () Unit!21120)

(assert (=> b!301589 (= e!216608 lt!436787)))

(declare-datatypes ((tuple4!1082 0))(
  ( (tuple4!1083 (_1!13196 (_ BitVec 32)) (_2!13196 (_ BitVec 32)) (_3!1498 (_ BitVec 32)) (_4!541 (_ BitVec 32))) )
))
(declare-fun lt!436786 () tuple4!1082)

(declare-datatypes ((array!18274 0))(
  ( (array!18275 (arr!9020 (Array (_ BitVec 32) (_ BitVec 8))) (size!7937 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18274)

(declare-fun lt!436791 () tuple4!1082)

(declare-fun a1!948 () array!18274)

(declare-fun arrayRangesEqImpliesEq!251 (array!18274 array!18274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21120)

(assert (=> b!301589 (= lt!436787 (arrayRangesEqImpliesEq!251 a1!948 a2!948 (_1!13196 lt!436791) (_4!541 lt!436786) (_2!13196 lt!436791)))))

(assert (=> b!301589 (= (select (arr!9020 a1!948) (_4!541 lt!436786)) (select (arr!9020 a2!948) (_4!541 lt!436786)))))

(declare-fun b!301590 () Bool)

(declare-fun e!216601 () Bool)

(declare-fun e!216599 () Bool)

(assert (=> b!301590 (= e!216601 e!216599)))

(declare-fun res!248304 () Bool)

(assert (=> b!301590 (=> (not res!248304) (not e!216599))))

(assert (=> b!301590 (= res!248304 (= (_3!1498 lt!436786) (_4!541 lt!436786)))))

(declare-fun lt!436789 () Unit!21120)

(assert (=> b!301590 (= lt!436789 e!216608)))

(declare-fun c!14228 () Bool)

(assert (=> b!301590 (= c!14228 (and (bvslt (_4!541 lt!436786) (_4!541 lt!436791)) (bvslt (_3!1498 lt!436791) (_4!541 lt!436786))))))

(declare-fun lt!436782 () Unit!21120)

(assert (=> b!301590 (= lt!436782 e!216604)))

(declare-fun c!14227 () Bool)

(assert (=> b!301590 (= c!14227 (and (bvslt (_3!1498 lt!436791) (_3!1498 lt!436786)) (bvslt (_3!1498 lt!436786) (_4!541 lt!436791))))))

(declare-fun b!301591 () Bool)

(declare-fun e!216606 () Unit!21120)

(declare-fun Unit!21124 () Unit!21120)

(assert (=> b!301591 (= e!216606 Unit!21124)))

(declare-fun b!301593 () Bool)

(declare-fun e!216605 () Bool)

(declare-fun e!216609 () Bool)

(assert (=> b!301593 (= e!216605 e!216609)))

(declare-fun res!248297 () Bool)

(declare-fun lt!436783 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301593 (= res!248297 (byteRangesEq!0 (select (arr!9020 a1!948) (_3!1498 lt!436791)) (select (arr!9020 a2!948) (_3!1498 lt!436791)) lt!436783 #b00000000000000000000000000000111))))

(assert (=> b!301593 (=> (not res!248297) (not e!216609))))

(declare-fun b!301594 () Bool)

(declare-fun lt!436785 () Unit!21120)

(assert (=> b!301594 (= e!216604 lt!436785)))

(assert (=> b!301594 (= lt!436785 (arrayRangesEqImpliesEq!251 a1!948 a2!948 (_1!13196 lt!436791) (_3!1498 lt!436786) (_2!13196 lt!436791)))))

(assert (=> b!301594 (= (select (arr!9020 a1!948) (_3!1498 lt!436786)) (select (arr!9020 a2!948) (_3!1498 lt!436786)))))

(declare-fun b!301595 () Bool)

(assert (=> b!301595 (= e!216599 (not (byteRangesEq!0 (select (arr!9020 a1!948) (_3!1498 lt!436786)) (select (arr!9020 a2!948) (_3!1498 lt!436786)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun b!301596 () Bool)

(declare-fun res!248303 () Bool)

(assert (=> b!301596 (=> (not res!248303) (not e!216610))))

(declare-fun arrayBitRangesEq!0 (array!18274 array!18274 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301596 (= res!248303 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301597 () Bool)

(assert (=> b!301597 (= e!216605 call!5462)))

(declare-fun b!301598 () Bool)

(declare-fun res!248298 () Bool)

(declare-fun lt!436788 () (_ BitVec 32))

(assert (=> b!301598 (= res!248298 (= lt!436788 #b00000000000000000000000000000000))))

(assert (=> b!301598 (=> res!248298 e!216603)))

(assert (=> b!301598 (= e!216609 e!216603)))

(declare-fun bm!5459 () Bool)

(declare-fun c!14229 () Bool)

(assert (=> bm!5459 (= call!5462 (byteRangesEq!0 (ite c!14229 (select (arr!9020 a1!948) (_3!1498 lt!436791)) (select (arr!9020 a1!948) (_4!541 lt!436791))) (ite c!14229 (select (arr!9020 a2!948) (_3!1498 lt!436791)) (select (arr!9020 a2!948) (_4!541 lt!436791))) (ite c!14229 lt!436783 #b00000000000000000000000000000000) lt!436788))))

(declare-fun b!301599 () Bool)

(declare-fun lt!436784 () Unit!21120)

(assert (=> b!301599 (= e!216606 lt!436784)))

(declare-fun arrayRangesEqSlicedLemma!209 (array!18274 array!18274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21120)

(assert (=> b!301599 (= lt!436784 (arrayRangesEqSlicedLemma!209 a1!948 a2!948 (_1!13196 lt!436791) (_2!13196 lt!436791) (_1!13196 lt!436786) (_2!13196 lt!436786)))))

(declare-fun arrayRangesEq!1599 (array!18274 array!18274 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301599 (arrayRangesEq!1599 a1!948 a2!948 (_1!13196 lt!436786) (_2!13196 lt!436786))))

(declare-fun b!301600 () Bool)

(assert (=> b!301600 (= e!216610 e!216601)))

(declare-fun res!248302 () Bool)

(assert (=> b!301600 (=> (not res!248302) (not e!216601))))

(assert (=> b!301600 (= res!248302 e!216605)))

(assert (=> b!301600 (= c!14229 (= (_3!1498 lt!436791) (_4!541 lt!436791)))))

(declare-fun lt!436781 () Unit!21120)

(assert (=> b!301600 (= lt!436781 e!216606)))

(declare-fun c!14226 () Bool)

(assert (=> b!301600 (= c!14226 (bvslt (_1!13196 lt!436786) (_2!13196 lt!436786)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1082)

(assert (=> b!301600 (= lt!436786 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301600 (= lt!436788 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301600 (= lt!436783 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301600 (= lt!436791 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!248300 () Bool)

(declare-fun e!216600 () Bool)

(assert (=> start!67148 (=> (not res!248300) (not e!216600))))

(assert (=> start!67148 (= res!248300 (and (bvsle (size!7937 a1!948) (size!7937 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67148 e!216600))

(assert (=> start!67148 true))

(declare-fun array_inv!7549 (array!18274) Bool)

(assert (=> start!67148 (array_inv!7549 a1!948)))

(assert (=> start!67148 (array_inv!7549 a2!948)))

(declare-fun b!301592 () Bool)

(assert (=> b!301592 (= e!216600 e!216610)))

(declare-fun res!248299 () Bool)

(assert (=> b!301592 (=> (not res!248299) (not e!216610))))

(assert (=> b!301592 (= res!248299 (and (bvsle toBit!258 lt!436790) (bvsle fromBit!258 lt!436790)))))

(assert (=> b!301592 (= lt!436790 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7937 a1!948))))))

(assert (= (and start!67148 res!248300) b!301592))

(assert (= (and b!301592 res!248299) b!301596))

(assert (= (and b!301596 res!248303) b!301586))

(assert (= (and b!301586 res!248301) b!301600))

(assert (= (and b!301600 c!14226) b!301599))

(assert (= (and b!301600 (not c!14226)) b!301591))

(assert (= (and b!301600 c!14229) b!301597))

(assert (= (and b!301600 (not c!14229)) b!301593))

(assert (= (and b!301593 res!248297) b!301598))

(assert (= (and b!301598 (not res!248298)) b!301588))

(assert (= (or b!301597 b!301588) bm!5459))

(assert (= (and b!301600 res!248302) b!301590))

(assert (= (and b!301590 c!14227) b!301594))

(assert (= (and b!301590 (not c!14227)) b!301585))

(assert (= (and b!301590 c!14228) b!301589))

(assert (= (and b!301590 (not c!14228)) b!301587))

(assert (= (and b!301590 res!248304) b!301595))

(declare-fun m!440407 () Bool)

(assert (=> bm!5459 m!440407))

(declare-fun m!440409 () Bool)

(assert (=> bm!5459 m!440409))

(declare-fun m!440411 () Bool)

(assert (=> bm!5459 m!440411))

(declare-fun m!440413 () Bool)

(assert (=> bm!5459 m!440413))

(declare-fun m!440415 () Bool)

(assert (=> bm!5459 m!440415))

(assert (=> b!301593 m!440415))

(assert (=> b!301593 m!440411))

(assert (=> b!301593 m!440415))

(assert (=> b!301593 m!440411))

(declare-fun m!440417 () Bool)

(assert (=> b!301593 m!440417))

(declare-fun m!440419 () Bool)

(assert (=> b!301599 m!440419))

(declare-fun m!440421 () Bool)

(assert (=> b!301599 m!440421))

(declare-fun m!440423 () Bool)

(assert (=> b!301600 m!440423))

(declare-fun m!440425 () Bool)

(assert (=> b!301600 m!440425))

(declare-fun m!440427 () Bool)

(assert (=> b!301596 m!440427))

(declare-fun m!440429 () Bool)

(assert (=> b!301589 m!440429))

(declare-fun m!440431 () Bool)

(assert (=> b!301589 m!440431))

(declare-fun m!440433 () Bool)

(assert (=> b!301589 m!440433))

(declare-fun m!440435 () Bool)

(assert (=> b!301595 m!440435))

(declare-fun m!440437 () Bool)

(assert (=> b!301595 m!440437))

(assert (=> b!301595 m!440435))

(assert (=> b!301595 m!440437))

(declare-fun m!440439 () Bool)

(assert (=> b!301595 m!440439))

(declare-fun m!440441 () Bool)

(assert (=> b!301594 m!440441))

(assert (=> b!301594 m!440435))

(assert (=> b!301594 m!440437))

(declare-fun m!440443 () Bool)

(assert (=> start!67148 m!440443))

(declare-fun m!440445 () Bool)

(assert (=> start!67148 m!440445))

(check-sat (not b!301589) (not b!301600) (not b!301594) (not b!301593) (not b!301599) (not bm!5459) (not b!301596) (not b!301595) (not start!67148))
(check-sat)
(get-model)

(declare-fun d!100812 () Bool)

(assert (=> d!100812 (= (byteRangesEq!0 (select (arr!9020 a1!948) (_3!1498 lt!436791)) (select (arr!9020 a2!948) (_3!1498 lt!436791)) lt!436783 #b00000000000000000000000000000111) (or (= lt!436783 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9020 a1!948) (_3!1498 lt!436791))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436783)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9020 a2!948) (_3!1498 lt!436791))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436783)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26001 () Bool)

(assert (= bs!26001 d!100812))

(declare-fun m!440487 () Bool)

(assert (=> bs!26001 m!440487))

(declare-fun m!440489 () Bool)

(assert (=> bs!26001 m!440489))

(assert (=> b!301593 d!100812))

(declare-fun d!100814 () Bool)

(assert (=> d!100814 (= (byteRangesEq!0 (ite c!14229 (select (arr!9020 a1!948) (_3!1498 lt!436791)) (select (arr!9020 a1!948) (_4!541 lt!436791))) (ite c!14229 (select (arr!9020 a2!948) (_3!1498 lt!436791)) (select (arr!9020 a2!948) (_4!541 lt!436791))) (ite c!14229 lt!436783 #b00000000000000000000000000000000) lt!436788) (or (= (ite c!14229 lt!436783 #b00000000000000000000000000000000) lt!436788) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14229 (select (arr!9020 a1!948) (_3!1498 lt!436791)) (select (arr!9020 a1!948) (_4!541 lt!436791)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436788))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14229 lt!436783 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14229 (select (arr!9020 a2!948) (_3!1498 lt!436791)) (select (arr!9020 a2!948) (_4!541 lt!436791)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436788))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14229 lt!436783 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26002 () Bool)

(assert (= bs!26002 d!100814))

(declare-fun m!440491 () Bool)

(assert (=> bs!26002 m!440491))

(declare-fun m!440493 () Bool)

(assert (=> bs!26002 m!440493))

(assert (=> bm!5459 d!100814))

(declare-fun d!100816 () Bool)

(assert (=> d!100816 (and (bvsge (_3!1498 lt!436786) #b00000000000000000000000000000000) (bvslt (_3!1498 lt!436786) (size!7937 a1!948)) (bvslt (_3!1498 lt!436786) (size!7937 a2!948)) (= (select (arr!9020 a1!948) (_3!1498 lt!436786)) (select (arr!9020 a2!948) (_3!1498 lt!436786))))))

(declare-fun lt!436827 () Unit!21120)

(declare-fun choose!530 (array!18274 array!18274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21120)

(assert (=> d!100816 (= lt!436827 (choose!530 a1!948 a2!948 (_1!13196 lt!436791) (_3!1498 lt!436786) (_2!13196 lt!436791)))))

(assert (=> d!100816 (and (bvsle #b00000000000000000000000000000000 (_1!13196 lt!436791)) (bvsle (_1!13196 lt!436791) (_2!13196 lt!436791)))))

(assert (=> d!100816 (= (arrayRangesEqImpliesEq!251 a1!948 a2!948 (_1!13196 lt!436791) (_3!1498 lt!436786) (_2!13196 lt!436791)) lt!436827)))

(declare-fun bs!26003 () Bool)

(assert (= bs!26003 d!100816))

(assert (=> bs!26003 m!440435))

(assert (=> bs!26003 m!440437))

(declare-fun m!440495 () Bool)

(assert (=> bs!26003 m!440495))

(assert (=> b!301594 d!100816))

(declare-fun d!100818 () Bool)

(assert (=> d!100818 (and (bvsge (_4!541 lt!436786) #b00000000000000000000000000000000) (bvslt (_4!541 lt!436786) (size!7937 a1!948)) (bvslt (_4!541 lt!436786) (size!7937 a2!948)) (= (select (arr!9020 a1!948) (_4!541 lt!436786)) (select (arr!9020 a2!948) (_4!541 lt!436786))))))

(declare-fun lt!436828 () Unit!21120)

(assert (=> d!100818 (= lt!436828 (choose!530 a1!948 a2!948 (_1!13196 lt!436791) (_4!541 lt!436786) (_2!13196 lt!436791)))))

(assert (=> d!100818 (and (bvsle #b00000000000000000000000000000000 (_1!13196 lt!436791)) (bvsle (_1!13196 lt!436791) (_2!13196 lt!436791)))))

(assert (=> d!100818 (= (arrayRangesEqImpliesEq!251 a1!948 a2!948 (_1!13196 lt!436791) (_4!541 lt!436786) (_2!13196 lt!436791)) lt!436828)))

(declare-fun bs!26004 () Bool)

(assert (= bs!26004 d!100818))

(assert (=> bs!26004 m!440431))

(assert (=> bs!26004 m!440433))

(declare-fun m!440497 () Bool)

(assert (=> bs!26004 m!440497))

(assert (=> b!301589 d!100818))

(declare-fun d!100820 () Bool)

(assert (=> d!100820 (arrayRangesEq!1599 a1!948 a2!948 (_1!13196 lt!436786) (_2!13196 lt!436786))))

(declare-fun lt!436831 () Unit!21120)

(declare-fun choose!531 (array!18274 array!18274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21120)

(assert (=> d!100820 (= lt!436831 (choose!531 a1!948 a2!948 (_1!13196 lt!436791) (_2!13196 lt!436791) (_1!13196 lt!436786) (_2!13196 lt!436786)))))

(assert (=> d!100820 (and (bvsle #b00000000000000000000000000000000 (_1!13196 lt!436791)) (bvsle (_1!13196 lt!436791) (_2!13196 lt!436791)))))

(assert (=> d!100820 (= (arrayRangesEqSlicedLemma!209 a1!948 a2!948 (_1!13196 lt!436791) (_2!13196 lt!436791) (_1!13196 lt!436786) (_2!13196 lt!436786)) lt!436831)))

(declare-fun bs!26005 () Bool)

(assert (= bs!26005 d!100820))

(assert (=> bs!26005 m!440421))

(declare-fun m!440499 () Bool)

(assert (=> bs!26005 m!440499))

(assert (=> b!301599 d!100820))

(declare-fun d!100822 () Bool)

(declare-fun res!248333 () Bool)

(declare-fun e!216651 () Bool)

(assert (=> d!100822 (=> res!248333 e!216651)))

(assert (=> d!100822 (= res!248333 (= (_1!13196 lt!436786) (_2!13196 lt!436786)))))

(assert (=> d!100822 (= (arrayRangesEq!1599 a1!948 a2!948 (_1!13196 lt!436786) (_2!13196 lt!436786)) e!216651)))

(declare-fun b!301653 () Bool)

(declare-fun e!216652 () Bool)

(assert (=> b!301653 (= e!216651 e!216652)))

(declare-fun res!248334 () Bool)

(assert (=> b!301653 (=> (not res!248334) (not e!216652))))

(assert (=> b!301653 (= res!248334 (= (select (arr!9020 a1!948) (_1!13196 lt!436786)) (select (arr!9020 a2!948) (_1!13196 lt!436786))))))

(declare-fun b!301654 () Bool)

(assert (=> b!301654 (= e!216652 (arrayRangesEq!1599 a1!948 a2!948 (bvadd (_1!13196 lt!436786) #b00000000000000000000000000000001) (_2!13196 lt!436786)))))

(assert (= (and d!100822 (not res!248333)) b!301653))

(assert (= (and b!301653 res!248334) b!301654))

(declare-fun m!440501 () Bool)

(assert (=> b!301653 m!440501))

(declare-fun m!440503 () Bool)

(assert (=> b!301653 m!440503))

(declare-fun m!440505 () Bool)

(assert (=> b!301654 m!440505))

(assert (=> b!301599 d!100822))

(declare-fun d!100824 () Bool)

(assert (=> d!100824 (= (byteRangesEq!0 (select (arr!9020 a1!948) (_3!1498 lt!436786)) (select (arr!9020 a2!948) (_3!1498 lt!436786)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9020 a1!948) (_3!1498 lt!436786))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9020 a2!948) (_3!1498 lt!436786))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26006 () Bool)

(assert (= bs!26006 d!100824))

(declare-fun m!440507 () Bool)

(assert (=> bs!26006 m!440507))

(declare-fun m!440509 () Bool)

(assert (=> bs!26006 m!440509))

(assert (=> b!301595 d!100824))

(declare-fun d!100826 () Bool)

(assert (=> d!100826 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1083 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301600 d!100826))

(declare-fun d!100828 () Bool)

(assert (=> d!100828 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1083 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301600 d!100828))

(declare-fun d!100830 () Bool)

(declare-fun res!248346 () Bool)

(declare-fun e!216666 () Bool)

(assert (=> d!100830 (=> res!248346 e!216666)))

(assert (=> d!100830 (= res!248346 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100830 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216666)))

(declare-fun e!216665 () Bool)

(declare-fun b!301669 () Bool)

(declare-fun lt!436838 () tuple4!1082)

(assert (=> b!301669 (= e!216665 (arrayRangesEq!1599 a1!948 a2!948 (_1!13196 lt!436838) (_2!13196 lt!436838)))))

(declare-fun lt!436840 () (_ BitVec 32))

(declare-fun e!216668 () Bool)

(declare-fun b!301670 () Bool)

(assert (=> b!301670 (= e!216668 (byteRangesEq!0 (select (arr!9020 a1!948) (_4!541 lt!436838)) (select (arr!9020 a2!948) (_4!541 lt!436838)) #b00000000000000000000000000000000 lt!436840))))

(declare-fun b!301671 () Bool)

(declare-fun e!216670 () Bool)

(declare-fun e!216669 () Bool)

(assert (=> b!301671 (= e!216670 e!216669)))

(declare-fun res!248347 () Bool)

(declare-fun call!5468 () Bool)

(assert (=> b!301671 (= res!248347 call!5468)))

(assert (=> b!301671 (=> (not res!248347) (not e!216669))))

(declare-fun lt!436839 () (_ BitVec 32))

(declare-fun c!14244 () Bool)

(declare-fun bm!5465 () Bool)

(assert (=> bm!5465 (= call!5468 (byteRangesEq!0 (select (arr!9020 a1!948) (_3!1498 lt!436838)) (select (arr!9020 a2!948) (_3!1498 lt!436838)) lt!436839 (ite c!14244 lt!436840 #b00000000000000000000000000001000)))))

(declare-fun b!301672 () Bool)

(declare-fun e!216667 () Bool)

(assert (=> b!301672 (= e!216667 e!216670)))

(assert (=> b!301672 (= c!14244 (= (_3!1498 lt!436838) (_4!541 lt!436838)))))

(declare-fun b!301673 () Bool)

(assert (=> b!301673 (= e!216670 call!5468)))

(declare-fun b!301674 () Bool)

(declare-fun res!248349 () Bool)

(assert (=> b!301674 (= res!248349 (= lt!436840 #b00000000000000000000000000000000))))

(assert (=> b!301674 (=> res!248349 e!216668)))

(assert (=> b!301674 (= e!216669 e!216668)))

(declare-fun b!301675 () Bool)

(assert (=> b!301675 (= e!216666 e!216667)))

(declare-fun res!248345 () Bool)

(assert (=> b!301675 (=> (not res!248345) (not e!216667))))

(assert (=> b!301675 (= res!248345 e!216665)))

(declare-fun res!248348 () Bool)

(assert (=> b!301675 (=> res!248348 e!216665)))

(assert (=> b!301675 (= res!248348 (bvsge (_1!13196 lt!436838) (_2!13196 lt!436838)))))

(assert (=> b!301675 (= lt!436840 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301675 (= lt!436839 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301675 (= lt!436838 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!100830 (not res!248346)) b!301675))

(assert (= (and b!301675 (not res!248348)) b!301669))

(assert (= (and b!301675 res!248345) b!301672))

(assert (= (and b!301672 c!14244) b!301673))

(assert (= (and b!301672 (not c!14244)) b!301671))

(assert (= (and b!301671 res!248347) b!301674))

(assert (= (and b!301674 (not res!248349)) b!301670))

(assert (= (or b!301673 b!301671) bm!5465))

(declare-fun m!440511 () Bool)

(assert (=> b!301669 m!440511))

(declare-fun m!440513 () Bool)

(assert (=> b!301670 m!440513))

(declare-fun m!440515 () Bool)

(assert (=> b!301670 m!440515))

(assert (=> b!301670 m!440513))

(assert (=> b!301670 m!440515))

(declare-fun m!440517 () Bool)

(assert (=> b!301670 m!440517))

(declare-fun m!440519 () Bool)

(assert (=> bm!5465 m!440519))

(declare-fun m!440521 () Bool)

(assert (=> bm!5465 m!440521))

(assert (=> bm!5465 m!440519))

(assert (=> bm!5465 m!440521))

(declare-fun m!440523 () Bool)

(assert (=> bm!5465 m!440523))

(assert (=> b!301675 m!440425))

(assert (=> b!301596 d!100830))

(declare-fun d!100832 () Bool)

(assert (=> d!100832 (= (array_inv!7549 a1!948) (bvsge (size!7937 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67148 d!100832))

(declare-fun d!100834 () Bool)

(assert (=> d!100834 (= (array_inv!7549 a2!948) (bvsge (size!7937 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67148 d!100834))

(check-sat (not d!100816) (not b!301669) (not d!100818) (not d!100820) (not b!301670) (not b!301675) (not b!301654) (not bm!5465))
(check-sat)

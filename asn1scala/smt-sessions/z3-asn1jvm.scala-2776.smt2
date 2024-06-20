; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67020 () Bool)

(assert start!67020)

(declare-fun b!300307 () Bool)

(declare-datatypes ((Unit!21006 0))(
  ( (Unit!21007) )
))
(declare-fun e!215648 () Unit!21006)

(declare-fun lt!435917 () Unit!21006)

(assert (=> b!300307 (= e!215648 lt!435917)))

(declare-datatypes ((array!18220 0))(
  ( (array!18221 (arr!8996 (Array (_ BitVec 32) (_ BitVec 8))) (size!7913 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18220)

(declare-fun a2!948 () array!18220)

(declare-datatypes ((tuple4!1034 0))(
  ( (tuple4!1035 (_1!13172 (_ BitVec 32)) (_2!13172 (_ BitVec 32)) (_3!1474 (_ BitVec 32)) (_4!517 (_ BitVec 32))) )
))
(declare-fun lt!435916 () tuple4!1034)

(declare-fun lt!435906 () tuple4!1034)

(declare-fun arrayRangesEqImpliesEq!230 (array!18220 array!18220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21006)

(assert (=> b!300307 (= lt!435917 (arrayRangesEqImpliesEq!230 a1!948 a2!948 (_1!13172 lt!435916) (_4!517 lt!435906) (_2!13172 lt!435916)))))

(assert (=> b!300307 (= (select (arr!8996 a1!948) (_4!517 lt!435906)) (select (arr!8996 a2!948) (_4!517 lt!435906)))))

(declare-fun b!300308 () Bool)

(declare-fun e!215650 () Unit!21006)

(declare-fun lt!435909 () Unit!21006)

(assert (=> b!300308 (= e!215650 lt!435909)))

(assert (=> b!300308 (= lt!435909 (arrayRangesEqImpliesEq!230 a1!948 a2!948 (_1!13172 lt!435916) (_3!1474 lt!435906) (_2!13172 lt!435916)))))

(assert (=> b!300308 (= (select (arr!8996 a1!948) (_3!1474 lt!435906)) (select (arr!8996 a2!948) (_3!1474 lt!435906)))))

(declare-fun b!300309 () Bool)

(declare-fun e!215651 () Bool)

(declare-fun e!215652 () Bool)

(assert (=> b!300309 (= e!215651 e!215652)))

(declare-fun res!247596 () Bool)

(assert (=> b!300309 (=> (not res!247596) (not e!215652))))

(declare-fun e!215649 () Bool)

(assert (=> b!300309 (= res!247596 e!215649)))

(declare-fun c!13941 () Bool)

(assert (=> b!300309 (= c!13941 (= (_3!1474 lt!435916) (_4!517 lt!435916)))))

(declare-fun lt!435913 () Unit!21006)

(declare-fun e!215655 () Unit!21006)

(assert (=> b!300309 (= lt!435913 e!215655)))

(declare-fun c!13939 () Bool)

(assert (=> b!300309 (= c!13939 (bvslt (_1!13172 lt!435906) (_2!13172 lt!435906)))))

(declare-fun lt!435918 () (_ BitVec 32))

(declare-fun toSlice!52 () (_ BitVec 64))

(assert (=> b!300309 (= lt!435918 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435911 () (_ BitVec 32))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300309 (= lt!435911 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1034)

(assert (=> b!300309 (= lt!435906 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435912 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!300309 (= lt!435912 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435915 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!300309 (= lt!435915 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300309 (= lt!435916 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300310 () Bool)

(declare-fun res!247599 () Bool)

(assert (=> b!300310 (=> (not res!247599) (not e!215651))))

(declare-fun lt!435907 () (_ BitVec 64))

(assert (=> b!300310 (= res!247599 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435907) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300311 () Bool)

(declare-fun Unit!21008 () Unit!21006)

(assert (=> b!300311 (= e!215655 Unit!21008)))

(declare-fun b!300312 () Bool)

(declare-fun res!247600 () Bool)

(assert (=> b!300312 (= res!247600 (= lt!435912 #b00000000000000000000000000000000))))

(declare-fun e!215647 () Bool)

(assert (=> b!300312 (=> res!247600 e!215647)))

(declare-fun e!215645 () Bool)

(assert (=> b!300312 (= e!215645 e!215647)))

(declare-fun bm!5369 () Bool)

(declare-fun call!5372 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5369 (= call!5372 (byteRangesEq!0 (select (arr!8996 a1!948) (_3!1474 lt!435916)) (select (arr!8996 a2!948) (_3!1474 lt!435916)) lt!435915 (ite c!13941 lt!435912 #b00000000000000000000000000000111)))))

(declare-fun b!300313 () Bool)

(assert (=> b!300313 (= e!215649 call!5372)))

(declare-fun b!300314 () Bool)

(declare-fun Unit!21009 () Unit!21006)

(assert (=> b!300314 (= e!215650 Unit!21009)))

(declare-fun b!300315 () Bool)

(assert (=> b!300315 (= e!215652 (and (= (_3!1474 lt!435906) (_4!517 lt!435906)) (or (bvsgt #b00000000000000000000000000000000 lt!435911) (bvsgt lt!435911 lt!435918) (bvsgt lt!435918 #b00000000000000000000000000001000))))))

(declare-fun lt!435914 () Unit!21006)

(assert (=> b!300315 (= lt!435914 e!215648)))

(declare-fun c!13940 () Bool)

(assert (=> b!300315 (= c!13940 (and (bvslt (_4!517 lt!435906) (_4!517 lt!435916)) (bvslt (_3!1474 lt!435916) (_4!517 lt!435906))))))

(declare-fun lt!435910 () Unit!21006)

(assert (=> b!300315 (= lt!435910 e!215650)))

(declare-fun c!13938 () Bool)

(assert (=> b!300315 (= c!13938 (and (bvslt (_3!1474 lt!435916) (_3!1474 lt!435906)) (bvslt (_3!1474 lt!435906) (_4!517 lt!435916))))))

(declare-fun res!247597 () Bool)

(declare-fun e!215646 () Bool)

(assert (=> start!67020 (=> (not res!247597) (not e!215646))))

(assert (=> start!67020 (= res!247597 (and (bvsle (size!7913 a1!948) (size!7913 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67020 e!215646))

(assert (=> start!67020 true))

(declare-fun array_inv!7525 (array!18220) Bool)

(assert (=> start!67020 (array_inv!7525 a1!948)))

(assert (=> start!67020 (array_inv!7525 a2!948)))

(declare-fun b!300316 () Bool)

(assert (=> b!300316 (= e!215646 e!215651)))

(declare-fun res!247598 () Bool)

(assert (=> b!300316 (=> (not res!247598) (not e!215651))))

(assert (=> b!300316 (= res!247598 (and (bvsle toBit!258 lt!435907) (bvsle fromBit!258 lt!435907)))))

(assert (=> b!300316 (= lt!435907 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7913 a1!948))))))

(declare-fun b!300317 () Bool)

(assert (=> b!300317 (= e!215649 e!215645)))

(declare-fun res!247595 () Bool)

(assert (=> b!300317 (= res!247595 call!5372)))

(assert (=> b!300317 (=> (not res!247595) (not e!215645))))

(declare-fun b!300318 () Bool)

(assert (=> b!300318 (= e!215647 (byteRangesEq!0 (select (arr!8996 a1!948) (_4!517 lt!435916)) (select (arr!8996 a2!948) (_4!517 lt!435916)) #b00000000000000000000000000000000 lt!435912))))

(declare-fun b!300319 () Bool)

(declare-fun lt!435908 () Unit!21006)

(assert (=> b!300319 (= e!215655 lt!435908)))

(declare-fun arrayRangesEqSlicedLemma!185 (array!18220 array!18220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21006)

(assert (=> b!300319 (= lt!435908 (arrayRangesEqSlicedLemma!185 a1!948 a2!948 (_1!13172 lt!435916) (_2!13172 lt!435916) (_1!13172 lt!435906) (_2!13172 lt!435906)))))

(declare-fun arrayRangesEq!1575 (array!18220 array!18220 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300319 (arrayRangesEq!1575 a1!948 a2!948 (_1!13172 lt!435906) (_2!13172 lt!435906))))

(declare-fun b!300320 () Bool)

(declare-fun res!247601 () Bool)

(assert (=> b!300320 (=> (not res!247601) (not e!215651))))

(declare-fun arrayBitRangesEq!0 (array!18220 array!18220 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300320 (= res!247601 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300321 () Bool)

(declare-fun Unit!21010 () Unit!21006)

(assert (=> b!300321 (= e!215648 Unit!21010)))

(assert (= (and start!67020 res!247597) b!300316))

(assert (= (and b!300316 res!247598) b!300320))

(assert (= (and b!300320 res!247601) b!300310))

(assert (= (and b!300310 res!247599) b!300309))

(assert (= (and b!300309 c!13939) b!300319))

(assert (= (and b!300309 (not c!13939)) b!300311))

(assert (= (and b!300309 c!13941) b!300313))

(assert (= (and b!300309 (not c!13941)) b!300317))

(assert (= (and b!300317 res!247595) b!300312))

(assert (= (and b!300312 (not res!247600)) b!300318))

(assert (= (or b!300313 b!300317) bm!5369))

(assert (= (and b!300309 res!247596) b!300315))

(assert (= (and b!300315 c!13938) b!300308))

(assert (= (and b!300315 (not c!13938)) b!300314))

(assert (= (and b!300315 c!13940) b!300307))

(assert (= (and b!300315 (not c!13940)) b!300321))

(declare-fun m!439293 () Bool)

(assert (=> bm!5369 m!439293))

(declare-fun m!439295 () Bool)

(assert (=> bm!5369 m!439295))

(assert (=> bm!5369 m!439293))

(assert (=> bm!5369 m!439295))

(declare-fun m!439297 () Bool)

(assert (=> bm!5369 m!439297))

(declare-fun m!439299 () Bool)

(assert (=> b!300318 m!439299))

(declare-fun m!439301 () Bool)

(assert (=> b!300318 m!439301))

(assert (=> b!300318 m!439299))

(assert (=> b!300318 m!439301))

(declare-fun m!439303 () Bool)

(assert (=> b!300318 m!439303))

(declare-fun m!439305 () Bool)

(assert (=> start!67020 m!439305))

(declare-fun m!439307 () Bool)

(assert (=> start!67020 m!439307))

(declare-fun m!439309 () Bool)

(assert (=> b!300320 m!439309))

(declare-fun m!439311 () Bool)

(assert (=> b!300319 m!439311))

(declare-fun m!439313 () Bool)

(assert (=> b!300319 m!439313))

(declare-fun m!439315 () Bool)

(assert (=> b!300309 m!439315))

(declare-fun m!439317 () Bool)

(assert (=> b!300309 m!439317))

(declare-fun m!439319 () Bool)

(assert (=> b!300308 m!439319))

(declare-fun m!439321 () Bool)

(assert (=> b!300308 m!439321))

(declare-fun m!439323 () Bool)

(assert (=> b!300308 m!439323))

(declare-fun m!439325 () Bool)

(assert (=> b!300307 m!439325))

(declare-fun m!439327 () Bool)

(assert (=> b!300307 m!439327))

(declare-fun m!439329 () Bool)

(assert (=> b!300307 m!439329))

(check-sat (not b!300320) (not b!300318) (not b!300319) (not b!300309) (not bm!5369) (not b!300308) (not start!67020) (not b!300307))
(check-sat)
(get-model)

(declare-fun d!100666 () Bool)

(declare-fun res!247634 () Bool)

(declare-fun e!215703 () Bool)

(assert (=> d!100666 (=> res!247634 e!215703)))

(assert (=> d!100666 (= res!247634 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100666 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!215703)))

(declare-fun lt!435965 () (_ BitVec 32))

(declare-fun bm!5375 () Bool)

(declare-fun c!13956 () Bool)

(declare-fun lt!435964 () (_ BitVec 32))

(declare-fun call!5378 () Bool)

(declare-fun lt!435966 () tuple4!1034)

(assert (=> bm!5375 (= call!5378 (byteRangesEq!0 (select (arr!8996 a1!948) (_3!1474 lt!435966)) (select (arr!8996 a2!948) (_3!1474 lt!435966)) lt!435964 (ite c!13956 lt!435965 #b00000000000000000000000000001000)))))

(declare-fun b!300381 () Bool)

(declare-fun e!215705 () Bool)

(assert (=> b!300381 (= e!215705 call!5378)))

(declare-fun e!215702 () Bool)

(declare-fun b!300382 () Bool)

(assert (=> b!300382 (= e!215702 (arrayRangesEq!1575 a1!948 a2!948 (_1!13172 lt!435966) (_2!13172 lt!435966)))))

(declare-fun b!300383 () Bool)

(declare-fun e!215706 () Bool)

(assert (=> b!300383 (= e!215703 e!215706)))

(declare-fun res!247633 () Bool)

(assert (=> b!300383 (=> (not res!247633) (not e!215706))))

(assert (=> b!300383 (= res!247633 e!215702)))

(declare-fun res!247637 () Bool)

(assert (=> b!300383 (=> res!247637 e!215702)))

(assert (=> b!300383 (= res!247637 (bvsge (_1!13172 lt!435966) (_2!13172 lt!435966)))))

(assert (=> b!300383 (= lt!435965 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300383 (= lt!435964 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300383 (= lt!435966 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300384 () Bool)

(assert (=> b!300384 (= e!215706 e!215705)))

(assert (=> b!300384 (= c!13956 (= (_3!1474 lt!435966) (_4!517 lt!435966)))))

(declare-fun b!300385 () Bool)

(declare-fun e!215701 () Bool)

(assert (=> b!300385 (= e!215705 e!215701)))

(declare-fun res!247636 () Bool)

(assert (=> b!300385 (= res!247636 call!5378)))

(assert (=> b!300385 (=> (not res!247636) (not e!215701))))

(declare-fun b!300386 () Bool)

(declare-fun res!247635 () Bool)

(assert (=> b!300386 (= res!247635 (= lt!435965 #b00000000000000000000000000000000))))

(declare-fun e!215704 () Bool)

(assert (=> b!300386 (=> res!247635 e!215704)))

(assert (=> b!300386 (= e!215701 e!215704)))

(declare-fun b!300387 () Bool)

(assert (=> b!300387 (= e!215704 (byteRangesEq!0 (select (arr!8996 a1!948) (_4!517 lt!435966)) (select (arr!8996 a2!948) (_4!517 lt!435966)) #b00000000000000000000000000000000 lt!435965))))

(assert (= (and d!100666 (not res!247634)) b!300383))

(assert (= (and b!300383 (not res!247637)) b!300382))

(assert (= (and b!300383 res!247633) b!300384))

(assert (= (and b!300384 c!13956) b!300381))

(assert (= (and b!300384 (not c!13956)) b!300385))

(assert (= (and b!300385 res!247636) b!300386))

(assert (= (and b!300386 (not res!247635)) b!300387))

(assert (= (or b!300381 b!300385) bm!5375))

(declare-fun m!439369 () Bool)

(assert (=> bm!5375 m!439369))

(declare-fun m!439371 () Bool)

(assert (=> bm!5375 m!439371))

(assert (=> bm!5375 m!439369))

(assert (=> bm!5375 m!439371))

(declare-fun m!439373 () Bool)

(assert (=> bm!5375 m!439373))

(declare-fun m!439375 () Bool)

(assert (=> b!300382 m!439375))

(assert (=> b!300383 m!439317))

(declare-fun m!439377 () Bool)

(assert (=> b!300387 m!439377))

(declare-fun m!439379 () Bool)

(assert (=> b!300387 m!439379))

(assert (=> b!300387 m!439377))

(assert (=> b!300387 m!439379))

(declare-fun m!439381 () Bool)

(assert (=> b!300387 m!439381))

(assert (=> b!300320 d!100666))

(declare-fun d!100668 () Bool)

(assert (=> d!100668 (= (array_inv!7525 a1!948) (bvsge (size!7913 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67020 d!100668))

(declare-fun d!100670 () Bool)

(assert (=> d!100670 (= (array_inv!7525 a2!948) (bvsge (size!7913 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67020 d!100670))

(declare-fun d!100672 () Bool)

(assert (=> d!100672 (arrayRangesEq!1575 a1!948 a2!948 (_1!13172 lt!435906) (_2!13172 lt!435906))))

(declare-fun lt!435969 () Unit!21006)

(declare-fun choose!521 (array!18220 array!18220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21006)

(assert (=> d!100672 (= lt!435969 (choose!521 a1!948 a2!948 (_1!13172 lt!435916) (_2!13172 lt!435916) (_1!13172 lt!435906) (_2!13172 lt!435906)))))

(assert (=> d!100672 (and (bvsle #b00000000000000000000000000000000 (_1!13172 lt!435916)) (bvsle (_1!13172 lt!435916) (_2!13172 lt!435916)))))

(assert (=> d!100672 (= (arrayRangesEqSlicedLemma!185 a1!948 a2!948 (_1!13172 lt!435916) (_2!13172 lt!435916) (_1!13172 lt!435906) (_2!13172 lt!435906)) lt!435969)))

(declare-fun bs!25950 () Bool)

(assert (= bs!25950 d!100672))

(assert (=> bs!25950 m!439313))

(declare-fun m!439383 () Bool)

(assert (=> bs!25950 m!439383))

(assert (=> b!300319 d!100672))

(declare-fun d!100674 () Bool)

(declare-fun res!247642 () Bool)

(declare-fun e!215711 () Bool)

(assert (=> d!100674 (=> res!247642 e!215711)))

(assert (=> d!100674 (= res!247642 (= (_1!13172 lt!435906) (_2!13172 lt!435906)))))

(assert (=> d!100674 (= (arrayRangesEq!1575 a1!948 a2!948 (_1!13172 lt!435906) (_2!13172 lt!435906)) e!215711)))

(declare-fun b!300392 () Bool)

(declare-fun e!215712 () Bool)

(assert (=> b!300392 (= e!215711 e!215712)))

(declare-fun res!247643 () Bool)

(assert (=> b!300392 (=> (not res!247643) (not e!215712))))

(assert (=> b!300392 (= res!247643 (= (select (arr!8996 a1!948) (_1!13172 lt!435906)) (select (arr!8996 a2!948) (_1!13172 lt!435906))))))

(declare-fun b!300393 () Bool)

(assert (=> b!300393 (= e!215712 (arrayRangesEq!1575 a1!948 a2!948 (bvadd (_1!13172 lt!435906) #b00000000000000000000000000000001) (_2!13172 lt!435906)))))

(assert (= (and d!100674 (not res!247642)) b!300392))

(assert (= (and b!300392 res!247643) b!300393))

(declare-fun m!439385 () Bool)

(assert (=> b!300392 m!439385))

(declare-fun m!439387 () Bool)

(assert (=> b!300392 m!439387))

(declare-fun m!439389 () Bool)

(assert (=> b!300393 m!439389))

(assert (=> b!300319 d!100674))

(declare-fun d!100676 () Bool)

(assert (=> d!100676 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1035 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!300309 d!100676))

(declare-fun d!100678 () Bool)

(assert (=> d!100678 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1035 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!300309 d!100678))

(declare-fun d!100680 () Bool)

(assert (=> d!100680 (= (byteRangesEq!0 (select (arr!8996 a1!948) (_4!517 lt!435916)) (select (arr!8996 a2!948) (_4!517 lt!435916)) #b00000000000000000000000000000000 lt!435912) (or (= #b00000000000000000000000000000000 lt!435912) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8996 a1!948) (_4!517 lt!435916))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!435912))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8996 a2!948) (_4!517 lt!435916))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!435912))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25951 () Bool)

(assert (= bs!25951 d!100680))

(declare-fun m!439391 () Bool)

(assert (=> bs!25951 m!439391))

(declare-fun m!439393 () Bool)

(assert (=> bs!25951 m!439393))

(assert (=> b!300318 d!100680))

(declare-fun d!100682 () Bool)

(assert (=> d!100682 (and (bvsge (_3!1474 lt!435906) #b00000000000000000000000000000000) (bvslt (_3!1474 lt!435906) (size!7913 a1!948)) (bvslt (_3!1474 lt!435906) (size!7913 a2!948)) (= (select (arr!8996 a1!948) (_3!1474 lt!435906)) (select (arr!8996 a2!948) (_3!1474 lt!435906))))))

(declare-fun lt!435972 () Unit!21006)

(declare-fun choose!522 (array!18220 array!18220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21006)

(assert (=> d!100682 (= lt!435972 (choose!522 a1!948 a2!948 (_1!13172 lt!435916) (_3!1474 lt!435906) (_2!13172 lt!435916)))))

(assert (=> d!100682 (and (bvsle #b00000000000000000000000000000000 (_1!13172 lt!435916)) (bvsle (_1!13172 lt!435916) (_2!13172 lt!435916)))))

(assert (=> d!100682 (= (arrayRangesEqImpliesEq!230 a1!948 a2!948 (_1!13172 lt!435916) (_3!1474 lt!435906) (_2!13172 lt!435916)) lt!435972)))

(declare-fun bs!25952 () Bool)

(assert (= bs!25952 d!100682))

(assert (=> bs!25952 m!439321))

(assert (=> bs!25952 m!439323))

(declare-fun m!439395 () Bool)

(assert (=> bs!25952 m!439395))

(assert (=> b!300308 d!100682))

(declare-fun d!100684 () Bool)

(assert (=> d!100684 (= (byteRangesEq!0 (select (arr!8996 a1!948) (_3!1474 lt!435916)) (select (arr!8996 a2!948) (_3!1474 lt!435916)) lt!435915 (ite c!13941 lt!435912 #b00000000000000000000000000000111)) (or (= lt!435915 (ite c!13941 lt!435912 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8996 a1!948) (_3!1474 lt!435916))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!13941 lt!435912 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!435915)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8996 a2!948) (_3!1474 lt!435916))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!13941 lt!435912 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!435915)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25953 () Bool)

(assert (= bs!25953 d!100684))

(declare-fun m!439397 () Bool)

(assert (=> bs!25953 m!439397))

(declare-fun m!439399 () Bool)

(assert (=> bs!25953 m!439399))

(assert (=> bm!5369 d!100684))

(declare-fun d!100686 () Bool)

(assert (=> d!100686 (and (bvsge (_4!517 lt!435906) #b00000000000000000000000000000000) (bvslt (_4!517 lt!435906) (size!7913 a1!948)) (bvslt (_4!517 lt!435906) (size!7913 a2!948)) (= (select (arr!8996 a1!948) (_4!517 lt!435906)) (select (arr!8996 a2!948) (_4!517 lt!435906))))))

(declare-fun lt!435973 () Unit!21006)

(assert (=> d!100686 (= lt!435973 (choose!522 a1!948 a2!948 (_1!13172 lt!435916) (_4!517 lt!435906) (_2!13172 lt!435916)))))

(assert (=> d!100686 (and (bvsle #b00000000000000000000000000000000 (_1!13172 lt!435916)) (bvsle (_1!13172 lt!435916) (_2!13172 lt!435916)))))

(assert (=> d!100686 (= (arrayRangesEqImpliesEq!230 a1!948 a2!948 (_1!13172 lt!435916) (_4!517 lt!435906) (_2!13172 lt!435916)) lt!435973)))

(declare-fun bs!25954 () Bool)

(assert (= bs!25954 d!100686))

(assert (=> bs!25954 m!439327))

(assert (=> bs!25954 m!439329))

(declare-fun m!439401 () Bool)

(assert (=> bs!25954 m!439401))

(assert (=> b!300307 d!100686))

(check-sat (not d!100682) (not d!100672) (not b!300387) (not d!100686) (not bm!5375) (not b!300383) (not b!300382) (not b!300393))
(check-sat)

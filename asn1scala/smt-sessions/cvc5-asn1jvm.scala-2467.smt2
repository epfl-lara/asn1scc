; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62670 () Bool)

(assert start!62670)

(declare-fun b!280691 () Bool)

(declare-fun e!200297 () Bool)

(declare-datatypes ((tuple4!762 0))(
  ( (tuple4!763 (_1!12456 (_ BitVec 32)) (_2!12456 (_ BitVec 32)) (_3!1161 (_ BitVec 32)) (_4!381 (_ BitVec 32))) )
))
(declare-fun lt!416972 () tuple4!762)

(declare-datatypes ((array!16210 0))(
  ( (array!16211 (arr!8002 (Array (_ BitVec 32) (_ BitVec 8))) (size!7006 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16210)

(assert (=> b!280691 (= e!200297 (not (and (bvsge (_3!1161 lt!416972) #b00000000000000000000000000000000) (bvslt (_3!1161 lt!416972) (size!7006 a1!699)))))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun a2!699 () array!16210)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280691 (byteRangesEq!0 (select (arr!8002 a1!699) (_3!1161 lt!416972)) (select (arr!8002 a2!699) (_3!1161 lt!416972)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000)))

(declare-fun b!280692 () Bool)

(declare-datatypes ((Unit!19689 0))(
  ( (Unit!19690) )
))
(declare-fun e!200298 () Unit!19689)

(declare-fun Unit!19691 () Unit!19689)

(assert (=> b!280692 (= e!200298 Unit!19691)))

(declare-fun arrayRangesEq!1274 (array!16210 array!16210 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280692 (arrayRangesEq!1274 a1!699 a2!699 (_1!12456 lt!416972) (_2!12456 lt!416972))))

(declare-fun lt!416971 () Unit!19689)

(declare-fun arrayRangesEqSymmetricLemma!181 (array!16210 array!16210 (_ BitVec 32) (_ BitVec 32)) Unit!19689)

(assert (=> b!280692 (= lt!416971 (arrayRangesEqSymmetricLemma!181 a1!699 a2!699 (_1!12456 lt!416972) (_2!12456 lt!416972)))))

(assert (=> b!280692 (arrayRangesEq!1274 a2!699 a1!699 (_1!12456 lt!416972) (_2!12456 lt!416972))))

(declare-fun b!280693 () Bool)

(declare-fun res!232954 () Bool)

(declare-fun e!200301 () Bool)

(assert (=> b!280693 (=> (not res!232954) (not e!200301))))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!280693 (= res!232954 (bvslt from!822 to!789))))

(declare-fun b!280694 () Bool)

(declare-fun Unit!19692 () Unit!19689)

(assert (=> b!280694 (= e!200298 Unit!19692)))

(declare-fun b!280695 () Bool)

(declare-fun res!232952 () Bool)

(assert (=> b!280695 (=> (not res!232952) (not e!200301))))

(declare-fun arrayBitRangesEq!0 (array!16210 array!16210 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280695 (= res!232952 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280696 () Bool)

(assert (=> b!280696 (= e!200301 e!200297)))

(declare-fun res!232953 () Bool)

(assert (=> b!280696 (=> (not res!232953) (not e!200297))))

(assert (=> b!280696 (= res!232953 (not (= (_3!1161 lt!416972) (_4!381 lt!416972))))))

(declare-fun lt!416973 () Unit!19689)

(assert (=> b!280696 (= lt!416973 e!200298)))

(declare-fun c!13041 () Bool)

(assert (=> b!280696 (= c!13041 (bvslt (_1!12456 lt!416972) (_2!12456 lt!416972)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!762)

(assert (=> b!280696 (= lt!416972 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!232955 () Bool)

(assert (=> start!62670 (=> (not res!232955) (not e!200301))))

(assert (=> start!62670 (= res!232955 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7006 a1!699) (size!7006 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7006 a1!699))))))))

(assert (=> start!62670 e!200301))

(assert (=> start!62670 true))

(declare-fun array_inv!6730 (array!16210) Bool)

(assert (=> start!62670 (array_inv!6730 a1!699)))

(assert (=> start!62670 (array_inv!6730 a2!699)))

(assert (= (and start!62670 res!232955) b!280695))

(assert (= (and b!280695 res!232952) b!280693))

(assert (= (and b!280693 res!232954) b!280696))

(assert (= (and b!280696 c!13041) b!280692))

(assert (= (and b!280696 (not c!13041)) b!280694))

(assert (= (and b!280696 res!232953) b!280691))

(declare-fun m!413703 () Bool)

(assert (=> b!280695 m!413703))

(declare-fun m!413705 () Bool)

(assert (=> b!280691 m!413705))

(declare-fun m!413707 () Bool)

(assert (=> b!280691 m!413707))

(assert (=> b!280691 m!413705))

(assert (=> b!280691 m!413707))

(declare-fun m!413709 () Bool)

(assert (=> b!280691 m!413709))

(declare-fun m!413711 () Bool)

(assert (=> b!280696 m!413711))

(declare-fun m!413713 () Bool)

(assert (=> start!62670 m!413713))

(declare-fun m!413715 () Bool)

(assert (=> start!62670 m!413715))

(declare-fun m!413717 () Bool)

(assert (=> b!280692 m!413717))

(declare-fun m!413719 () Bool)

(assert (=> b!280692 m!413719))

(declare-fun m!413721 () Bool)

(assert (=> b!280692 m!413721))

(push 1)

(assert (not start!62670))

(assert (not b!280696))

(assert (not b!280691))

(assert (not b!280692))

(assert (not b!280695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96560 () Bool)

(declare-fun res!233014 () Bool)

(declare-fun e!200372 () Bool)

(assert (=> d!96560 (=> res!233014 e!200372)))

(assert (=> d!96560 (= res!233014 (bvsge from!822 to!789))))

(assert (=> d!96560 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200372)))

(declare-fun b!280776 () Bool)

(declare-fun e!200375 () Bool)

(assert (=> b!280776 (= e!200372 e!200375)))

(declare-fun res!233015 () Bool)

(assert (=> b!280776 (=> (not res!233015) (not e!200375))))

(declare-fun e!200370 () Bool)

(assert (=> b!280776 (= res!233015 e!200370)))

(declare-fun res!233016 () Bool)

(assert (=> b!280776 (=> res!233016 e!200370)))

(declare-fun lt!417012 () tuple4!762)

(assert (=> b!280776 (= res!233016 (bvsge (_1!12456 lt!417012) (_2!12456 lt!417012)))))

(declare-fun lt!417011 () (_ BitVec 32))

(assert (=> b!280776 (= lt!417011 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417010 () (_ BitVec 32))

(assert (=> b!280776 (= lt!417010 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280776 (= lt!417012 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280777 () Bool)

(declare-fun e!200374 () Bool)

(assert (=> b!280777 (= e!200375 e!200374)))

(declare-fun c!13053 () Bool)

(assert (=> b!280777 (= c!13053 (= (_3!1161 lt!417012) (_4!381 lt!417012)))))

(declare-fun b!280778 () Bool)

(declare-fun e!200373 () Bool)

(declare-fun call!4652 () Bool)

(assert (=> b!280778 (= e!200373 call!4652)))

(declare-fun b!280779 () Bool)

(assert (=> b!280779 (= e!200374 call!4652)))

(declare-fun b!280780 () Bool)

(declare-fun res!233013 () Bool)

(assert (=> b!280780 (= res!233013 (= lt!417011 #b00000000000000000000000000000000))))

(assert (=> b!280780 (=> res!233013 e!200373)))

(declare-fun e!200371 () Bool)

(assert (=> b!280780 (= e!200371 e!200373)))

(declare-fun b!280781 () Bool)

(assert (=> b!280781 (= e!200374 e!200371)))

(declare-fun res!233017 () Bool)

(assert (=> b!280781 (= res!233017 (byteRangesEq!0 (select (arr!8002 a1!699) (_3!1161 lt!417012)) (select (arr!8002 a2!699) (_3!1161 lt!417012)) lt!417010 #b00000000000000000000000000001000))))

(assert (=> b!280781 (=> (not res!233017) (not e!200371))))

(declare-fun b!280782 () Bool)

(assert (=> b!280782 (= e!200370 (arrayRangesEq!1274 a1!699 a2!699 (_1!12456 lt!417012) (_2!12456 lt!417012)))))

(declare-fun bm!4649 () Bool)

(assert (=> bm!4649 (= call!4652 (byteRangesEq!0 (ite c!13053 (select (arr!8002 a1!699) (_3!1161 lt!417012)) (select (arr!8002 a1!699) (_4!381 lt!417012))) (ite c!13053 (select (arr!8002 a2!699) (_3!1161 lt!417012)) (select (arr!8002 a2!699) (_4!381 lt!417012))) (ite c!13053 lt!417010 #b00000000000000000000000000000000) lt!417011))))

(assert (= (and d!96560 (not res!233014)) b!280776))

(assert (= (and b!280776 (not res!233016)) b!280782))

(assert (= (and b!280776 res!233015) b!280777))

(assert (= (and b!280777 c!13053) b!280779))

(assert (= (and b!280777 (not c!13053)) b!280781))

(assert (= (and b!280781 res!233017) b!280780))

(assert (= (and b!280780 (not res!233013)) b!280778))

(assert (= (or b!280779 b!280778) bm!4649))

(assert (=> b!280776 m!413711))

(declare-fun m!413791 () Bool)

(assert (=> b!280781 m!413791))

(declare-fun m!413793 () Bool)

(assert (=> b!280781 m!413793))

(assert (=> b!280781 m!413791))

(assert (=> b!280781 m!413793))

(declare-fun m!413795 () Bool)

(assert (=> b!280781 m!413795))

(declare-fun m!413797 () Bool)

(assert (=> b!280782 m!413797))

(declare-fun m!413799 () Bool)

(assert (=> bm!4649 m!413799))

(assert (=> bm!4649 m!413791))

(declare-fun m!413801 () Bool)

(assert (=> bm!4649 m!413801))

(declare-fun m!413803 () Bool)

(assert (=> bm!4649 m!413803))

(assert (=> bm!4649 m!413793))

(assert (=> b!280695 d!96560))

(declare-fun d!96564 () Bool)

(assert (=> d!96564 (= (arrayBitIndices!0 from!822 to!789) (tuple4!763 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280696 d!96564))

(declare-fun d!96568 () Bool)

(assert (=> d!96568 (= (byteRangesEq!0 (select (arr!8002 a1!699) (_3!1161 lt!416972)) (select (arr!8002 a2!699) (_3!1161 lt!416972)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8002 a1!699) (_3!1161 lt!416972))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8002 a2!699) (_3!1161 lt!416972))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24335 () Bool)

(assert (= bs!24335 d!96568))

(declare-fun m!413815 () Bool)

(assert (=> bs!24335 m!413815))

(declare-fun m!413817 () Bool)

(assert (=> bs!24335 m!413817))

(assert (=> b!280691 d!96568))

(declare-fun d!96574 () Bool)

(declare-fun res!233030 () Bool)

(declare-fun e!200388 () Bool)

(assert (=> d!96574 (=> res!233030 e!200388)))

(assert (=> d!96574 (= res!233030 (= (_1!12456 lt!416972) (_2!12456 lt!416972)))))

(assert (=> d!96574 (= (arrayRangesEq!1274 a1!699 a2!699 (_1!12456 lt!416972) (_2!12456 lt!416972)) e!200388)))

(declare-fun b!280795 () Bool)

(declare-fun e!200389 () Bool)

(assert (=> b!280795 (= e!200388 e!200389)))

(declare-fun res!233031 () Bool)

(assert (=> b!280795 (=> (not res!233031) (not e!200389))))

(assert (=> b!280795 (= res!233031 (= (select (arr!8002 a1!699) (_1!12456 lt!416972)) (select (arr!8002 a2!699) (_1!12456 lt!416972))))))

(declare-fun b!280796 () Bool)

(assert (=> b!280796 (= e!200389 (arrayRangesEq!1274 a1!699 a2!699 (bvadd (_1!12456 lt!416972) #b00000000000000000000000000000001) (_2!12456 lt!416972)))))

(assert (= (and d!96574 (not res!233030)) b!280795))

(assert (= (and b!280795 res!233031) b!280796))

(declare-fun m!413823 () Bool)

(assert (=> b!280795 m!413823))

(declare-fun m!413825 () Bool)

(assert (=> b!280795 m!413825))

(declare-fun m!413827 () Bool)

(assert (=> b!280796 m!413827))

(assert (=> b!280692 d!96574))

(declare-fun d!96582 () Bool)

(assert (=> d!96582 (arrayRangesEq!1274 a2!699 a1!699 (_1!12456 lt!416972) (_2!12456 lt!416972))))

(declare-fun lt!417018 () Unit!19689)

(declare-fun choose!489 (array!16210 array!16210 (_ BitVec 32) (_ BitVec 32)) Unit!19689)

(assert (=> d!96582 (= lt!417018 (choose!489 a1!699 a2!699 (_1!12456 lt!416972) (_2!12456 lt!416972)))))

(assert (=> d!96582 (and (bvsle #b00000000000000000000000000000000 (_1!12456 lt!416972)) (bvsle (_1!12456 lt!416972) (_2!12456 lt!416972)) (bvsle (_2!12456 lt!416972) (size!7006 a1!699)))))

(assert (=> d!96582 (= (arrayRangesEqSymmetricLemma!181 a1!699 a2!699 (_1!12456 lt!416972) (_2!12456 lt!416972)) lt!417018)))

(declare-fun bs!24337 () Bool)

(assert (= bs!24337 d!96582))

(assert (=> bs!24337 m!413721))

(declare-fun m!413829 () Bool)

(assert (=> bs!24337 m!413829))

(assert (=> b!280692 d!96582))

(declare-fun d!96584 () Bool)

(declare-fun res!233032 () Bool)

(declare-fun e!200390 () Bool)

(assert (=> d!96584 (=> res!233032 e!200390)))

(assert (=> d!96584 (= res!233032 (= (_1!12456 lt!416972) (_2!12456 lt!416972)))))

(assert (=> d!96584 (= (arrayRangesEq!1274 a2!699 a1!699 (_1!12456 lt!416972) (_2!12456 lt!416972)) e!200390)))

(declare-fun b!280797 () Bool)

(declare-fun e!200391 () Bool)

(assert (=> b!280797 (= e!200390 e!200391)))

(declare-fun res!233033 () Bool)

(assert (=> b!280797 (=> (not res!233033) (not e!200391))))

(assert (=> b!280797 (= res!233033 (= (select (arr!8002 a2!699) (_1!12456 lt!416972)) (select (arr!8002 a1!699) (_1!12456 lt!416972))))))

(declare-fun b!280798 () Bool)

(assert (=> b!280798 (= e!200391 (arrayRangesEq!1274 a2!699 a1!699 (bvadd (_1!12456 lt!416972) #b00000000000000000000000000000001) (_2!12456 lt!416972)))))

(assert (= (and d!96584 (not res!233032)) b!280797))

(assert (= (and b!280797 res!233033) b!280798))

(assert (=> b!280797 m!413825))

(assert (=> b!280797 m!413823))

(declare-fun m!413831 () Bool)

(assert (=> b!280798 m!413831))

(assert (=> b!280692 d!96584))

(declare-fun d!96586 () Bool)

(assert (=> d!96586 (= (array_inv!6730 a1!699) (bvsge (size!7006 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62670 d!96586))

(declare-fun d!96588 () Bool)

(assert (=> d!96588 (= (array_inv!6730 a2!699) (bvsge (size!7006 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62670 d!96588))

(push 1)

(assert (not b!280798))

(assert (not b!280781))

(assert (not d!96582))

(assert (not b!280776))

(assert (not bm!4649))

(assert (not b!280796))

(assert (not b!280782))

(check-sat)

(pop 1)

(push 1)

(check-sat)


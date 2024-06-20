; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68224 () Bool)

(assert start!68224)

(declare-fun b!306350 () Bool)

(declare-fun res!251605 () Bool)

(declare-fun e!220700 () Bool)

(assert (=> b!306350 (=> (not res!251605) (not e!220700))))

(declare-fun lt!439569 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!306350 (= res!251605 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439569) (not (= fromSlice!52 toSlice!52))))))

(declare-datatypes ((tuple4!1246 0))(
  ( (tuple4!1247 (_1!13278 (_ BitVec 32)) (_2!13278 (_ BitVec 32)) (_3!1580 (_ BitVec 32)) (_4!623 (_ BitVec 32))) )
))
(declare-fun lt!439571 () tuple4!1246)

(declare-datatypes ((array!18579 0))(
  ( (array!18580 (arr!9135 (Array (_ BitVec 32) (_ BitVec 8))) (size!8052 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18579)

(declare-fun a2!948 () array!18579)

(declare-fun e!220704 () Bool)

(declare-fun b!306351 () Bool)

(declare-fun lt!439572 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306351 (= e!220704 (byteRangesEq!0 (select (arr!9135 a1!948) (_4!623 lt!439571)) (select (arr!9135 a2!948) (_4!623 lt!439571)) #b00000000000000000000000000000000 lt!439572))))

(declare-fun bm!5828 () Bool)

(declare-fun c!14957 () Bool)

(declare-fun lt!439568 () (_ BitVec 32))

(declare-fun call!5831 () Bool)

(assert (=> bm!5828 (= call!5831 (byteRangesEq!0 (select (arr!9135 a1!948) (_3!1580 lt!439571)) (select (arr!9135 a2!948) (_3!1580 lt!439571)) lt!439568 (ite c!14957 lt!439572 #b00000000000000000000000000000111)))))

(declare-fun b!306353 () Bool)

(declare-fun e!220701 () Bool)

(assert (=> b!306353 (= e!220700 e!220701)))

(declare-fun res!251604 () Bool)

(assert (=> b!306353 (=> (not res!251604) (not e!220701))))

(declare-fun e!220705 () Bool)

(assert (=> b!306353 (= res!251604 e!220705)))

(assert (=> b!306353 (= c!14957 (= (_3!1580 lt!439571) (_4!623 lt!439571)))))

(declare-datatypes ((Unit!21374 0))(
  ( (Unit!21375) )
))
(declare-fun lt!439577 () Unit!21374)

(declare-fun e!220707 () Unit!21374)

(assert (=> b!306353 (= lt!439577 e!220707)))

(declare-fun c!14955 () Bool)

(declare-fun lt!439578 () tuple4!1246)

(assert (=> b!306353 (= c!14955 (bvslt (_1!13278 lt!439578) (_2!13278 lt!439578)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1246)

(assert (=> b!306353 (= lt!439578 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306353 (= lt!439572 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306353 (= lt!439568 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306353 (= lt!439571 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306354 () Bool)

(declare-fun Unit!21376 () Unit!21374)

(assert (=> b!306354 (= e!220707 Unit!21376)))

(declare-fun b!306355 () Bool)

(declare-fun res!251607 () Bool)

(assert (=> b!306355 (=> (not res!251607) (not e!220700))))

(declare-fun arrayBitRangesEq!0 (array!18579 array!18579 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306355 (= res!251607 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306356 () Bool)

(declare-fun res!251610 () Bool)

(assert (=> b!306356 (= res!251610 (= lt!439572 #b00000000000000000000000000000000))))

(assert (=> b!306356 (=> res!251610 e!220704)))

(declare-fun e!220708 () Bool)

(assert (=> b!306356 (= e!220708 e!220704)))

(declare-fun b!306357 () Bool)

(declare-fun e!220698 () Unit!21374)

(declare-fun Unit!21377 () Unit!21374)

(assert (=> b!306357 (= e!220698 Unit!21377)))

(declare-fun b!306358 () Bool)

(assert (=> b!306358 (= e!220705 call!5831)))

(declare-fun b!306359 () Bool)

(declare-fun e!220706 () Unit!21374)

(declare-fun lt!439573 () Unit!21374)

(assert (=> b!306359 (= e!220706 lt!439573)))

(declare-fun arrayRangesEqImpliesEq!285 (array!18579 array!18579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21374)

(assert (=> b!306359 (= lt!439573 (arrayRangesEqImpliesEq!285 a1!948 a2!948 (_1!13278 lt!439571) (_3!1580 lt!439578) (_2!13278 lt!439571)))))

(assert (=> b!306359 (= (select (arr!9135 a1!948) (_3!1580 lt!439578)) (select (arr!9135 a2!948) (_3!1580 lt!439578)))))

(declare-fun b!306360 () Bool)

(declare-fun lt!439576 () Unit!21374)

(assert (=> b!306360 (= e!220707 lt!439576)))

(declare-fun arrayRangesEqSlicedLemma!276 (array!18579 array!18579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21374)

(assert (=> b!306360 (= lt!439576 (arrayRangesEqSlicedLemma!276 a1!948 a2!948 (_1!13278 lt!439571) (_2!13278 lt!439571) (_1!13278 lt!439578) (_2!13278 lt!439578)))))

(declare-fun arrayRangesEq!1681 (array!18579 array!18579 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306360 (arrayRangesEq!1681 a1!948 a2!948 (_1!13278 lt!439578) (_2!13278 lt!439578))))

(declare-fun b!306352 () Bool)

(assert (=> b!306352 (= e!220705 e!220708)))

(declare-fun res!251609 () Bool)

(assert (=> b!306352 (= res!251609 call!5831)))

(assert (=> b!306352 (=> (not res!251609) (not e!220708))))

(declare-fun res!251606 () Bool)

(declare-fun e!220702 () Bool)

(assert (=> start!68224 (=> (not res!251606) (not e!220702))))

(assert (=> start!68224 (= res!251606 (and (bvsle (size!8052 a1!948) (size!8052 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68224 e!220702))

(assert (=> start!68224 true))

(declare-fun array_inv!7664 (array!18579) Bool)

(assert (=> start!68224 (array_inv!7664 a1!948)))

(assert (=> start!68224 (array_inv!7664 a2!948)))

(declare-fun b!306361 () Bool)

(assert (=> b!306361 (= e!220702 e!220700)))

(declare-fun res!251608 () Bool)

(assert (=> b!306361 (=> (not res!251608) (not e!220700))))

(assert (=> b!306361 (= res!251608 (and (bvsle toBit!258 lt!439569) (bvsle fromBit!258 lt!439569)))))

(assert (=> b!306361 (= lt!439569 (bvmul ((_ sign_extend 32) (size!8052 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!306362 () Bool)

(declare-fun lt!439570 () Unit!21374)

(assert (=> b!306362 (= e!220698 lt!439570)))

(assert (=> b!306362 (= lt!439570 (arrayRangesEqImpliesEq!285 a1!948 a2!948 (_1!13278 lt!439571) (_4!623 lt!439578) (_2!13278 lt!439571)))))

(assert (=> b!306362 (= (select (arr!9135 a1!948) (_4!623 lt!439578)) (select (arr!9135 a2!948) (_4!623 lt!439578)))))

(declare-fun b!306363 () Bool)

(assert (=> b!306363 (= e!220701 (and (not (= (_3!1580 lt!439578) (_4!623 lt!439578))) (or (bvslt (_3!1580 lt!439578) #b00000000000000000000000000000000) (bvsge (_3!1580 lt!439578) (size!8052 a1!948)))))))

(declare-fun lt!439574 () Unit!21374)

(assert (=> b!306363 (= lt!439574 e!220698)))

(declare-fun c!14958 () Bool)

(assert (=> b!306363 (= c!14958 (and (bvslt (_4!623 lt!439578) (_4!623 lt!439571)) (bvslt (_3!1580 lt!439571) (_4!623 lt!439578))))))

(declare-fun lt!439575 () Unit!21374)

(assert (=> b!306363 (= lt!439575 e!220706)))

(declare-fun c!14956 () Bool)

(assert (=> b!306363 (= c!14956 (and (bvslt (_3!1580 lt!439571) (_3!1580 lt!439578)) (bvslt (_3!1580 lt!439578) (_4!623 lt!439571))))))

(declare-fun b!306364 () Bool)

(declare-fun Unit!21378 () Unit!21374)

(assert (=> b!306364 (= e!220706 Unit!21378)))

(assert (= (and start!68224 res!251606) b!306361))

(assert (= (and b!306361 res!251608) b!306355))

(assert (= (and b!306355 res!251607) b!306350))

(assert (= (and b!306350 res!251605) b!306353))

(assert (= (and b!306353 c!14955) b!306360))

(assert (= (and b!306353 (not c!14955)) b!306354))

(assert (= (and b!306353 c!14957) b!306358))

(assert (= (and b!306353 (not c!14957)) b!306352))

(assert (= (and b!306352 res!251609) b!306356))

(assert (= (and b!306356 (not res!251610)) b!306351))

(assert (= (or b!306358 b!306352) bm!5828))

(assert (= (and b!306353 res!251604) b!306363))

(assert (= (and b!306363 c!14956) b!306359))

(assert (= (and b!306363 (not c!14956)) b!306364))

(assert (= (and b!306363 c!14958) b!306362))

(assert (= (and b!306363 (not c!14958)) b!306357))

(declare-fun m!444817 () Bool)

(assert (=> b!306362 m!444817))

(declare-fun m!444819 () Bool)

(assert (=> b!306362 m!444819))

(declare-fun m!444821 () Bool)

(assert (=> b!306362 m!444821))

(declare-fun m!444823 () Bool)

(assert (=> b!306351 m!444823))

(declare-fun m!444825 () Bool)

(assert (=> b!306351 m!444825))

(assert (=> b!306351 m!444823))

(assert (=> b!306351 m!444825))

(declare-fun m!444827 () Bool)

(assert (=> b!306351 m!444827))

(declare-fun m!444829 () Bool)

(assert (=> b!306360 m!444829))

(declare-fun m!444831 () Bool)

(assert (=> b!306360 m!444831))

(declare-fun m!444833 () Bool)

(assert (=> b!306359 m!444833))

(declare-fun m!444835 () Bool)

(assert (=> b!306359 m!444835))

(declare-fun m!444837 () Bool)

(assert (=> b!306359 m!444837))

(declare-fun m!444839 () Bool)

(assert (=> b!306355 m!444839))

(declare-fun m!444841 () Bool)

(assert (=> bm!5828 m!444841))

(declare-fun m!444843 () Bool)

(assert (=> bm!5828 m!444843))

(assert (=> bm!5828 m!444841))

(assert (=> bm!5828 m!444843))

(declare-fun m!444845 () Bool)

(assert (=> bm!5828 m!444845))

(declare-fun m!444847 () Bool)

(assert (=> b!306353 m!444847))

(declare-fun m!444849 () Bool)

(assert (=> b!306353 m!444849))

(declare-fun m!444851 () Bool)

(assert (=> start!68224 m!444851))

(declare-fun m!444853 () Bool)

(assert (=> start!68224 m!444853))

(push 1)

(assert (not b!306360))

(assert (not b!306359))

(assert (not b!306355))

(assert (not b!306351))

(assert (not bm!5828))

(assert (not b!306353))

(assert (not start!68224))

(assert (not b!306362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102236 () Bool)

(assert (=> d!102236 (= (byteRangesEq!0 (select (arr!9135 a1!948) (_4!623 lt!439571)) (select (arr!9135 a2!948) (_4!623 lt!439571)) #b00000000000000000000000000000000 lt!439572) (or (= #b00000000000000000000000000000000 lt!439572) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9135 a1!948) (_4!623 lt!439571))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439572))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9135 a2!948) (_4!623 lt!439571))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439572))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26342 () Bool)

(assert (= bs!26342 d!102236))

(declare-fun m!444913 () Bool)

(assert (=> bs!26342 m!444913))

(declare-fun m!444915 () Bool)

(assert (=> bs!26342 m!444915))

(assert (=> b!306351 d!102236))

(declare-fun d!102244 () Bool)

(assert (=> d!102244 (arrayRangesEq!1681 a1!948 a2!948 (_1!13278 lt!439578) (_2!13278 lt!439578))))

(declare-fun lt!439613 () Unit!21374)

(declare-fun choose!624 (array!18579 array!18579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21374)

(assert (=> d!102244 (= lt!439613 (choose!624 a1!948 a2!948 (_1!13278 lt!439571) (_2!13278 lt!439571) (_1!13278 lt!439578) (_2!13278 lt!439578)))))

(assert (=> d!102244 (and (bvsle #b00000000000000000000000000000000 (_1!13278 lt!439571)) (bvsle (_1!13278 lt!439571) (_2!13278 lt!439571)))))

(assert (=> d!102244 (= (arrayRangesEqSlicedLemma!276 a1!948 a2!948 (_1!13278 lt!439571) (_2!13278 lt!439571) (_1!13278 lt!439578) (_2!13278 lt!439578)) lt!439613)))

(declare-fun bs!26345 () Bool)

(assert (= bs!26345 d!102244))

(assert (=> bs!26345 m!444831))

(declare-fun m!444927 () Bool)

(assert (=> bs!26345 m!444927))

(assert (=> b!306360 d!102244))

(declare-fun d!102250 () Bool)

(declare-fun res!251657 () Bool)

(declare-fun e!220761 () Bool)

(assert (=> d!102250 (=> res!251657 e!220761)))

(assert (=> d!102250 (= res!251657 (= (_1!13278 lt!439578) (_2!13278 lt!439578)))))

(assert (=> d!102250 (= (arrayRangesEq!1681 a1!948 a2!948 (_1!13278 lt!439578) (_2!13278 lt!439578)) e!220761)))

(declare-fun b!306423 () Bool)

(declare-fun e!220762 () Bool)

(assert (=> b!306423 (= e!220761 e!220762)))

(declare-fun res!251658 () Bool)

(assert (=> b!306423 (=> (not res!251658) (not e!220762))))

(assert (=> b!306423 (= res!251658 (= (select (arr!9135 a1!948) (_1!13278 lt!439578)) (select (arr!9135 a2!948) (_1!13278 lt!439578))))))

(declare-fun b!306424 () Bool)

(assert (=> b!306424 (= e!220762 (arrayRangesEq!1681 a1!948 a2!948 (bvadd (_1!13278 lt!439578) #b00000000000000000000000000000001) (_2!13278 lt!439578)))))

(assert (= (and d!102250 (not res!251657)) b!306423))

(assert (= (and b!306423 res!251658) b!306424))

(declare-fun m!444929 () Bool)

(assert (=> b!306423 m!444929))

(declare-fun m!444931 () Bool)

(assert (=> b!306423 m!444931))

(declare-fun m!444933 () Bool)

(assert (=> b!306424 m!444933))

(assert (=> b!306360 d!102250))

(declare-fun d!102252 () Bool)

(declare-fun res!251670 () Bool)

(declare-fun e!220780 () Bool)

(assert (=> d!102252 (=> res!251670 e!220780)))

(assert (=> d!102252 (= res!251670 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102252 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220780)))

(declare-fun b!306439 () Bool)

(declare-fun e!220778 () Bool)

(declare-fun e!220779 () Bool)

(assert (=> b!306439 (= e!220778 e!220779)))

(declare-fun lt!439622 () tuple4!1246)

(declare-fun lt!439621 () (_ BitVec 32))

(declare-fun res!251672 () Bool)

(assert (=> b!306439 (= res!251672 (byteRangesEq!0 (select (arr!9135 a1!948) (_3!1580 lt!439622)) (select (arr!9135 a2!948) (_3!1580 lt!439622)) lt!439621 #b00000000000000000000000000001000))))

(assert (=> b!306439 (=> (not res!251672) (not e!220779))))

(declare-fun b!306440 () Bool)

(declare-fun e!220777 () Bool)

(assert (=> b!306440 (= e!220777 e!220778)))

(declare-fun c!14967 () Bool)

(assert (=> b!306440 (= c!14967 (= (_3!1580 lt!439622) (_4!623 lt!439622)))))

(declare-fun e!220776 () Bool)

(declare-fun b!306441 () Bool)

(assert (=> b!306441 (= e!220776 (arrayRangesEq!1681 a1!948 a2!948 (_1!13278 lt!439622) (_2!13278 lt!439622)))))

(declare-fun b!306442 () Bool)

(declare-fun res!251671 () Bool)

(declare-fun lt!439620 () (_ BitVec 32))

(assert (=> b!306442 (= res!251671 (= lt!439620 #b00000000000000000000000000000000))))

(declare-fun e!220775 () Bool)

(assert (=> b!306442 (=> res!251671 e!220775)))

(assert (=> b!306442 (= e!220779 e!220775)))

(declare-fun b!306443 () Bool)

(declare-fun call!5840 () Bool)

(assert (=> b!306443 (= e!220775 call!5840)))

(declare-fun b!306444 () Bool)

(assert (=> b!306444 (= e!220780 e!220777)))

(declare-fun res!251669 () Bool)

(assert (=> b!306444 (=> (not res!251669) (not e!220777))))

(assert (=> b!306444 (= res!251669 e!220776)))

(declare-fun res!251673 () Bool)

(assert (=> b!306444 (=> res!251673 e!220776)))

(assert (=> b!306444 (= res!251673 (bvsge (_1!13278 lt!439622) (_2!13278 lt!439622)))))

(assert (=> b!306444 (= lt!439620 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306444 (= lt!439621 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306444 (= lt!439622 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306445 () Bool)

(assert (=> b!306445 (= e!220778 call!5840)))

(declare-fun bm!5837 () Bool)

(assert (=> bm!5837 (= call!5840 (byteRangesEq!0 (ite c!14967 (select (arr!9135 a1!948) (_3!1580 lt!439622)) (select (arr!9135 a1!948) (_4!623 lt!439622))) (ite c!14967 (select (arr!9135 a2!948) (_3!1580 lt!439622)) (select (arr!9135 a2!948) (_4!623 lt!439622))) (ite c!14967 lt!439621 #b00000000000000000000000000000000) lt!439620))))

(assert (= (and d!102252 (not res!251670)) b!306444))

(assert (= (and b!306444 (not res!251673)) b!306441))

(assert (= (and b!306444 res!251669) b!306440))

(assert (= (and b!306440 c!14967) b!306445))

(assert (= (and b!306440 (not c!14967)) b!306439))

(assert (= (and b!306439 res!251672) b!306442))

(assert (= (and b!306442 (not res!251671)) b!306443))

(assert (= (or b!306445 b!306443) bm!5837))

(declare-fun m!444935 () Bool)

(assert (=> b!306439 m!444935))

(declare-fun m!444937 () Bool)

(assert (=> b!306439 m!444937))

(assert (=> b!306439 m!444935))

(assert (=> b!306439 m!444937))

(declare-fun m!444939 () Bool)

(assert (=> b!306439 m!444939))

(declare-fun m!444941 () Bool)

(assert (=> b!306441 m!444941))

(assert (=> b!306444 m!444849))

(declare-fun m!444943 () Bool)

(assert (=> bm!5837 m!444943))

(declare-fun m!444945 () Bool)

(assert (=> bm!5837 m!444945))

(declare-fun m!444947 () Bool)

(assert (=> bm!5837 m!444947))

(assert (=> bm!5837 m!444935))

(assert (=> bm!5837 m!444937))

(assert (=> b!306355 d!102252))

(declare-fun d!102254 () Bool)

(assert (=> d!102254 (and (bvsge (_4!623 lt!439578) #b00000000000000000000000000000000) (bvslt (_4!623 lt!439578) (size!8052 a1!948)) (bvslt (_4!623 lt!439578) (size!8052 a2!948)) (= (select (arr!9135 a1!948) (_4!623 lt!439578)) (select (arr!9135 a2!948) (_4!623 lt!439578))))))

(declare-fun lt!439625 () Unit!21374)

(declare-fun choose!625 (array!18579 array!18579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21374)

(assert (=> d!102254 (= lt!439625 (choose!625 a1!948 a2!948 (_1!13278 lt!439571) (_4!623 lt!439578) (_2!13278 lt!439571)))))

(assert (=> d!102254 (and (bvsle #b00000000000000000000000000000000 (_1!13278 lt!439571)) (bvsle (_1!13278 lt!439571) (_2!13278 lt!439571)))))

(assert (=> d!102254 (= (arrayRangesEqImpliesEq!285 a1!948 a2!948 (_1!13278 lt!439571) (_4!623 lt!439578) (_2!13278 lt!439571)) lt!439625)))

(declare-fun bs!26346 () Bool)

(assert (= bs!26346 d!102254))

(assert (=> bs!26346 m!444819))

(assert (=> bs!26346 m!444821))

(declare-fun m!444949 () Bool)

(assert (=> bs!26346 m!444949))

(assert (=> b!306362 d!102254))

(declare-fun d!102256 () Bool)

(assert (=> d!102256 (= (byteRangesEq!0 (select (arr!9135 a1!948) (_3!1580 lt!439571)) (select (arr!9135 a2!948) (_3!1580 lt!439571)) lt!439568 (ite c!14957 lt!439572 #b00000000000000000000000000000111)) (or (= lt!439568 (ite c!14957 lt!439572 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9135 a1!948) (_3!1580 lt!439571))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14957 lt!439572 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439568)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9135 a2!948) (_3!1580 lt!439571))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14957 lt!439572 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439568)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26347 () Bool)

(assert (= bs!26347 d!102256))

(declare-fun m!444951 () Bool)

(assert (=> bs!26347 m!444951))

(declare-fun m!444953 () Bool)

(assert (=> bs!26347 m!444953))

(assert (=> bm!5828 d!102256))

(declare-fun d!102258 () Bool)

(assert (=> d!102258 (= (array_inv!7664 a1!948) (bvsge (size!8052 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68224 d!102258))

(declare-fun d!102260 () Bool)

(assert (=> d!102260 (= (array_inv!7664 a2!948) (bvsge (size!8052 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68224 d!102260))

(declare-fun d!102262 () Bool)

(assert (=> d!102262 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1247 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306353 d!102262))

(declare-fun d!102264 () Bool)

(assert (=> d!102264 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1247 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306353 d!102264))

(declare-fun d!102266 () Bool)

(assert (=> d!102266 (and (bvsge (_3!1580 lt!439578) #b00000000000000000000000000000000) (bvslt (_3!1580 lt!439578) (size!8052 a1!948)) (bvslt (_3!1580 lt!439578) (size!8052 a2!948)) (= (select (arr!9135 a1!948) (_3!1580 lt!439578)) (select (arr!9135 a2!948) (_3!1580 lt!439578))))))

(declare-fun lt!439626 () Unit!21374)

(assert (=> d!102266 (= lt!439626 (choose!625 a1!948 a2!948 (_1!13278 lt!439571) (_3!1580 lt!439578) (_2!13278 lt!439571)))))

(assert (=> d!102266 (and (bvsle #b00000000000000000000000000000000 (_1!13278 lt!439571)) (bvsle (_1!13278 lt!439571) (_2!13278 lt!439571)))))

(assert (=> d!102266 (= (arrayRangesEqImpliesEq!285 a1!948 a2!948 (_1!13278 lt!439571) (_3!1580 lt!439578) (_2!13278 lt!439571)) lt!439626)))

(declare-fun bs!26348 () Bool)

(assert (= bs!26348 d!102266))

(assert (=> bs!26348 m!444835))

(assert (=> bs!26348 m!444837))

(declare-fun m!444955 () Bool)

(assert (=> bs!26348 m!444955))

(assert (=> b!306359 d!102266))

(push 1)

(assert (not b!306424))

(assert (not b!306439))

(assert (not b!306444))

(assert (not d!102244))

(assert (not d!102254))

(assert (not b!306441))

(assert (not bm!5837))

(assert (not d!102266))

(check-sat)


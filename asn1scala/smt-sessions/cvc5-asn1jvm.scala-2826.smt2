; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68412 () Bool)

(assert start!68412)

(declare-fun b!307168 () Bool)

(declare-fun e!221346 () Bool)

(declare-fun e!221347 () Bool)

(assert (=> b!307168 (= e!221346 e!221347)))

(declare-fun res!252112 () Bool)

(assert (=> b!307168 (=> (not res!252112) (not e!221347))))

(declare-datatypes ((tuple4!1266 0))(
  ( (tuple4!1267 (_1!13288 (_ BitVec 32)) (_2!13288 (_ BitVec 32)) (_3!1590 (_ BitVec 32)) (_4!633 (_ BitVec 32))) )
))
(declare-fun lt!440092 () tuple4!1266)

(assert (=> b!307168 (= res!252112 (not (= (_3!1590 lt!440092) (_4!633 lt!440092))))))

(declare-datatypes ((Unit!21424 0))(
  ( (Unit!21425) )
))
(declare-fun lt!440096 () Unit!21424)

(declare-fun e!221340 () Unit!21424)

(assert (=> b!307168 (= lt!440096 e!221340)))

(declare-fun c!15113 () Bool)

(declare-fun lt!440097 () tuple4!1266)

(assert (=> b!307168 (= c!15113 (and (bvslt (_4!633 lt!440092) (_4!633 lt!440097)) (bvslt (_3!1590 lt!440097) (_4!633 lt!440092))))))

(declare-fun lt!440103 () Unit!21424)

(declare-fun e!221344 () Unit!21424)

(assert (=> b!307168 (= lt!440103 e!221344)))

(declare-fun c!15114 () Bool)

(assert (=> b!307168 (= c!15114 (and (bvslt (_3!1590 lt!440097) (_3!1590 lt!440092)) (bvslt (_3!1590 lt!440092) (_4!633 lt!440097))))))

(declare-fun b!307169 () Bool)

(declare-fun res!252111 () Bool)

(declare-fun lt!440100 () (_ BitVec 32))

(assert (=> b!307169 (= res!252111 (= lt!440100 #b00000000000000000000000000000000))))

(declare-fun e!221339 () Bool)

(assert (=> b!307169 (=> res!252111 e!221339)))

(declare-fun e!221350 () Bool)

(assert (=> b!307169 (= e!221350 e!221339)))

(declare-fun b!307170 () Bool)

(declare-fun call!5897 () Bool)

(assert (=> b!307170 (= e!221339 call!5897)))

(declare-fun b!307171 () Bool)

(declare-fun e!221343 () Bool)

(assert (=> b!307171 (= e!221343 call!5897)))

(declare-fun b!307172 () Bool)

(declare-fun e!221349 () Bool)

(assert (=> b!307172 (= e!221349 e!221346)))

(declare-fun res!252117 () Bool)

(assert (=> b!307172 (=> (not res!252117) (not e!221346))))

(assert (=> b!307172 (= res!252117 e!221343)))

(declare-fun c!15111 () Bool)

(assert (=> b!307172 (= c!15111 (= (_3!1590 lt!440097) (_4!633 lt!440097)))))

(declare-fun lt!440094 () Unit!21424)

(declare-fun e!221338 () Unit!21424)

(assert (=> b!307172 (= lt!440094 e!221338)))

(declare-fun c!15112 () Bool)

(assert (=> b!307172 (= c!15112 (bvslt (_1!13288 lt!440092) (_2!13288 lt!440092)))))

(declare-fun lt!440093 () (_ BitVec 32))

(declare-fun toSlice!52 () (_ BitVec 64))

(assert (=> b!307172 (= lt!440093 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1266)

(assert (=> b!307172 (= lt!440092 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!307172 (= lt!440100 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!440095 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!307172 (= lt!440095 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307172 (= lt!440097 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!307173 () Bool)

(declare-fun lt!440102 () Unit!21424)

(assert (=> b!307173 (= e!221338 lt!440102)))

(declare-datatypes ((array!18611 0))(
  ( (array!18612 (arr!9145 (Array (_ BitVec 32) (_ BitVec 8))) (size!8062 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18611)

(declare-fun a2!948 () array!18611)

(declare-fun arrayRangesEqSlicedLemma!286 (array!18611 array!18611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21424)

(assert (=> b!307173 (= lt!440102 (arrayRangesEqSlicedLemma!286 a1!948 a2!948 (_1!13288 lt!440097) (_2!13288 lt!440097) (_1!13288 lt!440092) (_2!13288 lt!440092)))))

(declare-fun arrayRangesEq!1691 (array!18611 array!18611 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307173 (arrayRangesEq!1691 a1!948 a2!948 (_1!13288 lt!440092) (_2!13288 lt!440092))))

(declare-fun b!307174 () Bool)

(declare-fun Unit!21426 () Unit!21424)

(assert (=> b!307174 (= e!221338 Unit!21426)))

(declare-fun b!307175 () Bool)

(assert (=> b!307175 (= e!221343 e!221350)))

(declare-fun res!252113 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307175 (= res!252113 (byteRangesEq!0 (select (arr!9145 a1!948) (_3!1590 lt!440097)) (select (arr!9145 a2!948) (_3!1590 lt!440097)) lt!440095 #b00000000000000000000000000000111))))

(assert (=> b!307175 (=> (not res!252113) (not e!221350))))

(declare-fun b!307176 () Bool)

(declare-fun lt!440101 () Unit!21424)

(assert (=> b!307176 (= e!221344 lt!440101)))

(declare-fun arrayRangesEqImpliesEq!295 (array!18611 array!18611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21424)

(assert (=> b!307176 (= lt!440101 (arrayRangesEqImpliesEq!295 a1!948 a2!948 (_1!13288 lt!440097) (_3!1590 lt!440092) (_2!13288 lt!440097)))))

(assert (=> b!307176 (= (select (arr!9145 a1!948) (_3!1590 lt!440092)) (select (arr!9145 a2!948) (_3!1590 lt!440092)))))

(declare-fun b!307177 () Bool)

(declare-fun e!221345 () Bool)

(assert (=> b!307177 (= e!221345 e!221349)))

(declare-fun res!252119 () Bool)

(assert (=> b!307177 (=> (not res!252119) (not e!221349))))

(declare-fun lt!440098 () (_ BitVec 64))

(assert (=> b!307177 (= res!252119 (and (bvsle toBit!258 lt!440098) (bvsle fromBit!258 lt!440098)))))

(assert (=> b!307177 (= lt!440098 (bvmul ((_ sign_extend 32) (size!8062 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!307178 () Bool)

(declare-fun lt!440099 () Unit!21424)

(assert (=> b!307178 (= e!221340 lt!440099)))

(assert (=> b!307178 (= lt!440099 (arrayRangesEqImpliesEq!295 a1!948 a2!948 (_1!13288 lt!440097) (_4!633 lt!440092) (_2!13288 lt!440097)))))

(assert (=> b!307178 (= (select (arr!9145 a1!948) (_4!633 lt!440092)) (select (arr!9145 a2!948) (_4!633 lt!440092)))))

(declare-fun res!252118 () Bool)

(assert (=> start!68412 (=> (not res!252118) (not e!221345))))

(assert (=> start!68412 (= res!252118 (and (bvsle (size!8062 a1!948) (size!8062 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68412 e!221345))

(assert (=> start!68412 true))

(declare-fun array_inv!7674 (array!18611) Bool)

(assert (=> start!68412 (array_inv!7674 a1!948)))

(assert (=> start!68412 (array_inv!7674 a2!948)))

(declare-fun b!307179 () Bool)

(declare-fun Unit!21427 () Unit!21424)

(assert (=> b!307179 (= e!221340 Unit!21427)))

(declare-fun b!307180 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18611 array!18611 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!307180 (= e!221347 (not (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52)))))

(declare-fun b!307181 () Bool)

(declare-fun res!252115 () Bool)

(assert (=> b!307181 (=> (not res!252115) (not e!221349))))

(assert (=> b!307181 (= res!252115 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!440098) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!307182 () Bool)

(declare-fun e!221341 () Bool)

(assert (=> b!307182 (= e!221341 (byteRangesEq!0 (select (arr!9145 a1!948) (_4!633 lt!440092)) (select (arr!9145 a2!948) (_4!633 lt!440092)) #b00000000000000000000000000000000 lt!440093))))

(declare-fun b!307183 () Bool)

(declare-fun res!252116 () Bool)

(assert (=> b!307183 (=> (not res!252116) (not e!221349))))

(assert (=> b!307183 (= res!252116 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!307184 () Bool)

(declare-fun res!252114 () Bool)

(assert (=> b!307184 (=> (not res!252114) (not e!221347))))

(assert (=> b!307184 (= res!252114 e!221341)))

(declare-fun res!252120 () Bool)

(assert (=> b!307184 (=> res!252120 e!221341)))

(assert (=> b!307184 (= res!252120 (= lt!440093 #b00000000000000000000000000000000))))

(declare-fun b!307185 () Bool)

(declare-fun Unit!21428 () Unit!21424)

(assert (=> b!307185 (= e!221344 Unit!21428)))

(declare-fun b!307186 () Bool)

(declare-fun res!252110 () Bool)

(assert (=> b!307186 (=> (not res!252110) (not e!221347))))

(assert (=> b!307186 (= res!252110 (byteRangesEq!0 (select (arr!9145 a1!948) (_3!1590 lt!440092)) (select (arr!9145 a2!948) (_3!1590 lt!440092)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun bm!5894 () Bool)

(assert (=> bm!5894 (= call!5897 (byteRangesEq!0 (ite c!15111 (select (arr!9145 a1!948) (_3!1590 lt!440097)) (select (arr!9145 a1!948) (_4!633 lt!440097))) (ite c!15111 (select (arr!9145 a2!948) (_3!1590 lt!440097)) (select (arr!9145 a2!948) (_4!633 lt!440097))) (ite c!15111 lt!440095 #b00000000000000000000000000000000) lt!440100))))

(assert (= (and start!68412 res!252118) b!307177))

(assert (= (and b!307177 res!252119) b!307183))

(assert (= (and b!307183 res!252116) b!307181))

(assert (= (and b!307181 res!252115) b!307172))

(assert (= (and b!307172 c!15112) b!307173))

(assert (= (and b!307172 (not c!15112)) b!307174))

(assert (= (and b!307172 c!15111) b!307171))

(assert (= (and b!307172 (not c!15111)) b!307175))

(assert (= (and b!307175 res!252113) b!307169))

(assert (= (and b!307169 (not res!252111)) b!307170))

(assert (= (or b!307171 b!307170) bm!5894))

(assert (= (and b!307172 res!252117) b!307168))

(assert (= (and b!307168 c!15114) b!307176))

(assert (= (and b!307168 (not c!15114)) b!307185))

(assert (= (and b!307168 c!15113) b!307178))

(assert (= (and b!307168 (not c!15113)) b!307179))

(assert (= (and b!307168 res!252112) b!307186))

(assert (= (and b!307186 res!252110) b!307184))

(assert (= (and b!307184 (not res!252120)) b!307182))

(assert (= (and b!307184 res!252114) b!307180))

(declare-fun m!445631 () Bool)

(assert (=> b!307183 m!445631))

(declare-fun m!445633 () Bool)

(assert (=> bm!5894 m!445633))

(declare-fun m!445635 () Bool)

(assert (=> bm!5894 m!445635))

(declare-fun m!445637 () Bool)

(assert (=> bm!5894 m!445637))

(declare-fun m!445639 () Bool)

(assert (=> bm!5894 m!445639))

(declare-fun m!445641 () Bool)

(assert (=> bm!5894 m!445641))

(assert (=> b!307175 m!445633))

(assert (=> b!307175 m!445637))

(assert (=> b!307175 m!445633))

(assert (=> b!307175 m!445637))

(declare-fun m!445643 () Bool)

(assert (=> b!307175 m!445643))

(declare-fun m!445645 () Bool)

(assert (=> b!307186 m!445645))

(declare-fun m!445647 () Bool)

(assert (=> b!307186 m!445647))

(assert (=> b!307186 m!445645))

(assert (=> b!307186 m!445647))

(declare-fun m!445649 () Bool)

(assert (=> b!307186 m!445649))

(declare-fun m!445651 () Bool)

(assert (=> b!307180 m!445651))

(declare-fun m!445653 () Bool)

(assert (=> b!307173 m!445653))

(declare-fun m!445655 () Bool)

(assert (=> b!307173 m!445655))

(declare-fun m!445657 () Bool)

(assert (=> b!307178 m!445657))

(declare-fun m!445659 () Bool)

(assert (=> b!307178 m!445659))

(declare-fun m!445661 () Bool)

(assert (=> b!307178 m!445661))

(declare-fun m!445663 () Bool)

(assert (=> b!307172 m!445663))

(declare-fun m!445665 () Bool)

(assert (=> b!307172 m!445665))

(declare-fun m!445667 () Bool)

(assert (=> start!68412 m!445667))

(declare-fun m!445669 () Bool)

(assert (=> start!68412 m!445669))

(assert (=> b!307182 m!445659))

(assert (=> b!307182 m!445661))

(assert (=> b!307182 m!445659))

(assert (=> b!307182 m!445661))

(declare-fun m!445671 () Bool)

(assert (=> b!307182 m!445671))

(declare-fun m!445673 () Bool)

(assert (=> b!307176 m!445673))

(assert (=> b!307176 m!445645))

(assert (=> b!307176 m!445647))

(push 1)

(assert (not b!307172))

(assert (not b!307175))

(assert (not bm!5894))

(assert (not b!307182))

(assert (not b!307186))

(assert (not b!307178))

(assert (not b!307180))

(assert (not b!307176))

(assert (not b!307173))

(assert (not b!307183))

(assert (not start!68412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102514 () Bool)

(assert (=> d!102514 (arrayRangesEq!1691 a1!948 a2!948 (_1!13288 lt!440092) (_2!13288 lt!440092))))

(declare-fun lt!440197 () Unit!21424)

(declare-fun choose!646 (array!18611 array!18611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21424)

(assert (=> d!102514 (= lt!440197 (choose!646 a1!948 a2!948 (_1!13288 lt!440097) (_2!13288 lt!440097) (_1!13288 lt!440092) (_2!13288 lt!440092)))))

(assert (=> d!102514 (and (bvsle #b00000000000000000000000000000000 (_1!13288 lt!440097)) (bvsle (_1!13288 lt!440097) (_2!13288 lt!440097)))))

(assert (=> d!102514 (= (arrayRangesEqSlicedLemma!286 a1!948 a2!948 (_1!13288 lt!440097) (_2!13288 lt!440097) (_1!13288 lt!440092) (_2!13288 lt!440092)) lt!440197)))

(declare-fun bs!26419 () Bool)

(assert (= bs!26419 d!102514))

(assert (=> bs!26419 m!445655))

(declare-fun m!445817 () Bool)

(assert (=> bs!26419 m!445817))

(assert (=> b!307173 d!102514))

(declare-fun d!102516 () Bool)

(declare-fun res!252217 () Bool)

(declare-fun e!221463 () Bool)

(assert (=> d!102516 (=> res!252217 e!221463)))

(assert (=> d!102516 (= res!252217 (= (_1!13288 lt!440092) (_2!13288 lt!440092)))))

(assert (=> d!102516 (= (arrayRangesEq!1691 a1!948 a2!948 (_1!13288 lt!440092) (_2!13288 lt!440092)) e!221463)))

(declare-fun b!307339 () Bool)

(declare-fun e!221464 () Bool)

(assert (=> b!307339 (= e!221463 e!221464)))

(declare-fun res!252218 () Bool)

(assert (=> b!307339 (=> (not res!252218) (not e!221464))))

(assert (=> b!307339 (= res!252218 (= (select (arr!9145 a1!948) (_1!13288 lt!440092)) (select (arr!9145 a2!948) (_1!13288 lt!440092))))))

(declare-fun b!307340 () Bool)

(assert (=> b!307340 (= e!221464 (arrayRangesEq!1691 a1!948 a2!948 (bvadd (_1!13288 lt!440092) #b00000000000000000000000000000001) (_2!13288 lt!440092)))))

(assert (= (and d!102516 (not res!252217)) b!307339))

(assert (= (and b!307339 res!252218) b!307340))

(declare-fun m!445819 () Bool)

(assert (=> b!307339 m!445819))

(declare-fun m!445821 () Bool)

(assert (=> b!307339 m!445821))

(declare-fun m!445823 () Bool)

(assert (=> b!307340 m!445823))

(assert (=> b!307173 d!102516))

(declare-fun d!102518 () Bool)

(assert (=> d!102518 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1267 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!307172 d!102518))

(declare-fun d!102520 () Bool)

(assert (=> d!102520 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1267 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!307172 d!102520))

(declare-fun d!102522 () Bool)

(assert (=> d!102522 (and (bvsge (_4!633 lt!440092) #b00000000000000000000000000000000) (bvslt (_4!633 lt!440092) (size!8062 a1!948)) (bvslt (_4!633 lt!440092) (size!8062 a2!948)) (= (select (arr!9145 a1!948) (_4!633 lt!440092)) (select (arr!9145 a2!948) (_4!633 lt!440092))))))

(declare-fun lt!440200 () Unit!21424)

(declare-fun choose!647 (array!18611 array!18611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21424)

(assert (=> d!102522 (= lt!440200 (choose!647 a1!948 a2!948 (_1!13288 lt!440097) (_4!633 lt!440092) (_2!13288 lt!440097)))))

(assert (=> d!102522 (and (bvsle #b00000000000000000000000000000000 (_1!13288 lt!440097)) (bvsle (_1!13288 lt!440097) (_2!13288 lt!440097)))))

(assert (=> d!102522 (= (arrayRangesEqImpliesEq!295 a1!948 a2!948 (_1!13288 lt!440097) (_4!633 lt!440092) (_2!13288 lt!440097)) lt!440200)))

(declare-fun bs!26420 () Bool)

(assert (= bs!26420 d!102522))

(assert (=> bs!26420 m!445659))

(assert (=> bs!26420 m!445661))

(declare-fun m!445825 () Bool)

(assert (=> bs!26420 m!445825))

(assert (=> b!307178 d!102522))

(declare-fun call!5910 () Bool)

(declare-fun lt!440208 () tuple4!1266)

(declare-fun c!15145 () Bool)

(declare-fun bm!5907 () Bool)

(declare-fun lt!440209 () (_ BitVec 32))

(declare-fun lt!440207 () (_ BitVec 32))

(assert (=> bm!5907 (= call!5910 (byteRangesEq!0 (select (arr!9145 a1!948) (_3!1590 lt!440208)) (select (arr!9145 a2!948) (_3!1590 lt!440208)) lt!440209 (ite c!15145 lt!440207 #b00000000000000000000000000001000)))))

(declare-fun b!307356 () Bool)

(declare-fun e!221480 () Bool)

(assert (=> b!307356 (= e!221480 (arrayRangesEq!1691 a1!948 a2!948 (_1!13288 lt!440208) (_2!13288 lt!440208)))))

(declare-fun b!307357 () Bool)

(declare-fun e!221477 () Bool)

(declare-fun e!221479 () Bool)

(assert (=> b!307357 (= e!221477 e!221479)))

(declare-fun res!252231 () Bool)

(assert (=> b!307357 (= res!252231 call!5910)))

(assert (=> b!307357 (=> (not res!252231) (not e!221479))))

(declare-fun b!307358 () Bool)

(declare-fun e!221478 () Bool)

(assert (=> b!307358 (= e!221478 e!221477)))

(assert (=> b!307358 (= c!15145 (= (_3!1590 lt!440208) (_4!633 lt!440208)))))

(declare-fun b!307359 () Bool)

(declare-fun e!221481 () Bool)

(assert (=> b!307359 (= e!221481 e!221478)))

(declare-fun res!252233 () Bool)

(assert (=> b!307359 (=> (not res!252233) (not e!221478))))

(assert (=> b!307359 (= res!252233 e!221480)))

(declare-fun res!252229 () Bool)

(assert (=> b!307359 (=> res!252229 e!221480)))

(assert (=> b!307359 (= res!252229 (bvsge (_1!13288 lt!440208) (_2!13288 lt!440208)))))

(assert (=> b!307359 (= lt!440207 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307359 (= lt!440209 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307359 (= lt!440208 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!307360 () Bool)

(declare-fun res!252230 () Bool)

(assert (=> b!307360 (= res!252230 (= lt!440207 #b00000000000000000000000000000000))))

(declare-fun e!221482 () Bool)

(assert (=> b!307360 (=> res!252230 e!221482)))

(assert (=> b!307360 (= e!221479 e!221482)))

(declare-fun b!307361 () Bool)

(assert (=> b!307361 (= e!221477 call!5910)))

(declare-fun b!307355 () Bool)

(assert (=> b!307355 (= e!221482 (byteRangesEq!0 (select (arr!9145 a1!948) (_4!633 lt!440208)) (select (arr!9145 a2!948) (_4!633 lt!440208)) #b00000000000000000000000000000000 lt!440207))))

(declare-fun d!102524 () Bool)

(declare-fun res!252232 () Bool)

(assert (=> d!102524 (=> res!252232 e!221481)))

(assert (=> d!102524 (= res!252232 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102524 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!221481)))

(assert (= (and d!102524 (not res!252232)) b!307359))

(assert (= (and b!307359 (not res!252229)) b!307356))

(assert (= (and b!307359 res!252233) b!307358))

(assert (= (and b!307358 c!15145) b!307361))

(assert (= (and b!307358 (not c!15145)) b!307357))

(assert (= (and b!307357 res!252231) b!307360))

(assert (= (and b!307360 (not res!252230)) b!307355))

(assert (= (or b!307361 b!307357) bm!5907))

(declare-fun m!445827 () Bool)

(assert (=> bm!5907 m!445827))

(declare-fun m!445829 () Bool)

(assert (=> bm!5907 m!445829))

(assert (=> bm!5907 m!445827))

(assert (=> bm!5907 m!445829))

(declare-fun m!445831 () Bool)

(assert (=> bm!5907 m!445831))

(declare-fun m!445833 () Bool)

(assert (=> b!307356 m!445833))

(assert (=> b!307359 m!445665))

(declare-fun m!445835 () Bool)

(assert (=> b!307355 m!445835))

(declare-fun m!445837 () Bool)

(assert (=> b!307355 m!445837))

(assert (=> b!307355 m!445835))

(assert (=> b!307355 m!445837))

(declare-fun m!445839 () Bool)

(assert (=> b!307355 m!445839))

(assert (=> b!307183 d!102524))

(declare-fun d!102528 () Bool)

(assert (=> d!102528 (and (bvsge (_3!1590 lt!440092) #b00000000000000000000000000000000) (bvslt (_3!1590 lt!440092) (size!8062 a1!948)) (bvslt (_3!1590 lt!440092) (size!8062 a2!948)) (= (select (arr!9145 a1!948) (_3!1590 lt!440092)) (select (arr!9145 a2!948) (_3!1590 lt!440092))))))

(declare-fun lt!440210 () Unit!21424)

(assert (=> d!102528 (= lt!440210 (choose!647 a1!948 a2!948 (_1!13288 lt!440097) (_3!1590 lt!440092) (_2!13288 lt!440097)))))

(assert (=> d!102528 (and (bvsle #b00000000000000000000000000000000 (_1!13288 lt!440097)) (bvsle (_1!13288 lt!440097) (_2!13288 lt!440097)))))

(assert (=> d!102528 (= (arrayRangesEqImpliesEq!295 a1!948 a2!948 (_1!13288 lt!440097) (_3!1590 lt!440092) (_2!13288 lt!440097)) lt!440210)))

(declare-fun bs!26421 () Bool)

(assert (= bs!26421 d!102528))

(assert (=> bs!26421 m!445645))

(assert (=> bs!26421 m!445647))

(declare-fun m!445841 () Bool)

(assert (=> bs!26421 m!445841))

(assert (=> b!307176 d!102528))

(declare-fun d!102530 () Bool)

(assert (=> d!102530 (= (byteRangesEq!0 (select (arr!9145 a1!948) (_4!633 lt!440092)) (select (arr!9145 a2!948) (_4!633 lt!440092)) #b00000000000000000000000000000000 lt!440093) (or (= #b00000000000000000000000000000000 lt!440093) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a1!948) (_4!633 lt!440092))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440093))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a2!948) (_4!633 lt!440092))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440093))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26423 () Bool)

(assert (= bs!26423 d!102530))

(declare-fun m!445851 () Bool)

(assert (=> bs!26423 m!445851))

(declare-fun m!445853 () Bool)

(assert (=> bs!26423 m!445853))

(assert (=> b!307182 d!102530))

(declare-fun d!102536 () Bool)

(assert (=> d!102536 (= (byteRangesEq!0 (ite c!15111 (select (arr!9145 a1!948) (_3!1590 lt!440097)) (select (arr!9145 a1!948) (_4!633 lt!440097))) (ite c!15111 (select (arr!9145 a2!948) (_3!1590 lt!440097)) (select (arr!9145 a2!948) (_4!633 lt!440097))) (ite c!15111 lt!440095 #b00000000000000000000000000000000) lt!440100) (or (= (ite c!15111 lt!440095 #b00000000000000000000000000000000) lt!440100) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15111 (select (arr!9145 a1!948) (_3!1590 lt!440097)) (select (arr!9145 a1!948) (_4!633 lt!440097)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440100))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15111 lt!440095 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15111 (select (arr!9145 a2!948) (_3!1590 lt!440097)) (select (arr!9145 a2!948) (_4!633 lt!440097)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440100))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15111 lt!440095 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26424 () Bool)

(assert (= bs!26424 d!102536))

(declare-fun m!445855 () Bool)

(assert (=> bs!26424 m!445855))

(declare-fun m!445857 () Bool)

(assert (=> bs!26424 m!445857))

(assert (=> bm!5894 d!102536))

(declare-fun bm!5908 () Bool)

(declare-fun lt!440214 () (_ BitVec 32))

(declare-fun c!15146 () Bool)

(declare-fun lt!440216 () (_ BitVec 32))

(declare-fun lt!440215 () tuple4!1266)

(declare-fun call!5911 () Bool)

(assert (=> bm!5908 (= call!5911 (byteRangesEq!0 (select (arr!9145 a1!948) (_3!1590 lt!440215)) (select (arr!9145 a2!948) (_3!1590 lt!440215)) lt!440216 (ite c!15146 lt!440214 #b00000000000000000000000000001000)))))

(declare-fun e!221492 () Bool)

(declare-fun b!307369 () Bool)

(assert (=> b!307369 (= e!221492 (arrayRangesEq!1691 a1!948 a2!948 (_1!13288 lt!440215) (_2!13288 lt!440215)))))

(declare-fun b!307370 () Bool)

(declare-fun e!221489 () Bool)

(declare-fun e!221491 () Bool)

(assert (=> b!307370 (= e!221489 e!221491)))

(declare-fun res!252242 () Bool)

(assert (=> b!307370 (= res!252242 call!5911)))

(assert (=> b!307370 (=> (not res!252242) (not e!221491))))

(declare-fun b!307371 () Bool)

(declare-fun e!221490 () Bool)

(assert (=> b!307371 (= e!221490 e!221489)))

(assert (=> b!307371 (= c!15146 (= (_3!1590 lt!440215) (_4!633 lt!440215)))))

(declare-fun b!307372 () Bool)

(declare-fun e!221493 () Bool)

(assert (=> b!307372 (= e!221493 e!221490)))

(declare-fun res!252244 () Bool)

(assert (=> b!307372 (=> (not res!252244) (not e!221490))))

(assert (=> b!307372 (= res!252244 e!221492)))

(declare-fun res!252240 () Bool)

(assert (=> b!307372 (=> res!252240 e!221492)))

(assert (=> b!307372 (= res!252240 (bvsge (_1!13288 lt!440215) (_2!13288 lt!440215)))))

(assert (=> b!307372 (= lt!440214 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307372 (= lt!440216 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307372 (= lt!440215 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun b!307373 () Bool)

(declare-fun res!252241 () Bool)

(assert (=> b!307373 (= res!252241 (= lt!440214 #b00000000000000000000000000000000))))

(declare-fun e!221494 () Bool)

(assert (=> b!307373 (=> res!252241 e!221494)))

(assert (=> b!307373 (= e!221491 e!221494)))

(declare-fun b!307374 () Bool)

(assert (=> b!307374 (= e!221489 call!5911)))

(declare-fun b!307368 () Bool)

(assert (=> b!307368 (= e!221494 (byteRangesEq!0 (select (arr!9145 a1!948) (_4!633 lt!440215)) (select (arr!9145 a2!948) (_4!633 lt!440215)) #b00000000000000000000000000000000 lt!440214))))

(declare-fun d!102538 () Bool)

(declare-fun res!252243 () Bool)

(assert (=> d!102538 (=> res!252243 e!221493)))

(assert (=> d!102538 (= res!252243 (bvsge fromSlice!52 toSlice!52))))

(assert (=> d!102538 (= (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52) e!221493)))

(assert (= (and d!102538 (not res!252243)) b!307372))

(assert (= (and b!307372 (not res!252240)) b!307369))

(assert (= (and b!307372 res!252244) b!307371))

(assert (= (and b!307371 c!15146) b!307374))

(assert (= (and b!307371 (not c!15146)) b!307370))

(assert (= (and b!307370 res!252242) b!307373))

(assert (= (and b!307373 (not res!252241)) b!307368))

(assert (= (or b!307374 b!307370) bm!5908))

(declare-fun m!445859 () Bool)

(assert (=> bm!5908 m!445859))

(declare-fun m!445861 () Bool)

(assert (=> bm!5908 m!445861))

(assert (=> bm!5908 m!445859))

(assert (=> bm!5908 m!445861))

(declare-fun m!445863 () Bool)

(assert (=> bm!5908 m!445863))

(declare-fun m!445865 () Bool)

(assert (=> b!307369 m!445865))

(assert (=> b!307372 m!445663))

(declare-fun m!445867 () Bool)

(assert (=> b!307368 m!445867))

(declare-fun m!445869 () Bool)

(assert (=> b!307368 m!445869))

(assert (=> b!307368 m!445867))

(assert (=> b!307368 m!445869))

(declare-fun m!445871 () Bool)

(assert (=> b!307368 m!445871))

(assert (=> b!307180 d!102538))

(declare-fun d!102540 () Bool)

(assert (=> d!102540 (= (array_inv!7674 a1!948) (bvsge (size!8062 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68412 d!102540))

(declare-fun d!102542 () Bool)

(assert (=> d!102542 (= (array_inv!7674 a2!948) (bvsge (size!8062 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68412 d!102542))

(declare-fun d!102544 () Bool)

(assert (=> d!102544 (= (byteRangesEq!0 (select (arr!9145 a1!948) (_3!1590 lt!440092)) (select (arr!9145 a2!948) (_3!1590 lt!440092)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a1!948) (_3!1590 lt!440092))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a2!948) (_3!1590 lt!440092))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26426 () Bool)

(assert (= bs!26426 d!102544))

(declare-fun m!445877 () Bool)

(assert (=> bs!26426 m!445877))

(declare-fun m!445879 () Bool)

(assert (=> bs!26426 m!445879))

(assert (=> b!307186 d!102544))

(declare-fun d!102548 () Bool)

(assert (=> d!102548 (= (byteRangesEq!0 (select (arr!9145 a1!948) (_3!1590 lt!440097)) (select (arr!9145 a2!948) (_3!1590 lt!440097)) lt!440095 #b00000000000000000000000000000111) (or (= lt!440095 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a1!948) (_3!1590 lt!440097))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440095)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a2!948) (_3!1590 lt!440097))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440095)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26428 () Bool)

(assert (= bs!26428 d!102548))

(assert (=> bs!26428 m!445877))

(declare-fun m!445883 () Bool)

(assert (=> bs!26428 m!445883))

(assert (=> b!307175 d!102548))

(push 1)

(assert (not b!307356))

(assert (not d!102528))

(assert (not bm!5908))

(assert (not b!307359))

(assert (not b!307368))

(assert (not b!307369))

(assert (not d!102514))

(assert (not b!307372))

(assert (not bm!5907))

(assert (not d!102522))

(assert (not b!307355))

(assert (not b!307340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102610 () Bool)

(assert (=> d!102610 (= (byteRangesEq!0 (select (arr!9145 a1!948) (_3!1590 lt!440208)) (select (arr!9145 a2!948) (_3!1590 lt!440208)) lt!440209 (ite c!15145 lt!440207 #b00000000000000000000000000001000)) (or (= lt!440209 (ite c!15145 lt!440207 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a1!948) (_3!1590 lt!440208))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15145 lt!440207 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440209)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a2!948) (_3!1590 lt!440208))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15145 lt!440207 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440209)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26447 () Bool)

(assert (= bs!26447 d!102610))

(declare-fun m!445985 () Bool)

(assert (=> bs!26447 m!445985))

(declare-fun m!445987 () Bool)

(assert (=> bs!26447 m!445987))

(assert (=> bm!5907 d!102610))

(declare-fun d!102612 () Bool)

(assert (=> d!102612 (= (select (arr!9145 a1!948) (_3!1590 lt!440092)) (select (arr!9145 a2!948) (_3!1590 lt!440092)))))

(assert (=> d!102612 true))

(declare-fun _$12!128 () Unit!21424)

(assert (=> d!102612 (= (choose!647 a1!948 a2!948 (_1!13288 lt!440097) (_3!1590 lt!440092) (_2!13288 lt!440097)) _$12!128)))

(declare-fun bs!26448 () Bool)

(assert (= bs!26448 d!102612))

(assert (=> bs!26448 m!445645))

(assert (=> bs!26448 m!445647))

(assert (=> d!102528 d!102612))

(declare-fun d!102614 () Bool)

(declare-fun res!252277 () Bool)

(declare-fun e!221531 () Bool)

(assert (=> d!102614 (=> res!252277 e!221531)))

(assert (=> d!102614 (= res!252277 (= (_1!13288 lt!440208) (_2!13288 lt!440208)))))

(assert (=> d!102614 (= (arrayRangesEq!1691 a1!948 a2!948 (_1!13288 lt!440208) (_2!13288 lt!440208)) e!221531)))

(declare-fun b!307415 () Bool)

(declare-fun e!221532 () Bool)

(assert (=> b!307415 (= e!221531 e!221532)))

(declare-fun res!252278 () Bool)

(assert (=> b!307415 (=> (not res!252278) (not e!221532))))

(assert (=> b!307415 (= res!252278 (= (select (arr!9145 a1!948) (_1!13288 lt!440208)) (select (arr!9145 a2!948) (_1!13288 lt!440208))))))

(declare-fun b!307416 () Bool)

(assert (=> b!307416 (= e!221532 (arrayRangesEq!1691 a1!948 a2!948 (bvadd (_1!13288 lt!440208) #b00000000000000000000000000000001) (_2!13288 lt!440208)))))

(assert (= (and d!102614 (not res!252277)) b!307415))

(assert (= (and b!307415 res!252278) b!307416))

(declare-fun m!445989 () Bool)

(assert (=> b!307415 m!445989))

(declare-fun m!445991 () Bool)

(assert (=> b!307415 m!445991))

(declare-fun m!445993 () Bool)

(assert (=> b!307416 m!445993))

(assert (=> b!307356 d!102614))

(declare-fun d!102616 () Bool)

(assert (=> d!102616 (= (byteRangesEq!0 (select (arr!9145 a1!948) (_4!633 lt!440208)) (select (arr!9145 a2!948) (_4!633 lt!440208)) #b00000000000000000000000000000000 lt!440207) (or (= #b00000000000000000000000000000000 lt!440207) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a1!948) (_4!633 lt!440208))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440207))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a2!948) (_4!633 lt!440208))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440207))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26449 () Bool)

(assert (= bs!26449 d!102616))

(declare-fun m!445995 () Bool)

(assert (=> bs!26449 m!445995))

(assert (=> bs!26449 m!445853))

(assert (=> b!307355 d!102616))

(assert (=> b!307372 d!102518))

(declare-fun d!102618 () Bool)

(assert (=> d!102618 (= (select (arr!9145 a1!948) (_4!633 lt!440092)) (select (arr!9145 a2!948) (_4!633 lt!440092)))))

(assert (=> d!102618 true))

(declare-fun _$12!129 () Unit!21424)

(assert (=> d!102618 (= (choose!647 a1!948 a2!948 (_1!13288 lt!440097) (_4!633 lt!440092) (_2!13288 lt!440097)) _$12!129)))

(declare-fun bs!26450 () Bool)

(assert (= bs!26450 d!102618))

(assert (=> bs!26450 m!445659))

(assert (=> bs!26450 m!445661))

(assert (=> d!102522 d!102618))

(declare-fun d!102620 () Bool)

(declare-fun res!252279 () Bool)

(declare-fun e!221533 () Bool)

(assert (=> d!102620 (=> res!252279 e!221533)))

(assert (=> d!102620 (= res!252279 (= (_1!13288 lt!440215) (_2!13288 lt!440215)))))

(assert (=> d!102620 (= (arrayRangesEq!1691 a1!948 a2!948 (_1!13288 lt!440215) (_2!13288 lt!440215)) e!221533)))

(declare-fun b!307417 () Bool)

(declare-fun e!221534 () Bool)

(assert (=> b!307417 (= e!221533 e!221534)))

(declare-fun res!252280 () Bool)

(assert (=> b!307417 (=> (not res!252280) (not e!221534))))

(assert (=> b!307417 (= res!252280 (= (select (arr!9145 a1!948) (_1!13288 lt!440215)) (select (arr!9145 a2!948) (_1!13288 lt!440215))))))

(declare-fun b!307418 () Bool)

(assert (=> b!307418 (= e!221534 (arrayRangesEq!1691 a1!948 a2!948 (bvadd (_1!13288 lt!440215) #b00000000000000000000000000000001) (_2!13288 lt!440215)))))

(assert (= (and d!102620 (not res!252279)) b!307417))

(assert (= (and b!307417 res!252280) b!307418))

(declare-fun m!445997 () Bool)

(assert (=> b!307417 m!445997))

(declare-fun m!445999 () Bool)

(assert (=> b!307417 m!445999))

(declare-fun m!446001 () Bool)

(assert (=> b!307418 m!446001))

(assert (=> b!307369 d!102620))

(assert (=> b!307359 d!102520))

(assert (=> d!102514 d!102516))

(declare-fun d!102622 () Bool)

(assert (=> d!102622 (arrayRangesEq!1691 a1!948 a2!948 (_1!13288 lt!440092) (_2!13288 lt!440092))))

(assert (=> d!102622 true))

(declare-fun _$10!55 () Unit!21424)

(assert (=> d!102622 (= (choose!646 a1!948 a2!948 (_1!13288 lt!440097) (_2!13288 lt!440097) (_1!13288 lt!440092) (_2!13288 lt!440092)) _$10!55)))

(declare-fun bs!26451 () Bool)

(assert (= bs!26451 d!102622))

(assert (=> bs!26451 m!445655))

(assert (=> d!102514 d!102622))

(declare-fun d!102624 () Bool)

(assert (=> d!102624 (= (byteRangesEq!0 (select (arr!9145 a1!948) (_3!1590 lt!440215)) (select (arr!9145 a2!948) (_3!1590 lt!440215)) lt!440216 (ite c!15146 lt!440214 #b00000000000000000000000000001000)) (or (= lt!440216 (ite c!15146 lt!440214 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a1!948) (_3!1590 lt!440215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15146 lt!440214 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440216)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a2!948) (_3!1590 lt!440215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15146 lt!440214 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440216)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26452 () Bool)

(assert (= bs!26452 d!102624))

(declare-fun m!446003 () Bool)

(assert (=> bs!26452 m!446003))

(declare-fun m!446005 () Bool)

(assert (=> bs!26452 m!446005))

(assert (=> bm!5908 d!102624))

(declare-fun d!102626 () Bool)

(assert (=> d!102626 (= (byteRangesEq!0 (select (arr!9145 a1!948) (_4!633 lt!440215)) (select (arr!9145 a2!948) (_4!633 lt!440215)) #b00000000000000000000000000000000 lt!440214) (or (= #b00000000000000000000000000000000 lt!440214) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a1!948) (_4!633 lt!440215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440214))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9145 a2!948) (_4!633 lt!440215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440214))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26453 () Bool)

(assert (= bs!26453 d!102626))

(declare-fun m!446007 () Bool)

(assert (=> bs!26453 m!446007))

(assert (=> bs!26453 m!445853))

(assert (=> b!307368 d!102626))

(declare-fun d!102628 () Bool)

(declare-fun res!252281 () Bool)

(declare-fun e!221535 () Bool)

(assert (=> d!102628 (=> res!252281 e!221535)))

(assert (=> d!102628 (= res!252281 (= (bvadd (_1!13288 lt!440092) #b00000000000000000000000000000001) (_2!13288 lt!440092)))))

(assert (=> d!102628 (= (arrayRangesEq!1691 a1!948 a2!948 (bvadd (_1!13288 lt!440092) #b00000000000000000000000000000001) (_2!13288 lt!440092)) e!221535)))

(declare-fun b!307419 () Bool)

(declare-fun e!221536 () Bool)

(assert (=> b!307419 (= e!221535 e!221536)))

(declare-fun res!252282 () Bool)

(assert (=> b!307419 (=> (not res!252282) (not e!221536))))

(assert (=> b!307419 (= res!252282 (= (select (arr!9145 a1!948) (bvadd (_1!13288 lt!440092) #b00000000000000000000000000000001)) (select (arr!9145 a2!948) (bvadd (_1!13288 lt!440092) #b00000000000000000000000000000001))))))

(declare-fun b!307420 () Bool)

(assert (=> b!307420 (= e!221536 (arrayRangesEq!1691 a1!948 a2!948 (bvadd (_1!13288 lt!440092) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!13288 lt!440092)))))

(assert (= (and d!102628 (not res!252281)) b!307419))

(assert (= (and b!307419 res!252282) b!307420))

(declare-fun m!446009 () Bool)

(assert (=> b!307419 m!446009))

(declare-fun m!446011 () Bool)

(assert (=> b!307419 m!446011))

(declare-fun m!446013 () Bool)

(assert (=> b!307420 m!446013))

(assert (=> b!307340 d!102628))

(push 1)

(assert (not b!307416))

(assert (not d!102622))

(assert (not b!307420))

(assert (not b!307418))

(check-sat)

(pop 1)

(push 1)

(check-sat)


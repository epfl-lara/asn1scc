; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67932 () Bool)

(assert start!67932)

(declare-fun b!304960 () Bool)

(declare-fun res!250761 () Bool)

(declare-fun e!219595 () Bool)

(assert (=> b!304960 (=> (not res!250761) (not e!219595))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18521 0))(
  ( (array!18522 (arr!9115 (Array (_ BitVec 32) (_ BitVec 8))) (size!8032 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18521)

(declare-fun a2!948 () array!18521)

(declare-fun arrayBitRangesEq!0 (array!18521 array!18521 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304960 (= res!250761 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304961 () Bool)

(declare-fun res!250758 () Bool)

(declare-fun lt!438675 () (_ BitVec 32))

(assert (=> b!304961 (= res!250758 (= lt!438675 #b00000000000000000000000000000000))))

(declare-fun e!219591 () Bool)

(assert (=> b!304961 (=> res!250758 e!219591)))

(declare-fun e!219590 () Bool)

(assert (=> b!304961 (= e!219590 e!219591)))

(declare-fun b!304962 () Bool)

(declare-datatypes ((Unit!21283 0))(
  ( (Unit!21284) )
))
(declare-fun e!219593 () Unit!21283)

(declare-fun Unit!21285 () Unit!21283)

(assert (=> b!304962 (= e!219593 Unit!21285)))

(declare-fun lt!438673 () (_ BitVec 32))

(declare-fun call!5714 () Bool)

(declare-fun c!14685 () Bool)

(declare-fun bm!5711 () Bool)

(declare-datatypes ((tuple4!1206 0))(
  ( (tuple4!1207 (_1!13258 (_ BitVec 32)) (_2!13258 (_ BitVec 32)) (_3!1560 (_ BitVec 32)) (_4!603 (_ BitVec 32))) )
))
(declare-fun lt!438671 () tuple4!1206)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5711 (= call!5714 (byteRangesEq!0 (select (arr!9115 a1!948) (_3!1560 lt!438671)) (select (arr!9115 a2!948) (_3!1560 lt!438671)) lt!438673 (ite c!14685 lt!438675 #b00000000000000000000000000000111)))))

(declare-fun b!304963 () Bool)

(declare-fun lt!438677 () Unit!21283)

(assert (=> b!304963 (= e!219593 lt!438677)))

(declare-fun lt!438672 () tuple4!1206)

(declare-fun arrayRangesEqImpliesEq!265 (array!18521 array!18521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21283)

(assert (=> b!304963 (= lt!438677 (arrayRangesEqImpliesEq!265 a1!948 a2!948 (_1!13258 lt!438671) (_3!1560 lt!438672) (_2!13258 lt!438671)))))

(assert (=> b!304963 (= (select (arr!9115 a1!948) (_3!1560 lt!438672)) (select (arr!9115 a2!948) (_3!1560 lt!438672)))))

(declare-fun b!304964 () Bool)

(declare-fun res!250762 () Bool)

(assert (=> b!304964 (=> (not res!250762) (not e!219595))))

(declare-fun lt!438674 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304964 (= res!250762 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438674) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304965 () Bool)

(declare-fun e!219596 () Bool)

(assert (=> b!304965 (= e!219596 e!219590)))

(declare-fun res!250759 () Bool)

(assert (=> b!304965 (= res!250759 call!5714)))

(assert (=> b!304965 (=> (not res!250759) (not e!219590))))

(declare-fun b!304967 () Bool)

(declare-fun e!219592 () Unit!21283)

(declare-fun Unit!21286 () Unit!21283)

(assert (=> b!304967 (= e!219592 Unit!21286)))

(declare-fun b!304968 () Bool)

(declare-fun lt!438676 () Unit!21283)

(assert (=> b!304968 (= e!219592 lt!438676)))

(declare-fun arrayRangesEqSlicedLemma!256 (array!18521 array!18521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21283)

(assert (=> b!304968 (= lt!438676 (arrayRangesEqSlicedLemma!256 a1!948 a2!948 (_1!13258 lt!438671) (_2!13258 lt!438671) (_1!13258 lt!438672) (_2!13258 lt!438672)))))

(declare-fun arrayRangesEq!1661 (array!18521 array!18521 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304968 (arrayRangesEq!1661 a1!948 a2!948 (_1!13258 lt!438672) (_2!13258 lt!438672))))

(declare-fun b!304969 () Bool)

(assert (=> b!304969 (= e!219591 (byteRangesEq!0 (select (arr!9115 a1!948) (_4!603 lt!438671)) (select (arr!9115 a2!948) (_4!603 lt!438671)) #b00000000000000000000000000000000 lt!438675))))

(declare-fun b!304970 () Bool)

(declare-fun e!219597 () Bool)

(assert (=> b!304970 (= e!219595 e!219597)))

(declare-fun res!250760 () Bool)

(assert (=> b!304970 (=> (not res!250760) (not e!219597))))

(assert (=> b!304970 (= res!250760 e!219596)))

(assert (=> b!304970 (= c!14685 (= (_3!1560 lt!438671) (_4!603 lt!438671)))))

(declare-fun lt!438670 () Unit!21283)

(assert (=> b!304970 (= lt!438670 e!219592)))

(declare-fun c!14683 () Bool)

(assert (=> b!304970 (= c!14683 (bvslt (_1!13258 lt!438672) (_2!13258 lt!438672)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1206)

(assert (=> b!304970 (= lt!438672 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304970 (= lt!438675 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304970 (= lt!438673 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304970 (= lt!438671 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304971 () Bool)

(assert (=> b!304971 (= e!219597 (and (bvslt (_4!603 lt!438672) (_4!603 lt!438671)) (bvslt (_3!1560 lt!438671) (_4!603 lt!438672)) (bvsle #b00000000000000000000000000000000 (_1!13258 lt!438671)) (bvsle (_1!13258 lt!438671) (_2!13258 lt!438671)) (bvsgt (_2!13258 lt!438671) (size!8032 a1!948))))))

(declare-fun lt!438678 () Unit!21283)

(assert (=> b!304971 (= lt!438678 e!219593)))

(declare-fun c!14684 () Bool)

(assert (=> b!304971 (= c!14684 (and (bvslt (_3!1560 lt!438671) (_3!1560 lt!438672)) (bvslt (_3!1560 lt!438672) (_4!603 lt!438671))))))

(declare-fun b!304972 () Bool)

(declare-fun e!219589 () Bool)

(assert (=> b!304972 (= e!219589 e!219595)))

(declare-fun res!250764 () Bool)

(assert (=> b!304972 (=> (not res!250764) (not e!219595))))

(assert (=> b!304972 (= res!250764 (and (bvsle toBit!258 lt!438674) (bvsle fromBit!258 lt!438674)))))

(assert (=> b!304972 (= lt!438674 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8032 a1!948))))))

(declare-fun res!250763 () Bool)

(assert (=> start!67932 (=> (not res!250763) (not e!219589))))

(assert (=> start!67932 (= res!250763 (and (bvsle (size!8032 a1!948) (size!8032 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67932 e!219589))

(assert (=> start!67932 true))

(declare-fun array_inv!7644 (array!18521) Bool)

(assert (=> start!67932 (array_inv!7644 a1!948)))

(assert (=> start!67932 (array_inv!7644 a2!948)))

(declare-fun b!304966 () Bool)

(assert (=> b!304966 (= e!219596 call!5714)))

(assert (= (and start!67932 res!250763) b!304972))

(assert (= (and b!304972 res!250764) b!304960))

(assert (= (and b!304960 res!250761) b!304964))

(assert (= (and b!304964 res!250762) b!304970))

(assert (= (and b!304970 c!14683) b!304968))

(assert (= (and b!304970 (not c!14683)) b!304967))

(assert (= (and b!304970 c!14685) b!304966))

(assert (= (and b!304970 (not c!14685)) b!304965))

(assert (= (and b!304965 res!250759) b!304961))

(assert (= (and b!304961 (not res!250758)) b!304969))

(assert (= (or b!304966 b!304965) bm!5711))

(assert (= (and b!304970 res!250760) b!304971))

(assert (= (and b!304971 c!14684) b!304963))

(assert (= (and b!304971 (not c!14684)) b!304962))

(declare-fun m!443427 () Bool)

(assert (=> bm!5711 m!443427))

(declare-fun m!443429 () Bool)

(assert (=> bm!5711 m!443429))

(assert (=> bm!5711 m!443427))

(assert (=> bm!5711 m!443429))

(declare-fun m!443431 () Bool)

(assert (=> bm!5711 m!443431))

(declare-fun m!443433 () Bool)

(assert (=> b!304963 m!443433))

(declare-fun m!443435 () Bool)

(assert (=> b!304963 m!443435))

(declare-fun m!443437 () Bool)

(assert (=> b!304963 m!443437))

(declare-fun m!443439 () Bool)

(assert (=> b!304968 m!443439))

(declare-fun m!443441 () Bool)

(assert (=> b!304968 m!443441))

(declare-fun m!443443 () Bool)

(assert (=> b!304969 m!443443))

(declare-fun m!443445 () Bool)

(assert (=> b!304969 m!443445))

(assert (=> b!304969 m!443443))

(assert (=> b!304969 m!443445))

(declare-fun m!443447 () Bool)

(assert (=> b!304969 m!443447))

(declare-fun m!443449 () Bool)

(assert (=> b!304960 m!443449))

(declare-fun m!443451 () Bool)

(assert (=> start!67932 m!443451))

(declare-fun m!443453 () Bool)

(assert (=> start!67932 m!443453))

(declare-fun m!443455 () Bool)

(assert (=> b!304970 m!443455))

(declare-fun m!443457 () Bool)

(assert (=> b!304970 m!443457))

(push 1)

(assert (not b!304970))

(assert (not bm!5711))

(assert (not b!304960))

(assert (not b!304968))

(assert (not b!304969))

(assert (not start!67932))

(assert (not b!304963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101814 () Bool)

(assert (=> d!101814 (arrayRangesEq!1661 a1!948 a2!948 (_1!13258 lt!438672) (_2!13258 lt!438672))))

(declare-fun lt!438750 () Unit!21283)

(declare-fun choose!586 (array!18521 array!18521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21283)

(assert (=> d!101814 (= lt!438750 (choose!586 a1!948 a2!948 (_1!13258 lt!438671) (_2!13258 lt!438671) (_1!13258 lt!438672) (_2!13258 lt!438672)))))

(assert (=> d!101814 (and (bvsle #b00000000000000000000000000000000 (_1!13258 lt!438671)) (bvsle (_1!13258 lt!438671) (_2!13258 lt!438671)))))

(assert (=> d!101814 (= (arrayRangesEqSlicedLemma!256 a1!948 a2!948 (_1!13258 lt!438671) (_2!13258 lt!438671) (_1!13258 lt!438672) (_2!13258 lt!438672)) lt!438750)))

(declare-fun bs!26236 () Bool)

(assert (= bs!26236 d!101814))

(assert (=> bs!26236 m!443441))

(declare-fun m!443555 () Bool)

(assert (=> bs!26236 m!443555))

(assert (=> b!304968 d!101814))

(declare-fun d!101816 () Bool)

(declare-fun res!250832 () Bool)

(declare-fun e!219687 () Bool)

(assert (=> d!101816 (=> res!250832 e!219687)))

(assert (=> d!101816 (= res!250832 (= (_1!13258 lt!438672) (_2!13258 lt!438672)))))

(assert (=> d!101816 (= (arrayRangesEq!1661 a1!948 a2!948 (_1!13258 lt!438672) (_2!13258 lt!438672)) e!219687)))

(declare-fun b!305082 () Bool)

(declare-fun e!219688 () Bool)

(assert (=> b!305082 (= e!219687 e!219688)))

(declare-fun res!250833 () Bool)

(assert (=> b!305082 (=> (not res!250833) (not e!219688))))

(assert (=> b!305082 (= res!250833 (= (select (arr!9115 a1!948) (_1!13258 lt!438672)) (select (arr!9115 a2!948) (_1!13258 lt!438672))))))

(declare-fun b!305083 () Bool)

(assert (=> b!305083 (= e!219688 (arrayRangesEq!1661 a1!948 a2!948 (bvadd (_1!13258 lt!438672) #b00000000000000000000000000000001) (_2!13258 lt!438672)))))

(assert (= (and d!101816 (not res!250832)) b!305082))

(assert (= (and b!305082 res!250833) b!305083))

(declare-fun m!443557 () Bool)

(assert (=> b!305082 m!443557))

(declare-fun m!443559 () Bool)

(assert (=> b!305082 m!443559))

(declare-fun m!443561 () Bool)

(assert (=> b!305083 m!443561))

(assert (=> b!304968 d!101816))

(declare-fun d!101818 () Bool)

(assert (=> d!101818 (= (array_inv!7644 a1!948) (bvsge (size!8032 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67932 d!101818))

(declare-fun d!101820 () Bool)

(assert (=> d!101820 (= (array_inv!7644 a2!948) (bvsge (size!8032 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67932 d!101820))

(declare-fun d!101822 () Bool)

(assert (=> d!101822 (and (bvsge (_3!1560 lt!438672) #b00000000000000000000000000000000) (bvslt (_3!1560 lt!438672) (size!8032 a1!948)) (bvslt (_3!1560 lt!438672) (size!8032 a2!948)) (= (select (arr!9115 a1!948) (_3!1560 lt!438672)) (select (arr!9115 a2!948) (_3!1560 lt!438672))))))

(declare-fun lt!438753 () Unit!21283)

(declare-fun choose!587 (array!18521 array!18521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21283)

(assert (=> d!101822 (= lt!438753 (choose!587 a1!948 a2!948 (_1!13258 lt!438671) (_3!1560 lt!438672) (_2!13258 lt!438671)))))

(assert (=> d!101822 (and (bvsle #b00000000000000000000000000000000 (_1!13258 lt!438671)) (bvsle (_1!13258 lt!438671) (_2!13258 lt!438671)))))

(assert (=> d!101822 (= (arrayRangesEqImpliesEq!265 a1!948 a2!948 (_1!13258 lt!438671) (_3!1560 lt!438672) (_2!13258 lt!438671)) lt!438753)))

(declare-fun bs!26237 () Bool)

(assert (= bs!26237 d!101822))

(assert (=> bs!26237 m!443435))

(assert (=> bs!26237 m!443437))

(declare-fun m!443563 () Bool)

(assert (=> bs!26237 m!443563))

(assert (=> b!304963 d!101822))

(declare-fun d!101824 () Bool)

(assert (=> d!101824 (= (byteRangesEq!0 (select (arr!9115 a1!948) (_3!1560 lt!438671)) (select (arr!9115 a2!948) (_3!1560 lt!438671)) lt!438673 (ite c!14685 lt!438675 #b00000000000000000000000000000111)) (or (= lt!438673 (ite c!14685 lt!438675 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9115 a1!948) (_3!1560 lt!438671))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14685 lt!438675 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438673)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9115 a2!948) (_3!1560 lt!438671))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14685 lt!438675 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438673)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26238 () Bool)

(assert (= bs!26238 d!101824))

(declare-fun m!443565 () Bool)

(assert (=> bs!26238 m!443565))

(declare-fun m!443567 () Bool)

(assert (=> bs!26238 m!443567))

(assert (=> bm!5711 d!101824))

(declare-fun b!305098 () Bool)

(declare-fun res!250845 () Bool)

(declare-fun lt!438761 () (_ BitVec 32))

(assert (=> b!305098 (= res!250845 (= lt!438761 #b00000000000000000000000000000000))))

(declare-fun e!219703 () Bool)

(assert (=> b!305098 (=> res!250845 e!219703)))

(declare-fun e!219705 () Bool)

(assert (=> b!305098 (= e!219705 e!219703)))

(declare-fun b!305099 () Bool)

(declare-fun call!5726 () Bool)

(assert (=> b!305099 (= e!219703 call!5726)))

(declare-fun b!305100 () Bool)

(declare-fun e!219706 () Bool)

(declare-fun e!219702 () Bool)

(assert (=> b!305100 (= e!219706 e!219702)))

(declare-fun c!14709 () Bool)

(declare-fun lt!438760 () tuple4!1206)

(assert (=> b!305100 (= c!14709 (= (_3!1560 lt!438760) (_4!603 lt!438760)))))

(declare-fun bm!5723 () Bool)

(declare-fun lt!438762 () (_ BitVec 32))

(assert (=> bm!5723 (= call!5726 (byteRangesEq!0 (ite c!14709 (select (arr!9115 a1!948) (_3!1560 lt!438760)) (select (arr!9115 a1!948) (_4!603 lt!438760))) (ite c!14709 (select (arr!9115 a2!948) (_3!1560 lt!438760)) (select (arr!9115 a2!948) (_4!603 lt!438760))) (ite c!14709 lt!438762 #b00000000000000000000000000000000) lt!438761))))

(declare-fun b!305101 () Bool)

(declare-fun e!219701 () Bool)

(assert (=> b!305101 (= e!219701 e!219706)))

(declare-fun res!250846 () Bool)

(assert (=> b!305101 (=> (not res!250846) (not e!219706))))

(declare-fun e!219704 () Bool)

(assert (=> b!305101 (= res!250846 e!219704)))

(declare-fun res!250844 () Bool)

(assert (=> b!305101 (=> res!250844 e!219704)))

(assert (=> b!305101 (= res!250844 (bvsge (_1!13258 lt!438760) (_2!13258 lt!438760)))))

(assert (=> b!305101 (= lt!438761 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305101 (= lt!438762 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305101 (= lt!438760 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305102 () Bool)

(assert (=> b!305102 (= e!219704 (arrayRangesEq!1661 a1!948 a2!948 (_1!13258 lt!438760) (_2!13258 lt!438760)))))

(declare-fun b!305103 () Bool)

(assert (=> b!305103 (= e!219702 e!219705)))

(declare-fun res!250847 () Bool)

(assert (=> b!305103 (= res!250847 (byteRangesEq!0 (select (arr!9115 a1!948) (_3!1560 lt!438760)) (select (arr!9115 a2!948) (_3!1560 lt!438760)) lt!438762 #b00000000000000000000000000001000))))

(assert (=> b!305103 (=> (not res!250847) (not e!219705))))

(declare-fun d!101826 () Bool)

(declare-fun res!250848 () Bool)

(assert (=> d!101826 (=> res!250848 e!219701)))

(assert (=> d!101826 (= res!250848 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101826 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219701)))

(declare-fun b!305104 () Bool)

(assert (=> b!305104 (= e!219702 call!5726)))

(assert (= (and d!101826 (not res!250848)) b!305101))

(assert (= (and b!305101 (not res!250844)) b!305102))

(assert (= (and b!305101 res!250846) b!305100))

(assert (= (and b!305100 c!14709) b!305104))

(assert (= (and b!305100 (not c!14709)) b!305103))

(assert (= (and b!305103 res!250847) b!305098))

(assert (= (and b!305098 (not res!250845)) b!305099))

(assert (= (or b!305104 b!305099) bm!5723))

(declare-fun m!443569 () Bool)

(assert (=> bm!5723 m!443569))

(declare-fun m!443571 () Bool)

(assert (=> bm!5723 m!443571))

(declare-fun m!443573 () Bool)

(assert (=> bm!5723 m!443573))

(declare-fun m!443575 () Bool)

(assert (=> bm!5723 m!443575))

(declare-fun m!443579 () Bool)

(assert (=> bm!5723 m!443579))

(assert (=> b!305101 m!443457))

(declare-fun m!443581 () Bool)

(assert (=> b!305102 m!443581))

(assert (=> b!305103 m!443579))

(assert (=> b!305103 m!443571))

(assert (=> b!305103 m!443579))

(assert (=> b!305103 m!443571))

(declare-fun m!443585 () Bool)

(assert (=> b!305103 m!443585))

(assert (=> b!304960 d!101826))

(declare-fun d!101832 () Bool)

(assert (=> d!101832 (= (byteRangesEq!0 (select (arr!9115 a1!948) (_4!603 lt!438671)) (select (arr!9115 a2!948) (_4!603 lt!438671)) #b00000000000000000000000000000000 lt!438675) (or (= #b00000000000000000000000000000000 lt!438675) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9115 a1!948) (_4!603 lt!438671))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438675))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9115 a2!948) (_4!603 lt!438671))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438675))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26240 () Bool)

(assert (= bs!26240 d!101832))

(declare-fun m!443587 () Bool)

(assert (=> bs!26240 m!443587))

(declare-fun m!443589 () Bool)

(assert (=> bs!26240 m!443589))

(assert (=> b!304969 d!101832))

(declare-fun d!101834 () Bool)

(assert (=> d!101834 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1207 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304970 d!101834))

(declare-fun d!101838 () Bool)

(assert (=> d!101838 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1207 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304970 d!101838))

(push 1)

(assert (not d!101814))

(assert (not b!305102))

(assert (not b!305101))

(assert (not d!101822))

(assert (not bm!5723))

(assert (not b!305083))

(assert (not b!305103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


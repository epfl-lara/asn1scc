; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62432 () Bool)

(assert start!62432)

(declare-fun b!279851 () Bool)

(declare-datatypes ((Unit!19621 0))(
  ( (Unit!19622) )
))
(declare-fun e!199567 () Unit!19621)

(declare-fun Unit!19623 () Unit!19621)

(assert (=> b!279851 (= e!199567 Unit!19623)))

(declare-datatypes ((array!16158 0))(
  ( (array!16159 (arr!7985 (Array (_ BitVec 32) (_ BitVec 8))) (size!6989 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16158)

(declare-fun a2!699 () array!16158)

(declare-datatypes ((tuple4!728 0))(
  ( (tuple4!729 (_1!12439 (_ BitVec 32)) (_2!12439 (_ BitVec 32)) (_3!1144 (_ BitVec 32)) (_4!364 (_ BitVec 32))) )
))
(declare-fun lt!416570 () tuple4!728)

(declare-fun arrayRangesEq!1257 (array!16158 array!16158 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279851 (arrayRangesEq!1257 a1!699 a2!699 (_1!12439 lt!416570) (_2!12439 lt!416570))))

(declare-fun lt!416571 () Unit!19621)

(declare-fun arrayRangesEqSymmetricLemma!164 (array!16158 array!16158 (_ BitVec 32) (_ BitVec 32)) Unit!19621)

(assert (=> b!279851 (= lt!416571 (arrayRangesEqSymmetricLemma!164 a1!699 a2!699 (_1!12439 lt!416570) (_2!12439 lt!416570)))))

(assert (=> b!279851 (arrayRangesEq!1257 a2!699 a1!699 (_1!12439 lt!416570) (_2!12439 lt!416570))))

(declare-fun b!279852 () Bool)

(declare-fun res!232330 () Bool)

(declare-fun e!199568 () Bool)

(assert (=> b!279852 (=> (not res!232330) (not e!199568))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!279852 (= res!232330 (bvslt from!822 to!789))))

(declare-fun b!279854 () Bool)

(declare-fun Unit!19624 () Unit!19621)

(assert (=> b!279854 (= e!199567 Unit!19624)))

(declare-fun b!279855 () Bool)

(declare-fun e!199566 () Bool)

(assert (=> b!279855 (= e!199568 e!199566)))

(declare-fun res!232328 () Bool)

(assert (=> b!279855 (=> (not res!232328) (not e!199566))))

(assert (=> b!279855 (= res!232328 (= (_3!1144 lt!416570) (_4!364 lt!416570)))))

(declare-fun lt!416567 () Unit!19621)

(assert (=> b!279855 (= lt!416567 e!199567)))

(declare-fun c!12933 () Bool)

(assert (=> b!279855 (= c!12933 (bvslt (_1!12439 lt!416570) (_2!12439 lt!416570)))))

(declare-fun lt!416568 () (_ BitVec 32))

(assert (=> b!279855 (= lt!416568 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416569 () (_ BitVec 32))

(assert (=> b!279855 (= lt!416569 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!728)

(assert (=> b!279855 (= lt!416570 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279856 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279856 (= e!199566 (not (byteRangesEq!0 (select (arr!7985 a2!699) (_3!1144 lt!416570)) (select (arr!7985 a1!699) (_3!1144 lt!416570)) lt!416569 lt!416568)))))

(assert (=> b!279856 (byteRangesEq!0 (select (arr!7985 a1!699) (_3!1144 lt!416570)) (select (arr!7985 a2!699) (_3!1144 lt!416570)) lt!416569 lt!416568)))

(declare-fun res!232331 () Bool)

(assert (=> start!62432 (=> (not res!232331) (not e!199568))))

(assert (=> start!62432 (= res!232331 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6989 a1!699) (size!6989 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6989 a1!699))))))))

(assert (=> start!62432 e!199568))

(assert (=> start!62432 true))

(declare-fun array_inv!6713 (array!16158) Bool)

(assert (=> start!62432 (array_inv!6713 a1!699)))

(assert (=> start!62432 (array_inv!6713 a2!699)))

(declare-fun b!279853 () Bool)

(declare-fun res!232329 () Bool)

(assert (=> b!279853 (=> (not res!232329) (not e!199568))))

(declare-fun arrayBitRangesEq!0 (array!16158 array!16158 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279853 (= res!232329 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62432 res!232331) b!279853))

(assert (= (and b!279853 res!232329) b!279852))

(assert (= (and b!279852 res!232330) b!279855))

(assert (= (and b!279855 c!12933) b!279851))

(assert (= (and b!279855 (not c!12933)) b!279854))

(assert (= (and b!279855 res!232328) b!279856))

(declare-fun m!412889 () Bool)

(assert (=> start!62432 m!412889))

(declare-fun m!412891 () Bool)

(assert (=> start!62432 m!412891))

(declare-fun m!412893 () Bool)

(assert (=> b!279853 m!412893))

(declare-fun m!412895 () Bool)

(assert (=> b!279855 m!412895))

(declare-fun m!412897 () Bool)

(assert (=> b!279856 m!412897))

(declare-fun m!412899 () Bool)

(assert (=> b!279856 m!412899))

(assert (=> b!279856 m!412897))

(assert (=> b!279856 m!412899))

(declare-fun m!412901 () Bool)

(assert (=> b!279856 m!412901))

(assert (=> b!279856 m!412899))

(assert (=> b!279856 m!412897))

(declare-fun m!412903 () Bool)

(assert (=> b!279856 m!412903))

(declare-fun m!412905 () Bool)

(assert (=> b!279851 m!412905))

(declare-fun m!412907 () Bool)

(assert (=> b!279851 m!412907))

(declare-fun m!412909 () Bool)

(assert (=> b!279851 m!412909))

(check-sat (not b!279856) (not b!279851) (not start!62432) (not b!279853) (not b!279855))
(check-sat)
(get-model)

(declare-fun d!96238 () Bool)

(assert (=> d!96238 (= (arrayBitIndices!0 from!822 to!789) (tuple4!729 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279855 d!96238))

(declare-fun b!279889 () Bool)

(declare-fun res!232357 () Bool)

(declare-fun lt!416594 () (_ BitVec 32))

(assert (=> b!279889 (= res!232357 (= lt!416594 #b00000000000000000000000000000000))))

(declare-fun e!199597 () Bool)

(assert (=> b!279889 (=> res!232357 e!199597)))

(declare-fun e!199602 () Bool)

(assert (=> b!279889 (= e!199602 e!199597)))

(declare-fun b!279890 () Bool)

(declare-fun e!199600 () Bool)

(declare-fun e!199601 () Bool)

(assert (=> b!279890 (= e!199600 e!199601)))

(declare-fun res!232354 () Bool)

(assert (=> b!279890 (=> (not res!232354) (not e!199601))))

(declare-fun e!199599 () Bool)

(assert (=> b!279890 (= res!232354 e!199599)))

(declare-fun res!232356 () Bool)

(assert (=> b!279890 (=> res!232356 e!199599)))

(declare-fun lt!416595 () tuple4!728)

(assert (=> b!279890 (= res!232356 (bvsge (_1!12439 lt!416595) (_2!12439 lt!416595)))))

(assert (=> b!279890 (= lt!416594 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416593 () (_ BitVec 32))

(assert (=> b!279890 (= lt!416593 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279890 (= lt!416595 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279891 () Bool)

(declare-fun call!4592 () Bool)

(assert (=> b!279891 (= e!199597 call!4592)))

(declare-fun b!279893 () Bool)

(declare-fun e!199598 () Bool)

(assert (=> b!279893 (= e!199601 e!199598)))

(declare-fun c!12939 () Bool)

(assert (=> b!279893 (= c!12939 (= (_3!1144 lt!416595) (_4!364 lt!416595)))))

(declare-fun bm!4589 () Bool)

(assert (=> bm!4589 (= call!4592 (byteRangesEq!0 (ite c!12939 (select (arr!7985 a1!699) (_3!1144 lt!416595)) (select (arr!7985 a1!699) (_4!364 lt!416595))) (ite c!12939 (select (arr!7985 a2!699) (_3!1144 lt!416595)) (select (arr!7985 a2!699) (_4!364 lt!416595))) (ite c!12939 lt!416593 #b00000000000000000000000000000000) lt!416594))))

(declare-fun b!279894 () Bool)

(assert (=> b!279894 (= e!199598 call!4592)))

(declare-fun b!279895 () Bool)

(assert (=> b!279895 (= e!199598 e!199602)))

(declare-fun res!232355 () Bool)

(assert (=> b!279895 (= res!232355 (byteRangesEq!0 (select (arr!7985 a1!699) (_3!1144 lt!416595)) (select (arr!7985 a2!699) (_3!1144 lt!416595)) lt!416593 #b00000000000000000000000000001000))))

(assert (=> b!279895 (=> (not res!232355) (not e!199602))))

(declare-fun d!96240 () Bool)

(declare-fun res!232358 () Bool)

(assert (=> d!96240 (=> res!232358 e!199600)))

(assert (=> d!96240 (= res!232358 (bvsge from!822 to!789))))

(assert (=> d!96240 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199600)))

(declare-fun b!279892 () Bool)

(assert (=> b!279892 (= e!199599 (arrayRangesEq!1257 a1!699 a2!699 (_1!12439 lt!416595) (_2!12439 lt!416595)))))

(assert (= (and d!96240 (not res!232358)) b!279890))

(assert (= (and b!279890 (not res!232356)) b!279892))

(assert (= (and b!279890 res!232354) b!279893))

(assert (= (and b!279893 c!12939) b!279894))

(assert (= (and b!279893 (not c!12939)) b!279895))

(assert (= (and b!279895 res!232355) b!279889))

(assert (= (and b!279889 (not res!232357)) b!279891))

(assert (= (or b!279894 b!279891) bm!4589))

(assert (=> b!279890 m!412895))

(declare-fun m!412933 () Bool)

(assert (=> bm!4589 m!412933))

(declare-fun m!412935 () Bool)

(assert (=> bm!4589 m!412935))

(declare-fun m!412937 () Bool)

(assert (=> bm!4589 m!412937))

(declare-fun m!412939 () Bool)

(assert (=> bm!4589 m!412939))

(declare-fun m!412941 () Bool)

(assert (=> bm!4589 m!412941))

(assert (=> b!279895 m!412933))

(assert (=> b!279895 m!412941))

(assert (=> b!279895 m!412933))

(assert (=> b!279895 m!412941))

(declare-fun m!412943 () Bool)

(assert (=> b!279895 m!412943))

(declare-fun m!412945 () Bool)

(assert (=> b!279892 m!412945))

(assert (=> b!279853 d!96240))

(declare-fun d!96242 () Bool)

(assert (=> d!96242 (= (array_inv!6713 a1!699) (bvsge (size!6989 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62432 d!96242))

(declare-fun d!96244 () Bool)

(assert (=> d!96244 (= (array_inv!6713 a2!699) (bvsge (size!6989 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62432 d!96244))

(declare-fun d!96246 () Bool)

(declare-fun res!232363 () Bool)

(declare-fun e!199607 () Bool)

(assert (=> d!96246 (=> res!232363 e!199607)))

(assert (=> d!96246 (= res!232363 (= (_1!12439 lt!416570) (_2!12439 lt!416570)))))

(assert (=> d!96246 (= (arrayRangesEq!1257 a1!699 a2!699 (_1!12439 lt!416570) (_2!12439 lt!416570)) e!199607)))

(declare-fun b!279900 () Bool)

(declare-fun e!199608 () Bool)

(assert (=> b!279900 (= e!199607 e!199608)))

(declare-fun res!232364 () Bool)

(assert (=> b!279900 (=> (not res!232364) (not e!199608))))

(assert (=> b!279900 (= res!232364 (= (select (arr!7985 a1!699) (_1!12439 lt!416570)) (select (arr!7985 a2!699) (_1!12439 lt!416570))))))

(declare-fun b!279901 () Bool)

(assert (=> b!279901 (= e!199608 (arrayRangesEq!1257 a1!699 a2!699 (bvadd (_1!12439 lt!416570) #b00000000000000000000000000000001) (_2!12439 lt!416570)))))

(assert (= (and d!96246 (not res!232363)) b!279900))

(assert (= (and b!279900 res!232364) b!279901))

(declare-fun m!412947 () Bool)

(assert (=> b!279900 m!412947))

(declare-fun m!412949 () Bool)

(assert (=> b!279900 m!412949))

(declare-fun m!412951 () Bool)

(assert (=> b!279901 m!412951))

(assert (=> b!279851 d!96246))

(declare-fun d!96248 () Bool)

(assert (=> d!96248 (arrayRangesEq!1257 a2!699 a1!699 (_1!12439 lt!416570) (_2!12439 lt!416570))))

(declare-fun lt!416598 () Unit!19621)

(declare-fun choose!473 (array!16158 array!16158 (_ BitVec 32) (_ BitVec 32)) Unit!19621)

(assert (=> d!96248 (= lt!416598 (choose!473 a1!699 a2!699 (_1!12439 lt!416570) (_2!12439 lt!416570)))))

(assert (=> d!96248 (and (bvsle #b00000000000000000000000000000000 (_1!12439 lt!416570)) (bvsle (_1!12439 lt!416570) (_2!12439 lt!416570)) (bvsle (_2!12439 lt!416570) (size!6989 a1!699)))))

(assert (=> d!96248 (= (arrayRangesEqSymmetricLemma!164 a1!699 a2!699 (_1!12439 lt!416570) (_2!12439 lt!416570)) lt!416598)))

(declare-fun bs!24278 () Bool)

(assert (= bs!24278 d!96248))

(assert (=> bs!24278 m!412909))

(declare-fun m!412953 () Bool)

(assert (=> bs!24278 m!412953))

(assert (=> b!279851 d!96248))

(declare-fun d!96250 () Bool)

(declare-fun res!232365 () Bool)

(declare-fun e!199609 () Bool)

(assert (=> d!96250 (=> res!232365 e!199609)))

(assert (=> d!96250 (= res!232365 (= (_1!12439 lt!416570) (_2!12439 lt!416570)))))

(assert (=> d!96250 (= (arrayRangesEq!1257 a2!699 a1!699 (_1!12439 lt!416570) (_2!12439 lt!416570)) e!199609)))

(declare-fun b!279902 () Bool)

(declare-fun e!199610 () Bool)

(assert (=> b!279902 (= e!199609 e!199610)))

(declare-fun res!232366 () Bool)

(assert (=> b!279902 (=> (not res!232366) (not e!199610))))

(assert (=> b!279902 (= res!232366 (= (select (arr!7985 a2!699) (_1!12439 lt!416570)) (select (arr!7985 a1!699) (_1!12439 lt!416570))))))

(declare-fun b!279903 () Bool)

(assert (=> b!279903 (= e!199610 (arrayRangesEq!1257 a2!699 a1!699 (bvadd (_1!12439 lt!416570) #b00000000000000000000000000000001) (_2!12439 lt!416570)))))

(assert (= (and d!96250 (not res!232365)) b!279902))

(assert (= (and b!279902 res!232366) b!279903))

(assert (=> b!279902 m!412949))

(assert (=> b!279902 m!412947))

(declare-fun m!412955 () Bool)

(assert (=> b!279903 m!412955))

(assert (=> b!279851 d!96250))

(declare-fun d!96252 () Bool)

(assert (=> d!96252 (= (byteRangesEq!0 (select (arr!7985 a2!699) (_3!1144 lt!416570)) (select (arr!7985 a1!699) (_3!1144 lt!416570)) lt!416569 lt!416568) (or (= lt!416569 lt!416568) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7985 a2!699) (_3!1144 lt!416570))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416568))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416569)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7985 a1!699) (_3!1144 lt!416570))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416568))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416569)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24279 () Bool)

(assert (= bs!24279 d!96252))

(declare-fun m!412957 () Bool)

(assert (=> bs!24279 m!412957))

(declare-fun m!412959 () Bool)

(assert (=> bs!24279 m!412959))

(assert (=> b!279856 d!96252))

(declare-fun d!96254 () Bool)

(assert (=> d!96254 (= (byteRangesEq!0 (select (arr!7985 a1!699) (_3!1144 lt!416570)) (select (arr!7985 a2!699) (_3!1144 lt!416570)) lt!416569 lt!416568) (or (= lt!416569 lt!416568) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7985 a1!699) (_3!1144 lt!416570))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416568))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416569)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7985 a2!699) (_3!1144 lt!416570))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416568))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416569)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24280 () Bool)

(assert (= bs!24280 d!96254))

(assert (=> bs!24280 m!412957))

(assert (=> bs!24280 m!412959))

(assert (=> b!279856 d!96254))

(check-sat (not bm!4589) (not b!279890) (not b!279901) (not b!279903) (not d!96248) (not b!279895) (not b!279892))
(check-sat)

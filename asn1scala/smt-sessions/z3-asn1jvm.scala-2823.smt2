; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68270 () Bool)

(assert start!68270)

(declare-fun b!306521 () Bool)

(declare-fun res!251710 () Bool)

(declare-fun lt!439684 () (_ BitVec 32))

(assert (=> b!306521 (= res!251710 (= lt!439684 #b00000000000000000000000000000000))))

(declare-fun e!220836 () Bool)

(assert (=> b!306521 (=> res!251710 e!220836)))

(declare-fun e!220842 () Bool)

(assert (=> b!306521 (= e!220842 e!220836)))

(declare-fun b!306522 () Bool)

(declare-datatypes ((Unit!21384 0))(
  ( (Unit!21385) )
))
(declare-fun e!220844 () Unit!21384)

(declare-fun lt!439686 () Unit!21384)

(assert (=> b!306522 (= e!220844 lt!439686)))

(declare-datatypes ((array!18586 0))(
  ( (array!18587 (arr!9137 (Array (_ BitVec 32) (_ BitVec 8))) (size!8054 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18586)

(declare-fun a2!948 () array!18586)

(declare-datatypes ((tuple4!1250 0))(
  ( (tuple4!1251 (_1!13280 (_ BitVec 32)) (_2!13280 (_ BitVec 32)) (_3!1582 (_ BitVec 32)) (_4!625 (_ BitVec 32))) )
))
(declare-fun lt!439687 () tuple4!1250)

(declare-fun lt!439692 () tuple4!1250)

(declare-fun arrayRangesEqImpliesEq!287 (array!18586 array!18586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21384)

(assert (=> b!306522 (= lt!439686 (arrayRangesEqImpliesEq!287 a1!948 a2!948 (_1!13280 lt!439687) (_3!1582 lt!439692) (_2!13280 lt!439687)))))

(assert (=> b!306522 (= (select (arr!9137 a1!948) (_3!1582 lt!439692)) (select (arr!9137 a2!948) (_3!1582 lt!439692)))))

(declare-fun b!306523 () Bool)

(declare-fun e!220845 () Unit!21384)

(declare-fun lt!439690 () Unit!21384)

(assert (=> b!306523 (= e!220845 lt!439690)))

(declare-fun arrayRangesEqSlicedLemma!278 (array!18586 array!18586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21384)

(assert (=> b!306523 (= lt!439690 (arrayRangesEqSlicedLemma!278 a1!948 a2!948 (_1!13280 lt!439687) (_2!13280 lt!439687) (_1!13280 lt!439692) (_2!13280 lt!439692)))))

(declare-fun arrayRangesEq!1683 (array!18586 array!18586 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306523 (arrayRangesEq!1683 a1!948 a2!948 (_1!13280 lt!439692) (_2!13280 lt!439692))))

(declare-fun b!306524 () Bool)

(declare-fun e!220837 () Bool)

(declare-fun call!5846 () Bool)

(assert (=> b!306524 (= e!220837 call!5846)))

(declare-fun b!306525 () Bool)

(assert (=> b!306525 (= e!220837 e!220842)))

(declare-fun res!251711 () Bool)

(declare-fun lt!439689 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306525 (= res!251711 (byteRangesEq!0 (select (arr!9137 a1!948) (_3!1582 lt!439687)) (select (arr!9137 a2!948) (_3!1582 lt!439687)) lt!439689 #b00000000000000000000000000000111))))

(assert (=> b!306525 (=> (not res!251711) (not e!220842))))

(declare-fun b!306526 () Bool)

(declare-fun res!251713 () Bool)

(declare-fun e!220839 () Bool)

(assert (=> b!306526 (=> (not res!251713) (not e!220839))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!439685 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!306526 (= res!251713 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439685) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306527 () Bool)

(declare-fun Unit!21386 () Unit!21384)

(assert (=> b!306527 (= e!220844 Unit!21386)))

(declare-fun b!306528 () Bool)

(declare-fun e!220838 () Bool)

(assert (=> b!306528 (= e!220838 (and (not (= (_3!1582 lt!439692) (_4!625 lt!439692))) (or (bvslt (_3!1582 lt!439692) #b00000000000000000000000000000000) (bvsge (_3!1582 lt!439692) (size!8054 a2!948)))))))

(declare-fun lt!439682 () Unit!21384)

(declare-fun e!220841 () Unit!21384)

(assert (=> b!306528 (= lt!439682 e!220841)))

(declare-fun c!14991 () Bool)

(assert (=> b!306528 (= c!14991 (and (bvslt (_4!625 lt!439692) (_4!625 lt!439687)) (bvslt (_3!1582 lt!439687) (_4!625 lt!439692))))))

(declare-fun lt!439691 () Unit!21384)

(assert (=> b!306528 (= lt!439691 e!220844)))

(declare-fun c!14988 () Bool)

(assert (=> b!306528 (= c!14988 (and (bvslt (_3!1582 lt!439687) (_3!1582 lt!439692)) (bvslt (_3!1582 lt!439692) (_4!625 lt!439687))))))

(declare-fun b!306529 () Bool)

(assert (=> b!306529 (= e!220839 e!220838)))

(declare-fun res!251715 () Bool)

(assert (=> b!306529 (=> (not res!251715) (not e!220838))))

(assert (=> b!306529 (= res!251715 e!220837)))

(declare-fun c!14990 () Bool)

(assert (=> b!306529 (= c!14990 (= (_3!1582 lt!439687) (_4!625 lt!439687)))))

(declare-fun lt!439683 () Unit!21384)

(assert (=> b!306529 (= lt!439683 e!220845)))

(declare-fun c!14989 () Bool)

(assert (=> b!306529 (= c!14989 (bvslt (_1!13280 lt!439692) (_2!13280 lt!439692)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1250)

(assert (=> b!306529 (= lt!439692 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306529 (= lt!439684 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306529 (= lt!439689 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306529 (= lt!439687 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306530 () Bool)

(declare-fun lt!439688 () Unit!21384)

(assert (=> b!306530 (= e!220841 lt!439688)))

(assert (=> b!306530 (= lt!439688 (arrayRangesEqImpliesEq!287 a1!948 a2!948 (_1!13280 lt!439687) (_4!625 lt!439692) (_2!13280 lt!439687)))))

(assert (=> b!306530 (= (select (arr!9137 a1!948) (_4!625 lt!439692)) (select (arr!9137 a2!948) (_4!625 lt!439692)))))

(declare-fun b!306531 () Bool)

(declare-fun res!251714 () Bool)

(assert (=> b!306531 (=> (not res!251714) (not e!220839))))

(declare-fun arrayBitRangesEq!0 (array!18586 array!18586 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306531 (= res!251714 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306532 () Bool)

(declare-fun Unit!21387 () Unit!21384)

(assert (=> b!306532 (= e!220845 Unit!21387)))

(declare-fun b!306533 () Bool)

(assert (=> b!306533 (= e!220836 call!5846)))

(declare-fun res!251712 () Bool)

(declare-fun e!220840 () Bool)

(assert (=> start!68270 (=> (not res!251712) (not e!220840))))

(assert (=> start!68270 (= res!251712 (and (bvsle (size!8054 a1!948) (size!8054 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68270 e!220840))

(assert (=> start!68270 true))

(declare-fun array_inv!7666 (array!18586) Bool)

(assert (=> start!68270 (array_inv!7666 a1!948)))

(assert (=> start!68270 (array_inv!7666 a2!948)))

(declare-fun bm!5843 () Bool)

(assert (=> bm!5843 (= call!5846 (byteRangesEq!0 (ite c!14990 (select (arr!9137 a1!948) (_3!1582 lt!439687)) (select (arr!9137 a1!948) (_4!625 lt!439687))) (ite c!14990 (select (arr!9137 a2!948) (_3!1582 lt!439687)) (select (arr!9137 a2!948) (_4!625 lt!439687))) (ite c!14990 lt!439689 #b00000000000000000000000000000000) lt!439684))))

(declare-fun b!306534 () Bool)

(declare-fun Unit!21388 () Unit!21384)

(assert (=> b!306534 (= e!220841 Unit!21388)))

(declare-fun b!306535 () Bool)

(assert (=> b!306535 (= e!220840 e!220839)))

(declare-fun res!251709 () Bool)

(assert (=> b!306535 (=> (not res!251709) (not e!220839))))

(assert (=> b!306535 (= res!251709 (and (bvsle toBit!258 lt!439685) (bvsle fromBit!258 lt!439685)))))

(assert (=> b!306535 (= lt!439685 (bvmul ((_ sign_extend 32) (size!8054 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and start!68270 res!251712) b!306535))

(assert (= (and b!306535 res!251709) b!306531))

(assert (= (and b!306531 res!251714) b!306526))

(assert (= (and b!306526 res!251713) b!306529))

(assert (= (and b!306529 c!14989) b!306523))

(assert (= (and b!306529 (not c!14989)) b!306532))

(assert (= (and b!306529 c!14990) b!306524))

(assert (= (and b!306529 (not c!14990)) b!306525))

(assert (= (and b!306525 res!251711) b!306521))

(assert (= (and b!306521 (not res!251710)) b!306533))

(assert (= (or b!306524 b!306533) bm!5843))

(assert (= (and b!306529 res!251715) b!306528))

(assert (= (and b!306528 c!14988) b!306522))

(assert (= (and b!306528 (not c!14988)) b!306527))

(assert (= (and b!306528 c!14991) b!306530))

(assert (= (and b!306528 (not c!14991)) b!306534))

(declare-fun m!444995 () Bool)

(assert (=> b!306522 m!444995))

(declare-fun m!444997 () Bool)

(assert (=> b!306522 m!444997))

(declare-fun m!444999 () Bool)

(assert (=> b!306522 m!444999))

(declare-fun m!445001 () Bool)

(assert (=> b!306530 m!445001))

(declare-fun m!445003 () Bool)

(assert (=> b!306530 m!445003))

(declare-fun m!445005 () Bool)

(assert (=> b!306530 m!445005))

(declare-fun m!445007 () Bool)

(assert (=> b!306529 m!445007))

(declare-fun m!445009 () Bool)

(assert (=> b!306529 m!445009))

(declare-fun m!445011 () Bool)

(assert (=> b!306525 m!445011))

(declare-fun m!445013 () Bool)

(assert (=> b!306525 m!445013))

(assert (=> b!306525 m!445011))

(assert (=> b!306525 m!445013))

(declare-fun m!445015 () Bool)

(assert (=> b!306525 m!445015))

(declare-fun m!445017 () Bool)

(assert (=> start!68270 m!445017))

(declare-fun m!445019 () Bool)

(assert (=> start!68270 m!445019))

(declare-fun m!445021 () Bool)

(assert (=> b!306531 m!445021))

(declare-fun m!445023 () Bool)

(assert (=> b!306523 m!445023))

(declare-fun m!445025 () Bool)

(assert (=> b!306523 m!445025))

(assert (=> bm!5843 m!445011))

(declare-fun m!445027 () Bool)

(assert (=> bm!5843 m!445027))

(declare-fun m!445029 () Bool)

(assert (=> bm!5843 m!445029))

(declare-fun m!445031 () Bool)

(assert (=> bm!5843 m!445031))

(assert (=> bm!5843 m!445013))

(check-sat (not b!306529) (not b!306530) (not b!306525) (not bm!5843) (not b!306522) (not start!68270) (not b!306523) (not b!306531))
(check-sat)
(get-model)

(declare-fun b!306595 () Bool)

(declare-fun e!220897 () Bool)

(declare-fun e!220894 () Bool)

(assert (=> b!306595 (= e!220897 e!220894)))

(declare-fun lt!439732 () tuple4!1250)

(declare-fun res!251749 () Bool)

(declare-fun lt!439734 () (_ BitVec 32))

(assert (=> b!306595 (= res!251749 (byteRangesEq!0 (select (arr!9137 a1!948) (_3!1582 lt!439732)) (select (arr!9137 a2!948) (_3!1582 lt!439732)) lt!439734 #b00000000000000000000000000001000))))

(assert (=> b!306595 (=> (not res!251749) (not e!220894))))

(declare-fun d!102270 () Bool)

(declare-fun res!251750 () Bool)

(declare-fun e!220896 () Bool)

(assert (=> d!102270 (=> res!251750 e!220896)))

(assert (=> d!102270 (= res!251750 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102270 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220896)))

(declare-fun b!306596 () Bool)

(declare-fun e!220893 () Bool)

(assert (=> b!306596 (= e!220896 e!220893)))

(declare-fun res!251748 () Bool)

(assert (=> b!306596 (=> (not res!251748) (not e!220893))))

(declare-fun e!220895 () Bool)

(assert (=> b!306596 (= res!251748 e!220895)))

(declare-fun res!251751 () Bool)

(assert (=> b!306596 (=> res!251751 e!220895)))

(assert (=> b!306596 (= res!251751 (bvsge (_1!13280 lt!439732) (_2!13280 lt!439732)))))

(declare-fun lt!439733 () (_ BitVec 32))

(assert (=> b!306596 (= lt!439733 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306596 (= lt!439734 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306596 (= lt!439732 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306597 () Bool)

(assert (=> b!306597 (= e!220895 (arrayRangesEq!1683 a1!948 a2!948 (_1!13280 lt!439732) (_2!13280 lt!439732)))))

(declare-fun b!306598 () Bool)

(assert (=> b!306598 (= e!220893 e!220897)))

(declare-fun c!15006 () Bool)

(assert (=> b!306598 (= c!15006 (= (_3!1582 lt!439732) (_4!625 lt!439732)))))

(declare-fun b!306599 () Bool)

(declare-fun call!5852 () Bool)

(assert (=> b!306599 (= e!220897 call!5852)))

(declare-fun b!306600 () Bool)

(declare-fun res!251747 () Bool)

(assert (=> b!306600 (= res!251747 (= lt!439733 #b00000000000000000000000000000000))))

(declare-fun e!220892 () Bool)

(assert (=> b!306600 (=> res!251747 e!220892)))

(assert (=> b!306600 (= e!220894 e!220892)))

(declare-fun bm!5849 () Bool)

(assert (=> bm!5849 (= call!5852 (byteRangesEq!0 (ite c!15006 (select (arr!9137 a1!948) (_3!1582 lt!439732)) (select (arr!9137 a1!948) (_4!625 lt!439732))) (ite c!15006 (select (arr!9137 a2!948) (_3!1582 lt!439732)) (select (arr!9137 a2!948) (_4!625 lt!439732))) (ite c!15006 lt!439734 #b00000000000000000000000000000000) lt!439733))))

(declare-fun b!306601 () Bool)

(assert (=> b!306601 (= e!220892 call!5852)))

(assert (= (and d!102270 (not res!251750)) b!306596))

(assert (= (and b!306596 (not res!251751)) b!306597))

(assert (= (and b!306596 res!251748) b!306598))

(assert (= (and b!306598 c!15006) b!306599))

(assert (= (and b!306598 (not c!15006)) b!306595))

(assert (= (and b!306595 res!251749) b!306600))

(assert (= (and b!306600 (not res!251747)) b!306601))

(assert (= (or b!306599 b!306601) bm!5849))

(declare-fun m!445071 () Bool)

(assert (=> b!306595 m!445071))

(declare-fun m!445073 () Bool)

(assert (=> b!306595 m!445073))

(assert (=> b!306595 m!445071))

(assert (=> b!306595 m!445073))

(declare-fun m!445075 () Bool)

(assert (=> b!306595 m!445075))

(assert (=> b!306596 m!445009))

(declare-fun m!445077 () Bool)

(assert (=> b!306597 m!445077))

(declare-fun m!445079 () Bool)

(assert (=> bm!5849 m!445079))

(assert (=> bm!5849 m!445071))

(declare-fun m!445081 () Bool)

(assert (=> bm!5849 m!445081))

(declare-fun m!445083 () Bool)

(assert (=> bm!5849 m!445083))

(assert (=> bm!5849 m!445073))

(assert (=> b!306531 d!102270))

(declare-fun d!102272 () Bool)

(assert (=> d!102272 (= (byteRangesEq!0 (ite c!14990 (select (arr!9137 a1!948) (_3!1582 lt!439687)) (select (arr!9137 a1!948) (_4!625 lt!439687))) (ite c!14990 (select (arr!9137 a2!948) (_3!1582 lt!439687)) (select (arr!9137 a2!948) (_4!625 lt!439687))) (ite c!14990 lt!439689 #b00000000000000000000000000000000) lt!439684) (or (= (ite c!14990 lt!439689 #b00000000000000000000000000000000) lt!439684) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14990 (select (arr!9137 a1!948) (_3!1582 lt!439687)) (select (arr!9137 a1!948) (_4!625 lt!439687)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439684))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14990 lt!439689 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14990 (select (arr!9137 a2!948) (_3!1582 lt!439687)) (select (arr!9137 a2!948) (_4!625 lt!439687)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439684))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14990 lt!439689 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26352 () Bool)

(assert (= bs!26352 d!102272))

(declare-fun m!445085 () Bool)

(assert (=> bs!26352 m!445085))

(declare-fun m!445087 () Bool)

(assert (=> bs!26352 m!445087))

(assert (=> bm!5843 d!102272))

(declare-fun d!102274 () Bool)

(assert (=> d!102274 (and (bvsge (_3!1582 lt!439692) #b00000000000000000000000000000000) (bvslt (_3!1582 lt!439692) (size!8054 a1!948)) (bvslt (_3!1582 lt!439692) (size!8054 a2!948)) (= (select (arr!9137 a1!948) (_3!1582 lt!439692)) (select (arr!9137 a2!948) (_3!1582 lt!439692))))))

(declare-fun lt!439737 () Unit!21384)

(declare-fun choose!626 (array!18586 array!18586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21384)

(assert (=> d!102274 (= lt!439737 (choose!626 a1!948 a2!948 (_1!13280 lt!439687) (_3!1582 lt!439692) (_2!13280 lt!439687)))))

(assert (=> d!102274 (and (bvsle #b00000000000000000000000000000000 (_1!13280 lt!439687)) (bvsle (_1!13280 lt!439687) (_2!13280 lt!439687)))))

(assert (=> d!102274 (= (arrayRangesEqImpliesEq!287 a1!948 a2!948 (_1!13280 lt!439687) (_3!1582 lt!439692) (_2!13280 lt!439687)) lt!439737)))

(declare-fun bs!26353 () Bool)

(assert (= bs!26353 d!102274))

(assert (=> bs!26353 m!444997))

(assert (=> bs!26353 m!444999))

(declare-fun m!445089 () Bool)

(assert (=> bs!26353 m!445089))

(assert (=> b!306522 d!102274))

(declare-fun d!102276 () Bool)

(assert (=> d!102276 (arrayRangesEq!1683 a1!948 a2!948 (_1!13280 lt!439692) (_2!13280 lt!439692))))

(declare-fun lt!439740 () Unit!21384)

(declare-fun choose!627 (array!18586 array!18586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21384)

(assert (=> d!102276 (= lt!439740 (choose!627 a1!948 a2!948 (_1!13280 lt!439687) (_2!13280 lt!439687) (_1!13280 lt!439692) (_2!13280 lt!439692)))))

(assert (=> d!102276 (and (bvsle #b00000000000000000000000000000000 (_1!13280 lt!439687)) (bvsle (_1!13280 lt!439687) (_2!13280 lt!439687)))))

(assert (=> d!102276 (= (arrayRangesEqSlicedLemma!278 a1!948 a2!948 (_1!13280 lt!439687) (_2!13280 lt!439687) (_1!13280 lt!439692) (_2!13280 lt!439692)) lt!439740)))

(declare-fun bs!26354 () Bool)

(assert (= bs!26354 d!102276))

(assert (=> bs!26354 m!445025))

(declare-fun m!445091 () Bool)

(assert (=> bs!26354 m!445091))

(assert (=> b!306523 d!102276))

(declare-fun d!102280 () Bool)

(declare-fun res!251756 () Bool)

(declare-fun e!220902 () Bool)

(assert (=> d!102280 (=> res!251756 e!220902)))

(assert (=> d!102280 (= res!251756 (= (_1!13280 lt!439692) (_2!13280 lt!439692)))))

(assert (=> d!102280 (= (arrayRangesEq!1683 a1!948 a2!948 (_1!13280 lt!439692) (_2!13280 lt!439692)) e!220902)))

(declare-fun b!306606 () Bool)

(declare-fun e!220903 () Bool)

(assert (=> b!306606 (= e!220902 e!220903)))

(declare-fun res!251757 () Bool)

(assert (=> b!306606 (=> (not res!251757) (not e!220903))))

(assert (=> b!306606 (= res!251757 (= (select (arr!9137 a1!948) (_1!13280 lt!439692)) (select (arr!9137 a2!948) (_1!13280 lt!439692))))))

(declare-fun b!306607 () Bool)

(assert (=> b!306607 (= e!220903 (arrayRangesEq!1683 a1!948 a2!948 (bvadd (_1!13280 lt!439692) #b00000000000000000000000000000001) (_2!13280 lt!439692)))))

(assert (= (and d!102280 (not res!251756)) b!306606))

(assert (= (and b!306606 res!251757) b!306607))

(declare-fun m!445095 () Bool)

(assert (=> b!306606 m!445095))

(declare-fun m!445097 () Bool)

(assert (=> b!306606 m!445097))

(declare-fun m!445099 () Bool)

(assert (=> b!306607 m!445099))

(assert (=> b!306523 d!102280))

(declare-fun d!102284 () Bool)

(assert (=> d!102284 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1251 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306529 d!102284))

(declare-fun d!102288 () Bool)

(assert (=> d!102288 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1251 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306529 d!102288))

(declare-fun d!102290 () Bool)

(assert (=> d!102290 (and (bvsge (_4!625 lt!439692) #b00000000000000000000000000000000) (bvslt (_4!625 lt!439692) (size!8054 a1!948)) (bvslt (_4!625 lt!439692) (size!8054 a2!948)) (= (select (arr!9137 a1!948) (_4!625 lt!439692)) (select (arr!9137 a2!948) (_4!625 lt!439692))))))

(declare-fun lt!439744 () Unit!21384)

(assert (=> d!102290 (= lt!439744 (choose!626 a1!948 a2!948 (_1!13280 lt!439687) (_4!625 lt!439692) (_2!13280 lt!439687)))))

(assert (=> d!102290 (and (bvsle #b00000000000000000000000000000000 (_1!13280 lt!439687)) (bvsle (_1!13280 lt!439687) (_2!13280 lt!439687)))))

(assert (=> d!102290 (= (arrayRangesEqImpliesEq!287 a1!948 a2!948 (_1!13280 lt!439687) (_4!625 lt!439692) (_2!13280 lt!439687)) lt!439744)))

(declare-fun bs!26356 () Bool)

(assert (= bs!26356 d!102290))

(assert (=> bs!26356 m!445003))

(assert (=> bs!26356 m!445005))

(declare-fun m!445107 () Bool)

(assert (=> bs!26356 m!445107))

(assert (=> b!306530 d!102290))

(declare-fun d!102292 () Bool)

(assert (=> d!102292 (= (array_inv!7666 a1!948) (bvsge (size!8054 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68270 d!102292))

(declare-fun d!102294 () Bool)

(assert (=> d!102294 (= (array_inv!7666 a2!948) (bvsge (size!8054 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68270 d!102294))

(declare-fun d!102296 () Bool)

(assert (=> d!102296 (= (byteRangesEq!0 (select (arr!9137 a1!948) (_3!1582 lt!439687)) (select (arr!9137 a2!948) (_3!1582 lt!439687)) lt!439689 #b00000000000000000000000000000111) (or (= lt!439689 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9137 a1!948) (_3!1582 lt!439687))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439689)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9137 a2!948) (_3!1582 lt!439687))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439689)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26357 () Bool)

(assert (= bs!26357 d!102296))

(declare-fun m!445109 () Bool)

(assert (=> bs!26357 m!445109))

(declare-fun m!445111 () Bool)

(assert (=> bs!26357 m!445111))

(assert (=> b!306525 d!102296))

(check-sat (not d!102290) (not bm!5849) (not d!102276) (not b!306597) (not b!306596) (not b!306607) (not d!102274) (not b!306595))
(check-sat)

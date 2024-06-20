; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62714 () Bool)

(assert start!62714)

(declare-fun b!280850 () Bool)

(declare-fun lt!417051 () (_ BitVec 32))

(declare-datatypes ((array!16221 0))(
  ( (array!16222 (arr!8006 (Array (_ BitVec 32) (_ BitVec 8))) (size!7010 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16221)

(declare-fun e!200437 () Bool)

(declare-datatypes ((tuple4!770 0))(
  ( (tuple4!771 (_1!12460 (_ BitVec 32)) (_2!12460 (_ BitVec 32)) (_3!1165 (_ BitVec 32)) (_4!385 (_ BitVec 32))) )
))
(declare-fun lt!417049 () tuple4!770)

(declare-fun a2!699 () array!16221)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280850 (= e!200437 (not (byteRangesEq!0 (select (arr!8006 a2!699) (_3!1165 lt!417049)) (select (arr!8006 a1!699) (_3!1165 lt!417049)) lt!417051 #b00000000000000000000000000001000)))))

(assert (=> b!280850 (byteRangesEq!0 (select (arr!8006 a1!699) (_3!1165 lt!417049)) (select (arr!8006 a2!699) (_3!1165 lt!417049)) lt!417051 #b00000000000000000000000000001000)))

(declare-fun b!280851 () Bool)

(declare-fun res!233072 () Bool)

(declare-fun e!200439 () Bool)

(assert (=> b!280851 (=> (not res!233072) (not e!200439))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!280851 (= res!233072 (bvslt from!822 to!789))))

(declare-fun b!280852 () Bool)

(assert (=> b!280852 (= e!200439 e!200437)))

(declare-fun res!233070 () Bool)

(assert (=> b!280852 (=> (not res!233070) (not e!200437))))

(assert (=> b!280852 (= res!233070 (not (= (_3!1165 lt!417049) (_4!385 lt!417049))))))

(declare-datatypes ((Unit!19705 0))(
  ( (Unit!19706) )
))
(declare-fun lt!417048 () Unit!19705)

(declare-fun e!200436 () Unit!19705)

(assert (=> b!280852 (= lt!417048 e!200436)))

(declare-fun c!13062 () Bool)

(assert (=> b!280852 (= c!13062 (bvslt (_1!12460 lt!417049) (_2!12460 lt!417049)))))

(assert (=> b!280852 (= lt!417051 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!770)

(assert (=> b!280852 (= lt!417049 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280853 () Bool)

(declare-fun Unit!19707 () Unit!19705)

(assert (=> b!280853 (= e!200436 Unit!19707)))

(declare-fun b!280854 () Bool)

(declare-fun Unit!19708 () Unit!19705)

(assert (=> b!280854 (= e!200436 Unit!19708)))

(declare-fun arrayRangesEq!1278 (array!16221 array!16221 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280854 (arrayRangesEq!1278 a1!699 a2!699 (_1!12460 lt!417049) (_2!12460 lt!417049))))

(declare-fun lt!417050 () Unit!19705)

(declare-fun arrayRangesEqSymmetricLemma!185 (array!16221 array!16221 (_ BitVec 32) (_ BitVec 32)) Unit!19705)

(assert (=> b!280854 (= lt!417050 (arrayRangesEqSymmetricLemma!185 a1!699 a2!699 (_1!12460 lt!417049) (_2!12460 lt!417049)))))

(assert (=> b!280854 (arrayRangesEq!1278 a2!699 a1!699 (_1!12460 lt!417049) (_2!12460 lt!417049))))

(declare-fun b!280855 () Bool)

(declare-fun res!233069 () Bool)

(assert (=> b!280855 (=> (not res!233069) (not e!200439))))

(declare-fun arrayBitRangesEq!0 (array!16221 array!16221 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280855 (= res!233069 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!233071 () Bool)

(assert (=> start!62714 (=> (not res!233071) (not e!200439))))

(assert (=> start!62714 (= res!233071 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7010 a1!699) (size!7010 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7010 a1!699))))))))

(assert (=> start!62714 e!200439))

(assert (=> start!62714 true))

(declare-fun array_inv!6734 (array!16221) Bool)

(assert (=> start!62714 (array_inv!6734 a1!699)))

(assert (=> start!62714 (array_inv!6734 a2!699)))

(assert (= (and start!62714 res!233071) b!280855))

(assert (= (and b!280855 res!233069) b!280851))

(assert (= (and b!280851 res!233072) b!280852))

(assert (= (and b!280852 c!13062) b!280854))

(assert (= (and b!280852 (not c!13062)) b!280853))

(assert (= (and b!280852 res!233070) b!280850))

(declare-fun m!413869 () Bool)

(assert (=> start!62714 m!413869))

(declare-fun m!413871 () Bool)

(assert (=> start!62714 m!413871))

(declare-fun m!413873 () Bool)

(assert (=> b!280852 m!413873))

(declare-fun m!413875 () Bool)

(assert (=> b!280854 m!413875))

(declare-fun m!413877 () Bool)

(assert (=> b!280854 m!413877))

(declare-fun m!413879 () Bool)

(assert (=> b!280854 m!413879))

(declare-fun m!413881 () Bool)

(assert (=> b!280855 m!413881))

(declare-fun m!413883 () Bool)

(assert (=> b!280850 m!413883))

(declare-fun m!413885 () Bool)

(assert (=> b!280850 m!413885))

(assert (=> b!280850 m!413883))

(assert (=> b!280850 m!413885))

(declare-fun m!413887 () Bool)

(assert (=> b!280850 m!413887))

(assert (=> b!280850 m!413885))

(assert (=> b!280850 m!413883))

(declare-fun m!413889 () Bool)

(assert (=> b!280850 m!413889))

(check-sat (not b!280854) (not b!280852) (not b!280850) (not start!62714) (not b!280855))
(check-sat)
(get-model)

(declare-fun d!96594 () Bool)

(assert (=> d!96594 (= (arrayBitIndices!0 from!822 to!789) (tuple4!771 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280852 d!96594))

(declare-fun d!96596 () Bool)

(assert (=> d!96596 (= (array_inv!6734 a1!699) (bvsge (size!7010 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62714 d!96596))

(declare-fun d!96598 () Bool)

(assert (=> d!96598 (= (array_inv!6734 a2!699) (bvsge (size!7010 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62714 d!96598))

(declare-fun d!96600 () Bool)

(declare-fun res!233089 () Bool)

(declare-fun e!200459 () Bool)

(assert (=> d!96600 (=> res!233089 e!200459)))

(assert (=> d!96600 (= res!233089 (= (_1!12460 lt!417049) (_2!12460 lt!417049)))))

(assert (=> d!96600 (= (arrayRangesEq!1278 a1!699 a2!699 (_1!12460 lt!417049) (_2!12460 lt!417049)) e!200459)))

(declare-fun b!280878 () Bool)

(declare-fun e!200460 () Bool)

(assert (=> b!280878 (= e!200459 e!200460)))

(declare-fun res!233090 () Bool)

(assert (=> b!280878 (=> (not res!233090) (not e!200460))))

(assert (=> b!280878 (= res!233090 (= (select (arr!8006 a1!699) (_1!12460 lt!417049)) (select (arr!8006 a2!699) (_1!12460 lt!417049))))))

(declare-fun b!280879 () Bool)

(assert (=> b!280879 (= e!200460 (arrayRangesEq!1278 a1!699 a2!699 (bvadd (_1!12460 lt!417049) #b00000000000000000000000000000001) (_2!12460 lt!417049)))))

(assert (= (and d!96600 (not res!233089)) b!280878))

(assert (= (and b!280878 res!233090) b!280879))

(declare-fun m!413913 () Bool)

(assert (=> b!280878 m!413913))

(declare-fun m!413915 () Bool)

(assert (=> b!280878 m!413915))

(declare-fun m!413917 () Bool)

(assert (=> b!280879 m!413917))

(assert (=> b!280854 d!96600))

(declare-fun d!96602 () Bool)

(assert (=> d!96602 (arrayRangesEq!1278 a2!699 a1!699 (_1!12460 lt!417049) (_2!12460 lt!417049))))

(declare-fun lt!417066 () Unit!19705)

(declare-fun choose!491 (array!16221 array!16221 (_ BitVec 32) (_ BitVec 32)) Unit!19705)

(assert (=> d!96602 (= lt!417066 (choose!491 a1!699 a2!699 (_1!12460 lt!417049) (_2!12460 lt!417049)))))

(assert (=> d!96602 (and (bvsle #b00000000000000000000000000000000 (_1!12460 lt!417049)) (bvsle (_1!12460 lt!417049) (_2!12460 lt!417049)) (bvsle (_2!12460 lt!417049) (size!7010 a1!699)))))

(assert (=> d!96602 (= (arrayRangesEqSymmetricLemma!185 a1!699 a2!699 (_1!12460 lt!417049) (_2!12460 lt!417049)) lt!417066)))

(declare-fun bs!24341 () Bool)

(assert (= bs!24341 d!96602))

(assert (=> bs!24341 m!413879))

(declare-fun m!413919 () Bool)

(assert (=> bs!24341 m!413919))

(assert (=> b!280854 d!96602))

(declare-fun d!96604 () Bool)

(declare-fun res!233091 () Bool)

(declare-fun e!200461 () Bool)

(assert (=> d!96604 (=> res!233091 e!200461)))

(assert (=> d!96604 (= res!233091 (= (_1!12460 lt!417049) (_2!12460 lt!417049)))))

(assert (=> d!96604 (= (arrayRangesEq!1278 a2!699 a1!699 (_1!12460 lt!417049) (_2!12460 lt!417049)) e!200461)))

(declare-fun b!280880 () Bool)

(declare-fun e!200462 () Bool)

(assert (=> b!280880 (= e!200461 e!200462)))

(declare-fun res!233092 () Bool)

(assert (=> b!280880 (=> (not res!233092) (not e!200462))))

(assert (=> b!280880 (= res!233092 (= (select (arr!8006 a2!699) (_1!12460 lt!417049)) (select (arr!8006 a1!699) (_1!12460 lt!417049))))))

(declare-fun b!280881 () Bool)

(assert (=> b!280881 (= e!200462 (arrayRangesEq!1278 a2!699 a1!699 (bvadd (_1!12460 lt!417049) #b00000000000000000000000000000001) (_2!12460 lt!417049)))))

(assert (= (and d!96604 (not res!233091)) b!280880))

(assert (= (and b!280880 res!233092) b!280881))

(assert (=> b!280880 m!413915))

(assert (=> b!280880 m!413913))

(declare-fun m!413921 () Bool)

(assert (=> b!280881 m!413921))

(assert (=> b!280854 d!96604))

(declare-fun b!280896 () Bool)

(declare-fun res!233107 () Bool)

(declare-fun lt!417074 () (_ BitVec 32))

(assert (=> b!280896 (= res!233107 (= lt!417074 #b00000000000000000000000000000000))))

(declare-fun e!200480 () Bool)

(assert (=> b!280896 (=> res!233107 e!200480)))

(declare-fun e!200479 () Bool)

(assert (=> b!280896 (= e!200479 e!200480)))

(declare-fun b!280897 () Bool)

(declare-fun e!200477 () Bool)

(assert (=> b!280897 (= e!200477 e!200479)))

(declare-fun lt!417073 () (_ BitVec 32))

(declare-fun lt!417075 () tuple4!770)

(declare-fun res!233105 () Bool)

(assert (=> b!280897 (= res!233105 (byteRangesEq!0 (select (arr!8006 a1!699) (_3!1165 lt!417075)) (select (arr!8006 a2!699) (_3!1165 lt!417075)) lt!417073 #b00000000000000000000000000001000))))

(assert (=> b!280897 (=> (not res!233105) (not e!200479))))

(declare-fun b!280898 () Bool)

(declare-fun e!200478 () Bool)

(declare-fun e!200476 () Bool)

(assert (=> b!280898 (= e!200478 e!200476)))

(declare-fun res!233103 () Bool)

(assert (=> b!280898 (=> (not res!233103) (not e!200476))))

(declare-fun e!200475 () Bool)

(assert (=> b!280898 (= res!233103 e!200475)))

(declare-fun res!233104 () Bool)

(assert (=> b!280898 (=> res!233104 e!200475)))

(assert (=> b!280898 (= res!233104 (bvsge (_1!12460 lt!417075) (_2!12460 lt!417075)))))

(assert (=> b!280898 (= lt!417074 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280898 (= lt!417073 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280898 (= lt!417075 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280899 () Bool)

(assert (=> b!280899 (= e!200476 e!200477)))

(declare-fun c!13068 () Bool)

(assert (=> b!280899 (= c!13068 (= (_3!1165 lt!417075) (_4!385 lt!417075)))))

(declare-fun b!280900 () Bool)

(assert (=> b!280900 (= e!200475 (arrayRangesEq!1278 a1!699 a2!699 (_1!12460 lt!417075) (_2!12460 lt!417075)))))

(declare-fun b!280901 () Bool)

(declare-fun call!4658 () Bool)

(assert (=> b!280901 (= e!200480 call!4658)))

(declare-fun d!96606 () Bool)

(declare-fun res!233106 () Bool)

(assert (=> d!96606 (=> res!233106 e!200478)))

(assert (=> d!96606 (= res!233106 (bvsge from!822 to!789))))

(assert (=> d!96606 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200478)))

(declare-fun b!280902 () Bool)

(assert (=> b!280902 (= e!200477 call!4658)))

(declare-fun bm!4655 () Bool)

(assert (=> bm!4655 (= call!4658 (byteRangesEq!0 (ite c!13068 (select (arr!8006 a1!699) (_3!1165 lt!417075)) (select (arr!8006 a1!699) (_4!385 lt!417075))) (ite c!13068 (select (arr!8006 a2!699) (_3!1165 lt!417075)) (select (arr!8006 a2!699) (_4!385 lt!417075))) (ite c!13068 lt!417073 #b00000000000000000000000000000000) lt!417074))))

(assert (= (and d!96606 (not res!233106)) b!280898))

(assert (= (and b!280898 (not res!233104)) b!280900))

(assert (= (and b!280898 res!233103) b!280899))

(assert (= (and b!280899 c!13068) b!280902))

(assert (= (and b!280899 (not c!13068)) b!280897))

(assert (= (and b!280897 res!233105) b!280896))

(assert (= (and b!280896 (not res!233107)) b!280901))

(assert (= (or b!280902 b!280901) bm!4655))

(declare-fun m!413923 () Bool)

(assert (=> b!280897 m!413923))

(declare-fun m!413925 () Bool)

(assert (=> b!280897 m!413925))

(assert (=> b!280897 m!413923))

(assert (=> b!280897 m!413925))

(declare-fun m!413927 () Bool)

(assert (=> b!280897 m!413927))

(assert (=> b!280898 m!413873))

(declare-fun m!413929 () Bool)

(assert (=> b!280900 m!413929))

(assert (=> bm!4655 m!413923))

(declare-fun m!413931 () Bool)

(assert (=> bm!4655 m!413931))

(declare-fun m!413933 () Bool)

(assert (=> bm!4655 m!413933))

(declare-fun m!413935 () Bool)

(assert (=> bm!4655 m!413935))

(assert (=> bm!4655 m!413925))

(assert (=> b!280855 d!96606))

(declare-fun d!96610 () Bool)

(assert (=> d!96610 (= (byteRangesEq!0 (select (arr!8006 a2!699) (_3!1165 lt!417049)) (select (arr!8006 a1!699) (_3!1165 lt!417049)) lt!417051 #b00000000000000000000000000001000) (or (= lt!417051 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8006 a2!699) (_3!1165 lt!417049))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417051)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8006 a1!699) (_3!1165 lt!417049))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417051)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24342 () Bool)

(assert (= bs!24342 d!96610))

(declare-fun m!413937 () Bool)

(assert (=> bs!24342 m!413937))

(declare-fun m!413939 () Bool)

(assert (=> bs!24342 m!413939))

(assert (=> b!280850 d!96610))

(declare-fun d!96612 () Bool)

(assert (=> d!96612 (= (byteRangesEq!0 (select (arr!8006 a1!699) (_3!1165 lt!417049)) (select (arr!8006 a2!699) (_3!1165 lt!417049)) lt!417051 #b00000000000000000000000000001000) (or (= lt!417051 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8006 a1!699) (_3!1165 lt!417049))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417051)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8006 a2!699) (_3!1165 lt!417049))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417051)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24343 () Bool)

(assert (= bs!24343 d!96612))

(assert (=> bs!24343 m!413937))

(assert (=> bs!24343 m!413939))

(assert (=> b!280850 d!96612))

(check-sat (not bm!4655) (not b!280900) (not b!280881) (not b!280879) (not b!280897) (not b!280898) (not d!96602))
(check-sat)

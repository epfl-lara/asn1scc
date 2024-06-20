; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67194 () Bool)

(assert start!67194)

(declare-fun b!301762 () Bool)

(declare-datatypes ((Unit!21130 0))(
  ( (Unit!21131) )
))
(declare-fun e!216743 () Unit!21130)

(declare-fun lt!436895 () Unit!21130)

(assert (=> b!301762 (= e!216743 lt!436895)))

(declare-datatypes ((tuple4!1086 0))(
  ( (tuple4!1087 (_1!13198 (_ BitVec 32)) (_2!13198 (_ BitVec 32)) (_3!1500 (_ BitVec 32)) (_4!543 (_ BitVec 32))) )
))
(declare-fun lt!436897 () tuple4!1086)

(declare-datatypes ((array!18281 0))(
  ( (array!18282 (arr!9022 (Array (_ BitVec 32) (_ BitVec 8))) (size!7939 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18281)

(declare-fun a2!948 () array!18281)

(declare-fun lt!436904 () tuple4!1086)

(declare-fun arrayRangesEqSlicedLemma!211 (array!18281 array!18281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21130)

(assert (=> b!301762 (= lt!436895 (arrayRangesEqSlicedLemma!211 a1!948 a2!948 (_1!13198 lt!436904) (_2!13198 lt!436904) (_1!13198 lt!436897) (_2!13198 lt!436897)))))

(declare-fun arrayRangesEq!1601 (array!18281 array!18281 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301762 (arrayRangesEq!1601 a1!948 a2!948 (_1!13198 lt!436897) (_2!13198 lt!436897))))

(declare-fun b!301763 () Bool)

(declare-fun e!216746 () Bool)

(declare-fun e!216753 () Bool)

(assert (=> b!301763 (= e!216746 e!216753)))

(declare-fun res!248410 () Bool)

(assert (=> b!301763 (=> (not res!248410) (not e!216753))))

(declare-fun e!216752 () Bool)

(assert (=> b!301763 (= res!248410 e!216752)))

(declare-fun c!14262 () Bool)

(assert (=> b!301763 (= c!14262 (= (_3!1500 lt!436904) (_4!543 lt!436904)))))

(declare-fun lt!436898 () Unit!21130)

(assert (=> b!301763 (= lt!436898 e!216743)))

(declare-fun c!14260 () Bool)

(assert (=> b!301763 (= c!14260 (bvslt (_1!13198 lt!436897) (_2!13198 lt!436897)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1086)

(assert (=> b!301763 (= lt!436897 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!436901 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!301763 (= lt!436901 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436899 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!301763 (= lt!436899 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301763 (= lt!436904 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301764 () Bool)

(declare-fun e!216754 () Bool)

(assert (=> b!301764 (= e!216752 e!216754)))

(declare-fun res!248408 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301764 (= res!248408 (byteRangesEq!0 (select (arr!9022 a1!948) (_3!1500 lt!436904)) (select (arr!9022 a2!948) (_3!1500 lt!436904)) lt!436899 #b00000000000000000000000000000111))))

(assert (=> b!301764 (=> (not res!248408) (not e!216754))))

(declare-fun b!301765 () Bool)

(declare-fun res!248415 () Bool)

(assert (=> b!301765 (= res!248415 (= lt!436901 #b00000000000000000000000000000000))))

(declare-fun e!216748 () Bool)

(assert (=> b!301765 (=> res!248415 e!216748)))

(assert (=> b!301765 (= e!216754 e!216748)))

(declare-fun b!301766 () Bool)

(declare-fun e!216747 () Bool)

(assert (=> b!301766 (= e!216747 e!216746)))

(declare-fun res!248409 () Bool)

(assert (=> b!301766 (=> (not res!248409) (not e!216746))))

(declare-fun lt!436896 () (_ BitVec 64))

(assert (=> b!301766 (= res!248409 (and (bvsle toBit!258 lt!436896) (bvsle fromBit!258 lt!436896)))))

(assert (=> b!301766 (= lt!436896 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7939 a1!948))))))

(declare-fun b!301767 () Bool)

(declare-fun e!216751 () Unit!21130)

(declare-fun lt!436902 () Unit!21130)

(assert (=> b!301767 (= e!216751 lt!436902)))

(declare-fun arrayRangesEqImpliesEq!253 (array!18281 array!18281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21130)

(assert (=> b!301767 (= lt!436902 (arrayRangesEqImpliesEq!253 a1!948 a2!948 (_1!13198 lt!436904) (_3!1500 lt!436897) (_2!13198 lt!436904)))))

(assert (=> b!301767 (= (select (arr!9022 a1!948) (_3!1500 lt!436897)) (select (arr!9022 a2!948) (_3!1500 lt!436897)))))

(declare-fun b!301768 () Bool)

(declare-fun e!216749 () Unit!21130)

(declare-fun Unit!21132 () Unit!21130)

(assert (=> b!301768 (= e!216749 Unit!21132)))

(declare-fun b!301769 () Bool)

(declare-fun lt!436900 () Unit!21130)

(assert (=> b!301769 (= e!216749 lt!436900)))

(assert (=> b!301769 (= lt!436900 (arrayRangesEqImpliesEq!253 a1!948 a2!948 (_1!13198 lt!436904) (_4!543 lt!436897) (_2!13198 lt!436904)))))

(assert (=> b!301769 (= (select (arr!9022 a1!948) (_4!543 lt!436897)) (select (arr!9022 a2!948) (_4!543 lt!436897)))))

(declare-fun b!301770 () Bool)

(declare-fun call!5477 () Bool)

(assert (=> b!301770 (= e!216748 call!5477)))

(declare-fun b!301771 () Bool)

(declare-fun e!216744 () Bool)

(assert (=> b!301771 (= e!216753 e!216744)))

(declare-fun res!248412 () Bool)

(assert (=> b!301771 (=> (not res!248412) (not e!216744))))

(assert (=> b!301771 (= res!248412 (not (= (_3!1500 lt!436897) (_4!543 lt!436897))))))

(declare-fun lt!436905 () Unit!21130)

(assert (=> b!301771 (= lt!436905 e!216749)))

(declare-fun c!14259 () Bool)

(assert (=> b!301771 (= c!14259 (and (bvslt (_4!543 lt!436897) (_4!543 lt!436904)) (bvslt (_3!1500 lt!436904) (_4!543 lt!436897))))))

(declare-fun lt!436903 () Unit!21130)

(assert (=> b!301771 (= lt!436903 e!216751)))

(declare-fun c!14261 () Bool)

(assert (=> b!301771 (= c!14261 (and (bvslt (_3!1500 lt!436904) (_3!1500 lt!436897)) (bvslt (_3!1500 lt!436897) (_4!543 lt!436904))))))

(declare-fun res!248413 () Bool)

(assert (=> start!67194 (=> (not res!248413) (not e!216747))))

(assert (=> start!67194 (= res!248413 (and (bvsle (size!7939 a1!948) (size!7939 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67194 e!216747))

(assert (=> start!67194 true))

(declare-fun array_inv!7551 (array!18281) Bool)

(assert (=> start!67194 (array_inv!7551 a1!948)))

(assert (=> start!67194 (array_inv!7551 a2!948)))

(declare-fun b!301772 () Bool)

(assert (=> b!301772 (= e!216744 (not (byteRangesEq!0 (select (arr!9022 a1!948) (_3!1500 lt!436897)) (select (arr!9022 a2!948) (_3!1500 lt!436897)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111)))))

(declare-fun b!301773 () Bool)

(declare-fun res!248414 () Bool)

(assert (=> b!301773 (=> (not res!248414) (not e!216746))))

(declare-fun arrayBitRangesEq!0 (array!18281 array!18281 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301773 (= res!248414 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301774 () Bool)

(declare-fun Unit!21133 () Unit!21130)

(assert (=> b!301774 (= e!216751 Unit!21133)))

(declare-fun bm!5474 () Bool)

(assert (=> bm!5474 (= call!5477 (byteRangesEq!0 (ite c!14262 (select (arr!9022 a1!948) (_3!1500 lt!436904)) (select (arr!9022 a1!948) (_4!543 lt!436904))) (ite c!14262 (select (arr!9022 a2!948) (_3!1500 lt!436904)) (select (arr!9022 a2!948) (_4!543 lt!436904))) (ite c!14262 lt!436899 #b00000000000000000000000000000000) lt!436901))))

(declare-fun b!301775 () Bool)

(assert (=> b!301775 (= e!216752 call!5477)))

(declare-fun b!301776 () Bool)

(declare-fun res!248411 () Bool)

(assert (=> b!301776 (=> (not res!248411) (not e!216746))))

(assert (=> b!301776 (= res!248411 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436896) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301777 () Bool)

(declare-fun Unit!21134 () Unit!21130)

(assert (=> b!301777 (= e!216743 Unit!21134)))

(assert (= (and start!67194 res!248413) b!301766))

(assert (= (and b!301766 res!248409) b!301773))

(assert (= (and b!301773 res!248414) b!301776))

(assert (= (and b!301776 res!248411) b!301763))

(assert (= (and b!301763 c!14260) b!301762))

(assert (= (and b!301763 (not c!14260)) b!301777))

(assert (= (and b!301763 c!14262) b!301775))

(assert (= (and b!301763 (not c!14262)) b!301764))

(assert (= (and b!301764 res!248408) b!301765))

(assert (= (and b!301765 (not res!248415)) b!301770))

(assert (= (or b!301775 b!301770) bm!5474))

(assert (= (and b!301763 res!248410) b!301771))

(assert (= (and b!301771 c!14261) b!301767))

(assert (= (and b!301771 (not c!14261)) b!301774))

(assert (= (and b!301771 c!14259) b!301769))

(assert (= (and b!301771 (not c!14259)) b!301768))

(assert (= (and b!301771 res!248412) b!301772))

(declare-fun m!440601 () Bool)

(assert (=> bm!5474 m!440601))

(declare-fun m!440603 () Bool)

(assert (=> bm!5474 m!440603))

(declare-fun m!440605 () Bool)

(assert (=> bm!5474 m!440605))

(declare-fun m!440607 () Bool)

(assert (=> bm!5474 m!440607))

(declare-fun m!440609 () Bool)

(assert (=> bm!5474 m!440609))

(declare-fun m!440611 () Bool)

(assert (=> b!301762 m!440611))

(declare-fun m!440613 () Bool)

(assert (=> b!301762 m!440613))

(declare-fun m!440615 () Bool)

(assert (=> start!67194 m!440615))

(declare-fun m!440617 () Bool)

(assert (=> start!67194 m!440617))

(declare-fun m!440619 () Bool)

(assert (=> b!301763 m!440619))

(declare-fun m!440621 () Bool)

(assert (=> b!301763 m!440621))

(declare-fun m!440623 () Bool)

(assert (=> b!301773 m!440623))

(assert (=> b!301764 m!440601))

(assert (=> b!301764 m!440609))

(assert (=> b!301764 m!440601))

(assert (=> b!301764 m!440609))

(declare-fun m!440625 () Bool)

(assert (=> b!301764 m!440625))

(declare-fun m!440627 () Bool)

(assert (=> b!301772 m!440627))

(declare-fun m!440629 () Bool)

(assert (=> b!301772 m!440629))

(assert (=> b!301772 m!440627))

(assert (=> b!301772 m!440629))

(declare-fun m!440631 () Bool)

(assert (=> b!301772 m!440631))

(declare-fun m!440633 () Bool)

(assert (=> b!301767 m!440633))

(assert (=> b!301767 m!440627))

(assert (=> b!301767 m!440629))

(declare-fun m!440635 () Bool)

(assert (=> b!301769 m!440635))

(declare-fun m!440637 () Bool)

(assert (=> b!301769 m!440637))

(declare-fun m!440639 () Bool)

(assert (=> b!301769 m!440639))

(push 1)

(assert (not bm!5474))

(assert (not b!301773))

(assert (not b!301762))

(assert (not b!301763))

(assert (not start!67194))

(assert (not b!301764))

(assert (not b!301772))

(assert (not b!301767))

(assert (not b!301769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!301915 () Bool)

(declare-fun e!216863 () Bool)

(declare-fun call!5489 () Bool)

(assert (=> b!301915 (= e!216863 call!5489)))

(declare-fun b!301916 () Bool)

(declare-fun e!216864 () Bool)

(assert (=> b!301916 (= e!216864 e!216863)))

(declare-fun c!14292 () Bool)

(declare-fun lt!436995 () tuple4!1086)

(assert (=> b!301916 (= c!14292 (= (_3!1500 lt!436995) (_4!543 lt!436995)))))

(declare-fun lt!436996 () (_ BitVec 32))

(declare-fun lt!436994 () (_ BitVec 32))

(declare-fun bm!5486 () Bool)

(assert (=> bm!5486 (= call!5489 (byteRangesEq!0 (select (arr!9022 a1!948) (_3!1500 lt!436995)) (select (arr!9022 a2!948) (_3!1500 lt!436995)) lt!436996 (ite c!14292 lt!436994 #b00000000000000000000000000001000)))))

(declare-fun b!301917 () Bool)

(declare-fun e!216866 () Bool)

(assert (=> b!301917 (= e!216866 e!216864)))

(declare-fun res!248498 () Bool)

(assert (=> b!301917 (=> (not res!248498) (not e!216864))))

(declare-fun e!216865 () Bool)

(assert (=> b!301917 (= res!248498 e!216865)))

(declare-fun res!248499 () Bool)

(assert (=> b!301917 (=> res!248499 e!216865)))

(assert (=> b!301917 (= res!248499 (bvsge (_1!13198 lt!436995) (_2!13198 lt!436995)))))

(assert (=> b!301917 (= lt!436994 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301917 (= lt!436996 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301917 (= lt!436995 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301918 () Bool)

(declare-fun res!248497 () Bool)

(assert (=> b!301918 (= res!248497 (= lt!436994 #b00000000000000000000000000000000))))

(declare-fun e!216868 () Bool)

(assert (=> b!301918 (=> res!248497 e!216868)))

(declare-fun e!216867 () Bool)

(assert (=> b!301918 (= e!216867 e!216868)))

(declare-fun b!301919 () Bool)

(assert (=> b!301919 (= e!216868 (byteRangesEq!0 (select (arr!9022 a1!948) (_4!543 lt!436995)) (select (arr!9022 a2!948) (_4!543 lt!436995)) #b00000000000000000000000000000000 lt!436994))))

(declare-fun d!100910 () Bool)

(declare-fun res!248495 () Bool)

(assert (=> d!100910 (=> res!248495 e!216866)))

(assert (=> d!100910 (= res!248495 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100910 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216866)))

(declare-fun b!301920 () Bool)

(assert (=> b!301920 (= e!216863 e!216867)))

(declare-fun res!248496 () Bool)

(assert (=> b!301920 (= res!248496 call!5489)))

(assert (=> b!301920 (=> (not res!248496) (not e!216867))))

(declare-fun b!301921 () Bool)

(assert (=> b!301921 (= e!216865 (arrayRangesEq!1601 a1!948 a2!948 (_1!13198 lt!436995) (_2!13198 lt!436995)))))

(assert (= (and d!100910 (not res!248495)) b!301917))

(assert (= (and b!301917 (not res!248499)) b!301921))

(assert (= (and b!301917 res!248498) b!301916))

(assert (= (and b!301916 c!14292) b!301915))

(assert (= (and b!301916 (not c!14292)) b!301920))

(assert (= (and b!301920 res!248496) b!301918))

(assert (= (and b!301918 (not res!248497)) b!301919))

(assert (= (or b!301915 b!301920) bm!5486))

(declare-fun m!440757 () Bool)

(assert (=> bm!5486 m!440757))

(declare-fun m!440759 () Bool)

(assert (=> bm!5486 m!440759))

(assert (=> bm!5486 m!440757))

(assert (=> bm!5486 m!440759))

(declare-fun m!440761 () Bool)

(assert (=> bm!5486 m!440761))

(assert (=> b!301917 m!440621))

(declare-fun m!440763 () Bool)

(assert (=> b!301919 m!440763))

(declare-fun m!440765 () Bool)

(assert (=> b!301919 m!440765))

(assert (=> b!301919 m!440763))

(assert (=> b!301919 m!440765))

(declare-fun m!440767 () Bool)

(assert (=> b!301919 m!440767))

(declare-fun m!440769 () Bool)

(assert (=> b!301921 m!440769))

(assert (=> b!301773 d!100910))

(declare-fun d!100912 () Bool)

(assert (=> d!100912 (arrayRangesEq!1601 a1!948 a2!948 (_1!13198 lt!436897) (_2!13198 lt!436897))))

(declare-fun lt!436999 () Unit!21130)

(declare-fun choose!538 (array!18281 array!18281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21130)

(assert (=> d!100912 (= lt!436999 (choose!538 a1!948 a2!948 (_1!13198 lt!436904) (_2!13198 lt!436904) (_1!13198 lt!436897) (_2!13198 lt!436897)))))

(assert (=> d!100912 (and (bvsle #b00000000000000000000000000000000 (_1!13198 lt!436904)) (bvsle (_1!13198 lt!436904) (_2!13198 lt!436904)))))

(assert (=> d!100912 (= (arrayRangesEqSlicedLemma!211 a1!948 a2!948 (_1!13198 lt!436904) (_2!13198 lt!436904) (_1!13198 lt!436897) (_2!13198 lt!436897)) lt!436999)))

(declare-fun bs!26028 () Bool)

(assert (= bs!26028 d!100912))

(assert (=> bs!26028 m!440613))

(declare-fun m!440771 () Bool)

(assert (=> bs!26028 m!440771))

(assert (=> b!301762 d!100912))

(declare-fun d!100914 () Bool)

(declare-fun res!248504 () Bool)

(declare-fun e!216873 () Bool)

(assert (=> d!100914 (=> res!248504 e!216873)))

(assert (=> d!100914 (= res!248504 (= (_1!13198 lt!436897) (_2!13198 lt!436897)))))

(assert (=> d!100914 (= (arrayRangesEq!1601 a1!948 a2!948 (_1!13198 lt!436897) (_2!13198 lt!436897)) e!216873)))

(declare-fun b!301926 () Bool)

(declare-fun e!216874 () Bool)

(assert (=> b!301926 (= e!216873 e!216874)))

(declare-fun res!248505 () Bool)

(assert (=> b!301926 (=> (not res!248505) (not e!216874))))

(assert (=> b!301926 (= res!248505 (= (select (arr!9022 a1!948) (_1!13198 lt!436897)) (select (arr!9022 a2!948) (_1!13198 lt!436897))))))

(declare-fun b!301927 () Bool)

(assert (=> b!301927 (= e!216874 (arrayRangesEq!1601 a1!948 a2!948 (bvadd (_1!13198 lt!436897) #b00000000000000000000000000000001) (_2!13198 lt!436897)))))

(assert (= (and d!100914 (not res!248504)) b!301926))

(assert (= (and b!301926 res!248505) b!301927))

(declare-fun m!440773 () Bool)

(assert (=> b!301926 m!440773))

(declare-fun m!440775 () Bool)

(assert (=> b!301926 m!440775))

(declare-fun m!440777 () Bool)

(assert (=> b!301927 m!440777))

(assert (=> b!301762 d!100914))

(declare-fun d!100916 () Bool)

(assert (=> d!100916 (and (bvsge (_3!1500 lt!436897) #b00000000000000000000000000000000) (bvslt (_3!1500 lt!436897) (size!7939 a1!948)) (bvslt (_3!1500 lt!436897) (size!7939 a2!948)) (= (select (arr!9022 a1!948) (_3!1500 lt!436897)) (select (arr!9022 a2!948) (_3!1500 lt!436897))))))

(declare-fun lt!437002 () Unit!21130)

(declare-fun choose!539 (array!18281 array!18281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21130)

(assert (=> d!100916 (= lt!437002 (choose!539 a1!948 a2!948 (_1!13198 lt!436904) (_3!1500 lt!436897) (_2!13198 lt!436904)))))

(assert (=> d!100916 (and (bvsle #b00000000000000000000000000000000 (_1!13198 lt!436904)) (bvsle (_1!13198 lt!436904) (_2!13198 lt!436904)))))

(assert (=> d!100916 (= (arrayRangesEqImpliesEq!253 a1!948 a2!948 (_1!13198 lt!436904) (_3!1500 lt!436897) (_2!13198 lt!436904)) lt!437002)))

(declare-fun bs!26029 () Bool)

(assert (= bs!26029 d!100916))

(assert (=> bs!26029 m!440627))

(assert (=> bs!26029 m!440629))

(declare-fun m!440779 () Bool)

(assert (=> bs!26029 m!440779))

(assert (=> b!301767 d!100916))

(declare-fun d!100918 () Bool)

(assert (=> d!100918 (= (byteRangesEq!0 (select (arr!9022 a1!948) (_3!1500 lt!436897)) (select (arr!9022 a2!948) (_3!1500 lt!436897)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9022 a1!948) (_3!1500 lt!436897))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9022 a2!948) (_3!1500 lt!436897))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26030 () Bool)

(assert (= bs!26030 d!100918))

(declare-fun m!440781 () Bool)

(assert (=> bs!26030 m!440781))

(declare-fun m!440783 () Bool)

(assert (=> bs!26030 m!440783))

(assert (=> b!301772 d!100918))

(declare-fun d!100920 () Bool)

(assert (=> d!100920 (= (byteRangesEq!0 (ite c!14262 (select (arr!9022 a1!948) (_3!1500 lt!436904)) (select (arr!9022 a1!948) (_4!543 lt!436904))) (ite c!14262 (select (arr!9022 a2!948) (_3!1500 lt!436904)) (select (arr!9022 a2!948) (_4!543 lt!436904))) (ite c!14262 lt!436899 #b00000000000000000000000000000000) lt!436901) (or (= (ite c!14262 lt!436899 #b00000000000000000000000000000000) lt!436901) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14262 (select (arr!9022 a1!948) (_3!1500 lt!436904)) (select (arr!9022 a1!948) (_4!543 lt!436904)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436901))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14262 lt!436899 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14262 (select (arr!9022 a2!948) (_3!1500 lt!436904)) (select (arr!9022 a2!948) (_4!543 lt!436904)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436901))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14262 lt!436899 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26031 () Bool)

(assert (= bs!26031 d!100920))

(declare-fun m!440785 () Bool)

(assert (=> bs!26031 m!440785))

(declare-fun m!440787 () Bool)

(assert (=> bs!26031 m!440787))

(assert (=> bm!5474 d!100920))

(declare-fun d!100922 () Bool)

(assert (=> d!100922 (= (byteRangesEq!0 (select (arr!9022 a1!948) (_3!1500 lt!436904)) (select (arr!9022 a2!948) (_3!1500 lt!436904)) lt!436899 #b00000000000000000000000000000111) (or (= lt!436899 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9022 a1!948) (_3!1500 lt!436904))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436899)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9022 a2!948) (_3!1500 lt!436904))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436899)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26032 () Bool)

(assert (= bs!26032 d!100922))

(assert (=> bs!26032 m!440781))

(declare-fun m!440789 () Bool)

(assert (=> bs!26032 m!440789))

(assert (=> b!301764 d!100922))

(declare-fun d!100924 () Bool)

(assert (=> d!100924 (and (bvsge (_4!543 lt!436897) #b00000000000000000000000000000000) (bvslt (_4!543 lt!436897) (size!7939 a1!948)) (bvslt (_4!543 lt!436897) (size!7939 a2!948)) (= (select (arr!9022 a1!948) (_4!543 lt!436897)) (select (arr!9022 a2!948) (_4!543 lt!436897))))))

(declare-fun lt!437003 () Unit!21130)

(assert (=> d!100924 (= lt!437003 (choose!539 a1!948 a2!948 (_1!13198 lt!436904) (_4!543 lt!436897) (_2!13198 lt!436904)))))

(assert (=> d!100924 (and (bvsle #b00000000000000000000000000000000 (_1!13198 lt!436904)) (bvsle (_1!13198 lt!436904) (_2!13198 lt!436904)))))

(assert (=> d!100924 (= (arrayRangesEqImpliesEq!253 a1!948 a2!948 (_1!13198 lt!436904) (_4!543 lt!436897) (_2!13198 lt!436904)) lt!437003)))

(declare-fun bs!26033 () Bool)

(assert (= bs!26033 d!100924))

(assert (=> bs!26033 m!440637))

(assert (=> bs!26033 m!440639))

(declare-fun m!440791 () Bool)

(assert (=> bs!26033 m!440791))

(assert (=> b!301769 d!100924))

(declare-fun d!100926 () Bool)

(assert (=> d!100926 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1087 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301763 d!100926))

(declare-fun d!100930 () Bool)

(assert (=> d!100930 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1087 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301763 d!100930))

(declare-fun d!100932 () Bool)

(assert (=> d!100932 (= (array_inv!7551 a1!948) (bvsge (size!7939 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67194 d!100932))

(declare-fun d!100934 () Bool)

(assert (=> d!100934 (= (array_inv!7551 a2!948) (bvsge (size!7939 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67194 d!100934))

(push 1)

(assert (not b!301917))

(assert (not b!301921))

(assert (not b!301919))

(assert (not b!301927))

(assert (not bm!5486))

(assert (not d!100924))

(assert (not d!100912))

(assert (not d!100916))

(check-sat)

(pop 1)

(push 1)

(check-sat)


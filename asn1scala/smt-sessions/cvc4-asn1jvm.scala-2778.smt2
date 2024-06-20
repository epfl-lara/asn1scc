; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67076 () Bool)

(assert start!67076)

(declare-fun b!300719 () Bool)

(declare-fun e!215956 () Bool)

(declare-fun call!5402 () Bool)

(assert (=> b!300719 (= e!215956 call!5402)))

(declare-fun b!300720 () Bool)

(declare-fun e!215959 () Bool)

(assert (=> b!300720 (= e!215956 e!215959)))

(declare-fun lt!436195 () (_ BitVec 32))

(declare-datatypes ((array!18237 0))(
  ( (array!18238 (arr!9003 (Array (_ BitVec 32) (_ BitVec 8))) (size!7920 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18237)

(declare-fun a2!948 () array!18237)

(declare-datatypes ((tuple4!1048 0))(
  ( (tuple4!1049 (_1!13179 (_ BitVec 32)) (_2!13179 (_ BitVec 32)) (_3!1481 (_ BitVec 32)) (_4!524 (_ BitVec 32))) )
))
(declare-fun lt!436201 () tuple4!1048)

(declare-fun res!247825 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300720 (= res!247825 (byteRangesEq!0 (select (arr!9003 a1!948) (_3!1481 lt!436201)) (select (arr!9003 a2!948) (_3!1481 lt!436201)) lt!436195 #b00000000000000000000000000000111))))

(assert (=> b!300720 (=> (not res!247825) (not e!215959))))

(declare-fun b!300721 () Bool)

(declare-fun res!247821 () Bool)

(declare-fun e!215964 () Bool)

(assert (=> b!300721 (=> (not res!247821) (not e!215964))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436196 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300721 (= res!247821 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436196) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247822 () Bool)

(declare-fun e!215963 () Bool)

(assert (=> start!67076 (=> (not res!247822) (not e!215963))))

(assert (=> start!67076 (= res!247822 (and (bvsle (size!7920 a1!948) (size!7920 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67076 e!215963))

(assert (=> start!67076 true))

(declare-fun array_inv!7532 (array!18237) Bool)

(assert (=> start!67076 (array_inv!7532 a1!948)))

(assert (=> start!67076 (array_inv!7532 a2!948)))

(declare-fun b!300722 () Bool)

(declare-datatypes ((Unit!21041 0))(
  ( (Unit!21042) )
))
(declare-fun e!215958 () Unit!21041)

(declare-fun Unit!21043 () Unit!21041)

(assert (=> b!300722 (= e!215958 Unit!21043)))

(declare-fun b!300723 () Bool)

(declare-fun e!215965 () Unit!21041)

(declare-fun Unit!21044 () Unit!21041)

(assert (=> b!300723 (= e!215965 Unit!21044)))

(declare-fun b!300724 () Bool)

(declare-fun e!215966 () Unit!21041)

(declare-fun Unit!21045 () Unit!21041)

(assert (=> b!300724 (= e!215966 Unit!21045)))

(declare-fun b!300725 () Bool)

(declare-fun e!215957 () Bool)

(declare-fun e!215962 () Bool)

(assert (=> b!300725 (= e!215957 e!215962)))

(declare-fun res!247824 () Bool)

(assert (=> b!300725 (=> (not res!247824) (not e!215962))))

(declare-fun lt!436200 () tuple4!1048)

(assert (=> b!300725 (= res!247824 (= (_3!1481 lt!436200) (_4!524 lt!436200)))))

(declare-fun lt!436194 () Unit!21041)

(assert (=> b!300725 (= lt!436194 e!215966)))

(declare-fun c!14034 () Bool)

(assert (=> b!300725 (= c!14034 (and (bvslt (_4!524 lt!436200) (_4!524 lt!436201)) (bvslt (_3!1481 lt!436201) (_4!524 lt!436200))))))

(declare-fun lt!436198 () Unit!21041)

(assert (=> b!300725 (= lt!436198 e!215958)))

(declare-fun c!14033 () Bool)

(assert (=> b!300725 (= c!14033 (and (bvslt (_3!1481 lt!436201) (_3!1481 lt!436200)) (bvslt (_3!1481 lt!436200) (_4!524 lt!436201))))))

(declare-fun b!300726 () Bool)

(declare-fun res!247828 () Bool)

(assert (=> b!300726 (=> (not res!247828) (not e!215962))))

(assert (=> b!300726 (= res!247828 (byteRangesEq!0 (select (arr!9003 a1!948) (_3!1481 lt!436200)) (select (arr!9003 a2!948) (_3!1481 lt!436200)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!300727 () Bool)

(assert (=> b!300727 (= e!215962 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!436196)))))

(declare-fun b!300728 () Bool)

(assert (=> b!300728 (= e!215963 e!215964)))

(declare-fun res!247823 () Bool)

(assert (=> b!300728 (=> (not res!247823) (not e!215964))))

(assert (=> b!300728 (= res!247823 (and (bvsle toBit!258 lt!436196) (bvsle fromBit!258 lt!436196)))))

(assert (=> b!300728 (= lt!436196 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7920 a1!948))))))

(declare-fun c!14031 () Bool)

(declare-fun lt!436197 () (_ BitVec 32))

(declare-fun bm!5399 () Bool)

(assert (=> bm!5399 (= call!5402 (byteRangesEq!0 (ite c!14031 (select (arr!9003 a1!948) (_3!1481 lt!436201)) (select (arr!9003 a1!948) (_4!524 lt!436201))) (ite c!14031 (select (arr!9003 a2!948) (_3!1481 lt!436201)) (select (arr!9003 a2!948) (_4!524 lt!436201))) (ite c!14031 lt!436195 #b00000000000000000000000000000000) lt!436197))))

(declare-fun b!300729 () Bool)

(declare-fun lt!436199 () Unit!21041)

(assert (=> b!300729 (= e!215965 lt!436199)))

(declare-fun arrayRangesEqSlicedLemma!192 (array!18237 array!18237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21041)

(assert (=> b!300729 (= lt!436199 (arrayRangesEqSlicedLemma!192 a1!948 a2!948 (_1!13179 lt!436201) (_2!13179 lt!436201) (_1!13179 lt!436200) (_2!13179 lt!436200)))))

(declare-fun arrayRangesEq!1582 (array!18237 array!18237 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300729 (arrayRangesEq!1582 a1!948 a2!948 (_1!13179 lt!436200) (_2!13179 lt!436200))))

(declare-fun b!300730 () Bool)

(declare-fun e!215961 () Bool)

(assert (=> b!300730 (= e!215961 call!5402)))

(declare-fun b!300731 () Bool)

(declare-fun lt!436203 () Unit!21041)

(assert (=> b!300731 (= e!215966 lt!436203)))

(declare-fun arrayRangesEqImpliesEq!237 (array!18237 array!18237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21041)

(assert (=> b!300731 (= lt!436203 (arrayRangesEqImpliesEq!237 a1!948 a2!948 (_1!13179 lt!436201) (_4!524 lt!436200) (_2!13179 lt!436201)))))

(assert (=> b!300731 (= (select (arr!9003 a1!948) (_4!524 lt!436200)) (select (arr!9003 a2!948) (_4!524 lt!436200)))))

(declare-fun b!300732 () Bool)

(declare-fun lt!436193 () Unit!21041)

(assert (=> b!300732 (= e!215958 lt!436193)))

(assert (=> b!300732 (= lt!436193 (arrayRangesEqImpliesEq!237 a1!948 a2!948 (_1!13179 lt!436201) (_3!1481 lt!436200) (_2!13179 lt!436201)))))

(assert (=> b!300732 (= (select (arr!9003 a1!948) (_3!1481 lt!436200)) (select (arr!9003 a2!948) (_3!1481 lt!436200)))))

(declare-fun b!300733 () Bool)

(assert (=> b!300733 (= e!215964 e!215957)))

(declare-fun res!247827 () Bool)

(assert (=> b!300733 (=> (not res!247827) (not e!215957))))

(assert (=> b!300733 (= res!247827 e!215956)))

(assert (=> b!300733 (= c!14031 (= (_3!1481 lt!436201) (_4!524 lt!436201)))))

(declare-fun lt!436202 () Unit!21041)

(assert (=> b!300733 (= lt!436202 e!215965)))

(declare-fun c!14032 () Bool)

(assert (=> b!300733 (= c!14032 (bvslt (_1!13179 lt!436200) (_2!13179 lt!436200)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1048)

(assert (=> b!300733 (= lt!436200 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300733 (= lt!436197 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300733 (= lt!436195 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300733 (= lt!436201 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300734 () Bool)

(declare-fun res!247829 () Bool)

(assert (=> b!300734 (=> (not res!247829) (not e!215964))))

(declare-fun arrayBitRangesEq!0 (array!18237 array!18237 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300734 (= res!247829 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300735 () Bool)

(declare-fun res!247826 () Bool)

(assert (=> b!300735 (= res!247826 (= lt!436197 #b00000000000000000000000000000000))))

(assert (=> b!300735 (=> res!247826 e!215961)))

(assert (=> b!300735 (= e!215959 e!215961)))

(assert (= (and start!67076 res!247822) b!300728))

(assert (= (and b!300728 res!247823) b!300734))

(assert (= (and b!300734 res!247829) b!300721))

(assert (= (and b!300721 res!247821) b!300733))

(assert (= (and b!300733 c!14032) b!300729))

(assert (= (and b!300733 (not c!14032)) b!300723))

(assert (= (and b!300733 c!14031) b!300719))

(assert (= (and b!300733 (not c!14031)) b!300720))

(assert (= (and b!300720 res!247825) b!300735))

(assert (= (and b!300735 (not res!247826)) b!300730))

(assert (= (or b!300719 b!300730) bm!5399))

(assert (= (and b!300733 res!247827) b!300725))

(assert (= (and b!300725 c!14033) b!300732))

(assert (= (and b!300725 (not c!14033)) b!300722))

(assert (= (and b!300725 c!14034) b!300731))

(assert (= (and b!300725 (not c!14034)) b!300724))

(assert (= (and b!300725 res!247824) b!300726))

(assert (= (and b!300726 res!247828) b!300727))

(declare-fun m!439665 () Bool)

(assert (=> b!300729 m!439665))

(declare-fun m!439667 () Bool)

(assert (=> b!300729 m!439667))

(declare-fun m!439669 () Bool)

(assert (=> start!67076 m!439669))

(declare-fun m!439671 () Bool)

(assert (=> start!67076 m!439671))

(declare-fun m!439673 () Bool)

(assert (=> b!300734 m!439673))

(declare-fun m!439675 () Bool)

(assert (=> b!300733 m!439675))

(declare-fun m!439677 () Bool)

(assert (=> b!300733 m!439677))

(declare-fun m!439679 () Bool)

(assert (=> b!300732 m!439679))

(declare-fun m!439681 () Bool)

(assert (=> b!300732 m!439681))

(declare-fun m!439683 () Bool)

(assert (=> b!300732 m!439683))

(assert (=> b!300726 m!439681))

(assert (=> b!300726 m!439683))

(assert (=> b!300726 m!439681))

(assert (=> b!300726 m!439683))

(declare-fun m!439685 () Bool)

(assert (=> b!300726 m!439685))

(declare-fun m!439687 () Bool)

(assert (=> bm!5399 m!439687))

(declare-fun m!439689 () Bool)

(assert (=> bm!5399 m!439689))

(declare-fun m!439691 () Bool)

(assert (=> bm!5399 m!439691))

(declare-fun m!439693 () Bool)

(assert (=> bm!5399 m!439693))

(declare-fun m!439695 () Bool)

(assert (=> bm!5399 m!439695))

(declare-fun m!439697 () Bool)

(assert (=> b!300731 m!439697))

(declare-fun m!439699 () Bool)

(assert (=> b!300731 m!439699))

(declare-fun m!439701 () Bool)

(assert (=> b!300731 m!439701))

(assert (=> b!300720 m!439691))

(assert (=> b!300720 m!439693))

(assert (=> b!300720 m!439691))

(assert (=> b!300720 m!439693))

(declare-fun m!439703 () Bool)

(assert (=> b!300720 m!439703))

(push 1)

(assert (not b!300733))

(assert (not b!300732))

(assert (not bm!5399))

(assert (not start!67076))

(assert (not b!300726))

(assert (not b!300731))

(assert (not b!300720))

(assert (not b!300734))

(assert (not b!300729))

(check-sat)

(pop 1)

(push 1)

(check-sat)


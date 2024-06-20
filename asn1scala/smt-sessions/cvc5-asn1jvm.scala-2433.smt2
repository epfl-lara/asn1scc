; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61980 () Bool)

(assert start!61980)

(declare-fun lt!415553 () (_ BitVec 32))

(declare-fun b!277747 () Bool)

(declare-fun e!197679 () Bool)

(declare-fun lt!415555 () (_ BitVec 32))

(declare-datatypes ((tuple4!594 0))(
  ( (tuple4!595 (_1!12372 (_ BitVec 32)) (_2!12372 (_ BitVec 32)) (_3!1077 (_ BitVec 32)) (_4!297 (_ BitVec 32))) )
))
(declare-fun lt!415556 () tuple4!594)

(assert (=> b!277747 (= e!197679 (and (= (_3!1077 lt!415556) (_4!297 lt!415556)) (or (bvsgt #b00000000000000000000000000000000 lt!415555) (bvsgt lt!415555 lt!415553) (bvsgt lt!415553 #b00000000000000000000000000001000))))))

(declare-datatypes ((Unit!19407 0))(
  ( (Unit!19408) )
))
(declare-fun lt!415554 () Unit!19407)

(declare-fun e!197681 () Unit!19407)

(assert (=> b!277747 (= lt!415554 e!197681)))

(declare-fun c!12696 () Bool)

(assert (=> b!277747 (= c!12696 (bvslt (_1!12372 lt!415556) (_2!12372 lt!415556)))))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277747 (= lt!415553 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!277747 (= lt!415555 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!594)

(assert (=> b!277747 (= lt!415556 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277748 () Bool)

(declare-fun Unit!19409 () Unit!19407)

(assert (=> b!277748 (= e!197681 Unit!19409)))

(declare-datatypes ((array!15961 0))(
  ( (array!15962 (arr!7900 (Array (_ BitVec 32) (_ BitVec 8))) (size!6904 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15961)

(declare-fun a2!699 () array!15961)

(declare-fun arrayRangesEq!1190 (array!15961 array!15961 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277748 (arrayRangesEq!1190 a1!699 a2!699 (_1!12372 lt!415556) (_2!12372 lt!415556))))

(declare-fun lt!415557 () Unit!19407)

(declare-fun arrayRangesEqSymmetricLemma!109 (array!15961 array!15961 (_ BitVec 32) (_ BitVec 32)) Unit!19407)

(assert (=> b!277748 (= lt!415557 (arrayRangesEqSymmetricLemma!109 a1!699 a2!699 (_1!12372 lt!415556) (_2!12372 lt!415556)))))

(assert (=> b!277748 (arrayRangesEq!1190 a2!699 a1!699 (_1!12372 lt!415556) (_2!12372 lt!415556))))

(declare-fun b!277749 () Bool)

(declare-fun res!230698 () Bool)

(assert (=> b!277749 (=> (not res!230698) (not e!197679))))

(assert (=> b!277749 (= res!230698 (bvslt from!822 to!789))))

(declare-fun b!277750 () Bool)

(declare-fun res!230697 () Bool)

(assert (=> b!277750 (=> (not res!230697) (not e!197679))))

(declare-fun arrayBitRangesEq!0 (array!15961 array!15961 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277750 (= res!230697 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277746 () Bool)

(declare-fun Unit!19410 () Unit!19407)

(assert (=> b!277746 (= e!197681 Unit!19410)))

(declare-fun res!230699 () Bool)

(assert (=> start!61980 (=> (not res!230699) (not e!197679))))

(assert (=> start!61980 (= res!230699 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6904 a1!699) (size!6904 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6904 a1!699))))))))

(assert (=> start!61980 e!197679))

(assert (=> start!61980 true))

(declare-fun array_inv!6628 (array!15961) Bool)

(assert (=> start!61980 (array_inv!6628 a1!699)))

(assert (=> start!61980 (array_inv!6628 a2!699)))

(assert (= (and start!61980 res!230699) b!277750))

(assert (= (and b!277750 res!230697) b!277749))

(assert (= (and b!277749 res!230698) b!277747))

(assert (= (and b!277747 c!12696) b!277748))

(assert (= (and b!277747 (not c!12696)) b!277746))

(declare-fun m!410869 () Bool)

(assert (=> b!277747 m!410869))

(declare-fun m!410871 () Bool)

(assert (=> b!277748 m!410871))

(declare-fun m!410873 () Bool)

(assert (=> b!277748 m!410873))

(declare-fun m!410875 () Bool)

(assert (=> b!277748 m!410875))

(declare-fun m!410877 () Bool)

(assert (=> b!277750 m!410877))

(declare-fun m!410879 () Bool)

(assert (=> start!61980 m!410879))

(declare-fun m!410881 () Bool)

(assert (=> start!61980 m!410881))

(push 1)

(assert (not start!61980))

(assert (not b!277747))

(assert (not b!277748))

(assert (not b!277750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95812 () Bool)

(assert (=> d!95812 (= (array_inv!6628 a1!699) (bvsge (size!6904 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61980 d!95812))

(declare-fun d!95814 () Bool)

(assert (=> d!95814 (= (array_inv!6628 a2!699) (bvsge (size!6904 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61980 d!95814))

(declare-fun d!95816 () Bool)

(assert (=> d!95816 (= (arrayBitIndices!0 from!822 to!789) (tuple4!595 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277747 d!95816))

(declare-fun d!95820 () Bool)

(declare-fun res!230730 () Bool)

(declare-fun e!197719 () Bool)

(assert (=> d!95820 (=> res!230730 e!197719)))

(assert (=> d!95820 (= res!230730 (= (_1!12372 lt!415556) (_2!12372 lt!415556)))))

(assert (=> d!95820 (= (arrayRangesEq!1190 a1!699 a2!699 (_1!12372 lt!415556) (_2!12372 lt!415556)) e!197719)))

(declare-fun b!277793 () Bool)

(declare-fun e!197720 () Bool)

(assert (=> b!277793 (= e!197719 e!197720)))

(declare-fun res!230731 () Bool)

(assert (=> b!277793 (=> (not res!230731) (not e!197720))))

(assert (=> b!277793 (= res!230731 (= (select (arr!7900 a1!699) (_1!12372 lt!415556)) (select (arr!7900 a2!699) (_1!12372 lt!415556))))))

(declare-fun b!277794 () Bool)

(assert (=> b!277794 (= e!197720 (arrayRangesEq!1190 a1!699 a2!699 (bvadd (_1!12372 lt!415556) #b00000000000000000000000000000001) (_2!12372 lt!415556)))))

(assert (= (and d!95820 (not res!230730)) b!277793))

(assert (= (and b!277793 res!230731) b!277794))

(declare-fun m!410921 () Bool)

(assert (=> b!277793 m!410921))

(declare-fun m!410923 () Bool)

(assert (=> b!277793 m!410923))

(declare-fun m!410925 () Bool)

(assert (=> b!277794 m!410925))

(assert (=> b!277748 d!95820))

(declare-fun d!95824 () Bool)

(assert (=> d!95824 (arrayRangesEq!1190 a2!699 a1!699 (_1!12372 lt!415556) (_2!12372 lt!415556))))

(declare-fun lt!415593 () Unit!19407)

(declare-fun choose!452 (array!15961 array!15961 (_ BitVec 32) (_ BitVec 32)) Unit!19407)

(assert (=> d!95824 (= lt!415593 (choose!452 a1!699 a2!699 (_1!12372 lt!415556) (_2!12372 lt!415556)))))

(assert (=> d!95824 (and (bvsle #b00000000000000000000000000000000 (_1!12372 lt!415556)) (bvsle (_1!12372 lt!415556) (_2!12372 lt!415556)) (bvsle (_2!12372 lt!415556) (size!6904 a1!699)))))

(assert (=> d!95824 (= (arrayRangesEqSymmetricLemma!109 a1!699 a2!699 (_1!12372 lt!415556) (_2!12372 lt!415556)) lt!415593)))

(declare-fun bs!24159 () Bool)

(assert (= bs!24159 d!95824))

(assert (=> bs!24159 m!410875))

(declare-fun m!410927 () Bool)

(assert (=> bs!24159 m!410927))

(assert (=> b!277748 d!95824))

(declare-fun d!95826 () Bool)

(declare-fun res!230732 () Bool)

(declare-fun e!197721 () Bool)

(assert (=> d!95826 (=> res!230732 e!197721)))

(assert (=> d!95826 (= res!230732 (= (_1!12372 lt!415556) (_2!12372 lt!415556)))))

(assert (=> d!95826 (= (arrayRangesEq!1190 a2!699 a1!699 (_1!12372 lt!415556) (_2!12372 lt!415556)) e!197721)))

(declare-fun b!277795 () Bool)

(declare-fun e!197722 () Bool)

(assert (=> b!277795 (= e!197721 e!197722)))

(declare-fun res!230733 () Bool)

(assert (=> b!277795 (=> (not res!230733) (not e!197722))))

(assert (=> b!277795 (= res!230733 (= (select (arr!7900 a2!699) (_1!12372 lt!415556)) (select (arr!7900 a1!699) (_1!12372 lt!415556))))))

(declare-fun b!277796 () Bool)

(assert (=> b!277796 (= e!197722 (arrayRangesEq!1190 a2!699 a1!699 (bvadd (_1!12372 lt!415556) #b00000000000000000000000000000001) (_2!12372 lt!415556)))))

(assert (= (and d!95826 (not res!230732)) b!277795))

(assert (= (and b!277795 res!230733) b!277796))

(assert (=> b!277795 m!410923))

(assert (=> b!277795 m!410921))

(declare-fun m!410929 () Bool)

(assert (=> b!277796 m!410929))

(assert (=> b!277748 d!95826))

(declare-fun b!277825 () Bool)

(declare-fun e!197750 () Bool)

(declare-fun e!197752 () Bool)

(assert (=> b!277825 (= e!197750 e!197752)))

(declare-fun res!230757 () Bool)

(declare-fun call!4513 () Bool)

(assert (=> b!277825 (= res!230757 call!4513)))

(assert (=> b!277825 (=> (not res!230757) (not e!197752))))

(declare-fun d!95828 () Bool)

(declare-fun res!230758 () Bool)

(declare-fun e!197751 () Bool)

(assert (=> d!95828 (=> res!230758 e!197751)))

(assert (=> d!95828 (= res!230758 (bvsge from!822 to!789))))

(assert (=> d!95828 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197751)))

(declare-fun b!277826 () Bool)

(declare-fun lt!415607 () (_ BitVec 32))

(declare-fun e!197749 () Bool)

(declare-fun lt!415608 () tuple4!594)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277826 (= e!197749 (byteRangesEq!0 (select (arr!7900 a1!699) (_4!297 lt!415608)) (select (arr!7900 a2!699) (_4!297 lt!415608)) #b00000000000000000000000000000000 lt!415607))))

(declare-fun b!277827 () Bool)

(declare-fun e!197747 () Bool)

(assert (=> b!277827 (= e!197751 e!197747)))

(declare-fun res!230755 () Bool)

(assert (=> b!277827 (=> (not res!230755) (not e!197747))))

(declare-fun e!197748 () Bool)

(assert (=> b!277827 (= res!230755 e!197748)))

(declare-fun res!230754 () Bool)

(assert (=> b!277827 (=> res!230754 e!197748)))

(assert (=> b!277827 (= res!230754 (bvsge (_1!12372 lt!415608) (_2!12372 lt!415608)))))

(assert (=> b!277827 (= lt!415607 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415606 () (_ BitVec 32))

(assert (=> b!277827 (= lt!415606 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277827 (= lt!415608 (arrayBitIndices!0 from!822 to!789))))

(declare-fun c!12707 () Bool)

(declare-fun bm!4510 () Bool)

(assert (=> bm!4510 (= call!4513 (byteRangesEq!0 (select (arr!7900 a1!699) (_3!1077 lt!415608)) (select (arr!7900 a2!699) (_3!1077 lt!415608)) lt!415606 (ite c!12707 lt!415607 #b00000000000000000000000000001000)))))

(declare-fun b!277828 () Bool)

(declare-fun res!230756 () Bool)

(assert (=> b!277828 (= res!230756 (= lt!415607 #b00000000000000000000000000000000))))

(assert (=> b!277828 (=> res!230756 e!197749)))

(assert (=> b!277828 (= e!197752 e!197749)))

(declare-fun b!277829 () Bool)

(assert (=> b!277829 (= e!197747 e!197750)))

(assert (=> b!277829 (= c!12707 (= (_3!1077 lt!415608) (_4!297 lt!415608)))))

(declare-fun b!277830 () Bool)

(assert (=> b!277830 (= e!197748 (arrayRangesEq!1190 a1!699 a2!699 (_1!12372 lt!415608) (_2!12372 lt!415608)))))

(declare-fun b!277831 () Bool)

(assert (=> b!277831 (= e!197750 call!4513)))

(assert (= (and d!95828 (not res!230758)) b!277827))

(assert (= (and b!277827 (not res!230754)) b!277830))

(assert (= (and b!277827 res!230755) b!277829))

(assert (= (and b!277829 c!12707) b!277831))

(assert (= (and b!277829 (not c!12707)) b!277825))

(assert (= (and b!277825 res!230757) b!277828))

(assert (= (and b!277828 (not res!230756)) b!277826))

(assert (= (or b!277831 b!277825) bm!4510))

(declare-fun m!410931 () Bool)

(assert (=> b!277826 m!410931))

(declare-fun m!410933 () Bool)

(assert (=> b!277826 m!410933))

(assert (=> b!277826 m!410931))

(assert (=> b!277826 m!410933))

(declare-fun m!410935 () Bool)

(assert (=> b!277826 m!410935))

(assert (=> b!277827 m!410869))

(declare-fun m!410937 () Bool)

(assert (=> bm!4510 m!410937))

(declare-fun m!410939 () Bool)

(assert (=> bm!4510 m!410939))

(assert (=> bm!4510 m!410937))

(assert (=> bm!4510 m!410939))

(declare-fun m!410941 () Bool)

(assert (=> bm!4510 m!410941))

(declare-fun m!410943 () Bool)

(assert (=> b!277830 m!410943))

(assert (=> b!277750 d!95828))

(push 1)

(assert (not d!95824))

(assert (not b!277827))

(assert (not b!277796))

(assert (not b!277830))

(assert (not bm!4510))

(assert (not b!277794))

(assert (not b!277826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61984 () Bool)

(assert start!61984)

(declare-fun lt!415586 () (_ BitVec 32))

(declare-fun e!197703 () Bool)

(declare-fun lt!415583 () (_ BitVec 32))

(declare-fun b!277776 () Bool)

(declare-datatypes ((tuple4!598 0))(
  ( (tuple4!599 (_1!12374 (_ BitVec 32)) (_2!12374 (_ BitVec 32)) (_3!1079 (_ BitVec 32)) (_4!299 (_ BitVec 32))) )
))
(declare-fun lt!415584 () tuple4!598)

(assert (=> b!277776 (= e!197703 (and (= (_3!1079 lt!415584) (_4!299 lt!415584)) (or (bvsgt #b00000000000000000000000000000000 lt!415583) (bvsgt lt!415583 lt!415586) (bvsgt lt!415586 #b00000000000000000000000000001000))))))

(declare-datatypes ((Unit!19415 0))(
  ( (Unit!19416) )
))
(declare-fun lt!415587 () Unit!19415)

(declare-fun e!197705 () Unit!19415)

(assert (=> b!277776 (= lt!415587 e!197705)))

(declare-fun c!12702 () Bool)

(assert (=> b!277776 (= c!12702 (bvslt (_1!12374 lt!415584) (_2!12374 lt!415584)))))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277776 (= lt!415586 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!277776 (= lt!415583 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!598)

(assert (=> b!277776 (= lt!415584 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277777 () Bool)

(declare-fun Unit!19417 () Unit!19415)

(assert (=> b!277777 (= e!197705 Unit!19417)))

(declare-datatypes ((array!15965 0))(
  ( (array!15966 (arr!7902 (Array (_ BitVec 32) (_ BitVec 8))) (size!6906 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15965)

(declare-fun a2!699 () array!15965)

(declare-fun arrayRangesEq!1192 (array!15965 array!15965 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277777 (arrayRangesEq!1192 a1!699 a2!699 (_1!12374 lt!415584) (_2!12374 lt!415584))))

(declare-fun lt!415585 () Unit!19415)

(declare-fun arrayRangesEqSymmetricLemma!111 (array!15965 array!15965 (_ BitVec 32) (_ BitVec 32)) Unit!19415)

(assert (=> b!277777 (= lt!415585 (arrayRangesEqSymmetricLemma!111 a1!699 a2!699 (_1!12374 lt!415584) (_2!12374 lt!415584)))))

(assert (=> b!277777 (arrayRangesEq!1192 a2!699 a1!699 (_1!12374 lt!415584) (_2!12374 lt!415584))))

(declare-fun b!277778 () Bool)

(declare-fun res!230715 () Bool)

(assert (=> b!277778 (=> (not res!230715) (not e!197703))))

(declare-fun arrayBitRangesEq!0 (array!15965 array!15965 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277778 (= res!230715 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277779 () Bool)

(declare-fun Unit!19418 () Unit!19415)

(assert (=> b!277779 (= e!197705 Unit!19418)))

(declare-fun b!277780 () Bool)

(declare-fun res!230717 () Bool)

(assert (=> b!277780 (=> (not res!230717) (not e!197703))))

(assert (=> b!277780 (= res!230717 (bvslt from!822 to!789))))

(declare-fun res!230716 () Bool)

(assert (=> start!61984 (=> (not res!230716) (not e!197703))))

(assert (=> start!61984 (= res!230716 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6906 a1!699) (size!6906 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6906 a1!699))))))))

(assert (=> start!61984 e!197703))

(assert (=> start!61984 true))

(declare-fun array_inv!6630 (array!15965) Bool)

(assert (=> start!61984 (array_inv!6630 a1!699)))

(assert (=> start!61984 (array_inv!6630 a2!699)))

(assert (= (and start!61984 res!230716) b!277778))

(assert (= (and b!277778 res!230715) b!277780))

(assert (= (and b!277780 res!230717) b!277776))

(assert (= (and b!277776 c!12702) b!277777))

(assert (= (and b!277776 (not c!12702)) b!277779))

(declare-fun m!410897 () Bool)

(assert (=> b!277776 m!410897))

(declare-fun m!410899 () Bool)

(assert (=> b!277777 m!410899))

(declare-fun m!410901 () Bool)

(assert (=> b!277777 m!410901))

(declare-fun m!410903 () Bool)

(assert (=> b!277777 m!410903))

(declare-fun m!410905 () Bool)

(assert (=> b!277778 m!410905))

(declare-fun m!410907 () Bool)

(assert (=> start!61984 m!410907))

(declare-fun m!410909 () Bool)

(assert (=> start!61984 m!410909))

(push 1)

(assert (not b!277776))

(assert (not start!61984))

(assert (not b!277778))

(assert (not b!277777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95830 () Bool)

(assert (=> d!95830 (= (arrayBitIndices!0 from!822 to!789) (tuple4!599 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277776 d!95830))

(declare-fun d!95832 () Bool)

(assert (=> d!95832 (= (array_inv!6630 a1!699) (bvsge (size!6906 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61984 d!95832))

(declare-fun d!95834 () Bool)

(assert (=> d!95834 (= (array_inv!6630 a2!699) (bvsge (size!6906 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61984 d!95834))

(declare-fun e!197773 () Bool)

(declare-fun b!277853 () Bool)

(declare-fun lt!415619 () tuple4!598)

(assert (=> b!277853 (= e!197773 (arrayRangesEq!1192 a1!699 a2!699 (_1!12374 lt!415619) (_2!12374 lt!415619)))))

(declare-fun b!277854 () Bool)

(declare-fun e!197771 () Bool)

(declare-fun e!197772 () Bool)

(assert (=> b!277854 (= e!197771 e!197772)))

(declare-fun res!230778 () Bool)

(declare-fun call!4517 () Bool)

(assert (=> b!277854 (= res!230778 call!4517)))

(assert (=> b!277854 (=> (not res!230778) (not e!197772))))

(declare-fun e!197775 () Bool)

(declare-fun b!277856 () Bool)

(declare-fun lt!415620 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277856 (= e!197775 (byteRangesEq!0 (select (arr!7902 a1!699) (_4!299 lt!415619)) (select (arr!7902 a2!699) (_4!299 lt!415619)) #b00000000000000000000000000000000 lt!415620))))

(declare-fun b!277857 () Bool)

(assert (=> b!277857 (= e!197771 call!4517)))

(declare-fun b!277858 () Bool)

(declare-fun e!197776 () Bool)

(assert (=> b!277858 (= e!197776 e!197771)))

(declare-fun c!12711 () Bool)

(assert (=> b!277858 (= c!12711 (= (_3!1079 lt!415619) (_4!299 lt!415619)))))

(declare-fun b!277855 () Bool)

(declare-fun e!197774 () Bool)

(assert (=> b!277855 (= e!197774 e!197776)))

(declare-fun res!230776 () Bool)

(assert (=> b!277855 (=> (not res!230776) (not e!197776))))

(assert (=> b!277855 (= res!230776 e!197773)))

(declare-fun res!230777 () Bool)

(assert (=> b!277855 (=> res!230777 e!197773)))

(assert (=> b!277855 (= res!230777 (bvsge (_1!12374 lt!415619) (_2!12374 lt!415619)))))

(assert (=> b!277855 (= lt!415620 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415618 () (_ BitVec 32))

(assert (=> b!277855 (= lt!415618 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277855 (= lt!415619 (arrayBitIndices!0 from!822 to!789))))

(declare-fun d!95836 () Bool)

(declare-fun res!230775 () Bool)

(assert (=> d!95836 (=> res!230775 e!197774)))

(assert (=> d!95836 (= res!230775 (bvsge from!822 to!789))))

(assert (=> d!95836 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197774)))

(declare-fun b!277859 () Bool)

(declare-fun res!230774 () Bool)

(assert (=> b!277859 (= res!230774 (= lt!415620 #b00000000000000000000000000000000))))

(assert (=> b!277859 (=> res!230774 e!197775)))

(assert (=> b!277859 (= e!197772 e!197775)))

(declare-fun bm!4514 () Bool)

(assert (=> bm!4514 (= call!4517 (byteRangesEq!0 (select (arr!7902 a1!699) (_3!1079 lt!415619)) (select (arr!7902 a2!699) (_3!1079 lt!415619)) lt!415618 (ite c!12711 lt!415620 #b00000000000000000000000000001000)))))

(assert (= (and d!95836 (not res!230775)) b!277855))

(assert (= (and b!277855 (not res!230777)) b!277853))

(assert (= (and b!277855 res!230776) b!277858))

(assert (= (and b!277858 c!12711) b!277857))

(assert (= (and b!277858 (not c!12711)) b!277854))

(assert (= (and b!277854 res!230778) b!277859))

(assert (= (and b!277859 (not res!230774)) b!277856))

(assert (= (or b!277857 b!277854) bm!4514))

(declare-fun m!410959 () Bool)

(assert (=> b!277853 m!410959))

(declare-fun m!410961 () Bool)

(assert (=> b!277856 m!410961))

(declare-fun m!410963 () Bool)

(assert (=> b!277856 m!410963))

(assert (=> b!277856 m!410961))

(assert (=> b!277856 m!410963))

(declare-fun m!410965 () Bool)

(assert (=> b!277856 m!410965))

(assert (=> b!277855 m!410897))

(declare-fun m!410967 () Bool)

(assert (=> bm!4514 m!410967))

(declare-fun m!410969 () Bool)

(assert (=> bm!4514 m!410969))

(assert (=> bm!4514 m!410967))

(assert (=> bm!4514 m!410969))

(declare-fun m!410971 () Bool)

(assert (=> bm!4514 m!410971))

(assert (=> b!277778 d!95836))

(declare-fun d!95840 () Bool)

(declare-fun res!230783 () Bool)

(declare-fun e!197781 () Bool)

(assert (=> d!95840 (=> res!230783 e!197781)))

(assert (=> d!95840 (= res!230783 (= (_1!12374 lt!415584) (_2!12374 lt!415584)))))

(assert (=> d!95840 (= (arrayRangesEq!1192 a1!699 a2!699 (_1!12374 lt!415584) (_2!12374 lt!415584)) e!197781)))

(declare-fun b!277864 () Bool)

(declare-fun e!197782 () Bool)

(assert (=> b!277864 (= e!197781 e!197782)))

(declare-fun res!230784 () Bool)

(assert (=> b!277864 (=> (not res!230784) (not e!197782))))

(assert (=> b!277864 (= res!230784 (= (select (arr!7902 a1!699) (_1!12374 lt!415584)) (select (arr!7902 a2!699) (_1!12374 lt!415584))))))

(declare-fun b!277865 () Bool)

(assert (=> b!277865 (= e!197782 (arrayRangesEq!1192 a1!699 a2!699 (bvadd (_1!12374 lt!415584) #b00000000000000000000000000000001) (_2!12374 lt!415584)))))

(assert (= (and d!95840 (not res!230783)) b!277864))

(assert (= (and b!277864 res!230784) b!277865))

(declare-fun m!410973 () Bool)

(assert (=> b!277864 m!410973))

(declare-fun m!410975 () Bool)

(assert (=> b!277864 m!410975))

(declare-fun m!410977 () Bool)

(assert (=> b!277865 m!410977))

(assert (=> b!277777 d!95840))

(declare-fun d!95842 () Bool)

(assert (=> d!95842 (arrayRangesEq!1192 a2!699 a1!699 (_1!12374 lt!415584) (_2!12374 lt!415584))))

(declare-fun lt!415623 () Unit!19415)

(declare-fun choose!454 (array!15965 array!15965 (_ BitVec 32) (_ BitVec 32)) Unit!19415)

(assert (=> d!95842 (= lt!415623 (choose!454 a1!699 a2!699 (_1!12374 lt!415584) (_2!12374 lt!415584)))))

(assert (=> d!95842 (and (bvsle #b00000000000000000000000000000000 (_1!12374 lt!415584)) (bvsle (_1!12374 lt!415584) (_2!12374 lt!415584)) (bvsle (_2!12374 lt!415584) (size!6906 a1!699)))))

(assert (=> d!95842 (= (arrayRangesEqSymmetricLemma!111 a1!699 a2!699 (_1!12374 lt!415584) (_2!12374 lt!415584)) lt!415623)))

(declare-fun bs!24160 () Bool)

(assert (= bs!24160 d!95842))

(assert (=> bs!24160 m!410903))

(declare-fun m!410979 () Bool)

(assert (=> bs!24160 m!410979))

(assert (=> b!277777 d!95842))

(declare-fun d!95844 () Bool)

(declare-fun res!230785 () Bool)

(declare-fun e!197783 () Bool)

(assert (=> d!95844 (=> res!230785 e!197783)))

(assert (=> d!95844 (= res!230785 (= (_1!12374 lt!415584) (_2!12374 lt!415584)))))

(assert (=> d!95844 (= (arrayRangesEq!1192 a2!699 a1!699 (_1!12374 lt!415584) (_2!12374 lt!415584)) e!197783)))

(declare-fun b!277866 () Bool)

(declare-fun e!197784 () Bool)

(assert (=> b!277866 (= e!197783 e!197784)))

(declare-fun res!230786 () Bool)

(assert (=> b!277866 (=> (not res!230786) (not e!197784))))

(assert (=> b!277866 (= res!230786 (= (select (arr!7902 a2!699) (_1!12374 lt!415584)) (select (arr!7902 a1!699) (_1!12374 lt!415584))))))

(declare-fun b!277867 () Bool)

(assert (=> b!277867 (= e!197784 (arrayRangesEq!1192 a2!699 a1!699 (bvadd (_1!12374 lt!415584) #b00000000000000000000000000000001) (_2!12374 lt!415584)))))

(assert (= (and d!95844 (not res!230785)) b!277866))

(assert (= (and b!277866 res!230786) b!277867))

(assert (=> b!277866 m!410975))

(assert (=> b!277866 m!410973))

(declare-fun m!410981 () Bool)

(assert (=> b!277867 m!410981))

(assert (=> b!277777 d!95844))

(push 1)

(assert (not b!277865))

(assert (not b!277855))

(assert (not d!95842))

(assert (not b!277867))

(assert (not b!277856))

(assert (not b!277853))

(assert (not bm!4514))

(check-sat)

(pop 1)

(push 1)

(check-sat)


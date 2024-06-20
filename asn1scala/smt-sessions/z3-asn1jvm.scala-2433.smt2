; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61982 () Bool)

(assert start!61982)

(declare-fun b!277761 () Bool)

(declare-fun res!230707 () Bool)

(declare-fun e!197693 () Bool)

(assert (=> b!277761 (=> (not res!230707) (not e!197693))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277761 (= res!230707 (bvslt from!822 to!789))))

(declare-fun b!277762 () Bool)

(declare-datatypes ((Unit!19411 0))(
  ( (Unit!19412) )
))
(declare-fun e!197691 () Unit!19411)

(declare-fun Unit!19413 () Unit!19411)

(assert (=> b!277762 (= e!197691 Unit!19413)))

(declare-fun b!277763 () Bool)

(declare-fun res!230706 () Bool)

(assert (=> b!277763 (=> (not res!230706) (not e!197693))))

(declare-datatypes ((array!15963 0))(
  ( (array!15964 (arr!7901 (Array (_ BitVec 32) (_ BitVec 8))) (size!6905 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15963)

(declare-fun a2!699 () array!15963)

(declare-fun arrayBitRangesEq!0 (array!15963 array!15963 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277763 (= res!230706 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!230708 () Bool)

(assert (=> start!61982 (=> (not res!230708) (not e!197693))))

(assert (=> start!61982 (= res!230708 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6905 a1!699) (size!6905 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6905 a1!699))))))))

(assert (=> start!61982 e!197693))

(assert (=> start!61982 true))

(declare-fun array_inv!6629 (array!15963) Bool)

(assert (=> start!61982 (array_inv!6629 a1!699)))

(assert (=> start!61982 (array_inv!6629 a2!699)))

(declare-fun lt!415569 () (_ BitVec 32))

(declare-fun b!277764 () Bool)

(declare-datatypes ((tuple4!596 0))(
  ( (tuple4!597 (_1!12373 (_ BitVec 32)) (_2!12373 (_ BitVec 32)) (_3!1078 (_ BitVec 32)) (_4!298 (_ BitVec 32))) )
))
(declare-fun lt!415568 () tuple4!596)

(declare-fun lt!415570 () (_ BitVec 32))

(assert (=> b!277764 (= e!197693 (and (= (_3!1078 lt!415568) (_4!298 lt!415568)) (or (bvsgt #b00000000000000000000000000000000 lt!415570) (bvsgt lt!415570 lt!415569) (bvsgt lt!415569 #b00000000000000000000000000001000))))))

(declare-fun lt!415572 () Unit!19411)

(assert (=> b!277764 (= lt!415572 e!197691)))

(declare-fun c!12699 () Bool)

(assert (=> b!277764 (= c!12699 (bvslt (_1!12373 lt!415568) (_2!12373 lt!415568)))))

(assert (=> b!277764 (= lt!415569 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277764 (= lt!415570 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!596)

(assert (=> b!277764 (= lt!415568 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277765 () Bool)

(declare-fun Unit!19414 () Unit!19411)

(assert (=> b!277765 (= e!197691 Unit!19414)))

(declare-fun arrayRangesEq!1191 (array!15963 array!15963 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277765 (arrayRangesEq!1191 a1!699 a2!699 (_1!12373 lt!415568) (_2!12373 lt!415568))))

(declare-fun lt!415571 () Unit!19411)

(declare-fun arrayRangesEqSymmetricLemma!110 (array!15963 array!15963 (_ BitVec 32) (_ BitVec 32)) Unit!19411)

(assert (=> b!277765 (= lt!415571 (arrayRangesEqSymmetricLemma!110 a1!699 a2!699 (_1!12373 lt!415568) (_2!12373 lt!415568)))))

(assert (=> b!277765 (arrayRangesEq!1191 a2!699 a1!699 (_1!12373 lt!415568) (_2!12373 lt!415568))))

(assert (= (and start!61982 res!230708) b!277763))

(assert (= (and b!277763 res!230706) b!277761))

(assert (= (and b!277761 res!230707) b!277764))

(assert (= (and b!277764 c!12699) b!277765))

(assert (= (and b!277764 (not c!12699)) b!277762))

(declare-fun m!410883 () Bool)

(assert (=> b!277763 m!410883))

(declare-fun m!410885 () Bool)

(assert (=> start!61982 m!410885))

(declare-fun m!410887 () Bool)

(assert (=> start!61982 m!410887))

(declare-fun m!410889 () Bool)

(assert (=> b!277764 m!410889))

(declare-fun m!410891 () Bool)

(assert (=> b!277765 m!410891))

(declare-fun m!410893 () Bool)

(assert (=> b!277765 m!410893))

(declare-fun m!410895 () Bool)

(assert (=> b!277765 m!410895))

(check-sat (not start!61982) (not b!277765) (not b!277763) (not b!277764))
(check-sat)
(get-model)

(declare-fun d!95804 () Bool)

(assert (=> d!95804 (= (array_inv!6629 a1!699) (bvsge (size!6905 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61982 d!95804))

(declare-fun d!95806 () Bool)

(assert (=> d!95806 (= (array_inv!6629 a2!699) (bvsge (size!6905 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61982 d!95806))

(declare-fun d!95808 () Bool)

(declare-fun res!230722 () Bool)

(declare-fun e!197711 () Bool)

(assert (=> d!95808 (=> res!230722 e!197711)))

(assert (=> d!95808 (= res!230722 (= (_1!12373 lt!415568) (_2!12373 lt!415568)))))

(assert (=> d!95808 (= (arrayRangesEq!1191 a1!699 a2!699 (_1!12373 lt!415568) (_2!12373 lt!415568)) e!197711)))

(declare-fun b!277785 () Bool)

(declare-fun e!197712 () Bool)

(assert (=> b!277785 (= e!197711 e!197712)))

(declare-fun res!230723 () Bool)

(assert (=> b!277785 (=> (not res!230723) (not e!197712))))

(assert (=> b!277785 (= res!230723 (= (select (arr!7901 a1!699) (_1!12373 lt!415568)) (select (arr!7901 a2!699) (_1!12373 lt!415568))))))

(declare-fun b!277786 () Bool)

(assert (=> b!277786 (= e!197712 (arrayRangesEq!1191 a1!699 a2!699 (bvadd (_1!12373 lt!415568) #b00000000000000000000000000000001) (_2!12373 lt!415568)))))

(assert (= (and d!95808 (not res!230722)) b!277785))

(assert (= (and b!277785 res!230723) b!277786))

(declare-fun m!410911 () Bool)

(assert (=> b!277785 m!410911))

(declare-fun m!410913 () Bool)

(assert (=> b!277785 m!410913))

(declare-fun m!410915 () Bool)

(assert (=> b!277786 m!410915))

(assert (=> b!277765 d!95808))

(declare-fun d!95810 () Bool)

(assert (=> d!95810 (arrayRangesEq!1191 a2!699 a1!699 (_1!12373 lt!415568) (_2!12373 lt!415568))))

(declare-fun lt!415590 () Unit!19411)

(declare-fun choose!453 (array!15963 array!15963 (_ BitVec 32) (_ BitVec 32)) Unit!19411)

(assert (=> d!95810 (= lt!415590 (choose!453 a1!699 a2!699 (_1!12373 lt!415568) (_2!12373 lt!415568)))))

(assert (=> d!95810 (and (bvsle #b00000000000000000000000000000000 (_1!12373 lt!415568)) (bvsle (_1!12373 lt!415568) (_2!12373 lt!415568)) (bvsle (_2!12373 lt!415568) (size!6905 a1!699)))))

(assert (=> d!95810 (= (arrayRangesEqSymmetricLemma!110 a1!699 a2!699 (_1!12373 lt!415568) (_2!12373 lt!415568)) lt!415590)))

(declare-fun bs!24158 () Bool)

(assert (= bs!24158 d!95810))

(assert (=> bs!24158 m!410895))

(declare-fun m!410917 () Bool)

(assert (=> bs!24158 m!410917))

(assert (=> b!277765 d!95810))

(declare-fun d!95818 () Bool)

(declare-fun res!230724 () Bool)

(declare-fun e!197713 () Bool)

(assert (=> d!95818 (=> res!230724 e!197713)))

(assert (=> d!95818 (= res!230724 (= (_1!12373 lt!415568) (_2!12373 lt!415568)))))

(assert (=> d!95818 (= (arrayRangesEq!1191 a2!699 a1!699 (_1!12373 lt!415568) (_2!12373 lt!415568)) e!197713)))

(declare-fun b!277787 () Bool)

(declare-fun e!197714 () Bool)

(assert (=> b!277787 (= e!197713 e!197714)))

(declare-fun res!230725 () Bool)

(assert (=> b!277787 (=> (not res!230725) (not e!197714))))

(assert (=> b!277787 (= res!230725 (= (select (arr!7901 a2!699) (_1!12373 lt!415568)) (select (arr!7901 a1!699) (_1!12373 lt!415568))))))

(declare-fun b!277788 () Bool)

(assert (=> b!277788 (= e!197714 (arrayRangesEq!1191 a2!699 a1!699 (bvadd (_1!12373 lt!415568) #b00000000000000000000000000000001) (_2!12373 lt!415568)))))

(assert (= (and d!95818 (not res!230724)) b!277787))

(assert (= (and b!277787 res!230725) b!277788))

(assert (=> b!277787 m!410913))

(assert (=> b!277787 m!410911))

(declare-fun m!410919 () Bool)

(assert (=> b!277788 m!410919))

(assert (=> b!277765 d!95818))

(declare-fun b!277832 () Bool)

(declare-fun e!197756 () Bool)

(declare-fun call!4514 () Bool)

(assert (=> b!277832 (= e!197756 call!4514)))

(declare-fun lt!415609 () (_ BitVec 32))

(declare-fun c!12708 () Bool)

(declare-fun bm!4511 () Bool)

(declare-fun lt!415611 () (_ BitVec 32))

(declare-fun lt!415610 () tuple4!596)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4511 (= call!4514 (byteRangesEq!0 (select (arr!7901 a1!699) (_3!1078 lt!415610)) (select (arr!7901 a2!699) (_3!1078 lt!415610)) lt!415611 (ite c!12708 lt!415609 #b00000000000000000000000000001000)))))

(declare-fun b!277833 () Bool)

(declare-fun e!197754 () Bool)

(assert (=> b!277833 (= e!197754 (arrayRangesEq!1191 a1!699 a2!699 (_1!12373 lt!415610) (_2!12373 lt!415610)))))

(declare-fun d!95822 () Bool)

(declare-fun res!230761 () Bool)

(declare-fun e!197757 () Bool)

(assert (=> d!95822 (=> res!230761 e!197757)))

(assert (=> d!95822 (= res!230761 (bvsge from!822 to!789))))

(assert (=> d!95822 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197757)))

(declare-fun b!277834 () Bool)

(declare-fun res!230762 () Bool)

(assert (=> b!277834 (= res!230762 (= lt!415609 #b00000000000000000000000000000000))))

(declare-fun e!197758 () Bool)

(assert (=> b!277834 (=> res!230762 e!197758)))

(declare-fun e!197755 () Bool)

(assert (=> b!277834 (= e!197755 e!197758)))

(declare-fun b!277835 () Bool)

(declare-fun e!197753 () Bool)

(assert (=> b!277835 (= e!197753 e!197756)))

(assert (=> b!277835 (= c!12708 (= (_3!1078 lt!415610) (_4!298 lt!415610)))))

(declare-fun b!277836 () Bool)

(assert (=> b!277836 (= e!197757 e!197753)))

(declare-fun res!230760 () Bool)

(assert (=> b!277836 (=> (not res!230760) (not e!197753))))

(assert (=> b!277836 (= res!230760 e!197754)))

(declare-fun res!230763 () Bool)

(assert (=> b!277836 (=> res!230763 e!197754)))

(assert (=> b!277836 (= res!230763 (bvsge (_1!12373 lt!415610) (_2!12373 lt!415610)))))

(assert (=> b!277836 (= lt!415609 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277836 (= lt!415611 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277836 (= lt!415610 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277837 () Bool)

(assert (=> b!277837 (= e!197756 e!197755)))

(declare-fun res!230759 () Bool)

(assert (=> b!277837 (= res!230759 call!4514)))

(assert (=> b!277837 (=> (not res!230759) (not e!197755))))

(declare-fun b!277838 () Bool)

(assert (=> b!277838 (= e!197758 (byteRangesEq!0 (select (arr!7901 a1!699) (_4!298 lt!415610)) (select (arr!7901 a2!699) (_4!298 lt!415610)) #b00000000000000000000000000000000 lt!415609))))

(assert (= (and d!95822 (not res!230761)) b!277836))

(assert (= (and b!277836 (not res!230763)) b!277833))

(assert (= (and b!277836 res!230760) b!277835))

(assert (= (and b!277835 c!12708) b!277832))

(assert (= (and b!277835 (not c!12708)) b!277837))

(assert (= (and b!277837 res!230759) b!277834))

(assert (= (and b!277834 (not res!230762)) b!277838))

(assert (= (or b!277832 b!277837) bm!4511))

(declare-fun m!410945 () Bool)

(assert (=> bm!4511 m!410945))

(declare-fun m!410947 () Bool)

(assert (=> bm!4511 m!410947))

(assert (=> bm!4511 m!410945))

(assert (=> bm!4511 m!410947))

(declare-fun m!410949 () Bool)

(assert (=> bm!4511 m!410949))

(declare-fun m!410951 () Bool)

(assert (=> b!277833 m!410951))

(assert (=> b!277836 m!410889))

(declare-fun m!410953 () Bool)

(assert (=> b!277838 m!410953))

(declare-fun m!410955 () Bool)

(assert (=> b!277838 m!410955))

(assert (=> b!277838 m!410953))

(assert (=> b!277838 m!410955))

(declare-fun m!410957 () Bool)

(assert (=> b!277838 m!410957))

(assert (=> b!277763 d!95822))

(declare-fun d!95838 () Bool)

(assert (=> d!95838 (= (arrayBitIndices!0 from!822 to!789) (tuple4!597 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277764 d!95838))

(check-sat (not b!277838) (not b!277836) (not b!277833) (not d!95810) (not b!277786) (not b!277788) (not bm!4511))
(check-sat)

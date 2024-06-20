; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62630 () Bool)

(assert start!62630)

(declare-fun b!280568 () Bool)

(declare-fun res!232861 () Bool)

(declare-fun e!200190 () Bool)

(assert (=> b!280568 (=> (not res!232861) (not e!200190))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!280568 (= res!232861 (bvslt from!822 to!789))))

(declare-fun b!280569 () Bool)

(declare-fun res!232862 () Bool)

(assert (=> b!280569 (=> (not res!232862) (not e!200190))))

(declare-datatypes ((array!16203 0))(
  ( (array!16204 (arr!8000 (Array (_ BitVec 32) (_ BitVec 8))) (size!7004 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16203)

(declare-fun a2!699 () array!16203)

(declare-fun arrayBitRangesEq!0 (array!16203 array!16203 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280569 (= res!232862 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280570 () Bool)

(declare-datatypes ((Unit!19681 0))(
  ( (Unit!19682) )
))
(declare-fun e!200191 () Unit!19681)

(declare-fun Unit!19683 () Unit!19681)

(assert (=> b!280570 (= e!200191 Unit!19683)))

(declare-fun res!232859 () Bool)

(assert (=> start!62630 (=> (not res!232859) (not e!200190))))

(assert (=> start!62630 (= res!232859 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7004 a1!699) (size!7004 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7004 a1!699))))))))

(assert (=> start!62630 e!200190))

(assert (=> start!62630 true))

(declare-fun array_inv!6728 (array!16203) Bool)

(assert (=> start!62630 (array_inv!6728 a1!699)))

(assert (=> start!62630 (array_inv!6728 a2!699)))

(declare-fun b!280571 () Bool)

(declare-fun Unit!19684 () Unit!19681)

(assert (=> b!280571 (= e!200191 Unit!19684)))

(declare-datatypes ((tuple4!758 0))(
  ( (tuple4!759 (_1!12454 (_ BitVec 32)) (_2!12454 (_ BitVec 32)) (_3!1159 (_ BitVec 32)) (_4!379 (_ BitVec 32))) )
))
(declare-fun lt!416918 () tuple4!758)

(declare-fun arrayRangesEq!1272 (array!16203 array!16203 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280571 (arrayRangesEq!1272 a1!699 a2!699 (_1!12454 lt!416918) (_2!12454 lt!416918))))

(declare-fun lt!416919 () Unit!19681)

(declare-fun arrayRangesEqSymmetricLemma!179 (array!16203 array!16203 (_ BitVec 32) (_ BitVec 32)) Unit!19681)

(assert (=> b!280571 (= lt!416919 (arrayRangesEqSymmetricLemma!179 a1!699 a2!699 (_1!12454 lt!416918) (_2!12454 lt!416918)))))

(assert (=> b!280571 (arrayRangesEq!1272 a2!699 a1!699 (_1!12454 lt!416918) (_2!12454 lt!416918))))

(declare-fun b!280572 () Bool)

(declare-fun e!200193 () Bool)

(assert (=> b!280572 (= e!200193 (not (and (bvsge (_3!1159 lt!416918) #b00000000000000000000000000000000) (bvslt (_3!1159 lt!416918) (size!7004 a2!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280572 (byteRangesEq!0 (select (arr!8000 a1!699) (_3!1159 lt!416918)) (select (arr!8000 a2!699) (_3!1159 lt!416918)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000)))

(declare-fun b!280573 () Bool)

(assert (=> b!280573 (= e!200190 e!200193)))

(declare-fun res!232860 () Bool)

(assert (=> b!280573 (=> (not res!232860) (not e!200193))))

(assert (=> b!280573 (= res!232860 (not (= (_3!1159 lt!416918) (_4!379 lt!416918))))))

(declare-fun lt!416917 () Unit!19681)

(assert (=> b!280573 (= lt!416917 e!200191)))

(declare-fun c!13026 () Bool)

(assert (=> b!280573 (= c!13026 (bvslt (_1!12454 lt!416918) (_2!12454 lt!416918)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!758)

(assert (=> b!280573 (= lt!416918 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62630 res!232859) b!280569))

(assert (= (and b!280569 res!232862) b!280568))

(assert (= (and b!280568 res!232861) b!280573))

(assert (= (and b!280573 c!13026) b!280571))

(assert (= (and b!280573 (not c!13026)) b!280570))

(assert (= (and b!280573 res!232860) b!280572))

(declare-fun m!413579 () Bool)

(assert (=> start!62630 m!413579))

(declare-fun m!413581 () Bool)

(assert (=> start!62630 m!413581))

(declare-fun m!413583 () Bool)

(assert (=> b!280569 m!413583))

(declare-fun m!413585 () Bool)

(assert (=> b!280571 m!413585))

(declare-fun m!413587 () Bool)

(assert (=> b!280571 m!413587))

(declare-fun m!413589 () Bool)

(assert (=> b!280571 m!413589))

(declare-fun m!413591 () Bool)

(assert (=> b!280572 m!413591))

(declare-fun m!413593 () Bool)

(assert (=> b!280572 m!413593))

(assert (=> b!280572 m!413591))

(assert (=> b!280572 m!413593))

(declare-fun m!413595 () Bool)

(assert (=> b!280572 m!413595))

(declare-fun m!413597 () Bool)

(assert (=> b!280573 m!413597))

(check-sat (not b!280573) (not b!280571) (not b!280569) (not b!280572) (not start!62630))
(check-sat)
(get-model)

(declare-fun d!96494 () Bool)

(assert (=> d!96494 (= (array_inv!6728 a1!699) (bvsge (size!7004 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62630 d!96494))

(declare-fun d!96496 () Bool)

(assert (=> d!96496 (= (array_inv!6728 a2!699) (bvsge (size!7004 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62630 d!96496))

(declare-fun d!96498 () Bool)

(declare-fun res!232879 () Bool)

(declare-fun e!200213 () Bool)

(assert (=> d!96498 (=> res!232879 e!200213)))

(assert (=> d!96498 (= res!232879 (= (_1!12454 lt!416918) (_2!12454 lt!416918)))))

(assert (=> d!96498 (= (arrayRangesEq!1272 a1!699 a2!699 (_1!12454 lt!416918) (_2!12454 lt!416918)) e!200213)))

(declare-fun b!280596 () Bool)

(declare-fun e!200214 () Bool)

(assert (=> b!280596 (= e!200213 e!200214)))

(declare-fun res!232880 () Bool)

(assert (=> b!280596 (=> (not res!232880) (not e!200214))))

(assert (=> b!280596 (= res!232880 (= (select (arr!8000 a1!699) (_1!12454 lt!416918)) (select (arr!8000 a2!699) (_1!12454 lt!416918))))))

(declare-fun b!280597 () Bool)

(assert (=> b!280597 (= e!200214 (arrayRangesEq!1272 a1!699 a2!699 (bvadd (_1!12454 lt!416918) #b00000000000000000000000000000001) (_2!12454 lt!416918)))))

(assert (= (and d!96498 (not res!232879)) b!280596))

(assert (= (and b!280596 res!232880) b!280597))

(declare-fun m!413619 () Bool)

(assert (=> b!280596 m!413619))

(declare-fun m!413621 () Bool)

(assert (=> b!280596 m!413621))

(declare-fun m!413623 () Bool)

(assert (=> b!280597 m!413623))

(assert (=> b!280571 d!96498))

(declare-fun d!96500 () Bool)

(assert (=> d!96500 (arrayRangesEq!1272 a2!699 a1!699 (_1!12454 lt!416918) (_2!12454 lt!416918))))

(declare-fun lt!416931 () Unit!19681)

(declare-fun choose!485 (array!16203 array!16203 (_ BitVec 32) (_ BitVec 32)) Unit!19681)

(assert (=> d!96500 (= lt!416931 (choose!485 a1!699 a2!699 (_1!12454 lt!416918) (_2!12454 lt!416918)))))

(assert (=> d!96500 (and (bvsle #b00000000000000000000000000000000 (_1!12454 lt!416918)) (bvsle (_1!12454 lt!416918) (_2!12454 lt!416918)) (bvsle (_2!12454 lt!416918) (size!7004 a1!699)))))

(assert (=> d!96500 (= (arrayRangesEqSymmetricLemma!179 a1!699 a2!699 (_1!12454 lt!416918) (_2!12454 lt!416918)) lt!416931)))

(declare-fun bs!24323 () Bool)

(assert (= bs!24323 d!96500))

(assert (=> bs!24323 m!413589))

(declare-fun m!413625 () Bool)

(assert (=> bs!24323 m!413625))

(assert (=> b!280571 d!96500))

(declare-fun d!96504 () Bool)

(declare-fun res!232881 () Bool)

(declare-fun e!200215 () Bool)

(assert (=> d!96504 (=> res!232881 e!200215)))

(assert (=> d!96504 (= res!232881 (= (_1!12454 lt!416918) (_2!12454 lt!416918)))))

(assert (=> d!96504 (= (arrayRangesEq!1272 a2!699 a1!699 (_1!12454 lt!416918) (_2!12454 lt!416918)) e!200215)))

(declare-fun b!280598 () Bool)

(declare-fun e!200216 () Bool)

(assert (=> b!280598 (= e!200215 e!200216)))

(declare-fun res!232882 () Bool)

(assert (=> b!280598 (=> (not res!232882) (not e!200216))))

(assert (=> b!280598 (= res!232882 (= (select (arr!8000 a2!699) (_1!12454 lt!416918)) (select (arr!8000 a1!699) (_1!12454 lt!416918))))))

(declare-fun b!280599 () Bool)

(assert (=> b!280599 (= e!200216 (arrayRangesEq!1272 a2!699 a1!699 (bvadd (_1!12454 lt!416918) #b00000000000000000000000000000001) (_2!12454 lt!416918)))))

(assert (= (and d!96504 (not res!232881)) b!280598))

(assert (= (and b!280598 res!232882) b!280599))

(assert (=> b!280598 m!413621))

(assert (=> b!280598 m!413619))

(declare-fun m!413627 () Bool)

(assert (=> b!280599 m!413627))

(assert (=> b!280571 d!96504))

(declare-fun d!96506 () Bool)

(assert (=> d!96506 (= (arrayBitIndices!0 from!822 to!789) (tuple4!759 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280573 d!96506))

(declare-fun d!96512 () Bool)

(assert (=> d!96512 (= (byteRangesEq!0 (select (arr!8000 a1!699) (_3!1159 lt!416918)) (select (arr!8000 a2!699) (_3!1159 lt!416918)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8000 a1!699) (_3!1159 lt!416918))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8000 a2!699) (_3!1159 lt!416918))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24325 () Bool)

(assert (= bs!24325 d!96512))

(declare-fun m!413653 () Bool)

(assert (=> bs!24325 m!413653))

(declare-fun m!413655 () Bool)

(assert (=> bs!24325 m!413655))

(assert (=> b!280572 d!96512))

(declare-fun b!280665 () Bool)

(declare-fun e!200275 () Bool)

(declare-fun e!200280 () Bool)

(assert (=> b!280665 (= e!200275 e!200280)))

(declare-fun c!13037 () Bool)

(declare-fun lt!416959 () tuple4!758)

(assert (=> b!280665 (= c!13037 (= (_3!1159 lt!416959) (_4!379 lt!416959)))))

(declare-fun b!280666 () Bool)

(declare-fun res!232935 () Bool)

(declare-fun lt!416961 () (_ BitVec 32))

(assert (=> b!280666 (= res!232935 (= lt!416961 #b00000000000000000000000000000000))))

(declare-fun e!200277 () Bool)

(assert (=> b!280666 (=> res!232935 e!200277)))

(declare-fun e!200276 () Bool)

(assert (=> b!280666 (= e!200276 e!200277)))

(declare-fun b!280667 () Bool)

(declare-fun call!4645 () Bool)

(assert (=> b!280667 (= e!200277 call!4645)))

(declare-fun b!280668 () Bool)

(assert (=> b!280668 (= e!200280 e!200276)))

(declare-fun res!232938 () Bool)

(declare-fun lt!416960 () (_ BitVec 32))

(assert (=> b!280668 (= res!232938 (byteRangesEq!0 (select (arr!8000 a1!699) (_3!1159 lt!416959)) (select (arr!8000 a2!699) (_3!1159 lt!416959)) lt!416960 #b00000000000000000000000000001000))))

(assert (=> b!280668 (=> (not res!232938) (not e!200276))))

(declare-fun b!280669 () Bool)

(assert (=> b!280669 (= e!200280 call!4645)))

(declare-fun d!96530 () Bool)

(declare-fun res!232934 () Bool)

(declare-fun e!200278 () Bool)

(assert (=> d!96530 (=> res!232934 e!200278)))

(assert (=> d!96530 (= res!232934 (bvsge from!822 to!789))))

(assert (=> d!96530 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200278)))

(declare-fun bm!4642 () Bool)

(assert (=> bm!4642 (= call!4645 (byteRangesEq!0 (ite c!13037 (select (arr!8000 a1!699) (_3!1159 lt!416959)) (select (arr!8000 a1!699) (_4!379 lt!416959))) (ite c!13037 (select (arr!8000 a2!699) (_3!1159 lt!416959)) (select (arr!8000 a2!699) (_4!379 lt!416959))) (ite c!13037 lt!416960 #b00000000000000000000000000000000) lt!416961))))

(declare-fun e!200279 () Bool)

(declare-fun b!280670 () Bool)

(assert (=> b!280670 (= e!200279 (arrayRangesEq!1272 a1!699 a2!699 (_1!12454 lt!416959) (_2!12454 lt!416959)))))

(declare-fun b!280671 () Bool)

(assert (=> b!280671 (= e!200278 e!200275)))

(declare-fun res!232936 () Bool)

(assert (=> b!280671 (=> (not res!232936) (not e!200275))))

(assert (=> b!280671 (= res!232936 e!200279)))

(declare-fun res!232937 () Bool)

(assert (=> b!280671 (=> res!232937 e!200279)))

(assert (=> b!280671 (= res!232937 (bvsge (_1!12454 lt!416959) (_2!12454 lt!416959)))))

(assert (=> b!280671 (= lt!416961 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280671 (= lt!416960 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280671 (= lt!416959 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!96530 (not res!232934)) b!280671))

(assert (= (and b!280671 (not res!232937)) b!280670))

(assert (= (and b!280671 res!232936) b!280665))

(assert (= (and b!280665 c!13037) b!280669))

(assert (= (and b!280665 (not c!13037)) b!280668))

(assert (= (and b!280668 res!232938) b!280666))

(assert (= (and b!280666 (not res!232935)) b!280667))

(assert (= (or b!280669 b!280667) bm!4642))

(declare-fun m!413675 () Bool)

(assert (=> b!280668 m!413675))

(declare-fun m!413677 () Bool)

(assert (=> b!280668 m!413677))

(assert (=> b!280668 m!413675))

(assert (=> b!280668 m!413677))

(declare-fun m!413679 () Bool)

(assert (=> b!280668 m!413679))

(assert (=> bm!4642 m!413675))

(declare-fun m!413681 () Bool)

(assert (=> bm!4642 m!413681))

(declare-fun m!413683 () Bool)

(assert (=> bm!4642 m!413683))

(assert (=> bm!4642 m!413677))

(declare-fun m!413685 () Bool)

(assert (=> bm!4642 m!413685))

(declare-fun m!413687 () Bool)

(assert (=> b!280670 m!413687))

(assert (=> b!280671 m!413597))

(assert (=> b!280569 d!96530))

(check-sat (not b!280599) (not b!280597) (not b!280668) (not bm!4642) (not d!96500) (not b!280670) (not b!280671))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62968 () Bool)

(assert start!62968)

(declare-fun b!281836 () Bool)

(declare-fun res!233837 () Bool)

(declare-fun e!201286 () Bool)

(assert (=> b!281836 (=> (not res!233837) (not e!201286))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16277 0))(
  ( (array!16278 (arr!8025 (Array (_ BitVec 32) (_ BitVec 8))) (size!7029 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16277)

(declare-fun a1!699 () array!16277)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16277 array!16277 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!281836 (= res!233837 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun e!201287 () Bool)

(declare-fun b!281837 () Bool)

(declare-datatypes ((tuple4!808 0))(
  ( (tuple4!809 (_1!12479 (_ BitVec 32)) (_2!12479 (_ BitVec 32)) (_3!1184 (_ BitVec 32)) (_4!404 (_ BitVec 32))) )
))
(declare-fun lt!417530 () tuple4!808)

(declare-fun lt!417529 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281837 (= e!201287 (byteRangesEq!0 (select (arr!8025 a1!699) (_4!404 lt!417530)) (select (arr!8025 a2!699) (_4!404 lt!417530)) #b00000000000000000000000000000000 lt!417529))))

(declare-fun e!201289 () Bool)

(declare-fun b!281838 () Bool)

(assert (=> b!281838 (= e!201289 (byteRangesEq!0 (select (arr!8025 a2!699) (_4!404 lt!417530)) (select (arr!8025 a1!699) (_4!404 lt!417530)) #b00000000000000000000000000000000 lt!417529))))

(declare-fun b!281839 () Bool)

(declare-fun res!233840 () Bool)

(declare-fun e!201291 () Bool)

(assert (=> b!281839 (=> (not res!233840) (not e!201291))))

(declare-fun lt!417531 () (_ BitVec 32))

(assert (=> b!281839 (= res!233840 (byteRangesEq!0 (select (arr!8025 a2!699) (_3!1184 lt!417530)) (select (arr!8025 a1!699) (_3!1184 lt!417530)) lt!417531 #b00000000000000000000000000001000))))

(declare-fun b!281840 () Bool)

(declare-fun e!201284 () Bool)

(assert (=> b!281840 (= e!201286 e!201284)))

(declare-fun res!233833 () Bool)

(assert (=> b!281840 (=> (not res!233833) (not e!201284))))

(assert (=> b!281840 (= res!233833 (not (= (_3!1184 lt!417530) (_4!404 lt!417530))))))

(declare-datatypes ((Unit!19781 0))(
  ( (Unit!19782) )
))
(declare-fun lt!417527 () Unit!19781)

(declare-fun e!201288 () Unit!19781)

(assert (=> b!281840 (= lt!417527 e!201288)))

(declare-fun c!13173 () Bool)

(assert (=> b!281840 (= c!13173 (bvslt (_1!12479 lt!417530) (_2!12479 lt!417530)))))

(assert (=> b!281840 (= lt!417529 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281840 (= lt!417531 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!808)

(assert (=> b!281840 (= lt!417530 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281841 () Bool)

(declare-fun res!233835 () Bool)

(assert (=> b!281841 (=> (not res!233835) (not e!201286))))

(assert (=> b!281841 (= res!233835 (bvslt from!822 to!789))))

(declare-fun b!281842 () Bool)

(assert (=> b!281842 (= e!201284 (not e!201289))))

(declare-fun res!233836 () Bool)

(assert (=> b!281842 (=> res!233836 e!201289)))

(assert (=> b!281842 (= res!233836 (= lt!417529 #b00000000000000000000000000000000))))

(assert (=> b!281842 e!201291))

(declare-fun res!233838 () Bool)

(assert (=> b!281842 (=> (not res!233838) (not e!201291))))

(assert (=> b!281842 (= res!233838 (byteRangesEq!0 (select (arr!8025 a1!699) (_3!1184 lt!417530)) (select (arr!8025 a2!699) (_3!1184 lt!417530)) lt!417531 #b00000000000000000000000000001000))))

(declare-fun b!281843 () Bool)

(declare-fun Unit!19783 () Unit!19781)

(assert (=> b!281843 (= e!201288 Unit!19783)))

(declare-fun res!233839 () Bool)

(assert (=> start!62968 (=> (not res!233839) (not e!201286))))

(assert (=> start!62968 (= res!233839 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7029 a1!699) (size!7029 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7029 a1!699))))))))

(assert (=> start!62968 e!201286))

(assert (=> start!62968 true))

(declare-fun array_inv!6753 (array!16277) Bool)

(assert (=> start!62968 (array_inv!6753 a1!699)))

(assert (=> start!62968 (array_inv!6753 a2!699)))

(declare-fun b!281844 () Bool)

(assert (=> b!281844 (= e!201291 e!201287)))

(declare-fun res!233834 () Bool)

(assert (=> b!281844 (=> res!233834 e!201287)))

(assert (=> b!281844 (= res!233834 (= lt!417529 #b00000000000000000000000000000000))))

(declare-fun b!281845 () Bool)

(declare-fun Unit!19784 () Unit!19781)

(assert (=> b!281845 (= e!201288 Unit!19784)))

(declare-fun arrayRangesEq!1297 (array!16277 array!16277 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281845 (arrayRangesEq!1297 a1!699 a2!699 (_1!12479 lt!417530) (_2!12479 lt!417530))))

(declare-fun lt!417528 () Unit!19781)

(declare-fun arrayRangesEqSymmetricLemma!204 (array!16277 array!16277 (_ BitVec 32) (_ BitVec 32)) Unit!19781)

(assert (=> b!281845 (= lt!417528 (arrayRangesEqSymmetricLemma!204 a1!699 a2!699 (_1!12479 lt!417530) (_2!12479 lt!417530)))))

(assert (=> b!281845 (arrayRangesEq!1297 a2!699 a1!699 (_1!12479 lt!417530) (_2!12479 lt!417530))))

(assert (= (and start!62968 res!233839) b!281836))

(assert (= (and b!281836 res!233837) b!281841))

(assert (= (and b!281841 res!233835) b!281840))

(assert (= (and b!281840 c!13173) b!281845))

(assert (= (and b!281840 (not c!13173)) b!281843))

(assert (= (and b!281840 res!233833) b!281842))

(assert (= (and b!281842 res!233838) b!281839))

(assert (= (and b!281839 res!233840) b!281844))

(assert (= (and b!281844 (not res!233834)) b!281837))

(assert (= (and b!281842 (not res!233836)) b!281838))

(declare-fun m!414897 () Bool)

(assert (=> b!281839 m!414897))

(declare-fun m!414899 () Bool)

(assert (=> b!281839 m!414899))

(assert (=> b!281839 m!414897))

(assert (=> b!281839 m!414899))

(declare-fun m!414901 () Bool)

(assert (=> b!281839 m!414901))

(declare-fun m!414903 () Bool)

(assert (=> b!281837 m!414903))

(declare-fun m!414905 () Bool)

(assert (=> b!281837 m!414905))

(assert (=> b!281837 m!414903))

(assert (=> b!281837 m!414905))

(declare-fun m!414907 () Bool)

(assert (=> b!281837 m!414907))

(declare-fun m!414909 () Bool)

(assert (=> b!281845 m!414909))

(declare-fun m!414911 () Bool)

(assert (=> b!281845 m!414911))

(declare-fun m!414913 () Bool)

(assert (=> b!281845 m!414913))

(assert (=> b!281838 m!414905))

(assert (=> b!281838 m!414903))

(assert (=> b!281838 m!414905))

(assert (=> b!281838 m!414903))

(declare-fun m!414915 () Bool)

(assert (=> b!281838 m!414915))

(declare-fun m!414917 () Bool)

(assert (=> start!62968 m!414917))

(declare-fun m!414919 () Bool)

(assert (=> start!62968 m!414919))

(assert (=> b!281842 m!414899))

(assert (=> b!281842 m!414897))

(assert (=> b!281842 m!414899))

(assert (=> b!281842 m!414897))

(declare-fun m!414921 () Bool)

(assert (=> b!281842 m!414921))

(declare-fun m!414923 () Bool)

(assert (=> b!281840 m!414923))

(declare-fun m!414925 () Bool)

(assert (=> b!281836 m!414925))

(push 1)

(assert (not b!281839))

(assert (not b!281836))

(assert (not start!62968))

(assert (not b!281838))

(assert (not b!281845))

(assert (not b!281837))

(assert (not b!281840))

(assert (not b!281842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96974 () Bool)

(assert (=> d!96974 (= (byteRangesEq!0 (select (arr!8025 a2!699) (_4!404 lt!417530)) (select (arr!8025 a1!699) (_4!404 lt!417530)) #b00000000000000000000000000000000 lt!417529) (or (= #b00000000000000000000000000000000 lt!417529) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8025 a2!699) (_4!404 lt!417530))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417529))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8025 a1!699) (_4!404 lt!417530))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417529))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24428 () Bool)

(assert (= bs!24428 d!96974))

(declare-fun m!414959 () Bool)

(assert (=> bs!24428 m!414959))

(declare-fun m!414961 () Bool)

(assert (=> bs!24428 m!414961))

(assert (=> b!281838 d!96974))

(declare-fun d!96984 () Bool)

(declare-fun res!233861 () Bool)

(declare-fun e!201312 () Bool)

(assert (=> d!96984 (=> res!233861 e!201312)))

(assert (=> d!96984 (= res!233861 (= (_1!12479 lt!417530) (_2!12479 lt!417530)))))

(assert (=> d!96984 (= (arrayRangesEq!1297 a1!699 a2!699 (_1!12479 lt!417530) (_2!12479 lt!417530)) e!201312)))

(declare-fun b!281866 () Bool)

(declare-fun e!201313 () Bool)

(assert (=> b!281866 (= e!201312 e!201313)))

(declare-fun res!233862 () Bool)

(assert (=> b!281866 (=> (not res!233862) (not e!201313))))

(assert (=> b!281866 (= res!233862 (= (select (arr!8025 a1!699) (_1!12479 lt!417530)) (select (arr!8025 a2!699) (_1!12479 lt!417530))))))

(declare-fun b!281867 () Bool)

(assert (=> b!281867 (= e!201313 (arrayRangesEq!1297 a1!699 a2!699 (bvadd (_1!12479 lt!417530) #b00000000000000000000000000000001) (_2!12479 lt!417530)))))

(assert (= (and d!96984 (not res!233861)) b!281866))

(assert (= (and b!281866 res!233862) b!281867))

(declare-fun m!414963 () Bool)

(assert (=> b!281866 m!414963))

(declare-fun m!414965 () Bool)

(assert (=> b!281866 m!414965))

(declare-fun m!414967 () Bool)

(assert (=> b!281867 m!414967))

(assert (=> b!281845 d!96984))

(declare-fun d!96986 () Bool)

(assert (=> d!96986 (arrayRangesEq!1297 a2!699 a1!699 (_1!12479 lt!417530) (_2!12479 lt!417530))))

(declare-fun lt!417540 () Unit!19781)

(declare-fun choose!506 (array!16277 array!16277 (_ BitVec 32) (_ BitVec 32)) Unit!19781)

(assert (=> d!96986 (= lt!417540 (choose!506 a1!699 a2!699 (_1!12479 lt!417530) (_2!12479 lt!417530)))))

(assert (=> d!96986 (and (bvsle #b00000000000000000000000000000000 (_1!12479 lt!417530)) (bvsle (_1!12479 lt!417530) (_2!12479 lt!417530)) (bvsle (_2!12479 lt!417530) (size!7029 a1!699)))))

(assert (=> d!96986 (= (arrayRangesEqSymmetricLemma!204 a1!699 a2!699 (_1!12479 lt!417530) (_2!12479 lt!417530)) lt!417540)))

(declare-fun bs!24429 () Bool)

(assert (= bs!24429 d!96986))

(assert (=> bs!24429 m!414913))

(declare-fun m!414969 () Bool)

(assert (=> bs!24429 m!414969))

(assert (=> b!281845 d!96986))

(declare-fun d!96988 () Bool)

(declare-fun res!233863 () Bool)

(declare-fun e!201314 () Bool)

(assert (=> d!96988 (=> res!233863 e!201314)))

(assert (=> d!96988 (= res!233863 (= (_1!12479 lt!417530) (_2!12479 lt!417530)))))

(assert (=> d!96988 (= (arrayRangesEq!1297 a2!699 a1!699 (_1!12479 lt!417530) (_2!12479 lt!417530)) e!201314)))

(declare-fun b!281868 () Bool)

(declare-fun e!201315 () Bool)

(assert (=> b!281868 (= e!201314 e!201315)))

(declare-fun res!233864 () Bool)

(assert (=> b!281868 (=> (not res!233864) (not e!201315))))

(assert (=> b!281868 (= res!233864 (= (select (arr!8025 a2!699) (_1!12479 lt!417530)) (select (arr!8025 a1!699) (_1!12479 lt!417530))))))

(declare-fun b!281869 () Bool)

(assert (=> b!281869 (= e!201315 (arrayRangesEq!1297 a2!699 a1!699 (bvadd (_1!12479 lt!417530) #b00000000000000000000000000000001) (_2!12479 lt!417530)))))

(assert (= (and d!96988 (not res!233863)) b!281868))

(assert (= (and b!281868 res!233864) b!281869))

(assert (=> b!281868 m!414965))

(assert (=> b!281868 m!414963))

(declare-fun m!414971 () Bool)

(assert (=> b!281869 m!414971))

(assert (=> b!281845 d!96988))

(declare-fun d!96990 () Bool)

(assert (=> d!96990 (= (array_inv!6753 a1!699) (bvsge (size!7029 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62968 d!96990))

(declare-fun d!96992 () Bool)

(assert (=> d!96992 (= (array_inv!6753 a2!699) (bvsge (size!7029 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62968 d!96992))

(declare-fun d!96994 () Bool)

(assert (=> d!96994 (= (arrayBitIndices!0 from!822 to!789) (tuple4!809 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!281840 d!96994))

(declare-fun d!96996 () Bool)

(assert (=> d!96996 (= (byteRangesEq!0 (select (arr!8025 a2!699) (_3!1184 lt!417530)) (select (arr!8025 a1!699) (_3!1184 lt!417530)) lt!417531 #b00000000000000000000000000001000) (or (= lt!417531 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8025 a2!699) (_3!1184 lt!417530))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417531)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8025 a1!699) (_3!1184 lt!417530))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417531)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24430 () Bool)

(assert (= bs!24430 d!96996))

(declare-fun m!414973 () Bool)

(assert (=> bs!24430 m!414973))

(declare-fun m!414975 () Bool)

(assert (=> bs!24430 m!414975))

(assert (=> b!281839 d!96996))

(declare-fun lt!417566 () (_ BitVec 32))

(declare-fun c!13182 () Bool)

(declare-fun lt!417567 () tuple4!808)

(declare-fun call!4718 () Bool)

(declare-fun lt!417565 () (_ BitVec 32))

(declare-fun bm!4715 () Bool)

(assert (=> bm!4715 (= call!4718 (byteRangesEq!0 (ite c!13182 (select (arr!8025 a1!699) (_3!1184 lt!417567)) (select (arr!8025 a1!699) (_4!404 lt!417567))) (ite c!13182 (select (arr!8025 a2!699) (_3!1184 lt!417567)) (select (arr!8025 a2!699) (_4!404 lt!417567))) (ite c!13182 lt!417566 #b00000000000000000000000000000000) lt!417565))))

(declare-fun b!281926 () Bool)

(declare-fun e!201368 () Bool)

(assert (=> b!281926 (= e!201368 call!4718)))

(declare-fun b!281927 () Bool)

(declare-fun e!201369 () Bool)

(assert (=> b!281927 (= e!201368 e!201369)))

(declare-fun res!233905 () Bool)

(assert (=> b!281927 (= res!233905 (byteRangesEq!0 (select (arr!8025 a1!699) (_3!1184 lt!417567)) (select (arr!8025 a2!699) (_3!1184 lt!417567)) lt!417566 #b00000000000000000000000000001000))))

(assert (=> b!281927 (=> (not res!233905) (not e!201369))))

(declare-fun d!96998 () Bool)

(declare-fun res!233909 () Bool)

(declare-fun e!201367 () Bool)

(assert (=> d!96998 (=> res!233909 e!201367)))

(assert (=> d!96998 (= res!233909 (bvsge from!822 to!789))))

(assert (=> d!96998 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201367)))

(declare-fun b!281928 () Bool)

(declare-fun e!201365 () Bool)

(assert (=> b!281928 (= e!201365 call!4718)))

(declare-fun b!281929 () Bool)

(declare-fun e!201366 () Bool)

(assert (=> b!281929 (= e!201367 e!201366)))


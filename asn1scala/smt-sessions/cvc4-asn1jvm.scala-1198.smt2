; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34128 () Bool)

(assert start!34128)

(declare-datatypes ((array!8050 0))(
  ( (array!8051 (arr!4530 (Array (_ BitVec 32) (_ BitVec 64))) (size!3609 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!86 0))(
  ( (Asn1ObjectIdentifier!87 (nCount!54 (_ BitVec 32)) (values!51 array!8050)) )
))
(declare-fun inv!11 (Asn1ObjectIdentifier!86) Bool)

(declare-datatypes ((Unit!11235 0))(
  ( (Unit!11236) )
))
(declare-datatypes ((tuple3!940 0))(
  ( (tuple3!941 (_1!7839 Unit!11235) (_2!7839 (_ BitVec 32)) (_3!590 Asn1ObjectIdentifier!86)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!86) tuple3!940)

(assert (=> start!34128 (not (inv!11 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (values!51 (_3!590 (ObjectIdentifier_InitWhile!0 #b00000000000000000000000000000000 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (array!8051 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))))))))))

(declare-fun bs!13893 () Bool)

(assert (= bs!13893 start!34128))

(declare-fun m!258463 () Bool)

(assert (=> bs!13893 m!258463))

(declare-fun m!258465 () Bool)

(assert (=> bs!13893 m!258465))

(push 1)

(assert (not start!34128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56039 () Bool)

(assert (=> d!56039 (= (inv!11 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (values!51 (_3!590 (ObjectIdentifier_InitWhile!0 #b00000000000000000000000000000000 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (array!8051 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))))))) (and (= (size!3609 (values!51 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (values!51 (_3!590 (ObjectIdentifier_InitWhile!0 #b00000000000000000000000000000000 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (array!8051 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100)))))))) #b00000000000000000000000000010100) (bvsge (nCount!54 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (values!51 (_3!590 (ObjectIdentifier_InitWhile!0 #b00000000000000000000000000000000 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (array!8051 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))))))) #b00000000000000000000000000000000)))))

(assert (=> start!34128 d!56039))

(declare-fun d!56047 () Bool)

(declare-fun lt!255976 () tuple3!940)

(assert (=> d!56047 (and (bvsge (_2!7839 lt!255976) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!255976) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!255976) #b00000000000000000000000000010100))))

(declare-fun e!112337 () tuple3!940)

(assert (=> d!56047 (= lt!255976 e!112337)))

(declare-fun c!8531 () Bool)

(declare-fun lt!255978 () (_ BitVec 32))

(assert (=> d!56047 (= c!8531 (bvslt lt!255978 #b00000000000000000000000000010100))))

(assert (=> d!56047 (= lt!255978 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun lt!255977 () Asn1ObjectIdentifier!86)

(assert (=> d!56047 (= lt!255977 (Asn1ObjectIdentifier!87 (nCount!54 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (array!8051 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))) (array!8051 (store (arr!4530 (values!51 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (array!8051 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100)))) #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (array!8051 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100)))))))))

(assert (=> d!56047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000010100) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000010100))))

(assert (=> d!56047 (= (ObjectIdentifier_InitWhile!0 #b00000000000000000000000000000000 (Asn1ObjectIdentifier!87 #b00000000000000000000000000000000 (array!8051 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))) lt!255976)))

(declare-fun b!162781 () Bool)

(assert (=> b!162781 (= e!112337 (ObjectIdentifier_InitWhile!0 lt!255978 lt!255977))))

(declare-fun b!162782 () Bool)

(declare-fun Unit!11239 () Unit!11235)

(assert (=> b!162782 (= e!112337 (tuple3!941 Unit!11239 lt!255978 lt!255977))))

(assert (= (and d!56047 c!8531) b!162781))

(assert (= (and d!56047 (not c!8531)) b!162782))

(declare-fun m!258475 () Bool)

(assert (=> d!56047 m!258475))

(declare-fun m!258477 () Bool)

(assert (=> b!162781 m!258477))

(assert (=> start!34128 d!56047))

(push 1)

(assert (not b!162781))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56053 () Bool)

(declare-fun lt!255985 () tuple3!940)

(assert (=> d!56053 (and (bvsge (_2!7839 lt!255985) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!255985) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!255985) #b00000000000000000000000000010100))))

(declare-fun e!112340 () tuple3!940)

(assert (=> d!56053 (= lt!255985 e!112340)))

(declare-fun c!8534 () Bool)

(declare-fun lt!255987 () (_ BitVec 32))

(assert (=> d!56053 (= c!8534 (bvslt lt!255987 #b00000000000000000000000000010100))))

(assert (=> d!56053 (= lt!255987 (bvadd lt!255978 #b00000000000000000000000000000001))))

(declare-fun lt!255986 () Asn1ObjectIdentifier!86)

(assert (=> d!56053 (= lt!255986 (Asn1ObjectIdentifier!87 (nCount!54 lt!255977) (array!8051 (store (arr!4530 (values!51 lt!255977)) lt!255978 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 lt!255977)))))))

(assert (=> d!56053 (and (bvsge lt!255978 #b00000000000000000000000000000000) (bvsle lt!255978 #b00000000000000000000000000010100) (bvslt lt!255978 #b00000000000000000000000000010100))))

(assert (=> d!56053 (= (ObjectIdentifier_InitWhile!0 lt!255978 lt!255977) lt!255985)))

(declare-fun b!162787 () Bool)

(assert (=> b!162787 (= e!112340 (ObjectIdentifier_InitWhile!0 lt!255987 lt!255986))))

(declare-fun b!162788 () Bool)

(declare-fun Unit!11242 () Unit!11235)

(assert (=> b!162788 (= e!112340 (tuple3!941 Unit!11242 lt!255987 lt!255986))))

(assert (= (and d!56053 c!8534) b!162787))

(assert (= (and d!56053 (not c!8534)) b!162788))

(declare-fun m!258487 () Bool)

(assert (=> d!56053 m!258487))

(declare-fun m!258489 () Bool)

(assert (=> b!162787 m!258489))

(assert (=> b!162781 d!56053))

(push 1)

(assert (not b!162787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56057 () Bool)

(declare-fun lt!255991 () tuple3!940)

(assert (=> d!56057 (and (bvsge (_2!7839 lt!255991) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!255991) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!255991) #b00000000000000000000000000010100))))

(declare-fun e!112342 () tuple3!940)

(assert (=> d!56057 (= lt!255991 e!112342)))

(declare-fun c!8536 () Bool)

(declare-fun lt!255993 () (_ BitVec 32))

(assert (=> d!56057 (= c!8536 (bvslt lt!255993 #b00000000000000000000000000010100))))

(assert (=> d!56057 (= lt!255993 (bvadd lt!255987 #b00000000000000000000000000000001))))

(declare-fun lt!255992 () Asn1ObjectIdentifier!86)

(assert (=> d!56057 (= lt!255992 (Asn1ObjectIdentifier!87 (nCount!54 lt!255986) (array!8051 (store (arr!4530 (values!51 lt!255986)) lt!255987 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 lt!255986)))))))

(assert (=> d!56057 (and (bvsge lt!255987 #b00000000000000000000000000000000) (bvsle lt!255987 #b00000000000000000000000000010100) (bvslt lt!255987 #b00000000000000000000000000010100))))

(assert (=> d!56057 (= (ObjectIdentifier_InitWhile!0 lt!255987 lt!255986) lt!255991)))

(declare-fun b!162791 () Bool)

(assert (=> b!162791 (= e!112342 (ObjectIdentifier_InitWhile!0 lt!255993 lt!255992))))

(declare-fun b!162792 () Bool)

(declare-fun Unit!11244 () Unit!11235)

(assert (=> b!162792 (= e!112342 (tuple3!941 Unit!11244 lt!255993 lt!255992))))

(assert (= (and d!56057 c!8536) b!162791))

(assert (= (and d!56057 (not c!8536)) b!162792))

(declare-fun m!258495 () Bool)

(assert (=> d!56057 m!258495))

(declare-fun m!258497 () Bool)

(assert (=> b!162791 m!258497))

(assert (=> b!162787 d!56057))

(push 1)

(assert (not b!162791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56067 () Bool)

(declare-fun lt!256006 () tuple3!940)

(assert (=> d!56067 (and (bvsge (_2!7839 lt!256006) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!256006) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!256006) #b00000000000000000000000000010100))))

(declare-fun e!112347 () tuple3!940)

(assert (=> d!56067 (= lt!256006 e!112347)))

(declare-fun c!8541 () Bool)

(declare-fun lt!256008 () (_ BitVec 32))

(assert (=> d!56067 (= c!8541 (bvslt lt!256008 #b00000000000000000000000000010100))))

(assert (=> d!56067 (= lt!256008 (bvadd lt!255993 #b00000000000000000000000000000001))))

(declare-fun lt!256007 () Asn1ObjectIdentifier!86)

(assert (=> d!56067 (= lt!256007 (Asn1ObjectIdentifier!87 (nCount!54 lt!255992) (array!8051 (store (arr!4530 (values!51 lt!255992)) lt!255993 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 lt!255992)))))))

(assert (=> d!56067 (and (bvsge lt!255993 #b00000000000000000000000000000000) (bvsle lt!255993 #b00000000000000000000000000010100) (bvslt lt!255993 #b00000000000000000000000000010100))))

(assert (=> d!56067 (= (ObjectIdentifier_InitWhile!0 lt!255993 lt!255992) lt!256006)))

(declare-fun b!162801 () Bool)

(assert (=> b!162801 (= e!112347 (ObjectIdentifier_InitWhile!0 lt!256008 lt!256007))))

(declare-fun b!162802 () Bool)

(declare-fun Unit!11249 () Unit!11235)

(assert (=> b!162802 (= e!112347 (tuple3!941 Unit!11249 lt!256008 lt!256007))))

(assert (= (and d!56067 c!8541) b!162801))

(assert (= (and d!56067 (not c!8541)) b!162802))

(declare-fun m!258515 () Bool)

(assert (=> d!56067 m!258515))

(declare-fun m!258517 () Bool)

(assert (=> b!162801 m!258517))

(assert (=> b!162791 d!56067))

(push 1)

(assert (not b!162801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56075 () Bool)

(declare-fun lt!256018 () tuple3!940)

(assert (=> d!56075 (and (bvsge (_2!7839 lt!256018) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!256018) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!256018) #b00000000000000000000000000010100))))

(declare-fun e!112351 () tuple3!940)

(assert (=> d!56075 (= lt!256018 e!112351)))

(declare-fun c!8545 () Bool)

(declare-fun lt!256020 () (_ BitVec 32))

(assert (=> d!56075 (= c!8545 (bvslt lt!256020 #b00000000000000000000000000010100))))

(assert (=> d!56075 (= lt!256020 (bvadd lt!256008 #b00000000000000000000000000000001))))

(declare-fun lt!256019 () Asn1ObjectIdentifier!86)

(assert (=> d!56075 (= lt!256019 (Asn1ObjectIdentifier!87 (nCount!54 lt!256007) (array!8051 (store (arr!4530 (values!51 lt!256007)) lt!256008 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 lt!256007)))))))

(assert (=> d!56075 (and (bvsge lt!256008 #b00000000000000000000000000000000) (bvsle lt!256008 #b00000000000000000000000000010100) (bvslt lt!256008 #b00000000000000000000000000010100))))

(assert (=> d!56075 (= (ObjectIdentifier_InitWhile!0 lt!256008 lt!256007) lt!256018)))

(declare-fun b!162809 () Bool)

(assert (=> b!162809 (= e!112351 (ObjectIdentifier_InitWhile!0 lt!256020 lt!256019))))

(declare-fun b!162810 () Bool)

(declare-fun Unit!11253 () Unit!11235)

(assert (=> b!162810 (= e!112351 (tuple3!941 Unit!11253 lt!256020 lt!256019))))

(assert (= (and d!56075 c!8545) b!162809))

(assert (= (and d!56075 (not c!8545)) b!162810))

(declare-fun m!258531 () Bool)

(assert (=> d!56075 m!258531))

(declare-fun m!258533 () Bool)

(assert (=> b!162809 m!258533))

(assert (=> b!162801 d!56075))

(push 1)

(assert (not b!162809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56083 () Bool)

(declare-fun lt!256030 () tuple3!940)

(assert (=> d!56083 (and (bvsge (_2!7839 lt!256030) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!256030) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!256030) #b00000000000000000000000000010100))))

(declare-fun e!112355 () tuple3!940)

(assert (=> d!56083 (= lt!256030 e!112355)))

(declare-fun c!8549 () Bool)

(declare-fun lt!256032 () (_ BitVec 32))

(assert (=> d!56083 (= c!8549 (bvslt lt!256032 #b00000000000000000000000000010100))))

(assert (=> d!56083 (= lt!256032 (bvadd lt!256020 #b00000000000000000000000000000001))))

(declare-fun lt!256031 () Asn1ObjectIdentifier!86)

(assert (=> d!56083 (= lt!256031 (Asn1ObjectIdentifier!87 (nCount!54 lt!256019) (array!8051 (store (arr!4530 (values!51 lt!256019)) lt!256020 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 lt!256019)))))))

(assert (=> d!56083 (and (bvsge lt!256020 #b00000000000000000000000000000000) (bvsle lt!256020 #b00000000000000000000000000010100) (bvslt lt!256020 #b00000000000000000000000000010100))))

(assert (=> d!56083 (= (ObjectIdentifier_InitWhile!0 lt!256020 lt!256019) lt!256030)))

(declare-fun b!162817 () Bool)

(assert (=> b!162817 (= e!112355 (ObjectIdentifier_InitWhile!0 lt!256032 lt!256031))))

(declare-fun b!162818 () Bool)

(declare-fun Unit!11257 () Unit!11235)

(assert (=> b!162818 (= e!112355 (tuple3!941 Unit!11257 lt!256032 lt!256031))))

(assert (= (and d!56083 c!8549) b!162817))

(assert (= (and d!56083 (not c!8549)) b!162818))

(declare-fun m!258547 () Bool)

(assert (=> d!56083 m!258547))

(declare-fun m!258549 () Bool)

(assert (=> b!162817 m!258549))

(assert (=> b!162809 d!56083))

(push 1)

(assert (not b!162817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56093 () Bool)

(declare-fun lt!256045 () tuple3!940)

(assert (=> d!56093 (and (bvsge (_2!7839 lt!256045) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!256045) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!256045) #b00000000000000000000000000010100))))

(declare-fun e!112360 () tuple3!940)

(assert (=> d!56093 (= lt!256045 e!112360)))

(declare-fun c!8554 () Bool)

(declare-fun lt!256047 () (_ BitVec 32))

(assert (=> d!56093 (= c!8554 (bvslt lt!256047 #b00000000000000000000000000010100))))

(assert (=> d!56093 (= lt!256047 (bvadd lt!256032 #b00000000000000000000000000000001))))

(declare-fun lt!256046 () Asn1ObjectIdentifier!86)

(assert (=> d!56093 (= lt!256046 (Asn1ObjectIdentifier!87 (nCount!54 lt!256031) (array!8051 (store (arr!4530 (values!51 lt!256031)) lt!256032 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 lt!256031)))))))

(assert (=> d!56093 (and (bvsge lt!256032 #b00000000000000000000000000000000) (bvsle lt!256032 #b00000000000000000000000000010100) (bvslt lt!256032 #b00000000000000000000000000010100))))

(assert (=> d!56093 (= (ObjectIdentifier_InitWhile!0 lt!256032 lt!256031) lt!256045)))

(declare-fun b!162827 () Bool)

(assert (=> b!162827 (= e!112360 (ObjectIdentifier_InitWhile!0 lt!256047 lt!256046))))

(declare-fun b!162828 () Bool)

(declare-fun Unit!11262 () Unit!11235)

(assert (=> b!162828 (= e!112360 (tuple3!941 Unit!11262 lt!256047 lt!256046))))

(assert (= (and d!56093 c!8554) b!162827))

(assert (= (and d!56093 (not c!8554)) b!162828))

(declare-fun m!258567 () Bool)

(assert (=> d!56093 m!258567))

(declare-fun m!258569 () Bool)

(assert (=> b!162827 m!258569))

(assert (=> b!162817 d!56093))

(push 1)

(assert (not b!162827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56103 () Bool)

(declare-fun lt!256060 () tuple3!940)

(assert (=> d!56103 (and (bvsge (_2!7839 lt!256060) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!256060) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!256060) #b00000000000000000000000000010100))))

(declare-fun e!112365 () tuple3!940)

(assert (=> d!56103 (= lt!256060 e!112365)))

(declare-fun c!8559 () Bool)

(declare-fun lt!256062 () (_ BitVec 32))

(assert (=> d!56103 (= c!8559 (bvslt lt!256062 #b00000000000000000000000000010100))))

(assert (=> d!56103 (= lt!256062 (bvadd lt!256047 #b00000000000000000000000000000001))))

(declare-fun lt!256061 () Asn1ObjectIdentifier!86)

(assert (=> d!56103 (= lt!256061 (Asn1ObjectIdentifier!87 (nCount!54 lt!256046) (array!8051 (store (arr!4530 (values!51 lt!256046)) lt!256047 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 lt!256046)))))))

(assert (=> d!56103 (and (bvsge lt!256047 #b00000000000000000000000000000000) (bvsle lt!256047 #b00000000000000000000000000010100) (bvslt lt!256047 #b00000000000000000000000000010100))))

(assert (=> d!56103 (= (ObjectIdentifier_InitWhile!0 lt!256047 lt!256046) lt!256060)))

(declare-fun b!162837 () Bool)

(assert (=> b!162837 (= e!112365 (ObjectIdentifier_InitWhile!0 lt!256062 lt!256061))))

(declare-fun b!162838 () Bool)

(declare-fun Unit!11267 () Unit!11235)

(assert (=> b!162838 (= e!112365 (tuple3!941 Unit!11267 lt!256062 lt!256061))))

(assert (= (and d!56103 c!8559) b!162837))

(assert (= (and d!56103 (not c!8559)) b!162838))

(declare-fun m!258587 () Bool)

(assert (=> d!56103 m!258587))

(declare-fun m!258589 () Bool)

(assert (=> b!162837 m!258589))

(assert (=> b!162827 d!56103))

(push 1)

(assert (not b!162837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56117 () Bool)

(declare-fun lt!256081 () tuple3!940)

(assert (=> d!56117 (and (bvsge (_2!7839 lt!256081) #b00000000000000000000000000000000) (bvsle (_2!7839 lt!256081) #b00000000000000000000000000010100) (bvsge (_2!7839 lt!256081) #b00000000000000000000000000010100))))

(declare-fun e!112372 () tuple3!940)

(assert (=> d!56117 (= lt!256081 e!112372)))

(declare-fun c!8566 () Bool)

(declare-fun lt!256083 () (_ BitVec 32))

(assert (=> d!56117 (= c!8566 (bvslt lt!256083 #b00000000000000000000000000010100))))

(assert (=> d!56117 (= lt!256083 (bvadd lt!256062 #b00000000000000000000000000000001))))

(declare-fun lt!256082 () Asn1ObjectIdentifier!86)

(assert (=> d!56117 (= lt!256082 (Asn1ObjectIdentifier!87 (nCount!54 lt!256061) (array!8051 (store (arr!4530 (values!51 lt!256061)) lt!256062 #b0000000000000000000000000000000000000000000000000000000000000000) (size!3609 (values!51 lt!256061)))))))

(assert (=> d!56117 (and (bvsge lt!256062 #b00000000000000000000000000000000) (bvsle lt!256062 #b00000000000000000000000000010100) (bvslt lt!256062 #b00000000000000000000000000010100))))

(assert (=> d!56117 (= (ObjectIdentifier_InitWhile!0 lt!256062 lt!256061) lt!256081)))

(declare-fun b!162851 () Bool)

(assert (=> b!162851 (= e!112372 (ObjectIdentifier_InitWhile!0 lt!256083 lt!256082))))

(declare-fun b!162852 () Bool)

(declare-fun Unit!11274 () Unit!11235)

(assert (=> b!162852 (= e!112372 (tuple3!941 Unit!11274 lt!256083 lt!256082))))

(assert (= (and d!56117 c!8566) b!162851))

(assert (= (and d!56117 (not c!8566)) b!162852))

(declare-fun m!258615 () Bool)

(assert (=> d!56117 m!258615))

(declare-fun m!258617 () Bool)

(assert (=> b!162851 m!258617))

(assert (=> b!162837 d!56117))

(push 1)

(assert (not b!162851))

(check-sat)

(pop 1)

(push 1)

(check-sat)


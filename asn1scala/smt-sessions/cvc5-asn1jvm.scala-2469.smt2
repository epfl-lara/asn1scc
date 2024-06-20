; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62754 () Bool)

(assert start!62754)

(declare-fun b!280975 () Bool)

(declare-datatypes ((Unit!19713 0))(
  ( (Unit!19714) )
))
(declare-fun e!200549 () Unit!19713)

(declare-fun Unit!19715 () Unit!19713)

(assert (=> b!280975 (= e!200549 Unit!19715)))

(declare-datatypes ((array!16228 0))(
  ( (array!16229 (arr!8008 (Array (_ BitVec 32) (_ BitVec 8))) (size!7012 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16228)

(declare-fun a2!699 () array!16228)

(declare-datatypes ((tuple4!774 0))(
  ( (tuple4!775 (_1!12462 (_ BitVec 32)) (_2!12462 (_ BitVec 32)) (_3!1167 (_ BitVec 32)) (_4!387 (_ BitVec 32))) )
))
(declare-fun lt!417109 () tuple4!774)

(declare-fun arrayRangesEq!1280 (array!16228 array!16228 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280975 (arrayRangesEq!1280 a1!699 a2!699 (_1!12462 lt!417109) (_2!12462 lt!417109))))

(declare-fun lt!417108 () Unit!19713)

(declare-fun arrayRangesEqSymmetricLemma!187 (array!16228 array!16228 (_ BitVec 32) (_ BitVec 32)) Unit!19713)

(assert (=> b!280975 (= lt!417108 (arrayRangesEqSymmetricLemma!187 a1!699 a2!699 (_1!12462 lt!417109) (_2!12462 lt!417109)))))

(assert (=> b!280975 (arrayRangesEq!1280 a2!699 a1!699 (_1!12462 lt!417109) (_2!12462 lt!417109))))

(declare-fun b!280976 () Bool)

(declare-fun res!233168 () Bool)

(declare-fun e!200548 () Bool)

(assert (=> b!280976 (=> (not res!233168) (not e!200548))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16228 array!16228 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280976 (= res!233168 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280977 () Bool)

(declare-fun Unit!19716 () Unit!19713)

(assert (=> b!280977 (= e!200549 Unit!19716)))

(declare-fun e!200546 () Bool)

(declare-fun b!280978 () Bool)

(assert (=> b!280978 (= e!200546 (not (or (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (and (bvsge (_4!387 lt!417109) #b00000000000000000000000000000000) (bvslt (_4!387 lt!417109) (size!7012 a1!699))))))))

(declare-fun e!200550 () Bool)

(assert (=> b!280978 e!200550))

(declare-fun res!233165 () Bool)

(assert (=> b!280978 (=> (not res!233165) (not e!200550))))

(declare-fun lt!417111 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280978 (= res!233165 (byteRangesEq!0 (select (arr!8008 a1!699) (_3!1167 lt!417109)) (select (arr!8008 a2!699) (_3!1167 lt!417109)) lt!417111 #b00000000000000000000000000001000))))

(declare-fun b!280979 () Bool)

(assert (=> b!280979 (= e!200550 (byteRangesEq!0 (select (arr!8008 a2!699) (_3!1167 lt!417109)) (select (arr!8008 a1!699) (_3!1167 lt!417109)) lt!417111 #b00000000000000000000000000001000))))

(declare-fun res!233166 () Bool)

(assert (=> start!62754 (=> (not res!233166) (not e!200548))))

(assert (=> start!62754 (= res!233166 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7012 a1!699) (size!7012 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7012 a1!699))))))))

(assert (=> start!62754 e!200548))

(assert (=> start!62754 true))

(declare-fun array_inv!6736 (array!16228) Bool)

(assert (=> start!62754 (array_inv!6736 a1!699)))

(assert (=> start!62754 (array_inv!6736 a2!699)))

(declare-fun b!280980 () Bool)

(declare-fun res!233164 () Bool)

(assert (=> b!280980 (=> (not res!233164) (not e!200548))))

(assert (=> b!280980 (= res!233164 (bvslt from!822 to!789))))

(declare-fun b!280981 () Bool)

(assert (=> b!280981 (= e!200548 e!200546)))

(declare-fun res!233167 () Bool)

(assert (=> b!280981 (=> (not res!233167) (not e!200546))))

(assert (=> b!280981 (= res!233167 (not (= (_3!1167 lt!417109) (_4!387 lt!417109))))))

(declare-fun lt!417110 () Unit!19713)

(assert (=> b!280981 (= lt!417110 e!200549)))

(declare-fun c!13077 () Bool)

(assert (=> b!280981 (= c!13077 (bvslt (_1!12462 lt!417109) (_2!12462 lt!417109)))))

(assert (=> b!280981 (= lt!417111 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!774)

(assert (=> b!280981 (= lt!417109 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62754 res!233166) b!280976))

(assert (= (and b!280976 res!233168) b!280980))

(assert (= (and b!280980 res!233164) b!280981))

(assert (= (and b!280981 c!13077) b!280975))

(assert (= (and b!280981 (not c!13077)) b!280977))

(assert (= (and b!280981 res!233167) b!280978))

(assert (= (and b!280978 res!233165) b!280979))

(declare-fun m!413997 () Bool)

(assert (=> b!280979 m!413997))

(declare-fun m!413999 () Bool)

(assert (=> b!280979 m!413999))

(assert (=> b!280979 m!413997))

(assert (=> b!280979 m!413999))

(declare-fun m!414001 () Bool)

(assert (=> b!280979 m!414001))

(declare-fun m!414003 () Bool)

(assert (=> b!280976 m!414003))

(assert (=> b!280978 m!413999))

(assert (=> b!280978 m!413997))

(assert (=> b!280978 m!413999))

(assert (=> b!280978 m!413997))

(declare-fun m!414005 () Bool)

(assert (=> b!280978 m!414005))

(declare-fun m!414007 () Bool)

(assert (=> b!280975 m!414007))

(declare-fun m!414009 () Bool)

(assert (=> b!280975 m!414009))

(declare-fun m!414011 () Bool)

(assert (=> b!280975 m!414011))

(declare-fun m!414013 () Bool)

(assert (=> start!62754 m!414013))

(declare-fun m!414015 () Bool)

(assert (=> start!62754 m!414015))

(declare-fun m!414017 () Bool)

(assert (=> b!280981 m!414017))

(push 1)

(assert (not b!280978))

(assert (not start!62754))

(assert (not b!280976))

(assert (not b!280981))

(assert (not b!280975))

(assert (not b!280979))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96654 () Bool)

(assert (=> d!96654 (= (byteRangesEq!0 (select (arr!8008 a1!699) (_3!1167 lt!417109)) (select (arr!8008 a2!699) (_3!1167 lt!417109)) lt!417111 #b00000000000000000000000000001000) (or (= lt!417111 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8008 a1!699) (_3!1167 lt!417109))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417111)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8008 a2!699) (_3!1167 lt!417109))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417111)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24356 () Bool)

(assert (= bs!24356 d!96654))

(declare-fun m!414089 () Bool)

(assert (=> bs!24356 m!414089))

(declare-fun m!414093 () Bool)

(assert (=> bs!24356 m!414093))

(assert (=> b!280978 d!96654))

(declare-fun d!96666 () Bool)

(declare-fun res!233233 () Bool)

(declare-fun e!200626 () Bool)

(assert (=> d!96666 (=> res!233233 e!200626)))

(assert (=> d!96666 (= res!233233 (bvsge from!822 to!789))))

(assert (=> d!96666 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200626)))

(declare-fun e!200627 () Bool)

(declare-fun b!281067 () Bool)

(declare-fun lt!417156 () tuple4!774)

(assert (=> b!281067 (= e!200627 (arrayRangesEq!1280 a1!699 a2!699 (_1!12462 lt!417156) (_2!12462 lt!417156)))))

(declare-fun b!281068 () Bool)

(declare-fun e!200629 () Bool)

(declare-fun e!200625 () Bool)

(assert (=> b!281068 (= e!200629 e!200625)))

(declare-fun res!233235 () Bool)

(declare-fun call!4670 () Bool)

(assert (=> b!281068 (= res!233235 call!4670)))

(assert (=> b!281068 (=> (not res!233235) (not e!200625))))

(declare-fun lt!417154 () (_ BitVec 32))

(declare-fun lt!417155 () (_ BitVec 32))

(declare-fun c!13089 () Bool)

(declare-fun bm!4667 () Bool)

(assert (=> bm!4667 (= call!4670 (byteRangesEq!0 (select (arr!8008 a1!699) (_3!1167 lt!417156)) (select (arr!8008 a2!699) (_3!1167 lt!417156)) lt!417154 (ite c!13089 lt!417155 #b00000000000000000000000000001000)))))

(declare-fun e!200628 () Bool)

(declare-fun b!281069 () Bool)

(assert (=> b!281069 (= e!200628 (byteRangesEq!0 (select (arr!8008 a1!699) (_4!387 lt!417156)) (select (arr!8008 a2!699) (_4!387 lt!417156)) #b00000000000000000000000000000000 lt!417155))))

(declare-fun b!281070 () Bool)

(declare-fun e!200630 () Bool)

(assert (=> b!281070 (= e!200630 e!200629)))

(assert (=> b!281070 (= c!13089 (= (_3!1167 lt!417156) (_4!387 lt!417156)))))

(declare-fun b!281071 () Bool)

(assert (=> b!281071 (= e!200629 call!4670)))

(declare-fun b!281072 () Bool)

(assert (=> b!281072 (= e!200626 e!200630)))

(declare-fun res!233232 () Bool)

(assert (=> b!281072 (=> (not res!233232) (not e!200630))))

(assert (=> b!281072 (= res!233232 e!200627)))

(declare-fun res!233236 () Bool)

(assert (=> b!281072 (=> res!233236 e!200627)))

(assert (=> b!281072 (= res!233236 (bvsge (_1!12462 lt!417156) (_2!12462 lt!417156)))))

(assert (=> b!281072 (= lt!417155 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281072 (= lt!417154 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281072 (= lt!417156 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281073 () Bool)

(declare-fun res!233234 () Bool)

(assert (=> b!281073 (= res!233234 (= lt!417155 #b00000000000000000000000000000000))))

(assert (=> b!281073 (=> res!233234 e!200628)))

(assert (=> b!281073 (= e!200625 e!200628)))

(assert (= (and d!96666 (not res!233233)) b!281072))

(assert (= (and b!281072 (not res!233236)) b!281067))

(assert (= (and b!281072 res!233232) b!281070))

(assert (= (and b!281070 c!13089) b!281071))

(assert (= (and b!281070 (not c!13089)) b!281068))

(assert (= (and b!281068 res!233235) b!281073))

(assert (= (and b!281073 (not res!233234)) b!281069))

(assert (= (or b!281071 b!281068) bm!4667))

(declare-fun m!414095 () Bool)

(assert (=> b!281067 m!414095))

(declare-fun m!414097 () Bool)

(assert (=> bm!4667 m!414097))

(declare-fun m!414099 () Bool)

(assert (=> bm!4667 m!414099))

(assert (=> bm!4667 m!414097))

(assert (=> bm!4667 m!414099))

(declare-fun m!414101 () Bool)

(assert (=> bm!4667 m!414101))

(declare-fun m!414103 () Bool)

(assert (=> b!281069 m!414103))

(declare-fun m!414105 () Bool)

(assert (=> b!281069 m!414105))

(assert (=> b!281069 m!414103))

(assert (=> b!281069 m!414105))

(declare-fun m!414107 () Bool)

(assert (=> b!281069 m!414107))

(assert (=> b!281072 m!414017))

(assert (=> b!280976 d!96666))

(declare-fun d!96672 () Bool)

(assert (=> d!96672 (= (array_inv!6736 a1!699) (bvsge (size!7012 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62754 d!96672))

(declare-fun d!96674 () Bool)

(assert (=> d!96674 (= (array_inv!6736 a2!699) (bvsge (size!7012 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62754 d!96674))

(declare-fun d!96676 () Bool)

(assert (=> d!96676 (= (arrayBitIndices!0 from!822 to!789) (tuple4!775 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280981 d!96676))

(declare-fun d!96678 () Bool)

(declare-fun res!233241 () Bool)

(declare-fun e!200635 () Bool)

(assert (=> d!96678 (=> res!233241 e!200635)))

(assert (=> d!96678 (= res!233241 (= (_1!12462 lt!417109) (_2!12462 lt!417109)))))

(assert (=> d!96678 (= (arrayRangesEq!1280 a1!699 a2!699 (_1!12462 lt!417109) (_2!12462 lt!417109)) e!200635)))

(declare-fun b!281078 () Bool)

(declare-fun e!200636 () Bool)

(assert (=> b!281078 (= e!200635 e!200636)))

(declare-fun res!233242 () Bool)

(assert (=> b!281078 (=> (not res!233242) (not e!200636))))

(assert (=> b!281078 (= res!233242 (= (select (arr!8008 a1!699) (_1!12462 lt!417109)) (select (arr!8008 a2!699) (_1!12462 lt!417109))))))

(declare-fun b!281079 () Bool)

(assert (=> b!281079 (= e!200636 (arrayRangesEq!1280 a1!699 a2!699 (bvadd (_1!12462 lt!417109) #b00000000000000000000000000000001) (_2!12462 lt!417109)))))

(assert (= (and d!96678 (not res!233241)) b!281078))

(assert (= (and b!281078 res!233242) b!281079))

(declare-fun m!414109 () Bool)

(assert (=> b!281078 m!414109))

(declare-fun m!414111 () Bool)

(assert (=> b!281078 m!414111))

(declare-fun m!414113 () Bool)

(assert (=> b!281079 m!414113))

(assert (=> b!280975 d!96678))

(declare-fun d!96680 () Bool)

(assert (=> d!96680 (arrayRangesEq!1280 a2!699 a1!699 (_1!12462 lt!417109) (_2!12462 lt!417109))))

(declare-fun lt!417159 () Unit!19713)

(declare-fun choose!493 (array!16228 array!16228 (_ BitVec 32) (_ BitVec 32)) Unit!19713)

(assert (=> d!96680 (= lt!417159 (choose!493 a1!699 a2!699 (_1!12462 lt!417109) (_2!12462 lt!417109)))))

(assert (=> d!96680 (and (bvsle #b00000000000000000000000000000000 (_1!12462 lt!417109)) (bvsle (_1!12462 lt!417109) (_2!12462 lt!417109)) (bvsle (_2!12462 lt!417109) (size!7012 a1!699)))))

(assert (=> d!96680 (= (arrayRangesEqSymmetricLemma!187 a1!699 a2!699 (_1!12462 lt!417109) (_2!12462 lt!417109)) lt!417159)))

(declare-fun bs!24357 () Bool)

(assert (= bs!24357 d!96680))

(assert (=> bs!24357 m!414011))

(declare-fun m!414115 () Bool)

(assert (=> bs!24357 m!414115))

(assert (=> b!280975 d!96680))

(declare-fun d!96682 () Bool)

(declare-fun res!233243 () Bool)

(declare-fun e!200637 () Bool)

(assert (=> d!96682 (=> res!233243 e!200637)))

(assert (=> d!96682 (= res!233243 (= (_1!12462 lt!417109) (_2!12462 lt!417109)))))

(assert (=> d!96682 (= (arrayRangesEq!1280 a2!699 a1!699 (_1!12462 lt!417109) (_2!12462 lt!417109)) e!200637)))

(declare-fun b!281080 () Bool)

(declare-fun e!200638 () Bool)

(assert (=> b!281080 (= e!200637 e!200638)))

(declare-fun res!233244 () Bool)

(assert (=> b!281080 (=> (not res!233244) (not e!200638))))

(assert (=> b!281080 (= res!233244 (= (select (arr!8008 a2!699) (_1!12462 lt!417109)) (select (arr!8008 a1!699) (_1!12462 lt!417109))))))

(declare-fun b!281081 () Bool)

(assert (=> b!281081 (= e!200638 (arrayRangesEq!1280 a2!699 a1!699 (bvadd (_1!12462 lt!417109) #b00000000000000000000000000000001) (_2!12462 lt!417109)))))

(assert (= (and d!96682 (not res!233243)) b!281080))

(assert (= (and b!281080 res!233244) b!281081))

(assert (=> b!281080 m!414111))

(assert (=> b!281080 m!414109))

(declare-fun m!414117 () Bool)

(assert (=> b!281081 m!414117))

(assert (=> b!280975 d!96682))

(declare-fun d!96684 () Bool)

(assert (=> d!96684 (= (byteRangesEq!0 (select (arr!8008 a2!699) (_3!1167 lt!417109)) (select (arr!8008 a1!699) (_3!1167 lt!417109)) lt!417111 #b00000000000000000000000000001000) (or (= lt!417111 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8008 a2!699) (_3!1167 lt!417109))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417111)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8008 a1!699) (_3!1167 lt!417109))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417111)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24358 () Bool)

(assert (= bs!24358 d!96684))

(assert (=> bs!24358 m!414089))

(assert (=> bs!24358 m!414093))

(assert (=> b!280979 d!96684))

(push 1)

(assert (not b!281081))

(assert (not b!281067))

(assert (not d!96680))

(assert (not b!281069))

(assert (not bm!4667))

(assert (not b!281072))

(assert (not b!281079))

(check-sat)

(pop 1)

(push 1)

(check-sat)


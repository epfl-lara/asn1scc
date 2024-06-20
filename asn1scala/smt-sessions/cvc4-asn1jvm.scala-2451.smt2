; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62158 () Bool)

(assert start!62158)

(declare-fun b!278825 () Bool)

(declare-fun res!231530 () Bool)

(declare-fun e!198652 () Bool)

(assert (=> b!278825 (=> (not res!231530) (not e!198652))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278825 (= res!231530 (bvslt from!822 to!789))))

(declare-datatypes ((tuple4!670 0))(
  ( (tuple4!671 (_1!12410 (_ BitVec 32)) (_2!12410 (_ BitVec 32)) (_3!1115 (_ BitVec 32)) (_4!335 (_ BitVec 32))) )
))
(declare-fun lt!416127 () tuple4!670)

(declare-datatypes ((array!16079 0))(
  ( (array!16080 (arr!7956 (Array (_ BitVec 32) (_ BitVec 8))) (size!6960 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16079)

(declare-fun b!278827 () Bool)

(declare-fun e!198651 () Bool)

(declare-fun a1!699 () array!16079)

(declare-fun arrayRangesEq!1228 (array!16079 array!16079 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278827 (= e!198651 (not (arrayRangesEq!1228 a1!699 a2!699 (_1!12410 lt!416127) (_2!12410 lt!416127))))))

(declare-fun b!278824 () Bool)

(declare-fun res!231529 () Bool)

(assert (=> b!278824 (=> (not res!231529) (not e!198652))))

(declare-fun arrayBitRangesEq!0 (array!16079 array!16079 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278824 (= res!231529 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!231527 () Bool)

(assert (=> start!62158 (=> (not res!231527) (not e!198652))))

(assert (=> start!62158 (= res!231527 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6960 a1!699) (size!6960 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6960 a1!699))))))))

(assert (=> start!62158 e!198652))

(assert (=> start!62158 true))

(declare-fun array_inv!6684 (array!16079) Bool)

(assert (=> start!62158 (array_inv!6684 a1!699)))

(assert (=> start!62158 (array_inv!6684 a2!699)))

(declare-fun b!278826 () Bool)

(assert (=> b!278826 (= e!198652 e!198651)))

(declare-fun res!231528 () Bool)

(assert (=> b!278826 (=> (not res!231528) (not e!198651))))

(assert (=> b!278826 (= res!231528 (bvslt (_1!12410 lt!416127) (_2!12410 lt!416127)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!670)

(assert (=> b!278826 (= lt!416127 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62158 res!231527) b!278824))

(assert (= (and b!278824 res!231529) b!278825))

(assert (= (and b!278825 res!231530) b!278826))

(assert (= (and b!278826 res!231528) b!278827))

(declare-fun m!411945 () Bool)

(assert (=> b!278827 m!411945))

(declare-fun m!411947 () Bool)

(assert (=> b!278824 m!411947))

(declare-fun m!411949 () Bool)

(assert (=> start!62158 m!411949))

(declare-fun m!411951 () Bool)

(assert (=> start!62158 m!411951))

(declare-fun m!411953 () Bool)

(assert (=> b!278826 m!411953))

(push 1)

(assert (not b!278824))

(assert (not b!278827))

(assert (not b!278826))

(assert (not start!62158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!278850 () Bool)

(declare-fun e!198677 () Bool)

(declare-fun e!198676 () Bool)

(assert (=> b!278850 (= e!198677 e!198676)))

(declare-fun c!12822 () Bool)

(declare-fun lt!416137 () tuple4!670)

(assert (=> b!278850 (= c!12822 (= (_3!1115 lt!416137) (_4!335 lt!416137)))))

(declare-fun b!278852 () Bool)

(declare-fun call!4529 () Bool)

(assert (=> b!278852 (= e!198676 call!4529)))

(declare-fun b!278853 () Bool)

(declare-fun e!198679 () Bool)

(assert (=> b!278853 (= e!198679 e!198677)))

(declare-fun res!231551 () Bool)

(assert (=> b!278853 (=> (not res!231551) (not e!198677))))

(declare-fun e!198680 () Bool)

(assert (=> b!278853 (= res!231551 e!198680)))

(declare-fun res!231549 () Bool)

(assert (=> b!278853 (=> res!231549 e!198680)))

(assert (=> b!278853 (= res!231549 (bvsge (_1!12410 lt!416137) (_2!12410 lt!416137)))))

(declare-fun lt!416138 () (_ BitVec 32))

(assert (=> b!278853 (= lt!416138 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416136 () (_ BitVec 32))

(assert (=> b!278853 (= lt!416136 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278853 (= lt!416137 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4526 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4526 (= call!4529 (byteRangesEq!0 (select (arr!7956 a1!699) (_3!1115 lt!416137)) (select (arr!7956 a2!699) (_3!1115 lt!416137)) lt!416136 (ite c!12822 lt!416138 #b00000000000000000000000000001000)))))

(declare-fun b!278854 () Bool)

(declare-fun e!198675 () Bool)

(assert (=> b!278854 (= e!198676 e!198675)))

(declare-fun res!231553 () Bool)

(assert (=> b!278854 (= res!231553 call!4529)))

(assert (=> b!278854 (=> (not res!231553) (not e!198675))))

(declare-fun b!278855 () Bool)

(declare-fun res!231550 () Bool)

(assert (=> b!278855 (= res!231550 (= lt!416138 #b00000000000000000000000000000000))))

(declare-fun e!198678 () Bool)

(assert (=> b!278855 (=> res!231550 e!198678)))

(assert (=> b!278855 (= e!198675 e!198678)))

(declare-fun b!278856 () Bool)

(assert (=> b!278856 (= e!198678 (byteRangesEq!0 (select (arr!7956 a1!699) (_4!335 lt!416137)) (select (arr!7956 a2!699) (_4!335 lt!416137)) #b00000000000000000000000000000000 lt!416138))))

(declare-fun d!95932 () Bool)

(declare-fun res!231552 () Bool)

(assert (=> d!95932 (=> res!231552 e!198679)))

(assert (=> d!95932 (= res!231552 (bvsge from!822 to!789))))

(assert (=> d!95932 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!198679)))

(declare-fun b!278851 () Bool)

(assert (=> b!278851 (= e!198680 (arrayRangesEq!1228 a1!699 a2!699 (_1!12410 lt!416137) (_2!12410 lt!416137)))))

(assert (= (and d!95932 (not res!231552)) b!278853))

(assert (= (and b!278853 (not res!231549)) b!278851))

(assert (= (and b!278853 res!231551) b!278850))

(assert (= (and b!278850 c!12822) b!278852))

(assert (= (and b!278850 (not c!12822)) b!278854))

(assert (= (and b!278854 res!231553) b!278855))

(assert (= (and b!278855 (not res!231550)) b!278856))

(assert (= (or b!278852 b!278854) bm!4526))

(assert (=> b!278853 m!411953))

(declare-fun m!411961 () Bool)

(assert (=> bm!4526 m!411961))

(declare-fun m!411963 () Bool)

(assert (=> bm!4526 m!411963))

(assert (=> bm!4526 m!411961))

(assert (=> bm!4526 m!411963))

(declare-fun m!411965 () Bool)

(assert (=> bm!4526 m!411965))

(declare-fun m!411967 () Bool)

(assert (=> b!278856 m!411967))

(declare-fun m!411969 () Bool)

(assert (=> b!278856 m!411969))

(assert (=> b!278856 m!411967))

(assert (=> b!278856 m!411969))

(declare-fun m!411971 () Bool)

(assert (=> b!278856 m!411971))

(declare-fun m!411973 () Bool)

(assert (=> b!278851 m!411973))

(assert (=> b!278824 d!95932))

(declare-fun d!95942 () Bool)

(declare-fun res!231566 () Bool)

(declare-fun e!198695 () Bool)

(assert (=> d!95942 (=> res!231566 e!198695)))

(assert (=> d!95942 (= res!231566 (= (_1!12410 lt!416127) (_2!12410 lt!416127)))))

(assert (=> d!95942 (= (arrayRangesEq!1228 a1!699 a2!699 (_1!12410 lt!416127) (_2!12410 lt!416127)) e!198695)))

(declare-fun b!278873 () Bool)

(declare-fun e!198696 () Bool)

(assert (=> b!278873 (= e!198695 e!198696)))

(declare-fun res!231567 () Bool)

(assert (=> b!278873 (=> (not res!231567) (not e!198696))))

(assert (=> b!278873 (= res!231567 (= (select (arr!7956 a1!699) (_1!12410 lt!416127)) (select (arr!7956 a2!699) (_1!12410 lt!416127))))))

(declare-fun b!278874 () Bool)

(assert (=> b!278874 (= e!198696 (arrayRangesEq!1228 a1!699 a2!699 (bvadd (_1!12410 lt!416127) #b00000000000000000000000000000001) (_2!12410 lt!416127)))))

(assert (= (and d!95942 (not res!231566)) b!278873))

(assert (= (and b!278873 res!231567) b!278874))

(declare-fun m!411975 () Bool)

(assert (=> b!278873 m!411975))

(declare-fun m!411977 () Bool)

(assert (=> b!278873 m!411977))

(declare-fun m!411979 () Bool)

(assert (=> b!278874 m!411979))

(assert (=> b!278827 d!95942))

(declare-fun d!95946 () Bool)

(assert (=> d!95946 (= (arrayBitIndices!0 from!822 to!789) (tuple4!671 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!278826 d!95946))

(declare-fun d!95948 () Bool)

(assert (=> d!95948 (= (array_inv!6684 a1!699) (bvsge (size!6960 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62158 d!95948))

(declare-fun d!95950 () Bool)

(assert (=> d!95950 (= (array_inv!6684 a2!699) (bvsge (size!6960 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62158 d!95950))

(push 1)

(assert (not b!278874))

(assert (not b!278853))

(assert (not b!278856))

(assert (not b!278851))

(assert (not bm!4526))

(check-sat)

(pop 1)

(push 1)

(check-sat)


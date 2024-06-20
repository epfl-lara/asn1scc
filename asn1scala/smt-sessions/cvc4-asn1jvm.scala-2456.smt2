; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62236 () Bool)

(assert start!62236)

(declare-fun b!279174 () Bool)

(declare-fun e!198976 () Bool)

(declare-datatypes ((tuple4!700 0))(
  ( (tuple4!701 (_1!12425 (_ BitVec 32)) (_2!12425 (_ BitVec 32)) (_3!1130 (_ BitVec 32)) (_4!350 (_ BitVec 32))) )
))
(declare-fun lt!416252 () tuple4!700)

(declare-datatypes ((array!16115 0))(
  ( (array!16116 (arr!7971 (Array (_ BitVec 32) (_ BitVec 8))) (size!6975 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16115)

(assert (=> b!279174 (= e!198976 (and (= (_3!1130 lt!416252) (_4!350 lt!416252)) (or (bvslt (_3!1130 lt!416252) #b00000000000000000000000000000000) (bvsge (_3!1130 lt!416252) (size!6975 a1!699)))))))

(declare-datatypes ((Unit!19565 0))(
  ( (Unit!19566) )
))
(declare-fun lt!416251 () Unit!19565)

(declare-fun e!198975 () Unit!19565)

(assert (=> b!279174 (= lt!416251 e!198975)))

(declare-fun c!12846 () Bool)

(assert (=> b!279174 (= c!12846 (bvslt (_1!12425 lt!416252) (_2!12425 lt!416252)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!700)

(assert (=> b!279174 (= lt!416252 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279176 () Bool)

(declare-fun Unit!19567 () Unit!19565)

(assert (=> b!279176 (= e!198975 Unit!19567)))

(declare-fun b!279177 () Bool)

(declare-fun res!231825 () Bool)

(assert (=> b!279177 (=> (not res!231825) (not e!198976))))

(assert (=> b!279177 (= res!231825 (bvslt from!822 to!789))))

(declare-fun b!279178 () Bool)

(declare-fun res!231827 () Bool)

(assert (=> b!279178 (=> (not res!231827) (not e!198976))))

(declare-fun a2!699 () array!16115)

(declare-fun arrayBitRangesEq!0 (array!16115 array!16115 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279178 (= res!231827 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!231826 () Bool)

(assert (=> start!62236 (=> (not res!231826) (not e!198976))))

(assert (=> start!62236 (= res!231826 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6975 a1!699) (size!6975 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6975 a1!699))))))))

(assert (=> start!62236 e!198976))

(assert (=> start!62236 true))

(declare-fun array_inv!6699 (array!16115) Bool)

(assert (=> start!62236 (array_inv!6699 a1!699)))

(assert (=> start!62236 (array_inv!6699 a2!699)))

(declare-fun b!279175 () Bool)

(declare-fun Unit!19568 () Unit!19565)

(assert (=> b!279175 (= e!198975 Unit!19568)))

(declare-fun arrayRangesEq!1243 (array!16115 array!16115 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279175 (arrayRangesEq!1243 a1!699 a2!699 (_1!12425 lt!416252) (_2!12425 lt!416252))))

(declare-fun lt!416253 () Unit!19565)

(declare-fun arrayRangesEqSymmetricLemma!150 (array!16115 array!16115 (_ BitVec 32) (_ BitVec 32)) Unit!19565)

(assert (=> b!279175 (= lt!416253 (arrayRangesEqSymmetricLemma!150 a1!699 a2!699 (_1!12425 lt!416252) (_2!12425 lt!416252)))))

(assert (=> b!279175 (arrayRangesEq!1243 a2!699 a1!699 (_1!12425 lt!416252) (_2!12425 lt!416252))))

(assert (= (and start!62236 res!231826) b!279178))

(assert (= (and b!279178 res!231827) b!279177))

(assert (= (and b!279177 res!231825) b!279174))

(assert (= (and b!279174 c!12846) b!279175))

(assert (= (and b!279174 (not c!12846)) b!279176))

(declare-fun m!412235 () Bool)

(assert (=> b!279174 m!412235))

(declare-fun m!412237 () Bool)

(assert (=> b!279178 m!412237))

(declare-fun m!412239 () Bool)

(assert (=> start!62236 m!412239))

(declare-fun m!412241 () Bool)

(assert (=> start!62236 m!412241))

(declare-fun m!412243 () Bool)

(assert (=> b!279175 m!412243))

(declare-fun m!412245 () Bool)

(assert (=> b!279175 m!412245))

(declare-fun m!412247 () Bool)

(assert (=> b!279175 m!412247))

(push 1)

(assert (not b!279175))

(assert (not b!279178))

(assert (not start!62236))

(assert (not b!279174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96002 () Bool)

(declare-fun res!231832 () Bool)

(declare-fun e!198983 () Bool)

(assert (=> d!96002 (=> res!231832 e!198983)))

(assert (=> d!96002 (= res!231832 (= (_1!12425 lt!416252) (_2!12425 lt!416252)))))

(assert (=> d!96002 (= (arrayRangesEq!1243 a1!699 a2!699 (_1!12425 lt!416252) (_2!12425 lt!416252)) e!198983)))

(declare-fun b!279183 () Bool)

(declare-fun e!198984 () Bool)

(assert (=> b!279183 (= e!198983 e!198984)))

(declare-fun res!231833 () Bool)

(assert (=> b!279183 (=> (not res!231833) (not e!198984))))

(assert (=> b!279183 (= res!231833 (= (select (arr!7971 a1!699) (_1!12425 lt!416252)) (select (arr!7971 a2!699) (_1!12425 lt!416252))))))

(declare-fun b!279184 () Bool)

(assert (=> b!279184 (= e!198984 (arrayRangesEq!1243 a1!699 a2!699 (bvadd (_1!12425 lt!416252) #b00000000000000000000000000000001) (_2!12425 lt!416252)))))

(assert (= (and d!96002 (not res!231832)) b!279183))

(assert (= (and b!279183 res!231833) b!279184))

(declare-fun m!412249 () Bool)

(assert (=> b!279183 m!412249))

(declare-fun m!412251 () Bool)

(assert (=> b!279183 m!412251))

(declare-fun m!412253 () Bool)

(assert (=> b!279184 m!412253))

(assert (=> b!279175 d!96002))

(declare-fun d!96006 () Bool)

(assert (=> d!96006 (arrayRangesEq!1243 a2!699 a1!699 (_1!12425 lt!416252) (_2!12425 lt!416252))))

(declare-fun lt!416262 () Unit!19565)

(declare-fun choose!458 (array!16115 array!16115 (_ BitVec 32) (_ BitVec 32)) Unit!19565)

(assert (=> d!96006 (= lt!416262 (choose!458 a1!699 a2!699 (_1!12425 lt!416252) (_2!12425 lt!416252)))))

(assert (=> d!96006 (and (bvsle #b00000000000000000000000000000000 (_1!12425 lt!416252)) (bvsle (_1!12425 lt!416252) (_2!12425 lt!416252)) (bvsle (_2!12425 lt!416252) (size!6975 a1!699)))))

(assert (=> d!96006 (= (arrayRangesEqSymmetricLemma!150 a1!699 a2!699 (_1!12425 lt!416252) (_2!12425 lt!416252)) lt!416262)))

(declare-fun bs!24239 () Bool)

(assert (= bs!24239 d!96006))

(assert (=> bs!24239 m!412247))

(declare-fun m!412255 () Bool)

(assert (=> bs!24239 m!412255))

(assert (=> b!279175 d!96006))

(declare-fun d!96012 () Bool)

(declare-fun res!231844 () Bool)

(declare-fun e!198997 () Bool)

(assert (=> d!96012 (=> res!231844 e!198997)))

(assert (=> d!96012 (= res!231844 (= (_1!12425 lt!416252) (_2!12425 lt!416252)))))

(assert (=> d!96012 (= (arrayRangesEq!1243 a2!699 a1!699 (_1!12425 lt!416252) (_2!12425 lt!416252)) e!198997)))

(declare-fun b!279199 () Bool)

(declare-fun e!198998 () Bool)

(assert (=> b!279199 (= e!198997 e!198998)))

(declare-fun res!231845 () Bool)

(assert (=> b!279199 (=> (not res!231845) (not e!198998))))

(assert (=> b!279199 (= res!231845 (= (select (arr!7971 a2!699) (_1!12425 lt!416252)) (select (arr!7971 a1!699) (_1!12425 lt!416252))))))

(declare-fun b!279200 () Bool)

(assert (=> b!279200 (= e!198998 (arrayRangesEq!1243 a2!699 a1!699 (bvadd (_1!12425 lt!416252) #b00000000000000000000000000000001) (_2!12425 lt!416252)))))

(assert (= (and d!96012 (not res!231844)) b!279199))

(assert (= (and b!279199 res!231845) b!279200))

(assert (=> b!279199 m!412251))

(assert (=> b!279199 m!412249))

(declare-fun m!412257 () Bool)

(assert (=> b!279200 m!412257))

(assert (=> b!279175 d!96012))

(declare-fun b!279238 () Bool)

(declare-fun e!199038 () Bool)

(declare-fun e!199034 () Bool)

(assert (=> b!279238 (= e!199038 e!199034)))

(declare-fun c!12852 () Bool)

(declare-fun lt!416280 () tuple4!700)

(assert (=> b!279238 (= c!12852 (= (_3!1130 lt!416280) (_4!350 lt!416280)))))

(declare-fun b!279239 () Bool)

(declare-fun e!199036 () Bool)

(assert (=> b!279239 (= e!199036 e!199038)))

(declare-fun res!231879 () Bool)

(assert (=> b!279239 (=> (not res!231879) (not e!199038))))

(declare-fun e!199037 () Bool)

(assert (=> b!279239 (= res!231879 e!199037)))

(declare-fun res!231880 () Bool)

(assert (=> b!279239 (=> res!231880 e!199037)))

(assert (=> b!279239 (= res!231880 (bvsge (_1!12425 lt!416280) (_2!12425 lt!416280)))))

(declare-fun lt!416279 () (_ BitVec 32))

(assert (=> b!279239 (= lt!416279 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416278 () (_ BitVec 32))

(assert (=> b!279239 (= lt!416278 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279239 (= lt!416280 (arrayBitIndices!0 from!822 to!789))))

(declare-fun d!96014 () Bool)

(declare-fun res!231881 () Bool)

(assert (=> d!96014 (=> res!231881 e!199036)))

(assert (=> d!96014 (= res!231881 (bvsge from!822 to!789))))

(assert (=> d!96014 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199036)))

(declare-fun b!279240 () Bool)

(declare-fun res!231878 () Bool)

(assert (=> b!279240 (= res!231878 (= lt!416279 #b00000000000000000000000000000000))))

(declare-fun e!199033 () Bool)

(assert (=> b!279240 (=> res!231878 e!199033)))

(declare-fun e!199035 () Bool)

(assert (=> b!279240 (= e!199035 e!199033)))

(declare-fun b!279241 () Bool)

(assert (=> b!279241 (= e!199037 (arrayRangesEq!1243 a1!699 a2!699 (_1!12425 lt!416280) (_2!12425 lt!416280)))))

(declare-fun call!4550 () Bool)

(declare-fun bm!4547 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4547 (= call!4550 (byteRangesEq!0 (ite c!12852 (select (arr!7971 a1!699) (_3!1130 lt!416280)) (select (arr!7971 a1!699) (_4!350 lt!416280))) (ite c!12852 (select (arr!7971 a2!699) (_3!1130 lt!416280)) (select (arr!7971 a2!699) (_4!350 lt!416280))) (ite c!12852 lt!416278 #b00000000000000000000000000000000) lt!416279))))

(declare-fun b!279242 () Bool)

(assert (=> b!279242 (= e!199034 e!199035)))

(declare-fun res!231877 () Bool)

(assert (=> b!279242 (= res!231877 (byteRangesEq!0 (select (arr!7971 a1!699) (_3!1130 lt!416280)) (select (arr!7971 a2!699) (_3!1130 lt!416280)) lt!416278 #b00000000000000000000000000001000))))

(assert (=> b!279242 (=> (not res!231877) (not e!199035))))

(declare-fun b!279243 () Bool)

(assert (=> b!279243 (= e!199033 call!4550)))

(declare-fun b!279244 () Bool)

(assert (=> b!279244 (= e!199034 call!4550)))

(assert (= (and d!96014 (not res!231881)) b!279239))

(assert (= (and b!279239 (not res!231880)) b!279241))

(assert (= (and b!279239 res!231879) b!279238))

(assert (= (and b!279238 c!12852) b!279244))

(assert (= (and b!279238 (not c!12852)) b!279242))

(assert (= (and b!279242 res!231877) b!279240))

(assert (= (and b!279240 (not res!231878)) b!279243))

(assert (= (or b!279244 b!279243) bm!4547))

(assert (=> b!279239 m!412235))

(declare-fun m!412293 () Bool)

(assert (=> b!279241 m!412293))

(declare-fun m!412295 () Bool)

(assert (=> bm!4547 m!412295))

(declare-fun m!412297 () Bool)

(assert (=> bm!4547 m!412297))

(declare-fun m!412299 () Bool)

(assert (=> bm!4547 m!412299))

(declare-fun m!412301 () Bool)

(assert (=> bm!4547 m!412301))

(declare-fun m!412303 () Bool)

(assert (=> bm!4547 m!412303))

(assert (=> b!279242 m!412295))

(assert (=> b!279242 m!412299))

(assert (=> b!279242 m!412295))

(assert (=> b!279242 m!412299))

(declare-fun m!412305 () Bool)

(assert (=> b!279242 m!412305))

(assert (=> b!279178 d!96014))

(declare-fun d!96034 () Bool)

(assert (=> d!96034 (= (array_inv!6699 a1!699) (bvsge (size!6975 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62236 d!96034))

(declare-fun d!96038 () Bool)

(assert (=> d!96038 (= (array_inv!6699 a2!699) (bvsge (size!6975 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62236 d!96038))

(declare-fun d!96040 () Bool)

(assert (=> d!96040 (= (arrayBitIndices!0 from!822 to!789) (tuple4!701 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279174 d!96040))

(push 1)

(assert (not bm!4547))

(assert (not b!279200))

(assert (not b!279241))

(assert (not b!279184))

(assert (not b!279242))

(assert (not b!279239))

(assert (not d!96006))

(check-sat)

(pop 1)

(push 1)

(check-sat)


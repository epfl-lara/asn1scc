; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62518 () Bool)

(assert start!62518)

(declare-fun b!280173 () Bool)

(declare-datatypes ((Unit!19649 0))(
  ( (Unit!19650) )
))
(declare-fun e!199845 () Unit!19649)

(declare-fun Unit!19651 () Unit!19649)

(assert (=> b!280173 (= e!199845 Unit!19651)))

(declare-datatypes ((array!16178 0))(
  ( (array!16179 (arr!7992 (Array (_ BitVec 32) (_ BitVec 8))) (size!6996 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16178)

(declare-fun a2!699 () array!16178)

(declare-datatypes ((tuple4!742 0))(
  ( (tuple4!743 (_1!12446 (_ BitVec 32)) (_2!12446 (_ BitVec 32)) (_3!1151 (_ BitVec 32)) (_4!371 (_ BitVec 32))) )
))
(declare-fun lt!416738 () tuple4!742)

(declare-fun arrayRangesEq!1264 (array!16178 array!16178 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280173 (arrayRangesEq!1264 a1!699 a2!699 (_1!12446 lt!416738) (_2!12446 lt!416738))))

(declare-fun lt!416737 () Unit!19649)

(declare-fun arrayRangesEqSymmetricLemma!171 (array!16178 array!16178 (_ BitVec 32) (_ BitVec 32)) Unit!19649)

(assert (=> b!280173 (= lt!416737 (arrayRangesEqSymmetricLemma!171 a1!699 a2!699 (_1!12446 lt!416738) (_2!12446 lt!416738)))))

(assert (=> b!280173 (arrayRangesEq!1264 a2!699 a1!699 (_1!12446 lt!416738) (_2!12446 lt!416738))))

(declare-fun b!280174 () Bool)

(declare-fun Unit!19652 () Unit!19649)

(assert (=> b!280174 (= e!199845 Unit!19652)))

(declare-fun b!280175 () Bool)

(declare-fun e!199846 () Bool)

(assert (=> b!280175 (= e!199846 (and (not (= (_3!1151 lt!416738) (_4!371 lt!416738))) (or (bvslt (_3!1151 lt!416738) #b00000000000000000000000000000000) (bvsge (_3!1151 lt!416738) (size!6996 a1!699)))))))

(declare-fun lt!416739 () Unit!19649)

(assert (=> b!280175 (= lt!416739 e!199845)))

(declare-fun c!12975 () Bool)

(assert (=> b!280175 (= c!12975 (bvslt (_1!12446 lt!416738) (_2!12446 lt!416738)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!742)

(assert (=> b!280175 (= lt!416738 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280176 () Bool)

(declare-fun res!232567 () Bool)

(assert (=> b!280176 (=> (not res!232567) (not e!199846))))

(assert (=> b!280176 (= res!232567 (bvslt from!822 to!789))))

(declare-fun b!280177 () Bool)

(declare-fun res!232568 () Bool)

(assert (=> b!280177 (=> (not res!232568) (not e!199846))))

(declare-fun arrayBitRangesEq!0 (array!16178 array!16178 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280177 (= res!232568 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!232566 () Bool)

(assert (=> start!62518 (=> (not res!232566) (not e!199846))))

(assert (=> start!62518 (= res!232566 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6996 a1!699) (size!6996 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6996 a1!699))))))))

(assert (=> start!62518 e!199846))

(assert (=> start!62518 true))

(declare-fun array_inv!6720 (array!16178) Bool)

(assert (=> start!62518 (array_inv!6720 a1!699)))

(assert (=> start!62518 (array_inv!6720 a2!699)))

(assert (= (and start!62518 res!232566) b!280177))

(assert (= (and b!280177 res!232568) b!280176))

(assert (= (and b!280176 res!232567) b!280175))

(assert (= (and b!280175 c!12975) b!280173))

(assert (= (and b!280175 (not c!12975)) b!280174))

(declare-fun m!413215 () Bool)

(assert (=> b!280173 m!413215))

(declare-fun m!413217 () Bool)

(assert (=> b!280173 m!413217))

(declare-fun m!413219 () Bool)

(assert (=> b!280173 m!413219))

(declare-fun m!413221 () Bool)

(assert (=> b!280175 m!413221))

(declare-fun m!413223 () Bool)

(assert (=> b!280177 m!413223))

(declare-fun m!413225 () Bool)

(assert (=> start!62518 m!413225))

(declare-fun m!413227 () Bool)

(assert (=> start!62518 m!413227))

(push 1)

(assert (not b!280175))

(assert (not b!280173))

(assert (not b!280177))

(assert (not start!62518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96360 () Bool)

(assert (=> d!96360 (= (arrayBitIndices!0 from!822 to!789) (tuple4!743 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280175 d!96360))

(declare-fun d!96374 () Bool)

(declare-fun res!232587 () Bool)

(declare-fun e!199867 () Bool)

(assert (=> d!96374 (=> res!232587 e!199867)))

(assert (=> d!96374 (= res!232587 (= (_1!12446 lt!416738) (_2!12446 lt!416738)))))

(assert (=> d!96374 (= (arrayRangesEq!1264 a1!699 a2!699 (_1!12446 lt!416738) (_2!12446 lt!416738)) e!199867)))

(declare-fun b!280196 () Bool)

(declare-fun e!199868 () Bool)

(assert (=> b!280196 (= e!199867 e!199868)))

(declare-fun res!232588 () Bool)

(assert (=> b!280196 (=> (not res!232588) (not e!199868))))

(assert (=> b!280196 (= res!232588 (= (select (arr!7992 a1!699) (_1!12446 lt!416738)) (select (arr!7992 a2!699) (_1!12446 lt!416738))))))

(declare-fun b!280197 () Bool)

(assert (=> b!280197 (= e!199868 (arrayRangesEq!1264 a1!699 a2!699 (bvadd (_1!12446 lt!416738) #b00000000000000000000000000000001) (_2!12446 lt!416738)))))

(assert (= (and d!96374 (not res!232587)) b!280196))

(assert (= (and b!280196 res!232588) b!280197))

(declare-fun m!413239 () Bool)

(assert (=> b!280196 m!413239))

(declare-fun m!413241 () Bool)

(assert (=> b!280196 m!413241))

(declare-fun m!413245 () Bool)

(assert (=> b!280197 m!413245))

(assert (=> b!280173 d!96374))

(declare-fun d!96380 () Bool)

(assert (=> d!96380 (arrayRangesEq!1264 a2!699 a1!699 (_1!12446 lt!416738) (_2!12446 lt!416738))))

(declare-fun lt!416745 () Unit!19649)

(declare-fun choose!477 (array!16178 array!16178 (_ BitVec 32) (_ BitVec 32)) Unit!19649)

(assert (=> d!96380 (= lt!416745 (choose!477 a1!699 a2!699 (_1!12446 lt!416738) (_2!12446 lt!416738)))))

(assert (=> d!96380 (and (bvsle #b00000000000000000000000000000000 (_1!12446 lt!416738)) (bvsle (_1!12446 lt!416738) (_2!12446 lt!416738)) (bvsle (_2!12446 lt!416738) (size!6996 a1!699)))))

(assert (=> d!96380 (= (arrayRangesEqSymmetricLemma!171 a1!699 a2!699 (_1!12446 lt!416738) (_2!12446 lt!416738)) lt!416745)))

(declare-fun bs!24303 () Bool)

(assert (= bs!24303 d!96380))

(assert (=> bs!24303 m!413219))

(declare-fun m!413251 () Bool)

(assert (=> bs!24303 m!413251))

(assert (=> b!280173 d!96380))

(declare-fun d!96384 () Bool)

(declare-fun res!232589 () Bool)

(declare-fun e!199869 () Bool)

(assert (=> d!96384 (=> res!232589 e!199869)))

(assert (=> d!96384 (= res!232589 (= (_1!12446 lt!416738) (_2!12446 lt!416738)))))

(assert (=> d!96384 (= (arrayRangesEq!1264 a2!699 a1!699 (_1!12446 lt!416738) (_2!12446 lt!416738)) e!199869)))

(declare-fun b!280198 () Bool)

(declare-fun e!199870 () Bool)

(assert (=> b!280198 (= e!199869 e!199870)))

(declare-fun res!232590 () Bool)

(assert (=> b!280198 (=> (not res!232590) (not e!199870))))

(assert (=> b!280198 (= res!232590 (= (select (arr!7992 a2!699) (_1!12446 lt!416738)) (select (arr!7992 a1!699) (_1!12446 lt!416738))))))

(declare-fun b!280199 () Bool)

(assert (=> b!280199 (= e!199870 (arrayRangesEq!1264 a2!699 a1!699 (bvadd (_1!12446 lt!416738) #b00000000000000000000000000000001) (_2!12446 lt!416738)))))

(assert (= (and d!96384 (not res!232589)) b!280198))

(assert (= (and b!280198 res!232590) b!280199))

(assert (=> b!280198 m!413241))

(assert (=> b!280198 m!413239))

(declare-fun m!413253 () Bool)

(assert (=> b!280199 m!413253))

(assert (=> b!280173 d!96384))

(declare-fun b!280237 () Bool)

(declare-fun e!199908 () Bool)

(declare-fun call!4616 () Bool)

(assert (=> b!280237 (= e!199908 call!4616)))

(declare-fun b!280238 () Bool)

(declare-fun e!199906 () Bool)

(assert (=> b!280238 (= e!199906 e!199908)))

(declare-fun c!12981 () Bool)

(declare-fun lt!416765 () tuple4!742)

(assert (=> b!280238 (= c!12981 (= (_3!1151 lt!416765) (_4!371 lt!416765)))))

(declare-fun b!280239 () Bool)

(declare-fun e!199905 () Bool)

(assert (=> b!280239 (= e!199905 e!199906)))

(declare-fun res!232620 () Bool)

(assert (=> b!280239 (=> (not res!232620) (not e!199906))))

(declare-fun e!199903 () Bool)

(assert (=> b!280239 (= res!232620 e!199903)))

(declare-fun res!232621 () Bool)

(assert (=> b!280239 (=> res!232621 e!199903)))

(assert (=> b!280239 (= res!232621 (bvsge (_1!12446 lt!416765) (_2!12446 lt!416765)))))

(declare-fun lt!416764 () (_ BitVec 32))

(assert (=> b!280239 (= lt!416764 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416766 () (_ BitVec 32))

(assert (=> b!280239 (= lt!416766 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280239 (= lt!416765 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280240 () Bool)

(declare-fun res!232622 () Bool)

(assert (=> b!280240 (= res!232622 (= lt!416764 #b00000000000000000000000000000000))))

(declare-fun e!199907 () Bool)

(assert (=> b!280240 (=> res!232622 e!199907)))

(declare-fun e!199904 () Bool)

(assert (=> b!280240 (= e!199904 e!199907)))

(declare-fun d!96386 () Bool)

(declare-fun res!232619 () Bool)

(assert (=> d!96386 (=> res!232619 e!199905)))

(assert (=> d!96386 (= res!232619 (bvsge from!822 to!789))))

(assert (=> d!96386 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199905)))

(declare-fun b!280241 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280241 (= e!199907 (byteRangesEq!0 (select (arr!7992 a1!699) (_4!371 lt!416765)) (select (arr!7992 a2!699) (_4!371 lt!416765)) #b00000000000000000000000000000000 lt!416764))))

(declare-fun b!280242 () Bool)

(assert (=> b!280242 (= e!199903 (arrayRangesEq!1264 a1!699 a2!699 (_1!12446 lt!416765) (_2!12446 lt!416765)))))

(declare-fun bm!4613 () Bool)

(assert (=> bm!4613 (= call!4616 (byteRangesEq!0 (select (arr!7992 a1!699) (_3!1151 lt!416765)) (select (arr!7992 a2!699) (_3!1151 lt!416765)) lt!416766 (ite c!12981 lt!416764 #b00000000000000000000000000001000)))))

(declare-fun b!280243 () Bool)

(assert (=> b!280243 (= e!199908 e!199904)))

(declare-fun res!232618 () Bool)

(assert (=> b!280243 (= res!232618 call!4616)))

(assert (=> b!280243 (=> (not res!232618) (not e!199904))))

(assert (= (and d!96386 (not res!232619)) b!280239))

(assert (= (and b!280239 (not res!232621)) b!280242))

(assert (= (and b!280239 res!232620) b!280238))

(assert (= (and b!280238 c!12981) b!280237))

(assert (= (and b!280238 (not c!12981)) b!280243))

(assert (= (and b!280243 res!232618) b!280240))

(assert (= (and b!280240 (not res!232622)) b!280241))

(assert (= (or b!280237 b!280243) bm!4613))

(assert (=> b!280239 m!413221))

(declare-fun m!413273 () Bool)

(assert (=> b!280241 m!413273))

(declare-fun m!413275 () Bool)

(assert (=> b!280241 m!413275))

(assert (=> b!280241 m!413273))

(assert (=> b!280241 m!413275))

(declare-fun m!413277 () Bool)

(assert (=> b!280241 m!413277))

(declare-fun m!413279 () Bool)

(assert (=> b!280242 m!413279))

(declare-fun m!413281 () Bool)

(assert (=> bm!4613 m!413281))

(declare-fun m!413283 () Bool)

(assert (=> bm!4613 m!413283))

(assert (=> bm!4613 m!413281))

(assert (=> bm!4613 m!413283))

(declare-fun m!413285 () Bool)

(assert (=> bm!4613 m!413285))

(assert (=> b!280177 d!96386))

(declare-fun d!96394 () Bool)

(assert (=> d!96394 (= (array_inv!6720 a1!699) (bvsge (size!6996 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62518 d!96394))

(declare-fun d!96396 () Bool)

(assert (=> d!96396 (= (array_inv!6720 a2!699) (bvsge (size!6996 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62518 d!96396))

(push 1)

(assert (not d!96380))

(assert (not b!280241))

(assert (not b!280239))

(assert (not b!280199))

(assert (not bm!4613))

(assert (not b!280197))

(assert (not b!280242))

(check-sat)

(pop 1)

(push 1)

(check-sat)


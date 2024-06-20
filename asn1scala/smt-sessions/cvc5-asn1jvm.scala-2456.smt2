; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62232 () Bool)

(assert start!62232)

(declare-fun b!279144 () Bool)

(declare-fun e!198952 () Bool)

(declare-datatypes ((tuple4!696 0))(
  ( (tuple4!697 (_1!12423 (_ BitVec 32)) (_2!12423 (_ BitVec 32)) (_3!1128 (_ BitVec 32)) (_4!348 (_ BitVec 32))) )
))
(declare-fun lt!416235 () tuple4!696)

(declare-datatypes ((array!16111 0))(
  ( (array!16112 (arr!7969 (Array (_ BitVec 32) (_ BitVec 8))) (size!6973 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16111)

(assert (=> b!279144 (= e!198952 (and (= (_3!1128 lt!416235) (_4!348 lt!416235)) (or (bvslt (_3!1128 lt!416235) #b00000000000000000000000000000000) (bvsge (_3!1128 lt!416235) (size!6973 a1!699)))))))

(declare-datatypes ((Unit!19557 0))(
  ( (Unit!19558) )
))
(declare-fun lt!416234 () Unit!19557)

(declare-fun e!198953 () Unit!19557)

(assert (=> b!279144 (= lt!416234 e!198953)))

(declare-fun c!12840 () Bool)

(assert (=> b!279144 (= c!12840 (bvslt (_1!12423 lt!416235) (_2!12423 lt!416235)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!696)

(assert (=> b!279144 (= lt!416235 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!231807 () Bool)

(assert (=> start!62232 (=> (not res!231807) (not e!198952))))

(declare-fun a2!699 () array!16111)

(assert (=> start!62232 (= res!231807 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6973 a1!699) (size!6973 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6973 a1!699))))))))

(assert (=> start!62232 e!198952))

(assert (=> start!62232 true))

(declare-fun array_inv!6697 (array!16111) Bool)

(assert (=> start!62232 (array_inv!6697 a1!699)))

(assert (=> start!62232 (array_inv!6697 a2!699)))

(declare-fun b!279145 () Bool)

(declare-fun Unit!19559 () Unit!19557)

(assert (=> b!279145 (= e!198953 Unit!19559)))

(declare-fun arrayRangesEq!1241 (array!16111 array!16111 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279145 (arrayRangesEq!1241 a1!699 a2!699 (_1!12423 lt!416235) (_2!12423 lt!416235))))

(declare-fun lt!416233 () Unit!19557)

(declare-fun arrayRangesEqSymmetricLemma!148 (array!16111 array!16111 (_ BitVec 32) (_ BitVec 32)) Unit!19557)

(assert (=> b!279145 (= lt!416233 (arrayRangesEqSymmetricLemma!148 a1!699 a2!699 (_1!12423 lt!416235) (_2!12423 lt!416235)))))

(assert (=> b!279145 (arrayRangesEq!1241 a2!699 a1!699 (_1!12423 lt!416235) (_2!12423 lt!416235))))

(declare-fun b!279146 () Bool)

(declare-fun res!231808 () Bool)

(assert (=> b!279146 (=> (not res!231808) (not e!198952))))

(assert (=> b!279146 (= res!231808 (bvslt from!822 to!789))))

(declare-fun b!279147 () Bool)

(declare-fun res!231809 () Bool)

(assert (=> b!279147 (=> (not res!231809) (not e!198952))))

(declare-fun arrayBitRangesEq!0 (array!16111 array!16111 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279147 (= res!231809 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279148 () Bool)

(declare-fun Unit!19560 () Unit!19557)

(assert (=> b!279148 (= e!198953 Unit!19560)))

(assert (= (and start!62232 res!231807) b!279147))

(assert (= (and b!279147 res!231809) b!279146))

(assert (= (and b!279146 res!231808) b!279144))

(assert (= (and b!279144 c!12840) b!279145))

(assert (= (and b!279144 (not c!12840)) b!279148))

(declare-fun m!412207 () Bool)

(assert (=> b!279144 m!412207))

(declare-fun m!412209 () Bool)

(assert (=> start!62232 m!412209))

(declare-fun m!412211 () Bool)

(assert (=> start!62232 m!412211))

(declare-fun m!412213 () Bool)

(assert (=> b!279145 m!412213))

(declare-fun m!412215 () Bool)

(assert (=> b!279145 m!412215))

(declare-fun m!412217 () Bool)

(assert (=> b!279145 m!412217))

(declare-fun m!412219 () Bool)

(assert (=> b!279147 m!412219))

(push 1)

(assert (not b!279147))

(assert (not start!62232))

(assert (not b!279145))

(assert (not b!279144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!279205 () Bool)

(declare-fun e!199007 () Bool)

(declare-fun call!4547 () Bool)

(assert (=> b!279205 (= e!199007 call!4547)))

(declare-fun b!279206 () Bool)

(declare-fun e!199005 () Bool)

(assert (=> b!279206 (= e!199005 e!199007)))

(declare-fun c!12849 () Bool)

(declare-fun lt!416264 () tuple4!696)

(assert (=> b!279206 (= c!12849 (= (_3!1128 lt!416264) (_4!348 lt!416264)))))

(declare-fun d!96000 () Bool)

(declare-fun res!231851 () Bool)

(declare-fun e!199004 () Bool)

(assert (=> d!96000 (=> res!231851 e!199004)))

(assert (=> d!96000 (= res!231851 (bvsge from!822 to!789))))

(assert (=> d!96000 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199004)))

(declare-fun lt!416263 () (_ BitVec 32))

(declare-fun b!279207 () Bool)

(declare-fun e!199008 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279207 (= e!199008 (byteRangesEq!0 (select (arr!7969 a1!699) (_4!348 lt!416264)) (select (arr!7969 a2!699) (_4!348 lt!416264)) #b00000000000000000000000000000000 lt!416263))))

(declare-fun b!279208 () Bool)

(declare-fun e!199003 () Bool)

(assert (=> b!279208 (= e!199003 (arrayRangesEq!1241 a1!699 a2!699 (_1!12423 lt!416264) (_2!12423 lt!416264)))))

(declare-fun b!279209 () Bool)

(declare-fun e!199006 () Bool)

(assert (=> b!279209 (= e!199007 e!199006)))

(declare-fun res!231853 () Bool)

(assert (=> b!279209 (= res!231853 call!4547)))

(assert (=> b!279209 (=> (not res!231853) (not e!199006))))

(declare-fun b!279210 () Bool)

(declare-fun res!231854 () Bool)

(assert (=> b!279210 (= res!231854 (= lt!416263 #b00000000000000000000000000000000))))

(assert (=> b!279210 (=> res!231854 e!199008)))

(assert (=> b!279210 (= e!199006 e!199008)))

(declare-fun b!279211 () Bool)

(assert (=> b!279211 (= e!199004 e!199005)))

(declare-fun res!231852 () Bool)

(assert (=> b!279211 (=> (not res!231852) (not e!199005))))

(assert (=> b!279211 (= res!231852 e!199003)))

(declare-fun res!231850 () Bool)

(assert (=> b!279211 (=> res!231850 e!199003)))

(assert (=> b!279211 (= res!231850 (bvsge (_1!12423 lt!416264) (_2!12423 lt!416264)))))

(assert (=> b!279211 (= lt!416263 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416265 () (_ BitVec 32))

(assert (=> b!279211 (= lt!416265 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279211 (= lt!416264 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4544 () Bool)

(assert (=> bm!4544 (= call!4547 (byteRangesEq!0 (select (arr!7969 a1!699) (_3!1128 lt!416264)) (select (arr!7969 a2!699) (_3!1128 lt!416264)) lt!416265 (ite c!12849 lt!416263 #b00000000000000000000000000001000)))))

(assert (= (and d!96000 (not res!231851)) b!279211))

(assert (= (and b!279211 (not res!231850)) b!279208))

(assert (= (and b!279211 res!231852) b!279206))

(assert (= (and b!279206 c!12849) b!279205))

(assert (= (and b!279206 (not c!12849)) b!279209))

(assert (= (and b!279209 res!231853) b!279210))

(assert (= (and b!279210 (not res!231854)) b!279207))

(assert (= (or b!279205 b!279209) bm!4544))

(declare-fun m!412259 () Bool)

(assert (=> b!279207 m!412259))

(declare-fun m!412261 () Bool)

(assert (=> b!279207 m!412261))

(assert (=> b!279207 m!412259))

(assert (=> b!279207 m!412261))

(declare-fun m!412263 () Bool)

(assert (=> b!279207 m!412263))

(declare-fun m!412265 () Bool)

(assert (=> b!279208 m!412265))

(assert (=> b!279211 m!412207))

(declare-fun m!412267 () Bool)

(assert (=> bm!4544 m!412267))

(declare-fun m!412269 () Bool)

(assert (=> bm!4544 m!412269))

(assert (=> bm!4544 m!412267))

(assert (=> bm!4544 m!412269))

(declare-fun m!412271 () Bool)

(assert (=> bm!4544 m!412271))

(assert (=> b!279147 d!96000))

(declare-fun d!96016 () Bool)

(assert (=> d!96016 (= (array_inv!6697 a1!699) (bvsge (size!6973 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62232 d!96016))

(declare-fun d!96018 () Bool)

(assert (=> d!96018 (= (array_inv!6697 a2!699) (bvsge (size!6973 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62232 d!96018))

(declare-fun d!96020 () Bool)

(declare-fun res!231861 () Bool)

(declare-fun e!199015 () Bool)

(assert (=> d!96020 (=> res!231861 e!199015)))

(assert (=> d!96020 (= res!231861 (= (_1!12423 lt!416235) (_2!12423 lt!416235)))))

(assert (=> d!96020 (= (arrayRangesEq!1241 a1!699 a2!699 (_1!12423 lt!416235) (_2!12423 lt!416235)) e!199015)))

(declare-fun b!279218 () Bool)

(declare-fun e!199016 () Bool)

(assert (=> b!279218 (= e!199015 e!199016)))

(declare-fun res!231862 () Bool)

(assert (=> b!279218 (=> (not res!231862) (not e!199016))))

(assert (=> b!279218 (= res!231862 (= (select (arr!7969 a1!699) (_1!12423 lt!416235)) (select (arr!7969 a2!699) (_1!12423 lt!416235))))))

(declare-fun b!279219 () Bool)

(assert (=> b!279219 (= e!199016 (arrayRangesEq!1241 a1!699 a2!699 (bvadd (_1!12423 lt!416235) #b00000000000000000000000000000001) (_2!12423 lt!416235)))))

(assert (= (and d!96020 (not res!231861)) b!279218))

(assert (= (and b!279218 res!231862) b!279219))

(declare-fun m!412279 () Bool)

(assert (=> b!279218 m!412279))

(declare-fun m!412281 () Bool)

(assert (=> b!279218 m!412281))

(declare-fun m!412283 () Bool)

(assert (=> b!279219 m!412283))

(assert (=> b!279145 d!96020))

(declare-fun d!96024 () Bool)

(assert (=> d!96024 (arrayRangesEq!1241 a2!699 a1!699 (_1!12423 lt!416235) (_2!12423 lt!416235))))

(declare-fun lt!416268 () Unit!19557)

(declare-fun choose!459 (array!16111 array!16111 (_ BitVec 32) (_ BitVec 32)) Unit!19557)

(assert (=> d!96024 (= lt!416268 (choose!459 a1!699 a2!699 (_1!12423 lt!416235) (_2!12423 lt!416235)))))

(assert (=> d!96024 (and (bvsle #b00000000000000000000000000000000 (_1!12423 lt!416235)) (bvsle (_1!12423 lt!416235) (_2!12423 lt!416235)) (bvsle (_2!12423 lt!416235) (size!6973 a1!699)))))

(assert (=> d!96024 (= (arrayRangesEqSymmetricLemma!148 a1!699 a2!699 (_1!12423 lt!416235) (_2!12423 lt!416235)) lt!416268)))

(declare-fun bs!24240 () Bool)

(assert (= bs!24240 d!96024))

(assert (=> bs!24240 m!412217))

(declare-fun m!412285 () Bool)

(assert (=> bs!24240 m!412285))

(assert (=> b!279145 d!96024))

(declare-fun d!96026 () Bool)

(declare-fun res!231863 () Bool)

(declare-fun e!199017 () Bool)

(assert (=> d!96026 (=> res!231863 e!199017)))

(assert (=> d!96026 (= res!231863 (= (_1!12423 lt!416235) (_2!12423 lt!416235)))))

(assert (=> d!96026 (= (arrayRangesEq!1241 a2!699 a1!699 (_1!12423 lt!416235) (_2!12423 lt!416235)) e!199017)))

(declare-fun b!279220 () Bool)

(declare-fun e!199018 () Bool)

(assert (=> b!279220 (= e!199017 e!199018)))

(declare-fun res!231864 () Bool)

(assert (=> b!279220 (=> (not res!231864) (not e!199018))))

(assert (=> b!279220 (= res!231864 (= (select (arr!7969 a2!699) (_1!12423 lt!416235)) (select (arr!7969 a1!699) (_1!12423 lt!416235))))))

(declare-fun b!279221 () Bool)

(assert (=> b!279221 (= e!199018 (arrayRangesEq!1241 a2!699 a1!699 (bvadd (_1!12423 lt!416235) #b00000000000000000000000000000001) (_2!12423 lt!416235)))))

(assert (= (and d!96026 (not res!231863)) b!279220))

(assert (= (and b!279220 res!231864) b!279221))

(assert (=> b!279220 m!412281))

(assert (=> b!279220 m!412279))

(declare-fun m!412287 () Bool)

(assert (=> b!279221 m!412287))

(assert (=> b!279145 d!96026))

(declare-fun d!96028 () Bool)

(assert (=> d!96028 (= (arrayBitIndices!0 from!822 to!789) (tuple4!697 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279144 d!96028))

(push 1)

(assert (not b!279219))

(assert (not d!96024))

(assert (not b!279207))

(assert (not b!279208))

(assert (not b!279221))

(assert (not b!279211))

(assert (not bm!4544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


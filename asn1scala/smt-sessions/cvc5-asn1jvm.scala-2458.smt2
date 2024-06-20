; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62304 () Bool)

(assert start!62304)

(declare-fun b!279410 () Bool)

(declare-fun e!199184 () Bool)

(declare-fun e!199185 () Bool)

(assert (=> b!279410 (= e!199184 e!199185)))

(declare-fun res!232003 () Bool)

(assert (=> b!279410 (=> (not res!232003) (not e!199185))))

(declare-datatypes ((tuple4!708 0))(
  ( (tuple4!709 (_1!12429 (_ BitVec 32)) (_2!12429 (_ BitVec 32)) (_3!1134 (_ BitVec 32)) (_4!354 (_ BitVec 32))) )
))
(declare-fun lt!416360 () tuple4!708)

(assert (=> b!279410 (= res!232003 (= (_3!1134 lt!416360) (_4!354 lt!416360)))))

(declare-datatypes ((Unit!19581 0))(
  ( (Unit!19582) )
))
(declare-fun lt!416359 () Unit!19581)

(declare-fun e!199183 () Unit!19581)

(assert (=> b!279410 (= lt!416359 e!199183)))

(declare-fun c!12876 () Bool)

(assert (=> b!279410 (= c!12876 (bvslt (_1!12429 lt!416360) (_2!12429 lt!416360)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!708)

(assert (=> b!279410 (= lt!416360 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279411 () Bool)

(declare-fun Unit!19583 () Unit!19581)

(assert (=> b!279411 (= e!199183 Unit!19583)))

(declare-datatypes ((array!16129 0))(
  ( (array!16130 (arr!7975 (Array (_ BitVec 32) (_ BitVec 8))) (size!6979 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16129)

(declare-fun a2!699 () array!16129)

(declare-fun arrayRangesEq!1247 (array!16129 array!16129 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279411 (arrayRangesEq!1247 a1!699 a2!699 (_1!12429 lt!416360) (_2!12429 lt!416360))))

(declare-fun lt!416361 () Unit!19581)

(declare-fun arrayRangesEqSymmetricLemma!154 (array!16129 array!16129 (_ BitVec 32) (_ BitVec 32)) Unit!19581)

(assert (=> b!279411 (= lt!416361 (arrayRangesEqSymmetricLemma!154 a1!699 a2!699 (_1!12429 lt!416360) (_2!12429 lt!416360)))))

(assert (=> b!279411 (arrayRangesEq!1247 a2!699 a1!699 (_1!12429 lt!416360) (_2!12429 lt!416360))))

(declare-fun b!279412 () Bool)

(declare-fun res!232001 () Bool)

(assert (=> b!279412 (=> (not res!232001) (not e!199184))))

(assert (=> b!279412 (= res!232001 (bvslt from!822 to!789))))

(declare-fun res!232004 () Bool)

(assert (=> start!62304 (=> (not res!232004) (not e!199184))))

(assert (=> start!62304 (= res!232004 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6979 a1!699) (size!6979 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6979 a1!699))))))))

(assert (=> start!62304 e!199184))

(assert (=> start!62304 true))

(declare-fun array_inv!6703 (array!16129) Bool)

(assert (=> start!62304 (array_inv!6703 a1!699)))

(assert (=> start!62304 (array_inv!6703 a2!699)))

(declare-fun b!279413 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279413 (= e!199185 (not (byteRangesEq!0 (select (arr!7975 a1!699) (_3!1134 lt!416360)) (select (arr!7975 a2!699) (_3!1134 lt!416360)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun b!279414 () Bool)

(declare-fun Unit!19584 () Unit!19581)

(assert (=> b!279414 (= e!199183 Unit!19584)))

(declare-fun b!279415 () Bool)

(declare-fun res!232002 () Bool)

(assert (=> b!279415 (=> (not res!232002) (not e!199184))))

(declare-fun arrayBitRangesEq!0 (array!16129 array!16129 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279415 (= res!232002 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62304 res!232004) b!279415))

(assert (= (and b!279415 res!232002) b!279412))

(assert (= (and b!279412 res!232001) b!279410))

(assert (= (and b!279410 c!12876) b!279411))

(assert (= (and b!279410 (not c!12876)) b!279414))

(assert (= (and b!279410 res!232003) b!279413))

(declare-fun m!412435 () Bool)

(assert (=> b!279411 m!412435))

(declare-fun m!412437 () Bool)

(assert (=> b!279411 m!412437))

(declare-fun m!412439 () Bool)

(assert (=> b!279411 m!412439))

(declare-fun m!412441 () Bool)

(assert (=> b!279415 m!412441))

(declare-fun m!412443 () Bool)

(assert (=> b!279410 m!412443))

(declare-fun m!412445 () Bool)

(assert (=> b!279413 m!412445))

(declare-fun m!412447 () Bool)

(assert (=> b!279413 m!412447))

(assert (=> b!279413 m!412445))

(assert (=> b!279413 m!412447))

(declare-fun m!412449 () Bool)

(assert (=> b!279413 m!412449))

(declare-fun m!412451 () Bool)

(assert (=> start!62304 m!412451))

(declare-fun m!412453 () Bool)

(assert (=> start!62304 m!412453))

(push 1)

(assert (not b!279411))

(assert (not b!279413))

(assert (not start!62304))

(assert (not b!279410))

(assert (not b!279415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!279466 () Bool)

(declare-fun e!199231 () Bool)

(declare-fun e!199230 () Bool)

(assert (=> b!279466 (= e!199231 e!199230)))

(declare-fun res!232039 () Bool)

(assert (=> b!279466 (=> (not res!232039) (not e!199230))))

(declare-fun e!199232 () Bool)

(assert (=> b!279466 (= res!232039 e!199232)))

(declare-fun res!232041 () Bool)

(assert (=> b!279466 (=> res!232041 e!199232)))

(declare-fun lt!416388 () tuple4!708)

(assert (=> b!279466 (= res!232041 (bvsge (_1!12429 lt!416388) (_2!12429 lt!416388)))))

(declare-fun lt!416386 () (_ BitVec 32))

(assert (=> b!279466 (= lt!416386 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416387 () (_ BitVec 32))

(assert (=> b!279466 (= lt!416387 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279466 (= lt!416388 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279467 () Bool)

(declare-fun e!199229 () Bool)

(assert (=> b!279467 (= e!199230 e!199229)))

(declare-fun c!12885 () Bool)

(assert (=> b!279467 (= c!12885 (= (_3!1134 lt!416388) (_4!354 lt!416388)))))

(declare-fun d!96090 () Bool)

(declare-fun res!232042 () Bool)

(assert (=> d!96090 (=> res!232042 e!199231)))

(assert (=> d!96090 (= res!232042 (bvsge from!822 to!789))))

(assert (=> d!96090 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199231)))

(declare-fun b!279468 () Bool)

(assert (=> b!279468 (= e!199232 (arrayRangesEq!1247 a1!699 a2!699 (_1!12429 lt!416388) (_2!12429 lt!416388)))))

(declare-fun b!279469 () Bool)

(declare-fun call!4565 () Bool)

(assert (=> b!279469 (= e!199229 call!4565)))

(declare-fun bm!4562 () Bool)

(assert (=> bm!4562 (= call!4565 (byteRangesEq!0 (ite c!12885 (select (arr!7975 a1!699) (_3!1134 lt!416388)) (select (arr!7975 a1!699) (_4!354 lt!416388))) (ite c!12885 (select (arr!7975 a2!699) (_3!1134 lt!416388)) (select (arr!7975 a2!699) (_4!354 lt!416388))) (ite c!12885 lt!416387 #b00000000000000000000000000000000) lt!416386))))

(declare-fun b!279470 () Bool)

(declare-fun e!199233 () Bool)

(assert (=> b!279470 (= e!199229 e!199233)))

(declare-fun res!232043 () Bool)

(assert (=> b!279470 (= res!232043 (byteRangesEq!0 (select (arr!7975 a1!699) (_3!1134 lt!416388)) (select (arr!7975 a2!699) (_3!1134 lt!416388)) lt!416387 #b00000000000000000000000000001000))))

(assert (=> b!279470 (=> (not res!232043) (not e!199233))))

(declare-fun b!279471 () Bool)

(declare-fun res!232040 () Bool)

(assert (=> b!279471 (= res!232040 (= lt!416386 #b00000000000000000000000000000000))))

(declare-fun e!199228 () Bool)

(assert (=> b!279471 (=> res!232040 e!199228)))

(assert (=> b!279471 (= e!199233 e!199228)))

(declare-fun b!279472 () Bool)

(assert (=> b!279472 (= e!199228 call!4565)))

(assert (= (and d!96090 (not res!232042)) b!279466))

(assert (= (and b!279466 (not res!232041)) b!279468))

(assert (= (and b!279466 res!232039) b!279467))

(assert (= (and b!279467 c!12885) b!279469))

(assert (= (and b!279467 (not c!12885)) b!279470))

(assert (= (and b!279470 res!232043) b!279471))

(assert (= (and b!279471 (not res!232040)) b!279472))

(assert (= (or b!279469 b!279472) bm!4562))

(assert (=> b!279466 m!412443))

(declare-fun m!412499 () Bool)

(assert (=> b!279468 m!412499))

(declare-fun m!412501 () Bool)

(assert (=> bm!4562 m!412501))

(declare-fun m!412503 () Bool)

(assert (=> bm!4562 m!412503))

(declare-fun m!412505 () Bool)

(assert (=> bm!4562 m!412505))

(declare-fun m!412507 () Bool)

(assert (=> bm!4562 m!412507))

(declare-fun m!412509 () Bool)

(assert (=> bm!4562 m!412509))

(assert (=> b!279470 m!412503))

(assert (=> b!279470 m!412505))

(assert (=> b!279470 m!412503))

(assert (=> b!279470 m!412505))

(declare-fun m!412511 () Bool)

(assert (=> b!279470 m!412511))

(assert (=> b!279415 d!96090))

(declare-fun d!96096 () Bool)

(assert (=> d!96096 (= (arrayBitIndices!0 from!822 to!789) (tuple4!709 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279410 d!96096))

(declare-fun d!96100 () Bool)

(declare-fun res!232056 () Bool)

(declare-fun e!199246 () Bool)

(assert (=> d!96100 (=> res!232056 e!199246)))

(assert (=> d!96100 (= res!232056 (= (_1!12429 lt!416360) (_2!12429 lt!416360)))))

(assert (=> d!96100 (= (arrayRangesEq!1247 a1!699 a2!699 (_1!12429 lt!416360) (_2!12429 lt!416360)) e!199246)))

(declare-fun b!279485 () Bool)

(declare-fun e!199247 () Bool)

(assert (=> b!279485 (= e!199246 e!199247)))

(declare-fun res!232057 () Bool)

(assert (=> b!279485 (=> (not res!232057) (not e!199247))))

(assert (=> b!279485 (= res!232057 (= (select (arr!7975 a1!699) (_1!12429 lt!416360)) (select (arr!7975 a2!699) (_1!12429 lt!416360))))))

(declare-fun b!279486 () Bool)

(assert (=> b!279486 (= e!199247 (arrayRangesEq!1247 a1!699 a2!699 (bvadd (_1!12429 lt!416360) #b00000000000000000000000000000001) (_2!12429 lt!416360)))))

(assert (= (and d!96100 (not res!232056)) b!279485))

(assert (= (and b!279485 res!232057) b!279486))

(declare-fun m!412523 () Bool)

(assert (=> b!279485 m!412523))

(declare-fun m!412525 () Bool)

(assert (=> b!279485 m!412525))

(declare-fun m!412527 () Bool)

(assert (=> b!279486 m!412527))

(assert (=> b!279411 d!96100))

(declare-fun d!96106 () Bool)

(assert (=> d!96106 (arrayRangesEq!1247 a2!699 a1!699 (_1!12429 lt!416360) (_2!12429 lt!416360))))

(declare-fun lt!416394 () Unit!19581)

(declare-fun choose!464 (array!16129 array!16129 (_ BitVec 32) (_ BitVec 32)) Unit!19581)

(assert (=> d!96106 (= lt!416394 (choose!464 a1!699 a2!699 (_1!12429 lt!416360) (_2!12429 lt!416360)))))

(assert (=> d!96106 (and (bvsle #b00000000000000000000000000000000 (_1!12429 lt!416360)) (bvsle (_1!12429 lt!416360) (_2!12429 lt!416360)) (bvsle (_2!12429 lt!416360) (size!6979 a1!699)))))

(assert (=> d!96106 (= (arrayRangesEqSymmetricLemma!154 a1!699 a2!699 (_1!12429 lt!416360) (_2!12429 lt!416360)) lt!416394)))

(declare-fun bs!24253 () Bool)

(assert (= bs!24253 d!96106))

(assert (=> bs!24253 m!412439))

(declare-fun m!412529 () Bool)

(assert (=> bs!24253 m!412529))

(assert (=> b!279411 d!96106))

(declare-fun d!96110 () Bool)

(declare-fun res!232058 () Bool)

(declare-fun e!199248 () Bool)

(assert (=> d!96110 (=> res!232058 e!199248)))

(assert (=> d!96110 (= res!232058 (= (_1!12429 lt!416360) (_2!12429 lt!416360)))))

(assert (=> d!96110 (= (arrayRangesEq!1247 a2!699 a1!699 (_1!12429 lt!416360) (_2!12429 lt!416360)) e!199248)))

(declare-fun b!279487 () Bool)

(declare-fun e!199249 () Bool)

(assert (=> b!279487 (= e!199248 e!199249)))

(declare-fun res!232059 () Bool)

(assert (=> b!279487 (=> (not res!232059) (not e!199249))))

(assert (=> b!279487 (= res!232059 (= (select (arr!7975 a2!699) (_1!12429 lt!416360)) (select (arr!7975 a1!699) (_1!12429 lt!416360))))))

(declare-fun b!279488 () Bool)

(assert (=> b!279488 (= e!199249 (arrayRangesEq!1247 a2!699 a1!699 (bvadd (_1!12429 lt!416360) #b00000000000000000000000000000001) (_2!12429 lt!416360)))))

(assert (= (and d!96110 (not res!232058)) b!279487))

(assert (= (and b!279487 res!232059) b!279488))

(assert (=> b!279487 m!412525))

(assert (=> b!279487 m!412523))

(declare-fun m!412531 () Bool)

(assert (=> b!279488 m!412531))

(assert (=> b!279411 d!96110))

(declare-fun d!96112 () Bool)

(assert (=> d!96112 (= (array_inv!6703 a1!699) (bvsge (size!6979 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62304 d!96112))

(declare-fun d!96114 () Bool)

(assert (=> d!96114 (= (array_inv!6703 a2!699) (bvsge (size!6979 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62304 d!96114))

(declare-fun d!96116 () Bool)

(assert (=> d!96116 (= (byteRangesEq!0 (select (arr!7975 a1!699) (_3!1134 lt!416360)) (select (arr!7975 a2!699) (_3!1134 lt!416360)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7975 a1!699) (_3!1134 lt!416360))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7975 a2!699) (_3!1134 lt!416360))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24255 () Bool)

(assert (= bs!24255 d!96116))

(declare-fun m!412537 () Bool)

(assert (=> bs!24255 m!412537))

(declare-fun m!412539 () Bool)

(assert (=> bs!24255 m!412539))

(assert (=> b!279413 d!96116))

(push 1)

(assert (not b!279488))

(assert (not bm!4562))

(assert (not b!279468))

(assert (not d!96106))

(assert (not b!279486))

(assert (not b!279466))

(assert (not b!279470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


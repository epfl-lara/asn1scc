; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62588 () Bool)

(assert start!62588)

(declare-fun b!280427 () Bool)

(declare-fun res!232754 () Bool)

(declare-fun e!200068 () Bool)

(assert (=> b!280427 (=> (not res!232754) (not e!200068))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!280427 (= res!232754 (bvslt from!822 to!789))))

(declare-fun b!280428 () Bool)

(declare-fun e!200066 () Bool)

(assert (=> b!280428 (= e!200068 e!200066)))

(declare-fun res!232756 () Bool)

(assert (=> b!280428 (=> (not res!232756) (not e!200066))))

(declare-datatypes ((tuple4!752 0))(
  ( (tuple4!753 (_1!12451 (_ BitVec 32)) (_2!12451 (_ BitVec 32)) (_3!1156 (_ BitVec 32)) (_4!376 (_ BitVec 32))) )
))
(declare-fun lt!416855 () tuple4!752)

(assert (=> b!280428 (= res!232756 (not (= (_3!1156 lt!416855) (_4!376 lt!416855))))))

(declare-datatypes ((Unit!19669 0))(
  ( (Unit!19670) )
))
(declare-fun lt!416854 () Unit!19669)

(declare-fun e!200067 () Unit!19669)

(assert (=> b!280428 (= lt!416854 e!200067)))

(declare-fun c!13008 () Bool)

(assert (=> b!280428 (= c!13008 (bvslt (_1!12451 lt!416855) (_2!12451 lt!416855)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!752)

(assert (=> b!280428 (= lt!416855 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280429 () Bool)

(declare-fun Unit!19671 () Unit!19669)

(assert (=> b!280429 (= e!200067 Unit!19671)))

(declare-fun res!232757 () Bool)

(assert (=> start!62588 (=> (not res!232757) (not e!200068))))

(declare-datatypes ((array!16194 0))(
  ( (array!16195 (arr!7997 (Array (_ BitVec 32) (_ BitVec 8))) (size!7001 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16194)

(declare-fun a2!699 () array!16194)

(assert (=> start!62588 (= res!232757 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7001 a1!699) (size!7001 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7001 a1!699))))))))

(assert (=> start!62588 e!200068))

(assert (=> start!62588 true))

(declare-fun array_inv!6725 (array!16194) Bool)

(assert (=> start!62588 (array_inv!6725 a1!699)))

(assert (=> start!62588 (array_inv!6725 a2!699)))

(declare-fun b!280430 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280430 (= e!200066 (not (byteRangesEq!0 (select (arr!7997 a1!699) (_3!1156 lt!416855)) (select (arr!7997 a2!699) (_3!1156 lt!416855)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000)))))

(declare-fun b!280431 () Bool)

(declare-fun Unit!19672 () Unit!19669)

(assert (=> b!280431 (= e!200067 Unit!19672)))

(declare-fun arrayRangesEq!1269 (array!16194 array!16194 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280431 (arrayRangesEq!1269 a1!699 a2!699 (_1!12451 lt!416855) (_2!12451 lt!416855))))

(declare-fun lt!416856 () Unit!19669)

(declare-fun arrayRangesEqSymmetricLemma!176 (array!16194 array!16194 (_ BitVec 32) (_ BitVec 32)) Unit!19669)

(assert (=> b!280431 (= lt!416856 (arrayRangesEqSymmetricLemma!176 a1!699 a2!699 (_1!12451 lt!416855) (_2!12451 lt!416855)))))

(assert (=> b!280431 (arrayRangesEq!1269 a2!699 a1!699 (_1!12451 lt!416855) (_2!12451 lt!416855))))

(declare-fun b!280432 () Bool)

(declare-fun res!232755 () Bool)

(assert (=> b!280432 (=> (not res!232755) (not e!200068))))

(declare-fun arrayBitRangesEq!0 (array!16194 array!16194 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280432 (= res!232755 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62588 res!232757) b!280432))

(assert (= (and b!280432 res!232755) b!280427))

(assert (= (and b!280427 res!232754) b!280428))

(assert (= (and b!280428 c!13008) b!280431))

(assert (= (and b!280428 (not c!13008)) b!280429))

(assert (= (and b!280428 res!232756) b!280430))

(declare-fun m!413435 () Bool)

(assert (=> b!280428 m!413435))

(declare-fun m!413437 () Bool)

(assert (=> b!280430 m!413437))

(declare-fun m!413439 () Bool)

(assert (=> b!280430 m!413439))

(assert (=> b!280430 m!413437))

(assert (=> b!280430 m!413439))

(declare-fun m!413441 () Bool)

(assert (=> b!280430 m!413441))

(declare-fun m!413443 () Bool)

(assert (=> b!280432 m!413443))

(declare-fun m!413445 () Bool)

(assert (=> b!280431 m!413445))

(declare-fun m!413447 () Bool)

(assert (=> b!280431 m!413447))

(declare-fun m!413449 () Bool)

(assert (=> b!280431 m!413449))

(declare-fun m!413451 () Bool)

(assert (=> start!62588 m!413451))

(declare-fun m!413453 () Bool)

(assert (=> start!62588 m!413453))

(check-sat (not b!280432) (not b!280430) (not b!280431) (not start!62588) (not b!280428))
(check-sat)
(get-model)

(declare-fun b!280465 () Bool)

(declare-fun e!200103 () Bool)

(declare-fun e!200099 () Bool)

(assert (=> b!280465 (= e!200103 e!200099)))

(declare-fun res!232782 () Bool)

(declare-fun lt!416872 () (_ BitVec 32))

(declare-fun lt!416873 () tuple4!752)

(assert (=> b!280465 (= res!232782 (byteRangesEq!0 (select (arr!7997 a1!699) (_3!1156 lt!416873)) (select (arr!7997 a2!699) (_3!1156 lt!416873)) lt!416872 #b00000000000000000000000000001000))))

(assert (=> b!280465 (=> (not res!232782) (not e!200099))))

(declare-fun d!96444 () Bool)

(declare-fun res!232781 () Bool)

(declare-fun e!200102 () Bool)

(assert (=> d!96444 (=> res!232781 e!200102)))

(assert (=> d!96444 (= res!232781 (bvsge from!822 to!789))))

(assert (=> d!96444 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200102)))

(declare-fun b!280466 () Bool)

(declare-fun call!4631 () Bool)

(assert (=> b!280466 (= e!200103 call!4631)))

(declare-fun b!280467 () Bool)

(declare-fun e!200100 () Bool)

(assert (=> b!280467 (= e!200100 e!200103)))

(declare-fun c!13014 () Bool)

(assert (=> b!280467 (= c!13014 (= (_3!1156 lt!416873) (_4!376 lt!416873)))))

(declare-fun b!280468 () Bool)

(declare-fun e!200098 () Bool)

(assert (=> b!280468 (= e!200098 (arrayRangesEq!1269 a1!699 a2!699 (_1!12451 lt!416873) (_2!12451 lt!416873)))))

(declare-fun b!280469 () Bool)

(declare-fun e!200101 () Bool)

(assert (=> b!280469 (= e!200101 call!4631)))

(declare-fun b!280470 () Bool)

(declare-fun res!232780 () Bool)

(declare-fun lt!416874 () (_ BitVec 32))

(assert (=> b!280470 (= res!232780 (= lt!416874 #b00000000000000000000000000000000))))

(assert (=> b!280470 (=> res!232780 e!200101)))

(assert (=> b!280470 (= e!200099 e!200101)))

(declare-fun bm!4628 () Bool)

(assert (=> bm!4628 (= call!4631 (byteRangesEq!0 (ite c!13014 (select (arr!7997 a1!699) (_3!1156 lt!416873)) (select (arr!7997 a1!699) (_4!376 lt!416873))) (ite c!13014 (select (arr!7997 a2!699) (_3!1156 lt!416873)) (select (arr!7997 a2!699) (_4!376 lt!416873))) (ite c!13014 lt!416872 #b00000000000000000000000000000000) lt!416874))))

(declare-fun b!280471 () Bool)

(assert (=> b!280471 (= e!200102 e!200100)))

(declare-fun res!232783 () Bool)

(assert (=> b!280471 (=> (not res!232783) (not e!200100))))

(assert (=> b!280471 (= res!232783 e!200098)))

(declare-fun res!232784 () Bool)

(assert (=> b!280471 (=> res!232784 e!200098)))

(assert (=> b!280471 (= res!232784 (bvsge (_1!12451 lt!416873) (_2!12451 lt!416873)))))

(assert (=> b!280471 (= lt!416874 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280471 (= lt!416872 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280471 (= lt!416873 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!96444 (not res!232781)) b!280471))

(assert (= (and b!280471 (not res!232784)) b!280468))

(assert (= (and b!280471 res!232783) b!280467))

(assert (= (and b!280467 c!13014) b!280466))

(assert (= (and b!280467 (not c!13014)) b!280465))

(assert (= (and b!280465 res!232782) b!280470))

(assert (= (and b!280470 (not res!232780)) b!280469))

(assert (= (or b!280466 b!280469) bm!4628))

(declare-fun m!413475 () Bool)

(assert (=> b!280465 m!413475))

(declare-fun m!413477 () Bool)

(assert (=> b!280465 m!413477))

(assert (=> b!280465 m!413475))

(assert (=> b!280465 m!413477))

(declare-fun m!413479 () Bool)

(assert (=> b!280465 m!413479))

(declare-fun m!413481 () Bool)

(assert (=> b!280468 m!413481))

(declare-fun m!413483 () Bool)

(assert (=> bm!4628 m!413483))

(declare-fun m!413485 () Bool)

(assert (=> bm!4628 m!413485))

(assert (=> bm!4628 m!413475))

(declare-fun m!413487 () Bool)

(assert (=> bm!4628 m!413487))

(assert (=> bm!4628 m!413477))

(assert (=> b!280471 m!413435))

(assert (=> b!280432 d!96444))

(declare-fun d!96448 () Bool)

(assert (=> d!96448 (= (array_inv!6725 a1!699) (bvsge (size!7001 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62588 d!96448))

(declare-fun d!96450 () Bool)

(assert (=> d!96450 (= (array_inv!6725 a2!699) (bvsge (size!7001 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62588 d!96450))

(declare-fun d!96452 () Bool)

(assert (=> d!96452 (= (arrayBitIndices!0 from!822 to!789) (tuple4!753 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280428 d!96452))

(declare-fun d!96456 () Bool)

(assert (=> d!96456 (= (byteRangesEq!0 (select (arr!7997 a1!699) (_3!1156 lt!416855)) (select (arr!7997 a2!699) (_3!1156 lt!416855)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7997 a1!699) (_3!1156 lt!416855))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7997 a2!699) (_3!1156 lt!416855))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24315 () Bool)

(assert (= bs!24315 d!96456))

(declare-fun m!413499 () Bool)

(assert (=> bs!24315 m!413499))

(declare-fun m!413501 () Bool)

(assert (=> bs!24315 m!413501))

(assert (=> b!280430 d!96456))

(declare-fun d!96466 () Bool)

(declare-fun res!232797 () Bool)

(declare-fun e!200116 () Bool)

(assert (=> d!96466 (=> res!232797 e!200116)))

(assert (=> d!96466 (= res!232797 (= (_1!12451 lt!416855) (_2!12451 lt!416855)))))

(assert (=> d!96466 (= (arrayRangesEq!1269 a1!699 a2!699 (_1!12451 lt!416855) (_2!12451 lt!416855)) e!200116)))

(declare-fun b!280484 () Bool)

(declare-fun e!200117 () Bool)

(assert (=> b!280484 (= e!200116 e!200117)))

(declare-fun res!232798 () Bool)

(assert (=> b!280484 (=> (not res!232798) (not e!200117))))

(assert (=> b!280484 (= res!232798 (= (select (arr!7997 a1!699) (_1!12451 lt!416855)) (select (arr!7997 a2!699) (_1!12451 lt!416855))))))

(declare-fun b!280485 () Bool)

(assert (=> b!280485 (= e!200117 (arrayRangesEq!1269 a1!699 a2!699 (bvadd (_1!12451 lt!416855) #b00000000000000000000000000000001) (_2!12451 lt!416855)))))

(assert (= (and d!96466 (not res!232797)) b!280484))

(assert (= (and b!280484 res!232798) b!280485))

(declare-fun m!413503 () Bool)

(assert (=> b!280484 m!413503))

(declare-fun m!413505 () Bool)

(assert (=> b!280484 m!413505))

(declare-fun m!413507 () Bool)

(assert (=> b!280485 m!413507))

(assert (=> b!280431 d!96466))

(declare-fun d!96470 () Bool)

(assert (=> d!96470 (arrayRangesEq!1269 a2!699 a1!699 (_1!12451 lt!416855) (_2!12451 lt!416855))))

(declare-fun lt!416880 () Unit!19669)

(declare-fun choose!482 (array!16194 array!16194 (_ BitVec 32) (_ BitVec 32)) Unit!19669)

(assert (=> d!96470 (= lt!416880 (choose!482 a1!699 a2!699 (_1!12451 lt!416855) (_2!12451 lt!416855)))))

(assert (=> d!96470 (and (bvsle #b00000000000000000000000000000000 (_1!12451 lt!416855)) (bvsle (_1!12451 lt!416855) (_2!12451 lt!416855)) (bvsle (_2!12451 lt!416855) (size!7001 a1!699)))))

(assert (=> d!96470 (= (arrayRangesEqSymmetricLemma!176 a1!699 a2!699 (_1!12451 lt!416855) (_2!12451 lt!416855)) lt!416880)))

(declare-fun bs!24316 () Bool)

(assert (= bs!24316 d!96470))

(assert (=> bs!24316 m!413449))

(declare-fun m!413515 () Bool)

(assert (=> bs!24316 m!413515))

(assert (=> b!280431 d!96470))

(declare-fun d!96476 () Bool)

(declare-fun res!232805 () Bool)

(declare-fun e!200124 () Bool)

(assert (=> d!96476 (=> res!232805 e!200124)))

(assert (=> d!96476 (= res!232805 (= (_1!12451 lt!416855) (_2!12451 lt!416855)))))

(assert (=> d!96476 (= (arrayRangesEq!1269 a2!699 a1!699 (_1!12451 lt!416855) (_2!12451 lt!416855)) e!200124)))

(declare-fun b!280492 () Bool)

(declare-fun e!200125 () Bool)

(assert (=> b!280492 (= e!200124 e!200125)))

(declare-fun res!232806 () Bool)

(assert (=> b!280492 (=> (not res!232806) (not e!200125))))

(assert (=> b!280492 (= res!232806 (= (select (arr!7997 a2!699) (_1!12451 lt!416855)) (select (arr!7997 a1!699) (_1!12451 lt!416855))))))

(declare-fun b!280493 () Bool)

(assert (=> b!280493 (= e!200125 (arrayRangesEq!1269 a2!699 a1!699 (bvadd (_1!12451 lt!416855) #b00000000000000000000000000000001) (_2!12451 lt!416855)))))

(assert (= (and d!96476 (not res!232805)) b!280492))

(assert (= (and b!280492 res!232806) b!280493))

(assert (=> b!280492 m!413505))

(assert (=> b!280492 m!413503))

(declare-fun m!413517 () Bool)

(assert (=> b!280493 m!413517))

(assert (=> b!280431 d!96476))

(check-sat (not b!280468) (not bm!4628) (not b!280471) (not b!280485) (not b!280493) (not b!280465) (not d!96470))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61908 () Bool)

(assert start!61908)

(declare-fun b!277477 () Bool)

(declare-fun res!230468 () Bool)

(declare-fun e!197431 () Bool)

(assert (=> b!277477 (=> (not res!230468) (not e!197431))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277477 (= res!230468 (bvslt from!822 to!789))))

(declare-fun res!230469 () Bool)

(assert (=> start!61908 (=> (not res!230469) (not e!197431))))

(declare-datatypes ((array!15939 0))(
  ( (array!15940 (arr!7892 (Array (_ BitVec 32) (_ BitVec 8))) (size!6896 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15939)

(declare-fun a2!699 () array!15939)

(assert (=> start!61908 (= res!230469 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6896 a1!699) (size!6896 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6896 a1!699))))))))

(assert (=> start!61908 e!197431))

(assert (=> start!61908 true))

(declare-fun array_inv!6620 (array!15939) Bool)

(assert (=> start!61908 (array_inv!6620 a1!699)))

(assert (=> start!61908 (array_inv!6620 a2!699)))

(declare-fun b!277479 () Bool)

(declare-fun e!197430 () Bool)

(declare-datatypes ((tuple4!578 0))(
  ( (tuple4!579 (_1!12364 (_ BitVec 32)) (_2!12364 (_ BitVec 32)) (_3!1069 (_ BitVec 32)) (_4!289 (_ BitVec 32))) )
))
(declare-fun lt!415431 () tuple4!578)

(assert (=> b!277479 (= e!197430 (not (and (bvsle #b00000000000000000000000000000000 (_1!12364 lt!415431)) (bvsle (_1!12364 lt!415431) (_2!12364 lt!415431)))))))

(declare-fun arrayRangesEq!1182 (array!15939 array!15939 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277479 (arrayRangesEq!1182 a2!699 a1!699 (_1!12364 lt!415431) (_2!12364 lt!415431))))

(declare-datatypes ((Unit!19391 0))(
  ( (Unit!19392) )
))
(declare-fun lt!415430 () Unit!19391)

(declare-fun arrayRangesEqSymmetricLemma!101 (array!15939 array!15939 (_ BitVec 32) (_ BitVec 32)) Unit!19391)

(assert (=> b!277479 (= lt!415430 (arrayRangesEqSymmetricLemma!101 a1!699 a2!699 (_1!12364 lt!415431) (_2!12364 lt!415431)))))

(assert (=> b!277479 (arrayRangesEq!1182 a1!699 a2!699 (_1!12364 lt!415431) (_2!12364 lt!415431))))

(declare-fun b!277478 () Bool)

(assert (=> b!277478 (= e!197431 e!197430)))

(declare-fun res!230467 () Bool)

(assert (=> b!277478 (=> (not res!230467) (not e!197430))))

(assert (=> b!277478 (= res!230467 (bvslt (_1!12364 lt!415431) (_2!12364 lt!415431)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!578)

(assert (=> b!277478 (= lt!415431 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277476 () Bool)

(declare-fun res!230470 () Bool)

(assert (=> b!277476 (=> (not res!230470) (not e!197431))))

(declare-fun arrayBitRangesEq!0 (array!15939 array!15939 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277476 (= res!230470 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!61908 res!230469) b!277476))

(assert (= (and b!277476 res!230470) b!277477))

(assert (= (and b!277477 res!230468) b!277478))

(assert (= (and b!277478 res!230467) b!277479))

(declare-fun m!410623 () Bool)

(assert (=> start!61908 m!410623))

(declare-fun m!410625 () Bool)

(assert (=> start!61908 m!410625))

(declare-fun m!410627 () Bool)

(assert (=> b!277479 m!410627))

(declare-fun m!410629 () Bool)

(assert (=> b!277479 m!410629))

(declare-fun m!410631 () Bool)

(assert (=> b!277479 m!410631))

(declare-fun m!410633 () Bool)

(assert (=> b!277478 m!410633))

(declare-fun m!410635 () Bool)

(assert (=> b!277476 m!410635))

(check-sat (not start!61908) (not b!277479) (not b!277478) (not b!277476))
(check-sat)
(get-model)

(declare-fun d!95720 () Bool)

(assert (=> d!95720 (= (array_inv!6620 a1!699) (bvsge (size!6896 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61908 d!95720))

(declare-fun d!95722 () Bool)

(assert (=> d!95722 (= (array_inv!6620 a2!699) (bvsge (size!6896 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61908 d!95722))

(declare-fun d!95724 () Bool)

(declare-fun res!230487 () Bool)

(declare-fun e!197449 () Bool)

(assert (=> d!95724 (=> res!230487 e!197449)))

(assert (=> d!95724 (= res!230487 (= (_1!12364 lt!415431) (_2!12364 lt!415431)))))

(assert (=> d!95724 (= (arrayRangesEq!1182 a2!699 a1!699 (_1!12364 lt!415431) (_2!12364 lt!415431)) e!197449)))

(declare-fun b!277496 () Bool)

(declare-fun e!197450 () Bool)

(assert (=> b!277496 (= e!197449 e!197450)))

(declare-fun res!230488 () Bool)

(assert (=> b!277496 (=> (not res!230488) (not e!197450))))

(assert (=> b!277496 (= res!230488 (= (select (arr!7892 a2!699) (_1!12364 lt!415431)) (select (arr!7892 a1!699) (_1!12364 lt!415431))))))

(declare-fun b!277497 () Bool)

(assert (=> b!277497 (= e!197450 (arrayRangesEq!1182 a2!699 a1!699 (bvadd (_1!12364 lt!415431) #b00000000000000000000000000000001) (_2!12364 lt!415431)))))

(assert (= (and d!95724 (not res!230487)) b!277496))

(assert (= (and b!277496 res!230488) b!277497))

(declare-fun m!410651 () Bool)

(assert (=> b!277496 m!410651))

(declare-fun m!410653 () Bool)

(assert (=> b!277496 m!410653))

(declare-fun m!410655 () Bool)

(assert (=> b!277497 m!410655))

(assert (=> b!277479 d!95724))

(declare-fun d!95726 () Bool)

(assert (=> d!95726 (arrayRangesEq!1182 a2!699 a1!699 (_1!12364 lt!415431) (_2!12364 lt!415431))))

(declare-fun lt!415440 () Unit!19391)

(declare-fun choose!447 (array!15939 array!15939 (_ BitVec 32) (_ BitVec 32)) Unit!19391)

(assert (=> d!95726 (= lt!415440 (choose!447 a1!699 a2!699 (_1!12364 lt!415431) (_2!12364 lt!415431)))))

(assert (=> d!95726 (and (bvsle #b00000000000000000000000000000000 (_1!12364 lt!415431)) (bvsle (_1!12364 lt!415431) (_2!12364 lt!415431)) (bvsle (_2!12364 lt!415431) (size!6896 a1!699)))))

(assert (=> d!95726 (= (arrayRangesEqSymmetricLemma!101 a1!699 a2!699 (_1!12364 lt!415431) (_2!12364 lt!415431)) lt!415440)))

(declare-fun bs!24144 () Bool)

(assert (= bs!24144 d!95726))

(assert (=> bs!24144 m!410627))

(declare-fun m!410657 () Bool)

(assert (=> bs!24144 m!410657))

(assert (=> b!277479 d!95726))

(declare-fun d!95728 () Bool)

(declare-fun res!230489 () Bool)

(declare-fun e!197451 () Bool)

(assert (=> d!95728 (=> res!230489 e!197451)))

(assert (=> d!95728 (= res!230489 (= (_1!12364 lt!415431) (_2!12364 lt!415431)))))

(assert (=> d!95728 (= (arrayRangesEq!1182 a1!699 a2!699 (_1!12364 lt!415431) (_2!12364 lt!415431)) e!197451)))

(declare-fun b!277498 () Bool)

(declare-fun e!197452 () Bool)

(assert (=> b!277498 (= e!197451 e!197452)))

(declare-fun res!230490 () Bool)

(assert (=> b!277498 (=> (not res!230490) (not e!197452))))

(assert (=> b!277498 (= res!230490 (= (select (arr!7892 a1!699) (_1!12364 lt!415431)) (select (arr!7892 a2!699) (_1!12364 lt!415431))))))

(declare-fun b!277499 () Bool)

(assert (=> b!277499 (= e!197452 (arrayRangesEq!1182 a1!699 a2!699 (bvadd (_1!12364 lt!415431) #b00000000000000000000000000000001) (_2!12364 lt!415431)))))

(assert (= (and d!95728 (not res!230489)) b!277498))

(assert (= (and b!277498 res!230490) b!277499))

(assert (=> b!277498 m!410653))

(assert (=> b!277498 m!410651))

(declare-fun m!410659 () Bool)

(assert (=> b!277499 m!410659))

(assert (=> b!277479 d!95728))

(declare-fun d!95730 () Bool)

(assert (=> d!95730 (= (arrayBitIndices!0 from!822 to!789) (tuple4!579 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277478 d!95730))

(declare-fun b!277528 () Bool)

(declare-fun e!197481 () Bool)

(declare-fun e!197482 () Bool)

(assert (=> b!277528 (= e!197481 e!197482)))

(declare-fun res!230511 () Bool)

(assert (=> b!277528 (=> (not res!230511) (not e!197482))))

(declare-fun e!197480 () Bool)

(assert (=> b!277528 (= res!230511 e!197480)))

(declare-fun res!230514 () Bool)

(assert (=> b!277528 (=> res!230514 e!197480)))

(declare-fun lt!415453 () tuple4!578)

(assert (=> b!277528 (= res!230514 (bvsge (_1!12364 lt!415453) (_2!12364 lt!415453)))))

(declare-fun lt!415454 () (_ BitVec 32))

(assert (=> b!277528 (= lt!415454 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415455 () (_ BitVec 32))

(assert (=> b!277528 (= lt!415455 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277528 (= lt!415453 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277529 () Bool)

(declare-fun res!230515 () Bool)

(assert (=> b!277529 (= res!230515 (= lt!415454 #b00000000000000000000000000000000))))

(declare-fun e!197477 () Bool)

(assert (=> b!277529 (=> res!230515 e!197477)))

(declare-fun e!197478 () Bool)

(assert (=> b!277529 (= e!197478 e!197477)))

(declare-fun b!277530 () Bool)

(declare-fun call!4495 () Bool)

(assert (=> b!277530 (= e!197477 call!4495)))

(declare-fun d!95734 () Bool)

(declare-fun res!230513 () Bool)

(assert (=> d!95734 (=> res!230513 e!197481)))

(assert (=> d!95734 (= res!230513 (bvsge from!822 to!789))))

(assert (=> d!95734 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197481)))

(declare-fun b!277531 () Bool)

(declare-fun e!197479 () Bool)

(assert (=> b!277531 (= e!197479 e!197478)))

(declare-fun res!230512 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277531 (= res!230512 (byteRangesEq!0 (select (arr!7892 a1!699) (_3!1069 lt!415453)) (select (arr!7892 a2!699) (_3!1069 lt!415453)) lt!415455 #b00000000000000000000000000001000))))

(assert (=> b!277531 (=> (not res!230512) (not e!197478))))

(declare-fun b!277532 () Bool)

(assert (=> b!277532 (= e!197479 call!4495)))

(declare-fun b!277533 () Bool)

(assert (=> b!277533 (= e!197482 e!197479)))

(declare-fun c!12680 () Bool)

(assert (=> b!277533 (= c!12680 (= (_3!1069 lt!415453) (_4!289 lt!415453)))))

(declare-fun b!277534 () Bool)

(assert (=> b!277534 (= e!197480 (arrayRangesEq!1182 a1!699 a2!699 (_1!12364 lt!415453) (_2!12364 lt!415453)))))

(declare-fun bm!4492 () Bool)

(assert (=> bm!4492 (= call!4495 (byteRangesEq!0 (ite c!12680 (select (arr!7892 a1!699) (_3!1069 lt!415453)) (select (arr!7892 a1!699) (_4!289 lt!415453))) (ite c!12680 (select (arr!7892 a2!699) (_3!1069 lt!415453)) (select (arr!7892 a2!699) (_4!289 lt!415453))) (ite c!12680 lt!415455 #b00000000000000000000000000000000) lt!415454))))

(assert (= (and d!95734 (not res!230513)) b!277528))

(assert (= (and b!277528 (not res!230514)) b!277534))

(assert (= (and b!277528 res!230511) b!277533))

(assert (= (and b!277533 c!12680) b!277532))

(assert (= (and b!277533 (not c!12680)) b!277531))

(assert (= (and b!277531 res!230512) b!277529))

(assert (= (and b!277529 (not res!230515)) b!277530))

(assert (= (or b!277532 b!277530) bm!4492))

(assert (=> b!277528 m!410633))

(declare-fun m!410661 () Bool)

(assert (=> b!277531 m!410661))

(declare-fun m!410663 () Bool)

(assert (=> b!277531 m!410663))

(assert (=> b!277531 m!410661))

(assert (=> b!277531 m!410663))

(declare-fun m!410665 () Bool)

(assert (=> b!277531 m!410665))

(declare-fun m!410667 () Bool)

(assert (=> b!277534 m!410667))

(declare-fun m!410669 () Bool)

(assert (=> bm!4492 m!410669))

(assert (=> bm!4492 m!410663))

(declare-fun m!410671 () Bool)

(assert (=> bm!4492 m!410671))

(assert (=> bm!4492 m!410661))

(declare-fun m!410673 () Bool)

(assert (=> bm!4492 m!410673))

(assert (=> b!277476 d!95734))

(check-sat (not b!277531) (not b!277534) (not bm!4492) (not b!277499) (not b!277497) (not b!277528) (not d!95726))
(check-sat)

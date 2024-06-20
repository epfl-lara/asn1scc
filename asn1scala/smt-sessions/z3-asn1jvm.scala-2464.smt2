; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62552 () Bool)

(assert start!62552)

(declare-fun res!232653 () Bool)

(declare-fun e!199948 () Bool)

(assert (=> start!62552 (=> (not res!232653) (not e!199948))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16185 0))(
  ( (array!16186 (arr!7994 (Array (_ BitVec 32) (_ BitVec 8))) (size!6998 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16185)

(declare-fun a2!699 () array!16185)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62552 (= res!232653 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6998 a1!699) (size!6998 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6998 a1!699))))))))

(assert (=> start!62552 e!199948))

(assert (=> start!62552 true))

(declare-fun array_inv!6722 (array!16185) Bool)

(assert (=> start!62552 (array_inv!6722 a1!699)))

(assert (=> start!62552 (array_inv!6722 a2!699)))

(declare-fun b!280290 () Bool)

(declare-fun res!232654 () Bool)

(assert (=> b!280290 (=> (not res!232654) (not e!199948))))

(assert (=> b!280290 (= res!232654 (bvslt from!822 to!789))))

(declare-fun b!280291 () Bool)

(declare-fun res!232655 () Bool)

(assert (=> b!280291 (=> (not res!232655) (not e!199948))))

(declare-fun arrayBitRangesEq!0 (array!16185 array!16185 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280291 (= res!232655 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280292 () Bool)

(declare-datatypes ((Unit!19657 0))(
  ( (Unit!19658) )
))
(declare-fun e!199949 () Unit!19657)

(declare-fun Unit!19659 () Unit!19657)

(assert (=> b!280292 (= e!199949 Unit!19659)))

(declare-datatypes ((tuple4!746 0))(
  ( (tuple4!747 (_1!12448 (_ BitVec 32)) (_2!12448 (_ BitVec 32)) (_3!1153 (_ BitVec 32)) (_4!373 (_ BitVec 32))) )
))
(declare-fun lt!416792 () tuple4!746)

(declare-fun arrayRangesEq!1266 (array!16185 array!16185 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280292 (arrayRangesEq!1266 a1!699 a2!699 (_1!12448 lt!416792) (_2!12448 lt!416792))))

(declare-fun lt!416791 () Unit!19657)

(declare-fun arrayRangesEqSymmetricLemma!173 (array!16185 array!16185 (_ BitVec 32) (_ BitVec 32)) Unit!19657)

(assert (=> b!280292 (= lt!416791 (arrayRangesEqSymmetricLemma!173 a1!699 a2!699 (_1!12448 lt!416792) (_2!12448 lt!416792)))))

(assert (=> b!280292 (arrayRangesEq!1266 a2!699 a1!699 (_1!12448 lt!416792) (_2!12448 lt!416792))))

(declare-fun b!280293 () Bool)

(assert (=> b!280293 (= e!199948 (and (not (= (_3!1153 lt!416792) (_4!373 lt!416792))) (or (bvslt (_3!1153 lt!416792) #b00000000000000000000000000000000) (bvsge (_3!1153 lt!416792) (size!6998 a2!699)))))))

(declare-fun lt!416793 () Unit!19657)

(assert (=> b!280293 (= lt!416793 e!199949)))

(declare-fun c!12990 () Bool)

(assert (=> b!280293 (= c!12990 (bvslt (_1!12448 lt!416792) (_2!12448 lt!416792)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!746)

(assert (=> b!280293 (= lt!416792 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280294 () Bool)

(declare-fun Unit!19660 () Unit!19657)

(assert (=> b!280294 (= e!199949 Unit!19660)))

(assert (= (and start!62552 res!232653) b!280291))

(assert (= (and b!280291 res!232655) b!280290))

(assert (= (and b!280290 res!232654) b!280293))

(assert (= (and b!280293 c!12990) b!280292))

(assert (= (and b!280293 (not c!12990)) b!280294))

(declare-fun m!413315 () Bool)

(assert (=> start!62552 m!413315))

(declare-fun m!413317 () Bool)

(assert (=> start!62552 m!413317))

(declare-fun m!413319 () Bool)

(assert (=> b!280291 m!413319))

(declare-fun m!413321 () Bool)

(assert (=> b!280292 m!413321))

(declare-fun m!413323 () Bool)

(assert (=> b!280292 m!413323))

(declare-fun m!413325 () Bool)

(assert (=> b!280292 m!413325))

(declare-fun m!413327 () Bool)

(assert (=> b!280293 m!413327))

(check-sat (not b!280291) (not b!280293) (not start!62552) (not b!280292))
(check-sat)
(get-model)

(declare-fun b!280332 () Bool)

(declare-fun e!199983 () Bool)

(declare-fun e!199987 () Bool)

(assert (=> b!280332 (= e!199983 e!199987)))

(declare-fun res!232683 () Bool)

(assert (=> b!280332 (=> (not res!232683) (not e!199987))))

(declare-fun e!199985 () Bool)

(assert (=> b!280332 (= res!232683 e!199985)))

(declare-fun res!232686 () Bool)

(assert (=> b!280332 (=> res!232686 e!199985)))

(declare-fun lt!416814 () tuple4!746)

(assert (=> b!280332 (= res!232686 (bvsge (_1!12448 lt!416814) (_2!12448 lt!416814)))))

(declare-fun lt!416812 () (_ BitVec 32))

(assert (=> b!280332 (= lt!416812 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416813 () (_ BitVec 32))

(assert (=> b!280332 (= lt!416813 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280332 (= lt!416814 (arrayBitIndices!0 from!822 to!789))))

(declare-fun e!199984 () Bool)

(declare-fun b!280333 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280333 (= e!199984 (byteRangesEq!0 (select (arr!7994 a1!699) (_4!373 lt!416814)) (select (arr!7994 a2!699) (_4!373 lt!416814)) #b00000000000000000000000000000000 lt!416812))))

(declare-fun b!280334 () Bool)

(assert (=> b!280334 (= e!199985 (arrayRangesEq!1266 a1!699 a2!699 (_1!12448 lt!416814) (_2!12448 lt!416814)))))

(declare-fun c!12996 () Bool)

(declare-fun bm!4619 () Bool)

(declare-fun call!4622 () Bool)

(assert (=> bm!4619 (= call!4622 (byteRangesEq!0 (select (arr!7994 a1!699) (_3!1153 lt!416814)) (select (arr!7994 a2!699) (_3!1153 lt!416814)) lt!416813 (ite c!12996 lt!416812 #b00000000000000000000000000001000)))))

(declare-fun b!280335 () Bool)

(declare-fun e!199986 () Bool)

(assert (=> b!280335 (= e!199987 e!199986)))

(assert (=> b!280335 (= c!12996 (= (_3!1153 lt!416814) (_4!373 lt!416814)))))

(declare-fun b!280336 () Bool)

(assert (=> b!280336 (= e!199986 call!4622)))

(declare-fun b!280338 () Bool)

(declare-fun e!199988 () Bool)

(assert (=> b!280338 (= e!199986 e!199988)))

(declare-fun res!232687 () Bool)

(assert (=> b!280338 (= res!232687 call!4622)))

(assert (=> b!280338 (=> (not res!232687) (not e!199988))))

(declare-fun d!96400 () Bool)

(declare-fun res!232684 () Bool)

(assert (=> d!96400 (=> res!232684 e!199983)))

(assert (=> d!96400 (= res!232684 (bvsge from!822 to!789))))

(assert (=> d!96400 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199983)))

(declare-fun b!280337 () Bool)

(declare-fun res!232685 () Bool)

(assert (=> b!280337 (= res!232685 (= lt!416812 #b00000000000000000000000000000000))))

(assert (=> b!280337 (=> res!232685 e!199984)))

(assert (=> b!280337 (= e!199988 e!199984)))

(assert (= (and d!96400 (not res!232684)) b!280332))

(assert (= (and b!280332 (not res!232686)) b!280334))

(assert (= (and b!280332 res!232683) b!280335))

(assert (= (and b!280335 c!12996) b!280336))

(assert (= (and b!280335 (not c!12996)) b!280338))

(assert (= (and b!280338 res!232687) b!280337))

(assert (= (and b!280337 (not res!232685)) b!280333))

(assert (= (or b!280336 b!280338) bm!4619))

(assert (=> b!280332 m!413327))

(declare-fun m!413353 () Bool)

(assert (=> b!280333 m!413353))

(declare-fun m!413355 () Bool)

(assert (=> b!280333 m!413355))

(assert (=> b!280333 m!413353))

(assert (=> b!280333 m!413355))

(declare-fun m!413357 () Bool)

(assert (=> b!280333 m!413357))

(declare-fun m!413359 () Bool)

(assert (=> b!280334 m!413359))

(declare-fun m!413361 () Bool)

(assert (=> bm!4619 m!413361))

(declare-fun m!413363 () Bool)

(assert (=> bm!4619 m!413363))

(assert (=> bm!4619 m!413361))

(assert (=> bm!4619 m!413363))

(declare-fun m!413365 () Bool)

(assert (=> bm!4619 m!413365))

(assert (=> b!280291 d!96400))

(declare-fun d!96410 () Bool)

(assert (=> d!96410 (= (arrayBitIndices!0 from!822 to!789) (tuple4!747 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280293 d!96410))

(declare-fun d!96418 () Bool)

(assert (=> d!96418 (= (array_inv!6722 a1!699) (bvsge (size!6998 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62552 d!96418))

(declare-fun d!96420 () Bool)

(assert (=> d!96420 (= (array_inv!6722 a2!699) (bvsge (size!6998 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62552 d!96420))

(declare-fun d!96422 () Bool)

(declare-fun res!232713 () Bool)

(declare-fun e!200017 () Bool)

(assert (=> d!96422 (=> res!232713 e!200017)))

(assert (=> d!96422 (= res!232713 (= (_1!12448 lt!416792) (_2!12448 lt!416792)))))

(assert (=> d!96422 (= (arrayRangesEq!1266 a1!699 a2!699 (_1!12448 lt!416792) (_2!12448 lt!416792)) e!200017)))

(declare-fun b!280370 () Bool)

(declare-fun e!200018 () Bool)

(assert (=> b!280370 (= e!200017 e!200018)))

(declare-fun res!232714 () Bool)

(assert (=> b!280370 (=> (not res!232714) (not e!200018))))

(assert (=> b!280370 (= res!232714 (= (select (arr!7994 a1!699) (_1!12448 lt!416792)) (select (arr!7994 a2!699) (_1!12448 lt!416792))))))

(declare-fun b!280371 () Bool)

(assert (=> b!280371 (= e!200018 (arrayRangesEq!1266 a1!699 a2!699 (bvadd (_1!12448 lt!416792) #b00000000000000000000000000000001) (_2!12448 lt!416792)))))

(assert (= (and d!96422 (not res!232713)) b!280370))

(assert (= (and b!280370 res!232714) b!280371))

(declare-fun m!413387 () Bool)

(assert (=> b!280370 m!413387))

(declare-fun m!413389 () Bool)

(assert (=> b!280370 m!413389))

(declare-fun m!413391 () Bool)

(assert (=> b!280371 m!413391))

(assert (=> b!280292 d!96422))

(declare-fun d!96432 () Bool)

(assert (=> d!96432 (arrayRangesEq!1266 a2!699 a1!699 (_1!12448 lt!416792) (_2!12448 lt!416792))))

(declare-fun lt!416829 () Unit!19657)

(declare-fun choose!480 (array!16185 array!16185 (_ BitVec 32) (_ BitVec 32)) Unit!19657)

(assert (=> d!96432 (= lt!416829 (choose!480 a1!699 a2!699 (_1!12448 lt!416792) (_2!12448 lt!416792)))))

(assert (=> d!96432 (and (bvsle #b00000000000000000000000000000000 (_1!12448 lt!416792)) (bvsle (_1!12448 lt!416792) (_2!12448 lt!416792)) (bvsle (_2!12448 lt!416792) (size!6998 a1!699)))))

(assert (=> d!96432 (= (arrayRangesEqSymmetricLemma!173 a1!699 a2!699 (_1!12448 lt!416792) (_2!12448 lt!416792)) lt!416829)))

(declare-fun bs!24310 () Bool)

(assert (= bs!24310 d!96432))

(assert (=> bs!24310 m!413325))

(declare-fun m!413397 () Bool)

(assert (=> bs!24310 m!413397))

(assert (=> b!280292 d!96432))

(declare-fun d!96438 () Bool)

(declare-fun res!232717 () Bool)

(declare-fun e!200021 () Bool)

(assert (=> d!96438 (=> res!232717 e!200021)))

(assert (=> d!96438 (= res!232717 (= (_1!12448 lt!416792) (_2!12448 lt!416792)))))

(assert (=> d!96438 (= (arrayRangesEq!1266 a2!699 a1!699 (_1!12448 lt!416792) (_2!12448 lt!416792)) e!200021)))

(declare-fun b!280374 () Bool)

(declare-fun e!200022 () Bool)

(assert (=> b!280374 (= e!200021 e!200022)))

(declare-fun res!232718 () Bool)

(assert (=> b!280374 (=> (not res!232718) (not e!200022))))

(assert (=> b!280374 (= res!232718 (= (select (arr!7994 a2!699) (_1!12448 lt!416792)) (select (arr!7994 a1!699) (_1!12448 lt!416792))))))

(declare-fun b!280375 () Bool)

(assert (=> b!280375 (= e!200022 (arrayRangesEq!1266 a2!699 a1!699 (bvadd (_1!12448 lt!416792) #b00000000000000000000000000000001) (_2!12448 lt!416792)))))

(assert (= (and d!96438 (not res!232717)) b!280374))

(assert (= (and b!280374 res!232718) b!280375))

(assert (=> b!280374 m!413389))

(assert (=> b!280374 m!413387))

(declare-fun m!413399 () Bool)

(assert (=> b!280375 m!413399))

(assert (=> b!280292 d!96438))

(check-sat (not b!280375) (not b!280333) (not b!280332) (not b!280334) (not d!96432) (not b!280371) (not bm!4619))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62102 () Bool)

(assert start!62102)

(declare-fun b!278532 () Bool)

(declare-fun res!231285 () Bool)

(declare-fun e!198326 () Bool)

(assert (=> b!278532 (=> (not res!231285) (not e!198326))))

(declare-fun lt!416028 () (_ BitVec 32))

(declare-datatypes ((array!16023 0))(
  ( (array!16024 (arr!7928 (Array (_ BitVec 32) (_ BitVec 8))) (size!6932 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16023)

(declare-datatypes ((tuple4!650 0))(
  ( (tuple4!651 (_1!12400 (_ BitVec 32)) (_2!12400 (_ BitVec 32)) (_3!1105 (_ BitVec 32)) (_4!325 (_ BitVec 32))) )
))
(declare-fun lt!416029 () tuple4!650)

(declare-fun a1!699 () array!16023)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278532 (= res!231285 (byteRangesEq!0 (select (arr!7928 a2!699) (_3!1105 lt!416029)) (select (arr!7928 a1!699) (_3!1105 lt!416029)) lt!416028 #b00000000000000000000000000001000))))

(declare-fun b!278533 () Bool)

(declare-fun e!198328 () Bool)

(declare-fun e!198331 () Bool)

(assert (=> b!278533 (= e!198328 e!198331)))

(declare-fun res!231280 () Bool)

(assert (=> b!278533 (=> (not res!231280) (not e!198331))))

(assert (=> b!278533 (= res!231280 (not (= (_3!1105 lt!416029) (_4!325 lt!416029))))))

(declare-datatypes ((Unit!19519 0))(
  ( (Unit!19520) )
))
(declare-fun lt!416027 () Unit!19519)

(declare-fun e!198327 () Unit!19519)

(assert (=> b!278533 (= lt!416027 e!198327)))

(declare-fun c!12798 () Bool)

(assert (=> b!278533 (= c!12798 (bvslt (_1!12400 lt!416029) (_2!12400 lt!416029)))))

(declare-fun lt!416030 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278533 (= lt!416030 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278533 (= lt!416028 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!650)

(assert (=> b!278533 (= lt!416029 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278535 () Bool)

(declare-fun res!231283 () Bool)

(assert (=> b!278535 (=> (not res!231283) (not e!198328))))

(assert (=> b!278535 (= res!231283 (bvslt from!822 to!789))))

(declare-fun b!278536 () Bool)

(declare-fun e!198332 () Bool)

(assert (=> b!278536 (= e!198331 (not e!198332))))

(declare-fun res!231282 () Bool)

(assert (=> b!278536 (=> res!231282 e!198332)))

(assert (=> b!278536 (= res!231282 (= lt!416030 #b00000000000000000000000000000000))))

(assert (=> b!278536 e!198326))

(declare-fun res!231284 () Bool)

(assert (=> b!278536 (=> (not res!231284) (not e!198326))))

(assert (=> b!278536 (= res!231284 (byteRangesEq!0 (select (arr!7928 a1!699) (_3!1105 lt!416029)) (select (arr!7928 a2!699) (_3!1105 lt!416029)) lt!416028 #b00000000000000000000000000001000))))

(declare-fun b!278537 () Bool)

(declare-fun Unit!19521 () Unit!19519)

(assert (=> b!278537 (= e!198327 Unit!19521)))

(declare-fun b!278538 () Bool)

(assert (=> b!278538 (= e!198332 (or (bvsgt (size!6932 a2!699) (size!6932 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6932 a2!699))))))))

(declare-fun e!198333 () Bool)

(declare-fun b!278534 () Bool)

(assert (=> b!278534 (= e!198333 (byteRangesEq!0 (select (arr!7928 a1!699) (_4!325 lt!416029)) (select (arr!7928 a2!699) (_4!325 lt!416029)) #b00000000000000000000000000000000 lt!416030))))

(declare-fun res!231279 () Bool)

(assert (=> start!62102 (=> (not res!231279) (not e!198328))))

(assert (=> start!62102 (= res!231279 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6932 a1!699) (size!6932 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6932 a1!699))))))))

(assert (=> start!62102 e!198328))

(assert (=> start!62102 true))

(declare-fun array_inv!6656 (array!16023) Bool)

(assert (=> start!62102 (array_inv!6656 a1!699)))

(assert (=> start!62102 (array_inv!6656 a2!699)))

(declare-fun b!278539 () Bool)

(declare-fun Unit!19522 () Unit!19519)

(assert (=> b!278539 (= e!198327 Unit!19522)))

(declare-fun arrayRangesEq!1218 (array!16023 array!16023 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278539 (arrayRangesEq!1218 a1!699 a2!699 (_1!12400 lt!416029) (_2!12400 lt!416029))))

(declare-fun lt!416031 () Unit!19519)

(declare-fun arrayRangesEqSymmetricLemma!137 (array!16023 array!16023 (_ BitVec 32) (_ BitVec 32)) Unit!19519)

(assert (=> b!278539 (= lt!416031 (arrayRangesEqSymmetricLemma!137 a1!699 a2!699 (_1!12400 lt!416029) (_2!12400 lt!416029)))))

(assert (=> b!278539 (arrayRangesEq!1218 a2!699 a1!699 (_1!12400 lt!416029) (_2!12400 lt!416029))))

(declare-fun b!278540 () Bool)

(declare-fun res!231287 () Bool)

(assert (=> b!278540 (=> (not res!231287) (not e!198328))))

(declare-fun arrayBitRangesEq!0 (array!16023 array!16023 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278540 (= res!231287 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278541 () Bool)

(declare-fun res!231281 () Bool)

(assert (=> b!278541 (=> res!231281 e!198332)))

(assert (=> b!278541 (= res!231281 (not (byteRangesEq!0 (select (arr!7928 a2!699) (_4!325 lt!416029)) (select (arr!7928 a1!699) (_4!325 lt!416029)) #b00000000000000000000000000000000 lt!416030)))))

(declare-fun b!278542 () Bool)

(assert (=> b!278542 (= e!198326 e!198333)))

(declare-fun res!231286 () Bool)

(assert (=> b!278542 (=> res!231286 e!198333)))

(assert (=> b!278542 (= res!231286 (= lt!416030 #b00000000000000000000000000000000))))

(assert (= (and start!62102 res!231279) b!278540))

(assert (= (and b!278540 res!231287) b!278535))

(assert (= (and b!278535 res!231283) b!278533))

(assert (= (and b!278533 c!12798) b!278539))

(assert (= (and b!278533 (not c!12798)) b!278537))

(assert (= (and b!278533 res!231280) b!278536))

(assert (= (and b!278536 res!231284) b!278532))

(assert (= (and b!278532 res!231285) b!278542))

(assert (= (and b!278542 (not res!231286)) b!278534))

(assert (= (and b!278536 (not res!231282)) b!278541))

(assert (= (and b!278541 (not res!231281)) b!278538))

(declare-fun m!411631 () Bool)

(assert (=> b!278534 m!411631))

(declare-fun m!411633 () Bool)

(assert (=> b!278534 m!411633))

(assert (=> b!278534 m!411631))

(assert (=> b!278534 m!411633))

(declare-fun m!411635 () Bool)

(assert (=> b!278534 m!411635))

(declare-fun m!411637 () Bool)

(assert (=> b!278533 m!411637))

(declare-fun m!411639 () Bool)

(assert (=> start!62102 m!411639))

(declare-fun m!411641 () Bool)

(assert (=> start!62102 m!411641))

(declare-fun m!411643 () Bool)

(assert (=> b!278539 m!411643))

(declare-fun m!411645 () Bool)

(assert (=> b!278539 m!411645))

(declare-fun m!411647 () Bool)

(assert (=> b!278539 m!411647))

(declare-fun m!411649 () Bool)

(assert (=> b!278532 m!411649))

(declare-fun m!411651 () Bool)

(assert (=> b!278532 m!411651))

(assert (=> b!278532 m!411649))

(assert (=> b!278532 m!411651))

(declare-fun m!411653 () Bool)

(assert (=> b!278532 m!411653))

(assert (=> b!278541 m!411633))

(assert (=> b!278541 m!411631))

(assert (=> b!278541 m!411633))

(assert (=> b!278541 m!411631))

(declare-fun m!411655 () Bool)

(assert (=> b!278541 m!411655))

(declare-fun m!411657 () Bool)

(assert (=> b!278540 m!411657))

(assert (=> b!278536 m!411651))

(assert (=> b!278536 m!411649))

(assert (=> b!278536 m!411651))

(assert (=> b!278536 m!411649))

(declare-fun m!411659 () Bool)

(assert (=> b!278536 m!411659))

(check-sat (not b!278533) (not b!278539) (not b!278532) (not start!62102) (not b!278534) (not b!278540) (not b!278541) (not b!278536))
(check-sat)

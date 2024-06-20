; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62110 () Bool)

(assert start!62110)

(declare-fun b!278632 () Bool)

(declare-fun res!231356 () Bool)

(declare-fun e!198408 () Bool)

(assert (=> b!278632 (=> (not res!231356) (not e!198408))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16031 0))(
  ( (array!16032 (arr!7932 (Array (_ BitVec 32) (_ BitVec 8))) (size!6936 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16031)

(declare-fun a2!699 () array!16031)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16031 array!16031 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278632 (= res!231356 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278633 () Bool)

(declare-fun e!198409 () Bool)

(assert (=> b!278633 (= e!198408 e!198409)))

(declare-fun res!231357 () Bool)

(assert (=> b!278633 (=> (not res!231357) (not e!198409))))

(declare-datatypes ((tuple4!658 0))(
  ( (tuple4!659 (_1!12404 (_ BitVec 32)) (_2!12404 (_ BitVec 32)) (_3!1109 (_ BitVec 32)) (_4!329 (_ BitVec 32))) )
))
(declare-fun lt!416080 () tuple4!658)

(assert (=> b!278633 (= res!231357 (not (= (_3!1109 lt!416080) (_4!329 lt!416080))))))

(declare-datatypes ((Unit!19535 0))(
  ( (Unit!19536) )
))
(declare-fun lt!416079 () Unit!19535)

(declare-fun e!198410 () Unit!19535)

(assert (=> b!278633 (= lt!416079 e!198410)))

(declare-fun c!12810 () Bool)

(assert (=> b!278633 (= c!12810 (bvslt (_1!12404 lt!416080) (_2!12404 lt!416080)))))

(declare-fun lt!416082 () (_ BitVec 32))

(assert (=> b!278633 (= lt!416082 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!658)

(assert (=> b!278633 (= lt!416080 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!231358 () Bool)

(assert (=> start!62110 (=> (not res!231358) (not e!198408))))

(assert (=> start!62110 (= res!231358 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6936 a1!699) (size!6936 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6936 a1!699))))))))

(assert (=> start!62110 e!198408))

(assert (=> start!62110 true))

(declare-fun array_inv!6660 (array!16031) Bool)

(assert (=> start!62110 (array_inv!6660 a1!699)))

(assert (=> start!62110 (array_inv!6660 a2!699)))

(declare-fun b!278634 () Bool)

(declare-fun Unit!19537 () Unit!19535)

(assert (=> b!278634 (= e!198410 Unit!19537)))

(declare-fun e!198406 () Bool)

(declare-fun b!278635 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278635 (= e!198406 (byteRangesEq!0 (select (arr!7932 a2!699) (_3!1109 lt!416080)) (select (arr!7932 a1!699) (_3!1109 lt!416080)) lt!416082 #b00000000000000000000000000001000))))

(declare-fun b!278636 () Bool)

(declare-fun res!231355 () Bool)

(assert (=> b!278636 (=> (not res!231355) (not e!198408))))

(assert (=> b!278636 (= res!231355 (bvslt from!822 to!789))))

(declare-fun b!278637 () Bool)

(assert (=> b!278637 (= e!198409 (not (or (not (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (bvsle (size!6936 a2!699) (size!6936 a1!699)))))))

(assert (=> b!278637 e!198406))

(declare-fun res!231359 () Bool)

(assert (=> b!278637 (=> (not res!231359) (not e!198406))))

(assert (=> b!278637 (= res!231359 (byteRangesEq!0 (select (arr!7932 a1!699) (_3!1109 lt!416080)) (select (arr!7932 a2!699) (_3!1109 lt!416080)) lt!416082 #b00000000000000000000000000001000))))

(declare-fun b!278638 () Bool)

(declare-fun Unit!19538 () Unit!19535)

(assert (=> b!278638 (= e!198410 Unit!19538)))

(declare-fun arrayRangesEq!1222 (array!16031 array!16031 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278638 (arrayRangesEq!1222 a1!699 a2!699 (_1!12404 lt!416080) (_2!12404 lt!416080))))

(declare-fun lt!416081 () Unit!19535)

(declare-fun arrayRangesEqSymmetricLemma!141 (array!16031 array!16031 (_ BitVec 32) (_ BitVec 32)) Unit!19535)

(assert (=> b!278638 (= lt!416081 (arrayRangesEqSymmetricLemma!141 a1!699 a2!699 (_1!12404 lt!416080) (_2!12404 lt!416080)))))

(assert (=> b!278638 (arrayRangesEq!1222 a2!699 a1!699 (_1!12404 lt!416080) (_2!12404 lt!416080))))

(assert (= (and start!62110 res!231358) b!278632))

(assert (= (and b!278632 res!231356) b!278636))

(assert (= (and b!278636 res!231355) b!278633))

(assert (= (and b!278633 c!12810) b!278638))

(assert (= (and b!278633 (not c!12810)) b!278634))

(assert (= (and b!278633 res!231357) b!278637))

(assert (= (and b!278637 res!231359) b!278635))

(declare-fun m!411735 () Bool)

(assert (=> b!278635 m!411735))

(declare-fun m!411737 () Bool)

(assert (=> b!278635 m!411737))

(assert (=> b!278635 m!411735))

(assert (=> b!278635 m!411737))

(declare-fun m!411739 () Bool)

(assert (=> b!278635 m!411739))

(declare-fun m!411741 () Bool)

(assert (=> start!62110 m!411741))

(declare-fun m!411743 () Bool)

(assert (=> start!62110 m!411743))

(declare-fun m!411745 () Bool)

(assert (=> b!278632 m!411745))

(declare-fun m!411747 () Bool)

(assert (=> b!278633 m!411747))

(assert (=> b!278637 m!411737))

(assert (=> b!278637 m!411735))

(assert (=> b!278637 m!411737))

(assert (=> b!278637 m!411735))

(declare-fun m!411749 () Bool)

(assert (=> b!278637 m!411749))

(declare-fun m!411751 () Bool)

(assert (=> b!278638 m!411751))

(declare-fun m!411753 () Bool)

(assert (=> b!278638 m!411753))

(declare-fun m!411755 () Bool)

(assert (=> b!278638 m!411755))

(push 1)

(assert (not start!62110))

(assert (not b!278633))

(assert (not b!278637))

(assert (not b!278638))

(assert (not b!278632))

(assert (not b!278635))

(check-sat)

(pop 1)

(push 1)

(check-sat)


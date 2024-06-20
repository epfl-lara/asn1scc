; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62112 () Bool)

(assert start!62112)

(declare-datatypes ((tuple4!660 0))(
  ( (tuple4!661 (_1!12405 (_ BitVec 32)) (_2!12405 (_ BitVec 32)) (_3!1110 (_ BitVec 32)) (_4!330 (_ BitVec 32))) )
))
(declare-fun lt!416091 () tuple4!660)

(declare-datatypes ((array!16033 0))(
  ( (array!16034 (arr!7933 (Array (_ BitVec 32) (_ BitVec 8))) (size!6937 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16033)

(declare-fun e!198427 () Bool)

(declare-fun b!278653 () Bool)

(declare-fun lt!416094 () (_ BitVec 32))

(declare-fun a2!699 () array!16033)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278653 (= e!198427 (byteRangesEq!0 (select (arr!7933 a2!699) (_3!1110 lt!416091)) (select (arr!7933 a1!699) (_3!1110 lt!416091)) lt!416094 #b00000000000000000000000000001000))))

(declare-fun b!278654 () Bool)

(declare-fun e!198426 () Bool)

(declare-fun e!198425 () Bool)

(assert (=> b!278654 (= e!198426 e!198425)))

(declare-fun res!231371 () Bool)

(assert (=> b!278654 (=> (not res!231371) (not e!198425))))

(assert (=> b!278654 (= res!231371 (not (= (_3!1110 lt!416091) (_4!330 lt!416091))))))

(declare-datatypes ((Unit!19539 0))(
  ( (Unit!19540) )
))
(declare-fun lt!416092 () Unit!19539)

(declare-fun e!198424 () Unit!19539)

(assert (=> b!278654 (= lt!416092 e!198424)))

(declare-fun c!12813 () Bool)

(assert (=> b!278654 (= c!12813 (bvslt (_1!12405 lt!416091) (_2!12405 lt!416091)))))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278654 (= lt!416094 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!660)

(assert (=> b!278654 (= lt!416091 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278655 () Bool)

(declare-fun Unit!19541 () Unit!19539)

(assert (=> b!278655 (= e!198424 Unit!19541)))

(declare-fun b!278656 () Bool)

(assert (=> b!278656 (= e!198425 (not (or (not (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (bvsgt (size!6937 a2!699) (size!6937 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6937 a2!699)))))))))

(assert (=> b!278656 e!198427))

(declare-fun res!231373 () Bool)

(assert (=> b!278656 (=> (not res!231373) (not e!198427))))

(assert (=> b!278656 (= res!231373 (byteRangesEq!0 (select (arr!7933 a1!699) (_3!1110 lt!416091)) (select (arr!7933 a2!699) (_3!1110 lt!416091)) lt!416094 #b00000000000000000000000000001000))))

(declare-fun b!278658 () Bool)

(declare-fun res!231370 () Bool)

(assert (=> b!278658 (=> (not res!231370) (not e!198426))))

(declare-fun arrayBitRangesEq!0 (array!16033 array!16033 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278658 (= res!231370 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278659 () Bool)

(declare-fun Unit!19542 () Unit!19539)

(assert (=> b!278659 (= e!198424 Unit!19542)))

(declare-fun arrayRangesEq!1223 (array!16033 array!16033 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278659 (arrayRangesEq!1223 a1!699 a2!699 (_1!12405 lt!416091) (_2!12405 lt!416091))))

(declare-fun lt!416093 () Unit!19539)

(declare-fun arrayRangesEqSymmetricLemma!142 (array!16033 array!16033 (_ BitVec 32) (_ BitVec 32)) Unit!19539)

(assert (=> b!278659 (= lt!416093 (arrayRangesEqSymmetricLemma!142 a1!699 a2!699 (_1!12405 lt!416091) (_2!12405 lt!416091)))))

(assert (=> b!278659 (arrayRangesEq!1223 a2!699 a1!699 (_1!12405 lt!416091) (_2!12405 lt!416091))))

(declare-fun b!278657 () Bool)

(declare-fun res!231374 () Bool)

(assert (=> b!278657 (=> (not res!231374) (not e!198426))))

(assert (=> b!278657 (= res!231374 (bvslt from!822 to!789))))

(declare-fun res!231372 () Bool)

(assert (=> start!62112 (=> (not res!231372) (not e!198426))))

(assert (=> start!62112 (= res!231372 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6937 a1!699) (size!6937 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6937 a1!699))))))))

(assert (=> start!62112 e!198426))

(assert (=> start!62112 true))

(declare-fun array_inv!6661 (array!16033) Bool)

(assert (=> start!62112 (array_inv!6661 a1!699)))

(assert (=> start!62112 (array_inv!6661 a2!699)))

(assert (= (and start!62112 res!231372) b!278658))

(assert (= (and b!278658 res!231370) b!278657))

(assert (= (and b!278657 res!231374) b!278654))

(assert (= (and b!278654 c!12813) b!278659))

(assert (= (and b!278654 (not c!12813)) b!278655))

(assert (= (and b!278654 res!231371) b!278656))

(assert (= (and b!278656 res!231373) b!278653))

(declare-fun m!411757 () Bool)

(assert (=> b!278654 m!411757))

(declare-fun m!411759 () Bool)

(assert (=> b!278653 m!411759))

(declare-fun m!411761 () Bool)

(assert (=> b!278653 m!411761))

(assert (=> b!278653 m!411759))

(assert (=> b!278653 m!411761))

(declare-fun m!411763 () Bool)

(assert (=> b!278653 m!411763))

(assert (=> b!278656 m!411761))

(assert (=> b!278656 m!411759))

(assert (=> b!278656 m!411761))

(assert (=> b!278656 m!411759))

(declare-fun m!411765 () Bool)

(assert (=> b!278656 m!411765))

(declare-fun m!411767 () Bool)

(assert (=> b!278658 m!411767))

(declare-fun m!411769 () Bool)

(assert (=> start!62112 m!411769))

(declare-fun m!411771 () Bool)

(assert (=> start!62112 m!411771))

(declare-fun m!411773 () Bool)

(assert (=> b!278659 m!411773))

(declare-fun m!411775 () Bool)

(assert (=> b!278659 m!411775))

(declare-fun m!411777 () Bool)

(assert (=> b!278659 m!411777))

(push 1)

(assert (not start!62112))

(assert (not b!278658))

(assert (not b!278654))

(assert (not b!278656))

(assert (not b!278653))

(assert (not b!278659))

(check-sat)

(pop 1)

(push 1)

(check-sat)


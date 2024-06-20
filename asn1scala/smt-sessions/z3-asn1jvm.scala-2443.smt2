; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62108 () Bool)

(assert start!62108)

(declare-fun b!278611 () Bool)

(declare-datatypes ((Unit!19531 0))(
  ( (Unit!19532) )
))
(declare-fun e!198390 () Unit!19531)

(declare-fun Unit!19533 () Unit!19531)

(assert (=> b!278611 (= e!198390 Unit!19533)))

(declare-fun res!231340 () Bool)

(declare-fun e!198388 () Bool)

(assert (=> start!62108 (=> (not res!231340) (not e!198388))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16029 0))(
  ( (array!16030 (arr!7931 (Array (_ BitVec 32) (_ BitVec 8))) (size!6935 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16029)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a2!699 () array!16029)

(assert (=> start!62108 (= res!231340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6935 a1!699) (size!6935 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6935 a1!699))))))))

(assert (=> start!62108 e!198388))

(assert (=> start!62108 true))

(declare-fun array_inv!6659 (array!16029) Bool)

(assert (=> start!62108 (array_inv!6659 a1!699)))

(assert (=> start!62108 (array_inv!6659 a2!699)))

(declare-fun b!278612 () Bool)

(declare-fun e!198393 () Bool)

(assert (=> b!278612 (= e!198388 e!198393)))

(declare-fun res!231341 () Bool)

(assert (=> b!278612 (=> (not res!231341) (not e!198393))))

(declare-datatypes ((tuple4!656 0))(
  ( (tuple4!657 (_1!12403 (_ BitVec 32)) (_2!12403 (_ BitVec 32)) (_3!1108 (_ BitVec 32)) (_4!328 (_ BitVec 32))) )
))
(declare-fun lt!416067 () tuple4!656)

(assert (=> b!278612 (= res!231341 (not (= (_3!1108 lt!416067) (_4!328 lt!416067))))))

(declare-fun lt!416068 () Unit!19531)

(assert (=> b!278612 (= lt!416068 e!198390)))

(declare-fun c!12807 () Bool)

(assert (=> b!278612 (= c!12807 (bvslt (_1!12403 lt!416067) (_2!12403 lt!416067)))))

(declare-fun lt!416069 () (_ BitVec 32))

(assert (=> b!278612 (= lt!416069 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!656)

(assert (=> b!278612 (= lt!416067 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278613 () Bool)

(declare-fun Unit!19534 () Unit!19531)

(assert (=> b!278613 (= e!198390 Unit!19534)))

(declare-fun arrayRangesEq!1221 (array!16029 array!16029 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278613 (arrayRangesEq!1221 a1!699 a2!699 (_1!12403 lt!416067) (_2!12403 lt!416067))))

(declare-fun lt!416070 () Unit!19531)

(declare-fun arrayRangesEqSymmetricLemma!140 (array!16029 array!16029 (_ BitVec 32) (_ BitVec 32)) Unit!19531)

(assert (=> b!278613 (= lt!416070 (arrayRangesEqSymmetricLemma!140 a1!699 a2!699 (_1!12403 lt!416067) (_2!12403 lt!416067)))))

(assert (=> b!278613 (arrayRangesEq!1221 a2!699 a1!699 (_1!12403 lt!416067) (_2!12403 lt!416067))))

(declare-fun b!278614 () Bool)

(declare-fun res!231344 () Bool)

(assert (=> b!278614 (=> (not res!231344) (not e!198388))))

(assert (=> b!278614 (= res!231344 (bvslt from!822 to!789))))

(declare-fun b!278615 () Bool)

(declare-fun e!198392 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278615 (= e!198392 (byteRangesEq!0 (select (arr!7931 a2!699) (_3!1108 lt!416067)) (select (arr!7931 a1!699) (_3!1108 lt!416067)) lt!416069 #b00000000000000000000000000001000))))

(declare-fun b!278616 () Bool)

(declare-fun res!231342 () Bool)

(assert (=> b!278616 (=> (not res!231342) (not e!198388))))

(declare-fun arrayBitRangesEq!0 (array!16029 array!16029 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278616 (= res!231342 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278617 () Bool)

(assert (=> b!278617 (= e!198393 (not (or (not (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (bvsle (size!6935 a2!699) (size!6935 a1!699)))))))

(assert (=> b!278617 e!198392))

(declare-fun res!231343 () Bool)

(assert (=> b!278617 (=> (not res!231343) (not e!198392))))

(assert (=> b!278617 (= res!231343 (byteRangesEq!0 (select (arr!7931 a1!699) (_3!1108 lt!416067)) (select (arr!7931 a2!699) (_3!1108 lt!416067)) lt!416069 #b00000000000000000000000000001000))))

(assert (= (and start!62108 res!231340) b!278616))

(assert (= (and b!278616 res!231342) b!278614))

(assert (= (and b!278614 res!231344) b!278612))

(assert (= (and b!278612 c!12807) b!278613))

(assert (= (and b!278612 (not c!12807)) b!278611))

(assert (= (and b!278612 res!231341) b!278617))

(assert (= (and b!278617 res!231343) b!278615))

(declare-fun m!411713 () Bool)

(assert (=> b!278616 m!411713))

(declare-fun m!411715 () Bool)

(assert (=> b!278615 m!411715))

(declare-fun m!411717 () Bool)

(assert (=> b!278615 m!411717))

(assert (=> b!278615 m!411715))

(assert (=> b!278615 m!411717))

(declare-fun m!411719 () Bool)

(assert (=> b!278615 m!411719))

(declare-fun m!411721 () Bool)

(assert (=> b!278612 m!411721))

(declare-fun m!411723 () Bool)

(assert (=> b!278613 m!411723))

(declare-fun m!411725 () Bool)

(assert (=> b!278613 m!411725))

(declare-fun m!411727 () Bool)

(assert (=> b!278613 m!411727))

(assert (=> b!278617 m!411717))

(assert (=> b!278617 m!411715))

(assert (=> b!278617 m!411717))

(assert (=> b!278617 m!411715))

(declare-fun m!411729 () Bool)

(assert (=> b!278617 m!411729))

(declare-fun m!411731 () Bool)

(assert (=> start!62108 m!411731))

(declare-fun m!411733 () Bool)

(assert (=> start!62108 m!411733))

(check-sat (not start!62108) (not b!278612) (not b!278617) (not b!278615) (not b!278613) (not b!278616))
(check-sat)

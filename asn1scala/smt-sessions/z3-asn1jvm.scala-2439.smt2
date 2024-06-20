; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62084 () Bool)

(assert start!62084)

(declare-fun b!278269 () Bool)

(declare-fun res!231070 () Bool)

(declare-fun e!198128 () Bool)

(assert (=> b!278269 (=> (not res!231070) (not e!198128))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278269 (= res!231070 (bvslt from!822 to!789))))

(declare-fun res!231073 () Bool)

(assert (=> start!62084 (=> (not res!231073) (not e!198128))))

(declare-datatypes ((array!16005 0))(
  ( (array!16006 (arr!7919 (Array (_ BitVec 32) (_ BitVec 8))) (size!6923 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16005)

(declare-fun a2!699 () array!16005)

(assert (=> start!62084 (= res!231073 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6923 a1!699) (size!6923 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6923 a1!699))))))))

(assert (=> start!62084 e!198128))

(assert (=> start!62084 true))

(declare-fun array_inv!6647 (array!16005) Bool)

(assert (=> start!62084 (array_inv!6647 a1!699)))

(assert (=> start!62084 (array_inv!6647 a2!699)))

(declare-fun b!278270 () Bool)

(declare-fun e!198131 () Bool)

(declare-fun lt!415892 () (_ BitVec 32))

(assert (=> b!278270 (= e!198131 (not (or (= lt!415892 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 lt!415892) (bvsle lt!415892 #b00000000000000000000000000001000)))))))

(declare-fun e!198130 () Bool)

(assert (=> b!278270 e!198130))

(declare-fun res!231071 () Bool)

(assert (=> b!278270 (=> (not res!231071) (not e!198130))))

(declare-datatypes ((tuple4!632 0))(
  ( (tuple4!633 (_1!12391 (_ BitVec 32)) (_2!12391 (_ BitVec 32)) (_3!1096 (_ BitVec 32)) (_4!316 (_ BitVec 32))) )
))
(declare-fun lt!415895 () tuple4!632)

(declare-fun lt!415896 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278270 (= res!231071 (byteRangesEq!0 (select (arr!7919 a1!699) (_3!1096 lt!415895)) (select (arr!7919 a2!699) (_3!1096 lt!415895)) lt!415896 #b00000000000000000000000000001000))))

(declare-fun b!278271 () Bool)

(assert (=> b!278271 (= e!198130 (byteRangesEq!0 (select (arr!7919 a2!699) (_3!1096 lt!415895)) (select (arr!7919 a1!699) (_3!1096 lt!415895)) lt!415896 #b00000000000000000000000000001000))))

(declare-fun b!278272 () Bool)

(declare-datatypes ((Unit!19483 0))(
  ( (Unit!19484) )
))
(declare-fun e!198129 () Unit!19483)

(declare-fun Unit!19485 () Unit!19483)

(assert (=> b!278272 (= e!198129 Unit!19485)))

(declare-fun b!278273 () Bool)

(declare-fun res!231074 () Bool)

(assert (=> b!278273 (=> (not res!231074) (not e!198128))))

(declare-fun arrayBitRangesEq!0 (array!16005 array!16005 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278273 (= res!231074 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278274 () Bool)

(assert (=> b!278274 (= e!198128 e!198131)))

(declare-fun res!231072 () Bool)

(assert (=> b!278274 (=> (not res!231072) (not e!198131))))

(assert (=> b!278274 (= res!231072 (not (= (_3!1096 lt!415895) (_4!316 lt!415895))))))

(declare-fun lt!415894 () Unit!19483)

(assert (=> b!278274 (= lt!415894 e!198129)))

(declare-fun c!12771 () Bool)

(assert (=> b!278274 (= c!12771 (bvslt (_1!12391 lt!415895) (_2!12391 lt!415895)))))

(assert (=> b!278274 (= lt!415892 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278274 (= lt!415896 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!632)

(assert (=> b!278274 (= lt!415895 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278275 () Bool)

(declare-fun Unit!19486 () Unit!19483)

(assert (=> b!278275 (= e!198129 Unit!19486)))

(declare-fun arrayRangesEq!1209 (array!16005 array!16005 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278275 (arrayRangesEq!1209 a1!699 a2!699 (_1!12391 lt!415895) (_2!12391 lt!415895))))

(declare-fun lt!415893 () Unit!19483)

(declare-fun arrayRangesEqSymmetricLemma!128 (array!16005 array!16005 (_ BitVec 32) (_ BitVec 32)) Unit!19483)

(assert (=> b!278275 (= lt!415893 (arrayRangesEqSymmetricLemma!128 a1!699 a2!699 (_1!12391 lt!415895) (_2!12391 lt!415895)))))

(assert (=> b!278275 (arrayRangesEq!1209 a2!699 a1!699 (_1!12391 lt!415895) (_2!12391 lt!415895))))

(assert (= (and start!62084 res!231073) b!278273))

(assert (= (and b!278273 res!231074) b!278269))

(assert (= (and b!278269 res!231070) b!278274))

(assert (= (and b!278274 c!12771) b!278275))

(assert (= (and b!278274 (not c!12771)) b!278272))

(assert (= (and b!278274 res!231072) b!278270))

(assert (= (and b!278270 res!231071) b!278271))

(declare-fun m!411383 () Bool)

(assert (=> b!278270 m!411383))

(declare-fun m!411385 () Bool)

(assert (=> b!278270 m!411385))

(assert (=> b!278270 m!411383))

(assert (=> b!278270 m!411385))

(declare-fun m!411387 () Bool)

(assert (=> b!278270 m!411387))

(declare-fun m!411389 () Bool)

(assert (=> b!278275 m!411389))

(declare-fun m!411391 () Bool)

(assert (=> b!278275 m!411391))

(declare-fun m!411393 () Bool)

(assert (=> b!278275 m!411393))

(declare-fun m!411395 () Bool)

(assert (=> b!278273 m!411395))

(declare-fun m!411397 () Bool)

(assert (=> b!278274 m!411397))

(declare-fun m!411399 () Bool)

(assert (=> start!62084 m!411399))

(declare-fun m!411401 () Bool)

(assert (=> start!62084 m!411401))

(assert (=> b!278271 m!411385))

(assert (=> b!278271 m!411383))

(assert (=> b!278271 m!411385))

(assert (=> b!278271 m!411383))

(declare-fun m!411403 () Bool)

(assert (=> b!278271 m!411403))

(check-sat (not b!278273) (not b!278270) (not b!278275) (not start!62084) (not b!278274) (not b!278271))
(check-sat)

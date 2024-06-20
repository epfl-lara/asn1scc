; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62098 () Bool)

(assert start!62098)

(declare-fun b!278466 () Bool)

(declare-fun e!198279 () Bool)

(declare-fun e!198278 () Bool)

(assert (=> b!278466 (= e!198279 e!198278)))

(declare-fun res!231226 () Bool)

(assert (=> b!278466 (=> (not res!231226) (not e!198278))))

(declare-datatypes ((tuple4!646 0))(
  ( (tuple4!647 (_1!12398 (_ BitVec 32)) (_2!12398 (_ BitVec 32)) (_3!1103 (_ BitVec 32)) (_4!323 (_ BitVec 32))) )
))
(declare-fun lt!416001 () tuple4!646)

(assert (=> b!278466 (= res!231226 (not (= (_3!1103 lt!416001) (_4!323 lt!416001))))))

(declare-datatypes ((Unit!19511 0))(
  ( (Unit!19512) )
))
(declare-fun lt!415997 () Unit!19511)

(declare-fun e!198285 () Unit!19511)

(assert (=> b!278466 (= lt!415997 e!198285)))

(declare-fun c!12792 () Bool)

(assert (=> b!278466 (= c!12792 (bvslt (_1!12398 lt!416001) (_2!12398 lt!416001)))))

(declare-fun lt!415999 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278466 (= lt!415999 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415998 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278466 (= lt!415998 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!646)

(assert (=> b!278466 (= lt!416001 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278467 () Bool)

(declare-fun res!231230 () Bool)

(declare-fun e!198281 () Bool)

(assert (=> b!278467 (=> (not res!231230) (not e!198281))))

(declare-datatypes ((array!16019 0))(
  ( (array!16020 (arr!7926 (Array (_ BitVec 32) (_ BitVec 8))) (size!6930 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16019)

(declare-fun a2!699 () array!16019)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278467 (= res!231230 (byteRangesEq!0 (select (arr!7926 a2!699) (_3!1103 lt!416001)) (select (arr!7926 a1!699) (_3!1103 lt!416001)) lt!415998 #b00000000000000000000000000001000))))

(declare-fun b!278468 () Bool)

(declare-fun res!231227 () Bool)

(declare-fun e!198283 () Bool)

(assert (=> b!278468 (=> res!231227 e!198283)))

(assert (=> b!278468 (= res!231227 (not (byteRangesEq!0 (select (arr!7926 a2!699) (_4!323 lt!416001)) (select (arr!7926 a1!699) (_4!323 lt!416001)) #b00000000000000000000000000000000 lt!415999)))))

(declare-fun b!278469 () Bool)

(assert (=> b!278469 (= e!198278 (not e!198283))))

(declare-fun res!231232 () Bool)

(assert (=> b!278469 (=> res!231232 e!198283)))

(assert (=> b!278469 (= res!231232 (= lt!415999 #b00000000000000000000000000000000))))

(assert (=> b!278469 e!198281))

(declare-fun res!231225 () Bool)

(assert (=> b!278469 (=> (not res!231225) (not e!198281))))

(assert (=> b!278469 (= res!231225 (byteRangesEq!0 (select (arr!7926 a1!699) (_3!1103 lt!416001)) (select (arr!7926 a2!699) (_3!1103 lt!416001)) lt!415998 #b00000000000000000000000000001000))))

(declare-fun b!278470 () Bool)

(declare-fun e!198284 () Bool)

(assert (=> b!278470 (= e!198281 e!198284)))

(declare-fun res!231233 () Bool)

(assert (=> b!278470 (=> res!231233 e!198284)))

(assert (=> b!278470 (= res!231233 (= lt!415999 #b00000000000000000000000000000000))))

(declare-fun res!231231 () Bool)

(assert (=> start!62098 (=> (not res!231231) (not e!198279))))

(assert (=> start!62098 (= res!231231 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6930 a1!699) (size!6930 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6930 a1!699))))))))

(assert (=> start!62098 e!198279))

(assert (=> start!62098 true))

(declare-fun array_inv!6654 (array!16019) Bool)

(assert (=> start!62098 (array_inv!6654 a1!699)))

(assert (=> start!62098 (array_inv!6654 a2!699)))

(declare-fun b!278471 () Bool)

(assert (=> b!278471 (= e!198284 (byteRangesEq!0 (select (arr!7926 a1!699) (_4!323 lt!416001)) (select (arr!7926 a2!699) (_4!323 lt!416001)) #b00000000000000000000000000000000 lt!415999))))

(declare-fun b!278472 () Bool)

(declare-fun Unit!19513 () Unit!19511)

(assert (=> b!278472 (= e!198285 Unit!19513)))

(declare-fun b!278473 () Bool)

(declare-fun res!231228 () Bool)

(assert (=> b!278473 (=> (not res!231228) (not e!198279))))

(assert (=> b!278473 (= res!231228 (bvslt from!822 to!789))))

(declare-fun b!278474 () Bool)

(declare-fun res!231229 () Bool)

(assert (=> b!278474 (=> (not res!231229) (not e!198279))))

(declare-fun arrayBitRangesEq!0 (array!16019 array!16019 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278474 (= res!231229 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278475 () Bool)

(declare-fun Unit!19514 () Unit!19511)

(assert (=> b!278475 (= e!198285 Unit!19514)))

(declare-fun arrayRangesEq!1216 (array!16019 array!16019 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278475 (arrayRangesEq!1216 a1!699 a2!699 (_1!12398 lt!416001) (_2!12398 lt!416001))))

(declare-fun lt!416000 () Unit!19511)

(declare-fun arrayRangesEqSymmetricLemma!135 (array!16019 array!16019 (_ BitVec 32) (_ BitVec 32)) Unit!19511)

(assert (=> b!278475 (= lt!416000 (arrayRangesEqSymmetricLemma!135 a1!699 a2!699 (_1!12398 lt!416001) (_2!12398 lt!416001)))))

(assert (=> b!278475 (arrayRangesEq!1216 a2!699 a1!699 (_1!12398 lt!416001) (_2!12398 lt!416001))))

(declare-fun b!278476 () Bool)

(assert (=> b!278476 (= e!198283 (bvsle (size!6930 a2!699) (size!6930 a1!699)))))

(assert (= (and start!62098 res!231231) b!278474))

(assert (= (and b!278474 res!231229) b!278473))

(assert (= (and b!278473 res!231228) b!278466))

(assert (= (and b!278466 c!12792) b!278475))

(assert (= (and b!278466 (not c!12792)) b!278472))

(assert (= (and b!278466 res!231226) b!278469))

(assert (= (and b!278469 res!231225) b!278467))

(assert (= (and b!278467 res!231230) b!278470))

(assert (= (and b!278470 (not res!231233)) b!278471))

(assert (= (and b!278469 (not res!231232)) b!278468))

(assert (= (and b!278468 (not res!231227)) b!278476))

(declare-fun m!411571 () Bool)

(assert (=> b!278469 m!411571))

(declare-fun m!411573 () Bool)

(assert (=> b!278469 m!411573))

(assert (=> b!278469 m!411571))

(assert (=> b!278469 m!411573))

(declare-fun m!411575 () Bool)

(assert (=> b!278469 m!411575))

(declare-fun m!411577 () Bool)

(assert (=> b!278468 m!411577))

(declare-fun m!411579 () Bool)

(assert (=> b!278468 m!411579))

(assert (=> b!278468 m!411577))

(assert (=> b!278468 m!411579))

(declare-fun m!411581 () Bool)

(assert (=> b!278468 m!411581))

(declare-fun m!411583 () Bool)

(assert (=> b!278474 m!411583))

(declare-fun m!411585 () Bool)

(assert (=> b!278475 m!411585))

(declare-fun m!411587 () Bool)

(assert (=> b!278475 m!411587))

(declare-fun m!411589 () Bool)

(assert (=> b!278475 m!411589))

(declare-fun m!411591 () Bool)

(assert (=> b!278466 m!411591))

(assert (=> b!278471 m!411579))

(assert (=> b!278471 m!411577))

(assert (=> b!278471 m!411579))

(assert (=> b!278471 m!411577))

(declare-fun m!411593 () Bool)

(assert (=> b!278471 m!411593))

(declare-fun m!411595 () Bool)

(assert (=> start!62098 m!411595))

(declare-fun m!411597 () Bool)

(assert (=> start!62098 m!411597))

(assert (=> b!278467 m!411573))

(assert (=> b!278467 m!411571))

(assert (=> b!278467 m!411573))

(assert (=> b!278467 m!411571))

(declare-fun m!411599 () Bool)

(assert (=> b!278467 m!411599))

(push 1)

(assert (not b!278466))

(assert (not b!278468))

(assert (not b!278475))

(assert (not b!278469))

(assert (not start!62098))

(assert (not b!278467))

(assert (not b!278471))

(assert (not b!278474))

(check-sat)

(pop 1)

(push 1)

(check-sat)


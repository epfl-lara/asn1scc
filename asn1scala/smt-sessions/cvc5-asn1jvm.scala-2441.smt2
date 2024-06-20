; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62094 () Bool)

(assert start!62094)

(declare-fun b!278400 () Bool)

(declare-datatypes ((Unit!19503 0))(
  ( (Unit!19504) )
))
(declare-fun e!198236 () Unit!19503)

(declare-fun Unit!19505 () Unit!19503)

(assert (=> b!278400 (= e!198236 Unit!19505)))

(declare-fun b!278401 () Bool)

(declare-fun e!198234 () Bool)

(declare-fun e!198237 () Bool)

(assert (=> b!278401 (= e!198234 e!198237)))

(declare-fun res!231172 () Bool)

(assert (=> b!278401 (=> res!231172 e!198237)))

(declare-fun lt!415968 () (_ BitVec 32))

(assert (=> b!278401 (= res!231172 (= lt!415968 #b00000000000000000000000000000000))))

(declare-fun b!278402 () Bool)

(declare-fun res!231178 () Bool)

(declare-fun e!198230 () Bool)

(assert (=> b!278402 (=> (not res!231178) (not e!198230))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278402 (= res!231178 (bvslt from!822 to!789))))

(declare-fun b!278403 () Bool)

(declare-fun res!231171 () Bool)

(assert (=> b!278403 (=> (not res!231171) (not e!198230))))

(declare-datatypes ((array!16015 0))(
  ( (array!16016 (arr!7924 (Array (_ BitVec 32) (_ BitVec 8))) (size!6928 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16015)

(declare-fun a2!699 () array!16015)

(declare-fun arrayBitRangesEq!0 (array!16015 array!16015 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278403 (= res!231171 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278405 () Bool)

(declare-datatypes ((tuple4!642 0))(
  ( (tuple4!643 (_1!12396 (_ BitVec 32)) (_2!12396 (_ BitVec 32)) (_3!1101 (_ BitVec 32)) (_4!321 (_ BitVec 32))) )
))
(declare-fun lt!415969 () tuple4!642)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278405 (= e!198237 (byteRangesEq!0 (select (arr!7924 a1!699) (_4!321 lt!415969)) (select (arr!7924 a2!699) (_4!321 lt!415969)) #b00000000000000000000000000000000 lt!415968))))

(declare-fun b!278406 () Bool)

(declare-fun res!231177 () Bool)

(assert (=> b!278406 (=> (not res!231177) (not e!198234))))

(declare-fun lt!415971 () (_ BitVec 32))

(assert (=> b!278406 (= res!231177 (byteRangesEq!0 (select (arr!7924 a2!699) (_3!1101 lt!415969)) (select (arr!7924 a1!699) (_3!1101 lt!415969)) lt!415971 #b00000000000000000000000000001000))))

(declare-fun b!278407 () Bool)

(declare-fun Unit!19506 () Unit!19503)

(assert (=> b!278407 (= e!198236 Unit!19506)))

(declare-fun arrayRangesEq!1214 (array!16015 array!16015 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278407 (arrayRangesEq!1214 a1!699 a2!699 (_1!12396 lt!415969) (_2!12396 lt!415969))))

(declare-fun lt!415970 () Unit!19503)

(declare-fun arrayRangesEqSymmetricLemma!133 (array!16015 array!16015 (_ BitVec 32) (_ BitVec 32)) Unit!19503)

(assert (=> b!278407 (= lt!415970 (arrayRangesEqSymmetricLemma!133 a1!699 a2!699 (_1!12396 lt!415969) (_2!12396 lt!415969)))))

(assert (=> b!278407 (arrayRangesEq!1214 a2!699 a1!699 (_1!12396 lt!415969) (_2!12396 lt!415969))))

(declare-fun b!278408 () Bool)

(declare-fun res!231175 () Bool)

(declare-fun e!198232 () Bool)

(assert (=> b!278408 (=> res!231175 e!198232)))

(assert (=> b!278408 (= res!231175 (not (byteRangesEq!0 (select (arr!7924 a2!699) (_4!321 lt!415969)) (select (arr!7924 a1!699) (_4!321 lt!415969)) #b00000000000000000000000000000000 lt!415968)))))

(declare-fun b!278409 () Bool)

(declare-fun e!198235 () Bool)

(assert (=> b!278409 (= e!198230 e!198235)))

(declare-fun res!231173 () Bool)

(assert (=> b!278409 (=> (not res!231173) (not e!198235))))

(assert (=> b!278409 (= res!231173 (not (= (_3!1101 lt!415969) (_4!321 lt!415969))))))

(declare-fun lt!415967 () Unit!19503)

(assert (=> b!278409 (= lt!415967 e!198236)))

(declare-fun c!12786 () Bool)

(assert (=> b!278409 (= c!12786 (bvslt (_1!12396 lt!415969) (_2!12396 lt!415969)))))

(assert (=> b!278409 (= lt!415968 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278409 (= lt!415971 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!642)

(assert (=> b!278409 (= lt!415969 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278410 () Bool)

(assert (=> b!278410 (= e!198232 (bvsle (size!6928 a2!699) (size!6928 a1!699)))))

(declare-fun res!231179 () Bool)

(assert (=> start!62094 (=> (not res!231179) (not e!198230))))

(assert (=> start!62094 (= res!231179 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6928 a1!699) (size!6928 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6928 a1!699))))))))

(assert (=> start!62094 e!198230))

(assert (=> start!62094 true))

(declare-fun array_inv!6652 (array!16015) Bool)

(assert (=> start!62094 (array_inv!6652 a1!699)))

(assert (=> start!62094 (array_inv!6652 a2!699)))

(declare-fun b!278404 () Bool)

(assert (=> b!278404 (= e!198235 (not e!198232))))

(declare-fun res!231174 () Bool)

(assert (=> b!278404 (=> res!231174 e!198232)))

(assert (=> b!278404 (= res!231174 (= lt!415968 #b00000000000000000000000000000000))))

(assert (=> b!278404 e!198234))

(declare-fun res!231176 () Bool)

(assert (=> b!278404 (=> (not res!231176) (not e!198234))))

(assert (=> b!278404 (= res!231176 (byteRangesEq!0 (select (arr!7924 a1!699) (_3!1101 lt!415969)) (select (arr!7924 a2!699) (_3!1101 lt!415969)) lt!415971 #b00000000000000000000000000001000))))

(assert (= (and start!62094 res!231179) b!278403))

(assert (= (and b!278403 res!231171) b!278402))

(assert (= (and b!278402 res!231178) b!278409))

(assert (= (and b!278409 c!12786) b!278407))

(assert (= (and b!278409 (not c!12786)) b!278400))

(assert (= (and b!278409 res!231173) b!278404))

(assert (= (and b!278404 res!231176) b!278406))

(assert (= (and b!278406 res!231177) b!278401))

(assert (= (and b!278401 (not res!231172)) b!278405))

(assert (= (and b!278404 (not res!231174)) b!278408))

(assert (= (and b!278408 (not res!231175)) b!278410))

(declare-fun m!411511 () Bool)

(assert (=> b!278405 m!411511))

(declare-fun m!411513 () Bool)

(assert (=> b!278405 m!411513))

(assert (=> b!278405 m!411511))

(assert (=> b!278405 m!411513))

(declare-fun m!411515 () Bool)

(assert (=> b!278405 m!411515))

(declare-fun m!411517 () Bool)

(assert (=> b!278407 m!411517))

(declare-fun m!411519 () Bool)

(assert (=> b!278407 m!411519))

(declare-fun m!411521 () Bool)

(assert (=> b!278407 m!411521))

(declare-fun m!411523 () Bool)

(assert (=> b!278403 m!411523))

(assert (=> b!278408 m!411513))

(assert (=> b!278408 m!411511))

(assert (=> b!278408 m!411513))

(assert (=> b!278408 m!411511))

(declare-fun m!411525 () Bool)

(assert (=> b!278408 m!411525))

(declare-fun m!411527 () Bool)

(assert (=> b!278409 m!411527))

(declare-fun m!411529 () Bool)

(assert (=> b!278404 m!411529))

(declare-fun m!411531 () Bool)

(assert (=> b!278404 m!411531))

(assert (=> b!278404 m!411529))

(assert (=> b!278404 m!411531))

(declare-fun m!411533 () Bool)

(assert (=> b!278404 m!411533))

(declare-fun m!411535 () Bool)

(assert (=> start!62094 m!411535))

(declare-fun m!411537 () Bool)

(assert (=> start!62094 m!411537))

(assert (=> b!278406 m!411531))

(assert (=> b!278406 m!411529))

(assert (=> b!278406 m!411531))

(assert (=> b!278406 m!411529))

(declare-fun m!411539 () Bool)

(assert (=> b!278406 m!411539))

(push 1)

(assert (not b!278408))

(assert (not b!278407))

(assert (not b!278405))

(assert (not b!278406))

(assert (not b!278409))

(assert (not b!278403))

(assert (not b!278404))

(assert (not start!62094))

(check-sat)

(pop 1)

(push 1)

(check-sat)


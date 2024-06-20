; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62088 () Bool)

(assert start!62088)

(declare-fun b!278315 () Bool)

(declare-fun res!231108 () Bool)

(declare-fun e!198165 () Bool)

(assert (=> b!278315 (=> (not res!231108) (not e!198165))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16009 0))(
  ( (array!16010 (arr!7921 (Array (_ BitVec 32) (_ BitVec 8))) (size!6925 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16009)

(declare-fun a2!699 () array!16009)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16009 array!16009 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278315 (= res!231108 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!231109 () Bool)

(assert (=> start!62088 (=> (not res!231109) (not e!198165))))

(assert (=> start!62088 (= res!231109 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6925 a1!699) (size!6925 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6925 a1!699))))))))

(assert (=> start!62088 e!198165))

(assert (=> start!62088 true))

(declare-fun array_inv!6649 (array!16009) Bool)

(assert (=> start!62088 (array_inv!6649 a1!699)))

(assert (=> start!62088 (array_inv!6649 a2!699)))

(declare-fun b!278316 () Bool)

(declare-fun e!198168 () Bool)

(declare-fun e!198171 () Bool)

(assert (=> b!278316 (= e!198168 e!198171)))

(declare-fun res!231106 () Bool)

(assert (=> b!278316 (=> res!231106 e!198171)))

(declare-fun lt!415924 () (_ BitVec 32))

(assert (=> b!278316 (= res!231106 (= lt!415924 #b00000000000000000000000000000000))))

(declare-fun b!278317 () Bool)

(declare-fun e!198167 () Bool)

(assert (=> b!278317 (= e!198165 e!198167)))

(declare-fun res!231110 () Bool)

(assert (=> b!278317 (=> (not res!231110) (not e!198167))))

(declare-datatypes ((tuple4!636 0))(
  ( (tuple4!637 (_1!12393 (_ BitVec 32)) (_2!12393 (_ BitVec 32)) (_3!1098 (_ BitVec 32)) (_4!318 (_ BitVec 32))) )
))
(declare-fun lt!415922 () tuple4!636)

(assert (=> b!278317 (= res!231110 (not (= (_3!1098 lt!415922) (_4!318 lt!415922))))))

(declare-datatypes ((Unit!19491 0))(
  ( (Unit!19492) )
))
(declare-fun lt!415926 () Unit!19491)

(declare-fun e!198169 () Unit!19491)

(assert (=> b!278317 (= lt!415926 e!198169)))

(declare-fun c!12777 () Bool)

(assert (=> b!278317 (= c!12777 (bvslt (_1!12393 lt!415922) (_2!12393 lt!415922)))))

(assert (=> b!278317 (= lt!415924 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415923 () (_ BitVec 32))

(assert (=> b!278317 (= lt!415923 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!636)

(assert (=> b!278317 (= lt!415922 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278318 () Bool)

(declare-fun res!231104 () Bool)

(assert (=> b!278318 (=> (not res!231104) (not e!198165))))

(assert (=> b!278318 (= res!231104 (bvslt from!822 to!789))))

(declare-fun b!278319 () Bool)

(declare-fun res!231105 () Bool)

(assert (=> b!278319 (=> (not res!231105) (not e!198168))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278319 (= res!231105 (byteRangesEq!0 (select (arr!7921 a2!699) (_3!1098 lt!415922)) (select (arr!7921 a1!699) (_3!1098 lt!415922)) lt!415923 #b00000000000000000000000000001000))))

(declare-fun b!278320 () Bool)

(declare-fun Unit!19493 () Unit!19491)

(assert (=> b!278320 (= e!198169 Unit!19493)))

(declare-fun arrayRangesEq!1211 (array!16009 array!16009 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278320 (arrayRangesEq!1211 a1!699 a2!699 (_1!12393 lt!415922) (_2!12393 lt!415922))))

(declare-fun lt!415925 () Unit!19491)

(declare-fun arrayRangesEqSymmetricLemma!130 (array!16009 array!16009 (_ BitVec 32) (_ BitVec 32)) Unit!19491)

(assert (=> b!278320 (= lt!415925 (arrayRangesEqSymmetricLemma!130 a1!699 a2!699 (_1!12393 lt!415922) (_2!12393 lt!415922)))))

(assert (=> b!278320 (arrayRangesEq!1211 a2!699 a1!699 (_1!12393 lt!415922) (_2!12393 lt!415922))))

(declare-fun b!278321 () Bool)

(assert (=> b!278321 (= e!198167 (not (or (= lt!415924 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 lt!415924) (bvsle lt!415924 #b00000000000000000000000000001000)))))))

(assert (=> b!278321 e!198168))

(declare-fun res!231107 () Bool)

(assert (=> b!278321 (=> (not res!231107) (not e!198168))))

(assert (=> b!278321 (= res!231107 (byteRangesEq!0 (select (arr!7921 a1!699) (_3!1098 lt!415922)) (select (arr!7921 a2!699) (_3!1098 lt!415922)) lt!415923 #b00000000000000000000000000001000))))

(declare-fun b!278322 () Bool)

(assert (=> b!278322 (= e!198171 (byteRangesEq!0 (select (arr!7921 a1!699) (_4!318 lt!415922)) (select (arr!7921 a2!699) (_4!318 lt!415922)) #b00000000000000000000000000000000 lt!415924))))

(declare-fun b!278323 () Bool)

(declare-fun Unit!19494 () Unit!19491)

(assert (=> b!278323 (= e!198169 Unit!19494)))

(assert (= (and start!62088 res!231109) b!278315))

(assert (= (and b!278315 res!231108) b!278318))

(assert (= (and b!278318 res!231104) b!278317))

(assert (= (and b!278317 c!12777) b!278320))

(assert (= (and b!278317 (not c!12777)) b!278323))

(assert (= (and b!278317 res!231110) b!278321))

(assert (= (and b!278321 res!231107) b!278319))

(assert (= (and b!278319 res!231105) b!278316))

(assert (= (and b!278316 (not res!231106)) b!278322))

(declare-fun m!411427 () Bool)

(assert (=> b!278315 m!411427))

(declare-fun m!411429 () Bool)

(assert (=> b!278322 m!411429))

(declare-fun m!411431 () Bool)

(assert (=> b!278322 m!411431))

(assert (=> b!278322 m!411429))

(assert (=> b!278322 m!411431))

(declare-fun m!411433 () Bool)

(assert (=> b!278322 m!411433))

(declare-fun m!411435 () Bool)

(assert (=> start!62088 m!411435))

(declare-fun m!411437 () Bool)

(assert (=> start!62088 m!411437))

(declare-fun m!411439 () Bool)

(assert (=> b!278317 m!411439))

(declare-fun m!411441 () Bool)

(assert (=> b!278321 m!411441))

(declare-fun m!411443 () Bool)

(assert (=> b!278321 m!411443))

(assert (=> b!278321 m!411441))

(assert (=> b!278321 m!411443))

(declare-fun m!411445 () Bool)

(assert (=> b!278321 m!411445))

(declare-fun m!411447 () Bool)

(assert (=> b!278320 m!411447))

(declare-fun m!411449 () Bool)

(assert (=> b!278320 m!411449))

(declare-fun m!411451 () Bool)

(assert (=> b!278320 m!411451))

(assert (=> b!278319 m!411443))

(assert (=> b!278319 m!411441))

(assert (=> b!278319 m!411443))

(assert (=> b!278319 m!411441))

(declare-fun m!411453 () Bool)

(assert (=> b!278319 m!411453))

(push 1)

(assert (not b!278317))

(assert (not start!62088))

(assert (not b!278320))

(assert (not b!278315))

(assert (not b!278321))

(assert (not b!278319))

(assert (not b!278322))

(check-sat)

(pop 1)

(push 1)

(check-sat)


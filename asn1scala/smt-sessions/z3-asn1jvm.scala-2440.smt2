; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62090 () Bool)

(assert start!62090)

(declare-fun lt!415939 () (_ BitVec 32))

(declare-datatypes ((tuple4!638 0))(
  ( (tuple4!639 (_1!12394 (_ BitVec 32)) (_2!12394 (_ BitVec 32)) (_3!1099 (_ BitVec 32)) (_4!319 (_ BitVec 32))) )
))
(declare-fun lt!415937 () tuple4!638)

(declare-fun e!198188 () Bool)

(declare-datatypes ((array!16011 0))(
  ( (array!16012 (arr!7922 (Array (_ BitVec 32) (_ BitVec 8))) (size!6926 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16011)

(declare-fun b!278342 () Bool)

(declare-fun a2!699 () array!16011)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278342 (= e!198188 (byteRangesEq!0 (select (arr!7922 a1!699) (_4!319 lt!415937)) (select (arr!7922 a2!699) (_4!319 lt!415937)) #b00000000000000000000000000000000 lt!415939))))

(declare-fun b!278344 () Bool)

(declare-fun res!231128 () Bool)

(declare-fun e!198190 () Bool)

(assert (=> b!278344 (=> (not res!231128) (not e!198190))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278344 (= res!231128 (bvslt from!822 to!789))))

(declare-fun b!278345 () Bool)

(declare-datatypes ((Unit!19495 0))(
  ( (Unit!19496) )
))
(declare-fun e!198192 () Unit!19495)

(declare-fun Unit!19497 () Unit!19495)

(assert (=> b!278345 (= e!198192 Unit!19497)))

(declare-fun arrayRangesEq!1212 (array!16011 array!16011 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278345 (arrayRangesEq!1212 a1!699 a2!699 (_1!12394 lt!415937) (_2!12394 lt!415937))))

(declare-fun lt!415941 () Unit!19495)

(declare-fun arrayRangesEqSymmetricLemma!131 (array!16011 array!16011 (_ BitVec 32) (_ BitVec 32)) Unit!19495)

(assert (=> b!278345 (= lt!415941 (arrayRangesEqSymmetricLemma!131 a1!699 a2!699 (_1!12394 lt!415937) (_2!12394 lt!415937)))))

(assert (=> b!278345 (arrayRangesEq!1212 a2!699 a1!699 (_1!12394 lt!415937) (_2!12394 lt!415937))))

(declare-fun b!278346 () Bool)

(declare-fun Unit!19498 () Unit!19495)

(assert (=> b!278346 (= e!198192 Unit!19498)))

(declare-fun b!278347 () Bool)

(declare-fun res!231130 () Bool)

(declare-fun e!198189 () Bool)

(assert (=> b!278347 (=> (not res!231130) (not e!198189))))

(declare-fun lt!415938 () (_ BitVec 32))

(assert (=> b!278347 (= res!231130 (byteRangesEq!0 (select (arr!7922 a2!699) (_3!1099 lt!415937)) (select (arr!7922 a1!699) (_3!1099 lt!415937)) lt!415938 #b00000000000000000000000000001000))))

(declare-fun b!278348 () Bool)

(assert (=> b!278348 (= e!198189 e!198188)))

(declare-fun res!231127 () Bool)

(assert (=> b!278348 (=> res!231127 e!198188)))

(assert (=> b!278348 (= res!231127 (= lt!415939 #b00000000000000000000000000000000))))

(declare-fun b!278349 () Bool)

(declare-fun e!198191 () Bool)

(assert (=> b!278349 (= e!198191 (not (or (= lt!415939 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 lt!415939) (bvsle lt!415939 #b00000000000000000000000000001000)))))))

(assert (=> b!278349 e!198189))

(declare-fun res!231125 () Bool)

(assert (=> b!278349 (=> (not res!231125) (not e!198189))))

(assert (=> b!278349 (= res!231125 (byteRangesEq!0 (select (arr!7922 a1!699) (_3!1099 lt!415937)) (select (arr!7922 a2!699) (_3!1099 lt!415937)) lt!415938 #b00000000000000000000000000001000))))

(declare-fun b!278350 () Bool)

(assert (=> b!278350 (= e!198190 e!198191)))

(declare-fun res!231131 () Bool)

(assert (=> b!278350 (=> (not res!231131) (not e!198191))))

(assert (=> b!278350 (= res!231131 (not (= (_3!1099 lt!415937) (_4!319 lt!415937))))))

(declare-fun lt!415940 () Unit!19495)

(assert (=> b!278350 (= lt!415940 e!198192)))

(declare-fun c!12780 () Bool)

(assert (=> b!278350 (= c!12780 (bvslt (_1!12394 lt!415937) (_2!12394 lt!415937)))))

(assert (=> b!278350 (= lt!415939 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278350 (= lt!415938 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!638)

(assert (=> b!278350 (= lt!415937 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278343 () Bool)

(declare-fun res!231129 () Bool)

(assert (=> b!278343 (=> (not res!231129) (not e!198190))))

(declare-fun arrayBitRangesEq!0 (array!16011 array!16011 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278343 (= res!231129 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!231126 () Bool)

(assert (=> start!62090 (=> (not res!231126) (not e!198190))))

(assert (=> start!62090 (= res!231126 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6926 a1!699) (size!6926 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6926 a1!699))))))))

(assert (=> start!62090 e!198190))

(assert (=> start!62090 true))

(declare-fun array_inv!6650 (array!16011) Bool)

(assert (=> start!62090 (array_inv!6650 a1!699)))

(assert (=> start!62090 (array_inv!6650 a2!699)))

(assert (= (and start!62090 res!231126) b!278343))

(assert (= (and b!278343 res!231129) b!278344))

(assert (= (and b!278344 res!231128) b!278350))

(assert (= (and b!278350 c!12780) b!278345))

(assert (= (and b!278350 (not c!12780)) b!278346))

(assert (= (and b!278350 res!231131) b!278349))

(assert (= (and b!278349 res!231125) b!278347))

(assert (= (and b!278347 res!231130) b!278348))

(assert (= (and b!278348 (not res!231127)) b!278342))

(declare-fun m!411455 () Bool)

(assert (=> b!278350 m!411455))

(declare-fun m!411457 () Bool)

(assert (=> b!278342 m!411457))

(declare-fun m!411459 () Bool)

(assert (=> b!278342 m!411459))

(assert (=> b!278342 m!411457))

(assert (=> b!278342 m!411459))

(declare-fun m!411461 () Bool)

(assert (=> b!278342 m!411461))

(declare-fun m!411463 () Bool)

(assert (=> b!278345 m!411463))

(declare-fun m!411465 () Bool)

(assert (=> b!278345 m!411465))

(declare-fun m!411467 () Bool)

(assert (=> b!278345 m!411467))

(declare-fun m!411469 () Bool)

(assert (=> b!278349 m!411469))

(declare-fun m!411471 () Bool)

(assert (=> b!278349 m!411471))

(assert (=> b!278349 m!411469))

(assert (=> b!278349 m!411471))

(declare-fun m!411473 () Bool)

(assert (=> b!278349 m!411473))

(declare-fun m!411475 () Bool)

(assert (=> b!278343 m!411475))

(declare-fun m!411477 () Bool)

(assert (=> start!62090 m!411477))

(declare-fun m!411479 () Bool)

(assert (=> start!62090 m!411479))

(assert (=> b!278347 m!411471))

(assert (=> b!278347 m!411469))

(assert (=> b!278347 m!411471))

(assert (=> b!278347 m!411469))

(declare-fun m!411481 () Bool)

(assert (=> b!278347 m!411481))

(check-sat (not b!278345) (not start!62090) (not b!278350) (not b!278347) (not b!278349) (not b!278343) (not b!278342))
(check-sat)

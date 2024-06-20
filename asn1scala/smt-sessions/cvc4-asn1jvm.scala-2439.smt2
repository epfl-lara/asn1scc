; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62086 () Bool)

(assert start!62086)

(declare-fun res!231088 () Bool)

(declare-fun e!198149 () Bool)

(assert (=> start!62086 (=> (not res!231088) (not e!198149))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16007 0))(
  ( (array!16008 (arr!7920 (Array (_ BitVec 32) (_ BitVec 8))) (size!6924 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16007)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a1!699 () array!16007)

(assert (=> start!62086 (= res!231088 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6924 a1!699) (size!6924 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6924 a1!699))))))))

(assert (=> start!62086 e!198149))

(assert (=> start!62086 true))

(declare-fun array_inv!6648 (array!16007) Bool)

(assert (=> start!62086 (array_inv!6648 a1!699)))

(assert (=> start!62086 (array_inv!6648 a2!699)))

(declare-fun b!278290 () Bool)

(declare-fun res!231086 () Bool)

(assert (=> b!278290 (=> (not res!231086) (not e!198149))))

(declare-fun arrayBitRangesEq!0 (array!16007 array!16007 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278290 (= res!231086 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278291 () Bool)

(declare-fun e!198145 () Bool)

(declare-fun lt!415908 () (_ BitVec 32))

(assert (=> b!278291 (= e!198145 (not (or (= lt!415908 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 lt!415908) (bvsle lt!415908 #b00000000000000000000000000001000)))))))

(declare-fun e!198146 () Bool)

(assert (=> b!278291 e!198146))

(declare-fun res!231087 () Bool)

(assert (=> b!278291 (=> (not res!231087) (not e!198146))))

(declare-datatypes ((tuple4!634 0))(
  ( (tuple4!635 (_1!12392 (_ BitVec 32)) (_2!12392 (_ BitVec 32)) (_3!1097 (_ BitVec 32)) (_4!317 (_ BitVec 32))) )
))
(declare-fun lt!415907 () tuple4!634)

(declare-fun lt!415911 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278291 (= res!231087 (byteRangesEq!0 (select (arr!7920 a1!699) (_3!1097 lt!415907)) (select (arr!7920 a2!699) (_3!1097 lt!415907)) lt!415911 #b00000000000000000000000000001000))))

(declare-fun b!278292 () Bool)

(assert (=> b!278292 (= e!198149 e!198145)))

(declare-fun res!231085 () Bool)

(assert (=> b!278292 (=> (not res!231085) (not e!198145))))

(assert (=> b!278292 (= res!231085 (not (= (_3!1097 lt!415907) (_4!317 lt!415907))))))

(declare-datatypes ((Unit!19487 0))(
  ( (Unit!19488) )
))
(declare-fun lt!415910 () Unit!19487)

(declare-fun e!198150 () Unit!19487)

(assert (=> b!278292 (= lt!415910 e!198150)))

(declare-fun c!12774 () Bool)

(assert (=> b!278292 (= c!12774 (bvslt (_1!12392 lt!415907) (_2!12392 lt!415907)))))

(assert (=> b!278292 (= lt!415908 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278292 (= lt!415911 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!634)

(assert (=> b!278292 (= lt!415907 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278293 () Bool)

(declare-fun res!231089 () Bool)

(assert (=> b!278293 (=> (not res!231089) (not e!198149))))

(assert (=> b!278293 (= res!231089 (bvslt from!822 to!789))))

(declare-fun b!278294 () Bool)

(declare-fun Unit!19489 () Unit!19487)

(assert (=> b!278294 (= e!198150 Unit!19489)))

(declare-fun arrayRangesEq!1210 (array!16007 array!16007 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278294 (arrayRangesEq!1210 a1!699 a2!699 (_1!12392 lt!415907) (_2!12392 lt!415907))))

(declare-fun lt!415909 () Unit!19487)

(declare-fun arrayRangesEqSymmetricLemma!129 (array!16007 array!16007 (_ BitVec 32) (_ BitVec 32)) Unit!19487)

(assert (=> b!278294 (= lt!415909 (arrayRangesEqSymmetricLemma!129 a1!699 a2!699 (_1!12392 lt!415907) (_2!12392 lt!415907)))))

(assert (=> b!278294 (arrayRangesEq!1210 a2!699 a1!699 (_1!12392 lt!415907) (_2!12392 lt!415907))))

(declare-fun b!278295 () Bool)

(assert (=> b!278295 (= e!198146 (byteRangesEq!0 (select (arr!7920 a2!699) (_3!1097 lt!415907)) (select (arr!7920 a1!699) (_3!1097 lt!415907)) lt!415911 #b00000000000000000000000000001000))))

(declare-fun b!278296 () Bool)

(declare-fun Unit!19490 () Unit!19487)

(assert (=> b!278296 (= e!198150 Unit!19490)))

(assert (= (and start!62086 res!231088) b!278290))

(assert (= (and b!278290 res!231086) b!278293))

(assert (= (and b!278293 res!231089) b!278292))

(assert (= (and b!278292 c!12774) b!278294))

(assert (= (and b!278292 (not c!12774)) b!278296))

(assert (= (and b!278292 res!231085) b!278291))

(assert (= (and b!278291 res!231087) b!278295))

(declare-fun m!411405 () Bool)

(assert (=> b!278295 m!411405))

(declare-fun m!411407 () Bool)

(assert (=> b!278295 m!411407))

(assert (=> b!278295 m!411405))

(assert (=> b!278295 m!411407))

(declare-fun m!411409 () Bool)

(assert (=> b!278295 m!411409))

(declare-fun m!411411 () Bool)

(assert (=> b!278292 m!411411))

(declare-fun m!411413 () Bool)

(assert (=> start!62086 m!411413))

(declare-fun m!411415 () Bool)

(assert (=> start!62086 m!411415))

(assert (=> b!278291 m!411407))

(assert (=> b!278291 m!411405))

(assert (=> b!278291 m!411407))

(assert (=> b!278291 m!411405))

(declare-fun m!411417 () Bool)

(assert (=> b!278291 m!411417))

(declare-fun m!411419 () Bool)

(assert (=> b!278294 m!411419))

(declare-fun m!411421 () Bool)

(assert (=> b!278294 m!411421))

(declare-fun m!411423 () Bool)

(assert (=> b!278294 m!411423))

(declare-fun m!411425 () Bool)

(assert (=> b!278290 m!411425))

(push 1)

(assert (not b!278292))

(assert (not b!278290))

(assert (not b!278291))

(assert (not b!278295))

(assert (not b!278294))

(assert (not start!62086))

(check-sat)

(pop 1)

(push 1)

(check-sat)


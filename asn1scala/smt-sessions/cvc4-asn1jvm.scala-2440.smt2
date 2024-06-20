; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62092 () Bool)

(assert start!62092)

(declare-fun b!278369 () Bool)

(declare-fun e!198210 () Bool)

(declare-fun e!198208 () Bool)

(assert (=> b!278369 (= e!198210 e!198208)))

(declare-fun res!231151 () Bool)

(assert (=> b!278369 (=> (not res!231151) (not e!198208))))

(declare-datatypes ((tuple4!640 0))(
  ( (tuple4!641 (_1!12395 (_ BitVec 32)) (_2!12395 (_ BitVec 32)) (_3!1100 (_ BitVec 32)) (_4!320 (_ BitVec 32))) )
))
(declare-fun lt!415952 () tuple4!640)

(assert (=> b!278369 (= res!231151 (not (= (_3!1100 lt!415952) (_4!320 lt!415952))))))

(declare-datatypes ((Unit!19499 0))(
  ( (Unit!19500) )
))
(declare-fun lt!415956 () Unit!19499)

(declare-fun e!198211 () Unit!19499)

(assert (=> b!278369 (= lt!415956 e!198211)))

(declare-fun c!12783 () Bool)

(assert (=> b!278369 (= c!12783 (bvslt (_1!12395 lt!415952) (_2!12395 lt!415952)))))

(declare-fun lt!415955 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278369 (= lt!415955 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415953 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278369 (= lt!415953 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!640)

(assert (=> b!278369 (= lt!415952 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278370 () Bool)

(declare-fun res!231147 () Bool)

(assert (=> b!278370 (=> (not res!231147) (not e!198210))))

(assert (=> b!278370 (= res!231147 (bvslt from!822 to!789))))

(declare-fun b!278371 () Bool)

(declare-fun Unit!19501 () Unit!19499)

(assert (=> b!278371 (= e!198211 Unit!19501)))

(declare-datatypes ((array!16013 0))(
  ( (array!16014 (arr!7923 (Array (_ BitVec 32) (_ BitVec 8))) (size!6927 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16013)

(declare-fun a2!699 () array!16013)

(declare-fun arrayRangesEq!1213 (array!16013 array!16013 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278371 (arrayRangesEq!1213 a1!699 a2!699 (_1!12395 lt!415952) (_2!12395 lt!415952))))

(declare-fun lt!415954 () Unit!19499)

(declare-fun arrayRangesEqSymmetricLemma!132 (array!16013 array!16013 (_ BitVec 32) (_ BitVec 32)) Unit!19499)

(assert (=> b!278371 (= lt!415954 (arrayRangesEqSymmetricLemma!132 a1!699 a2!699 (_1!12395 lt!415952) (_2!12395 lt!415952)))))

(assert (=> b!278371 (arrayRangesEq!1213 a2!699 a1!699 (_1!12395 lt!415952) (_2!12395 lt!415952))))

(declare-fun res!231152 () Bool)

(assert (=> start!62092 (=> (not res!231152) (not e!198210))))

(assert (=> start!62092 (= res!231152 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6927 a1!699) (size!6927 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6927 a1!699))))))))

(assert (=> start!62092 e!198210))

(assert (=> start!62092 true))

(declare-fun array_inv!6651 (array!16013) Bool)

(assert (=> start!62092 (array_inv!6651 a1!699)))

(assert (=> start!62092 (array_inv!6651 a2!699)))

(declare-fun b!278372 () Bool)

(declare-fun Unit!19502 () Unit!19499)

(assert (=> b!278372 (= e!198211 Unit!19502)))

(declare-fun e!198213 () Bool)

(declare-fun b!278373 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278373 (= e!198213 (byteRangesEq!0 (select (arr!7923 a1!699) (_4!320 lt!415952)) (select (arr!7923 a2!699) (_4!320 lt!415952)) #b00000000000000000000000000000000 lt!415955))))

(declare-fun b!278374 () Bool)

(declare-fun res!231146 () Bool)

(declare-fun e!198209 () Bool)

(assert (=> b!278374 (=> (not res!231146) (not e!198209))))

(assert (=> b!278374 (= res!231146 (byteRangesEq!0 (select (arr!7923 a2!699) (_3!1100 lt!415952)) (select (arr!7923 a1!699) (_3!1100 lt!415952)) lt!415953 #b00000000000000000000000000001000))))

(declare-fun b!278375 () Bool)

(assert (=> b!278375 (= e!198209 e!198213)))

(declare-fun res!231148 () Bool)

(assert (=> b!278375 (=> res!231148 e!198213)))

(assert (=> b!278375 (= res!231148 (= lt!415955 #b00000000000000000000000000000000))))

(declare-fun b!278376 () Bool)

(assert (=> b!278376 (= e!198208 (not (or (= lt!415955 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 lt!415955) (bvsle lt!415955 #b00000000000000000000000000001000)))))))

(assert (=> b!278376 e!198209))

(declare-fun res!231150 () Bool)

(assert (=> b!278376 (=> (not res!231150) (not e!198209))))

(assert (=> b!278376 (= res!231150 (byteRangesEq!0 (select (arr!7923 a1!699) (_3!1100 lt!415952)) (select (arr!7923 a2!699) (_3!1100 lt!415952)) lt!415953 #b00000000000000000000000000001000))))

(declare-fun b!278377 () Bool)

(declare-fun res!231149 () Bool)

(assert (=> b!278377 (=> (not res!231149) (not e!198210))))

(declare-fun arrayBitRangesEq!0 (array!16013 array!16013 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278377 (= res!231149 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62092 res!231152) b!278377))

(assert (= (and b!278377 res!231149) b!278370))

(assert (= (and b!278370 res!231147) b!278369))

(assert (= (and b!278369 c!12783) b!278371))

(assert (= (and b!278369 (not c!12783)) b!278372))

(assert (= (and b!278369 res!231151) b!278376))

(assert (= (and b!278376 res!231150) b!278374))

(assert (= (and b!278374 res!231146) b!278375))

(assert (= (and b!278375 (not res!231148)) b!278373))

(declare-fun m!411483 () Bool)

(assert (=> b!278371 m!411483))

(declare-fun m!411485 () Bool)

(assert (=> b!278371 m!411485))

(declare-fun m!411487 () Bool)

(assert (=> b!278371 m!411487))

(declare-fun m!411489 () Bool)

(assert (=> b!278374 m!411489))

(declare-fun m!411491 () Bool)

(assert (=> b!278374 m!411491))

(assert (=> b!278374 m!411489))

(assert (=> b!278374 m!411491))

(declare-fun m!411493 () Bool)

(assert (=> b!278374 m!411493))

(assert (=> b!278376 m!411491))

(assert (=> b!278376 m!411489))

(assert (=> b!278376 m!411491))

(assert (=> b!278376 m!411489))

(declare-fun m!411495 () Bool)

(assert (=> b!278376 m!411495))

(declare-fun m!411497 () Bool)

(assert (=> b!278377 m!411497))

(declare-fun m!411499 () Bool)

(assert (=> b!278373 m!411499))

(declare-fun m!411501 () Bool)

(assert (=> b!278373 m!411501))

(assert (=> b!278373 m!411499))

(assert (=> b!278373 m!411501))

(declare-fun m!411503 () Bool)

(assert (=> b!278373 m!411503))

(declare-fun m!411505 () Bool)

(assert (=> start!62092 m!411505))

(declare-fun m!411507 () Bool)

(assert (=> start!62092 m!411507))

(declare-fun m!411509 () Bool)

(assert (=> b!278369 m!411509))

(push 1)

(assert (not b!278371))

(assert (not b!278377))

(assert (not b!278376))

(assert (not start!62092))

(assert (not b!278374))

(assert (not b!278369))

(assert (not b!278373))

(check-sat)

(pop 1)

(push 1)

(check-sat)


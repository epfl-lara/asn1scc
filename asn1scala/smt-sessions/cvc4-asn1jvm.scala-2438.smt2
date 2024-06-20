; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62080 () Bool)

(assert start!62080)

(declare-fun res!231043 () Bool)

(declare-fun e!198093 () Bool)

(assert (=> start!62080 (=> (not res!231043) (not e!198093))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16001 0))(
  ( (array!16002 (arr!7917 (Array (_ BitVec 32) (_ BitVec 8))) (size!6921 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16001)

(declare-fun a2!699 () array!16001)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62080 (= res!231043 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6921 a1!699) (size!6921 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6921 a1!699))))))))

(assert (=> start!62080 e!198093))

(assert (=> start!62080 true))

(declare-fun array_inv!6645 (array!16001) Bool)

(assert (=> start!62080 (array_inv!6645 a1!699)))

(assert (=> start!62080 (array_inv!6645 a2!699)))

(declare-fun b!278228 () Bool)

(declare-datatypes ((Unit!19475 0))(
  ( (Unit!19476) )
))
(declare-fun e!198096 () Unit!19475)

(declare-fun Unit!19477 () Unit!19475)

(assert (=> b!278228 (= e!198096 Unit!19477)))

(declare-datatypes ((tuple4!628 0))(
  ( (tuple4!629 (_1!12389 (_ BitVec 32)) (_2!12389 (_ BitVec 32)) (_3!1094 (_ BitVec 32)) (_4!314 (_ BitVec 32))) )
))
(declare-fun lt!415864 () tuple4!628)

(declare-fun arrayRangesEq!1207 (array!16001 array!16001 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278228 (arrayRangesEq!1207 a1!699 a2!699 (_1!12389 lt!415864) (_2!12389 lt!415864))))

(declare-fun lt!415865 () Unit!19475)

(declare-fun arrayRangesEqSymmetricLemma!126 (array!16001 array!16001 (_ BitVec 32) (_ BitVec 32)) Unit!19475)

(assert (=> b!278228 (= lt!415865 (arrayRangesEqSymmetricLemma!126 a1!699 a2!699 (_1!12389 lt!415864) (_2!12389 lt!415864)))))

(assert (=> b!278228 (arrayRangesEq!1207 a2!699 a1!699 (_1!12389 lt!415864) (_2!12389 lt!415864))))

(declare-fun b!278229 () Bool)

(declare-fun res!231041 () Bool)

(assert (=> b!278229 (=> (not res!231041) (not e!198093))))

(declare-fun arrayBitRangesEq!0 (array!16001 array!16001 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278229 (= res!231041 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278230 () Bool)

(declare-fun res!231042 () Bool)

(assert (=> b!278230 (=> (not res!231042) (not e!198093))))

(assert (=> b!278230 (= res!231042 (bvslt from!822 to!789))))

(declare-fun b!278231 () Bool)

(declare-fun Unit!19478 () Unit!19475)

(assert (=> b!278231 (= e!198096 Unit!19478)))

(declare-fun b!278232 () Bool)

(declare-fun e!198095 () Bool)

(assert (=> b!278232 (= e!198093 e!198095)))

(declare-fun res!231044 () Bool)

(assert (=> b!278232 (=> (not res!231044) (not e!198095))))

(assert (=> b!278232 (= res!231044 (not (= (_3!1094 lt!415864) (_4!314 lt!415864))))))

(declare-fun lt!415863 () Unit!19475)

(assert (=> b!278232 (= lt!415863 e!198096)))

(declare-fun c!12765 () Bool)

(assert (=> b!278232 (= c!12765 (bvslt (_1!12389 lt!415864) (_2!12389 lt!415864)))))

(declare-fun lt!415866 () (_ BitVec 32))

(assert (=> b!278232 (= lt!415866 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!628)

(assert (=> b!278232 (= lt!415864 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278233 () Bool)

(assert (=> b!278233 (= e!198095 (not (and (bvsle #b00000000000000000000000000000000 lt!415866) (bvsle lt!415866 #b00000000000000000000000000001000))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278233 (byteRangesEq!0 (select (arr!7917 a1!699) (_3!1094 lt!415864)) (select (arr!7917 a2!699) (_3!1094 lt!415864)) lt!415866 #b00000000000000000000000000001000)))

(assert (= (and start!62080 res!231043) b!278229))

(assert (= (and b!278229 res!231041) b!278230))

(assert (= (and b!278230 res!231042) b!278232))

(assert (= (and b!278232 c!12765) b!278228))

(assert (= (and b!278232 (not c!12765)) b!278231))

(assert (= (and b!278232 res!231044) b!278233))

(declare-fun m!411341 () Bool)

(assert (=> b!278229 m!411341))

(declare-fun m!411343 () Bool)

(assert (=> b!278233 m!411343))

(declare-fun m!411345 () Bool)

(assert (=> b!278233 m!411345))

(assert (=> b!278233 m!411343))

(assert (=> b!278233 m!411345))

(declare-fun m!411347 () Bool)

(assert (=> b!278233 m!411347))

(declare-fun m!411349 () Bool)

(assert (=> start!62080 m!411349))

(declare-fun m!411351 () Bool)

(assert (=> start!62080 m!411351))

(declare-fun m!411353 () Bool)

(assert (=> b!278228 m!411353))

(declare-fun m!411355 () Bool)

(assert (=> b!278228 m!411355))

(declare-fun m!411357 () Bool)

(assert (=> b!278228 m!411357))

(declare-fun m!411359 () Bool)

(assert (=> b!278232 m!411359))

(push 1)

(assert (not b!278228))

(assert (not b!278233))

(assert (not start!62080))

(assert (not b!278232))

(assert (not b!278229))

(check-sat)

(pop 1)

(push 1)

(check-sat)


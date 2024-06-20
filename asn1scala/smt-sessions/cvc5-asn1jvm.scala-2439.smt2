; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62082 () Bool)

(assert start!62082)

(declare-fun b!278248 () Bool)

(declare-datatypes ((Unit!19479 0))(
  ( (Unit!19480) )
))
(declare-fun e!198114 () Unit!19479)

(declare-fun Unit!19481 () Unit!19479)

(assert (=> b!278248 (= e!198114 Unit!19481)))

(declare-datatypes ((array!16003 0))(
  ( (array!16004 (arr!7918 (Array (_ BitVec 32) (_ BitVec 8))) (size!6922 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16003)

(declare-fun a2!699 () array!16003)

(declare-datatypes ((tuple4!630 0))(
  ( (tuple4!631 (_1!12390 (_ BitVec 32)) (_2!12390 (_ BitVec 32)) (_3!1095 (_ BitVec 32)) (_4!315 (_ BitVec 32))) )
))
(declare-fun lt!415880 () tuple4!630)

(declare-fun arrayRangesEq!1208 (array!16003 array!16003 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278248 (arrayRangesEq!1208 a1!699 a2!699 (_1!12390 lt!415880) (_2!12390 lt!415880))))

(declare-fun lt!415877 () Unit!19479)

(declare-fun arrayRangesEqSymmetricLemma!127 (array!16003 array!16003 (_ BitVec 32) (_ BitVec 32)) Unit!19479)

(assert (=> b!278248 (= lt!415877 (arrayRangesEqSymmetricLemma!127 a1!699 a2!699 (_1!12390 lt!415880) (_2!12390 lt!415880)))))

(assert (=> b!278248 (arrayRangesEq!1208 a2!699 a1!699 (_1!12390 lt!415880) (_2!12390 lt!415880))))

(declare-fun b!278249 () Bool)

(declare-fun e!198112 () Bool)

(declare-fun e!198113 () Bool)

(assert (=> b!278249 (= e!198112 e!198113)))

(declare-fun res!231055 () Bool)

(assert (=> b!278249 (=> (not res!231055) (not e!198113))))

(assert (=> b!278249 (= res!231055 (not (= (_3!1095 lt!415880) (_4!315 lt!415880))))))

(declare-fun lt!415881 () Unit!19479)

(assert (=> b!278249 (= lt!415881 e!198114)))

(declare-fun c!12768 () Bool)

(assert (=> b!278249 (= c!12768 (bvslt (_1!12390 lt!415880) (_2!12390 lt!415880)))))

(declare-fun lt!415879 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278249 (= lt!415879 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415878 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278249 (= lt!415878 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!630)

(assert (=> b!278249 (= lt!415880 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!231056 () Bool)

(assert (=> start!62082 (=> (not res!231056) (not e!198112))))

(assert (=> start!62082 (= res!231056 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6922 a1!699) (size!6922 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6922 a1!699))))))))

(assert (=> start!62082 e!198112))

(assert (=> start!62082 true))

(declare-fun array_inv!6646 (array!16003) Bool)

(assert (=> start!62082 (array_inv!6646 a1!699)))

(assert (=> start!62082 (array_inv!6646 a2!699)))

(declare-fun b!278250 () Bool)

(declare-fun res!231057 () Bool)

(assert (=> b!278250 (=> (not res!231057) (not e!198112))))

(declare-fun arrayBitRangesEq!0 (array!16003 array!16003 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278250 (= res!231057 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278251 () Bool)

(declare-fun e!198110 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278251 (= e!198110 (byteRangesEq!0 (select (arr!7918 a2!699) (_3!1095 lt!415880)) (select (arr!7918 a1!699) (_3!1095 lt!415880)) lt!415878 #b00000000000000000000000000001000))))

(declare-fun b!278252 () Bool)

(declare-fun Unit!19482 () Unit!19479)

(assert (=> b!278252 (= e!198114 Unit!19482)))

(declare-fun b!278253 () Bool)

(assert (=> b!278253 (= e!198113 (not (or (= lt!415879 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 lt!415879) (bvsle lt!415879 #b00000000000000000000000000001000)))))))

(assert (=> b!278253 e!198110))

(declare-fun res!231058 () Bool)

(assert (=> b!278253 (=> (not res!231058) (not e!198110))))

(assert (=> b!278253 (= res!231058 (byteRangesEq!0 (select (arr!7918 a1!699) (_3!1095 lt!415880)) (select (arr!7918 a2!699) (_3!1095 lt!415880)) lt!415878 #b00000000000000000000000000001000))))

(declare-fun b!278254 () Bool)

(declare-fun res!231059 () Bool)

(assert (=> b!278254 (=> (not res!231059) (not e!198112))))

(assert (=> b!278254 (= res!231059 (bvslt from!822 to!789))))

(assert (= (and start!62082 res!231056) b!278250))

(assert (= (and b!278250 res!231057) b!278254))

(assert (= (and b!278254 res!231059) b!278249))

(assert (= (and b!278249 c!12768) b!278248))

(assert (= (and b!278249 (not c!12768)) b!278252))

(assert (= (and b!278249 res!231055) b!278253))

(assert (= (and b!278253 res!231058) b!278251))

(declare-fun m!411361 () Bool)

(assert (=> b!278250 m!411361))

(declare-fun m!411363 () Bool)

(assert (=> b!278249 m!411363))

(declare-fun m!411365 () Bool)

(assert (=> b!278253 m!411365))

(declare-fun m!411367 () Bool)

(assert (=> b!278253 m!411367))

(assert (=> b!278253 m!411365))

(assert (=> b!278253 m!411367))

(declare-fun m!411369 () Bool)

(assert (=> b!278253 m!411369))

(declare-fun m!411371 () Bool)

(assert (=> b!278248 m!411371))

(declare-fun m!411373 () Bool)

(assert (=> b!278248 m!411373))

(declare-fun m!411375 () Bool)

(assert (=> b!278248 m!411375))

(declare-fun m!411377 () Bool)

(assert (=> start!62082 m!411377))

(declare-fun m!411379 () Bool)

(assert (=> start!62082 m!411379))

(assert (=> b!278251 m!411367))

(assert (=> b!278251 m!411365))

(assert (=> b!278251 m!411367))

(assert (=> b!278251 m!411365))

(declare-fun m!411381 () Bool)

(assert (=> b!278251 m!411381))

(push 1)

(assert (not b!278250))

(assert (not b!278248))

(assert (not b!278251))

(assert (not b!278249))

(assert (not start!62082))

(assert (not b!278253))

(check-sat)

(pop 1)

(push 1)

(check-sat)


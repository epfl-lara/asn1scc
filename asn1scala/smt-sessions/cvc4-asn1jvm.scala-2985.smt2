; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70148 () Bool)

(assert start!70148)

(declare-fun b!317463 () Bool)

(declare-fun res!260543 () Bool)

(declare-fun e!228069 () Bool)

(assert (=> b!317463 (=> (not res!260543) (not e!228069))))

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((array!19646 0))(
  ( (array!19647 (arr!9630 (Array (_ BitVec 32) (_ BitVec 8))) (size!8544 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19646)

(declare-fun a2!748 () array!19646)

(declare-fun bitAt!0 (array!19646 (_ BitVec 64)) Bool)

(assert (=> b!317463 (= res!260543 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun res!260547 () Bool)

(assert (=> start!70148 (=> (not res!260547) (not e!228069))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> start!70148 (= res!260547 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8544 a1!748) (size!8544 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8544 a1!748))))))))

(assert (=> start!70148 e!228069))

(assert (=> start!70148 true))

(declare-fun array_inv!8096 (array!19646) Bool)

(assert (=> start!70148 (array_inv!8096 a2!748)))

(assert (=> start!70148 (array_inv!8096 a1!748)))

(declare-fun b!317464 () Bool)

(declare-fun res!260549 () Bool)

(assert (=> b!317464 (=> (not res!260549) (not e!228069))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317464 (= res!260549 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317465 () Bool)

(declare-fun e!228070 () Bool)

(assert (=> b!317465 (= e!228069 (not e!228070))))

(declare-fun res!260548 () Bool)

(assert (=> b!317465 (=> res!260548 e!228070)))

(assert (=> b!317465 (= res!260548 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(declare-fun arrayBitRangesEq!0 (array!19646 array!19646 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317465 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21801 0))(
  ( (Unit!21802) )
))
(declare-fun lt!443202 () Unit!21801)

(declare-fun arrayBitRangesEqPrepend!0 (array!19646 array!19646 (_ BitVec 64) (_ BitVec 64)) Unit!21801)

(assert (=> b!317465 (= lt!443202 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317465 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443204 () Unit!21801)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19646 array!19646 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21801)

(assert (=> b!317465 (= lt!443204 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317466 () Bool)

(declare-fun res!260546 () Bool)

(assert (=> b!317466 (=> (not res!260546) (not e!228069))))

(assert (=> b!317466 (= res!260546 (not (= i!999 from!855)))))

(declare-fun b!317467 () Bool)

(declare-fun res!260545 () Bool)

(assert (=> b!317467 (=> (not res!260545) (not e!228069))))

(assert (=> b!317467 (= res!260545 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317468 () Bool)

(declare-fun res!260544 () Bool)

(assert (=> b!317468 (=> (not res!260544) (not e!228069))))

(assert (=> b!317468 (= res!260544 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317469 () Bool)

(assert (=> b!317469 (= e!228070 (bvsle from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317469 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443203 () Unit!21801)

(declare-fun rec!18 (array!19646 array!19646 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21801)

(assert (=> b!317469 (= lt!443203 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!70148 res!260547) b!317468))

(assert (= (and b!317468 res!260544) b!317463))

(assert (= (and b!317463 res!260543) b!317464))

(assert (= (and b!317464 res!260549) b!317467))

(assert (= (and b!317467 res!260545) b!317466))

(assert (= (and b!317466 res!260546) b!317465))

(assert (= (and b!317465 (not res!260548)) b!317469))

(declare-fun m!455505 () Bool)

(assert (=> start!70148 m!455505))

(declare-fun m!455507 () Bool)

(assert (=> start!70148 m!455507))

(declare-fun m!455509 () Bool)

(assert (=> b!317468 m!455509))

(declare-fun m!455511 () Bool)

(assert (=> b!317463 m!455511))

(declare-fun m!455513 () Bool)

(assert (=> b!317463 m!455513))

(declare-fun m!455515 () Bool)

(assert (=> b!317469 m!455515))

(declare-fun m!455517 () Bool)

(assert (=> b!317469 m!455517))

(declare-fun m!455519 () Bool)

(assert (=> b!317467 m!455519))

(declare-fun m!455521 () Bool)

(assert (=> b!317465 m!455521))

(declare-fun m!455523 () Bool)

(assert (=> b!317465 m!455523))

(declare-fun m!455525 () Bool)

(assert (=> b!317465 m!455525))

(declare-fun m!455527 () Bool)

(assert (=> b!317465 m!455527))

(declare-fun m!455529 () Bool)

(assert (=> b!317465 m!455529))

(push 1)

(assert (not b!317468))

(assert (not start!70148))

(assert (not b!317465))

(assert (not b!317463))

(assert (not b!317467))

(assert (not b!317469))

(check-sat)

(pop 1)

(push 1)

(check-sat)


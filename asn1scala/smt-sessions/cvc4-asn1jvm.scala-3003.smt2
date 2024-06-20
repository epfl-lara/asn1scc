; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70256 () Bool)

(assert start!70256)

(declare-fun res!261456 () Bool)

(declare-fun e!228563 () Bool)

(assert (=> start!70256 (=> (not res!261456) (not e!228563))))

(declare-datatypes ((array!19754 0))(
  ( (array!19755 (arr!9684 (Array (_ BitVec 32) (_ BitVec 8))) (size!8598 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19754)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19754)

(assert (=> start!70256 (= res!261456 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8598 a1!748) (size!8598 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8598 a1!748))))))))

(assert (=> start!70256 e!228563))

(assert (=> start!70256 true))

(declare-fun array_inv!8150 (array!19754) Bool)

(assert (=> start!70256 (array_inv!8150 a2!748)))

(assert (=> start!70256 (array_inv!8150 a1!748)))

(declare-fun b!318372 () Bool)

(declare-fun res!261458 () Bool)

(assert (=> b!318372 (=> (not res!261458) (not e!228563))))

(declare-fun bitAt!0 (array!19754 (_ BitVec 64)) Bool)

(assert (=> b!318372 (= res!261458 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318373 () Bool)

(declare-fun res!261455 () Bool)

(assert (=> b!318373 (=> (not res!261455) (not e!228563))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318373 (= res!261455 (not (= i!999 from!855)))))

(declare-fun b!318374 () Bool)

(declare-fun res!261454 () Bool)

(assert (=> b!318374 (=> (not res!261454) (not e!228563))))

(assert (=> b!318374 (= res!261454 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318375 () Bool)

(declare-fun res!261452 () Bool)

(assert (=> b!318375 (=> (not res!261452) (not e!228563))))

(declare-fun arrayBitRangesEq!0 (array!19754 array!19754 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318375 (= res!261452 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318376 () Bool)

(declare-fun e!228565 () Bool)

(assert (=> b!318376 (= e!228565 (or (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!318376 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21867 0))(
  ( (Unit!21868) )
))
(declare-fun lt!443355 () Unit!21867)

(declare-fun rec!18 (array!19754 array!19754 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21867)

(assert (=> b!318376 (= lt!443355 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!318377 () Bool)

(assert (=> b!318377 (= e!228563 (not e!228565))))

(declare-fun res!261453 () Bool)

(assert (=> b!318377 (=> res!261453 e!228565)))

(assert (=> b!318377 (= res!261453 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!318377 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443357 () Unit!21867)

(declare-fun arrayBitRangesEqPrepend!0 (array!19754 array!19754 (_ BitVec 64) (_ BitVec 64)) Unit!21867)

(assert (=> b!318377 (= lt!443357 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318377 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443356 () Unit!21867)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19754 array!19754 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21867)

(assert (=> b!318377 (= lt!443356 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318378 () Bool)

(declare-fun res!261457 () Bool)

(assert (=> b!318378 (=> (not res!261457) (not e!228563))))

(assert (=> b!318378 (= res!261457 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70256 res!261456) b!318378))

(assert (= (and b!318378 res!261457) b!318372))

(assert (= (and b!318372 res!261458) b!318374))

(assert (= (and b!318374 res!261454) b!318375))

(assert (= (and b!318375 res!261452) b!318373))

(assert (= (and b!318373 res!261455) b!318377))

(assert (= (and b!318377 (not res!261453)) b!318376))

(declare-fun m!456423 () Bool)

(assert (=> b!318375 m!456423))

(declare-fun m!456425 () Bool)

(assert (=> b!318376 m!456425))

(declare-fun m!456427 () Bool)

(assert (=> b!318376 m!456427))

(declare-fun m!456429 () Bool)

(assert (=> b!318377 m!456429))

(declare-fun m!456431 () Bool)

(assert (=> b!318377 m!456431))

(declare-fun m!456433 () Bool)

(assert (=> b!318377 m!456433))

(declare-fun m!456435 () Bool)

(assert (=> b!318377 m!456435))

(declare-fun m!456437 () Bool)

(assert (=> b!318377 m!456437))

(declare-fun m!456439 () Bool)

(assert (=> b!318378 m!456439))

(declare-fun m!456441 () Bool)

(assert (=> b!318372 m!456441))

(declare-fun m!456443 () Bool)

(assert (=> b!318372 m!456443))

(declare-fun m!456445 () Bool)

(assert (=> start!70256 m!456445))

(declare-fun m!456447 () Bool)

(assert (=> start!70256 m!456447))

(push 1)

(assert (not start!70256))

(assert (not b!318377))

(assert (not b!318372))

(assert (not b!318375))

(assert (not b!318376))

(assert (not b!318378))

(check-sat)

(pop 1)

(push 1)

(check-sat)


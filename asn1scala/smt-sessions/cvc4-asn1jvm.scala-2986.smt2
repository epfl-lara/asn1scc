; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70154 () Bool)

(assert start!70154)

(declare-fun res!260576 () Bool)

(declare-fun e!228095 () Bool)

(assert (=> start!70154 (=> (not res!260576) (not e!228095))))

(declare-datatypes ((array!19652 0))(
  ( (array!19653 (arr!9633 (Array (_ BitVec 32) (_ BitVec 8))) (size!8547 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19652)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19652)

(assert (=> start!70154 (= res!260576 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8547 a1!748) (size!8547 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8547 a1!748))))))))

(assert (=> start!70154 e!228095))

(assert (=> start!70154 true))

(declare-fun array_inv!8099 (array!19652) Bool)

(assert (=> start!70154 (array_inv!8099 a2!748)))

(assert (=> start!70154 (array_inv!8099 a1!748)))

(declare-fun b!317494 () Bool)

(declare-fun res!260574 () Bool)

(assert (=> b!317494 (=> (not res!260574) (not e!228095))))

(declare-fun arrayBitRangesEq!0 (array!19652 array!19652 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317494 (= res!260574 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317495 () Bool)

(declare-fun res!260575 () Bool)

(assert (=> b!317495 (=> (not res!260575) (not e!228095))))

(declare-fun bitAt!0 (array!19652 (_ BitVec 64)) Bool)

(assert (=> b!317495 (= res!260575 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun b!317496 () Bool)

(assert (=> b!317496 (= e!228095 (and (bvsle from!855 i!999) (bvsle i!999 to!822) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70154 res!260576) b!317494))

(assert (= (and b!317494 res!260574) b!317495))

(assert (= (and b!317495 res!260575) b!317496))

(declare-fun m!455551 () Bool)

(assert (=> start!70154 m!455551))

(declare-fun m!455553 () Bool)

(assert (=> start!70154 m!455553))

(declare-fun m!455555 () Bool)

(assert (=> b!317494 m!455555))

(declare-fun m!455557 () Bool)

(assert (=> b!317495 m!455557))

(declare-fun m!455559 () Bool)

(assert (=> b!317495 m!455559))

(push 1)

(assert (not b!317495))

(assert (not start!70154))

(assert (not b!317494))

(check-sat)

(pop 1)

(push 1)

(check-sat)


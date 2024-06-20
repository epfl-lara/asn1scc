; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70216 () Bool)

(assert start!70216)

(declare-fun b!318004 () Bool)

(declare-fun res!261087 () Bool)

(declare-fun e!228376 () Bool)

(assert (=> b!318004 (=> (not res!261087) (not e!228376))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!318004 (= res!261087 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318005 () Bool)

(declare-fun res!261085 () Bool)

(assert (=> b!318005 (=> (not res!261085) (not e!228376))))

(declare-datatypes ((array!19714 0))(
  ( (array!19715 (arr!9664 (Array (_ BitVec 32) (_ BitVec 8))) (size!8578 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19714)

(declare-fun a1!748 () array!19714)

(declare-fun arrayBitRangesEq!0 (array!19714 array!19714 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318005 (= res!261085 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318006 () Bool)

(declare-fun res!261084 () Bool)

(assert (=> b!318006 (=> (not res!261084) (not e!228376))))

(assert (=> b!318006 (= res!261084 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318007 () Bool)

(declare-fun res!261088 () Bool)

(assert (=> b!318007 (=> (not res!261088) (not e!228376))))

(assert (=> b!318007 (= res!261088 (not (= i!999 from!855)))))

(declare-fun res!261086 () Bool)

(assert (=> start!70216 (=> (not res!261086) (not e!228376))))

(assert (=> start!70216 (= res!261086 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8578 a1!748) (size!8578 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8578 a1!748))))))))

(assert (=> start!70216 e!228376))

(assert (=> start!70216 true))

(declare-fun array_inv!8130 (array!19714) Bool)

(assert (=> start!70216 (array_inv!8130 a2!748)))

(assert (=> start!70216 (array_inv!8130 a1!748)))

(declare-fun b!318008 () Bool)

(assert (=> b!318008 (= e!228376 (not true))))

(declare-fun bitAt!0 (array!19714 (_ BitVec 64)) Bool)

(assert (=> b!318008 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21827 0))(
  ( (Unit!21828) )
))
(declare-fun lt!443243 () Unit!21827)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19714 array!19714 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21827)

(assert (=> b!318008 (= lt!443243 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318009 () Bool)

(declare-fun res!261089 () Bool)

(assert (=> b!318009 (=> (not res!261089) (not e!228376))))

(assert (=> b!318009 (= res!261089 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70216 res!261086) b!318006))

(assert (= (and b!318006 res!261084) b!318009))

(assert (= (and b!318009 res!261089) b!318004))

(assert (= (and b!318004 res!261087) b!318005))

(assert (= (and b!318005 res!261085) b!318007))

(assert (= (and b!318007 res!261088) b!318008))

(declare-fun m!455999 () Bool)

(assert (=> b!318006 m!455999))

(declare-fun m!456001 () Bool)

(assert (=> b!318005 m!456001))

(declare-fun m!456003 () Bool)

(assert (=> start!70216 m!456003))

(declare-fun m!456005 () Bool)

(assert (=> start!70216 m!456005))

(declare-fun m!456007 () Bool)

(assert (=> b!318008 m!456007))

(declare-fun m!456009 () Bool)

(assert (=> b!318008 m!456009))

(declare-fun m!456011 () Bool)

(assert (=> b!318008 m!456011))

(declare-fun m!456013 () Bool)

(assert (=> b!318009 m!456013))

(declare-fun m!456015 () Bool)

(assert (=> b!318009 m!456015))

(push 1)

(assert (not b!318009))

(assert (not b!318005))

(assert (not start!70216))

(assert (not b!318008))

(assert (not b!318006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


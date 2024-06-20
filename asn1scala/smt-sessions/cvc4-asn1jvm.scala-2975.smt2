; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70088 () Bool)

(assert start!70088)

(declare-fun res!259998 () Bool)

(declare-fun e!227780 () Bool)

(assert (=> start!70088 (=> (not res!259998) (not e!227780))))

(declare-datatypes ((array!19586 0))(
  ( (array!19587 (arr!9600 (Array (_ BitVec 32) (_ BitVec 8))) (size!8514 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19586)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19586)

(assert (=> start!70088 (= res!259998 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8514 a1!748) (size!8514 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8514 a1!748))))))))

(assert (=> start!70088 e!227780))

(assert (=> start!70088 true))

(declare-fun array_inv!8066 (array!19586) Bool)

(assert (=> start!70088 (array_inv!8066 a2!748)))

(assert (=> start!70088 (array_inv!8066 a1!748)))

(declare-fun b!316918 () Bool)

(declare-fun res!260000 () Bool)

(assert (=> b!316918 (=> (not res!260000) (not e!227780))))

(declare-fun arrayBitRangesEq!0 (array!19586 array!19586 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316918 (= res!260000 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!316919 () Bool)

(declare-fun res!259999 () Bool)

(assert (=> b!316919 (=> (not res!259999) (not e!227780))))

(declare-fun bitAt!0 (array!19586 (_ BitVec 64)) Bool)

(assert (=> b!316919 (= res!259999 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun b!316920 () Bool)

(assert (=> b!316920 (= e!227780 (and (bvsle from!855 i!999) (bvsle i!999 to!822) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!999) (bvsgt i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))))

(assert (= (and start!70088 res!259998) b!316918))

(assert (= (and b!316918 res!260000) b!316919))

(assert (= (and b!316919 res!259999) b!316920))

(declare-fun m!454927 () Bool)

(assert (=> start!70088 m!454927))

(declare-fun m!454929 () Bool)

(assert (=> start!70088 m!454929))

(declare-fun m!454931 () Bool)

(assert (=> b!316918 m!454931))

(declare-fun m!454933 () Bool)

(assert (=> b!316919 m!454933))

(declare-fun m!454935 () Bool)

(assert (=> b!316919 m!454935))

(push 1)

(assert (not b!316919))

(assert (not start!70088))

(assert (not b!316918))

(check-sat)

(pop 1)

(push 1)

(check-sat)


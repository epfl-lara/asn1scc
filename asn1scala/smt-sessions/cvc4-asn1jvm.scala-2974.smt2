; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70082 () Bool)

(assert start!70082)

(declare-fun b!316891 () Bool)

(declare-fun res!259970 () Bool)

(declare-fun e!227754 () Bool)

(assert (=> b!316891 (=> (not res!259970) (not e!227754))))

(declare-datatypes ((array!19580 0))(
  ( (array!19581 (arr!9597 (Array (_ BitVec 32) (_ BitVec 8))) (size!8511 (_ BitVec 32))) )
))
(declare-fun a1!731 () array!19580)

(declare-fun a2!731 () array!19580)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun bitAt!0 (array!19580 (_ BitVec 64)) Bool)

(assert (=> b!316891 (= res!259970 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun b!316890 () Bool)

(declare-fun res!259973 () Bool)

(assert (=> b!316890 (=> (not res!259973) (not e!227754))))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19580 array!19580 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316890 (= res!259973 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316893 () Bool)

(assert (=> b!316893 (= e!227754 (not true))))

(assert (=> b!316893 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21747 0))(
  ( (Unit!21748) )
))
(declare-fun lt!443069 () Unit!21747)

(declare-fun rec!18 (array!19580 array!19580 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21747)

(assert (=> b!316893 (= lt!443069 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun res!259972 () Bool)

(assert (=> start!70082 (=> (not res!259972) (not e!227754))))

(assert (=> start!70082 (= res!259972 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8511 a1!731) (size!8511 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8511 a1!731))))))))

(assert (=> start!70082 e!227754))

(assert (=> start!70082 true))

(declare-fun array_inv!8063 (array!19580) Bool)

(assert (=> start!70082 (array_inv!8063 a1!731)))

(assert (=> start!70082 (array_inv!8063 a2!731)))

(declare-fun b!316892 () Bool)

(declare-fun res!259971 () Bool)

(assert (=> b!316892 (=> (not res!259971) (not e!227754))))

(assert (=> b!316892 (= res!259971 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(assert (= (and start!70082 res!259972) b!316890))

(assert (= (and b!316890 res!259973) b!316891))

(assert (= (and b!316891 res!259970) b!316892))

(assert (= (and b!316892 res!259971) b!316893))

(declare-fun m!454891 () Bool)

(assert (=> start!70082 m!454891))

(declare-fun m!454893 () Bool)

(assert (=> start!70082 m!454893))

(declare-fun m!454895 () Bool)

(assert (=> b!316893 m!454895))

(declare-fun m!454897 () Bool)

(assert (=> b!316893 m!454897))

(declare-fun m!454899 () Bool)

(assert (=> b!316890 m!454899))

(declare-fun m!454901 () Bool)

(assert (=> b!316891 m!454901))

(declare-fun m!454903 () Bool)

(assert (=> b!316891 m!454903))

(declare-fun m!454905 () Bool)

(assert (=> b!316892 m!454905))

(push 1)

(assert (not start!70082))

(assert (not b!316893))

(assert (not b!316892))

(assert (not b!316891))

(assert (not b!316890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


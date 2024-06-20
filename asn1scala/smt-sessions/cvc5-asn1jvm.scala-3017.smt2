; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70372 () Bool)

(assert start!70372)

(declare-fun res!261826 () Bool)

(declare-fun e!229028 () Bool)

(assert (=> start!70372 (=> (not res!261826) (not e!229028))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19837 0))(
  ( (array!19838 (arr!9727 (Array (_ BitVec 32) (_ BitVec 8))) (size!8638 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19837)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19837)

(assert (=> start!70372 (= res!261826 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8638 a1!898) (size!8638 a2!898)) (bvsle to!864 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8638 a1!898)))) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> start!70372 e!229028))

(assert (=> start!70372 true))

(declare-fun array_inv!8190 (array!19837) Bool)

(assert (=> start!70372 (array_inv!8190 a1!898)))

(assert (=> start!70372 (array_inv!8190 a2!898)))

(declare-fun b!318769 () Bool)

(declare-fun res!261825 () Bool)

(assert (=> b!318769 (=> (not res!261825) (not e!229028))))

(declare-fun arrayBitRangesEq!0 (array!19837 array!19837 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318769 (= res!261825 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318770 () Bool)

(assert (=> b!318770 (= e!229028 (not true))))

(declare-fun bitAt!0 (array!19837 (_ BitVec 64)) Bool)

(assert (=> b!318770 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21887 0))(
  ( (Unit!21888) )
))
(declare-fun lt!443459 () Unit!21887)

(declare-fun rec!22 (array!19837 array!19837 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21887)

(assert (=> b!318770 (= lt!443459 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70372 res!261826) b!318769))

(assert (= (and b!318769 res!261825) b!318770))

(declare-fun m!457019 () Bool)

(assert (=> start!70372 m!457019))

(declare-fun m!457021 () Bool)

(assert (=> start!70372 m!457021))

(declare-fun m!457023 () Bool)

(assert (=> b!318769 m!457023))

(declare-fun m!457025 () Bool)

(assert (=> b!318770 m!457025))

(declare-fun m!457027 () Bool)

(assert (=> b!318770 m!457027))

(declare-fun m!457029 () Bool)

(assert (=> b!318770 m!457029))

(push 1)

(assert (not start!70372))

(assert (not b!318769))

(assert (not b!318770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


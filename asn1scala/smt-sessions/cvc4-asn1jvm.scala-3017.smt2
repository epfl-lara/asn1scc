; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70376 () Bool)

(assert start!70376)

(declare-fun res!261838 () Bool)

(declare-fun e!229045 () Bool)

(assert (=> start!70376 (=> (not res!261838) (not e!229045))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19841 0))(
  ( (array!19842 (arr!9729 (Array (_ BitVec 32) (_ BitVec 8))) (size!8640 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19841)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19841)

(assert (=> start!70376 (= res!261838 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8640 a1!898) (size!8640 a2!898)) (bvsle to!864 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8640 a1!898)))) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> start!70376 e!229045))

(assert (=> start!70376 true))

(declare-fun array_inv!8192 (array!19841) Bool)

(assert (=> start!70376 (array_inv!8192 a1!898)))

(assert (=> start!70376 (array_inv!8192 a2!898)))

(declare-fun b!318781 () Bool)

(declare-fun res!261837 () Bool)

(assert (=> b!318781 (=> (not res!261837) (not e!229045))))

(declare-fun arrayBitRangesEq!0 (array!19841 array!19841 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318781 (= res!261837 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318782 () Bool)

(assert (=> b!318782 (= e!229045 (not true))))

(declare-fun bitAt!0 (array!19841 (_ BitVec 64)) Bool)

(assert (=> b!318782 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21891 0))(
  ( (Unit!21892) )
))
(declare-fun lt!443465 () Unit!21891)

(declare-fun rec!22 (array!19841 array!19841 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21891)

(assert (=> b!318782 (= lt!443465 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70376 res!261838) b!318781))

(assert (= (and b!318781 res!261837) b!318782))

(declare-fun m!457043 () Bool)

(assert (=> start!70376 m!457043))

(declare-fun m!457045 () Bool)

(assert (=> start!70376 m!457045))

(declare-fun m!457047 () Bool)

(assert (=> b!318781 m!457047))

(declare-fun m!457049 () Bool)

(assert (=> b!318782 m!457049))

(declare-fun m!457051 () Bool)

(assert (=> b!318782 m!457051))

(declare-fun m!457053 () Bool)

(assert (=> b!318782 m!457053))

(push 1)

(assert (not start!70376))

(assert (not b!318781))

(assert (not b!318782))


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70582 () Bool)

(assert start!70582)

(declare-fun res!262590 () Bool)

(declare-fun e!229747 () Bool)

(assert (=> start!70582 (=> (not res!262590) (not e!229747))))

(declare-datatypes ((array!19987 0))(
  ( (array!19988 (arr!9802 (Array (_ BitVec 32) (_ BitVec 8))) (size!8710 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19987)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19987)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70582 (= res!262590 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8710 a1!726) (size!8710 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8710 a1!726))))))))

(assert (=> start!70582 e!229747))

(assert (=> start!70582 true))

(declare-fun array_inv!8262 (array!19987) Bool)

(assert (=> start!70582 (array_inv!8262 a1!726)))

(assert (=> start!70582 (array_inv!8262 a2!726)))

(declare-fun b!319588 () Bool)

(declare-fun res!262591 () Bool)

(assert (=> b!319588 (=> (not res!262591) (not e!229747))))

(declare-fun arrayBitRangesEq!0 (array!19987 array!19987 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319588 (= res!262591 (arrayBitRangesEq!0 a1!726 a2!726 from!847 to!814))))

(declare-fun b!319589 () Bool)

(assert (=> b!319589 (= e!229747 (and (= (bvand from!847 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!847) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70582 res!262590) b!319588))

(assert (= (and b!319588 res!262591) b!319589))

(declare-fun m!457991 () Bool)

(assert (=> start!70582 m!457991))

(declare-fun m!457993 () Bool)

(assert (=> start!70582 m!457993))

(declare-fun m!457995 () Bool)

(assert (=> b!319588 m!457995))

(push 1)

(assert (not start!70582))

(assert (not b!319588))

(check-sat)

(pop 1)

(push 1)

(check-sat)


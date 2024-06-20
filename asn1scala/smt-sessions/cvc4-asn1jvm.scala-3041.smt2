; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70586 () Bool)

(assert start!70586)

(declare-fun res!262603 () Bool)

(declare-fun e!229765 () Bool)

(assert (=> start!70586 (=> (not res!262603) (not e!229765))))

(declare-datatypes ((array!19991 0))(
  ( (array!19992 (arr!9804 (Array (_ BitVec 32) (_ BitVec 8))) (size!8712 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19991)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19991)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70586 (= res!262603 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8712 a1!726) (size!8712 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8712 a1!726))))))))

(assert (=> start!70586 e!229765))

(assert (=> start!70586 true))

(declare-fun array_inv!8264 (array!19991) Bool)

(assert (=> start!70586 (array_inv!8264 a1!726)))

(assert (=> start!70586 (array_inv!8264 a2!726)))

(declare-fun b!319600 () Bool)

(declare-fun res!262602 () Bool)

(assert (=> b!319600 (=> (not res!262602) (not e!229765))))

(declare-fun arrayBitRangesEq!0 (array!19991 array!19991 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319600 (= res!262602 (arrayBitRangesEq!0 a1!726 a2!726 from!847 to!814))))

(declare-fun b!319601 () Bool)

(assert (=> b!319601 (= e!229765 (and (= (bvand from!847 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!847) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70586 res!262603) b!319600))

(assert (= (and b!319600 res!262602) b!319601))

(declare-fun m!458003 () Bool)

(assert (=> start!70586 m!458003))

(declare-fun m!458005 () Bool)

(assert (=> start!70586 m!458005))

(declare-fun m!458007 () Bool)

(assert (=> b!319600 m!458007))

(push 1)

(assert (not b!319600))

(assert (not start!70586))

(check-sat)

(pop 1)

(push 1)

(check-sat)


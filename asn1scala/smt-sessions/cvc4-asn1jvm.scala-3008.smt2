; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70286 () Bool)

(assert start!70286)

(declare-fun res!261592 () Bool)

(declare-fun e!228708 () Bool)

(assert (=> start!70286 (=> (not res!261592) (not e!228708))))

(declare-datatypes ((array!19784 0))(
  ( (array!19785 (arr!9699 (Array (_ BitVec 32) (_ BitVec 8))) (size!8613 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19784)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19784)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70286 (= res!261592 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8613 a1!721) (size!8613 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8613 a1!721))))))))

(assert (=> start!70286 e!228708))

(assert (=> start!70286 true))

(declare-fun array_inv!8165 (array!19784) Bool)

(assert (=> start!70286 (array_inv!8165 a1!721)))

(assert (=> start!70286 (array_inv!8165 a2!721)))

(declare-fun b!318511 () Bool)

(declare-fun res!261593 () Bool)

(assert (=> b!318511 (=> (not res!261593) (not e!228708))))

(declare-fun arrayBitRangesEq!0 (array!19784 array!19784 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318511 (= res!261593 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318512 () Bool)

(declare-fun res!261591 () Bool)

(assert (=> b!318512 (=> (not res!261591) (not e!228708))))

(declare-fun bitAt!0 (array!19784 (_ BitVec 64)) Bool)

(assert (=> b!318512 (= res!261591 (= (bitAt!0 a1!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!318513 () Bool)

(assert (=> b!318513 (= e!228708 (bvsgt (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) to!813))))

(assert (= (and start!70286 res!261592) b!318511))

(assert (= (and b!318511 res!261593) b!318512))

(assert (= (and b!318512 res!261591) b!318513))

(declare-fun m!456595 () Bool)

(assert (=> start!70286 m!456595))

(declare-fun m!456597 () Bool)

(assert (=> start!70286 m!456597))

(declare-fun m!456599 () Bool)

(assert (=> b!318511 m!456599))

(declare-fun m!456601 () Bool)

(assert (=> b!318512 m!456601))

(declare-fun m!456603 () Bool)

(assert (=> b!318512 m!456603))

(push 1)

(assert (not b!318512))

(assert (not b!318511))

(assert (not start!70286))

(check-sat)

(pop 1)

(push 1)

(check-sat)


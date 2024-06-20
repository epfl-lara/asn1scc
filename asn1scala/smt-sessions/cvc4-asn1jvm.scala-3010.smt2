; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70298 () Bool)

(assert start!70298)

(declare-fun res!261610 () Bool)

(declare-fun e!228754 () Bool)

(assert (=> start!70298 (=> (not res!261610) (not e!228754))))

(declare-datatypes ((array!19796 0))(
  ( (array!19797 (arr!9705 (Array (_ BitVec 32) (_ BitVec 8))) (size!8619 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19796)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19796)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70298 (= res!261610 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8619 a1!721) (size!8619 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8619 a1!721))))))))

(assert (=> start!70298 e!228754))

(assert (=> start!70298 true))

(declare-fun array_inv!8171 (array!19796) Bool)

(assert (=> start!70298 (array_inv!8171 a1!721)))

(assert (=> start!70298 (array_inv!8171 a2!721)))

(declare-fun b!318530 () Bool)

(declare-fun res!261611 () Bool)

(assert (=> b!318530 (=> (not res!261611) (not e!228754))))

(declare-fun arrayBitRangesEq!0 (array!19796 array!19796 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318530 (= res!261611 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318531 () Bool)

(assert (=> b!318531 (= e!228754 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70298 res!261610) b!318530))

(assert (= (and b!318530 res!261611) b!318531))

(declare-fun m!456629 () Bool)

(assert (=> start!70298 m!456629))

(declare-fun m!456631 () Bool)

(assert (=> start!70298 m!456631))

(declare-fun m!456633 () Bool)

(assert (=> b!318530 m!456633))

(push 1)

(assert (not start!70298))

(assert (not b!318530))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70310 () Bool)

(assert start!70310)

(declare-fun res!261655 () Bool)

(declare-fun e!228806 () Bool)

(assert (=> start!70310 (=> (not res!261655) (not e!228806))))

(declare-datatypes ((array!19808 0))(
  ( (array!19809 (arr!9711 (Array (_ BitVec 32) (_ BitVec 8))) (size!8625 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19808)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19808)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70310 (= res!261655 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8625 a1!721) (size!8625 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8625 a1!721))))))))

(assert (=> start!70310 e!228806))

(assert (=> start!70310 true))

(declare-fun array_inv!8177 (array!19808) Bool)

(assert (=> start!70310 (array_inv!8177 a1!721)))

(assert (=> start!70310 (array_inv!8177 a2!721)))

(declare-fun b!318574 () Bool)

(declare-fun res!261656 () Bool)

(assert (=> b!318574 (=> (not res!261656) (not e!228806))))

(declare-fun arrayBitRangesEq!0 (array!19808 array!19808 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318574 (= res!261656 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318575 () Bool)

(declare-fun res!261654 () Bool)

(assert (=> b!318575 (=> (not res!261654) (not e!228806))))

(declare-fun bitAt!0 (array!19808 (_ BitVec 64)) Bool)

(assert (=> b!318575 (= res!261654 (= (bitAt!0 a1!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!318576 () Bool)

(assert (=> b!318576 (= e!228806 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70310 res!261655) b!318574))

(assert (= (and b!318574 res!261656) b!318575))

(assert (= (and b!318575 res!261654) b!318576))

(declare-fun m!456673 () Bool)

(assert (=> start!70310 m!456673))

(declare-fun m!456675 () Bool)

(assert (=> start!70310 m!456675))

(declare-fun m!456677 () Bool)

(assert (=> b!318574 m!456677))

(declare-fun m!456679 () Bool)

(assert (=> b!318575 m!456679))

(declare-fun m!456681 () Bool)

(assert (=> b!318575 m!456681))

(push 1)

(assert (not b!318575))

(assert (not start!70310))

(assert (not b!318574))

(check-sat)

(pop 1)

(push 1)

(check-sat)


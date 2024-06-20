; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70306 () Bool)

(assert start!70306)

(declare-fun res!261638 () Bool)

(declare-fun e!228790 () Bool)

(assert (=> start!70306 (=> (not res!261638) (not e!228790))))

(declare-datatypes ((array!19804 0))(
  ( (array!19805 (arr!9709 (Array (_ BitVec 32) (_ BitVec 8))) (size!8623 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19804)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19804)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70306 (= res!261638 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8623 a1!721) (size!8623 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8623 a1!721))))))))

(assert (=> start!70306 e!228790))

(assert (=> start!70306 true))

(declare-fun array_inv!8175 (array!19804) Bool)

(assert (=> start!70306 (array_inv!8175 a1!721)))

(assert (=> start!70306 (array_inv!8175 a2!721)))

(declare-fun b!318556 () Bool)

(declare-fun res!261637 () Bool)

(assert (=> b!318556 (=> (not res!261637) (not e!228790))))

(declare-fun arrayBitRangesEq!0 (array!19804 array!19804 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318556 (= res!261637 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318557 () Bool)

(declare-fun res!261636 () Bool)

(assert (=> b!318557 (=> (not res!261636) (not e!228790))))

(declare-fun bitAt!0 (array!19804 (_ BitVec 64)) Bool)

(assert (=> b!318557 (= res!261636 (= (bitAt!0 a1!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!318558 () Bool)

(assert (=> b!318558 (= e!228790 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70306 res!261638) b!318556))

(assert (= (and b!318556 res!261637) b!318557))

(assert (= (and b!318557 res!261636) b!318558))

(declare-fun m!456653 () Bool)

(assert (=> start!70306 m!456653))

(declare-fun m!456655 () Bool)

(assert (=> start!70306 m!456655))

(declare-fun m!456657 () Bool)

(assert (=> b!318556 m!456657))

(declare-fun m!456659 () Bool)

(assert (=> b!318557 m!456659))

(declare-fun m!456661 () Bool)

(assert (=> b!318557 m!456661))

(push 1)

(assert (not b!318556))

(assert (not b!318557))

(assert (not start!70306))

(check-sat)

(pop 1)

(push 1)

(check-sat)


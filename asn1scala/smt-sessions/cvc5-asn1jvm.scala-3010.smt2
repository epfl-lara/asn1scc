; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70294 () Bool)

(assert start!70294)

(declare-fun res!261599 () Bool)

(declare-fun e!228735 () Bool)

(assert (=> start!70294 (=> (not res!261599) (not e!228735))))

(declare-datatypes ((array!19792 0))(
  ( (array!19793 (arr!9703 (Array (_ BitVec 32) (_ BitVec 8))) (size!8617 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19792)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19792)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70294 (= res!261599 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8617 a1!721) (size!8617 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8617 a1!721))))))))

(assert (=> start!70294 e!228735))

(assert (=> start!70294 true))

(declare-fun array_inv!8169 (array!19792) Bool)

(assert (=> start!70294 (array_inv!8169 a1!721)))

(assert (=> start!70294 (array_inv!8169 a2!721)))

(declare-fun b!318518 () Bool)

(declare-fun res!261598 () Bool)

(assert (=> b!318518 (=> (not res!261598) (not e!228735))))

(declare-fun arrayBitRangesEq!0 (array!19792 array!19792 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318518 (= res!261598 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318519 () Bool)

(assert (=> b!318519 (= e!228735 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70294 res!261599) b!318518))

(assert (= (and b!318518 res!261598) b!318519))

(declare-fun m!456617 () Bool)

(assert (=> start!70294 m!456617))

(declare-fun m!456619 () Bool)

(assert (=> start!70294 m!456619))

(declare-fun m!456621 () Bool)

(assert (=> b!318518 m!456621))

(push 1)

(assert (not b!318518))

(assert (not start!70294))

(check-sat)

(pop 1)

(push 1)

(check-sat)


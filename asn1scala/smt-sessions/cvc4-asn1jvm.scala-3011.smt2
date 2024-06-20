; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70304 () Bool)

(assert start!70304)

(declare-fun res!261629 () Bool)

(declare-fun e!228779 () Bool)

(assert (=> start!70304 (=> (not res!261629) (not e!228779))))

(declare-datatypes ((array!19802 0))(
  ( (array!19803 (arr!9708 (Array (_ BitVec 32) (_ BitVec 8))) (size!8622 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19802)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19802)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70304 (= res!261629 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8622 a1!721) (size!8622 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8622 a1!721))))))))

(assert (=> start!70304 e!228779))

(assert (=> start!70304 true))

(declare-fun array_inv!8174 (array!19802) Bool)

(assert (=> start!70304 (array_inv!8174 a1!721)))

(assert (=> start!70304 (array_inv!8174 a2!721)))

(declare-fun b!318548 () Bool)

(declare-fun res!261628 () Bool)

(assert (=> b!318548 (=> (not res!261628) (not e!228779))))

(declare-fun arrayBitRangesEq!0 (array!19802 array!19802 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318548 (= res!261628 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318549 () Bool)

(assert (=> b!318549 (= e!228779 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70304 res!261629) b!318548))

(assert (= (and b!318548 res!261628) b!318549))

(declare-fun m!456647 () Bool)

(assert (=> start!70304 m!456647))

(declare-fun m!456649 () Bool)

(assert (=> start!70304 m!456649))

(declare-fun m!456651 () Bool)

(assert (=> b!318548 m!456651))

(push 1)

(assert (not start!70304))


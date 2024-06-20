; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70300 () Bool)

(assert start!70300)

(declare-fun res!261617 () Bool)

(declare-fun e!228763 () Bool)

(assert (=> start!70300 (=> (not res!261617) (not e!228763))))

(declare-datatypes ((array!19798 0))(
  ( (array!19799 (arr!9706 (Array (_ BitVec 32) (_ BitVec 8))) (size!8620 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19798)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19798)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70300 (= res!261617 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8620 a1!721) (size!8620 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8620 a1!721))))))))

(assert (=> start!70300 e!228763))

(assert (=> start!70300 true))

(declare-fun array_inv!8172 (array!19798) Bool)

(assert (=> start!70300 (array_inv!8172 a1!721)))

(assert (=> start!70300 (array_inv!8172 a2!721)))

(declare-fun b!318536 () Bool)

(declare-fun res!261616 () Bool)

(assert (=> b!318536 (=> (not res!261616) (not e!228763))))

(declare-fun arrayBitRangesEq!0 (array!19798 array!19798 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318536 (= res!261616 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318537 () Bool)

(assert (=> b!318537 (= e!228763 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70300 res!261617) b!318536))

(assert (= (and b!318536 res!261616) b!318537))

(declare-fun m!456635 () Bool)

(assert (=> start!70300 m!456635))

(declare-fun m!456637 () Bool)

(assert (=> start!70300 m!456637))

(declare-fun m!456639 () Bool)

(assert (=> b!318536 m!456639))

(push 1)

(assert (not b!318536))

(assert (not start!70300))

(check-sat)

(pop 1)

(push 1)

(check-sat)


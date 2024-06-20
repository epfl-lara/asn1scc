; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70276 () Bool)

(assert start!70276)

(declare-fun res!261553 () Bool)

(declare-fun e!228663 () Bool)

(assert (=> start!70276 (=> (not res!261553) (not e!228663))))

(declare-datatypes ((array!19774 0))(
  ( (array!19775 (arr!9694 (Array (_ BitVec 32) (_ BitVec 8))) (size!8608 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19774)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19774)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70276 (= res!261553 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8608 a1!721) (size!8608 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8608 a1!721))))))))

(assert (=> start!70276 e!228663))

(assert (=> start!70276 true))

(declare-fun array_inv!8160 (array!19774) Bool)

(assert (=> start!70276 (array_inv!8160 a1!721)))

(assert (=> start!70276 (array_inv!8160 a2!721)))

(declare-fun b!318473 () Bool)

(declare-fun res!261554 () Bool)

(assert (=> b!318473 (=> (not res!261554) (not e!228663))))

(declare-fun arrayBitRangesEq!0 (array!19774 array!19774 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318473 (= res!261554 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318474 () Bool)

(assert (=> b!318474 (= e!228663 (bvsge (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8608 a2!721)))))))

(assert (= (and start!70276 res!261553) b!318473))

(assert (= (and b!318473 res!261554) b!318474))

(declare-fun m!456557 () Bool)

(assert (=> start!70276 m!456557))

(declare-fun m!456559 () Bool)

(assert (=> start!70276 m!456559))

(declare-fun m!456561 () Bool)

(assert (=> b!318473 m!456561))

(push 1)

(assert (not start!70276))

(assert (not b!318473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70270 () Bool)

(assert start!70270)

(declare-fun res!261529 () Bool)

(declare-fun e!228631 () Bool)

(assert (=> start!70270 (=> (not res!261529) (not e!228631))))

(declare-datatypes ((array!19768 0))(
  ( (array!19769 (arr!9691 (Array (_ BitVec 32) (_ BitVec 8))) (size!8605 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19768)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19768)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70270 (= res!261529 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8605 a1!721) (size!8605 a2!721))))))

(assert (=> start!70270 e!228631))

(assert (=> start!70270 true))

(declare-fun array_inv!8157 (array!19768) Bool)

(assert (=> start!70270 (array_inv!8157 a1!721)))

(assert (=> start!70270 (array_inv!8157 a2!721)))

(declare-fun b!318448 () Bool)

(declare-fun e!228628 () Bool)

(assert (=> b!318448 (= e!228631 e!228628)))

(declare-fun res!261530 () Bool)

(assert (=> b!318448 (=> (not res!261530) (not e!228628))))

(declare-fun lt!443387 () (_ BitVec 64))

(assert (=> b!318448 (= res!261530 (bvsle to!813 lt!443387))))

(assert (=> b!318448 (= lt!443387 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8605 a1!721))))))

(declare-fun b!318449 () Bool)

(declare-fun res!261528 () Bool)

(assert (=> b!318449 (=> (not res!261528) (not e!228628))))

(declare-fun arrayBitRangesEq!0 (array!19768 array!19768 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318449 (= res!261528 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318450 () Bool)

(assert (=> b!318450 (= e!228628 (bvsge (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) lt!443387))))

(assert (= (and start!70270 res!261529) b!318448))

(assert (= (and b!318448 res!261530) b!318449))

(assert (= (and b!318449 res!261528) b!318450))

(declare-fun m!456539 () Bool)

(assert (=> start!70270 m!456539))

(declare-fun m!456541 () Bool)

(assert (=> start!70270 m!456541))

(declare-fun m!456543 () Bool)

(assert (=> b!318449 m!456543))

(push 1)

(assert (not b!318449))

(assert (not start!70270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


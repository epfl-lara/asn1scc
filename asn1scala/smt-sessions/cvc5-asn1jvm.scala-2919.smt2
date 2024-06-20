; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69664 () Bool)

(assert start!69664)

(declare-fun res!256559 () Bool)

(declare-fun e!225487 () Bool)

(assert (=> start!69664 (=> (not res!256559) (not e!225487))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19237 0))(
  ( (array!19238 (arr!9424 (Array (_ BitVec 32) (_ BitVec 8))) (size!8344 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19237)

(declare-fun a2!799 () array!19237)

(declare-fun a3!74 () array!19237)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69664 (= res!256559 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8344 a1!799) (size!8344 a2!799)) (= (size!8344 a2!799) (size!8344 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8344 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8344 a2!799))))))))

(assert (=> start!69664 e!225487))

(assert (=> start!69664 true))

(declare-fun array_inv!7896 (array!19237) Bool)

(assert (=> start!69664 (array_inv!7896 a1!799)))

(assert (=> start!69664 (array_inv!7896 a2!799)))

(assert (=> start!69664 (array_inv!7896 a3!74)))

(declare-fun b!313382 () Bool)

(declare-fun res!256558 () Bool)

(assert (=> b!313382 (=> (not res!256558) (not e!225487))))

(declare-fun arrayBitRangesEq!0 (array!19237 array!19237 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313382 (= res!256558 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313383 () Bool)

(assert (=> b!313383 (= e!225487 (bvsgt from!870 to!837))))

(assert (= (and start!69664 res!256559) b!313382))

(assert (= (and b!313382 res!256558) b!313383))

(declare-fun m!450911 () Bool)

(assert (=> start!69664 m!450911))

(declare-fun m!450913 () Bool)

(assert (=> start!69664 m!450913))

(declare-fun m!450915 () Bool)

(assert (=> start!69664 m!450915))

(declare-fun m!450917 () Bool)

(assert (=> b!313382 m!450917))

(push 1)

(assert (not b!313382))

(assert (not start!69664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


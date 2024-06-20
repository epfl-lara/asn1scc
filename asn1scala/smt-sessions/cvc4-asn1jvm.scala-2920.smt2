; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69674 () Bool)

(assert start!69674)

(declare-fun b!313431 () Bool)

(declare-fun e!225545 () Bool)

(declare-datatypes ((array!19247 0))(
  ( (array!19248 (arr!9429 (Array (_ BitVec 32) (_ BitVec 8))) (size!8349 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19247)

(declare-fun a3!74 () array!19247)

(assert (=> b!313431 (= e!225545 (not (bvsle (size!8349 a1!799) (size!8349 a3!74))))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun from!870 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19247 array!19247 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313431 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((Unit!21537 0))(
  ( (Unit!21538) )
))
(declare-fun lt!442277 () Unit!21537)

(declare-fun a2!799 () array!19247)

(declare-fun rec!20 (array!19247 array!19247 array!19247 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21537)

(assert (=> b!313431 (= lt!442277 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(declare-fun b!313430 () Bool)

(declare-fun res!256607 () Bool)

(assert (=> b!313430 (=> (not res!256607) (not e!225545))))

(assert (=> b!313430 (= res!256607 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(declare-fun b!313428 () Bool)

(declare-fun res!256605 () Bool)

(assert (=> b!313428 (=> (not res!256605) (not e!225545))))

(assert (=> b!313428 (= res!256605 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun res!256606 () Bool)

(assert (=> start!69674 (=> (not res!256606) (not e!225545))))

(assert (=> start!69674 (= res!256606 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8349 a1!799) (size!8349 a2!799)) (= (size!8349 a2!799) (size!8349 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8349 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8349 a2!799))))))))

(assert (=> start!69674 e!225545))

(assert (=> start!69674 true))

(declare-fun array_inv!7901 (array!19247) Bool)

(assert (=> start!69674 (array_inv!7901 a1!799)))

(assert (=> start!69674 (array_inv!7901 a2!799)))

(assert (=> start!69674 (array_inv!7901 a3!74)))

(declare-fun b!313429 () Bool)

(declare-fun res!256604 () Bool)

(assert (=> b!313429 (=> (not res!256604) (not e!225545))))

(assert (=> b!313429 (= res!256604 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(assert (= (and start!69674 res!256606) b!313428))

(assert (= (and b!313428 res!256605) b!313429))

(assert (= (and b!313429 res!256604) b!313430))

(assert (= (and b!313430 res!256607) b!313431))

(declare-fun m!450967 () Bool)

(assert (=> b!313430 m!450967))

(declare-fun m!450969 () Bool)

(assert (=> b!313431 m!450969))

(declare-fun m!450971 () Bool)

(assert (=> b!313431 m!450971))

(declare-fun m!450973 () Bool)

(assert (=> start!69674 m!450973))

(declare-fun m!450975 () Bool)

(assert (=> start!69674 m!450975))

(declare-fun m!450977 () Bool)

(assert (=> start!69674 m!450977))

(declare-fun m!450979 () Bool)

(assert (=> b!313428 m!450979))

(declare-fun m!450981 () Bool)

(assert (=> b!313429 m!450981))

(push 1)

(assert (not b!313430))

(assert (not b!313431))

(assert (not start!69674))

(assert (not b!313429))

(assert (not b!313428))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69712 () Bool)

(assert start!69712)

(declare-fun b!313610 () Bool)

(declare-fun res!256757 () Bool)

(declare-fun e!225773 () Bool)

(assert (=> b!313610 (=> (not res!256757) (not e!225773))))

(declare-datatypes ((array!19276 0))(
  ( (array!19277 (arr!9442 (Array (_ BitVec 32) (_ BitVec 8))) (size!8362 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19276)

(declare-fun a3!74 () array!19276)

(declare-fun from!870 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19276 array!19276 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313610 (= res!256757 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(declare-fun b!313609 () Bool)

(declare-fun res!256754 () Bool)

(assert (=> b!313609 (=> (not res!256754) (not e!225773))))

(declare-fun to!837 () (_ BitVec 64))

(declare-fun a2!799 () array!19276)

(assert (=> b!313609 (= res!256754 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313608 () Bool)

(declare-fun res!256756 () Bool)

(assert (=> b!313608 (=> (not res!256756) (not e!225773))))

(declare-fun mid!77 () (_ BitVec 64))

(assert (=> b!313608 (= res!256756 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun res!256755 () Bool)

(assert (=> start!69712 (=> (not res!256755) (not e!225773))))

(assert (=> start!69712 (= res!256755 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8362 a1!799) (size!8362 a2!799)) (= (size!8362 a2!799) (size!8362 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8362 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8362 a2!799))))))))

(assert (=> start!69712 e!225773))

(assert (=> start!69712 true))

(declare-fun array_inv!7914 (array!19276) Bool)

(assert (=> start!69712 (array_inv!7914 a1!799)))

(assert (=> start!69712 (array_inv!7914 a2!799)))

(assert (=> start!69712 (array_inv!7914 a3!74)))

(declare-fun b!313611 () Bool)

(assert (=> b!313611 (= e!225773 (not true))))

(assert (=> b!313611 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-datatypes ((Unit!21545 0))(
  ( (Unit!21546) )
))
(declare-fun lt!442334 () Unit!21545)

(declare-fun rec!20 (array!19276 array!19276 array!19276 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21545)

(assert (=> b!313611 (= lt!442334 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(assert (= (and start!69712 res!256755) b!313608))

(assert (= (and b!313608 res!256756) b!313609))

(assert (= (and b!313609 res!256754) b!313610))

(assert (= (and b!313610 res!256757) b!313611))

(declare-fun m!451247 () Bool)

(assert (=> b!313611 m!451247))

(declare-fun m!451249 () Bool)

(assert (=> b!313611 m!451249))

(declare-fun m!451251 () Bool)

(assert (=> b!313610 m!451251))

(declare-fun m!451253 () Bool)

(assert (=> b!313608 m!451253))

(declare-fun m!451255 () Bool)

(assert (=> b!313609 m!451255))

(declare-fun m!451257 () Bool)

(assert (=> start!69712 m!451257))

(declare-fun m!451259 () Bool)

(assert (=> start!69712 m!451259))

(declare-fun m!451261 () Bool)

(assert (=> start!69712 m!451261))

(push 1)

(assert (not b!313611))

(assert (not b!313610))

(assert (not start!69712))

(assert (not b!313608))

(assert (not b!313609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


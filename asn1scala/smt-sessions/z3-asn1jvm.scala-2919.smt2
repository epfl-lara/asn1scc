; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69666 () Bool)

(assert start!69666)

(declare-fun res!256564 () Bool)

(declare-fun e!225498 () Bool)

(assert (=> start!69666 (=> (not res!256564) (not e!225498))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19239 0))(
  ( (array!19240 (arr!9425 (Array (_ BitVec 32) (_ BitVec 8))) (size!8345 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19239)

(declare-fun a2!799 () array!19239)

(declare-fun from!870 () (_ BitVec 64))

(declare-fun a3!74 () array!19239)

(assert (=> start!69666 (= res!256564 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8345 a1!799) (size!8345 a2!799)) (= (size!8345 a2!799) (size!8345 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8345 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8345 a2!799))))))))

(assert (=> start!69666 e!225498))

(assert (=> start!69666 true))

(declare-fun array_inv!7897 (array!19239) Bool)

(assert (=> start!69666 (array_inv!7897 a1!799)))

(assert (=> start!69666 (array_inv!7897 a2!799)))

(assert (=> start!69666 (array_inv!7897 a3!74)))

(declare-fun b!313388 () Bool)

(declare-fun res!256565 () Bool)

(assert (=> b!313388 (=> (not res!256565) (not e!225498))))

(declare-fun arrayBitRangesEq!0 (array!19239 array!19239 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313388 (= res!256565 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313389 () Bool)

(assert (=> b!313389 (= e!225498 (bvsgt from!870 to!837))))

(assert (= (and start!69666 res!256564) b!313388))

(assert (= (and b!313388 res!256565) b!313389))

(declare-fun m!450919 () Bool)

(assert (=> start!69666 m!450919))

(declare-fun m!450921 () Bool)

(assert (=> start!69666 m!450921))

(declare-fun m!450923 () Bool)

(assert (=> start!69666 m!450923))

(declare-fun m!450925 () Bool)

(assert (=> b!313388 m!450925))

(check-sat (not b!313388) (not start!69666))
(check-sat)

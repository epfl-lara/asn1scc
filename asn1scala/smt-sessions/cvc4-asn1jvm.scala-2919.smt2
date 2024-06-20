; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69668 () Bool)

(assert start!69668)

(declare-fun res!256570 () Bool)

(declare-fun e!225511 () Bool)

(assert (=> start!69668 (=> (not res!256570) (not e!225511))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19241 0))(
  ( (array!19242 (arr!9426 (Array (_ BitVec 32) (_ BitVec 8))) (size!8346 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19241)

(declare-fun a2!799 () array!19241)

(declare-fun a3!74 () array!19241)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69668 (= res!256570 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8346 a1!799) (size!8346 a2!799)) (= (size!8346 a2!799) (size!8346 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8346 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8346 a2!799))))))))

(assert (=> start!69668 e!225511))

(assert (=> start!69668 true))

(declare-fun array_inv!7898 (array!19241) Bool)

(assert (=> start!69668 (array_inv!7898 a1!799)))

(assert (=> start!69668 (array_inv!7898 a2!799)))

(assert (=> start!69668 (array_inv!7898 a3!74)))

(declare-fun b!313394 () Bool)

(declare-fun res!256571 () Bool)

(assert (=> b!313394 (=> (not res!256571) (not e!225511))))

(declare-fun arrayBitRangesEq!0 (array!19241 array!19241 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313394 (= res!256571 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313395 () Bool)

(assert (=> b!313395 (= e!225511 (bvsgt from!870 to!837))))

(assert (= (and start!69668 res!256570) b!313394))

(assert (= (and b!313394 res!256571) b!313395))

(declare-fun m!450927 () Bool)

(assert (=> start!69668 m!450927))

(declare-fun m!450929 () Bool)

(assert (=> start!69668 m!450929))

(declare-fun m!450931 () Bool)

(assert (=> start!69668 m!450931))

(declare-fun m!450933 () Bool)

(assert (=> b!313394 m!450933))

(push 1)

(assert (not start!69668))

(assert (not b!313394))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69670 () Bool)

(assert start!69670)

(declare-fun b!313405 () Bool)

(declare-fun res!256583 () Bool)

(declare-fun e!225521 () Bool)

(assert (=> b!313405 (=> (not res!256583) (not e!225521))))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19243 0))(
  ( (array!19244 (arr!9427 (Array (_ BitVec 32) (_ BitVec 8))) (size!8347 (_ BitVec 32))) )
))
(declare-fun a2!799 () array!19243)

(declare-fun a3!74 () array!19243)

(declare-fun from!870 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19243 array!19243 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313405 (= res!256583 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313404 () Bool)

(declare-fun res!256580 () Bool)

(assert (=> b!313404 (=> (not res!256580) (not e!225521))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun a1!799 () array!19243)

(assert (=> b!313404 (= res!256580 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313406 () Bool)

(declare-fun res!256581 () Bool)

(assert (=> b!313406 (=> (not res!256581) (not e!225521))))

(assert (=> b!313406 (= res!256581 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(declare-fun b!313407 () Bool)

(assert (=> b!313407 (= e!225521 (not (bvsle (size!8347 a1!799) (size!8347 a3!74))))))

(assert (=> b!313407 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-datatypes ((Unit!21533 0))(
  ( (Unit!21534) )
))
(declare-fun lt!442271 () Unit!21533)

(declare-fun rec!20 (array!19243 array!19243 array!19243 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21533)

(assert (=> b!313407 (= lt!442271 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(declare-fun res!256582 () Bool)

(assert (=> start!69670 (=> (not res!256582) (not e!225521))))

(assert (=> start!69670 (= res!256582 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8347 a1!799) (size!8347 a2!799)) (= (size!8347 a2!799) (size!8347 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8347 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8347 a2!799))))))))

(assert (=> start!69670 e!225521))

(assert (=> start!69670 true))

(declare-fun array_inv!7899 (array!19243) Bool)

(assert (=> start!69670 (array_inv!7899 a1!799)))

(assert (=> start!69670 (array_inv!7899 a2!799)))

(assert (=> start!69670 (array_inv!7899 a3!74)))

(assert (= (and start!69670 res!256582) b!313404))

(assert (= (and b!313404 res!256580) b!313405))

(assert (= (and b!313405 res!256583) b!313406))

(assert (= (and b!313406 res!256581) b!313407))

(declare-fun m!450935 () Bool)

(assert (=> b!313404 m!450935))

(declare-fun m!450937 () Bool)

(assert (=> b!313405 m!450937))

(declare-fun m!450939 () Bool)

(assert (=> b!313406 m!450939))

(declare-fun m!450941 () Bool)

(assert (=> start!69670 m!450941))

(declare-fun m!450943 () Bool)

(assert (=> start!69670 m!450943))

(declare-fun m!450945 () Bool)

(assert (=> start!69670 m!450945))

(declare-fun m!450947 () Bool)

(assert (=> b!313407 m!450947))

(declare-fun m!450949 () Bool)

(assert (=> b!313407 m!450949))

(push 1)

(assert (not b!313404))

(assert (not b!313406))

(assert (not b!313407))

(assert (not b!313405))

(assert (not start!69670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


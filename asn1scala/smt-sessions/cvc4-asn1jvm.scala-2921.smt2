; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69680 () Bool)

(assert start!69680)

(declare-fun res!256642 () Bool)

(declare-fun e!225583 () Bool)

(assert (=> start!69680 (=> (not res!256642) (not e!225583))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19253 0))(
  ( (array!19254 (arr!9432 (Array (_ BitVec 32) (_ BitVec 8))) (size!8352 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19253)

(declare-fun a2!799 () array!19253)

(declare-fun a3!74 () array!19253)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69680 (= res!256642 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8352 a1!799) (size!8352 a2!799)) (= (size!8352 a2!799) (size!8352 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8352 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8352 a2!799))))))))

(assert (=> start!69680 e!225583))

(assert (=> start!69680 true))

(declare-fun array_inv!7904 (array!19253) Bool)

(assert (=> start!69680 (array_inv!7904 a1!799)))

(assert (=> start!69680 (array_inv!7904 a2!799)))

(assert (=> start!69680 (array_inv!7904 a3!74)))

(declare-fun b!313465 () Bool)

(declare-fun res!256640 () Bool)

(assert (=> b!313465 (=> (not res!256640) (not e!225583))))

(declare-fun arrayBitRangesEq!0 (array!19253 array!19253 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313465 (= res!256640 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313466 () Bool)

(declare-fun res!256643 () Bool)

(assert (=> b!313466 (=> (not res!256643) (not e!225583))))

(assert (=> b!313466 (= res!256643 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(declare-fun b!313467 () Bool)

(assert (=> b!313467 (= e!225583 (not true))))

(assert (=> b!313467 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-datatypes ((Unit!21543 0))(
  ( (Unit!21544) )
))
(declare-fun lt!442286 () Unit!21543)

(declare-fun rec!20 (array!19253 array!19253 array!19253 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21543)

(assert (=> b!313467 (= lt!442286 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(declare-fun b!313464 () Bool)

(declare-fun res!256641 () Bool)

(assert (=> b!313464 (=> (not res!256641) (not e!225583))))

(assert (=> b!313464 (= res!256641 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(assert (= (and start!69680 res!256642) b!313464))

(assert (= (and b!313464 res!256641) b!313465))

(assert (= (and b!313465 res!256640) b!313466))

(assert (= (and b!313466 res!256643) b!313467))

(declare-fun m!451015 () Bool)

(assert (=> start!69680 m!451015))

(declare-fun m!451017 () Bool)

(assert (=> start!69680 m!451017))

(declare-fun m!451019 () Bool)

(assert (=> start!69680 m!451019))

(declare-fun m!451021 () Bool)

(assert (=> b!313465 m!451021))

(declare-fun m!451023 () Bool)

(assert (=> b!313467 m!451023))

(declare-fun m!451025 () Bool)

(assert (=> b!313467 m!451025))

(declare-fun m!451027 () Bool)

(assert (=> b!313466 m!451027))

(declare-fun m!451029 () Bool)

(assert (=> b!313464 m!451029))

(push 1)

(assert (not b!313464))

(assert (not b!313465))

(assert (not start!69680))

(assert (not b!313466))

(assert (not b!313467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


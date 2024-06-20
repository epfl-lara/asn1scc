; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73666 () Bool)

(assert start!73666)

(declare-fun b!326174 () Bool)

(declare-fun e!235290 () Bool)

(declare-fun e!235291 () Bool)

(assert (=> b!326174 (= e!235290 e!235291)))

(declare-fun res!267748 () Bool)

(assert (=> b!326174 (=> (not res!267748) (not e!235291))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448445 () (_ BitVec 64))

(assert (=> b!326174 (= res!267748 (bvsle i!1031 lt!448445))))

(declare-datatypes ((array!21131 0))(
  ( (array!21132 (arr!10264 (Array (_ BitVec 32) (_ BitVec 8))) (size!9172 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21131)

(assert (=> b!326174 (= lt!448445 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9172 a!445))))))

(declare-fun b!326175 () Bool)

(assert (=> b!326175 (= e!235291 (bvsge (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) i!1031))))

(declare-fun res!267746 () Bool)

(assert (=> start!73666 (=> (not res!267746) (not e!235290))))

(assert (=> start!73666 (= res!267746 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73666 e!235290))

(assert (=> start!73666 true))

(declare-fun array_inv!8724 (array!21131) Bool)

(assert (=> start!73666 (array_inv!8724 a!445)))

(declare-fun b!326176 () Bool)

(declare-fun res!267747 () Bool)

(assert (=> b!326176 (=> (not res!267747) (not e!235291))))

(declare-fun arrayBitRangesEq!0 (array!21131 array!21131 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326176 (= res!267747 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448445))))

(declare-fun b!326177 () Bool)

(declare-fun res!267750 () Bool)

(assert (=> b!326177 (=> (not res!267750) (not e!235291))))

(assert (=> b!326177 (= res!267750 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448445))))

(declare-fun b!326178 () Bool)

(declare-fun res!267749 () Bool)

(assert (=> b!326178 (=> (not res!267749) (not e!235291))))

(assert (=> b!326178 (= res!267749 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448445)))))

(assert (= (and start!73666 res!267746) b!326174))

(assert (= (and b!326174 res!267748) b!326177))

(assert (= (and b!326177 res!267750) b!326178))

(assert (= (and b!326178 res!267749) b!326176))

(assert (= (and b!326176 res!267747) b!326175))

(declare-fun m!463985 () Bool)

(assert (=> start!73666 m!463985))

(declare-fun m!463987 () Bool)

(assert (=> b!326176 m!463987))

(declare-fun m!463989 () Bool)

(assert (=> b!326177 m!463989))

(push 1)

(assert (not start!73666))

(assert (not b!326177))

(assert (not b!326176))

(check-sat)

(pop 1)

(push 1)

(check-sat)


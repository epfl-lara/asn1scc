; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73624 () Bool)

(assert start!73624)

(declare-fun res!267588 () Bool)

(declare-fun e!235134 () Bool)

(assert (=> start!73624 (=> (not res!267588) (not e!235134))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73624 (= res!267588 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73624 e!235134))

(assert (=> start!73624 true))

(declare-datatypes ((array!21116 0))(
  ( (array!21117 (arr!10258 (Array (_ BitVec 32) (_ BitVec 8))) (size!9166 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21116)

(declare-fun array_inv!8718 (array!21116) Bool)

(assert (=> start!73624 (array_inv!8718 a!445)))

(declare-fun b!325991 () Bool)

(declare-fun e!235132 () Bool)

(assert (=> b!325991 (= e!235134 e!235132)))

(declare-fun res!267587 () Bool)

(assert (=> b!325991 (=> (not res!267587) (not e!235132))))

(declare-fun lt!448391 () (_ BitVec 64))

(assert (=> b!325991 (= res!267587 (bvsle i!1031 lt!448391))))

(assert (=> b!325991 (= lt!448391 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9166 a!445))))))

(declare-fun b!325992 () Bool)

(declare-fun res!267589 () Bool)

(assert (=> b!325992 (=> (not res!267589) (not e!235132))))

(declare-fun arrayBitRangesEq!0 (array!21116 array!21116 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325992 (= res!267589 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448391))))

(declare-fun b!325993 () Bool)

(assert (=> b!325993 (= e!235132 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448391))))))

(assert (= (and start!73624 res!267588) b!325991))

(assert (= (and b!325991 res!267587) b!325992))

(assert (= (and b!325992 res!267589) b!325993))

(declare-fun m!463801 () Bool)

(assert (=> start!73624 m!463801))

(declare-fun m!463803 () Bool)

(assert (=> b!325992 m!463803))

(push 1)

(assert (not start!73624))

(assert (not b!325992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73628 () Bool)

(assert start!73628)

(declare-fun res!267606 () Bool)

(declare-fun e!235152 () Bool)

(assert (=> start!73628 (=> (not res!267606) (not e!235152))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73628 (= res!267606 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73628 e!235152))

(assert (=> start!73628 true))

(declare-datatypes ((array!21120 0))(
  ( (array!21121 (arr!10260 (Array (_ BitVec 32) (_ BitVec 8))) (size!9168 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21120)

(declare-fun array_inv!8720 (array!21120) Bool)

(assert (=> start!73628 (array_inv!8720 a!445)))

(declare-fun b!326009 () Bool)

(declare-fun e!235151 () Bool)

(assert (=> b!326009 (= e!235152 e!235151)))

(declare-fun res!267605 () Bool)

(assert (=> b!326009 (=> (not res!267605) (not e!235151))))

(declare-fun lt!448397 () (_ BitVec 64))

(assert (=> b!326009 (= res!267605 (bvsle i!1031 lt!448397))))

(assert (=> b!326009 (= lt!448397 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9168 a!445))))))

(declare-fun b!326010 () Bool)

(declare-fun res!267607 () Bool)

(assert (=> b!326010 (=> (not res!267607) (not e!235151))))

(declare-fun arrayBitRangesEq!0 (array!21120 array!21120 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326010 (= res!267607 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448397))))

(declare-fun b!326011 () Bool)

(assert (=> b!326011 (= e!235151 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448397))))))

(assert (= (and start!73628 res!267606) b!326009))

(assert (= (and b!326009 res!267605) b!326010))

(assert (= (and b!326010 res!267607) b!326011))

(declare-fun m!463809 () Bool)

(assert (=> start!73628 m!463809))

(declare-fun m!463811 () Bool)

(assert (=> b!326010 m!463811))

(push 1)

(assert (not start!73628))

(assert (not b!326010))

(check-sat)

(pop 1)

(push 1)

(check-sat)


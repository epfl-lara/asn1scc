; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73626 () Bool)

(assert start!73626)

(declare-fun res!267596 () Bool)

(declare-fun e!235142 () Bool)

(assert (=> start!73626 (=> (not res!267596) (not e!235142))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73626 (= res!267596 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73626 e!235142))

(assert (=> start!73626 true))

(declare-datatypes ((array!21118 0))(
  ( (array!21119 (arr!10259 (Array (_ BitVec 32) (_ BitVec 8))) (size!9167 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21118)

(declare-fun array_inv!8719 (array!21118) Bool)

(assert (=> start!73626 (array_inv!8719 a!445)))

(declare-fun b!326000 () Bool)

(declare-fun e!235141 () Bool)

(assert (=> b!326000 (= e!235142 e!235141)))

(declare-fun res!267598 () Bool)

(assert (=> b!326000 (=> (not res!267598) (not e!235141))))

(declare-fun lt!448394 () (_ BitVec 64))

(assert (=> b!326000 (= res!267598 (bvsle i!1031 lt!448394))))

(assert (=> b!326000 (= lt!448394 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9167 a!445))))))

(declare-fun b!326001 () Bool)

(declare-fun res!267597 () Bool)

(assert (=> b!326001 (=> (not res!267597) (not e!235141))))

(declare-fun arrayBitRangesEq!0 (array!21118 array!21118 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326001 (= res!267597 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448394))))

(declare-fun b!326002 () Bool)

(assert (=> b!326002 (= e!235141 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448394))))))

(assert (= (and start!73626 res!267596) b!326000))

(assert (= (and b!326000 res!267598) b!326001))

(assert (= (and b!326001 res!267597) b!326002))

(declare-fun m!463805 () Bool)

(assert (=> start!73626 m!463805))

(declare-fun m!463807 () Bool)

(assert (=> b!326001 m!463807))

(check-sat (not b!326001) (not start!73626))
(check-sat)

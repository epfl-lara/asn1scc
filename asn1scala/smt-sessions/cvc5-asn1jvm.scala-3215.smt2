; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73582 () Bool)

(assert start!73582)

(declare-fun res!267415 () Bool)

(declare-fun e!234979 () Bool)

(assert (=> start!73582 (=> (not res!267415) (not e!234979))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73582 (= res!267415 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73582 e!234979))

(assert (=> start!73582 true))

(declare-datatypes ((array!21074 0))(
  ( (array!21075 (arr!10237 (Array (_ BitVec 32) (_ BitVec 8))) (size!9145 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21074)

(declare-fun array_inv!8697 (array!21074) Bool)

(assert (=> start!73582 (array_inv!8697 a!445)))

(declare-fun b!325815 () Bool)

(declare-fun res!267414 () Bool)

(declare-fun e!234980 () Bool)

(assert (=> b!325815 (=> (not res!267414) (not e!234980))))

(declare-fun lt!448331 () (_ BitVec 64))

(assert (=> b!325815 (= res!267414 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448331)))))

(declare-fun b!325816 () Bool)

(assert (=> b!325816 (= e!234979 e!234980)))

(declare-fun res!267411 () Bool)

(assert (=> b!325816 (=> (not res!267411) (not e!234980))))

(assert (=> b!325816 (= res!267411 (bvsle i!1031 lt!448331))))

(assert (=> b!325816 (= lt!448331 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9145 a!445))))))

(declare-fun b!325817 () Bool)

(declare-fun res!267413 () Bool)

(assert (=> b!325817 (=> (not res!267413) (not e!234980))))

(declare-fun arrayBitRangesEq!0 (array!21074 array!21074 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325817 (= res!267413 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448331))))

(declare-fun b!325818 () Bool)

(declare-fun res!267412 () Bool)

(assert (=> b!325818 (=> (not res!267412) (not e!234980))))

(assert (=> b!325818 (= res!267412 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448331))))

(declare-fun b!325819 () Bool)

(assert (=> b!325819 (= e!234980 (not true))))

(assert (=> b!325819 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448331)))

(declare-datatypes ((Unit!22104 0))(
  ( (Unit!22105) )
))
(declare-fun lt!448330 () Unit!22104)

(declare-fun rec!21 (array!21074 (_ BitVec 64)) Unit!22104)

(assert (=> b!325819 (= lt!448330 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!73582 res!267415) b!325816))

(assert (= (and b!325816 res!267411) b!325817))

(assert (= (and b!325817 res!267413) b!325815))

(assert (= (and b!325815 res!267414) b!325818))

(assert (= (and b!325818 res!267412) b!325819))

(declare-fun m!463687 () Bool)

(assert (=> start!73582 m!463687))

(declare-fun m!463689 () Bool)

(assert (=> b!325817 m!463689))

(declare-fun m!463691 () Bool)

(assert (=> b!325818 m!463691))

(declare-fun m!463693 () Bool)

(assert (=> b!325819 m!463693))

(declare-fun m!463695 () Bool)

(assert (=> b!325819 m!463695))

(push 1)

(assert (not b!325818))

(assert (not b!325819))

(assert (not start!73582))

(assert (not b!325817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


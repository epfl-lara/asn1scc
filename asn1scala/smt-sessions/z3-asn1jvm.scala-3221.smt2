; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73620 () Bool)

(assert start!73620)

(declare-fun res!267570 () Bool)

(declare-fun e!235114 () Bool)

(assert (=> start!73620 (=> (not res!267570) (not e!235114))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73620 (= res!267570 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73620 e!235114))

(assert (=> start!73620 true))

(declare-datatypes ((array!21112 0))(
  ( (array!21113 (arr!10256 (Array (_ BitVec 32) (_ BitVec 8))) (size!9164 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21112)

(declare-fun array_inv!8716 (array!21112) Bool)

(assert (=> start!73620 (array_inv!8716 a!445)))

(declare-fun b!325973 () Bool)

(declare-fun e!235116 () Bool)

(assert (=> b!325973 (= e!235114 e!235116)))

(declare-fun res!267571 () Bool)

(assert (=> b!325973 (=> (not res!267571) (not e!235116))))

(declare-fun lt!448385 () (_ BitVec 64))

(assert (=> b!325973 (= res!267571 (bvsle i!1031 lt!448385))))

(assert (=> b!325973 (= lt!448385 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9164 a!445))))))

(declare-fun b!325974 () Bool)

(declare-fun res!267569 () Bool)

(assert (=> b!325974 (=> (not res!267569) (not e!235116))))

(declare-fun arrayBitRangesEq!0 (array!21112 array!21112 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325974 (= res!267569 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448385))))

(declare-fun b!325975 () Bool)

(assert (=> b!325975 (= e!235116 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1031 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73620 res!267570) b!325973))

(assert (= (and b!325973 res!267571) b!325974))

(assert (= (and b!325974 res!267569) b!325975))

(declare-fun m!463793 () Bool)

(assert (=> start!73620 m!463793))

(declare-fun m!463795 () Bool)

(assert (=> b!325974 m!463795))

(check-sat (not b!325974) (not start!73620))
(check-sat)

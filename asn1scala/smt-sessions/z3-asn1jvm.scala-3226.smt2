; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73680 () Bool)

(assert start!73680)

(declare-fun b!326279 () Bool)

(declare-fun res!267855 () Bool)

(declare-fun e!235353 () Bool)

(assert (=> b!326279 (=> (not res!267855) (not e!235353))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448481 () (_ BitVec 64))

(declare-datatypes ((array!21145 0))(
  ( (array!21146 (arr!10271 (Array (_ BitVec 32) (_ BitVec 8))) (size!9179 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21145)

(declare-fun arrayBitRangesEq!0 (array!21145 array!21145 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326279 (= res!267855 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448481))))

(declare-fun b!326280 () Bool)

(declare-fun res!267853 () Bool)

(assert (=> b!326280 (=> (not res!267853) (not e!235353))))

(assert (=> b!326280 (= res!267853 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448481))))

(declare-fun b!326282 () Bool)

(declare-fun e!235355 () Bool)

(assert (=> b!326282 (= e!235355 e!235353)))

(declare-fun res!267852 () Bool)

(assert (=> b!326282 (=> (not res!267852) (not e!235353))))

(assert (=> b!326282 (= res!267852 (bvsle i!1031 lt!448481))))

(assert (=> b!326282 (= lt!448481 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9179 a!445))))))

(declare-fun b!326283 () Bool)

(declare-fun res!267854 () Bool)

(assert (=> b!326283 (=> (not res!267854) (not e!235353))))

(assert (=> b!326283 (= res!267854 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448481)))))

(declare-fun b!326281 () Bool)

(assert (=> b!326281 (= e!235353 (not true))))

(assert (=> b!326281 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448481)))

(declare-datatypes ((Unit!22124 0))(
  ( (Unit!22125) )
))
(declare-fun lt!448480 () Unit!22124)

(declare-fun rec!21 (array!21145 (_ BitVec 64)) Unit!22124)

(assert (=> b!326281 (= lt!448480 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!267851 () Bool)

(assert (=> start!73680 (=> (not res!267851) (not e!235355))))

(assert (=> start!73680 (= res!267851 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73680 e!235355))

(assert (=> start!73680 true))

(declare-fun array_inv!8731 (array!21145) Bool)

(assert (=> start!73680 (array_inv!8731 a!445)))

(assert (= (and start!73680 res!267851) b!326282))

(assert (= (and b!326282 res!267852) b!326279))

(assert (= (and b!326279 res!267855) b!326283))

(assert (= (and b!326283 res!267854) b!326280))

(assert (= (and b!326280 res!267853) b!326281))

(declare-fun m!464043 () Bool)

(assert (=> b!326279 m!464043))

(declare-fun m!464045 () Bool)

(assert (=> b!326280 m!464045))

(declare-fun m!464047 () Bool)

(assert (=> b!326281 m!464047))

(declare-fun m!464049 () Bool)

(assert (=> b!326281 m!464049))

(declare-fun m!464051 () Bool)

(assert (=> start!73680 m!464051))

(check-sat (not b!326280) (not b!326279) (not start!73680) (not b!326281))

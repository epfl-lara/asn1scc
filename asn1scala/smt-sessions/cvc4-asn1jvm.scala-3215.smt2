; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73586 () Bool)

(assert start!73586)

(declare-fun b!325845 () Bool)

(declare-fun res!267442 () Bool)

(declare-fun e!234999 () Bool)

(assert (=> b!325845 (=> (not res!267442) (not e!234999))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448342 () (_ BitVec 64))

(declare-datatypes ((array!21078 0))(
  ( (array!21079 (arr!10239 (Array (_ BitVec 32) (_ BitVec 8))) (size!9147 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21078)

(declare-fun arrayBitRangesEq!0 (array!21078 array!21078 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325845 (= res!267442 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448342))))

(declare-fun b!325846 () Bool)

(assert (=> b!325846 (= e!234999 (not true))))

(assert (=> b!325846 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448342)))

(declare-datatypes ((Unit!22108 0))(
  ( (Unit!22109) )
))
(declare-fun lt!448343 () Unit!22108)

(declare-fun rec!21 (array!21078 (_ BitVec 64)) Unit!22108)

(assert (=> b!325846 (= lt!448343 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!267441 () Bool)

(declare-fun e!234998 () Bool)

(assert (=> start!73586 (=> (not res!267441) (not e!234998))))

(assert (=> start!73586 (= res!267441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73586 e!234998))

(assert (=> start!73586 true))

(declare-fun array_inv!8699 (array!21078) Bool)

(assert (=> start!73586 (array_inv!8699 a!445)))

(declare-fun b!325847 () Bool)

(declare-fun res!267445 () Bool)

(assert (=> b!325847 (=> (not res!267445) (not e!234999))))

(assert (=> b!325847 (= res!267445 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448342))))

(declare-fun b!325848 () Bool)

(declare-fun res!267443 () Bool)

(assert (=> b!325848 (=> (not res!267443) (not e!234999))))

(assert (=> b!325848 (= res!267443 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448342)))))

(declare-fun b!325849 () Bool)

(assert (=> b!325849 (= e!234998 e!234999)))

(declare-fun res!267444 () Bool)

(assert (=> b!325849 (=> (not res!267444) (not e!234999))))

(assert (=> b!325849 (= res!267444 (bvsle i!1031 lt!448342))))

(assert (=> b!325849 (= lt!448342 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9147 a!445))))))

(assert (= (and start!73586 res!267441) b!325849))

(assert (= (and b!325849 res!267444) b!325845))

(assert (= (and b!325845 res!267442) b!325848))

(assert (= (and b!325848 res!267443) b!325847))

(assert (= (and b!325847 res!267445) b!325846))

(declare-fun m!463707 () Bool)

(assert (=> b!325845 m!463707))

(declare-fun m!463709 () Bool)

(assert (=> b!325846 m!463709))

(declare-fun m!463711 () Bool)

(assert (=> b!325846 m!463711))

(declare-fun m!463713 () Bool)

(assert (=> start!73586 m!463713))

(declare-fun m!463715 () Bool)

(assert (=> b!325847 m!463715))

(push 1)

(assert (not b!325845))


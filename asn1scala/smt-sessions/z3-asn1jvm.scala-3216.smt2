; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73590 () Bool)

(assert start!73590)

(declare-fun b!325875 () Bool)

(declare-fun e!235016 () Bool)

(declare-fun e!235015 () Bool)

(assert (=> b!325875 (= e!235016 e!235015)))

(declare-fun res!267472 () Bool)

(assert (=> b!325875 (=> (not res!267472) (not e!235015))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448354 () (_ BitVec 64))

(assert (=> b!325875 (= res!267472 (bvsle i!1031 lt!448354))))

(declare-datatypes ((array!21082 0))(
  ( (array!21083 (arr!10241 (Array (_ BitVec 32) (_ BitVec 8))) (size!9149 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21082)

(assert (=> b!325875 (= lt!448354 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9149 a!445))))))

(declare-fun b!325876 () Bool)

(declare-fun res!267471 () Bool)

(assert (=> b!325876 (=> (not res!267471) (not e!235015))))

(declare-fun arrayBitRangesEq!0 (array!21082 array!21082 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325876 (= res!267471 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448354))))

(declare-fun res!267475 () Bool)

(assert (=> start!73590 (=> (not res!267475) (not e!235016))))

(assert (=> start!73590 (= res!267475 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73590 e!235016))

(assert (=> start!73590 true))

(declare-fun array_inv!8701 (array!21082) Bool)

(assert (=> start!73590 (array_inv!8701 a!445)))

(declare-fun b!325877 () Bool)

(declare-fun res!267474 () Bool)

(assert (=> b!325877 (=> (not res!267474) (not e!235015))))

(assert (=> b!325877 (= res!267474 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448354)))))

(declare-fun b!325878 () Bool)

(declare-fun res!267473 () Bool)

(assert (=> b!325878 (=> (not res!267473) (not e!235015))))

(assert (=> b!325878 (= res!267473 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448354))))

(declare-fun b!325879 () Bool)

(assert (=> b!325879 (= e!235015 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448354)))))

(assert (=> b!325879 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448354)))

(declare-datatypes ((Unit!22112 0))(
  ( (Unit!22113) )
))
(declare-fun lt!448355 () Unit!22112)

(declare-fun rec!21 (array!21082 (_ BitVec 64)) Unit!22112)

(assert (=> b!325879 (= lt!448355 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!73590 res!267475) b!325875))

(assert (= (and b!325875 res!267472) b!325876))

(assert (= (and b!325876 res!267471) b!325877))

(assert (= (and b!325877 res!267474) b!325878))

(assert (= (and b!325878 res!267473) b!325879))

(declare-fun m!463727 () Bool)

(assert (=> b!325876 m!463727))

(declare-fun m!463729 () Bool)

(assert (=> start!73590 m!463729))

(declare-fun m!463731 () Bool)

(assert (=> b!325878 m!463731))

(declare-fun m!463733 () Bool)

(assert (=> b!325879 m!463733))

(declare-fun m!463735 () Bool)

(assert (=> b!325879 m!463735))

(check-sat (not start!73590) (not b!325878) (not b!325879) (not b!325876))
(check-sat)

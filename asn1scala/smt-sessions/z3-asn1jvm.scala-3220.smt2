; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73614 () Bool)

(assert start!73614)

(declare-fun b!325945 () Bool)

(declare-fun e!235087 () Bool)

(declare-datatypes ((array!21106 0))(
  ( (array!21107 (arr!10253 (Array (_ BitVec 32) (_ BitVec 8))) (size!9161 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21106)

(declare-fun lt!448376 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!21106 array!21106 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325945 (= e!235087 (not (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448376)))))

(declare-fun b!325944 () Bool)

(declare-fun res!267538 () Bool)

(assert (=> b!325944 (=> (not res!267538) (not e!235087))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> b!325944 (= res!267538 (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!267540 () Bool)

(declare-fun e!235089 () Bool)

(assert (=> start!73614 (=> (not res!267540) (not e!235089))))

(assert (=> start!73614 (= res!267540 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73614 e!235089))

(assert (=> start!73614 true))

(declare-fun array_inv!8713 (array!21106) Bool)

(assert (=> start!73614 (array_inv!8713 a!445)))

(declare-fun b!325943 () Bool)

(declare-fun res!267541 () Bool)

(assert (=> b!325943 (=> (not res!267541) (not e!235087))))

(assert (=> b!325943 (= res!267541 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448376))))

(declare-fun b!325942 () Bool)

(assert (=> b!325942 (= e!235089 e!235087)))

(declare-fun res!267539 () Bool)

(assert (=> b!325942 (=> (not res!267539) (not e!235087))))

(assert (=> b!325942 (= res!267539 (bvsle i!1031 lt!448376))))

(assert (=> b!325942 (= lt!448376 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9161 a!445))))))

(assert (= (and start!73614 res!267540) b!325942))

(assert (= (and b!325942 res!267539) b!325943))

(assert (= (and b!325943 res!267541) b!325944))

(assert (= (and b!325944 res!267538) b!325945))

(declare-fun m!463777 () Bool)

(assert (=> b!325945 m!463777))

(declare-fun m!463779 () Bool)

(assert (=> start!73614 m!463779))

(declare-fun m!463781 () Bool)

(assert (=> b!325943 m!463781))

(check-sat (not b!325945) (not b!325943) (not start!73614))

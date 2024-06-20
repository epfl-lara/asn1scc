; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73578 () Bool)

(assert start!73578)

(declare-fun res!267390 () Bool)

(declare-fun e!234963 () Bool)

(assert (=> start!73578 (=> (not res!267390) (not e!234963))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73578 (= res!267390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73578 e!234963))

(assert (=> start!73578 true))

(declare-datatypes ((array!21070 0))(
  ( (array!21071 (arr!10235 (Array (_ BitVec 32) (_ BitVec 8))) (size!9143 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21070)

(declare-fun array_inv!8695 (array!21070) Bool)

(assert (=> start!73578 (array_inv!8695 a!445)))

(declare-fun b!325793 () Bool)

(declare-fun e!234961 () Bool)

(assert (=> b!325793 (= e!234963 e!234961)))

(declare-fun res!267389 () Bool)

(assert (=> b!325793 (=> (not res!267389) (not e!234961))))

(declare-fun lt!448322 () (_ BitVec 64))

(assert (=> b!325793 (= res!267389 (bvsle i!1031 lt!448322))))

(assert (=> b!325793 (= lt!448322 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9143 a!445))))))

(declare-fun b!325794 () Bool)

(declare-fun res!267391 () Bool)

(assert (=> b!325794 (=> (not res!267391) (not e!234961))))

(declare-fun arrayBitRangesEq!0 (array!21070 array!21070 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325794 (= res!267391 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448322))))

(declare-fun b!325795 () Bool)

(assert (=> b!325795 (= e!234961 (and (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!448322)))))

(assert (= (and start!73578 res!267390) b!325793))

(assert (= (and b!325793 res!267389) b!325794))

(assert (= (and b!325794 res!267391) b!325795))

(declare-fun m!463679 () Bool)

(assert (=> start!73578 m!463679))

(declare-fun m!463681 () Bool)

(assert (=> b!325794 m!463681))

(check-sat (not start!73578) (not b!325794))
(check-sat)

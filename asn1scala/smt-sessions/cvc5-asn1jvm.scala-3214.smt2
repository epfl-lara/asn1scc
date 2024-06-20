; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73576 () Bool)

(assert start!73576)

(declare-fun res!267380 () Bool)

(declare-fun e!234954 () Bool)

(assert (=> start!73576 (=> (not res!267380) (not e!234954))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73576 (= res!267380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73576 e!234954))

(assert (=> start!73576 true))

(declare-datatypes ((array!21068 0))(
  ( (array!21069 (arr!10234 (Array (_ BitVec 32) (_ BitVec 8))) (size!9142 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21068)

(declare-fun array_inv!8694 (array!21068) Bool)

(assert (=> start!73576 (array_inv!8694 a!445)))

(declare-fun b!325784 () Bool)

(declare-fun e!234953 () Bool)

(assert (=> b!325784 (= e!234954 e!234953)))

(declare-fun res!267382 () Bool)

(assert (=> b!325784 (=> (not res!267382) (not e!234953))))

(declare-fun lt!448319 () (_ BitVec 64))

(assert (=> b!325784 (= res!267382 (bvsle i!1031 lt!448319))))

(assert (=> b!325784 (= lt!448319 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9142 a!445))))))

(declare-fun b!325785 () Bool)

(declare-fun res!267381 () Bool)

(assert (=> b!325785 (=> (not res!267381) (not e!234953))))

(declare-fun arrayBitRangesEq!0 (array!21068 array!21068 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325785 (= res!267381 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448319))))

(declare-fun b!325786 () Bool)

(assert (=> b!325786 (= e!234953 (and (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!448319)))))

(assert (= (and start!73576 res!267380) b!325784))

(assert (= (and b!325784 res!267382) b!325785))

(assert (= (and b!325785 res!267381) b!325786))

(declare-fun m!463675 () Bool)

(assert (=> start!73576 m!463675))

(declare-fun m!463677 () Bool)

(assert (=> b!325785 m!463677))

(push 1)

(assert (not start!73576))

(assert (not b!325785))

(check-sat)

(pop 1)

(push 1)

(check-sat)


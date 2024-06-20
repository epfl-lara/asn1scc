; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73580 () Bool)

(assert start!73580)

(declare-fun res!267399 () Bool)

(declare-fun e!234970 () Bool)

(assert (=> start!73580 (=> (not res!267399) (not e!234970))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73580 (= res!267399 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73580 e!234970))

(assert (=> start!73580 true))

(declare-datatypes ((array!21072 0))(
  ( (array!21073 (arr!10236 (Array (_ BitVec 32) (_ BitVec 8))) (size!9144 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21072)

(declare-fun array_inv!8696 (array!21072) Bool)

(assert (=> start!73580 (array_inv!8696 a!445)))

(declare-fun b!325802 () Bool)

(declare-fun e!234971 () Bool)

(assert (=> b!325802 (= e!234970 e!234971)))

(declare-fun res!267400 () Bool)

(assert (=> b!325802 (=> (not res!267400) (not e!234971))))

(declare-fun lt!448325 () (_ BitVec 64))

(assert (=> b!325802 (= res!267400 (bvsle i!1031 lt!448325))))

(assert (=> b!325802 (= lt!448325 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9144 a!445))))))

(declare-fun b!325803 () Bool)

(declare-fun res!267398 () Bool)

(assert (=> b!325803 (=> (not res!267398) (not e!234971))))

(declare-fun arrayBitRangesEq!0 (array!21072 array!21072 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325803 (= res!267398 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448325))))

(declare-fun b!325804 () Bool)

(assert (=> b!325804 (= e!234971 (and (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!448325)))))

(assert (= (and start!73580 res!267399) b!325802))

(assert (= (and b!325802 res!267400) b!325803))

(assert (= (and b!325803 res!267398) b!325804))

(declare-fun m!463683 () Bool)

(assert (=> start!73580 m!463683))

(declare-fun m!463685 () Bool)

(assert (=> b!325803 m!463685))

(push 1)

(assert (not b!325803))

(assert (not start!73580))

(check-sat)

(pop 1)

(push 1)

(check-sat)


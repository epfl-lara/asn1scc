; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73588 () Bool)

(assert start!73588)

(declare-fun b!325860 () Bool)

(declare-fun e!235008 () Bool)

(declare-fun e!235006 () Bool)

(assert (=> b!325860 (= e!235008 e!235006)))

(declare-fun res!267458 () Bool)

(assert (=> b!325860 (=> (not res!267458) (not e!235006))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448348 () (_ BitVec 64))

(assert (=> b!325860 (= res!267458 (bvsle i!1031 lt!448348))))

(declare-datatypes ((array!21080 0))(
  ( (array!21081 (arr!10240 (Array (_ BitVec 32) (_ BitVec 8))) (size!9148 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21080)

(assert (=> b!325860 (= lt!448348 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9148 a!445))))))

(declare-fun res!267457 () Bool)

(assert (=> start!73588 (=> (not res!267457) (not e!235008))))

(assert (=> start!73588 (= res!267457 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73588 e!235008))

(assert (=> start!73588 true))

(declare-fun array_inv!8700 (array!21080) Bool)

(assert (=> start!73588 (array_inv!8700 a!445)))

(declare-fun b!325861 () Bool)

(declare-fun res!267456 () Bool)

(assert (=> b!325861 (=> (not res!267456) (not e!235006))))

(declare-fun arrayBitRangesEq!0 (array!21080 array!21080 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325861 (= res!267456 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448348))))

(declare-fun b!325862 () Bool)

(declare-fun res!267460 () Bool)

(assert (=> b!325862 (=> (not res!267460) (not e!235006))))

(assert (=> b!325862 (= res!267460 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448348)))))

(declare-fun b!325863 () Bool)

(assert (=> b!325863 (= e!235006 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448348)))))

(assert (=> b!325863 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448348)))

(declare-datatypes ((Unit!22110 0))(
  ( (Unit!22111) )
))
(declare-fun lt!448349 () Unit!22110)

(declare-fun rec!21 (array!21080 (_ BitVec 64)) Unit!22110)

(assert (=> b!325863 (= lt!448349 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!325864 () Bool)

(declare-fun res!267459 () Bool)

(assert (=> b!325864 (=> (not res!267459) (not e!235006))))

(assert (=> b!325864 (= res!267459 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448348))))

(assert (= (and start!73588 res!267457) b!325860))

(assert (= (and b!325860 res!267458) b!325861))

(assert (= (and b!325861 res!267456) b!325862))

(assert (= (and b!325862 res!267460) b!325864))

(assert (= (and b!325864 res!267459) b!325863))

(declare-fun m!463717 () Bool)

(assert (=> start!73588 m!463717))

(declare-fun m!463719 () Bool)

(assert (=> b!325861 m!463719))

(declare-fun m!463721 () Bool)

(assert (=> b!325863 m!463721))

(declare-fun m!463723 () Bool)

(assert (=> b!325863 m!463723))

(declare-fun m!463725 () Bool)

(assert (=> b!325864 m!463725))

(push 1)

(assert (not start!73588))

(assert (not b!325863))

(assert (not b!325864))

(assert (not b!325861))

(check-sat)

(pop 1)

(push 1)

(check-sat)


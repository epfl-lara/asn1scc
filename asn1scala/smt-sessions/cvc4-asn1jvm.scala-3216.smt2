; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73592 () Bool)

(assert start!73592)

(declare-fun b!325890 () Bool)

(declare-fun e!235025 () Bool)

(declare-fun e!235026 () Bool)

(assert (=> b!325890 (= e!235025 e!235026)))

(declare-fun res!267486 () Bool)

(assert (=> b!325890 (=> (not res!267486) (not e!235026))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448361 () (_ BitVec 64))

(assert (=> b!325890 (= res!267486 (bvsle i!1031 lt!448361))))

(declare-datatypes ((array!21084 0))(
  ( (array!21085 (arr!10242 (Array (_ BitVec 32) (_ BitVec 8))) (size!9150 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21084)

(assert (=> b!325890 (= lt!448361 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9150 a!445))))))

(declare-fun b!325891 () Bool)

(declare-fun res!267490 () Bool)

(assert (=> b!325891 (=> (not res!267490) (not e!235026))))

(declare-fun arrayBitRangesEq!0 (array!21084 array!21084 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325891 (= res!267490 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448361))))

(declare-fun b!325892 () Bool)

(declare-fun res!267488 () Bool)

(assert (=> b!325892 (=> (not res!267488) (not e!235026))))

(assert (=> b!325892 (= res!267488 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448361))))

(declare-fun res!267487 () Bool)

(assert (=> start!73592 (=> (not res!267487) (not e!235025))))

(assert (=> start!73592 (= res!267487 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73592 e!235025))

(assert (=> start!73592 true))

(declare-fun array_inv!8702 (array!21084) Bool)

(assert (=> start!73592 (array_inv!8702 a!445)))

(declare-fun b!325893 () Bool)

(declare-fun res!267489 () Bool)

(assert (=> b!325893 (=> (not res!267489) (not e!235026))))

(assert (=> b!325893 (= res!267489 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448361)))))

(declare-fun b!325894 () Bool)

(assert (=> b!325894 (= e!235026 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448361)))))

(assert (=> b!325894 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448361)))

(declare-datatypes ((Unit!22114 0))(
  ( (Unit!22115) )
))
(declare-fun lt!448360 () Unit!22114)

(declare-fun rec!21 (array!21084 (_ BitVec 64)) Unit!22114)

(assert (=> b!325894 (= lt!448360 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!73592 res!267487) b!325890))

(assert (= (and b!325890 res!267486) b!325891))

(assert (= (and b!325891 res!267490) b!325893))

(assert (= (and b!325893 res!267489) b!325892))

(assert (= (and b!325892 res!267488) b!325894))

(declare-fun m!463737 () Bool)

(assert (=> b!325891 m!463737))

(declare-fun m!463739 () Bool)

(assert (=> b!325892 m!463739))

(declare-fun m!463741 () Bool)

(assert (=> start!73592 m!463741))

(declare-fun m!463743 () Bool)

(assert (=> b!325894 m!463743))

(declare-fun m!463745 () Bool)

(assert (=> b!325894 m!463745))

(push 1)

(assert (not b!325891))


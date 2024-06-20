; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73678 () Bool)

(assert start!73678)

(declare-fun b!326264 () Bool)

(declare-fun e!235345 () Bool)

(assert (=> b!326264 (= e!235345 (not true))))

(declare-datatypes ((array!21143 0))(
  ( (array!21144 (arr!10270 (Array (_ BitVec 32) (_ BitVec 8))) (size!9178 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21143)

(declare-fun lt!448474 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!21143 array!21143 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326264 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448474)))

(declare-datatypes ((Unit!22122 0))(
  ( (Unit!22123) )
))
(declare-fun lt!448475 () Unit!22122)

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun rec!21 (array!21143 (_ BitVec 64)) Unit!22122)

(assert (=> b!326264 (= lt!448475 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!326265 () Bool)

(declare-fun res!267839 () Bool)

(assert (=> b!326265 (=> (not res!267839) (not e!235345))))

(assert (=> b!326265 (= res!267839 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448474))))

(declare-fun b!326266 () Bool)

(declare-fun e!235346 () Bool)

(assert (=> b!326266 (= e!235346 e!235345)))

(declare-fun res!267840 () Bool)

(assert (=> b!326266 (=> (not res!267840) (not e!235345))))

(assert (=> b!326266 (= res!267840 (bvsle i!1031 lt!448474))))

(assert (=> b!326266 (= lt!448474 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9178 a!445))))))

(declare-fun b!326267 () Bool)

(declare-fun res!267836 () Bool)

(assert (=> b!326267 (=> (not res!267836) (not e!235345))))

(assert (=> b!326267 (= res!267836 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448474)))))

(declare-fun b!326268 () Bool)

(declare-fun res!267837 () Bool)

(assert (=> b!326268 (=> (not res!267837) (not e!235345))))

(assert (=> b!326268 (= res!267837 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448474))))

(declare-fun res!267838 () Bool)

(assert (=> start!73678 (=> (not res!267838) (not e!235346))))

(assert (=> start!73678 (= res!267838 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73678 e!235346))

(assert (=> start!73678 true))

(declare-fun array_inv!8730 (array!21143) Bool)

(assert (=> start!73678 (array_inv!8730 a!445)))

(assert (= (and start!73678 res!267838) b!326266))

(assert (= (and b!326266 res!267840) b!326265))

(assert (= (and b!326265 res!267839) b!326267))

(assert (= (and b!326267 res!267836) b!326268))

(assert (= (and b!326268 res!267837) b!326264))

(declare-fun m!464033 () Bool)

(assert (=> b!326264 m!464033))

(declare-fun m!464035 () Bool)

(assert (=> b!326264 m!464035))

(declare-fun m!464037 () Bool)

(assert (=> b!326265 m!464037))

(declare-fun m!464039 () Bool)

(assert (=> b!326268 m!464039))

(declare-fun m!464041 () Bool)

(assert (=> start!73678 m!464041))

(push 1)

(assert (not b!326265))

(assert (not b!326264))

(assert (not b!326268))

(assert (not start!73678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


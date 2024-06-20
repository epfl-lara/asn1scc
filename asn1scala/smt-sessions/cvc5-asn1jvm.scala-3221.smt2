; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73618 () Bool)

(assert start!73618)

(declare-fun res!267562 () Bool)

(declare-fun e!235106 () Bool)

(assert (=> start!73618 (=> (not res!267562) (not e!235106))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73618 (= res!267562 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73618 e!235106))

(assert (=> start!73618 true))

(declare-datatypes ((array!21110 0))(
  ( (array!21111 (arr!10255 (Array (_ BitVec 32) (_ BitVec 8))) (size!9163 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21110)

(declare-fun array_inv!8715 (array!21110) Bool)

(assert (=> start!73618 (array_inv!8715 a!445)))

(declare-fun b!325964 () Bool)

(declare-fun e!235105 () Bool)

(assert (=> b!325964 (= e!235106 e!235105)))

(declare-fun res!267560 () Bool)

(assert (=> b!325964 (=> (not res!267560) (not e!235105))))

(declare-fun lt!448382 () (_ BitVec 64))

(assert (=> b!325964 (= res!267560 (bvsle i!1031 lt!448382))))

(assert (=> b!325964 (= lt!448382 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9163 a!445))))))

(declare-fun b!325965 () Bool)

(declare-fun res!267561 () Bool)

(assert (=> b!325965 (=> (not res!267561) (not e!235105))))

(declare-fun arrayBitRangesEq!0 (array!21110 array!21110 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325965 (= res!267561 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448382))))

(declare-fun b!325966 () Bool)

(assert (=> b!325966 (= e!235105 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1031 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73618 res!267562) b!325964))

(assert (= (and b!325964 res!267560) b!325965))

(assert (= (and b!325965 res!267561) b!325966))

(declare-fun m!463789 () Bool)

(assert (=> start!73618 m!463789))

(declare-fun m!463791 () Bool)

(assert (=> b!325965 m!463791))

(push 1)

(assert (not b!325965))

(assert (not start!73618))

(check-sat)

(pop 1)

(push 1)

(check-sat)


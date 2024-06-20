; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73670 () Bool)

(assert start!73670)

(declare-fun b!326204 () Bool)

(declare-fun res!267777 () Bool)

(declare-fun e!235309 () Bool)

(assert (=> b!326204 (=> (not res!267777) (not e!235309))))

(declare-fun lt!448451 () (_ BitVec 64))

(declare-fun i!1031 () (_ BitVec 64))

(declare-datatypes ((array!21135 0))(
  ( (array!21136 (arr!10266 (Array (_ BitVec 32) (_ BitVec 8))) (size!9174 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21135)

(declare-fun arrayBitRangesEq!0 (array!21135 array!21135 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326204 (= res!267777 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448451))))

(declare-fun b!326205 () Bool)

(assert (=> b!326205 (= e!235309 (bvsge (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) i!1031))))

(declare-fun b!326206 () Bool)

(declare-fun res!267776 () Bool)

(assert (=> b!326206 (=> (not res!267776) (not e!235309))))

(assert (=> b!326206 (= res!267776 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448451))))

(declare-fun b!326207 () Bool)

(declare-fun res!267778 () Bool)

(assert (=> b!326207 (=> (not res!267778) (not e!235309))))

(assert (=> b!326207 (= res!267778 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448451)))))

(declare-fun b!326208 () Bool)

(declare-fun e!235310 () Bool)

(assert (=> b!326208 (= e!235310 e!235309)))

(declare-fun res!267779 () Bool)

(assert (=> b!326208 (=> (not res!267779) (not e!235309))))

(assert (=> b!326208 (= res!267779 (bvsle i!1031 lt!448451))))

(assert (=> b!326208 (= lt!448451 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9174 a!445))))))

(declare-fun res!267780 () Bool)

(assert (=> start!73670 (=> (not res!267780) (not e!235310))))

(assert (=> start!73670 (= res!267780 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73670 e!235310))

(assert (=> start!73670 true))

(declare-fun array_inv!8726 (array!21135) Bool)

(assert (=> start!73670 (array_inv!8726 a!445)))

(assert (= (and start!73670 res!267780) b!326208))

(assert (= (and b!326208 res!267779) b!326206))

(assert (= (and b!326206 res!267776) b!326207))

(assert (= (and b!326207 res!267778) b!326204))

(assert (= (and b!326204 res!267777) b!326205))

(declare-fun m!463997 () Bool)

(assert (=> b!326204 m!463997))

(declare-fun m!463999 () Bool)

(assert (=> b!326206 m!463999))

(declare-fun m!464001 () Bool)

(assert (=> start!73670 m!464001))

(push 1)

(assert (not b!326206))

(assert (not b!326204))

(assert (not start!73670))

(check-sat)

(pop 1)

(push 1)

(check-sat)


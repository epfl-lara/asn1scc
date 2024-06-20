; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73682 () Bool)

(assert start!73682)

(declare-fun b!326294 () Bool)

(declare-fun res!267870 () Bool)

(declare-fun e!235363 () Bool)

(assert (=> b!326294 (=> (not res!267870) (not e!235363))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448487 () (_ BitVec 64))

(declare-datatypes ((array!21147 0))(
  ( (array!21148 (arr!10272 (Array (_ BitVec 32) (_ BitVec 8))) (size!9180 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21147)

(declare-fun arrayBitRangesEq!0 (array!21147 array!21147 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326294 (= res!267870 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448487))))

(declare-fun b!326295 () Bool)

(assert (=> b!326295 (= e!235363 (not true))))

(assert (=> b!326295 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448487)))

(declare-datatypes ((Unit!22126 0))(
  ( (Unit!22127) )
))
(declare-fun lt!448486 () Unit!22126)

(declare-fun rec!21 (array!21147 (_ BitVec 64)) Unit!22126)

(assert (=> b!326295 (= lt!448486 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!326296 () Bool)

(declare-fun res!267869 () Bool)

(assert (=> b!326296 (=> (not res!267869) (not e!235363))))

(assert (=> b!326296 (= res!267869 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448487))))

(declare-fun b!326297 () Bool)

(declare-fun res!267867 () Bool)

(assert (=> b!326297 (=> (not res!267867) (not e!235363))))

(assert (=> b!326297 (= res!267867 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448487)))))

(declare-fun res!267868 () Bool)

(declare-fun e!235362 () Bool)

(assert (=> start!73682 (=> (not res!267868) (not e!235362))))

(assert (=> start!73682 (= res!267868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73682 e!235362))

(assert (=> start!73682 true))

(declare-fun array_inv!8732 (array!21147) Bool)

(assert (=> start!73682 (array_inv!8732 a!445)))

(declare-fun b!326298 () Bool)

(assert (=> b!326298 (= e!235362 e!235363)))

(declare-fun res!267866 () Bool)

(assert (=> b!326298 (=> (not res!267866) (not e!235363))))

(assert (=> b!326298 (= res!267866 (bvsle i!1031 lt!448487))))

(assert (=> b!326298 (= lt!448487 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9180 a!445))))))

(assert (= (and start!73682 res!267868) b!326298))

(assert (= (and b!326298 res!267866) b!326294))

(assert (= (and b!326294 res!267870) b!326297))

(assert (= (and b!326297 res!267867) b!326296))

(assert (= (and b!326296 res!267869) b!326295))

(declare-fun m!464053 () Bool)

(assert (=> b!326294 m!464053))

(declare-fun m!464055 () Bool)

(assert (=> b!326295 m!464055))

(declare-fun m!464057 () Bool)

(assert (=> b!326295 m!464057))

(declare-fun m!464059 () Bool)

(assert (=> b!326296 m!464059))

(declare-fun m!464061 () Bool)

(assert (=> start!73682 m!464061))

(push 1)

(assert (not b!326295))

(assert (not b!326294))

(assert (not start!73682))

(assert (not b!326296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


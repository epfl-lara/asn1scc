; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73674 () Bool)

(assert start!73674)

(declare-fun b!326234 () Bool)

(declare-fun res!267806 () Bool)

(declare-fun e!235326 () Bool)

(assert (=> b!326234 (=> (not res!267806) (not e!235326))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448463 () (_ BitVec 64))

(assert (=> b!326234 (= res!267806 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448463)))))

(declare-fun b!326235 () Bool)

(declare-fun e!235327 () Bool)

(assert (=> b!326235 (= e!235327 e!235326)))

(declare-fun res!267810 () Bool)

(assert (=> b!326235 (=> (not res!267810) (not e!235326))))

(assert (=> b!326235 (= res!267810 (bvsle i!1031 lt!448463))))

(declare-datatypes ((array!21139 0))(
  ( (array!21140 (arr!10268 (Array (_ BitVec 32) (_ BitVec 8))) (size!9176 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21139)

(assert (=> b!326235 (= lt!448463 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9176 a!445))))))

(declare-fun b!326236 () Bool)

(declare-fun res!267807 () Bool)

(assert (=> b!326236 (=> (not res!267807) (not e!235326))))

(declare-fun arrayBitRangesEq!0 (array!21139 array!21139 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326236 (= res!267807 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448463))))

(declare-fun b!326237 () Bool)

(assert (=> b!326237 (= e!235326 (not (or (= ((_ sign_extend 32) (size!9176 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448463 ((_ sign_extend 32) (size!9176 a!445)))))))))

(assert (=> b!326237 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448463)))

(declare-datatypes ((Unit!22118 0))(
  ( (Unit!22119) )
))
(declare-fun lt!448462 () Unit!22118)

(declare-fun rec!21 (array!21139 (_ BitVec 64)) Unit!22118)

(assert (=> b!326237 (= lt!448462 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!326238 () Bool)

(declare-fun res!267808 () Bool)

(assert (=> b!326238 (=> (not res!267808) (not e!235326))))

(assert (=> b!326238 (= res!267808 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448463))))

(declare-fun res!267809 () Bool)

(assert (=> start!73674 (=> (not res!267809) (not e!235327))))

(assert (=> start!73674 (= res!267809 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73674 e!235327))

(assert (=> start!73674 true))

(declare-fun array_inv!8728 (array!21139) Bool)

(assert (=> start!73674 (array_inv!8728 a!445)))

(assert (= (and start!73674 res!267809) b!326235))

(assert (= (and b!326235 res!267810) b!326238))

(assert (= (and b!326238 res!267808) b!326234))

(assert (= (and b!326234 res!267806) b!326236))

(assert (= (and b!326236 res!267807) b!326237))

(declare-fun m!464013 () Bool)

(assert (=> b!326236 m!464013))

(declare-fun m!464015 () Bool)

(assert (=> b!326237 m!464015))

(declare-fun m!464017 () Bool)

(assert (=> b!326237 m!464017))

(declare-fun m!464019 () Bool)

(assert (=> b!326238 m!464019))

(declare-fun m!464021 () Bool)

(assert (=> start!73674 m!464021))

(check-sat (not b!326236) (not start!73674) (not b!326237) (not b!326238))
(check-sat)

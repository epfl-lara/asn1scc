; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73584 () Bool)

(assert start!73584)

(declare-fun b!325830 () Bool)

(declare-fun e!234990 () Bool)

(assert (=> b!325830 (= e!234990 (not true))))

(declare-datatypes ((array!21076 0))(
  ( (array!21077 (arr!10238 (Array (_ BitVec 32) (_ BitVec 8))) (size!9146 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21076)

(declare-fun lt!448336 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!21076 array!21076 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325830 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448336)))

(declare-datatypes ((Unit!22106 0))(
  ( (Unit!22107) )
))
(declare-fun lt!448337 () Unit!22106)

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun rec!21 (array!21076 (_ BitVec 64)) Unit!22106)

(assert (=> b!325830 (= lt!448337 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!267426 () Bool)

(declare-fun e!234988 () Bool)

(assert (=> start!73584 (=> (not res!267426) (not e!234988))))

(assert (=> start!73584 (= res!267426 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73584 e!234988))

(assert (=> start!73584 true))

(declare-fun array_inv!8698 (array!21076) Bool)

(assert (=> start!73584 (array_inv!8698 a!445)))

(declare-fun b!325831 () Bool)

(declare-fun res!267430 () Bool)

(assert (=> b!325831 (=> (not res!267430) (not e!234990))))

(assert (=> b!325831 (= res!267430 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448336))))

(declare-fun b!325832 () Bool)

(assert (=> b!325832 (= e!234988 e!234990)))

(declare-fun res!267429 () Bool)

(assert (=> b!325832 (=> (not res!267429) (not e!234990))))

(assert (=> b!325832 (= res!267429 (bvsle i!1031 lt!448336))))

(assert (=> b!325832 (= lt!448336 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9146 a!445))))))

(declare-fun b!325833 () Bool)

(declare-fun res!267427 () Bool)

(assert (=> b!325833 (=> (not res!267427) (not e!234990))))

(assert (=> b!325833 (= res!267427 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448336))))

(declare-fun b!325834 () Bool)

(declare-fun res!267428 () Bool)

(assert (=> b!325834 (=> (not res!267428) (not e!234990))))

(assert (=> b!325834 (= res!267428 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448336)))))

(assert (= (and start!73584 res!267426) b!325832))

(assert (= (and b!325832 res!267429) b!325833))

(assert (= (and b!325833 res!267427) b!325834))

(assert (= (and b!325834 res!267428) b!325831))

(assert (= (and b!325831 res!267430) b!325830))

(declare-fun m!463697 () Bool)

(assert (=> b!325830 m!463697))

(declare-fun m!463699 () Bool)

(assert (=> b!325830 m!463699))

(declare-fun m!463701 () Bool)

(assert (=> start!73584 m!463701))

(declare-fun m!463703 () Bool)

(assert (=> b!325831 m!463703))

(declare-fun m!463705 () Bool)

(assert (=> b!325833 m!463705))

(check-sat (not b!325833) (not b!325830) (not b!325831) (not start!73584))

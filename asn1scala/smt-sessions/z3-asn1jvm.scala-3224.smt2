; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73668 () Bool)

(assert start!73668)

(declare-fun res!267762 () Bool)

(declare-fun e!235299 () Bool)

(assert (=> start!73668 (=> (not res!267762) (not e!235299))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73668 (= res!267762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73668 e!235299))

(assert (=> start!73668 true))

(declare-datatypes ((array!21133 0))(
  ( (array!21134 (arr!10265 (Array (_ BitVec 32) (_ BitVec 8))) (size!9173 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21133)

(declare-fun array_inv!8725 (array!21133) Bool)

(assert (=> start!73668 (array_inv!8725 a!445)))

(declare-fun b!326189 () Bool)

(declare-fun e!235301 () Bool)

(assert (=> b!326189 (= e!235301 (bvsge (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) i!1031))))

(declare-fun b!326190 () Bool)

(assert (=> b!326190 (= e!235299 e!235301)))

(declare-fun res!267765 () Bool)

(assert (=> b!326190 (=> (not res!267765) (not e!235301))))

(declare-fun lt!448448 () (_ BitVec 64))

(assert (=> b!326190 (= res!267765 (bvsle i!1031 lt!448448))))

(assert (=> b!326190 (= lt!448448 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9173 a!445))))))

(declare-fun b!326191 () Bool)

(declare-fun res!267761 () Bool)

(assert (=> b!326191 (=> (not res!267761) (not e!235301))))

(assert (=> b!326191 (= res!267761 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448448)))))

(declare-fun b!326192 () Bool)

(declare-fun res!267763 () Bool)

(assert (=> b!326192 (=> (not res!267763) (not e!235301))))

(declare-fun arrayBitRangesEq!0 (array!21133 array!21133 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326192 (= res!267763 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448448))))

(declare-fun b!326193 () Bool)

(declare-fun res!267764 () Bool)

(assert (=> b!326193 (=> (not res!267764) (not e!235301))))

(assert (=> b!326193 (= res!267764 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448448))))

(assert (= (and start!73668 res!267762) b!326190))

(assert (= (and b!326190 res!267765) b!326192))

(assert (= (and b!326192 res!267763) b!326191))

(assert (= (and b!326191 res!267761) b!326193))

(assert (= (and b!326193 res!267764) b!326189))

(declare-fun m!463991 () Bool)

(assert (=> start!73668 m!463991))

(declare-fun m!463993 () Bool)

(assert (=> b!326192 m!463993))

(declare-fun m!463995 () Bool)

(assert (=> b!326193 m!463995))

(check-sat (not b!326193) (not start!73668) (not b!326192))
(check-sat)

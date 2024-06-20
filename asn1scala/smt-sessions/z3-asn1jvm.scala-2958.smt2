; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69948 () Bool)

(assert start!69948)

(declare-fun b!316034 () Bool)

(declare-fun res!259143 () Bool)

(declare-fun e!227161 () Bool)

(assert (=> b!316034 (=> (not res!259143) (not e!227161))))

(declare-datatypes ((array!19479 0))(
  ( (array!19480 (arr!9545 (Array (_ BitVec 32) (_ BitVec 8))) (size!8462 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19479)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19479)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19479 array!19479 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316034 (= res!259143 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316035 () Bool)

(declare-fun res!259138 () Bool)

(assert (=> b!316035 (=> (not res!259138) (not e!227161))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316035 (= res!259138 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316036 () Bool)

(declare-fun res!259140 () Bool)

(assert (=> b!316036 (=> (not res!259140) (not e!227161))))

(declare-fun a1!825 () array!19479)

(assert (=> b!316036 (= res!259140 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316037 () Bool)

(declare-fun res!259144 () Bool)

(assert (=> b!316037 (=> (not res!259144) (not e!227161))))

(assert (=> b!316037 (= res!259144 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!259141 () Bool)

(assert (=> start!69948 (=> (not res!259141) (not e!227161))))

(assert (=> start!69948 (= res!259141 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8462 a1!825) (size!8462 a2!825)) (= (size!8462 a2!825) (size!8462 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8462 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8462 a2!825))))))))

(assert (=> start!69948 e!227161))

(assert (=> start!69948 true))

(declare-fun array_inv!8014 (array!19479) Bool)

(assert (=> start!69948 (array_inv!8014 a1!825)))

(assert (=> start!69948 (array_inv!8014 a3!79)))

(assert (=> start!69948 (array_inv!8014 a2!825)))

(declare-fun b!316038 () Bool)

(declare-fun res!259145 () Bool)

(assert (=> b!316038 (=> (not res!259145) (not e!227161))))

(assert (=> b!316038 (= res!259145 (not (= i!1020 mid!82)))))

(declare-fun b!316039 () Bool)

(declare-fun res!259139 () Bool)

(assert (=> b!316039 (=> (not res!259139) (not e!227161))))

(assert (=> b!316039 (= res!259139 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316040 () Bool)

(assert (=> b!316040 (= e!227161 (not true))))

(assert (=> b!316040 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21679 0))(
  ( (Unit!21680) )
))
(declare-fun lt!442793 () Unit!21679)

(declare-fun arrayBitRangesEqDrop1!0 (array!19479 array!19479 (_ BitVec 64) (_ BitVec 64)) Unit!21679)

(assert (=> b!316040 (= lt!442793 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316040 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442792 () Unit!21679)

(declare-fun arrayBitRangesEqAppend!0 (array!19479 array!19479 (_ BitVec 64) (_ BitVec 64)) Unit!21679)

(assert (=> b!316040 (= lt!442792 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316041 () Bool)

(declare-fun res!259142 () Bool)

(assert (=> b!316041 (=> (not res!259142) (not e!227161))))

(assert (=> b!316041 (= res!259142 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69948 res!259141) b!316036))

(assert (= (and b!316036 res!259140) b!316039))

(assert (= (and b!316039 res!259139) b!316035))

(assert (= (and b!316035 res!259138) b!316037))

(assert (= (and b!316037 res!259144) b!316034))

(assert (= (and b!316034 res!259143) b!316041))

(assert (= (and b!316041 res!259142) b!316038))

(assert (= (and b!316038 res!259145) b!316040))

(declare-fun m!453779 () Bool)

(assert (=> b!316036 m!453779))

(declare-fun m!453781 () Bool)

(assert (=> b!316040 m!453781))

(declare-fun m!453783 () Bool)

(assert (=> b!316040 m!453783))

(declare-fun m!453785 () Bool)

(assert (=> b!316040 m!453785))

(declare-fun m!453787 () Bool)

(assert (=> b!316040 m!453787))

(declare-fun m!453789 () Bool)

(assert (=> b!316037 m!453789))

(declare-fun m!453791 () Bool)

(assert (=> start!69948 m!453791))

(declare-fun m!453793 () Bool)

(assert (=> start!69948 m!453793))

(declare-fun m!453795 () Bool)

(assert (=> start!69948 m!453795))

(declare-fun m!453797 () Bool)

(assert (=> b!316034 m!453797))

(declare-fun m!453799 () Bool)

(assert (=> b!316039 m!453799))

(declare-fun m!453801 () Bool)

(assert (=> b!316041 m!453801))

(check-sat (not b!316040) (not start!69948) (not b!316036) (not b!316037) (not b!316034) (not b!316039) (not b!316041))

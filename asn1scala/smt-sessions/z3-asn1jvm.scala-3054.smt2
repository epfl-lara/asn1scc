; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70766 () Bool)

(assert start!70766)

(declare-fun res!263067 () Bool)

(declare-fun e!230338 () Bool)

(assert (=> start!70766 (=> (not res!263067) (not e!230338))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70766 (= res!263067 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70766 e!230338))

(assert (=> start!70766 true))

(declare-datatypes ((array!20083 0))(
  ( (array!20084 (arr!9842 (Array (_ BitVec 32) (_ BitVec 8))) (size!8750 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20083)

(declare-fun array_inv!8302 (array!20083) Bool)

(assert (=> start!70766 (array_inv!8302 a!425)))

(declare-fun b!320183 () Bool)

(declare-fun e!230340 () Bool)

(assert (=> b!320183 (= e!230338 e!230340)))

(declare-fun res!263068 () Bool)

(assert (=> b!320183 (=> (not res!263068) (not e!230340))))

(declare-fun lt!443864 () (_ BitVec 64))

(assert (=> b!320183 (= res!263068 (bvsle i!979 lt!443864))))

(assert (=> b!320183 (= lt!443864 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8750 a!425))))))

(declare-fun b!320185 () Bool)

(declare-fun res!263065 () Bool)

(assert (=> b!320185 (=> (not res!263065) (not e!230340))))

(assert (=> b!320185 (= res!263065 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320186 () Bool)

(assert (=> b!320186 (= e!230340 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443864))))

(declare-datatypes ((Unit!21949 0))(
  ( (Unit!21950) )
))
(declare-fun lt!443863 () Unit!21949)

(declare-fun rec!17 (array!20083 (_ BitVec 64)) Unit!21949)

(assert (=> b!320186 (= lt!443863 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320184 () Bool)

(declare-fun res!263066 () Bool)

(assert (=> b!320184 (=> (not res!263066) (not e!230340))))

(declare-fun arrayBitRangesEq!0 (array!20083 array!20083 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320184 (= res!263066 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443864))))

(assert (= (and start!70766 res!263067) b!320183))

(assert (= (and b!320183 res!263068) b!320184))

(assert (= (and b!320184 res!263066) b!320185))

(assert (= (and b!320185 res!263065) b!320186))

(declare-fun m!458609 () Bool)

(assert (=> start!70766 m!458609))

(declare-fun m!458611 () Bool)

(assert (=> b!320186 m!458611))

(declare-fun m!458613 () Bool)

(assert (=> b!320184 m!458613))

(check-sat (not b!320186) (not start!70766) (not b!320184))
(check-sat)

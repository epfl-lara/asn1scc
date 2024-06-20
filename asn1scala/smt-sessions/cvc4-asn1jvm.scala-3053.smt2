; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70762 () Bool)

(assert start!70762)

(declare-fun b!320161 () Bool)

(declare-fun res!263043 () Bool)

(declare-fun e!230322 () Bool)

(assert (=> b!320161 (=> (not res!263043) (not e!230322))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> b!320161 (= res!263043 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320159 () Bool)

(declare-fun e!230321 () Bool)

(assert (=> b!320159 (= e!230321 e!230322)))

(declare-fun res!263042 () Bool)

(assert (=> b!320159 (=> (not res!263042) (not e!230322))))

(declare-fun lt!443851 () (_ BitVec 64))

(assert (=> b!320159 (= res!263042 (bvsle i!979 lt!443851))))

(declare-datatypes ((array!20079 0))(
  ( (array!20080 (arr!9840 (Array (_ BitVec 32) (_ BitVec 8))) (size!8748 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20079)

(assert (=> b!320159 (= lt!443851 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8748 a!425))))))

(declare-fun b!320162 () Bool)

(assert (=> b!320162 (= e!230322 false)))

(declare-datatypes ((Unit!21945 0))(
  ( (Unit!21946) )
))
(declare-fun lt!443852 () Unit!21945)

(declare-fun rec!17 (array!20079 (_ BitVec 64)) Unit!21945)

(assert (=> b!320162 (= lt!443852 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!263041 () Bool)

(assert (=> start!70762 (=> (not res!263041) (not e!230321))))

(assert (=> start!70762 (= res!263041 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70762 e!230321))

(assert (=> start!70762 true))

(declare-fun array_inv!8300 (array!20079) Bool)

(assert (=> start!70762 (array_inv!8300 a!425)))

(declare-fun b!320160 () Bool)

(declare-fun res!263044 () Bool)

(assert (=> b!320160 (=> (not res!263044) (not e!230322))))

(declare-fun arrayBitRangesEq!0 (array!20079 array!20079 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320160 (= res!263044 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443851))))

(assert (= (and start!70762 res!263041) b!320159))

(assert (= (and b!320159 res!263042) b!320160))

(assert (= (and b!320160 res!263044) b!320161))

(assert (= (and b!320161 res!263043) b!320162))

(declare-fun m!458597 () Bool)

(assert (=> b!320162 m!458597))

(declare-fun m!458599 () Bool)

(assert (=> start!70762 m!458599))

(declare-fun m!458601 () Bool)

(assert (=> b!320160 m!458601))

(push 1)

(assert (not b!320162))

(assert (not start!70762))

(assert (not b!320160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


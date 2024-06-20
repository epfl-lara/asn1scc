; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70758 () Bool)

(assert start!70758)

(declare-fun b!320137 () Bool)

(declare-fun res!263020 () Bool)

(declare-fun e!230304 () Bool)

(assert (=> b!320137 (=> (not res!263020) (not e!230304))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> b!320137 (= res!263020 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320135 () Bool)

(declare-fun e!230303 () Bool)

(assert (=> b!320135 (= e!230303 e!230304)))

(declare-fun res!263018 () Bool)

(assert (=> b!320135 (=> (not res!263018) (not e!230304))))

(declare-fun lt!443839 () (_ BitVec 64))

(assert (=> b!320135 (= res!263018 (bvsle i!979 lt!443839))))

(declare-datatypes ((array!20075 0))(
  ( (array!20076 (arr!9838 (Array (_ BitVec 32) (_ BitVec 8))) (size!8746 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20075)

(assert (=> b!320135 (= lt!443839 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8746 a!425))))))

(declare-fun b!320136 () Bool)

(declare-fun res!263019 () Bool)

(assert (=> b!320136 (=> (not res!263019) (not e!230304))))

(declare-fun arrayBitRangesEq!0 (array!20075 array!20075 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320136 (= res!263019 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443839))))

(declare-fun b!320138 () Bool)

(assert (=> b!320138 (= e!230304 false)))

(declare-datatypes ((Unit!21941 0))(
  ( (Unit!21942) )
))
(declare-fun lt!443840 () Unit!21941)

(declare-fun rec!17 (array!20075 (_ BitVec 64)) Unit!21941)

(assert (=> b!320138 (= lt!443840 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!263017 () Bool)

(assert (=> start!70758 (=> (not res!263017) (not e!230303))))

(assert (=> start!70758 (= res!263017 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70758 e!230303))

(assert (=> start!70758 true))

(declare-fun array_inv!8298 (array!20075) Bool)

(assert (=> start!70758 (array_inv!8298 a!425)))

(assert (= (and start!70758 res!263017) b!320135))

(assert (= (and b!320135 res!263018) b!320136))

(assert (= (and b!320136 res!263019) b!320137))

(assert (= (and b!320137 res!263020) b!320138))

(declare-fun m!458585 () Bool)

(assert (=> b!320136 m!458585))

(declare-fun m!458587 () Bool)

(assert (=> b!320138 m!458587))

(declare-fun m!458589 () Bool)

(assert (=> start!70758 m!458589))

(push 1)

(assert (not start!70758))

(assert (not b!320136))

(assert (not b!320138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


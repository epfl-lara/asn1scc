; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70764 () Bool)

(assert start!70764)

(declare-fun b!320172 () Bool)

(declare-fun res!263056 () Bool)

(declare-fun e!230330 () Bool)

(assert (=> b!320172 (=> (not res!263056) (not e!230330))))

(declare-datatypes ((array!20081 0))(
  ( (array!20082 (arr!9841 (Array (_ BitVec 32) (_ BitVec 8))) (size!8749 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20081)

(declare-fun i!979 () (_ BitVec 64))

(declare-fun lt!443857 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!20081 array!20081 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320172 (= res!263056 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443857))))

(declare-fun b!320171 () Bool)

(declare-fun e!230331 () Bool)

(assert (=> b!320171 (= e!230331 e!230330)))

(declare-fun res!263055 () Bool)

(assert (=> b!320171 (=> (not res!263055) (not e!230330))))

(assert (=> b!320171 (= res!263055 (bvsle i!979 lt!443857))))

(assert (=> b!320171 (= lt!443857 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8749 a!425))))))

(declare-fun b!320173 () Bool)

(declare-fun res!263053 () Bool)

(assert (=> b!320173 (=> (not res!263053) (not e!230330))))

(assert (=> b!320173 (= res!263053 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!263054 () Bool)

(assert (=> start!70764 (=> (not res!263054) (not e!230331))))

(assert (=> start!70764 (= res!263054 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70764 e!230331))

(assert (=> start!70764 true))

(declare-fun array_inv!8301 (array!20081) Bool)

(assert (=> start!70764 (array_inv!8301 a!425)))

(declare-fun b!320174 () Bool)

(assert (=> b!320174 (= e!230330 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443857))))

(declare-datatypes ((Unit!21947 0))(
  ( (Unit!21948) )
))
(declare-fun lt!443858 () Unit!21947)

(declare-fun rec!17 (array!20081 (_ BitVec 64)) Unit!21947)

(assert (=> b!320174 (= lt!443858 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!70764 res!263054) b!320171))

(assert (= (and b!320171 res!263055) b!320172))

(assert (= (and b!320172 res!263056) b!320173))

(assert (= (and b!320173 res!263053) b!320174))

(declare-fun m!458603 () Bool)

(assert (=> b!320172 m!458603))

(declare-fun m!458605 () Bool)

(assert (=> start!70764 m!458605))

(declare-fun m!458607 () Bool)

(assert (=> b!320174 m!458607))

(push 1)

(assert (not b!320174))

(assert (not start!70764))

(assert (not b!320172))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70804 () Bool)

(assert start!70804)

(declare-fun res!263196 () Bool)

(declare-fun e!230473 () Bool)

(assert (=> start!70804 (=> (not res!263196) (not e!230473))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70804 (= res!263196 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70804 e!230473))

(assert (=> start!70804 true))

(declare-datatypes ((array!20121 0))(
  ( (array!20122 (arr!9861 (Array (_ BitVec 32) (_ BitVec 8))) (size!8769 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20121)

(declare-fun array_inv!8321 (array!20121) Bool)

(assert (=> start!70804 (array_inv!8321 a!425)))

(declare-fun b!320313 () Bool)

(declare-fun e!230475 () Bool)

(assert (=> b!320313 (= e!230473 e!230475)))

(declare-fun res!263195 () Bool)

(assert (=> b!320313 (=> (not res!263195) (not e!230475))))

(declare-fun lt!443906 () (_ BitVec 64))

(assert (=> b!320313 (= res!263195 (bvsle i!979 lt!443906))))

(assert (=> b!320313 (= lt!443906 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8769 a!425))))))

(declare-fun b!320314 () Bool)

(declare-fun res!263197 () Bool)

(assert (=> b!320314 (=> (not res!263197) (not e!230475))))

(declare-fun arrayBitRangesEq!0 (array!20121 array!20121 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320314 (= res!263197 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443906))))

(declare-fun b!320315 () Bool)

(assert (=> b!320315 (= e!230475 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) i!979)))))

(assert (= (and start!70804 res!263196) b!320313))

(assert (= (and b!320313 res!263195) b!320314))

(assert (= (and b!320314 res!263197) b!320315))

(declare-fun m!458683 () Bool)

(assert (=> start!70804 m!458683))

(declare-fun m!458685 () Bool)

(assert (=> b!320314 m!458685))

(push 1)

(assert (not start!70804))

(assert (not b!320314))

(check-sat)

(pop 1)

(push 1)

(check-sat)


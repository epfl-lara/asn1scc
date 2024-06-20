; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70782 () Bool)

(assert start!70782)

(declare-fun res!263088 () Bool)

(declare-fun e!230376 () Bool)

(assert (=> start!70782 (=> (not res!263088) (not e!230376))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70782 (= res!263088 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70782 e!230376))

(assert (=> start!70782 true))

(declare-datatypes ((array!20099 0))(
  ( (array!20100 (arr!9850 (Array (_ BitVec 32) (_ BitVec 8))) (size!8758 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20099)

(declare-fun array_inv!8310 (array!20099) Bool)

(assert (=> start!70782 (array_inv!8310 a!425)))

(declare-fun b!320205 () Bool)

(declare-fun e!230374 () Bool)

(assert (=> b!320205 (= e!230376 e!230374)))

(declare-fun res!263087 () Bool)

(assert (=> b!320205 (=> (not res!263087) (not e!230374))))

(declare-fun lt!443873 () (_ BitVec 64))

(assert (=> b!320205 (= res!263087 (bvsle i!979 lt!443873))))

(assert (=> b!320205 (= lt!443873 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8758 a!425))))))

(declare-fun b!320206 () Bool)

(declare-fun res!263089 () Bool)

(assert (=> b!320206 (=> (not res!263089) (not e!230374))))

(declare-fun arrayBitRangesEq!0 (array!20099 array!20099 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320206 (= res!263089 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443873))))

(declare-fun b!320207 () Bool)

(assert (=> b!320207 (= e!230374 (and (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= ((_ sign_extend 32) (size!8758 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443873 ((_ sign_extend 32) (size!8758 a!425)))))))))

(assert (= (and start!70782 res!263088) b!320205))

(assert (= (and b!320205 res!263087) b!320206))

(assert (= (and b!320206 res!263089) b!320207))

(declare-fun m!458633 () Bool)

(assert (=> start!70782 m!458633))

(declare-fun m!458635 () Bool)

(assert (=> b!320206 m!458635))

(push 1)

(assert (not b!320206))

(assert (not start!70782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


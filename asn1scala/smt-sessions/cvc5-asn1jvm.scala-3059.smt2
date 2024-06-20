; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70794 () Bool)

(assert start!70794)

(declare-fun res!263151 () Bool)

(declare-fun e!230429 () Bool)

(assert (=> start!70794 (=> (not res!263151) (not e!230429))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70794 (= res!263151 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70794 e!230429))

(assert (=> start!70794 true))

(declare-datatypes ((array!20111 0))(
  ( (array!20112 (arr!9856 (Array (_ BitVec 32) (_ BitVec 8))) (size!8764 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20111)

(declare-fun array_inv!8316 (array!20111) Bool)

(assert (=> start!70794 (array_inv!8316 a!425)))

(declare-fun b!320268 () Bool)

(declare-fun e!230430 () Bool)

(assert (=> b!320268 (= e!230429 e!230430)))

(declare-fun res!263150 () Bool)

(assert (=> b!320268 (=> (not res!263150) (not e!230430))))

(declare-fun lt!443891 () (_ BitVec 64))

(assert (=> b!320268 (= res!263150 (bvsle i!979 lt!443891))))

(assert (=> b!320268 (= lt!443891 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8764 a!425))))))

(declare-fun b!320269 () Bool)

(declare-fun res!263152 () Bool)

(assert (=> b!320269 (=> (not res!263152) (not e!230430))))

(declare-fun arrayBitRangesEq!0 (array!20111 array!20111 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320269 (= res!263152 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443891))))

(declare-fun b!320270 () Bool)

(assert (=> b!320270 (= e!230430 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!979 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70794 res!263151) b!320268))

(assert (= (and b!320268 res!263150) b!320269))

(assert (= (and b!320269 res!263152) b!320270))

(declare-fun m!458663 () Bool)

(assert (=> start!70794 m!458663))

(declare-fun m!458665 () Bool)

(assert (=> b!320269 m!458665))

(push 1)

(assert (not b!320269))

(assert (not start!70794))

(check-sat)

(pop 1)

(push 1)

(check-sat)


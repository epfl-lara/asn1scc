; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70798 () Bool)

(assert start!70798)

(declare-fun res!263168 () Bool)

(declare-fun e!230447 () Bool)

(assert (=> start!70798 (=> (not res!263168) (not e!230447))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70798 (= res!263168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70798 e!230447))

(assert (=> start!70798 true))

(declare-datatypes ((array!20115 0))(
  ( (array!20116 (arr!9858 (Array (_ BitVec 32) (_ BitVec 8))) (size!8766 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20115)

(declare-fun array_inv!8318 (array!20115) Bool)

(assert (=> start!70798 (array_inv!8318 a!425)))

(declare-fun b!320286 () Bool)

(declare-fun e!230448 () Bool)

(assert (=> b!320286 (= e!230447 e!230448)))

(declare-fun res!263169 () Bool)

(assert (=> b!320286 (=> (not res!263169) (not e!230448))))

(declare-fun lt!443897 () (_ BitVec 64))

(assert (=> b!320286 (= res!263169 (bvsle i!979 lt!443897))))

(assert (=> b!320286 (= lt!443897 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8766 a!425))))))

(declare-fun b!320287 () Bool)

(declare-fun res!263170 () Bool)

(assert (=> b!320287 (=> (not res!263170) (not e!230448))))

(declare-fun arrayBitRangesEq!0 (array!20115 array!20115 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320287 (= res!263170 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443897))))

(declare-fun b!320288 () Bool)

(assert (=> b!320288 (= e!230448 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!979 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70798 res!263168) b!320286))

(assert (= (and b!320286 res!263169) b!320287))

(assert (= (and b!320287 res!263170) b!320288))

(declare-fun m!458671 () Bool)

(assert (=> start!70798 m!458671))

(declare-fun m!458673 () Bool)

(assert (=> b!320287 m!458673))

(push 1)

(assert (not start!70798))

(assert (not b!320287))

(check-sat)

(pop 1)

(push 1)

(check-sat)


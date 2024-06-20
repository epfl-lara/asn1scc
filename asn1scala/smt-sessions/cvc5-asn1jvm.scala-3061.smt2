; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70806 () Bool)

(assert start!70806)

(declare-fun b!320327 () Bool)

(declare-fun e!230482 () Bool)

(declare-datatypes ((array!20123 0))(
  ( (array!20124 (arr!9862 (Array (_ BitVec 32) (_ BitVec 8))) (size!8770 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20123)

(declare-fun lt!443912 () (_ BitVec 64))

(assert (=> b!320327 (= e!230482 (and (not (= ((_ sign_extend 32) (size!8770 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443912 ((_ sign_extend 32) (size!8770 a!425)))))))))

(declare-datatypes ((Unit!21953 0))(
  ( (Unit!21954) )
))
(declare-fun lt!443911 () Unit!21953)

(declare-fun i!979 () (_ BitVec 64))

(declare-fun rec!17 (array!20123 (_ BitVec 64)) Unit!21953)

(assert (=> b!320327 (= lt!443911 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320324 () Bool)

(declare-fun e!230484 () Bool)

(assert (=> b!320324 (= e!230484 e!230482)))

(declare-fun res!263208 () Bool)

(assert (=> b!320324 (=> (not res!263208) (not e!230482))))

(assert (=> b!320324 (= res!263208 (bvsle i!979 lt!443912))))

(assert (=> b!320324 (= lt!443912 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8770 a!425))))))

(declare-fun b!320325 () Bool)

(declare-fun res!263206 () Bool)

(assert (=> b!320325 (=> (not res!263206) (not e!230482))))

(declare-fun arrayBitRangesEq!0 (array!20123 array!20123 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320325 (= res!263206 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443912))))

(declare-fun b!320326 () Bool)

(declare-fun res!263207 () Bool)

(assert (=> b!320326 (=> (not res!263207) (not e!230482))))

(assert (=> b!320326 (= res!263207 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!263209 () Bool)

(assert (=> start!70806 (=> (not res!263209) (not e!230484))))

(assert (=> start!70806 (= res!263209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70806 e!230484))

(assert (=> start!70806 true))

(declare-fun array_inv!8322 (array!20123) Bool)

(assert (=> start!70806 (array_inv!8322 a!425)))

(assert (= (and start!70806 res!263209) b!320324))

(assert (= (and b!320324 res!263208) b!320325))

(assert (= (and b!320325 res!263206) b!320326))

(assert (= (and b!320326 res!263207) b!320327))

(declare-fun m!458687 () Bool)

(assert (=> b!320327 m!458687))

(declare-fun m!458689 () Bool)

(assert (=> b!320325 m!458689))

(declare-fun m!458691 () Bool)

(assert (=> start!70806 m!458691))

(push 1)

(assert (not start!70806))

(assert (not b!320325))

(assert (not b!320327))

(check-sat)

(pop 1)

(push 1)

(check-sat)


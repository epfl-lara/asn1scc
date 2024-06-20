; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70784 () Bool)

(assert start!70784)

(declare-fun res!263098 () Bool)

(declare-fun e!230385 () Bool)

(assert (=> start!70784 (=> (not res!263098) (not e!230385))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70784 (= res!263098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70784 e!230385))

(assert (=> start!70784 true))

(declare-datatypes ((array!20101 0))(
  ( (array!20102 (arr!9851 (Array (_ BitVec 32) (_ BitVec 8))) (size!8759 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20101)

(declare-fun array_inv!8311 (array!20101) Bool)

(assert (=> start!70784 (array_inv!8311 a!425)))

(declare-fun b!320214 () Bool)

(declare-fun e!230383 () Bool)

(assert (=> b!320214 (= e!230385 e!230383)))

(declare-fun res!263097 () Bool)

(assert (=> b!320214 (=> (not res!263097) (not e!230383))))

(declare-fun lt!443876 () (_ BitVec 64))

(assert (=> b!320214 (= res!263097 (bvsle i!979 lt!443876))))

(assert (=> b!320214 (= lt!443876 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8759 a!425))))))

(declare-fun b!320215 () Bool)

(declare-fun res!263096 () Bool)

(assert (=> b!320215 (=> (not res!263096) (not e!230383))))

(declare-fun arrayBitRangesEq!0 (array!20101 array!20101 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320215 (= res!263096 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443876))))

(declare-fun b!320216 () Bool)

(assert (=> b!320216 (= e!230383 (and (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= ((_ sign_extend 32) (size!8759 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443876 ((_ sign_extend 32) (size!8759 a!425)))))))))

(assert (= (and start!70784 res!263098) b!320214))

(assert (= (and b!320214 res!263097) b!320215))

(assert (= (and b!320215 res!263096) b!320216))

(declare-fun m!458637 () Bool)

(assert (=> start!70784 m!458637))

(declare-fun m!458639 () Bool)

(assert (=> b!320215 m!458639))

(check-sat (not b!320215) (not start!70784))
(check-sat)

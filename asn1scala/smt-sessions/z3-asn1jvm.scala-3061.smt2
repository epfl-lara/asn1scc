; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70808 () Bool)

(assert start!70808)

(declare-fun b!320339 () Bool)

(declare-fun e!230492 () Bool)

(declare-datatypes ((array!20125 0))(
  ( (array!20126 (arr!9863 (Array (_ BitVec 32) (_ BitVec 8))) (size!8771 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20125)

(declare-fun lt!443917 () (_ BitVec 64))

(assert (=> b!320339 (= e!230492 (and (not (= ((_ sign_extend 32) (size!8771 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443917 ((_ sign_extend 32) (size!8771 a!425)))))))))

(declare-datatypes ((Unit!21955 0))(
  ( (Unit!21956) )
))
(declare-fun lt!443918 () Unit!21955)

(declare-fun i!979 () (_ BitVec 64))

(declare-fun rec!17 (array!20125 (_ BitVec 64)) Unit!21955)

(assert (=> b!320339 (= lt!443918 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!263219 () Bool)

(declare-fun e!230491 () Bool)

(assert (=> start!70808 (=> (not res!263219) (not e!230491))))

(assert (=> start!70808 (= res!263219 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70808 e!230491))

(assert (=> start!70808 true))

(declare-fun array_inv!8323 (array!20125) Bool)

(assert (=> start!70808 (array_inv!8323 a!425)))

(declare-fun b!320336 () Bool)

(assert (=> b!320336 (= e!230491 e!230492)))

(declare-fun res!263221 () Bool)

(assert (=> b!320336 (=> (not res!263221) (not e!230492))))

(assert (=> b!320336 (= res!263221 (bvsle i!979 lt!443917))))

(assert (=> b!320336 (= lt!443917 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8771 a!425))))))

(declare-fun b!320337 () Bool)

(declare-fun res!263218 () Bool)

(assert (=> b!320337 (=> (not res!263218) (not e!230492))))

(declare-fun arrayBitRangesEq!0 (array!20125 array!20125 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320337 (= res!263218 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443917))))

(declare-fun b!320338 () Bool)

(declare-fun res!263220 () Bool)

(assert (=> b!320338 (=> (not res!263220) (not e!230492))))

(assert (=> b!320338 (= res!263220 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!70808 res!263219) b!320336))

(assert (= (and b!320336 res!263221) b!320337))

(assert (= (and b!320337 res!263218) b!320338))

(assert (= (and b!320338 res!263220) b!320339))

(declare-fun m!458693 () Bool)

(assert (=> b!320339 m!458693))

(declare-fun m!458695 () Bool)

(assert (=> start!70808 m!458695))

(declare-fun m!458697 () Bool)

(assert (=> b!320337 m!458697))

(check-sat (not start!70808) (not b!320337) (not b!320339))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70802 () Bool)

(assert start!70802)

(declare-fun res!263188 () Bool)

(declare-fun e!230464 () Bool)

(assert (=> start!70802 (=> (not res!263188) (not e!230464))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70802 (= res!263188 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70802 e!230464))

(assert (=> start!70802 true))

(declare-datatypes ((array!20119 0))(
  ( (array!20120 (arr!9860 (Array (_ BitVec 32) (_ BitVec 8))) (size!8768 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20119)

(declare-fun array_inv!8320 (array!20119) Bool)

(assert (=> start!70802 (array_inv!8320 a!425)))

(declare-fun b!320304 () Bool)

(declare-fun e!230465 () Bool)

(assert (=> b!320304 (= e!230464 e!230465)))

(declare-fun res!263187 () Bool)

(assert (=> b!320304 (=> (not res!263187) (not e!230465))))

(declare-fun lt!443903 () (_ BitVec 64))

(assert (=> b!320304 (= res!263187 (bvsle i!979 lt!443903))))

(assert (=> b!320304 (= lt!443903 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8768 a!425))))))

(declare-fun b!320305 () Bool)

(declare-fun res!263186 () Bool)

(assert (=> b!320305 (=> (not res!263186) (not e!230465))))

(declare-fun arrayBitRangesEq!0 (array!20119 array!20119 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320305 (= res!263186 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443903))))

(declare-fun b!320306 () Bool)

(assert (=> b!320306 (= e!230465 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) i!979)))))

(assert (= (and start!70802 res!263188) b!320304))

(assert (= (and b!320304 res!263187) b!320305))

(assert (= (and b!320305 res!263186) b!320306))

(declare-fun m!458679 () Bool)

(assert (=> start!70802 m!458679))

(declare-fun m!458681 () Bool)

(assert (=> b!320305 m!458681))

(check-sat (not b!320305) (not start!70802))
(check-sat)

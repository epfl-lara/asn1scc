; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70718 () Bool)

(assert start!70718)

(declare-fun res!262866 () Bool)

(declare-fun e!230150 () Bool)

(assert (=> start!70718 (=> (not res!262866) (not e!230150))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70718 (= res!262866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70718 e!230150))

(assert (=> start!70718 true))

(declare-datatypes ((array!20062 0))(
  ( (array!20063 (arr!9833 (Array (_ BitVec 32) (_ BitVec 8))) (size!8741 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20062)

(declare-fun array_inv!8293 (array!20062) Bool)

(assert (=> start!70718 (array_inv!8293 a!425)))

(declare-fun b!319959 () Bool)

(declare-fun e!230151 () Bool)

(assert (=> b!319959 (= e!230150 e!230151)))

(declare-fun res!262865 () Bool)

(assert (=> b!319959 (=> (not res!262865) (not e!230151))))

(declare-fun lt!443786 () (_ BitVec 64))

(assert (=> b!319959 (= res!262865 (bvsle i!979 lt!443786))))

(assert (=> b!319959 (= lt!443786 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8741 a!425))))))

(declare-fun b!319960 () Bool)

(declare-fun res!262867 () Bool)

(assert (=> b!319960 (=> (not res!262867) (not e!230151))))

(declare-fun arrayBitRangesEq!0 (array!20062 array!20062 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319960 (= res!262867 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443786))))

(declare-fun b!319961 () Bool)

(assert (=> b!319961 (= e!230151 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) lt!443786))))))

(assert (= (and start!70718 res!262866) b!319959))

(assert (= (and b!319959 res!262865) b!319960))

(assert (= (and b!319960 res!262867) b!319961))

(declare-fun m!458397 () Bool)

(assert (=> start!70718 m!458397))

(declare-fun m!458399 () Bool)

(assert (=> b!319960 m!458399))

(check-sat (not b!319960) (not start!70718))
(check-sat)

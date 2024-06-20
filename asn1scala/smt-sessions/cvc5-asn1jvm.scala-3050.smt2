; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70710 () Bool)

(assert start!70710)

(declare-fun res!262831 () Bool)

(declare-fun e!230115 () Bool)

(assert (=> start!70710 (=> (not res!262831) (not e!230115))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70710 (= res!262831 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70710 e!230115))

(assert (=> start!70710 true))

(declare-datatypes ((array!20054 0))(
  ( (array!20055 (arr!9829 (Array (_ BitVec 32) (_ BitVec 8))) (size!8737 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20054)

(declare-fun array_inv!8289 (array!20054) Bool)

(assert (=> start!70710 (array_inv!8289 a!425)))

(declare-fun b!319923 () Bool)

(declare-fun e!230114 () Bool)

(assert (=> b!319923 (= e!230115 e!230114)))

(declare-fun res!262830 () Bool)

(assert (=> b!319923 (=> (not res!262830) (not e!230114))))

(declare-fun lt!443774 () (_ BitVec 64))

(assert (=> b!319923 (= res!262830 (bvsle i!979 lt!443774))))

(assert (=> b!319923 (= lt!443774 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8737 a!425))))))

(declare-fun b!319924 () Bool)

(declare-fun res!262829 () Bool)

(assert (=> b!319924 (=> (not res!262829) (not e!230114))))

(declare-fun arrayBitRangesEq!0 (array!20054 array!20054 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319924 (= res!262829 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443774))))

(declare-fun b!319925 () Bool)

(assert (=> b!319925 (= e!230114 (and (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443774)))))

(assert (= (and start!70710 res!262831) b!319923))

(assert (= (and b!319923 res!262830) b!319924))

(assert (= (and b!319924 res!262829) b!319925))

(declare-fun m!458381 () Bool)

(assert (=> start!70710 m!458381))

(declare-fun m!458383 () Bool)

(assert (=> b!319924 m!458383))

(push 1)

(assert (not start!70710))

(assert (not b!319924))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70712 () Bool)

(assert start!70712)

(declare-fun res!262839 () Bool)

(declare-fun e!230123 () Bool)

(assert (=> start!70712 (=> (not res!262839) (not e!230123))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70712 (= res!262839 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70712 e!230123))

(assert (=> start!70712 true))

(declare-datatypes ((array!20056 0))(
  ( (array!20057 (arr!9830 (Array (_ BitVec 32) (_ BitVec 8))) (size!8738 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20056)

(declare-fun array_inv!8290 (array!20056) Bool)

(assert (=> start!70712 (array_inv!8290 a!425)))

(declare-fun b!319932 () Bool)

(declare-fun e!230122 () Bool)

(assert (=> b!319932 (= e!230123 e!230122)))

(declare-fun res!262838 () Bool)

(assert (=> b!319932 (=> (not res!262838) (not e!230122))))

(declare-fun lt!443777 () (_ BitVec 64))

(assert (=> b!319932 (= res!262838 (bvsle i!979 lt!443777))))

(assert (=> b!319932 (= lt!443777 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8738 a!425))))))

(declare-fun b!319933 () Bool)

(declare-fun res!262840 () Bool)

(assert (=> b!319933 (=> (not res!262840) (not e!230122))))

(declare-fun arrayBitRangesEq!0 (array!20056 array!20056 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319933 (= res!262840 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443777))))

(declare-fun b!319934 () Bool)

(assert (=> b!319934 (= e!230122 (and (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443777)))))

(assert (= (and start!70712 res!262839) b!319932))

(assert (= (and b!319932 res!262838) b!319933))

(assert (= (and b!319933 res!262840) b!319934))

(declare-fun m!458385 () Bool)

(assert (=> start!70712 m!458385))

(declare-fun m!458387 () Bool)

(assert (=> b!319933 m!458387))

(check-sat (not b!319933) (not start!70712))
(check-sat)

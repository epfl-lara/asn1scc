; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70716 () Bool)

(assert start!70716)

(declare-fun res!262856 () Bool)

(declare-fun e!230141 () Bool)

(assert (=> start!70716 (=> (not res!262856) (not e!230141))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70716 (= res!262856 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70716 e!230141))

(assert (=> start!70716 true))

(declare-datatypes ((array!20060 0))(
  ( (array!20061 (arr!9832 (Array (_ BitVec 32) (_ BitVec 8))) (size!8740 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20060)

(declare-fun array_inv!8292 (array!20060) Bool)

(assert (=> start!70716 (array_inv!8292 a!425)))

(declare-fun b!319950 () Bool)

(declare-fun e!230140 () Bool)

(assert (=> b!319950 (= e!230141 e!230140)))

(declare-fun res!262857 () Bool)

(assert (=> b!319950 (=> (not res!262857) (not e!230140))))

(declare-fun lt!443783 () (_ BitVec 64))

(assert (=> b!319950 (= res!262857 (bvsle i!979 lt!443783))))

(assert (=> b!319950 (= lt!443783 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8740 a!425))))))

(declare-fun b!319951 () Bool)

(declare-fun res!262858 () Bool)

(assert (=> b!319951 (=> (not res!262858) (not e!230140))))

(declare-fun arrayBitRangesEq!0 (array!20060 array!20060 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319951 (= res!262858 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443783))))

(declare-fun b!319952 () Bool)

(assert (=> b!319952 (= e!230140 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) lt!443783))))))

(assert (= (and start!70716 res!262856) b!319950))

(assert (= (and b!319950 res!262857) b!319951))

(assert (= (and b!319951 res!262858) b!319952))

(declare-fun m!458393 () Bool)

(assert (=> start!70716 m!458393))

(declare-fun m!458395 () Bool)

(assert (=> b!319951 m!458395))

(push 1)

(assert (not start!70716))

(assert (not b!319951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70792 () Bool)

(assert start!70792)

(declare-fun b!320259 () Bool)

(declare-fun res!263141 () Bool)

(declare-fun e!230420 () Bool)

(assert (=> b!320259 (=> (not res!263141) (not e!230420))))

(declare-datatypes ((array!20109 0))(
  ( (array!20110 (arr!9855 (Array (_ BitVec 32) (_ BitVec 8))) (size!8763 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20109)

(declare-fun lt!443888 () (_ BitVec 64))

(declare-fun i!979 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!20109 array!20109 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320259 (= res!263141 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443888))))

(declare-fun res!263142 () Bool)

(declare-fun e!230421 () Bool)

(assert (=> start!70792 (=> (not res!263142) (not e!230421))))

(assert (=> start!70792 (= res!263142 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70792 e!230421))

(assert (=> start!70792 true))

(declare-fun array_inv!8315 (array!20109) Bool)

(assert (=> start!70792 (array_inv!8315 a!425)))

(declare-fun b!320260 () Bool)

(declare-fun res!263143 () Bool)

(assert (=> b!320260 (=> (not res!263143) (not e!230420))))

(assert (=> b!320260 (= res!263143 (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320261 () Bool)

(assert (=> b!320261 (= e!230420 (not (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443888)))))

(declare-fun b!320258 () Bool)

(assert (=> b!320258 (= e!230421 e!230420)))

(declare-fun res!263140 () Bool)

(assert (=> b!320258 (=> (not res!263140) (not e!230420))))

(assert (=> b!320258 (= res!263140 (bvsle i!979 lt!443888))))

(assert (=> b!320258 (= lt!443888 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8763 a!425))))))

(assert (= (and start!70792 res!263142) b!320258))

(assert (= (and b!320258 res!263140) b!320259))

(assert (= (and b!320259 res!263141) b!320260))

(assert (= (and b!320260 res!263143) b!320261))

(declare-fun m!458657 () Bool)

(assert (=> b!320259 m!458657))

(declare-fun m!458659 () Bool)

(assert (=> start!70792 m!458659))

(declare-fun m!458661 () Bool)

(assert (=> b!320261 m!458661))

(push 1)

(assert (not b!320261))

(assert (not b!320259))

(assert (not start!70792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


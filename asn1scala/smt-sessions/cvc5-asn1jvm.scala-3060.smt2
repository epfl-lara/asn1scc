; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70800 () Bool)

(assert start!70800)

(declare-fun res!263177 () Bool)

(declare-fun e!230455 () Bool)

(assert (=> start!70800 (=> (not res!263177) (not e!230455))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70800 (= res!263177 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70800 e!230455))

(assert (=> start!70800 true))

(declare-datatypes ((array!20117 0))(
  ( (array!20118 (arr!9859 (Array (_ BitVec 32) (_ BitVec 8))) (size!8767 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20117)

(declare-fun array_inv!8319 (array!20117) Bool)

(assert (=> start!70800 (array_inv!8319 a!425)))

(declare-fun b!320295 () Bool)

(declare-fun e!230457 () Bool)

(assert (=> b!320295 (= e!230455 e!230457)))

(declare-fun res!263179 () Bool)

(assert (=> b!320295 (=> (not res!263179) (not e!230457))))

(declare-fun lt!443900 () (_ BitVec 64))

(assert (=> b!320295 (= res!263179 (bvsle i!979 lt!443900))))

(assert (=> b!320295 (= lt!443900 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8767 a!425))))))

(declare-fun b!320296 () Bool)

(declare-fun res!263178 () Bool)

(assert (=> b!320296 (=> (not res!263178) (not e!230457))))

(declare-fun arrayBitRangesEq!0 (array!20117 array!20117 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320296 (= res!263178 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443900))))

(declare-fun b!320297 () Bool)

(assert (=> b!320297 (= e!230457 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) i!979)))))

(assert (= (and start!70800 res!263177) b!320295))

(assert (= (and b!320295 res!263179) b!320296))

(assert (= (and b!320296 res!263178) b!320297))

(declare-fun m!458675 () Bool)

(assert (=> start!70800 m!458675))

(declare-fun m!458677 () Bool)

(assert (=> b!320296 m!458677))

(push 1)

(assert (not b!320296))

(assert (not start!70800))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70786 () Bool)

(assert start!70786)

(declare-fun res!263107 () Bool)

(declare-fun e!230394 () Bool)

(assert (=> start!70786 (=> (not res!263107) (not e!230394))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70786 (= res!263107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70786 e!230394))

(assert (=> start!70786 true))

(declare-datatypes ((array!20103 0))(
  ( (array!20104 (arr!9852 (Array (_ BitVec 32) (_ BitVec 8))) (size!8760 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20103)

(declare-fun array_inv!8312 (array!20103) Bool)

(assert (=> start!70786 (array_inv!8312 a!425)))

(declare-fun b!320223 () Bool)

(declare-fun e!230393 () Bool)

(assert (=> b!320223 (= e!230394 e!230393)))

(declare-fun res!263105 () Bool)

(assert (=> b!320223 (=> (not res!263105) (not e!230393))))

(declare-fun lt!443879 () (_ BitVec 64))

(assert (=> b!320223 (= res!263105 (bvsle i!979 lt!443879))))

(assert (=> b!320223 (= lt!443879 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8760 a!425))))))

(declare-fun b!320224 () Bool)

(declare-fun res!263106 () Bool)

(assert (=> b!320224 (=> (not res!263106) (not e!230393))))

(declare-fun arrayBitRangesEq!0 (array!20103 array!20103 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320224 (= res!263106 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443879))))

(declare-fun b!320225 () Bool)

(assert (=> b!320225 (= e!230393 (and (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= ((_ sign_extend 32) (size!8760 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443879 ((_ sign_extend 32) (size!8760 a!425)))))))))

(assert (= (and start!70786 res!263107) b!320223))

(assert (= (and b!320223 res!263105) b!320224))

(assert (= (and b!320224 res!263106) b!320225))

(declare-fun m!458641 () Bool)

(assert (=> start!70786 m!458641))

(declare-fun m!458643 () Bool)

(assert (=> b!320224 m!458643))

(push 1)

(assert (not start!70786))

(assert (not b!320224))

(check-sat)

(pop 1)

(push 1)

(check-sat)


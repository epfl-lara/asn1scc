; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70768 () Bool)

(assert start!70768)

(declare-fun b!320198 () Bool)

(declare-fun e!230347 () Bool)

(declare-fun lt!443870 () (_ BitVec 64))

(assert (=> b!320198 (= e!230347 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443870))))

(declare-datatypes ((Unit!21951 0))(
  ( (Unit!21952) )
))
(declare-fun lt!443869 () Unit!21951)

(declare-datatypes ((array!20085 0))(
  ( (array!20086 (arr!9843 (Array (_ BitVec 32) (_ BitVec 8))) (size!8751 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20085)

(declare-fun i!979 () (_ BitVec 64))

(declare-fun rec!17 (array!20085 (_ BitVec 64)) Unit!21951)

(assert (=> b!320198 (= lt!443869 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320195 () Bool)

(declare-fun e!230349 () Bool)

(assert (=> b!320195 (= e!230349 e!230347)))

(declare-fun res!263080 () Bool)

(assert (=> b!320195 (=> (not res!263080) (not e!230347))))

(assert (=> b!320195 (= res!263080 (bvsle i!979 lt!443870))))

(assert (=> b!320195 (= lt!443870 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8751 a!425))))))

(declare-fun b!320197 () Bool)

(declare-fun res!263079 () Bool)

(assert (=> b!320197 (=> (not res!263079) (not e!230347))))

(assert (=> b!320197 (= res!263079 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320196 () Bool)

(declare-fun res!263077 () Bool)

(assert (=> b!320196 (=> (not res!263077) (not e!230347))))

(declare-fun arrayBitRangesEq!0 (array!20085 array!20085 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320196 (= res!263077 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443870))))

(declare-fun res!263078 () Bool)

(assert (=> start!70768 (=> (not res!263078) (not e!230349))))

(assert (=> start!70768 (= res!263078 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70768 e!230349))

(assert (=> start!70768 true))

(declare-fun array_inv!8303 (array!20085) Bool)

(assert (=> start!70768 (array_inv!8303 a!425)))

(assert (= (and start!70768 res!263078) b!320195))

(assert (= (and b!320195 res!263080) b!320196))

(assert (= (and b!320196 res!263077) b!320197))

(assert (= (and b!320197 res!263079) b!320198))

(declare-fun m!458615 () Bool)

(assert (=> b!320198 m!458615))

(declare-fun m!458617 () Bool)

(assert (=> b!320196 m!458617))

(declare-fun m!458619 () Bool)

(assert (=> start!70768 m!458619))

(push 1)

(assert (not start!70768))

(assert (not b!320196))

(assert (not b!320198))

(check-sat)

(pop 1)

(push 1)

(check-sat)


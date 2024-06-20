; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70720 () Bool)

(assert start!70720)

(declare-fun res!262875 () Bool)

(declare-fun e!230159 () Bool)

(assert (=> start!70720 (=> (not res!262875) (not e!230159))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70720 (= res!262875 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70720 e!230159))

(assert (=> start!70720 true))

(declare-datatypes ((array!20064 0))(
  ( (array!20065 (arr!9834 (Array (_ BitVec 32) (_ BitVec 8))) (size!8742 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20064)

(declare-fun array_inv!8294 (array!20064) Bool)

(assert (=> start!70720 (array_inv!8294 a!425)))

(declare-fun b!319968 () Bool)

(declare-fun e!230160 () Bool)

(assert (=> b!319968 (= e!230159 e!230160)))

(declare-fun res!262876 () Bool)

(assert (=> b!319968 (=> (not res!262876) (not e!230160))))

(declare-fun lt!443789 () (_ BitVec 64))

(assert (=> b!319968 (= res!262876 (bvsle i!979 lt!443789))))

(assert (=> b!319968 (= lt!443789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8742 a!425))))))

(declare-fun b!319969 () Bool)

(declare-fun res!262874 () Bool)

(assert (=> b!319969 (=> (not res!262874) (not e!230160))))

(declare-fun arrayBitRangesEq!0 (array!20064 array!20064 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319969 (= res!262874 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443789))))

(declare-fun b!319970 () Bool)

(assert (=> b!319970 (= e!230160 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) lt!443789))))))

(assert (= (and start!70720 res!262875) b!319968))

(assert (= (and b!319968 res!262876) b!319969))

(assert (= (and b!319969 res!262874) b!319970))

(declare-fun m!458401 () Bool)

(assert (=> start!70720 m!458401))

(declare-fun m!458403 () Bool)

(assert (=> b!319969 m!458403))

(push 1)

(assert (not b!319969))

(assert (not start!70720))

(check-sat)

(pop 1)

(push 1)

(check-sat)


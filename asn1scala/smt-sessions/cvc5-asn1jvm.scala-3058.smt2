; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70788 () Bool)

(assert start!70788)

(declare-fun b!320235 () Bool)

(declare-fun res!263118 () Bool)

(declare-fun e!230403 () Bool)

(assert (=> b!320235 (=> (not res!263118) (not e!230403))))

(declare-datatypes ((array!20105 0))(
  ( (array!20106 (arr!9853 (Array (_ BitVec 32) (_ BitVec 8))) (size!8761 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20105)

(declare-fun lt!443882 () (_ BitVec 64))

(declare-fun i!979 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!20105 array!20105 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320235 (= res!263118 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443882))))

(declare-fun b!320237 () Bool)

(assert (=> b!320237 (= e!230403 (not (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443882)))))

(declare-fun b!320234 () Bool)

(declare-fun e!230401 () Bool)

(assert (=> b!320234 (= e!230401 e!230403)))

(declare-fun res!263117 () Bool)

(assert (=> b!320234 (=> (not res!263117) (not e!230403))))

(assert (=> b!320234 (= res!263117 (bvsle i!979 lt!443882))))

(assert (=> b!320234 (= lt!443882 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8761 a!425))))))

(declare-fun res!263119 () Bool)

(assert (=> start!70788 (=> (not res!263119) (not e!230401))))

(assert (=> start!70788 (= res!263119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70788 e!230401))

(assert (=> start!70788 true))

(declare-fun array_inv!8313 (array!20105) Bool)

(assert (=> start!70788 (array_inv!8313 a!425)))

(declare-fun b!320236 () Bool)

(declare-fun res!263116 () Bool)

(assert (=> b!320236 (=> (not res!263116) (not e!230403))))

(assert (=> b!320236 (= res!263116 (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!70788 res!263119) b!320234))

(assert (= (and b!320234 res!263117) b!320235))

(assert (= (and b!320235 res!263118) b!320236))

(assert (= (and b!320236 res!263116) b!320237))

(declare-fun m!458645 () Bool)

(assert (=> b!320235 m!458645))

(declare-fun m!458647 () Bool)

(assert (=> b!320237 m!458647))

(declare-fun m!458649 () Bool)

(assert (=> start!70788 m!458649))

(push 1)

(assert (not start!70788))

(assert (not b!320237))

(assert (not b!320235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


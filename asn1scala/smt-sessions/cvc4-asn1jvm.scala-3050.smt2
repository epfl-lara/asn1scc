; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70714 () Bool)

(assert start!70714)

(declare-fun res!262848 () Bool)

(declare-fun e!230132 () Bool)

(assert (=> start!70714 (=> (not res!262848) (not e!230132))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70714 (= res!262848 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70714 e!230132))

(assert (=> start!70714 true))

(declare-datatypes ((array!20058 0))(
  ( (array!20059 (arr!9831 (Array (_ BitVec 32) (_ BitVec 8))) (size!8739 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20058)

(declare-fun array_inv!8291 (array!20058) Bool)

(assert (=> start!70714 (array_inv!8291 a!425)))

(declare-fun b!319941 () Bool)

(declare-fun e!230133 () Bool)

(assert (=> b!319941 (= e!230132 e!230133)))

(declare-fun res!262847 () Bool)

(assert (=> b!319941 (=> (not res!262847) (not e!230133))))

(declare-fun lt!443780 () (_ BitVec 64))

(assert (=> b!319941 (= res!262847 (bvsle i!979 lt!443780))))

(assert (=> b!319941 (= lt!443780 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8739 a!425))))))

(declare-fun b!319942 () Bool)

(declare-fun res!262849 () Bool)

(assert (=> b!319942 (=> (not res!262849) (not e!230133))))

(declare-fun arrayBitRangesEq!0 (array!20058 array!20058 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319942 (= res!262849 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443780))))

(declare-fun b!319943 () Bool)

(assert (=> b!319943 (= e!230133 (and (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443780)))))

(assert (= (and start!70714 res!262848) b!319941))

(assert (= (and b!319941 res!262847) b!319942))

(assert (= (and b!319942 res!262849) b!319943))

(declare-fun m!458389 () Bool)

(assert (=> start!70714 m!458389))

(declare-fun m!458391 () Bool)

(assert (=> b!319942 m!458391))

(push 1)

(assert (not start!70714))

(assert (not b!319942))

(check-sat)

(pop 1)

(push 1)

(check-sat)


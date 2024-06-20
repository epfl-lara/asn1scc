; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61000 () Bool)

(assert start!61000)

(declare-datatypes ((array!15641 0))(
  ( (array!15642 (arr!7762 (Array (_ BitVec 32) (_ BitVec 8))) (size!6775 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12364 0))(
  ( (BitStream!12365 (buf!7243 array!15641) (currentByte!13398 (_ BitVec 32)) (currentBit!13393 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12364)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!61000 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6775 (buf!7243 b!177)))) diffInBits!14) (not (= ((_ sign_extend 32) (size!6775 (buf!7243 b!177))) (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6775 (buf!7243 b!177)))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!194904 () Bool)

(declare-fun inv!12 (BitStream!12364) Bool)

(assert (=> start!61000 (and (inv!12 b!177) e!194904)))

(assert (=> start!61000 true))

(declare-fun b!275013 () Bool)

(declare-fun array_inv!6499 (array!15641) Bool)

(assert (=> b!275013 (= e!194904 (array_inv!6499 (buf!7243 b!177)))))

(assert (= start!61000 b!275013))

(declare-fun m!407585 () Bool)

(assert (=> start!61000 m!407585))

(declare-fun m!407587 () Bool)

(assert (=> b!275013 m!407587))

(push 1)

(assert (not b!275013))

(assert (not start!61000))

(check-sat)

(pop 1)

(push 1)

(check-sat)


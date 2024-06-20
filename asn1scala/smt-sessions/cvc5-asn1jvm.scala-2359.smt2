; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60228 () Bool)

(assert start!60228)

(declare-fun lt!411833 () Bool)

(declare-datatypes ((array!15390 0))(
  ( (array!15391 (arr!7669 (Array (_ BitVec 32) (_ BitVec 8))) (size!6682 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12178 0))(
  ( (BitStream!12179 (buf!7150 array!15390) (currentByte!13203 (_ BitVec 32)) (currentBit!13198 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12178)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12178 (_ BitVec 64)) Bool)

(assert (=> start!60228 (= lt!411833 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60228 false))

(declare-fun e!193656 () Bool)

(declare-fun inv!12 (BitStream!12178) Bool)

(assert (=> start!60228 (and (inv!12 thiss!882) e!193656)))

(assert (=> start!60228 true))

(declare-fun b!273784 () Bool)

(declare-fun array_inv!6406 (array!15390) Bool)

(assert (=> b!273784 (= e!193656 (array_inv!6406 (buf!7150 thiss!882)))))

(assert (= start!60228 b!273784))

(declare-fun m!406545 () Bool)

(assert (=> start!60228 m!406545))

(declare-fun m!406547 () Bool)

(assert (=> start!60228 m!406547))

(declare-fun m!406549 () Bool)

(assert (=> b!273784 m!406549))

(push 1)

(assert (not start!60228))

(assert (not b!273784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

